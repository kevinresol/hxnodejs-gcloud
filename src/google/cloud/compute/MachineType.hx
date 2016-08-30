package google.cloud.compute;
@:jsRequire("google-cloud", "compute.machine-type") extern class MachineType {
	/**
		<p>A MachineType object allows you to interact with a Google Compute Engine machine type.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Check if the machine type exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a machine type if it exists.</p>
	**/
	function get():Void;
	/**
		<p>Get the machine type&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
}