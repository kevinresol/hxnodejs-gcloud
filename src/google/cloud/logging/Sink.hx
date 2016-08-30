package google.cloud.logging;
@:jsRequire("google-cloud", "logging.sink") extern class Sink {
	/**
		<p>A sink is an object that lets you to specify a set of log entries to export to a particular destination. Cloud Logging lets you export log entries to destinations including Google Cloud Storage buckets (for long term log storage), Google BigQuery datasets (for log analysis), Google Pub/Sub (for streaming to other applications).</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a sink.</p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p>Delete the sink.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Get the sink&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Set the sink&#39;s filter.</p><p>This will override any filter that was previously set.</p>
	**/
	@:overload(function(filter:String):Void { })
	function setFilter(filter:String, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Set the sink&#39;s metadata.</p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> Dynamic -> Void):Void;
}