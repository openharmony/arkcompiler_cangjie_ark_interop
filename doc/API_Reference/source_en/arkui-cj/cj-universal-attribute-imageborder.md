# Image Border Settings

Configure the image border style for components.

## func borderImage(BorderImageOption)

```cangjie
public func borderImage(value: BorderImageOption): This
```

**Function:** Sets the image border for a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [BorderImageOption](#class-borderimageoption) | Yes | - | Interface for image border or gradient border configuration. |

## Basic Type Definitions

### interface BorderImageOptionSourceType

```cangjie
sealed interface BorderImageOptionSourceType {}
```

**Function:** Union type interface that accepts String, [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource), or [LinearGradientOption](#class-lineargradientoption) types.

**Since:** 19

### interface LengthEdgeWidthsType

```cangjie
sealed interface LengthEdgeWidthsType {}
```

**Function:** Union type interface that accepts [LengthType](./cj-common-types.md#enum-lengthtype) or [EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths) types.

**Since:** 19

### class BorderImageOption

```cangjie
public class BorderImageOption {
    public BorderImageOption (
        public let source!: BorderImageOptionSourceType,
        public let slice!: LengthEdgeWidthsType = LengthType.vp(0.0),
        public let width!: LengthEdgeWidthsType = LengthType.vp(0.0),
        public let outset!: LengthEdgeWidthsType = LengthType.vp(0.0),
        public let repeat!: RepeatMode = RepeatMode.STRETCH,
        public let fill!: Bool = false
    )
}
```

**Function:** Configuration for image border or gradient border.

**Since:** 19

#### let source

```cangjie
public let source: BorderImageOptionSourceType
```

**Function:** Sets the border image source or gradient. When the parameter type is string, it is used to set the border image source.

**Type:** [BorderImageOptionSourceType](#interface-borderimageoptionsourcetype)

**Access:** Read-only

**Since:** 19

#### let slice

```cangjie
public let slice: LengthEdgeWidthsType = LengthType.vp(0.0)
```

**Function:** Sets the cutting width of the border image.

**Type:** [LengthEdgeWidthsType](#interface-lengthedgewidthstype)

**Access:** Read-only

**Since:** 19

#### let width

```cangjie
public let width: LengthEdgeWidthsType = LengthType.vp(0.0)
```

**Function:** Sets the width of the image border.

**Type:** [LengthEdgeWidthsType](#interface-lengthedgewidthstype)

**Access:** Read-only

**Since:** 19

#### let outset

```cangjie
public let outset: LengthEdgeWidthsType = LengthType.vp(0.0)
```

**Function:** Sets the outward extension distance of the border image.

**Type:** [LengthEdgeWidthsType](#interface-lengthedgewidthstype)

**Access:** Read-only

**Since:** 19

#### let repeat

```cangjie
public let repeat: RepeatMode = RepeatMode.STRETCH
```

**Function:** Sets the repetition mode of the cut image on the border.

**Type:** [RepeatMode](#enum-repeatmode)

**Access:** Read-only

**Since:** 19

#### let fill

```cangjie
public let fill: Bool = false
```

**Function:** Sets whether the border image is center-filled.

**Type:** Bool

**Access:** Read-only

**Since:** 19

#### BorderImageOption(BorderImageOptionSourceType, LengthEdgeWidthsType, LengthEdgeWidthsType, LengthEdgeWidthsType, RepeatMode, Bool)

```cangjie
public BorderImageOption (
    public let source!: BorderImageOptionSourceType,
    public let slice!: LengthEdgeWidthsType = LengthType.vp(0.0),
    public let width!: LengthEdgeWidthsType = LengthType.vp(0.0),
    public let outset!: LengthEdgeWidthsType = LengthType.vp(0.0),
    public let repeat!: RepeatMode = RepeatMode.STRETCH,
    public let fill!: Bool = false
)
```

**Function:** Constructs an object for image border configuration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| source | [BorderImageOptionSourceType](#interface-borderimageoptionsourcetype) | Yes | **Named parameter.** - | Sets the border image source or gradient. When the parameter type is string, it is used to set the border image source.<br/>**Note:**<br/>Border image source is only applicable to container components such as [Row](./cj-row-column-stack-row.md) and [Column](./cj-row-column-stack-column.md), and will be invalid for non-container components. |
| slice | [LengthEdgeWidthsType](#interface-lengthedgewidthstype) | No | LengthType.vp(0.0) | Sets the cutting width for the top-left, top-right, bottom-left, and bottom-right corners of the border image.<br/>**Note:**<br/>Negative values will default to the preset value.<br/>When the parameter type is [Length](./cj-common-types.md#interface-length), it uniformly sets the width and height for all four corners.<br/>When the parameter type is [EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths):<br/>- Top: Sets the height of the cut for the top-left or top-right corner.<br/>- Bottom: Sets the height of the cut for the bottom-left or bottom-right corner.<br/>- Left: Sets the width of the cut for the top-left or bottom-left corner.<br/>- Right: Sets the width of the cut for the top-right or bottom-right corner. |
| width | [LengthEdgeWidthsType](#interface-lengthedgewidthstype) | No | LengthType.vp(0.0) | Sets the width of the image border.<br/>**Note:**<br/>When the parameter type is [Length](./cj-common-types.md#interface-length), it uniformly sets the width and height for all four corners. Negative values will default to the preset value.<br/>When the parameter type is [EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths):<br/>- Top: Sets the width of the top border.<br/>- Bottom: Sets the width of the bottom border.<br/>- Left: Sets the width of the left border.<br/>- Right: Sets the width of the right border. |
| outset | [LengthEdgeWidthsType](#interface-lengthedgewidthstype) | No | LengthType.vp(0.0) | Sets the outward extension distance of the border image.<br/>**Note:**<br/>Negative values will default to the preset value.<br/>When the parameter type is [Length](./cj-common-types.md#interface-length), it uniformly sets the width and height for all four corners.<br/>When the parameter type is [EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths):<br/>- Top: Sets the outward extension distance of the top border.<br/>- Bottom: Sets the outward extension distance of the bottom border.<br/>- Left: Sets the outward extension distance of the left border.<br/>- Right: Sets the outward extension distance of the right border. |
| repeat | [RepeatMode](#enum-repeatmode) | No | RepeatMode.STRETCH | Sets the repetition mode of the cut image on the border. |
| fill | Bool | No | false | Sets whether the border image is center-filled. |

### class LinearGradientOption

```cangjie
public class LinearGradientOption {
    public LinearGradientOption (
        public let angle!: Float64 = 180.0,
        public let direction!: GradientDirection = GradientDirection.Bottom,
        public let colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        public let repeating!: Bool = false
    )
}
```

**Function:** Linear gradient configuration.

**Since:** 19

#### let angle

```cangjie
public let angle: Option<Float64> = 180.0
```

**Function:** The starting angle of the linear gradient.

**Type:** Option\<Float64>

**Access:** Read-only

**Since:** 19

#### let direction

```cangjie
public let direction: GradientDirection = GradientDirection.Bottom
```

**Function:** The direction of the linear gradient.

**Type:** [GradientDirection](./cj-common-types.md#enum-gradientdirection)

**Access:** Read-only

**Since:** 19

#### let colors

```cangjie
public let colors: Array <(Color, Float64)>=[(Color.TRANSPARENT, 0.0)]
```

**Function:** Specifies the gradient color at a certain percentage position. Invalid colors will be skipped.

**Type:** Array\<([Color](./cj-common-types.md#color), Float64)>

**Access:** Read-only

**Since:** 19

#### let repeating

```cangjie
public let repeating: Bool = false
```

**Function:** Whether to repeat the gradient colors.

**Type:** Bool

**Access:** Read-only

**Since:** 19

#### LinearGradientOption(Float64, GradientDirection, Array\<(Color, Float64)>, Bool)

```cangjie
public LinearGradientOption (
    public let angle!: Float64 = 180.0,
    public let direction!: GradientDirection = GradientDirection.Bottom,
    public let colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    public let repeating!: Bool = false
)
```

**Function:** Constructs a linear gradient configuration object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| angle | Float64 | No | 180.0 | **Named parameter.** The starting angle of the linear gradient. Positive angles are measured clockwise from the 0-degree direction. |
| direction | [GradientDirection](./cj-common-types.md#enum-gradientdirection) | No | GradientDirection.Bottom | **Named parameter.** The direction of the linear gradient. This parameter becomes invalid when angle is set. |
| colors | Array\<([Color](./cj-common-types.md#color), Float64)> | No | [(Color.TRANSPARENT, 0.0)] | **Named parameter.** Specifies the gradient color at a certain percentage position. Invalid colors will be skipped. |
| repeating | Bool | No | false | **Named parameter.** Repeats the gradient colors. |

### enum RepeatMode

```cangjie
public enum RepeatMode {
    | SPACE
    | STRETCH
    | REPEAT
    | ROUND
}
```

**Function:** Sets the repetition mode of the cut image on the border.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### SPACE

```cangjie
SPACE
```

**Function:** The cut image is tiled an integer number of times on the border. If it cannot be tiled an integer number of times, the remaining space is filled with blank.**Initial Version:** 19  

#### STRETCH  

```cangjie  
STRETCH  
```  

**Function:** The sliced image is stretched to fill the entire image border.  

**Initial Version:** 19  

#### REPEAT  

```cangjie  
REPEAT  
```  

**Function:** The sliced image is tiled repeatedly across the image border, with any excess portions being clipped.  

**Initial Version:** 19  

#### ROUND  

```cangjie  
ROUND  
```  

**Function:** The sliced image is tiled an integer number of times along the image border. If an integer tiling is not possible, the sliced image is compressed.  

**Initial Version:** 19