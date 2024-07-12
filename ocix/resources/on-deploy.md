# OnDeploy

The `OnDeploy` resource represents a block of inflight code that runs each time the application is deployed.

## Table of Contents

<!-- markdownlint-disable MD007 -->
- [API Reference](#api-reference)
    - [Initializers](#initializers)
- [Structs](#structs)
- [Protocols](#protocols)
<!-- markdownlint-enable MD007 -->

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

```wing
new OnDeploy(handler: IOnDeployHandler, props?: OnDeployProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `handler` | [`IOnDeployHandler`](#IOnDeployHandler-) | Configure the `onDeploy` resource to invoke the inflight [`handle`](#handle) method of a class implementing the [`IOnDeployHandler`](#IOnDeployHandler-) interface whenever the application is deployed.| Yes | |
| `props` | [`OnDeployProps`](#OnDeployProps-) | Additional `onDeploy` resource properties. | No | `{}` |

---

## Structs <a id="structs"></a>

### OnDeployProps <a id="OnDeployProps-"></a>

Optional properties for the [`new OnDeploy`](#initializers) initializer.

#### Properties <a id="OnDeployProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |
| `executeAfter` | [`Array<Construct>`](../spec.md#standard-types) | Execute this trigger only after these resources have been provisioned. | No | No additional dependees. |
| `executeBefore` | [`Array<Construct>`](../spec.md#standard-types) | Create these resources after sucessufl execution of the [`handle`](#handle) method. | No | No additional dependendants. |

---

## Protocols <a id="protocols"></a>

### IOnDeployHandler <a id="IOnDeployHandler-"></a>

The [`new onDeploy`](#initializers) parameters. Defines an inflight [`handle`](#handle) to be onvoked during the application deployment.

#### Methods <a id="IOnDeployHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`handle`](#handle) | Entrypoint function to be invoked when the applications is deployed. |

---

##### `handle` <a id="handle"></a>

```wing
inflight handle(): void
```

Entrypoint function to be invoked when the applications is deployed.
