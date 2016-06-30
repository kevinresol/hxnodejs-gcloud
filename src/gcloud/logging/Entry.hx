package gcloud.logging;
@:jsRequire("gcloud", "logging.entry") extern class Entry {
	/**
		<p>Create an entry object to define new data to insert into a log.</p>
	**/
	@:selfCall
	function new(resource:haxe.extern.EitherType<String, Dynamic>, data:haxe.extern.EitherType<String, Dynamic>);
}