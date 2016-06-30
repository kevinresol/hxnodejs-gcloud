package gcloud.compute;
@:jsRequire("gcloud", "compute.region") extern class Region {
	/**
		<p>A Region object allows you to interact with a Google Compute Engine region.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Check if the region exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a region.</p>
	**/
	function get():Void;
	/**
		<p>Get the region&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Google Compute Engine address in this region.</p>
	**/
	function address(name:String):gcloud.compute.Address;
	/**
		<p>Create an address in this region.</p>
	**/
	@:overload(function(name:String, callback:js.Error -> gcloud.compute.Address -> gcloud.compute.Operation -> Dynamic -> Void):Void { })
	function createAddress(name:String, options:Dynamic, callback:js.Error -> gcloud.compute.Address -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Create a forwarding rule in this region.</p>
	**/
	function createRule(name:String, config:{ /**
		<ul> <li>The single IP address this forwarding rule will match against. All traffic that matches the IP address, protocol, and  ports of this forwarding rule will be handled by this rule. If specified,  the IP address must be a static external IP address. To create a new  ephemeral external IP address for the forwarding rule, leave this field  empty. (Alias for <code>config.IPAddress</code>)</li> </ul> 
	**/
	@:optional
	var ip : String; /**
		<ul> <li>The type of protocol that this forwarding rule matches. Valid values are <code>AH</code>, <code>ESP</code>, <code>SCTP</code>, <code>TCP</code>, <code>UDP</code>.  Default: <code>TCP</code>. (Alias for <code>config.IPProtocol</code>)</li> </ul> 
	**/
	@:optional
	var protocol : String; /**
		<ul> <li>A single port or single contiguous port range, ranging from low to high for which this forwarding rule matches.  Packets of the specified protocol sent to these ports will be forwarded  on to the appropriate target pool or target instance. If this field is  left empty, then the forwarding matches traffic for all ports for the  specified protocol. (Alias for <code>config.portRange</code>)</li> </ul> 
	**/
	@:optional
	var range : String; /**
		<ul> <li>The full or valid partial URL of the target resource to receive the matched traffic.</li> </ul> 
	**/
	var target : String; }, callback:js.Error -> gcloud.compute.Rule -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Get a list of addresses in this region.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Address -> Dynamic -> Dynamic -> Void):Void { })
	function getAddresses(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of addresses to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Address -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of operations for this region.</p>
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
		<p>Get a list of forwading rules in this region.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Rule -> Dynamic -> Dynamic -> Void):Void { })
	function getRules(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of rules to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Rule -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Google Compute Engine region operation.</p>
	**/
	function operation(name:String):gcloud.compute.Operation;
	/**
		<p>Get a reference to a Google Compute Engine forwarding rule in this region.</p>
	**/
	function rule(name:String):gcloud.compute.Rule;
}