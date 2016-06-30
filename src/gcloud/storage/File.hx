package gcloud.storage;
@:jsRequire("gcloud", "storage.file") extern class File {
	/**
		<p>A File object is created from your Bucket object using <a data-custom-type="storage/bucket" data-method="file">storage/bucket#file</a>.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Delete the file.</p>
	**/
	@:overload(function():Void { })
	function delete(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Check if the file exists.</p>
	**/
	function exists(callback:js.Error -> Bool -> Void):Void;
	/**
		<p>Get a file object and its metadata if it exists.</p>
	**/
	function get():Void;
	/**
		<p>Get the file&#39;s metadata.</p>
	**/
	@:overload(function():Void { })
	function getMetadata(callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Merge the given metadata with the current remote file&#39;s metadata. This will set metadata if it was previously unset or update previously set metadata. To unset previously set metadata, set its value to null.</p><p>You can set custom key/value pairs in the metadata key of the given object, however the other properties outside of this object must adhere to the <a href="https://goo.gl/BOnnCK">official API documentation</a>.</p><p>See the examples below for more information.</p>
	**/
	@:overload(function(metadata:Dynamic):Void { })
	function setMetadata(metadata:Dynamic, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Google Cloud Storage uses access control lists (ACLs) to manage object and bucket access. ACLs are the mechanism you use to share objects with other users and allow other users to access your buckets and objects.</p><p>An ACL consists of one or more entries, where each entry grants permissions to an entity. Permissions define the actions that can be performed against an object or bucket (for example, <code>READ</code> or <code>WRITE</code>); the entity defines who the permission applies to (for example, a specific user or group of users).</p><p>The <code>acl</code> object on a File instance provides methods to get you a list of the ACLs defined on your bucket, as well as set, update, and delete them.</p>
	**/
	function acl():Void;
	/**
		<p>Copy this file to another file. By default, this will copy the file to the same bucket, but you can choose to copy it to another Bucket by providing either a Bucket or File object.</p>
	**/
	@:overload(function(destination:haxe.extern.EitherType<gcloud.storage.File, haxe.extern.EitherType<gcloud.storage.Bucket, String>>):Void { })
	function copy(destination:haxe.extern.EitherType<gcloud.storage.File, haxe.extern.EitherType<gcloud.storage.Bucket, String>>, callback:js.Error -> gcloud.storage.File -> Dynamic -> Void):Void;
	/**
		<p>Create a readable stream to read the contents of the remote file. It can be piped to a writable stream or listened to for &#39;data&#39; events to read a file&#39;s contents.</p><p>In the unlikely event there is a mismatch between what you downloaded and the version in your Bucket, your error handler will receive an error with code &quot;CONTENT_DOWNLOAD_MISMATCH&quot;. If you receive this error, the best recourse is to try downloading the file again.</p><p>For faster crc32c computation, you must manually install <a href="http://www.gitnpm.com/fast-crc32c"><code>fast-crc32c</code></a>:</p><pre><code>$ npm install --save fast-crc32c </code></pre><p>NOTE: Readable streams will emit the <code>end</code> event when the file is fully downloaded.</p>
	**/
	@:overload(function():Void { })
	function createReadStream(options:{ /**
		<ul> <li>Possible values: <code>&quot;md5&quot;</code>, <code>&quot;crc32c&quot;</code>, or <code>false</code>. By default, data integrity is validated with an  MD5 checksum for maximum reliability, falling back to CRC32c when an MD5  hash wasn&#39;t returned from the API. CRC32c will provide better performance  with less reliability. You may also choose to skip validation completely,  however this is <strong>not recommended</strong>.</li> </ul> 
	**/
	var validation : haxe.extern.EitherType<Bool, String>; /**
		<ul> <li>A byte offset to begin the file&#39;s download from. Default is 0. NOTE: Byte ranges are inclusive; that is,  <code>options.start = 0</code> and <code>options.end = 999</code> represent the first 1000  bytes in a file or object. NOTE: when specifying a byte range, data  integrity is not available.</li> </ul> 
	**/
	var start : Float; /**
		<ul> <li>A byte offset to stop reading the file at. NOTE: Byte ranges are inclusive; that is, <code>options.start = 0</code> and  <code>options.end = 999</code> represent the first 1000 bytes in a file or object.  NOTE: when specifying a byte range, data integrity is not available.</li> </ul> 
	**/
	var end : Float; }):Void;
	/**
		<p>Create a unique resumable upload session URI. This is the first step when performing a resumable upload.</p><p>See the <a href="https://cloud.google.com/storage/docs/json_api/v1/how-tos/upload#resumable">Resumable upload guide</a> for more on how the entire process works.</p><h4>Note</h4> <p>If you are just looking to perform a resumable upload without worrying about any of the details, see <a data-custom-type="storage/createWriteStream" data-method="">storage/createWriteStream</a>. Resumable uploads are performed by default.</p>
	**/
	@:overload(function(callback:js.Error -> String -> Void):Void { })
	function createResumableUpload(options:{ /**
		<ul> <li>Metadata to set on the file.</li> </ul> 
	**/
	var metadata : Dynamic; /**
		<ul> <li>Origin header to set for the upload.</li> </ul> 
	**/
	var origin : String; /**
		<ul> <li><p>Apply a predefined set of access controls to this object.</p><p> Acceptable values are:</p><ul> <li><p><strong><code>authenticatedRead</code></strong> - Object owner gets <code>OWNER</code> access, and <code>allAuthenticatedUsers</code> get <code>READER</code> access.</p></li> <li><p><strong><code>bucketOwnerFullControl</code></strong> - Object owner gets <code>OWNER</code> access, and project team owners get <code>OWNER</code> access.</p></li> <li><p><strong><code>bucketOwnerRead</code></strong> - Object owner gets <code>OWNER</code> access, and project team owners get <code>READER</code> access.</p></li> <li><p><strong><code>private</code></strong> - Object owner gets <code>OWNER</code> access.</p></li> <li><p><strong><code>projectPrivate</code></strong> - Object owner gets <code>OWNER</code> access, and project team members get access according to their roles.</p></li> <li><p><strong><code>publicRead</code></strong> - Object owner gets <code>OWNER</code> access, and <code>allUsers</code> get <code>READER</code> access.</p></li> </ul> </li> </ul> 
	**/
	var predefinedAcl : String; }, callback:js.Error -> String -> Void):Void;
	/**
		<p>Create a writable stream to overwrite the contents of the file in your bucket.</p><p>A File object can also be used to create files for the first time.</p><p>Resumable uploads are automatically enabled and must be shut off explicitly by setting <code>options.resumable</code> to <code>false</code>.</p><p>For faster crc32c computation, you must manually install <a href="http://www.gitnpm.com/fast-crc32c"><code>fast-crc32c</code></a>:</p><pre><code>$ npm install --save fast-crc32c </code></pre><p>NOTE: Writable streams will emit the <code>finish</code> event when the file is fully uploaded.</p>
	**/
	@:overload(function():Void { })
	function createWriteStream(options:{ /**
		<ul> <li>Automatically gzip the file. This will set <code>options.metadata.contentEncoding</code> to <code>gzip</code>.</li> </ul> 
	**/
	var gzip : Bool; /**
		<ul> <li>See the examples below or <a href="https://cloud.google.com/storage/docs/json_api/v1/objects/insert#request_properties_JSON">Objects: insert request body</a>  for more details.</li> </ul> 
	**/
	@:optional
	var metadata : Dynamic; /**
		<ul> <li>The starting byte of the upload stream, for resuming an interrupted upload. Defaults to 0.</li> </ul> 
	**/
	var offset : String; /**
		<ul> <li><p>Apply a predefined set of access controls to this object.</p><p> Acceptable values are:</p><ul> <li><p><strong><code>authenticatedRead</code></strong> - Object owner gets <code>OWNER</code> access, and <code>allAuthenticatedUsers</code> get <code>READER</code> access.</p></li> <li><p><strong><code>bucketOwnerFullControl</code></strong> - Object owner gets <code>OWNER</code> access, and project team owners get <code>OWNER</code> access.</p></li> <li><p><strong><code>bucketOwnerRead</code></strong> - Object owner gets <code>OWNER</code> access, and project team owners get <code>READER</code> access.</p></li> <li><p><strong><code>private</code></strong> - Object owner gets <code>OWNER</code> access.</p></li> <li><p><strong><code>projectPrivate</code></strong> - Object owner gets <code>OWNER</code> access, and project team members get access according to their roles.</p></li> <li><p><strong><code>publicRead</code></strong> - Object owner gets <code>OWNER</code> access, and <code>allUsers</code> get <code>READER</code> access.</p></li> </ul> </li> </ul> 
	**/
	var predefinedAcl : String; /**
		<ul> <li>Force a resumable upload. NOTE: When working with streams, the file format and size is unknown until it&#39;s  completely consumed. Because of this, it&#39;s best for you to be explicit  for what makes sense given your input.</li> </ul> 
	**/
	var resumable : Bool; /**
		<ul> <li>The URI for an already-created resumable upload. See <a data-custom-type="storage/file" data-method="createResumableUpload">storage/file#createResumableUpload</a>.</li> </ul> 
	**/
	var uri : String; /**
		<ul> <li>Possible values: <code>&quot;md5&quot;</code>, <code>&quot;crc32c&quot;</code>, or <code>false</code>. By default, data integrity is validated with an  MD5 checksum for maximum reliability. CRC32c will provide better  performance with less reliability. You may also choose to skip validation  completely, however this is <strong>not recommended</strong>.</li> </ul> 
	**/
	var validation : haxe.extern.EitherType<Bool, String>; }):Void;
	/**
		<p>Convenience method to download a file into memory or to a local destination.</p>
	**/
	@:overload(function(callback:js.Error -> js.node.buffer.Buffer -> Void):Void { })
	function download(options:{ /**
		<ul> <li>Local file path to write the file&#39;s contents to.</li> </ul> 
	**/
	var destination : String; }, callback:js.Error -> js.node.buffer.Buffer -> Void):Void;
	/**
		<p>The Storage API allows you to use a custom key for server-side encryption. Supply this method with a passphrase and the correct key (AES-256) will be generated and used for you.</p>
	**/
	function setKey(key:haxe.extern.EitherType<js.node.buffer.Buffer, String>):gcloud.storage.File;
	/**
		<p>Get a signed policy document to allow a user to upload data with a POST request.</p>
	**/
	function getSignedPolicy(options:{ /**
		<ul> <li>Array of request parameters and their expected value (e.g. [[&#39;$<field>&#39;, &#39;<value>&#39;]]). Values are  translated into equality constraints in the conditions field of the  policy document (e.g. [&#39;eq&#39;, &#39;$<field>&#39;, &#39;<value>&#39;]). If only one  equality condition is to be specified, options.equals can be a one-  dimensional array (e.g. [&#39;$<field>&#39;, &#39;<value>&#39;]).</li> </ul> 
	**/
	@:optional
	var equals : haxe.extern.EitherType<Array<Array<Dynamic>>, Array<Dynamic>>; /**
		<ul> <li>A timestamp when this policy will expire. Any value given is passed to <code>new Date()</code>.</li> </ul> 
	**/
	var expires : Dynamic; /**
		<ul> <li>Array of request parameters and their expected prefixes (e.g. [[&#39;$<field>&#39;, &#39;<value>&#39;]). Values are  translated into starts-with constraints in the conditions field of the  policy document (e.g. [&#39;starts-with&#39;, &#39;$<field>&#39;, &#39;<value>&#39;]). If only  one prefix condition is to be specified, options.startsWith can be a one-  dimensional array (e.g. [&#39;$<field>&#39;, &#39;<value>&#39;]).</li> </ul> 
	**/
	@:optional
	var startsWith : haxe.extern.EitherType<Array<Array<Dynamic>>, Array<Dynamic>>; /**
		<ul> <li>ACL for the object from possibly predefined ACLs.</li> </ul> 
	**/
	@:optional
	var acl : String; /**
		<ul> <li>The URL to which the user client is redirected if the upload is successful.</li> </ul> 
	**/
	@:optional
	var successRedirect : String; /**
		<ul> <li>The status of the Google Storage response if the upload is successful (must be string).</li> </ul> 
	**/
	@:optional
	var successStatus : String; @:optional
	var contentLengthRange : { /**
		<ul> <li>Minimum value for the request&#39;s content length.</li> </ul> 
	**/
	var min : Float; /**
		<ul> <li>Maximum value for the request&#39;s content length.</li> </ul> 
	**/
	var max : Float; }; }, callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Get a signed URL to allow limited time access to the file.</p>
	**/
	@:overload(function(config:{ /**
		<ul> <li>&quot;read&quot; (HTTP: GET), &quot;write&quot; (HTTP: PUT), or &quot;delete&quot; (HTTP: DELETE).</li> </ul> 
	**/
	var action : String; /**
		<ul> <li>The MD5 digest value in base64. If you provide this, the client must provide this HTTP header with this same  value in its request.</li> </ul> 
	**/
	@:optional
	var contentMd5 : String; /**
		<ul> <li>If you provide this value, the client must provide this HTTP header set to the same value.</li> </ul> 
	**/
	@:optional
	var contentType : String; /**
		<ul> <li>A timestamp when this link will expire. Any value given is passed to <code>new Date()</code>.</li> </ul> 
	**/
	var expires : Dynamic; /**
		<ul> <li>If these headers are used, the server will check to make sure that the client provides matching values.</li> </ul> 
	**/
	@:optional
	var extensionHeaders : Dynamic; /**
		<ul> <li>The filename to prompt the user to save the file as when the signed url is accessed. This is ignored if  <code>config.responseDisposition</code> is set.</li> </ul> 
	**/
	@:optional
	var promptSaveAs : String; /**
		<ul> <li>The <a href="http://goo.gl/yMWxQV">response-content-disposition parameter</a> of the  signed url.</li> </ul> 
	**/
	@:optional
	var responseDisposition : String; /**
		<ul> <li>The response-content-type parameter of the signed url.</li> </ul> 
	**/
	@:optional
	var responseType : String; }):Void { })
	function getSignedUrl(config:{ /**
		<ul> <li>&quot;read&quot; (HTTP: GET), &quot;write&quot; (HTTP: PUT), or &quot;delete&quot; (HTTP: DELETE).</li> </ul> 
	**/
	var action : String; /**
		<ul> <li>The MD5 digest value in base64. If you provide this, the client must provide this HTTP header with this same  value in its request.</li> </ul> 
	**/
	@:optional
	var contentMd5 : String; /**
		<ul> <li>If you provide this value, the client must provide this HTTP header set to the same value.</li> </ul> 
	**/
	@:optional
	var contentType : String; /**
		<ul> <li>A timestamp when this link will expire. Any value given is passed to <code>new Date()</code>.</li> </ul> 
	**/
	var expires : Dynamic; /**
		<ul> <li>If these headers are used, the server will check to make sure that the client provides matching values.</li> </ul> 
	**/
	@:optional
	var extensionHeaders : Dynamic; /**
		<ul> <li>The filename to prompt the user to save the file as when the signed url is accessed. This is ignored if  <code>config.responseDisposition</code> is set.</li> </ul> 
	**/
	@:optional
	var promptSaveAs : String; /**
		<ul> <li>The <a href="http://goo.gl/yMWxQV">response-content-disposition parameter</a> of the  signed url.</li> </ul> 
	**/
	@:optional
	var responseDisposition : String; /**
		<ul> <li>The response-content-type parameter of the signed url.</li> </ul> 
	**/
	@:optional
	var responseType : String; }, callback:js.Error -> String -> Void):Void;
	/**
		<p>Make a file private to the project and remove all other permissions. Set <code>options.strict</code> to true to make the file private to only the owner.</p>
	**/
	@:overload(function(callback:js.Error -> Void):Void { })
	@:overload(function():Void { })
	@:overload(function(options:{ /**
		<ul> <li>If true, set the file to be private to only the owner user. Otherwise, it will be private to the project.</li> </ul> 
	**/
	@:optional
	var strict : Bool; }):Void { })
	function makePrivate(options:{ /**
		<ul> <li>If true, set the file to be private to only the owner user. Otherwise, it will be private to the project.</li> </ul> 
	**/
	@:optional
	var strict : Bool; }, callback:js.Error -> Void):Void;
	/**
		<p>Set a file to be publicly readable and maintain all previous permissions.</p>
	**/
	@:overload(function():Void { })
	function makePublic(callback:js.Error -> Dynamic -> Void):Void;
	/**
		<p>Move this file to another location. By default, this will move the file to the same bucket, but you can choose to move it to another Bucket by providing either a Bucket or File object.</p><p><strong>Warning</strong>: There is currently no atomic <code>move</code> method in the Google Cloud Storage API, so this method is a composition of <a data-custom-type="storage/file" data-method="copy">storage/file#copy</a> (to the new location) and <a data-custom-type="storage/file" data-method="delete">storage/file#delete</a> (from the old location). While unlikely, it is possible that an error returned to your callback could be triggered from either one of these API calls failing, which could leave a duplicate file lingering.</p>
	**/
	@:overload(function(destination:haxe.extern.EitherType<gcloud.storage.File, haxe.extern.EitherType<gcloud.storage.Bucket, String>>):Void { })
	function move(destination:haxe.extern.EitherType<gcloud.storage.File, haxe.extern.EitherType<gcloud.storage.Bucket, String>>, callback:js.Error -> gcloud.storage.File -> Dynamic -> Void):Void;
	/**
		<p>Write arbitrary data to a file.</p><p><em>This is a convenience method which wraps <a data-custom-type="storage/file" data-method="createWriteStream">storage/file#createWriteStream</a>.</em></p>
	**/
	@:overload(function(data:Dynamic, callback:js.Error -> Void):Void { })
	function save(data:Dynamic, options:Dynamic, callback:js.Error -> Void):Void;
}