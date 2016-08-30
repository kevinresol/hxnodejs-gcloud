package google.cloud.compute;
@:jsRequire("google-cloud", "compute.service") extern class Service {
	/**
		<p>An HTTP(S) load balancing backend service is a centralized service for managing backends, which in turn manage instances that handle user requests. You configure your load balancing service to route requests to your backend service. The backend service in turn knows which instances it can use, how much traffic they can handle, and how much traffic they are currently handling. In addition, the backend service monitors health checking and does not send traffic to unhealthy instances.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a backend service.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Check if the backend service exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a Service object if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata of this backend service.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Delete the backend service.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> google.cloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Get the most recent health check results.</p>
	**/
	function getHealth(group:haxe.extern.EitherType<{ /**
		<ul> <li>The name of the Instance Group resource.</li> </ul> 
	**/
	var name : String; /**
		<ul> <li>The name of the zone or a Zone object.</li> </ul> 
	**/
	var zone : haxe.extern.EitherType<String, google.cloud.compute.Zone>; }, String>, callback:js.Error -> Array<Dynamic> -> Dynamic -> Void):Void;
	/**
		<p>Set the backend service&#39;s metadata.</p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> google.cloud.compute.Operation -> Dynamic -> Void):Void;
}