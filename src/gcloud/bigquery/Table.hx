package gcloud.bigquery;
@:jsRequire("google-cloud", "bigquery.table") extern class Table {
	/**
		<p>Table objects are returned by methods such as <a data-custom-type="bigquery/dataset" data-method="table">bigquery/dataset#table</a>, <a data-custom-type="bigquery/dataset" data-method="createTable">bigquery/dataset#createTable</a>, and <a data-custom-type="bigquery/dataset" data-method="getTables">bigquery/dataset#getTables</a>.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a table.</p>
	**/
	@:overload(function():Void { })
	function create(options:Dynamic):Void;
	/**
		<p>Delete a table and all its data.</p>
	**/
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if the table exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a table if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Return the metadata associated with the Table.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Copy data from one table to another, optionally creating that table.</p>
	**/
	@:overload(function(destination:gcloud.bigquery.Table, callback:js.Error -> gcloud.bigquery.Job -> Dynamic -> Void):Void { })
	function copy(destination:gcloud.bigquery.Table, metadata:Dynamic, callback:js.Error -> gcloud.bigquery.Job -> Dynamic -> Void):Void;
	/**
		<p>Create a readable stream of the rows of data in your table. This method is simply a wrapper around <a data-custom-type="bigquery/table" data-method="getRows">bigquery/table#getRows</a>.</p>
	**/
	function createReadStream():js.node.fs.ReadStream;
	/**
		<p>Load data into your table from a readable stream of JSON, CSV, or AVRO data.</p>
	**/
	@:overload(function():js.node.fs.WriteStream { })
	function createWriteStream(metadata:haxe.extern.EitherType<Dynamic, String>):js.node.fs.WriteStream;
	/**
		<p>Export table to Google Cloud Storage.</p>
	**/
	@:overload(function(destination:gcloud.storage.File, callback:js.Error -> gcloud.bigquery.Job -> Dynamic -> Void):Void { })
	function export(destination:gcloud.storage.File, options:{ /**
		<ul> <li>The format to export the data in. Allowed options are &quot;CSV&quot;, &quot;JSON&quot;, or &quot;AVRO&quot;. Default: &quot;CSV&quot;.</li> </ul> 
	**/
	var format : String; /**
		<ul> <li>Specify if you would like the file compressed with GZIP. Default: false.</li> </ul> 
	**/
	var gzip : Bool; }, callback:js.Error -> gcloud.bigquery.Job -> Dynamic -> Void):Void;
	/**
		<p>Retrieves table data from a specified set of rows. The rows are returned to your callback as an array of objects matching your table&#39;s schema.</p>
	**/
	@:overload(function(callback:js.Error -> Array<Dynamic> -> Dynamic -> Dynamic -> Void):Void { })
	function getRows(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; }, callback:js.Error -> Array<Dynamic> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Load data from a local file or Storage file (<a data-custom-type="storage/file" data-method="">storage/file</a>).</p><p>By loading data this way, you create a load job that will run your data load asynchronously. If you would like instantaneous access to your data, insert it using <a data-custom-type="bigquery/table" data-method="insert">bigquery/table#insert</a>.</p><p>Note: The file type will be inferred by the given file&#39;s extension. If you wish to override this, you must provide <code>metadata.format</code>.</p>
	**/
	@:overload(function(source:haxe.extern.EitherType<gcloud.storage.File, String>, callback:js.Error -> gcloud.bigquery.Job -> Dynamic -> Void):Void { })
	@:native("import")
	function import_(source:haxe.extern.EitherType<gcloud.storage.File, String>, metadata:{ /**
		<ul> <li>The format the data being imported is in. Allowed options are &quot;CSV&quot;, &quot;JSON&quot;, or &quot;AVRO&quot;.</li> </ul> 
	**/
	var format : String; }, callback:js.Error -> gcloud.bigquery.Job -> Dynamic -> Void):Void;
	/**
		<p>Stream data into BigQuery one record at a time without running a load job.</p><p>There are more strict quota limits using this method so it is highly recommended that you load data into BigQuery using <a data-custom-type="bigquery/table" data-method="import">bigquery/table#import</a> instead.</p>
	**/
	@:overload(function(rows:haxe.extern.EitherType<Array<Dynamic>, Dynamic>, callback:js.Error -> Array<Dynamic> -> Dynamic -> Void):Void { })
	function insert(rows:haxe.extern.EitherType<Array<Dynamic>, Dynamic>, options:{ /**
		<ul> <li>Accept rows that contain values that do not match the schema. The unknown values are ignored.  Default: <code>false</code>.</li> </ul> 
	**/
	var ignoreUnknownValues : Bool; /**
		<ul> <li>If <code>true</code>, the <code>rows</code> argument is expected to be formatted as according to the  <a href="https://cloud.google.com/bigquery/docs/reference/v2/tabledata/insertAll">specification</a>.</li> </ul> 
	**/
	var raw : Bool; /**
		<ul> <li>Insert all valid rows of a request, even if invalid rows exist. Default: <code>false</code>.</li> </ul> 
	**/
	var skipInvalidRows : Bool; /**
		<ul> <li>Treat the destination table as a base template, and insert the rows into an instance table named  &quot;{destination}{templateSuffix}&quot;. BigQuery will manage creation of  the instance table, using the schema of the base template table. See  <a href="https://cloud.google.com/bigquery/streaming-data-into-bigquery#template-tables">Automatic table creation using template tables</a>  for considerations when working with templates tables.</li> </ul> 
	**/
	var templateSuffix : String; }, callback:js.Error -> Array<Dynamic> -> Dynamic -> Void):Void;
	/**
		<p>Run a query scoped to your dataset.</p><p>See <a data-custom-type="bigquery" data-method="query">bigquery#query</a> for full documentation of this method.</p>
	**/
	function query():Void;
	/**
		<p>Set the metadata on the table.</p>
	**/
	function setMetadata(metadata:{ /**
		<ul> <li>A user-friendly description of the table.</li> </ul> 
	**/
	var description : String; /**
		<ul> <li>A descriptive name for the table.</li> </ul> 
	**/
	var name : String; /**
		<ul> <li>A comma-separated list of name:type pairs. Valid types are &quot;string&quot;, &quot;integer&quot;, &quot;float&quot;, &quot;boolean&quot;, and  &quot;timestamp&quot;. If the type is omitted, it is assumed to be &quot;string&quot;.  Example: &quot;name:string, age:integer&quot;. Schemas can also be specified as a  JSON array of fields, which allows for nested and repeated fields. See  a <a href="http://goo.gl/sl8Dmg">Table resource</a> for more detailed information.</li> </ul> 
	**/
	var schema : haxe.extern.EitherType<Dynamic, String>; }, callback:js.Error -> Dynamic -> Void):Void;
}