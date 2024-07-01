# Bucket

The `Bucket` resource represents a container for storing data in the cloud.

Buckets are a common way to store arbitrary files (images, videos, etc.), but
can also be used to store structured data like JSON or CSV files.

Buckets in the cloud use object storage, which is optimized for storing large
amounts of data with high availability.

Unlike other kinds of storage like file storage, data is not stored in a
hierarchical structure, but rather as a flat list of objects, each associated
with a key.

## API Reference

### Initializers

```wing
new Bucket(props?: BucketProps);
```

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`props`](#Bucket.Initializer.parameter.props) | [`BucketProps`](#BucketProps) | *No description.* TODO |

---

#### `props`<sup>Optional</sup> <a name="props" id="Bucket.Initializer.parameter.props"></a>

- *Type:* [`BucketProps`](#BucketProps)

---

### Methods

#### Preflight Methods

| **Name** | **Description** |
| --- | --- |
| [`addFile`](#Bucket.addFile) | Add a file to the bucket from system folder. |
| [`addObject`](#Bucket.addObject) | Add a file to the bucket that is uploaded when the app is deployed. |
| [`onCreate`](#Bucket.onCreate) | Run an inflight whenever a file is uploaded to the bucket. |
| [`onDelete`](#Bucket.onDelete) | Run an inflight whenever a file is deleted from the bucket. |
| [`onEvent`](#Bucket.onEvent) | Run an inflight whenever a file is uploaded, modified, or deleted from the bucket. |
| [`onUpdate`](#Bucket.onUpdate) | Run an inflight whenever a file is updated in the bucket. |

#### Inflight Methods

| **Name** | **Description** |
| --- | --- |
| [`copy`](#IBucketClient.copy) | Copy an object to a new location in the bucket. |
| [`delete`](#IBucketClient.delete) | Delete an existing object using a key from the bucket. |
| [`exists`](#IBucketClient.exists) | Check if an object exists in the bucket. |
| [`get`](#IBucketClient.get) | Retrieve an object from the bucket. |
| [`getJson`](#IBucketClient.getJson) | Retrieve a Json object from the bucket. |
| [`list`](#IBucketClient.list) | Retrieve existing objects keys from the bucket. |
| [`metadata`](#IBucketClient.metadata) | Get the metadata of an object in the bucket. |
| [`publicUrl`](#IBucketClient.publicUrl) | Returns a url to the given file. |
| [`put`](#IBucketClient.put) | Put an object in the bucket. |
| [`putJson`](#IBucketClient.putJson) | Put a Json object in the bucket. |
| [`rename`](#IBucketClient.rename) | Move an object to a new location in the bucket. |
| [`signedUrl`](#IBucketClient.signedUrl) | Returns a signed url to the given file. |
| [`tryDelete`](#IBucketClient.tryDelete) | Delete an object from the bucket if it exists. |
| [`tryGet`]#IBucketClient.tryGet() | Get an object from the bucket if it exists If the bytes returned are not a valid UTF-8 string, an error is thrown. |
| [`tryGetJson`](#IBucketClient.tryGetJson) | Gets an object from the bucket if it exists, parsing it as Json. |

---

##### `addFile` <a name="addFile" id="Bucket.addFile"></a>

```wing
addFile(key: str, path: str, encoding?: str): void
```

Add a file to the bucket from system folder.

###### `key`<sup>Required</sup> <a name="key" id="Bucket.addFile.parameter.key"></a>

- *Type:* str

The key or name to associate with the file.

---

###### `path`<sup>Required</sup> <a name="key" id="Bucket.addFile.parameter.path"></a>

- *Type:* str

The path to the file on the local system.

---

###### `encoding`<sup>Optional</sup> <a name="key" id="Bucket.addFile.parameter.encoding"></a>

- *Type:* str

The encoding to use when reading the file.

Defaults to "utf-8".

---

##### `addObject` <a name="addObject" id="Bucket.addObject"></a>

```wing
addObject(key: str, body: str): void
```

Add a file to the bucket that is uploaded when the app is deployed.

TODO: In the future this will support uploading any `Blob` type or
referencing a file from the local filesystem.

###### `key`<sup>Required</sup> <a name="key" id="Bucket.addObject.parameter.key"></a>

- *Type:* str

---

###### `body`<sup>Required</sup> <a name="body" id="Bucket.addObject.parameter.body"></a>

- *Type:* str

---

##### `onCreate` <a name="onCreate" id="Bucket.onCreate"></a>

```wing
onCreate(fn: IBucketEventHandler, opts?: BucketOnCreateOptions): void
```

Run an inflight whenever a file is uploaded to the bucket.

###### `fn`<sup>Required</sup> <a name="fn" id="Bucket.onCreate.parameter.fn"></a>

- *Type:* [`IBucketEventHandler`](#IBucketEventHandler)

---

###### `opts`<sup>Optional</sup> <a name="opts" id="Bucket.onCreate.parameter.opts"></a>

- *Type:* [`BucketOnCreateOptions`](#BucketCreateOptions)

---

##### `onDelete` <a name="onDelete" id="Bucket.onDelete"></a>

```wing
onDelete(fn: IBucketEventHandler, opts?: BucketOnDeleteOptions): void
```

Run an inflight whenever a file is deleted from the bucket.

###### `fn`<sup>Required</sup> <a name="fn" id="Bucket.onDelete.parameter.fn"></a>

- *Type:* [`IBucketEventHandler`](#IBucketEventHandler)

---

###### `opts`<sup>Optional</sup> <a name="opts" id="Bucket.onDelete.parameter.opts"></a>

- *Type:* [`BucketOnDeleteOptions`](#BucketOnDeleteOptions)

---

##### `onEvent` <a name="onEvent" id="Bucket.onEvent"></a>

```wing
onEvent(fn: IBucketEventHandler, opts?: BucketOnEventOptions): void
```

Run an inflight whenever a file is uploaded, modified, or deleted from the bucket.

###### `fn`<sup>Required</sup> <a name="fn" id="Bucket.onEvent.parameter.fn"></a>

- *Type:* [`IBucketEventHandler`](#IBucketEventHandler)

---

###### `opts`<sup>Optional</sup> <a name="opts" id="Bucket.onEvent.parameter.opts"></a>

- *Type:* [`BucketOnEventOptions`](#BucketOnEventOptions)

---

##### `onUpdate` <a name="onUpdate" id="Bucket.onUpdate"></a>

```wing
onUpdate(fn: IBucketEventHandler, opts?: BucketOnUpdateOptions): void
```

Run an inflight whenever a file is updated in the bucket.

###### `fn`<sup>Required</sup> <a name="fn" id="Bucket.onUpdate.parameter.fn"></a>

- *Type:* [`IBucketEventHandler`](#IBucketEventHandler)

---

###### `opts`<sup>Optional</sup> <a name="opts" id="Bucket.onUpdate.parameter.opts"></a>

- *Type:* [`BucketOnUpdateOptions`](#BucketOnUpdateOptions)

---

##### `copy` <a name="copy" id="IBucketClient.copy"></a>

```wing
inflight copy(srcKey: str, dstKey: str): void
```

Copy an object to a new location in the bucket.

If the destination object already exists, it will be overwritten.

###### `srcKey`<sup>Required</sup> <a name="srcKey" id="IBucketClient.copy.parameter.srcKey"></a>

- *Type:* str

The key of the source object you wish to copy.

---

###### `dstKey`<sup>Required</sup> <a name="dstKey" id="IBucketClient.copy.parameter.dstKey"></a>

- *Type:* str

The key of the destination object after copying.

---

##### `delete` <a name="delete" id="IBucketClient.delete"></a>

```wing
inflight delete(key: str, opts?: BucketDeleteOptions): void
```

Delete an existing object using a key from the bucket.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.delete.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `opts`<sup>Optional</sup> <a name="opts" id="IBucketClient.delete.parameter.opts"></a>

- *Type:* [`BucketDeleteOptions`](#BucketDeleteOptions)

Options available for delete an item from a bucket.

---

##### `exists` <a name="exists" id="IBucketClient.exists"></a>

```wing
inflight exists(key: str): bool
```

Check if an object exists in the bucket.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.exists.parameter.key"></a>

- *Type:* str

Key of the object.

---

##### `get` <a name="get" id="IBucketClient.get"></a>

```wing
inflight get(key: str, options?: BucketGetOptions): str
```

Retrieve an object from the bucket.

If the bytes returned are not a valid UTF-8 string, an error is thrown.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.get.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `options`<sup>Optional</sup> <a name="options" id="IBucketClient.get.parameter.options"></a>

- *Type:* [`BucketGetOptions`](#BucketGetOptions)

Additional get options.

---

##### `getJson` <a name="getJson" id="IBucketClient.getJson"></a>

```wing
inflight getJson(key: str): Json
```

Retrieve a Json object from the bucket.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.getJson.parameter.key"></a>

- *Type:* str

Key of the object.

---

##### `list` <a name="list" id="IBucketClient.list"></a>

```wing
inflight list(prefix?: str): MutArray<str>
```

Retrieve existing objects keys from the bucket.

###### `prefix`<sup>Optional</sup> <a name="prefix" id="IBucketClient.list.parameter.prefix"></a>

- *Type:* str

Limits the response to keys that begin with the specified prefix.

---

##### `metadata` <a name="metadata" id="IBucketClient.metadata"></a>

```wing
inflight metadata(key: str): ObjectMetadata
```

Get the metadata of an object in the bucket.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.metadata.parameter.key"></a>

- *Type:* str

Key of the object.

---

##### `publicUrl` <a name="publicUrl" id="IBucketClient.publicUrl"></a>

```wing
inflight publicUrl(key: str): str
```

Returns a url to the given file.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.publicUrl.parameter.key"></a>

- *Type:* str

---

##### `put` <a name="put" id="IBucketClient.put"></a>

```wing
inflight put(key: str, body: str, options?: BucketPutOptions): void
```

Put an object in the bucket.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.put.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `body`<sup>Required</sup> <a name="body" id="IBucketClient.put.parameter.body"></a>

- *Type:* str

Content of the object we want to store into the bucket.

---

###### `options`<sup>Optional</sup> <a name="options" id="IBucketClient.put.parameter.options"></a>

- *Type:* [`BucketPutOptions`](#BucketPutOptions)

Additional options.

---

##### `putJson` <a name="putJson" id="IBucketClient.putJson"></a>

```wing
inflight putJson(key: str, body: Json): void
```

Put a Json object in the bucket.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.putJson.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `body`<sup>Required</sup> <a name="body" id="IBucketClient.putJson.parameter.body"></a>

- *Type:* [`Json`](#Json)

Json object that we want to store into the bucket.

---

##### `rename` <a name="rename" id="IBucketClient.rename"></a>

```wing
inflight rename(srcKey: str, dstKey: str): void
```

Move an object to a new location in the bucket.

If the destination object already exists, it will be overwritten. 
Returns once the renaming is finished.

###### `srcKey`<sup>Required</sup> <a name="srcKey" id="IBucketClient.rename.parameter.srcKey"></a>

- *Type:* str

The key of the source object you wish to rename.

---

###### `dstKey`<sup>Required</sup> <a name="dstKey" id="IBucketClient.rename.parameter.dstKey"></a>

- *Type:* str

The key of the destination object after renaming.

---

##### `signedUrl` <a name="signedUrl" id="IBucketClient.signedUrl"></a>

```wing
inflight signedUrl(key: str, options?: BucketSignedUrlOptions): str
```

Returns a signed url to the given file.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.signedUrl.parameter.key"></a>

- *Type:* str

The key to access the cloud object.

---

###### `options`<sup>Optional</sup> <a name="options" id="IBucketClient.signedUrl.parameter.options"></a>

- *Type:* [`BucketSignedUrlOptions`](#BucketSignedUrlOptions)

The signedUrlOptions where you can provide the configurations of the signed url.

---

##### `tryDelete` <a name="tryDelete" id="IBucketClient.tryDelete"></a>

```wing
inflight tryDelete(key: str): bool
```

Delete an object from the bucket if it exists.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.tryDelete.parameter.key"></a>

- *Type:* str

Key of the object.

---

##### `tryGet` <a name="tryGet" id="IBucketClient.tryGet"></a>

```wing
inflight tryGet(key: str, options?: BucketTryGetOptions): str?
```

Get an object from the bucket if it exists If the bytes returned are not a valid UTF-8 string, an error is thrown.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.tryGet.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `options`<sup>Optional</sup> <a name="options" id="IBucketClient.tryGet.parameter.options"></a>

- *Type:* [`BucketTryGetOptions`](#BucketTryGetOptions)

Additional get options.

---

##### `tryGetJson` <a name="tryGetJson" id="IBucketClient.tryGetJson"></a>

```wing
inflight tryGetJson(key: str): Json?
```

Gets an object from the bucket if it exists, parsing it as Json.

###### `key`<sup>Required</sup> <a name="key" id="IBucketClient.tryGetJson.parameter.key"></a>

- *Type:* str

Key of the object.

---

## Structs <a name="Structs" id="Structs"></a>

### BucketDeleteOptions <a name="BucketDeleteOptions" id="BucketDeleteOptions"></a>

Options for `Bucket.delete()`.

#### Initializer <a name="Initializer" id="BucketDeleteOptions.Initializer"></a>

```wing
let BucketDeleteOptions = BucketDeleteOptions{ ... };
```

#### Properties <a name="Properties" id="BucketDeleteOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`mustExist`](#BucketDeleteOptions.property.mustExist) | `bool` | Check failures on the method and retrieve errors if any. |

---

##### `mustExist`<sup>Optional</sup> <a name="mustExist" id="BucketDeleteOptions.property.mustExist"></a>

```wing
mustExist: bool;
```

- *Type:* bool
- *Default:* false

Check failures on the method and retrieve errors if any.

---

### BucketEvent <a name="BucketEvent" id="BucketEvent"></a>

#### Initializer <a name="Initializer" id="BucketEvent.Initializer"></a>

```wing
let BucketEvent = BucketEvent{ ... };
```

#### Properties <a name="Properties" id="BucketEvent.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`key`](#BucketEvent.property.key) | `str` | The bucket key that triggered the event. |
| [`type`](#BucketEvent.property.type) | [`BucketEventType`](#BucketEventType) | Type of event. |

---

##### `key`<sup>Required</sup> <a name="key" id="BucketEvent.property.key"></a>

```wing
key: str;
```

- *Type:* str

The bucket key that triggered the event.

---

##### `type`<sup>Required</sup> <a name="type" id="BucketEvent.property.type"></a>

```wing
type: BucketEventType;
```

- *Type:* [`BucketEventType`](#BucketEventType)

Type of event.

---

### BucketGetOptions <a name="BucketGetOptions" id="BucketGetOptions"></a>

Options for `Bucket.get()`.

#### Initializer <a name="Initializer" id="BucketGetOptions.Initializer"></a>

```wing
let BucketGetOptions = BucketGetOptions{ ... };
```

#### Properties <a name="Properties" id="BucketGetOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`endByte`](#BucketGetOptions.property.endByte) | `num` | The ending byte to read up to (including). |
| [`startByte`](#BucketGetOptions.property.startByte) | `num` | The starting byte to read from. |

---

##### `endByte`<sup>Optional</sup> <a name="endByte" id="BucketGetOptions.property.endByte"></a>

```wing
endByte: num;
```

- *Type:* num
- *Default:* undefined

The ending byte to read up to (including).

---

##### `startByte`<sup>Optional</sup> <a name="startByte" id="BucketGetOptions.property.startByte"></a>

```wing
startByte: num;
```

- *Type:* num
- *Default:* undefined

The starting byte to read from.

---

### BucketOnCreateOptions <a name="BucketOnCreateOptions" id="BucketOnCreateOptions"></a>

`onCreate` event options.

#### Initializer <a name="Initializer" id="BucketOnCreateOptions.Initializer"></a>

```wing
let BucketOnCreateOptions = BucketOnCreateOptions{ ... };
```

### BucketOnDeleteOptions <a name="BucketOnDeleteOptions" id="BucketOnDeleteOptions"></a>

`onDelete` event options.

#### Initializer <a name="Initializer" id="BucketOnDeleteOptions.Initializer"></a>

```wing
let BucketOnDeleteOptions = BucketOnDeleteOptions{ ... };
```

### BucketOnEventOptions <a name="BucketOnEventOptions" id="BucketOnEventOptions"></a>

`onEvent` options.

#### Initializer <a name="Initializer" id="BucketOnEventOptions.Initializer"></a>

```wing
let BucketOnEventOptions = BucketOnEventOptions{ ... };
```

### BucketOnUpdateOptions <a name="BucketOnUpdateOptions" id="BucketOnUpdateOptions"></a>

`onUpdate` event options.

#### Initializer <a name="Initializer" id="BucketOnUpdateOptions.Initializer"></a>

```wing
let BucketOnUpdateOptions = BucketOnUpdateOptions{ ... };
```

### BucketProps <a name="BucketProps" id="BucketProps"></a>

Options for `Bucket`.

#### Initializer <a name="Initializer" id="BucketProps.Initializer"></a>

```wing
let BucketProps = BucketProps{ ... };
```

#### Properties <a name="Properties" id="BucketProps.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`public`](#BucketProps.property.public) | `bool` | Whether the bucket's objects should be publicly accessible. |

---

##### `public`<sup>Optional</sup> <a name="public" id="BucketProps.property.public"></a>

```wing
public: bool;
```

- *Type:* bool
- *Default:* false

Whether the bucket's objects should be publicly accessible.

---

### BucketPutOptions <a name="BucketPutOptions" id="BucketPutOptions"></a>

Options for `Bucket.put()`.

#### Initializer <a name="Initializer" id="BucketPutOptions.Initializer"></a>

```wing
let BucketPutOptions = BucketPutOptions{ ... };
```

#### Properties <a name="Properties" id="BucketPutOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`contentType`](#BucketPutOptions.property.contentType) | `str` | The HTTP Content-Type of the object. |

---

##### `contentType`<sup>Required</sup> <a name="contentType" id="BucketPutOptions.property.contentType"></a>

```wing
contentType: str;
```

- *Type:* str
- *Default:* Determined by file extension or fallback to "application/octet-stream"

The HTTP Content-Type of the object.

> [https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type)

---

### BucketSignedUrlOptions <a name="BucketSignedUrlOptions" id="BucketSignedUrlOptions"></a>

Options for `Bucket.signedUrl()`.

#### Initializer <a name="Initializer" id="BucketSignedUrlOptions.Initializer"></a>

```wing
let BucketSignedUrlOptions = BucketSignedUrlOptions{ ... };
```

#### Properties <a name="Properties" id="BucketSignedUrlOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`action`](#BucketSignedUrlOptions.property.action) | [`BucketSignedUrlAction`](#BucketSignedUrlAction) | The action allowed by the signed URL. |
| [`duration`](#BucketSignedUrlOptions.property.duration) | [`duration`](#Duration) | The duration for the signed URL to expire. |

---

##### `action`<sup>Optional</sup> <a name="action" id="BucketSignedUrlOptions.property.action"></a>

```wing
action: BucketSignedUrlAction;
```

- *Type:* [`BucketSignedUrlAction`](#BucketSignedUrlAction)
- *Default:* [`BucketSignedUrlAction.DOWNLOAD`](#BucketSignedUrlAction.DOWNLOAD)

The action allowed by the signed URL.

---

##### `duration`<sup>Optional</sup> <a name="duration" id="BucketSignedUrlOptions.property.duration"></a>

```wing
duration: duration;
```

- *Type:* [`duration`](#Duration)
- *Default:* 15m

The duration for the signed URL to expire.

---

### BucketTryGetOptions <a name="BucketTryGetOptions" id="BucketTryGetOptions"></a>

Options for `Bucket.tryGet()`.

#### Initializer <a name="Initializer" id="BucketTryGetOptions.Initializer"></a>

```wing
let BucketTryGetOptions = BucketTryGetOptions{ ... };
```

#### Properties <a name="Properties" id="BucketTryGetOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`endByte`](#BucketTryGetOptions.property.endByte) | `num` | The ending byte to read up to (including). |
| [`startByte`](#BucketTryGetOptions.property.startByte) | `num` | The starting byte to read from. |

---

##### `endByte`<sup>Optional</sup> <a name="endByte" id="BucketTryGetOptions.property.endByte"></a>

```wing
endByte: num;
```

- *Type:* num
- *Default:* undefined

The ending byte to read up to (including).

---

##### `startByte`<sup>Optional</sup> <a name="startByte" id="BucketTryGetOptions.property.startByte"></a>

```wing
startByte: num;
```

- *Type:* num
- *Default:* undefined

The starting byte to read from.

---

### ObjectMetadata <a name="ObjectMetadata" id="ObjectMetadata"></a>

Metadata of a bucket object.

#### Initializer <a name="Initializer" id="ObjectMetadata.Initializer"></a>

```wing
let ObjectMetadata = ObjectMetadata{ ... };
```

#### Properties <a name="Properties" id="ObjectMetadata.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| [`lastModified`](#ObjectMetadata.property.lastModified) | [`datetime`](#Datetime) | The time the object was last modified. |
| [`size`](#ObjectMetadata.property.size) | `num` | The size of the object in bytes. |
| [`contentType`](#ObjectMetadata.property.contentType) | `str` | The content type of the object, if it is known. |

---

##### `lastModified`<sup>Required</sup> <a name="lastModified" id="ObjectMetadata.property.lastModified"></a>

```wing
lastModified: datetime;
```

- *Type:* [`datetime`](#Datetime)

The time the object was last modified.

---

##### `size`<sup>Required</sup> <a name="size" id="ObjectMetadata.property.size"></a>

```wing
size: num;
```

- *Type:* num

The size of the object in bytes.

---

##### `contentType`<sup>Optional</sup> <a name="contentType" id="ObjectMetadata.property.contentType"></a>

```wing
contentType: str;
```

- *Type:* str

The content type of the object, if it is known.

---

## Protocols <a name="Protocols" id="Protocols"></a>

### IBucketEventHandler <a name="IBucketEventHandler" id="IBucketEventHandler"></a>

#### Methods <a name="Methods" id="IBucketEventHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`handle`](#IBucketEventHandler.handle) | Function that will be called when an event notification is fired. |

---

##### `handle` <a name="handle" id="IBucketEventHandler.handle"></a>

```wing
inflight handle(key: str, type: BucketEventType): void
```

Function that will be called when an event notification is fired.

###### `key`<sup>Required</sup> <a name="key" id="IBucketEventHandler.handle.parameter.key"></a>

- *Type:* str

---

###### `type`<sup>Required</sup> <a name="type" id="IBucketEventHandler.handle.parameter.type"></a>

- *Type:* [`BucketEventType`](#BucketEventType)

---

## Enums <a name="Enums" id="Enums"></a>

### BucketEventType <a name="BucketEventType" id="BucketEventType"></a>

Bucket events to subscribe to.

#### Members <a name="Members" id="BucketEventType.Members"></a>

| **Name** | **Description** |
| --- | --- |
| [`CREATE`](#BucketEventType.CREATE) | Create. |
| [`CREATE`](#BucketEventType.DELETE) | Delete. |
| [`CREATE`](#BucketEventType.UPDATE) | Update. |

---

##### `CREATE` <a name="CREATE" id="BucketEventType.CREATE"></a>

Create.

---

##### `DELETE` <a name="DELETE" id="BucketEventType.DELETE"></a>

Delete.

---

##### `UPDATE` <a name="UPDATE" id="BucketEventType.UPDATE"></a>

Update.

---

### BucketSignedUrlAction <a name="BucketSignedUrlAction" id="BucketSignedUrlAction"></a>

Specifies the action permitted by a presigned URL for a bucket.

#### Members <a name="Members" id="BucketSignedUrlAction.Members"></a>

| **Name** | **Description** |
| --- | --- |
| [`DOWNLOAD`](#BucketSignedUrlAction.DOWNLOAD) | Represents a HTTP GET request for a presigned URL, allowing read access for an object in the bucket. |
| [`UPLOAD`](#BucketSignedUrlAction.UPLOAD) | Represents a HTTP PUT request for a presigned URL, allowing write access for an object in the bucket. |

---

##### `DOWNLOAD` <a name="DOWNLOAD" id="BucketSignedUrlAction.DOWNLOAD"></a>

Represents a HTTP GET request for a presigned URL, allowing read access for an object in the bucket.

---

##### `UPLOAD` <a name="UPLOAD" id="BucketSignedUrlAction.UPLOAD"></a>

Represents a HTTP PUT request for a presigned URL, allowing write access for an object in the bucket.

---
