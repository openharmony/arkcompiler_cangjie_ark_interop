# Dimension Settings

Configure the width, height, and margins of components.

## func width(Length)

```cangjie
public func width(value: Length): This
```

**Function:** Sets the width of the component. When unspecified, the component uses the width required by its own content. If a child component's width exceeds its parent's width, it will render beyond the parent's boundaries.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](cj-common-types.md#interface-length) | Yes | \- | Component width.<br/>Unit: vp. |

## func width\<T>(Option\<T>)

```cangjie
public func width<T>(value: Option<T>): This
```

**Function:** Sets the width of the component. When the parameter value is `None`, the component uses the width required by its own content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Option\<T> | Yes | \- | Component width.<br/>T can be Int64, Float64, Length, or AppResource. |

## func height(Length)

```cangjie
public func height(value: Length): This
```

**Function:** Sets the height of the component. When unspecified, the component uses the height required by its own content. If a child component's height exceeds its parent's height, it will render beyond the parent's boundaries.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](cj-common-types.md#interface-length) | Yes | - | Component height.<br/>Unit: vp. |

## func height\<T>(Option\<T>)

```cangjie
public func height<T>(value: Option<T>): This
```

**Function:** Sets the height of the component. When the parameter value is `None`, the component uses the width required by its own content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Option\<T> | Yes | \- | Component height.<br/>T can be Int64, Float64, Length, or AppResource. |

## func size(Length, Length)

```cangjie
public func size(width!: Length, height!: Length): This
```

**Function:** Sets the height and width of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| width | [Length](./cj-common-types.md#interface-length) | Yes | \- | **Named parameter.** Component width.<br/>Unit: vp. |
| height | [Length](./cj-common-types.md#interface-length) | Yes | \- | **Named parameter.** Component height.<br/>Unit: vp. |

## func padding(Length)

```cangjie
public func padding(value: Length): This
```

**Function:** Sets the padding property.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](./cj-common-types.md#interface-length) | Yes | - | Component padding, applied uniformly to all four sides.<br/>Unit: vp. |

## func padding(Length, Length, Length, Length)

```cangjie
public func padding(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**Function:** Sets the padding property.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top padding, the distance between the component's content and its top edge.<br/>Default: 0.vp. |
| right | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Right padding, the distance between the component's content and its right edge.<br/>Default: 0.vp. |
| bottom | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom padding, the distance between the component's content and its bottom edge.<br/>Default: 0.vp. |
| left | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Left padding, the distance between the component's content and its left edge.<br/>Default: 0.vp. |

> **Note:**
>
> When setting padding as a percentage, the top, right, bottom, and left padding are all calculated based on the parent container's width.

## func margin(Length)

```cangjie
public func margin(value: Length): This
```

**Function:** Sets the margin property.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](./cj-common-types.md#interface-length) | Yes | - | Component margin, applied uniformly to all four sides.<br/>Unit: vp. |

## func margin(Length, Length, Length, Length)

```cangjie
public func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**Function:** Sets the margin property.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top margin, the distance between the component's top edge and external elements. |
| right | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Right margin, the distance between the component's right edge and external elements. |
| bottom | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom margin, the distance between the component's bottom edge and external elements. |
| left | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Left margin, the distance between the component's left edge and external elements. |

## func layoutWeight(Int32)

```cangjie
public func layoutWeight(value: Int32): This
```

**Function:** Sets the layout weight of the component. Components with this property will distribute their size along the main axis of the parent container ([Row](./cj-common-types.md#row)/[Column](./cj-common-types.md#column)) according to their weights.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | When the parent container's size is determined, child elements with the `layoutWeight` property will distribute their size along the main axis with their siblings according to their weights, ignoring their own size settings, and adaptively fill the remaining space.<br/>**Note:** Only effective in [Row](./cj-common-types.md#row)/[Column](./cj-common-types.md#column) layouts. The value must be a number ≥ 0 or a string that can be converted to a number. If a child element in the container has a `layoutWeight` property set to a value > 0, all child elements will no longer be laid out based on `flexShrink` and `flexGrow`. |

## func constraintSize(Length, Length, Length, Length)

```cangjie
public func constraintSize(minWidth!: Length = 0.vp, maxWidth!: Length = (Float64.Inf).vp, minHeight!: Length = 0.vp, maxHeight!: Length = (Float64.Inf).vp): This
```

**Function:** Sets constraint dimensions to limit the size range during component layout.

> **Note:**
>
> For `Width` and `Height`, the resulting values are influenced by `constraintSize` settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| minWidth | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Minimum width of the element.<br/>Default: 0.vp. |
| maxWidth | [Length](./cj-common-types.md#interface-length) | No | (Float64.Inf).vp | **Named parameter.** Maximum width of the element.<br/>Default: (Float64.Inf).vp. |
| minHeight | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Minimum height of the element.<br/>Default: 0.vp. |
| maxHeight | [Length](./cj-common-types.md#interface-length) | No | (Float64.Inf).vp | **Named parameter.** Maximum height of the element.<br/>Default: (Float64.Inf).vp. |

**Impact of `constraintSize(minWidth/maxWidth/minHeight/maxHeight)` on `width/height`**

| Default Value | Result |
| :------ | :------ |
| \ | `width = MAX(minWidth, MIN(maxWidth, width))`<br/>`height = MAX(minHeight, MIN(maxHeight, height))` |
| `maxWidth`, `maxHeight` | **Named parameter.** `width = MAX(minWidth, width)`<br/>`height = MAX(minHeight, height)` |
| `minWidth`, `minHeight` | **Named parameter.** `width = MIN(maxWidth, width)`<br/>`height = MIN(maxHeight, height)` |
| `width`, `height` | If `minWidth < maxWidth`, the component's own layout logic applies, and `width` ranges between `[minWidth, maxWidth]`; otherwise, `width = MAX(minWidth, maxWidth)`.<br/>If `minHeight < maxHeight`, the component's own layout logic applies, and `height` ranges between `[minHeight, maxHeight]`; otherwise, `height = MAX(minHeight, maxHeight)`. |
| `width` & `maxWidth`, `height` & `maxHeight` | `width = minWidth`<br/>`height = minHeight` |
| `width` & `minWidth`, `height` & `minHeight` | The component's own layout logic applies, and `width` is constrained to ≤ `maxWidth`.<br/>The component's own layout logic applies, and `height` is constrained to ≤ `maxHeight`. |
| `minWidth` & `maxWidth`, `minHeight` & `maxHeight` | **Named parameter.** `width` is based on the set value and may stretch or compress according to other layout properties.<br/>`height` is based on the set value and may stretch or compress according to other layout properties. |
| `width` & `minWidth` & `maxWidth` | Uses the layout constraints passed by the parent container. |
| `height` & `minHeight` & `maxHeight` | Uses the layout constraints passed by the parent container. |