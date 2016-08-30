package google.cloud.datastore;

typedef Key = {
	namespace:String,
	path:Array<Dynamic>,
	?id:Int,
	?name:String,
}