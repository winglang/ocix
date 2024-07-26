# Counter

The `Counter` resource represents a stateful container for one or more numbers in the cloud.

## Table of Contents

<!-- markdownlint-disable MD007 -->
- [API Reference](#api-reference)
    - [Initializers](#initializers)
    - [Methods](#methods)
        - [Inflight Methods](#inflight-methods)
- [Structs](#structs)
<!-- markdownlint-enable MD007 -->

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

```wing
new Counter(props?: CounterProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `props` | [CounterProps](#CounterProps-) | New Counter properties | No | `{}` |

---

### Methods <a id="methods"></a>

#### Inflight Methods <a id="inflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`dec`](#inflight-dec)   | Decrement the counter, returning the previous value. |
| [`inc`](#inflight-inc)   | Increment the counter atomically by a certain amount and returns the previous value. |
| [`peek`](#inflight-peek) | Get the current value of the counter. |
| [`set`](#inflight-set)   | Set the counter to a given value. |

---

##### `inflight dec` <a id="inflight-dec"></a>

```wing
inflight dec(amount?: num, key?: str): num
```

Decrement the counter, returning the previous value.

###### Parameters <a id="Counter.dec.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `amount` | [`num`](../spec.md#standard-types) | Amount to decrement. | No | 1 |
| `key`    | [`str`](../spec.md#standard-types) | The key to be decremented. | No | Platform-dependent |

---

##### `inflight inc` <a id="inflight-inc"></a>

```wing
inflight inc(amount?: num, key?: str): num
```

Increment the counter atomically by a certain amount and returns the previous value.

###### Parameters <a id="Counter.inc.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `amount` | [`num`](../spec.md#standard-types) | Amount to increment. | No | 1 |
| `key`    | [`str`](../spec.md#standard-types) | The key to be incremented. | No | Platform-dependent |

---

##### `inflight peek` <a name="inflight-peek"></a>

```wing
inflight peek(key?: str): num
```

Get the current value of the counter.

Note that the value may change between the time it is read and the time it is used in your code. Therefore, if the code tries to update the counter based on its previously retrieved value (e.g., counter.set(counter.get() + 1)), it could lead to inconsistencies.

###### Parameters <a id="Counter.peek.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `key`    | [`str`](../spec.md#standard-types) | The key to be retrieved. | No | Platform-dependent |

---

##### `inflight-set` <a id="inflight-set"></a>

```wing
inflight set(value: num, key?: str): void
```

Set the counter to a given value.

###### Parameters <a id="Counter.set.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `value` | [`num`](../spec.md#standard-types) | New value. | Yes |  |
| `key`    | [`str`](../spec.md#standard-types) | The key to be incremented. | No | Platform-dependent |

---

## Structs <a id="structs"></a>

| **Name** | **Description** |
| -------- | --------------- |
| [CounterProps](#CounterProps-) | Optional parameter for the  [`new Counter`](#initializers) initializer. |

---

### CounterProps <a id="CounterProps-" id="@winglang/sdk.cloud.CounterProps"></a>

Optional parameter for the  [`new Counter`](#initializers) initializer.

```wing
struct CounterProps {
   initial: num; 
};
```

#### Properties <a id="CounterProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `initial` | [`num`](../spec.md#standard-types) | The initial value of the counter. | No | 0 |

---
