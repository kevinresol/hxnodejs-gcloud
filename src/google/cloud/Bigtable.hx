package google.cloud;
@:jsRequire("google-cloud", "bigtable") extern class Bigtable {
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a Compute instance.</p>
	**/
	@:overload(function(name:String, callback:js.Error -> google.cloud.bigtable.Instance -> js.node.events.EventEmitter.IEventEmitter -> Dynamic -> Void):Void { })
	function createInstance(name:String, options:{ /**
		<ul> <li>The clusters to be created within the instance.</li> </ul> 
	**/
	var clusters : Array<Dynamic>; /**
		<ul> <li>The descriptive name for this instance as it appears in UIs.</li> </ul> 
	**/
	var displayName : String; }, callback:js.Error -> google.cloud.bigtable.Instance -> js.node.events.EventEmitter.IEventEmitter -> Dynamic -> Void):Void;
	/**
		<p>Get Instance objects for all of your Compute instances.</p>
	**/
	function getInstances(query:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>Token returned from a previous call, to request the next page of results.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Array<google.cloud.bigtable.Instance> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Compute instance.</p>
	**/
	function instance(name:String):google.cloud.bigtable.Instance;
	/**
		<p>Get a reference to an Operation.</p>
	**/
	function operation(name:String):js.node.events.EventEmitter.IEventEmitter;
}