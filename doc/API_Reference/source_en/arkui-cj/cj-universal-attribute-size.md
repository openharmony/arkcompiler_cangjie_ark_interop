# Size Settings

Configure the width, height, and margins of components.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func constraintSize(Length, Length, Length, Length)

```cangjie
public func constraintSize(minWidth!: Length = 0.vp, maxWidth!: Length = (Float64.Inf).vp,
    minHeight!: Length = 0.vp, maxHeight!: Length = (Float64.Inf).vp): This
```

**Function:** Sets size constraints for the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| minWidth | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | 0.vp | Minimum width. |
| maxWidth | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | (Float64.Inf).vp | Maximum width. |
| minHeight | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | 0.vp | Minimum height. |
| maxHeight | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | (Float64.Inf).vp | Maximum height. |

## func height(Option\<Length>)

```cangjie
public func height(value: Option<Length>): This
```

**Function:** Sets the height of the component itself. If omitted, the height required by the element's content is used. If the child component's height exceeds the parent component's height, it will be drawn beyond the parent component's bounds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Option](<font color="red" face="bold">please add link</font>)\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)> | Yes | - | Component height.<br/>Unit: vp. |

## func layoutWeight(Int32)

```cangjie
public func layoutWeight(value: Int32): This
```

**Function:** Sets the layout weight of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | When the parent container's size is determined, child elements with the `layoutWeight` attribute and their siblings will allocate the main axis size proportionally based on their weights, ignoring their own size settings, indicating they will adaptively fill the remaining space.<br/>**Note:** Only effective in [Row](./cj-common-types.md#row)/[Column](./cj-common-types.md#column)/[Flex](./cj-row-column-stack-flex.md#flex) layouts. Optional values are numbers greater than or equal to 0 or strings that can be converted to numbers. If a child element in the container has the `layoutWeight` attribute set to a value greater than 0, all child elements will no longer be laid out based on `flexShrink` and `flexGrow`. |

## func margin(Length)

```cangjie
public func margin(value: Length): This
```

**Function:** Sets the margins of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The margins of the component, applied to all four directions simultaneously.<br/>Unit: vp. |

## func margin(Length, Length, Length, Length)

```cangjie
public func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**Function:** Sets the margins of the component in four directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top margin, the distance from the component's top to external elements. |
| right | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Right margin, the distance from the component's right boundary to external elements. |
| bottom | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom margin, the distance from the component's bottom to external elements. |
| left | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Left margin, the distance from the component's left boundary to external elements. |

## func padding(Length)

```cangjie
public func padding(value: Length): This
```

**Function:** Sets the padding of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The padding of the component, applied to all four directions simultaneously.<br/>Unit: vp. |

## func padding(Length, Length, Length, Length)

```cangjie
public func padding(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**Function:** Sets the padding of the component in four directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top padding, the distance from internal elements to the component's top.<br/>Default: 0.vp. |
| right | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Right padding, the distance from internal elements to the component's right boundary.<br/>Default: 0.vp. |
| bottom | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom padding, the distance from internal elements to the component's bottom.<br/>Default: 0.vp. |
| left | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Left padding, the distance from internal elements to the component's left boundary.<br/>Default: 0.vp. |

> **Note:**
>
> When setting padding as a percentage, the top, bottom, left, and right padding are all based on the parent container's width.

## func size(Length, Length)

```cangjie
public func size(width!: Length, height!: Length): This
```

**Function:** Sets the dimensions of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| width | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Component width.<br/>Unit: vp. |
| height | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Component height.<br/>Unit: vp. |

## func width(Option\<Length>)

```cangjie
public func width(value: Option<Length>): This
```

**Function:** Sets the width of the component itself. If omitted, the width required by the element's content is used. If the child component's width exceeds the parent component's width, it will be drawn beyond the parent component's bounds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Option](<font color="red" face="bold">please add link</font>)\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)> | Yes | - | Component width.<br>Default unit: vp. |