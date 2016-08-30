package gcloud.compute;
@:jsRequire("google-cloud", "compute.vm") extern class VM {
	/**
		<p>An Instance object allows you to interact with a Google Compute Engine instance.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a virtual machine.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Check if the vm exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a virtual machine if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the instance&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Attach a disk to the instance.</p>
	**/
	@:overload(function(disk:gcloud.compute.Disk, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void { })
	function attachDisk(disk:gcloud.compute.Disk, options:{ /**
		<ul> <li>Attach the disk in read-only mode. (Alias for <code>options.mode = READ_ONLY</code>)</li> </ul> 
	**/
	var readOnly : Bool; }, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Delete the instance.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Detach a disk from the instance.</p>
	**/
	@:overload(function(deviceName:haxe.extern.EitherType<String, gcloud.compute.Disk>):Void { })
	function detachDisk(deviceName:haxe.extern.EitherType<String, gcloud.compute.Disk>, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Returns the serial port output for the instance.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Void):Void { })
	function getSerialPortOutput(port:Float, callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get the instance&#39;s tags and their fingerprint.</p><p>This method wraps <a data-custom-type="compute/vm" data-method="getMetadata">compute/vm#getMetadata</a>, returning only the <code>tags</code> property.</p>
	**/
	function getTags(callback:js.Error -> Array<Dynamic> -> String -> Dynamic -> Void):Void;
	/**
		<p>Reset the instance.</p>
	**/
	@:overload(function():Void { })
	function reset(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Set the machine type for this instance, <strong>stopping and restarting the VM as necessary</strong>.</p><p>For a list of the standard, high-memory, and high-CPU machines you may choose from, see <a href="<a href="https://cloud.google.com/compute/docs/machine-types#predefined_machine_types">Predefined machine types</a>">https://cloud.google.com/compute/docs/machine-types#predefined_machine_types}</a>.</p><p>In order to change the machine type, the VM must not be running. This method will automatically stop the VM if it is running before changing the machine type. After it is sucessfully changed, the VM will be started.</p>
	**/
	@:overload(function(machineType:String, callback:js.Error -> Dynamic -> Void):Void { })
	function resize(machineType:String, options:{ /**
		<ul> <li>Start the VM after successfully updating the machine type. Default: <code>false</code>.</li> </ul> 
	**/
	var start : Bool; }, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Set the metadata for this instance.</p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Set the instance&#39;s tags.</p>
	**/
	@:overload(function(tags:Array<String>, fingerprint:String):Void { })
	function setTags(tags:Array<String>, fingerprint:String, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Start the instance.</p>
	**/
	@:overload(function():Void { })
	function start(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Stop the instance.</p>
	**/
	@:overload(function():Void { })
	function stop(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
}