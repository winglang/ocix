# Domain

TBC: is it only for a `Website`? What about `Api`?
The `Domain` resource represents a network domain configuration of a [`Website`](./website.md) in the cloud.

## Table of Contents

<!-- markdownlint-disable MD007 -->
- [API Reference](#api-reference)
    - [Initializers](#initializers)
- [Structs](#structs)
<!-- markdownlint-enable MD007 -->

## API Reference <a id="api-reference"></a>

### Initializers <a id="initializers"></a>

```wing
new Domain(props: DomainProps);
```

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `props` | [`DomainProps`](#DomainProps-) | New `Domain` properties. | Yes | |

---

## Structs <a id="structs"></a>

| **Name** | **Description** |
| -------- | --------------- |
| [DomainProps](#DomainProps-) | Options for [`new Domain`](#initializers) initializer. |

---

### DomainProps <a id="DomainProps-"></a>

```wing
struct DomainProps {
    domainName: str;
}
```

Options for [`new Domain`](#initializers) initializer.

#### Properties <a name="Properties" id="Properties"></a>

#### Properties <a id="DomainProps.Properties"></a>

| **Name** | **Type** | **Description** | **Required** | **Default** |
| --- | --- | --- | --- | --- |
| `domainName` | [`str`](../spec.md) | The [`Website`](./website.md) custom domain name. | Yes | |

---
