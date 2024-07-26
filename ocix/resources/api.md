# Api

The `Api` resource represents a cloud-managed API Gateway that hosts a collection of HTTP endpoints which clients can invoke over the internet. APIs often serve as the front door for applications to access data, business logic, or functionality from backend services.

The `Api` resource models an endpoint as a collection of routes. Each route is defined by a combination of a path, such as "/users/:userid", and a set of HTTP methods, such as [GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET), [POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST), or [DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE). When a client invokes a route, the API Gateway triggers the corresponding backend integration to handle the request.

## Table of Contents

<!-- markdownlint-disable MD007 -->
- [API Reference](#api-reference)
    - [Initializers](#initializers)
    - [Properties](#api-properties)
    - [Methods](#methods)
        - [Preflight Methods](#preflight-methods)
- [Structs](#structs)
- [Protocols](#protocols)
- [Enums](#enums)
<!-- markdownlint-enable MD007 -->

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

```wing
new Api(props?: ApiProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `props` | [`ApiProps`](#ApiProps-) | New `Api` resource properties | No | `{}` |

---

### Properties <a id="api-properties"></a>

| **Name** | **Type** | **Description** |
| --- | --- | --- |
| `url` | [`str`](../spec.md#standard-types) | The base URL of the API endpoint. |

---

TBD: properties starts to be semantically overloaded term.

### Methods <a id="methods"></a>

#### Preflight Methods <a id="preflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`connect`](#connect) | Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP CONNECT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/CONNECT) request for the given path is received. |
| [`delete`](#delete) | Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) request for the given path is received. |
| [`get`](#get) | Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) request for the given path is received.  |
|[`head`](#head) | Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP HEAD](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/HEAD) request for the given path is received. |
| [`options`](#options) | Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP OPTIONS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS) request for the given path is received. |
| [`patch`](#patch) | Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) request for the given path is received. |
| [`post`](#post) | Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) request for the given path is received. |
| [`put`](#put) | Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP PUT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) request for the given path is received. |

---

TBD: the HTTP [TRACE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/TRACE) method is not covered.

##### `connect` <a id="connect"></a>

```wing
connect(path: str, handler: IApiEndpointHandler, opts?: ApiConnectOptions): void
```

Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP CONNECT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/CONNECT) request for the given path is received.

###### Parameters <a id="Api.connect.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The URL path to handle [HTTP CONNECT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/CONNECT) requests. | Yes | |
| `handler` | [`IApiEndpointHandler`](#IApiEndpointHandler-) | Event handler pointer. | Yes | |
| `opts` | [`ApiConnectOptions`](#ApiConnectOptions-) | Event handling options. | No | `{}` |

---

##### `delete` <a id="delete"></a>

```wing
delete(path: str, handler: IApiEndpointHandler, opts?: ApiDeleteOptions): void
```

Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) request for the given path is received.

###### Parameters <a id="Api.delete.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The URL path to handle [HTTP DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) requests. | Yes | |
| `handler` | [`IApiEndpointHandler`](#IApiEndpointHandler-) | Event handler pointer. | Yes | |
| `opts` | [`ApiDeleteOptions`](#ApiDeleteOptions-) | Event handling options. | No | `{}` |

---

##### `get` <a id="get"></a>

```wing
get(path: str, handler: IApiEndpointHandler, opts?: ApiGetOptions): void
```

Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) request for the given path is received.

###### Parameters <a id="Api.get.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The URL path to handle [HTTP GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) requests. | Yes | |
| `handler` | [`IApiEndpointHandler`](#IApiEndpointHandler-) | Event handler pointer. | Yes | |
| `opts` | [`ApiGetOptions`](#ApiGetOptions-) | Event handling options. | No | `{}` |

---

##### `head` <a id="head"></a>

```wing
head(path: str, handler: IApiEndpointHandler, opts?: ApiHeadOptions): void
```

Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP HEAD](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/HEAD) request for the given path is received.

###### Parameters <a id="Api.head.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The URL path to handle [HTTP HEAD](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/HEAD) requests. | Yes | |
| `handler` | [`IApiEndpointHandler`](#IApiEndpointHandler-) | Event handler pointer. | Yes | |
| `opts` | [`ApiHeadOptions`](#ApiHeadOptions-) | Event handling options. | No | `{}` |

---

##### `options` <a id="options"></a>

```wing
options(path: str, handler: IApiEndpointHandler, opts?: ApiOptionsOptions): void
```

Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP OPTIONS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS) request for the given path is received.

###### Parameters <a id="Api.options.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The URL path to handle [HTTP OPTIONS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS) requests. | Yes | |
| `handler` | [`IApiEndpointHandler`](#IApiEndpointHandler-) | Event handler pointer. | Yes | |
| `opts` | [`ApiOptionsOptions`](#ApiOptionsOptions-) | Event handling options. | No | `{}` |

---

##### `patch` <a id="patch"></a>

```wing
patch(path: str, handler: IApiEndpointHandler, opts?: ApiPatchOptions): void
```

Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) request for the given path is received.

###### Parameters <a id="Api.patch.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The URL path to handle [HTTP PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) requests. | Yes | |
| `handler` | [`IApiEndpointHandler`](#IApiEndpointHandler-) | Event handler pointer. | Yes | |
| `opts` | [`ApiPatchOptions`](#ApiPatchOptions-) | Event handling options. | No | `{}` |

---

##### `post` <a id="post"></a>

```wing
post(path: str, handler: IApiEndpointHandler, opts?: ApiPostOptions): void
```

Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) request for the given path is received.

###### Parameters <a id="Api.post.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The URL path to handle [HTTP POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) requests. | Yes | |
| `handler` | [`IApiEndpointHandler`](#IApiEndpointHandler-) | Event handler pointer. | Yes | |
| `opts` | [`ApiPostOptions`](#ApiPostOptions-) | Event handling options. | No | `{}` |

---

##### `put` <a id="put"></a>

```wing
put(path: str, handler: IApiEndpointHandler, opts?: ApiPutOptions): void
```

Configure the `Api` resource to call the inflight [`handle`](#handle) method of a class implementing the [`IApiEndpointHandler`](#IApiEndpointHandler-) interface whenever an [HTTP PUT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) request for the given path is received.

###### Parameters <a id="Api.put.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `path` | [`str`](../spec.md#standard-types) | The URL path to handle [HTTP PUT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) requests. | Yes | |
| `handler` | [`IApiEndpointHandler`](#IApiEndpointHandler-) | Event handler pointer. | Yes | |
| `opts` | [`ApiPutOptions`](#ApiPutOptions-) | Event handling options. | No | `{}` |

---

## Structs <a id="structs"></a>

| **Name** | **Description** |
| --- | --- |
| [`ApiConnectOptions`](#ApiConnectOptions-) | Options for the [`Api.connect`](#connect) method. |
| [`ApiCorsOptions`](#ApiCorsOptions-) | CORS Options for `Api`. |
| [`ApiDeleteOptions`](#ApiDeleteOptions-) | Options for the [`Api.delete`](#delete) method. |
| [`ApiEndpointOptions`](#ApiEndpointOptions-) | Common default options for all `Api` endpoint methods. |
| [`ApiGetOptions`](#ApiGetOptions-) | Options for the [`Api.get`](#get) method. |
| [`ApiHeadOptions`](#ApiHeadOptions-) | Options for the [`Api.head`](#head) method. |
| [`ApiOptionsOptions`](#ApiOptionsOptions-) | Options for the [`Api.options`](#options) method. |
| [`ApiPatchOptions`](#ApiPatchOptions-) | Options for the [`Api.patch`](#patch) method. |
| [`ApiPostOptions`](#ApiPostOptions-) | Options for the [`Api.post`](#post) method. |
| [`ApiProps`](#ApiProps-) | Options for the [`Api.new`](#initializers) initializer. |
| [`ApiPutOptions`](#ApiPutOptions-) | Options for the [`Api.put`](#put) method. |
| [`ApiRequest`](#ApiRequest-) | Input parameter type for the [`IApiEndpointHandler.handle`](#handle) method. |
| [`ApiResponse`](#ApiResponse-) | The return value type of the [`IApiEndpointHandler.handle`](#handle) method. |

---

### ApiConnectOptions <a id="ApiConnectOptions-"></a>

```wing
struct ApiConnectOptions extends ApiEndpointOptions {}
```

Options for the [`Api.connect`](#connect) method.

#### Properties <a id="ApiConnectOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiCorsOptions <a id="ApiCorsOptions-"></a>

```wing
struct ApiCorsOptions {
    allowCredentials: bool?;
    allowMethods: Array<HttpMethod>?;
    allowHeaders: Array<str>?;
    allowOrigin: str?;
    exposeHeaders: Array<str>?;
    maxAge: Duration?;
}
```

CORS Options for `Api`.

#### Properties <a id="ApiCors.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `allowCredentials` | [`bool`](../spec.md#standard-types) | Whether to allow credentials. | No | `false` |
| `allowHeaders` | [`Array<str>`](../spec.md#standard-types) | The list of allowed headers. | No | ["Content-Type", "Authorization"] |
| `allowMethods` | [`Array<HttpMethod>`](../spec.md#standard-types) | The list of allowed [HTTP methods](#HttpMethod-). | No | [HttpMethod.GET, HttpMethod.POST, HttpMethod.PUT, HttpMethod.PATCH, HttpMethod.DELETE, HttpMethod.HEAD, HttpMethod.OPTIONS] |
| `allowOrigin` | [`str`](../spec.md#standard-types) | The allowed origin. | No | "*" |
| `exposeHeaders` | [`Array<str>`](../spec.md#standard-types) | The list of exposed headers. | No | [] |
| `maxAge` | [`Duration`](../spec.md#standard-types) | How long the browser could cache the request results. | No | 300 seconds |

---

### ApiDeleteOptions <a id="ApiDeleteOptions-"></a>

```wing
struct ApiDeleteOptions extends ApiEndpointOptions {}
```

Options for the [`Api.delete`](#delete) method.

#### Properties <a id="ApiDeleteOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiEndpointOptions <a id="ApiEndpointOptions-"></a>

```wing
struct ApiEndpointOptions extends FunctionProps {}
```

Common default options for all `Api` endpoint method.

#### Properties <a id="ApiEndpointOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiGetOptions <a id="ApiGetOptions-"></a>

```wing
struct ApiGetOptions extends ApiEndpointOptions {}
```

Options for the [`Api.get`](#get) method.

#### Properties <a id="ApiGetOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiHeadOptions <a id="ApiHeadOptions-"></a>

```wing
struct ApiHeadOptions extends ApiEndpointOptions {}
```

Options for the [`Api.head`](#head) method.

#### Properties <a id="ApiHeadOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiOptionsOptions <a id="ApiOptionsOptions-"></a>

```wing
struct ApiOptionsOptions extends ApiEndpointOptions {}
```

Options for the [`Api.options`](#options) method.

#### Properties <a id="ApiOptionsOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiPatchOptions <a id="ApiPatchOptions-"></a>

```wing
struct ApiPatchOptions extends ApiEndpointOptions {}
```

Options for the [`Api.patch`](#patch) method.

#### Properties <a id="ApiPatchOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiPostOptions <a id="ApiPostOptions-"></a>

```wing
struct ApiPostOptions extends ApiEndpointOptions {}
```

Options for the [`Api.post`](#post) method.

#### Properties <a id="ApiPostOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiProps <a id="ApiProps-"></a>

```wing
struct ApiProps {
    cors: bool?;
    corsOptions: ApiCorsOptions?;
}
```

Options for the [`Api.new`](#initializers) initializer.

#### Properties <a id="ApiProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `cors` | [`bool`](../spec.md#standard-types) | Enable API's CORS behavior across all routes. When enabled this will add CORS headers with default options. Can be customized by passing `corsOptions`. | No | `false`, CORS configuration is disabled. |
| `corsOptions` | [`ApiCorsOptions`](#ApiCorsOptions-) | Options for configuring the API's CORS behavior across all routes. | No | Default CORS options are applied when `cors` is set to `true`<br>- allowOrigin: "*"<br>- allowMethods: [HttpMethod.GET, HttpMethod.POST, HttpMethod.PUT, HttpMethod.DELETE, HttpMethod.HEAD, HttpMethod.OPTIONS]<br>- allowHeaders: ["Content-Type", "Authorization"]<br>- exposeHeaders: []<br>- allowCredentials: `false` |

---

TODO: Support CORS options override on a per-route basis.

---

### ApiPutOptions <a id="ApiPutOptions-"></a>

```wing
struct ApiPutOptions extends ApiEndpointOptions {}
```

Options for the [`Api.put`](#put) method.

#### Properties <a id="ApiPutOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ApiRequest <a id="ApiRequest-"></a>

```wing
struct ApiRequest {
    body: str?;
    headers: Map<str>?;
    method: HttpMethod;
    path: str;
    query: Map<str>;
    vars: Map<str>;
}
```

Input parameter type for the [`IApiEndpointHandler.handle`](#handle) method.

#### Properties <a id="ApiRequest.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `body` | [`str`](../spec.md#standard-types) | The body of the request. | No | Undefined |
| `headers` | [`Map<str>`](../spec.md#standard-types) | The headers of the request. | No | Undefined |
| `method` | [`HttpMethod`](#HttpMethod-) | The HTTP method of the request. | Yes | |
| `path` | [`str`](../spec.md#standard-types) | TThe URL path of the request. | Yes | |
| `query` | [`Map<str>`](../spec.md#standard-types) | The query string values of the request. | Yes | |
| `vars` | [`Map<str>`](../spec.md#standard-types) | The path variables. | Yes | |

---

### ApiResponse <a id="ApiResponse-"></a>

```wing
struct ApiResponse {
    body: str?;    
    headers: Map<str>?;
    status: num?;
}
```

The return value type of the [`IApiEndpointHandler.handle`](#handle) method.

#### Properties <a id="ApiResponse.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `body` | [`str`](../spec.md#standard-types) | The body of the response. | No | No body |
| `headers` | [Map<`str`>](../spec.md#standard-types) | The headers of the response. | No | `{}` |
| `status` | [`num`](../spec.md#standard-types) | The status code of the response. | No | 200 |

---

## Protocols <a id="protocols"></a>

### IApiEndpointHandler <a id="IApiEndpointHandler-"></a>

Defines an inflight [`handle`](#handle) method that is invoked to process an HTTP request.

#### Methods <a id="IApiEndpointHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`handle`](#handle) | Function that is called to handle a particular HTTP request. |

---

##### `handle` <a id="handle"></a>

```wing
inflight handle(request: ApiRequest): ApiResponse?
```

Function that is called to handle a particular HTTP request.

###### Parameters <a id="IApiEndpointHandler.handle.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `request` | [`ApiRequest`](#ApiRequest-) | Details of the HTTP request. | Yes | |

---

## Enums <a id="enums"></a>

| **Name** | **Description** |
| -------- | --------------- |
| [HttpMethod](#HttpMethod-) | Supported HTTP methods. |

---

### HttpMethod <a id="HttpMethod-"></a>

```wing
enum HttpMethod {
  CONNECT,
  DELETE,
  GET,
  HEAD,
  OPTIONS,
  PATCH,
  POST,
  PUT
}
```

Supported HTTP methods.

#### Members <a id="HttpMethod.Members"></a>

| **Name** | **Description** |
| --- | --- |
| `CONNECT` | The [HTTP CONNECT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/CONNECT) method. |
| `DELETE` | The [HTTP DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) method. |
| `GET` | The [HTTP GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) method. |
| `HEAD` | The [HTTP HEAD](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/HEAD) method. |
| `OPTIONS` | The [HTTP OPTIONS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS) method. |
| `PATCH` | The [HTTP PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) method. |
| `POST` | The [HTTP POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) method. |
| `PUT` | The [HTTP PUT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) method. |

---
