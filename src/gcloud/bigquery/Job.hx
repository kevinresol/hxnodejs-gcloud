package gcloud.bigquery;
@:jsRequire("gcloud.bigquery.job") extern class Job {
	/**
		<p>Job objects are returned from various places in the BigQuery API:</p><ul> <li><a data-custom-type="bigquery" data-method="getJobs">bigquery#getJobs</a></li> <li><a data-custom-type="bigquery" data-method="job">bigquery#job</a></li> <li><a data-custom-type="bigquery" data-method="query">bigquery#query</a></li> <li><a data-custom-type="bigquery" data-method="startJob">bigquery#startJob</a></li> <li><a data-custom-type="bigquery/table" data-method="copy">bigquery/table#copy</a></li> <li><a data-custom-type="bigquery/table" data-method="createWriteStream">bigquery/table#createWriteStream</a></li> <li><a data-custom-type="bigquery/table" data-method="export">bigquery/table#export</a></li> <li><a data-custom-type="bigquery/table" data-method="import">bigquery/table#import</a></li> </ul> <p>They can be used to check the status of a running job or fetching the results of a previously-executed one.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Check if the job exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a job if it exists.</p>
	**/
	function get():Void;
	/**
		<p>Get the metadata of the job. This will mostly be useful for checking the status of a previously-run job.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Cancel a job. Use <a data-custom-type="bigquery/job" data-method="getMetadata">bigquery/job#getMetadata</a> to see if the cancel completes successfully. See an example implementation below.</p>
	**/
	@:overload(function():Void { })
	function cancel(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Get the results of a job.</p>
	**/
	@:overload(function(callback:js.Error -> Array<Dynamic> -> Dynamic -> Dynamic -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to read.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>Page token, returned by a previous call, to request the next page of results. Note: This is automatically added to  the <code>nextQuery</code> argument of your callback.</li> </ul> 
	**/
	var pageToken : String; /**
		<ul> <li>Zero-based index of the starting row.</li> </ul> 
	**/
	var startIndex : Float; /**
		<ul> <li>How long to wait for the query to complete, in milliseconds, before returning. Default is to return  immediately. If the timeout passes before the job completes, the request  will fail with a <code>TIMEOUT</code> error.</li> </ul> 
	**/
	var timeoutMs : Float; }):Void { })
	function getQueryResults(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to read.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>Page token, returned by a previous call, to request the next page of results. Note: This is automatically added to  the <code>nextQuery</code> argument of your callback.</li> </ul> 
	**/
	var pageToken : String; /**
		<ul> <li>Zero-based index of the starting row.</li> </ul> 
	**/
	var startIndex : Float; /**
		<ul> <li>How long to wait for the query to complete, in milliseconds, before returning. Default is to return  immediately. If the timeout passes before the job completes, the request  will fail with a <code>TIMEOUT</code> error.</li> </ul> 
	**/
	var timeoutMs : Float; }, callback:js.Error -> Array<Dynamic> -> Dynamic -> Dynamic -> Void):Void;
}