# Basic Type Definitions

## Import Module

```cangjie
import kit.ArkUI.*
```

## const MAX_ALPHA_VALUE

```cangjie
public const MAX_ALPHA_VALUE: Float32 = 1.0
```

**Function:** Maximum alpha value.

**Type:** Float32

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## const MAX_CHANNEL_VALUE

```cangjie
public const MAX_CHANNEL_VALUE: UInt8 = 0xff
```

**Function:** Maximum channel value.

**Type:** UInt8

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## class AnimateParam

```cangjie
public class AnimateParam {
    public var duration: Int32
    public var tempo: Float32
    public var curve: Curve
    public var delay: Int32
    public var iterations: Int32
    public var playMode: PlayMode
    public var onFinish: Option <() -> Unit>
    public var finishCallbackType: FinishCallbackType
    public var expectedFrameRateRange: Option<ExpectedFrameRateRange>
    public init(
        duration!: Int32 = 1000,
        tempo!: Float32 = 1.0,
        curve!: Curve = Curve.EaseInOut,
        delay!: Int32 = 0,
        iterations!: Int32 = 1,
        playMode!: PlayMode = PlayMode.Normal,
        onFinish!: Option<() -> Unit> = Option.None,
        finishCallbackType!: FinishCallbackType = FinishCallbackType.Removed,
        expectedFrameRateRange!: Option<ExpectedFrameRateRange> = Option.None
    )
}
```

**Function:** Sets animation effect parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var curve

```cangjie
public var curve: Curve
```

**Function:** Animation curve.

**Type:** [Curve]

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var delay

```cangjie
public var delay: Int32
```

**Function:** Animation delay time in milliseconds (ms). Default is no delay.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var duration

```cangjie
public var duration: Int32
```

**Function:** Animation duration in milliseconds. Values less than 0 are treated as 0.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var expectedFrameRateRange

```cangjie
public var expectedFrameRateRange: Option<ExpectedFrameRateRange>
```

**Function:** Sets the expected frame rate for animation.

**Type:** [Option](cj-common-types.md#initoptionint-optionfloat-optioncurve-optionint-optionint-optionplaymode-option---unit-optionfinishcallbacktype-optionexpectedframeraterange)\<[ExpectedFrameRateRange](#class-expectedframeraterange)>

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var finishCallbackType

```cangjie
public var finishCallbackType: FinishCallbackType
```

**Function:** Defines the type of onFinish callback in animation.

**Type:** [FinishCallbackType]

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var iterations

```cangjie
public var iterations: Int32
```

**Function:** Number of animation iterations. Default is 1. -1 means infinite iterations. 0 means no animation effect.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var onFinish

```cangjie
public var onFinish: Option <() -> Unit>
```

**Function:** Animation completion callback.

**Type:** [Option](cj-common-types.md#initoptionint-optionfloat-optioncurve-optionint-optionint-optionplaymode-option---unit-optionfinishcallbacktype-optionexpectedframeraterange)\<()->Unit>

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var playMode

```cangjie
public var playMode: PlayMode
```

**Function:** Animation play mode. Default is restart from beginning after completion.

**Type:** [PlayMode]

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var tempo

```cangjie
public var tempo: Float32
```

**Function:** Animation playback speed. Higher values mean faster playback. 0 means no animation effect.

**Type:** Float32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Int32, Float32, Curve, Int32, Int32, PlayMode, Option\<() -> Unit>, FinishCallbackType, Option\<ExpectedFrameRateRange>)

```cangjie
public init(
    duration!: Int32 = 1000,
    tempo!: Float32 = 1.0,
    curve!: Curve = Curve.EaseInOut,
    delay!: Int32 = 0,
    iterations!: Int32 = 1,
    playMode!: PlayMode = PlayMode.Normal,
    onFinish!: Option<() -> Unit> = Option.None,
    finishCallbackType!: FinishCallbackType = FinishCallbackType.Removed,
    expectedFrameRateRange!: Option<ExpectedFrameRateRange> = Option.None
)
```

**Function:** Constructs an AnimateParam object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|duration|Int32|No|1000|Animation duration in milliseconds. Values less than 0 are treated as 0.|
|tempo|Float32|No|1.0|Animation playback speed. Higher values mean faster playback. 0 means no animation effect.|
|curve|[Curve]|No|Curve.EaseInOut|Animation curve.|
|delay|Int32|No|0|Animation delay time in milliseconds (ms). Default is no delay.|
|iterations|Int32|No|1|Number of animation iterations. Default is 1. -1 means infinite iterations. 0 means no animation effect.|
|playMode|[PlayMode]|No|PlayMode.Normal|Animation play mode. Default is restart from beginning after completion.|
|onFinish|[Option](cj-common-types.md#initoptionint-optionfloat-optioncurve-optionint-optionint-optionplaymode-option---unit-optionfinishcallbacktype-optionexpectedframeraterange)\<()->Unit>|No|Option.None|Animation completion callback.|
|finishCallbackType|[FinishCallbackType]|No|FinishCallbackType.Removed|Defines the type of onFinish callback in animation.|
|expectedFrameRateRange|[Option](cj-common-types.md#initoptionint-optionfloat-optioncurve-optionint-optionint-optionplaymode-option---unit-optionfinishcallbacktype-optionexpectedframeraterange)\<[ExpectedFrameRateRange](#class-expectedframeraterange)>|No|Option.None|Sets the expected frame rate for animation.|

## class Area

```cangjie
public class Area {
    public var width: Length
    public var height: Length
    public var position: Position
    public var globalPosition: Position
    public init(
        width: Length,
        height: Length,
        position: Position,
        globalPosition: Position
    )
}
```

**Function:** Current target area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var globalPosition

```cangjie
public var globalPosition: Position
```

**Function:** Defines the position relationship between the top-left corner of the target element and the top-left corner of the screen.

**Type:** [Position](#class-position)

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var height

```cangjie
public var height: Length
```

**Function:** Defines the height of the target element.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var position

```cangjie
public var position: Position
```

**Function:** Defines the relative position between the top-left corner of the target element and the top-left corner of its parent element.

**Type:** [Position](#class-position)

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var width

```cangjie
public var width: Length
```

**Function:** Defines the width of the target element.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, Length, Position, Position)

```cangjie
public init(
    width: Length,
    height: Length,
    position: Position,
    globalPosition: Position
)
```

**Function:** Constructs an Area type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|width|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)|Yes|-|Width of the target element in vp.|
|height|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)|Yes|-|Height of the target element in vp.|
|position|[Position](#class-position)|Yes|-|Position of the target element's top-left corner relative to its parent element's top-left corner.|
|globalPosition|[Position](#class-position)|Yes|-|Position of the target element's top-left corner relative to the page's top-left corner.|

## class BorderRadiuses

```cangjie
public class BorderRadiuses {
    public var topLeft: Length
    public var topRight: Length
    public var bottomLeft: Length
    public var bottomRight: Length
    public init(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp)
}
```

**Function:** Border radius type, used to describe the corner radius of component borders.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var bottomLeft

```cangjie
public var bottomLeft: Length
```

**Function:** Bottom-left corner radius of the component.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var bottomRight

```cangjie
public var bottomRight: Length
```

**Function:** Bottom-right corner radius of the component.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var topLeft

```cangjie
public var topLeft: Length
```

**Function:** Top-left corner radius of the component.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var topRight

```cangjie
public var topRight: Length
```

**Function:** Top-right corner radius of the component.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, Length, Length, Length)

```cangjie
public init(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
    bottomRight!: Length = 0.vp)
```

**Function:** Initializes a BorderRadiuses object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|topLeft|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)|No|0.vp|Top-left corner radius of the component.|
|topRight|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)|No|0.vp|Top-right corner radius of the component.|
|bottomLeft|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)|No|0.vp|Bottom-left corner radius of the component.|
|bottomRight|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)|No|0.vp|Bottom-right corner radius of the component.|## class DismissContentCoverAction

```cangjie
public class DismissContentCoverAction {
    public let reason: DismissReason
}
```

**Function:** Core callback class for handling full-screen modal page dismissal logic, responsible for intercepting dismissal behavior when triggered by user actions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### let reason

```cangjie
public let reason: DismissReason
```

**Function:** Type of dismissal reason.

**Type:** [DismissReason](#enum-dismissreason)

**Access:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func dismiss()

```cangjie
public func dismiss(): Unit
```

**Function:** Explicitly triggers modal page dismissal, serving as the sole entry point for controlling dismissal.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## class EdgeStyles

```cangjie
public class EdgeStyles {
    public var top: BorderStyle
    public var right: BorderStyle
    public var bottom: BorderStyle
    public var left: BorderStyle
    public init(
        top!: BorderStyle = BorderStyle.Solid,
        right!: BorderStyle = BorderStyle.Solid,
        bottom!: BorderStyle = BorderStyle.Solid,
        left!: BorderStyle = BorderStyle.Solid
    )
}
```

**Function:** Border styles, used to describe the styling of a component's four edges.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var bottom

```cangjie
public var bottom: BorderStyle
```

**Function:** Sets the bottom border style of a component.

**Type:** [BorderStyle]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var left

```cangjie
public var left: BorderStyle
```

**Function:** Sets the left border style of a component.

**Type:** [BorderStyle]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var right

```cangjie
public var right: BorderStyle
```

**Function:** Sets the right border style of a component.

**Type:** [BorderStyle]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var top

```cangjie
public var top: BorderStyle
```

**Function:** Sets the top border style of a component.

**Type:** [BorderStyle]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(BorderStyle, BorderStyle, BorderStyle, BorderStyle)

```cangjie
public init(
    top!: BorderStyle = BorderStyle.Solid,
    right!: BorderStyle = BorderStyle.Solid,
    bottom!: BorderStyle = BorderStyle.Solid,
    left!: BorderStyle = BorderStyle.Solid
)
```

**Function:** Constructs an EdgeStyles object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [BorderStyle] | No | BorderStyle.Solid | Top border style of the component. |
| right | [BorderStyle] | No | BorderStyle.Solid | Right border style of the component. |
| bottom | [BorderStyle] | No | BorderStyle.Solid | Bottom border style of the component. |
| left | [BorderStyle] | No | BorderStyle.Solid | Left border style of the component. |

## class Font

```cangjie
public class Font {
    public var size:?Length
    public var weight:?FontWeight
    public var family:?ResourceStr
    public var style:?FontStyle
    public init(size!: ?Length = None, weight!: ?FontWeight = None, family!: ?ResourceStr = None, style!: ?FontStyle = None)
}
```

**Function:** Font styling.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var family

```cangjie
public var family:?ResourceStr
```

**Function:** Sets the font list for text.

**Type:** ?[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var size

```cangjie
public var size:?Length
```

**Function:** Sets text size in fp units.

**Type:** ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var style

```cangjie
public var style:?FontStyle
```

**Function:** Sets the font style for text.

**Type:** ?[FontStyle]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var weight

```cangjie
public var weight:?FontWeight
```

**Function:** Sets the font weight for text.

**Type:** ?[FontWeight]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(?Length, ?FontWeight, ?ResourceStr, ?FontStyle)

```cangjie
public init(size!: ?Length = None, weight!: ?FontWeight = None, family!: ?ResourceStr = None, style!: ?FontStyle = None)
```

**Function:** Constructs a Font object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| size | ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | None | Sets text size in fp units when Length is Int64 or Float64. Percentage values are not supported. |
| weight | ?[FontWeight] | No | None | Sets the font weight for text. |
| family | ?[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | None | Sets the font list for text. Multiple fonts can be specified, separated by commas, with priority given in order. Example: 'Arial, HarmonyOS Sans'. Currently supports 'HarmonyOS Sans' font. |
| style | ?[FontStyle] | No | None | Sets the font style for text. |

## class Fonts

```cangjie
public class Fonts {
    public var size: Length
    public var weight: FontWeight
    public var family: String
    public var style: FontStyle
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: ResourceStr = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal)
}
```

**Function:** Text styling.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var family

```cangjie
public var family: String
```

**Function:** Sets the font list for text.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var size

```cangjie
public var size: Length
```

**Function:** Sets text size in fp units.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var style

```cangjie
public var style: FontStyle
```

**Function:** Sets the font style for text.

**Type:** [FontStyle]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var weight

```cangjie
public var weight: FontWeight
```

**Function:** Sets the font weight for text.

**Type:** [FontWeight]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, FontWeight, ResourceStr, FontStyle)

```cangjie
public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: ResourceStr = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal)
```

**Function:** Constructs a Fonts object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| size | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 16.fp | Sets text size in fp units when Length is Int64 or Float64. Percentage values are not supported. |
| weight | [FontWeight] | No | FontWeight.Normal | Sets the font weight for text. |
| family | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | "HarmonyOS Sans" | Sets the font list for text. Multiple fonts can be specified, separated by commas, with priority given in order. Example: 'Arial, HarmonyOS Sans'. Currently supports 'HarmonyOS Sans' font. |
| style | [FontStyle] | No | FontStyle.Normal | Sets the font style for text. |

## class HorizontalAlignment

```cangjie
public class HorizontalAlignment {
    public var anchor: String
    public var align: HorizontalAlign
    public init(anchor: String, align: HorizontalAlign)
}
```

**Function:** Horizontal alignment settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var align

```cangjie
public var align: HorizontalAlign
```

**Function:** Sets the horizontal alignment of a component.

**Type:** [HorizontalAlign]

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var anchor

```cangjie
public var anchor: String
```

**Function:** Sets the anchor point for horizontal alignment of a component.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(String, HorizontalAlign)

```cangjie
public init(anchor: String, align: HorizontalAlign)
```

**Function:** Constructs a HorizontalAlignment object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| anchor | String | Yes | - | Sets the anchor point for horizontal alignment of a component. |
| align | [HorizontalAlign] | Yes | - | Sets the horizontal alignment of a component. |## class Margin

```cangjie
public class Margin {
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
}
```

**Function:** Margin type, used to describe the margins of a component in different directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, Length, Length, Length)

```cangjie
public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
```

**Function:** Initializes a margin-type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Top margin, the distance from the top of the component to external elements. |
| right | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Right margin, the distance from the right boundary of the component to external elements. |
| bottom | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Bottom margin, the distance from the bottom of the component to external elements. |
| left | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Left margin, the distance from the left boundary of the component to external elements. |

## class Offset

```cangjie
public class Offset {
    public var dx: Length
    public var dy: Length
    public init(dx: Length, dy: Length)
}
```

**Function:** Relative layout coordinate offset for positioning.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var dx

```cangjie
public var dx: Length
```

**Function:** Horizontal offset.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var dy

```cangjie
public var dy: Length
```

**Function:** Vertical offset.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, Length)

```cangjie
public init(dx: Length, dy: Length)
```

**Function:** Constructs an Offset-type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| dx | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | Yes | - | X-coordinate. |
| dy | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | Yes | - | Y-coordinate. |

## class OverlayOffset

```cangjie
public class OverlayOffset {
    public var x: Float64
    public var y: Float64
    public init(x!: Float64 = 0.0, y!: Float64 = 0.0)
}
```

**Function:** Sets the offset for overlays.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var x

```cangjie
public var x: Float64
```

**Function:** Horizontal offset.

**Type:** Float64

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var y

```cangjie
public var y: Float64
```

**Function:** Vertical offset.

**Type:** Float64

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Float64, Float64)

```cangjie
public init(x!: Float64 = 0.0, y!: Float64 = 0.0)
```

**Function:** Constructs an overlay offset.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float64 | No | 0.0 | Horizontal offset. |
| y | Float64 | No | 0.0 | Vertical offset. |

## class PopupButton

```cangjie
public class PopupButton {
    public init(value!: String, action!: () -> Unit)
}
```

**Function:** Constructs a popup button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(String, () -> Unit)

```cangjie
public init(value!: String, action!: () -> Unit)
```

**Function:** Constructs a popup button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | The text content of the button. |
| action | () -> Unit | Yes | - | The click event of the button. |

## class PopupStateChangeParam

```cangjie
public class PopupStateChangeParam {
    public var isVisible: Bool
    public init(value: Bool)
}
```

**Function:** Sets popup state parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var isVisible

```cangjie
public var isVisible: Bool
```

**Function:** Whether the popup is visible.

**Type:** Bool

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Bool)

```cangjie
public init(value: Bool)
```

**Function:** Sets popup state parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether the popup is visible. |

## class Position

```cangjie
public class Position {
    public var x: Length
    public var y: Length
    public init(x!: Length = 0, y!: Length = 0)
}
```

**Function:** Position information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var x

```cangjie
public var x: Length
```

**Function:** Defines the X-coordinate.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var y

```cangjie
public var y: Length
```

**Function:** Defines the Y-coordinate.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, Length)

```cangjie
public init(x!: Length = 0, y!: Length = 0)
```

**Function:** Constructs a Position-type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0 | X-coordinate, in vp units. |
| y | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0 | Y-coordinate, in vp units. |

## class Rectangle

```cangjie
public class Rectangle {
    public var x: Length
    public var y: Length
    public var width: Length
    public var height: Length
    public init(x!: Length = 0.vp, y!: Length = 0.vp, width!: Length = 100.percent, height!: Length = 100.percent)
}
```

**Function:** Defines the region position type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var height

```cangjie
public var height: Length
```

**Function:** Height of the touch hotspot.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var width

```cangjie
public var width: Length
```

**Function:** Width of the touch hotspot.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var x

```cangjie
public var x: Length
```

**Function:** X-coordinate of the touch point relative to the top-left corner of the component.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var y

```cangjie
public var y: Length
```

**Function:** Y-coordinate of the touch point relative to the top-left corner of the component.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, Length, Length, Length)

```cangjie
public init(x!: Length = 0.vp, y!: Length = 0.vp, width!: Length = 100.percent, height!: Length = 100.percent)
```

**Function:** Constructs a Rectangle-type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** X-coordinate of the touch point relative to the top-left corner of the component. |
| y | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Y-coordinate of the touch point relative to the top-left corner of the component. |
| width | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 100.percent | **Named parameter.** Width of the touch hotspot. |
| height | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 100.percent | **Named parameter.** Height of the touch hotspot. |## class VerticalAlignment

```cangjie
public class VerticalAlignment {
    public var anchor: String
    public var align: VerticalAlign
    public init(anchor: String, align: VerticalAlign)
}
```

**Function:** Vertical alignment method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var align

```cangjie
public var align: VerticalAlign
```

**Function:** Sets the vertical alignment method of the component.

**Type:** [VerticalAlign]

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var anchor

```cangjie
public var anchor: String
```

**Function:** Sets the anchor point for vertical alignment of the component.

**Type:** String

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(String, VerticalAlign)

```cangjie
public init(anchor: String, align: VerticalAlign)
```

**Function:** Constructs a VerticalAlignment object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| anchor | String | Yes | - | Sets the anchor point for vertical alignment of the component. |
| align | [VerticalAlign] | Yes | - | Sets the vertical alignment method of the component. |

## enum AdaptiveColor

```cangjie
public enum AdaptiveColor <: Equatable<AdaptiveColor> {
    | Default
    | Average
    | ...
}
```

**Function:** Color sampling mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<AdaptiveColor\>

### Average

```cangjie
Average
```

**Function:** Uses color sampling blur. Takes the average color of the sampling area as the mask color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Default

```cangjie
Default
```

**Function:** Does not use color sampling blur. Uses the default color as the mask color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(AdaptiveColor)

```cangjie
public operator func !=(other: AdaptiveColor): Bool
```

**Function:** Compares whether two AdaptiveColor values are not equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AdaptiveColor](#enum-adaptivecolor) | Yes | - | Another AdaptiveColor value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two AdaptiveColor values are not equal, otherwise returns false |

### func ==(AdaptiveColor)

```cangjie
public operator func ==(other: AdaptiveColor): Bool
```

**Function:** Compares whether two AdaptiveColor values are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AdaptiveColor](#enum-adaptivecolor) | Yes | - | Another AdaptiveColor value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two AdaptiveColor values are equal, otherwise returns false |

## enum Alignment

```cangjie
public enum Alignment <: Equatable<Alignment> {
    | TopStart
    | Top
    | TopEnd
    | Start
    | Center
    | End
    | BottomStart
    | Bottom
    | BottomEnd
    | ...
}
```

**Function:** Alignment method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<Alignment\>

### Bottom

```cangjie
Bottom
```

**Function:** Bottom horizontal center.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BottomEnd

```cangjie
BottomEnd
```

**Function:** Bottom end.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BottomStart

```cangjie
BottomStart
```

**Function:** Bottom start.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Center

```cangjie
Center
```

**Function:** Horizontal and vertical center.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### End

```cangjie
End
```

**Function:** End.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Function:** Start.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Top

```cangjie
Top
```

**Function:** Top horizontal center.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TopEnd

```cangjie
TopEnd
```

**Function:** Top end.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TopStart

```cangjie
TopStart
```

**Function:** Top start.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(Alignment)

```cangjie
public operator func !=(other: Alignment): Bool
```

**Function:** Compares whether two Alignment values are not equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [Alignment](#enum-alignment) | Yes | - | Another Alignment value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two Alignment values are not equal, otherwise returns false |

### func ==(Alignment)

```cangjie
public operator func ==(other: Alignment): Bool
```

**Function:** Compares whether two Alignment values are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [Alignment](#enum-alignment) | Yes | - | Another Alignment value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two Alignment values are equal, otherwise returns false |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the integer value corresponding to the Alignment.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The integer value corresponding to the Alignment |

## enum AnimationStatus

```cangjie
public enum AnimationStatus <: Equatable<AnimationStatus> {
    | Initial
    | Running
    | Paused
    | Stopped
    | ...
}
```

**Function:** Animation playback status.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<AnimationStatus>

### Initial

```cangjie
Initial
```

**Function:** Initial state of the animation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Paused

```cangjie
Paused
```

**Function:** Animation is paused.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Running

```cangjie
Running
```

**Function:** Animation is playing.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Stopped

```cangjie
Stopped
```

**Function:** Animation is stopped.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(AnimationStatus)

```cangjie
public operator func !=(other: AnimationStatus): Bool
```

**Function:** Compares whether two AnimationStatus values are not equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AnimationStatus](#enum-animationstatus) | Yes | - | Another AnimationStatus value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two AnimationStatus values are not equal, otherwise returns false |

### func ==(AnimationStatus)

```cangjie
public operator func ==(other: AnimationStatus): Bool
```

**Function:** Compares whether two AnimationStatus values are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AnimationStatus](#enum-animationstatus) | Yes | - | Another AnimationStatus value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two AnimationStatus values are equal, otherwise returns false |## enum ArrowPointPosition

```cangjie
public enum ArrowPointPosition <: Equatable<ArrowPointPosition> {
    | START
    | CENTER
    | END
    | ...
}
```

**Function:** Arrow pointing position.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ArrowPointPosition>

### CENTER

```cangjie
CENTER
```

**Function:** Positioned at the center of the parent component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### END

```cangjie
END
```

**Function:** Horizontal direction: positioned at the far right of the parent component; Vertical direction: positioned at the bottom of the parent component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### START

```cangjie
START
```

**Function:** Horizontal direction: positioned at the far left of the parent component; Vertical direction: positioned at the top of the parent component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ArrowPointPosition)

```cangjie
public operator func !=(other: ArrowPointPosition): Bool
```

**Function:** Compares whether two ArrowPointPosition values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ArrowPointPosition](#enum-arrowpointposition) | Yes | - | Another ArrowPointPosition value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two ArrowPointPosition values are unequal, otherwise returns false |

### func ==(ArrowPointPosition)

```cangjie
public operator func ==(other: ArrowPointPosition): Bool
```

**Function:** Compares whether two ArrowPointPosition values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ArrowPointPosition](#enum-arrowpointposition) | Yes | - | Another ArrowPointPosition value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two ArrowPointPosition values are equal, otherwise returns false |

## enum Axis

```cangjie
public enum Axis <: Equatable<Axis> {
    | Vertical
    | Horizontal
    | ...
}
```

**Function:** Axis direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<Axis>

### Horizontal

```cangjie
Horizontal
```

**Function:** Horizontal direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Vertical

```cangjie
Vertical
```

**Function:** Vertical direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(Axis)

```cangjie
public operator func !=(other: Axis): Bool
```

**Function:** Compares whether two Axis values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Axis](#enum-axis) | Yes | - | Another Axis value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two Axis values are unequal, otherwise returns false |

### func ==(Axis)

```cangjie
public operator func ==(other: Axis): Bool
```

**Function:** Compares whether two Axis values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Axis](#enum-axis) | Yes | - | Another Axis value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two Axis values are equal, otherwise returns false |

## enum BarState

```cangjie
public enum BarState <: Equatable<BarState> {
    | Off
    | Auto
    | On
    | ...
}
```

**Function:** Scrollbar display mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<BarState>

### Auto

```cangjie
Auto
```

**Function:** Display on demand (appears when touched, disappears after 2 seconds).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Off

```cangjie
Off
```

**Function:** Not displayed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### On

```cangjie
On
```

**Function:** Permanently displayed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(BarState)

```cangjie
public operator func !=(other: BarState): Bool
```

**Function:** Compares whether two BarState values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BarState](#enum-barstate) | Yes | - | Another BarState value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two BarState values are unequal, otherwise returns false |

### func ==(BarState)

```cangjie
public operator func ==(other: BarState): Bool
```

**Function:** Compares whether two BarState values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BarState](#enum-barstate) | Yes | - | Another BarState value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two BarState values are equal, otherwise returns false |

## enum BarrierDirection

```cangjie
public enum BarrierDirection <: Equatable<BarrierDirection> {
    | LEFT
    | RIGHT
    | TOP
    | BOTTOM
    | ...
}
```

**Function:** Defines the direction of barrier lines.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<BarrierDirection>

### BOTTOM

```cangjie
BOTTOM
```

**Function:** The barrier is at the bottom of all its referencedId elements.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### LEFT

```cangjie
LEFT
```

**Function:** The barrier is at the far left of all its referencedId elements.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### RIGHT

```cangjie
RIGHT
```

**Function:** The barrier is at the far right of all its referencedId elements.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TOP

```cangjie
TOP
```

**Function:** The barrier is at the top of all its referencedId elements.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(BarrierDirection)

```cangjie
public operator func !=(other: BarrierDirection): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BarrierDirection](#enum-barrierdirection) | Yes | - | Another enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false |

### func ==(BarrierDirection)

```cangjie
public operator func ==(other: BarrierDirection): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BarrierDirection](#enum-barrierdirection) | Yes | - | Another enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false |

## enum BorderStyle

```cangjie
public enum BorderStyle <: Equatable<BorderStyle> {
    | Solid
    | Dashed
    | Dotted
    | ...
}
```

**Function:** Border style, used to describe the style of a component's four borders.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<BorderStyle>

### Dashed

```cangjie
Dashed
```

**Function:** Displayed as a series of short square dashes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Dotted

```cangjie
Dotted
```

**Function:** Displayed as a series of dots, with the dot radius being half of borderWidth.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Solid

```cangjie
Solid
```

**Function:** Displayed as a solid line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(BorderStyle)

```cangjie
public operator func !=(other: BorderStyle): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BorderStyle](#enum-borderstyle) | Yes | - | Another enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false |

### func ==(BorderStyle)

```cangjie
public operator func ==(other: BorderStyle): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BorderStyle](#enum-borderstyle) | Yes | - | Another enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the numerical value corresponding to the enum type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The numerical value corresponding to the enum type. |```markdown
## enum CanvasDirection

```cangjie
public enum CanvasDirection <: Equatable<CanvasDirection> {
    | inherit
    | ltr
    | rtl
    | ...
}
```

**Function:** Sets the text direction used when rendering text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<CanvasDirection>

### inherit

```cangjie
inherit
```

**Function:** Inherits the text direction set in the common properties of the canvas component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ltr

```cangjie
ltr
```

**Function:** Left to right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### rtl

```cangjie
rtl
```

**Function:** Right to left.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(CanvasDirection)

```cangjie
public operator func !=(other: CanvasDirection): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CanvasDirection](#enum-canvasdirection)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(CanvasDirection)

```cangjie
public operator func ==(other: CanvasDirection): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CanvasDirection](#enum-canvasdirection)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum CanvasFillRule

```cangjie
public enum CanvasFillRule <: Equatable<CanvasFillRule> {
    | evenodd
    | nonzero
    | ...
}
```

**Function:** Specifies the rule for filling objects.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<CanvasFillRule>

### evenodd

```cangjie
evenodd
```

**Function:** Even-odd rule.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### nonzero

```cangjie
nonzero
```

**Function:** Non-zero rule.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(CanvasFillRule)

```cangjie
public operator func !=(other: CanvasFillRule): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CanvasFillRule](#enum-canvasfillrule)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(CanvasFillRule)

```cangjie
public operator func ==(other: CanvasFillRule): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CanvasFillRule](#enum-canvasfillrule)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum CheckBoxShape

```cangjie
public enum CheckBoxShape <: Equatable<CheckBoxShape> {
    | CIRCLE
    | ROUNDED_SQUARE
    | ...
}
```

**Function:** Checkbox shape type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<CheckBoxShape>

### CIRCLE

```cangjie
CIRCLE
```

**Function:** Circular shape.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ROUNDED_SQUARE

```cangjie
ROUNDED_SQUARE
```

**Function:** Rounded square shape.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(CheckBoxShape)

```cangjie
public operator func !=(other: CheckBoxShape): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CheckBoxShape](#enum-checkboxshape)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(CheckBoxShape)

```cangjie
public operator func ==(other: CheckBoxShape): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CheckBoxShape](#enum-checkboxshape)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum ColoringStrategy

```cangjie
public enum ColoringStrategy <: Equatable<ColoringStrategy> {
    | INVERT
    | ...
}
```

**Function:** Smart color selection enum type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ColoringStrategy>

### INVERT

```cangjie
INVERT
```

**Function:** Sets the foreground color to the inverse of the control's background color. This enum can only be set in foregroundColor.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ColoringStrategy)

```cangjie
public operator func !=(other: ColoringStrategy): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ColoringStrategy](#enum-coloringstrategy)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(ColoringStrategy)

```cangjie
public operator func ==(other: ColoringStrategy): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ColoringStrategy](#enum-coloringstrategy)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func getValue()

```cangjie
public func getValue(): String
```

**Function:** Gets the value corresponding to the enum type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The value corresponding to the enum type.|

## enum CompositeOperation

```cangjie
public enum CompositeOperation <: Equatable<CompositeOperation> {
    | SourceOver
    | SourceAtop
    | SourceIn
    | SourceOut
    | DestinationOver
    | DestinationAtop
    | DestinationIn
    | DestinationOut
    | Lighter
    | Copy
    | Xor
    | ...
}
```

**Function:** Sets the method for composite operations.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<CompositeOperation>

### Copy

```cangjie
Copy
```

**Function:** Displays newly drawn content while ignoring existing content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### DestinationAtop

```cangjie
DestinationAtop
```

**Function:** Displays existing content on top of newly drawn content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### DestinationIn

```cangjie
DestinationIn
```

**Function:** Displays existing content within newly drawn content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### DestinationOut

```cangjie
DestinationOut
```

**Function:** Displays existing content outside newly drawn content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### DestinationOver

```cangjie
DestinationOver
```

**Function:** Displays existing content above newly drawn content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Lighter

```cangjie
Lighter
```

**Function:** Displays both newly drawn and existing content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SourceAtop

```cangjie
SourceAtop
```

**Function:** Displays newly drawn content on top of existing content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SourceIn

```cangjie
SourceIn
```

**Function:** Displays newly drawn content within existing content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SourceOut

```cangjie
SourceOut
```

**Function:** Displays newly drawn content outside existing content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SourceOver

```cangjie
SourceOver
```

**Function:** Displays newly drawn content over existing content (default value).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Xor

```cangjie
Xor
```

**Function:** Displays the XOR result of newly drawn and existing content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(CompositeOperation)

```cangjie
public operator func !=(other: CompositeOperation): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CompositeOperation](#enum-compositeoperation)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(CompositeOperation)

```cangjie
public operator func ==(other: CompositeOperation): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CompositeOperation](#enum-compositeoperation)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|
```## enum ContentType

```cangjie
public enum ContentType <: Equatable<ContentType> {
    | USER_NAME
    | PASSWORD
    | NEW_PASSWORD
    | FULL_STREET_ADDRESS
    | HOUSE_NUMBER
    | DISTRICT_ADDRESS
    | CITY_ADDRESS
    | PROVINCE_ADDRESS
    | COUNTRY_ADDRESS
    | PERSON_FULL_NAME
    | PERSON_LAST_NAME
    | PERSON_FIRST_NAME
    | PHONE_NUMBER
    | PHONE_COUNTRY_CODE
    | FULL_PHONE_NUMBER
    | EMAIL_ADDRESS
    | BANK_CARD_NUMBER
    | ID_CARD_NUMBER
    | NICKNAME
    | DETAIL_INFO_WITHOUT_STREET
    | FORMAT_ADDRESS
    | ...
}
```

**Function:** Auto-fill content types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ContentType>

### BANK_CARD_NUMBER

```cangjie
BANK_CARD_NUMBER
```

**Function:** [Bank card number] When contextual auto-fill is enabled, supports automatic saving and filling of bank card numbers.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### CITY_ADDRESS

```cangjie
CITY_ADDRESS
```

**Function:** [City] When contextual auto-fill is enabled, supports automatic saving and filling of city information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### COUNTRY_ADDRESS

```cangjie
COUNTRY_ADDRESS
```

**Function:** [Country] When contextual auto-fill is enabled, supports automatic saving and filling of country information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### DETAIL_INFO_WITHOUT_STREET

```cangjie
DETAIL_INFO_WITHOUT_STREET
```

**Function:** [Detailed address (excluding street)] When contextual auto-fill is enabled, supports automatic saving and filling of detailed addresses (excluding street information).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### DISTRICT_ADDRESS

```cangjie
DISTRICT_ADDRESS
```

**Function:** [District/County] When contextual auto-fill is enabled, supports automatic saving and filling of district/county information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### EMAIL_ADDRESS

```cangjie
EMAIL_ADDRESS
```

**Function:** [Email address] When contextual auto-fill is enabled, supports automatic saving and filling of email addresses.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FORMAT_ADDRESS

```cangjie
FORMAT_ADDRESS
```

**Function:** [Formatted address] When contextual auto-fill is enabled, supports automatic saving and filling of formatted addresses.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FULL_PHONE_NUMBER

```cangjie
FULL_PHONE_NUMBER
```

**Function:** [Complete phone number] When contextual auto-fill is enabled, supports automatic saving and filling of complete phone numbers.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FULL_STREET_ADDRESS

```cangjie
FULL_STREET_ADDRESS
```

**Function:** [Complete street address] When contextual auto-fill is enabled, supports automatic saving and filling of complete street addresses.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### HOUSE_NUMBER

```cangjie
HOUSE_NUMBER
```

**Function:** [House number] When contextual auto-fill is enabled, supports automatic saving and filling of house numbers.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ID_CARD_NUMBER

```cangjie
ID_CARD_NUMBER
```

**Function:** [ID card number] When contextual auto-fill is enabled, supports automatic saving and filling of ID card numbers.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### NEW_PASSWORD

```cangjie
NEW_PASSWORD
```

**Function:** [New password] When password vault is enabled, supports automatic generation of new passwords.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### NICKNAME

```cangjie
NICKNAME
```

**Function:** [Nickname] When contextual auto-fill is enabled, supports automatic saving and filling of nicknames.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PASSWORD

```cangjie
PASSWORD
```

**Function:** [Password] When password vault is enabled, supports automatic saving and filling of passwords.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PERSON_FIRST_NAME

```cangjie
PERSON_FIRST_NAME
```

**Function:** [First name] When contextual auto-fill is enabled, supports automatic saving and filling of first names.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PERSON_FULL_NAME

```cangjie
PERSON_FULL_NAME
```

**Function:** [Full name] When contextual auto-fill is enabled, supports automatic saving and filling of full names.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PERSON_LAST_NAME

```cangjie
PERSON_LAST_NAME
```

**Function:** [Last name] When contextual auto-fill is enabled, supports automatic saving and filling of last names.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PHONE_COUNTRY_CODE

```cangjie
PHONE_COUNTRY_CODE
```

**Function:** [Country code] When contextual auto-fill is enabled, supports automatic saving and filling of country codes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PHONE_NUMBER

```cangjie
PHONE_NUMBER
```

**Function:** [Phone number] When contextual auto-fill is enabled, supports automatic saving and filling of phone numbers.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PROVINCE_ADDRESS

```cangjie
PROVINCE_ADDRESS
```

**Function:** [Province] When contextual auto-fill is enabled, supports automatic saving and filling of province information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### USER_NAME

```cangjie
USER_NAME
```

**Function:** [Username] When contextual auto-fill is enabled, supports automatic saving and filling of usernames.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ContentType)

```cangjie
public operator func !=(other: ContentType): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ContentType](#enum-contenttype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(ContentType)

```cangjie
public operator func ==(other: ContentType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ContentType](#enum-contenttype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum ControlSize

```cangjie
public enum ControlSize <: Equatable<ControlSize> {
    | Small
    | Normal
    | ...
}
```

**Function:** Control size dimensions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ControlSize>

### Normal

```cangjie
Normal
```

**Function:** Normal size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Small

```cangjie
Small
```

**Function:** Small size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ControlSize)

```cangjie
public operator func !=(other: ControlSize): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ControlSize](#enum-controlsize)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(ControlSize)

```cangjie
public operator func ==(other: ControlSize): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ControlSize](#enum-controlsize)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|
```## enum CopyOptions

```cangjie
public enum CopyOptions <: Equatable<CopyOptions> {
    | None
    | InApp
    | LocalDevice
    | ...
}
```

**Function:** Text copy mode for input.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<CopyOptions>

### InApp

```cangjie
InApp
```

**Function:** Supports in-app copying.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### LocalDevice

```cangjie
LocalDevice
```

**Function:** Supports copying within the device.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** Copying is not supported.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(CopyOptions)

```cangjie
public operator func !=(other: CopyOptions): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CopyOptions](#enum-copyoptions) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(CopyOptions)

```cangjie
public operator func ==(other: CopyOptions): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CopyOptions](#enum-copyoptions) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum Curve

```cangjie
public enum Curve <: Equatable<Curve> {
    | Linear
    | Ease
    | EaseIn
    | EaseOut
    | EaseInOut
    | FastOutSlowIn
    | LinearOutSlowIn
    | FastOutLinearIn
    | ExtremeDeceleration
    | Sharp
    | Rhythm
    | Smooth
    | Friction
    | ...
}
```

**Function:** Animation curve.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<Curve>

### Ease

```cangjie
Ease
```

**Function:** Indicates that the animation starts slowly, then speeds up, and slows down before ending, CubicBezier(0.25, 0.1, 0.25, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### EaseIn

```cangjie
EaseIn
```

**Function:** Indicates that the animation starts slowly, CubicBezier(0.42, 0.0, 1.0, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### EaseInOut

```cangjie
EaseInOut
```

**Function:** Indicates that the animation starts and ends slowly, CubicBezier(0.42, 0.0, 0.58, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### EaseOut

```cangjie
EaseOut
```

**Function:** Indicates that the animation ends slowly, CubicBezier(0.0, 0.0, 0.58, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ExtremeDeceleration

```cangjie
ExtremeDeceleration
```

**Function:** Extreme deceleration curve, cubic-bezier(0.0, 0.0, 0.0, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FastOutLinearIn

```cangjie
FastOutLinearIn
```

**Function:** Acceleration curve, cubic-bezier(0.4, 0.0, 1.0, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FastOutSlowIn

```cangjie
FastOutSlowIn
```

**Function:** Standard curve, cubic-bezier(0.4, 0.0, 0.2, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Friction

```cangjie
Friction
```

**Function:** Damping curve, CubicBezier(0.2, 0.0, 0.2, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Linear

```cangjie
Linear
```

**Function:** Indicates that the animation speed remains constant from start to end.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### LinearOutSlowIn

```cangjie
LinearOutSlowIn
```

**Function:** Deceleration curve, cubic-bezier(0.0, 0.0, 0.2, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Rhythm

```cangjie
Rhythm
```

**Function:** Rhythm curve, CubicBezier(0.7, 0.0, 0.2, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Sharp

```cangjie
Sharp
```

**Function:** Sharp curve, CubicBezier(0.4, 0.0, 0.6, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Smooth

```cangjie
Smooth
```

**Function:** Smooth curve, CubicBezier(0.4, 0.0, 0.2, 1.0).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(Curve)

```cangjie
public operator func !=(other: Curve): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Curve](#enum-curve) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(Curve)

```cangjie
public operator func ==(other: Curve): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Curve](#enum-curve) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum DialogAlignment

```cangjie
public enum DialogAlignment <: Equatable<DialogAlignment> {
    | Top
    | Center
    | Bottom
    | Default
    | TopStart
    | TopEnd
    | CenterStart
    | CenterEnd
    | BottomStart
    | BottomEnd
    | ...
}
```

**Function:** Vertical alignment of dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<DialogAlignment>

### Bottom

```cangjie
Bottom
```

**Function:** Aligns to the bottom vertically.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BottomEnd

```cangjie
BottomEnd
```

**Function:** Aligns to the bottom right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BottomStart

```cangjie
BottomStart
```

**Function:** Aligns to the bottom left.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Center

```cangjie
Center
```

**Function:** Aligns to the center vertically.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### CenterEnd

```cangjie
CenterEnd
```

**Function:** Aligns to the right center.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### CenterStart

```cangjie
CenterStart
```

**Function:** Aligns to the left center.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Default

```cangjie
Default
```

**Function:** Default alignment.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Top

```cangjie
Top
```

**Function:** Aligns to the top vertically.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TopEnd

```cangjie
TopEnd
```

**Function:** Aligns to the top right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TopStart

```cangjie
TopStart
```

**Function:** Aligns to the top left.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(DialogAlignment)

```cangjie
public operator func !=(other: DialogAlignment): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DialogAlignment](#enum-dialogalignment) | Yes | - | Enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(DialogAlignment)

```cangjie
public operator func ==(other: DialogAlignment): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DialogAlignment](#enum-dialogalignment) | Yes | - | Returns true if the two enum values are equal, otherwise returns false. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the value represented by the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Value represented by the current enum. |```markdown
## enum DialogButtonStyle

```cangjie
public enum DialogButtonStyle <: Equatable<DialogButtonStyle> {
    | Default
    | Highlight
    | ...
}
```

**Function:** Dialog button style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<DialogButtonStyle>

### Default

```cangjie
Default
```

**Function:** White background with blue text (Dark theme: White background = Black background).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Highlight

```cangjie
Highlight
```

**Function:** Blue background with white text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(DialogButtonStyle)

```cangjie
public operator func !=(other: DialogButtonStyle): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[DialogButtonStyle](#enum-dialogbuttonstyle)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(DialogButtonStyle)

```cangjie
public operator func ==(other: DialogButtonStyle): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[DialogButtonStyle](#enum-dialogbuttonstyle)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum Direction

```cangjie
public enum Direction <: Equatable<Direction> {
    | Ltr
    | Rtl
    | Auto
    | ...
}
```

**Function:** Element layout direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<Direction>

### Auto

```cangjie
Auto
```

**Function:** Uses the system default layout direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Ltr

```cangjie
Ltr
```

**Function:** Elements are laid out from left to right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Rtl

```cangjie
Rtl
```

**Function:** Elements are laid out from right to left.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(Direction)

```cangjie
public operator func !=(other: Direction): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Direction](#enum-direction)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(Direction)

```cangjie
public operator func ==(other: Direction): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Direction](#enum-direction)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum Edge

```cangjie
public enum Edge <: Equatable<Edge> {
    | Top
    | Start
    | Bottom
    | End
    | ...
}
```

**Function:** Scroll to container edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<Edge>

### Bottom

```cangjie
Bottom
```

**Function:** Bottom edge in vertical direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### End

```cangjie
End
```

**Function:** End position in horizontal direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Function:** Start position in horizontal direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Top

```cangjie
Top
```

**Function:** Top edge in vertical direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(Edge)

```cangjie
public operator func !=(other: Edge): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Edge](#enum-edge)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(Edge)

```cangjie
public operator func ==(other: Edge): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Edge](#enum-edge)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum EdgeEffect

```cangjie
public enum EdgeEffect <: Equatable<EdgeEffect> {
    | Spring
    | Fade
    | None
    | ...
}
```

**Function:** Edge sliding effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<EdgeEffect>

### Fade

```cangjie
Fade
```

**Function:** Shadow effect, showing arc-shaped shadows when sliding to the edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** No effect when sliding to the edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Spring

```cangjie
Spring
```

**Function:** Elastic physics animation, allowing continued sliding beyond the edge based on initial velocity or touch events, with rebound upon release.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(EdgeEffect)

```cangjie
public operator func !=(other: EdgeEffect): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[EdgeEffect](#enum-edgeeffect)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(EdgeEffect)

```cangjie
public operator func ==(other: EdgeEffect): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[EdgeEffect](#enum-edgeeffect)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum FillMode

```cangjie
public enum FillMode <: Equatable<FillMode> {
    | None
    | Forwards
    | Backwards
    | Both
    | ...
}
```

**Function:** State before and after animation playback in the current direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FillMode>

### Backwards

```cangjie
Backwards
```

**Function:** The animation will immediately apply the value defined in the first keyframe when applied to the target and retain this value during the delay period. The first keyframe depends on playMode: for Normal or Alternate, it's the 'from' state; for Reverse or AlternateReverse, it's the 'to' state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Both

```cangjie
Both
```

**Function:** The animation will follow both Forwards and Backwards rules, extending animation properties in both directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Forwards

```cangjie
Forwards
```

**Function:** The target will retain the state of the last keyframe during animation execution.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** No styles are applied to the target when the animation is not playing, and it reverts to the initial default state after completion.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FillMode)

```cangjie
public operator func !=(other: FillMode): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FillMode](#enum-fillmode)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(FillMode)

```cangjie
public operator func ==(other: FillMode): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FillMode](#enum-fillmode)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|
```## enum FinishCallbackType

```cangjie
public enum FinishCallbackType <: Equatable<FinishCallbackType> {
    | Removed
    | Logically
    | ...
}
```

**Description:** Callback type when animation finishes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FinishCallbackType>

### Logically

```cangjie
Logically
```

**Description:** Triggers callback when the animation is in a logically descending state but may still be in its long tail state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Removed

```cangjie
Removed
```

**Description:** Triggers callback when the entire animation ends and is immediately removed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FinishCallbackType)

```cangjie
public operator func !=(other: FinishCallbackType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FinishCallbackType](#enum-finishcallbacktype)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are unequal, otherwise returns false.|

### func ==(FinishCallbackType)

```cangjie
public operator func ==(other: FinishCallbackType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FinishCallbackType](#enum-finishcallbacktype)|Yes|-|Value represented by current enum.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise returns false.|

## enum FlexAlign

```cangjie
public enum FlexAlign <: Equatable<FlexAlign> {
    | Start
    | Center
    | End
    | SpaceBetween
    | SpaceAround
    | SpaceEvenly
    | ...
}
```

**Description:** Flex container alignment mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FlexAlign>

### Center

```cangjie
Center
```

**Description:** Elements are center-aligned along the main axis, with the distance from the first element to the start edge equal to that from the last element to the end edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### End

```cangjie
End
```

**Description:** Elements are end-aligned along the main axis, with the last element aligned to the end edge and other elements aligned to the subsequent one.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SpaceAround

```cangjie
SpaceAround
```

**Description:** Flex items are evenly distributed along the main axis with equal spacing between adjacent elements. The distance from the first element to the start edge and from the last element to the end edge is half of the spacing between adjacent elements.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SpaceBetween

```cangjie
SpaceBetween
```

**Description:** Flex items are evenly distributed along the main axis with equal spacing between adjacent elements. The first element is aligned to the start edge and the last element to the end edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SpaceEvenly

```cangjie
SpaceEvenly
```

**Description:** Flex items are evenly distributed along the main axis with equal spacing between adjacent elements. The distance from the first element to the start edge and from the last element to the end edge equals the spacing between adjacent elements.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Description:** Elements are start-aligned along the main axis, with the first element aligned to the start edge and other elements aligned to the preceding one.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FlexAlign)

```cangjie
public operator func !=(other: FlexAlign): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FlexAlign](#enum-flexalign)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are unequal, otherwise returns false.|

### func ==(FlexAlign)

```cangjie
public operator func ==(other: FlexAlign): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FlexAlign](#enum-flexalign)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise returns false.|

## enum FlexDirection

```cangjie
public enum FlexDirection <: Equatable<FlexDirection> {
    | Row
    | Column
    | RowReverse
    | ColumnReverse
    | ...
}
```

**Description:** Flex container layout direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FlexDirection>

### Column

```cangjie
Column
```

**Description:** Main axis follows column direction as layout mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ColumnReverse

```cangjie
ColumnReverse
```

**Description:** Layout in opposite direction to Column.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Row

```cangjie
Row
```

**Description:** Main axis follows row direction as layout mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### RowReverse

```cangjie
RowReverse
```

**Description:** Layout in opposite direction to Row.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FlexDirection)

```cangjie
public operator func !=(other: FlexDirection): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FlexDirection](#enum-flexdirection)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are unequal, otherwise returns false.|

### func ==(FlexDirection)

```cangjie
public operator func ==(other: FlexDirection): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FlexDirection](#enum-flexdirection)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise returns false.|

## enum FlexWrap

```cangjie
public enum FlexWrap <: Equatable<FlexWrap> {
    | NoWrap
    | Wrap
    | WrapReverse
    | ...
}
```

**Description:** Flex container constraint mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FlexWrap>

### NoWrap

```cangjie
NoWrap
```

**Description:** Flex container elements are laid out in single row/column, with children constrained within the container as much as possible. When children have minimum size constraints, the Flex container won't enforce elastic compression.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Wrap

```cangjie
Wrap
```

**Description:** Flex container elements are arranged in multiple rows/columns, allowing children to exceed container bounds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### WrapReverse

```cangjie
WrapReverse
```

**Description:** Layout in opposite direction to Wrap.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FlexWrap)

```cangjie
public operator func !=(other: FlexWrap): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FlexWrap](#enum-flexwrap)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are unequal, otherwise returns false.|

### func ==(FlexWrap)

```cangjie
public operator func ==(other: FlexWrap): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FlexWrap](#enum-flexwrap)|Yes|-|Enum value to compare|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise returns false.|## enum FoldStatus

```cangjie
public enum FoldStatus <: Equatable<FoldStatus> {
    | FOLD_STATUS_UNKNOWN
    | FOLD_STATUS_EXPANDED
    | FOLD_STATUS_FOLDED
    | FOLD_STATUS_HALF_FOLDED
    | ...
}
```

**Description:** Represents the folding state of a foldable device.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FoldStatus>

### FOLD_STATUS_EXPANDED

```cangjie
FOLD_STATUS_EXPANDED
```

**Description:** Indicates the device is currently in a fully expanded state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FOLD_STATUS_FOLDED

```cangjie
FOLD_STATUS_FOLDED
```

**Description:** Indicates the device is currently in a folded state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FOLD_STATUS_HALF_FOLDED

```cangjie
FOLD_STATUS_HALF_FOLDED
```

**Description:** Indicates the device is currently in a half-folded state. Half-folded refers to an intermediate state between fully expanded and fully folded.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FOLD_STATUS_UNKNOWN

```cangjie
FOLD_STATUS_UNKNOWN
```

**Description:** Indicates the device's current folding state is unknown.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FoldStatus)

```cangjie
public operator func !=(other: FoldStatus): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FoldStatus](#enum-foldstatus) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(FoldStatus)

```cangjie
public operator func ==(other: FoldStatus): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FoldStatus](#enum-foldstatus) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

## enum FontStyle

```cangjie
public enum FontStyle <: Equatable<FontStyle> {
    | Normal
    | Italic
    | ...
}
```

**Description:** Font style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FontStyle>

### Italic

```cangjie
Italic
```

**Description:** Italic font style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Normal

```cangjie
Normal
```

**Description:** Standard font style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FontStyle)

```cangjie
public operator func !=(other: FontStyle): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FontStyle](#enum-fontstyle) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(FontStyle)

```cangjie
public operator func ==(other: FontStyle): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FontStyle](#enum-fontstyle) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Description:** Gets the integer value represented by the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The integer value represented by the current enum. |

## enum FontWeight

```cangjie
public enum FontWeight <: Equatable<FontWeight> {
    | Normal
    | Bold
    | Bolder
    | Lighter
    | Medium
    | Regular
    | W100
    | W200
    | W300
    | W400
    | W500
    | W600
    | W700
    | W800
    | W900
    | ...
}
```

**Description:** Sets the font weight of text. Setting values too large may result in truncation with certain fonts.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FontWeight>

### Bold

```cangjie
Bold
```

**Description:** Bold font weight.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Bolder

```cangjie
Bolder
```

**Description:** Very bold font weight.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Lighter

```cangjie
Lighter
```

**Description:** Light font weight.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Medium

```cangjie
Medium
```

**Description:** Medium font weight.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Normal

```cangjie
Normal
```

**Description:** Normal font weight.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Regular

```cangjie
Regular
```

**Description:** Slightly bold font weight.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W100

```cangjie
W100
```

**Description:** 100 (lightest).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W200

```cangjie
W200
```

**Description:** 200.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W300

```cangjie
W300
```

**Description:** 300.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W400

```cangjie
W400
```

**Description:** 400 (normal).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W500

```cangjie
W500
```

**Description:** 500.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W600

```cangjie
W600
```

**Description:** 600.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W700

```cangjie
W700
```

**Description:** 700.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W800

```cangjie
W800
```

**Description:** 800.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### W900

```cangjie
W900
```

**Description:** 900 (boldest).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FontWeight)

```cangjie
public operator func !=(other: FontWeight): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FontWeight](#enum-fontweight) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(FontWeight)

```cangjie
public operator func ==(other: FontWeight): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FontWeight](#enum-fontweight) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): String
```

**Description:** Gets the string value represented by the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string value represented by the current enum. |

### func getValueInt()

```cangjie
public func getValueInt(): UInt32
```

**Description:** Gets the integer value represented by the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The integer value represented by the current enum. |## enum ForegroundBlurStyle

```cangjie
public enum ForegroundBlurStyle <: Equatable<ForegroundBlurStyle> {
    | None
    | Thin
    | Regular
    | Thick
    | BackgroundThin
    | BackgroundRegular
    | BackgroundThick
    | BackgroundUltraThick
    | ComponentUltraThin
    | ComponentThin
    | ComponentRegular
    | ComponentThick
    | ComponentUltraThick
    | ...
}
```

**Description:** Foreground blur styles.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ForegroundBlurStyle>

### BackgroundRegular

```cangjie
BackgroundRegular
```

**Description:** Medium-depth background blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BackgroundThick

```cangjie
BackgroundThick
```

**Description:** Far-depth background blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BackgroundThin

```cangjie
BackgroundThin
```

**Description:** Near-depth background blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BackgroundUltraThick

```cangjie
BackgroundUltraThick
```

**Description:** Ultra far-depth background blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ComponentRegular

```cangjie
ComponentRegular
```

**Description:** Standard component material blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ComponentThick

```cangjie
ComponentThick
```

**Description:** Thick component material blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ComponentThin

```cangjie
ComponentThin
```

**Description:** Thin component material blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ComponentUltraThick

```cangjie
ComponentUltraThick
```

**Description:** Ultra thick component material blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ComponentUltraThin

```cangjie
ComponentUltraThin
```

**Description:** Ultra thin component material blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Description:** No blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Regular

```cangjie
Regular
```

**Description:** Standard blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Thick

```cangjie
Thick
```

**Description:** Thick blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Thin

```cangjie
Thin
```

**Description:** Thin blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ForegroundBlurStyle)

```cangjie
public operator func !=(other: ForegroundBlurStyle): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ForegroundBlurStyle](#enum-foregroundblurstyle)|Yes|-|Another enum value for comparison.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise returns false.|

### func ==(ForegroundBlurStyle)

```cangjie
public operator func ==(other: ForegroundBlurStyle): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ForegroundBlurStyle](#enum-foregroundblurstyle)|Yes|-|Another enum value for comparison.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise returns false.|

## enum FunctionKey

```cangjie
public enum FunctionKey <: Equatable<FunctionKey> {
    | ESC
    | F1
    | F2
    | F3
    | F4
    | F5
    | F6
    | F7
    | F8
    | F9
    | F10
    | F11
    | F12
    | TAB
    | ...
}
```

**Description:** Keyboard function keys.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<FunctionKey>

### ESC

```cangjie
ESC
```

**Description:** Represents the ESC function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F1

```cangjie
F1
```

**Description:** Represents the F1 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F10

```cangjie
F10
```

**Description:** Represents the F10 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F11

```cangjie
F11
```

**Description:** Represents the F11 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F12

```cangjie
F12
```

**Description:** Represents the F12 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F2

```cangjie
F2
```

**Description:** Represents the F2 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F3

```cangjie
F3
```

**Description:** Represents the F3 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F4

```cangjie
F4
```

**Description:** Represents the F4 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F5

```cangjie
F5
```

**Description:** Represents the F5 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F6

```cangjie
F6
```

**Description:** Represents the F6 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F7

```cangjie
F7
```

**Description:** Represents the F7 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F8

```cangjie
F8
```

**Description:** Represents the F8 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### F9

```cangjie
F9
```

**Description:** Represents the F9 function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TAB

```cangjie
TAB
```

**Description:** Represents the TAB function key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(FunctionKey)

```cangjie
public operator func !=(other: FunctionKey): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[FunctionKey](#enum-functionkey)|Yes|-|Another enum value for comparison.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise returns false.|

### func ==(FunctionKey)

```cangjie
public operator func ==(other: FunctionKey): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[FunctionKey](#enum-functionkey)|Yes|-|Another enum value for comparison.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise returns false.|## enum GradientDirection

```cangjie
public enum GradientDirection <: Equatable<GradientDirection> {
    | Left
    | Right
    | Top
    | Bottom
    | LeftTop
    | LeftBottom
    | RightTop
    | RightBottom
    | None
    | ...
}
```

**Function:** Gradient direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<GradientDirection>

### Bottom

```cangjie
Bottom
```

**Function:** From top to bottom.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Left

```cangjie
Left
```

**Function:** From right to left.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### LeftBottom

```cangjie
LeftBottom
```

**Function:** Bottom-left.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### LeftTop

```cangjie
LeftTop
```

**Function:** Top-left.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** None.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Right

```cangjie
Right
```

**Function:** From left to right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### RightBottom

```cangjie
RightBottom
```

**Function:** Bottom-right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### RightTop

```cangjie
RightTop
```

**Function:** Top-right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Top

```cangjie
Top
```

**Function:** From bottom to top.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(GradientDirection)

```cangjie
public operator func !=(other: GradientDirection): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[GradientDirection](#enum-gradientdirection)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are not equal, otherwise returns false.|

### func ==(GradientDirection)

```cangjie
public operator func ==(other: GradientDirection): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[GradientDirection](#enum-gradientdirection)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

## enum HorizontalAlign

```cangjie
public enum HorizontalAlign <: Equatable<HorizontalAlign> {
    | Start
    | Center
    | End
    | ...
}
```

**Function:** Horizontal alignment mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<HorizontalAlign>

### Center

```cangjie
Center
```

**Function:** Center alignment (default mode).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### End

```cangjie
End
```

**Function:** Aligns to the end according to language direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Function:** Aligns to the start according to language direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(HorizontalAlign)

```cangjie
public operator func !=(other: HorizontalAlign): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[HorizontalAlign](#enum-horizontalalign)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are not equal, otherwise returns false.|

### func ==(HorizontalAlign)

```cangjie
public operator func ==(other: HorizontalAlign): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[HorizontalAlign](#enum-horizontalalign)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

## enum ImageFit

```cangjie
public enum ImageFit <: Equatable<ImageFit> {
    | Fill
    | Contain
    | Cover
    | Auto
    | None
    | ScaleDown
    | ...
}
```

**Function:** Image display adaptation mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ImageFit>

### Auto

```cangjie
Auto
```

**Function:** The image will be appropriately scaled based on its own dimensions and the component's dimensions to fill the view while maintaining aspect ratio.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Contain

```cangjie
Contain
```

**Function:** Scales the image while maintaining aspect ratio to ensure it is fully displayed within the boundaries.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Cover

```cangjie
Cover
```

**Function:** Scales the image while maintaining aspect ratio to ensure both sides are equal to or larger than the display boundaries.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Fill

```cangjie
Fill
```

**Function:** Scales the image without maintaining aspect ratio, stretching it to fill the entire display boundary.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** The image is displayed at its original size without any scaling.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ScaleDown

```cangjie
ScaleDown
```

**Function:** The image is proportionally scaled down but not enlarged, maintaining aspect ratio.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ImageFit)

```cangjie
public operator func !=(other: ImageFit): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ImageFit](#enum-imagefit)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are not equal, otherwise returns false.|

### func ==(ImageFit)

```cangjie
public operator func ==(other: ImageFit): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ImageFit](#enum-imagefit)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|## enum ImageRepeat

```cangjie
public enum ImageRepeat <: Equatable<ImageRepeat> {
    | NoRepeat
    | X
    | Y
    | XY
    | ...
}
```

**Function:** Image repetition mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ImageRepeat>

### NoRepeat

```cangjie
NoRepeat
```

**Function:** Do not repeat the image when drawing.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### X

```cangjie
X
```

**Function:** Repeat the image only on the horizontal axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### XY

```cangjie
XY
```

**Function:** Repeat the image on both axes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Y

```cangjie
Y
```

**Function:** Repeat the image only on the vertical axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ImageRepeat)

```cangjie
public operator func !=(other: ImageRepeat): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageRepeat](#enum-imagerepeat)|Yes|-|Image repetition mode.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ImageRepeat)

```cangjie
public operator func ==(other: ImageRepeat): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageRepeat](#enum-imagerepeat)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum ImageSize

```cangjie
public enum ImageSize <: Equatable<ImageSize> {
    | Contain
    | Cover
    | Auto
    | ...
}
```

**Function:** Image size display settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ImageSize>

### Auto

```cangjie
Auto
```

**Function:** Default value, maintains the original image's aspect ratio.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Contain

```cangjie
Contain
```

**Function:** Scales the image while maintaining its aspect ratio to ensure it is fully displayed within the display boundaries.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Cover

```cangjie
Cover
```

**Function:** Scales the image while maintaining its aspect ratio to ensure both sides of the image are greater than or equal to the display boundaries.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ImageSize)

```cangjie
public operator func !=(other: ImageSize): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageSize](#enum-imagesize)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ImageSize)

```cangjie
public operator func ==(other: ImageSize): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageSize](#enum-imagesize)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum ImageSpanAlignment

```cangjie
public enum ImageSpanAlignment <: Equatable<ImageSpanAlignment> {
    | TOP
    | CENTER
    | BOTTOM
    | BASELINE
    | ...
}
```

**Function:** Image alignment relative to line height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ImageSpanAlignment>

### BASELINE

```cangjie
BASELINE
```

**Function:** Aligns the bottom edge of the image with the text baseline.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BOTTOM

```cangjie
BOTTOM
```

**Function:** Aligns the bottom edge of the image with the bottom edge of the line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### CENTER

```cangjie
CENTER
```

**Function:** Aligns the center of the image with the center of the line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TOP

```cangjie
TOP
```

**Function:** Aligns the top edge of the image with the top edge of the line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ImageSpanAlignment)

```cangjie
public operator func !=(other: ImageSpanAlignment): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageSpanAlignment](#enum-imagespanalignment)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ImageSpanAlignment)

```cangjie
public operator func ==(other: ImageSpanAlignment): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageSpanAlignment](#enum-imagespanalignment)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum ImageType

```cangjie
public enum ImageType <: Equatable<ImageType> {
    | png
    | jpeg
    | webp
    | ...
}
```

**Function:** Specifies the image format.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ImageType>

### jpeg

```cangjie
jpeg
```

**Function:** JPEG image format.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### png

```cangjie
png
```

**Function:** PNG image format.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### webp

```cangjie
webp
```

**Function:** WebP image format.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ImageType)

```cangjie
public operator func !=(other: ImageType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageType](#enum-imagetype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ImageType)

```cangjie
public operator func ==(other: ImageType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageType](#enum-imagetype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|## enum ItemAlign

```cangjie
public enum ItemAlign <: Equatable<ItemAlign> {
    | Auto
    | Start
    | Center
    | End
    | Stretch
    | Baseline
    | ...
}
```

**Description:** Element alignment mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ItemAlign>

### Auto

```cangjie
Auto
```

**Description:** Uses the default configuration in the Flex container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Baseline

```cangjie
Baseline
```

**Description:** Aligns elements along the text baseline in the cross-axis direction within the Flex container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Center

```cangjie
Center
```

**Description:** Centers elements in the cross-axis direction within the Flex container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### End

```cangjie
End
```

**Description:** Aligns elements to the end in the cross-axis direction within the Flex container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Description:** Aligns elements to the start in the cross-axis direction within the Flex container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Stretch

```cangjie
Stretch
```

**Description:** Stretches elements to fill the cross-axis direction within the Flex container. When the container is Flex with Wrap set to FlexWrap.Wrap or FlexWrap.WrapReverse, elements stretch to match the size of the longest element in the current row/column's cross-axis. In other cases, elements stretch to the container size regardless of their set dimensions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ItemAlign)

```cangjie
public operator func !=(other: ItemAlign): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ItemAlign](#enum-itemalign) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(ItemAlign)

```cangjie
public operator func ==(other: ItemAlign): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ItemAlign](#enum-itemalign) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum KeySource

```cangjie
public enum KeySource <: Equatable<KeySource> {
    | Unknown
    | Keyboard
    | ...
}
```

**Description:** Key press source.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<KeySource>

### Keyboard

```cangjie
Keyboard
```

**Description:** Keyboard key press.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Description:** Unknown source.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(KeySource)

```cangjie
public operator func !=(other: KeySource): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [KeySource](#enum-keysource) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(KeySource)

```cangjie
public operator func ==(other: KeySource): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [KeySource](#enum-keysource) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Description:** Gets the parameter value, returning the integer value corresponding to whether the unlock result is reused.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The value represented by the current enum. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the string representation of the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the current enum. |

## enum KeyType

```cangjie
public enum KeyType <: Equatable<KeyType> {
    | Unknown
    | Down
    | Up
    | ...
}
```

**Description:** Key press type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<KeyType>

### Down

```cangjie
Down
```

**Description:** Key press down.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Description:** Unknown type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Up

```cangjie
Up
```

**Description:** Key release.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(KeyType)

```cangjie
public operator func !=(other: KeyType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [KeyType](#enum-keytype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(KeyType)

```cangjie
public operator func ==(other: KeyType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [KeyType](#enum-keytype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Description:** Gets the parameter value, returning the integer value corresponding to whether the unlock result is reused.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The value represented by the current enum. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the string representation of the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the current enum. |

## enum LayoutSafeAreaEdge

```cangjie
public enum LayoutSafeAreaEdge <: Equatable<LayoutSafeAreaEdge> {
    | TOP
    | BOTTOM
    | ...
}
```

**Description:** Direction for extending the safe area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<LayoutSafeAreaEdge>

### BOTTOM

```cangjie
BOTTOM
```

**Description:** Bottom area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TOP

```cangjie
TOP
```

**Description:** Top area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(LayoutSafeAreaEdge)

```cangjie
public operator func !=(other: LayoutSafeAreaEdge): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LayoutSafeAreaEdge](#enum-layoutsafeareaedge) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(LayoutSafeAreaEdge)

```cangjie
public operator func ==(other: LayoutSafeAreaEdge): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LayoutSafeAreaEdge](#enum-layoutsafeareaedge) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |```markdown
## enum LayoutSafeAreaType

```cangjie
public enum LayoutSafeAreaType <: Equatable<LayoutSafeAreaType> {
    | SYSTEM
    | ...
}
```

**Description:** Enumeration type for extending layout safe areas.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<LayoutSafeAreaType>

### SYSTEM

```cangjie
SYSTEM
```

**Description:** System default non-safe area, including status bar and navigation bar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(LayoutSafeAreaType)

```cangjie
public operator func !=(other: LayoutSafeAreaType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LayoutSafeAreaType](#enum-layoutsafeareatype) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(LayoutSafeAreaType)

```cangjie
public operator func ==(other: LayoutSafeAreaType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LayoutSafeAreaType](#enum-layoutsafeareatype) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum LengthMetricsUnit

```cangjie
public enum LengthMetricsUnit <: Equatable<LengthMetricsUnit> {
    | DEFAULT
    | PX
    | ...
}
```

**Description:** Enumeration for length property units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<LengthMetricsUnit>

### DEFAULT

```cangjie
DEFAULT
```

**Description:** Length type describing lengths in default vp pixel units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PX

```cangjie
PX
```

**Description:** Length type describing lengths in px pixel units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(LengthMetricsUnit)

```cangjie
public operator func !=(other: LengthMetricsUnit): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LengthMetricsUnit](#enum-lengthmetricsunit) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(LengthMetricsUnit)

```cangjie
public operator func ==(other: LengthMetricsUnit): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LengthMetricsUnit](#enum-lengthmetricsunit) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum LineBreakStrategy

```cangjie
public enum LineBreakStrategy <: Equatable<LineBreakStrategy> {
    | GREEDY
    | HIGH_QUALITY
    | BALANCED
    | ...
}
```

**Description:** Text line breaking rules.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<LineBreakStrategy>

### BALANCED

```cangjie
BALANCED
```

**Description:** Attempts to maintain equal line widths within a paragraph without word breaks where possible.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### GREEDY

```cangjie
GREEDY
```

**Description:** Displays as many characters as possible per line before breaking.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### HIGH_QUALITY

```cangjie
HIGH_QUALITY
```

**Description:** Builds upon BALANCED strategy while attempting to fill lines more completely, potentially leaving more whitespace on the last line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(LineBreakStrategy)

```cangjie
public operator func !=(other: LineBreakStrategy): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LineBreakStrategy](#enum-linebreakstrategy) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(LineBreakStrategy)

```cangjie
public operator func ==(other: LineBreakStrategy): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LineBreakStrategy](#enum-linebreakstrategy) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum LineCapStyle

```cangjie
public enum LineCapStyle <: Equatable<LineCapStyle> {
    | Butt
    | Round
    | Square
    | ...
}
```

**Description:** Line ending styles.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<LineCapStyle>

### Butt

```cangjie
Butt
```

**Description:** Flat line endings without extensions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Round

```cangjie
Round
```

**Description:** Line endings extend with semicircles having diameters equal to line width.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Square

```cangjie
Square
```

**Description:** Line endings extend with squares having side lengths equal to line width.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(LineCapStyle)

```cangjie
public operator func !=(other: LineCapStyle): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LineCapStyle](#enum-linecapstyle) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(LineCapStyle)

```cangjie
public operator func ==(other: LineCapStyle): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LineCapStyle](#enum-linecapstyle) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum LineJoinStyle

```cangjie
public enum LineJoinStyle <: Equatable<LineJoinStyle> {
    | Miter
    | Round
    | Bevel
    | ...
}
```

**Description:** Path segment connection styles.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<LineJoinStyle>

### Bevel

```cangjie
Bevel
```

**Description:** Connects path segments with beveled corners.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Miter

```cangjie
Miter
```

**Description:** Connects path segments with sharp corners.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Round

```cangjie
Round
```

**Description:** Connects path segments with rounded corners.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(LineJoinStyle)

```cangjie
public operator func !=(other: LineJoinStyle): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LineJoinStyle](#enum-linejoinstyle) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(LineJoinStyle)

```cangjie
public operator func ==(other: LineJoinStyle): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [LineJoinStyle](#enum-linejoinstyle) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |
```## enum ListItemAlign

```cangjie
public enum ListItemAlign <: Equatable<ListItemAlign> {
    | Start
    | Center
    | End
    | ...
}
```

**Function:** Alignment of ListItem along the cross axis in a List.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ListItemAlign>

### Center

```cangjie
Center
```

**Function:** Center alignment of ListItem along the cross axis in a List.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### End

```cangjie
End
```

**Function:** End alignment of ListItem along the cross axis in a List.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Function:** Start alignment of ListItem along the cross axis in a List.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ListItemAlign)

```cangjie
public operator func !=(other: ListItemAlign): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ListItemAlign](#enum-listitemalign)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(ListItemAlign)

```cangjie
public operator func ==(other: ListItemAlign): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ListItemAlign](#enum-listitemalign)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the parameter value, returns whether the unlock result reuses the corresponding integer value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int32|The value represented by the current enum.|

## enum MenuPolicy

```cangjie
public enum MenuPolicy <: Equatable<MenuPolicy> {
    | Default
    | Hide
    | Show
    | ...
}
```

**Function:** Policy for menu popup.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<MenuPolicy>

### Default

```cangjie
Default
```

**Function:** Determines whether to pop up the menu based on the underlying default logic.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Hide

```cangjie
Hide
```

**Function:** Never pops up the menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Show

```cangjie
Show
```

**Function:** Always pops up the menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(MenuPolicy)

```cangjie
public operator func !=(other: MenuPolicy): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[MenuPolicy](#enum-menupolicy)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(MenuPolicy)

```cangjie
public operator func ==(other: MenuPolicy): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[MenuPolicy](#enum-menupolicy)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum ModalTransition

```cangjie
public enum ModalTransition <: Equatable<ModalTransition> {
    | Default
    | None
    | Alpha
    | ...
}
```

**Function:** Full-screen modal transition animation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ModalTransition>

### Alpha

```cangjie
Alpha
```

**Function:** Full-screen modal opacity gradient animation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Default

```cangjie
Default
```

**Function:** Full-screen modal vertical transition animation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** Full-screen modal without transition animation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ModalTransition)

```cangjie
public operator func !=(other: ModalTransition): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ModalTransition](#enum-modaltransition)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(ModalTransition)

```cangjie
public operator func ==(other: ModalTransition): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ModalTransition](#enum-modaltransition)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum ModifierKey

```cangjie
public enum ModifierKey <: Equatable<ModifierKey> {
    | CTRL
    | SHIFT
    | ALT
    | ...
}
```

**Function:** Input method modifier key type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ModifierKey>

### ALT

```cangjie
ALT
```

**Function:** Represents the Alt key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### CTRL

```cangjie
CTRL
```

**Function:** Represents the Ctrl key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SHIFT

```cangjie
SHIFT
```

**Function:** Represents the Shift key on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ModifierKey)

```cangjie
public operator func !=(other: ModifierKey): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ModifierKey](#enum-modifierkey)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(ModifierKey)

```cangjie
public operator func ==(other: ModifierKey): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ModifierKey](#enum-modifierkey)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the current enum.|## enum MouseAction

```cangjie
public enum MouseAction <: Equatable<MouseAction> {
    | None
    | Press
    | Release
    | Move
    | Hover
    | ...
}
```

**Function:** Mouse actions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<MouseAction>

### Hover

```cangjie
Hover
```

**Function:** Mouse hover.  
**Note:** This enumeration value is invalid.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Move

```cangjie
Move
```

**Function:** Mouse movement.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** No operation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Press

```cangjie
Press
```

**Function:** Mouse button press.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Release

```cangjie
Release
```

**Function:** Mouse button release.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(MouseAction)

```cangjie
public operator func !=(other: MouseAction): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MouseAction](#enum-mouseaction) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

### func ==(MouseAction)

```cangjie
public operator func ==(other: MouseAction): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MouseAction](#enum-mouseaction) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The value of the enumeration. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the enumeration. |

## enum MouseButton

```cangjie
public enum MouseButton <: Equatable<MouseButton> {
    | None
    | Left
    | Right
    | Middle
    | Back
    | Forward
    | ...
}
```

**Function:** Mouse buttons.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<MouseButton>

### Back

```cangjie
Back
```

**Function:** The back button on the left side of the mouse.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Forward

```cangjie
Forward
```

**Function:** The forward button on the left side of the mouse.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Left

```cangjie
Left
```

**Function:** The left mouse button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Middle

```cangjie
Middle
```

**Function:** The middle mouse button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** No button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Right

```cangjie
Right
```

**Function:** The right mouse button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(MouseButton)

```cangjie
public operator func !=(other: MouseButton): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MouseButton](#enum-mousebutton) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

### func ==(MouseButton)

```cangjie
public operator func ==(other: MouseButton): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MouseButton](#enum-mousebutton) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The value of the enumeration. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the enumeration. |

## enum NavigationType

```cangjie
public enum NavigationType <: Equatable<NavigationType> {
    | Push
    | Replace
    | Back
    | ...
}
```

**Function:** Page routing methods.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<NavigationType>

### Back

```cangjie
Back
```

**Function:** Returns to the specified page. If the specified page does not exist in the stack, no action is taken. If no page is specified, returns to the previous page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Push

```cangjie
Push
```

**Function:** Navigates to the specified page within the application.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Replace

```cangjie
Replace
```

**Function:** Replaces the current page with another page within the application and destroys the replaced page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(NavigationType)

```cangjie
public operator func !=(other: NavigationType): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [NavigationType](#enum-navigationtype) | Yes | - | Another enumeration value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

### func ==(NavigationType)

```cangjie
public operator func ==(other: NavigationType): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [NavigationType](#enum-navigationtype) | Yes | - | Another enumeration value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |```markdown
## enum NestedScrollMode

```cangjie
public enum NestedScrollMode <: Equatable<NestedScrollMode> {
    | SELF_ONLY
    | SELF_FIRST
    | PARENT_FIRST
    | PARALLEL
    | ...
}
```

**Description:** Nested scrolling options when scrollable components reach the end of their scroll range.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<NestedScrollMode>

### PARALLEL

```cangjie
PARALLEL
```

**Description:** Both the component and its parent scroll simultaneously. When both reach their edges, if the component has edge effects, they will be triggered; otherwise, the parent's edge effects will be triggered.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PARENT_FIRST

```cangjie
PARENT_FIRST
```

**Description:** The parent component scrolls first until it reaches its edge, then the component scrolls. When the component reaches its edge, if it has edge effects, they will be triggered; otherwise, the parent's edge effects will be triggered.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SELF_FIRST

```cangjie
SELF_FIRST
```

**Description:** The component scrolls first until it reaches its edge, then the parent component scrolls. When the parent reaches its edge, if it has edge effects, they will be triggered; otherwise, the child's edge effects will be triggered.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SELF_ONLY

```cangjie
SELF_ONLY
```

**Description:** Only the component itself scrolls without interacting with its parent component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(NestedScrollMode)

```cangjie
public operator func !=(other: NestedScrollMode): Bool
```

**Description:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [NestedScrollMode](#enum-nestedscrollmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are not equal, otherwise returns false. |

### func ==(NestedScrollMode)

```cangjie
public operator func ==(other: NestedScrollMode): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [NestedScrollMode](#enum-nestedscrollmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

## enum OptionWidthMode

```cangjie
public enum OptionWidthMode <: Equatable<OptionWidthMode> {
    | FIT_CONTENT
    | FIT_TRIGGER
    | ...
}
```

**Description:** Dropdown menu width settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<OptionWidthMode>

### FIT_CONTENT

```cangjie
FIT_CONTENT
```

**Description:** When set, the dropdown menu width displays by default as 2 grid units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FIT_TRIGGER

```cangjie
FIT_TRIGGER
```

**Description:** Sets the dropdown menu to inherit the width of the dropdown button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(OptionWidthMode)

```cangjie
public operator func !=(other: OptionWidthMode): Bool
```

**Description:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [OptionWidthMode](#enum-optionwidthmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are not equal, otherwise returns false. |

### func ==(OptionWidthMode)

```cangjie
public operator func ==(other: OptionWidthMode): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [OptionWidthMode](#enum-optionwidthmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

## enum Placement

```cangjie
public enum Placement <: Equatable<Placement> {
    | Left
    | Right
    | Top
    | Bottom
    | TopLeft
    | TopRight
    | BottomLeft
    | BottomRight
    | LeftTop
    | LeftBottom
    | RightTop
    | RightBottom
    | None
    | ...
}
```

**Description:** Bubble prompt position settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<Placement>

### Bottom

```cangjie
Bottom
```

**Description:** The bubble prompt is positioned below the component, aligned with the center of its bottom edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BottomLeft

```cangjie
BottomLeft
```

**Description:** The bubble prompt is positioned below the component, aligned with its left edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BottomRight

```cangjie
BottomRight
```

**Description:** The bubble prompt is positioned below the component, aligned with its right edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Left

```cangjie
Left
```

**Description:** The bubble prompt is positioned to the left of the component, aligned with the center of its left edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### LeftBottom

```cangjie
LeftBottom
```

**Description:** The bubble prompt is positioned to the left of the component, aligned with its bottom edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### LeftTop

```cangjie
LeftTop
```

**Description:** The bubble prompt is positioned to the left of the component, aligned with its top edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Description:** The bubble prompt position remains unchanged. (?)

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Right

```cangjie
Right
```

**Description:** The bubble prompt is positioned to the right of the component, aligned with the center of its right edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### RightBottom

```cangjie
RightBottom
```

**Description:** The bubble prompt is positioned to the right of the component, aligned with its bottom edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### RightTop

```cangjie
RightTop
```

**Description:** The bubble prompt is positioned to the right of the component, aligned with its top edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Top

```cangjie
Top
```

**Description:** The bubble prompt is positioned above the component, aligned with the center of its top edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TopLeft

```cangjie
TopLeft
```

**Description:** The bubble prompt is positioned above the component, aligned with its left edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TopRight

```cangjie
TopRight
```

**Description:** The bubble prompt is positioned above the component, aligned with its right edge.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(Placement)

```cangjie
public operator func !=(other: Placement): Bool
```

**Description:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Placement](#enum-placement) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are not equal, otherwise returns false. |

### func ==(Placement)

```cangjie
public operator func ==(other: Placement): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Placement](#enum-placement) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |
```## enum PlayMode

```cangjie
public enum PlayMode <: Equatable<PlayMode> {
    | Normal
    | Reverse
    | Alternate
    | AlternateReverse
    | ...
}
```

**Function:** Animation playback direction setting.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<PlayMode>

### Alternate

```cangjie
Alternate
```

**Function:** The animation plays forward on odd iterations (1st, 3rd, 5th...) and backward on even iterations (2nd, 4th, 6th...).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### AlternateReverse

```cangjie
AlternateReverse
```

**Function:** The animation plays backward on odd iterations (1st, 3rd, 5th...) and forward on even iterations (2nd, 4th, 6th...).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Normal

```cangjie
Normal
```

**Function:** The animation plays forward.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Reverse

```cangjie
Reverse
```

**Function:** The animation plays backward.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(PlayMode)

```cangjie
public operator func !=(other: PlayMode): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PlayMode](#enum-playmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(PlayMode)

```cangjie
public operator func ==(other: PlayMode): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PlayMode](#enum-playmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum ProgressType

```cangjie
public enum ProgressType <: Equatable<ProgressType> {
    | Linear
    | Ring
    | Eclipse
    | ScaleRing
    | Capsule
    | ...
}
```

**Function:** Style type of the Progress component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ProgressType>

### Capsule

```cangjie
Capsule
```

**Function:** Capsule style. The progress display effect at the rounded ends is the same as Eclipse; the middle segment's progress display effect is the same as Linear. Automatically adapts to vertical display when height exceeds width.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Eclipse

```cangjie
Eclipse
```

**Function:** Circular style, displaying a progress effect similar to lunar phases, transitioning from a crescent to a full moon.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Linear

```cangjie
Linear
```

**Function:** Linear style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Ring

```cangjie
Ring
```

**Function:** Ring style without scales, displaying a gradually filled circular ring effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ScaleRing

```cangjie
ScaleRing
```

**Function:** Ring style with scales, displaying a progress effect similar to clock ticks.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ProgressType)

```cangjie
public operator func !=(other: ProgressType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ProgressType](#enum-progresstype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(ProgressType)

```cangjie
public operator func ==(other: ProgressType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ProgressType](#enum-progresstype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum QualityType

```cangjie
public enum QualityType <: Equatable<QualityType> {
    | Low
    | Medium
    | High
    | ...
}
```

**Function:** Sets image smoothness quality.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<QualityType>

### High

```cangjie
High
```

**Function:** High quality.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Low

```cangjie
Low
```

**Function:** Low quality.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Medium

```cangjie
Medium
```

**Function:** Medium quality.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(QualityType)

```cangjie
public operator func !=(other: QualityType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [QualityType](#enum-qualitytype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(QualityType)

```cangjie
public operator func ==(other: QualityType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [QualityType](#enum-qualitytype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum RefreshStatus

```cangjie
public enum RefreshStatus <: Equatable<RefreshStatus> {
    | Inactive
    | Drag
    | OverDrag
    | Refresh
    | Done
    | ...
}
```

**Function:** Pull-down refresh state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<RefreshStatus>

### Done

```cangjie
Done
```

**Function:** Refresh completed, returning to initial state (top position).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Drag

```cangjie
Drag
```

**Function:** Pulling down, with pull distance less than refresh threshold.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Inactive

```cangjie
Inactive
```

**Function:** Default unpulled state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### OverDrag

```cangjie
OverDrag
```

**Function:** Pulling down, with pull distance exceeding refresh threshold.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Refresh

```cangjie
Refresh
```

**Function:** Pull-down completed, bouncing back to refresh threshold, entering refresh state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(RefreshStatus)

```cangjie
public operator func !=(other: RefreshStatus): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [RefreshStatus](#enum-refreshstatus) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(RefreshStatus)

```cangjie
public operator func ==(other: RefreshStatus): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [RefreshStatus](#enum-refreshstatus) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |## enum Repetition

```cangjie
public enum Repetition <: Equatable<Repetition> {
    | repeat
    | repeat_x
    | repeat_y
    | no_repeat
    | clamp
    | mirror
    | ...
}
```

**Function:** Sets the image repetition mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<Repetition>

### clamp

```cangjie
clamp
```

**Function:** When drawing beyond the original boundaries, uses edge colors for the out-of-bounds portions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### mirror

```cangjie
mirror
```

**Function:** Repeats and mirrors the image along both x-axis and y-axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### no_repeat

```cangjie
no_repeat
```

**Function:** Does not repeat the image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### repeat

```cangjie
repeat
```

**Function:** Repeats the image along both x-axis and y-axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### repeat_x

```cangjie
repeat_x
```

**Function:** Repeats the image along the x-axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### repeat_y

```cangjie
repeat_y
```

**Function:** Repeats the image along the y-axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(Repetition)

```cangjie
public operator func !=(other: Repetition): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Repetition](#enum-repetition) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(Repetition)

```cangjie
public operator func ==(other: Repetition): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Repetition](#enum-repetition) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the enum. |

## enum ResponseType

```cangjie
public enum ResponseType <: Equatable<ResponseType> {
    | RightClick
    | LongPress
    | ...
}
```

**Function:** Response type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ResponseType>

### LongPress

```cangjie
LongPress
```

**Function:** Triggers menu popup via long press.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### RightClick

```cangjie
RightClick
```

**Function:** Triggers menu popup via right mouse click.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ResponseType)

```cangjie
public operator func !=(other: ResponseType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ResponseType](#enum-responsetype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(ResponseType)

```cangjie
public operator func ==(other: ResponseType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ResponseType](#enum-responsetype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum ScrollBarDirection

```cangjie
public enum ScrollBarDirection <: Equatable<ScrollBarDirection> {
    | Vertical
    | Horizontal
    | ...
}
```

**Function:** Sets the scrollbar direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ScrollBarDirection>

### Horizontal

```cangjie
Horizontal
```

**Function:** Sets the scrollbar direction to horizontal.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Vertical

```cangjie
Vertical
```

**Function:** Sets the scrollbar direction to vertical.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ScrollBarDirection)

```cangjie
public operator func !=(other: ScrollBarDirection): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ScrollBarDirection](#enum-scrollbardirection) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(ScrollBarDirection)

```cangjie
public operator func ==(other: ScrollBarDirection): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ScrollBarDirection](#enum-scrollbardirection) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## enum ScrollDirection

```cangjie
public enum ScrollDirection <: Equatable<ScrollDirection> {
    | Vertical
    | Horizontal
    | ...
}
```

**Function:** Scroll direction enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ScrollDirection>

### Horizontal

```cangjie
Horizontal
```

**Function:** Supports horizontal scrolling only.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Vertical

```cangjie
Vertical
```

**Function:** Supports vertical scrolling only.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ScrollDirection)

```cangjie
public operator func !=(other: ScrollDirection): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ScrollDirection](#enum-scrolldirection) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(ScrollDirection)

```cangjie
public operator func ==(other: ScrollDirection): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ScrollDirection](#enum-scrolldirection) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |## enum ScrollSource

```cangjie
public enum ScrollSource <: Equatable<ScrollSource> {
    | DRAG
    | FLING
    | EDGE_EFFECT
    | OTHER_USER_INPUT
    | SCROLL_BAR
    | SCROLL_BAR_FLING
    | SCROLLER
    | SCROLLER_ANIMATION
    | ...
}
```

**Function:** Source of scroll operations.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ScrollSource>

### DRAG

```cangjie
DRAG
```

**Function:** Drag event.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### EDGE_EFFECT

```cangjie
EDGE_EFFECT
```

**Function:** Edge scrolling effect of EdgeEffect.Spring.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### FLING

```cangjie
FLING
```

**Function:** Inertial scrolling after drag ends.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### OTHER_USER_INPUT

```cangjie
OTHER_USER_INPUT
```

**Function:** Other user inputs besides dragging, such as mouse wheel, keyboard events, etc.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SCROLLER

```cangjie
SCROLLER
```

**Function:** Non-animated methods of Scroller.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SCROLLER_ANIMATION

```cangjie
SCROLLER_ANIMATION
```

**Function:** Animated methods of Scroller.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SCROLL_BAR

```cangjie
SCROLL_BAR
```

**Function:** Scrollbar drag event.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SCROLL_BAR_FLING

```cangjie
SCROLL_BAR_FLING
```

**Function:** Velocity-based inertial scrolling after scrollbar drag ends.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ScrollSource)

```cangjie
public operator func !=(other: ScrollSource): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ScrollSource](#enum-scrollsource)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ScrollSource)

```cangjie
public operator func ==(other: ScrollSource): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ScrollSource](#enum-scrollsource)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum ScrollState

```cangjie
public enum ScrollState <: Equatable<ScrollState> {
    | Idle
    | Scrolling
    | Fling
    | ...
}
```

**Function:** Sets the current scrolling state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ScrollState>

### Fling

```cangjie
Fling
```

**Function:** Inertial scrolling state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Idle

```cangjie
Idle
```

**Function:** Non-scrolling state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Scrolling

```cangjie
Scrolling
```

**Function:** Finger dragging state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ScrollState)

```cangjie
public operator func !=(other: ScrollState): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ScrollState](#enum-scrollstate)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ScrollState)

```cangjie
public operator func ==(other: ScrollState): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ScrollState](#enum-scrollstate)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int32|The value of the enum.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the enum.|

## enum ShadowStyle

```cangjie
public enum ShadowStyle <: Equatable<ShadowStyle> {
    | OuterDefaultXS
    | OuterDefaultSM
    | OuterDefaultMD
    | OuterDefaultLG
    | OuterFloatingSM
    | OuterFloatingMD
    | ...
}
```

**Function:** Shadow style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ShadowStyle>

### OuterDefaultLG

```cangjie
OuterDefaultLG
```

**Function:** Large shadow.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### OuterDefaultMD

```cangjie
OuterDefaultMD
```

**Function:** Medium shadow.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### OuterDefaultSM

```cangjie
OuterDefaultSM
```

**Function:** Small shadow.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### OuterDefaultXS

```cangjie
OuterDefaultXS
```

**Function:** Extra small shadow.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### OuterFloatingMD

```cangjie
OuterFloatingMD
```

**Function:** Floating medium shadow.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### OuterFloatingSM

```cangjie
OuterFloatingSM
```

**Function:** Floating small shadow.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ShadowStyle)

```cangjie
public operator func !=(other: ShadowStyle): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ShadowStyle](#enum-shadowstyle)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ShadowStyle)

```cangjie
public operator func ==(other: ShadowStyle): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ShadowStyle](#enum-shadowstyle)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|## enum ShadowType

```cangjie
public enum ShadowType <: Equatable<ShadowType> {
    | Color
    | Blur
    | ...
}
```

**Function:** Shadow type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ShadowType>

### Blur

```cangjie
Blur
```

**Function:** Blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Color

```cangjie
Color
```

**Function:** Color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ShadowType)

```cangjie
public operator func !=(other: ShadowType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ShadowType](#enum-shadowtype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ShadowType)

```cangjie
public operator func ==(other: ShadowType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ShadowType](#enum-shadowtype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum SharedTransitionEffectType

```cangjie
public enum SharedTransitionEffectType <: Equatable<SharedTransitionEffectType> {
    | Static
    | Exchange
    | ...
}
```

**Function:** Shared element transition animation type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<SharedTransitionEffectType>

### Exchange

```cangjie
Exchange
```

**Function:** Moves the source page element to the target page element position with appropriate scaling.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Static

```cangjie
Static
```

**Function:** The position of the target page element remains unchanged, and opacity animation can be configured. Currently, only static effects configured for redirecting to the target page will take effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(SharedTransitionEffectType)

```cangjie
public operator func !=(other: SharedTransitionEffectType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SharedTransitionEffectType](#enum-sharedtransitioneffecttype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(SharedTransitionEffectType)

```cangjie
public operator func ==(other: SharedTransitionEffectType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SharedTransitionEffectType](#enum-sharedtransitioneffecttype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum SideBarContainerType

```cangjie
public enum SideBarContainerType <: Equatable<SideBarContainerType> {
    | Embed
    | Overlay
    | Auto
    | ...
}
```

**Function:** Enumeration for sidebar style within the container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<SideBarContainerType>

### Auto

```cangjie
Auto
```

**Function:** When the component size is greater than or equal to [minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength) + [minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength), the Embed mode is used for display.

When the component size is less than [minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength) + [minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength), the Overlay mode is used for display. contagrid

If [minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength) or [minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength) is not set, the default values of the unset interfaces will be used for calculation. If the calculated value is less than 600vp, 600vp will be used as the breakpoint value for mode switching.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Embed

```cangjie
Embed
```

**Function:** The sidebar is embedded within the component and displayed side by side with the content area.

When the component size is less than [minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength) + [minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength) and [showSideBar](./cj-grid-layout-sidebar.md#func-showsidebarbool) is not set, the sidebar is automatically hidden.

If [minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength) or [minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength) is not set, the default values of the unset interfaces will be used for calculation.

After the component automatically hides the sidebar, if the sidebar is summoned by clicking the control button, it will be displayed floating above the content area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Overlay

```cangjie
Overlay
```

**Function:** The sidebar floats above the content area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(SideBarContainerType)

```cangjie
public operator func !=(other: SideBarContainerType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SideBarContainerType](#enum-sidebarcontainertype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(SideBarContainerType)

```cangjie
public operator func ==(other: SideBarContainerType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SideBarContainerType](#enum-sidebarcontainertype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum SideBarPosition

```cangjie
public enum SideBarPosition <: Equatable<SideBarPosition> {
    | Start
    | End
    | ...
}
```

**Function:** Sets the display position of the sidebar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<SideBarPosition>

### End

```cangjie
End
```

**Function:** The sidebar is positioned on the right side of the container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Function:** The sidebar is positioned on the left side of the container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(SideBarPosition)

```cangjie
public operator func !=(other: SideBarPosition): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SideBarPosition](#enum-sidebarposition)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(SideBarPosition)

```cangjie
public operator func ==(other: SideBarPosition): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SideBarPosition](#enum-sidebarposition)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

## enum SourceTool

```cangjie
public enum SourceTool <: Equatable<SourceTool> {
    | Unknown
    | Finger
    | Pen
    | Mouse
    | Touchpad
    | Joystick
    | ...
}
```

**Function:** Event input source.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<SourceTool>

### Finger

```cangjie
Finger
```

**Function:** Finger input.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Joystick

```cangjie
Joystick
```

**Function:** Joystick input.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Mouse

```cangjie
Mouse
```

**Function:** Mouse input.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Pen

```cangjie
Pen
```

**Function:** Stylus input.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Touchpad

```cangjie
Touchpad
```

**Function:** Touchpad input. Single-finger input on the touchpad is treated as a mouse input operation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Function:** Unknown input source.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(SourceTool)

```cangjie
public operator func !=(other: SourceTool): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SourceTool](#enum-sourcetool)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(SourceTool)

```cangjie
public operator func ==(other: SourceTool): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SourceTool](#enum-sourcetool)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|## enum SourceType

```cangjie
public enum SourceType <: Equatable<SourceType> {
    | Unknown
    | Mouse
    | TouchScreen
    | ...
}
```

**Function:** Event input device  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Parent Type:**  

- Equatable\<SourceType>  

### Mouse  

```cangjie
Mouse  
```

**Function:** Mouse  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### TouchScreen  

```cangjie
TouchScreen  
```

**Function:** Touchscreen  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### Unknown  

```cangjie
Unknown  
```

**Function:** Unknown device  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### func !=(SourceType)  

```cangjie
public operator func !=(other: SourceType): Bool  
```

**Function:** Determines whether two enum values are unequal.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [SourceType](#enum-sourcetype) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are unequal, otherwise returns `false`. |  

### func ==(SourceType)  

```cangjie
public operator func ==(other: SourceType): Bool  
```

**Function:** Determines whether two enum values are equal.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [SourceType](#enum-sourcetype) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |  

### func toString()  

```cangjie
public func toString(): String  
```

**Function:** Gets the string representation of the current enum.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The string representation of the enum. |  

## enum StickyStyle  

```cangjie
public enum StickyStyle <: Equatable<StickyStyle> {
    | None
    | Header
    | Footer
    | Both
    | ...
}
```

**Function:** Sets whether the header and footer in ListItemGroup should stick to the top or bottom.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Parent Type:**  

- Equatable\<StickyStyle>  

### Both  

```cangjie
Both  
```

**Function:** Sets the header of ListItemGroup to stick to the top and the footer to stick to the bottom.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### Footer  

```cangjie
Footer  
```

**Function:** Sets the footer of ListItemGroup to stick to the bottom.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### Header  

```cangjie
Header  
```

**Function:** Sets the header of ListItemGroup to stick to the top.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### None  

```cangjie
None  
```

**Function:** Sets the header of ListItemGroup not to stick to the top and the footer not to stick to the bottom.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### func !=(StickyStyle)  

```cangjie
public operator func !=(other: StickyStyle): Bool  
```

**Function:** Determines whether two enum values are unequal.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [StickyStyle](#enum-stickystyle) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are unequal, otherwise returns `false`. |  

### func ==(StickyStyle)  

```cangjie
public operator func ==(other: StickyStyle): Bool  
```

**Function:** Determines whether two enum values are equal.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [StickyStyle](#enum-stickystyle) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |  

### func getValue()  

```cangjie
public func getValue(): Int32  
```

**Function:** Gets the value of the enum.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | The value of the enum. |  

## enum SwipeEdgeEffect  

```cangjie
public enum SwipeEdgeEffect <: Equatable<SwipeEdgeEffect> {
    | Spring
    | None
    | ...
}
```

**Function:** Swipe effect for ListItem.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Parent Type:**  

- Equatable\<SwipeEdgeEffect>  

### None  

```cangjie
None  
```

**Function:** The swipe distance of ListItem cannot exceed the size of the swiped-out component.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### Spring  

```cangjie
Spring  
```

**Function:** The swipe distance of ListItem can exceed the size of the swiped-out component and will rebound according to the spring damping curve upon release.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### func !=(SwipeEdgeEffect)  

```cangjie
public operator func !=(other: SwipeEdgeEffect): Bool  
```

**Function:** Determines whether two enum values are unequal.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [SwipeEdgeEffect](#enum-swipeedgeeffect) | Yes | - | The enum value to compare. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are unequal, otherwise returns `false`. |  

### func ==(SwipeEdgeEffect)  

```cangjie
public operator func ==(other: SwipeEdgeEffect): Bool  
```

**Function:** Determines whether two enum values are equal.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [SwipeEdgeEffect](#enum-swipeedgeeffect) | Yes | - | The enum value to compare. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |  

### func getValue()  

```cangjie
public func getValue(): Int32  
```

**Function:** Gets the value represented by the current enum.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | The value represented by the current enum. |  

## enum TextAlign  

```cangjie
public enum TextAlign <: Equatable<TextAlign> {
    | Start
    | Center
    | End
    | ...
}
```

**Function:** Text alignment.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Parent Type:**  

- Equatable\<TextAlign>  

### Center  

```cangjie
Center  
```

**Function:** Horizontally center-aligned.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### End  

```cangjie
End  
```

**Function:** Horizontally end-aligned.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### Start  

```cangjie
Start  
```

**Function:** Horizontally start-aligned.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

### func !=(TextAlign)  

```cangjie
public operator func !=(other: TextAlign): Bool  
```

**Function:** Determines whether two enum values are unequal.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [TextAlign](#enum-textalign) | Yes | - | The enum value to compare. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are unequal, otherwise returns `false`. |  

### func ==(TextAlign)  

```cangjie
public operator func ==(other: TextAlign): Bool  
```

**Function:** Determines whether two enum values are equal.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [TextAlign](#enum-textalign) | Yes | - | The enum value to compare. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |  

### func getValue()  

```cangjie
public func getValue(): Int32  
```

**Function:** Gets the value represented by the current enum.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | The value represented by the current enum. |## enum TextAlignStyle

```cangjie
public enum TextAlignStyle <: Equatable<TextAlignStyle> {
    | Left
    | Right
    | Center
    | Justify
    | Start
    | End
    | ...
}
```

**Function:** Text alignment type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TextAlignStyle>

### Center

```cangjie
Center
```

**Function:** Center-aligned text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### End

```cangjie
End
```

**Function:** Aligns text to the end of the boundary line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Justify

```cangjie
Justify
```

**Function:** Justified text alignment.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Left

```cangjie
Left
```

**Function:** Left-aligned text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Right

```cangjie
Right
```

**Function:** Right-aligned text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Function:** Aligns text to the start of the boundary line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TextAlignStyle)

```cangjie
public operator func !=(other: TextAlignStyle): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TextAlignStyle](#enum-textalignstyle) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(TextAlignStyle)

```cangjie
public operator func ==(other: TextAlignStyle): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TextAlignStyle](#enum-textalignstyle) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the value represented by the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The value represented by the current enum. |

## enum TextBaseline

```cangjie
public enum TextBaseline <: Equatable<TextBaseline> {
    | Alphabetic
    | Ideographic
    | Top
    | Bottom
    | Middle
    | Hanging
    | ...
}
```

**Function:** Sets the horizontal alignment method in text rendering.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TextBaseline>

### Alphabetic

```cangjie
Alphabetic
```

**Function:** The text baseline is the standard alphabetic baseline.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Bottom

```cangjie
Bottom
```

**Function:** The text baseline is at the bottom of the text block. The difference from the ideographic baseline is that the ideographic baseline does not need to consider descender letters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Hanging

```cangjie
Hanging
```

**Function:** The text baseline is the hanging baseline.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Ideographic

```cangjie
Ideographic
```

**Function:** The text baseline is the ideographic baseline; if the character itself extends beyond the alphabetic baseline, the ideographic baseline position is at the bottom of the character itself.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Middle

```cangjie
Middle
```

**Function:** The text baseline is in the middle of the text block.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Top

```cangjie
Top
```

**Function:** The text baseline is at the top of the text block.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TextBaseline)

```cangjie
public operator func !=(other: TextBaseline): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TextBaseline](#enum-textbaseline) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(TextBaseline)

```cangjie
public operator func ==(other: TextBaseline): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TextBaseline](#enum-textbaseline) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

## enum TextCase

```cangjie
public enum TextCase <: Equatable<TextCase> {
    | Normal
    | LowerCase
    | UpperCase
    | ...
}
```

**Function:** Text case format.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TextCase>

### LowerCase

```cangjie
LowerCase
```

**Function:** Text is displayed in all lowercase.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Normal

```cangjie
Normal
```

**Function:** Preserves the original text case.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### UpperCase

```cangjie
UpperCase
```

**Function:** Text is displayed in all uppercase.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TextCase)

```cangjie
public operator func !=(other: TextCase): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TextCase](#enum-textcase) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(TextCase)

```cangjie
public operator func ==(other: TextCase): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TextCase](#enum-textcase) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the value represented by the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The value represented by the current enum. |## enum TextContentStyle

```cangjie
public enum TextContentStyle <: Equatable<TextContentStyle> {
    | DEFAULT
    | INLINE
    | ...
}
```

**Function:** Polymorphic styles for text boxes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TextContentStyle>

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Default style with cursor width of 1.5vp. Cursor height is related to text selection background height and font size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### INLINE

```cangjie
INLINE
```

**Function:** Inline input style. The text selection background height matches the input box height.
Inline input is used in scenarios with clear edit/non-edit state distinctions, such as renaming in file list views.
The showError property is not supported.
Text dragging is not supported in inline mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TextContentStyle)

```cangjie
public operator func !=(other: TextContentStyle): Bool
```

**Function:** Determines whether two enum values are unequal

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextContentStyle](#enum-textcontentstyle) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if enum values are unequal, otherwise false. |

### func ==(TextContentStyle)

```cangjie
public operator func ==(other: TextContentStyle): Bool
```

**Function:** Determines whether two enum values are equal

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextContentStyle](#enum-textcontentstyle) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if enum values are equal, otherwise false. |

## enum TextDecorationStyle

```cangjie
public enum TextDecorationStyle <: Equatable<TextDecorationStyle> {
    | SOLID
    | DOUBLE
    | DOTTED
    | DASHED
    | WAVY
    | ...
}
```

**Function:** Sets text decoration line styles.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TextDecorationStyle>

### DASHED

```cangjie
DASHED
```

**Function:** Dashed line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### DOTTED

```cangjie
DOTTED
```

**Function:** Dotted line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### DOUBLE

```cangjie
DOUBLE
```

**Function:** Double solid line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SOLID

```cangjie
SOLID
```

**Function:** Single solid line (default).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### WAVY

```cangjie
WAVY
```

**Function:** Wavy line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TextDecorationStyle)

```cangjie
public operator func !=(other: TextDecorationStyle): Bool
```

**Function:** Determines whether two enum values are unequal

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextDecorationStyle](#enum-textdecorationstyle) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if enum values are unequal, otherwise false. |

### func ==(TextDecorationStyle)

```cangjie
public operator func ==(other: TextDecorationStyle): Bool
```

**Function:** Determines whether two enum values are equal

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextDecorationStyle](#enum-textdecorationstyle) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if enum values are equal, otherwise false. |

## enum TextDecorationType

```cangjie
public enum TextDecorationType <: Equatable<TextDecorationType> {
    | None
    | Underline
    | Overline
    | LineThrough
    | ...
}
```

**Function:** Enumeration of decoration line types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TextDecorationType>

### LineThrough

```cangjie
LineThrough
```

**Function:** Decoration line through text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** No text decoration line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Overline

```cangjie
Overline
```

**Function:** Overline text decoration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Underline

```cangjie
Underline
```

**Function:** Underline text decoration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TextDecorationType)

```cangjie
public operator func !=(other: TextDecorationType): Bool
```

**Function:** Determines whether two enum values are unequal

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextDecorationType](#enum-textdecorationtype) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if enum values are unequal, otherwise false. |

### func ==(TextDecorationType)

```cangjie
public operator func ==(other: TextDecorationType): Bool
```

**Function:** Determines whether two enum values are equal

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextDecorationType](#enum-textdecorationtype) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if enum values are equal, otherwise false. |

## enum TextHeightAdaptivePolicy

```cangjie
public enum TextHeightAdaptivePolicy <: Equatable<TextHeightAdaptivePolicy> {
    | MAX_LINES_FIRST
    | MIN_FONT_SIZE_FIRST
    | LAYOUT_CONSTRAINT_FIRST
    | ...
}
```

**Function:** Sets text height adaptation methods.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TextHeightAdaptivePolicy>

### LAYOUT_CONSTRAINT_FIRST

```cangjie
LAYOUT_CONSTRAINT_FIRST
```

**Function:** Sets text height adaptation method to prioritize layout constraints (height).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### MAX_LINES_FIRST

```cangjie
MAX_LINES_FIRST
```

**Function:** Sets text height adaptation method to prioritize MaxLines.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### MIN_FONT_SIZE_FIRST

```cangjie
MIN_FONT_SIZE_FIRST
```

**Function:** Sets text height adaptation method to prioritize font size reduction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TextHeightAdaptivePolicy)

```cangjie
public operator func !=(other: TextHeightAdaptivePolicy): Bool
```

**Function:** Determines whether two enum values are unequal

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextHeightAdaptivePolicy](#enum-textheightadaptivepolicy) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if enum values are unequal, otherwise false. |

### func ==(TextHeightAdaptivePolicy)

```cangjie
public operator func ==(other: TextHeightAdaptivePolicy): Bool
```

**Function:** Determines whether two enum values are equal

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextHeightAdaptivePolicy](#enum-textheightadaptivepolicy) | Yes | - | Enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if enum values are equal, otherwise false. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the value represented by the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The value represented by the current enum. |## enum TextOverflow

```cangjie
public enum TextOverflow <: Equatable<TextOverflow> {
    | Clip
    | Ellipsis
    | None
    | ...
}
```

**Description:** Display method when text overflows.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TextOverflow>

### Clip

```cangjie
Clip
```

**Description:** Truncates text at the maximum line when it overflows.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Ellipsis

```cangjie
Ellipsis
```

**Description:** Replaces overflowing text with ellipsis when it cannot be fully displayed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Description:** Truncates text at the maximum line when it overflows.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TextOverflow)

```cangjie
public operator func !=(other: TextOverflow): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextOverflow](#enum-textoverflow) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(TextOverflow)

```cangjie
public operator func ==(other: TextOverflow): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TextOverflow](#enum-textoverflow) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Description:** Gets the value represented by the current enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The value represented by the current enum. |

## enum ThemeColorMode

```cangjie
public enum ThemeColorMode <: Equatable<ThemeColorMode> {
    | System
    | Light
    | Dark
    | ...
}
```

**Description:** Theme color mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ThemeColorMode>

### Dark

```cangjie
Dark
```

**Description:** Fixed dark mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Light

```cangjie
Light
```

**Description:** Fixed light mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### System

```cangjie
System
```

**Description:** Follows the system's dark/light mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ThemeColorMode)

```cangjie
public operator func !=(other: ThemeColorMode): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ThemeColorMode](#enum-themecolormode) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(ThemeColorMode)

```cangjie
public operator func ==(other: ThemeColorMode): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ThemeColorMode](#enum-themecolormode) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

## enum TitleHeight

```cangjie
public enum TitleHeight <: Equatable<TitleHeight> {
    | MainOnly
    | MainWithSub
    | ...
}
```

**Description:** Sets the title bar height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TitleHeight>

### MainOnly

```cangjie
MainOnly
```

**Description:** Recommended height for title bar with only main title (56vp).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### MainWithSub

```cangjie
MainWithSub
```

**Description:** Recommended height for title bar with both main and sub titles (82vp).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TitleHeight)

```cangjie
public operator func !=(other: TitleHeight): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TitleHeight](#enum-titleheight) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(TitleHeight)

```cangjie
public operator func ==(other: TitleHeight): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TitleHeight](#enum-titleheight) | Yes | - | The enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

## enum TouchType

```cangjie
public enum TouchType <: Equatable<TouchType> {
    | Down
    | Up
    | Move
    | Cancel
    | Unknown
    | ...
}
```

**Description:** Touch trigger method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TouchType>

### Cancel

```cangjie
Cancel
```

**Description:** Triggered when a touch event is canceled.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Down

```cangjie
Down
```

**Description:** Triggered when a finger is pressed down.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Move

```cangjie
Move
```

**Description:** Triggered when a finger moves on the screen while pressed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Description:** Triggered for unknown touch operations.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Up

```cangjie
Up
```

**Description:** Triggered when a finger is lifted.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TouchType)

```cangjie
public operator func !=(other: TouchType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TouchType](#enum-touchtype) | Yes | - | Another enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false |

### func ==(TouchType)

```cangjie
public operator func ==(other: TouchType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [TouchType](#enum-touchtype) | Yes | - | Another enum value to compare |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): UInt8
```

**Description:** Gets the enum type value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt8 | The enum type value. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Converts the enum type value to a string type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string type corresponding to the enum value. |## enum VerticalAlign

```cangjie
public enum VerticalAlign <: Equatable<VerticalAlign> {
    | Top
    | Center
    | Bottom
    | ...
}
```

**Function:** Vertical alignment method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<VerticalAlign>

### Bottom

```cangjie
Bottom
```

**Function:** Bottom alignment.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Center

```cangjie
Center
```

**Function:** Center alignment (default alignment method).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Top

```cangjie
Top
```

**Function:** Top alignment.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(VerticalAlign)

```cangjie
public operator func !=(other: VerticalAlign): Bool
```

**Function:** Determines whether two enumeration values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[VerticalAlign](#enum-verticalalign)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are unequal, otherwise returns false.|

### func ==(VerticalAlign)

```cangjie
public operator func ==(other: VerticalAlign): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[VerticalAlign](#enum-verticalalign)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

## enum Visibility

```cangjie
public enum Visibility <: Equatable<Visibility> {
    | Visible
    | Hidden
    | None
    | ...
}
```

**Function:** Controls whether the current component is displayed or hidden.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<Visibility>

### Hidden

```cangjie
Hidden
```

**Function:** Hidden but still occupies layout space.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### None

```cangjie
None
```

**Function:** Hidden and does not occupy layout space.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Visible

```cangjie
Visible
```

**Function:** Displayed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(Visibility)

```cangjie
public operator func !=(other: Visibility): Bool
```

**Function:** Determines whether two enumeration values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[Visibility](#enum-visibility)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are unequal, otherwise returns false.|

### func ==(Visibility)

```cangjie
public operator func ==(other: Visibility): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[Visibility](#enum-visibility)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

## enum WebDarkMode

```cangjie
public enum WebDarkMode <: Equatable<WebDarkMode> {
    | Off
    | On
    | Auto
    | ...
}
```

**Function:** Web dark mode (disabled by default).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<WebDarkMode>

### Auto

```cangjie
Auto
```

**Function:** Web dark mode follows system settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Off

```cangjie
Off
```

**Function:** Web dark mode is disabled.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### On

```cangjie
On
```

**Function:** Web dark mode is enabled.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(WebDarkMode)

```cangjie
public operator func !=(other: WebDarkMode): Bool
```

**Function:** Determines whether two enumeration values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[WebDarkMode](#enum-webdarkmode)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are unequal, otherwise returns false.|

### func ==(WebDarkMode)

```cangjie
public operator func ==(other: WebDarkMode): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[WebDarkMode](#enum-webdarkmode)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

## enum WordBreak

```cangjie
public enum WordBreak <: Equatable<WordBreak> {
    | Normal
    | BreakAll
    | BreakWord
    | ...
}
```

**Function:** Sets text line-breaking rules.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<WordBreak>

### BreakAll

```cangjie
BreakAll
```

**Function:** For Non-CJK text, line breaks can occur between any two characters. For CJK text, the effect is the same as NORMAL.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### BreakWord

```cangjie
BreakWord
```

**Function:** Similar to BREAKALL, for Non-CJK text, line breaks can occur between any two characters. When there are break points (such as whitespace) in a line of text, priority is given to breaking at these points to ensure words remain intact. If no break points exist in a line, breaks occur between any two characters. For CJK text, the effect is the same as NORMAL.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Normal

```cangjie
Normal
```

**Function:** CJK (Chinese, Japanese, Korean) text can break between any two characters, while Non-CJK text (such as English) can only break at whitespace.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(WordBreak)

```cangjie
public operator func !=(other: WordBreak): Bool
```

**Function:** Determines whether two enumeration values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[WordBreak](#enum-wordbreak)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are unequal, otherwise returns false.|

### func ==(WordBreak)

```cangjie
public operator func ==(other: WordBreak): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[WordBreak](#enum-wordbreak)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the integer value of the enumeration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int32|Returns the integer value of the enumeration.|## type CustomBuilder

```cangjie
public type CustomBuilder =() -> Unit
```

**Function:** [CustomBuilder](#type-custombuilder) is a type alias for [() -> Unit](#).

## type TransitionFinishCallback

```cangjie
public type TransitionFinishCallback =(Bool) -> Unit
```

**Function:** [TransitionFinishCallback](#type-transitionfinishcallback) is a type alias for [(Bool) -> Unit](#).