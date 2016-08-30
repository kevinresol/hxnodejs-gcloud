package gcloud;
@:jsRequire("google-cloud", "vision") extern class Vision {
	/**
		<p class="notice">  <strong>This is a Beta release of Google Cloud Vision.</strong> This API is not covered  by any SLA or deprecation policy and may be subject to backward-  incompatible changes. </p> <p>The <a href="https://cloud.google.com/vision/docs">Cloud Vision API</a> allows easy integration of vision detection features, including image labeling, face and landmark detection, optical character recognition (OCR), and tagging of explicit content.</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Run image detection and annotation for an image or batch of images.</p><p>This is an advanced API method that requires raw <a href="https://cloud.google.com/vision/reference/rest/v1/images/annotate#AnnotateImageRequest"><code>AnnotateImageRequest</code></a> objects to be provided. If that doesn&#39;t sound like what you&#39;re looking for, you&#39;ll probably appreciate <a data-custom-type="vision" data-method="detect">vision#detect</a>.</p>
	**/
	function annotate(requests:haxe.extern.EitherType<Array<Dynamic>, Dynamic>, callback:js.Error -> Dynamic -> Dynamic -> Void):Void;
	/**
		<p>Detect properties from an image (or images) of one or more types.</p><h4>API simplifications</h4> <p>The raw API response will return some values in a range from <code>VERY_UNLIKELY</code> to <code>VERY_LIKELY</code>. For simplification, any value less than <code>LIKELY</code> is converted to <code>false</code>.</p><ul> <li><strong>False</strong></li> <li><code>VERY_UNLIKELY</code></li> <li><code>UNLIKELY</code></li> <li><code>POSSIBLE</code></li> <li><strong>True</strong></li> <li><code>LIKELY</code></li> <li><code>VERY_LIKELY</code></li> </ul> <p>The API will also return many values represented in a <code>[0,1]</code> range. We convert these to a <code>[0,100]</code> value. E.g, <code>0.4</code> is represented as <code>40</code>.</p><p>For the response in the original format, review the <code>apiResponse</code> argument your callback receives.</p>
	**/
	@:overload(function(images:haxe.extern.EitherType<Array<gcloud.storage.File>, haxe.extern.EitherType<gcloud.storage.File, haxe.extern.EitherType<Array<js.node.buffer.Buffer>, haxe.extern.EitherType<js.node.buffer.Buffer, haxe.extern.EitherType<Array<String>, String>>>>>, callback:js.Error -> haxe.extern.EitherType<Array<{ /**
		<ul> <li>It&#39;s possible for part of your request to be completed successfully, while a single feature request was  not successful. Each returned detection will have an <code>errors</code> array,  including any of these errors which may have occurred.</li> </ul> 
	**/
	var errors : Array<Dynamic>; }>, { /**
		<ul> <li>It&#39;s possible for part of your request to be completed successfully, while a single feature request was  not successful. Each returned detection will have an <code>errors</code> array,  including any of these errors which may have occurred.</li> </ul> 
	**/
	var errors : Array<Dynamic>; }> -> Dynamic -> Void):Void { })
	function detect(images:haxe.extern.EitherType<Array<gcloud.storage.File>, haxe.extern.EitherType<gcloud.storage.File, haxe.extern.EitherType<Array<js.node.buffer.Buffer>, haxe.extern.EitherType<js.node.buffer.Buffer, haxe.extern.EitherType<Array<String>, String>>>>>, options:haxe.extern.EitherType<{ /**
		<ul> <li>See an <a href="https://cloud.google.com/vision/reference/rest/v1/images/annotate#ImageContext"><code>ImageContext</code></a>  resource.</li> </ul> 
	**/
	@:optional
	var imageContext : Dynamic; /**
		<ul> <li>The maximum number of results, per type, to return in the response.</li> </ul> 
	**/
	var maxResults : Float; /**
		<ul> <li>An array of feature types to detect from the provided images. Acceptable values: <code>faces</code>, <code>landmarks</code>, <code>labels</code>,  <code>logos</code>, <code>properties</code>, <code>safeSearch</code>, <code>text</code>.</li> </ul> 
	**/
	var types : Array<String>; /**
		<ul> <li>Use verbose mode, which returns a less- simplistic representation of the annotation (default: <code>false</code>).</li> </ul> 
	**/
	@:optional
	var verbose : Bool; }, Array<String>>, callback:js.Error -> haxe.extern.EitherType<Array<{ /**
		<ul> <li>It&#39;s possible for part of your request to be completed successfully, while a single feature request was  not successful. Each returned detection will have an <code>errors</code> array,  including any of these errors which may have occurred.</li> </ul> 
	**/
	var errors : Array<Dynamic>; }>, { /**
		<ul> <li>It&#39;s possible for part of your request to be completed successfully, while a single feature request was  not successful. Each returned detection will have an <code>errors</code> array,  including any of these errors which may have occurred.</li> </ul> 
	**/
	var errors : Array<Dynamic>; }> -> Dynamic -> Void):Void;
	/**
		<p>Run face detection against an image.</p><h4>Parameters</h4> <p>See <a data-custom-type="vision" data-method="detect">vision#detect</a>.</p>
	**/
	function detectFaces():Void;
	/**
		<p>Annotate an image with descriptive labels.</p><h4>Parameters</h4> <p>See <a data-custom-type="vision" data-method="detect">vision#detect</a>.</p>
	**/
	function detectLabels():Void;
	/**
		<p>Detect the landmarks from an image.</p><h4>Parameters</h4> <p>See <a data-custom-type="vision" data-method="detect">vision#detect</a>.</p>
	**/
	function detectLandmarks():Void;
	/**
		<p>Detect the logos from an image.</p><h4>Parameters</h4> <p>See <a data-custom-type="vision" data-method="detect">vision#detect</a>.</p>
	**/
	function detectLogos():Void;
	/**
		<p>Get a set of properties about an image, such as its dominant colors.</p><h4>Parameters</h4> <p>See <a data-custom-type="vision" data-method="detect">vision#detect</a>.</p>
	**/
	function detectProperties():Void;
	/**
		<p>Detect the SafeSearch flags from an image.</p><h4>Parameters</h4> <p>See <a data-custom-type="vision" data-method="detect">vision#detect</a>.</p>
	**/
	function detectSafeSearch():Void;
	/**
		<p>Detect the text within an image.</p><h4>Parameters</h4> <p>See <a data-custom-type="vision" data-method="detect">vision#detect</a>.</p>
	**/
	function detectText():Void;
}