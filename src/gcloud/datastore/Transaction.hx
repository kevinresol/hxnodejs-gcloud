package gcloud.datastore;
@:jsRequire("gcloud.datastore.transaction") extern class Transaction {
	/**
		<p>Build a Transaction object. Transactions will be created for you by <a data-custom-type="datastore" data-method="">datastore</a>. When you need to run a transactional operation, use <a data-custom-type="datastore" data-method="runInTransaction">datastore#runInTransaction</a>.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a query for the specified kind. See <a data-custom-type="datastore/query" data-method="">datastore/query</a> for all of the available methods.</p>
	**/
	@:overload(function(kind:String):gcloud.datastore.Query { })
	function createQuery(namespace:String, kind:String):gcloud.datastore.Query;
	/**
		<p>Delete all entities identified with the specified key(s) in the current transaction.</p>
	**/
	function delete(key:haxe.extern.EitherType<Array<gcloud.datastore.Key>, gcloud.datastore.Key>):Void;
	/**
		<p>Reverse a transaction remotely and finalize the current transaction instance.</p>
	**/
	function rollback(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Insert or update the specified object(s) in the current transaction. If a key is incomplete, its associated object is inserted and the original Key object is updated to contain the generated ID.</p><p>This method will determine the correct Datastore method to execute (<code>upsert</code>, <code>insert</code>, or <code>update</code>) by using the key(s) provided. For example, if you provide an incomplete key (one without an ID), the request will create a new entity and have its ID automatically assigned. If you provide a complete key, the entity will be updated with the data specified.</p><p>By default, all properties are indexed. To prevent a property from being included in <em>all</em> indexes, you must supply an entity&#39;s <code>data</code> property as an array. See below for an example.</p>
	**/
	function save(entities:haxe.extern.EitherType<Array<{ /**
		<ul> <li>Datastore key object.</li> </ul> 
	**/
	var key : gcloud.datastore.Key; /**
		<ul> <li>Data to save with the provided key. If you provide an array of objects, you must use the explicit syntax:  <code>name</code> for the name of the property and <code>value</code> for its value. You may  also specify an <code>excludeFromIndexes</code> property, set to <code>true</code> or <code>false</code>.</li> </ul> 
	**/
	var data : haxe.extern.EitherType<Array<Dynamic>, Dynamic>; }>, { /**
		<ul> <li>Datastore key object.</li> </ul> 
	**/
	var key : gcloud.datastore.Key; /**
		<ul> <li>Data to save with the provided key. If you provide an array of objects, you must use the explicit syntax:  <code>name</code> for the name of the property and <code>value</code> for its value. You may  also specify an <code>excludeFromIndexes</code> property, set to <code>true</code> or <code>false</code>.</li> </ul> 
	**/
	var data : haxe.extern.EitherType<Array<Dynamic>, Dynamic>; }>):Void;
	/**
		<p>Generate IDs without creating entities.</p>
	**/
	function allocateIds(incompleteKey:gcloud.datastore.Key, n:Float, callback:js.Error -> Array<Dynamic> -> Dynamic -> Void):Void;
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
		<p>Maps to <a data-custom-type="datastore" data-method="save">datastore#save</a>, forcing the method to be <code>update</code>.</p>
	**/
	function update():Void;
	/**
		<p>Maps to <a data-custom-type="datastore" data-method="save">datastore#save</a>, forcing the method to be <code>upsert</code>.</p>
	**/
	function upsert():Void;
}