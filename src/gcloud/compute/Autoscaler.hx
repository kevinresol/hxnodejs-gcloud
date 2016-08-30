package gcloud.compute;
@:jsRequire("google-cloud", "compute.autoscaler") extern class Autoscaler {
	/**
		<p>Autoscalers allow you to automatically scale virtual machine instances in managed instance groups according to an autoscaling policy that you define.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create an autoscaler.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Check if the autoscaler exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get an autoscaler if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata of this autoscaler.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Delete the autoscaler.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Set the autoscaler&#39;s metadata.</p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
}