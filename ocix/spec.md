
# Open Cloud Interface Specification

## Table of Contents

- [Overview](#overview)
- [Notations and Terminology](#notations-and-terminology)
- [Type System](#type-system)
- [Cloud Resources](#cloud-resources)

## Overview

## Notations and Terminology

## Type System

In the context of the Open Cloud Interface Specification, standard types are defined to provide a consistent and vendor-neutral foundation for cloud resource specifications. These types serve as fundamental building blocks used to describe various properties and functionalities of cloud resources. By adhering to these standard types, the specification ensures interoperability and consistency across different implementations, without delving into the specific details or operations of any particular cloud provider. The focus is on defining the types themselves rather than their specific implementations or the operations that can be performed on them.

To simplify search, all types are consolidated in a single table in alphabetic order.

### Standard Types <a id="standard-types"></a>

| Name   | Definition                       |
| ------ | -------------------------------- |
| `Array<T>`    | Represents variable size arrays of a certain type.           |
| `bool` | Represents true or false values.        |
| `Datetime` | Represents single moments in time in a platform-independent format. |
| `Duration` | Represents time durations. |
|`(arg1: <type1>, arg2: <type2>, ...): <returnType> => <type>` | Represents preflight function references. |
| `inflight (arg1: <type1>, arg2: <type2>, ...): <returnType> => <type>` | Represents inflight function references. |
| `Json` | Represents untyped [JSON values](https://www.json.org/json-en.html), including JSON primitives (`string`, `number`,`boolean`),arrays (both heterogenous and homogeneous) and objects (key-value maps where keys are strings and values can be any other JSON value). |
| `Map<T>`      | Represents key-value data structures. |
| `num`  | Represents numbers.     |
| `void` | Represents the absence of a type. |
| `Set<T>`      | Represents unordered collections of unique items. |
| `str`  | Represents UTF-16 encoded strings.           |

## Cloud Resources

| Resource Name | Description              |
| :------------ | :----------------------- |
| [Api](resources/api.md) | Represents a cloud-managed API Gateway hosting a collection of HTTP endpoints. |
| [Bucket](resources/bucket.md) | Represents a container for storing data in the cloud. |
| [onDeploy](resources/on-deploy.md) | Represents a block of inflight code that runs each time the application is deployed. |
| [Queue](resources/queue.md) | Represents a distributed data structure for managing a sequence of messages. |
| [Schedule](resources/schedule.md) | Represents a trigger for events at regular intervals for periodic tasks. |
| [Secret](resources/secret.md) | Represents a secret value (such as an API key, certificate, etc.) securely stored in the cloud. |
| [Topic](resources/topic.md) | Represents a channel for publishing messages that subscribers can receive. |
| [Website](resources/website.md) | Represents a static website that can be hosted in the cloud. |
