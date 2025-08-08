# 基础类型定义

## 导入模块

```cangjie
import kit.UIKit.*
```

## interface Length

```cangjie
public interface Length
```

**功能：** Float64、Int64、AppResource 均实现了 Length 接口类型。

**起始版本：** 12

## interface ResourceColor

```cangjie
public interface ResourceColor
```

**功能：** Color、UInt32、Int64、AppResource 均实现了 ResourceColor 接口类型。

**起始版本：** 12

## interface ResourceStr

```cangjie
public interface ResourceStr
```

**功能：** String、AppResource 均实现了 ResourceStr 接口类型。

**起始版本：** 12

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

**功能：** 颜色类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

- [ResourceColor](#interface-resourcecolor)

### static let BLACK

```cangjie
public static let BLACK: Color = Color(0xff000000)
```

**功能：** 黑色。

**类型：** [Color](#class-color)

**起始版本：** 12

### static let BLUE

```cangjie
public static let BLUE: Color = Color(0xff0000ff)
```

**功能：** 蓝色。

**类型：** [Color](#class-color)

**起始版本：** 19

### static let BROWN

```cangjie
public static let BROWN: Color = Color(0xffa52a2a)
```

**功能：** 棕色。

**类型：** [Color](#class-color)

**起始版本：** 19

### static let FOREGROUND

```cangjie
public static let FOREGROUND: Color = Color(0x00000001)
```

**功能：** 前景色。

**类型：** [Color](#class-color)

**起始版本：** 12

### static let GRAY

```cangjie
public static let GRAY: Color = Color(0xff808080)
```

**功能：** 灰色。

**类型：** [Color](#class-color)

**起始版本：** 12

### static let GREEN

```cangjie
public static let GREEN: Color = Color(0xff008000)
```

**功能：** 绿色。

**类型：** [Color](#class-color)

**起始版本：** 19

### static let GREY

```cangjie
public static let GREY: Color = Color(0xff808080)
```

**功能：** 灰色。

**类型：** [Color](#class-color)

**起始版本：** 12

### static let ORANGE

```cangjie
public static let ORANGE: Color = Color(0xffffa500)
```

**功能：** 橙色。

**类型：** [Color](#class-color)

**起始版本：** 19

### static let PINK

```cangjie
public static let PINK: Color = Color(0xffffc0cb)
```

**功能：** 粉色。

**类型：** [Color](#class-color)

**起始版本：** 12

### static let RED

```cangjie
public static let RED: Color = Color(0xffff0000)
```

**功能：** 红色。

**类型：** [Color](#class-color)

**起始版本：** 12

### static let TRANSPARENT

```cangjie
public static let TRANSPARENT: Color = Color(0, 0, 0, alpha: 0.0)
```

**功能：** 透明色。

**类型：** [Color](#class-color)

**起始版本：** 19

### static let WHITE

```cangjie
public static let WHITE: Color = Color(0xffffffff)
```

**功能：** 白色。

**类型：** [Color](#class-color)

**起始版本：** 19

### static let YELLOW

```cangjie
public static let YELLOW: Color = Color(0xffffff00)
```

**功能：** 黄色。

**类型：** [Color](#class-color)

**起始版本：** 12

### init(UInt8, UInt8, UInt8, Float32)

```cangjie
public init(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = 1.0)
```

**功能：** 构造一个Color类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|red|UInt8|是|-|RGB中红色通道取值。|
|green|UInt8|是|-|RGB中绿色通道取值。|
|blue|UInt8|是|-|RGB中蓝色通道取值。|
|alpha|Float32|否|1.0| **命名参数。** 透明通道取值，取值范围 [0.0, 1.0]。|

### init(UInt32)

```cangjie
public init(value: UInt32)
```

**功能：** 构造一个Color类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|UInt32|是|-|Uint32颜色取值。alpha，R，G，B通道按顺序各占输入的8位，若只输入R,G,B三个通道，则alpha通道默认取0xff。|

### static func alphaAdapt(UInt32)

```cangjie
public static func alphaAdapt(origin: UInt32): UInt32
```

**功能：** 调整颜色的Alpha通道。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|origin|UInt32|是|-|UInt32颜色取值。|

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|调整Alpha通道后的UInt32颜色取值。|

### func toUInt32()

```cangjie
public func toUInt32(): UInt32
```

**功能：** 转为Uint32颜色取值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|Uint32颜色取值。|

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

**功能：** 文本样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var family

```cangjie
public var family: String
```

**功能：** 设置文本的字体列表。

**类型：** String

**读写能力：** 可读写

**起始版本：** 12

### var size

```cangjie
public var size: Length
```

**功能：** 设置文本尺寸，使用fp单位。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var style

```cangjie
public var style: FontStyle
```

**功能：** 设置文本的字体样式。

**类型：** [FontStyle](./cj-common-types.md#enum-fontstyle)

**读写能力：** 可读写

**起始版本：** 12

### var weight

```cangjie
public var weight: FontWeight
```

**功能：** 设置文本的字体粗细。

**类型：** [FontWeight](./cj-common-types.md#enum-fontweight)

**读写能力：** 可读写

**起始版本：** 12

### init(Length, FontWeight, String, FontStyle)

```cangjie
public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: String = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal)
```

**功能：** 构造一个Fonts对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](./cj-common-types.md#interface-length)|否|16.fp| **命名参数。** 设置文本尺寸，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.Normal| **命名参数。** 设置文本的字体粗细。|
|family|String|否|"HarmonyOS Sans"| **命名参数。** 设置文本的字体列表。使用多个字体，使用','进行分割，优先级按顺序生效。例如：'Arial, HarmonyOS Sans'。当前支持'HarmonyOS Sans'字体。|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal| **命名参数。** 设置文本的字体样式。|

### init(Length, FontWeight, AppResource, FontStyle)

```cangjie
public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: AppResource,
    style!: FontStyle = FontStyle.Normal)
```

**功能：** 构造一个Fonts对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](./cj-common-types.md#interface-length)|否|16.fp| **命名参数。** 设置文本尺寸，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.Normal| **命名参数。** 设置文本的字体粗细。|
|family|[AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource)|是|-| **命名参数。** 设置文本的字体列表。使用多个字体，使用','进行分割，优先级按顺序生效。例如：'Arial, HarmonyOS Sans'。当前支持'HarmonyOS Sans'字体。|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal| **命名参数。** 设置文本的字体样式。|

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

**功能：** 定义区域位置类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var height

```cangjie
public var height: Length
```

**功能：** 触摸热区的高度。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var width

```cangjie
public var width: Length
```

**功能：** 触摸热区的宽度。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var x

```cangjie
public var x: Length
```

**功能：** 触摸点相对于组件左上角的x轴坐标。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var y

```cangjie
public var y: Length
```

**功能：** 触摸点相对于组件左上角的y轴坐标。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### init(Length, Length, Length, Length)

```cangjie
public init(x!: Length = 0.vp, y!: Length = 0.vp, width!: Length = 100.percent, height!: Length = 100.percent)
```

**功能：** 构造一个Rectangle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](#interface-length)|否|0.vp| **命名参数。** 触摸点相对于组件左上角的x轴坐标。|
|y|[Length](#interface-length)|否|0.vp| **命名参数。** 触摸点相对于组件左上角的y轴坐标。|
|width|[Length](#interface-length)|否|100.percent| **命名参数。** 触摸热区的宽度。|
|height|[Length](#interface-length)|否|100.percent| **命名参数。** 触摸热区的高度。|

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

**功能：** 位置和尺寸类型，用于描述组建的位置和高度。通过scroller.getItemRect获取。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var height

```cangjie
public var height: Float64
```

**功能：** 内容高度大小。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

### var width

```cangjie
public var width: Float64
```

**功能：** 内容宽度大小。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

### var x

```cangjie
public var x: Float64
```

**功能：** 水平方向横坐标。

**读写能力：** 可读写

**起始版本：** 12

### var y

```cangjie
public var y: Float64
```

**功能：** 竖直方向纵坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

### init(Float64, Float64, Float64, Float64)

```cangjie
public init(
    x: Float64,
    y: Float64,
    width: Float64,
    height: Float64
)
```

**功能：** 构造一个RectResult类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|水平方向横坐标。|
|y|Float64|是|-|竖直方向纵坐标。|
|width|Float64|是|-|内容宽度大小。|
|height|Float64|是|-|内容高度大小。|

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

**功能：** 设置动画效果相关参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var curve

```cangjie
public var curve: Option<Curve>
```

**功能：** 动画曲线。

**类型：** Option\<[Curve](#enum-curve)>

**读写能力：** 可读写

**起始版本：** 12

### var delay

```cangjie
public var delay: Option<Int32>
```

**功能：** 动画延迟播放时间，单位为ms(毫秒)，默认不延时播放。

**类型：** Option\<Int32>

**读写能力：** 可读写

**起始版本：** 12

### var duration

```cangjie
public var duration: Option<Int32>
```

**功能：** 动画持续时间，单位为毫秒。设置小于0的值时按0处理。

**类型：** Option\<Int32>

**读写能力：** 可读写

**起始版本：** 12

### var expectedFrameRateRange

```cangjie
public var expectedFrameRateRange: Option<ExpectedFrameRateRange>
```

**功能：** 设置动画的期望帧率。

**类型：** Option\<ExpectedFrameRateRange>

**读写能力：** 可读写

**起始版本：** 12

### var finishCallbackType

```cangjie
public var finishCallbackType: Option<FinishCallbackType>
```

**功能：** 在动画中定义onFinish回调的类型。

**类型：** Option\<[FinishCallbackType](#enum-finishcallbacktype)>

**读写能力：** 可读写

**起始版本：** 12

### var iterations

```cangjie
public var iterations: Option<Int32>
```

**功能：** 动画播放次数。默认播放一次，设置为-1时表示无限次播放。设置为0时表示无动画效果。

**类型：** Option\<Int32>

**读写能力：** 可读写

**起始版本：** 12

### var onFinish

```cangjie
public var onFinish: Option <() -> Unit>
```

**功能：** 动画播放完成回调。

**类型：** Option\<()->Unit>

**读写能力：** 可读写

**起始版本：** 12

### var playMode

```cangjie
public var playMode: Option<PlayMode>
```

**功能：** 动画播放模式，默认播放完成后重头开始播放。

**类型：** Option\<[PlayMode](#enum-playmode)>

**读写能力：** 可读写

**起始版本：** 12

### var tempo

```cangjie
public var tempo: Option<Float32>
```

**功能：** 动画播放速度，值越大动画播放越快，值越小播放越慢，为0时无动画效果。

**类型：** Option\<Float32>

**读写能力：** 可读写

**起始版本：** 12

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

**功能：** 构造一个AnimateParam对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

| 参数名 | 参数类型 | 必填 | 默认值 | 描述 |
| :--- | :--- | :--- | :--- | :--- |
| duration | Option\<Int32> | 否 | 1000 | **命名参数。**  动画持续时间，单位为毫秒。 <br/> 设置小于0的值时按0处理。 |
| tempo | Option\<Float32> | 否 | 1.0 | **命名参数。**  动画播放速度，值越大动画播放越快，值越小播放越慢，为0时无动画效果。 <br/> 当设置小于0的值时按值为1处理。 |
| curve | Option\<Float32> | 否 | Curve.EaseInOut| **命名参数。**  动画曲线。 <br/> 默认值：Curve.EaseInOut |
| delay | Option\<Int32> | 否 | 0 | **命名参数。**  动画延迟播放时间，单位为ms(毫秒)，默认不延时播放。<br/> 取值范围：(-∞, +∞)  <br/> delay >= 0为延迟播放，delay < 0表示提前播放。 |
| iterations | Option\<Int32> | 否 | 1 | **命名参数。**  动画播放次数。默认播放一次，设置为-1时表示无限次播放。设置为0时表示无动画效果。 <br/> 该选项不适用于自定义弹窗 |
| playMode | Option\<PlayMode> | 否 | PlayMode.Normal | **命名参数。**  动画播放模式，默认播放完成后重头开始播放。 <br/> 该选项不适用于自定义弹窗 |
| onFinish | Option\<() -> Unit> | 否 | - | **命名参数。**  动画播放完成回调。 |
| finishCallbackType | Option\<[FinishCallbackType](#enum-finishcallbacktype)> | 否 | FinishCallbackType.REMOVED | **命名参数。**  在动画中定义onFinish回调的类型。 |
| expectedFrameRateRange | Option\<ExpectedFrameRateRange> | 否 | - | **命名参数。**  设置动画的期望帧率。 |

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

**功能：** 当前目标区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var globalPosition

```cangjie
public var globalPosition: Position
```

**功能：** 定义目标元素左上角与屏幕左上角的位置关系。

**类型：** [Position](#class-position)

**读写能力：** 可读写

**起始版本：** 12

### var height

```cangjie
public var height: Float64
```

**功能：** 定义目标元素的宽度。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

### var position

```cangjie
public var position: Position
```

**功能：** 定义目标元素左上角与父元素左上角的相对位置。

**类型：** [Position](#class-position)

**读写能力：** 可读写

**起始版本：** 12

### var width

```cangjie
public var width: Float64
```

**功能：** 定义目标元素的宽度。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

### Area(Float64, Float64, Position, Position)

```cangjie
public Area(
    public var width: Float64,
    public var height: Float64,
    public var position: Position,
    public var globalPosition: Position
)
```

**功能：** 构造一个Area类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|Float64|是|-|目标元素的宽度，单位为vp。|
|height|Float64|是|-|目标元素的高度，单位为vp。|
|position|[Position](#class-position)|是|-|目标元素左上角相对父元素左上角的位置。|
|globalPosition|[Position](#class-position)|是|-|目标元素左上角相对页面左上角的位置。|

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

**功能：** 圆角类型，用于描述组件边框圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var bottomLeft

```cangjie
public var bottomLeft: Length
```

**功能：** 组件左下角圆角半径。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var bottomRight

```cangjie
public var bottomRight: Length
```

**功能：** 组件右下角圆角半径。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var topLeft

```cangjie
public var topLeft: Length
```

**功能：** 组件左上角圆角半径。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var topRight

```cangjie
public var topRight: Length
```

**功能：** 组件右上角圆角半径。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### init(Length, Length, Length, Length)

```cangjie
public init(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp, bottomRight!: Length = 0.vp)
```

**功能：** 初始化一个BorderRadiuses对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| topLeft     | [Length](#interface-length) | 否   | 0.vp   | **命名参数。**  组件左上角圆角半径。 |
| topRight    | [Length](#interface-length) | 否   | 0.vp   | **命名参数。**  组件右上角圆角半径。 |
| bottomLeft  | [Length](#interface-length) | 否   | 0.vp   | **命名参数。**  组件左下角圆角半径。 |
| bottomRight | [Length](#interface-length) | 否   | 0.vp   | **命名参数。**  组件右下角圆角半径。 |

## struct CJEdge

```cangjie
public struct CJEdge {
    public init(topLength: Length, rightLength: Length, bottomLength: Length, leftLength: Length)
}
```

**功能：** 边框长度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### init(Length, Length, Length, Length)

```cangjie
public init(topLength: Length, rightLength: Length, bottomLength: Length, leftLength: Length)
```

**功能：** 构造边框长度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|topLength|[Length](#interface-length)|是|-|上侧边框长度。|
|rightLength|[Length](#interface-length)|是|-|右侧边框长度。|
|bottomLength|[Length](#interface-length)|是|-|底部边框长度。|
|leftLength|[Length](#interface-length)|是|-|左侧边框长度。|

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

**功能：** 分割线样式属性集合，用于描述分割线相关信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### let color

```cangjie
public let color: ResourceColor
```

**功能：** 分割线的颜色。

**类型：** [ResourceColor](./cj-common-types.md#interface-resourcecolor)

**读写能力：** 只读

**起始版本：** 12

### let endMargin

```cangjie
public let endMargin: Length
```

**功能：** 分割线与菜单侧边结束端的距离。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### let startMargin

```cangjie
public let startMargin: Length
```

**功能：** 分割线与菜单侧边起始端的距离。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### let strokeWidth

```cangjie
public let strokeWidth: Length
```

**功能：** 分割线的线宽。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### init(Length, ResourceColor, Length, Length)

```cangjie
public init(strokeWidth: Length,color: ResourceColor,startMargin: Length,endMargin: Length
)
```

**功能：** 初始化一个DividerStyleOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|strokeWidth|[Length](./cj-common-types.md#interface-length)|是|-|分割线的线宽。|
|color|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|是|-|分割线的颜色。|
|startMargin|[Length](./cj-common-types.md#interface-length)|是|-|分割线与菜单侧边起始端的距离。|
|endMargin|[Length](./cj-common-types.md#interface-length)|是|-|分割线与菜单侧边结束端的距离。|

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

**功能：** 边框颜色，用于描述组件边框四条边的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var top

```cangjie
public var top: Color
```

**功能：** 组件上边框颜色。

**类型：** [Color](#class-color)

**读写能力：** 可读写

**起始版本：** 12

### var right

```cangjie
public var right: Color
```

**功能：** 组件右边框颜色。

**类型：** [Color](#class-color)

**读写能力：** 可读写

**起始版本：** 12

### var bottom

```cangjie
public var bottom: Color
```

**功能：** 组件下边框颜色。

**类型：** [Color](#class-color)

**读写能力：** 可读写

**起始版本：** 12

### var left

```cangjie
public var left: Color
```

**功能：** 组件左边框颜色。

**类型：** [Color](#class-color)

**读写能力：** 可读写

**起始版本：** 12

### init(Color, Color, Color, Color)

```cangjie
public init(top!: Color = Color.BLACK, right!: Color = Color.BLACK, bottom!: Color = Color.BLACK, left!: Color = Color.BLACK)
```

**功能：** 构造EdgeColor对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[Color](#class-color)|否|Color.BLACK| **命名参数。** 组件上边框颜色。|
|right|[Color](#class-color)|否|Color.BLACK| **命名参数。** 组件右边框颜色。|
|bottom|[Color](#class-color)|否|Color.BLACK| **命名参数。** 组件下边框颜色。|
|left|[Color](#class-color)|否|Color.BLACK| **命名参数。** 组件左边框颜色。|

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

**功能：** 边框样式，用于描述组件边框四条边的样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var bottom

```cangjie
public var bottom: BorderStyle
```

**功能：** 设置组件下边框样式。

**类型：** [BorderStyle](#enum-borderstyle)

**读写能力：** 可读写

**起始版本：** 12

### var left

```cangjie
public var left: BorderStyle
```

**功能：** 设置组件左边框样式。

**类型：** [BorderStyle](#enum-borderstyle)

**读写能力：** 可读写

**起始版本：** 12

### var right

```cangjie
public var right: BorderStyle
```

**功能：** 设置组件右边框样式。

**类型：** [BorderStyle](#enum-borderstyle)

**读写能力：** 可读写

**起始版本：** 12

### var top

```cangjie
public var top: BorderStyle
```

**功能：** 设置组件上边框样式。

**类型：** [BorderStyle](#enum-borderstyle)

**读写能力：** 可读写

**起始版本：** 12

### init(BorderStyle, BorderStyle, BorderStyle, BorderStyle)

```cangjie
public init(top!: BorderStyle = BorderStyle.Solid, right!: BorderStyle = BorderStyle.Solid, bottom!: BorderStyle = BorderStyle.Solid, left!: BorderStyle = BorderStyle.Solid)
```

**功能：** 构造EdgeColor对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[BorderStyle](#enum-borderstyle)|否|BorderStyle.Solid| **命名参数。** 组件上边框样式。|
|right|[BorderStyle](#enum-borderstyle)|否|BorderStyle.Solid| **命名参数。** 组件右边框样式。|
|bottom|[BorderStyle](#enum-borderstyle)|否|BorderStyle.Solid| **命名参数。** 组件下边框样式。|
|left|[BorderStyle](#enum-borderstyle)|否|BorderStyle.Solid| **命名参数。** 组件左边框样式。|

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

**功能：** 内边距类型，用于描述组件不同方向的内边距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### let bottom

```cangjie
public let bottom: Length
```

**功能：** 下内边距，组件内元素距组件底部的尺寸。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### let end

```cangjie
public let end: Length
```

**功能：** 右内边距，组件内元素距组件右边界的尺寸。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### let start

```cangjie
public let start: Length
```

**功能：** 左内边距，组件内元素距组件左边界的尺寸。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### let top

```cangjie
public let top: Length
```

**功能：** 上内边距，组件内元素距组件顶部的尺寸。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### LocalizedPadding(Length, Length, Length, Length)

```cangjie
public LocalizedPadding(
    top!: Length = 17.0.vp,
    end!: Length = 8.0.vp,
    bottom!: Length = 18.0.vp,
    start!: Length = 8.0.vp
)
```

**功能：** 构造一个LocalizedPadding对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[Length](cj-common-types.md#interface-length)|否|17.0.vp| **命名参数。** 上内边距，组件内元素距组件顶部的尺寸。|
|end|[Length](cj-common-types.md#interface-length)|否|8.0.vp| **命名参数。** 右内边距，组件内元素距组件右边界的尺寸。从右至左显示语言模式下为左内边距，组件内元素距组件左边界的尺寸。|
|bottom|[Length](cj-common-types.md#interface-length)|否|18.0.vp| **命名参数。** 下内边距，组件内元素距组件底部的尺寸。|
|start|[Length](cj-common-types.md#interface-length)|否|8.0.vp| **命名参数。** 左内边距，组件内元素距组件左边界的尺寸。从右至左显示语言模式下为右内边距，组件内元素距组件右边界的尺寸。|

## class Margin

```cangjie
public class Margin {
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
}
```

**功能：** 外边距类型，用于描述组件不同方向的外边距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

### init(Length, Length, Length, Length)

```cangjie
public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
```

**功能：** 初始化了一个外边距类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** 上外边距，组件顶部距组件外元素的尺寸。<br/>初始值：0.vp。|
|right|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** 右外边距，组件右边界距组件外元素的尺寸。<br/>初始值：0.vp。|
|bottom|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** 下外边距，组件底部距组件外元素的尺寸。<br/>初始值：0.vp。|
|left|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** 左外边距，组件左边界距组件外元素的尺寸。<br/>初始值：0.vp。|

## class MenuOffset

```cangjie
public class MenuOffset {
    public var dx: Length
    public var dy: Length
    public init(dx: Length, dy: Length)
}
```

**功能：** 位置坐标偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var dx

```cangjie
public var dx: Length
```

**功能：** 水平方向偏移量。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var dy

```cangjie
public var dy: Length
```

**功能：** 竖直方向偏移量。

**类型：** [Length](./cj-common-types.md#interface-length)

**起始版本：** 12

## class Offset

```cangjie
public class Offset {
    public var dx: Length
    public var dy: Length
    public init(dx: Length,  dy: Length)
}
```

**功能：** 相对布局完成位置坐标偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var dx

```cangjie
public var dx: Length
```

**功能：** 水平方向偏移量。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### var dy

```cangjie
public var dy: Length
```

**功能：** 竖直方向偏移量。

**类型：** [Length](#interface-length)

**读写能力：** 可读写

**起始版本：** 12

### init(Length, Length)

```cangjie
public init(dx: Length,  dy: Length)
```

**功能：** 构建一个Offset类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dx|[Length](#interface-length)|是|-|x点坐标。|
|dy|[Length](#interface-length)|是|-|y点坐标。|

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

**功能：** 内边距类型，用于描述组件不同方向的内边距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### let bottom

```cangjie
public let bottom: Length
```

**功能：** 下内边距，组件内元素距组件底部的尺寸。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### let left

```cangjie
public let left: Length
```

**功能：** 左内边距，组件内元素距组件左边界的尺寸。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### let right

```cangjie
public let right: Length
```

**功能：** 右内边距，组件内元素距组件右边界的尺寸。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

### let top

```cangjie
public let top: Length
```

**功能：** 上内边距，组件内元素距组件顶部的尺寸。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 只读

**起始版本：** 12

## class Position

```cangjie
public class Position {
    public Position(
        public var x: Float64,
        public var y: Float64
    )
}
```

**功能：** 位置信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### var x

```cangjie
public var x: Float64
```

**功能：** 定义x轴坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

### var y

```cangjie
public var y: Float64
```

**功能：** 定义y轴坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

### Position(Float64, Float64)

```cangjie
public Position(
    public var x: Float64,
    public var y: Float64
)
```

**功能：** 构造一个Position类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|x轴坐标，单位为vp。|
|y|Float64|是|-|y轴坐标，单位为vp。|

## enum AccessibilityHoverType

```cangjie
public enum AccessibilityHoverType {
    | HOVER_ENTER
    | HOVER_MOVE
    | HOVER_EXIT
    | HOVER_CANCEL
}
```

**功能：** 无障碍悬浮类型类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### HOVER_CANCEL

```cangjie
HOVER_CANCEL
```

**功能：** 打断取消当前触发的事件。

**起始版本：** 12

### HOVER_ENTER

```cangjie
HOVER_ENTER
```

**功能：** 手指按下时触发。

**起始版本：** 12

### HOVER_EXIT

```cangjie
HOVER_EXIT
```

**功能：** 抬手触发。

**起始版本：** 12

### HOVER_MOVE

```cangjie
HOVER_MOVE
```

**功能：** 触摸移动时触发。

**起始版本：** 12

## enum AdaptiveColor

```cangjie
public enum AdaptiveColor {
    | DEFAULT
    | AVERAGE
}
```

**功能：** 取色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### AVERAGE

```cangjie
AVERAGE
```

**功能：** 使用取色模糊。将取色区域的颜色平均值作为蒙版颜色。

**起始版本：** 12

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 不使用取色模糊。使用默认的颜色作为蒙版颜色。

**起始版本：** 12

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

**功能：** 对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Bottom

```cangjie
Bottom
```

**功能：** 底部横向居中。

**起始版本：** 12

### BottomEnd

```cangjie
BottomEnd
```

**功能：** 底部尾端。

**起始版本：** 12

### BottomStart

```cangjie
BottomStart
```

**功能：** 底部起始端。

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** 横向和纵向居中。

**起始版本：** 12

### End

```cangjie
End
```

**功能：** 尾端纵向居中。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** 起始端纵向居中。

**起始版本：** 12

### Top

```cangjie
Top
```

**功能：** 顶部横向居中。

**起始版本：** 12

### TopEnd

```cangjie
TopEnd
```

**功能：** 顶部尾端。

**起始版本：** 12

### TopStart

```cangjie
TopStart
```

**功能：** 顶部起始端。

**起始版本：** 12

## enum AnimationStatus

```cangjie
public enum AnimationStatus {
    | Initial
    | Running
    | Paused
    | Stopped
}
```

**功能：** 动画播放状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Initial

```cangjie
Initial
```

**功能：** 动画初始状态。

**起始版本：** 12

### Paused

```cangjie
Paused
```

**功能：** 动画处于暂停状态。

**起始版本：** 12

### Running

```cangjie
Running
```

**功能：** 动画处于播放状态。

**起始版本：** 12

### Stopped

```cangjie
Stopped
```

**功能：** 动画处于停止状态。

**起始版本：** 12

## enum AppRotation

```cangjie
public enum AppRotation {
    | ROTATION_0
    | ROTATION_90
    | ROTATION_180
    | ROTATION_270
}
```

**功能：** 应用方向旋转角度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### ROTATION_0

```cangjie
ROTATION_0
```

**功能：** 应用方向为0度。

**起始版本：** 12

### ROTATION_90

```cangjie
ROTATION_90
```

**功能：** 应用方向为90度。

**起始版本：** 12

### ROTATION_180

```cangjie
ROTATION_180
```

**功能：** 应用方向为180度。

**起始版本：** 12

### ROTATION_270

```cangjie
ROTATION_270
```

**功能：** 应用方向为270度。

**起始版本：** 12

## enum ArrowPointPosition

```cangjie
public enum ArrowPointPosition {
    | START
    | CENTER
    | END
}
```

**功能：** 箭头指向位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### CENTER

```cangjie
CENTER
```

**功能：** 位于父组件居中位置。

**起始版本：** 12

### END

```cangjie
END
```

**功能：** 水平方向：位于父组件最右侧，垂直方向：位于父组件最下侧。

**起始版本：** 12

### START

```cangjie
START
```

**功能：** 水平方向：位于父组件最左侧，垂直方向：位于父组件最上侧。

**起始版本：** 12

## enum Axis

```cangjie
public enum Axis {
    | Vertical
    | Horizontal
}
```

**功能：** 轴方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Horizontal

```cangjie
Horizontal
```

**功能：** 方向为横向。

**起始版本：** 12

### Vertical

```cangjie
Vertical
```

**功能：** 方向为纵向。

**起始版本：** 12

## enum BarrierDirection

```cangjie
public enum BarrierDirection {
    | LEFT
    | RIGHT
    | TOP
    | BOTTOM
}
```

**功能：** 定义屏障线的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### BOTTOM

```cangjie
BOTTOM
```

**功能：** 屏障在其所有referencedId的最下方。

**起始版本：** 12

### LEFT

```cangjie
LEFT
```

**功能：** 屏障在其所有referencedId的最左侧。

**起始版本：** 12

### RIGHT

```cangjie
RIGHT
```

**功能：** 屏障在其所有referencedId的最右侧。

**起始版本：** 12

### TOP

```cangjie
TOP
```

**功能：** 屏障在其所有referencedId的最上方。

**起始版本：** 12

## enum BarState

```cangjie
public enum BarState {
    | Off
    | Auto
    | On
}
```

**功能：** 滚动条的显示模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Auto

```cangjie
Auto
```

**功能：** 按需显示(触摸时显示，2s后消失)。

**起始版本：** 12

### Off

```cangjie
Off
```

**功能：** 不显示。

**起始版本：** 12

### On

```cangjie
On
```

**功能：** 常驻显示。

**起始版本：** 12

## enum BlendApplyType

```cangjie
public enum BlendApplyType {
    | FAST
    | OFFSCREEN
}
```

**功能：** 指示如何将指定的混合模式应用于视图的内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### FAST

```cangjie
FAST
```

**功能：** 在目标图像上按顺序混合视图的内容。

**起始版本：** 12

### OFFSCREEN

```cangjie
OFFSCREEN
```

**功能：** 将此组件和子组件内容绘制到离屏画布上，然后整体进行混合。

**起始版本：** 12

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

**功能：** 混合模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

> **说明：**
>
> blendMode枚举中，s表示源像素，d表示目标像素，sa表示原像素透明度，da表示目标像素透明度，r表示混合后像素，ra表示混合后像素透明度。

### CLEAR

```cangjie
CLEAR
```

**功能：** 将源像素覆盖的目标像素清除为完全透明。

**起始版本：** 12

### COLOR

```cangjie
COLOR
```

**功能：** 保留源像素的饱和度和色调，但会使用目标像素的亮度来替换源像素的亮度。

**起始版本：** 12

### COLOR_BURN

```cangjie
COLOR_BURN
```

**功能：** 使目标像素变得更暗来反映源像素。

**起始版本：** 12

### COLOR_DODGE

```cangjie
COLOR_DODGE
```

**功能：** 使目标像素变得更亮来反映源像素。

**起始版本：** 12

### DARKEN

```cangjie
DARKEN
```

**功能：** rc = s + d - max(s *da, d* sa), ra = kSrcOver，当两个颜色重叠时，较暗的颜色会覆盖较亮的颜色。

**起始版本：** 12

### DIFFERENCE

```cangjie
DIFFERENCE
```

**功能：** rc = s + d - 2 *(min(s* da, d * sa)), ra = kSrcOver，对比源像素和目标像素，亮度更高的像素减去亮度更低的像素，产生高对比度的效果。

**起始版本：** 12

### DST

```cangjie
DST
```

**功能：** r = d，只显示目标像素。

**起始版本：** 12

### DST_ATOP

```cangjie
DST_ATOP
```

**功能：** r = d *sa + s* (1 - da)，在源像素和目标像素重叠的地方绘制目标像素，在源像素和目标像素不重叠的地方绘制源像素。

**起始版本：** 12

### DST_IN

```cangjie
DST_IN
```

**功能：** r = d * sa，只显示目标像素中与源像素重叠的部分。

**起始版本：** 12

### DST_OUT

```cangjie
DST_OUT
```

**功能：** r = d * (1 - sa)，只显示目标像素中与源像素不重叠的部分。

**起始版本：** 12

### DST_OVER

```cangjie
DST_OVER
```

**功能：** r = d + (1 - da) * s，将目标像素按照透明度进行混合，覆盖在源像素上。

**起始版本：** 12

### EXCLUSION

```cangjie
EXCLUSION
```

**功能：** rc = s + d - two(s * d), ra = kSrcOver，对比源像素和目标像素，亮度更高的像素减去亮度更低的像素，产生柔和的效果。

**起始版本：** 12

### HARD_LIGHT

```cangjie
HARD_LIGHT
```

**功能：** 根据源像素的值来决定目标像素变得更亮或者更暗。根据源像素来决定使用MULTIPLY混合模式还是SCREEN混合模式。

**起始版本：** 12

### HUE

```cangjie
HUE
```

**功能：** 保留源图像的亮度和饱和度，但会使用目标图像的色调来替换源图像的色调。

**起始版本：** 12

### LIGHTEN

```cangjie
LIGHTEN
```

**功能：** rc = s + d - min(s *da, d* sa), ra = kSrcOver，将源图像和目标图像中的像素进行比较，选取两者中较亮的像素作为最终的混合结果。

**起始版本：** 12

### LUMINOSITY

```cangjie
LUMINOSITY
```

**功能：** 保留目标像素的色调和饱和度，但会用源像素的亮度替换目标像素的亮度。

**起始版本：** 12

### MODULATE

```cangjie
MODULATE
```

**功能：** r = s * d，将源像素与目标像素进行乘法运算，并将结果作为新的像素值。

**起始版本：** 12

### MULTIPLY

```cangjie
MULTIPLY
```

**功能：** r = s *(1 - da) + d* (1 - sa) + s * d，将源图像与目标图像进行乘法混合，得到一张新的图像。

**起始版本：** 12

### NONE

```cangjie
NONE
```

**功能：** 将上层图像直接覆盖到下层图像上，不进行任何混合操作。

**起始版本：** 12

### OVERLAY

```cangjie
OVERLAY
```

**功能：** 根据目标像素来决定使用MULTIPLY混合模式还是SCREEN混合模式。

**起始版本：** 12

### PLUS

```cangjie
PLUS
```

**功能：** r = min(s + d, 1)，将源像素值与目标像素值相加，并将结果作为新的像素值。

**起始版本：** 12

### SATURATION

```cangjie
SATURATION
```

**功能：** 保留目标像素的亮度和色调，但会使用源像素的饱和度来替换目标像素的饱和度。

**起始版本：** 12

### SCREEN

```cangjie
SCREEN
```

**功能：** r = s + d - s * d，将两个图像的像素值相加，然后减去它们的乘积来实现混合。

**起始版本：** 12

### SOFT_LIGHT

```cangjie
SOFT_LIGHT
```

**功能：** 根据源像素来决定使用LIGHTEN混合模式还是DARKEN混合模式。

**起始版本：** 12

### SRC

```cangjie
SRC
```

**功能：** r = s，只显示源像素。

**起始版本：** 12

### SRC_ATOP

```cangjie
SRC_ATOP
```

**功能：** r = s *da + d* (1 - sa)，在源像素和目标像素重叠的地方绘制源像素，在源像素和目标像素不重叠的地方绘制目标像素。

**起始版本：** 12

### SRC_IN

```cangjie
SRC_IN
```

**功能：** r = s * da，只显示源像素中与目标像素重叠的部分。

**起始版本：** 12

### SRC_OUT

```cangjie
SRC_OUT
```

**功能：** r = s * (1 - da)，只显示源像素中与目标像素不重叠的部分。

**起始版本：** 12

### SRC_OVER

```cangjie
SRC_OVER
```

**功能：** r = s + (1 - sa) * d，将源像素按照透明度进行混合，覆盖在目标像素上。

**起始版本：** 12

### XOR

```cangjie
XOR
```

**功能：** r = s *(1 - da) + d* (1 - sa)，只显示源像素与目标像素不重叠的部分。

**起始版本：** 12

## enum BlurStyleActivePolicy

```cangjie
public enum BlurStyleActivePolicy {
    | FOLLOWS_WINDOW_ACTIVE_STATE
    | ALWAYS_ACTIVE
    | ALWAYS_INACTIVE
}
```

**功能：** 模糊效果激活策略。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### ALWAYS_ACTIVE

```cangjie
ALWAYS_ACTIVE
```

**功能：** 一直有模糊效果。

**起始版本：** 12

### ALWAYS_INACTIVE

```cangjie
ALWAYS_INACTIVE
```

**功能：** 一直无模糊效果。

**起始版本：** 12

### FOLLOWS_WINDOW_ACTIVE_STATE

```cangjie
FOLLOWS_WINDOW_ACTIVE_STATE
```

**功能：** 模糊效果跟随窗口焦点状态变化，非焦点不模糊，焦点模糊。

**起始版本：** 12

## enum BorderStyle

```cangjie
public enum BorderStyle {
    | Solid
    | Dashed
    | Dotted
}
```

**功能：** 边框样式，用于描述组件边框四条边的样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Dashed

```cangjie
Dashed
```

**功能：** 显示为一系列短的方形虚线。

**起始版本：** 12

### Dotted

```cangjie
Dotted
```

**功能：** 显示为一系列圆点，圆点半径为borderWidth的一半。

**起始版本：** 12

### Solid

```cangjie
Solid
```

**功能：** 显示为一条实线。

**起始版本：** 12

## enum ButtonRole

```cangjie
public enum ButtonRole {
    | NORMAL
    | ERROR
}
```

**功能：** 按键类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### ERROR

```cangjie
ERROR
```

**功能：** 警示按钮。

**起始版本：** 12

### NORMAL

```cangjie
NORMAL
```

**功能：** 正常按钮。

**起始版本：** 12

## enum ButtonStyleMode

```cangjie
public enum ButtonStyleMode {
    | NORMAL
    | EMPHASIZED
    | TEXTUAL
}
```

**功能：** 按钮的样式和重要程度类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### EMPHASIZED

```cangjie
EMPHASIZED
```

**功能：** 强调按钮（用于强调当前操作）。

**起始版本：** 12

### NORMAL

```cangjie
NORMAL
```

**功能：** 普通按钮（一般界面操作）。

**起始版本：** 12

### TEXTUAL

```cangjie
TEXTUAL
```

**功能：** 文本按钮（纯文本，无背景颜色）。

**起始版本：** 12

## enum ButtonType

```cangjie
public enum ButtonType {
    | Normal
    | Capsule
    | Circle
    | ROUNDED_RECTANGLE
}
```

**功能：** 按键形状类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Capsule

```cangjie
Capsule
```

**功能：** 胶囊型按钮（圆角默认为高度的一半）。

**起始版本：** 12

### Circle

```cangjie
Circle
```

**功能：** 圆形按钮。

**起始版本：** 12

### Normal

```cangjie
Normal
```

**功能：** 普通按钮（默认不带圆角）。

**起始版本：** 12

### ROUNDED_RECTANGLE

```cangjie
ROUNDED_RECTANGLE
```

**功能：** 圆角矩形按钮。

**起始版本：** 12

## enum CanvasDirection

```cangjie
public enum CanvasDirection {
    | inherit
    | ltr
    | rtl
}
```

**功能：** 设置绘制文字时使用的文字方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### inherit

```cangjie
inherit
```

**功能：** 继承canvas组件通用属性已设定的文本方向。

**起始版本：** 12

### ltr

```cangjie
ltr
```

**功能：** 从左往右。

**起始版本：** 12

### rtl

```cangjie
rtl
```

**功能：** 从右往左。

**起始版本：** 12

## enum CanvasFillRule

```cangjie
public enum CanvasFillRule {
    | evenodd
    | nonzero
}
```

**功能：** 指定要填充对象的规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### evenodd

```cangjie
evenodd
```

**功能：** 奇偶规则。

**起始版本：** 12

### nonzero

```cangjie
nonzero
```

**功能：** 非零规则。

**起始版本：** 12

## enum CheckBoxShape

```cangjie
public enum CheckBoxShape {
    | CIRCLE
    | ROUNDED_SQUARE
}
```

**功能：** 多选框形状类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### CIRCLE

```cangjie
CIRCLE
```

**功能：** 圆形形状。

**起始版本：** 12

### ROUNDED_SQUARE

```cangjie
ROUNDED_SQUARE
```

**功能：** 圆角方形形状。

**起始版本：** 12

## enum ClickEffectLevel

```cangjie
public enum ClickEffectLevel {
    | LIGHT
    | MIDDLE
    | HEAVY
}
```

**功能：** 点击回弹动效设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### HEAVY

```cangjie
HEAVY
```

**功能：** 大面积（厚重）。弹簧动效， 刚性：350，阻尼：35，初始速度：0.5。

**起始版本：** 12

### LIGHT

```cangjie
LIGHT
```

**功能：** 小面积（轻盈）。弹簧动效， 刚性：410，阻尼：38，初始速度：1。

**起始版本：** 12

### MIDDLE

```cangjie
MIDDLE
```

**功能：** 中面积（稳定）。弹簧动效， 刚性：350，阻尼：35，初始速度：0.5。

**起始版本：** 12

## enum ColoringStrategy

```cangjie
public enum ColoringStrategy {
    | INVERT
    | AVERAGE
    | PRIMARY
}
```

**功能：** 智能取色枚举类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### AVERAGE

```cangjie
AVERAGE
```

**功能：** 设置控件背景阴影色为控件背景阴影区域的平均色。仅支持在入参类型为ShadowOptions的shadow中设置该枚举。

**起始版本：** 12

### INVERT

```cangjie
INVERT
```

**功能：** 设置前景色为控件背景色的反色。仅支持在foregroundColor中设置该枚举。

**起始版本：** 12

### PRIMARY

```cangjie
PRIMARY
```

**功能：** 设置控件背景阴影色为控件背景阴影区域的主色。仅支持在入参类型为ShadowOptions的shadow中设置该枚举。

**起始版本：** 12

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

**功能：** 设置合成操作的方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### copy

```cangjie
copy
```

**功能：** 显示新绘制内容而忽略现有绘制内容。

**起始版本：** 12

### destination-atop

```cangjie
destination-atop
```

**功能：** 在新绘制内容顶部显示现有绘制内容。

**起始版本：** 12

### destination-in

```cangjie
destination-in
```

**功能：** 在新绘制内容中显示现有绘制内容。

**起始版本：** 12

### destination-out

```cangjie
destination-out
```

**功能：** 在新绘制内容外显示现有绘制内容。

**起始版本：** 12

### destination-over

```cangjie
destination-over
```

**功能：** 在新绘制内容上方显示现有绘制内容。

**起始版本：** 12

### lighter

```cangjie
lighter
```

**功能：** 显示新绘制内容和现有绘制内容。

**起始版本：** 12

### source-atop

```cangjie
source-atop
```

**功能：** 在现有绘制内容顶部显示新绘制内容。

**起始版本：** 12

### source-in

```cangjie
source-in
```

**功能：** 在现有绘制内容中显示新绘制内容。

**起始版本：** 12

### source-out

```cangjie
source-out
```

**功能：** 在现有绘制内容之外显示新绘制内容。

**起始版本：** 12

### source-over

```cangjie
source-over
```

**功能：** 在现有绘制内容上显示新绘制内容，属于默认值。

**起始版本：** 12

### xor

```cangjie
xor
```

**功能：** 使用异或操作对新绘制内容与现有绘制内容进行融合。

**起始版本：** 12

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

**功能：** 自动填充类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### **HOUSE_NUMBER**

```cangjie
HOUSE_NUMBER
```

**功能：** 【门牌号】在已启用情景化自动填充的情况下，支持门牌号的自动保存和自动填充。

**起始版本：** 12

### **ID_CARD_NUMBER**

```cangjie
ID_CARD_NUMBER
```

**功能：** 【身份证号】在已启用情景化自动填充的情况下，支持身份证号的自动保存和自动填充。

**起始版本：** 12

### **NEW_PASSWORD**

```cangjie
NEW_PASSWORD
```

**功能：** 【新密码】在已启用密码保险箱的情况下，支持自动生成新密码。

**起始版本：** 12

### **NICKNAME**

```cangjie
NICKNAME
```

**功能：** 【昵称】在已启用情景化自动填充的情况下，支持昵称的自动保存和自动填充。

**起始版本：** 12

### **PASSWORD**

```cangjie
PASSWORD
```

**功能：** 【密码】在已启用密码保险箱的情况下，支持密码的自动保存和自动填充。

**起始版本：** 12

### **PERSON_FIRST_NAME**

```cangjie
PERSON_FIRST_NAME
```

**功能：** 【名字】在已启用情景化自动填充的情况下，支持名字的自动保存和自动填充。

**起始版本：** 12

### **PERSON_FULL_NAME**

```cangjie
PERSON_FULL_NAME
```

**功能：** 【姓名】在已启用情景化自动填充的情况下，支持姓名的自动保存和自动填充。

**起始版本：** 12

### **PERSON_LAST_NAME**

```cangjie
PERSON_LAST_NAME
```

**功能：** 【姓氏】在已启用情景化自动填充的情况下，支持姓氏的自动保存和自动填充。

**起始版本：** 12

### **PHONE_COUNTRY_CODE**

```cangjie
PHONE_COUNTRY_CODE
```

**功能：** 【国家代码】在已启用情景化自动填充的情况下，支持国家代码的自动保存和自动填充。

**起始版本：** 12

### **PHONE_NUMBER**

```cangjie
PHONE_NUMBER
```

**功能：** 【手机号码】在已启用情景化自动填充的情况下，支持手机号码的自动保存和自动填充。

**起始版本：** 12

### **PROVINCE_ADDRESS**

```cangjie
PROVINCE_ADDRESS
```

**功能：** 【省】在已启用情景化自动填充的情况下，支持省的自动保存和自动填充。

**起始版本：** 12

### **USER_NAME**

```cangjie
USER_NAME
```

**功能：** 【用户名】在已启用密码保险箱的情况下，支持用户名的自动保存和自动填充。

**起始版本：** 12

### BANK_CARD_NUMBER

```cangjie
BANK_CARD_NUMBER
```

**功能：** 【银行卡号】在已启用情景化自动填充的情况下，支持银行卡号的自动保存和自动填充。

**起始版本：** 12

### CITY_ADDRESS

```cangjie
CITY_ADDRESS
```

**功能：** 【市】在已启用情景化自动填充的情况下，支持市的自动保存和自动填充。

**起始版本：** 12

### COUNTRY_ADDRESS

```cangjie
COUNTRY_ADDRESS
```

**功能：** 【国家】在已启用情景化自动填充的情况下，支持国家的自动保存和自动填充。

**起始版本：** 12

### DETAIL_INFO_WITHOUT_STREET

```cangjie
DETAIL_INFO_WITHOUT_STREET
```

**功能：** 【无街道地址】在已启用情景化自动填充的情况下，支持无街道地址的自动保存和自动填充。

**起始版本：** 12

### DISTRICT_ADDRESS

```cangjie
DISTRICT_ADDRESS
```

**功能：** 【区/县】在已启用情景化自动填充的情况下，支持区/县的自动保存和自动填充。

**起始版本：** 12

### EMAIL_ADDRESS

```cangjie
EMAIL_ADDRESS
```

**功能：** 【邮箱地址】在已启用情景化自动填充的情况下，支持邮箱地址的自动保存和自动填充。

**起始版本：** 12

### FORMAT_ADDRESS

```cangjie
FORMAT_ADDRESS
```

**功能：** 【标准地址】在已启用情景化自动填充的情况下，支持标准地址的自动保存和自动填充。

**起始版本：** 12

### FULL_PHONE_NUMBER

```cangjie
FULL_PHONE_NUMBER
```

**功能：** 【包含国家代码的手机号码】在已启用情景化自动填充的情况下，支持包含国家代码的手机号码的自动保存和自动填充。

**起始版本：** 12

### FULL_STREET_ADDRESS

```cangjie
FULL_STREET_ADDRESS
```

**功能：** 【详细地址】在已启用情景化自动填充的情况下，支持详细地址的自动保存和自动填充。

**起始版本：** 12

## enum ControlSize

```cangjie
public enum ControlSize {
    | SMALL
    | NORMAL
}
```

**功能：** 控制尺寸大小。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### NORMAL

```cangjie
NORMAL
```

**功能：** 正常尺寸。

**起始版本：** 12

### SMALL

```cangjie
SMALL
```

**功能：** 小尺寸。

**起始版本：** 12

## enum CopyOptions

```cangjie
public enum CopyOptions {
    | None
    | InApp
    | LocalDevice
}
```

**功能：** 输入的文本复制模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### InApp

```cangjie
InApp
```

**功能：** 支持应用内复制。

**起始版本：** 12

### LocalDevice

```cangjie
LocalDevice
```

**功能：** 支持设备内复制。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 不支持复制。

**起始版本：** 12

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

**功能：** 插值曲线，动效请参考贝塞尔曲线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Ease

```cangjie
Ease
```

**功能：** 表示动画以低速开始，然后加快，在结束前变慢，CubicBezier(0.25, 0.1, 0.25, 1.0)。

**起始版本：** 12

### EaseIn

```cangjie
EaseIn
```

**功能：** 表示动画以低速开始，CubicBezier(0.42, 0.0, 1.0, 1.0)。

**起始版本：** 12

### EaseInOut

```cangjie
EaseInOut
```

**功能：** 表示动画以低速开始和结束，CubicBezier(0.42, 0.0, 0.58, 1.0)。

**起始版本：** 12

### EaseOut

```cangjie
EaseOut
```

**功能：** 表示动画以低速结束，CubicBezier(0.0, 0.0, 0.58, 1.0)。

**起始版本：** 12

### ExtremeDeceleration

```cangjie
ExtremeDeceleration
```

**功能：** 急缓曲线，cubic-bezier(0.0, 0.0, 0.0, 1.0)。

**起始版本：** 12

### FastOutLinearIn

```cangjie
FastOutLinearIn
```

**功能：** 加速曲线，cubic-bezier(0.4, 0.0, 1.0, 1.0)。

**起始版本：** 12

### FastOutSlowIn

```cangjie
FastOutSlowIn
```

**功能：** 标准曲线，cubic-bezier(0.4, 0.0, 0.2, 1.0)。

**起始版本：** 12

### Friction

```cangjie
Friction
```

**功能：** 阻尼曲线，CubicBezier(0.2, 0.0, 0.2, 1.0)。

**起始版本：** 12

### Linear

```cangjie
Linear
```

**功能：** 表示动画从头到尾的速度都是相同的。

**起始版本：** 12

### LinearOutSlowIn

```cangjie
LinearOutSlowIn
```

**功能：** 标准曲线，cubic-bezier(0.4, 0.0, 0.2, 1.0)。

**起始版本：** 12

### Rhythm

```cangjie
Rhythm
```

**功能：** 节奏曲线，cubic-bezier(0.7, 0.0, 0.2, 1.0)。

**起始版本：** 12

### Sharp

```cangjie
Sharp
```

**功能：** 锐利曲线，cubic-bezier(0.33, 0.0, 0.67, 1.0)。

**起始版本：** 12

### Smooth

```cangjie
Smooth
```

**功能：** 平滑曲线，cubic-bezier(0.4, 0.0, 0.4, 1.0)。

**起始版本：** 12

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

**功能：** 弹窗在竖直方向上的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Bottom

```cangjie
Bottom
```

**功能：** 垂直底部对齐。

**起始版本：** 12

### BottomEnd

```cangjie
BottomEnd
```

**功能：** 右下对齐。

**起始版本：** 12

### BottomStart

```cangjie
BottomStart
```

**功能：** 左下对齐。

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** 垂直居中对齐。

**起始版本：** 12

### CenterEnd

```cangjie
CenterEnd
```

**功能：** 右中对齐。

**起始版本：** 12

### CenterStart

```cangjie
CenterStart
```

**功能：** 左中对齐。

**起始版本：** 12

### Default

```cangjie
Default
```

**功能：** 默认对齐。

**起始版本：** 12

### Top

```cangjie
Top
```

**功能：** 垂直顶部对齐。

**起始版本：** 12

### TopEnd

```cangjie
TopEnd
```

**功能：** 右上对齐。

**起始版本：** 12

### TopStart

```cangjie
TopStart
```

**功能：** 左上对齐。

**起始版本：** 12

## enum DialogButtonStyle

```cangjie
public enum DialogButtonStyle {
    | DEFAULT
    | HIGHLIGHT
}
```

**功能：** 对话框按钮样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 白底蓝字（深色主题：白底=黑底）。

**起始版本：** 12

### HIGHLIGHT

```cangjie
HIGHLIGHT
```

**功能：** 蓝底白字。

**起始版本：** 12

## enum Direction

```cangjie
public enum Direction {
    | Ltr
    | Rtl
    | Auto
}
```

**功能：** 元素布局方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Auto

```cangjie
Auto
```

**功能：** 使用系统默认布局方向。

**起始版本：** 12

### Ltr

```cangjie
Ltr
```

**功能：** 元素从左到右布局。

**起始版本：** 12

### Rtl

```cangjie
Rtl
```

**功能：** 元素从右到左布局。

**起始版本：** 12

## enum Edge

```cangjie
public enum Edge {
    | Top
    | Start
    | Bottom
    | End
}
```

**功能：** 滚动到容器边缘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Bottom

```cangjie
Bottom
```

**功能：** 竖直方向下边缘。

**起始版本：** 12

### End

```cangjie
End
```

**功能：** 水平方向末尾位置。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** 水平方向起始位置。

**起始版本：** 12

### Top

```cangjie
Top
```

**功能：** 竖直方向上边缘。

**起始版本：** 12

## enum EdgeEffect

```cangjie
public enum EdgeEffect {
    | Spring
    | Fade
    | None
}
```

**功能：** 边缘滑动效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Fade

```cangjie
Fade
```

**功能：** 阴影效果，滑动到边缘后会有圆弧状的阴影。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 滑动到边缘后无效果。

**起始版本：** 12

### Spring

```cangjie
Spring
```

**功能：** 弹性物理动效，滑动到边缘后可以根据初始速度或通过触摸事件继续滑动一段距离，松手后回弹。

**起始版本：** 12

## enum EllipsisMode

```cangjie
public enum EllipsisMode {
    | START
    | CENTER
    | END
}
```

**功能：** 省略方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### CENTER

```cangjie
CENTER
```

**功能：** 省略行中内容。

**起始版本：** 12

### END

```cangjie
END
```

**功能：** 省略行末内容。

**起始版本：** 12

### START

```cangjie
START
```

**功能：** 省略行首内容。

**起始版本：** 12

## enum EmbeddedType

```cangjie
public enum EmbeddedType {
    | EMBEDDED_UI_EXTENSION
}
```

**功能：** 用于指定EmbeddedComponent可拉起的提供方类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### EMBEDDED_UI_EXTENSION

```cangjie
EMBEDDED_UI_EXTENSION
```

**功能：** 表示当前拉起的提供方类型为EmbeddedUIExtensionAbility。

**起始版本：** 12

## enum FillMode

```cangjie
public enum FillMode {
    | None
    | Forwards
    | Backwards
    | Both
}
```

**功能：** 当前播放方向下，动画开始前和结束后的状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Backwards

```cangjie
Backwards
```

**功能：** 动画将在应用于目标时立即应用第一个关键帧中定义的值，并在delay期间保留此值。第一个关键帧取决于playMode，playMode为Normal或Alternate时为from的状态，playMode为Reverse或AlternateReverse时为to的状态。

**起始版本：** 12

### Both

```cangjie
Both
```

**功能：** 动画将遵循Forwards和Backwards的规则，从而在两个方向上扩展动画属性。

**起始版本：** 12

### Forwards

```cangjie
Forwards
```

**功能：** 目标将保留动画执行期间最后一个关键帧的状态。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 动画未执行时不会将任何样式应用于目标，动画播放完成之后恢复初始默认状态。

**起始版本：** 12

## enum FinishCallbackType

```cangjie
public enum FinishCallbackType {
    | REMOVED
    | LOGICALLY
}
```

**功能：** 动画结束时的回调类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### LOGICALLY

```cangjie
LOGICALLY
```

**功能：** 当动画在逻辑上处于下降状态，但可能仍处于其长尾状态时，将触发回调。

**起始版本：** 12

### REMOVED

```cangjie
REMOVED
```

**功能：** 当整个动画结束并立即删除时，将触发回调。

**起始版本：** 12

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

**功能：** Flex容器对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** 元素在主轴方向中心对齐，第一个元素与行首的距离与最后一个元素与行尾距离相同。

**起始版本：** 12

### End

```cangjie
End
```

**功能：** 元素在主轴方向尾部对齐，最后一个元素与行尾对齐，其他元素与后一个对齐。

**起始版本：** 12

### SpaceAround

```cangjie
SpaceAround
```

**功能：** Flex主轴方向均匀分配弹性元素，相邻元素之间距离相同。第一个元素到行首的距离和最后一个元素到行尾的距离是相邻元素之间距离的一半。

**起始版本：** 12

### SpaceBetween

```cangjie
SpaceBetween
```

**功能：** Flex主轴方向均匀分配弹性元素，相邻元素之间距离相同。第一个元素与行首对齐，最后一个元素与行尾对齐。

**起始版本：** 12

### SpaceEvenly

```cangjie
SpaceEvenly
```

**功能：** Flex主轴方向元素等间距布局，相邻元素之间的间距、第一个元素与行首的间距、最后一个元素到行尾的间距都完全一样。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** 元素在主轴方向首端对齐，第一个元素与行首对齐，同时后续的元素与前一个对齐。

**起始版本：** 12

## enum FlexDirection

```cangjie
public enum FlexDirection {
    | Row
    | Column
    | RowReverse
    | ColumnReverse
}
```

**功能：** Flex布局容器方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Column

```cangjie
Column
```

**功能：** 主轴与列方向一致作为布局模式。

**起始版本：** 12

### ColumnReverse

```cangjie
ColumnReverse
```

**功能：** 与Column相反方向进行布局。

**起始版本：** 12

### Row

```cangjie
Row
```

**功能：** 主轴与行方向一致作为布局模式。

**起始版本：** 12

### RowReverse

```cangjie
RowReverse
```

**功能：** 与Row方向相反方向进行布局。

**起始版本：** 12

## enum FlexWrap

```cangjie
public enum FlexWrap {
    | NoWrap
    | Wrap
    | WrapReverse
}
```

**功能：** Flex布局容器约束方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### NoWrap

```cangjie
NoWrap
```

**功能：** Flex容器的元素单行/列布局，子元素尽可能约束在容器内。当子元素有最小尺寸约束等设置时，Flex容器不会对其强制弹性压缩。

**起始版本：** 12

### Wrap

```cangjie
Wrap
```

**功能：** Flex容器的元素多行/列排布，子项允许超出容器。

**起始版本：** 12

### WrapReverse

```cangjie
WrapReverse
```

**功能：** Flex容器的元素反向多行/列排布，子项允许超出容器。

**起始版本：** 12

## enum FoldStatus

```cangjie
public enum FoldStatus {
    | FOLD_STATUS_UNKNOWN
    | FOLD_STATUS_EXPANDED
    | FOLD_STATUS_FOLDED
    | FOLD_STATUS_HALF_FOLDED
}
```

**功能：** 表示折叠设备折叠状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### FOLD_STATUS_EXPANDED

```cangjie
FOLD_STATUS_EXPANDED
```

**功能：** 表示设备当前折叠状态为完全展开。

**起始版本：** 12

### FOLD_STATUS_FOLDED

```cangjie
FOLD_STATUS_FOLDED
```

**功能：** 表示设备当前折叠状态为折叠。

**起始版本：** 12

### FOLD_STATUS_HALF_FOLDED

```cangjie
FOLD_STATUS_HALF_FOLDED
```

**功能：** 表示设备当前折叠状态为半折叠。半折叠指完全展开和折叠之间的状态。

**起始版本：** 12

### FOLD_STATUS_UNKNOWN

```cangjie
FOLD_STATUS_UNKNOWN
```

**功能：** 表示设备当前折叠状态未知。

**起始版本：** 12

## enum FontStyle

```cangjie
public enum FontStyle {
    | Normal
    | Italic
}
```

**功能：** 字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Italic

```cangjie
Italic
```

**功能：** 标准的字体样式。

**起始版本：** 12

### Normal

```cangjie
Normal
```

**功能：** 标准的字体样式。

**起始版本：** 12

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

**功能：** 设置文本的字体粗细，设置过大可能会在不同字体下有截断。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Bold

```cangjie
Bold
```

**功能：** 字体较粗。

**起始版本：** 12

### Bolder

```cangjie
Bolder
```

**功能：** 字体非常粗。

**起始版本：** 12

### Lighter

```cangjie
Lighter
```

**功能：** 字体较细。

**起始版本：** 12

### Medium

```cangjie
Medium
```

**功能：** 字体粗细适中。

**起始版本：** 12

### Normal

```cangjie
Normal
```

**功能：** 字体粗细正常。

**起始版本：** 12

### Regular

```cangjie
Regular
```

**功能：** 字体粗细稍粗。

**起始版本：** 12

### W100

```cangjie
W100
```

**功能：** 100（最细）。

**起始版本：** 12

### W200

```cangjie
W200
```

**功能：** 200。

**起始版本：** 12

### W300

```cangjie
W300
```

**功能：** 300。

**起始版本：** 12

### W400

```cangjie
W400
```

**功能：** 400（正常）。

**起始版本：** 12

### W500

```cangjie
W500
```

**功能：** 500。

**起始版本：** 12

### W600

```cangjie
W600
```

**功能：** 600。

**起始版本：** 12

### W700

```cangjie
W700
```

**功能：** 700。

**起始版本：** 12

### W800

```cangjie
W800
```

**功能：** 800。

**起始版本：** 12

### W900

```cangjie
W900
```

**功能：** 900（最粗）。

**起始版本：** 12

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

**功能：** 前景模糊样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### BACKGROUND_REGULAR

```cangjie
BACKGROUND_REGULAR
```

**功能：** 中距景深模糊。

**起始版本：** 12

### BACKGROUND_THICK

```cangjie
BACKGROUND_THICK
```

**功能：** 远距景深模糊。

**起始版本：** 12

### BACKGROUND_THIN

```cangjie
BACKGROUND_THIN
```

**功能：** 近距景深模糊。

**起始版本：** 12

### BACKGROUND_ULTRA_THICK

```cangjie
BACKGROUND_ULTRA_THICK
```

**功能：** 超远距景深模糊。

**起始版本：** 12

### COMPONENT_REGULAR

```cangjie
COMPONENT_REGULAR
```

**功能：** 组件普通材质模糊。

**起始版本：** 12

### COMPONENT_THICK

```cangjie
COMPONENT_THICK
```

**功能：** 组件厚材质模糊。

**起始版本：** 12

### COMPONENT_THIN

```cangjie
COMPONENT_THIN
```

**功能：** 组件轻薄材质模糊。

**起始版本：** 12

### COMPONENT_ULTRA_THICK

```cangjie
COMPONENT_ULTRA_THICK
```

**功能：** 组件超厚材质模糊。

**起始版本：** 12

### COMPONENT_ULTRA_THIN

```cangjie
COMPONENT_ULTRA_THIN
```

**功能：** 组件超轻薄材质模糊。

**起始版本：** 12

### NONE

```cangjie
NONE
```

**功能：** 关闭模糊。

**起始版本：** 12

### REGULAR

```cangjie
REGULAR
```

**功能：** 普通厚度材质模糊。

**起始版本：** 12

### THICK

```cangjie
THICK
```

**功能：** 厚材质模糊。

```cangjie
THIN
```

**功能：** 轻薄材质模糊。

**起始版本：** 12

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

**功能：** 键盘功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DPAD_DOWN

```cangjie
DPAD_DOWN
```

**功能：** 表示键盘上DPAD_DOWN功能键。

**起始版本：** 12

### DPAD_LEFT

```cangjie
DPAD_LEFT
```

**功能：** 表示键盘上DPAD_LEFT功能键。

**起始版本：** 12

### DPAD_RIGHT

```cangjie
DPAD_RIGHT
```

**功能：** 表示键盘上DPAD_RIGHT功能键。

**起始版本：** 12

### DPAD_UP

```cangjie
DPAD_UP
```

**功能：** 表示键盘上DPAD_UP功能键。

**起始版本：** 12

### ESC

```cangjie
ESC
```

**功能：** 表示键盘上ESC功能键。

**起始版本：** 12

### F1

```cangjie
F1
```

**功能：** 表示键盘上F1功能键。

**起始版本：** 12

### F10

```cangjie
F10
```

**功能：** 表示键盘上F10功能键。

**起始版本：** 12

### F11

```cangjie
F11
```

**功能：** 表示键盘上F11功能键。

**起始版本：** 12

### F12

```cangjie
F12
```

**功能：** 表示键盘上F12功能键。

**起始版本：** 12

### F2

```cangjie
F2
```

**功能：** 表示键盘上F2功能键。

**起始版本：** 12

### F3

```cangjie
F3
```

**功能：** 表示键盘上F3功能键。

**起始版本：** 12

### F4

```cangjie
F4
```

**功能：** 表示键盘上F4功能键。

**起始版本：** 12

### F5

```cangjie
F5
```

**功能：** 表示键盘上F5功能键。

**起始版本：** 12

### F6

```cangjie
F6
```

**功能：** 表示键盘上F6功能键。

**起始版本：** 12

### F7

```cangjie
F7
```

**功能：** 表示键盘上F7功能键。

**起始版本：** 12

### F8

```cangjie
F8
```

**功能：** 表示键盘上F8功能键。

**起始版本：** 12

### F9

```cangjie
F9
```

**功能：** 表示键盘上F9功能键。

**起始版本：** 12

### TAB

```cangjie
TAB
```

**功能：** 表示键盘上TAB功能键。

**起始版本：** 12

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

**功能：** 梯度方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Bottom

```cangjie
Bottom
```

**功能：** 从上向下。

**起始版本：** 12

### Left

```cangjie
Left
```

**功能：** 从右向左。

**起始版本：** 12

### LeftBottom

```cangjie
LeftBottom
```

**功能：** 左下。

**起始版本：** 12

### LeftTop

```cangjie
LeftTop
```

**功能：** 左上。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 无。

**起始版本：** 12

### Right

```cangjie
Right
```

**功能：** 从左向右。

**起始版本：** 12

### RightBottom

```cangjie
RightBottom
```

**功能：** 右下。

**起始版本：** 12

### RightTop

```cangjie
RightTop
```

**功能：** 右上。

**起始版本：** 12

### Top

```cangjie
Top
```

**功能：** 从下向上。

**起始版本：** 12

## enum GridItemStyle

```cangjie
public enum GridItemStyle {
    | NONE
    | PLAIN
}
```

**功能：** 设置GridItem样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### NONE

```cangjie
NONE
```

**功能：** 设置为GridItemStyle.NONE时不显示Hover（悬停）和Press（按压）态样式。

**起始版本：** 12

### PLAIN

```cangjie
PLAIN
```

**功能：** 设置为GridItemStyle.PLAIN时，显示Hover（悬停）、Press（按压）态样式。

**起始版本：** 12

## enum HeightBreakpoint

```cangjie
public enum HeightBreakpoint {
    | HEIGHT_SM
    | HEIGHT_MD
    | HEIGHT_LG
}
```

**功能：** 表示窗口不同高宽比阈值下对应的高度断点枚举值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### HEIGHT_LG

```cangjie
HEIGHT_LG
```

**功能：** 窗口高宽比大于等于1.2。

**起始版本：** 12

### HEIGHT_MD

```cangjie
HEIGHT_MD
```

**功能：** 窗口高宽比大于等于0.8，且小于1.2。

**起始版本：** 12

### HEIGHT_SM

```cangjie
HEIGHT_SM
```

**功能：** 窗口高宽比小于0.8。

**起始版本：** 12

## enum HitTestMode

```cangjie
public enum HitTestMode {
    | Default
    | Block
    | Transparent
    | None
}
```

**功能：** 触摸测试效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Block

```cangjie
Block
```

**功能：** 自身节点响应触摸事件的命中测试，但阻止被该节点屏蔽的子节点和其他节点的命中测试。

**起始版本：** 12

### Default

```cangjie
Default
```

**功能：** 自身节点和子节点都响应触摸事件的命中测试，但会阻止被该节点屏蔽的其他节点的命中测试。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 自身节点不会响应触摸事件的命中测试，但子节点会对触摸事件进行命中测试。

**起始版本：** 12

### Transparent

```cangjie
Transparent
```

**功能：** 自身节点和子节点响应触摸事件的命中测试，并允许对被该节点屏蔽的其他节点进行命中测试。

**起始版本：** 12

## enum HorizontalAlign

```cangjie
public enum HorizontalAlign {
    | Start
    | Center
    | End
}
```

**功能：** 水平方向对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** 居中对齐，默认对齐方式。

**起始版本：** 12

### End

```cangjie
End
```

**功能：** 按照语言方向末端对齐。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** 按照语言方向起始端对齐。

**起始版本：** 12

## enum HoverEffect

```cangjie
public enum HoverEffect {
    | Auto
    | Scale
    | Highlight
    | None
}
```

**功能：** 设置当前组件悬停态下的悬浮效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Auto

```cangjie
Auto
```

**功能：** 使用组件的系统默认悬浮效果。

**起始版本：** 12

### Highlight

```cangjie
Highlight
```

**功能：** 背景淡入淡出的强调效果。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 不设置效果。

**起始版本：** 12

### Scale

```cangjie
Scale
```

**功能：** 放大缩小效果。

**起始版本：** 12

## enum HoverModeAreaType

```cangjie
public enum HoverModeAreaType {
    | TOP_SCREEN
    | BOTTOM_SCREEN
}
```

**功能：** 悬停态显示区域类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### BOTTOM_SCREEN

```cangjie
BOTTOM_SCREEN
```

**功能：** 下半屏。

**起始版本：** 12

### TOP_SCREEN

```cangjie
TOP_SCREEN
```

**功能：** 上半屏。

**起始版本：** 12

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

**功能：** 图片的显示适配方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Auto

```cangjie
Auto
```

**功能：** 图像会根据其自身尺寸和组件的尺寸进行适当缩放，以在保持比例的同时填充视图。

**起始版本：** 19

### BOTTOM

```cangjie
BOTTOM
```

**功能：** 图像显示在Image组件的底部横向居中，保持原有尺寸显示。

**起始版本：** 19

### BOTTOM_END

```cangjie
BOTTOM_END
```

**功能：** 图像显示在Image组件的底部尾端，保持原有尺寸显示。

**起始版本：** 19

### BOTTOM_START

```cangjie
BOTTOM_START
```

**功能：** 图像显示在Image组件的底部起始端，保持原有尺寸显示。

**起始版本：** 19

### CENTER

```cangjie
CENTER
```

**功能：** 图像显示在Image组件的横向和纵向居中，保持原有尺寸显示。

**起始版本：** 19

### Contain

```cangjie
Contain
```

**功能：** 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。

**起始版本：** 12

### Cover

```cangjie
Cover
```

**功能：** 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。

**起始版本：** 12

### END

```cangjie
END
```

**功能：** 图像显示在Image组件的尾端纵向居中，保持原有尺寸显示。

**起始版本：** 19

### Fill

```cangjie
Fill
```

**功能：** 不保持宽高比进行放大缩小，使得图片充满显示边界。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 保持原有尺寸显示。

**起始版本：** 19

### ScaleDown

```cangjie
ScaleDown
```

**功能：** 保持宽高比显示，图片缩小或者保持不变。

**起始版本：** 19

### START

```cangjie
START
```

**功能：** 图像显示在Image组件的起始端纵向居中，保持原有尺寸显示。

**起始版本：** 19

### TOP

```cangjie
TOP
```

**功能：** 图像显示在Image组件的顶部横向居中，保持原有尺寸显示。

**起始版本：** 19

### TOP_END

```cangjie
TOP_END
```

**功能：** 图像显示在Image组件的顶部尾端，保持原有尺寸显示。

**起始版本：** 19

### TOP_START

```cangjie
TOP_START
```

**功能：** 图像显示在Image组件的顶部起始端，保持原有尺寸显示。

**起始版本：** 19

## enum ImageRepeat

```cangjie
public enum ImageRepeat {
    | NoRepeat
    | X
    | Y
    | XY
}
```

**功能：** 图片重复方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### NoRepeat

```cangjie
NoRepeat
```

**功能：** 不重复绘制图片。

**起始版本：** 12

### X

```cangjie
X
```

**功能：** 只在水平轴上重复绘制图片。

**起始版本：** 12

### XY

```cangjie
XY
```

**功能：** 在两个轴上重复绘制图片。

**起始版本：** 12

### Y

```cangjie
Y
```

**功能：** 只在竖直轴上重复绘制图片。

**起始版本：** 12

## enum ImageSize

```cangjie
public enum ImageSize {
    | Contain
    | Cover
    | Auto
    | FILL
}
```

**功能：** 图片尺寸显示设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Auto

```cangjie
Auto
```

**功能：** 默认值，保持原图的比例不变。

**起始版本：** 12

### Contain

```cangjie
Contain
```

**功能：** 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。

**起始版本：** 12

### Cover

```cangjie
Cover
```

**功能：** 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。

**起始版本：** 12

### FILL

```cangjie
FILL
```

**功能：** 不保持宽高比进行放大缩小，使得图片充满显示边界。

**起始版本：** 12

## enum ImageSpanAlignment

```cangjie
public enum ImageSpanAlignment {
    | TOP
    | CENTER
    | BOTTOM
    | BASELINE
}
```

**功能：** 图片基于行高的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### BASELINE

```cangjie
BASELINE
```

**功能：** 图片下边沿与文本BaseLine对齐。

**起始版本：** 12

### BOTTOM

```cangjie
BOTTOM
```

**功能：** 图片下边沿与行下边沿对齐。

**起始版本：** 12

### CENTER

```cangjie
CENTER
```

**功能：** 图片中间与行中间对齐。

**起始版本：** 12

### TOP

```cangjie
TOP
```

**功能：** 图片上边沿与行上边沿对齐。

**起始版本：** 12

## enum ImageType

```cangjie
public enum ImageType {
    | png
    | jpeg
    | webp
}
```

**功能：** 指定图像格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### jpeg

```cangjie
jpeg
```

**功能：** jpeg图片格式。

**起始版本：** 12

### png

```cangjie
png
```

**功能：** png图片格式。

**起始版本：** 12

### webp

```cangjie
webp
```

**功能：** webp图片格式。

**起始版本：** 12

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

**功能：** 元素对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Auto

```cangjie
Auto
```

**功能：** 使用Flex容器中默认配置。

**起始版本：** 12

### Baseline

```cangjie
Baseline
```

**功能：** 元素在Flex容器中，交叉轴方向文本基线对齐。

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** 元素在Flex容器中，交叉轴方向居中对齐。

**起始版本：** 12

### End

```cangjie
End
```

**功能：** 元素在Flex容器中，交叉轴方向底部对齐。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** 元素在Flex容器中，交叉轴方向首部对齐。

**起始版本：** 12

### Stretch

```cangjie
Stretch
```

**功能：** 元素在Flex容器中，交叉轴方向拉伸填充。容器为Flex且设置Wrap为FlexWrap.Wrap或FlexWrap.WrapReverse时，元素拉伸到与当前行/列交叉轴长度最长的元素尺寸。其余情况下，无论元素尺寸是否设置，均拉伸到容器尺寸。

**起始版本：** 12

## enum KeyboardAvoidMode

```cangjie
public enum KeyboardAvoidMode {
    | DEFAULT
    | NONE
}
```

**功能：** 弹窗是否在拉起软键盘时进行自动避让。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 默认避让软键盘并在到达极限高度之后进行高度压缩。

**起始版本：** 12

### NONE

```cangjie
NONE
```

**功能：** 不避让软键盘。

**起始版本：** 12

## enum KeySource

```cangjie
public enum KeySource {
    | Unknown
    | Keyboard
}
```

**功能：** 输入设备类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Keyboard

```cangjie
Keyboard
```

**功能：** 输入设备类型为键盘。

**起始版本：** 12

### Unknown

```cangjie
Unknown
```

**功能：** 输入设备类型未知。

**起始版本：** 12

## enum KeyType

```cangjie
public enum KeyType {
    | Down
    | Up
}
```

**功能：** 按键类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Down

```cangjie
Down
```

**功能：** 按键按下。

**起始版本：** 12

### Up

```cangjie
Up
```

**功能：** 按键松开。

**起始版本：** 12

## enum LayoutSafeAreaEdge

```cangjie
public enum LayoutSafeAreaEdge {
    | TOP
    | BOTTOM
}
```

**功能：** 扩展安全区域的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### BOTTOM

```cangjie
BOTTOM
```

**功能：** 下方区域。

**起始版本：** 12

### TOP

```cangjie
TOP
```

**功能：** 上方区域。

**起始版本：** 12

## enum LayoutSafeAreaType

```cangjie
public enum LayoutSafeAreaType {
    SYSTEM
}
```

**功能：** 扩展布局安全区域的枚举类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### SYSTEM

```cangjie
SYSTEM
```

**功能：** 系统默认非安全区域，包括状态栏、导航栏。

**起始版本：** 12

## enum LengthMetricsUnit

```cangjie
public enum LengthMetricsUnit {
    | DEFAULT
    | PX
}
```

**功能：** 长度属性单位枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 长度类型，用于描述以默认的vp像素单位为单位的长度。

**起始版本：** 12

### PX

```cangjie
PX
```

**功能:** 长度类型，用于描述以px像素单位为单位的长度。

**起始版本：** 12

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

**功能：** 长度类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### fp

```cangjie
fp
```

**功能：** 字体像素单位。

**起始版本：** 12

### lpx

```cangjie
lpx
```

**功能：** 逻辑像素单位。

**起始版本：** 12

### percent

```cangjie
percent
```

**功能：** 百分比。

**起始版本：** 12

### px

```cangjie
px
```

**功能：** 基本像素单位。

**起始版本：** 12

### vp

```cangjie
vp
```

**功能：** 屏幕密度单位。

**起始版本：** 12

## enum LineBreakStrategy

```cangjie
public enum LineBreakStrategy {
    | GREEDY
    | HIGH_QUALITY
    | BALANCED
}
```

**功能：** 文本的折行规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### BALANCED

```cangjie
BALANCED
```

**功能：** 尽可能保证在不拆词的情况下，使一个段落中每一行的宽度相同。

**起始版本：** 12

### GREEDY

```cangjie
GREEDY
```

**功能：** 使每一行尽量显示多的字符，直到这一行不能显示更多字符再进行折行。

**起始版本：** 12

### HIGH_QUALITY

```cangjie
HIGH_QUALITY
```

**功能：** 在BALANCED的基础上，尽可能填满行，在最后一行的权重上比较低，可能会出现最后一行留白比较多。

**起始版本：** 12

## enum LineCapStyle

```cangjie
public enum LineCapStyle {
    | Butt
    | Round
    | Square
}
```

**功能：** 线条样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Butt

```cangjie
Butt
```

**功能：** 线条两端为平行线，不额外扩展。

**起始版本：** 12

### Round

```cangjie
Round
```

**功能：** 在线条两端延伸半个圆，直径等于线宽。

**起始版本：** 12

### Square

```cangjie
Square
```

**功能：** 在线条两端延伸半个圆，直径等于线宽。

**起始版本：** 12

## enum LineJoinStyle

```cangjie
public enum LineJoinStyle {
    | Miter
    | Round
    | Bevel
}
```

**功能：** 路径段连接方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Bevel

```cangjie
Bevel
```

**功能：** 使用斜角连接路径段。

**起始版本：** 12

### Miter

```cangjie
Dotted
```

**功能：** 使用尖角连接路径段。

**起始版本：** 12

### Round

```cangjie
Round
```

**功能：** 使用圆角连接路径段。

**起始版本：** 12

## enum ListItemAlign

```cangjie
public enum ListItemAlign {
    | Start
    | Center
    | End
}
```

**功能：** ListItem在List中，交叉轴方向的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** ListItem在List中，交叉轴方向居中对齐。

**起始版本：** 12

### End

```cangjie
End
```

**功能：** ListItem在List中，交叉轴方向尾部对齐。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** ListItem在List中，交叉轴方向首部对齐。

**起始版本：** 12

## enum ListItemGroupArea

```cangjie
public enum ListItemGroupArea {
    | NONE
    | IN_LIST_ITEM_AREA
    | IN_HEADER_AREA
    | IN_FOOTER_AREA
}
```

**功能：** 表示处于ListItemGroup的哪一个区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### IN_FOOTER_AREA

```cangjie
IN_FOOTER_AREA
```

**功能：** 当前页面可视边处于footer位置。

**起始版本：** 12

### IN_HEADER_AREA

```cangjie
IN_HEADER_AREA
```

**功能：** 当前页面可视边处于header位置。

**起始版本：** 12

### IN_LIST_ITEM_AREA

```cangjie
IN_LIST_ITEM_AREA
```

**功能：** 当前页面可视边处于ListItem位置。

**起始版本：** 12

### NONE

```cangjie
NONE
```

**功能：** 当前页面可视边处于none位置。例如，ListItemGroup中既没有header、footer，也没有ListItem。

**起始版本：** 12

## enum MarqueeUpdateStrategy

```cangjie
public enum MarqueeUpdateStrategy {
    | DEFAULT
    | PRESERVE_POSITION
}
```

**功能：** 跑马灯效果更新策略。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 跑马灯组件属性更新后， 从开始位置， 运行跑马灯效果。

**起始版本：** 12

### PRESERVE_POSITION

```cangjie
PRESERVE_POSITION
```

**功能：** 跑马灯组件属性更新后， 保持当前位置， 运行跑马灯效果。

**起始版本：** 12

## enum MenuPolicy

```cangjie
public enum MenuPolicy {
    | Default
    | Hide
    | Show
}
```

**功能：** 菜单弹出的策略。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 按照底层默认逻辑决定是否弹出菜单。

**起始版本：** 12

### HIDE

```cangjie
HIDE
```

**功能：** 始终不弹出菜单。

**起始版本：** 12

### SHOW

```cangjie
SHOW
```

**功能：** 始终弹出菜单。

**起始版本：** 12

## enum MenuPreviewMode

```cangjie
public enum MenuPreviewMode {
    | NONE
    | IMAGE
}
```

**功能：** 菜单的预览内容样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### IMAGE

```cangjie
IMAGE
```

**功能：** 预览内容为触发长按悬浮菜单组件的截图。

**起始版本：** 12

### NONE

```cangjie
NONE
```

**功能：** 不显示预览内容。

**起始版本：** 12

## enum ModalTransition

```cangjie
public enum ModalTransition {
    | DEFAULT
    | NONE
    | ALPHA
}
```

**功能：** 全屏模态切换动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### ALPHA

```cangjie
ALPHA
```

**功能：** 全屏模态透明度渐变动画。

**起始版本：** 12

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 全屏模态上下切换动画。

**起始版本：** 12

### NONE

```cangjie
NONE
```

**功能：** 全屏模态无转场动画。

**起始版本：** 12

## enum ModifierKey

```cangjie
public enum ModifierKey {
    | CTRL
    | SHIFT
    | ALT
}
```

**功能：** 输入法修饰键类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### ALT

```cangjie
ALT
```

**功能：** 表示键盘上Alt键。

**起始版本：** 12

### CTRL

```cangjie
CTRL
```

**功能：** 表示键盘上Ctrl键。

**起始版本：** 12

### SHIFT

```cangjie
SHIFT
```

**功能：** 表示键盘上Shift键。

**起始版本：** 12

## enum MouseAction

```cangjie
public enum MouseAction {
    | Press
    | Release
    | Move
    | Hover
}
```

**功能：** 鼠标动作。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Hover

```cangjie
Hover
```

**功能：** 鼠标悬浮。**说明：** 该枚举值无效。

**起始版本：** 12

### Move

```cangjie
Move
```

**功能：** 鼠标移动。

**起始版本：** 12

### Press

```cangjie
Press
```

**功能：** 鼠标按键按下。

**起始版本：** 12

### Release

```cangjie
Release
```

**功能：** 鼠标按键松开。

**起始版本：** 12

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

**功能：** 鼠标按键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Back

```cangjie
Back
```

**功能：** 鼠标左侧后退键。

**起始版本：** 12

### Forward

```cangjie
Forward
```

**功能：** 鼠标左侧前进键。

**起始版本：** 12

### Left

```cangjie
Left
```

**功能：** 鼠标左键。

**起始版本：** 12

### Middle

```cangjie
Middle
```

**功能：** 鼠标中键。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 无按键。

**起始版本：** 12

### Right

```cangjie
Right
```

**功能：** 鼠标右键。

**起始版本：** 12

## enum NestedScrollMode

```cangjie
public enum NestedScrollMode {
    | SELF_ONLY
    | SELF_FIRST
    | PARENT_FIRST
    | PARALLEL
}
```

**功能：** 可滚动组件往末尾端滚动时的嵌套滚动选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### PARALLEL

```cangjie
PARALLEL
```

**功能：** 自身和父组件同时滚动，自身和父组件都到达边缘以后，如果自身有边缘效果，则自身触发边缘效果，否则父组件触发边缘效果。

**起始版本：** 12

### PARENT_FIRST

```cangjie
PARENT_FIRST
```

**功能：** 父组件先滚动，父组件滚动到边缘以后自身滚动。自身滚动到边缘后，如果有边缘效果，会触发自身的边缘效果，否则触发父组件的边缘效果。

**起始版本：** 12

### SELF_FIRST

```cangjie
SELF_FIRST
```

**功能：** 自身先滚动，自身滚动到边缘以后父组件滚动。父组件滚动到边缘以后，如果父组件有边缘效果，则父组件触发边缘效果，否则子组件触发边缘效果。

**起始版本：** 12

### SELF_ONLY

```cangjie
SELF_ONLY
```

**功能：** 只自身滚动，不与父组件联动。

**起始版本：** 12

## enum ObscuredReasons

```cangjie
public enum ObscuredReasons {
    | PLACEHOLDER
}
```

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### PLACEHOLDER

```cangjie
PLACEHOLDER
```

**功能：** 显示的数据为通用占位符。

**起始版本：** 12

## enum OptionWidthMode

```cangjie
public enum OptionWidthMode {
    | FIT_CONTENT
    | FIT_TRIGGER
}
```

**功能：** 下拉菜单宽度设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### FIT_CONTENT

```cangjie
FIT_CONTENT
```

**功能：** 设置该值时，下拉菜单宽度按默认2栅格显示。

**起始版本：** 12

### FIT_TRIGGER

```cangjie
FIT_TRIGGER
```

**功能：** 设置下拉菜单继承下拉按钮宽度。

**起始版本：** 12

## enum OutlineStyle

```cangjie
public enum OutlineStyle {
    | SOLID
    | DASHED
    | DOTTED
}
```

**功能：** 外描边样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DASHED

```cangjie
DASHED
```

**功能：** 显示为一系列短的方形虚线。

**起始版本：** 12

### DOTTED

```cangjie
DOTTED
```

**功能：** 显示为一系列圆点，圆点半径为outlineWidth的一半。

**起始版本：** 12

### SOLID

```cangjie
SOLID
```

**功能：** 显示为一条实线。

**起始版本：** 12

## enum PixelRoundCalcPolicy

```cangjie
public enum PixelRoundCalcPolicy {
    | NO_FORCE_ROUND
    | FORCE_CEIL
    | FORCE_FLOOR
}
```

**功能：** 当前组件边界取整策略。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### FORCE_CEIL

```cangjie
FORCE_CEIL
```

**功能：** 取上整计算。

**起始版本：** 12

### FORCE_FLOOR

```cangjie
FORCE_FLOOR
```

**功能：** 取下整计算。

**起始版本：** 12

### NO_FORCE_ROUND

```cangjie
NO_FORCE_ROUND
```

**功能：** 不取整计算。

**起始版本：** 12

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

**功能：** 气泡提示位置设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Bottom

```cangjie
Bottom
```

**功能：** 气泡提示位于组件下侧，与组件下侧中心对齐。

**起始版本：** 12

### BottomLeft

```cangjie
BottomLeft
```

**功能：** 气泡提示位于组件下侧，与组件左侧边缘对齐。

**起始版本：** 12

### BottomRight

```cangjie
BottomRight
```

**功能：** 气泡提示位于组件下侧，与组件右侧边缘对齐。

**起始版本：** 12

### Left

```cangjie
Left
```

**功能：** 气泡提示位于组件左侧，与组件左侧中心对齐。

**起始版本：** 12

### LeftBottom

```cangjie
LeftBottom
```

**功能：** 气泡提示位于组件左侧，与组件下侧边缘对齐。

**起始版本：** 12

### LeftTop

```cangjie
LeftTop
```

**功能：** 气泡提示位于组件左侧，与组件上侧边缘对齐。

**起始版本：** 12

### Right

```cangjie
Right
```

**功能：** 气泡提示位于组件右侧，与组件右侧中心对齐。

**起始版本：** 12

### RightBottom

```cangjie
RightBottom
```

**功能：** 气泡提示位于组件右侧，与组件下侧边缘对齐。

**起始版本：** 12

### RightTop

```cangjie
RightTop
```

**功能：** 气泡提示位于组件右侧，与组件上侧边缘对齐。

**起始版本：** 12

### Top

```cangjie
Top
```

**功能：** 气泡提示位于组件上侧，与组件上侧中心对齐。

**起始版本：** 12

### TopLeft

```cangjie
TopLeft
```

**功能：** 气泡提示位于组件上侧，与组件左侧边缘对齐。

**起始版本：** 12

### TopRight

```cangjie
TopRight
```

**功能：** 气泡提示位于组件上侧，与组件右侧边缘对齐。

**起始版本：** 12

## enum PlayMode

```cangjie
public enum PlayMode {
    | Normal
    | Reverse
    | Alternate
    | AlternateReverse
}
```

**功能：** 动画播放方向设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Alternate

```cangjie
Alternate
```

**功能：** 动画在奇数次（1、3、5...）正向播放，在偶数次（2、4、6...）反向播放。

**起始版本：** 12

### AlternateReverse

```cangjie
AlternateReverse
```

**功能：** 动画在奇数次（1、3、5...）反向播放，在偶数次（2、4、6...）正向播放。

**起始版本：** 12

### Normal

```cangjie
Normal
```

**功能：** 动画正向播放。

**起始版本：** 12

### Reverse

```cangjie
Reverse
```

**功能：** 动画反向播放。

**起始版本：** 12

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

**功能：** Progress组件的样式类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Capsule

```cangjie
Capsule
```

**功能：** 胶囊样式，头尾两端圆弧处的进度展示效果与Eclipse相同；中段处的进度展示效果与Linear相同。高度大于宽度的时候自适应垂直显示。

**起始版本：** 12

### Eclipse

```cangjie
Eclipse
```

**功能：** 圆形样式，显示类似月圆月缺的进度展示效果，从月牙逐渐变化至满月。

**起始版本：** 12

### Linear

```cangjie
Linear
```

**功能：** 线性样式。

**起始版本：** 12

### Ring

```cangjie
Ring
```

**功能：** 环形无刻度样式，环形圆环逐渐显示至完全填充效果。

**起始版本：** 12

### ScaleRing

```cangjie
ScaleRing
```

**功能：** 环形有刻度样式，显示类似时钟刻度形式的进度展示效果。

**起始版本：** 12

## enum QualityType

```cangjie
public enum QualityType {
    | Low
    | Medium
    | High
}
```

**功能：** 设置图像平滑度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### high

```cangjie
high
```

**功能：** 高画质。

**起始版本：** 12

### low

```cangjie
low
```

**功能：** 低画质。

**起始版本：** 12

### medium

```cangjie
medium
```

**功能：** 中画质。

**起始版本：** 12

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

**功能：** 下拉状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Inactive

```cangjie
Inactive
```

**功能：** 默认未下拉状态。

**起始版本：** 12

### Drag

```cangjie
Drag
```

**功能：** 下拉中，下拉距离小于刷新距离。

**起始版本：** 12

### OverDrag

```cangjie
OverDrag
```

**功能：** 下拉中，下拉距离超过刷新距离。

**起始版本：** 12

### Refresh

```cangjie
Refresh
```

**功能：** 下拉结束，回弹至刷新距离，进入刷新状态。

**起始版本：** 12

### Done

```cangjie
Done
```

**功能：** 刷新结束，返回初始状态（顶部）。

**起始版本：** 12

## enum RelateType

```cangjie
public enum RelateType {
    | FILL
    | FIT
}
```

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### FILL

```cangjie
FILL
```

**功能：** 缩放当前子组件以填充满父组件。

**起始版本：** 12

### FIT

```cangjie
FIT
```

**功能：** 缩放当前子组件以自适应父组件。

**起始版本：** 12

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

**功能：** 设置图像重复的方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### clamp

```cangjie
clamp
```

**功能：** 在原始边界外绘制时，超出部分使用边缘的颜色绘制。

**起始版本：** 12

### mirror

```cangjie
mirror
```

**功能：** 沿x轴和y轴重复翻转绘制图像。

**起始版本：** 12

### no_repeat

```cangjie
no_repeat
```

**功能：** 不重复绘制图像。

**起始版本：** 12

### repeat

```cangjie
repeat
```

**功能：** 沿x轴和y轴重复绘制图像。

**起始版本：** 12

### repeat_x

```cangjie
repeat_x
```

**功能：** 沿x轴重复绘制图像。

**起始版本：** 12

### repeat_y

```cangjie
repeat_y
```

**功能：** 沿y轴重复绘制图像。

**起始版本：** 12

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

**功能：** 写入资源的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Boolean

```cangjie
Boolean
```

**功能：** Bool类型。

**起始版本：** 12

### Float

```cangjie
Float
```

**功能：** Float类型。

**起始版本：** 12

### IntArray

```cangjie
IntArray
```

**功能：** int数组类型。

**起始版本：** 12

### Integer

```cangjie
Integer
```

**功能：** Integer类型。

**起始版本：** 12

### Media

```cangjie
Media
```

**功能：** Media类型。

**起始版本：** 12

### Pattern

```cangjie
Pattern
```

**功能：** Pattern类型。

**起始版本：** 12

### Plural

```cangjie
Plural
```

**功能：** Plural类型。

**起始版本：** 12

### Rawfile

```cangjie
Rawfile
```

**功能：** Rawfile类型。

**起始版本：** 12

### ResColor

```cangjie
ResColor
```

**功能：** ResColor类型。

**起始版本：** 12

### StrArray

```cangjie
StrArray
```

**功能：** StrArray类型。

**起始版本：** 12

### String

```cangjie
String
```

**功能：** String类型。

**起始版本：** 12

## enum ResponseType

```cangjie
public enum ResponseType {
    | RightClick
    | LongPress
}
```

**功能：** 响应类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### LongPress

```cangjie
LongPress
```

**功能：** 通过长按触发菜单弹出。

**起始版本：** 12

### RightClick

```cangjie
RightClick
```

**功能：** 通过鼠标右键触发菜单弹出。

**起始版本：** 12

## enum RichEditorResponseType

```cangjie
public enum RichEditorResponseType {
    | LONG_PRESS
    | RIGHT_CLICK
    | SELECT
}
```

**功能：** 菜单的响应类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### LONG_PRESS

```cangjie
LONG_PRESS
```

**功能：** 通过长按触发菜单弹出。

**起始版本：** 12

### RIGHT_CLICK

```cangjie
RIGHT_CLICK
```

**功能：** 通过鼠标右键触发菜单弹出。

**起始版本：** 12

### SELECT

```cangjie
SELECT
```

**功能：** 通过鼠标选中触发菜单弹出。

**起始版本：** 12

## enum ScrollBarDirection

```cangjie
public enum ScrollBarDirection {
    | Vertical
    | Horizontal
}
```

**功能：** 设置滚动条的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Vertical

```cangjie
Vertical
```

**功能：** 设置滚动条方向为纵向。

**起始版本：** 12

### Horizontal

```cangjie
Horizontal
```

**功能：** 设置滚动条方向为横向。

**起始版本：** 12

## enum ScrollDirection

```cangjie
public enum ScrollDirection {
    | Vertical
    | Horizontal
    | None
}
```

**功能：** 滚动方向枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Horizontal

```cangjie
Horizontal
```

**功能：** 仅支持水平方向滚动。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 不可滚动。

**起始版本：** 12

### Vertical

```cangjie
Vertical
```

**功能：** 仅支持竖直方向滚动。

**起始版本：** 12

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

**功能：** 滑动操作的来源。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DRAG

```cangjie
DRAG
```

**功能：** 拖拽事件。

**起始版本：** 12

### EDGE_EFFECT

```cangjie
EDGE_EFFECT
```

**功能：** EdgeEffect.Spring的边缘滚动效果。

**起始版本：** 12

### FLING

```cangjie
FLING
```

**功能：** 拖拽结束之后的惯性滑动。

**起始版本：** 12

### OTHER_USER_INPUT

```cangjie
OTHER_USER_INPUT
```

**功能：** 除拖拽外的其他用户输入，如鼠标滚轮、键盘事件等。

**起始版本：** 12

### SCROLL_BAR

```cangjie
SCROLL_BAR
```

**功能：** 滚动条的拖拽事件。

**起始版本：** 12

### SCROLL_BAR_FLING

```cangjie
SCROLL_BAR_FLING
```

**功能：** 滚动条拖拽结束后的带速度的惯性滑动。

**起始版本：** 12

### SCROLLER

```cangjie
SCROLLER
```

**功能：** Scroller的不带动效方法。

**起始版本：** 12

### SCROLLER_ANIMATION

```cangjie
SCROLLER_ANIMATION
```

**功能：** Scroller的带动效方法。

**起始版本：** 12

## enum ScrollState

```cangjie
public enum ScrollState {
    | Idle
    | Scrolling
    | Fling
}
```

**功能：** 设置当前滑动状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Fling

```cangjie
Fling
```

**功能：** 惯性滑动状态。

**起始版本：** 12

### Idle

```cangjie
Idle
```

**功能：** 未滑动状态。

**起始版本：** 12

### Scrolling

```cangjie
Scrolling
```

**功能：** 手指拖动状态。

**起始版本：** 12

## enum StickyStyle

```cangjie
public enum StickyStyle {
    | None
    | Header
    | Footer
    | Both
}
```

**功能：** 设置ListItemGroup中header和footer是否要吸顶或吸底。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 设置ListItemGroup的headerh不吸顶，footer不吸底。

**起始版本：** 12

### Header

```cangjie
Header
```

**功能：** 设置ListItemGroup的headerh吸顶。

**起始版本：** 12

### Footer

```cangjie
Footer
```

**功能：** 设置ListItemGroup的footer吸底。

**起始版本：** 12

### Both

```cangjie
Both
```

**功能：** 设置ListItemGroup的headerh吸顶，footer吸底。

**起始版本：** 12

## enum SwipeEdgeEffect

```cangjie
public enum SwipeEdgeEffect {
    | Spring
    | None
}
```

**功能：** ListItem的滑动效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Spring

```cangjie
Spring
```

**功能：** ListItem划动距离超过划出组件大小后可以继续划动，松手后按照弹簧阻尼曲线回弹。

**起始版本：** 12

### CARD

```cangjie
CARD
```

**功能：** ListItem划动距离不能超过划出组件大小。

**起始版本：** 12

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

**功能：** 阴影样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### OUTER_DEFAULT_LG

```cangjie
OUTER_DEFAULT_LG
```

**功能：** 大阴影。

**起始版本：** 12

### OUTER_DEFAULT_MD

```cangjie
OUTER_DEFAULT_MD
```

**功能：** 中阴影。

**起始版本：** 12

### OUTER_DEFAULT_SM

```cangjie
OUTER_DEFAULT_SM
```

**功能：** 小阴影。

**起始版本：** 12

### OUTER_DEFAULT_XS

```cangjie
OUTER_DEFAULT_XS
```

**功能：** 超小阴影。

**起始版本：** 12

### OUTER_FLOATING_MD

```cangjie
OUTER_FLOATING_MD
```

**功能：** 浮动中阴影。

**起始版本：** 12

### OUTER_FLOATING_SM

```cangjie
OUTER_FLOATING_SM
```

**功能：** 浮动小阴影。

**起始版本：** 12

## enum ShadowType

```cangjie
public enum ShadowType {
    | COLOR
    | BLUR
}
```

**功能：** 阴影类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### BLUR

```cangjie
BLUR
```

**功能：** 模糊。

**起始版本：** 12

### COLOR

```cangjie
COLOR
```

**功能：** 颜色。

**起始版本：** 12

## enum ShapeType

```cangjie
public enum ShapeType {
    | Normal
    | Capsule
    | CircleType
}
```

**功能：** 组件形状类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Capsule

```cangjie
Capsule
```

**功能：** 胶囊形状。

**起始版本：** 12

### CircleType

```cangjie
CircleType
```

**功能：** 圆形形状。

**起始版本：** 12

### Normal

```cangjie
Normal
```

**功能：** 正常形状。

**起始版本：** 12

## enum SharedTransitionEffectType

```cangjie
public enum SharedTransitionEffectType {
    | SharedEffectStatic
    | SharedEffectExchange
}
```

**功能：** 共享元素转场动效类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### SharedEffectExchange

```cangjie
SharedEffectExchange
```

**功能：** 将源页面元素移动到目标页面元素位置并适当缩放。

**起始版本：** 12

### SharedEffectStatic

```cangjie
SharedEffectStatic
```

**功能：** 目标页面元素的位置保持不变，可以配置透明度动画。目前，只有为重定向到目标页面而配置的静态效果才会生效。

**起始版本：** 12

## enum SideBarContainerType

```cangjie
public enum SideBarContainerType {
    | Embed
    | Overlay
    | AUTO
}
```

**功能：** 容器内侧边栏样式枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### AUTO

```cangjie
AUTO
```

**功能：** 组件尺寸大于等于minSideBarWidth+minContentWidth时，采用Embed模式显示。

组件尺寸小于minSideBarWidth+minContentWidth时，采用Overlay模式显示。contagrid

未设置minSideBarWidth或minContentWidth时，会使用未设置接口的默认值进行计算，若计算的值小于600vp，则使用600vp做为模式切换的断点值。

### Embed

```cangjie
Embed
```

**功能：** 侧边栏嵌入到组件内，和内容区并列显示。

组件尺寸小于minSideBarWidth+minContentWidth，并且未设置showSideBar时，侧边栏自动隐藏。

未设置minSideBarWidth或minContentWidth采用未设置接口的默认值进行计算。

组件在自动隐藏后，如果通过点击控制按钮唤出侧边栏，则侧边栏悬浮在内容区上显示。

### Overlay

```cangjie
Overlay
```

**功能：** 侧边栏浮在内容区上面。

**起始版本：** 12

## enum SideBarPosition

```cangjie
public enum SideBarPosition {
    | Start
    | End
}
```

**功能：** 设置侧边栏显示位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### End

```cangjie
End
```

**功能：** 侧边栏位于容器右侧。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** 侧边栏位于容器左侧。

**起始版本：** 12

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

**功能：** 事件输入源。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Finger

```cangjie
Finger
```

**功能：** 手指输入。

**起始版本：** 12

### Joystick

```cangjie
Joystick
```

**功能：** 手柄输入。

**起始版本：** 12

### Mouse

```cangjie
Mouse
```

**功能：** 鼠标输入。

**起始版本：** 12

### Pen

```cangjie
Pen
```

**功能：** 手写笔输入。

**起始版本：** 12

### Touchpad

```cangjie
Touchpad
```

**功能：** 触控板输入。触控板单指输入被视为鼠标输入操作。

**起始版本：** 12

### Unknown

```cangjie
Unknown
```

**功能：** 未知输入源。

**起始版本：** 12

## enum SourceType

```cangjie
public enum SourceType {
    | Unknown
    | Mouse
    | TouchScreen
}
```

**功能：** 事件输入设备。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Mouse

```cangjie
Mouse
```

**功能：** 鼠标。

**起始版本：** 12

### TouchScreen

```cangjie
TouchScreen
```

**功能：** 触摸屏。

**起始版本：** 12

### Unknown

```cangjie
Unknown
```

**功能：** 未知设备。

**起始版本：** 12

## enum SwiperNestedScrollMode

```cangjie
public enum SwiperNestedScrollMode {
    | SELF_ONLY
    | SELF_FIRST
}
```

**功能：** Swiper组件和父组件的嵌套滚动模式枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### SELF_FIRST

```cangjie
SELF_FIRST
```

**功能：** Swiper自身先滚动，自身滚动到边缘以后父组件滚动。父组件滚动到边缘以后，如果父组件有边缘效果，则父组件触发边缘效果，否则Swiper触发边缘效果。

**起始版本：** 12

### SELF_ONLY

```cangjie
SELF_ONLY
```

**功能：** Swiper只自身滚动，不与父组件联动。

**起始版本：** 12

## enum TextAlign

```cangjie
public enum TextAlign {
    | Start
    | Center
    | End
    | JUSTIFY
}
```

**功能：** 文本对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** 水平居中对齐。

**起始版本：** 12

### End

```cangjie
End
```

**功能：** 水平对齐尾部。

**起始版本：** 12

### JUSTIFY

```cangjie
JUSTIFY
```

**功能：** 双端对齐。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** 水平对齐首部。

**起始版本：** 12

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

**功能：** 文本对齐方式类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** 文本居中对齐。

**起始版本：** 12

### End

```cangjie
End
```

**功能：** 文本对齐界线结束的地方。

**起始版本：** 12

### Justify

```cangjie
Justify
```

**功能：** 文本两端对齐。

**起始版本：** 12

### Left

```cangjie
Left
```

**功能：** 文本左对齐。

**起始版本：** 12

### Right

```cangjie
Right
```

**功能：** 文本右对齐。

**起始版本：** 12

### Start

```cangjie
Start
```

**功能：** 文本对齐界线开始的地方。

**起始版本：** 12

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

**功能：** 设置文本绘制中的水平对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Alphabetic

```cangjie
Alphabetic
```

**功能：** 文本基线是标准的字母基线。

**起始版本：** 12

### Bottom

```cangjie
Bottom
```

**功能：** 文本基线在文本块的底部。 与ideographic基线的区别在于ideographic基线不需要考虑下行字母。

**起始版本：** 12

### Hanging

```cangjie
Hanging
```

**功能：** 文本基线是悬挂基线。

**起始版本：** 12

### Ideographict

```cangjie
Ideographict
```

**功能：** 文字基线是表意字基线；如果字符本身超出了alphabetic基线，那么ideograhpic基线位置在字符本身的底部。

**起始版本：** 12

### Middle

```cangjie
Middle
```

**功能：** 文本基线在文本块的中间。

**起始版本：** 12

### Top

```cangjie
Top
```

**功能：** 文本基线在文本块的顶部。

**起始版本：** 12

## enum TextCase

```cangjie
public enum TextCase {
    | Normal
    | LowerCase
    | UpperCase
}
```

**功能：** 文本大小写格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### LowerCase

```cangjie
LowerCase
```

**功能：** 文本采用全小写。

**起始版本：** 12

### Normal

```cangjie
Normal
```

**功能：** 保持文本原有大小写。

**起始版本：** 12

### UpperCase

```cangjie
UpperCase
```

**功能：** 文本采用全大写。

**起始版本：** 12

## enum TextContentStyle

```cangjie
public enum TextContentStyle {
    | DEFAULT
    | INLINE
}
```

**功能：** 文本框多态样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 默认风格，光标宽1.5vp，光标高度与文本选中底板高度和字体大小相关。

**起始版本：** 12

### INLINE

```cangjie
INLINE
```

**功能：** 内联输入风格。文本选中底板高度与输入框高度相同。
内联输入是在有明显的编辑态/非编辑态的区分场景下使用，例如：文件列表视图中的重命名。
不支持showError属性。
内联模式下，不支持拖入文本。

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

**功能：** 设置文本装饰线样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DASHED

```cangjie
DASHED
```

**功能：** 虚线。

**起始版本：** 12

### DOTTED

```cangjie
DOTTED
```

**功能：** 点线。

**起始版本：** 12

### DOUBLE

```cangjie
DOUBLE
```

**功能：** 双实线。

**起始版本：** 12

### SOLID

```cangjie
SOLID
```

**功能：** 单实线（默认值）。

**起始版本：** 12

### WAVY

```cangjie
WAVY
```

**功能：** 波浪线。

**起始版本：** 12

## enum TextDecorationType

```cangjie
public enum TextDecorationType {
    | None
    | Underline
    | Overline
    | LineThrough
}
```

**功能：** 装饰线类型枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### LineThrough

```cangjie
LineThrough
```

**功能：** 穿过文本的修饰线。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 不使用文本装饰线。

**起始版本：** 12

### Overline

```cangjie
Overline
```

**功能：** 文字上划线修饰。

**起始版本：** 12

### Underline

```cangjie
Underline
```

**功能：** 文字下划线修饰。

**起始版本：** 12

## enum TextHeightAdaptivePolicy

```cangjie
public enum TextHeightAdaptivePolicy {
    | MAX_LINES_FIRST
    | MIN_FONT_SIZE_FIRST
    | LAYOUT_CONSTRAINT_FIRST
}
```

**功能：** 设置文本高度自适应方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### LAYOUT_CONSTRAINT_FIRST

```cangjie
LAYOUT_CONSTRAINT_FIRST
```

**功能：** 设置文本高度自适应方式为以布局约束（高度）优先。

**起始版本：** 12

### MAX_LINES_FIRST

```cangjie
MAX_LINES_FIRST
```

**功能：** 设置文本高度自适应方式为以MaxLines优先。

**起始版本：** 12

### MIN_FONT_SIZE_FIRST

```cangjie
MIN_FONT_SIZE_FIRST
```

**功能：** 设置文本高度自适应方式为以缩小字体优先。

**起始版本：** 12

## enum TextOverflow

```cangjie
public enum TextOverflow {
    | Clip
    | Ellipsis
    | None
    | MARQUEE
}
```

**功能：** 文本超长时的显示方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Clip

```cangjie
Clip
```

**功能：** 文本超长时按最大行截断显示。

**起始版本：** 12

### Ellipsis

```cangjie
Ellipsis
```

**功能：** 文本超长时显示不下的文本用省略号代替。

**起始版本：** 12

### MARQUEE

```cangjie
MARQUEE
```

**功能：** 文本超长时以跑马灯的方式展示。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 文本超长时按最大行截断显示。

**起始版本：** 12

## enum TextSelectableMode

```cangjie
public enum TextSelectableMode {
    | SELECTABLE_UNFOCUSABLE
    | SELECTABLE_FOCUSABLE
    | UNSELECTABLE

}
```

**功能：** 文本是否支持可选择、可获焦。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### SELECTABLE_FOCUSABLE

```cangjie
SELECTABLE_FOCUSABLE
```

**功能：** 文本可选择，可获焦并Touch后获得焦点。

**起始版本：** 12

### SELECTABLE_UNFOCUSABLE

```cangjie
SELECTABLE_UNFOCUSABLE
```

**功能：** 文本可选择，但不可获焦，设置属性selection、bindSelectionMenu、copyOption不影响当前行为。

**起始版本：** 12

### UNSELECTABLE

```cangjie
UNSELECTABLE
```

**功能：** 文本不可选择，不可获焦，设置属性selection、bindSelectionMenu、copyOption都不生效。

**起始版本：** 12

## enum ThemeColorMode

```cangjie
public enum ThemeColorMode {
    | SYSTEM
    | LIGHT
    | DARK
}
```

**功能：** 主题颜色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### DARK

```cangjie
DARK
```

**功能：** 固定使用深色模式。

**起始版本：** 12

### LIGHT

```cangjie
LIGHT
```

**功能：** 固定使用浅色模式。

**起始版本：** 12

### SYSTEM

```cangjie
COMPONENT_ULTRA_THICK
```

**功能：** 跟随系统深浅色模式。

**起始版本：** 12

## enum TitleHeight

```cangjie
public enum TitleHeight {
    | MainOnly
    | MainWithSub
}
```

**功能：** 设置标题栏高度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### MainOnly

```cangjie
MainOnly
```

**功能：** 只有主标题时标题栏的推荐高度（56vp）。

**起始版本：** 12

### MainWithSub

```cangjie
MainWithSub
```

**功能：** 同时有主标题和副标题时标题栏的推荐高度（82vp）。

**起始版本：** 12

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

**功能：** 触摸触发方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Cancel

```cangjie
Cancel
```

**功能：** 触摸事件取消时触发。

**起始版本：** 12

### Down

```cangjie
Down
```

**功能：** 手指按下时触发。

**起始版本：** 12

### Move

```cangjie
Move
```

**功能：** 手指按压态在屏幕上移动时触发。

**起始版本：** 12

### Up

```cangjie
Up
```

**功能：** 手指抬起时触发。

**起始版本：** 12

## enum TransitionType

```cangjie
public enum TransitionType {
    | All
    | Insert
    | Delete
}
```

**功能：** 指定该转场样式生效的场景。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### All

```cangjie
All
```

**功能：** 指定当前的Transition动效生效在组件的所有变化场景。

**起始版本：** 12

### Delete

```cangjie
Delete
```

**功能：** 指定当前的Transition动效生效在组件的删除隐藏场景。

**起始版本：** 12

### Insert

```cangjie
Insert
```

**功能：** 指定当前的Transition动效生效在组件的插入显示场景。

**起始版本：** 12

## enum VerticalAlign

```cangjie
public enum VerticalAlign {
    | Top
    | Center
    | Bottom
}
```

**功能：** 垂直方向上对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Bottom

```cangjie
Bottom
```

**功能：** 底部对齐。

**起始版本：** 12

### Center

```cangjie
Center
```

**功能：** 居中对齐，默认对齐方式。

**起始版本：** 12

### Top

```cangjie
Top
```

**功能：** 顶部对齐。

**起始版本：** 12

## enum Visibility

```cangjie
public enum Visibility {
    | Visible
    | Hidden
    | None
}
```

**功能：** 当前组件显示或隐藏。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Hidden

```cangjie
Hidden
```

**功能：** 隐藏，但参与布局进行占位。

**起始版本：** 12

### None

```cangjie
None
```

**功能：** 隐藏，但不参与布局，不进行占位。

**起始版本：** 12

### Visible

```cangjie
Visible
```

**功能：** 显示。

**起始版本：** 12

## enum WebDarkMode

public enum WebDarkMode {
    | Off
    | On
    | Auto
}

**功能：** Web的深色模式，默认关闭。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 12

### Off

```cangjie
Off
```

**功能：** Web的深色模式为关闭。

**起始版本：** 12

### On

```cangjie
On
```

**功能：** Web的深色模式为开启。

**起始版本：** 12

### Auto

```cangjie
Auto
```

**功能：** Web的深色模式为跟随系统。

**起始版本：** 12

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

**功能：** 星期日期信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### Fri

```cangjie
Fri
```

**功能：** 星期五。

**起始版本：** 12

### Mon

```cangjie
Mon
```

**功能：** 星期一。

**起始版本：** 12

### Sat

```cangjie
Sat
```

**功能：** 星期六。

**起始版本：** 12

### Sun

```cangjie
Sun
```

**功能：** 星期日。

**起始版本：** 12

### Thur

```cangjie
Thur
```

**功能：** 星期四。

**起始版本：** 12

### Tue

```cangjie
Tue
```

**功能：** 星期二。

**起始版本：** 12

### Wed

```cangjie
Wed
```

**功能：** 星期三。

**起始版本：** 12

## enum WordBreak

```cangjie
public enum WordBreak {
    | Normal
    | BreakAll
    | BreakWord
}
```

**功能：** 设置文本断行规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### BreakAll

```cangjie
Normal
```

**功能：** 对于Non-CJK的文本，可在任意2个字符间断行。对于CJK与NORMAL效果一致。

**起始版本：** 12

### BreakWord

```cangjie
BreakWord
```

**功能：** 与BREAKALL相同，对于Non-CJK的文本可在任意2个字符间断行，一行文本中有断行破发点（如空白符）时，优先按破发点换行，保障单词优先完整显示。若整一行文本均无断行破发点时，则在任意2个字符间断行。对于CJK与NORMAL效果一致。

**起始版本：** 12

### Normal

```cangjie
Normal
```

**功能：** CJK(中文、日文、韩文)文本可以在任意2个字符间断行，而Non-CJK文本（如英文等）只能在空白符处断行。

**起始版本：** 12

## enum XComponentType

```cangjie
public enum XComponentType {
    | SURFACE
    | COMPONENT
    | TEXTURE
    | NODE
}
```

**功能：** 定义XComponent的具体配置参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

### COMPONENT

```cangjie
COMPONENT
```

**功能：** XComponent将变成一个容器组件，并可在其中执行非UI逻辑以动态加载显示内容。

**起始版本：** 12

### NODE

```cangjie
NODE
```

**功能：** 用于Native UI节点的占位容器，开发者通过Native API 开发的页面组件可展示在此容器区域内。

**起始版本：** 12

### SURFACE

```cangjie
SURFACE
```

**功能：** 用于EGL/OpenGLES和媒体数据写入，开发者定制的绘制内容单独展示到屏幕上。背景色设置为黑色时会走显示子系统（DSS）。

**起始版本：** 12

### TEXTURE

```cangjie
TEXTURE
```

**功能：** 用于EGL/OpenGLES和媒体数据写入，开发者定制的绘制内容会和XComponent组件的内容合成后展示到屏幕上。1、保持帧同步，保持在同一帧将图形处理器（GPU）纹理和ArkUI其他的绘制指令统一发给渲染服务(RenderService)。2、动效和原生组件统一。3、走图形处理器（GPU）合成，相比surface可能走显示子系统（DSS）功耗更高。
