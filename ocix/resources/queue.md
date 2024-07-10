# Queue <a id="Queue"></a>

The `Queue` resource represents a distributed data structure for managing a sequence of messages.

Queues are typically used to decouple the producers and consumers of data in distributed systems.

By default, queues are not FIFO (first in, first out), so the order of messages is not guaranteed.

## Table of Contents

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
new Queue(props?: QueueProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `props` | [`QueueProps`](#QueueProps-) | New Queue Properties | No | `{}` |

---

#### Methods <a id="methods"></a>

##### Preflight Methods <a id="preflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`setConsumer`](#setConsumer-) | Configure the `Queue` to invoke the inflight [`handle`](#handle) method of a class implementing the [`IQueueMessageHandler`](#IQueueMessageHandler-) interface whenever a new message is available. |

##### `setConsumer` <a id="setConsumer-"></a>

```wing
setConsumer(handler: IQueueMessageHandler, props?: QueueSetConsumerOptions): Function
```

Configure the `Queue` to invoke the inflight [`handle`](#handle) method of a class implementing the [`IQueueMessageHandler`](#IQueueMessageHandler-) interface whenever a new message is available.

###### Parameters <a id ="Queue.setConsumer.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `handler` | [`IQueueMessageHandler`](#IQueueMessageHandler-) | Message handler pointer | Yes | |
| `props` | [`QueueSetConsumerOptions`](#QueueSetConsumerOptions-) | Additional message hanlder properties | No | `{}` |

---

##### Inflight Methods <a id="inflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`approxSize`](#approxSize-) | Retrieve the approximate number of messages in the queue. |
| [`pop`](#pop) | Pop a message from the queue if any. |
| [`purge`](#purge) | Remove all messages from the queue. |
| [`push`](#push) | Push one or more messages to the queue. |

---

##### `approxSize` <a id="approxSize-"></a>

```wing
inflight approxSize(): num
```

Retrieve the approximate number of messages in the queue.

##### `pop` <a id="pop"></a>

```wing
inflight pop(): str?
```

Pop a message from the queue if any.

##### `purge` <a id="purge"></a>

```wing
inflight purge(): void
```

Remove all messages from the queue.

##### `push` <a id="push"></a>

```wing
inflight push(...messages: Array<str>): void
```

Push one or more messages to the queue.

###### Parameters <a id ="Queue.push.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `messages` | [`Array<str>`](../spec.md#startndard-types) | Message payloads to send to the queue. Each message must be non-empty. | Yes | |

---

## Structs <a id="structs"></a>

### DeadLetterQueueProps <a id="DeadLetterQueueProps-"></a>

Dead letter queue options.

#### Properties <a name="Properties" id="DeadLetterQueueProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `queue` | [`Queue`](#Queue) | Queue to receive messages that could not be processed successfully. | Yes | |
| `maxDeliveryAttempts` | [`num`](../spec.md#standard-types) | Number of retries before sending the message to the dead-letter queue. | No | 1 |

---

### QueueProps <a id="QueueProps-"></a>

New `Queue` properties.

#### Properties <a id="QueueProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `dlq` | [`DeadLetterQueueProps`](#DeadLetterQueueProps-) | A dead-letter queue. | No | `nil` |
| `retentionPeriod` | ['Duration`](../spec.md#standard-types) | Maximum period of time to keep a message in the queue. | No | 1h |
| `timeout` | ['Duration`](../spec.md#standard-types) | Maximum time allowed for a message to be processed by a consumer. | No | 30s |

---

### QueueSetConsumerOptions <a id="QueueSetConsumerOptions-"></a>

Options for [`Queue.setConsumer`](#setConsumer-).

#### Properties <a id="Queue.setConsumer.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |
| `batchSize` | [`num`](../spec.md#standard-types) | Maximum number of messages to be processed in a single invocation. | No | 1 |

---

## Protocols <a id="protocols"></a>

### IQueueMessageHandler <a id="IQueueMessageHandler-"></a>

The [`Queue.setConsumer`](#setConsumer-) parameter.  Defines an inflight `handle` method that is invoked to process the `Queue` messages.

#### Methods <a id="IQueueMessageHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| `handle` | Function that is called to process the next available `Queue` message. |

---

##### `handle` <a id="handle"></a>

```wing
inflight handle(message: str): void
```

Function that is called to process the next available  `Queue` message.

###### Parameters <a id="IQueueMessageHandler.handle.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `message` | [`str'](../spec.md#standard-types) | The message payload | Yes | |
