package gcloud;
@:jsRequire("gcloud", "storage") extern class Storage {
	/**
		<p>To access your Cloud Storage buckets, you will use the <code>bucket</code> function returned from this <code>storage</code> object.</p><p>The examples below will demonstrate the different usage patterns your app may need to connect to <code>gcloud</code> and access your bucket.</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Google Cloud Storage uses access control lists (ACLs) to manage object and bucket access. ACLs are the mechanism you use to share objects with other users and allow other users to access your buckets and objects.</p><p>This object provides constants to refer to the three permission levels that can be granted to an entity:</p><ul> <li><code>gcs.acl.OWNER_ROLE</code> - (&quot;OWNER&quot;)</li> <li><code>gcs.acl.READER_ROLE</code> - (&quot;READER&quot;)</li> <li><code>gcs.acl.WRITER_ROLE</code> - (&quot;WRITER&quot;)</li> </ul> 
	**/
	function acl():Void;
	/**
		<p>Get a reference to a Google Cloud Storage bucket.</p>
	**/
	function bucket(name:haxe.extern.EitherType<String, Dynamic>):gcloud.storage.Bucket;
	/**
		<p>Reference a channel to receive notifications about changes to your bucket.</p>
	**/
	function channel(id:String, resourceId:String):gcloud.storage.Channel;
	/**
		<p>Create a bucket.</p><p>Google Cloud Storage uses a flat namespace, so you can&#39;t create a bucket with a name that is already in use. For more information, see <a href="https://cloud.google.com/storage/docs/bucketnaming.html#requirements">Bucket Naming Guidelines</a>.</p>
	**/
	@:overload(function(name:String, callback:js.Error -> gcloud.storage.Bucket -> Dynamic -> Void):Void { })
	function createBucket(name:String, metadata:{ /**
		<ul> <li>Specify the storage class as <a href="https://goo.gl/26lthK">Durable Reduced Availability</a>.</li> </ul> 
	**/
	@:optional
	var dra : Bool; /**
		<ul> <li>Specify the storage class as <a href="https://goo.gl/sN5wNh">Nearline</a>.</li> </ul> 
	**/
	@:optional
	var nearline : Bool; }, callback:js.Error -> gcloud.storage.Bucket -> Dynamic -> Void):Void;
	/**
		<p>Get Bucket objects for all of the buckets in your project.</p>
	**/
	@:overload(function(callback:js.Error -> Array<gcloud.storage.Bucket> -> Dynamic -> Dynamic -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(query:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of items plus prefixes to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }):Void { })
	function getBuckets(query:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of items plus prefixes to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; }, callback:js.Error -> Array<gcloud.storage.Bucket> -> Dynamic -> Dynamic -> Void):Void;
}