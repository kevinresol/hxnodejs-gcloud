package gcloud.compute;
@:jsRequire("google-cloud", "compute.rule") extern class Rule {
	/**
		<p>Forwarding rules work in conjunction with target pools and target instances to support load balancing and protocol forwarding features. To use load balancing and protocol forwarding, you must create a forwarding rule that directs traffic to specific target pools (for load balancing) or target instances (for protocol forwarding).</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a forwarding rule.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Check if the forwarding rule exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a forwarding rule if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata of this rule.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Delete the rule.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Set the target for this forwarding rule.</p>
	**/
	function setTarget(target:String, callback:js.Error -> Dynamic -> Void):Void;
}