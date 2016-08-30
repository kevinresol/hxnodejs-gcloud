package google.cloud;
@:jsRequire("google-cloud", "prediction") extern class Prediction {
	/**
		<p>The <a href="https://cloud.google.com/prediction/docs/getting-started">Google Prediction API</a> provides pattern-matching and machine learning capabilities. Given a set of data examples to train against, you can create applications that can perform the following tasks:</p><ul> <li>Given a user&#39;s past viewing habits, predict what other movies or products a user might like.</li> <li>Categorize emails as spam or non-spam.</li> <li>Analyze posted comments about your product to determine whether they have a positive or negative tone.</li> <li>Guess how much a user might spend on a given day, given his spending history.</li> </ul> 
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a trained model.</p><p>You may optionally provide a <a data-custom-type="storage/file" data-method="">storage/file</a> as a data source to train the new model. If you have a CSV file, but haven&#39;t put it in a bucket yet, you will need to reference a bucket with <a data-custom-type="storage/bucket" data-method="">storage/bucket</a>, a file with <a data-custom-type="storage/file" data-method="">storage/file</a>, and upload it with <a data-custom-type="storage/file" data-method="upload">storage/file#upload</a>.</p>
	**/
	@:overload(function(id:String, callback:js.Error -> google.cloud.prediction.Model -> Dynamic -> Void):Void { })
	function createModel(id:String, options:{ /**
		<ul> <li>A CSV file to use as training data.</li> </ul> 
	**/
	var data : google.cloud.storage.File; /**
		<ul> <li>The type of model, <code>classification</code> (categorical, text labels) or <code>regression</code> (numeric labels). Learn more  about these options in the <a href="https://cloud.google.com/prediction/docs/developer-guide#examples">Developers Guide</a>.</li> </ul> 
	**/
	var type : String; }, callback:js.Error -> google.cloud.prediction.Model -> Dynamic -> Void):Void;
	/**
		<p>Gets a list of trained models for the project.</p>
	**/
	@:overload(function(callback:js.Error -> Array<google.cloud.prediction.Model> -> Dynamic -> Dynamic -> Void):Void { })
	function getModels(query:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>Page token.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Array<google.cloud.prediction.Model> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a model object representing a trained model.</p>
	**/
	function model(id:String):google.cloud.prediction.Model;
}