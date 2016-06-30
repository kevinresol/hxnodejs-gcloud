package gcloud.bigquery;
@:jsRequire("gcloud.bigquery.dataset") extern class Dataset {
	/**
		<p>Interact with your BigQuery dataset. Create a Dataset instance with <a data-custom-type="bigquery" data-method="createDataset">bigquery#createDataset</a> or <a data-custom-type="bigquery" data-method="dataset">bigquery#dataset</a>.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a dataset.</p>
	**/
	function create():Void;
	/**
		<p>Check if the dataset exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a dataset if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata for the Dataset.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Sets the metadata of the Dataset object.</p>
	**/
	function setMetadata(metadata:Dynamic, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Create a table given a tableId or configuration object.</p>
	**/
	@:overload(function(id:String, callback:js.Error -> gcloud.bigquery.Table -> Dynamic -> Void):Void { })
	function createTable(id:String, options:{ /**
		<ul> <li>A comma-separated list of name:type pairs. Valid types are &quot;string&quot;, &quot;integer&quot;, &quot;float&quot;, &quot;boolean&quot;, and  &quot;timestamp&quot;. If the type is omitted, it is assumed to be &quot;string&quot;.  Example: &quot;name:string, age:integer&quot;. Schemas can also be specified as a  JSON array of fields, which allows for nested and repeated fields. See  a <a href="http://goo.gl/sl8Dmg">Table resource</a> for more detailed information.</li> </ul> 
	**/
	var schema : haxe.extern.EitherType<Dynamic, String>; }, callback:js.Error -> gcloud.bigquery.Table -> Dynamic -> Void):Void;
	/**
		<p>Delete the dataset.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Void):Void { })
	function delete(options:{ /**
		<ul> <li>Force delete dataset and all tables. Default: false.</li> </ul> 
	**/
	var force : Bool; }, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Get a list of tables.</p>
	**/
	@:overload(function(callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void { })
	function getTables(query:{ /**
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
	var pageToken : String; }, callback:js.Error -> Dynamic -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Run a query scoped to your dataset.</p><p>See <a data-custom-type="bigquery" data-method="query">bigquery#query</a> for full documentation of this method.</p>
	**/
	function query():Void;
	/**
		<p>Create a Table object.</p>
	**/
	function table(id:String):gcloud.bigquery.Table;
}