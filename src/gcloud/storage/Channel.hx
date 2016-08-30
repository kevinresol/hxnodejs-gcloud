package gcloud.storage;
@:jsRequire("google-cloud", "storage.channel") extern class Channel {
	/**
		<p>Create a channel object to interact with a Google Cloud Storage channel.</p>
	**/
	@:selfCall
	function new(id:String, resourceId:String);
	/**
		<p>Stop this channel.</p>
	**/
	function stop(callback:js.Error -> Dynamic -> Void):Void;
}