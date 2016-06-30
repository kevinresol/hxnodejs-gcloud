package;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Printer;
using haxe.io.Path;
using sys.io.File;
using sys.FileSystem;
using haxe.Json;
using StringTools;
using Lambda;

class Generator {
	
	static var printer = new Printer();
	static var definitionDirectory = Sys.programPath().directory() + '/../../ref/docs/json/master/';
	static var outputDirectory = Sys.programPath().directory() + '/../../src/';
	static var keywords = ['public', 'private', 'import'];
	static var typeNames = new Map();
	
	public static function main() {
		var types:Array<GCloudType> = '$definitionDirectory/types.json'.getContent().parse();
		var definitions = [for(type in types) '$definitionDirectory/${type.contents}'.getContent().parse()];
		for(def in definitions) {
			var pack = ['gcloud'].concat(def.parent == null ? [] : def.parent.split('/'));
			typeNames.set(def.id, pack.join('.') + '.' + def.name);
		}
		for(type in types) {
			var def:Definition = '$definitionDirectory/${type.contents}'.getContent().parse();
			switch def.type {
				case 'class': buildClass(def);
				case t: trace('unhandled definition type: "$t"');
			}
		}
	}
	
	static function buildClass(def:Definition) {
		if(def.type != 'class') throw 'assert';
		var cl = macro class {}
		cl.name = switch def.name {
			case 'gcloud': 'GCloud';
			case name: name;
		}
		cl.pack = typeNames[def.id].split('.');
		cl.pack.pop(); // pop the class name
		cl.isExtern = true;
		var require = ['gcloud'].concat(def.source.split('/').slice(1));
		switch require.pop() {
			case 'index.js':
			case v: require.push(v.replace('.js', ''));
		}
		
		cl.meta = [{
			name: ':jsRequire',
			params: {
				var params = [{
					expr: EConst(CString(require.shift())),
					pos: null,
				}];
				if(require.length > 0) params.push({
					expr: EConst(CString(require.join('.'))),
					pos: null,
				});
				params;
			},
			pos: null, 
		}];
		for(method in def.methods) addMethod(cl, method);
		var folder = outputDirectory + cl.pack.join('/');
		if(!folder.exists()) folder.createDirectory();
		var code = printer.printTypeDefinition(cl);
		'$folder/${cl.name}.hx'.saveContent(code);
	}
	
	static function addMethod(cl:TypeDefinition, method:Method) {
		switch method.type {
			case 'constructor': method.name = 'new';
			case 'instance':
			case t: trace('unhandled method type: "$t"');
		}
		
		if(method.name.indexOf('.') != -1) return; // TODO: use @:native
		
		var topLevelParams = method.params.filter(function(p) return p.name.indexOf('.') == -1);
		var optionalParams = topLevelParams.filter(function(p) return p.optional);
		var permutations = combinations(optionalParams);
		
		function toHaxeArgs(params:Array<Param>)
			return params.map(function(p) return {
				name: p.name,
				opt: p.optional && p.nullable, // js has different concept about optional argument (haxe fills the value at compile time, while js expects it omitted)
				type: toHaxeType(p.types, p.name, method.params),
				meta: null,
				value: null,
			});
			
		var ret = method.type == 'constructor' ? null : switch method.returns {
			case []: macro:Void;
			case [v]: toHaxeType(v.types);
			default: throw 'multiple return';
		}
		
		var meta:Metadata = switch method.name {
			case 'new': [{
				name: ':selfCall',
				pos: null,
			}];
			default: [for(permutation in permutations) {
				name: ':overload',
				params: [{
					expr: EFunction(null, {
						args: toHaxeArgs(topLevelParams.filter(function(p) return permutation.indexOf(p) == -1)),
						ret: ret,
						expr: {
							expr: EBlock([]),
							pos: null,
						},
					}),
					pos: null,
				}],
				pos: null,
			}];
		}
		
		if(keywords.indexOf(method.name) != -1) {
			meta.push({
				name: ':native',
				params: [{
					expr: EConst(CString(method.name)),
					pos:null, 
				}],
				pos: null,
			});
			method.name += '_';
		}
		
		cl.fields.push({
			doc: method.description,
			name: method.name,
			meta: meta,
			pos: null,
			kind: FFun({
				args: toHaxeArgs(topLevelParams),
				ret: ret,
				expr: null,
			}),
		});
	}
	
	static function combinations<T>(input:Array<T>, ?prefix:Array<T>):Array<Array<T>> {
		if(prefix == null) prefix = [];
		var output = [];
		for(i in 0...input.length) {
			var current = prefix.concat([input[i]]);
			output.push(current);
			output = output.concat(combinations(input.slice(i+1), current));
		}
		return output;
	}
	
	static var dataTypeRegex = ~/data-custom-type="([^"]*)"/gi;
	static function toHaxeType(native:Array<String>, ?name:String, ?params:Array<Param>) {
		
		function single(v:String) {
			return if(v.endsWith('[]')) {
				var type = single(v.substr(0, v.length - 2));
				macro:Array<$type>;
			} else switch v.toLowerCase() {
				case 'error': macro:js.Error;
				case 'bool' | 'boolean': macro:Bool;
				case 'number': macro:Float;
				case 'string': macro:String;
				case 'array': macro:Array<Dynamic>;
				case 'key': macro:gcloud.datastore.Key;
				case 'buffer': macro:js.node.buffer.Buffer;
				case 'readstream': macro:js.node.fs.ReadStream;
				case 'writablestream' | 'writestream': macro:js.node.fs.WriteStream;
				case 'function':
					if(params == null) {
						macro:Void->Dynamic;
					} else {
						var prefix = '$name.';
						var args = params
							.filter(function(p) return p.name.startsWith(prefix) && p.name.substr(prefix.length).indexOf('.') == -1)
							.map(function(p) return toHaxeType(p.types, p.name, params));
						args.length == 0 ? macro:Void->Dynamic : TFunction(args, macro:Void);
					}
				case 'object' | 'options' | 'obbject':
					if(params == null) {
						macro:Dynamic;
					} else {
						var prefix = '$name.';
						var fields = params
							.filter(function(p) {
								if(!p.name.startsWith(prefix)) return false;
								var field = p.name.substr(prefix.length);
								return field.indexOf('.') == -1 && keywords.indexOf(field) == -1;
							})
							.map(function(p):Field return {
								doc: p.description,
								name: p.name.substr(prefix.length),
								kind: FVar(toHaxeType(p.types, p.name, params)),
								meta: switch p.optional {
									case false: null;
									case true: [{
										name: ':optional',
										params: null,
										pos: null,
									}];
								},
								pos: null,
							});
						fields.length == 0 ? macro:Dynamic : TAnonymous(fields);
					}
				
				case v if(v.startsWith('<')):
					dataTypeRegex.match(v);
					var type = dataTypeRegex.matched(1);
					if(!typeNames.exists(type)) macro:Dynamic;
					else {
						var pack = typeNames[type].split('.');
						var name = pack.pop();
						TPath({
							name: name,
							pack: pack
						});
					}
					
				default: 
					trace('unhandled type "$v"');
					macro:Dynamic;
			}
		}
		
		return switch native {
			case []: 
				macro:Dynamic;
			default:
				var seed = single(native[0]);
				native.slice(1).fold(function(n, last) {
					var type = single(n);
					return macro:haxe.extern.EitherType<$type, $last>;
				}, seed);
		}
	}
}

typedef GCloudType = {
	id:String,
	title:String,
	contents:String,
}

typedef Definition = {
	id:String,
  type:String,
  name:String,
  description:String,
  source:String,
  parent:String,
  children:Array<String>,
  methods:Array<Method>,
}

typedef Method = {
	id:String,
	name:String,
	type:String,
	description:String,
	source:String,
	resources: Array<{title:String, link:String}>,
	examples: Array<{caption:String, code:String}>,
	params:Array<Param>,
	exceptions:Array<Dynamic>, // TODO
	returns: Array<{types:Array<String>, description:String}>
}

typedef Param = {
	name:String,
	description:String,
	types:Array<String>,
	optional:Bool,
	nullable:Bool,
}