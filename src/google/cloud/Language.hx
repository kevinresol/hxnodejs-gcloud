package google.cloud;
@:jsRequire("google-cloud", "language") extern class Language {
	/**
		<p class="notice">  <strong>This is a Beta release of Google Cloud Natural Language.</strong> This API is  not covered by any SLA or deprecation policy and may be subject to  backward-incompatible changes. </p> <p>The <a href="https://cloud.google.com/natural-language/docs">Google Cloud Natural Language</a> API provides natural language understanding technologies to developers, including sentiment analysis, entity recognition, and syntax analysis. This API is part of the larger Cloud Machine Learning API.</p><p>The Cloud Natural Language API currently supports English for <a href="https://cloud.google.com/natural-language/docs/reference/rest/v1beta1/documents/analyzeSentiment">sentiment analysis</a> and English, Spanish, and Japanese for <a href="https://cloud.google.com/natural-language/docs/reference/rest/v1beta1/documents/analyzeEntities">entity analysis</a> and <a href="https://cloud.google.com/natural-language/docs/reference/rest/v1beta1/documents/annotateText">syntax analysis</a>.</p>
	**/
	@:selfCall
	function new(options:Dynamic);
	/**
		<p>Run an annotation of a block of text.</p><p>NOTE: This is a convenience method which doesn&#39;t require creating a <a data-custom-type="language/document" data-method="">language/document</a> object. If you are only running a single detection, this may be more convenient. However, if you plan to run multiple detections, it&#39;s easier to create a <a data-custom-type="language/document" data-method="">language/document</a> object.</p>
	**/
	@:overload(function(content:haxe.extern.EitherType<google.cloud.storage.File, String>, callback:Void -> Dynamic):Void { })
	function annotate(content:haxe.extern.EitherType<google.cloud.storage.File, String>, options:{ /**
		<ul> <li><code>UTF8</code>, <code>UTF16</code>, or <code>UTF32</code>. See <a href="https://cloud.google.com/natural-language/reference/rest/v1beta1/EncodingType"><code>EncodingType</code></a>.</li> </ul> 
	**/
	var encoding : String; /**
		<ul> <li>The language of the text.</li> </ul> 
	**/
	var language : String; /**
		<ul> <li>The type of document, either <code>html</code> or <code>text</code>.</li> </ul> 
	**/
	var type : String; /**
		<ul> <li>Enable verbose mode for more detailed results. Default: <code>false</code></li> </ul> 
	**/
	var verbose : Bool; }, callback:Void -> Dynamic):Void;
	/**
		<p>Detect the entities from a block of text.</p><p>NOTE: This is a convenience method which doesn&#39;t require creating a <a data-custom-type="language/document" data-method="">language/document</a> object. If you are only running a single detection, this may be more convenient. However, if you plan to run multiple detections, it&#39;s easier to create a <a data-custom-type="language/document" data-method="">language/document</a> object.</p>
	**/
	@:overload(function(content:haxe.extern.EitherType<google.cloud.storage.File, String>, callback:Void -> Dynamic):Void { })
	function detectEntities(content:haxe.extern.EitherType<google.cloud.storage.File, String>, options:{ /**
		<ul> <li><code>UTF8</code>, <code>UTF16</code>, or <code>UTF32</code>. See <a href="https://cloud.google.com/natural-language/reference/rest/v1beta1/EncodingType"><code>EncodingType</code></a>.</li> </ul> 
	**/
	var encoding : String; /**
		<ul> <li>The language of the text.</li> </ul> 
	**/
	var language : String; /**
		<ul> <li>The type of document, either <code>html</code> or <code>text</code>.</li> </ul> 
	**/
	var type : String; /**
		<ul> <li>Enable verbose mode for more detailed results. Default: <code>false</code></li> </ul> 
	**/
	var verbose : Bool; }, callback:Void -> Dynamic):Void;
	/**
		<p>Detect the sentiment of a block of text.</p><p>NOTE: This is a convenience method which doesn&#39;t require creating a <a data-custom-type="language/document" data-method="">language/document</a> object. If you are only running a single detection, this may be more convenient. However, if you plan to run multiple detections, it&#39;s easier to create a <a data-custom-type="language/document" data-method="">language/document</a> object.</p>
	**/
	@:overload(function(content:haxe.extern.EitherType<google.cloud.storage.File, String>, callback:Void -> Dynamic):Void { })
	function detectSentiment(content:haxe.extern.EitherType<google.cloud.storage.File, String>, options:{ /**
		<ul> <li><code>UTF8</code>, <code>UTF16</code>, or <code>UTF32</code>. See <a href="https://cloud.google.com/natural-language/reference/rest/v1beta1/EncodingType"><code>EncodingType</code></a>.</li> </ul> 
	**/
	var encoding : String; /**
		<ul> <li>The language of the text.</li> </ul> 
	**/
	var language : String; /**
		<ul> <li>The type of document, either <code>html</code> or <code>text</code>.</li> </ul> 
	**/
	var type : String; /**
		<ul> <li>Enable verbose mode for more detailed results. Default: <code>false</code></li> </ul> 
	**/
	var verbose : Bool; }, callback:Void -> Dynamic):Void;
	/**
		<p>Create a Document object for an unknown type. If you know the type, use the appropriate method below:</p><ul> <li><a data-custom-type="language" data-method="html">language#html</a> - For HTML documents.</li> <li><a data-custom-type="language" data-method="text">language#text</a> - For text documents.</li> </ul> 
	**/
	function document(config:haxe.extern.EitherType<google.cloud.storage.File, haxe.extern.EitherType<String, Dynamic>>):google.cloud.language.Document;
	/**
		<p>Create a Document object from an HTML document. You may provide either inline HTML content or a Storage File object (see <a data-custom-type="storage/file" data-method="">storage/file</a>).</p>
	**/
	@:overload(function(content:haxe.extern.EitherType<google.cloud.storage.File, String>):google.cloud.language.Document { })
	function html(content:haxe.extern.EitherType<google.cloud.storage.File, String>, options:{ /**
		<ul> <li><code>UTF8</code>, <code>UTF16</code>, or <code>UTF32</code>. See <a href="https://cloud.google.com/natural-language/reference/rest/v1beta1/EncodingType"><code>EncodingType</code></a>.</li> </ul> 
	**/
	var encoding : String; /**
		<ul> <li>The language of the text.</li> </ul> 
	**/
	var language : String; }):google.cloud.language.Document;
	/**
		<p>Create a Document object from a text-based document. You may provide either inline text content or a Storage File object (see <a data-custom-type="storage/file" data-method="">storage/file</a>).</p>
	**/
	@:overload(function(content:haxe.extern.EitherType<google.cloud.storage.File, String>):google.cloud.language.Document { })
	function text(content:haxe.extern.EitherType<google.cloud.storage.File, String>, options:{ /**
		<ul> <li><code>UTF8</code>, <code>UTF16</code>, or <code>UTF32</code>. See <a href="https://cloud.google.com/natural-language/reference/rest/v1beta1/EncodingType"><code>EncodingType</code></a>.</li> </ul> 
	**/
	var encoding : String; /**
		<ul> <li>The language of the text.</li> </ul> 
	**/
	var language : String; }):google.cloud.language.Document;
}