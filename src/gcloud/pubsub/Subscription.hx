package gcloud.pubsub;
@:jsRequire("google-cloud", "pubsub.subscription") extern class Subscription {
	/**
		<p>A Subscription object will give you access to your Google Cloud Pub/Sub subscription.</p><p>Subscriptions are sometimes retrieved when using various methods:</p><ul> <li><a data-custom-type="pubsub" data-method="getSubscriptions">pubsub#getSubscriptions</a></li> <li><a data-custom-type="pubsub/topic" data-method="getSubscriptions">pubsub/topic#getSubscriptions</a></li> <li><a data-custom-type="pubsub/topic" data-method="subscribe">pubsub/topic#subscribe</a></li> </ul> <p>Subscription objects may be created directly with:</p><ul> <li><a data-custom-type="pubsub/topic" data-method="subscription">pubsub/topic#subscription</a></li> </ul> <p>All Subscription objects are instances of an <a href="http://nodejs.org/api/events.html">EventEmitter</a>. The subscription will pull for messages automatically as long as there is at least one listener assigned for the <code>message</code> event.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Check if the subscription exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a subscription if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p><p><strong><code>autoCreate</code> is only available if you accessed this object through <a data-custom-type="pubsub/topic" data-method="subscription">pubsub/topic#subscription</a>.</strong></p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the metadata for the subscription.</p>
	**/
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Create a subscription.</p><p><strong>This is only available if you accessed this object through <a data-custom-type="pubsub/topic" data-method="subscription">pubsub/topic#subscription</a>.</strong></p>
	**/
	function create(config:Dynamic):Void;
	/**
		<p><a href="https://cloud.google.com/pubsub/access_control">IAM (Identity and Access Management)</a> allows you to set permissions on individual resources and offers a wider range of roles: editor, owner, publisher, subscriber, and viewer. This gives you greater flexibility and allows you to set more fine-grained access control.</p><p><em>The IAM access control features described in this document are Beta, including the API methods to get and set IAM policies, and to test IAM permissions. Google Cloud Pub/Sub&#39;s use of IAM features is not covered by any SLA or deprecation policy, and may be subject to backward-incompatible changes.</em></p>
	**/
	function iam():Void;
	/**
		<p>Acknowledge to the backend that the message was retrieved. You must provide either a single ackId or an array of ackIds.</p>
	**/
	@:overload(function(ackIds:haxe.extern.EitherType<Array<String>, String>):Void { })
	function ack(ackIds:haxe.extern.EitherType<Array<String>, String>, callback:Void -> Dynamic):Void;
	/**
		<p>Delete the subscription. Pull requests from the current subscription will be errored once unsubscription is complete.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Pull messages from the subscribed topic. If messages were found, your callback is executed with an array of message objects.</p><p>Note that messages are pulled automatically once you register your first event listener to the subscription, thus the call to <code>pull</code> is handled for you. If you don&#39;t want to start pulling, simply don&#39;t register a <code>subscription.on(&#39;message&#39;, function() {})</code> event handler.</p>
	**/
	@:overload(function(callback:Void -> Dynamic):Void { })
	function pull(options:{ /**
		<ul> <li>Limit the amount of messages pulled.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>If set, the system will respond immediately. Otherwise, wait until new messages are available. Returns if  timeout is reached.</li> </ul> 
	**/
	var returnImmediately : Bool; }, callback:Void -> Dynamic):Void;
	/**
		<p>Modify the ack deadline for a specific message. This method is useful to indicate that more time is needed to process a message by the subscriber, or to make the message available for redelivery if the processing was interrupted.</p>
	**/
	@:overload(function(options:{ /**
		<ul> <li>The ack id(s) to change.</li> </ul> 
	**/
	var ackIds : haxe.extern.EitherType<Array<String>, String>; /**
		<ul> <li>Number of seconds after call is made to set the deadline of the ack.</li> </ul> 
	**/
	var seconds : Float; }):Void { })
	function setAckDeadline(options:{ /**
		<ul> <li>The ack id(s) to change.</li> </ul> 
	**/
	var ackIds : haxe.extern.EitherType<Array<String>, String>; /**
		<ul> <li>Number of seconds after call is made to set the deadline of the ack.</li> </ul> 
	**/
	var seconds : Float; }, callback:Void -> Dynamic):Void;
}