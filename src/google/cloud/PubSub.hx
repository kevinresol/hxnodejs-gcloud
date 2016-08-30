package google.cloud;
@:jsRequire("google-cloud", "pubsub") extern class PubSub {
	/**
		<p><a href="https://developers.google.com/pubsub/overview">Google Cloud Pub/Sub</a> is a reliable, many-to-many, asynchronous messaging service from Google Cloud Platform.</p><p>The <code>PUBSUB_EMULATOR_HOST</code> environment variable from the gcloud SDK is honored, otherwise the actual API endpoint will be used.</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Create a topic with the given name.</p>
	**/
	@:overload(function(name:String):Void { })
	function createTopic(name:String, callback:js.Error -> google.cloud.pubsub.Topic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of the subscriptions registered to all of your project&#39;s topics. You may optionally provide a query object as the first argument to customize the response.</p><p>Your provided callback will be invoked with an error object if an API error occurred or an array of <a data-custom-type="pubsub/subscription" data-method="">pubsub/subscription</a> objects.</p><p>To get subscriptions for a topic, see <a data-custom-type="pubsub/topic" data-method="">pubsub/topic</a>.</p>
	**/
	@:overload(function(callback:js.Error -> Array<google.cloud.pubsub.Subscription> -> Dynamic -> Dynamic -> Void):Void { })
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
	var pageToken : String; /**
		<ul> <li>The name of the topic to list subscriptions from.</li> </ul> 
	**/
	var topic : haxe.extern.EitherType<google.cloud.pubsub.Topic, String>; }, callback:js.Error -> Array<google.cloud.pubsub.Subscription> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Get a list of the topics registered to your project. You may optionally provide a query object as the first argument to customize the response.</p>
	**/
	@:overload(function(callback:js.Error -> Array<google.cloud.pubsub.Topic> -> Dynamic -> Dynamic -> Void):Void { })
	function getTopics(query:{ /**
		<ul> <li>Max number of results to return.</li> </ul> 
	**/
	var pageSize : Float; /**
		<ul> <li>Page token.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Array<google.cloud.pubsub.Topic> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a subscription to a topic. You may optionally provide an object to customize the subscription.</p><p>Your provided callback will be invoked with an error object if an API error occurred or a <a data-custom-type="pubsub/subscription" data-method="">pubsub/subscription</a> object.</p>
	**/
	@:overload(function(topic:haxe.extern.EitherType<String, google.cloud.pubsub.Topic>, subName:String, callback:js.Error -> google.cloud.pubsub.Subscription -> Dynamic -> Void):Void { })
	function subscribe(topic:haxe.extern.EitherType<String, google.cloud.pubsub.Topic>, subName:String, options:{ /**
		<ul> <li>The maximum time after receiving a message that you must ack a message before it is redelivered.</li> </ul> 
	**/
	var ackDeadlineSeconds : Float; /**
		<ul> <li>Automatically acknowledge the message once it&#39;s pulled. (default: false)</li> </ul> 
	**/
	var autoAck : Bool; /**
		<ul> <li>When pulling for messages, this type is used when converting a message&#39;s data to a string. (default: &#39;utf-8&#39;)</li> </ul> 
	**/
	var encoding : String; /**
		<ul> <li>Interval in milliseconds to check for new messages. (default: 10)</li> </ul> 
	**/
	var interval : Float; /**
		<ul> <li>Maximum messages to consume simultaneously.</li> </ul> 
	**/
	var maxInProgress : Float; /**
		<ul> <li>If the subscription already exists, reuse it. The options of the existing subscription are not changed. If  false, attempting to create a subscription that already exists will fail.  (default: false)</li> </ul> 
	**/
	var reuseExisting : Bool; /**
		<ul> <li>Set a maximum amount of time in milliseconds on an HTTP request to pull new messages to wait for a  response before the connection is broken.</li> </ul> 
	**/
	var timeout : Float; }, callback:js.Error -> google.cloud.pubsub.Subscription -> Dynamic -> Void):Void;
	/**
		<p>Create a Subscription object. This command by itself will not run any API requests. You will receive a <a data-custom-type="pubsub/subscription" data-method="">pubsub/subscription</a> object, which will allow you to interact with a subscription.</p>
	**/
	@:overload(function(name:String):google.cloud.pubsub.Subscription { })
	function subscription(name:String, options:{ /**
		<ul> <li>Automatically acknowledge the message once it&#39;s pulled. (default: false)</li> </ul> 
	**/
	var autoAck : Bool; /**
		<ul> <li>When pulling for messages, this type is used when converting a message&#39;s data to a string. (default: &#39;utf-8&#39;)</li> </ul> 
	**/
	var encoding : String; /**
		<ul> <li>Interval in milliseconds to check for new messages. (default: 10)</li> </ul> 
	**/
	var interval : Float; /**
		<ul> <li>Maximum messages to consume simultaneously.</li> </ul> 
	**/
	var maxInProgress : Float; /**
		<ul> <li>Set a maximum amount of time in milliseconds on an HTTP request to pull new messages to wait for a  response before the connection is broken.</li> </ul> 
	**/
	var timeout : Float; }):google.cloud.pubsub.Subscription;
	/**
		<p>Create a Topic object. See <a data-custom-type="pubsub/createTopic" data-method="">pubsub/createTopic</a> to create a topic.</p>
	**/
	function topic(name:String):google.cloud.pubsub.Topic;
}