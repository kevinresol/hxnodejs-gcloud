package gcloud.resource;
@:jsRequire("gcloud", "resource.project") extern class Project {
	/**
		<p>A Project object allows you to interact with a Google Cloud Platform project.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a project.</p>
	**/
	@:overload(function():Void { })
	function create(config:Dynamic):Void;
	/**
		<p>Delete the project.</p><p><strong>This method only works if you are authenticated as yourself, e.g. using the gcloud SDK.</strong></p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if the project exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a project if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata for the project.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Set the project&#39;s metadata.</p><p><strong>This method only works if you are authenticated as yourself, e.g. using the gcloud SDK.</strong></p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Restore a project.</p><p><strong>This method only works if you are authenticated as yourself, e.g. using the gcloud SDK.</strong></p>
	**/
	@:overload(function():Void { })
	function restore(callback:js.Error -> Dynamic -> Void):Void;
}