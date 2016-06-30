package gcloud.pubsub;
@:jsRequire("gcloud.pubsub.topic") extern class Topic {
	/**
		<p>A Topic object allows you to interact with a Google Cloud Pub/Sub topic.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Create a topic.</p>
	**/
	@:overload(function():Void { })
	function create(config:Dynamic):Void;
	/**
		<p>Delete the topic. This will not delete subscriptions to this topic.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:Void -> Dynamic):Void;
	/**
		<p>Check if the topic exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a topic if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the official representation of this topic from the API.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p><a href="https://cloud.google.com/pubsub/access_control">IAM (Identity and Access Management)</a> allows you to set permissions on individual resources and offers a wider range of roles: editor, owner, publisher, subscriber, and viewer. This gives you greater flexibility and allows you to set more fine-grained access control.</p><p><em>The IAM access control features described in this document are Beta, including the API methods to get and set IAM policies, and to test IAM permissions. Google Cloud Pub/Sub&#39;s use of IAM features is not covered by any SLA or deprecation policy, and may be subject to backward-incompatible changes.</em></p>
	**/
	function iam():Void;
	/**
		<p>Get a list of the subscriptions registered to this topic. You may optionally provide a query object as the first argument to customize the response.</p><p>Your provided callback will be invoked with an error object if an API error occurred or an array of <a data-custom-type="pubsub/subscription" data-method="">pubsub/subscription</a> objects.</p>
	**/
	@:overload(function(callback:Void -> Dynamic):Void { })
	function getSubscriptions(options:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>Maximum number of results to return.</li> </ul> 
	**/
	var pageSize : Float; /**
		<ul> <li>Page token.</li> </ul> 
	**/
	var pageToken : String; }, callback:Void -> Dynamic):Void;
	/**
		<p>Publish the provided message or array of messages. On success, an array of messageIds is returned in the response.</p>
	**/
	@:overload(function(message:haxe.extern.EitherType<Array<{ /**
		<ul> <li>The contents of the message.</li> </ul> 
	**/
	var data : Dynamic; /**
		<ul> <li>Key/value pair of attributes to apply to the message. All values must be strings.</li> </ul> 
	**/
	@:optional
	var attributes : Array<Dynamic>; }>, { /**
		<ul> <li>The contents of the message.</li> </ul> 
	**/
	var data : Dynamic; /**
		<ul> <li>Key/value pair of attributes to apply to the message. All values must be strings.</li> </ul> 
	**/
	@:optional
	var attributes : Array<Dynamic>; }>):Void { })
	function publish(message:haxe.extern.EitherType<Array<{ /**
		<ul> <li>The contents of the message.</li> </ul> 
	**/
	var data : Dynamic; /**
		<ul> <li>Key/value pair of attributes to apply to the message. All values must be strings.</li> </ul> 
	**/
	@:optional
	var attributes : Array<Dynamic>; }>, { /**
		<ul> <li>The contents of the message.</li> </ul> 
	**/
	var data : Dynamic; /**
		<ul> <li>Key/value pair of attributes to apply to the message. All values must be strings.</li> </ul> 
	**/
	@:optional
	var attributes : Array<Dynamic>; }>, callback:Void -> Dynamic):Void;
	/**
		<p>Create a subscription to this topic. You may optionally provide an object to customize the subscription.</p><p>Your provided callback will be invoked with an error object if an API error occurred or a <a data-custom-type="pubsub/subscription" data-method="">pubsub/subscription</a> object.</p>
	**/
	@:overload(function(subName:String, callback:Void -> Dynamic):Void { })
	function subscribe(subName:String, options:{ /**
		<ul> <li>The maximum time after receiving a message that you must ack a message before it is redelivered.</li> </ul> 
	**/
	@:optional
	var ackDeadlineSeconds : Float; /**
		<ul> <li>Automatically acknowledge the message once it&#39;s pulled. (default: false)</li> </ul> 
	**/
	@:optional
	var autoAck : Bool; /**
		<ul> <li>When pulling for messages, this type is used when converting a message&#39;s data to a string. (default: &#39;utf-8&#39;)</li> </ul> 
	**/
	var encoding : String; /**
		<ul> <li>Interval in milliseconds to check for new messages. (default: 10)</li> </ul> 
	**/
	@:optional
	var interval : Float; /**
		<ul> <li>Maximum messages to consume simultaneously.</li> </ul> 
	**/
	var maxInProgress : Float; /**
		<ul> <li>If the subscription already exists, reuse it. The options of the existing subscription are not changed. If  false, attempting to create a subscription that already exists will fail.  (default: false)</li> </ul> 
	**/
	@:optional
	var reuseExisting : Bool; /**
		<ul> <li>Set a maximum amount of time in milliseconds on an HTTP request to pull new messages to wait for a  response before the connection is broken.</li> </ul> 
	**/
	var timeout : Float; }, callback:Void -> Dynamic):Void;
	/**
		<p>Create a Subscription object. This command by itself will not run any API requests. You will receive a <a data-custom-type="pubsub/subscription" data-method="">pubsub/subscription</a> object, which will allow you to interact with a subscription.</p>
	**/
	@:overload(function(name:String):gcloud.pubsub.Subscription { })
	function subscription(name:String, options:{ /**
		<ul> <li>Automatically acknowledge the message once it&#39;s pulled.</li> </ul> 
	**/
	@:optional
	var autoAck : Bool; /**
		<ul> <li>Interval in milliseconds to check for new messages.</li> </ul> 
	**/
	@:optional
	var interval : Float; }):gcloud.pubsub.Subscription;
}