package gcloud.dns;
@:jsRequire("gcloud.dns.zone") extern class Zone {
	/**
		<p>A Zone object is used to interact with your project&#39;s managed zone. It will help you add or delete records, delete your zone, and many other convenience methods.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a zone.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Check if the zone exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a zone if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata for the zone.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Add records to this zone. This is a convenience wrapper around <a data-custom-type="dns/zone" data-method="createChange">dns/zone#createChange</a>.</p>
	**/
	function addRecords(record:haxe.extern.EitherType<Dynamic, gcloud.dns.Record>):Void;
	/**
		<p>Create a reference to a change object in this zone.</p>
	**/
	function change(id:String):gcloud.dns.Change;
	/**
		<p>Create a change of resource record sets for the zone.</p>
	**/
	function createChange(config:{ /**
		<ul> <li>Record objects to add to this zone.</li> </ul> 
	**/
	var add : haxe.extern.EitherType<Dynamic, gcloud.dns.Record>; /**
		<ul> <li>Record objects to delete from this zone. Be aware that the resource records here  must match exactly to be deleted.</li> </ul> 
	**/
	var delete : haxe.extern.EitherType<Dynamic, gcloud.dns.Record>; }, callback:js.Error -> gcloud.dns.Change -> Dynamic -> Void):Void;
	/**
		<p>Delete the zone.</p><p>Only empty zones can be deleted. Set options.force to <code>true</code> to call <a data-custom-type="dns/zone" data-method="empty">dns/zone#empty</a> before deleting the zone. Two API calls will then be made (one to empty, another to delete), which means <strong> this is not an atomic request</strong>.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Void):Void { })
	function delete(options:{ /**
		<ul> <li>Empty the zone before deleting.</li> </ul> 
	**/
	var force : Bool; }, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Delete records from this zone. This is a convenience wrapper around <a data-custom-type="dns/zone" data-method="createChange">dns/zone#createChange</a>.</p><p>This method accepts <a data-custom-type="dns/record" data-method="">dns/record</a> objects or string record types in its place. This means that you can delete all A records or NS records, etc. If used this way, two API requests are made (one to get, then another to delete), which means <strong>the operation is not atomic</strong> and could result in unexpected changes.</p>
	**/
	function deleteRecords(record:haxe.extern.EitherType<String, haxe.extern.EitherType<Dynamic, gcloud.dns.Record>>):Void;
	/**
		<p>Emptying your zone means leaving only &#39;NS&#39; and &#39;SOA&#39; records. This method will first fetch the non-NS and non-SOA records from your zone using <a data-custom-type="dns/zone" data-method="getRecords">dns/zone#getRecords</a>, then use <a data-custom-type="dns/zone" data-method="createChange">dns/zone#createChange</a> to create a deletion change.</p>
	**/
	function empty(callback:js.Error -> gcloud.dns.Change -> Dynamic -> Void):Void;
	/**
		<p>Provide a path to a zone file to copy records into the zone.</p>
	**/
	function export(localPath:String, callback:js.Error -> Void):Void;
	/**
		<p>Get the list of changes associated with this zone. A change is an atomic update to a collection of records.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void { })
	function getChanges(query:{ /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>The page token.</li> </ul> 
	**/
	var pageToken : String; /**
		<ul> <li>Set to &#39;asc&#39; for ascending, and &#39;desc&#39; for descending or omit for no sorting.</li> </ul> 
	**/
	var sort : String; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get the list of records for this zone.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void { })
	function getRecords(query:{ /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to be returned.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>Restricts the list to return only records with this fully qualified domain name.</li> </ul> 
	**/
	var name : String; /**
		<ul> <li>The page token.</li> </ul> 
	**/
	var pageToken : String; /**
		<ul> <li>Restricts the list to return only records of this type. If present, the &quot;name&quot; parameter must also be present.</li> </ul> 
	**/
	var type : String; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Copy the records from a zone file into this zone.</p>
	**/
	@:native("import")
	function import_(localPath:String, callback:js.Error -> gcloud.dns.Change -> Dynamic -> Void):Void;
	/**
		<p>A <a data-custom-type="dns/record" data-method="">dns/record</a> object can be used to construct a record you want to add to your zone, or to refer to an existing one.</p><p>Note that using this method will not itself make any API requests. You will use the object returned in other API calls, for example to add a record to your zone or to delete an existing one.</p>
	**/
	function record(type:String, metadata:{ /**
		<ul> <li>The name of the record, e.g. <code>www.example.com.</code>.</li> </ul> 
	**/
	var name : String; /**
		<ul> <li>Defined in <a href="https://goo.gl/9EiM0e">RFC 1035, section 5</a> and  <a href="https://goo.gl/Hwhsu9">RFC 1034, section 3.6.1</a>.</li> </ul> 
	**/
	var data : Array<String>; /**
		<ul> <li>Seconds that the resource is cached by resolvers.</li> </ul> 
	**/
	var ttl : Float; }):gcloud.dns.Record;
	/**
		<p>Provide a record type that should be deleted and replaced with other records.</p><p><strong>This is not an atomic request.</strong> Two API requests are made (one to get records of the type that you&#39;ve requested, then another to replace them), which means the operation is not atomic and could result in unexpected changes.</p>
	**/
	function replaceRecords(recordTypes:haxe.extern.EitherType<Array<String>, String>, newRecords:haxe.extern.EitherType<Dynamic, gcloud.dns.Record>, callback:js.Error -> gcloud.dns.Change -> Dynamic -> Void):Void;
}