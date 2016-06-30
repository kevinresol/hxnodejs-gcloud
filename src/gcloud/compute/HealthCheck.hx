package gcloud.compute;
@:jsRequire("gcloud.compute.health-check") extern class HealthCheck {
	/**
		<p>Health checks ensure that Compute Engine forwards new connections only to instances that are up and ready to receive them. Compute Engine sends health check requests to each instance at the specified frequency; once an instance exceeds its allowed number of health check failures, it is no longer considered an eligible instance for receiving new traffic.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create an HTTP or HTTPS health check.</p>
	**/
	function create(options:Dynamic):Void;
	/**
		<p>Check if the health check exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get the health check if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the health check&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Delete the health check.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Set the health check&#39;s metadata.</p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
}