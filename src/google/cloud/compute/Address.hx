package google.cloud.compute;
@:jsRequire("google-cloud", "compute.address") extern class Address {
	/**
		<p>An Address object allows you to interact with a Google Compute Engine address.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create an address.</p>
	**/
	@:overload(function():Void { })
	function create(options:Dynamic):Void;
	/**
		<p>Check if the address exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get an address if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata of this address.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Delete the address.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> google.cloud.compute.Operation -> Dynamic -> Void):Void;
}