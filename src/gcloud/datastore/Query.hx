package gcloud.datastore;
@:jsRequire("google-cloud", "datastore.query") extern class Query {
	/**
		<p>Build a Query object.</p><p><strong>Queries are built with <a data-custom-type="datastore" data-method="createQuery">datastore#createQuery</a> and <a data-custom-type="transaction" data-method="createQuery">transaction#createQuery</a>.</strong></p>
	**/
	@:selfCall
	function new(namespace:String, kind:String);
	/**
		<p>Datastore allows querying on properties. Supported comparison operators are <code>=</code>, <code>&lt;</code>, <code>&gt;</code>, <code>&lt;=</code>, and <code>&gt;=</code>. &quot;Not equal&quot; and <code>IN</code> operators are currently not supported.</p><p><em>To filter by ancestors, see <a data-custom-type="datastore/query" data-method="hasAncestor">datastore/query#hasAncestor</a>.</em></p>
	**/
	@:overload(function(property:String, value:Dynamic):gcloud.datastore.Query { })
	function filter(property:String, operator:String, value:Dynamic):gcloud.datastore.Query;
	/**
		<p>Filter a query by ancestors.</p>
	**/
	function hasAncestor(key:gcloud.datastore.Key):gcloud.datastore.Query;
	/**
		<p>Sort the results by a property name in ascending or descending order. By default, an ascending sort order will be used.</p>
	**/
	@:overload(function(property:String):gcloud.datastore.Query { })
	function order(property:String, options:{ /**
		<ul> <li>Sort the results by a property name in descending order. Default: <code>false</code>.</li> </ul> 
	**/
	var descending : Bool; }):gcloud.datastore.Query;
	/**
		<p>Group query results by a list of properties.</p>
	**/
	function groupBy(properties:Array<Dynamic>):gcloud.datastore.Query;
	/**
		<p>Retrieve only select properties from the matched entities.</p><p>Queries that select a subset of properties are called Projection Queries.</p>
	**/
	function select(fieldNames:haxe.extern.EitherType<Array<String>, String>):gcloud.datastore.Query;
	/**
		<p>Set a starting cursor to a query.</p>
	**/
	function start(cursorToken:String):gcloud.datastore.Query;
	/**
		<p>Set an ending cursor to a query.</p>
	**/
	function end(cursorToken:String):gcloud.datastore.Query;
	/**
		<p>Set a limit on a query.</p>
	**/
	function limit(n:Float):gcloud.datastore.Query;
	/**
		<p>Set an offset on a query.</p>
	**/
	function offset(n:Float):gcloud.datastore.Query;
	/**
		<p>Run the query.</p>
	**/
	@:overload(function(callback:js.Error -> Array<Dynamic> -> { /**
		<ul> <li>Use this in a follow-up query to begin from where these results ended.</li> </ul> 
	**/
	var endCursor : String; /**
		<ul> <li>Datastore responds with one of: <ul> <li><a data-custom-type="datastore" data-method="MORE_RESULTS_AFTER_LIMIT">datastore#MORE_RESULTS_AFTER_LIMIT</a>: There <em>may</em> be more results after the specified limit.</li> <li><a data-custom-type="datastore" data-method="MORE_RESULTS_AFTER_CURSOR">datastore#MORE_RESULTS_AFTER_CURSOR</a>: There <em>may</em> be more results after the specified end cursor.</li> <li><a data-custom-type="datastore" data-method="NO_MORE_RESULTS">datastore#NO_MORE_RESULTS</a>: There are no more results.</li> </ul> </li> </ul> 
	**/
	var moreResults : String; } -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(options:{ /**
		<ul> <li>Specify either <code>strong</code> or <code>eventual</code>. If not specified, default values are chosen by Datastore for the  operation. Learn more about strong and eventual consistency  <a href="https://cloud.google.com/datastore/docs/articles/balancing-strong-and-eventual-consistency-with-google-cloud-datastore">here</a>.</li> </ul> 
	**/
	var consistency : String; }):Void { })
	function run(options:{ /**
		<ul> <li>Specify either <code>strong</code> or <code>eventual</code>. If not specified, default values are chosen by Datastore for the  operation. Learn more about strong and eventual consistency  <a href="https://cloud.google.com/datastore/docs/articles/balancing-strong-and-eventual-consistency-with-google-cloud-datastore">here</a>.</li> </ul> 
	**/
	var consistency : String; }, callback:js.Error -> Array<Dynamic> -> { /**
		<ul> <li>Use this in a follow-up query to begin from where these results ended.</li> </ul> 
	**/
	var endCursor : String; /**
		<ul> <li>Datastore responds with one of: <ul> <li><a data-custom-type="datastore" data-method="MORE_RESULTS_AFTER_LIMIT">datastore#MORE_RESULTS_AFTER_LIMIT</a>: There <em>may</em> be more results after the specified limit.</li> <li><a data-custom-type="datastore" data-method="MORE_RESULTS_AFTER_CURSOR">datastore#MORE_RESULTS_AFTER_CURSOR</a>: There <em>may</em> be more results after the specified end cursor.</li> <li><a data-custom-type="datastore" data-method="NO_MORE_RESULTS">datastore#NO_MORE_RESULTS</a>: There are no more results.</li> </ul> </li> </ul> 
	**/
	var moreResults : String; } -> Void):Void;
}