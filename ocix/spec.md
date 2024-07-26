
# Open Cloud Interface Specification

## Table of Contents

- [Why OCIX?](#why-ocix)
- [Key Concepts: "preflight" and "inflight"](#key-concepts)
- [Type System](#type-system)
- [Cloud Resources](#cloud-resources)

## Why OCIX? <a id="why-ocix"></a>

The cloud has transformed into a new form of super-computer. It is the ultimate computer, capable of elastically scaling, always being up, existing everywhere, and performing virtually any task. Despite its boundless potential, programming this super-computer remains unnecessarily complex due to numerous technicalities that interfere with the application logic.

### Complexity of Cloud Programming

Building applications for the cloud often requires dealing with technical details that do not directly contribute to the core value of the application. Tasks such as bundling dependencies, uploading files, and managing IAM policies distract developers from their primary goal of creating value for users. These technicalities make the development process cumbersome and hinder productivity.

### Incompatibility Across Cloud Vendors

Different cloud vendors provide incompatible definitions of semantically equivalent cloud resources. This inconsistency makes it challenging to create applications that are portable across different cloud environments. Developers must learn and adapt to the unique terminologies and specifications of each vendor, which increases the complexity and reduces the efficiency of cloud application development.

### Gap Between Cloud Resource Management and Consumption

There is a noticeable gap between cloud resources specified via orchestration engine templates (e.g., Terraform) and their consumption via programming language-specific SDKs. Orchestration tools are designed to manage cloud infrastructure, while SDKs are used to interact with these resources programmatically. This separation creates a disconnect that complicates the development and deployment processes.

### The Open Cloud Interface Specification (OCIX)

The "Open Cloud Interface Specification" (OCIX) aims to follow the footsteps of [POSIX](https://en.wikipedia.org/wiki/POSIX) by providing a cloud-neutral resource allocation, configuration, and consumption specification framework.

OCIX seeks to standardize how cloud resources are defined and interacted with, regardless of the programming language used and underlying cloud provider. OCIX aims to define a consistent and unified interface to simplify cloud programming and enhance developer productivity. OCIX is primarily intended for ['Infrastructure From Code' (IfC)](https://asher-sterkin.medium.com/ifc-2023-technology-landscape-6953ff9ab9e5) vendors, encouraging them to map OCIX vendor-neutral specifications to their specific solutions.

### Key Objectives of OCIX

1. **Simplifying Cloud Programming:** Reducing the technical overhead and enabling developers to focus on application logic rather than infrastructure details.
2. **Ensuring Compatibility:** Providing a standard that is compatible across different programming languages and cloud vendors to facilitate portability and interoperability.
3. **Bridging Orchestration and SDKs:** Creating seamless integration between resource orchestration and programmatic consumption, reducing the gap between these two aspects of cloud development.
4. **Promoting Independence:** Enabling developers to work independently without relying heavily on specific cloud vendor features or configurations.

OCIX aspires to make cloud programming more intuitive and efficient, thereby unlocking the full potential of the cloud as the new super-computer for modern applications.

## Key Concepts: "preflight: and "inflight" <a id="key-concepts"></a>

One of the main differentiators of the OCIX approach is that it unifies infrastructure definitions and application logic within a single programming model.

This is enabled by the concepts of the preflight and inflight execution phases:

- **Preflight:** Code that runs once at compile time and generates the infrastructure configuration of the cloud application. For example, setting up databases, queues, storage buckets, API endpoints, etc.
- **Inflight:** Code that runs within the cloud and implements the application's behavior. For example, API request handling, queue messages processing, etc. Inflight code can be executed on various platforms in the cloud, such as function services (AWS Lambda, Azure Functions), containers (ECS, Kubernetes), VMs, or even physical servers.

In general, a [cloud resource](#cloud-resources) specification can contain both preflight and inflight methods.

## Type System

In the context of the OCIX, standard types are defined to provide a consistent and vendor-neutral foundation for cloud resource specifications. These types serve as fundamental building blocks used to describe various properties and functionalities of cloud resources. By adhering to these standard types, the specification ensures interoperability and consistency across different implementations, without delving into the specific details or operations of any particular cloud provider. The focus is on defining the types themselves rather than their specific implementations or the operations that can be performed on them.

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

## Cloud Resources <a id="cloud-resources"></a>

| Resource Name | Description              |
| :------------ | :----------------------- |
| [Api](resources/api.md) | Represents a cloud-managed API Gateway hosting a collection of HTTP endpoints. |
| [Bucket](resources/bucket.md) | Represents a container for storing data in the cloud. |
| [Counter](resources/counter.md) | Represents a stateful container for one or more numbers in the cloud. |
| [Domain](resources/domain.md) | Represents a network domain configuration of a [`Website`](resources/website.md) in the cloud. |
| [Function](resources/function.md) | Represents a serverless function for performing short, stateless tasks. |
| [onDeploy](resources/on-deploy.md) | Represents a block of inflight code that runs each time the application is deployed. |
| [Queue](resources/queue.md) | Represents a distributed data structure for managing a sequence of messages. |
| [Schedule](resources/schedule.md) | Represents a trigger for events at regular intervals for periodic tasks. |
| [Secret](resources/secret.md) | Represents a secret value (such as an API key, certificate, etc.) securely stored in the cloud. |
| [Topic](resources/topic.md) | Represents a channel for publishing messages that subscribers can receive. |
| [Website](resources/website.md) | Represents a static website that can be hosted in the cloud. |
