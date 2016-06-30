package gcloud;
@:jsRequire("gcloud", "logging") extern class Logging {
	/**
		<p><a href="https://cloud.google.com/logging/docs">Google Cloud Logging</a> collects and stores logs from applications and services on the Google Cloud Platform:</p><ul> <li>Export your logs to Google Cloud Storage, Google BigQuery, or Google Cloud Pub/Sub.</li> <li>Integrate third-party logs from your virtual machine instances by installing the logging agent, <code>google-fluentd</code>.</li> </ul> 
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a sink.</p>
	**/
	function createSink(name:String, config:{ /**
		<ul> <li>The destination. The proper ACL scopes will be granted to the provided destination.</li> </ul> 
	**/
	var destination : haxe.extern.EitherType<gcloud.pubsub.Topic, haxe.extern.EitherType<gcloud.bigquery.Dataset, gcloud.storage.Bucket>>; /**
		<ul> <li>An advanced logs filter. Only log entries matching the filter are written.</li> </ul> 
	**/
	@:optional
	var filter : String; }, callback:js.Error -> gcloud.logging.Sink -> Dynamic -> Void):Void;
	/**
		<p>Create an entry object.</p><p>Note that using this method will not itself make any API requests. You will use the object returned in other API calls, such as <a data-custom-type="logging/log" data-method="write">logging/log#write</a>.</p>
	**/
	@:overload(function(data:haxe.extern.EitherType<String, Dynamic>):gcloud.logging.Entry { })
	function entry(resource:haxe.extern.EitherType<String, Dynamic>, data:haxe.extern.EitherType<String, Dynamic>):gcloud.logging.Entry;
	/**
		<p>List the entries in your logs.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void { })
	function getEntries(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>An <a href="https://cloud.google.com/logging/docs/view/advanced_filters">advanced logs filter</a>.  An empty filter matches all log entries.</li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>How the results should be sorted, <code>timestamp</code> (oldest first) and <code>timestamp desc</code> (newest first,  <strong>default</strong>).</li> </ul> 
	**/
	var orderBy : String; /**
		<ul> <li>Maximum number of logs to return.</li> </ul> 
	**/
	var pageSize : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get the sinks associated with this project.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Void):Void { })
	function getSinks(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; }, callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Cloud Logging log.</p>
	**/
	function log(name:String):gcloud.logging.Log;
	/**
		<p>Get a reference to a Cloud Logging sink.</p>
	**/
	function sink(name:String):gcloud.logging.Sink;
}