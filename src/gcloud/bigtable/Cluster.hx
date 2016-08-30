package gcloud.bigtable;
@:jsRequire("google-cloud", "bigtable.cluster") extern class Cluster {
	/**
		<p>Create a cluster object to interact with your cluster.</p>
	**/
	@:selfCall
	function new(name:String);
	/**
		<p>Create a cluster.</p>
	**/
	function create(options:Dynamic):Void;
	/**
		<p>Delete the cluster.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if a cluster exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a cluster if it exists.</p>
	**/
	function get():Void;
	/**
		<p>Get the cluster metadata.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Set the cluster metadata.</p><p>See <a data-custom-type="bigtable/instance" data-method="createCluster">bigtable/instance#createCluster</a> for a detailed explanation of the arguments.</p>
	**/
	function setMetadata(metadata:{ /**
		<ul> <li>The cluster location.</li> </ul> 
	**/
	var location : String; /**
		<ul> <li>Number of nodes allocated to the cluster.</li> </ul> 
	**/
	var nodes : Float; /**
		<ul> <li>The cluster storage type.</li> </ul> 
	**/
	var storage : String; }, callback:js.Error -> js.node.events.EventEmitter -> Dynamic -> Void):Void;
}