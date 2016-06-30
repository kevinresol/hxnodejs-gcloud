package gcloud.compute;
@:jsRequire("gcloud.compute.disk") extern class Disk {
	/**
		<p>A Disk object allows you to interact with a Google Compute Engine disk.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a persistent disk.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Check if the disk exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a disk if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the disk&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a snapshot of a disk.</p>
	**/
	@:overload(function(name:String, callback:js.Error -> gcloud.compute.Snapshot -> gcloud.compute.Operation -> Dynamic -> Void):Void { })
	function createSnapshot(name:String, options:Dynamic, callback:js.Error -> gcloud.compute.Snapshot -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Delete the disk.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a snapshot from this disk.</p>
	**/
	function snapshot(name:String):gcloud.compute.Snapshot;
}