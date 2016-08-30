package google.cloud.compute;
@:jsRequire("google-cloud", "compute.snapshot") extern class Snapshot {
	/**
		<p>A Snapshot object allows you to interact with a Google Compute Engine snapshot.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Check if the snapshot exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a snapshot if it exists.</p><p>If you access this snapshot through a Disk object, this can be used as a &quot;get or create&quot; method. Pass an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the snapshot&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a snapshot.</p><p><strong>This is only available if you accessed this object through <a data-custom-type="compute/disk" data-method="snapshot">compute/disk#snapshot</a>.</strong></p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Delete the snapshot.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> google.cloud.compute.Operation -> Dynamic -> Void):Void;
}