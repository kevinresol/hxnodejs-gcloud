package gcloud;
@:jsRequire("google-cloud") extern class gcloud {
	/**
		<p>Analyze Big Data in the cloud with <a href="https://cloud.google.com/bigquery">Google BigQuery</a>. Run fast, SQL-like queries against multi-terabyte datasets in seconds. Scalable and easy to use, BigQuery gives you real-time insights about your data.</p>
	**/
	function bigquery():gcloud.BigQuery;
	/**
		<p><a href="https://cloud.google.com/bigtable/">Cloud Bigtable</a> is Google&#39;s NoSQL Big Data database service. It&#39;s the same database that powers many core Google services, including Search, Analytics, Maps, and Gmail.</p>
	**/
	function bigtable():gcloud.Bigtable;
	/**
		<p>With <a href="https://cloud.google.com/compute/">Compute Engine</a>, you can run large-scale workloads on virtual machines hosted on Google&#39;s infrastructure. Choose a VM that fits your needs and gain the performance of Google’s worldwide fiber network.</p>
	**/
	function compute():gcloud.Compute;
	/**
		<p><a href="https://developers.google.com/datastore/">Google Cloud Datastore</a> is a fully managed, schemaless database for storing non-relational data. Use this object to create a Dataset to interact with your data, an &quot;Int&quot;, and a &quot;Double&quot; representation.</p>
	**/
	function datastore():gcloud.Datastore;
	/**
		<p><a href="https://cloud.google.com/dns/what-is-cloud-dns">Google Cloud DNS</a> is a high-performance, resilient, global DNS service that provides a cost- effective way to make your applications and services available to your users. This programmable, authoritative DNS service can be used to easily publish and manage DNS records using the same infrastructure relied upon by Google.</p>
	**/
	function dns():gcloud.DNS;
	/**
		<p>The <a href="https://cloud.google.com/natural-language/docs">Google Cloud Natural Language</a> API provides natural language understanding technologies to developers, including sentiment analysis, entity recognition, and syntax analysis.</p><p class="notice">  <strong>This is a Beta release of Google Cloud Natural Language.</strong> This API is  not covered by any SLA or deprecation policy and may be subject to  backward-incompatible changes. </p>
	**/
	function language():gcloud.Language;
	/**
		<p><a href="https://cloud.google.com/logging/docs">Google Cloud Logging</a> collects and stores logs from applications and services on the Google Cloud Platform:</p><ul> <li>Export your logs to Google Cloud Storage, Google BigQuery, or Google Cloud Pub/Sub.</li> <li>Integrate third-party logs from your virtual machine instances by installing the logging agent, <code>google-fluentd</code>.</li> </ul> <p class="notice">  <strong>This is a Beta release of Google Cloud Logging.</strong> This API is not  covered by any SLA or deprecation policy and may be subject to backward-  incompatible changes. </p>
	**/
	function logging():gcloud.Logging;
	/**
		<p>The <a href="https://cloud.google.com/prediction/docs/getting-started">Google Prediction API</a> provides pattern-matching and machine learning capabilities. Given a set of data examples to train against, you can create applications that can perform the following tasks:</p><ul> <li>Given a user&#39;s past viewing habits, predict what other movies or products a user might like.</li> <li>Categorize emails as spam or non-spam.</li> <li>Analyze posted comments about your product to determine whether they have a positive or negative tone.</li> <li>Guess how much a user might spend on a given day, given his spending history.</li> </ul> 
	**/
	function prediction():gcloud.Prediction;
	/**
		<p><a href="https://developers.google.com/pubsub/overview">Google Cloud Pub/Sub</a> is a reliable, many-to-many, asynchronous messaging service from Google Cloud Platform.</p>
	**/
	function pubsub():gcloud.PubSub;
	/**
		<p><a href="https://cloud.google.com/resource-manager/">The Cloud Resource Manager</a> provides methods that you can use to programmatically manage your projects in the Google Cloud Platform. With this API, you can do the following:</p><ul> <li>Get a list of all projects associated with an account.</li> <li>Create new projects.</li> <li>Update existing projects.</li> <li>Delete projects.</li> <li>Recover projects.</li> </ul> <p class="notice">  <strong>This is a Beta release of Cloud Resource Manager.</strong> This feature is not  covered by any SLA or deprecation policy and may be subject to backward-  incompatible changes. </p>
	**/
	function resource():gcloud.Resource;
	/**
		<p>Google Cloud Storage allows you to store data on Google infrastructure. Read <a href="https://developers.google.com/storage">Google Cloud Storage API docs</a> for more information.</p>
	**/
	function storage():gcloud.Storage;
	/**
		<p>With <a href="https://cloud.google.com/translate">Google Translate</a>, you can dynamically translate text between thousands of language pairs.</p><p>The Google Translate API lets websites and programs integrate with Google Translate programmatically.</p><p>Google Translate API is available as a paid service. See the <a href="https://cloud.google.com/translate/v2/pricing.html">Pricing</a> and <a href="https://cloud.google.com/translate/v2/faq.html">FAQ</a> pages for details.</p><p><strong>An API key is required for Translate.</strong> See <a href="https://cloud.google.com/translate/v2/using_rest#auth">Identifying your application to Google</a>.</p>
	**/
	function translate():gcloud.Translate;
	/**
		<p>The <a href="https://cloud.google.com/vision/docs">Cloud Vision API</a> allows easy integration of vision detection features, including image labeling, face and landmark detection, optical character recognition (OCR), and tagging of explicit content.</p><p class="notice">  <strong>This is a Beta release of Google Cloud Vision.</strong> This API is not  covered by any SLA or deprecation policy and may be subject to backward-  incompatible changes. </p> <p>To learn more about the Vision API, see the <a href="https://cloud.google.com/vision/docs/getting-started">Getting Started guide</a>.</p>
	**/
	function vision():Void;
	/**
		<p>There are two key ways to use the <code>gcloud</code> module.</p><ol> <li><p>Provide connection &amp; configuration details up-front.</p></li> <li><p>Provide them at the time of instantiation of sub-modules, e.g. a Datastore dataset, a Cloud Storage bucket, etc.</p></li> </ol> <h3>Advanced Usage</h3> <h4>Interceptors</h4> <p>All of the returned modules hold a special <code>interceptors</code> array you can use to have control over the flow of the internal operations of this library. As of now, we support a request interceptor, allowing you to tweak all of the API request options before the HTTP request is sent.</p><p>Note: If you are using the <code>maxApiCalls</code> option with a method, your request interceptor will still be called, even if the <code>maxApiCalls</code> limit was reached. The request to the API will still be prevented.</p><p>See the example below for more.</p>
	**/
	@:selfCall
	function new(config:{ /**
		<ul> <li>The project ID from the Google Developer&#39;s Console. E.g. &#39;purple-grape-123&#39;.</li> </ul> 
	**/
	var projectId : String; /**
		<ul> <li>Full path to the a .json, .pem, or .p12 key downloaded from the Google Developers Console. NOTE: .pem and .p12  require you to specify <code>config.email</code> as well.</li> </ul> 
	**/
	@:optional
	var keyFilename : String; /**
		<ul> <li>Account email address. Required when using a .pem or .p12 keyFilename.</li> </ul> 
	**/
	@:optional
	var email : String; /**
		<ul> <li>Credentials object.</li> </ul> 
	**/
	@:optional
	var credentials : { var client_email : String; var private_key : String; }; /**
		<ul> <li>Automatically retry requests if the response is related to rate limits or certain intermittent server errors.  We will exponentially backoff subsequent requests by default. (default:  true)</li> </ul> 
	**/
	@:optional
	var autoRetry : Bool; /**
		<ul> <li>Maximum number of automatic retries attempted before returning the error. (default: 3)</li> </ul> 
	**/
	@:optional
	var maxRetries : Float; });
}