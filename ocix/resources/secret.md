# Secret

The `Secret` resource represents a sensitive value (like an API key, certificate, etc.) securely stored in the cloud.

`Secret` values are encrypted both at rest and in transit, and are only decrypted when used in a task. That enables their usage in different compute tasks, while rotation or revocation are managed in a single location.

## Table of Contents

- [API Reference](#api-reference)
    - [Initializers](#initializers)
    - [Methods](#methods)
        - [Inflight Methods](#inflight-methods)
- [Structs](#structs)

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

```wing
new Secret(props?: SecretProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `props` | [`SecretProps`](#SecretProps-) | Secret Properties | Now | `{}` |

---

### Methods <a id="methods"></a>

#### Inflight Methods <a id="inflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| `value` | Retrieve the `Secret` string value. |
| `valueJson` | Retrieve the `Secret` JSON value. |

---

##### `value` <a id="value"></a>

```wing
inflight value(options?: GetSecretValueOptions): str
```

Retrieve the `Secret` string value.

###### Parameters <a id="Secret.value.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `options` | [`GetSecretValueOptions`](#GetSecretValueOptions-) | Secret retrieval options | No | `{}` |

---

##### `valueJson` <a id="valueJson-"></a>

```wing
inflight valueJson(options?: GetSecretValueOptions): Json
```

Retrieve the `Secret` JSON value.

###### Parameters <a id="Secret.valueJson.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `options` | [`GetSecretValueOptions`](#GetSecretValueOptions-) | Secret retrieval options | No | `{}` |

---

## Structs <a id="structs"></a>

### GetSecretValueOptions <a id="GetSecretValueOptions-"></a>

```wing
struct GetSecretValueOptions {
    cache: bool?;
}
```

Secret retrieval options.

#### Properties <a id="Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `cache` | [`bool`](../spec.md#standard-types) | Whether to cache the value. | No | `true` |

---

### SecretProps <a id="SecretProps-"></a>

```wing
export interface SecretProps {
    name: str?;
}
```

Options for the [`Secret`](#initializers) initializer.

#### Properties <a id="SecretProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `name` | [`str`](../spec.md#standard-types) | The `Secret`'s name. | No | A new `Secret` is provisioned with a generated name |

If a name is provided then the resource will reference an existing `Secret`.

---
