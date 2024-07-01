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
| `props` | [`BucketProps`](#BucketProps-) | *No description.* TODO |

---

#### `props`<sup>Optional</sup>

- *Type:* [`BucketProps`](#BucketProps-)

---

### Methods

#### Preflight Methods

| **Name** | **Description** |
| --- | --- |
| [`addFile`](#preflight-addFile-) | Add a file to the bucket from system folder. |
| [`addObject`](#preflight-addObject-) | Add a file to the bucket that is uploaded when the app is deployed. |
| [`onCreate`](#preflight-onCreate-) | Run an inflight whenever a file is uploaded to the bucket. |
| [`onDelete`](#preflight-onDelete-) | Run an inflight whenever a file is deleted from the bucket. |
| [`onEvent`](#preflight-onEvent-) | Run an inflight whenever a file is uploaded, modified, or deleted from the bucket. |
| [`onUpdate`](#preflight-onUpdate-) | Run an inflight whenever a file is updated in the bucket. |

#### Inflight Methods

| **Name** | **Description** |
| --- | --- |
| [`copy`](#inflight-copy) | Copy an object to a new location in the bucket. |
| [`delete`](#inflight-delete) | Delete an existing object using a key from the bucket. |
| [`exists`](#inflight-exists) | Check if an object exists in the bucket. |
| [`get`](#inflight-get) | Retrieve an object from the bucket. |
| [`getJson`](#inflight-getJson-) | Retrieve a Json object from the bucket. |
| [`list`](#inflight-list) | Retrieve existing objects keys from the bucket. |
| [`metadata`](#inflight-metadata) | Get the metadata of an object in the bucket. |
| [`publicUrl`](#inflight-publicUrl-) | Returns a url to the given file. |
| [`put`](#inflight-put) | Put an object in the bucket. |
| [`putJson`](#inflight-putJson-) | Put a Json object in the bucket. |
| [`rename`](#inflight-rename) | Move an object to a new location in the bucket. |
| [`signedUrl`](#inflight-signedUrl-) | Returns a signed url to the given file. |
| [`tryDelete`](#inflight-tryDelete-) | Delete an object from the bucket if it exists. |
| [`tryGet`](#inflight-tryGet-) | Get an object from the bucket if it exists If the bytes returned are not a valid UTF-8 string, an error is thrown. |
| [`tryGetJson`](#inflight-tryGetJson-) | Gets an object from the bucket if it exists, parsing it as Json. |

---

##### preflight addFile <a id="preflight-addFile-"></a>

```wing
addFile(key: str, path: str, encoding?: str): void
```

Add a file to the bucket from system folder.

###### `key`<sup>Required</sup> <a id="Bucket.addFile.parameter.key"></a>

- *Type:* str

The key or name to associate with the file.

---

###### `path`<sup>Required</sup> <a id="Bucket.addFile.parameter.path"></a>

- *Type:* str

The path to the file on the local system.

---

###### `encoding`<sup>Optional</sup> <a id="Bucket.addFile.parameter.encoding"></a>

- *Type:* str

The encoding to use when reading the file.

Defaults to "utf-8".

---

##### `preflight addObject` <a id="preflight-addObject-"></a>

```wing
addObject(key: str, body: str): void
```

Add a file to the bucket that is uploaded when the app is deployed.

TODO: In the future this will support uploading any `Blob` type or
referencing a file from the local filesystem.

###### `key`<sup>Required</sup> <a id="Bucket.addObject.parameter.key"></a>

- *Type:* str

---

###### `body`<sup>Required</sup> <a id="Bucket.addObject.parameter.body"></a>

- *Type:* str

---

##### `preflight onCreate` <a id="preflight-onCreate-"></a>

```wing
onCreate(fn: IBucketEventHandler, opts?: BucketOnCreateOptions): void
```

Run an inflight whenever a file is uploaded to the bucket.

###### `fn`<sup>Required</sup> <a id="Bucket.onCreate.parameter.fn"></a>

- *Type:* [`IBucketEventHandler`](#IBucketEventHandler-)

---

###### `opts`<sup>Optional</sup> <a id="Bucket.onCreate.parameter.opts"></a>

- *Type:* [`BucketOnCreateOptions`](#BucketOnCreateOptions-)

---

##### `preflight onDelete` <a id="preflight-onDelete-"></a>

```wing
onDelete(fn: IBucketEventHandler, opts?: BucketOnDeleteOptions): void
```

Run an inflight whenever a file is deleted from the bucket.

###### `fn`<sup>Required</sup> <a id="Bucket.onDelete.parameter.fn"></a>

- *Type:* [`IBucketEventHandler`](#IBucketEventHandler-)

---

###### `opts`<sup>Optional</sup> <a id="Bucket.onDelete.parameter.opts"></a>

- *Type:* [`BucketOnDeleteOptions`](#BucketOnDeleteOptions-)

---

##### `preflight onEvent` <a id="preflight-onEvent-"></a>

```wing
onEvent(fn: IBucketEventHandler, opts?: BucketOnEventOptions): void
```

Run an inflight whenever a file is uploaded, modified, or deleted from the bucket.

###### `fn`<sup>Required</sup> <a id="Bucket.onEvent.parameter.fn"></a>

- *Type:* [`IBucketEventHandler`](#IBucketEventHandler-)

---

###### `opts`<sup>Optional</sup> <a id="Bucket.onEvent.parameter.opts"></a>

- *Type:* [`BucketOnEventOptions`](#BucketOnEventOptions-)

---

##### `preflight onUpdate` <a id="preflight-onUpdate-"></a>

```wing
onUpdate(fn: IBucketEventHandler, opts?: BucketOnUpdateOptions): void
```

Run an inflight whenever a file is updated in the bucket.

###### `fn`<sup>Required</sup> <a id="Bucket.onUpdate.parameter.fn"></a>

- *Type:* [`IBucketEventHandler`](#IBucketEventHandler-)

---

###### `opts`<sup>Optional</sup> <a id="Bucket.onUpdate.parameter.opts"></a>

- *Type:* [`BucketOnUpdateOptions`](#BucketOnUpdateOptions-)

---

##### `inflight copy` <a id="inflight-copy"></a>

```wing
inflight copy(srcKey: str, dstKey: str): void
```

Copy an object to a new location in the bucket.

If the destination object already exists, it will be overwritten.

###### `srcKey`<sup>Required</sup> <a id="Bucket.copy.parameter.srcKey"></a>

- *Type:* str

The key of the source object you wish to copy.

---

###### `dstKey`<sup>Required</sup> <a id="Bucket.copy.parameter.dstKey"></a>

- *Type:* str

The key of the destination object after copying.

---

##### `inflight delete` <a id="inflight-delete"></a>

```wing
inflight delete(key: str, opts?: BucketDeleteOptions): void
```

Delete an existing object using a key from the bucket.

###### `key`<sup>Required</sup> <id="Bucket.delete.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `opts`<sup>Optional</sup> <id="IBucketClient.delete.parameter.opts"></a>

- *Type:* [`BucketDeleteOptions`](#BucketDeleteOptions-)

Options available for delete an item from a bucket.

---

##### `inflight exists` <a id="inflight-exists"></a>

```wing
inflight exists(key: str): bool
```

Check if an object exists in the bucket.

###### `key`<sup>Required</sup> <a id="Bucket.exists.parameter.key"></a>

- *Type:* str

Key of the object.

---

##### `inflight get` <a id="inflight-get"></a>

```wing
inflight get(key: str, options?: BucketGetOptions): str
```

Retrieve an object from the bucket.

If the bytes returned are not a valid UTF-8 string, an error is thrown.

###### `key`<sup>Required</sup> <a id="Bucket.get.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `options`<sup>Optional</sup> <a id="Bucket.get.parameter.options"></a>

- *Type:* [`BucketGetOptions`](#BucketGetOptions-)

Additional get options.

---

##### `inflight getJson` <a id="inflight-getJson-"></a>

```wing
inflight getJson(key: str): Json
```

Retrieve a Json object from the bucket.

###### `key`<sup>Required</sup> <a id="Bucket.getJson.parameter.key"></a>

- *Type:* str

Key of the object.

---

##### `inflight list` <a id="inflight-list"></a>

```wing
inflight list(prefix?: str): MutArray<str>
```

Retrieve existing objects keys from the bucket.

###### `prefix`<sup>Optional</sup> <a id="Bucket.list.parameter.prefix"></a>

- *Type:* str

Limits the response to keys that begin with the specified prefix.

---

##### `inflight metadata` <a id="inflight-metadata"></a>

```wing
inflight metadata(key: str): ObjectMetadata
```

Get the metadata of an object in the bucket.

###### `key`<sup>Required</sup> <a id="Bucket.metadata.parameter.key"></a>

- *Type:* str

Key of the object.

---

##### `inflight publicUrl` <a id="inflight-publicUrl-"></a>

```wing
inflight publicUrl(key: str): str
```

Returns a url to the given file.

###### `key`<sup>Required</sup> <a id="Bucket.publicUrl.parameter.key"></a>

- *Type:* str

---

##### `inflight put` <a id="inflight-put"></a>

```wing
inflight put(key: str, body: str, options?: BucketPutOptions): void
```

Put an object in the bucket.

###### `key`<sup>Required</sup> <a id="Bucket.put.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `body`<sup>Required</sup> <a id="Bucket.put.parameter.body"></a>

- *Type:* str

Content of the object we want to store into the bucket.

---

###### `options`<sup>Optional</sup> <a id="Bucket.put.parameter.options"></a>

- *Type:* [`BucketPutOptions`](#BucketPutOptions-)

Additional options.

---

##### `inflight putJson` <a id="inflight-putJson-"></a>

```wing
inflight putJson(key: str, body: Json): void
```

Put a Json object in the bucket.

###### `key`<sup>Required</sup> <a id="Bucket.putJson.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `body`<sup>Required</sup> <a id="Bucket.putJson.parameter.body"></a>

- *Type:* [`Json`](#Json)

Json object that we want to store into the bucket.

---

##### `inflight rename` <a id="inflight-rename"></a>

```wing
inflight rename(srcKey: str, dstKey: str): void
```

Move an object to a new location in the bucket.

If the destination object already exists, it will be overwritten. 
Returns once the renaming is finished.

###### `srcKey`<sup>Required</sup> <a id="Bucket.rename.parameter.srcKey"></a>

- *Type:* str

The key of the source object you wish to rename.

---

###### `dstKey`<sup>Required</sup> <a id="Bucket.rename.parameter.dstKey"></a>

- *Type:* str

The key of the destination object after renaming.

---

##### `inflight signedUrl` <a id="inflight-signedUrl-"></a>

```wing
inflight signedUrl(key: str, options?: BucketSignedUrlOptions): str
```

Returns a signed url to the given file.

###### `key`<sup>Required</sup> <a id="Bucket.signedUrl.parameter.key"></a>

- *Type:* str

The key to access the cloud object.

---

###### `options`<sup>Optional</sup> <a id="Bucket.signedUrl.parameter.options"></a>

- *Type:* [`BucketSignedUrlOptions`](#BucketSignedUrlOptions-)

The signedUrlOptions where you can provide the configurations of the signed url.

---

##### `inflight tryDelete` <a id="inflight-tryDelete-"></a>

```wing
inflight tryDelete(key: str): bool
```

Delete an object from the bucket if it exists.

###### `key`<sup>Required</sup> <a id="Bucket.tryDelete.parameter.key"></a>

- *Type:* str

Key of the object.

---

##### `inflight tryGet` <a id="inflight-tryGet-"></a>

```wing
inflight tryGet(key: str, options?: BucketTryGetOptions): str?
```

Get an object from the bucket if it exists If the bytes returned are not a valid UTF-8 string, an error is thrown.

###### `key`<sup>Required</sup> <a id="Bucket.tryGet.parameter.key"></a>

- *Type:* str

Key of the object.

---

###### `options`<sup>Optional</sup> <a id="Bucket.tryGet.parameter.options"></a>

- *Type:* [`BucketTryGetOptions`](#BucketTryGetOptions-)

Additional get options.

---

##### `inflight tryGetJson` <a id="inflight-tryGetJson-"></a>

```wing
inflight tryGetJson(key: str): Json?
```

Gets an object from the bucket if it exists, parsing it as Json.

###### `key`<sup>Required</sup> <a id="Bucket.tryGetJson.parameter.key"></a>

- *Type:* str

Key of the object.

---

## Structs <a name="Structs" id="Structs"></a>

### BucketDeleteOptions <a id="BucketDeleteOptions-"></a>

Options for `Bucket.delete()`.

#### Initializer <a id="BucketDeleteOptions.Initializer"></a>

```wing
let BucketDeleteOptions = BucketDeleteOptions{ ... };
```

#### Properties <a name="Properties" id="BucketDeleteOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| mustExist | `bool` | Check failures on the method and retrieve errors if any. |

---

##### `mustExist`<sup>Optional</sup> <a id="BucketDeleteOptions.property.mustExist"></a>

```wing
mustExist: bool;
```

- *Type:* bool
- *Default:* false

Check failures on the method and retrieve errors if any.

---

### BucketEvent <a id="BucketEvent-"></a>

#### Initializer <a id="BucketEvent.Initializer"></a>

```wing
let BucketEvent = BucketEvent{ ... };
```

#### Properties <a id="BucketEvent.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| key | `str` | The bucket key that triggered the event. |
| type | [`BucketEventType`](#BucketEventType-) | Type of event. |

---

##### `key`<sup>Required</sup> <a id="BucketEvent.property.key"></a>

```wing
key: str;
```

- *Type:* str

The bucket key that triggered the event.

---

##### `type`<sup>Required</sup> <a id="BucketEvent.property.type"></a>

```wing
type: BucketEventType;
```

- *Type:* [`BucketEventType`](#BucketEventType-)

Type of event.

---

### BucketGetOptions <a id="BucketGetOptions-"></a>

Options for `Bucket.get()`.

#### Initializer <a id="BucketGetOptions.Initializer"></a>

```wing
let BucketGetOptions = BucketGetOptions{ ... };
```

#### Properties <a id="BucketGetOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| endByte | `num` | The ending byte to read up to (including). |
| startByte | `num` | The starting byte to read from. |

---

##### `endByte`<sup>Optional</sup> <a id="BucketGetOptions.property.endByte"></a>

```wing
endByte: num;
```

- *Type:* num
- *Default:* undefined

The ending byte to read up to (including).

---

##### `startByte`<sup>Optional</sup> <a id="BucketGetOptions.property.startByte"></a>

```wing
startByte: num;
```

- *Type:* num
- *Default:* undefined

The starting byte to read from.

---

### BucketOnCreateOptions <a id="BucketOnCreateOptions-"></a>

`onCreate` event options.

#### Initializer <a id="BucketOnCreateOptions.Initializer"></a>

```wing
let BucketOnCreateOptions = BucketOnCreateOptions{ ... };
```

### BucketOnDeleteOptions <a id="BucketOnDeleteOptions-"></a>

`onDelete` event options.

#### Initializer <a id="BucketOnDeleteOptions.Initializer"></a>

```wing
let BucketOnDeleteOptions = BucketOnDeleteOptions{ ... };
```

### BucketOnEventOptions <a id="BucketOnEventOptions-"></a>

`onEvent` options.

#### Initializer <a id="BucketOnEventOptions.Initializer"></a>

```wing
let BucketOnEventOptions = BucketOnEventOptions{ ... };
```

### BucketOnUpdateOptions <a id="BucketOnUpdateOptions"></a>

`onUpdate` event options.

#### Initializer <a id="BucketOnUpdateOptions.Initializer"></a>

```wing
let BucketOnUpdateOptions = BucketOnUpdateOptions{ ... };
```

### BucketProps <a id="BucketProps-"></a>

Options for `Bucket`.

#### Initializer <a id="BucketProps.Initializer"></a>

```wing
let BucketProps = BucketProps{ ... };
```

#### Properties <a id="BucketProps.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| public | `bool` | Whether the bucket's objects should be publicly accessible. |

---

##### `public`<sup>Optional</sup> <a id="BucketProps.property.public"></a>

```wing
public: bool;
```

- *Type:* bool
- *Default:* false

Whether the bucket's objects should be publicly accessible.

---

### BucketPutOptions <a name id="BucketPutOptions-"></a>

Options for `Bucket.put()`.

#### Initializer <a id="BucketPutOptions.Initializer"></a>

```wing
let BucketPutOptions = BucketPutOptions{ ... };
```

#### Properties <a id="BucketPutOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| contentType | `str` | The HTTP Content-Type of the object. |

---

##### `contentType`<sup>Required</sup> <a id="BucketPutOptions.property.contentType"></a>

```wing
contentType: str;
```

- *Type:* str
- *Default:* Determined by file extension or fallback to "application/octet-stream"

The HTTP Content-Type of the object.

> [https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type)

---

### BucketSignedUrlOptions <a id="BucketSignedUrlOptions-"></a>

Options for `Bucket.signedUrl()`.

#### Initializer <a id="BucketSignedUrlOptions.Initializer"></a>

```wing
let BucketSignedUrlOptions = BucketSignedUrlOptions{ ... };
```

#### Properties <a id="BucketSignedUrlOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| action | [`BucketSignedUrlAction`](#BucketSignedUrlAction-) | The action allowed by the signed URL. |
| duration | [`duration`](#Duration) | The duration for the signed URL to expire. |

---

##### `action`<sup>Optional</sup> <a id="BucketSignedUrlOptions.property.action"></a>

```wing
action: BucketSignedUrlAction;
```

- *Type:* [`BucketSignedUrlAction`](#BucketSignedUrlAction-)
- *Default:* [`BucketSignedUrlAction.DOWNLOAD`](#BucketSignedUrlAction.DOWNLOAD-)

The action allowed by the signed URL.

---

##### `duration`<sup>Optional</sup> <a id="BucketSignedUrlOptions.property.duration"></a>

```wing
duration: duration;
```

- *Type:* [`duration`](#Duration)
- *Default:* 15m

The duration for the signed URL to expire.

---

### BucketTryGetOptions <a id="BucketTryGetOptions-"></a>

Options for `Bucket.tryGet()`.

#### Initializer <a id="BucketTryGetOptions.Initializer"></a>

```wing
let BucketTryGetOptions = BucketTryGetOptions{ ... };
```

#### Properties <a id="BucketTryGetOptions.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| endByte | `num` | The ending byte to read up to (including). |
| startByte | `num` | The starting byte to read from. |

---

##### `endByte`<sup>Optional</sup> <a id="BucketTryGetOptions.property.endByte"></a>

```wing
endByte: num;
```

- *Type:* num
- *Default:* undefined

The ending byte to read up to (including).

---

##### `startByte`<sup>Optional</sup> <a id="BucketTryGetOptions.property.startByte"></a>

```wing
startByte: num;
```

- *Type:* num
- *Default:* undefined

The starting byte to read from.

---

### ObjectMetadata <a id="ObjectMetadata-"></a>

Metadata of a bucket object.

#### Initializer <a id="ObjectMetadata.Initializer"></a>

```wing
let ObjectMetadata = ObjectMetadata{ ... };
```

#### Properties <a id="ObjectMetadata.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| lastModified | [`datetime`](#Datetime) | The time the object was last modified. |
| size | `num` | The size of the object in bytes. |
| contentType | `str` | The content type of the object, if it is known. |

---

##### `lastModified`<sup>Required</sup> <a id="ObjectMetadata.property.lastModified"></a>

```wing
lastModified: datetime;
```

- *Type:* [`datetime`](#Datetime)

The time the object was last modified.

---

##### `size`<sup>Required</sup> <a id="ObjectMetadata.property.size"></a>

```wing
size: num;
```

- *Type:* num

The size of the object in bytes.

---

##### `contentType`<sup>Optional</sup> <a id="ObjectMetadata.property.contentType"></a>

```wing
contentType: str;
```

- *Type:* str

The content type of the object, if it is known.

---

## Protocols <a id="Protocols"></a>

### IBucketEventHandler <a id="IBucketEventHandler-"></a>

#### Methods <a id="IBucketEventHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| handle | Function that will be called when an event notification is fired. |

---

##### `handle` <a id="IBucketEventHandler.handle"></a>

```wing
inflight handle(key: str, type: BucketEventType): void
```

Function that will be called when an event notification is fired.

###### `key`<sup>Required</sup> <a id="IBucketEventHandler.handle.parameter.key"></a>

- *Type:* str

---

###### `type`<sup>Required</sup> <a id="IBucketEventHandler.handle.parameter.type"></a>

- *Type:* [`BucketEventType`](#BucketEventType-)

---

## Enums <a id="Enums"></a>

### BucketEventType <a id="BucketEventType-"></a>

Bucket events to subscribe to.

#### Members <a id="BucketEventType.Members"></a>

| **Name** | **Description** |
| --- | --- |
| CREATE | Create. |
| DELETE | Delete. |
| UPDATE | Update. |

---

##### `CREATE` <a id="BucketEventType.CREATE-"></a>

Create.

---

##### `DELETE` <a id="BucketEventType.DELETE-"></a>

Delete.

---

##### `UPDATE` <a id="BucketEventType.UPDATE-"></a>

Update.

---

### BucketSignedUrlAction <a id="BucketSignedUrlAction-"></a>

Specifies the action permitted by a presigned URL for a bucket.

#### Members <a id="BucketSignedUrlAction.Members"></a>

| **Name** | **Description** |
| --- | --- |
| DOWNLOAD | Represents a HTTP GET request for a presigned URL, allowing read access for an object in the bucket. |
| UPLOAD | Represents a HTTP PUT request for a presigned URL, allowing write access for an object in the bucket. |

---

##### `DOWNLOAD` <a id="BucketSignedUrlAction.DOWNLOAD-"></a>

Represents a HTTP GET request for a presigned URL, allowing read access for an object in the bucket.

---

##### `UPLOAD` <a id="BucketSignedUrlAction.UPLOAD-"></a>

Represents a HTTP PUT request for a presigned URL, allowing write access for an object in the bucket.

---
