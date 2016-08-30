package gcloud.logging;
@:jsRequire("google-cloud", "logging.log") extern class Log {
	/**
		<p>A log is a named collection of entries, each entry representing a timestamped event. Logs can be produced by Google Cloud Platform services, by third-party services, or by your applications. For example, the log <code>apache-access</code> is produced by the Apache Web Server, but the log <code>compute.googleapis.com/activity_log</code> is produced by Google Compute Engine.</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Delete the log.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Write a log entry with a severity of &quot;ALERT&quot;.</p><p>This is a simple wrapper around <a data-custom-type="logging/log" data-method="write">logging/log#write</a>. All arguments are the same as documented there.</p>
	**/
	function alert():Void;
	/**
		<p>Write a log entry with a severity of &quot;CRITICAL&quot;.</p><p>This is a simple wrapper around <a data-custom-type="logging/log" data-method="write">logging/log#write</a>. All arguments are the same as documented there.</p>
	**/
	function critical():Void;
	/**
		<p>Write a log entry with a severity of &quot;DEBUG&quot;.</p><p>This is a simple wrapper around <a data-custom-type="logging/log" data-method="write">logging/log#write</a>. All arguments are the same as documented there.</p>
	**/
	function debug():Void;
	/**
		<p>Write a log entry with a severity of &quot;EMERGENCY&quot;.</p><p>This is a simple wrapper around <a data-custom-type="logging/log" data-method="write">logging/log#write</a>. All arguments are the same as documented there.</p>
	**/
	function emergency():Void;
	/**
		<p>Create an entry object for this log.</p><p>Note that using this method will not itself make any API requests. You will use the object returned in other API calls, such as <a data-custom-type="logging/log" data-method="write">logging/log#write</a>.</p>
	**/
	@:overload(function(data:haxe.extern.EitherType<String, Dynamic>):gcloud.logging.Entry { })
	function entry(resource:haxe.extern.EitherType<String, Dynamic>, data:haxe.extern.EitherType<String, Dynamic>):gcloud.logging.Entry;
	/**
		<p>Write a log entry with a severity of &quot;ERROR&quot;.</p><p>This is a simple wrapper around <a data-custom-type="logging/log" data-method="write">logging/log#write</a>. All arguments are the same as documented there.</p>
	**/
	function error():Void;
	/**
		<p>This method is a wrapper around <a data-custom-type="logging" data-method="getEntries">logging#getEntries</a>, but with a filter specified to only return entries from this log.</p>
	**/
	@:overload(function(callback:js.Error -> Array<gcloud.logging.Entry> -> Dynamic -> Dynamic -> Void):Void { })
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
	var pageToken : String; }, callback:js.Error -> Array<gcloud.logging.Entry> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Write a log entry with a severity of &quot;INFO&quot;.</p><p>This is a simple wrapper around <a data-custom-type="logging/log" data-method="write">logging/log#write</a>. All arguments are the same as documented there.</p>
	**/
	function info():Void;
	/**
		<p>Write a log entry with a severity of &quot;NOTICE&quot;.</p><p>This is a simple wrapper around <a data-custom-type="logging/log" data-method="write">logging/log#write</a>. All arguments are the same as documented there.</p>
	**/
	function notice():Void;
	/**
		<p>Write a log entry with a severity of &quot;WARNING&quot;.</p><p>This is a simple wrapper around <a data-custom-type="logging/log" data-method="write">logging/log#write</a>. All arguments are the same as documented there.</p>
	**/
	function warning():Void;
	/**
		<p>Write log entries to Cloud Logging.</p><p>While you may write a single entry at a time, batching multiple entries together is preferred to avoid reaching the queries per second limit.</p>
	**/
	@:overload(function(entry:haxe.extern.EitherType<Array<gcloud.logging.Entry>, gcloud.logging.Entry>, callback:js.Error -> Dynamic -> Void):Void { })
	function write(entry:haxe.extern.EitherType<Array<gcloud.logging.Entry>, gcloud.logging.Entry>, options:{ /**
		<ul> <li>Labels to set on the log.</li> </ul> 
	**/
	var labels : Array<Dynamic>; /**
		<ul> <li>A default monitored resource for entries where one isn&#39;t specified.</li> </ul> 
	**/
	var resource : Dynamic; }, callback:js.Error -> Dynamic -> Void):Void;
}