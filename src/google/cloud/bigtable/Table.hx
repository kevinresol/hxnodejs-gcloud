package google.cloud.bigtable;
@:jsRequire("google-cloud", "bigtable.table") extern class Table {
	/**
		<p>Create a Table object to interact with a Google Cloud Bigtable table.</p>
	**/
	@:selfCall
	function new(name:String);
	/**
		<p>Create a table.</p>
	**/
	@:overload(function():Void { })
	function create(options:Dynamic):Void;
	/**
		<p>Delete the table.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if a table exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a table if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; /**
		<ul> <li>The view to be applied to the table fields. See <a data-custom-type="bigtable/table" data-method="getMetadata">bigtable/table#getMetadata</a>.</li> </ul> 
	**/
	var view : String; }):Void;
	/**
		<p>Create a column family.</p><p>Optionally you can send garbage collection rules and when creating a family. Garbage collection executes opportunistically in the background, so it&#39;s possible for reads to return a cell even if it matches the active expression for its family.</p>
	**/
	@:overload(function(name:String, callback:js.Error -> google.cloud.bigtable.Family -> Dynamic -> Void):Void { })
	function createFamily(name:String, rule:{ /**
		<ul> <li>Delete cells in a column older than the given age. Values must be at least 1 millisecond.</li> </ul> 
	**/
	var age : Dynamic; /**
		<ul> <li>Maximum number of versions to delete cells in a column, except for the most recent.</li> </ul> 
	**/
	var versions : Float; /**
		<ul> <li>Cells to delete should match all rules.</li> </ul> 
	**/
	var intersect : Bool; /**
		<ul> <li>Cells to delete should match any of the rules.</li> </ul> 
	**/
	var union : Bool; }, callback:js.Error -> google.cloud.bigtable.Family -> Dynamic -> Void):Void;
	/**
		<p>Delete all rows in the table, optionally corresponding to a particular prefix.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Void):Void { })
	function deleteRows(options:{ /**
		<ul> <li>Row key prefix, when omitted all rows will be deleted.</li> </ul> 
	**/
	var prefix : String; }, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Table Family.</p>
	**/
	function family(name:String):google.cloud.bigtable.Family;
	/**
		<p>Get Family objects for all the column familes in your table.</p>
	**/
	function getFamilies(callback:js.Error -> Array<google.cloud.bigtable.Family> -> Dynamic -> Void):Void;
	/**
		<p>Get the table&#39;s metadata.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(options:{ /**
		<ul> <li>The view to be applied to the table fields.</li> </ul> 
	**/
	var view : String; }):Void { })
	function getMetadata(options:{ /**
		<ul> <li>The view to be applied to the table fields.</li> </ul> 
	**/
	var view : String; }, callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get Row objects for the rows currently in your table.</p>
	**/
	@:overload(function(callback:js.Error -> Array<google.cloud.bigtable.Row> -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(options:{ /**
		<ul> <li>If set to <code>false</code> it will not decode Buffer values returned from Bigtable. Default: true.</li> </ul> 
	**/
	var decode : Bool; /**
		<ul> <li>A list of row keys.</li> </ul> 
	**/
	var keys : Array<String>; /**
		<ul> <li>Start value for key range.</li> </ul> 
	**/
	var start : String; /**
		<ul> <li>End value for key range.</li> </ul> 
	**/
	var end : String; /**
		<ul> <li>A list of key ranges.</li> </ul> 
	**/
	var ranges : Array<Dynamic>; /**
		<ul> <li>Row filters allow you to both make advanced queries and format how the data is returned.</li> </ul> 
	**/
	var filter : google.cloud.bigtable.Filter; /**
		<ul> <li>Allow for interleaving.</li> </ul> 
	**/
	var interleave : Bool; /**
		<ul> <li>Maximum number of rows to be returned.</li> </ul> 
	**/
	var limit : Float; }):Void { })
	function getRows(options:{ /**
		<ul> <li>If set to <code>false</code> it will not decode Buffer values returned from Bigtable. Default: true.</li> </ul> 
	**/
	var decode : Bool; /**
		<ul> <li>A list of row keys.</li> </ul> 
	**/
	var keys : Array<String>; /**
		<ul> <li>Start value for key range.</li> </ul> 
	**/
	var start : String; /**
		<ul> <li>End value for key range.</li> </ul> 
	**/
	var end : String; /**
		<ul> <li>A list of key ranges.</li> </ul> 
	**/
	var ranges : Array<Dynamic>; /**
		<ul> <li>Row filters allow you to both make advanced queries and format how the data is returned.</li> </ul> 
	**/
	var filter : google.cloud.bigtable.Filter; /**
		<ul> <li>Allow for interleaving.</li> </ul> 
	**/
	var interleave : Bool; /**
		<ul> <li>Maximum number of rows to be returned.</li> </ul> 
	**/
	var limit : Float; }, callback:js.Error -> Array<google.cloud.bigtable.Row> -> Void):Void;
	/**
		<p>Insert or update rows in your table.</p>
	**/
	function insert(entries:haxe.extern.EitherType<Array<Dynamic>, Dynamic>, callback:js.Error -> Array<Dynamic> -> Void):Void;
	/**
		<p>Apply a set of changes to be atomically applied to the specified row(s). Mutations are applied in order, meaning that earlier mutations can be masked by later ones.</p>
	**/
	function mutate(entries:haxe.extern.EitherType<Array<Dynamic>, Dynamic>, callback:js.Error -> Array<Dynamic> -> Void):Void;
	/**
		<p>Get a reference to a table row.</p>
	**/
	function row(key:String):google.cloud.bigtable.Row;
	/**
		<p>Returns a sample of row keys in the table. The returned row keys will delimit contigous sections of the table of approximately equal size, which can be used to break up the data for distributed tasks like mapreduces.</p>
	**/
	@:overload(function():Void { })
	function sampleRowKeys(callback:js.Error -> Array<Dynamic> -> Void):Void;
}