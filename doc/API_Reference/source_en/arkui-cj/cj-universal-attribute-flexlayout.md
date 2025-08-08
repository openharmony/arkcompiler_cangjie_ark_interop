# Flex Layout

> **Note:**
>
> Only takes effect when the parent component is [Column](./cj-row-column-stack-column.md) or [Row](./cj-row-column-stack-row.md).

## func flexBasis(Length)

```cangjie
public func flexBasis(value: Length): This
```

**Function:** Sets the base size of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :---------| :--------- | :------- | :-------- | :-------------------------------------------------- |
| value | [Length](./cj-common-types.md#interface-length) | Yes | - | The base size of the component along the main axis of the parent container. |

## func flexGrow(Float64)

```cangjie
public func flexGrow(value: Float64): This
```

**Function:** Sets the proportion of the remaining space in the parent container allocated to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :---------| :--------- | :------- | :-------- | :-------------------------------------------------- |
| value | Float64 | Yes | - | The proportion of the remaining space along the main axis of the parent container allocated to the component where this attribute is applied.<br>Range: (0, +∞), initial value: 0.0. |

## func flexGrow(Int64)

```cangjie
public func flexGrow(value: Int64): This
```

**Function:** Sets the proportion of the remaining space in the parent container allocated to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :------- | :--------- | :------- | :-------- | :-------------------------------------------------- |
| value | Int64 | Yes | - | The proportion of the remaining space along the main axis of the parent container allocated to the component where this attribute is applied.<br>Range: (0, +∞), initial value: 0. |

## func flexShrink(Float64)

```cangjie
public func flexShrink(value: Float64): This
```

**Function:** Sets the proportion of the parent container's compressed size allocated to the component where this attribute is applied. When the parent container is Column or Row, the size along the main axis must be set.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :------- | :--------- | :------- | :-------- | :-------------------------------------------------- |
| value | Float64 | Yes | - | The proportion of the parent container's compressed size allocated to the component where this attribute is applied.<br>When the parent container is [Column](./cj-row-column-stack-column.md) or [Row](./cj-row-column-stack-row.md), the range is (0, +∞), initial value: 0.0.<br>[constraintSize](./cj-universal-attribute-size.md#func-constraintsizelength-length-length-length) limits the size range of the component. Even if [constraintSize](./cj-universal-attribute-size.md#func-constraintsizelength-length-length-length) is set for [Column](./cj-row-column-stack-column.md) and [Row](./cj-row-column-stack-row.md), when the main axis size ([width](./cj-universal-attribute-size.md#func-widthlength)/[height](./cj-universal-attribute-size.md#func-heightlength)/[size](./cj-universal-attribute-size.md#func-sizelength-length)) is not set, the default layout behavior is followed, where the main axis adapts to the size of child components, and flexShrink does not take effect. |

## func flexShrink(Int64)

```cangjie
public func flexShrink(value: Int64): This
```

**Function:** Sets the proportion of the parent container's compressed size allocated to the component where this attribute is applied. When the parent container is Column or Row, the size along the main axis must be set.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :------- | :--------- | :------- | :-------- | :-------------------------------------------------- |
| value | Int64 | Yes | - | The proportion of the parent container's compressed size allocated to the component where this attribute is applied.<br>When the parent container is Column or Row, the initial value is 0.<br>When the parent container is Flex, the initial value is 1. |

## func alignSelf(ItemAlign)

```cangjie
public func alignSelf(value: ItemAlign): This
```

**Function:** The alignment format of the child component along the cross axis of the parent container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :------- | :--------- | :------- | :-------- | :-------------------------------------------------- |
| value | [ItemAlign](./cj-common-types.md#enum-itemalign) | Yes | - | The alignment format of the child component along the cross axis of the parent container, which overrides the alignItems setting in Flex, Column, Row, and GridRow layout containers.<br>GridCol can bind the alignSelf attribute to change its layout along the cross axis.<br>Initial value: ItemAlign.Auto. |