# Column

A container that arranges its children vertically.

## Child Components

Can contain child components.

## Creating the Component

### init(Length, () -> Unit)

```cangjie
public init(space!: Length = 0.vp, child!: () -> Unit = {=>})
```

**Function:** Creates a Column container with vertical spacing between elements set to `space` that can contain child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| space | [Length](cj-common-types.md#interface-length) | No | 0.vp | Vertical spacing between elements in the column layout.<br> Does not take effect when `space` is negative or when [justifyContent](#func-justifycontentflexalign) is set to FlexAlign.SpaceBetween, FlexAlign.SpaceAround, or FlexAlign.SpaceEvenly. <br> Initial value: 0 <br> Unit: vp <br> **Note:** <br> `space` must be a number greater than or equal to 0. |
| child | () -> Unit | No | { => } | Child components of the Column container. |

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func alignItems(HorizontalAlign)

```cangjie
public func alignItems(value: HorizontalAlign): This
```

**Function:** Sets the horizontal alignment format for child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [HorizontalAlign](cj-common-types.md#enum-horizontalalign) | Yes | - | Horizontal alignment format for child components. <br> Initial value: HorizontalAlign.Center |

### func justifyContent(FlexAlign)

```cangjie
public func justifyContent(value: FlexAlign): This
```

**Function:** Sets the vertical alignment format for child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

> **Note:**
>
> In Column layout, if child components do not set [flexShrink](cj-universal-attribute-flexlayout.md#func-flexshrinkfloat64), they will not be compressed by default. This means the cumulative size of all child components along the main axis may exceed the container's main axis size.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [FlexAlign](cj-common-types.md#enum-flexalign) | Yes | - | Vertical alignment format for child components. <br> Initial value: FlexAlign.Start |