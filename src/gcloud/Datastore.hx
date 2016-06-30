package gcloud;
@:jsRequire("gcloud", "datastore") extern class Datastore {
	/**
		<p>Interact with the <a href="https://developers.google.com/datastore/">Google Cloud Datastore</a>.</p>
	**/
	@:selfCall
	function new(options:{ /**
		<ul> <li>Override the default API endpoint used to reach Datastore. This is useful for connecting to your local Datastore  server (usually &quot;<a href="http://localhost:8080">http://localhost:8080</a>&quot;).</li> </ul> 
	**/
	@:optional
	var apiEndpoint : String; /**
		<ul> <li>Namespace to isolate transactions to.</li> </ul> 
	**/
	var namespace : String; });
	/**
		<p>Helper function to get a Datastore Double object.</p>
	**/
	function double(value:Float):Dynamic;
	/**
		<p>Helper function to get a Datastore Geo Point object.</p>
	**/
	function geoPoint(coordinates:{ /**
		<ul> <li>Latitudinal value.</li> </ul> 
	**/
	var latitude : Float; /**
		<ul> <li>Longitudinal value.</li> </ul> 
	**/
	var longitude : Float; }):Dynamic;
	/**
		<p>Helper function to get a Datastore Integer object.</p>
	**/
	function int(value:Float):Dynamic;
	/**
		<p>This is one of three values which may be returned from <a data-custom-type="datastore" data-method="runQuery">datastore#runQuery</a>, <a data-custom-type="transaction" data-method="runQuery">transaction#runQuery</a>, and <a data-custom-type="datastore/query" data-method="run">datastore/query#run</a> as <code>info.moreResults</code>.</p><p>There <em>may</em> be more results after the specified end cursor.</p>
	**/
	function MORE_RESULTS_AFTER_CURSOR():Void;
	/**
		<p>This is one of three values which may be returned from <a data-custom-type="datastore" data-method="runQuery">datastore#runQuery</a>, <a data-custom-type="transaction" data-method="runQuery">transaction#runQuery</a>, and <a data-custom-type="datastore/query" data-method="run">datastore/query#run</a> as <code>info.moreResults</code>.</p><p>There <em>may</em> be more results after the specified limit.</p>
	**/
	function MORE_RESULTS_AFTER_LIMIT():Void;
	/**
		<p>This is one of three values which may be returned from <a data-custom-type="datastore" data-method="runQuery">datastore#runQuery</a>, <a data-custom-type="transaction" data-method="runQuery">transaction#runQuery</a>, and <a data-custom-type="datastore/query" data-method="run">datastore/query#run</a> as <code>info.moreResults</code>.</p><p>There are no more results left to query for.</p>
	**/
	function NO_MORE_RESULTS():Void;
	/**
		<p>Create a query for the specified kind. See <a data-custom-type="datastore/query" data-method="">datastore/query</a> for all of the available methods.</p>
	**/
	@:overload(function(kind:String):gcloud.datastore.Query { })
	function createQuery(namespace:String, kind:String):gcloud.datastore.Query;
	/**
		<p>Helper to create a Key object, scoped to the instance&#39;s namespace by default.</p><p>You may also specify a configuration object to define a namespace and path.</p>
	**/
	@:overload(function(options:{ /**
		<ul> <li>Key path.</li> </ul> 
	**/
	@:optional
	var path : Dynamic; /**
		<ul> <li>Optional namespace.</li> </ul> 
	**/
	@:optional
	var namespace : String; }):gcloud.datastore.Key { })
	@:overload(function():gcloud.datastore.Key { })
	@:overload(function(options:Dynamic):gcloud.datastore.Key { })
	function key(options:Dynamic, options:{ /**
		<ul> <li>Key path.</li> </ul> 
	**/
	@:optional
	var path : Dynamic; /**
		<ul> <li>Optional namespace.</li> </ul> 
	**/
	@:optional
	var namespace : String; }):gcloud.datastore.Key;
	/**
		<p>Run a function in the context of a new transaction. Transactions allow you to perform multiple operations, committing your changes atomically. When you are finished making your changes within the transaction, run the done() function provided in the callback function to commit your changes. See an example below for more information.</p>
	**/
	function runInTransaction(fn:gcloud.datastore.Transaction -> (Void -> Dynamic) -> Void, callback:js.Error -> Void):Void;
	/**
		<p>Generate IDs without creating entities.</p>
	**/
	function allocateIds(incompleteKey:gcloud.datastore.Key, n:Float, callback:js.Error -> Array<Dynamic> -> Dynamic -> Void):Void;
	/**
		<p>Delete all entities identified with the specified key(s).</p>
	**/
	function delete(key:haxe.extern.EitherType<Array<gcloud.datastore.Key>, gcloud.datastore.Key>, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Retrieve the entities identified with the specified key(s) in the current transaction. Get operations require a valid key to retrieve the key-identified entity from Datastore.</p>
	**/
	@:overload(function(keys:haxe.extern.EitherType<Array<gcloud.datastore.Key>, gcloud.datastore.Key>, callback:js.Error -> haxe.extern.EitherType<Array<Dynamic>, Dynamic> -> Void):Void { })
	function get(keys:haxe.extern.EitherType<Array<gcloud.datastore.Key>, gcloud.datastore.Key>, options:{ /**
		<ul> <li>Specify either <code>strong</code> or <code>eventual</code>. If not specified, default values are chosen by Datastore for the  operation. Learn more about strong and eventual consistency  <a href="https://cloud.google.com/datastore/docs/articles/balancing-strong-and-eventual-consistency-with-google-cloud-datastore">here</a>.</li> </ul> 
	**/
	var consistency : String; /**
		<ul> <li>Maximum API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Bool; }, callback:js.Error -> haxe.extern.EitherType<Array<Dynamic>, Dynamic> -> Void):Void;
	/**
		<p>Maps to <a data-custom-type="datastore" data-method="save">datastore#save</a>, forcing the method to be <code>insert</code>.</p>
	**/
	function insert():Void;
	/**
		<p>Datastore allows you to query entities by kind, filter them by property filters, and sort them by a property name. Projection and pagination are also supported.</p><p>If you provide a callback, the query is run, and the results are returned as the second argument to your callback. A third argument may also exist, which is a query object that uses the end cursor from the previous query as the starting cursor for the next query. You can pass that object back to this method to see if more results exist.</p><p>You may also omit the callback to this function to trigger streaming mode.</p><p>See below for examples of both approaches.</p>
	**/
	@:overload(function(q:gcloud.datastore.Query, callback:js.Error -> Array<Dynamic> -> { /**
		<ul> <li>Use this in a follow-up query to begin from where these results ended.</li> </ul> 
	**/
	var endCursor : String; /**
		<ul> <li>Datastore responds with one of: <ul> <li><a data-custom-type="datastore" data-method="MORE_RESULTS_AFTER_LIMIT">datastore#MORE_RESULTS_AFTER_LIMIT</a>: There <em>may</em> be more results after the specified limit.</li> <li><a data-custom-type="datastore" data-method="MORE_RESULTS_AFTER_CURSOR">datastore#MORE_RESULTS_AFTER_CURSOR</a>: There <em>may</em> be more results after the specified end cursor.</li> <li><a data-custom-type="datastore" data-method="NO_MORE_RESULTS">datastore#NO_MORE_RESULTS</a>: There are no more results.</li> </ul> </li> </ul> 
	**/
	var moreResults : String; } -> Void):Void { })
	@:overload(function(q:gcloud.datastore.Query):Void { })
	@:overload(function(q:gcloud.datastore.Query, options:{ /**
		<ul> <li>Specify either <code>strong</code> or <code>eventual</code>. If not specified, default values are chosen by Datastore for the  operation. Learn more about strong and eventual consistency  <a href="https://cloud.google.com/datastore/docs/articles/balancing-strong-and-eventual-consistency-with-google-cloud-datastore">here</a>.</li> </ul> 
	**/
	var consistency : String; /**
		<ul> <li>Maximum API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Bool; }):Void { })
	function runQuery(q:gcloud.datastore.Query, options:{ /**
		<ul> <li>Specify either <code>strong</code> or <code>eventual</code>. If not specified, default values are chosen by Datastore for the  operation. Learn more about strong and eventual consistency  <a href="https://cloud.google.com/datastore/docs/articles/balancing-strong-and-eventual-consistency-with-google-cloud-datastore">here</a>.</li> </ul> 
	**/
	var consistency : String; /**
		<ul> <li>Maximum API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Bool; }, callback:js.Error -> Array<Dynamic> -> { /**
		<ul> <li>Use this in a follow-up query to begin from where these results ended.</li> </ul> 
	**/
	var endCursor : String; /**
		<ul> <li>Datastore responds with one of: <ul> <li><a data-custom-type="datastore" data-method="MORE_RESULTS_AFTER_LIMIT">datastore#MORE_RESULTS_AFTER_LIMIT</a>: There <em>may</em> be more results after the specified limit.</li> <li><a data-custom-type="datastore" data-method="MORE_RESULTS_AFTER_CURSOR">datastore#MORE_RESULTS_AFTER_CURSOR</a>: There <em>may</em> be more results after the specified end cursor.</li> <li><a data-custom-type="datastore" data-method="NO_MORE_RESULTS">datastore#NO_MORE_RESULTS</a>: There are no more results.</li> </ul> </li> </ul> 
	**/
	var moreResults : String; } -> Void):Void;
	/**
		<p>Insert or update the specified object(s). If a key is incomplete, its associated object is inserted and the original Key object is updated to contain the generated ID.</p><p>This method will determine the correct Datastore method to execute (<code>upsert</code>, <code>insert</code>, or <code>update</code>) by using the key(s) provided. For example, if you provide an incomplete key (one without an ID), the request will create a new entity and have its ID automatically assigned. If you provide a complete key, the entity will be updated with the data specified.</p><p>By default, all properties are indexed. To prevent a property from being included in <em>all</em> indexes, you must supply an entity&#39;s <code>data</code> property as an array. See below for an example.</p>
	**/
	function save(entities:haxe.extern.EitherType<Array<{ /**
		<ul> <li>Datastore key object.</li> </ul> 
	**/
	var key : gcloud.datastore.Key; /**
		<ul> <li>Explicit method to use, either &#39;insert&#39;, &#39;update&#39;, or &#39;upsert&#39;.</li> </ul> 
	**/
	@:optional
	var method : String; /**
		<ul> <li>Data to save with the provided key. If you provide an array of objects, you must use the explicit syntax:  <code>name</code> for the name of the property and <code>value</code> for its value. You may  also specify an <code>excludeFromIndexes</code> property, set to <code>true</code> or <code>false</code>.</li> </ul> 
	**/
	var data : haxe.extern.EitherType<Array<Dynamic>, Dynamic>; }>, { /**
		<ul> <li>Datastore key object.</li> </ul> 
	**/
	var key : gcloud.datastore.Key; /**
		<ul> <li>Explicit method to use, either &#39;insert&#39;, &#39;update&#39;, or &#39;upsert&#39;.</li> </ul> 
	**/
	@:optional
	var method : String; /**
		<ul> <li>Data to save with the provided key. If you provide an array of objects, you must use the explicit syntax:  <code>name</code> for the name of the property and <code>value</code> for its value. You may  also specify an <code>excludeFromIndexes</code> property, set to <code>true</code> or <code>false</code>.</li> </ul> 
	**/
	var data : haxe.extern.EitherType<Array<Dynamic>, Dynamic>; }>, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Maps to <a data-custom-type="datastore" data-method="save">datastore#save</a>, forcing the method to be <code>update</code>.</p>
	**/
	function update():Void;
	/**
		<p>Maps to <a data-custom-type="datastore" data-method="save">datastore#save</a>, forcing the method to be <code>upsert</code>.</p>
	**/
	function upsert():Void;
}