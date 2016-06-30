package gcloud.compute;
@:jsRequire("gcloud.compute.instance-group") extern class InstanceGroup {
	/**
		<p>You can create and manage groups of virtual machine instances so that you don&#39;t have to individually control each instance in your project.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create an instance group.</p>
	**/
	@:overload(function():Void { })
	function create(options:Dynamic):Void;
	/**
		<p>Check if the instance group exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get an instance group if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the instance group&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Add one or more VMs to this instance group.</p>
	**/
	function add(vms:haxe.extern.EitherType<Dynamic, gcloud.compute.VM>, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Delete the instance group.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Get a list of VM instances in this instance group.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void { })
	function getVMs(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of VMs to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; /**
		<ul> <li>Only return instances which are running.</li> </ul> 
	**/
	var running : Bool; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Remove one or more VMs from this instance group.</p>
	**/
	function remove(vms:haxe.extern.EitherType<Dynamic, gcloud.compute.VM>, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Set the named ports for this instance group.</p>
	**/
	@:overload(function(ports:Dynamic):Void { })
	function setPorts(ports:Dynamic, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
}