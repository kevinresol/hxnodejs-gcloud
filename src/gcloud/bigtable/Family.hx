package gcloud.bigtable;
@:jsRequire("google-cloud", "bigtable.family") extern class Family {
	/**
		<p>Create a Family object to interact with your table column families.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a column family.</p>
	**/
	@:overload(function():Void { })
	function create(options:Dynamic):Void;
	/**
		<p>Delete the column family.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if the column family exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a column family if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the column family&#39;s metadata.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Set the column family&#39;s metadata.</p><p>See <a data-custom-type="bigtable/table" data-method="createFamily">bigtable/table#createFamily</a> for a detailed explanation of the arguments.</p>
	**/
	function setMetadata(metadata:{ /**
		<ul> <li>Garbage collection rule.</li> </ul> 
	**/
	@:optional
	var rule : Dynamic; }, callback:js.Error -> Dynamic -> Void):Void;
}