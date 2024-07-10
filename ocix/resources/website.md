# Website

The Website resource represents a static website that can be hosted in the cloud. Websites typically serve static content, such as HTML, CSS, and JavaScript files, which are updated whenever the application is redeployed.

## Table of Contents

<!-- markdownlint-disable MD007 -->
- [API Reference](#api-reference)
    - [Initializers](#initializers)
    - [Methods](#methods)
        - [Preflight Methods](#preflight-methods)
- [Structs](#structs)
<!-- markdownlint-enable MD007 -->

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

```wing
new Website(props: WebsiteProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `props` | [`WebsiteProps`](#WebsiteProps-) | New Website properties | Yes |  |

---

### Properties <a id="Website.Properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| `url` | [`str`](../spec.md#standard-types) | The `Website` URL. |

### Methods <a id="methods"></a>

#### Preflight Methods <a id="preflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`addFile`](#addFile-) | Upload a file to the `Website` when the app is deployed. |
| [`addJson`](#addJson-) | Upload a JSON file with custom values to the `Website` when the app is deployed. |

---

##### `addFile` <a id="addFile-"></a>

```wing
addFile(path: str, data: str, options?: AddFileOptions): str
```

Upload a file to the `Website` when the app is deployed.

If a file with the same path already exists in the `Website` static assets, throw an exception.

###### Parameters <a id="Website.addFile.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The file path to which the `data` will be uploaded. | Yes | |
| `data` | [`str`](../spec.md#standard-types) | The data payload to be written to the file. | Yes | |
| `options` | [`AddFileOptions`](#AddFileOptions-) | Defines the file properties, such as `ContentType`. | No | `{}` |

---

##### `addJson` <a id="addJson-"></a>

```wing
addJson(path: str, data: Json): str
```

Upload a JSON file with custom values to the `Website` when the app is deployed.

If a file with the same path already exists in the `Website` static assets, throw an exception.

###### Parameters <a id="Website.addJson.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The file path to which the `data` will be uploaded. | Yes | |
| `data` | [`Json`](../spec.md#standard-types) | The data payload to be written to the file. | Yes | |

---

## Structs <a id="structs"></a>

### AddFileOptions <a id="AddFileOptions-"></a>

Options for adding a file with custom value during the website's deployment.

#### Properties <a id="AddFileOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `contentType` | [`str`](../spec.md#standard-types) | Content type of the file. | No | Undefined |

---

### WebsiteProps <a id="WebsiteProps-"></a>

New `Website` properties.

#### Properties <a id="WebsiteProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `path` | [`str`](../spec.md#standard-types) | Local path to the `Website` static files, relative to the source file or absolute. | Yes | |
| `errorDocument` | [`str`](../spec.md#standard-types) | Name of the error document for the website. | No | Undefined |
| `domain` | [`Domain`](./domain.md) | The `Website` custom domain object. | No | Undefined |

---
