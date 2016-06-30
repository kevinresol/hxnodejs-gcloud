# gcloud

Haxe externs for the [gcloud nodejs library](https://github.com/GoogleCloudPlatform/gcloud-node)

## Usage

```haxe
var gcloud = new GCloud({projectId:'your-project-id'});
var datastore = gcloud.datastore();
...
```

## How to update extern against latest gcloud lib

```bash
cd ref
npm install
npm run docs
haxe build.hxml
```

## TODO

Support `new Datastore({projectId:'your-project-id'});` to mimic the js call of `gcloud.datastore({projectId:'your-project-id'})` 