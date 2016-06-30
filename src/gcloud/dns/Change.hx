package gcloud.dns;
@:jsRequire("gcloud.dns.change") extern class Change {
	@:selfCall
	function new(zone:gcloud.dns.Zone, id:String);
	/**
		<p>Check if the change exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a change if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata for the change in the zone.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a change.</p>
	**/
	function create(config:Dynamic):Void;
}