package gcloud;
@:jsRequire("gcloud.compute") extern class Compute {
	/**
		<p>A Compute object allows you to interact with the Google Compute Engine API. Using this object, you can access your instances with <a data-custom-type="compute/vm" data-method="">compute/vm</a>, disks with <a data-custom-type="compute/disk" data-method="">compute/disk</a>, and firewalls with <a data-custom-type="compute/firewall" data-method="">compute/firewall</a>.</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a firewall.</p>
	**/
	function createFirewall(name:String, config:{ /**
		<ul> <li>A map of protocol to port range. The keys of the object refer to a protocol (e.g. <code>tcp</code>, <code>udp</code>) and the value for  the key are the ports/port-ranges that are allowed to make a connection.  If a <code>true</code> value, that means all ports on that protocol will be opened.  If <code>false</code>, all traffic on that protocol will be blocked.</li> </ul> 
	**/
	var protocols : Dynamic; /**
		<ul> <li>The IP address blocks that this rule applies to, expressed in  <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">CIDR</a>  format.</li> </ul> 
	**/
	var ranges : Array<String>; /**
		<ul> <li>Instance tags which this rule applies to.</li> </ul> 
	**/
	var tags : Array<String>; }, callback:js.Error -> gcloud.compute.Firewall -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Create an HTTP or HTTPS health check.</p>
	**/
	@:overload(function(name:String, callback:js.Error -> gcloud.compute.HealthCheck -> gcloud.compute.Operation -> Dynamic -> Void):Void { })
	@:overload(function(name:String):Void { })
	@:overload(function(name:String, options:{ /**
		<ul> <li>Create an HTTPs health check. Default: <code>false</code>.</li> </ul> 
	**/
	var https : Bool; /**
		<ul> <li>How often (in seconds) to send a health check. The default value is 5 seconds. (Alias for  <code>options.checkIntervalSec</code>)</li> </ul> 
	**/
	var interval : Float; /**
		<ul> <li>How long (in seconds) to wait before claiming failure. The default value is 5 seconds. It is invalid for  this value to be greater than checkIntervalSec. (Alias for  <code>options.timeoutSec</code>)</li> </ul> 
	**/
	var timeout : Float; }):Void { })
	function createHealthCheck(name:String, options:{ /**
		<ul> <li>Create an HTTPs health check. Default: <code>false</code>.</li> </ul> 
	**/
	var https : Bool; /**
		<ul> <li>How often (in seconds) to send a health check. The default value is 5 seconds. (Alias for  <code>options.checkIntervalSec</code>)</li> </ul> 
	**/
	var interval : Float; /**
		<ul> <li>How long (in seconds) to wait before claiming failure. The default value is 5 seconds. It is invalid for  this value to be greater than checkIntervalSec. (Alias for  <code>options.timeoutSec</code>)</li> </ul> 
	**/
	var timeout : Float; }, callback:js.Error -> gcloud.compute.HealthCheck -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Create a network.</p>
	**/
	@:overload(function(name:String, config:{ /**
		<ul> <li>A gateway address for default routing to other networks. (Alias for <code>config.gatewayIPv4</code>)</li> </ul> 
	**/
	var gateway : String; /**
		<ul> <li><a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">CIDR</a> range of addresses that are legal on this network. (Alias for <code>config.IPv4Range</code>)</li> </ul> 
	**/
	var range : String; }):Void { })
	function createNetwork(name:String, config:{ /**
		<ul> <li>A gateway address for default routing to other networks. (Alias for <code>config.gatewayIPv4</code>)</li> </ul> 
	**/
	var gateway : String; /**
		<ul> <li><a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">CIDR</a> range of addresses that are legal on this network. (Alias for <code>config.IPv4Range</code>)</li> </ul> 
	**/
	var range : String; }, callback:js.Error -> gcloud.compute.Network -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Create a global forwarding rule.</p>
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
		<ul> <li>The full or valid partial URL of the target resource to receive the matched traffic. This target must be a global  <a href="https://cloud.google.com/compute/docs/load-balancing/http/target-proxies"><code>TargetHttpProxy</code> or <code>TargetHttpsProxy</code> resource</a>.</li> </ul> 
	**/
	var target : String; }, callback:js.Error -> gcloud.compute.Rule -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Create a backend service.</p>
	**/
	@:overload(function(name:String, config:Dynamic):Void { })
	function createService(name:String, config:Dynamic, callback:js.Error -> gcloud.compute.Service -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Google Compute Engine firewall.</p><p>See <a data-custom-type="compute/network" data-method="firewall">compute/network#firewall</a> to get a Firewall object for a specific network.</p>
	**/
	function firewall(name:String):gcloud.compute.Firewall;
	/**
		<p>Get a list of addresses. For a detailed description of method&#39;s options see <a href="https://goo.gl/r9XmXJ">API reference</a>.</p>
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
		<p>Get a list of autoscalers. For a detailed description of this method&#39;s options, see the <a href="https://cloud.google.com/compute/docs/reference/v1/autoscalers/aggregatedList">API reference</a>.</p>
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
		<ul> <li>Maximum number of addresses to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of disks.</p>
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
		<p>Get a list of instance groups.</p>
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
		<p>Get a list of firewalls.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Firewall -> Dynamic -> Dynamic -> Void):Void { })
	function getFirewalls(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of firewalls to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Firewall -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of health checks.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.HealthCheck -> Dynamic -> Dynamic -> Void):Void { })
	function getHealthChecks(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>List only HTTPs health checks. Default: <code>false</code>.</li> </ul> 
	**/
	var https : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of networks to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.HealthCheck -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of networks.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Network -> Dynamic -> Dynamic -> Void):Void { })
	function getNetworks(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of networks to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Network -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of global operations.</p>
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
		<p>Return the regions available to your project.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Region -> Dynamic -> Dynamic -> Void):Void { })
	function getRegions(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of instances to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Region -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of forwading rules.</p>
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
		<p>Get a list of backend services.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void { })
	function getServices(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of snapshots to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of snapshots.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Snapshot -> Dynamic -> Dynamic -> Void):Void { })
	function getSnapshots(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of snapshots to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Snapshot -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of virtual machine instances.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.VM -> Dynamic -> Dynamic -> Void):Void { })
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
		<ul> <li>Maximum number of instances to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.VM -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Return the zones available to your project.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Zone -> Dynamic -> Dynamic -> Void):Void { })
	function getZones(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Search filter in the format of <code>{name} {comparison} {filterString}</code>.<ul> <li><strong><code>name</code></strong>: the name of the field to compare</li> <li><strong><code>comparison</code></strong>: the comparison operator, <code>eq</code> (equal) or <code>ne</code> (not equal)</li> <li><strong><code>filterString</code></strong>: the string to filter to. For string fields, this can be a regular expression.</li> </ul> </li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of instances to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Zone -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Google Compute Engine health check.</p>
	**/
	@:overload(function(name:String):gcloud.compute.HealthCheck { })
	function healthCheck(name:String, options:{ /**
		<ul> <li>Specify if this is an HTTPS health check resource. Default: <code>false</code></li> </ul> 
	**/
	var https : Bool; }):gcloud.compute.HealthCheck;
	/**
		<p>Get a reference to a Google Compute Engine network.</p>
	**/
	function network(name:String):gcloud.compute.Network;
	/**
		<p>Get a reference to a global Google Compute Engine operation.</p>
	**/
	function operation(name:String):gcloud.compute.Operation;
	/**
		<p>Get a reference to a Google Compute Engine region.</p>
	**/
	function region(name:String):gcloud.compute.Region;
	/**
		<p>Get a reference to a Google Compute Engine forwading rule.</p>
	**/
	function rule(name:String):gcloud.compute.Rule;
	/**
		<p>Get a reference to a Google Compute Engine backend service.</p>
	**/
	function service(name:String):gcloud.compute.Service;
	/**
		<p>Get a reference to a Google Compute Engine snapshot.</p>
	**/
	function snapshot(name:String):gcloud.compute.Snapshot;
	/**
		<p>Get a reference to a Google Compute Engine zone.</p>
	**/
	function zone(name:String):gcloud.compute.Zone;
}