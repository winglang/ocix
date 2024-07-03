# Bucket

The `Bucket` resource represents a container for storing data in the cloud.

Buckets are commonly used to store arbitrary files such as images, videos, and documents, but they can also be utilized for structured data like JSON or CSV files.

Cloud buckets employ object storage, which is optimized for handling large volumes of data with high availability.

Unlike file storage, which uses a hierarchical structure, object storage maintains a flat list of objects, each identified by a unique key.

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

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- |
| `props` | [`BucketProps`](#BucketProps-) | New Bucket properties | No | `{}` |

---

### Methods <a id="methods"></a>

#### Preflight Methods <a id="preflight-methods"></a>

| **Name**       | **Description**                                                      |
|----------------|----------------------------------------------------------------------|
| [`addFile`](#addFile-)    | Upload a file from the system folder to the bucket when the app is deployed. |
| [`addObject`](#addObject-) | Upload object content to the bucket when the app is deployed.       |
| [`onCreate`](#onCreate-)  | Run the inflight [`handle`](#handle) method of a class implementing the [`IBucketEventHandler`](#IBucketEventHandler-) interface whenever a new object is created in the bucket.        |
| [`onDelete`](#onDelete-)  | Run the inflight [`handle`](#handle) method of a class implementing the [`IBucketEventHandler`](#IBucketEventHandler-) interface whenever an existing object is deleted from the bucket. |
| [`onEvent`](#onEvent-)    | Run the inflight [`handle`](#handle) method of a class implementing the [`IBucketEventHandler`](#IBucketEventHandler-) interface whenever a new object is created or an existing object is deleted or modified. |
| [`onUpdate`](#onUpdate-)  | Run the inflight [`handle`](#handle) method of a class implementing the [`IBucketEventHandler`](#IBucketEventHandler-) interface whenever an existing object is modified within the bucket. |

#### Inflight Methods <a id="inflight-methods"></a>

| **Name**         | **Description**                                                                                              |
|------------------|--------------------------------------------------------------------------------------------------------------|
| [`copy`](#inflight-copy)           | Copy an object to a new location in the bucket.                        |
| [`delete`](#inflight-delete)       | Delete an existing object using a key from the bucket.                 |
| [`exists`](#inflight-exists)       | Check if an object exists in the bucket.                               |
| [`get`](#inflight-get)             | Retrieve an object from the bucket.                                    |
| [`getJson`](#inflight-getJson-)    | Retrieve a JSON object from the bucket.                                |
| [`list`](#inflight-list)           | List the keys of existing objects in the bucket.                       |
| [`metadata`](#inflight-metadata)   | Get metadata of an object in the bucket.                               |
| [`publicUrl`](#inflight-publicUrl-) | Return a public URL to the given bucket object.                       |
| [`put`](#inflight-put)             | Put an object in the bucket.                                           |
| [`putJson`](#inflight-putJson-)    | Put a JSON object in the bucket.                                       |
| [`rename`](#inflight-rename)       | Store the object content under a new key and delete the old key in the bucket. |
| [`signedUrl`](#inflight-signedUrl-) | Return a signed URL to the given object.                              |
| [`tryDelete`](#inflight-tryDelete-) | Delete an object from the bucket if it exists.                        |
| [`tryGet`](#inflight-tryGet-)      | Retrieve an object from the bucket if it exists.                       |
| [`tryGetJson`](#inflight-tryGetJson-) | Retrieve an object from the bucket if it exists, parsing it as JSON. |

---

##### addFile <a id="addFile-"></a>

```wing
addFile(key: str, path: str, encoding?: str): void
```

Upload a file from the system folder to the bucket when the app is deployed.

###### Parameters <a id="Bucket.addFile.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    |[`str`](../spec.md#standard-types) | The key or name to associate with the file. | Yes | |
| `path`   |[`str`](../spec.md#standard-types) | The path to the file on the local system. | Yes | |
| `encoding` | [`str`](../spec.md#standard-types) | The encoding to use when reading the file. | No | "utf-8" |

---

##### `addObject` <a id="addObject-"></a>

```wing
addObject(key: str, body: str): void
```

Upload object content to the bucket when the app is deployed.

TODO: In the future, this will support uploading any `Blob` type or referencing a file from the local filesystem.

###### Parameters <a id="Bucket.addObject.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    |[`str`](../spec.md#standard-types) | The key or name to associate with the file. | Yes | |
| `body`   |[`str`](../spec.md#standard-types) | The object content. | Yes | |

---

##### `onCreate` <a id="onCreate-"></a>

```wing
onCreate(fn: IBucketEventHandler, opts?: BucketOnCreateOptions): void
```

Run the inflight [`handle`](#handle) method of a class implementing the [`IBucketEventHandler`](#IBucketEventHandler-) interface whenever a new object is created in the bucket.

###### Parameters <a id="Bucket.onCreate.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `fn`     | [`IBucketEventHandler`](#IBucketEventHandler-) | Event handler pointer | Yes ||
| `opts`   | [`BucketOnCreateOptions`](#BucketOnCreateOptions-) | Event handling options | No | `{}` |

---

##### `onDelete` <a id="onDelete-"></a>

```wing
onDelete(fn: IBucketEventHandler, opts?: BucketOnDeleteOptions): void
```

Run the inflight [`handle`](#handle) method of a class implementing the [`IBucketEventHandler`](#IBucketEventHandler-) interface whenever an existing object is deleted from the bucket.

###### Parameters <a id="Bucket.onDelete.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `fn`     | [`IBucketEventHandler`](#IBucketEventHandler-) | Event handler pointer | Yes ||
| `opts`   | [`BucketOnDeleteOptions`](#BucketOnDeleteOptions-) | Event handling options | No | `{}` |

---

##### `onEvent` <a id="onEvent-"></a>

```wing
onEvent(fn: IBucketEventHandler, opts?: BucketOnEventOptions): void
```

Run the inflight [`handle`](#handle) method of a class implementing the [`IBucketEventHandler`](#IBucketEventHandler-) interface whenever a new object is created or an existing object is deleted or modified.

###### Parameters <a id="Bucket.onEvent.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `fn`     | [`IBucketEventHandler`](#IBucketEventHandler-) | Event handler pointer | Yes ||
| `opts`   | [`BucketOnEventOptions`](#BucketOnEventOptions-) | Event handling options | No | `{}` |

---

##### `onUpdate` <a id="onUpdate-"></a>

```wing
onUpdate(fn: IBucketEventHandler, opts?: BucketOnUpdateOptions): void
```

Run the inflight [`handle`](#handle) method of a class implementing the [`IBucketEventHandler`](#IBucketEventHandler-) interface whenever an existing object is modified within the bucket.

###### Parameters <a id="Bucket.onUpdate.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `fn`     | [`IBucketEventHandler`](#IBucketEventHandler-) | Event handler pointer | Yes ||
| `opts`   | [`BucketOnUpdateOptions`](#BucketOnUpdateOptions-) | Event handling options | No | `{}` |

---

##### `inflight copy` <a id="inflight-copy"></a>

```wing
inflight copy(srcKey: str, dstKey: str): void
```

Copy an object to a new location in the bucket. If the destination object already exists, it will be overwritten.

###### Parameters <a id="Bucket.copy.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `srcKey` | [`str`](../spec.md#standard-types) | The key of the source object to be copied. | Yes | |
| `dstKey` | [`str`](../spec.md#standard-types) | The key of the destination object after copying. | Yes | |

##### `inflight delete` <a id="inflight-delete"></a>

```wing
inflight delete(key: str, opts?: BucketDeleteOptions): void
```

Delete an existing object using a key from the bucket.

###### Parameters <a id="Bucket.delete.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |
| `opts`   | [`BucketDeleteOptions`](#BucketDeleteOptions-) | Options for deleting an object from the bucket. | No | `{}` |
---

##### `inflight exists` <a id="inflight-exists"></a>

```wing
inflight exists(key: str): bool
```

Check if an object exists in the bucket.

###### Parameters <a id="Bucket.exists.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |

---

##### `inflight get` <a id="inflight-get"></a>

```wing
inflight get(key: str, opts?: BucketGetOptions): str
```

Retrieve an object from the bucket. If the bytes returned are not a valid UTF-8 string, throw an exception.

###### Parameters <a id="Bucket.get.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |
| `opts`   | [`BucketGetOptions`](#BucketGetOptions-) | Additional `get` options. | No | `{}` |

---

##### `inflight getJson` <a id="inflight-getJson-"></a>

```wing
inflight getJson(key: str): Json
```

Retrieve a Json object from the bucket.

###### Parameters <a id="Bucket.getJson.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |

---

##### `inflight list` <a id="inflight-list"></a>

```wing
inflight list(prefix?: str): Array<str>
```

List the keys of existing objects in the bucket.

###### Parameters <a id="Bucket.list.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `prefix`    | [`str`](../spec.md#standard-types) | Limit the response to keys that begin with the specified prefix. | No | "" |

---

##### `inflight metadata` <a id="inflight-metadata"></a>

```wing
inflight metadata(key: str): ObjectMetadata
```

Get [metadata](#ObjectMetadata-) of an object in the bucket.

###### Parameters <a id="Bucket.metadata.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |

---

##### `inflight publicUrl` <a id="inflight-publicUrl-"></a>

```wing
inflight publicUrl(key: str): str
```

Return a public URL to the given bucket object.

###### Parameters <a id="Bucket.publicUrl.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |

---

##### `inflight put` <a id="inflight-put"></a>

```wing
inflight put(key: str, body: str, opts?: BucketPutOptions): void
```

Put an object in the bucket. If the object does not exist, a new one will be created. Otherwise, the existing object will be updated.

###### Parameters <a id="Bucket.put.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |
| `body`   | [`str`](../spec.md#standard-types) | The content of the object to be stored in the bucket. | Yes | |
| `opts`   | [`BucketPutOptions`](#BucketPutOptions-) | Additional `put` options. | No | `{}` |

---

##### `inflight putJson` <a id="inflight-putJson-"></a>

```wing
inflight putJson(key: str, body: Json): void
```

Put a Json object in the bucket. If the object does not exist, a new one will be created. Otherwise, the existing object will be updated.

###### Parameters <a id="Bucket.putJson.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |
| `body`   | [`Json`](../spec.md#standard-types) | The JSON object to be stored in the bucket. | Yes | |

---

##### `inflight rename` <a id="inflight-rename"></a>

```wing
inflight rename(srcKey: str, dstKey: str): void
```

Store the object content under a new key and delete the old key in the bucket. If the destination object already exists, it will be overwritten.

###### Parameters <a id="Bucket.rename.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `srcKey`    | [`str`](../spec.md#standard-types) | The key of the source object to be renamed. | Yes | |
| `dstKey`    | [`str`](../spec.md#standard-types) | The key of the destination object after renaming. | Yes | |

---

##### `inflight signedUrl` <a id="inflight-signedUrl-"></a>

```wing
inflight signedUrl(key: str, opts?: BucketSignedUrlOptions): str
```

Return a signed URL to the given object.

###### Parameters <a id="Bucket.signedUrl.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |
| `opts`   | [`BucketSignedUrlOptions`](#BucketSignedUrlOptions-) | Additional URL signing options. | No | `{}` |

---

##### `inflight tryDelete` <a id="inflight-tryDelete-"></a>

```wing
inflight tryDelete(key: str): bool
```

Delete an object from the bucket if it exists.

###### Parameters <a id="Bucket.tryDelete.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |

---

##### `inflight tryGet` <a id="inflight-tryGet-"></a>

```wing
inflight tryGet(key: str, opts?: BucketTryGetOptions): str?
```

Get an object from the bucket if it exists. If the bytes returned are not a valid UTF-8 string, throw an exception.

###### Parameters <a id="Bucket.tryGet.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |
| `opts`   | [`BucketTryGetOptions`](#BucketTryGetOptions-) | Additional `get` options. | No | `{}` |

---

##### `inflight tryGetJson` <a id="inflight-tryGetJson-"></a>

```wing
inflight tryGetJson(key: str): Json?
```

Retrieve an object from the bucket if it exists, parsing it as JSON.

###### Parameters <a id="Bucket.tryGetJson.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | Key of the object. | Yes | |

---

## Structs <a id="structs"></a>

### BucketDeleteOptions <a id="BucketDeleteOptions-"></a>

Options for [`Bucket.delete()`](#inflight-delete).

#### Properties <a id="BucketDeleteOptions.Properties"></a>

| **Name**   | **Type**                    | **Description**                                         | **Required** | **Default** |
|------------|-----------------------------|---------------------------------------------------------|--------------|-------------|
| mustExist  | [`bool`](../spec.md#standard-types) | Throw an exception if the object does not exist. | No           | `false`     |

---

### BucketEvent <a id="BucketEvent-"></a>

[onEvent](#onEvent-) notification payload- will be in use after solving the [issue](https://github.com/winglang/wing/issues/1927).

#### Properties <a id="BucketEvent.Properties"></a>

| **Name**   | **Type**                              | **Description**                   | **Required** | **Default** |
|------------|---------------------------------------|-----------------------------------|--------------|-------------|
| key        | [`str`](../spec.md#standard-types)    | The bucket key that triggered the event. | Yes          |             |
| type       | [`BucketEventType`](#BucketEventType-) | The type of the event.           | Yes          |             |

---

### BucketGetOptions <a id="BucketGetOptions-"></a>

Options for [`Bucket.get()`](#inflight-get).

#### Properties <a id="BucketGetOptions.Properties"></a>

| **Name**   | **Type**                    | **Description**                          | **Required** | **Default**   |
|------------|-----------------------------|------------------------------------------|--------------|---------------|
| endByte    | [`num`](../spec.md#standard-types) | The ending byte to read up to (including). | No           | `undefined`   |
| startByte  | [`num`](../spec.md#standard-types) | The starting byte to read from.          | No           | `undefined`   |

---

### BucketOnCreateOptions <a id="BucketOnCreateOptions-"></a>

[`onCreate`](#onCreate-) event options.

### BucketOnDeleteOptions <a id="BucketOnDeleteOptions-"></a>

[`onDelete`](#onDelete-) event options.

### BucketOnEventOptions <a id="BucketOnEventOptions-"></a>

[`onEvent`](#onEvent-) options.

### BucketOnUpdateOptions <a id="BucketOnUpdateOptions-"></a>

[`onUpdate`](#onUpdate-) event options.

### BucketProps <a id="BucketProps-"></a>

Options for [`new Bucket`](#initializers).

#### Properties <a id="BucketProps.Properties"></a>

| **Name**   | **Type**                    | **Description**                                    | **Required** | **Default** |
|------------|-----------------------------|----------------------------------------------------|--------------|-------------|
| public     | [`bool`](../spec.md#standard-types) | Whether the bucket's objects should be publicly accessible. | No           | `false`     |

---

### BucketPutOptions <a id="BucketPutOptions-"></a>

Options for [`Bucket.put()`](#inflight-put).

#### Properties <a id="BucketPutOptions.Properties"></a>

| **Name**       | **Type**                    | **Description**                                                                                   | **Required** | **Default**                              |
|----------------|-----------------------------|---------------------------------------------------------------------------------------------------|--------------|------------------------------------------|
| contentType    | [`str`](../spec.md#standard-types) | The [HTTP Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) of the object. | No           | Determined by file extension or fallback to "application/octet-stream" |

---

### BucketSignedUrlOptions <a id="BucketSignedUrlOptions-"></a>

Options for [`Bucket.signedUrl()`](#inflight-signedUrl-).

#### Properties <a id="BucketSignedUrlOptions.Properties"></a>

| **Name**   | **Type**                    | **Description**                                         | **Required** | **Default**                                         |
|------------|-----------------------------|---------------------------------------------------------|--------------|-----------------------------------------------------|
| action     | [`BucketSignedUrlAction`](#BucketSignedUrlAction-) | The action allowed by the signed URL.                   | No           | [`BucketSignedUrlAction.DOWNLOAD`](#BucketSignedUrlAction-) |
| duration   | [`Duration`](../spec.md#standard-types) | The duration for the signed URL before it expires.              | No           | `15m`                                               |

---

### BucketTryGetOptions <a id="BucketTryGetOptions-"></a>

Options for [`Bucket.tryGet()`](#inflight-tryGet-).

#### Properties <a id="BucketTryGetOptions.Properties"></a>

| **Name**   | **Type**                    | **Description**                          | **Required** | **Default**   |
|------------|-----------------------------|------------------------------------------|--------------|---------------|
| endByte    | [`num`](../spec.md#standard-types) | The ending byte to read up to (including). | No           | `undefined`   |
| startByte  | [`num`](../spec.md#standard-types) | The starting byte to read from.          | No           | `undefined`   |

---

### ObjectMetadata <a id="ObjectMetadata-"></a>

[Metadata](#inflight-metadata) of a bucket object.

#### Properties <a id="ObjectMetadata.Properties"></a>

| **Name**       | **Type**                    | **Description**                                  | **Required** | **Default** |
|----------------|-----------------------------|--------------------------------------------------|--------------|-------------|
| lastModified   | [`Datetime`](../spec.md#standard-types) | The last time the object was modified.             | Yes          |             |
| size           | [`num`](../spec.md#standard-types)      | The size of the object in bytes.                   | Yes          |             |
| contentType    | [`str`](../spec.md#standard-types)      | The content type of the object, if it is known.    | Yes          |             |

---

## Protocols <a id="protocols"></a>

### IBucketEventHandler <a id="IBucketEventHandler-"></a>

#### Methods <a id="IBucketEventHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| `handle` | Function that will be called when an event notification is fired. |

---

##### `handle` <a id="handle"></a>

```wing
inflight handle(key: str, type: BucketEventType): void
```

Function that will be called when an event notification is fired.

###### Parameters <a id="IBucketEventHandler.handle.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | The object key. | Yes | |
| `type`   | [`BucketEventType`](#BucketEventType-) | The event type. | Yes | |

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
