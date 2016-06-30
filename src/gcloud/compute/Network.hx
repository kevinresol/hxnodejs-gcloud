package gcloud.compute;
@:jsRequire("gcloud.compute.network") extern class Network {
	/**
		<p>A Network object allows you to interact with a Google Compute Engine network.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a network.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Check if the network exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a network if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the network&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a firewall for this network.</p>
	**/
	function createFirewall(name:String, config:{ /**
		<ul> <li>A map of protocol to port range. The keys of the object refer to a protocol (e.g. <code>tcp</code>, <code>udp</code>) and the value for  the key are the ports/port-ranges that are allowed to make a connection.</li> </ul> 
	**/
	var protocols : Dynamic; /**
		<ul> <li>The IP address blocks that this rule applies to, expressed in  <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">CIDR</a>  format.</li> </ul> 
	**/
	var ranges : Array<String>; }, callback:js.Error -> gcloud.compute.Firewall -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Delete the network.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> gcloud.compute.Operation -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Google Compute Engine firewall in this network.</p>
	**/
	function firewall(name:String):Void;
	/**
		<p>Get a list of firewalls for this network.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.compute.Firewall -> Dynamic -> Dynamic -> Void):Void { })
	function getFirewalls(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of firewalls to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.compute.Firewall -> Dynamic -> Dynamic -> Void):Void;
}