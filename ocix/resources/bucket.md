# Bucket

The `Bucket` resource represents a container for storing data in the cloud.

Buckets are a common way to store arbitrary files (images, videos, etc.), but
can also be used to store structured data like JSON or CSV files.

Buckets in the cloud use object storage, which is optimized for storing large
amounts of data with high availability.

Unlike other kinds of storage like file storage, data is not stored in a
hierarchical structure, but rather as a flat list of objects, each associated
with a key.

## Table of Contents

<!-- markdownlint-disable MD007 -->
- [API Reference](#api-reference)
    - [Initializers](#initializers)
    - [Methods](#methods)
        - [Preflight Methods](#preflight-methods)
        - [Inflight Methods](#inflight-methods)
- [Structs](#structs)
- [Protocols](#protocols)
- [Enums](#enums)
<!-- markdownlint-enable MD007 -->

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

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

### Methods <a id="methods"></a>

#### Preflight Methods <a id="preflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`addFile`](#addFile-) | Add a file to the bucket from system folder. |
| [`addObject`](#addObject-) | Add a file to the bucket that is uploaded when the app is deployed. |
| [`onCreate`](#onCreate-) | Run an inflight whenever a file is uploaded to the bucket. |
| [`onDelete`](#onDelete-) | Run an inflight whenever a file is deleted from the bucket. |
| [`onEvent`](#onEvent-) | Run an inflight whenever a file is uploaded, modified, or deleted from the bucket. |
| [`onUpdate`](#onUpdate-) | Run an inflight whenever a file is updated in the bucket. |

#### Inflight Methods <a id="inflight-methods"></a>

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

##### addFile <a id="addFile-"></a>

```wing
addFile(key: str, path: str, encoding?: str): void
```

Add a file to the bucket from system folder.

###### `key`<sup>Required</sup> <a id="Bucket.addFile.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

The key or name to associate with the file.

---

###### `path`<sup>Required</sup> <a id="Bucket.addFile.parameter.path"></a>

- *Type:* [`str`](../spec.md#standard-types)

The path to the file on the local system.

---

###### `encoding`<sup>Optional</sup> <a id="Bucket.addFile.parameter.encoding"></a>

- *Type:* [`str`](../spec.md#standard-types)

The encoding to use when reading the file.

Defaults to "utf-8".

---

##### `addObject` <a id="addObject-"></a>

```wing
addObject(key: str, body: str): void
```

Add a file to the bucket that is uploaded when the app is deployed.

TODO: In the future this will support uploading any `Blob` type or
referencing a file from the local filesystem.

###### `key`<sup>Required</sup> <a id="Bucket.addObject.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

---

###### `body`<sup>Required</sup> <a id="Bucket.addObject.parameter.body"></a>

- *Type:* [`str`](../spec.md#standard-types)

---

##### `onCreate` <a id="onCreate-"></a>

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

##### `onDelete` <a id="onDelete-"></a>

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

##### `onEvent` <a id="onEvent-"></a>

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

##### `onUpdate` <a id="onUpdate-"></a>

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

- *Type:* [`str`](../spec.md#standard-types)

The key of the source object you wish to copy.

---

###### `dstKey`<sup>Required</sup> <a id="Bucket.copy.parameter.dstKey"></a>

- *Type:* [`str`](../spec.md#standard-types)

The key of the destination object after copying.

---

##### `inflight delete` <a id="inflight-delete"></a>

```wing
inflight delete(key: str, opts?: BucketDeleteOptions): void
```

Delete an existing object using a key from the bucket.

###### `key`<sup>Required</sup> <id="Bucket.delete.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

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

- *Type:* [`str`](../spec.md#standard-types)

Key of the object.

---

##### `inflight get` <a id="inflight-get"></a>

```wing
inflight get(key: str, options?: BucketGetOptions): str
```

Retrieve an object from the bucket.

If the bytes returned are not a valid UTF-8 string, an error is thrown.

###### `key`<sup>Required</sup> <a id="Bucket.get.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

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

- *Type:* [`str`](../spec.md#standard-types)

Key of the object.

---

##### `inflight list` <a id="inflight-list"></a>

```wing
inflight list(prefix?: str): MutArray<str>
```

Retrieve existing objects keys from the bucket.

###### `prefix`<sup>Optional</sup> <a id="Bucket.list.parameter.prefix"></a>

- *Type:* [`str`](../spec.md#standard-types)

Limits the response to keys that begin with the specified prefix.

---

##### `inflight metadata` <a id="inflight-metadata"></a>

```wing
inflight metadata(key: str): ObjectMetadata
```

Get the metadata of an object in the bucket.

###### `key`<sup>Required</sup> <a id="Bucket.metadata.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

Key of the object.

---

##### `inflight publicUrl` <a id="inflight-publicUrl-"></a>

```wing
inflight publicUrl(key: str): str
```

Returns a url to the given file.

###### `key`<sup>Required</sup> <a id="Bucket.publicUrl.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

---

##### `inflight put` <a id="inflight-put"></a>

```wing
inflight put(key: str, body: str, options?: BucketPutOptions): void
```

Put an object in the bucket.

###### `key`<sup>Required</sup> <a id="Bucket.put.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

Key of the object.

---

###### `body`<sup>Required</sup> <a id="Bucket.put.parameter.body"></a>

- *Type:* [`str`](../spec.md#standard-types)

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

- *Type:* [`str`](../spec.md#standard-types)

Key of the object.

---

###### `body`<sup>Required</sup> <a id="Bucket.putJson.parameter.body"></a>

- *Type:* [`Json`](../spec.md#standard-types)

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

- *Type:* [`str`](../spec.md#standard-types)

The key of the source object you wish to rename.

---

###### `dstKey`<sup>Required</sup> <a id="Bucket.rename.parameter.dstKey"></a>

- *Type:* [`str`](../spec.md#standard-types)

The key of the destination object after renaming.

---

##### `inflight signedUrl` <a id="inflight-signedUrl-"></a>

```wing
inflight signedUrl(key: str, options?: BucketSignedUrlOptions): str
```

Returns a signed url to the given file.

###### `key`<sup>Required</sup> <a id="Bucket.signedUrl.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

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

- *Type:* [`str`](../spec.md#standard-types)

Key of the object.

---

##### `inflight tryGet` <a id="inflight-tryGet-"></a>

```wing
inflight tryGet(key: str, options?: BucketTryGetOptions): str?
```

Get an object from the bucket if it exists If the bytes returned are not a valid UTF-8 string, an error is thrown.

###### `key`<sup>Required</sup> <a id="Bucket.tryGet.parameter.key"></a>

- *Type:* [`str`](../spec.md#standard-types)

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

- *Type:* [`str`](../spec.md#standard-types)

Key of the object.

---

## Structs <a id="structs"></a>

### BucketDeleteOptions <a id="BucketDeleteOptions-"></a>

Options for `Bucket.delete()`.

#### Properties <a id="BucketDeleteOptions.Properties"></a>

| **Name**   | **Type**                    | **Description**                                         | **Required** | **Default** |
|------------|-----------------------------|---------------------------------------------------------|--------------|-------------|
| mustExist  | [`bool`](../spec.md#standard-types) | Check failures on the method and retrieve errors if any. | No           | `false`     |

---

### BucketEvent <a id="BucketEvent-"></a>

On_event notification payload- will be in use after solving issue: https://github.com/winglang/wing/issues/1927.

#### Properties <a id="BucketEvent.Properties"></a>

| **Name**   | **Type**                              | **Description**                   | **Required** | **Default** |
|------------|---------------------------------------|-----------------------------------|--------------|-------------|
| key        | [`str`](../spec.md#standard-types)    | The bucket key that triggered the event. | Yes          |             |
| type       | [`BucketEventType`](#BucketEventType-) | Type of event.                    | Yes          |             |

---

### BucketGetOptions <a id="BucketGetOptions-"></a>

Options for `Bucket.get()`.

#### Properties <a id="BucketGetOptions.Properties"></a>

| **Name**   | **Type**                    | **Description**                          | **Required** | **Default**   |
|------------|-----------------------------|------------------------------------------|--------------|---------------|
| endByte    | [`num`](../spec.md#standard-types) | The ending byte to read up to (including). | No           | `undefined`   |
| startByte  | [`num`](../spec.md#standard-types) | The starting byte to read from.          | No           | `undefined`   |

---

### BucketOnCreateOptions <a id="BucketOnCreateOptions-"></a>

`onCreate` event options.

### BucketOnDeleteOptions <a id="BucketOnDeleteOptions-"></a>

`onDelete` event options.

### BucketOnEventOptions <a id="BucketOnEventOptions-"></a>

`onEvent` options.

### BucketOnUpdateOptions <a id="BucketOnUpdateOptions-"></a>

`onUpdate` event options.

### BucketProps <a id="BucketProps-"></a>

Options for `Bucket`.

#### Properties <a id="BucketProps.Properties"></a>

| **Name**   | **Type**                    | **Description**                                    | **Required** | **Default** |
|------------|-----------------------------|----------------------------------------------------|--------------|-------------|
| public     | [`bool`](../spec.md#standard-types) | Whether the bucket's objects should be publicly accessible. | No           | `false`     |

---

### BucketPutOptions <a id="BucketPutOptions-"></a>

Options for `Bucket.put()`.

#### Properties <a id="BucketPutOptions.Properties"></a>

| **Name**       | **Type**                    | **Description**                                                                                   | **Required** | **Default**                              |
|----------------|-----------------------------|---------------------------------------------------------------------------------------------------|--------------|------------------------------------------|
| contentType    | [`str`](../spec.md#standard-types) | The [HTTP Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) of the object. | No           | Determined by file extension or fallback to "application/octet-stream" |

---

### BucketSignedUrlOptions <a id="BucketSignedUrlOptions-"></a>

Options for `Bucket.signedUrl()`.

#### Properties <a id="BucketSignedUrlOptions.Properties"></a>

| **Name**   | **Type**                    | **Description**                                         | **Required** | **Default**                                         |
|------------|-----------------------------|---------------------------------------------------------|--------------|-----------------------------------------------------|
| action     | [`BucketSignedUrlAction`](#BucketSignedUrlAction-) | The action allowed by the signed URL.                   | No           | [`BucketSignedUrlAction.DOWNLOAD`](#BucketSignedUrlAction-) |
| duration   | [`Duration`](../spec.md#standard-types) | The duration for the signed URL to expire.              | No           | `15m`                                               |

---

### BucketTryGetOptions <a id="BucketTryGetOptions-"></a>

Options for `Bucket.tryGet()`.

#### Properties <a id="BucketTryGetOptions.Properties"></a>

| **Name**   | **Type**                    | **Description**                          | **Required** | **Default**   |
|------------|-----------------------------|------------------------------------------|--------------|---------------|
| endByte    | [`num`](../spec.md#standard-types) | The ending byte to read up to (including). | No           | `undefined`   |
| startByte  | [`num`](../spec.md#standard-types) | The starting byte to read from.          | No           | `undefined`   |

---

### ObjectMetadata <a id="ObjectMetadata-"></a>

Metadata of a bucket object.

#### Properties <a id="ObjectMetadata.Properties"></a>

| **Name**       | **Type**                    | **Description**                                  | **Required** | **Default** |
|----------------|-----------------------------|--------------------------------------------------|--------------|-------------|
| lastModified   | [`Datetime`](../spec.md#standard-types) | The time the object was last modified.             | Yes          |             |
| size           | [`num`](../spec.md#standard-types)      | The size of the object in bytes.                   | Yes          |             |
| contentType    | [`str`](../spec.md#standard-types)      | The content type of the object, if it is known.    | Yes          |             |

---

## Protocols <a id="protocols"></a>

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

- *Type:* [`str`](../spec.md#standard-types)

---

###### `type`<sup>Required</sup> <a id="IBucketEventHandler.handle.parameter.type"></a>

- *Type:* [`BucketEventType`](#BucketEventType-)

---

## Enums <a id="enums"></a>

### BucketEventType <a id="BucketEventType-"></a>

Bucket events to subscribe to.

#### Members <a id="BucketEventType.Members"></a>

| **Name** | **Description** |
| --- | --- |
| CREATE | Object created. |
| DELETE | Object deleted. |
| UPDATE | Object updated. |

---

### BucketSignedUrlAction <a id="BucketSignedUrlAction-"></a>

Specifies the action permitted by a presigned URL for a bucket.

#### Members <a id="BucketSignedUrlAction.Members"></a>

| **Name** | **Description** |
| --- | --- |
| DOWNLOAD | Represents a HTTP GET request for a presigned URL, allowing read access for an object in the bucket. |
| UPLOAD | Represents a HTTP PUT request for a presigned URL, allowing write access for an object in the bucket. |

---
