# Function

The `Function` resource represents a serverless function for performing short, stateless tasks. Functions are typically used to execute business logic in response to events, such as a file being uploaded to a [`Bucket`](./bucket.md), a message being pushed to a [`Queue`](./queue.md), or a [timer expired](./schedule.md).

When a function is invoked on a cloud provider, it is usually executed in a container or host that is provisioned on demand. Functions may be invoked multiple times, and some cloud providers may automatically retry failed invocations. For performance reasons, most cloud providers impose a timeout on functions, after which the function execution is automatically terminated.

<!-- markdownlint-disable MD007 -->
- [API Reference](#api-reference)
    - [Initializers](#initializers)
    - [Methods](#methods)
        - [Preflight Methods](#preflight-methods)
        - [Inflight Methods](#inflight-methods)
- [Structs](#structs)
- [Protocols](#protocols)
<!-- markdownlint-enable MD007 -->

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

```wing
new Function(handler: IFunctionHandler, props?: FunctionProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `handler` | [`IFunctionHandler`](#IFunctionHandler-) | Configure the `Function` resource to invoke the inflight [`handle`](#handle) method of a class implementing the [`IFunctionHandler`](#IFunctionHandler-) interface whenever the `Function` is called.| Yes | |
| `props` | [`FunctionProps`](#FunctionProps-) | Additional `Function` resource properties. | No | `{}` |

---

#### Methods <a id="methods"></a>

##### Preflight Methods <a id="preflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`addEnvironment`](#addEnvironment-) | Add an environment variable to the `Function`. |

##### `addEnvironment` <a id="addEnvironment-"></a>

```wing
addEnvironment(name: str, value: str): void
```

Add an environment variable to the `Function`.

###### Parameters <a id ="Function.addEnvironment.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `name` | [`str`](../spec.md#standard-types) | The environment variable name. | Yes | |
| `value` | [`str`](../spec.md#standard-types) | The environment variable value. | Yes | |

---

##### Inflight Methods <a id="inflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`invoke`](#invoke) | Invoke the `Function`and wait for the result. |
| [`invokeAsync`](#invokeAsync-) | Invoke the `Function` asynchronously without waiting for the result. |

---

##### `invoke` <a id="invoke"></a>

```wing
inflight invoke(arg?: str): str?
```

Invoke the `Function` and wait for the result.

###### Parameters <a id ="Function.invoke.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `arg` | [`str`](../spec.md#standard-types) | Argument to pass to the function. | No | Empty string. |

---

##### `invokeAsync` <a id="invokeAsync-"></a>

```wing
inflight invokeAsync(arg?: str): void
```

Invoke the `Function` asynchronously without waiting for the result.

###### Parameters <a id ="Function.invokeAsync.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `arg` | [`str`](../spec.md#standard-types) | Argument to pass to the function. | No | Empty string. |

---

## Structs <a id="structs"></a>

### FunctionProps <a id="FunctionProps-"></a>

Optional argument for the [`new Function`](#initializers) intializer.

#### Properties <a id="FunctionProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

## Protocols <a id="protocols"></a>

### IFunctionHandler <a id="IFunctionHandler-"></a>

The [`new Function`](#initializers) parameter.  Defines an inflight [`handle`](#handle) method that is invoked when the `Function` is called.

#### Methods <a id="IFunctionHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`handle`](#handle) | Entrypoint function that will be called when the cloud `Function` is invoked. |

---

##### `handle` <a id="handle"></a>

```wing
inflight handle(arg?: str): str?
```

Entrypoint function that will be called when the cloud `Function` is invoked.

###### Parameters <a id="IFunctionHandler.handle.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `arg` | [`str'](../spec.md#standard-types) | The `Function` invocation argument. If invoked by a cloud service, describes a triggering cloud event.  | No | Undefined |

---
