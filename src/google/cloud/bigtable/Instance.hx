package google.cloud.bigtable;
@:jsRequire("google-cloud", "bigtable.instance") extern class Instance {
	/**
		<p>Create an Instance object to interact with a Compute instance.</p>
	**/
	@:selfCall
	function new(name:String);
	/**
		<p>Create an instance.</p>
	**/
	@:overload(function():Void { })
	function create(options:Dynamic):Void;
	/**
		<p>Delete the instance.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if an instance exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get an instance if it exists.</p>
	**/
	function get():Void;
	/**
		<p>Get the instance metadata.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Set the instance metadata.</p>
	**/
	function setMetadata(metadata:{ /**
		<ul> <li>The descriptive name for this instance as it appears in UIs. It can be changed at any time, but  should be kept globally unique to avoid confusion.</li> </ul> 
	**/
	var displayName : String; }, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Create a cluster.</p>
	**/
	@:overload(function(name:String, callback:js.Error -> google.cloud.bigtable.Cluster -> js.node.events.EventEmitter.IEventEmitter -> Dynamic -> Void):Void { })
	function createCluster(name:String, options:{ /**
		<ul> <li>The location where this cluster&#39;s nodes and storage reside. For best performance clients should be located as  as close as possible to this cluster. Currently only zones are  supported.</li> </ul> 
	**/
	var location : String; /**
		<ul> <li>The number of nodes allocated to this cluster. More nodes enable higher throughput and more consistent  performance.</li> </ul> 
	**/
	var nodes : Float; /**
		<ul> <li>The type of storage used by this cluster to serve its parent instance&#39;s tables. Options are &#39;hdd&#39; or &#39;ssd&#39;.</li> </ul> 
	**/
	var storage : String; }, callback:js.Error -> google.cloud.bigtable.Cluster -> js.node.events.EventEmitter.IEventEmitter -> Dynamic -> Void):Void;
	/**
		<p>Create a table on your Bigtable instance.</p>
	**/
	@:overload(function(name:String, callback:js.Error -> google.cloud.bigtable.Table -> Dynamic -> Void):Void { })
	function createTable(name:String, options:{ /**
		<ul> <li>Column families to be created within the table.</li> </ul> 
	**/
	var families : haxe.extern.EitherType<Array<String>, Dynamic>; /**
		<ul> <li>Initial <a href="https://cloud.google.com/bigtable/docs/managing-tables#splits">split keys</a>.</li> </ul> 
	**/
	var splits : Array<String>; }, callback:js.Error -> google.cloud.bigtable.Table -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Bigtable Cluster.</p>
	**/
	function cluster(name:String):google.cloud.bigtable.Cluster;
	/**
		<p>Get Cluster objects for all of your clusters.</p>
	**/
	@:overload(function(callback:js.Error -> Array<google.cloud.bigtable.Cluster> -> Dynamic -> Dynamic -> Void):Void { })
	function getClusters(query:{ /**
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
	var pageToken : String; }, callback:js.Error -> Array<google.cloud.bigtable.Cluster> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get Table objects for all the tables in your Compute instance.</p>
	**/
	@:overload(function(callback:js.Error -> Array<google.cloud.bigtable.Table> -> Dynamic -> Dynamic -> Void):Void { })
	function getTables(query:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of items to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of a larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; /**
		<ul> <li>View over the table&#39;s fields. Possible options are &#39;name&#39;, &#39;schema&#39; or &#39;full&#39;. Default: &#39;name&#39;.</li> </ul> 
	**/
	var view : String; }, callback:js.Error -> Array<google.cloud.bigtable.Table> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a reference to a Bigtable table.</p>
	**/
	function table(name:String):google.cloud.bigtable.Table;
}