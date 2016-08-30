package gcloud;
@:jsRequire("google-cloud", "resource") extern class Resource {
	/**
		<p class="notice">  <strong>This is a Beta release of Cloud Resource Manager.</strong> This feature is not  covered by any SLA or deprecation policy and may be subject to  backward-incompatible changes. </p> <p><a href="https://cloud.google.com/resource-manager/">The Cloud Resource Manager</a> provides methods that you can use to programmatically manage your projects in the Google Cloud Platform. With this API, you can do the following:</p><ul> <li>Get a list of all projects associated with an account.</li> <li>Create new projects.</li> <li>Update existing projects.</li> <li>Delete projects.</li> <li>Recover projects.</li> </ul> 
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a project.</p><p><strong>This method only works if you are authenticated as yourself, e.g. using the gcloud SDK.</strong></p>
	**/
	@:overload(function(name:String, callback:js.Error -> gcloud.resource.Project -> Dynamic -> Void):Void { })
	@:overload(function(name:String):Void { })
	@:overload(function(name:String, options:Dynamic):Void { })
	function createProject(name:String, options:Dynamic, callback:js.Error -> gcloud.resource.Project -> Dynamic -> Void):Void;
	/**
		<p>Get a list of projects.</p>
	**/
	@:overload(function(callback:js.Error -> gcloud.resource.Project -> Dynamic -> Dynamic -> Void):Void { })
	function getProjects(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>An expression for filtering the results.</li> </ul> 
	**/
	var filter : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>Maximum number of projects to return.</li> </ul> 
	**/
	var pageSize : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> gcloud.resource.Project -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a Project object. See <a data-custom-type="resoucemanager/createProject" data-method="">resoucemanager/createProject</a> to create a project.</p>
	**/
	function project(id:String):gcloud.resource.Project;
}