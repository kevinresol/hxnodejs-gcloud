package gcloud.compute;
@:jsRequire("gcloud.compute.firewall") extern class Firewall {
	/**
		<p>A Firewall object allows you to interact with a Google Compute Engine firewall.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a firewall.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Check if the firewall exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a firewall if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the firewall&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Delete the firewall.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Set the firewall&#39;s metadata.</p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
}