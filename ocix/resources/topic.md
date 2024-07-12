# Topic <a id="Topc"></a>

The `Topic` represents a channel for publishing messages that subscribers can receive.

`Topic` resources are fundamental in event-driven architectures, particularly in pub-sub messaging systems, as they help decouple data producers from multiple data consumers.

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
new Topic(props?: TopicProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `props` | [`TopicProps`](#TopicProps-) | New Topic Properties | No | `{}` |

---

#### Methods <a name="Methods" id="methods"></a>

##### Preflight Methods <a id="preflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`onMessage`](#onMessage-) | Configure the `Topic` to invoke the inflight [`handle`](#handle) method of a class implementing the [`ITopicMessageHandler`](#ITopicMessageHandler-) interface whenever a new `Topic` message is available. |
| [`subscribeQueue`](#subscribeQueue-) | Create a new `Queue` and configure the `Topic` to forward messages to it. |

##### `onMessage` <a id="onMessage-"></a>

```wing
onMessage(handler: ITopicMessageHandler, props?: TopicOnMessageOptions): Function
```

Configure the `Topic` to invoke the inflight [`handle`](#handle) method of a class implementing the [`ITopicMessageHandler`](#ITopicMessageHandler-) interface whenever a new `Topic` message is available.

###### Parameters <a id ="Topic.onMessage.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `handler` | [`ITopicMessageHandler`](#ITopicMessageHandler-) | Message handler pointer | Yes | |
| `props` | [`TopicOnMessageOptions-`](#TopicOnMessageOptions-) | Additional message handler proproperties | No | `{}` |

---

##### `subscribeQueue` <a id="subscribeQueue-"></a>

```wing
subscribeQueue(queue: Queue, props?: TopicSubscribeQueueOptions): void
```

Create a new `Queue` and configure the `Topic` to forward messages to it.

###### Parameters <a id ="Topic.subscribeQueue.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `queue` | [`Queue`](queue.md) | Reference to a `Queue` where the `Topic` messages will be forwarded. | Yes | |
| `props` | [`TopicSubscribeQueueOptions`](#TopicSubscribeQueueOptions-) | Additional subscription properties | No | `{}` |

---

##### Inflight Methods <a id="inflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`publish`](#inflight-publish) | Publish messages to the `Topic`. If multiple messages are provided, they will be published as a batch provided that this is supported by the target platform. |

---

##### `publish` <a id="inflight-publish"></a>

```wing
inflight publish(...messages: Array<str>): void
```

Publish messages to the `Topic`. If multiple messages are provided, they will be published as a batch provided that this is supported by the target platform.

###### Parameters <a id ="Queue.setConsumer.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `messages` | [`Array<str>`](../spec.md#standard-types) | Message payloads to publish to the `Topic`. | Yes | |

## Structs <a id="structs"></a>

### TopicOnMessageOptions <a id="TopicOnMessageOptions-" ></a>

Options for [`Topic.onMessage`](#onMessage-).

#### Properties <a name="Properties" id="Topic.onMessage.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env` | [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### TopicProps <a id="TopicProps-"></a>

New `Topic` options.

### DeadLetterQueueProps <a id="DeadLetterQueueProps-"></a>

Dead letter queue options. TBD: this is a duplication of the [`Queue.DeadLetterQueueProps`](./queue.md#deadletterqueueprops-)

#### Properties <a name="Properties" id="DeadLetterQueueProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `queue` | [`Queue`](./queue.md) | Queue to receive messages that could not be processed successfully. | Yes | |
| `maxDeliveryAttempts` | [`num`](../spec.md#standard-types) | Number of retries before sending the message to the dead-letter queue. | No | 1 |

---

### TopicSubscribeQueueOptions <a id="TopicSubscribeQueueOptions-"></a>

Options for [`Topic.subscribeQueue`](#subscribeQueue-).
TBD: this is a duplication of the [`Queue.QueueProps`](./queue.md#queueprops-)

#### Properties <a name="Properties" id="Topic.subscribeQueue.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `dlq` | [`DeadLetterQueueProps`](#DeadLetterQueueProps-) | A dead-letter queue. | No | `nil` |
| `retentionPeriod` | ['Duration`](../spec.md#standard-types) | Maximum period of time to keep a message in the queue. | No | 1h |
| `timeout` | ['Duration`](../spec.md#standard-types) | Maximum time allowed for a message to be processed by a consumer. | No | 30s |

---

## Protocols <a name="Protocols" id="protocols"></a>

TBD: could be generalized to [`IMessageHandler`](./queue.md#IQueueMessageHandler) and shared with [`Queue`](./queue.md).

### ITopicMessageHandler <a id="ITopicMessageHandler-"></a>

The [`Topic.onMessage`](#onMessage-) parameter.  Defines an inflight [`handle`](#handle) method that is invoked to process the `Topic` messages.

#### Methods <a id="ITopicMessageHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| `handle` | Function that is called to process the next available `Topic` message. |

---

##### `handle` <a id="handle"></a>

```wing
inflight handle(message: str): void
```

Function that is called to process the next available `Topic` message.

###### Parameters <a id="ITopicMessageHandler.handle.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `message` | [`str'](../spec.md#standard-types) | The message payload | Yes | |

---
