package gcloud.compute;
@:jsRequire("google-cloud", "compute.operation") extern class Operation {
	/**
		<p>An Operation object allows you to interact with a Google Compute Engine operation.</p><p>An operation can be a <a href="https://cloud.google.com/compute/docs/reference/v1/globalOperations">GlobalOperation</a>, <a href="https://cloud.google.com/compute/docs/reference/v1/regionOperations">RegionOperation</a>, or <a href="https://cloud.google.com/compute/docs/reference/v1/zoneOperations">ZoneOperation</a>.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Delete the operation.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if the operation exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get an operation if it exists.</p>
	**/
	function get():Void;
	/**
		<p>Get the operation&#39;s metadata. For a detailed description of metadata see <a href="https://goo.gl/sWm1rt">Operation resource</a>.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
}