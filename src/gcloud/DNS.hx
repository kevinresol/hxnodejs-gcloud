package gcloud;
@:jsRequire("google-cloud", "dns") extern class DNS {
	/**
		<p><a href="https://cloud.google.com/dns/what-is-cloud-dns">Google Cloud DNS</a> is a high- performance, resilient, global DNS service that provides a cost-effective way to make your applications and services available to your users. This programmable, authoritative DNS service can be used to easily publish and manage DNS records using the same infrastructure relied upon by Google.</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a managed zone.</p>
	**/
	function createZone(name:String, config:{ /**
		<ul> <li>DNS name for the zone. E.g. &quot;example.com.&quot;</li> </ul> 
	**/
	var dnsName : String; /**
		<ul> <li>Description text for the zone.</li> </ul> 
	**/
	@:optional
	var description : String; }, callback:js.Error -> gcloud.dns.Zone -> Dynamic -> Void):Void;
	/**
		<p>Gets a list of managed zones for the project.</p>
	**/
	@:overload(function(callback:js.Error -> Array<gcloud.dns.Zone> -> Dynamic -> Void):Void { })
	function getZones(query:{ /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>Page token.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Array<gcloud.dns.Zone> -> Dynamic -> Void):Void;
	/**
		<p>Create a zone object representing a managed zone.</p>
	**/
	function zone(name:String):gcloud.dns.Zone;
}