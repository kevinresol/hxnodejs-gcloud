package gcloud.compute;
@:jsRequire("gcloud", "compute.zone") extern class Zone {
	/**
		<p>A Zone object allows you to interact with a Google Compute Engine zone.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Check if the zone exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a zone.</p>
	**/
	function get():Void;
	/**
		<p>Get the zone&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Google Compute Engine autoscaler in this zone.</p>
	**/
	function autoscaler(name:String):gcloud.compute.Autoscaler;
	/**
		<p>Create an autoscaler in this zone.</p>
	**/
	function createAutoscaler(name:String, config:{ /**
		<ul> <li>The number of seconds that the autoscaler should wait before it starts collecting information from a new instance.  Alias for <code>config.autoscalingPolicy.coolDownPeriodSec</code>.</li> </ul> 
	**/
	var coolDown : Float; /**
		<ul> <li>The target CPU utilization that the autoscaler should maintain, between 1 - 100. Alias for  <code>config.autoscalingPolicy.cpuUtilization.utilizationTarget</code>.</li> </ul> 
	**/
	var cpu : Float; /**
		<ul> <li>Backend capacity utilization that autoscaler should maintain, between 1 - 100. Alias for  <code>config.autoscalingPolicy.loadBalancingUtilization.utilizationTarget</code>.</li> </ul> 
	**/
	var loadBalance : Float; /**
		<ul> <li>The maximum number of instances that the autoscaler can scale up to. Alias for  <code>config.autoscalingPolicy.maxNumReplicas</code>.</li> </ul> 
	**/
	var maxReplicas : Float; /**
		<ul> <li>The minimum number of replicas that the autoscaler can scale down to. Alias for  <code>config.autoscalingPolicy.minNumReplicas</code>.</li> </ul> 
	**/
	var minReplicas : Float; /**
		<ul> <li>The name of the managed instance group that this autoscaler will scale.</li> </ul> 
	**/
	var target : String; }, callback:js.Error -> gcloud.compute.Autoscaler -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Create a persistent disk in this zone.</p>
	**/
	function createDisk(name:String, config:{ /**
		<ul> <li>Specify the name of an OS, and we will use the latest version as the source image of a new boot disk. See  <a href="https://github.com/stephenplusplus/gce-images#accepted-os-names">this list of accepted OS names</a>.</li> </ul> 
	**/
	@:optional
	var os : String; }, callback:js.Error -> gcloud.compute.Disk -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Create an instance group in this zone.</p>
	**/
	function createInstanceGroup(name:String, options:{ /**
		<ul> <li>A map of names to ports. The key should be the name, and the value the port number. Maps to <code>options.namedPorts</code>.</li> </ul> 
	**/
	var ports : Dynamic; }, callback:js.Error -> gcloud.compute.InstanceGroup -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Create a virtual machine in this zone.</p>
	**/
	function createVM(name:String, config:{ /**
		<ul> <li>See a <a href="https://cloud.google.com/compute/docs/reference/v1/disks">Disk resource</a>.</li> </ul> 
	**/
	@:optional
	var disks : Array<Dynamic>; /**
		<ul> <li>Allow HTTP traffic. Default: <code>false</code></li> </ul> 
	**/
	@:optional
	var http : Bool; /**
		<ul> <li>Allow HTTPS traffic. Default: <code>false</code></li> </ul> 
	**/
	@:optional
	var https : Bool; /**
		<ul> <li>An array of configurations for this interface. This specifies how this interface should interact with  other network services, such as connecting to the internet. Default:  <code>[ { network: &#39;global/networks/default&#39; } ]</code></li> </ul> 
	**/
	@:optional
	var networkInterfaces : Array<Dynamic>; /**
		<ul> <li>The machine type resource to use. Provide only the name of the machine, e.g. <code>n1-standard-16</code>. Refer to  <a href="https://goo.gl/jrHEbo">Available Machine Types</a>. Default:  <code>n1-standard-1</code></li> </ul> 
	**/
	@:optional
	var machineType : String; /**
		<ul> <li>Specify the name of an OS, and we will use the latest version as the source image of a new boot disk. See  <a href="https://github.com/stephenplusplus/gce-images#accepted-os-names">this list of accepted OS names</a>.</li> </ul> 
	**/
	@:optional
	var os : String; /**
		<ul> <li>An array of tags.</li> </ul> 
	**/
	@:optional
	var tags : Array<String>; }, callback:js.Error -> gcloud.compute.VM -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Google Compute Engine disk in this zone.</p>
	**/
	function disk(name:String):gcloud.compute.Disk;
	/**
		<p>Get a list of autoscalers from this zone.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void { })
	function getAutoscalers(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of autoscalers to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of disks in this zone.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Disk -> Dynamic -> Dynamic -> Void):Void { })
	function getDisks(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of disks to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Disk -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of instance groups for this zone.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void { })
	function getInstanceGroups(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of instance groups to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of operations for this zone.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Dynamic -> Void):Void { })
	function getOperations(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of operations to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of VM instances in this zone.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.VM -> Dynamic -> Dynamic -> Void):Void { })
	function getVMs(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.VM -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Google Compute Engine instance group.</p>
	**/
	function instanceGroup(name:String):gcloud.compute.InstanceGroup;
	/**
		<p>Get a reference to a Google Compute Engine zone operation.</p>
	**/
	function operation(name:String):gcloud.compute.Operation;
	/**
		<p>Get a reference to a Google Compute Engine virtual machine instance.</p>
	**/
	function vm(name:String):gcloud.compute.VM;
}