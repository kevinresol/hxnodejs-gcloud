package gcloud.storage;
@:jsRequire("gcloud", "storage.bucket") extern class Bucket {
	/**
		<p>Create a Bucket object to interact with a Google Cloud Storage bucket.</p>
	**/
	@:selfCall
	function new(options:{ /**
		<ul> <li>Name of the bucket.</li> </ul> 
	**/
	var bucketName : String; /**
		<ul> <li>Full path to the JSON key downloaded from the Google Developers Console. Alternatively, you may provide a  <code>credentials</code> object.</li> </ul> 
	**/
	@:optional
	var keyFilename : String; /**
		<ul> <li>Credentials object, used in place of a <code>keyFilename</code>.</li> </ul> 
	**/
	@:optional
	var credentials : Dynamic; });
	/**
		<p>Create a bucket.</p>
	**/
	@:overload(function():Void { })
	function create(config:Dynamic):Void;
	/**
		<p>Delete the bucket.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if the bucket exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a bucket if it exists.</p><p>You may optionally use this to &quot;get or create&quot; an object by providing an object with <code>autoCreate</code> set to <code>true</code>. Any extra configuration that is normally required for the <code>create</code> method must be contained within this object as well.</p>
	**/
	@:overload(function():Void { })
	function get(options:{ /**
		<ul> <li>Automatically create the object if it does not exist. Default: <code>false</code></li> </ul> 
	**/
	var autoCreate : Bool; }):Void;
	/**
		<p>Get the bucket&#39;s metadata.</p><p>To set metadata, see <a data-custom-type="storage/bucket" data-method="setMetadata">storage/bucket#setMetadata</a>.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Set the bucket&#39;s metadata.</p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Google Cloud Storage uses access control lists (ACLs) to manage object and bucket access. ACLs are the mechanism you use to share objects with other users and allow other users to access your buckets and objects.</p><p>An ACL consists of one or more entries, where each entry grants permissions to an entity. Permissions define the actions that can be performed against an object or bucket (for example, <code>READ</code> or <code>WRITE</code>); the entity defines who the permission applies to (for example, a specific user or group of users).</p><p>The <code>acl</code> object on a Bucket instance provides methods to get you a list of the ACLs defined on your bucket, as well as set, update, and delete them.</p><p>Buckets also have <a href="https://cloud.google.com/storage/docs/accesscontrol#default">default ACLs</a> for all created files. Default ACLs specify permissions that all new objects added to the bucket will inherit by default. You can add, delete, get, and update entities and permissions for these as well with <a data-custom-type="storage/bucket" data-method="acl.default">storage/bucket#acl.default</a>.</p>
	**/
	function acl():Void;
	/**
		<p>Combine multiple files into one new file.</p>
	**/
	@:overload(function(sources:haxe.extern.EitherType<gcloud.storage.File, Array<String>>, destination:haxe.extern.EitherType<gcloud.storage.File, String>):Void { })
	function combine(sources:haxe.extern.EitherType<gcloud.storage.File, Array<String>>, destination:haxe.extern.EitherType<gcloud.storage.File, String>, callback:js.Error -> gcloud.storage.File -> Dynamic -> Void):Void;
	/**
		<p>Create a channel that will be notified when objects in this bucket changes.</p>
	**/
	function createChannel(id:String, config:{ /**
		<ul> <li>The address where notifications are delivered for this channel.</li> </ul> 
	**/
	var address : String; }, callback:js.Error -> gcloud.storage.Channel -> Dynamic -> Void):Void;
	/**
		<p>Iterate over the bucket&#39;s files, calling <code>file.delete()</code> on each.</p><p><strong>This is not an atomic request.</strong> A delete attempt will be made for each file individually. Any one can fail, in which case only a portion of the files you intended to be deleted would have.</p><p>Operations are performed in parallel, up to 10 at once. The first error breaks the loop and will execute the provided callback with it. Specify <code>{ force: true }</code> to suppress the errors until all files have had a chance to be processed.</p><p>The <code>query</code> object passed as the first argument will also be passed to <a data-custom-type="storage/bucket" data-method="getFiles">storage/bucket#getFiles</a>.</p>
	**/
	@:overload(function(callback:haxe.extern.EitherType<Array<js.Error>, js.Error> -> Void):Void { })
	function deleteFiles(query:{ /**
		<ul> <li>Suppress errors until all files have been processed.</li> </ul> 
	**/
	var force : Bool; }, callback:haxe.extern.EitherType<Array<js.Error>, js.Error> -> Void):Void;
	/**
		<p>Create a File object. See <a data-custom-type="storage/file" data-method="">storage/file</a> to see how to handle the different use cases you may have.</p>
	**/
	@:overload(function(name:String):gcloud.storage.File { })
	function file(name:String, options:{ /**
		<ul> <li>Only use a specific revision of this file.</li> </ul> 
	**/
	var generation : haxe.extern.EitherType<Float, String>; /**
		<ul> <li>A custom encryption key. See <a href="https://cloud.google.com/storage/docs/encryption#customer-supplied">Customer-supplied Encryption Keys</a>.</li> </ul> 
	**/
	var key : String; }):gcloud.storage.File;
	/**
		<p>Get File objects for the files currently in the bucket.</p>
	**/
	@:overload(function(callback:js.Error -> Array<gcloud.storage.File> -> Dynamic -> Dynamic -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(query:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Results will contain only objects whose names, aside from the prefix, do not contain delimiter. Objects whose  names, aside from the prefix, contain delimiter will have their name  truncated after the delimiter, returned in <code>apiResponse.prefixes</code>.  Duplicate prefixes are omitted.</li> </ul> 
	**/
	var delimiter : String; /**
		<ul> <li>Filter results to objects whose names begin with this prefix.</li> </ul> 
	**/
	var prefix : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of items plus prefixes to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; /**
		<ul> <li>If true, returns File objects scoped to their versions.</li> </ul> 
	**/
	var versions : Bool; }):Void { })
	function getFiles(query:{ /**
		<ul> <li>Have pagination handled automatically. Default: true.</li> </ul> 
	**/
	var autoPaginate : Bool; /**
		<ul> <li>Results will contain only objects whose names, aside from the prefix, do not contain delimiter. Objects whose  names, aside from the prefix, contain delimiter will have their name  truncated after the delimiter, returned in <code>apiResponse.prefixes</code>.  Duplicate prefixes are omitted.</li> </ul> 
	**/
	var delimiter : String; /**
		<ul> <li>Filter results to objects whose names begin with this prefix.</li> </ul> 
	**/
	var prefix : String; /**
		<ul> <li>Maximum number of API calls to make.</li> </ul> 
	**/
	var maxApiCalls : Float; /**
		<ul> <li>Maximum number of items plus prefixes to return.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>A previously-returned page token representing part of the larger set of results to view.</li> </ul> 
	**/
	var pageToken : String; /**
		<ul> <li>If true, returns File objects scoped to their versions.</li> </ul> 
	**/
	var versions : Bool; }, callback:js.Error -> Array<gcloud.storage.File> -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Make the bucket listing private.</p><p>You may also choose to make the contents of the bucket private by specifying <code>includeFiles: true</code>. This will automatically run <a data-custom-type="storage/file" data-method="makePrivate">storage/file#makePrivate</a> for every file in the bucket.</p><p>When specifying <code>includeFiles: true</code>, use <code>force: true</code> to delay execution of your callback until all files have been processed. By default, the callback is executed after the first error. Use <code>force</code> to queue such errors until all files have been processed, after which they will be returned as an array as the first argument to your callback.</p><p>NOTE: This may cause the process to be long-running and use a high number of requests. Use with caution.</p>
	**/
	@:overload(function(callback:js.Error -> Array<gcloud.storage.File> -> Void):Void { })
	function makePrivate(options:{ /**
		<ul> <li>Make each file in the bucket private. Default: <code>false</code>.</li> </ul> 
	**/
	var includeFiles : Bool; /**
		<ul> <li>Queue errors occurred while making files private until all files have been processed.</li> </ul> 
	**/
	var force : Bool; }, callback:js.Error -> Array<gcloud.storage.File> -> Void):Void;
	/**
		<p>Make the bucket publicly readable.</p><p>You may also choose to make the contents of the bucket publicly readable by specifying <code>includeFiles: true</code>. This will automatically run <a data-custom-type="storage/file" data-method="makePublic">storage/file#makePublic</a> for every file in the bucket.</p><p>When specifying <code>includeFiles: true</code>, use <code>force: true</code> to delay execution of your callback until all files have been processed. By default, the callback is executed after the first error. Use <code>force</code> to queue such errors until all files have been processed, after which they will be returned as an array as the first argument to your callback.</p><p>NOTE: This may cause the process to be long-running and use a high number of requests. Use with caution.</p>
	**/
	@:overload(function(callback:js.Error -> Array<gcloud.storage.File> -> Void):Void { })
	function makePublic(options:{ /**
		<ul> <li>Make each file in the bucket publicly readable. Default: <code>false</code>.</li> </ul> 
	**/
	var includeFiles : Bool; /**
		<ul> <li>Queue errors occurred while making files public until all files have been processed.</li> </ul> 
	**/
	var force : Bool; }, callback:js.Error -> Array<gcloud.storage.File> -> Void):Void;
	/**
		<p>Upload a file to the bucket. This is a convenience method that wraps <a data-custom-type="storage/file" data-method="createWriteStream">storage/file#createWriteStream</a>.</p><p>You can specify whether or not an upload is resumable by setting <code>options.resumable</code>. <em>Resumable uploads are enabled by default if your input file is larger than 5 MB.</em></p><p>For faster crc32c computation, you must manually install <a href="http://www.gitnpm.com/fast-crc32c"><code>fast-crc32c</code></a>:</p><pre><code>$ npm install --save fast-crc32c </code></pre>
	**/
	@:overload(function(localPath:String, callback:js.Error -> gcloud.storage.File -> Dynamic -> Void):Void { })
	function upload(localPath:String, options:{ /**
		<ul> <li>The place to save your file. If given a string, the file will be uploaded to the bucket  using the string as a filename. When given a File object, your local file  will be uploaded to the File object&#39;s bucket and under the File object&#39;s  name. Lastly, when this argument is omitted, the file is uploaded to your  bucket using the name of the local file.</li> </ul> 
	**/
	var destination : haxe.extern.EitherType<gcloud.storage.File, String>; /**
		<ul> <li>Automatically gzip the file. This will set <code>options.metadata.contentEncoding</code> to <code>gzip</code>.</li> </ul> 
	**/
	var gzip : Bool; /**
		<ul> <li>A custom encryption key. See <a href="https://cloud.google.com/storage/docs/encryption#customer-supplied">Customer-supplied Encryption Keys</a>.</li> </ul> 
	**/
	var key : String; /**
		<ul> <li>See an <a href="https://cloud.google.com/storage/docs/json_api/v1/objects/insert#request_properties_JSON">Objects: insert request body</a>.</li> </ul> 
	**/
	var metadata : Dynamic; /**
		<ul> <li>The starting byte of the upload stream, for resuming an interrupted upload. Defaults to 0.</li> </ul> 
	**/
	var offset : String; /**
		<ul> <li><p>Apply a predefined set of access controls to this object.</p><p> Acceptable values are:</p><ul> <li><p><strong><code>authenticatedRead</code></strong> - Object owner gets <code>OWNER</code> access, and <code>allAuthenticatedUsers</code> get <code>READER</code> access.</p></li> <li><p><strong><code>bucketOwnerFullControl</code></strong> - Object owner gets <code>OWNER</code> access, and project team owners get <code>OWNER</code> access.</p></li> <li><p><strong><code>bucketOwnerRead</code></strong> - Object owner gets <code>OWNER</code> access, and project team owners get <code>READER</code> access.</p></li> <li><p><strong><code>private</code></strong> - Object owner gets <code>OWNER</code> access.</p></li> <li><p><strong><code>projectPrivate</code></strong> - Object owner gets <code>OWNER</code> access, and project team members get access according to their roles.</p></li> <li><p><strong><code>publicRead</code></strong> - Object owner gets <code>OWNER</code> access, and <code>allUsers</code> get <code>READER</code> access.</p></li> </ul> </li> </ul> 
	**/
	var predefinedAcl : String; /**
		<ul> <li>Force a resumable upload. (default: true for files larger than 5 MB).</li> </ul> 
	**/
	var resumable : Bool; /**
		<ul> <li>The URI for an already-created resumable upload. See <a data-custom-type="storage/file" data-method="createResumableUpload">storage/file#createResumableUpload</a>.</li> </ul> 
	**/
	var uri : String; /**
		<ul> <li>Possible values: <code>&quot;md5&quot;</code>, <code>&quot;crc32c&quot;</code>, or <code>false</code>. By default, data integrity is validated with an  MD5 checksum for maximum reliability. CRC32c will provide better  performance with less reliability. You may also choose to skip validation  completely, however this is <strong>not recommended</strong>.</li> </ul> 
	**/
	var validation : haxe.extern.EitherType<Bool, String>; }, callback:js.Error -> gcloud.storage.File -> Dynamic -> Void):Void;
}