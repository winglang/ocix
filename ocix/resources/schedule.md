# Schedule

The `Schedule` resource represents a trigger for events at regular intervals. Schedules are useful for periodic tasks, such as running backups or sending daily reports. The timezone used in cron expressions is always UTC.

## Table of Contents

- [API Reference](#api-reference)
    - [Initializers](#initializers)
    - [Methods](#methods)
        - [Preflight Methods](#preflight-methods)
- [Structs](#structs)
- [Protocols](#protocols)

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

```wing
new Schedule(props?: ScheduleProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `props` | [`ScheduleProps`](#ScheduleProps-) | New `Schedule` resource properties | No | `{}` |

---

### Methods <a id="methods"></a>

#### Preflight Methods <a id="preflight-methods"></a>

| **Name** | **Description** |
| --- | --- |
| `onTick` | Configure the `Schedule` to call the inflight [`handle`](#handle) method of a class implementing the [`IScheduleOnTickHandler`](#IScheduleOnTickHandler-) at the scheduled time intervals. |

---

##### `onTick` <a id="onTick-"></a>

```wing
onTick(handler: IScheduleOnTickHandler, props?: ScheduleOnTickOptions): Function
```

Configure the `Schedule` to call the inflight [`handle`](#handle) method of a class implementing the [`IScheduleOnTickHandler`](#IScheduleOnTickHandler-) at the scheduled time intervals.

###### Parameters <a id="Bucket.onCreate.parameters"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| -------- | -------- | --------------- | ------------ | ----------- |
| `handler` | [`IScheduleOnTickHandler`](#IScheduleOnTickHandler-) | Event handler pointer. | Yes | |
| `props` | [`ScheduleOnTickOptions`](#ScheduleOnTickOptions-) | Event handling options. | No | `{}` |

---

## Structs <a id="structs"></a>

| **Name** | **Description** |
| -------- | --------------- |
| [ScheduleOnTickOptions](#ScheduleOnTickOptions-) | Options for the [`Schedule.onTick`](#onTick-) method. |
| [ScheduleProps](#ScheduleProps-) | Options for [`new Schedule`](#initializers) initializer. |

---

### ScheduleOnTickOptions <a id="ScheduleOnTickOptions-"></a>

```wing
struct ScheduleOnTickOptions extends FunctionProps {}
```

Options for the [`Schedule.onTick`](#onTick-) method.

#### Properties <a id="ScheduleOnTickOptions.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `concurrency` | [`num`](../spec.md#standard-types) | The maximum number of concurrent invocations that can run simultaneously. | No | platform-specific |
| `env`| [`Map<str>`](../spec.md#standard-types) | Environment variables to pass to the function. | No | empty |
| `logRetentionDays` | [`num`](../spec.md#standard-types) | The number of days to keep the function logs. A negative value means "Never".| No | 30 |
| `memory` | [`num`](../spec.md#standard-types) | The amount of memory to allocate to the function, in MB. | No | 1024 |
| `timeout` | [`Duration`](../spec.md#standard-types) | Maximum duration the function can run for a single invocation. | No | 1m |

---

### ScheduleProps <a id="ScheduleProps-"></a>

```wing
struct ScheduleProps {
    cron: str?;
    rate: Duration?;
}
```

Options for [`new Schedule`](#initializers) initializer.

#### Properties <a id="ScheduleProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `cron` | [`str`](../spec.md#standard-types) | Event trigger schedule in the [UNIX cron format](#unix-cron-format). | No | Undefined |
| `rate` | [`Duration`](../spec.md#standard-types) | Trigger events at a periodic time interval. | No | Undefined |

TBD: these two fields are presumably mutually exclusive, but at least one has to be defined.

---

##### `UNIX cron Format` <a id="unix-cron-format" ></a>

Timezone is UTC.

[minute] [hour] [day of month] [month] [day of week]

- '*' means all possible values.
- '-' means a range of values.
- ',' means a list of values.
- [minute] allows 0-59.
- [hour] allows 0-23.
- [day of month] allows 1-31.
- [month] allows 1-12 or JAN-DEC.
- [day of week] allows 0-6 or SUN-SAT.

For more details look [here](https://en.wikipedia.org/wiki/Cron)

---

## Protocols <a id="protocols"></a>

### IScheduleOnTickHandler <a id="IScheduleOnTickHandler-"></a>

Defines an inflight [`handle`](#handle) method that is invoked to process the [`Schedule.onTick`](#onTick-) events.

#### Methods <a id="IScheduleOnTickHandler.Methods"></a>

| **Name** | **Description** |
| --- | --- |
| [`handle`](#handle) | Function that will be called at scheduled time intervals. |

---

##### `handle` <a id="handle"></a>

```wing
inflight handle(): void
```

Function that will be called at scheduled time intervals.
