# Position Settings

Configure the alignment, layout direction, and display position of components.

## func align(Alignment)

```cangjie
public func align(value: Alignment): This
```

**Function:** Sets the alignment of child elements within the drawing area of a container element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Alignment](./cj-common-types.md#enum-alignment) | Yes | - | The alignment of child elements within the drawing area of a container element.<br> Only effective in Stack, Button, Marquee, StepperItem, Text, TextArea, TextInput, FolderStack, and Scroll components. For text-related components (Text, TextArea, TextInput), the align result refers to [TextAlign](./cj-common-types.md#enum-textalign). Components that do not support the textAlign property cannot set horizontal text alignment.<br> Initial value: Alignment.Center. <br> **Note:**<br>This property does not support mirroring capability. In Stack, this property has the same effect as alignContent and can only set the alignment of child components within the container. |

## func alignRules(AlignRuleOption)

```cangjie
public func alignRules(value: AlignRuleOption): This
```

**Function:** Specifies the alignment rules for child components within a relative container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [AlignRuleOption](#class-alignruleoption) | Yes | - | Specifies the alignment rules for child components within a relative container. |

## func alignRules(LocalizedAlignRuleOptions)

```cangjie
public func alignRules(value: LocalizedAlignRuleOptions): This
```

**Function:** Specifies the alignment rules for child components within a relative container. This method replaces left and right with start and end in the horizontal direction to support mirroring in RTL mode. It is recommended to use this method to specify alignment rules for child components within a relative container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [LocalizedAlignRuleOptions](#class-localizedalignruleoptions) | Yes | - | Specifies the alignment rules for child components within a relative container. |

## func chainMode(Axis, ChainStyle)

```cangjie
public func chainMode(direction: Axis, style: ChainStyle): This
```

**Function:** Specifies the parameters for the chain formed with this component as the chain head. The chain head refers to the first component in the chain when chain rules are met (starting from the left in the horizontal direction, or from the right in mirrored languages; starting from the top in the vertical direction).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| direction | [Axis](./cj-common-types.md#enum-axis) | Yes | - | The direction of the chain. |
| style | [ChainStyle](#enum-chainstyle) | Yes | - | The style of the chain. |

## func direction(Direction)

```cangjie
public open func direction(value: Direction): This
```

**Function:** Sets the layout direction along the main axis within a container element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Direction](./cj-common-types.md#enum-direction) | Yes | - | The layout direction along the main axis within a container element.<br> When set to auto, the layout follows the system language direction. This property does not take effect in Column components.<br> Initial value: Direction.Auto. |

## func markAnchor(Length, Length)

```cangjie
public func markAnchor(x!: Length, y!: Length): This
```

**Function:** Sets the anchor point for element positioning. Further offsets the position from the position or offset.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** The x-axis coordinate. |
| y | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** The y-axis coordinate. |

> - **Note:**
>
> - Setting `.position(x: value1, y: value2).markAnchor(x: value3, y: value4)` is equivalent to setting `.position(x: value1 - value3, y: value2 - value4)`. The same applies to offset. Using markAnchor alone, `.markAnchor(x: value1, y: value2)`, is equivalent to setting `.offset(x: -value1, y: -value2)`.

## func offset(Length, Length)

```cangjie
public open func offset(x!: Length, y!: Length): This
```

**Function:** Relative offset, which adjusts the component's position relative to its original layout position. The offset property does not affect the parent container's layout; it only adjusts the position during rendering.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** The x-axis coordinate. |
| y | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** The y-axis coordinate. |

> - **Note:**
>
> - The Position type offsets based on the top-left corner of the component itself, while the Edges type offsets based on the four edges of the component itself. Setting the offset property to `(x: x, y: y)` has the same effect as setting `(left: x, top: y)` or `(right: -x, bottom: -y)`. The LocalizedEdges type supports mirroring mode: in LTR mode, start is equivalent to x, and in RTL mode, it is equivalent to -x.

## func position(Length, Length)

```cangjie
public func position(x!: Length, y!: Length): This
```

**Function:** Absolute positioning, which determines the position of a child component relative to its parent. When the parent container is Row/Column/Flex, child components with position set do not occupy space.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** The x-axis coordinate. |
| y | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** The y-axis coordinate. |

> - **Note:**
>
> - The Position type determines the position based on the top-left corner of the parent component.
> - Suitable for scenarios where components need to be fixed in position within the parent container, such as top displays or floating buttons.
> - Not supported on layout containers with zero width or height.

## Basic Type Definitions

### class AlignRuleOption

```cangjie
public class AlignRuleOption {
    public AlignRuleOption (
        public var left!: ?HorizontalAnchor = None,
        public var right!: ?HorizontalAnchor = None,
        public var middle!: ?HorizontalAnchor = None,
        public var top!: ?VerticalAnchor = None,
        public var bottom!: ?VerticalAnchor = None,
        public var center!: ?VerticalAnchor = None,
        public var bias!: ?Bias = None
    )
}
```

**Function:** Specifies the alignment rules for child components within a relative container.

**Since:** 12

#### var bias

```cangjie
public var bias:?Bias = None
```

**Function:** Sets the offset parameter for the component under anchor constraints, which is the ratio of the distance to the left/top anchor to the total distance between anchors.

**Type:** ?[Bias](#class-bias)

**Read-Write Capability:** Read-Write

**Since:** 12

#### var bottom

```cangjie
public var bottom:?VerticalAnchor = None
```

**Function:** Sets the parameters for bottom alignment.

**Type:** ?[VerticalAnchor](#class-verticalanchor)

**Read-Write Capability:** Read-Write

**Since:** 12

#### var center

```cangjie
public var center:?VerticalAnchor = None
```

**Function:** Sets the parameters for vertical center alignment.

**Type:** ?[VerticalAnchor](#class-verticalanchor)

**Read-Write Capability:** Read-Write

**Since:** 12

#### var left

```cangjie
public var left:?HorizontalAnchor = None
```

**Function:** Sets the parameters for left alignment.

**Type:** ?[HorizontalAnchor](#class-horizontalanchor)

**Read-Write Capability:** Read-Write

**Since:** 12

#### var middle

```cangjie
public var middle:?HorizontalAnchor = None
```

**Function:** Sets the parameters for horizontal center alignment.

**Type:** ?[HorizontalAnchor](#class-horizontalanchor)

**Read-Write Capability:** Read-Write

**Since:** 12

#### var right

```cangjie
public var right:?HorizontalAnchor = None
```

**Function:** Sets the parameters for right alignment.

**Type:** ?[HorizontalAnchor](#class-horizontalanchor)

**Read-Write Capability:** Read-Write

**Since:** 12

#### var top

```cangjie
public var top:?VerticalAnchor = None
```

**Function:** Sets the parameters for top alignment.

**Type:** ?[VerticalAnchor](#class-verticalanchor)

**Read-Write Capability:** Read-Write

**Since:** 12

#### AlignRuleOption(?HorizontalAnchor, ?HorizontalAnchor, ?HorizontalAnchor, ?VerticalAnchor, ?VerticalAnchor, ?VerticalAnchor, ?Bias)

```cangjie
public AlignRuleOption (
    public var left!: ?HorizontalAnchor = None,
    public var right!: ?HorizontalAnchor = None,
    public var middle!: ?HorizontalAnchor = None,
    public var top!: ?VerticalAnchor = None,
    public var bottom!: ?VerticalAnchor = None,
    public var center!: ?VerticalAnchor = None,
    public var bias!: ?Bias = None
)
```
**Function:** Creates an object of type `AlignRuleOption`.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| left | ?[HorizontalAnchor](#class-horizontalanchor) | No | None | **Named parameter.** Sets the left alignment parameter. |
| right | ?[HorizontalAnchor](#class-horizontalanchor) | No | None | **Named parameter.** Sets the right alignment parameter. |
| middle | ?[HorizontalAnchor](#class-horizontalanchor) | No | None | **Named parameter.** Sets the horizontal center alignment parameter. |
| top | ?[VerticalAnchor](#class-verticalanchor) | No | None | **Named parameter.** Sets the top alignment parameter. |
| bottom | ?[VerticalAnchor](#class-verticalanchor) | No | None | **Named parameter.** Sets the bottom alignment parameter. |
| center | ?[VerticalAnchor](#class-verticalanchor) | No | None | **Named parameter.** Sets the vertical center alignment parameter. |
| bias | ?[Bias](#class-bias) | No | None | **Named parameter.** Sets the offset parameter of the component under anchor constraints, which is the ratio of the distance to the left/top anchor to the total distance between anchors. |

### class Bias

```cangjie
public class Bias {
    public Bias(
        public var horizontal!: ?Float32 = None,
        public var vertical!: ?Float32 = None
    )
}
```

**Function:** Sets the offset parameter of the component under anchor constraints. The value is the ratio of the distance to the left/top anchor to the total distance between anchors.

**Initial Version:** 12

#### var horizontal

```cangjie
public var horizontal:?Float32 = None
```

**Function:** The bias value in the horizontal direction.

**Type:** ?Float32

**Read/Write Permission:** Readable and Writable

**Initial Version:** 12

#### var vertical

```cangjie
public var vertical:?Float32 = None
```

**Function:** The bias value in the vertical direction.

**Type:** ?Float32

**Read/Write Permission:** Readable and Writable

**Initial Version:** 12

#### Bias(?Float32, ?Float32)

```cangjie
public Bias(
    public var horizontal!: ?Float32 = None,
    public var vertical!: ?Float32 = None
)
```

**Function:** Creates a `Bias` object.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| horizontal | ?Float32 | No | None | **Named parameter.** The bias value in the horizontal direction. Takes effect when the child component's `width` property has a valid value and there are two horizontal anchors.<br> Default value: 0.5. |
| vertical | ?Float32 | No | None | **Named parameter.** The bias value in the vertical direction. Takes effect when the child component's `height` property has a valid value and there are two vertical anchors.<br> Default value: 0.5. |

### class HorizontalAnchor

```cangjie
public class HorizontalAnchor {
    public HorizontalAnchor (
        public var anchor: String,
        public var align: HorizontalAlign
    )
}
```

**Function:** Sets the horizontal alignment parameters.

**Initial Version:** 12

#### var align

```cangjie
public var align: HorizontalAlign
```

**Function:** Sets the alignment relative to the anchor component.

**Type:** [HorizontalAlign](./cj-common-types.md#enum-horizontalalign)

**Read/Write Permission:** Readable and Writable

**Initial Version:** 12

#### var anchor

```cangjie
public var anchor: String
```

**Function:** Sets the ID value of the component serving as the anchor.

**Type:** String

**Read/Write Permission:** Readable and Writable

**Initial Version:** 12

#### HorizontalAnchor(String, HorizontalAlign)

```cangjie
public HorizontalAnchor (
    public var anchor: String,
    public var align: HorizontalAlign
)
```

**Function:** Creates a `HorizontalAnchor` object.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| anchor | String | Yes | - | The ID value of the component serving as the anchor. |
| align | [HorizontalAlign](./cj-common-types.md#enum-horizontalalign) | Yes | - | The alignment relative to the anchor component. |

### class LocalizedAlignRuleOptions

```cangjie
public class LocalizedAlignRuleOptions {
    public LocalizedAlignRuleOptions (
        public var start!: ?LocalizedHorizontalAlignParam = None,
        public var end!: ?LocalizedHorizontalAlignParam = None,
        public var middle!: ?LocalizedHorizontalAlignParam = None,
        public var top!: ?LocalizedVerticalAlignParam = None,
        public var bottom!: ?LocalizedVerticalAlignParam = None,
        public var center!: ?LocalizedVerticalAlignParam = None,
        public var bias!: ?Bias = None
    )
}
```

**Function:** Specifies the alignment rules for child components within a relative container.

**Initial Version:** 19

#### var bias

```cangjie
public var bias:?Bias = None
```

**Function:** Sets the offset parameter of the component under anchor constraints, which is the ratio of the distance to the left/top anchor to the total distance between anchors.

**Type:** ?[Bias](#class-bias)

**Read/Write Permission:** Readable and Writable

**Initial Version:** 19

#### var bottom

```cangjie
public var bottom:?LocalizedVerticalAlignParam = None
```

**Function:** Sets the vertical bottom alignment parameter.

**Type:** ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)

**Read/Write Permission:** Readable and Writable

**Initial Version:** 19

#### var center

```cangjie
public var center:?LocalizedVerticalAlignParam = None
```

**Function:** Sets the vertical center alignment parameter.

**Type:** ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)

**Read/Write Permission:** Readable and Writable

**Initial Version:** 19

#### var end

```cangjie
public var end:?LocalizedHorizontalAlignParam = None
```

**Function:** Sets the horizontal alignment parameter, which is right-aligned in LTR mode and left-aligned in RTL mode.

**Type:** ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)

**Read/Write Permission:** Readable and Writable

**Initial Version:** 19

#### var middle

```cangjie
public var middle:?LocalizedHorizontalAlignParam = None
```

**Function:** Sets the horizontal center alignment parameter.

**Type:** ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)

**Read/Write Permission:** Readable and Writable

**Initial Version:** 19

#### var start

```cangjie
public var start:?LocalizedHorizontalAlignParam = None
```

**Function:** Sets the horizontal alignment parameter, which is left-aligned in LTR mode and right-aligned in RTL mode.

**Type:** ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)

**Read/Write Permission:** Readable and Writable

**Initial Version:** 19

#### var top

```cangjie
public var top:?LocalizedVerticalAlignParam = None
```

**Function:** Sets the vertical top alignment parameter.

**Type:** ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)

**Read/Write Permission:** Readable and Writable

**Initial Version:** 19

#### LocalizedAlignRuleOptions(?LocalizedHorizontalAlignParam, ?LocalizedHorizontalAlignParam, ?LocalizedHorizontalAlignParam, ?LocalizedVerticalAlignParam, ?LocalizedVerticalAlignParam, ?LocalizedVerticalAlignParam, ?Bias)

```cangjie
public LocalizedAlignRuleOptions (
    public var start!: ?LocalizedHorizontalAlignParam = None,
    public var end!: ?LocalizedHorizontalAlignParam = None,
    public var middle!: ?LocalizedHorizontalAlignParam = None,
    public var top!: ?LocalizedVerticalAlignParam = None,
    public var bottom!: ?LocalizedVerticalAlignParam = None,
    public var center!: ?LocalizedVerticalAlignParam = None,
    public var bias!: ?Bias = None
)
```

**Function:** Creates a `LocalizedAlignRuleOptions` object.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| start | ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam) | No | None | **Named parameter.** The horizontal alignment parameter, which is left-aligned in LTR mode and right-aligned in RTL mode. |
| end | ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam) | No | None | **Named parameter.** The horizontal alignment parameter, which is right-aligned in LTR mode and left-aligned in RTL mode. |
| middle | ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam) | No | None | **Named parameter.** The horizontal center alignment parameter. |
| top | ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam) | No | None | **Named parameter.** The vertical top alignment parameter. |
| bottom | ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam) | No | None | **Named parameter.** The vertical bottom alignment parameter. |
| center | ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam) | No | None | **Named parameter.** The vertical center alignment parameter. |
| bias | ?[Bias](#class-bias) | No | None | **Named parameter.** The offset parameter of the component under anchor constraints, which is the ratio of the distance to the left/top anchor to the total distance between anchors. |

### class LocalizedHorizontalAlignParam

```cangjie
public class LocalizedHorizontalAlignParam {
    public LocalizedHorizontalAlignParam (
        public var anchor!: String,
        public var align!: HorizontalAlign
    )
}
```

**Function:** Sets the horizontal alignment parameters.

**Initial Version:** 19

#### var align

```cangjie
public var align: HorizontalAlign
```

**Function:** Sets the horizontal alignment relative to the anchor component.

**Type:** [HorizontalAlign](./cj-common-types.md#enum-horizontalalign)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var anchor

```cangjie
public var anchor: String
```

**Function:** Sets the ID value of the component serving as the anchor.

**Type:** String

**Read-Write Capability:** Read-Write

**Initial Version:** 19

### class LocalizedVerticalAlignParam

```cangjie
public class LocalizedVerticalAlignParam {
    public LocalizedVerticalAlignParam (
        public var anchor!: String,
        public var align!: VerticalAlign
    )
}
```

**Function:** Parameters for setting vertical alignment.

**Initial Version:** 19

#### var align

```cangjie
public var align: VerticalAlign
```

**Function:** Sets the vertical alignment relative to the anchor component.

**Type:** [VerticalAlign](./cj-common-types.md#enum-verticalalign)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var anchor

```cangjie
public var anchor: String
```

**Function:** Sets the ID value of the component serving as the anchor.

**Type:** String

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### LocalizedVerticalAlignParam(String, VerticalAlign)

```cangjie
public LocalizedVerticalAlignParam (
    public var anchor!: String,
    public var align!: VerticalAlign
)
```

**Function:** Creates an object of type LocalizedVerticalAlignParam.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|anchor|String|Yes|-| **Named parameter.** The ID value of the component serving as the anchor.|
|align|[VerticalAlign](./cj-common-types.md#enum-verticalalign)|Yes|-| **Named parameter.** The vertical alignment relative to the anchor component.|

### class VerticalAnchor

```cangjie
public class VerticalAnchor {
    public VerticalAnchor (
        public var anchor: String,
        public var align: VerticalAlign
    )
}
```

**Function:** Parameters for setting vertical alignment.

**Initial Version:** 12

#### var align

```cangjie
public var align: VerticalAlign
```

**Function:** Sets the alignment relative to the anchor component.

**Type:** [VerticalAlign](./cj-common-types.md#enum-verticalalign)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var anchor

```cangjie
public var anchor: String
```

**Function:** Sets the ID value of the component serving as the anchor.

**Type:** String

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### VerticalAnchor(String, VerticalAlign)

```cangjie
public VerticalAnchor (
    public var anchor: String,
    public var align: VerticalAlign
)
```

**Function:** Creates an object of type VerticalAnchor.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|anchor|String|Yes|-|The ID value of the component serving as the anchor.|
|align|[VerticalAlign](./cj-common-types.md#enum-verticalalign)|Yes|-|The alignment relative to the anchor component.|

### enum ChainStyle

```cangjie
public enum ChainStyle {
    | SPREAD
    | SPREAD_INSIDE
    | PACKED
}
```

**Function:** Defines the style of a chain.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

#### PACKED

```cangjie
PACKED
```

**Function:** No gaps between child components within the chain.

**Initial Version:** 12

#### SPREAD

```cangjie
SPREAD
```

**Function:** Components are evenly distributed between constraint anchors.

**Initial Version:** 12

#### SPREAD_INSIDE

```cangjie
SPREAD_INSIDE
```

**Function:** All child components except the first and last are evenly distributed between constraint anchors.

**Initial Version:** 12