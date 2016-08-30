package google.cloud.bigtable;
@:jsRequire("google-cloud", "bigtable.row") extern class Row {
	/**
		<p>Create a Row object to interact with your table rows.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Check if the table row exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Create a new row in your table.</p>
	**/
	@:overload(function(callback:js.Error -> google.cloud.bigtable.Row -> Dynamic -> Void):Void { })
	function create(entry:Dynamic, callback:js.Error -> google.cloud.bigtable.Row -> Dynamic -> Void):Void;
	/**
		<p>Update a row with rules specifying how the row&#39;s contents are to be transformed into writes. Rules are applied in order, meaning that earlier rules will affect the results of later ones.</p>
	**/
	function createRules(rules:haxe.extern.EitherType<Array<Dynamic>, Dynamic>, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Mutates a row atomically based on the output of a filter. Depending on whether or not any results are yielded, either the <code>onMatch</code> or <code>onNoMatch</code> callback will be executed.</p>
	**/
	@:overload(function(filter:google.cloud.bigtable.Filter, onMatch:Array<Dynamic>, callback:js.Error -> Bool -> Void):Void { })
	function filter(filter:google.cloud.bigtable.Filter, onMatch:Array<Dynamic>, onNoMatch:Array<Dynamic>, callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Deletes all cells in the row.</p>
	**/
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Delete specified cells from the row. See <a data-custom-type="bigtable/table" data-method="mutate">bigtable/table#mutate</a>.</p>
	**/
	function deleteCells(columns:Array<String>, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Get the row data. See <a data-custom-type="bigtable/table" data-method="getRows">bigtable/table#getRows</a>.</p>
	**/
	@:overload(function(options:{ /**
		<ul> <li>If set to <code>false</code> it will not decode Buffer values returned from Bigtable. Default: true.</li> </ul> 
	**/
	var decode : Bool; }, callback:js.Error -> google.cloud.bigtable.Row -> Dynamic -> Void):Void { })
	function get(columns:Array<String>, options:{ /**
		<ul> <li>If set to <code>false</code> it will not decode Buffer values returned from Bigtable. Default: true.</li> </ul> 
	**/
	var decode : Bool; }, callback:js.Error -> google.cloud.bigtable.Row -> Dynamic -> Void):Void;
	/**
		<p>Get the row&#39;s metadata.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Void):Void { })
	function getMetadata(options:{ /**
		<ul> <li>If set to <code>false</code> it will not decode Buffer values returned from Bigtable. Default: true.</li> </ul> 
	**/
	var decode : Bool; }, callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Increment a specific column within the row. If the column does not exist, it is automatically initialized to 0 before being incremented.</p>
	**/
	@:overload(function(column:String, callback:js.Error -> Float -> Dynamic -> Void):Void { })
	function increment(column:String, value:Float, callback:js.Error -> Float -> Dynamic -> Void):Void;
	/**
		<p>Update the row cells.</p>
	**/
	@:overload(function(key:haxe.extern.EitherType<Dynamic, String>, options:Dynamic, callback:js.Error -> Dynamic -> Void):Void { })
	@:overload(function(key:haxe.extern.EitherType<Dynamic, String>, callback:js.Error -> Dynamic -> Void):Void { })
	@:overload(function(key:haxe.extern.EitherType<Dynamic, String>, value:Dynamic, callback:js.Error -> Dynamic -> Void):Void { })
	function save(key:haxe.extern.EitherType<Dynamic, String>, value:Dynamic, options:Dynamic, callback:js.Error -> Dynamic -> Void):Void;
}