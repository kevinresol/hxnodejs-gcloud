package gcloud.prediction;
@:jsRequire("google-cloud", "prediction.model") extern class Model {
	/**
		<p>A Model object represents a trained model. You can train it by using <a data-custom-type="prediction/model" data-method="train">prediction/model#train</a> or ask for predictions with <a data-custom-type="prediction/model" data-method="query">prediction/model#query</a>.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a trained model.</p>
	**/
	@:overload(function():Void { })
	function create(options:Dynamic):Void;
	/**
		<p>Delete the model.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if the model exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a model if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata for the model.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Sets the metadata of the Model object.</p><p>NOTE: What you probably want is <a data-custom-type="prediction/model" data-method="train">prediction/model#train</a>, which wraps this method.</p>
	**/
	function setMetadata(metadata:Dynamic, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Get an analysis of the model and the data it was trained on.</p>
	**/
	function analyze(callback:js.Error -> { /**
		<ul> <li>Analysis of the data stored in this model.</li> </ul> 
	**/
	var data : Dynamic; /**
		<ul> <li>Analysis of the model.</li> </ul> 
	**/
	var model : Dynamic; } -> Dynamic -> Void):Void;
	/**
		<p>Create a writable stream to train the model with new data.</p><p>This is a wrapper around <a data-custom-type="prediction/model" data-method="train">prediction/model#train</a>.</p>
	**/
	function createWriteStream(label:haxe.extern.EitherType<Float, String>):js.node.fs.WriteStream;
	/**
		<p>Query the stored data in your model.</p>
	**/
	function query(input:haxe.extern.EitherType<Array<String>, String>, callback:js.Error -> { /**
		<ul> <li>The matching result&#39;s label.</li> </ul> 
	**/
	var winner : String; /**
		<ul> <li>Sorted from highest-to-lowest, all of the results that matched the query. This will not be present if<pre><code> querying a regression model. </code></pre></li> </ul> 
	**/
	var scores : Array<Dynamic>; } -> Dynamic -> Void):Void;
	/**
		<p>Update the stored data with new input.</p>
	**/
	function train(label:haxe.extern.EitherType<Float, String>, input:haxe.extern.EitherType<Array<String>, String>, callback:js.Error -> Dynamic -> Void):Void;
}