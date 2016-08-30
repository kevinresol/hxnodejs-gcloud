package gcloud.language;
@:jsRequire("google-cloud", "language.document") extern class Document {
	/**
		<p>Create a Natural Language Document object. From this object, you will be able to run multiple detections.</p>
	**/
	@:selfCall
	function new();
	/**
		<p>Run an annotation of the text from the document.</p><p>By default, all annotation types are requested:</p><ul> <li>The sentiment of the document (positive or negative)</li> <li>The entities of the document (people, places, things, etc.)</li> <li>The syntax of the document (adjectives, nouns, verbs, etc.)</li> </ul> <p>See the examples below for how to request a subset of those types.</p><p>If you only need one type of annotation, you may appreciate one of these other methods from our API:</p><ul> <li><a data-custom-type="language" data-method="detectEntities">language#detectEntities</a></li> <li><a data-custom-type="language" data-method="detectSentiment">language#detectSentiment</a></li> </ul> 
	**/
	@:overload(function(callback:js.Error -> { /**
		<ul> <li>The language detected from the text.</li> </ul> 
	**/
	var language : String; /**
		<ul> <li>A value in the range of <code>-100</code> to <code>100</code>. Large numbers represent more positive sentiments.</li> </ul> 
	**/
	var sentiment : Float; /**
		<ul> <li>The recognized entities from the text, grouped by the type of entity.</li> </ul> 
	**/
	var entities : { /**
		<ul> <li>Art entities detected from the text. This is only present if detections of this type were  found.</li> </ul> 
	**/
	var art : Array<String>; /**
		<ul> <li>Event entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var events : Array<String>; /**
		<ul> <li>Consumer good entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var goods : Array<String>; /**
		<ul> <li>Organization entities detected from the text. This is only present if detections of  this type were found.</li> </ul> 
	**/
	var organizations : Array<String>; /**
		<ul> <li>Other entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var other : Array<String>; /**
		<ul> <li>People entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var people : Array<String>; /**
		<ul> <li>Place entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var places : Array<String>; /**
		<ul> <li>Unknown entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var unknown : Array<String>; }; /**
		<ul> <li>Sentences detected from the text.</li> </ul> 
	**/
	var sentences : Array<String>; /**
		<ul> <li>Parts of speech that were detected from the text.</li> </ul> 
	**/
	var tokens : Array<{ /**
		<ul> <li>The piece of text analyzed.</li> </ul> 
	**/
	var text : Array<Dynamic>; /**
		<ul> <li>A description of the part of speech (<code>Noun (common and propert)</code>,  <code>Verb (all tenses and modes)</code>, etc.).</li> </ul> 
	**/
	var partOfSpeech : Array<Dynamic>; /**
		<ul> <li>A short code for the type of speech (<code>NOUN</code>, <code>VERB</code>, etc.).</li> </ul> 
	**/
	var partOfSpeechTag : Array<Dynamic>; }>; } -> Dynamic -> Void):Void { })
	function annotate(options:{ /**
		<ul> <li>Detect the entities from this document. By default, all features (<code>entities</code>, <code>sentiment</code>, and <code>syntax</code>) are  enabled. By overriding any of these values, all defaults are switched to  <code>false</code>.</li> </ul> 
	**/
	var entities : Bool; /**
		<ul> <li>Detect the sentiment from this document. By default, all features (<code>entities</code>, <code>sentiment</code>, and <code>syntax</code>) are  enabled. By overriding any of these values, all defaults are switched to  <code>false</code>.</li> </ul> 
	**/
	var sentiment : Float; /**
		<ul> <li>Detect the syntax from this document. By default, all features (<code>entities</code>, <code>sentiment</code>, and <code>syntax</code>) are  enabled. By overriding any of these values, all defaults are switched to  <code>false</code>.</li> </ul> 
	**/
	var syntax : Bool; /**
		<ul> <li>Enable verbose mode for more detailed results. Default: <code>false</code></li> </ul> 
	**/
	var verbose : Bool; }, callback:js.Error -> { /**
		<ul> <li>The language detected from the text.</li> </ul> 
	**/
	var language : String; /**
		<ul> <li>A value in the range of <code>-100</code> to <code>100</code>. Large numbers represent more positive sentiments.</li> </ul> 
	**/
	var sentiment : Float; /**
		<ul> <li>The recognized entities from the text, grouped by the type of entity.</li> </ul> 
	**/
	var entities : { /**
		<ul> <li>Art entities detected from the text. This is only present if detections of this type were  found.</li> </ul> 
	**/
	var art : Array<String>; /**
		<ul> <li>Event entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var events : Array<String>; /**
		<ul> <li>Consumer good entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var goods : Array<String>; /**
		<ul> <li>Organization entities detected from the text. This is only present if detections of  this type were found.</li> </ul> 
	**/
	var organizations : Array<String>; /**
		<ul> <li>Other entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var other : Array<String>; /**
		<ul> <li>People entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var people : Array<String>; /**
		<ul> <li>Place entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var places : Array<String>; /**
		<ul> <li>Unknown entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var unknown : Array<String>; }; /**
		<ul> <li>Sentences detected from the text.</li> </ul> 
	**/
	var sentences : Array<String>; /**
		<ul> <li>Parts of speech that were detected from the text.</li> </ul> 
	**/
	var tokens : Array<{ /**
		<ul> <li>The piece of text analyzed.</li> </ul> 
	**/
	var text : Array<Dynamic>; /**
		<ul> <li>A description of the part of speech (<code>Noun (common and propert)</code>,  <code>Verb (all tenses and modes)</code>, etc.).</li> </ul> 
	**/
	var partOfSpeech : Array<Dynamic>; /**
		<ul> <li>A short code for the type of speech (<code>NOUN</code>, <code>VERB</code>, etc.).</li> </ul> 
	**/
	var partOfSpeechTag : Array<Dynamic>; }>; } -> Dynamic -> Void):Void;
	/**
		<p>Detect entities from the document.</p>
	**/
	@:overload(function(callback:js.Error -> { /**
		<ul> <li>Art entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var art : Array<String>; /**
		<ul> <li>Event entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var events : Array<String>; /**
		<ul> <li>Consumer good entities detected from the text. This is only present if detections of this type were  found.</li> </ul> 
	**/
	var goods : Array<String>; /**
		<ul> <li>Organization entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var organizations : Array<String>; /**
		<ul> <li>Other entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var other : Array<String>; /**
		<ul> <li>People entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var people : Array<String>; /**
		<ul> <li>Place entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var places : Array<String>; /**
		<ul> <li>Unknown entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var unknown : Array<String>; } -> Dynamic -> Void):Void { })
	function detectEntities(options:{ /**
		<ul> <li>Enable verbose mode for more detailed results. Default: <code>false</code></li> </ul> 
	**/
	var verbose : Bool; }, callback:js.Error -> { /**
		<ul> <li>Art entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var art : Array<String>; /**
		<ul> <li>Event entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var events : Array<String>; /**
		<ul> <li>Consumer good entities detected from the text. This is only present if detections of this type were  found.</li> </ul> 
	**/
	var goods : Array<String>; /**
		<ul> <li>Organization entities detected from the text. This is only present if detections of this type  were found.</li> </ul> 
	**/
	var organizations : Array<String>; /**
		<ul> <li>Other entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var other : Array<String>; /**
		<ul> <li>People entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var people : Array<String>; /**
		<ul> <li>Place entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var places : Array<String>; /**
		<ul> <li>Unknown entities detected from the text. This is only present if detections of this type were found.</li> </ul> 
	**/
	var unknown : Array<String>; } -> Dynamic -> Void):Void;
	/**
		<p>Detect the sentiment of the text in this document.</p>
	**/
	@:overload(function(callback:js.Error -> Float -> Dynamic -> Void):Void { })
	function detectSentiment(options:{ /**
		<ul> <li>Enable verbose mode for more detailed results. Default: <code>false</code></li> </ul> 
	**/
	var verbose : Bool; }, callback:js.Error -> Float -> Dynamic -> Void):Void;
}