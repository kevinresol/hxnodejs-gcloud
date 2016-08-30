package google.cloud.dns;
@:jsRequire("google-cloud", "dns.record") extern class Record {
	/**
		<p>Create a Resource Record object.</p>
	**/
	@:selfCall
	function new(type:Dynamic, metadata:{ /**
		<ul> <li>The name of the record, e.g. <code>www.example.com.</code>.</li> </ul> 
	**/
	var name : String; /**
		<ul> <li>Defined in <a href="https://goo.gl/9EiM0e">RFC 1035, section 5</a> and  <a href="https://goo.gl/Hwhsu9">RFC 1034, section 3.6.1</a>.</li> </ul> 
	**/
	var data : Array<String>; /**
		<ul> <li>Seconds that the resource is cached by resolvers.</li> </ul> 
	**/
	var ttl : Float; });
	/**
		<p>Delete this record by creating a change on your zone. This is a convenience method for:</p><pre><code>zone.createChange({ delete: record }, function(err, change, apiResponse) {}); </code></pre>
	**/
	function delete(callback:js.Error -> google.cloud.dns.Change -> Dynamic -> Void):Void;
}