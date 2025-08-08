# Basic Type Definitions

## Import Module

```cangjie
import kit.UIKit.*
```

## interface Length

```cangjie
public interface Length
```

**Function:** Float64, Int64, and AppResource all implement the Length interface type.

**Initial Version:** 12

## interface ResourceColor

```cangjie
public interface ResourceColor
```

**Function:** Color, UInt32, Int64, and AppResource all implement the ResourceColor interface type.

**Initial Version:** 12

## interface ResourceStr

```cangjie
public interface ResourceStr
```

**Function:** String and AppResource both implement the ResourceStr interface type.

**Initial Version:** 12

## class Color

```cangjie
public class Color <: ResourceColor {
    public static let BLACK: Color = Color(0xff000000)
    public static let BLUE: Color = Color(0xff0000ff)
    public static let BROWN: Color = Color(0xffa52a2a)
    public static let GRAY: Color = Color(0xff808080)
    public static let GREY: Color = Color(0xff808080)
    public static let GREEN: Color = Color(0xff008000)
    public static let ORANGE: Color = Color(0xffffa500)
    public static let PINK: Color = Color(0xffffc0cb)
    public static let RED: Color = Color(0xffff0000)
    public static let WHITE: Color = Color(0xffffffff)
    public static let YELLOW: Color = Color(0xffffff00)
    public static let TRANSPARENT: Color = Color(0, 0, 0, alpha: 0.0)
    public static let FOREGROUND: Color = Color(0x00000001)
    public init(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = 1.0)
    public init(value: UInt32)
}
```

**Function:** Color type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parent Type:**

- [ResourceColor](#interface-resourcecolor)

### static let BLACK

```cangjie
public static let BLACK: Color = Color(0xff000000)
```

**Function:** Black color.

**Type:** [Color](#class-color)

**Initial Version:** 12

### static let BLUE

```cangjie
public static let BLUE: Color = Color(0xff0000ff)
```

**Function:** Blue color.

**Type:** [Color](#class-color)

**Initial Version:** 19

### static let BROWN

```cangjie
public static let BROWN: Color = Color(0xffa52a2a)
```

**Function:** Brown color.

**Type:** [Color](#class-color)

**Initial Version:** 19

### static let FOREGROUND

```cangjie
public static let FOREGROUND: Color = Color(0x00000001)
```

**Function:** Foreground color.

**Type:** [Color](#class-color)

**Initial Version:** 12

### static let GRAY

```cangjie
public static let GRAY: Color = Color(0xff808080)
```

**Function:** Gray color.

**Type:** [Color](#class-color)

**Initial Version:** 12

### static let GREEN

```cangjie
public static let GREEN: Color = Color(0xff008000)
```

**Function:** Green color.

**Type:** [Color](#class-color)

**Initial Version:** 19

### static let GREY

```cangjie
public static let GREY: Color = Color(0xff808080)
```

**Function:** Gray color.

**Type:** [Color](#class-color)

**Initial Version:** 12

### static let ORANGE

```cangjie
public static let ORANGE: Color = Color(0xffffa500)
```

**Function:** Orange color.

**Type:** [Color](#class-color)

**Initial Version:** 19

### static let PINK

```cangjie
public static let PINK: Color = Color(0xffffc0cb)
```

**Function:** Pink color.

**Type:** [Color](#class-color)

**Initial Version:** 12

### static let RED

```cangjie
public static let RED: Color = Color(0xffff0000)
```

**Function:** Red color.

**Type:** [Color](#class-color)

**Initial Version:** 12

### static let TRANSPARENT

```cangjie
public static let TRANSPARENT: Color = Color(0, 0, 0, alpha: 0.0)
```

**Function:** Transparent color.

**Type:** [Color](#class-color)

**Initial Version:** 19

### static let WHITE

```cangjie
public static let WHITE: Color = Color(0xffffffff)
```

**Function:** White color.

**Type:** [Color](#class-color)

**Initial Version:** 19

### static let YELLOW

```cangjie
public static let YELLOW: Color = Color(0xffffff00)
```

**Function:** Yellow color.

**Type:** [Color](#class-color)

**Initial Version:** 12

### init(UInt8, UInt8, UInt8, Float32)

```cangjie
public init(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = 1.0)
```

**Function:** Constructs a Color type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| red | UInt8 | Yes | - | Red channel value in RGB. |
| green | UInt8 | Yes | - | Green channel value in RGB. |
| blue | UInt8 | Yes | - | Blue channel value in RGB. |
| alpha | Float32 | No | 1.0 | **Named parameter.** Alpha channel value, range [0.0, 1.0]. |

### init(UInt32)

```cangjie
public init(value: UInt32)
```

**Function:** Constructs a Color type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | UInt32 | Yes | - | UInt32 color value. The alpha, R, G, B channels occupy 8 bits each in sequence. If only R, G, B channels are input, the alpha channel defaults to 0xff. |

### static func alphaAdapt(UInt32)

```cangjie
public static func alphaAdapt(origin: UInt32): UInt32
```

**Function:** Adjusts the alpha channel of a color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| origin | UInt32 | Yes | - | UInt32 color value. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | UInt32 color value after alpha channel adjustment. |

### func toUInt32()

```cangjie
public func toUInt32(): UInt32
```

**Function:** Converts to UInt32 color value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Uint32 color value. |

## class Fonts

```cangjie
public class Fonts {
    public var size: Length
    public var weight: FontWeight
    public var family: String
    public var style: FontStyle
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal)
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: AppResource,
        style!: FontStyle = FontStyle.Normal)
}
```

**Function:** Text style configuration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### var family

```cangjie
public var family: String
```

**Function:** Sets the font family list for text.

**Type:** String

**Readable/Writable:** Readable and Writable

**Since:** 12

### var size

```cangjie
public var size: Length
```

**Function:** Sets text size using fp units.

**Type:** [Length](./cj-common-types.md#interface-length)

**Readable/Writable:** Readable and Writable

**Since:** 12

### var style

```cangjie
public var style: FontStyle
```

**Function:** Sets the font style for text.

**Type:** [FontStyle](./cj-common-types.md#enum-fontstyle)

**Readable/Writable:** Readable and Writable

**Since:** 12

### var weight

```cangjie
public var weight: FontWeight
```

**Function:** Sets the font weight for text.

**Type:** [FontWeight](./cj-common-types.md#enum-fontweight)

**Readable/Writable:** Readable and Writable

**Since:** 12

### init(Length, FontWeight, String, FontStyle)

```cangjie
public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: String = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal)
```

**Function:** Constructs a Fonts object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| size | [Length](./cj-common-types.md#interface-length) | No | 16.fp | **Named parameter.** Sets text size. When Length is Int64 or Float64, fp units are used. Percentage settings are not supported. |
| weight | [FontWeight](./cj-common-types.md#enum-fontweight) | No | FontWeight.Normal | **Named parameter.** Sets the font weight for text. |
| family | String | No | "HarmonyOS Sans" | **Named parameter.** Sets the font family list for text. Multiple fonts can be specified, separated by commas, with priority given in order. Example: 'Arial, HarmonyOS Sans'. Currently supports 'HarmonyOS Sans' font. |
| style | [FontStyle](./cj-common-types.md#enum-fontstyle) | No | FontStyle.Normal | **Named parameter.** Sets the font style for text. |

### init(Length, FontWeight, AppResource, FontStyle)

```cangjie
public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: AppResource,
    style!: FontStyle = FontStyle.Normal)
```

**Function:** Constructs a Fonts object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| size | [Length](./cj-common-types.md#interface-length) | No | 16.fp | **Named parameter.** Sets text size. When Length is Int64 or Float64, fp units are used. Percentage settings are not supported. |
| weight | [FontWeight](./cj-common-types.md#enum-fontweight) | No | FontWeight.Normal | **Named parameter.** Sets the font weight for text. |
| family | [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource) | Yes | - | **Named parameter.** Sets the font family list for text. Multiple fonts can be specified, separated by commas, with priority given in order. Example: 'Arial, HarmonyOS Sans'. Currently supports 'HarmonyOS Sans' font. |
| style | [FontStyle](./cj-common-types.md#enum-fontstyle) | No | FontStyle.Normal | **Named parameter.** Sets the font style for text. |

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

**Function:** Defines a region position type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### var height

```cangjie
public var height: Length
```

**Function:** Height of the touch hotspot.

**Type:** [Length](#interface-length)

**Readable/Writable:** Readable and Writable

**Since:** 12

### var width

```cangjie
public var width: Length
```

**Function:** Width of the touch hotspot.

**Type:** [Length](#interface-length)

**Readable/Writable:** Readable and Writable

**Since:** 12

### var x

```cangjie
public var x: Length
```

**Function:** X-axis coordinate of the touch point relative to the top-left corner of the component.

**Type:** [Length](#interface-length)

**Readable/Writable:** Readable and Writable

**Since:** 12

### var y

```cangjie
public var y: Length
```

**Function:** Y-axis coordinate of the touch point relative to the top-left corner of the component.

**Type:** [Length](#interface-length)

**Readable/Writable:** Readable and Writable

**Since:** 12

### init(Length, Length, Length, Length)

```cangjie
public init(x!: Length = 0.vp, y!: Length = 0.vp, width!: Length = 100.percent, height!: Length = 100.percent)
```

**Function:** Constructs a Rectangle object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | [Length](#interface-length) | No | 0.vp | **Named parameter.** X-axis coordinate of the touch point relative to the top-left corner of the component. |
| y | [Length](#interface-length) | No | 0.vp | **Named parameter.** Y-axis coordinate of the touch point relative to the top-left corner of the component. |
| width | [Length](#interface-length) | No | 100.percent | **Named parameter.** Width of the touch hotspot. |
| height | [Length](#interface-length) | No | 100.percent | **Named parameter.** Height of the touch hotspot. |

## class RectResult

```cangjie
public class RectResult {
    public var x: Float64
    public var y: Float64
    public var width: Float64
    public var height: Float64
    public init(
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    )
}
```

**Function:** Position and dimension type, used to describe the position and size of a component. Obtained via scroller.getItemRect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### var height

```cangjie
public var height: Float64
```

**Function:** Height of the content.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**Since:** 12

### var width

```cangjie
public var width: Float64
```

**Function:** Width of the content.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**Since:** 12

### var x

```cangjie
public var x: Float64
```

**Function:** Horizontal coordinate.

**Readable/Writable:** Readable and Writable

**Since:** 12

### var y

```cangjie
public var y: Float64
```

**Function:** Vertical coordinate.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**Since:** 12### init(Float64, Float64, Float64, Float64)

```cangjie
public init(
    x: Float64,
    y: Float64,
    width: Float64,
    height: Float64
)
```

**Function:** Constructs a RectResult type object.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|x|Float64|Yes|-|Horizontal coordinate.|
|y|Float64|Yes|-|Vertical coordinate.|
|width|Float64|Yes|-|Content width.|
|height|Float64|Yes|-|Content height.|

## class AnimateParam

```cangjie
public class AnimateParam {
    public var duration: Option<Int32>
    public var tempo: Option<Float32>
    public var curve: Option<Curve>
    public var delay: Option<Int32>
    public var iterations: Option<Int32>
    public var playMode: Option<PlayMode>
    public var onFinish: Option <() -> Unit>
    public var finishCallbackType: Option<FinishCallbackType>
    public var expectedFrameRateRange: Option<ExpectedFrameRateRange>
    public init(
        duration!: Option<Int32> = 1000,
        tempo!: Option<Float32> = 1.0,
        curve!: Option<Curve> = Curve.EaseInOut,
        delay!: Option<Int32> = 0,
        iterations!: Option<Int32> = 1,
        playMode!: Option<PlayMode> = PlayMode.Normal,
        onFinish!: Option<() -> Unit> = Option.None,
        finishCallbackType!: Option<FinishCallbackType> = FinishCallbackType.REMOVED,
        expectedFrameRateRange!: Option<ExpectedFrameRateRange> = Option.None
    )
}
```

**Function:** Sets animation effect parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### var curve

```cangjie
public var curve: Option<Curve>
```

**Function:** Animation curve.

**Type:** Option\<[Curve](#enum-curve)>

**Access:** Read-write

**Since:** 12

### var delay

```cangjie
public var delay: Option<Int32>
```

**Function:** Animation delay time in milliseconds (ms). Default is no delay.

**Type:** Option\<Int32>

**Access:** Read-write

**Since:** 12

### var duration

```cangjie
public var duration: Option<Int32>
```

**Function:** Animation duration in milliseconds. Values less than 0 will be treated as 0.

**Type:** Option\<Int32>

**Access:** Read-write

**Since:** 12

### var expectedFrameRateRange

```cangjie
public var expectedFrameRateRange: Option<ExpectedFrameRateRange>
```

**Function:** Sets the expected frame rate for animation.

**Type:** Option\<ExpectedFrameRateRange>

**Access:** Read-write

**Since:** 12

### var finishCallbackType

```cangjie
public var finishCallbackType: Option<FinishCallbackType>
```

**Function:** Defines the type of onFinish callback in animation.

**Type:** Option\<[FinishCallbackType](#enum-finishcallbacktype)>

**Access:** Read-write

**Since:** 12

### var iterations

```cangjie
public var iterations: Option<Int32>
```

**Function:** Number of animation iterations. Default is 1. -1 indicates infinite playback. 0 means no animation effect.

**Type:** Option\<Int32>

**Access:** Read-write

**Since:** 12

### var onFinish

```cangjie
public var onFinish: Option <() -> Unit>
```

**Function:** Animation playback completion callback.

**Type:** Option\<()->Unit>

**Access:** Read-write

**Since:** 12

### var playMode

```cangjie
public var playMode: Option<PlayMode>
```

**Function:** Animation playback mode. Default is restarting from beginning after completion.

**Type:** Option\<[PlayMode](#enum-playmode)>

**Access:** Read-write

**Since:** 12

### var tempo

```cangjie
public var tempo: Option<Float32>
```

**Function:** Animation playback speed. Higher values play faster, lower values play slower. 0 means no animation effect.

**Type:** Option\<Float32>

**Access:** Read-write

**Since:** 12

### init(Option\<Int32>, Option\<Float32>, Option\<Curve>, Option\<Int32>, Option\<Int32>, Option\<PlayMode>, Option\<() -> Unit>, Option\<FinishCallbackType>, Option\<ExpectedFrameRateRange>)

```cangjie
public init(
    duration!: Option<Int32> = 1000,
    tempo!: Option<Float32> = 1.0,
    curve!: Option<Curve> = Curve.EaseInOut,
    delay!: Option<Int32> = 0,
    iterations!: Option<Int32> = 1,
    playMode!: Option<PlayMode> = PlayMode.Normal,
    onFinish!: Option<() -> Unit> = Option.None,
    finishCallbackType!: Option<FinishCallbackType> = FinishCallbackType.REMOVED,
    expectedFrameRateRange!: Option<ExpectedFrameRateRange> = Option.None
)
```

**Function:** Constructs an AnimateParam object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| duration | Option\<Int32> | No | 1000 | **Named parameter.** Animation duration in milliseconds. <br/> Values less than 0 will be treated as 0. |
| tempo | Option\<Float32> | No | 1.0 | **Named parameter.** Animation playback speed. Higher values play faster, lower values play slower. 0 means no animation effect. <br/> Values less than 0 will be treated as 1. |
| curve | Option\<Float32> | No | Curve.EaseInOut| **Named parameter.** Animation curve. <br/> Default: Curve.EaseInOut |
| delay | Option\<Int32> | No | 0 | **Named parameter.** Animation delay time in milliseconds (ms). Default is no delay.<br/> Range: (-∞, +∞) <br/> delay >= 0 indicates delayed playback, delay < 0 indicates advanced playback. |
| iterations | Option\<Int32> | No | 1 | **Named parameter.** Number of animation iterations. Default is 1. -1 indicates infinite playback. 0 means no animation effect. <br/> Not applicable to custom dialogs. |
| playMode | Option\<PlayMode> | No | PlayMode.Normal | **Named parameter.** Animation playback mode. Default is restarting from beginning after completion. <br/> Not applicable to custom dialogs. |
| onFinish | Option\<() -> Unit> | No | - | **Named parameter.** Animation playback completion callback. |
| finishCallbackType | Option\<[FinishCallbackType](#enum-finishcallbacktype)> | No | FinishCallbackType.REMOVED | **Named parameter.** Defines the type of onFinish callback in animation. |
| expectedFrameRateRange | Option\<ExpectedFrameRateRange> | No | - | **Named parameter.** Sets the expected frame rate for animation. |

## class Area

```cangjie
public class Area {
    public Area(
        public var width: Float64,
        public var height: Float64,
        public var position: Position,
        public var globalPosition: Position
    )
}
```

**Function:** Current target area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### var globalPosition

```cangjie
public var globalPosition: Position
```

**Function:** Defines the positional relationship between the top-left corner of the target element and the top-left corner of the screen.

**Type:** [Position](#class-position)

**Access:** Read-write

**Since:** 12

### var height

```cangjie
public var height: Float64
```

**Function:** Defines the height of the target element.

**Type:** Float64

**Access:** Read-write

**Since:** 12

### var position

```cangjie
public var position: Position
```

**Function:** Defines the relative position between the top-left corner of the target element and the top-left corner of its parent element.

**Type:** [Position](#class-position)

**Access:** Read-write

**Since:** 12

### var width

```cangjie
public var width: Float64
```

**Function:** Defines the width of the target element.

**Type:** Float64

**Access:** Read-write

**Since:** 12

### Area(Float64, Float64, Position, Position)

```cangjie
public Area(
    public var width: Float64,
    public var height: Float64,
    public var position: Position,
    public var globalPosition: Position
```
**Function:** Constructs an object of type Area.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| width | Float64 | Yes | - | Width of the target element, in vp units. |
| height | Float64 | Yes | - | Height of the target element, in vp units. |
| position | [Position](#class-position) | Yes | - | Position of the top-left corner of the target element relative to the top-left corner of the parent element. |
| globalPosition | [Position](#class-position) | Yes | - | Position of the top-left corner of the target element relative to the top-left corner of the page. |

## class BorderRadiuses

```cangjie
public class BorderRadiuses {
    public var topLeft: Length
    public var topRight: Length
    public var bottomLeft: Length
    public var bottomRight: Length
    public init(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp, bottomRight!: Length = 0.vp)
 }
```

**Function:** Border radius type, used to describe the corner radius of a component's border.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### var bottomLeft

```cangjie
public var bottomLeft: Length
```

**Function:** Bottom-left corner radius of the component.

**Type:** [Length](#interface-length)

**Access:** Read-write

**Since:** 12

### var bottomRight

```cangjie
public var bottomRight: Length
```

**Function:** Bottom-right corner radius of the component.

**Type:** [Length](#interface-length)

**Access:** Read-write

**Since:** 12

### var topLeft

```cangjie
public var topLeft: Length
```

**Function:** Top-left corner radius of the component.

**Type:** [Length](#interface-length)

**Access:** Read-write

**Since:** 12

### var topRight

```cangjie
public var topRight: Length
```

**Function:** Top-right corner radius of the component.

**Type:** [Length](#interface-length)

**Access:** Read-write

**Since:** 12

### init(Length, Length, Length, Length)

```cangjie
public init(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp, bottomRight!: Length = 0.vp)
```

**Function:** Initializes a BorderRadiuses object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| topLeft     | [Length](#interface-length) | No   | 0.vp   | **Named parameter.** Top-left corner radius of the component. |
| topRight    | [Length](#interface-length) | No   | 0.vp   | **Named parameter.** Top-right corner radius of the component. |
| bottomLeft  | [Length](#interface-length) | No   | 0.vp   | **Named parameter.** Bottom-left corner radius of the component. |
| bottomRight | [Length](#interface-length) | No   | 0.vp   | **Named parameter.** Bottom-right corner radius of the component. |

## struct CJEdge

```cangjie
public struct CJEdge {
    public init(topLength: Length, rightLength: Length, bottomLength: Length, leftLength: Length)
}
```

**Function:** Border length.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### init(Length, Length, Length, Length)

```cangjie
public init(topLength: Length, rightLength: Length, bottomLength: Length, leftLength: Length)
```

**Function:** Constructs border length.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| topLength | [Length](#interface-length) | Yes | - | Top border length. |
| rightLength | [Length](#interface-length) | Yes | - | Right border length. |
| bottomLength | [Length](#interface-length) | Yes | - | Bottom border length. |
| leftLength | [Length](#interface-length) | Yes | - | Left border length. |

## class DividerStyleOptions

```cangjie
public class DividerStyleOptions {
    public let strokeWidth: Length
    public let color: ResourceColor
    public let startMargin: Length
    public let endMargin: Length
    public init(strokeWidth: Length,color: ResourceColor,startMargin: Length,endMargin: Length)
}
```

**Function:** Divider style attribute collection, used to describe divider-related information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### let color

```cangjie
public let color: ResourceColor
```

**Function:** Color of the divider.

**Type:** [ResourceColor](./cj-common-types.md#interface-resourcecolor)

**Access:** Read-only

**Since:** 12

### let endMargin

```cangjie
public let endMargin: Length
```

**Function:** Distance between the divider and the end side of the menu.

**Type:** [Length](./cj-common-types.md#interface-length)

**Access:** Read-only

**Since:** 12

### let startMargin

```cangjie
public let startMargin: Length
```

**Function:** Distance between the divider and the start side of the menu.

**Type:** [Length](./cj-common-types.md#interface-length)

**Access:** Read-only

**Since:** 12

### let strokeWidth

```cangjie
public let strokeWidth: Length
```

**Function:** Line width of the divider.

**Type:** [Length](./cj-common-types.md#interface-length)

**Access:** Read-only

**Since:** 12

### init(Length, ResourceColor, Length, Length)

```cangjie
public init(strokeWidth: Length,color: ResourceColor,startMargin: Length,endMargin: Length
)
```

**Function:** Initializes a DividerStyleOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| strokeWidth | [Length](./cj-common-types.md#interface-length) | Yes | - | Line width of the divider. |
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | Color of the divider. |
| startMargin | [Length](./cj-common-types.md#interface-length) | Yes | - | Distance between the divider and the start side of the menu. |
| endMargin | [Length](./cj-common-types.md#interface-length) | Yes | - | Distance between the divider and the end side of the menu. |

## class EdgeColor

```cangjie
public class EdgeColor {
    public var top: Color
    public var right: Color
    public var bottom: Color
    public var left: Color
    public init(top!: Color = Color.BLACK, right!: Color = Color.BLACK, bottom!: Color = Color.BLACK, left!: Color = Color.BLACK)
}
```

**Function:** Border color, used to describe the color of a component's four borders.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### var top

```cangjie
public var top: Color
```

**Function:** Top border color of the component.

**Type:** [Color](#class-color)

**Access:** Read-write

**Since:** 12

### var right

```cangjie
public var right: Color
```

**Function:** Right border color of the component.

**Type:** [Color](#class-color)

**Access:** Read-write

**Since:** 12

### var bottom

```cangjie
public var bottom: Color
```

**Function:** Bottom border color of the component.

**Type:** [Color](#class-color)

**Access:** Read-write

**Since:** 12
### var left

```cangjie
public var left: Color
```

**Function:** The color of the component's left border.

**Type:** [Color](#class-color)

**Access:** Read-write

**Since:** Version 12

### init(Color, Color, Color, Color)

```cangjie
public init(top!: Color = Color.BLACK, right!: Color = Color.BLACK, bottom!: Color = Color.BLACK, left!: Color = Color.BLACK)
```

**Function:** Constructs an EdgeColor object.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Color](#class-color) | No | Color.BLACK | **Named parameter.** The color of the component's top border. |
| right | [Color](#class-color) | No | Color.BLACK | **Named parameter.** The color of the component's right border. |
| bottom | [Color](#class-color) | No | Color.BLACK | **Named parameter.** The color of the component's bottom border. |
| left | [Color](#class-color) | No | Color.BLACK | **Named parameter.** The color of the component's left border. |

## class EdgeStyles

```cangjie
public class EdgeStyles {
    public var top: BorderStyle
    public var right: BorderStyle
    public var bottom: BorderStyle
    public var left: BorderStyle
    public init(top!: BorderStyle = BorderStyle.Solid, right!: BorderStyle = BorderStyle.Solid, bottom!: BorderStyle = BorderStyle.Solid, left!: BorderStyle = BorderStyle.Solid)
}
```

**Function:** Border styles, used to describe the styles of a component's four borders.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** Version 12

### var bottom

```cangjie
public var bottom: BorderStyle
```

**Function:** Sets the style of the component's bottom border.

**Type:** [BorderStyle](#enum-borderstyle)

**Access:** Read-write

**Since:** Version 12

### var left

```cangjie
public var left: BorderStyle
```

**Function:** Sets the style of the component's left border.

**Type:** [BorderStyle](#enum-borderstyle)

**Access:** Read-write

**Since:** Version 12

### var right

```cangjie
public var right: BorderStyle
```

**Function:** Sets the style of the component's right border.

**Type:** [BorderStyle](#enum-borderstyle)

**Access:** Read-write

**Since:** Version 12

### var top

```cangjie
public var top: BorderStyle
```

**Function:** Sets the style of the component's top border.

**Type:** [BorderStyle](#enum-borderstyle)

**Access:** Read-write

**Since:** Version 12

### init(BorderStyle, BorderStyle, BorderStyle, BorderStyle)

```cangjie
public init(top!: BorderStyle = BorderStyle.Solid, right!: BorderStyle = BorderStyle.Solid, bottom!: BorderStyle = BorderStyle.Solid, left!: BorderStyle = BorderStyle.Solid)
```

**Function:** Constructs an EdgeColor object.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [BorderStyle](#enum-borderstyle) | No | BorderStyle.Solid | **Named parameter.** The style of the component's top border. |
| right | [BorderStyle](#enum-borderstyle) | No | BorderStyle.Solid | **Named parameter.** The style of the component's right border. |
| bottom | [BorderStyle](#enum-borderstyle) | No | BorderStyle.Solid | **Named parameter.** The style of the component's bottom border. |
| left | [BorderStyle](#enum-borderstyle) | No | BorderStyle.Solid | **Named parameter.** The style of the component's left border. |

## class LocalizedPadding

```cangjie
public class LocalizedPadding {
    public let top: Length
    public let end: Length
    public let bottom: Length
    public let start: Length
    public LocalizedPadding(
        top!: Length = 17.0.vp,
        end!: Length = 8.0.vp,
        bottom!: Length = 18.0.vp,
        start!: Length = 8.0.vp
    )
}
```

**Function:** Padding type, used to describe the padding of a component in different directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** Version 12

### let bottom

```cangjie
public let bottom: Length
```

**Function:** Bottom padding, the distance between the component's inner elements and its bottom edge.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-only

**Since:** Version 12

### let end

```cangjie
public let end: Length
```

**Function:** Right padding, the distance between the component's inner elements and its right edge.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-only

**Since:** Version 12

### let start

```cangjie
public let start: Length
```

**Function:** Left padding, the distance between the component's inner elements and its left edge.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-only

**Since:** Version 12

### let top

```cangjie
public let top: Length
```

**Function:** Top padding, the distance between the component's inner elements and its top edge.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-only

**Since:** Version 12

### LocalizedPadding(Length, Length, Length, Length)

```cangjie
public LocalizedPadding(
    top!: Length = 17.0.vp,
    end!: Length = 8.0.vp,
    bottom!: Length = 18.0.vp,
    start!: Length = 8.0.vp
)
```

**Function:** Constructs a LocalizedPadding object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** Version 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Length](cj-common-types.md#interface-length) | No | 17.0.vp | **Named parameter.** Top padding, the distance between the component's inner elements and its top edge. |
| end | [Length](cj-common-types.md#interface-length) | No | 8.0.vp | **Named parameter.** Right padding, the distance between the component's inner elements and its right edge. In right-to-left display languages, this becomes left padding. |
| bottom | [Length](cj-common-types.md#interface-length) | No | 18.0.vp | **Named parameter.** Bottom padding, the distance between the component's inner elements and its bottom edge. |
| start | [Length](cj-common-types.md#interface-length) | No | 8.0.vp | **Named parameter.** Left padding, the distance between the component's inner elements and its left edge. In right-to-left display languages, this becomes right padding. |

## class Margin

```cangjie
public class Margin {
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
}
```

**Function:** Margin type, used to describe the margins of a component in different directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** Version 19

### init(Length, Length, Length, Length)

```cangjie
public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
```

**Function:** Initializes a margin-type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** Version 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Top margin, the distance between the component's top edge and external elements.<br/>Initial value: 0.vp. |
| right | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Right margin, the distance between the component's right edge and external elements.<br/>Initial value: 0.vp. |
| bottom | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Bottom margin, the distance between the component's bottom edge and external elements.<br/>Initial value: 0.vp. |
| left | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Left margin, the distance between the component's left edge and external elements.<br/>Initial value: 0.vp. |

## class MenuOffset

```cangjie
public class MenuOffset {
    public var dx: Length
    public var dy: Length
    public init(dx: Length, dy: Length)
}
```

**Function:** Coordinate offset values.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** Version 12

### var dx

```cangjie
public var dx: Length
```

**Function:** Horizontal offset value.

**Type:** [Length](./cj-common-types.md#interface-length)

**Access:** Read-write

**Since:** Version 12

### var dy

```cangjie
public var dy: Length
```

**Function:** Vertical offset value.**Type:** [Length](./cj-common-types.md#interface-length)

**Initial Version:** 12

## class Offset

```cangjie
public class Offset {
    public var dx: Length
    public var dy: Length
    public init(dx: Length,  dy: Length)
}
```

**Function:** Coordinate offset for relative layout positioning.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### var dx

```cangjie
public var dx: Length
```

**Function:** Horizontal offset.

**Type:** [Length](#interface-length)

**Access:** Read-write

**Initial Version:** 12

### var dy

```cangjie
public var dy: Length
```

**Function:** Vertical offset.

**Type:** [Length](#interface-length)

**Access:** Read-write

**Initial Version:** 12

### init(Length, Length)

```cangjie
public init(dx: Length,  dy: Length)
```

**Function:** Constructs an Offset object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| dx | [Length](#interface-length) | Yes | - | X-coordinate. |
| dy | [Length](#interface-length) | Yes | - | Y-coordinate. |

## class Padding

```cangjie
public class Padding {
    public let top: Length
    public let right: Length
    public let bottom: Length
    public let left: Length
    public Padding(
        top!: Length = 17.0.vp,
        right!: Length = 8.0.vp,
        bottom!: Length = 18.0.vp,
        left!: Length = 8.0.vp
    )
}
```

**Function:** Padding type, describing inner spacing in different directions of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### let bottom

```cangjie
public let bottom: Length
```

**Function:** Bottom padding - the distance between component content and its bottom boundary.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-only

**Initial Version:** 12

### let left

```cangjie
public let left: Length
```

**Function:** Left padding - the distance between component content and its left boundary.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-only

**Initial Version:** 12

### let right

```cangjie
public let right: Length
```

**Function:** Right padding - the distance between component content and its right boundary.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-only

**Initial Version:** 12

### let top

```cangjie
public let top: Length
```

**Function:** Top padding - the distance between component content and its top boundary.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-only

**Initial Version:** 12

## class Position

```cangjie
public class Position {
    public Position(
        public var x: Float64,
        public var y: Float64
    )
}
```

**Function:** Position information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### var x

```cangjie
public var x: Float64
```

**Function:** Defines the X-axis coordinate.

**Type:** Float64

**Access:** Read-write

**Initial Version:** 12

### var y

```cangjie
public var y: Float64
```

**Function:** Defines the Y-axis coordinate.

**Type:** Float64

**Access:** Read-write

**Initial Version:** 12

### Position(Float64, Float64)

```cangjie
public Position(
    public var x: Float64,
    public var y: Float64
)
```

**Function:** Constructs a Position object.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float64 | Yes | - | X-axis coordinate in vp units. |
| y | Float64 | Yes | - | Y-axis coordinate in vp units. |

## enum AccessibilityHoverType

```cangjie
public enum AccessibilityHoverType {
    | HOVER_ENTER
    | HOVER_MOVE
    | HOVER_EXIT
    | HOVER_CANCEL
}
```

**Function:** Accessibility hover event types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### HOVER_CANCEL

```cangjie
HOVER_CANCEL
```

**Function:** Cancels the currently triggered event due to interruption.

**Initial Version:** 12

### HOVER_ENTER

```cangjie
HOVER_ENTER
```

**Function:** Triggered when a finger touches down.

**Initial Version:** 12

### HOVER_EXIT

```cangjie
HOVER_EXIT
```

**Function:** Triggered when lifting the finger.

**Initial Version:** 12

### HOVER_MOVE

```cangjie
HOVER_MOVE
```

**Function:** Triggered during touch movement.

**Initial Version:** 12

## enum AdaptiveColor

```cangjie
public enum AdaptiveColor {
    | DEFAULT
    | AVERAGE
}
```

**Function:** Color sampling modes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### AVERAGE

```cangjie
AVERAGE
```

**Function:** Uses color blurring. Takes the average color of the sampled area as the mask color.

**Initial Version:** 12

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Disables color blurring. Uses the default color as the mask color.

**Initial Version:** 12
```cangjie
Vertical
```

**Function:** Direction is vertical.

**Initial Version:** 12

## enum Alignment

```cangjie
public enum Alignment {
    | TopStart
    | Top
    | TopEnd
    | Start
    | Center
    | End
    | BottomStart
    | Bottom
    | BottomEnd
}
```

**Function:** Alignment methods.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Bottom

```cangjie
Bottom
```

**Function:** Horizontally centered at the bottom.

**Initial Version:** 12

### BottomEnd

```cangjie
BottomEnd
```

**Function:** Bottom trailing edge.

**Initial Version:** 12

### BottomStart

```cangjie
BottomStart
```

**Function:** Bottom leading edge.

**Initial Version:** 12

### Center

```cangjie
Center
```

**Function:** Centered both horizontally and vertically.

**Initial Version:** 12

### End

```cangjie
End
```

**Function:** Vertically centered at the trailing edge.

**Initial Version:** 12

### Start

```cangjie
Start
```

**Function:** Vertically centered at the leading edge.

**Initial Version:** 12

### Top

```cangjie
Top
```

**Function:** Horizontally centered at the top.

**Initial Version:** 12

### TopEnd

```cangjie
TopEnd
```

**Function:** Top trailing edge.

**Initial Version:** 12

### TopStart

```cangjie
TopStart
```

**Function:** Top leading edge.

**Initial Version:** 12

## enum AnimationStatus

```cangjie
public enum AnimationStatus {
    | Initial
    | Running
    | Paused
    | Stopped
}
```

**Function:** Animation playback states.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Initial

```cangjie
Initial
```

**Function:** Initial state of animation.

**Initial Version:** 12

### Paused

```cangjie
Paused
```

**Function:** Animation is paused.

**Initial Version:** 12

### Running

```cangjie
Running
```

**Function:** Animation is playing.

**Initial Version:** 12

### Stopped

```cangjie
Stopped
```

**Function:** Animation is stopped.

**Initial Version:** 12

## enum AppRotation

```cangjie
public enum AppRotation {
    | ROTATION_0
    | ROTATION_90
    | ROTATION_180
    | ROTATION_270
}
```

**Function:** Application rotation angles.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### ROTATION_0

```cangjie
ROTATION_0
```

**Function:** Application orientation at 0 degrees.

**Initial Version:** 12

### ROTATION_90

```cangjie
ROTATION_90
```

**Function:** Application orientation at 90 degrees.

**Initial Version:** 12

### ROTATION_180

```cangjie
ROTATION_180
```

**Function:** Application orientation at 180 degrees.

**Initial Version:** 12

### ROTATION_270

```cangjie
ROTATION_270
```

**Function:** Application orientation at 270 degrees.

**Initial Version:** 12

## enum ArrowPointPosition

```cangjie
public enum ArrowPointPosition {
    | START
    | CENTER
    | END
}
```

**Function:** Arrow pointing positions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### CENTER

```cangjie
CENTER
```

**Function:** Centered position within the parent component.

**Initial Version:** 12

### END

```cangjie
END
```

**Function:** Horizontal: Rightmost position of parent component; Vertical: Bottommost position of parent component.

**Initial Version:** 12

### START

```cangjie
START
```

**Function:** Horizontal: Leftmost position of parent component; Vertical: Topmost position of parent component.

**Initial Version:** 12

## enum Axis

```cangjie
public enum Axis {
    | Vertical
    | Horizontal
}
```

**Function:** Axis directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Horizontal

```cangjie
Horizontal
```

**Function:** Horizontal direction.

**Initial Version:** 12

### Vertical

```cangjie
Vertical
```

**Function:** Vertical direction.

**Initial Version:** 12

## enum BarrierDirection

```cangjie
public enum BarrierDirection {
    | LEFT
    | RIGHT
    | TOP
    | BOTTOM
}
```

**Function:** Defines the direction of barrier lines.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### BOTTOM

```cangjie
BOTTOM
```

**Function:** The barrier is positioned at the bottommost of all referencedIds.

**Initial Version:** 12

### LEFT

```cangjie
LEFT
```

**Function:** The barrier is positioned at the leftmost of all referencedIds.

**Initial Version:** 12

### RIGHT

```cangjie
RIGHT
```

**Function:** The barrier is positioned at the rightmost of all referencedIds.

**Initial Version:** 12

### TOP

```cangjie
TOP
```

**Function:** The barrier is positioned at the topmost of all referencedIds.

**Initial Version:** 12

## enum BarState

```cangjie
public enum BarState {
    | Off
    | Auto
    | On
}
```

**Function:** Display mode of scroll bars.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Auto

```cangjie
Auto
```

**Function:** Display on demand (shown when touched, disappears after 2 seconds).

**Initial Version:** 12

### Off

```cangjie
Off
```

**Function:** Not displayed.

**Initial Version:** 12

### On

```cangjie
On
```

**Function:** Permanently displayed.

**Initial Version:** 12

## enum BlendApplyType

```cangjie
public enum BlendApplyType {
    | FAST
    | OFFSCREEN
}
```

**Function:** Indicates how the specified blend mode is applied to the view's content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### FAST

```cangjie
FAST
```

**Function:** Blends the view's content sequentially on the target image.

**Initial Version:** 12

### OFFSCREEN

```cangjie
OFFSCREEN
```

**Function:** Renders this component and its child components' content to an off-screen canvas, then blends them as a whole.

**Initial Version:** 12

## enum BlendMode

```cangjie
public enum BlendMode {
    | NONE
    | CLEAR
    | SRC
    | DST
    | SRC_OVER
    | DST_OVER
    | SRC_IN
    | DST_IN
    | SRC_OUT
    | DST_OUT
    | SRC_ATOP
    | DST_ATOP
    | XOR
    | PLUS
    | MODULATE
    | SCREEN
    | OVERLAY
    | DARKEN
    | LIGHTEN
    | COLOR_DODGE
    | COLOR_BURN
    | HARD_LIGHT
    | SOFT_LIGHT
    | DIFFERENCE
    | EXCLUSION
    | MULTIPLY
    | HUE
    | SATURATION
    | COLOR
    | LUMINOSITY
}
```

**Function:** Blend modes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

> **Note:**
>
> In the blendMode enumeration, 's' represents the source pixel, 'd' represents the destination pixel, 'sa' represents the source pixel's alpha value, 'da' represents the destination pixel's alpha value, 'r' represents the blended pixel, and 'ra' represents the blended pixel's alpha value.

### CLEAR

```cangjie
CLEAR
```

**Function:** Clears the destination pixels covered by source pixels to full transparency.

**Initial Version:** 12

### COLOR

```cangjie
COLOR
```

**Function:** Preserves the saturation and hue of the source pixels but replaces their luminance with that of the destination pixels.

**Initial Version:** 12

### COLOR_BURN

```cangjie
COLOR_BURN
```

**Function:** Darkens the destination pixels to reflect the source pixels.

**Initial Version:** 12

### COLOR_DODGE

```cangjie
COLOR_DODGE
```

**Function:** Brightens the destination pixels to reflect the source pixels.

**Initial Version:** 12

### DARKEN

```cangjie
DARKEN
```

**Function:** rc = s + d - max(s *da, d* sa), ra = kSrcOver. When two colors overlap, the darker color covers the lighter one.

**Initial Version:** 12

### DIFFERENCE

```cangjie
DIFFERENCE
```

**Function:** rc = s + d - 2 *(min(s* da, d * sa)), ra = kSrcOver. Compares source and destination pixels, subtracting the darker pixel from the brighter one to produce a high-contrast effect.

**Initial Version:** 12

### DST

```cangjie
DST
```

**Function:** r = d. Only displays destination pixels.

**Initial Version:** 12

### DST_ATOP

```cangjie
DST_ATOP
```

**Function:** r = d *sa + s* (1 - da). Draws destination pixels where they overlap with source pixels and source pixels where they don't overlap.

**Initial Version:** 12

### DST_IN

```cangjie
DST_IN
```

**Function:** r = d * sa. Only displays the parts of destination pixels that overlap with source pixels.

**Initial Version:** 12

### DST_OUT

```cangjie
DST_OUT
```

**Function:** r = d * (1 - sa). Only displays the parts of destination pixels that don't overlap with source pixels.

**Initial Version:** 12

### DST_OVER

```cangjie
DST_OVER
```

**Function:** r = d + (1 - da) * s. Blends destination pixels based on their alpha values and overlays them on source pixels.

**Initial Version:** 12
**Initial Version:** 12  

### EXCLUSION  

```cangjie  
EXCLUSION  
```  

**Function:** rc = s + d - two(s * d), ra = kSrcOver. Compares source and destination pixels, subtracting the lower-brightness pixel from the higher-brightness pixel to produce a soft effect.  

**Initial Version:** 12  

### HARD_LIGHT  

```cangjie  
HARD_LIGHT  
```  

**Function:** Determines whether the destination pixel becomes brighter or darker based on the source pixel value. Chooses between MULTIPLY or SCREEN blend modes depending on the source pixel.  

**Initial Version:** 12  

### HUE  

```cangjie  
HUE  
```  

**Function:** Retains the brightness and saturation of the source image but replaces its hue with the hue of the destination image.  

**Initial Version:** 12  

### LIGHTEN  

```cangjie  
LIGHTEN  
```  

**Function:** rc = s + d - min(s * da, d * sa), ra = kSrcOver. Compares pixels from the source and destination images and selects the brighter pixel as the final blended result.  

**Initial Version:** 12  

### LUMINOSITY  

```cangjie  
LUMINOSITY  
```  

**Function:** Retains the hue and saturation of the destination pixel but replaces its brightness with the brightness of the source pixel.  

**Initial Version:** 12  

### MODULATE  

```cangjie  
MODULATE  
```  

**Function:** r = s * d. Multiplies the source and destination pixels and uses the result as the new pixel value.  

**Initial Version:** 12  

### MULTIPLY  

```cangjie  
MULTIPLY  
```  

**Function:** r = s * (1 - da) + d * (1 - sa) + s * d. Multiplies the source and destination images to produce a new blended image.  

**Initial Version:** 12  

### NONE  

```cangjie  
NONE  
```  

**Function:** Overlays the upper image directly onto the lower image without any blending operation.  

**Initial Version:** 12  

### OVERLAY  

```cangjie  
OVERLAY  
```  

**Function:** Chooses between MULTIPLY or SCREEN blend modes based on the destination pixel.  

**Initial Version:** 12  

### PLUS  

```cangjie  
PLUS  
```  

**Function:** r = min(s + d, 1). Adds the source and destination pixel values and uses the result as the new pixel value.  

**Initial Version:** 12  

### SATURATION  

```cangjie  
SATURATION  
```  

**Function:** Retains the brightness and hue of the destination pixel but replaces its saturation with the saturation of the source pixel.  

**Initial Version:** 12  

### SCREEN  

```cangjie  
SCREEN  
```  

**Function:** r = s + d - s * d. Blends two images by adding their pixel values and then subtracting their product.  

**Initial Version:** 12  

### SOFT_LIGHT  

```cangjie  
SOFT_LIGHT  
```  

**Function:** Chooses between LIGHTEN or DARKEN blend modes based on the source pixel.  

**Initial Version:** 12  

### SRC  

```cangjie  
SRC  
```  

**Function:** r = s. Displays only the source pixel.  

**Initial Version:** 12  

### SRC_ATOP  

```cangjie  
SRC_ATOP  
```  

**Function:** r = s * da + d * (1 - sa). Draws the source pixel where it overlaps with the destination pixel and the destination pixel where they do not overlap.  

**Initial Version:** 12  

### SRC_IN  

```cangjie  
SRC_IN  
```  

**Function:** r = s * da. Displays only the overlapping part of the source and destination pixels.  

**Initial Version:** 12  

### SRC_OUT  

```cangjie  
SRC_OUT  
```  

**Function:** r = s * (1 - da). Displays only the non-overlapping part of the source pixel.  

**Initial Version:** 12  

### SRC_OVER  

```cangjie  
SRC_OVER  
```  

**Function:** r = s + (1 - sa) * d. Blends the source pixel with transparency and overlays it onto the destination pixel.  

**Initial Version:** 12  

### XOR  

```cangjie  
XOR  
```  

**Function:** r = s * (1 - da) + d * (1 - sa). Displays only the non-overlapping parts of the source and destination pixels.  

**Initial Version:** 12  

## enum BlurStyleActivePolicy  

```cangjie  
public enum BlurStyleActivePolicy {  
    | FOLLOWS_WINDOW_ACTIVE_STATE  
    | ALWAYS_ACTIVE  
    | ALWAYS_INACTIVE  
}  
```  

**Function:** Blur effect activation policy.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

### ALWAYS_ACTIVE  

```cangjie  
ALWAYS_ACTIVE  
```  

**Function:** The blur effect is always active.  

**Initial Version:** 12  

### ALWAYS_INACTIVE  

```cangjie  
ALWAYS_INACTIVE  
```  

**Function:** The blur effect is always inactive.  

**Initial Version:** 12  

### FOLLOWS_WINDOW_ACTIVE_STATE  

```cangjie  
FOLLOWS_WINDOW_ACTIVE_STATE  
```  

**Function:** The blur effect follows the window focus state—blurred when focused, not blurred otherwise.  

**Initial Version:** 12  

## enum BorderStyle  

```cangjie  
public enum BorderStyle {  
    | Solid  
    | Dashed  
    | Dotted  
}  
```  

**Function:** Border style, used to describe the style of a component's four borders.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

### Dashed  

```cangjie  
Dashed  
```  

**Function:** Displays as a series of short square dashes.  

**Initial Version:** 12  

### Dotted  

```cangjie  
Dotted  
```  

**Function:** Displays as a series of dots, with a radius equal to half of the borderWidth.  

**Initial Version:** 12  

### Solid  

```cangjie  
Solid  
```  

**Function:** Displays as a solid line.  

**Initial Version:** 12  

## enum ButtonRole  

```cangjie  
public enum ButtonRole {  
    | NORMAL  
    | ERROR  
}  
```  

**Function:** Button type.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12### ERROR

```cangjie
ERROR
```

**Function:** Warning button.

**Initial Version:** 12

### NORMAL

```cangjie
NORMAL
```

**Function:** Normal button.

**Initial Version:** 12

## enum ButtonStyleMode

```cangjie
public enum ButtonStyleMode {
    | NORMAL
    | EMPHASIZED
    | TEXTUAL
}
```

**Function:** Button style and importance level types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### EMPHASIZED

```cangjie
EMPHASIZED
```

**Function:** Emphasized button (used to highlight current operation).

**Initial Version:** 12

### NORMAL

```cangjie
NORMAL
```

**Function:** Normal button (for general interface operations).

**Initial Version:** 12

### TEXTUAL

```cangjie
TEXTUAL
```

**Function:** Text button (plain text with no background color).

**Initial Version:** 12

## enum ButtonType

```cangjie
public enum ButtonType {
    | Normal
    | Capsule
    | Circle
    | ROUNDED_RECTANGLE
}
```

**Function:** Button shape types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Capsule

```cangjie
Capsule
```

**Function:** Capsule-shaped button (default corner radius is half of height).

**Initial Version:** 12

### Circle

```cangjie
Circle
```

**Function:** Circular button.

**Initial Version:** 12

### Normal

```cangjie
Normal
```

**Function:** Normal button (default with no rounded corners).

**Initial Version:** 12

### ROUNDED_RECTANGLE

```cangjie
ROUNDED_RECTANGLE
```

**Function:** Rounded rectangle button.

**Initial Version:** 12

## enum CanvasDirection

```cangjie
public enum CanvasDirection {
    | inherit
    | ltr
    | rtl
}
```

**Function:** Sets the text direction used when drawing text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### inherit

```cangjie
inherit
```

**Function:** Inherits the text direction already set in the canvas component's common properties.

**Initial Version:** 12

### ltr

```cangjie
ltr
```

**Function:** Left to right.

**Initial Version:** 12

### rtl

```cangjie
rtl
```

**Function:** Right to left.

**Initial Version:** 12

## enum CanvasFillRule

```cangjie
public enum CanvasFillRule {
    | evenodd
    | nonzero
}
```

**Function:** Specifies the rule for filling objects.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### evenodd

```cangjie
evenodd
```

**Function:** Even-odd rule.

**Initial Version:** 12

### nonzero

```cangjie
nonzero
```

**Function:** Non-zero rule.

**Initial Version:** 12

## enum CheckBoxShape

```cangjie
public enum CheckBoxShape {
    | CIRCLE
    | ROUNDED_SQUARE
}
```

**Function:** Checkbox shape types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### CIRCLE

```cangjie
CIRCLE
```

**Function:** Circular shape.

**Initial Version:** 12

### ROUNDED_SQUARE

```cangjie
ROUNDED_SQUARE
```

**Function:** Rounded square shape.

**Initial Version:** 12

## enum ClickEffectLevel

```cangjie
public enum ClickEffectLevel {
    | LIGHT
    | MIDDLE
    | HEAVY
}
```

**Function:** Click rebound animation settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### HEAVY

```cangjie
HEAVY
```

**Function:** Large area (heavy). Spring animation with stiffness: 350, damping: 35, initial velocity: 0.5.

**Initial Version:** 12

### LIGHT

```cangjie
LIGHT
```

**Function:** Small area (light). Spring animation with stiffness: 410, damping: 38, initial velocity: 1.

**Initial Version:** 12

### MIDDLE

```cangjie
MIDDLE
```

**Function:** Medium area (stable). Spring animation with stiffness: 350, damping: 35, initial velocity: 0.5.

**Initial Version:** 12

## enum ColoringStrategy

```cangjie
public enum ColoringStrategy {
    | INVERT
    | AVERAGE
    | PRIMARY
}
```

**Function:** Smart color picking enumeration types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12### AVERAGE

```cangjie
AVERAGE
```

**Function:** Sets the background shadow color of the control to the average color of the background shadow area. This enumeration can only be set in the `shadow` parameter of type `ShadowOptions`.

**Initial Version:** 12

### INVERT

```cangjie
INVERT
```

**Function:** Sets the foreground color to the inverse of the control's background color. This enumeration can only be set in `foregroundColor`.

**Initial Version:** 12

### PRIMARY

```cangjie
PRIMARY
```

**Function:** Sets the background shadow color of the control to the primary color of the background shadow area. This enumeration can only be set in the `shadow` parameter of type `ShadowOptions`.

**Initial Version:** 12

## enum CompositeOperation

```cangjie
public enum CompositeOperation {
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
}
```

**Function:** Sets the method of composite operation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### copy

```cangjie
copy
```

**Function:** Displays newly drawn content while ignoring existing content.

**Initial Version:** 12

### destination-atop

```cangjie
destination-atop
```

**Function:** Displays existing content on top of newly drawn content.

**Initial Version:** 12

### destination-in

```cangjie
destination-in
```

**Function:** Displays existing content within newly drawn content.

**Initial Version:** 12

### destination-out

```cangjie
destination-out
```

**Function:** Displays existing content outside newly drawn content.

**Initial Version:** 12

### destination-over

```cangjie
destination-over
```

**Function:** Displays existing content above newly drawn content.

**Initial Version:** 12

### lighter

```cangjie
lighter
```

**Function:** Displays both newly drawn content and existing content.

**Initial Version:** 12

### source-atop

```cangjie
source-atop
```

**Function:** Displays newly drawn content on top of existing content.

**Initial Version:** 12

### source-in

```cangjie
source-in
```

**Function:** Displays newly drawn content within existing content.

**Initial Version:** 12

### source-out

```cangjie
source-out
```

**Function:** Displays newly drawn content outside existing content.

**Initial Version:** 12

### source-over

```cangjie
source-over
```

**Function:** Displays newly drawn content over existing content (default value).

**Initial Version:** 12

### xor

```cangjie
xor
```

**Function:** Blends newly drawn content with existing content using XOR operation.

**Initial Version:** 12

## enum ContentType

```cangjie
public enum ContentType {
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
}
```

**Function:** Auto-fill type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### **HOUSE_NUMBER**

```cangjie
HOUSE_NUMBER
```

**Function:** [House number] When contextual auto-fill is enabled, supports automatic saving and auto-filling of house numbers.

**Initial Version:** 12

### **ID_CARD_NUMBER**

```cangjie
ID_CARD_NUMBER
```

**Function:** [ID card number] When contextual auto-fill is enabled, supports automatic saving and auto-filling of ID card numbers.

**Initial Version:** 12

### **NEW_PASSWORD**

```cangjie
NEW_PASSWORD
```

**Function:** [New password] When password vault is enabled, supports automatic generation of new passwords.

**Initial Version:** 12

### **NICKNAME**

```cangjie
NICKNAME
```

**Function:** [Nickname] When contextual auto-fill is enabled, supports automatic saving and auto-filling of nicknames.

**Initial Version:** 12

### **PASSWORD**

```cangjie
PASSWORD
```

**Function:** [Password] When password vault is enabled, supports automatic saving and auto-filling of passwords.

**Initial Version:** 12

### **PERSON_FIRST_NAME**

```cangjie
PERSON_FIRST_NAME
```

**Function:** [First name] When contextual auto-fill is enabled, supports automatic saving and auto-filling of first names.

**Initial Version:** 12

### **PERSON_FULL_NAME**

```cangjie
PERSON_FULL_NAME
```

**Function:** [Full name] When contextual auto-fill is enabled, supports automatic saving and auto-filling of full names.

**Initial Version:** 12

### **PERSON_LAST_NAME**

```cangjie
PERSON_LAST_NAME
```

**Function:** [Last name] When contextual auto-fill is enabled, supports automatic saving and auto-filling of last names.

**Initial Version:** 12

### **PHONE_COUNTRY_CODE**

```cangjie
PHONE_COUNTRY_CODE
```

**Function:** [Country code] When contextual auto-fill is enabled, supports automatic saving and auto-filling of country codes.

**Initial Version:** 12

### **PHONE_NUMBER**

```cangjie
PHONE_NUMBER
```

**Function:** [Phone number] When contextual auto-fill is enabled, supports automatic saving and auto-filling of phone numbers.

**Initial Version:** 12

### **PROVINCE_ADDRESS**
```cangjie
PROVINCE_ADDRESS
```

**Function:** 【Province】When contextual auto-fill is enabled, supports automatic saving and auto-filling of provinces.

**Initial Version:** 12

### **USER_NAME**

```cangjie
USER_NAME
```

**Function:** 【Username】When password vault is enabled, supports automatic saving and auto-filling of usernames.

**Initial Version:** 12

### BANK_CARD_NUMBER

```cangjie
BANK_CARD_NUMBER
```

**Function:** 【Bank Card Number】When contextual auto-fill is enabled, supports automatic saving and auto-filling of bank card numbers.

**Initial Version:** 12

### CITY_ADDRESS

```cangjie
CITY_ADDRESS
```

**Function:** 【City】When contextual auto-fill is enabled, supports automatic saving and auto-filling of cities.

**Initial Version:** 12

### COUNTRY_ADDRESS

```cangjie
COUNTRY_ADDRESS
```

**Function:** 【Country】When contextual auto-fill is enabled, supports automatic saving and auto-filling of countries.

**Initial Version:** 12

### DETAIL_INFO_WITHOUT_STREET

```cangjie
DETAIL_INFO_WITHOUT_STREET
```

**Function:** 【Streetless Address】When contextual auto-fill is enabled, supports automatic saving and auto-filling of addresses without street information.

**Initial Version:** 12

### DISTRICT_ADDRESS

```cangjie
DISTRICT_ADDRESS
```

**Function:** 【District/County】When contextual auto-fill is enabled, supports automatic saving and auto-filling of districts/counties.

**Initial Version:** 12

### EMAIL_ADDRESS

```cangjie
EMAIL_ADDRESS
```

**Function:** 【Email Address】When contextual auto-fill is enabled, supports automatic saving and auto-filling of email addresses.

**Initial Version:** 12

### FORMAT_ADDRESS

```cangjie
FORMAT_ADDRESS
```

**Function:** 【Standard Address】When contextual auto-fill is enabled, supports automatic saving and auto-filling of standardized addresses.

**Initial Version:** 12

### FULL_PHONE_NUMBER

```cangjie
FULL_PHONE_NUMBER
```

**Function:** 【Phone Number with Country Code】When contextual auto-fill is enabled, supports automatic saving and auto-filling of phone numbers including country codes.

**Initial Version:** 12

### FULL_STREET_ADDRESS

```cangjie
FULL_STREET_ADDRESS
```

**Function:** 【Detailed Address】When contextual auto-fill is enabled, supports automatic saving and auto-filling of detailed addresses.

**Initial Version:** 12

## enum ControlSize

```cangjie
public enum ControlSize {
    | SMALL
    | NORMAL
}
```

**Function:** Controls size dimensions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### NORMAL

```cangjie
NORMAL
```

**Function:** Normal size.

**Initial Version:** 12

### SMALL

```cangjie
SMALL
```

**Function:** Small size.

**Initial Version:** 12

## enum CopyOptions

```cangjie
public enum CopyOptions {
    | None
    | InApp
    | LocalDevice
}
```

**Function:** Text copy modes for input.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### InApp

```cangjie
InApp
```

**Function:** Supports in-application copying.

**Initial Version:** 12

### LocalDevice

```cangjie
LocalDevice
```

**Function:** Supports device-local copying.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** Copying not supported.

**Initial Version:** 12

## enum Curve

```cangjie
public enum Curve {
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
}
```

**Function:** Interpolation curves. For animation effects, refer to Bézier curves.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Ease

```cangjie
Ease
```

**Function:** Indicates an animation starts slowly, accelerates, then decelerates before ending. CubicBezier(0.25, 0.1, 0.25, 1.0).

**Initial Version:** 12

### EaseIn

```cangjie
EaseIn
```

**Function:** Indicates an animation starts slowly. CubicBezier(0.42, 0.0, 1.0, 1.0).

**Initial Version:** 12

### EaseInOut

```cangjie
EaseInOut
```

**Function:** Indicates an animation starts and ends slowly. CubicBezier(0.42, 0.0, 0.58, 1.0).

**Initial Version:** 12

### EaseOut

```cangjie
EaseOut
```

**Function:** Indicates an animation ends slowly. CubicBezier(0.0, 0.0, 0.58, 1.0).

**Initial Version:** 12

### ExtremeDeceleration

```cangjie
ExtremeDeceleration
```

**Function:** Extreme deceleration curve, cubic-bezier(0.0, 0.0, 0.0, 1.0).

**Initial Version:** 12

### FastOutLinearIn

```cangjie
FastOutLinearIn
```

**Function:** Acceleration curve, cubic-bezier(0.4, 0.0, 1.0, 1.0).

**Initial Version:** 12

### FastOutSlowIn

```cangjie
FastOutSlowIn
```

**Function:** Standard curve, cubic-bezier(0.4, 0.0, 0.2, 1.0).

**Initial Version:** 12

### Friction

```cangjie
Friction
```

**Function:** Damping curve, CubicBezier(0.2, 0.0, 0.2, 1.0).

**Initial Version:** 12

### Linear

```cangjie
Linear
```

**Function:** Indicates that the animation maintains a constant speed from start to finish.

**Initial Version:** 12

### LinearOutSlowIn

```cangjie
LinearOutSlowIn
```

**Function:** Standard curve, cubic-bezier(0.4, 0.0, 0.2, 1.0).

**Initial Version:** 12

### Rhythm

```cangjie
Rhythm
```

**Function:** Rhythm curve, cubic-bezier(0.7, 0.0, 0.2, 1.0).

**Initial Version:** 12

### Sharp

```cangjie
Sharp
```

**Function:** Sharp curve, cubic-bezier(0.33, 0.0, 0.67, 1.0).

**Initial Version:** 12

### Smooth

```cangjie
Smooth
```

**Function:** Smooth curve, cubic-bezier(0.4, 0.0, 0.4, 1.0).

**Initial Version:** 12

## enum DialogAlignment

```cangjie
public enum DialogAlignment {
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
}
```

**Function:** Vertical alignment method for pop-up dialogs.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Bottom

```cangjie
Bottom
```

**Function:** Aligns to the bottom vertically.

**Initial Version:** 12

### BottomEnd

```cangjie
BottomEnd
```

**Function:** Aligns to the bottom-right.

**Initial Version:** 12

### BottomStart

```cangjie
BottomStart
```

**Function:** Aligns to the bottom-left.

**Initial Version:** 12

### Center

```cangjie
Center
```

**Function:** Aligns to the center vertically.

**Initial Version:** 12

### CenterEnd

```cangjie
CenterEnd
```

**Function:** Aligns to the middle-right.

**Initial Version:** 12

### CenterStart

```cangjie
CenterStart
```

**Function:** Aligns to the middle-left.

**Initial Version:** 12

### Default

```cangjie
Default
```

**Function:** Default alignment.

**Initial Version:** 12

### Top

```cangjie
Top
```

**Function:** Aligns to the top vertically.

**Initial Version:** 12

### TopEnd

```cangjie
TopEnd
```

**Function:** Aligns to the top-right.

**Initial Version:** 12

### TopStart

```cangjie
TopStart
```

**Function:** Aligns to the top-left.

**Initial Version:** 12

## enum DialogButtonStyle

```cangjie
public enum DialogButtonStyle {
    | DEFAULT
    | HIGHLIGHT
}
```

**Function:** Dialog button style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DEFAULT

```cangjie
DEFAULT
```

**Function:** White background with blue text (dark theme: white background becomes black background).

**Initial Version:** 12

### HIGHLIGHT

```cangjie
HIGHLIGHT
```

**Function:** Blue background with white text.

**Initial Version:** 12

## enum Direction

```cangjie
public enum Direction {
    | Ltr
    | Rtl
    | Auto
}
```

**Function:** Element layout direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Auto

```cangjie
Auto
```

**Function:** Uses the system default layout direction.

**Initial Version:** 12

### Ltr

```cangjie
Ltr
```

**Function:** Elements are laid out from left to right.

**Initial Version:** 12

### Rtl

```cangjie
Rtl
```

**Function:** Elements are laid out from right to left.

**Initial Version:** 12

## enum Edge

```cangjie
public enum Edge {
    | Top
    | Start
    | Bottom
    | End
}
```

**Function:** Scrolls to the edge of the container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Bottom

```cangjie
Bottom
```

**Function:** Bottom edge in the vertical direction.

**Initial Version:** 12

### End

```cangjie
End
```

**Function:** End position in the horizontal direction.

**Initial Version:** 12

### Start

```cangjie
Start
```

**Function:** Start position in the horizontal direction.

**Initial Version:** 12

### Top

```cangjie
Top
```

**Function:** Vertical edge.

**Initial Version:** 12

## enum EdgeEffect

```cangjie
public enum EdgeEffect {
    | Spring
    | Fade
    | None
}
```

**Function:** Edge sliding effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Fade

```cangjie
Fade
```

**Function:** Shadow effect. When sliding to the edge, a curved shadow will appear.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** No effect when sliding to the edge.

**Initial Version:** 12

### Spring

```cangjie
Spring
```

**Function:** Elastic physics animation. When sliding to the edge, it can continue sliding for a distance based on initial velocity or touch events, and rebounds after release.

**Initial Version:** 12

## enum EllipsisMode

```cangjie
public enum EllipsisMode {
    | START
    | CENTER
    | END
}
```

**Function:** Ellipsis mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### CENTER

```cangjie
CENTER
```

**Function:** Omit content in the middle of the line.

**Initial Version:** 12

### END

```cangjie
END
```

**Function:** Omit content at the end of the line.

**Initial Version:** 12

### START

```cangjie
START
```

**Function:** Omit content at the beginning of the line.

**Initial Version:** 12

## enum EmbeddedType

```cangjie
public enum EmbeddedType {
    | EMBEDDED_UI_EXTENSION
}
```

**Function:** Specifies the provider type that can be launched by EmbeddedComponent.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### EMBEDDED_UI_EXTENSION

```cangjie
EMBEDDED_UI_EXTENSION
```

**Function:** Indicates that the current provider type is EmbeddedUIExtensionAbility.

**Initial Version:** 12

## enum FillMode

```cangjie
public enum FillMode {
    | None
    | Forwards
    | Backwards
    | Both
}
```

**Function:** State before and after animation playback in the current playback direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Backwards

```cangjie
Backwards
```

**Function:** The animation will immediately apply the value defined in the first keyframe when applied to the target and retain this value during the delay period. The first keyframe depends on playMode: it's the 'from' state when playMode is Normal or Alternate, and the 'to' state when playMode is Reverse or AlternateReverse.

**Initial Version:** 12

### Both

```cangjie
Both
```

**Function:** The animation will follow the rules of Forwards and Backwards, extending animation properties in both directions.

**Initial Version:** 12

### Forwards

```cangjie
Forwards
```

**Function:** The target will retain the state of the last keyframe during animation execution.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** No styles are applied to the target when the animation is not executing, and it returns to the initial default state after playback completes.

**Initial Version:** 12

## enum FinishCallbackType

```cangjie
public enum FinishCallbackType {
    | REMOVED
    | LOGICALLY
}
```

**Function:** Callback type when animation ends.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### LOGICALLY

```cangjie
LOGICALLY
```

**Function:** The callback is triggered when the animation is logically in a descending state but may still be in its long tail state.

**Initial Version:** 12

### REMOVED

```cangjie
REMOVED
```

**Function:** The callback is triggered when the entire animation ends and is immediately removed.

**Initial Version:** 12

## enum FlexAlign

```cangjie
public enum FlexAlign {
    | Start
    | Center
    | End
    | SpaceBetween
    | SpaceAround
    | SpaceEvenly
}
```

**Function:** Flex container alignment.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Center

```cangjie
Center
```

**Function:** Elements are center-aligned along the main axis, with the first element's distance from the start equal to the last element's distance from the end.

**Initial Version:** 12

### End

```cangjie
End
```

**Function:** Elements are aligned to the end along the main axis, with the last element aligned to the end and other elements aligned to the next one.

**Initial Version:** 12

### SpaceAround

```cangjie
SpaceAround
```

**Function:** Flex items are evenly distributed along the main axis with equal spacing between adjacent elements. The distance from the first element to the start and the last element to the end is half the spacing between adjacent elements.

**Initial Version:** 12

### SpaceBetween

```cangjie
SpaceBetween
```

**Function:** Flex items are evenly distributed along the main axis with equal spacing between adjacent elements. The first element is aligned to the start, and the last element is aligned to the end.

**Initial Version:** 12

### SpaceEvenly

```cangjie
SpaceEvenly
```

**Function:** Flex items are spaced equally along the main axis, with identical spacing between adjacent elements, between the first element and the start, and between the last element and the end.

**Initial Version:** 12

### Start

```cangjie
Start
```

**Function:** Elements are aligned to the start along the main axis, with the first element aligned to the start and subsequent elements aligned to the previous one.

**Initial Version:** 12

## enum FlexDirection

```cangjie
public enum FlexDirection {
    | Row
    | Column
    | RowReverse
    | ColumnReverse
}
```

**Function:** Flex container direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### Column

```cangjie
Column
```

**Function:** Layout mode with main axis aligned to column direction.

**Since:** 12

### ColumnReverse

```cangjie
ColumnReverse
```

**Function:** Layout in the opposite direction of Column.

**Since:** 12

### Row

```cangjie
Row
```

**Function:** Layout mode with main axis aligned to row direction.

**Since:** 12

### RowReverse

```cangjie
RowReverse
```

**Function:** Layout in the opposite direction of Row.

**Since:** 12

## enum FlexWrap

```cangjie
public enum FlexWrap {
    | NoWrap
    | Wrap
    | WrapReverse
}
```

**Function:** Flex container constraint method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### NoWrap

```cangjie
NoWrap
```

**Function:** Single-row/column layout for Flex container elements, with child elements constrained within the container as much as possible. When child elements have minimum size constraints, the Flex container will not enforce elastic compression.

**Since:** 12

### Wrap

```cangjie
Wrap
```

**Function:** Multi-row/column arrangement for Flex container elements, allowing child elements to exceed the container.

**Since:** 12

### WrapReverse

```cangjie
WrapReverse
```

**Function:** Reverse multi-row/column arrangement for Flex container elements, allowing child elements to exceed the container.

**Since:** 12

## enum FoldStatus

```cangjie
public enum FoldStatus {
    | FOLD_STATUS_UNKNOWN
    | FOLD_STATUS_EXPANDED
    | FOLD_STATUS_FOLDED
    | FOLD_STATUS_HALF_FOLDED
}
```

**Function:** Indicates the folding status of foldable devices.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### FOLD_STATUS_EXPANDED

```cangjie
FOLD_STATUS_EXPANDED
```

**Function:** Indicates the device is currently in a fully expanded state.

**Since:** 12

### FOLD_STATUS_FOLDED

```cangjie
FOLD_STATUS_FOLDED
```

**Function:** Indicates the device is currently in a folded state.

**Since:** 12

### FOLD_STATUS_HALF_FOLDED

```cangjie
FOLD_STATUS_HALF_FOLDED
```

**Function:** Indicates the device is currently in a half-folded state. Half-folded refers to the state between fully expanded and folded.

**Since:** 12

### FOLD_STATUS_UNKNOWN

```cangjie
FOLD_STATUS_UNKNOWN
```

**Function:** Indicates the device's current folding status is unknown.

**Since:** 12

## enum FontStyle

```cangjie
public enum FontStyle {
    | Normal
    | Italic
}
```

**Function:** Font style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### Italic

```cangjie
Italic
```

**Function:** Standard italic font style.

**Since:** 12

### Normal

```cangjie
Normal
```

**Function:** Standard normal font style.

**Since:** 12

## enum FontWeight

```cangjie
public enum FontWeight {
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
}
```

**Function:** Sets the font weight of text. Setting too large may result in truncation with different fonts.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### Bold

```cangjie
Bold
```

**Function:** Thicker font weight.

**Since:** 12

### Bolder

```cangjie
Bolder
```

**Function:** Very thick font weight.

**Since:** 12

### Lighter

```cangjie
Lighter
```

**Function:** Lighter font weight.

**Since:** 12

### Medium

```cangjie
Medium
```

**Function:** Medium font weight.

**Since:** 12

### Normal

```cangjie
Normal
```

**Function:** Normal font weight.

**Since:** 12

### Regular

```cangjie
Regular
```

**Function:** Slightly thicker font weight.

**Since:** 12

### W100

```cangjie
W100
```

**Function:** 100 (thinnest).

**Since:** 12

### W200

```cangjie
W200
```

**Function:** 200.

**Since:** 12

### W300

```cangjie
```
### W300

```cangjie
W300
```

**Function:** 300.

**Initial Version:** 12

### W400

```cangjie
W400
```

**Function:** 400 (Normal).

**Initial Version:** 12

### W500

```cangjie
W500
```

**Function:** 500.

**Initial Version:** 12

### W600

```cangjie
W600
```

**Function:** 600.

**Initial Version:** 12

### W700

```cangjie
W700
```

**Function:** 700.

**Initial Version:** 12

### W800

```cangjie
W800
```

**Function:** 800.

**Initial Version:** 12

### W900

```cangjie
W900
```

**Function:** 900 (Ultra Bold).

**Initial Version:** 12

## enum ForegroundBlurStyle

```cangjie
public enum ForegroundBlurStyle {
    | NONE
    | THIN
    | REGULAR
    | THICK
    | BACKGROUND_THIN
    | BACKGROUND_REGULAR
    | BACKGROUND_THICK
    | BACKGROUND_ULTRA_THICK
    | COMPONENT_ULTRA_THIN
    | COMPONENT_THIN
    | COMPONENT_REGULAR
    | COMPONENT_THICK
    | COMPONENT_ULTRA_THICK
}
```

**Function:** Foreground blur style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### BACKGROUND_REGULAR

```cangjie
BACKGROUND_REGULAR
```

**Function:** Medium-distance depth of field blur.

**Initial Version:** 12

### BACKGROUND_THICK

```cangjie
BACKGROUND_THICK
```

**Function:** Far-distance depth of field blur.

**Initial Version:** 12

### BACKGROUND_THIN

```cangjie
BACKGROUND_THIN
```

**Function:** Close-distance depth of field blur.

**Initial Version:** 12

### BACKGROUND_ULTRA_THICK

```cangjie
BACKGROUND_ULTRA_THICK
```

**Function:** Ultra far-distance depth of field blur.

**Initial Version:** 12

### COMPONENT_REGULAR

```cangjie
COMPONENT_REGULAR
```

**Function:** Component standard material blur.

**Initial Version:** 12

### COMPONENT_THICK

```cangjie
COMPONENT_THICK
```

**Function:** Component thick material blur.

**Initial Version:** 12

### COMPONENT_THIN

```cangjie
COMPONENT_THIN
```

**Function:** Component thin material blur.

**Initial Version:** 12

### COMPONENT_ULTRA_THICK

```cangjie
COMPONENT_ULTRA_THICK
```

**Function:** Component ultra thick material blur.

**Initial Version:** 12

### COMPONENT_ULTRA_THIN

```cangjie
COMPONENT_ULTRA_THIN
```

**Function:** Component ultra thin material blur.

**Initial Version:** 12

### NONE

```cangjie
NONE
```

**Function:** Disable blur.

**Initial Version:** 12

### REGULAR

```cangjie
REGULAR
```

**Function:** Standard thickness material blur.

**Initial Version:** 12

### THICK

```cangjie
THICK
```

**Function:** Thick material blur.

```cangjie
THIN
```

**Function:** Thin material blur.

**Initial Version:** 12

## enum FunctionKey

```cangjie
public enum FunctionKey {
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
    | DPAD_UP
    | DPAD_DOWN
    | DPAD_LEFT
    | DPAD_RIGHT
}
```

**Function:** Keyboard function keys.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DPAD_DOWN

```cangjie
DPAD_DOWN
```

**Function:** Represents the DPAD_DOWN function key on the keyboard.

**Initial Version:** 12

### DPAD_LEFT

```cangjie
DPAD_LEFT
```

**Function:** Represents the DPAD_LEFT function key on the keyboard.

**Initial Version:** 12

### DPAD_RIGHT

```cangjie
DPAD_RIGHT
```

**Function:** Represents the DPAD_RIGHT function key on the keyboard.

**Initial Version:** 12

### DPAD_UP

```cangjie
DPAD_UP
```

**Function:** Represents the DPAD_UP function key on the keyboard.

**Initial Version:** 12

### ESC

```cangjie
ESC
```

**Function:** Represents the ESC function key on the keyboard.

**Initial Version:** 12
### F1

```cangjie
F1
```

**Function:** Represents the F1 function key on the keyboard.

**Initial Version:** 12

### F10

```cangjie
F10
```

**Function:** Represents the F10 function key on the keyboard.

**Initial Version:** 12

### F11

```cangjie
F11
```

**Function:** Represents the F11 function key on the keyboard.

**Initial Version:** 12

### F12

```cangjie
F12
```

**Function:** Represents the F12 function key on the keyboard.

**Initial Version:** 12

### F2

```cangjie
F2
```

**Function:** Represents the F2 function key on the keyboard.

**Initial Version:** 12

### F3

```cangjie
F3
```

**Function:** Represents the F3 function key on the keyboard.

**Initial Version:** 12

### F4

```cangjie
F4
```

**Function:** Represents the F4 function key on the keyboard.

**Initial Version:** 12

### F5

```cangjie
F5
```

**Function:** Represents the F5 function key on the keyboard.

**Initial Version:** 12

### F6

```cangjie
F6
```

**Function:** Represents the F6 function key on the keyboard.

**Initial Version:** 12

### F7

```cangjie
F7
```

**Function:** Represents the F7 function key on the keyboard.

**Initial Version:** 12

### F8

```cangjie
F8
```

**Function:** Represents the F8 function key on the keyboard.

**Initial Version:** 12

### F9

```cangjie
F9
```

**Function:** Represents the F9 function key on the keyboard.

**Initial Version:** 12

### TAB

```cangjie
TAB
```

**Function:** Represents the TAB function key on the keyboard.

**Initial Version:** 12

## enum GradientDirection

```cangjie
public enum GradientDirection {
    | Left
    | Top
    | Right
    | Bottom
    | LeftTop
    | LeftBottom
    | RightTop
    | RightBottom
    | None
}
```

**Function:** Gradient direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Bottom

```cangjie
Bottom
```

**Function:** From top to bottom.

**Initial Version:** 12

### Left

```cangjie
Left
```

**Function:** From right to left.

**Initial Version:** 12

### LeftBottom

```cangjie
LeftBottom
```

**Function:** Bottom-left.

**Initial Version:** 12

### LeftTop

```cangjie
LeftTop
```

**Function:** Top-left.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** None.

**Initial Version:** 12

### Right

```cangjie
Right
```

**Function:** From left to right.

**Initial Version:** 12

### RightBottom

```cangjie
RightBottom
```

**Function:** Bottom-right.

**Initial Version:** 12

### RightTop

```cangjie
RightTop
```

**Function:** Top-right.

**Initial Version:** 12

### Top

```cangjie
Top
```

**Function:** From bottom to top.

**Initial Version:** 12

## enum GridItemStyle

```cangjie
public enum GridItemStyle {
    | NONE
    | PLAIN
}
```

**Function:** Sets the GridItem style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### NONE

```cangjie
NONE
```

**Function:** When set to GridItemStyle.NONE, the Hover and Press state styles are not displayed.

**Initial Version:** 12

### PLAIN

```cangjie
PLAIN
```

**Function:** When set to GridItemStyle.PLAIN, the Hover and Press state styles are displayed.

**Initial Version:** 12

## enum HeightBreakpoint

```cangjie
public enum HeightBreakpoint {
    | HEIGHT_SM
    | HEIGHT_MD
    | HEIGHT_LG
}
```

**Function:** Represents the height breakpoint enumeration values corresponding to different window aspect ratio thresholds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### HEIGHT_LG

```cangjie
HEIGHT_LG
```

**Function:** Window aspect ratio is greater than or equal to 1.2.**Initial Version:** 12  

### HEIGHT_MD  

```cangjie  
HEIGHT_MD  
```  

**Function:** The window's aspect ratio is greater than or equal to 0.8 and less than 1.2.  

**Initial Version:** 12  

### HEIGHT_SM  

```cangjie  
HEIGHT_SM  
```  

**Function:** The window's aspect ratio is less than 0.8.  

**Initial Version:** 12  

## enum HitTestMode  

```cangjie  
public enum HitTestMode {  
    | Default  
    | Block  
    | Transparent  
    | None  
}  
```  

**Function:** Touch test effect.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

### Block  

```cangjie  
Block  
```  

**Function:** The node itself responds to the hit test for touch events but blocks the hit test for child nodes and other nodes obscured by this node.  

**Initial Version:** 12  

### Default  

```cangjie  
Default  
```  

**Function:** Both the node itself and its child nodes respond to the hit test for touch events, but the hit test for other nodes obscured by this node is blocked.  

**Initial Version:** 12  

### None  

```cangjie  
None  
```  

**Function:** The node itself does not respond to the hit test for touch events, but its child nodes perform the hit test for touch events.  

**Initial Version:** 12  

### Transparent  

```cangjie  
Transparent  
```  

**Function:** Both the node itself and its child nodes respond to the hit test for touch events, and the hit test for other nodes obscured by this node is allowed.  

**Initial Version:** 12  

## enum HorizontalAlign  

```cangjie  
public enum HorizontalAlign {  
    | Start  
    | Center  
    | End  
}  
```  

**Function:** Horizontal alignment mode.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

### Center  

```cangjie  
Center  
```  

**Function:** Center alignment, the default alignment mode.  

**Initial Version:** 12  

### End  

```cangjie  
End  
```  

**Function:** Align to the end in the language direction.  

**Initial Version:** 12  

### Start  

```cangjie  
Start  
```  

**Function:** Align to the start in the language direction.  

**Initial Version:** 12  

## enum HoverEffect  

```cangjie  
public enum HoverEffect {  
    | Auto  
    | Scale  
    | Highlight  
    | None  
}  
```  

**Function:** Sets the hover effect for the current component in the hover state.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

### Auto  

```cangjie  
Auto  
```  

**Function:** Uses the system default hover effect for the component.  

**Initial Version:** 12  

### Highlight  

```cangjie  
Highlight  
```  

**Function:** A fade-in and fade-out background highlight effect.  

**Initial Version:** 12  

### None  

```cangjie  
None  
```  

**Function:** No effect is set.  

**Initial Version:** 12  

### Scale  

```cangjie  
Scale  
```  

**Function:** A zoom-in and zoom-out effect.  

**Initial Version:** 12  

## enum HoverModeAreaType  

```cangjie  
public enum HoverModeAreaType {  
    | TOP_SCREEN  
    | BOTTOM_SCREEN  
}  
```  

**Function:** Hover state display area type.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

### BOTTOM_SCREEN  

```cangjie  
BOTTOM_SCREEN  
```  

**Function:** Lower half of the screen.  

**Initial Version:** 12  

### TOP_SCREEN  

```cangjie  
TOP_SCREEN  
```  

**Function:** Upper half of the screen.  

**Initial Version:** 12  

## enum ImageFit  

```cangjie  
public enum ImageFit {  
    | Fill  
    | Contain  
    | Cover  
    | Auto  
    | None  
    | ScaleDown  
    | TOP_START  
    | TOP  
    | TOP_END  
    | START  
    | CENTER  
    | END  
    | BOTTOM_START  
    | BOTTOM  
    | BOTTOM_END  
}  
```  

**Function:** Image display adaptation mode.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

### Auto  

```cangjie  
Auto  
```  

**Function:** The image is scaled appropriately based on its own dimensions and the component's dimensions to fill the view while maintaining its aspect ratio.  

**Initial Version:** 19  

### BOTTOM  

```cangjie  
BOTTOM  
```  

**Function:** The image is displayed horizontally centered at the bottom of the Image component, maintaining its original dimensions.  

**Initial Version:** 19  

### BOTTOM_END  

```cangjie  
BOTTOM_END  
```  

**Function:** The image is displayed at the bottom end of the Image component, maintaining its original dimensions.  

**Initial Version:** 19  

### BOTTOM_START  

```cangjie  
BOTTOM_START  
```  

**Function:** The image is displayed at the bottom start of the Image component, maintaining its original dimensions.  

**Initial Version:** 19  

### CENTER  

```cangjie  
CENTER  
```  

**Function:** The image is displayed centered both horizontally and vertically in the Image component, maintaining its original dimensions.  

**Initial Version:** 19  

### Contain  

```cangjie  
Contain  
``````

**Function:** Scale or enlarge while maintaining the aspect ratio to ensure the image is fully displayed within the boundaries.

**Initial Version:** 12

### Cover

```cangjie
Cover
```

**Function:** Scale or enlarge while maintaining the aspect ratio to ensure both sides of the image are greater than or equal to the display boundaries.

**Initial Version:** 12

### END

```cangjie
END
```

**Function:** The image is displayed vertically centered at the end of the Image component, maintaining its original dimensions.

**Initial Version:** 19

### Fill

```cangjie
Fill
```

**Function:** Scale or enlarge without maintaining the aspect ratio to fill the display boundaries.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** Display with original dimensions.

**Initial Version:** 19

### ScaleDown

```cangjie
ScaleDown
```

**Function:** Display while maintaining the aspect ratio, scaling down or keeping the image unchanged.

**Initial Version:** 19

### START

```cangjie
START
```

**Function:** The image is displayed vertically centered at the start of the Image component, maintaining its original dimensions.

**Initial Version:** 19

### TOP

```cangjie
TOP
```

**Function:** The image is displayed horizontally centered at the top of the Image component, maintaining its original dimensions.

**Initial Version:** 19

### TOP_END

```cangjie
TOP_END
```

**Function:** The image is displayed at the top end of the Image component, maintaining its original dimensions.

**Initial Version:** 19

### TOP_START

```cangjie
TOP_START
```

**Function:** The image is displayed at the top start of the Image component, maintaining its original dimensions.

**Initial Version:** 19

## enum ImageRepeat

```cangjie
public enum ImageRepeat {
    | NoRepeat
    | X
    | Y
    | XY
}
```

**Function:** Image repetition method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### NoRepeat

```cangjie
NoRepeat
```

**Function:** Do not repeat the image.

**Initial Version:** 12

### X

```cangjie
X
```

**Function:** Repeat the image only on the horizontal axis.

**Initial Version:** 12

### XY

```cangjie
XY
```

**Function:** Repeat the image on both axes.

**Initial Version:** 12

### Y

```cangjie
Y
```

**Function:** Repeat the image only on the vertical axis.

**Initial Version:** 12

## enum ImageSize

```cangjie
public enum ImageSize {
    | Contain
    | Cover
    | Auto
    | FILL
}
```

**Function:** Image size display settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Auto

```cangjie
Auto
```

**Function:** Default value, maintain the original image's aspect ratio.

**Initial Version:** 12

### Contain

```cangjie
Contain
```

**Function:** Scale or enlarge while maintaining the aspect ratio to ensure the image is fully displayed within the boundaries.

**Initial Version:** 12

### Cover

```cangjie
Cover
```

**Function:** Scale or enlarge while maintaining the aspect ratio to ensure both sides of the image are greater than or equal to the display boundaries.

**Initial Version:** 12

### FILL

```cangjie
FILL
```

**Function:** Scale or enlarge without maintaining the aspect ratio to fill the display boundaries.

**Initial Version:** 12

## enum ImageSpanAlignment

```cangjie
public enum ImageSpanAlignment {
    | TOP
    | CENTER
    | BOTTOM
    | BASELINE
}
```

**Function:** Image alignment based on line height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### BASELINE

```cangjie
BASELINE
```

**Function:** The bottom edge of the image aligns with the text baseline.

**Initial Version:** 12

### BOTTOM

```cangjie
BOTTOM
```

**Function:** The bottom edge of the image aligns with the bottom edge of the line.

**Initial Version:** 12

### CENTER

```cangjie
CENTER
```

**Function:** The center of the image aligns with the center of the line.

**Initial Version:** 12

### TOP

```cangjie
TOP
```

**Function:** The top edge of the image aligns with the top edge of the line.

**Initial Version:** 12

## enum ImageType

```cangjie
public enum ImageType {
    | png
    | jpeg
    | webp
}
```

**Function:** Specifies the image format.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### jpeg

```cangjie
jpeg
```

**Function:** JPEG image format.

**Initial Version:** 12

### png

```cangjie
png
```

**Function:** PNG image format.

**Initial Version:** 12**Initial Version:** 12

### webp

```cangjie
webp
```

**Function:** WebP image format.

**Initial Version:** 12

## enum ItemAlign

```cangjie
public enum ItemAlign {
    | Auto
    | Start
    | Center
    | End
    | Stretch
    | Baseline
}
```

**Function:** Element alignment method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Auto

```cangjie
Auto
```

**Function:** Uses the default configuration in the Flex container.

**Initial Version:** 12

### Baseline

```cangjie
Baseline
```

**Function:** Elements in the Flex container are aligned along the cross axis based on text baseline.

**Initial Version:** 12

### Center

```cangjie
Center
```

**Function:** Elements in the Flex container are center-aligned along the cross axis.

**Initial Version:** 12

### End

```cangjie
End
```

**Function:** Elements in the Flex container are bottom-aligned along the cross axis.

**Initial Version:** 12

### Start

```cangjie
Start
```

**Function:** Elements in the Flex container are top-aligned along the cross axis.

**Initial Version:** 12

### Stretch

```cangjie
Stretch
```

**Function:** Elements in the Flex container are stretched to fill along the cross axis. When the container is Flex and Wrap is set to FlexWrap.Wrap or FlexWrap.WrapReverse, elements are stretched to match the size of the longest element in the current row/column along the cross axis. In other cases, regardless of whether the element size is set, it will stretch to the container size.

**Initial Version:** 12

## enum KeyboardAvoidMode

```cangjie
public enum KeyboardAvoidMode {
    | DEFAULT
    | NONE
}
```

**Function:** Whether the pop-up automatically avoids the soft keyboard when it appears.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Default avoidance of the soft keyboard with height compression applied after reaching the maximum limit.

**Initial Version:** 12

### NONE

```cangjie
NONE
```

**Function:** Does not avoid the soft keyboard.

**Initial Version:** 12

## enum KeySource

```cangjie
public enum KeySource {
    | Unknown
    | Keyboard
}
```

**Function:** Input device type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Keyboard

```cangjie
Keyboard
```

**Function:** Input device type is keyboard.

**Initial Version:** 12

### Unknown

```cangjie
Unknown
```

**Function:** Input device type is unknown.

**Initial Version:** 12

## enum KeyType

```cangjie
public enum KeyType {
    | Down
    | Up
}
```

**Function:** Key type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Down

```cangjie
Down
```

**Function:** Key press.

**Initial Version:** 12

### Up

```cangjie
Up
```

**Function:** Key release.

**Initial Version:** 12

## enum LayoutSafeAreaEdge

```cangjie
public enum LayoutSafeAreaEdge {
    | TOP
    | BOTTOM
}
```

**Function:** Direction for extending the safe area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### BOTTOM

```cangjie
BOTTOM
```

**Function:** Bottom area.

**Initial Version:** 12

### TOP

```cangjie
TOP
```

**Function:** Top area.

**Initial Version:** 12

## enum LayoutSafeAreaType

```cangjie
public enum LayoutSafeAreaType {
    SYSTEM
}
```

**Function:** Enum type for extending the layout safe area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### SYSTEM

```cangjie
SYSTEM
```

**Function:** System default non-safe area, including status bar and navigation bar.

**Initial Version:** 12

## enum LengthMetricsUnit

```cangjie
public enum LengthMetricsUnit {
    | DEFAULT
    | PX
}
```

**Function:** Enum for length attribute units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Length type, describing length in default vp pixel units.

**Initial Version:** 12

### PX

```cangjie
PX
```

**Function:** Length type, describing length in px pixel units.

**Initial Version:** 12

## enum LengthType

```cangjie
public enum LengthType {
    | px
    | vp
    | fp
    | percent
    | lpx
}
```

**Function:** Length type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### fp

```cangjie
fp
```

**Function:** Font pixel unit.

**Initial Version:** 12

### lpx

```cangjie
lpx
```

**Function:** Logical pixel unit.

**Initial Version:** 12

### percent

```cangjie
percent
```

**Function:** Percentage.

**Initial Version:** 12

### px

```cangjie
px
```

**Function:** Basic pixel unit.

**Initial Version:** 12

### vp

```cangjie
vp
```

**Function:** Screen density unit.

**Initial Version:** 12

## enum LineBreakStrategy

```cangjie
public enum LineBreakStrategy {
    | GREEDY
    | HIGH_QUALITY
    | BALANCED
}
```

**Function:** Text line breaking rules.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### BALANCED

```cangjie
BALANCED
```

**Function:** Ensures that each line in a paragraph has the same width as much as possible without word splitting.

**Initial Version:** 12

### GREEDY

```cangjie
GREEDY
```

**Function:** Displays as many characters as possible in each line before breaking to the next line.

**Initial Version:** 12

### HIGH_QUALITY

```cangjie
HIGH_QUALITY
```

**Function:** Based on BALANCED, fills lines as much as possible with lower weight on the last line, which may result in more whitespace on the last line.

**Initial Version:** 12

## enum LineCapStyle

```cangjie
public enum LineCapStyle {
    | Butt
    | Round
    | Square
}
```

**Function:** Line style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Butt

```cangjie
Butt
```

**Function:** The ends of the line are parallel without additional extension.

**Initial Version:** 12

### Round

```cangjie
Round
```

**Function:** Extends a half-circle at each end of the line, with a diameter equal to the line width.

**Initial Version:** 12

### Square

```cangjie
Square
```

**Function:** Extends a half-square at each end of the line, with a diameter equal to the line width.

**Initial Version:** 12

## enum LineJoinStyle

```cangjie
public enum LineJoinStyle {
    | Miter
    | Round
    | Bevel
}
```

**Function:** Path segment connection method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Bevel

```cangjie
Bevel
```

**Function:** Uses bevel to connect path segments.

**Initial Version:** 12

### Miter

```cangjie
Dotted
```

**Function:** Uses sharp angles to connect path segments.

**Initial Version:** 12

### Round

```cangjie
Round
```

**Function:** Uses rounded corners to connect path segments.

**Initial Version:** 12

## enum ListItemAlign

```cangjie
public enum ListItemAlign {
    | Start
    | Center
    | End
}
```

**Function:** Alignment of ListItem along the cross axis in a List.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Center

```cangjie
Center
```

**Function:** Aligns ListItem to the center along the cross axis in a List.

**Initial Version:** 12

### End

```cangjie
End
```

**Function:** Aligns ListItem to the end along the cross axis in a List.

**Initial Version:** 12

### Start

```cangjie
Start
```

**Function:** Aligns ListItem to the start along the cross axis in a List.

**Initial Version:** 12

## enum ListItemGroupArea

```cangjie
public enum ListItemGroupArea {
    | NONE
    | IN_LIST_ITEM_AREA
    | IN_HEADER_AREA
    | IN_FOOTER_AREA
}
```

**Function:** Indicates which area of ListItemGroup is currently visible.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### IN_FOOTER_AREA

```cangjie
IN_FOOTER_AREA
```

**Function:** The current visible edge is in the footer position.

**Initial Version:** 12

### IN_HEADER_AREA

```cangjie
IN_HEADER_AREA
```

**Function:** The current visible edge is in the header position.

**Initial Version:** 12

### IN_LIST_ITEM_AREA

```cangjie
IN_LIST_ITEM_AREA
```

**Function:** The current visible edge is in the ListItem position.

**Initial Version:** 12

### NONE

```cangjie
NONE
```

**Function:** The current visible edge is in the none position. For example, when a ListItemGroup has neither header, footer, nor ListItem.

**Initial Version:** 12
## enum MarqueeUpdateStrategy

```cangjie
public enum MarqueeUpdateStrategy {
    | DEFAULT
    | PRESERVE_POSITION
}
```

**Function:** Marquee effect update strategy.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### DEFAULT

```cangjie
DEFAULT
```

**Function:** After updating the marquee component properties, the marquee effect runs from the starting position.

**Since:** 12

### PRESERVE_POSITION

```cangjie
PRESERVE_POSITION
```

**Function:** After updating the marquee component properties, the marquee effect continues from the current position.

**Since:** 12

## enum MenuPolicy

```cangjie
public enum MenuPolicy {
    | Default
    | Hide
    | Show
}
```

**Function:** Menu display policy.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Determines whether to display the menu based on the underlying default logic.

**Since:** 12

### HIDE

```cangjie
HIDE
```

**Function:** Never display the menu.

**Since:** 12

### SHOW

```cangjie
SHOW
```

**Function:** Always display the menu.

**Since:** 12

## enum MenuPreviewMode

```cangjie
public enum MenuPreviewMode {
    | NONE
    | IMAGE
}
```

**Function:** Preview content style for menus.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### IMAGE

```cangjie
IMAGE
```

**Function:** Preview content is a screenshot of the component that triggered the long-press floating menu.

**Since:** 12

### NONE

```cangjie
NONE
```

**Function:** No preview content is displayed.

**Since:** 12

## enum ModalTransition

```cangjie
public enum ModalTransition {
    | DEFAULT
    | NONE
    | ALPHA
}
```

**Function:** Full-screen modal transition animation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### ALPHA

```cangjie
ALPHA
```

**Function:** Full-screen modal transparency gradient animation.

**Since:** 12

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Full-screen modal vertical transition animation.

**Since:** 12

### NONE

```cangjie
NONE
```

**Function:** No transition animation for full-screen modal.

**Since:** 12

## enum ModifierKey

```cangjie
public enum ModifierKey {
    | CTRL
    | SHIFT
    | ALT
}
```

**Function:** Input method modifier key types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### ALT

```cangjie
ALT
```

**Function:** Represents the Alt key on the keyboard.

**Since:** 12

### CTRL

```cangjie
CTRL
```

**Function:** Represents the Ctrl key on the keyboard.

**Since:** 12

### SHIFT

```cangjie
SHIFT
```

**Function:** Represents the Shift key on the keyboard.

**Since:** 12

## enum MouseAction

```cangjie
public enum MouseAction {
    | Press
    | Release
    | Move
    | Hover
}
```

**Function:** Mouse actions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### Hover

```cangjie
Hover
```

**Function:** Mouse hover. **Note:** This enum value is invalid.

**Since:** 12

### Move

```cangjie
Move
```

**Function:** Mouse movement.

**Since:** 12

### Press

```cangjie
Press
```

**Function:** Mouse button press.

**Since:** 12

### Release

```cangjie
Release
```

**Function:** Mouse button release.

**Since:** 12

## enum MouseButton

```cangjie
public enum MouseButton {
    | None
    | Left
    | Right
    | Middle
    | Back
    | Forward
}
```

**Function:** Mouse buttons.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

### Back

```cangjie
Back
```

**Function:** Left back button on the mouse.

**Since:** 12

### Forward

```cangjie
Forward
```
**Function:** Mouse forward button (left side).

**Initial Version:** 12

### Left

```cangjie
Left
```

**Function:** Mouse left button.

**Initial Version:** 12

### Middle

```cangjie
Middle
```

**Function:** Mouse middle button.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** No button.

**Initial Version:** 12

### Right

```cangjie
Right
```

**Function:** Mouse right button.

**Initial Version:** 12

## enum NestedScrollMode

```cangjie
public enum NestedScrollMode {
    | SELF_ONLY
    | SELF_FIRST
    | PARENT_FIRST
    | PARALLEL
}
```

**Function:** Nested scrolling options when scrollable components reach the end.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### PARALLEL

```cangjie
PARALLEL
```

**Function:** Both the component and its parent scroll simultaneously. When both reach the edge, if the component has an edge effect, it triggers its own edge effect; otherwise, the parent component's edge effect is triggered.

**Initial Version:** 12

### PARENT_FIRST

```cangjie
PARENT_FIRST
```

**Function:** The parent component scrolls first. After the parent reaches the edge, the component itself scrolls. When the component reaches the edge, if it has an edge effect, its own edge effect is triggered; otherwise, the parent's edge effect is triggered.

**Initial Version:** 12

### SELF_FIRST

```cangjie
SELF_FIRST
```

**Function:** The component itself scrolls first. After reaching the edge, the parent component scrolls. When the parent reaches the edge, if it has an edge effect, the parent's edge effect is triggered; otherwise, the child component's edge effect is triggered.

**Initial Version:** 12

### SELF_ONLY

```cangjie
SELF_ONLY
```

**Function:** Only the component itself scrolls, without interaction with the parent component.

**Initial Version:** 12

## enum ObscuredReasons

```cangjie
public enum ObscuredReasons {
    | PLACEHOLDER
}
```

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### PLACEHOLDER

```cangjie
PLACEHOLDER
```

**Function:** Displays generic placeholder data.

**Initial Version:** 12

## enum OptionWidthMode

```cangjie
public enum OptionWidthMode {
    | FIT_CONTENT
    | FIT_TRIGGER
}
```

**Function:** Dropdown menu width settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### FIT_CONTENT

```cangjie
FIT_CONTENT
```

**Function:** When set, the dropdown menu width displays by default in 2 grid units.

**Initial Version:** 12

### FIT_TRIGGER

```cangjie
FIT_TRIGGER
```

**Function:** Sets the dropdown menu to inherit the width of the dropdown button.

**Initial Version:** 12

## enum OutlineStyle

```cangjie
public enum OutlineStyle {
    | SOLID
    | DASHED
    | DOTTED
}
```

**Function:** Outline style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DASHED

```cangjie
DASHED
```

**Function:** Displays as a series of short square dashes.

**Initial Version:** 12

### DOTTED

```cangjie
DOTTED
```

**Function:** Displays as a series of round dots, with a radius equal to half of `outlineWidth`.

**Initial Version:** 12

### SOLID

```cangjie
SOLID
```

**Function:** Displays as a solid line.

**Initial Version:** 12

## enum PixelRoundCalcPolicy

```cangjie
public enum PixelRoundCalcPolicy {
    | NO_FORCE_ROUND
    | FORCE_CEIL
    | FORCE_FLOOR
}
```

**Function:** Component boundary rounding policy.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### FORCE_CEIL

```cangjie
FORCE_CEIL
```

**Function:** Round up calculation.

**Initial Version:** 12

### FORCE_FLOOR

```cangjie
FORCE_FLOOR
```

**Function:** Round down calculation.

**Initial Version:** 12

### NO_FORCE_ROUND

```cangjie
NO_FORCE_ROUND
```

**Function:** No rounding calculation.

**Initial Version:** 12

## enum Placement

```cangjie
public enum Placement {
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
}
```

**Function:** Bubble prompt position settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Bottom

```cangjie
Bottom
```

**Function:** Bubble prompt is positioned below the component, aligned with the center of the component's bottom edge.

**Initial Version:** 12

### BottomLeft

```cangjie
BottomLeft
```

**Function:** Bubble prompt is positioned below the component, aligned with the left edge of the component.

**Initial Version:** 12

### BottomRight

```cangjie
BottomRight
```

**Function:** The bubble prompt is positioned below the component and aligned with the right edge of the component.

**Initial Version:** 12

### Left

```cangjie
Left
```

**Function:** The bubble prompt is positioned to the left of the component and aligned with the center of the left side of the component.

**Initial Version:** 12

### LeftBottom

```cangjie
LeftBottom
```

**Function:** The bubble prompt is positioned to the left of the component and aligned with the bottom edge of the component.

**Initial Version:** 12

### LeftTop

```cangjie
LeftTop
```

**Function:** The bubble prompt is positioned to the left of the component and aligned with the top edge of the component.

**Initial Version:** 12

### Right

```cangjie
Right
```

**Function:** The bubble prompt is positioned to the right of the component and aligned with the center of the right side of the component.

**Initial Version:** 12

### RightBottom

```cangjie
RightBottom
```

**Function:** The bubble prompt is positioned to the right of the component and aligned with the bottom edge of the component.

**Initial Version:** 12

### RightTop

```cangjie
RightTop
```

**Function:** The bubble prompt is positioned to the right of the component and aligned with the top edge of the component.

**Initial Version:** 12

### Top

```cangjie
Top
```

**Function:** The bubble prompt is positioned above the component and aligned with the center of the top side of the component.

**Initial Version:** 12

### TopLeft

```cangjie
TopLeft
```

**Function:** The bubble prompt is positioned above the component and aligned with the left edge of the component.

**Initial Version:** 12

### TopRight

```cangjie
TopRight
```

**Function:** The bubble prompt is positioned above the component and aligned with the right edge of the component.

**Initial Version:** 12

## enum PlayMode

```cangjie
public enum PlayMode {
    | Normal
    | Reverse
    | Alternate
    | AlternateReverse
}
```

**Function:** Animation playback direction settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Alternate

```cangjie
Alternate
```

**Function:** The animation plays forward on odd counts (1, 3, 5...) and backward on even counts (2, 4, 6...).

**Initial Version:** 12

### AlternateReverse

```cangjie
AlternateReverse
```

**Function:** The animation plays backward on odd counts (1, 3, 5...) and forward on even counts (2, 4, 6...).

**Initial Version:** 12

### Normal

```cangjie
Normal
```

**Function:** The animation plays forward.

**Initial Version:** 12

### Reverse

```cangjie
Reverse
```

**Function:** The animation plays backward.

**Initial Version:** 12

## enum ProgressType

```cangjie
public enum ProgressType {
    | Linear
    | Ring
    | Eclipse
    | ScaleRing
    | Capsule
}
```

**Function:** Style types for the Progress component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Capsule

```cangjie
Capsule
```

**Function:** Capsule style. The progress display effect at the rounded ends is the same as Eclipse; the progress display effect in the middle section is the same as Linear. Automatically adjusts to vertical display when the height is greater than the width.

**Initial Version:** 12

### Eclipse

```cangjie
Eclipse
```

**Function:** Circular style, displaying a progress effect similar to the waxing and waning of the moon, transitioning from a crescent to a full moon.

**Initial Version:** 12

### Linear

```cangjie
Linear
```

**Function:** Linear style.

**Initial Version:** 12

### Ring

```cangjie
Ring
```

**Function:** Ring style without scales, where the ring gradually fills to completion.

**Initial Version:** 12

### ScaleRing

```cangjie
ScaleRing
```

**Function:** Ring style with scales, displaying a progress effect similar to clock markings.

**Initial Version:** 12

## enum QualityType

```cangjie
public enum QualityType {
    | Low
    | Medium
    | High
}
```

**Function:** Sets the image smoothness.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### high

```cangjie
high
```

**Function:** High quality.

**Initial Version:** 12

### low

```cangjie
low
```

**Function:** Low quality.

**Initial Version:** 12

### medium

```cangjie
medium
```

**Function:** Medium quality.

**Initial Version:** 12

## enum RefreshStatus

```cangjie
public enum RefreshStatus {
    | Inactive
    | Drag
    | OverDrag
    | Refresh
    | Done
}
```

**Function:** Pull-down status.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Inactive

```cangjie
Inactive
```

**Function:** Default non-pulled state.

**Initial Version:** 12

### Drag

```cangjie
Drag
```
**Feature:** During pull-down, the pull-down distance is less than the refresh distance.

**Initial Version:** 12

### OverDrag

```cangjie
OverDrag
```

**Feature:** During pull-down, the pull-down distance exceeds the refresh distance.

**Initial Version:** 12

### Refresh

```cangjie
Refresh
```

**Feature:** Pull-down ends, rebounds to the refresh distance, and enters the refresh state.

**Initial Version:** 12

### Done

```cangjie
Done
```

**Feature:** Refresh ends, returns to the initial state (top).

**Initial Version:** 12

## enum RelateType

```cangjie
public enum RelateType {
    | FILL
    | FIT
}
```

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### FILL

```cangjie
FILL
```

**Feature:** Scales the current child component to fill the parent component.

**Initial Version:** 12

### FIT

```cangjie
FIT
```

**Feature:** Scales the current child component to fit the parent component.

**Initial Version:** 12

## enum Repetition

```cangjie
public enum Repetition {
    | repeat
    | repeat_x
    | repeat_y
    | no_repeat
    | clamp
    | mirror
}
```

**Feature:** Sets the method of image repetition.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### clamp

```cangjie
clamp
```

**Feature:** When drawing outside the original boundaries, the edge color is used for the excess parts.

**Initial Version:** 12

### mirror

```cangjie
mirror
```

**Feature:** Repeats and flips the image along the x-axis and y-axis.

**Initial Version:** 12

### no_repeat

```cangjie
no_repeat
```

**Feature:** Does not repeat the image.

**Initial Version:** 12

### repeat

```cangjie
repeat
```

**Feature:** Repeats the image along the x-axis and y-axis.

**Initial Version:** 12

### repeat_x

```cangjie
repeat_x
```

**Feature:** Repeats the image along the x-axis.

**Initial Version:** 12

### repeat_y

```cangjie
repeat_y
```

**Feature:** Repeats the image along the y-axis.

**Initial Version:** 12

## enum ResourceType

```cangjie
public enum ResourceType {
    | ResColor
    | Float
    | String
    | Plural
    | Boolean
    | IntArray
    | Integer
    | Pattern
    | StrArray
    | Media
    | Rawfile
}
```

**Feature:** The type of resource to be written.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Boolean

```cangjie
Boolean
```

**Feature:** Boolean type.

**Initial Version:** 12

### Float

```cangjie
Float
```

**Feature:** Float type.

**Initial Version:** 12

### IntArray

```cangjie
IntArray
```

**Feature:** int array type.

**Initial Version:** 12

### Integer

```cangjie
Integer
```

**Feature:** Integer type.

**Initial Version:** 12

### Media

```cangjie
Media
```

**Feature:** Media type.

**Initial Version:** 12

### Pattern

```cangjie
Pattern
```

**Feature:** Pattern type.

**Initial Version:** 12

### Plural

```cangjie
Plural
```

**Feature:** Plural type.

**Initial Version:** 12

### Rawfile

```cangjie
Rawfile
```

**Feature:** Rawfile type.

**Initial Version:** 12

### ResColor

```cangjie
ResColor
```

**Feature:** ResColor type.

**Initial Version:** 12

### StrArray

```cangjie
StrArray
```

**Feature:** StrArray type.

**Initial Version:** 12

### String

```cangjie
String
```

**Feature:** String type.

**Initial Version:** 12

## enum ResponseType

```cangjie
public enum ResponseType {
    | RightClick
    | LongPress
}
```

**Feature:** Response type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### LongPress

```cangjie
LongPress
```

**Function:** Triggers menu popup via long press.

**Initial Version:** 12

### RightClick

```cangjie
RightClick
```

**Function:** Triggers menu popup via right mouse click.

**Initial Version:** 12

## enum RichEditorResponseType

```cangjie
public enum RichEditorResponseType {
    | LONG_PRESS
    | RIGHT_CLICK
    | SELECT
}
```

**Function:** Response type of the menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### LONG_PRESS

```cangjie
LONG_PRESS
```

**Function:** Triggers menu popup via long press.

**Initial Version:** 12

### RIGHT_CLICK

```cangjie
RIGHT_CLICK
```

**Function:** Triggers menu popup via right mouse click.

**Initial Version:** 12

### SELECT

```cangjie
SELECT
```

**Function:** Triggers menu popup via mouse selection.

**Initial Version:** 12

## enum ScrollBarDirection

```cangjie
public enum ScrollBarDirection {
    | Vertical
    | Horizontal
}
```

**Function:** Sets the direction of the scroll bar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Vertical

```cangjie
Vertical
```

**Function:** Sets the scroll bar direction to vertical.

**Initial Version:** 12

### Horizontal

```cangjie
Horizontal
```

**Function:** Sets the scroll bar direction to horizontal.

**Initial Version:** 12

## enum ScrollDirection

```cangjie
public enum ScrollDirection {
    | Vertical
    | Horizontal
    | None
}
```

**Function:** Enumeration of scroll directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Horizontal

```cangjie
Horizontal
```

**Function:** Supports horizontal scrolling only.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** Disables scrolling.

**Initial Version:** 12

### Vertical

```cangjie
Vertical
```

**Function:** Supports vertical scrolling only.

**Initial Version:** 12

## enum ScrollSource

```cangjie
public enum ScrollSource {
    | DRAG
    | FLING
    | EDGE_EFFECT
    | OTHER_USER_INPUT
    | SCROLL_BAR
    | SCROLL_BAR_FLING
    | SCROLLER
    | SCROLLER_ANIMATION
}
```

**Function:** Source of scroll operations.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DRAG

```cangjie
DRAG
```

**Function:** Drag event.

**Initial Version:** 12

### EDGE_EFFECT

```cangjie
EDGE_EFFECT
```

**Function:** Edge scrolling effect of EdgeEffect.Spring.

**Initial Version:** 12

### FLING

```cangjie
FLING
```

**Function:** Inertial scrolling after drag ends.

**Initial Version:** 12

### OTHER_USER_INPUT

```cangjie
OTHER_USER_INPUT
```

**Function:** Other user inputs besides dragging, such as mouse wheel, keyboard events, etc.

**Initial Version:** 12

### SCROLL_BAR

```cangjie
SCROLL_BAR
```

**Function:** Drag event of the scroll bar.

**Initial Version:** 12

### SCROLL_BAR_FLING

```cangjie
SCROLL_BAR_FLING
```

**Function:** Inertial scrolling with velocity after scroll bar drag ends.

**Initial Version:** 12

### SCROLLER

```cangjie
SCROLLER
```

**Function:** Non-animated methods of Scroller.

**Initial Version:** 12

### SCROLLER_ANIMATION

```cangjie
SCROLLER_ANIMATION
```

**Function:** Animated methods of Scroller.

**Initial Version:** 12

## enum ScrollState

```cangjie
public enum ScrollState {
    | Idle
    | Scrolling
    | Fling
}
```

**Function:** Sets the current scroll state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Fling

```cangjie
Fling
```

**Function:** Inertial scrolling state.

**Initial Version:** 12

### Idle

```cangjie
Idle
```

**Function:** Non-scrolling state.

**Initial Version:** 12

### Scrolling

```cangjie
Scrolling
```

**Function:** Finger dragging state.

**Initial Version:** 12

## enum StickyStyle

```cangjie
public enum StickyStyle {
    | None
    | Header
    | Footer
    | Both
}
```
**Function:** Sets whether the header and footer of ListItemGroup should stick to the top or bottom.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 12

### None

```cangjie
None
```

**Function:** Sets the header of ListItemGroup not to stick to the top and the footer not to stick to the bottom.

**Since Version:** 12

### Header

```cangjie
Header
```

**Function:** Sets the header of ListItemGroup to stick to the top.

**Since Version:** 12

### Footer

```cangjie
Footer
```

**Function:** Sets the footer of ListItemGroup to stick to the bottom.

**Since Version:** 12

### Both

```cangjie
Both
```

**Function:** Sets the header of ListItemGroup to stick to the top and the footer to stick to the bottom.

**Since Version:** 12

## enum SwipeEdgeEffect

```cangjie
public enum SwipeEdgeEffect {
    | Spring
    | None
}
```

**Function:** Swipe effect for ListItem.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 12

### Spring

```cangjie
Spring
```

**Function:** ListItem can continue to swipe after the swipe distance exceeds the size of the swipe-out component, and will rebound according to the spring damping curve upon release.

**Since Version:** 12

### CARD

```cangjie
CARD
```

**Function:** The swipe distance of ListItem cannot exceed the size of the swipe-out component.

**Since Version:** 12

## enum ShadowStyle

```cangjie
public enum ShadowStyle {
    | OUTER_DEFAULT_XS
    | OUTER_DEFAULT_SM
    | OUTER_DEFAULT_MD
    | OUTER_DEFAULT_LG
    | OUTER_FLOATING_SM
    | OUTER_FLOATING_MD
}
```

**Function:** Shadow style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 12

### OUTER_DEFAULT_LG

```cangjie
OUTER_DEFAULT_LG
```

**Function:** Large shadow.

**Since Version:** 12

### OUTER_DEFAULT_MD

```cangjie
OUTER_DEFAULT_MD
```

**Function:** Medium shadow.

**Since Version:** 12

### OUTER_DEFAULT_SM

```cangjie
OUTER_DEFAULT_SM
```

**Function:** Small shadow.

**Since Version:** 12

### OUTER_DEFAULT_XS

```cangjie
OUTER_DEFAULT_XS
```

**Function:** Extra small shadow.

**Since Version:** 12

### OUTER_FLOATING_MD

```cangjie
OUTER_FLOATING_MD
```

**Function:** Floating medium shadow.

**Since Version:** 12

### OUTER_FLOATING_SM

```cangjie
OUTER_FLOATING_SM
```

**Function:** Floating small shadow.

**Since Version:** 12

## enum ShadowType

```cangjie
public enum ShadowType {
    | COLOR
    | BLUR
}
```

**Function:** Shadow type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 12

### BLUR

```cangjie
BLUR
```

**Function:** Blur.

**Since Version:** 12

### COLOR

```cangjie
COLOR
```

**Function:** Color.

**Since Version:** 12

## enum ShapeType

```cangjie
public enum ShapeType {
    | Normal
    | Capsule
    | CircleType
}
```

**Function:** Component shape type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 12

### Capsule

```cangjie
Capsule
```

**Function:** Capsule shape.

**Since Version:** 12

### CircleType

```cangjie
CircleType
```

**Function:** Circular shape.

**Since Version:** 12

### Normal

```cangjie
Normal
```

**Function:** Normal shape.

**Since Version:** 12

## enum SharedTransitionEffectType

```cangjie
public enum SharedTransitionEffectType {
    | SharedEffectStatic
    | SharedEffectExchange
}
```

**Function:** Shared element transition animation type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 12

### SharedEffectExchange

```cangjie
SharedEffectExchange
```

**Function:** Moves the source page element to the target page element position with appropriate scaling.

**Since Version:** 12

### SharedEffectStatic

```cangjie
SharedEffectStatic
```

**Function:** The position of the target page element remains unchanged, and opacity animation can be configured. Currently, only static effects configured for redirecting to the target page will take effect.

**Since Version:** 12

## enum SideBarContainerType

```cangjie
public enum SideBarContainerType {
    | Embed
    | Overlay
    | AUTO
}
```

**Function:** Enumeration for the sidebar style inside the container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 12

### AUTO

```cangjie
AUTO
```

**Function:** When the component size is greater than or equal to minSideBarWidth + minContentWidth, it is displayed in Embed mode.When the component size is smaller than `minSideBarWidth + minContentWidth`, it will be displayed in Overlay mode. contagrid

If `minSideBarWidth` or `minContentWidth` is not set, the default values of the unset interfaces will be used for calculation. If the calculated value is less than 600vp, 600vp will be used as the breakpoint value for mode switching.

### Embed

```cangjie
Embed
```

**Function:** The sidebar is embedded within the component and displayed alongside the content area.

When the component size is smaller than `minSideBarWidth + minContentWidth` and `showSideBar` is not set, the sidebar will be automatically hidden.

If `minSideBarWidth` or `minContentWidth` is not set, the default values of the unset interfaces will be used for calculation.

After the sidebar is automatically hidden, if it is summoned by clicking the control button, the sidebar will float and display above the content area.

### Overlay

```cangjie
Overlay
```

**Function:** The sidebar floats above the content area.

**Initial Version:** 12

## enum SideBarPosition

```cangjie
public enum SideBarPosition {
    | Start
    | End
}
```

**Function:** Sets the display position of the sidebar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### End

```cangjie
End
```

**Function:** The sidebar is positioned on the right side of the container.

**Initial Version:** 12

### Start

```cangjie
Start
```

**Function:** The sidebar is positioned on the left side of the container.

**Initial Version:** 12

## enum SourceTool

```cangjie
public enum SourceTool {
    | Unknown
    | Finger
    | Pen
    | Mouse
    | Touchpad
    | Joystick
}
```

**Function:** Event input source.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Finger

```cangjie
Finger
```

**Function:** Finger input.

**Initial Version:** 12

### Joystick

```cangjie
Joystick
```

**Function:** Joystick input.

**Initial Version:** 12

### Mouse

```cangjie
Mouse
```

**Function:** Mouse input.

**Initial Version:** 12

### Pen

```cangjie
Pen
```

**Function:** Stylus input.

**Initial Version:** 12

### Touchpad

```cangjie
Touchpad
```

**Function:** Touchpad input. Single-finger input on a touchpad is treated as a mouse input operation.

**Initial Version:** 12

### Unknown

```cangjie
Unknown
```

**Function:** Unknown input source.

**Initial Version:** 12

## enum SourceType

```cangjie
public enum SourceType {
    | Unknown
    | Mouse
    | TouchScreen
}
```

**Function:** Event input device.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Mouse

```cangjie
Mouse
```

**Function:** Mouse.

**Initial Version:** 12

### TouchScreen

```cangjie
TouchScreen
```

**Function:** Touchscreen.

**Initial Version:** 12

### Unknown

```cangjie
Unknown
```

**Function:** Unknown device.

**Initial Version:** 12

## enum SwiperNestedScrollMode

```cangjie
public enum SwiperNestedScrollMode {
    | SELF_ONLY
    | SELF_FIRST
}
```

**Function:** Enumeration for nested scrolling mode between Swiper component and its parent component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### SELF_FIRST

```cangjie
SELF_FIRST
```

**Function:** The Swiper scrolls first, and when it reaches the edge, the parent component scrolls. After the parent component scrolls to the edge, if the parent component has an edge effect, the parent component triggers the edge effect; otherwise, the Swiper triggers the edge effect.

**Initial Version:** 12

### SELF_ONLY

```cangjie
SELF_ONLY
```

**Function:** The Swiper scrolls only by itself without interacting with the parent component.

**Initial Version:** 12

## enum TextAlign

```cangjie
public enum TextAlign {
    | Start
    | Center
    | End
    | JUSTIFY
}
```

**Function:** Text alignment method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Center

```cangjie
Center
```

**Function:** Horizontally center-aligned.

**Initial Version:** 12

### End

```cangjie
End
```

**Function:** Horizontally aligned to the end.

**Initial Version:** 12

### JUSTIFY

```cangjie
JUSTIFY
```

**Function:** Justified alignment.

**Initial Version:** 12

### Start

```cangjie
Start
```

**Function:** Horizontally aligned to the start.

**Initial Version:** 12

## enum TextAlignStyle

```cangjie
public enum TextAlignStyle {
    | Left
    | Right
    | Center
    | Justify
    | Start
    | End
}
```

**Function:** Text alignment style type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12### Center

```cangjie
Center
```

**Function:** Center-aligns text.

**Initial Version:** 12

### End

```cangjie
End
```

**Function:** Aligns text to the end boundary.

**Initial Version:** 12

### Justify

```cangjie
Justify
```

**Function:** Justifies text.

**Initial Version:** 12

### Left

```cangjie
Left
```

**Function:** Left-aligns text.

**Initial Version:** 12

### Right

```cangjie
Right
```

**Function:** Right-aligns text.

**Initial Version:** 12

### Start

```cangjie
Start
```

**Function:** Aligns text to the start boundary.

**Initial Version:** 12

## enum TextBaseline

```cangjie
public enum TextBaseline {
    | Alphabetic
    | Ideographic
    | Top
    | Bottom
    | Middle
    | Hanging
}
```

**Function:** Sets horizontal alignment in text rendering.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Alphabetic

```cangjie
Alphabetic
```

**Function:** The text baseline is the standard alphabetic baseline.

**Initial Version:** 12

### Bottom

```cangjie
Bottom
```

**Function:** The text baseline is at the bottom of the text block. The difference from the ideographic baseline is that the ideographic baseline does not need to consider descenders.

**Initial Version:** 12

### Hanging

```cangjie
Hanging
```

**Function:** The text baseline is the hanging baseline.

**Initial Version:** 12

### Ideographic

```cangjie
Ideographic
```

**Function:** The text baseline is the ideographic baseline. If a character itself extends below the alphabetic baseline, the ideographic baseline position is at the bottom of the character.

**Initial Version:** 12

### Middle

```cangjie
Middle
```

**Function:** The text baseline is at the middle of the text block.

**Initial Version:** 12

### Top

```cangjie
Top
```

**Function:** The text baseline is at the top of the text block.

**Initial Version:** 12

## enum TextCase

```cangjie
public enum TextCase {
    | Normal
    | LowerCase
    | UpperCase
}
```

**Function:** Text case formatting.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### LowerCase

```cangjie
LowerCase
```

**Function:** Text is rendered in all lowercase.

**Initial Version:** 12

### Normal

```cangjie
Normal
```

**Function:** Preserves the original text case.

**Initial Version:** 12

### UpperCase

```cangjie
UpperCase
```

**Function:** Text is rendered in all uppercase.

**Initial Version:** 12

## enum TextContentStyle

```cangjie
public enum TextContentStyle {
    | DEFAULT
    | INLINE
}
```

**Function:** Polymorphic styles for text boxes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Default style. The cursor width is 1.5vp, and the cursor height relates to the text selection background height and font size.

**Initial Version:** 12

### INLINE

```cangjie
INLINE
```

**Function:** Inline input style. The text selection background height matches the input box height.
Inline input is used in scenarios with clear distinctions between edit and non-edit states, such as renaming in a file list view.
The `showError` property is not supported.
Text dragging is not supported in inline mode.

## enum TextDecorationStyle

```cangjie
public enum TextDecorationStyle {
    | SOLID
    | DOUBLE
    | DOTTED
    | DASHED
    | WAVY
}
```

**Function:** Sets text decoration line styles.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DASHED

```cangjie
DASHED
```

**Function:** Dashed line.

**Initial Version:** 12

### DOTTED

```cangjie
DOTTED
```

**Function:** Dotted line.

**Initial Version:** 12

### DOUBLE

```cangjie
DOUBLE
```

**Function:** Double solid line.

**Initial Version:** 12

### SOLID

```cangjie
SOLID
```

**Function:** Single solid line (default).

**Initial Version:** 12

### WAVY

```cangjie
WAVY
```

**Function:** Wavy line.

**Initial Version:** 12

## enum TextDecorationType

```cangjie
public enum TextDecorationType {
    | None
    | Underline
    | Overline
    | LineThrough
}
```
**Function:** Enumeration of decorative line types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### LineThrough

```cangjie
LineThrough
```

**Function:** A decorative line that crosses through the text.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** No text decoration line is applied.

**Initial Version:** 12

### Overline

```cangjie
Overline
```

**Function:** A decorative line above the text.

**Initial Version:** 12

### Underline

```cangjie
Underline
```

**Function:** A decorative line below the text.

**Initial Version:** 12

## enum TextHeightAdaptivePolicy

```cangjie
public enum TextHeightAdaptivePolicy {
    | MAX_LINES_FIRST
    | MIN_FONT_SIZE_FIRST
    | LAYOUT_CONSTRAINT_FIRST
}
```

**Function:** Sets the text height adaptation method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### LAYOUT_CONSTRAINT_FIRST

```cangjie
LAYOUT_CONSTRAINT_FIRST
```

**Function:** Sets the text height adaptation method to prioritize layout constraints (height).

**Initial Version:** 12

### MAX_LINES_FIRST

```cangjie
MAX_LINES_FIRST
```

**Function:** Sets the text height adaptation method to prioritize MaxLines.

**Initial Version:** 12

### MIN_FONT_SIZE_FIRST

```cangjie
MIN_FONT_SIZE_FIRST
```

**Function:** Sets the text height adaptation method to prioritize font size reduction.

**Initial Version:** 12

## enum TextOverflow

```cangjie
public enum TextOverflow {
    | Clip
    | Ellipsis
    | None
    | MARQUEE
}
```

**Function:** Display method when text exceeds the available space.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Clip

```cangjie
Clip
```

**Function:** Truncates the text at the maximum line when it exceeds the available space.

**Initial Version:** 12

### Ellipsis

```cangjie
Ellipsis
```

**Function:** Replaces the overflow text with an ellipsis when it exceeds the available space.

**Initial Version:** 12

### MARQUEE

```cangjie
MARQUEE
```

**Function:** Displays the overflow text in a marquee style when it exceeds the available space.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** Truncates the text at the maximum line when it exceeds the available space.

**Initial Version:** 12

## enum TextSelectableMode

```cangjie
public enum TextSelectableMode {
    | SELECTABLE_UNFOCUSABLE
    | SELECTABLE_FOCUSABLE
    | UNSELECTABLE

}
```

**Function:** Determines whether the text is selectable and focusable.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### SELECTABLE_FOCUSABLE

```cangjie
SELECTABLE_FOCUSABLE
```

**Function:** The text is selectable and can gain focus upon touch.

**Initial Version:** 12

### SELECTABLE_UNFOCUSABLE

```cangjie
SELECTABLE_UNFOCUSABLE
```

**Function:** The text is selectable but cannot gain focus. Setting properties such as `selection`, `bindSelectionMenu`, and `copyOption` does not affect the current behavior.

**Initial Version:** 12

### UNSELECTABLE

```cangjie
UNSELECTABLE
```

**Function:** The text is neither selectable nor focusable. Setting properties such as `selection`, `bindSelectionMenu`, and `copyOption` has no effect.

**Initial Version:** 12

## enum ThemeColorMode

```cangjie
public enum ThemeColorMode {
    | SYSTEM
    | LIGHT
    | DARK
}
```

**Function:** Theme color mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### DARK

```cangjie
DARK
```

**Function:** Fixed dark mode.

**Initial Version:** 12

### LIGHT

```cangjie
LIGHT
```

**Function:** Fixed light mode.

**Initial Version:** 12

### SYSTEM

```cangjie
COMPONENT_ULTRA_THICK
```

**Function:** Follows the system's light/dark mode.

**Initial Version:** 12

## enum TitleHeight

```cangjie
public enum TitleHeight {
    | MainOnly
    | MainWithSub
}
```

**Function:** Sets the title bar height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### MainOnly

```cangjie
MainOnly
```

**Function:** Recommended height (56vp) for the title bar when only the main title is present.

**Initial Version:** 12

### MainWithSub

```cangjie
MainWithSub
```

**Function:** Recommended height (82vp) for the title bar when both the main title and subtitle are present.

**Initial Version:** 12

## enum TouchType

```cangjie
public enum TouchType {
    | Down
    | Up
    | Move
    | Cancel
    | Unknown
}
```

**Function:** Touch trigger method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Cancel

```cangjie
Cancel
```
**Function:** Triggered when a touch event is canceled.

**Initial Version:** 12

### Down

```cangjie
Down
```

**Function:** Triggered when a finger is pressed down.

**Initial Version:** 12

### Move

```cangjie
Move
```

**Function:** Triggered when a finger moves on the screen while pressed.

**Initial Version:** 12

### Up

```cangjie
Up
```

**Function:** Triggered when a finger is lifted.

**Initial Version:** 12

## enum TransitionType

```cangjie
public enum TransitionType {
    | All
    | Insert
    | Delete
}
```

**Function:** Specifies the scenarios where the transition style takes effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### All

```cangjie
All
```

**Function:** Specifies that the current transition animation takes effect in all change scenarios of the component.

**Initial Version:** 12

### Delete

```cangjie
Delete
```

**Function:** Specifies that the current transition animation takes effect in the deletion and hiding scenarios of the component.

**Initial Version:** 12

### Insert

```cangjie
Insert
```

**Function:** Specifies that the current transition animation takes effect in the insertion and display scenarios of the component.

**Initial Version:** 12

## enum VerticalAlign

```cangjie
public enum VerticalAlign {
    | Top
    | Center
    | Bottom
}
```

**Function:** Vertical alignment method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Bottom

```cangjie
Bottom
```

**Function:** Bottom alignment.

**Initial Version:** 12

### Center

```cangjie
Center
```

**Function:** Center alignment, the default alignment method.

**Initial Version:** 12

### Top

```cangjie
Top
```

**Function:** Top alignment.

**Initial Version:** 12

## enum Visibility

```cangjie
public enum Visibility {
    | Visible
    | Hidden
    | None
}
```

**Function:** Shows or hides the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Hidden

```cangjie
Hidden
```

**Function:** Hidden, but participates in layout and occupies space.

**Initial Version:** 12

### None

```cangjie
None
```

**Function:** Hidden, does not participate in layout, and does not occupy space.

**Initial Version:** 12

### Visible

```cangjie
Visible
```

**Function:** Visible.

**Initial Version:** 12

## enum WebDarkMode

public enum WebDarkMode {
    | Off
    | On
    | Auto
}

**Function:** Web dark mode, disabled by default.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 12

### Off

```cangjie
Off
```

**Function:** Web dark mode is disabled.

**Initial Version:** 12

### On

```cangjie
On
```

**Function:** Web dark mode is enabled.

**Initial Version:** 12

### Auto

```cangjie
Auto
```

**Function:** Web dark mode follows the system setting.

**Initial Version:** 12

## enum Week

```cangjie
public enum Week {
    | Mon
    | Tue
    | Wed
    | Thur
    | Fri
    | Sat
    | Sun
}
```

**Function:** Weekday information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### Fri

```cangjie
Fri
```

**Function:** Friday.

**Initial Version:** 12

### Mon

```cangjie
Mon
```

**Function:** Monday.

**Initial Version:** 12

### Sat

```cangjie
Sat
```

**Function:** Saturday.

**Initial Version:** 12

### Sun

```cangjie
Sun
```

**Function:** Sunday.

**Initial Version:** 12

### Thur

```cangjie
Thur
```

**Function:** Thursday.

**Initial Version:** 12

### Tue

```cangjie
Tue
```

**Function:** Tuesday.

**Initial Version:** 12

### Wed

```cangjie
Wed
```

**Function:** Wednesday.

**Initial Version:** 12

## enum WordBreak

```cangjie
public enum WordBreak {
    | Normal
    | BreakAll
    | BreakWord
}
```

**Function:** Sets text line-breaking rules.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### BreakAll

```cangjie
Normal
```

**Function:** For Non-CJK text, line breaks can occur between any two characters. For CJK text, the effect is the same as NORMAL.

**Initial Version:** 12

### BreakWord

```cangjie
BreakWord
```

**Function:** Similar to BREAKALL, for Non-CJK text, line breaks can occur between any two characters. If a line of text contains breakpoints (e.g., whitespace), priority is given to breaking at these points to ensure words remain intact. If no breakpoints exist in the entire line, breaks occur between any two characters. For CJK text, the effect is the same as NORMAL.

**Initial Version:** 12

### Normal

```cangjie
Normal
```

**Function:** CJK (Chinese, Japanese, Korean) text can break between any two characters, while Non-CJK text (e.g., English) can only break at whitespace.

**Initial Version:** 12

## enum XComponentType

```cangjie
public enum XComponentType {
    | SURFACE
    | COMPONENT
    | TEXTURE
    | NODE
}
```

**Function:** Defines specific configuration parameters for XComponent.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

### COMPONENT

```cangjie
COMPONENT
```

**Function:** XComponent becomes a container component where non-UI logic can be executed to dynamically load and display content.

**Initial Version:** 12

### NODE

```cangjie
NODE
```

**Function:** A placeholder container for Native UI nodes. Page components developed using Native APIs can be displayed within this container area.

**Initial Version:** 12

### SURFACE

```cangjie
SURFACE
```

**Function:** Used for EGL/OpenGLES and media data writing. Customized drawing content is displayed separately on the screen. When the background color is set to black, it utilizes the Display Subsystem (DSS).

**Initial Version:** 12

### TEXTURE

```cangjie
TEXTURE
```

**Function:** Used for EGL/OpenGLES and media data writing. Customized drawing content is composited with the XComponent's content before being displayed on the screen.  
1. Maintains frame synchronization, ensuring GPU textures and other ArkUI drawing instructions are sent to the RenderService in the same frame.  
2. Ensures animation effects are consistent with native components.  
3. Uses GPU composition, which may consume more power compared to SURFACE that might use DSS.

**Initial Version:** 12
```