package google.cloud;
@:jsRequire("google-cloud", "translate") extern class Translate {
	/**
		<p>With <a href="https://cloud.google.com/translate">Google Translate</a>, you can dynamically translate text between thousands of language pairs.</p><p>The Google Translate API lets websites and programs integrate with Google Translate programmatically.</p><p>Google Translate API is available as a paid service. See the <a href="https://cloud.google.com/translate/v2/pricing.html">Pricing</a> and <a href="https://cloud.google.com/translate/v2/faq.html">FAQ</a> pages for details.</p><p><strong>An API key is required for Translate.</strong> See <a href="https://cloud.google.com/translate/v2/using_rest#auth">Identifying your application to Google</a>.</p>
	**/
	@:selfCall
	function new(options:{ /**
		<ul> <li>An API key.</li> </ul> 
	**/
	var key : String; });
	/**
		<p>Detect the language used in a string or multiple strings.</p>
	**/
	function detect(input:haxe.extern.EitherType<Array<String>, String>, callback:js.Error -> haxe.extern.EitherType<Array<Dynamic>, Dynamic> -> String -> Dynamic -> Void):Void;
	/**
		<p>Get an array of all supported languages.</p>
	**/
	@:overload(function(callback:js.Error -> Array<Dynamic> -> Dynamic -> Void):Void { })
	function getLanguages(target:String, callback:js.Error -> Array<Dynamic> -> Dynamic -> Void):Void;
	/**
		<p>Translate a string or multiple strings into another language.</p>
	**/
	@:overload(function(input:haxe.extern.EitherType<Array<String>, String>, callback:js.Error -> haxe.extern.EitherType<Array<Dynamic>, Dynamic> -> Dynamic -> Void):Void { })
	function translate(input:haxe.extern.EitherType<Array<String>, String>, options:haxe.extern.EitherType<{ /**
		<ul> <li>The ISO 639-1 language code the source input is written in.</li> </ul> 
	**/
	var from : String; /**
		<ul> <li>The ISO 639-1 language code to translate the input to.</li> </ul> 
	**/
	var to : String; }, String>, callback:js.Error -> haxe.extern.EitherType<Array<Dynamic>, Dynamic> -> Dynamic -> Void):Void;
}