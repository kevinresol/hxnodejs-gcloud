package gcloud;
@:jsRequire("gcloud", "bigquery") extern class BigQuery {
	/**
		<p>The examples below will demonstrate the different usage patterns your app may need to support to retrieve a BigQuery object.</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a dataset.</p>
	**/
	@:overload(function(id:String, callback:js.Error -> gcloud.bigquery.Dataset -> Dynamic -> Void):Void { })
	function createDataset(id:String, options:Dynamic, callback:js.Error -> gcloud.bigquery.Dataset -> Dynamic -> Void):Void;
	/**
		<p>Create a reference to a dataset.</p>
	**/
	function dataset(id:String):gcloud.bigquery.Dataset;
	/**
		<p>List all or some of the datasets in your project.</p>
	**/
	@:overload(function(callback:js.Error -> Array<gcloud.bigquery.Dataset> -> Dynamic -> Dynamic -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(query:{ /**
		<ul> <li>List all datasets, including hidden ones.</li> </ul> 
	**/
	var all : Bool; /**
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
	var pageToken : String; }):Void { })
	function getDatasets(query:{ /**
		<ul> <li>List all datasets, including hidden ones.</li> </ul> 
	**/
	var all : Bool; /**
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
	var pageToken : String; }, callback:js.Error -> Array<gcloud.bigquery.Dataset> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get all of the jobs from your project.</p>
	**/
	@:overload(function(callback:js.Error -> Array<gcloud.bigquery.Job> -> Dynamic -> Dynamic -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(options:{ /**
		<ul> <li>Display jobs owned by all users in the project.</li> </ul> 
	**/
	@:optional
	var allUsers : Bool; /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	@:optional
	var maxResults : Float; /**
		<ul> <li>Token returned from a previous call, to request the next page of results.</li> </ul> 
	**/
	@:optional
	var pageToken : String; /**
		<ul> <li>Restrict information returned to a set of selected fields. Acceptable values are &quot;full&quot;, for all job data, and  &quot;minimal&quot;, to not include the job configuration.</li> </ul> 
	**/
	@:optional
	var projection : String; /**
		<ul> <li>Filter for job state. Acceptable values are &quot;done&quot;, &quot;pending&quot;, and &quot;running&quot;.</li> </ul> 
	**/
	@:optional
	var stateFilter : String; }):Void { })
	function getJobs(options:{ /**
		<ul> <li>Display jobs owned by all users in the project.</li> </ul> 
	**/
	@:optional
	var allUsers : Bool; /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	@:optional
	var maxResults : Float; /**
		<ul> <li>Token returned from a previous call, to request the next page of results.</li> </ul> 
	**/
	@:optional
	var pageToken : String; /**
		<ul> <li>Restrict information returned to a set of selected fields. Acceptable values are &quot;full&quot;, for all job data, and  &quot;minimal&quot;, to not include the job configuration.</li> </ul> 
	**/
	@:optional
	var projection : String; /**
		<ul> <li>Filter for job state. Acceptable values are &quot;done&quot;, &quot;pending&quot;, and &quot;running&quot;.</li> </ul> 
	**/
	@:optional
	var stateFilter : String; }, callback:js.Error -> Array<gcloud.bigquery.Job> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a reference to an existing job.</p>
	**/
	function job(id:String):gcloud.bigquery.Job;
	/**
		<p>Run a query scoped to your project.</p><p>If you provide a callback, this method returns the results from your query to it. When querying large sets of data, it is possible your results won&#39;t be returned all at once. In those cases, you will receive a third argument to your callback that can be passed back to this method to return more results.</p><p>See the examples below for such a workflow.</p><p>This method also runs as a readable stream if you do not provide a callback. In cases where more results exist, this will automatically run the subsequent queries for you, pushing each row to the stream.</p>
	**/
	@:overload(function(options:haxe.extern.EitherType<{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to read.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A query string, following the BigQuery query syntax, of the query to execute.</li> </ul> 
	**/
	var query : String; /**
		<ul> <li>How long to wait for the query to complete, in milliseconds, before returning. Default is to return  immediately. If the timeout passes before the job completes, the request  will fail with a <code>TIMEOUT</code> error.</li> </ul> 
	**/
	var timeoutMs : Float; }, String>):Void { })
	function query(options:haxe.extern.EitherType<{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to read.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A query string, following the BigQuery query syntax, of the query to execute.</li> </ul> 
	**/
	var query : String; /**
		<ul> <li>How long to wait for the query to complete, in milliseconds, before returning. Default is to return  immediately. If the timeout passes before the job completes, the request  will fail with a <code>TIMEOUT</code> error.</li> </ul> 
	**/
	var timeoutMs : Float; }, String>, callback:js.Error -> Array<Dynamic> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Run a query as a job. No results are immediately returned. Instead, your callback will be executed with a <a data-custom-type="bigquery/job" data-method="">bigquery/job</a> object that you must ping for the results. See the Job documentation for explanations of how to check on the status of the job.</p>
	**/
	function startQuery(options:haxe.extern.EitherType<String, { /**
		<ul> <li>The table to save the query&#39;s results to. If omitted, a new table will be created.</li> </ul> 
	**/
	@:optional
	var destination : gcloud.bigquery.Table; /**
		<ul> <li>A query string, following the BigQuery query syntax, of the query to execute.</li> </ul> 
	**/
	var query : String; }>, callback:js.Error -> gcloud.bigquery.Job -> Dynamic -> Void):Void;
}