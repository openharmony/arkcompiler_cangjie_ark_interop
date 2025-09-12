# 基础类型定义

## 导入模块

```cangjie
import kit.ArkUI.*
```

## const MAX_ALPHA_VALUE

```cangjie
public const MAX_ALPHA_VALUE: Float32 = 1.0
```

**功能：** 最大透明度值。

**类型：** Float32

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## const MAX_CHANNEL_VALUE

```cangjie
public const MAX_CHANNEL_VALUE: UInt8 = 0xff
```

**功能：** 最大通道值。

**类型：** UInt8

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 设置动画效果相关参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var curve

```cangjie
public var curve: Curve
```

**功能：** 动画曲线。

**类型：** [Curve](#enum-curve)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var delay

```cangjie
public var delay: Int32
```

**功能：** 动画延迟播放时间，单位为ms(毫秒)，默认不延时播放。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var duration

```cangjie
public var duration: Int32
```

**功能：** 动画持续时间，单位为毫秒。设置小于0的值时按0处理。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var expectedFrameRateRange

```cangjie
public var expectedFrameRateRange: Option<ExpectedFrameRateRange>
```

**功能：** 设置动画的期望帧率。

**类型：** Option\<[ExpectedFrameRateRange](./cj-animation-animateto.md#class-expectedframeraterange)>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var finishCallbackType

```cangjie
public var finishCallbackType: FinishCallbackType
```

**功能：** 在动画中定义onFinish回调的类型。

**类型：** [FinishCallbackType](#enum-finishcallbacktype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var iterations

```cangjie
public var iterations: Int32
```

**功能：** 动画播放次数。默认播放一次，设置为-1时表示无限次播放。设置为0时表示无动画效果。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var onFinish

```cangjie
public var onFinish: Option <() -> Unit>
```

**功能：** 动画播放完成回调。

**类型：** Option\<()->Unit>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var playMode

```cangjie
public var playMode: PlayMode
```

**功能：** 动画播放模式，默认播放完成后重头开始播放。

**类型：** [PlayMode](#enum-playmode)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var tempo

```cangjie
public var tempo: Float32
```

**功能：** 动画播放速度，值越大动画播放越快，值越小播放越慢，为0时无动画效果。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 构造一个AnimateParam对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|duration|Int32|否|1000|动画持续时间，单位为毫秒。设置小于0的值时按0处理。|
|tempo|Float32|否|1.0|动画播放速度，值越大动画播放越快，值越小播放越慢，为0时无动画效果。|
|curve|Curve|否|Curve.EaseInOut|动画曲线。|
|delay|Int32|否|0|动画延迟播放时间，单位为ms(毫秒)，默认不延时播放。|
|iterations|Int32|否|1|动画播放次数。默认播放一次，设置为-1时表示无限次播放。设置为0时表示无动画效果。|
|playMode|[PlayMode](#enum-playmode)|否|PlayMode.Normal|动画播放模式，默认播放完成后重头开始播放。|
|onFinish|Option\<()->Unit>|否|Option.None|动画播放完成回调。|
|finishCallbackType|[FinishCallbackType](#enum-finishcallbacktype)|否|FinishCallbackType.Removed|在动画中定义onFinish回调的类型。|
|expectedFrameRateRange|Option\<[ExpectedFrameRateRange](./cj-animation-animateto.md#class-expectedframeraterange)>|否|Option.None|设置动画的期望帧率。|

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

**功能：** 当前目标区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var globalPosition

```cangjie
public var globalPosition: Position
```

**功能：** 定义目标元素左上角与屏幕左上角的位置关系。

**类型：** [Position](#class-position)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var height

```cangjie
public var height: Length
```

**功能：** 定义目标元素的高度。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var position

```cangjie
public var position: Position
```

**功能：** 定义目标元素左上角与父元素左上角的相对位置。

**类型：** [Position](#class-position)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var width

```cangjie
public var width: Length
```

**功能：** 定义目标元素的宽度。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Length, Length, Position, Position)

```cangjie
public init(
    width: Length,
    height: Length,
    position: Position,
    globalPosition: Position
)
```

**功能：** 构造一个Area类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|目标元素的宽度，单位为vp。|
|height|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|目标元素的高度，单位为vp。|
|position|[Position](#class-position)|是|-|目标元素左上角相对父元素左上角的位置。|
|globalPosition|[Position](#class-position)|是|-|目标元素左上角相对页面左上角的位置。|

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

**功能：** 圆角类型，用于描述组件边框圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var bottomLeft

```cangjie
public var bottomLeft: Length
```

**功能：** 组件左下角圆角半径。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var bottomRight

```cangjie
public var bottomRight: Length
```

**功能：** 组件右下角圆角半径。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var topLeft

```cangjie
public var topLeft: Length
```

**功能：** 组件左上角圆角半径。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var topRight

```cangjie
public var topRight: Length
```

**功能：** 组件右上角圆角半径。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Length, Length, Length, Length)

```cangjie
public init(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
    bottomRight!: Length = 0.vp)
```

**功能：** 初始化一个BorderRadiuses对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|topLeft|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|组件左上角圆角半径。|
|topRight|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|组件右上角圆角半径。|
|bottomLeft|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|组件左下角圆角半径。|
|bottomRight|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|组件右下角圆角半径。|

## class DismissContentCoverAction

```cangjie
public class DismissContentCoverAction {
    public let reason: DismissReason
}
```

**功能：** 用于处理全屏模态页面关闭逻辑的核心回调类，负责在用户触发关闭操作时，通过回调机制拦截关闭行为。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### let reason

```cangjie
public let reason: DismissReason
```

**功能：** 关闭原因类型。

**类型：** [DismissReason](./cj-dialog-actionsheet.md#enum-dismissreason)

**读写能力：** 只读

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func dismiss()

```cangjie
public func dismiss(): Unit
```

**功能：** 显式触发模态页面关闭操作，是唯一控制关闭的入口。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 边框样式，用于描述组件边框四条边的样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var bottom

```cangjie
public var bottom: BorderStyle
```

**功能：** 设置组件下边框样式。

**类型：** [BorderStyle](#enum-borderstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var left

```cangjie
public var left: BorderStyle
```

**功能：** 设置组件左边框样式。

**类型：** [BorderStyle](#enum-borderstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var right

```cangjie
public var right: BorderStyle
```

**功能：** 设置组件右边框样式。

**类型：** [BorderStyle](#enum-borderstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var top

```cangjie
public var top: BorderStyle
```

**功能：** 设置组件上边框样式。

**类型：** [BorderStyle](#enum-borderstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(BorderStyle, BorderStyle, BorderStyle, BorderStyle)

```cangjie
public init(
    top!: BorderStyle = BorderStyle.Solid,
    right!: BorderStyle = BorderStyle.Solid,
    bottom!: BorderStyle = BorderStyle.Solid,
    left!: BorderStyle = BorderStyle.Solid
)
```

**功能：** 构造EdgeStyles对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[BorderStyle](#enum-borderstyle)|否|BorderStyle.Solid|组件上边框样式。|
|right|[BorderStyle](#enum-borderstyle)|否|BorderStyle.Solid|组件右边框样式。|
|bottom|[BorderStyle](#enum-borderstyle)|否|BorderStyle.Solid|组件下边框样式。|
|left|[BorderStyle](#enum-borderstyle)|否|BorderStyle.Solid|组件左边框样式。|

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

**功能：** 字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var family

```cangjie
public var family:?ResourceStr
```

**功能：** 设置文本的字体列表。

**类型：** ?[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var size

```cangjie
public var size:?Length
```

**功能：** 设置文本尺寸，使用fp单位。

**类型：** ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var style

```cangjie
public var style:?FontStyle
```

**功能：** 设置文本的字体样式。

**类型：** ?[FontStyle](#enum-fontstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var weight

```cangjie
public var weight:?FontWeight
```

**功能：** 设置文本的字体粗细。

**类型：** ?[FontWeight](#enum-fontweight)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(?Length, ?FontWeight, ?ResourceStr, ?FontStyle)

```cangjie
public init(size!: ?Length = None, weight!: ?FontWeight = None, family!: ?ResourceStr = None, style!: ?FontStyle = None)
```

**功能：** 构造一个Font对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|None|设置文本尺寸，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|weight|?[FontWeight](#enum-fontweight)|否|None|设置文本的字体粗细。|
|family|?[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|None|设置文本的字体列表。使用多个字体，使用','进行分割，优先级按顺序生效。例如：'Arial, HarmonyOS Sans'。当前支持'HarmonyOS Sans'字体。|
|style|?[FontStyle](#enum-fontstyle)|否|None|设置文本的字体样式。|

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

**功能：** 文本样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var family

```cangjie
public var family: String
```

**功能：** 设置文本的字体列表。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var size

```cangjie
public var size: Length
```

**功能：** 设置文本尺寸，使用fp单位。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var style

```cangjie
public var style: FontStyle
```

**功能：** 设置文本的字体样式。

**类型：** [FontStyle](#enum-fontstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var weight

```cangjie
public var weight: FontWeight
```

**功能：** 设置文本的字体粗细。

**类型：** [FontWeight](#enum-fontweight)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Length, FontWeight, ResourceStr, FontStyle)

```cangjie
public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: ResourceStr = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal)
```

**功能：** 构造一个Fonts对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|16.fp|设置文本尺寸，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|weight|[FontWeight](#enum-fontweight)|否|FontWeight.Normal|设置文本的字体粗细。|
|family|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|"HarmonyOS Sans"|设置文本的字体列表。使用多个字体，使用','进行分割，优先级按顺序生效。例如：'Arial, HarmonyOS Sans'。当前支持'HarmonyOS Sans'字体。|
|style|[FontStyle](#enum-fontstyle)|否|FontStyle.Normal|设置文本的字体样式。|

## class HorizontalAlignment

```cangjie
public class HorizontalAlignment {
    public var anchor: String
    public var align: HorizontalAlign
    public init(anchor: String, align: HorizontalAlign)
}
```

**功能：** 水平对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var align

```cangjie
public var align: HorizontalAlign
```

**功能：** 设置组件水平方向对齐方式。

**类型：** [HorizontalAlign](#enum-horizontalalign)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var anchor

```cangjie
public var anchor: String
```

**功能：** 设置组件水平对齐的锚点。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(String, HorizontalAlign)

```cangjie
public init(anchor: String, align: HorizontalAlign)
```

**功能：** 构造一个HorizontalAlignment对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|anchor|String|是|-|设置组件水平对齐的锚点。|
|align|[HorizontalAlign](#enum-horizontalalign)|是|-|设置组件水平方向对齐方式。|

## class Margin

```cangjie
public class Margin {
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
}
```

**功能：** 外边距类型，用于描述组件不同方向的外边距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Length, Length, Length, Length)

```cangjie
public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
```

**功能：** 初始化了一个外边距类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|上外边距，组件顶部距组件外元素的尺寸。|
|right|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|右外边距，组件右边界距组件外元素的尺寸。|
|bottom|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|下外边距，组件底部距组件外元素的尺寸。|
|left|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|左外边距，组件左边界距组件外元素的尺寸。|

## class Offset

```cangjie
public class Offset {
    public var dx: Length
    public var dy: Length
    public init(dx: Length, dy: Length)
}
```

**功能：** 相对布局完成位置坐标偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var dx

```cangjie
public var dx: Length
```

**功能：** 水平方向偏移量。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var dy

```cangjie
public var dy: Length
```

**功能：** 竖直方向偏移量。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Length, Length)

```cangjie
public init(dx: Length, dy: Length)
```

**功能：** 构建一个Offset类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dx|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|x点坐标。|
|dy|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|y点坐标。|

## class OverlayOffset

```cangjie
public class OverlayOffset {
    public var x: Float64
    public var y: Float64
    public init(x!: Float64 = 0.0, y!: Float64 = 0.0)
}
```

**功能：** 设置浮层的偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float64
```

**功能：** 横向偏移量。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float64
```

**功能：** 纵向偏移量。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Float64, Float64)

```cangjie
public init(x!: Float64 = 0.0, y!: Float64 = 0.0)
```

**功能：** 构造浮层偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|否|0.0|横向偏移量。|
|y|Float64|否|0.0|纵向偏移量。|

## class PopupButton

```cangjie
public class PopupButton {
    public init(value!: String, action!: () -> Unit)
}
```

**功能：** 构建弹窗按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(String, () -> Unit)

```cangjie
public init(value!: String, action!: () -> Unit)
```

**功能：** 构建弹窗按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|按钮的文本内容。|
|action|()->Unit|是|-|按钮的点击事件。|

## class PopupStateChangeParam

```cangjie
public class PopupStateChangeParam {
    public var isVisible: Bool
    public init(value: Bool)
}
```

**功能：** 设置弹窗状态参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var isVisible

```cangjie
public var isVisible: Bool
```

**功能：** 弹窗是否可见。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Bool)

```cangjie
public init(value: Bool)
```

**功能：** 设置弹窗状态参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|弹窗是否可见。|

## class Position

```cangjie
public class Position {
    public var x: Length
    public var y: Length
    public init(x!: Length = 0, y!: Length = 0)
}
```

**功能：** 位置信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Length
```

**功能：** 定义x轴坐标。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Length
```

**功能：** 定义y轴坐标。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Length, Length)

```cangjie
public init(x!: Length = 0, y!: Length = 0)
```

**功能：** 构造一个Position类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0|x轴坐标，单位为vp。|
|y|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0|y轴坐标，单位为vp。|

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

**起始版本：** 21

### var height

```cangjie
public var height: Length
```

**功能：** 触摸热区的高度。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var width

```cangjie
public var width: Length
```

**功能：** 触摸热区的宽度。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Length
```

**功能：** 触摸点相对于组件左上角的x轴坐标。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Length
```

**功能：** 触摸点相对于组件左上角的y轴坐标。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Length, Length, Length, Length)

```cangjie
public init(x!: Length = 0.vp, y!: Length = 0.vp, width!: Length = 100.percent, height!: Length = 100.percent)
```

**功能：** 构造一个Rectangle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp| **命名参数。** 触摸点相对于组件左上角的x轴坐标。|
|y|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp| **命名参数。** 触摸点相对于组件左上角的y轴坐标。|
|width|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|100.percent| **命名参数。** 触摸热区的宽度。|
|height|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|100.percent| **命名参数。** 触摸热区的高度。|

## class VerticalAlignment

```cangjie
public class VerticalAlignment {
    public var anchor: String
    public var align: VerticalAlign
    public init(anchor: String, align: VerticalAlign)
}
```

**功能：** 垂直对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var align

```cangjie
public var align: VerticalAlign
```

**功能：** 设置组件垂直方向对齐方式。

**类型：** [VerticalAlign](#enum-verticalalign)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var anchor

```cangjie
public var anchor: String
```

**功能：** 设置组件垂直对齐的锚点。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(String, VerticalAlign)

```cangjie
public init(anchor: String, align: VerticalAlign)
```

**功能：** 构造一个VerticalAlignment对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|anchor|String|是|-|设置组件垂直对齐的锚点。|
|align|[VerticalAlign](#enum-verticalalign)|是|-|设置组件垂直方向对齐方式。|

## enum AdaptiveColor

```cangjie
public enum AdaptiveColor <: Equatable<AdaptiveColor> {
    | Default
    | Average
    | ...
}
```

**功能：** 取色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<AdaptiveColor>

### Average

```cangjie
Average
```

**功能：** 使用取色模糊。将取色区域的颜色平均值作为蒙版颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Default

```cangjie
Default
```

**功能：** 不使用取色模糊。使用默认的颜色作为蒙版颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(AdaptiveColor)

```cangjie
public operator func !=(other: AdaptiveColor): Bool
```

**功能：** 比较两个AdaptiveColor是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AdaptiveColor](#enum-adaptivecolor)|是|-|待比较的另一个AdaptiveColor值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个AdaptiveColor不相等则返回true，否则返回false|

### func ==(AdaptiveColor)

```cangjie
public operator func ==(other: AdaptiveColor): Bool
```

**功能：** 比较两个AdaptiveColor是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AdaptiveColor](#enum-adaptivecolor)|是|-|待比较的另一个AdaptiveColor值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个AdaptiveColor相等则返回true，否则返回false|

## enum LengthType

```cangjie
public enum LengthType <: Length & Equatable<LengthType> {
    | px(Float64)
    | vp(Float64)
    | fp(Float64)
    | percent(Float64)
    | lpx(Float64)
}
```

**功能：** 长度类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<LengthType>
- Length

### fp(Float64)

```cangjie
fp(Float64)
```

**功能：** 字体像素单位。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### lpx(Float64)

```cangjie
lpx(Float64)
```

**功能：** 逻辑像素单位。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### percent(Float64)

```cangjie
percent(Float64)
```

**功能：** 百分比。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### px(Float64)

```cangjie
px(Float64)
```

**功能：** 基本像素单位。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### vp(Float64)

```cangjie
vp(Float64)
```

**功能：** 屏幕密度单位。

### prop value

```cangjie
public prop value: Float64
```

**功能：** 像素值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop unitType

```cangjie
public prop unitType: LengthType
```

**功能：** 像素单位。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取LengthType对应的整数值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|LengthType对应的整数值|

### static func parse(Int32): LengthType

```cangjie
public static func parse(value: Int32): LengthType
```

**功能：** 解析LengthType。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|LengthType的整数值。|

**返回值：**

|类型|说明|
|:----|:----|
|LengthType|LengthType的枚举值。|

### func !=(LengthType)

```cangjie
public operator func !=(other: LengthType): Bool
```

**功能：** 判断两个LengthType是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LengthType](#enum-lengthtype)|是|-|要比较的另一个LengthType值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果不相等返回true，否则返回false。|

### func ==(LengthType)

```cangjie
public operator func ==(other: LengthType): Bool
```

**功能：** 判断两个LengthType是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LengthType](#enum-lengthtype)|是|-|要比较的另一个LengthType值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果相等返回true，否则返回false。|

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

**功能：** 对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<Alignment>

### Bottom

```cangjie
Bottom
```

**功能：** 底部横向居中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BottomEnd

```cangjie
BottomEnd
```

**功能：** 底部尾端。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BottomStart

```cangjie
BottomStart
```

**功能：** 底部起始端。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Center

```cangjie
Center
```

**功能：** 横向和纵向居中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** 尾端。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 起始端。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 顶部横向居中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TopEnd

```cangjie
TopEnd
```

**功能：** 顶部尾端。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TopStart

```cangjie
TopStart
```

**功能：** 顶部起始端。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(Alignment)

```cangjie
public operator func !=(other: Alignment): Bool
```

**功能：** 比较两个Alignment是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Alignment](#enum-alignment)|是|-|待比较的另一个Alignment值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个Alignment不相等则返回true，否则返回false|

### func ==(Alignment)

```cangjie
public operator func ==(other: Alignment): Bool
```

**功能：** 比较两个Alignment是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Alignment](#enum-alignment)|是|-|待比较的另一个Alignment值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个Alignment相等则返回true，否则返回false|

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取Alignment对应的整数值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|Alignment对应的整数值|

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

**功能：** 动画播放状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<AnimationStatus>

### Initial

```cangjie
Initial
```

**功能：** 动画初始状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Paused

```cangjie
Paused
```

**功能：** 动画处于暂停状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Running

```cangjie
Running
```

**功能：** 动画处于播放状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Stopped

```cangjie
Stopped
```

**功能：** 动画处于停止状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(AnimationStatus)

```cangjie
public operator func !=(other: AnimationStatus): Bool
```

**功能：** 比较两个AnimationStatus是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AnimationStatus](#enum-animationstatus)|是|-|待比较的另一个AnimationStatus值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个AnimationStatus不相等则返回true，否则返回false|

### func ==(AnimationStatus)

```cangjie
public operator func ==(other: AnimationStatus): Bool
```

**功能：** 比较两个AnimationStatus是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AnimationStatus](#enum-animationstatus)|是|-|待比较的另一个AnimationStatus值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个AnimationStatus相等则返回true，否则返回false|

## enum ArrowPointPosition

```cangjie
public enum ArrowPointPosition <: Equatable<ArrowPointPosition> {
    | START
    | CENTER
    | END
    | ...
}
```

**功能：** 箭头指向位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ArrowPointPosition>

### CENTER

```cangjie
CENTER
```

**功能：** 位于父组件居中位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### END

```cangjie
END
```

**功能：** 水平方向：位于父组件最右侧，垂直方向：位于父组件最下侧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### START

```cangjie
START
```

**功能：** 水平方向：位于父组件最左侧，垂直方向：位于父组件最上侧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## enum Axis

```cangjie
public enum Axis <: Equatable<Axis> {
    | Vertical
    | Horizontal
    | ...
}
```

**功能：** 轴方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<Axis>

### Horizontal

```cangjie
Horizontal
```

**功能：** 方向为横向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Vertical

```cangjie
Vertical
```

**功能：** 方向为纵向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(Axis)

```cangjie
public operator func !=(other: Axis): Bool
```

**功能：** 比较两个Axis是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Axis](#enum-axis)|是|-|待比较的另一个Axis值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个Axis不相等则返回true，否则返回false|

### func ==(Axis)

```cangjie
public operator func ==(other: Axis): Bool
```

**功能：** 比较两个Axis是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Axis](#enum-axis)|是|-|待比较的另一个Axis值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个Axis相等则返回true，否则返回false|

## enum BarState

```cangjie
public enum BarState <: Equatable<BarState> {
    | Off
    | Auto
    | On
    | ...
}
```

**功能：** 滚动条的显示模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<BarState>

### Auto

```cangjie
Auto
```

**功能：** 按需显示(触摸时显示，2s后消失)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Off

```cangjie
Off
```

**功能：** 不显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### On

```cangjie
On
```

**功能：** 常驻显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(BarState)

```cangjie
public operator func !=(other: BarState): Bool
```

**功能：** 比较两个BarState是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarState](#enum-barstate)|是|-|待比较的另一个BarState值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个BarState不相等则返回true，否则返回false|

### func ==(BarState)

```cangjie
public operator func ==(other: BarState): Bool
```

**功能：** 比较两个BarState是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarState](#enum-barstate)|是|-|待比较的另一个BarState值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个BarState相等则返回true，否则返回false|

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

**功能：** 定义屏障线的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<BarrierDirection>

### BOTTOM

```cangjie
BOTTOM
```

**功能：** 屏障在其所有referencedId的最下方。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### LEFT

```cangjie
LEFT
```

**功能：** 屏障在其所有referencedId的最左侧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### RIGHT

```cangjie
RIGHT
```

**功能：** 屏障在其所有referencedId的最右侧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TOP

```cangjie
TOP
```

**功能：** 屏障在其所有referencedId的最上方。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(BarrierDirection)

```cangjie
public operator func !=(other: BarrierDirection): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarrierDirection](#enum-barrierdirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(BarrierDirection)

```cangjie
public operator func ==(other: BarrierDirection): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarrierDirection](#enum-barrierdirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum BorderStyle

```cangjie
public enum BorderStyle <: Equatable<BorderStyle> {
    | Solid
    | Dashed
    | Dotted
    | ...
}
```

**功能：** 边框样式，用于描述组件边框四条边的样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<BorderStyle>

### Dashed

```cangjie
Dashed
```

**功能：** 显示为一系列短的方形虚线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Dotted

```cangjie
Dotted
```

**功能：** 显示为一系列圆点，圆点半径为borderWidth的一半。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Solid

```cangjie
Solid
```

**功能：** 显示为一条实线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(BorderStyle)

```cangjie
public operator func !=(other: BorderStyle): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BorderStyle](#enum-borderstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(BorderStyle)

```cangjie
public operator func ==(other: BorderStyle): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BorderStyle](#enum-borderstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum CanvasDirection

```cangjie
public enum CanvasDirection <: Equatable<CanvasDirection> {
    | inherit
    | ltr
    | rtl
    | ...
}
```

**功能：** 设置绘制文字时使用的文字方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<CanvasDirection>

### inherit

```cangjie
inherit
```

**功能：** 继承canvas组件通用属性已设定的文本方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ltr

```cangjie
ltr
```

**功能：** 从左往右。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### rtl

```cangjie
rtl
```

**功能：** 从右往左。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(CanvasDirection)

```cangjie
public operator func !=(other: CanvasDirection): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CanvasDirection](#enum-canvasdirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(CanvasDirection)

```cangjie
public operator func ==(other: CanvasDirection): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CanvasDirection](#enum-canvasdirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum CanvasFillRule

```cangjie
public enum CanvasFillRule <: Equatable<CanvasFillRule> {
    | evenodd
    | nonzero
    | ...
}
```

**功能：** 指定要填充对象的规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<CanvasFillRule>

### evenodd

```cangjie
evenodd
```

**功能：** 奇偶规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### nonzero

```cangjie
nonzero
```

**功能：** 非零规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(CanvasFillRule)

```cangjie
public operator func !=(other: CanvasFillRule): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CanvasFillRule](#enum-canvasfillrule)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(CanvasFillRule)

```cangjie
public operator func ==(other: CanvasFillRule): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CanvasFillRule](#enum-canvasfillrule)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum CheckBoxShape

```cangjie
public enum CheckBoxShape <: Equatable<CheckBoxShape> {
    | CIRCLE
    | ROUNDED_SQUARE
    | ...
}
```

**功能：** 多选框形状类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<CheckBoxShape>

### CIRCLE

```cangjie
CIRCLE
```

**功能：** 圆形形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ROUNDED_SQUARE

```cangjie
ROUNDED_SQUARE
```

**功能：** 圆角方形形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(CheckBoxShape)

```cangjie
public operator func !=(other: CheckBoxShape): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CheckBoxShape](#enum-checkboxshape)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(CheckBoxShape)

```cangjie
public operator func ==(other: CheckBoxShape): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CheckBoxShape](#enum-checkboxshape)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum ColoringStrategy

```cangjie
public enum ColoringStrategy <: Equatable<ColoringStrategy> {
    | INVERT
    | ...
}
```

**功能：** 智能取色枚举类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ColoringStrategy>

### INVERT

```cangjie
INVERT
```

**功能：** 设置前景色为控件背景色的反色。仅支持在foregroundColor中设置该枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ColoringStrategy)

```cangjie
public operator func !=(other: ColoringStrategy): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ColoringStrategy](#enum-coloringstrategy)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(ColoringStrategy)

```cangjie
public operator func ==(other: ColoringStrategy): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ColoringStrategy](#enum-coloringstrategy)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum GlobalCompositeOperation

```cangjie
public enum GlobalCompositeOperation {
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

**功能：** 设置合成操作的方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Copy

```cangjie
Copy
```

**功能：** 显示新绘制内容而忽略现有绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### DestinationAtop

```cangjie
DestinationAtop
```

**功能：** 在新绘制内容顶部显示现有绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### DestinationIn

```cangjie
DestinationIn
```

**功能：** 在新绘制内容中显示现有绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### DestinationOut

```cangjie
DestinationOut
```

**功能：** 在新绘制内容外显示现有绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### DestinationOver

```cangjie
DestinationOver
```

**功能：** 在新绘制内容上方显示现有绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Lighter

```cangjie
Lighter
```

**功能：** 显示新绘制内容和现有绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SourceAtop

```cangjie
SourceAtop
```

**功能：** 在现有绘制内容顶部显示新绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SourceIn

```cangjie
SourceIn
```

**功能：** 在现有绘制内容中显示新绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SourceOut

```cangjie
SourceOut
```

**功能：** 在现有绘制内容之外显示新绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SourceOver

```cangjie
SourceOver
```

**功能：** 在现有绘制内容上显示新绘制内容，属于默认值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Xor

```cangjie
Xor
```

**功能：** 显示新绘制内容和现有绘制内容的异或结果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(GlobalCompositeOperation)

```cangjie
public operator func !=(other: GlobalCompositeOperation): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GlobalCompositeOperation](#enum-globalcompositeoperation)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(GlobalCompositeOperation)

```cangjie
public operator func ==(other: GlobalCompositeOperation): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GlobalCompositeOperation](#enum-globalcompositeoperation)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum ContentType

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

**功能：** 自动填充类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ContentType>

### BANK_CARD_NUMBER

```cangjie
BANK_CARD_NUMBER
```

**功能：** 【银行卡号】在已启用情景化自动填充的情况下，支持银行卡号的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### CITY_ADDRESS

```cangjie
CITY_ADDRESS
```

**功能：** 【城市】在已启用情景化自动填充的情况下，支持城市的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### COUNTRY_ADDRESS

```cangjie
COUNTRY_ADDRESS
```

**功能：** 【国家】在已启用情景化自动填充的情况下，支持国家的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### DETAIL_INFO_WITHOUT_STREET

```cangjie
DETAIL_INFO_WITHOUT_STREET
```

**功能：** 【详细地址（不含街道）】在已启用情景化自动填充的情况下，支持详细地址（不含街道）的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### DISTRICT_ADDRESS

```cangjie
DISTRICT_ADDRESS
```

**功能：** 【区县】在已启用情景化自动填充的情况下，支持区县的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### EMAIL_ADDRESS

```cangjie
EMAIL_ADDRESS
```

**功能：** 【邮箱地址】在已启用情景化自动填充的情况下，支持邮箱地址的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### FORMAT_ADDRESS

```cangjie
FORMAT_ADDRESS
```

**功能：** 【格式化地址】在已启用情景化自动填充的情况下，支持格式化地址的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### FULL_PHONE_NUMBER

```cangjie
FULL_PHONE_NUMBER
```

**功能：** 【完整电话号码】在已启用情景化自动填充的情况下，支持完整电话号码的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### FULL_STREET_ADDRESS

```cangjie
FULL_STREET_ADDRESS
```

**功能：** 【完整街道地址】在已启用情景化自动填充的情况下，支持完整街道地址的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### HOUSE_NUMBER

```cangjie
HOUSE_NUMBER
```

**功能：** 【门牌号】在已启用情景化自动填充的情况下，支持门牌号的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ID_CARD_NUMBER

```cangjie
ID_CARD_NUMBER
```

**功能：** 【身份证号】在已启用情景化自动填充的情况下，支持身份证号的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### NEW_PASSWORD

```cangjie
NEW_PASSWORD
```

**功能：** 【新密码】在已启用密码保险箱的情况下，支持自动生成新密码。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### NICKNAME

```cangjie
NICKNAME
```

**功能：** 【昵称】在已启用情景化自动填充的情况下，支持昵称的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PASSWORD

```cangjie
PASSWORD
```

**功能：** 【密码】在已启用密码保险箱的情况下，支持密码的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PERSON_FIRST_NAME

```cangjie
PERSON_FIRST_NAME
```

**功能：** 【名字】在已启用情景化自动填充的情况下，支持名字的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PERSON_FULL_NAME

```cangjie
PERSON_FULL_NAME
```

**功能：** 【姓名】在已启用情景化自动填充的情况下，支持姓名的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PERSON_LAST_NAME

```cangjie
PERSON_LAST_NAME
```

**功能：** 【姓氏】在已启用情景化自动填充的情况下，支持姓氏的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PHONE_COUNTRY_CODE

```cangjie
PHONE_COUNTRY_CODE
```

**功能：** 【国家代码】在已启用情景化自动填充的情况下，支持国家代码的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PHONE_NUMBER

```cangjie
PHONE_NUMBER
```

**功能：** 【手机号码】在已启用情景化自动填充的情况下，支持手机号码的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PROVINCE_ADDRESS

```cangjie
PROVINCE_ADDRESS
```

**功能：** 【省】在已启用情景化自动填充的情况下，支持省的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### USER_NAME

```cangjie
USER_NAME
```

**功能：** 【用户名】在已启用情景化自动填充的情况下，支持用户名的自动保存和自动填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ContentType)

```cangjie
public operator func !=(other: ContentType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ContentType](#enum-contenttype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(ContentType)

```cangjie
public operator func ==(other: ContentType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ContentType](#enum-contenttype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum ControlSize

```cangjie
public enum ControlSize <: Equatable<ControlSize> {
    | Small
    | Normal
    | ...
}
```

**功能：** 控制尺寸大小。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ControlSize>

### Normal

```cangjie
Normal
```

**功能：** 正常尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Small

```cangjie
Small
```

**功能：** 小尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ControlSize)

```cangjie
public operator func !=(other: ControlSize): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ControlSize](#enum-controlsize)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(ControlSize)

```cangjie
public operator func ==(other: ControlSize): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ControlSize](#enum-controlsize)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum CopyOptions

```cangjie
public enum CopyOptions <: Equatable<CopyOptions> {
    | None
    | InApp
    | LocalDevice
    | ...
}
```

**功能：** 输入的文本复制模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<CopyOptions>

### InApp

```cangjie
InApp
```

**功能：** 支持应用内复制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### LocalDevice

```cangjie
LocalDevice
```

**功能：** 支持设备内复制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 不支持复制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(CopyOptions)

```cangjie
public operator func !=(other: CopyOptions): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CopyOptions](#enum-copyoptions)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(CopyOptions)

```cangjie
public operator func ==(other: CopyOptions): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CopyOptions](#enum-copyoptions)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

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

**功能：** 动画曲线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<Curve>

### Ease

```cangjie
Ease
```

**功能：** 表示动画以低速开始，然后加快，在结束前变慢，CubicBezier(0.25, 0.1, 0.25, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### EaseIn

```cangjie
EaseIn
```

**功能：** 表示动画以低速开始，CubicBezier(0.42, 0.0, 1.0, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### EaseInOut

```cangjie
EaseInOut
```

**功能：** 表示动画以低速开始和结束，CubicBezier(0.42, 0.0, 0.58, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### EaseOut

```cangjie
EaseOut
```

**功能：** 表示动画以低速结束，CubicBezier(0.0, 0.0, 0.58, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ExtremeDeceleration

```cangjie
ExtremeDeceleration
```

**功能：** 急缓曲线，cubic-bezier(0.0, 0.0, 0.0, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### FastOutLinearIn

```cangjie
FastOutLinearIn
```

**功能：** 加速曲线，cubic-bezier(0.4, 0.0, 1.0, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### FastOutSlowIn

```cangjie
FastOutSlowIn
```

**功能：** 标准曲线，cubic-bezier(0.4, 0.0, 0.2, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Friction

```cangjie
Friction
```

**功能：** 阻尼曲线，CubicBezier(0.2, 0.0, 0.2, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Linear

```cangjie
Linear
```

**功能：** 表示动画从头到尾的速度都是相同的。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### LinearOutSlowIn

```cangjie
LinearOutSlowIn
```

**功能：** 减速曲线，cubic-bezier(0.0, 0.0, 0.2, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Rhythm

```cangjie
Rhythm
```

**功能：** 节奏曲线，CubicBezier(0.7, 0.0, 0.2, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Sharp

```cangjie
Sharp
```

**功能：** 锐利曲线，CubicBezier(0.4, 0.0, 0.6, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Smooth

```cangjie
Smooth
```

**功能：** 平滑曲线，CubicBezier(0.4, 0.0, 0.2, 1.0)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(Curve)

```cangjie
public operator func !=(other: Curve): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Curve](#enum-curve)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(Curve)

```cangjie
public operator func ==(other: Curve): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Curve](#enum-curve)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

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

**功能：** 弹窗在竖直方向上的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<DialogAlignment>

### Bottom

```cangjie
Bottom
```

**功能：** 垂直底部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BottomEnd

```cangjie
BottomEnd
```

**功能：** 右下对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BottomStart

```cangjie
BottomStart
```

**功能：** 左下对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Center

```cangjie
Center
```

**功能：** 垂直居中对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### CenterEnd

```cangjie
CenterEnd
```

**功能：** 右中对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### CenterStart

```cangjie
CenterStart
```

**功能：** 左中对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Default

```cangjie
Default
```

**功能：** 默认对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 垂直顶部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TopEnd

```cangjie
TopEnd
```

**功能：** 右上对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TopStart

```cangjie
TopStart
```

**功能：** 左上对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(DialogAlignment)

```cangjie
public operator func !=(other: DialogAlignment): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DialogAlignment](#enum-dialogalignment)|是|-|比较的枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(DialogAlignment)

```cangjie
public operator func ==(other: DialogAlignment): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DialogAlignment](#enum-dialogalignment)|是|-|两个枚举值相等返回true，否则返回false。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum DialogButtonStyle

```cangjie
public enum DialogButtonStyle <: Equatable<DialogButtonStyle> {
    | Default
    | Highlight
    | ...
}
```

**功能：** 对话框按钮样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<DialogButtonStyle>

### Default

```cangjie
Default
```

**功能：** 白底蓝字（深色主题：白底=黑底）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Highlight

```cangjie
Highlight
```

**功能：** 蓝底白字。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(DialogButtonStyle)

```cangjie
public operator func !=(other: DialogButtonStyle): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DialogButtonStyle](#enum-dialogbuttonstyle)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(DialogButtonStyle)

```cangjie
public operator func ==(other: DialogButtonStyle): Bool
```

**功能：**判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DialogButtonStyle](#enum-dialogbuttonstyle)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum Direction

```cangjie
public enum Direction <: Equatable<Direction> {
    | Ltr
    | Rtl
    | Auto
    | ...
}
```

**功能：** 元素布局方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<Direction>

### Auto

```cangjie
Auto
```

**功能：** 使用系统默认布局方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Ltr

```cangjie
Ltr
```

**功能：** 元素从左到右布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Rtl

```cangjie
Rtl
```

**功能：** 元素从右到左布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(Direction)

```cangjie
public operator func !=(other: Direction): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Direction](#enum-direction)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(Direction)

```cangjie
public operator func ==(other: Direction): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Direction](#enum-direction)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 滚动到容器边缘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<Edge>

### Bottom

```cangjie
Bottom
```

**功能：** 竖直方向下边缘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** 水平方向末尾位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 水平方向起始位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 竖直方向上边缘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(Edge)

```cangjie
public operator func !=(other: Edge): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Edge](#enum-edge)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(Edge)

```cangjie
public operator func ==(other: Edge): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Edge](#enum-edge)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum EdgeEffect

```cangjie
public enum EdgeEffect <: Equatable<EdgeEffect> {
    | Spring
    | Fade
    | None
    | ...
}
```

**功能：** 边缘滑动效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<EdgeEffect>

### Fade

```cangjie
Fade
```

**功能：** 阴影效果，滑动到边缘后会有圆弧状的阴影。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 滑动到边缘后无效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Spring

```cangjie
Spring
```

**功能：** 弹性物理动效，滑动到边缘后可以根据初始速度或通过触摸事件继续滑动一段距离，松手后回弹。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(EdgeEffect)

```cangjie
public operator func !=(other: EdgeEffect): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[EdgeEffect](#enum-edgeeffect)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(EdgeEffect)

```cangjie
public operator func ==(other: EdgeEffect): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[EdgeEffect](#enum-edgeeffect)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 当前播放方向下，动画开始前和结束后的状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<FillMode>

### Backwards

```cangjie
Backwards
```

**功能：** 动画将在应用于目标时立即应用第一个关键帧中定义的值，并在delay期间保留此值。第一个关键帧取决于playMode，playMode为Normal或Alternate时为from的状态，playMode为Reverse或AlternateReverse时为to的状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Both

```cangjie
Both
```

**功能：** 动画将遵循Forwards和Backwards的规则，从而在两个方向上扩展动画属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Forwards

```cangjie
Forwards
```

**功能：** 目标将保留动画执行期间最后一个关键帧的状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 动画未执行时不会将任何样式应用于目标，动画播放完成之后恢复初始默认状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(FillMode)

```cangjie
public operator func !=(other: FillMode): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FillMode](#enum-fillmode)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FillMode)

```cangjie
public operator func ==(other: FillMode): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FillMode](#enum-fillmode)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum FinishCallbackType

```cangjie
public enum FinishCallbackType <: Equatable<FinishCallbackType> {
    | Removed
    | Logically
    | ...
}
```

**功能：** 动画结束时的回调类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<FinishCallbackType>

### Logically

```cangjie
Logically
```

**功能：** 当动画在逻辑上处于下降状态，但可能仍处于其长尾状态时，将触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Removed

```cangjie
Removed
```

**功能：** 当整个动画结束并立即删除时，将触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(FinishCallbackType)

```cangjie
public operator func !=(other: FinishCallbackType): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FinishCallbackType](#enum-finishcallbacktype)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FinishCallbackType)

```cangjie
public operator func ==(other: FinishCallbackType): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FinishCallbackType](#enum-finishcallbacktype)|是|-|当前枚举所表示的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** Flex容器对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<FlexAlign>

### Center

```cangjie
Center
```

**功能：** 元素在主轴方向中心对齐，第一个元素与行首的距离与最后一个元素与行尾距离相同。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** 元素在主轴方向尾部对齐，最后一个元素与行尾对齐，其他元素与后一个对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SpaceAround

```cangjie
SpaceAround
```

**功能：** Flex主轴方向均匀分配弹性元素，相邻元素之间距离相同。第一个元素到行首的距离和最后一个元素到行尾的距离是相邻元素之间距离的一半。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SpaceBetween

```cangjie
SpaceBetween
```

**功能：** Flex主轴方向均匀分配弹性元素，相邻元素之间距离相同。第一个元素与行首对齐，最后一个元素与行尾对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SpaceEvenly

```cangjie
SpaceEvenly
```

**功能：** Flex主轴方向均匀分配弹性元素，相邻元素之间距离相同。第一个元素到行首的距离和最后一个元素到行尾的距离与相邻元素之间距离相同。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 元素在主轴方向头部对齐，第一个元素与行首对齐，其他元素与前一个对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(FlexAlign)

```cangjie
public operator func !=(other: FlexAlign): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FlexAlign](#enum-flexalign)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FlexAlign)

```cangjie
public operator func ==(other: FlexAlign): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FlexAlign](#enum-flexalign)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** Flex布局容器方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<FlexDirection>

### Column

```cangjie
Column
```

**功能：** 主轴与列方向一致作为布局模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ColumnReverse

```cangjie
ColumnReverse
```

**功能：** 与Column相反方向进行布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Row

```cangjie
Row
```

**功能：** 主轴与行方向一致作为布局模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### RowReverse

```cangjie
RowReverse
```

**功能：** 与Row方向相反方向进行布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(FlexDirection)

```cangjie
public operator func !=(other: FlexDirection): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FlexDirection](#enum-flexdirection)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FlexDirection)

```cangjie
public operator func ==(other: FlexDirection): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FlexDirection](#enum-flexdirection)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum FlexWrap

```cangjie
public enum FlexWrap <: Equatable<FlexWrap> {
    | NoWrap
    | Wrap
    | WrapReverse
    | ...
}
```

**功能：** Flex布局容器约束方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<FlexWrap>

### NoWrap

```cangjie
NoWrap
```

**功能：** Flex容器的元素单行/列布局，子元素尽可能约束在容器内。当子元素有最小尺寸约束等设置时，Flex容器不会对其强制弹性压缩。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Wrap

```cangjie
Wrap
```

**功能：** Flex容器的元素多行/列排布，子项允许超出容器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### WrapReverse

```cangjie
WrapReverse
```

**功能：** 与Wrap方向相反方向进行布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(FlexWrap)

```cangjie
public operator func !=(other: FlexWrap): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FlexWrap](#enum-flexwrap)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FlexWrap)

```cangjie
public operator func ==(other: FlexWrap): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FlexWrap](#enum-flexwrap)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum FontStyle

```cangjie
public enum FontStyle <: Equatable<FontStyle> {
    | Normal
    | Italic
    | ...
}
```

**功能：** 字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<FontStyle>

### Italic

```cangjie
Italic
```

**功能：** 斜体字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** 标准字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(FontStyle)

```cangjie
public operator func !=(other: FontStyle): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FontStyle](#enum-fontstyle)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FontStyle)

```cangjie
public operator func ==(other: FontStyle): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FontStyle](#enum-fontstyle)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 设置文本的字体粗细，设置过大可能会在不同字体下有截断。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<FontWeight>

### Bold

```cangjie
Bold
```

**功能：** 字体较粗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Bolder

```cangjie
Bolder
```

**功能：** 字体非常粗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Lighter

```cangjie
Lighter
```

**功能：** 字体较细。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Medium

```cangjie
Medium
```

**功能：** 字体粗细适中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** 字体粗细正常。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Regular

```cangjie
Regular
```

**功能：** 字体粗细稍粗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W100

```cangjie
W100
```

**功能：** 100（最细）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W200

```cangjie
W200
```

**功能：** 200。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W300

```cangjie
W300
```

**功能：** 300。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W400

```cangjie
W400
```

**功能：** 400（正常）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W500

```cangjie
W500
```

**功能：** 500。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W600

```cangjie
W600
```

**功能：** 600。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W700

```cangjie
W700
```

**功能：** 700。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W800

```cangjie
W800
```

**功能：** 800。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### W900

```cangjie
W900
```

**功能：** 900（最粗）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(FontWeight)

```cangjie
public operator func !=(other: FontWeight): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FontWeight](#enum-fontweight)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FontWeight)

```cangjie
public operator func ==(other: FontWeight): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FontWeight](#enum-fontweight)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum BlurStyle

```cangjie
public enum BlurStyle {
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

**功能：** 前景模糊样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ForegroundBlurStyle>

### BackgroundRegular

```cangjie
BackgroundRegular
```

**功能：** 中距景深模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BackgroundThick

```cangjie
BackgroundThick
```

**功能：** 远距景深模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BackgroundThin

```cangjie
BackgroundThin
```

**功能：** 近距景深模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BackgroundUltraThick

```cangjie
BackgroundUltraThick
```

**功能：** 超远距景深模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ComponentRegular

```cangjie
ComponentRegular
```

**功能：** 组件普通材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ComponentThick

```cangjie
ComponentThick
```

**功能：** 组件厚材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ComponentThin

```cangjie
ComponentThin
```

**功能：** 组件轻薄材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ComponentUltraThick

```cangjie
ComponentUltraThick
```

**功能：** 组件超厚材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ComponentUltraThin

```cangjie
ComponentUltraThin
```

**功能：** 组件超薄材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 无模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Regular

```cangjie
Regular
```

**功能：** 普通模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Thick

```cangjie
Thick
```

**功能：** 厚模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Thin

```cangjie
Thin
```

**功能：** 薄模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 键盘功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<FunctionKey>

### ESC

```cangjie
ESC
```

**功能：** 表示键盘上ESC功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F1

```cangjie
F1
```

**功能：** 表示键盘上F1功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F10

```cangjie
F10
```

**功能：** 表示键盘上F10功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F11

```cangjie
F11
```

**功能：** 表示键盘上F11功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F12

```cangjie
F12
```

**功能：** 表示键盘上F12功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F2

```cangjie
F2
```

**功能：** 表示键盘上F2功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F3

```cangjie
F3
```

**功能：** 表示键盘上F3功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F4

```cangjie
F4
```

**功能：** 表示键盘上F4功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F5

```cangjie
F5
```

**功能：** 表示键盘上F5功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F6

```cangjie
F6
```

**功能：** 表示键盘上F6功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F7

```cangjie
F7
```

**功能：** 表示键盘上F7功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F8

```cangjie
F8
```

**功能：** 表示键盘上F8功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### F9

```cangjie
F9
```

**功能：** 表示键盘上F9功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TAB

```cangjie
TAB
```

**功能：** 表示键盘上TAB功能键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(FunctionKey)

```cangjie
public operator func !=(other: FunctionKey): Bool
```

**功能：** 两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FunctionKey](#enum-functionkey)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时返回true，否则返回false。|

### func ==(FunctionKey)

```cangjie
public operator func ==(other: FunctionKey): Bool
```

**功能：** 两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FunctionKey](#enum-functionkey)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时返回true，否则返回false。|

## enum GradientDirection

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

**功能：** 梯度方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<GradientDirection>

### Bottom

```cangjie
Bottom
```

**功能：** 从上向下。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Left

```cangjie
Left
```

**功能：** 从右向左。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### LeftBottom

```cangjie
LeftBottom
```

**功能：** 左下。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### LeftTop

```cangjie
LeftTop
```

**功能：** 左上。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 无。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Right

```cangjie
Right
```

**功能：** 从左向右。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### RightBottom

```cangjie
RightBottom
```

**功能：** 右下。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### RightTop

```cangjie
RightTop
```

**功能：** 右上。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 从下向上。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(GradientDirection)

```cangjie
public operator func !=(other: GradientDirection): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GradientDirection](#enum-gradientdirection)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

### func ==(GradientDirection)

```cangjie
public operator func ==(other: GradientDirection): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GradientDirection](#enum-gradientdirection)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## enum HorizontalAlign

```cangjie
public enum HorizontalAlign <: Equatable<HorizontalAlign> {
    | Start
    | Center
    | End
    | ...
}
```

**功能：** 水平方向对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<HorizontalAlign>

### Center

```cangjie
Center
```

**功能：** 居中对齐，默认对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** 按照语言方向末端对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 按照语言方向起始端对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(HorizontalAlign)

```cangjie
public operator func !=(other: HorizontalAlign): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[HorizontalAlign](#enum-horizontalalign)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

### func ==(HorizontalAlign)

```cangjie
public operator func ==(other: HorizontalAlign): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[HorizontalAlign](#enum-horizontalalign)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

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

**功能：** 图片的显示适配方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ImageFit>

### Auto

```cangjie
Auto
```

**功能：** 图像会根据其自身尺寸和组件的尺寸进行适当缩放，以在保持比例的同时填充视图。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Contain

```cangjie
Contain
```

**功能：** 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Cover

```cangjie
Cover
```

**功能：** 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Fill

```cangjie
Fill
```

**功能：** 不保持宽高比进行缩放，图片会被拉伸以填满整个显示边界。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 图片不进行任何缩放，保持原始尺寸显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ScaleDown

```cangjie
ScaleDown
```

**功能：** 图片会按照比例缩小，但不会放大，保持宽高比。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ImageFit)

```cangjie
public operator func !=(other: ImageFit): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageFit](#enum-imagefit)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

### func ==(ImageFit)

```cangjie
public operator func ==(other: ImageFit): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageFit](#enum-imagefit)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## enum ImageRepeat

```cangjie
public enum ImageRepeat <: Equatable<ImageRepeat> {
    | NoRepeat
    | X
    | Y
    | XY
    | ...
}
```

**功能：** 图片重复方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ImageRepeat>

### NoRepeat

```cangjie
NoRepeat
```

**功能：** 不重复绘制图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### X

```cangjie
X
```

**功能：** 只在水平轴上重复绘制图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### XY

```cangjie
XY
```

**功能：** 在两个轴上重复绘制图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Y

```cangjie
Y
```

**功能：** 只在竖直轴上重复绘制图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## enum ImageSize

```cangjie
public enum ImageSize <: Equatable<ImageSize> {
    | Contain
    | Cover
    | Auto
    | ...
}
```

**功能：** 图片尺寸显示设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ImageSize>

### Auto

```cangjie
Auto
```

**功能：** 默认值，保持原图的比例不变。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Contain

```cangjie
Contain
```

**功能：** 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Cover

```cangjie
Cover
```

**功能：** 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ImageSize)

```cangjie
public operator func !=(other: ImageSize): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageSize](#enum-imagesize)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ImageSize)

```cangjie
public operator func ==(other: ImageSize): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageSize](#enum-imagesize)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 图片基于行高的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ImageSpanAlignment>

### BASELINE

```cangjie
BASELINE
```

**功能：** 图片下边沿与文本BaseLine对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BOTTOM

```cangjie
BOTTOM
```

**功能：** 图片下边沿与行下边沿对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### CENTER

```cangjie
CENTER
```

**功能：** 图片中间与行中间对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TOP

```cangjie
TOP
```

**功能：** 图片上边沿与行上边沿对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ImageSpanAlignment)

```cangjie
public operator func !=(other: ImageSpanAlignment): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageSpanAlignment](#enum-imagespanalignment)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ImageSpanAlignment)

```cangjie
public operator func ==(other: ImageSpanAlignment): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageSpanAlignment](#enum-imagespanalignment)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ImageType

```cangjie
public enum ImageType <: Equatable<ImageType> {
    | png
    | jpeg
    | webp
    | ...
}
```

**功能：** 指定图像格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ImageType>

### jpeg

```cangjie
jpeg
```

**功能：** jpeg图片格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### png

```cangjie
png
```

**功能：** png图片格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### webp

```cangjie
webp
```

**功能：** webp图片格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ImageType)

```cangjie
public operator func !=(other: ImageType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageType](#enum-imagetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ImageType)

```cangjie
public operator func ==(other: ImageType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageType](#enum-imagetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ItemAlign

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

**功能：** 元素对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ItemAlign>

### Auto

```cangjie
Auto
```

**功能：** 使用Flex容器中默认配置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Baseline

```cangjie
Baseline
```

**功能：** 元素在Flex容器中，交叉轴方向文本基线对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Center

```cangjie
Center
```

**功能：** 元素在Flex容器中，交叉轴方向居中对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** 元素在Flex容器中，交叉轴方向底部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 元素在Flex容器中，交叉轴方向首部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Stretch

```cangjie
Stretch
```

**功能：** 元素在Flex容器中，交叉轴方向拉伸填充。容器为Flex且设置Wrap为FlexWrap.Wrap或FlexWrap.WrapReverse时，元素拉伸到与当前行/列交叉轴长度最长的元素尺寸。其余情况下，无论元素尺寸是否设置，均拉伸到容器尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ItemAlign)

```cangjie
public operator func !=(other: ItemAlign): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ItemAlign](#enum-itemalign)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ItemAlign)

```cangjie
public operator func ==(other: ItemAlign): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ItemAlign](#enum-itemalign)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum KeySource

```cangjie
public enum KeySource <: Equatable<KeySource> {
    | Unknown
    | Keyboard
    | ...
}
```

**功能：** 按键来源。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<KeySource>

### Keyboard

```cangjie
Keyboard
```

**功能：** 键盘按键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Unknown

```cangjie
Unknown
```

**功能：** 未知来源。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(KeySource)

```cangjie
public operator func !=(other: KeySource): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[KeySource](#enum-keysource)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(KeySource)

```cangjie
public operator func ==(other: KeySource): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[KeySource](#enum-keysource)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum KeyType

```cangjie
public enum KeyType <: Equatable<KeyType> {
    | Unknown
    | Down
    | Up
    | ...
}
```

**功能：** 按键类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<KeyType>

### Down

```cangjie
Down
```

**功能：** 按键按下。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Unknown

```cangjie
Unknown
```

**功能：** 未知类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Up

```cangjie
Up
```

**功能：** 按键释放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(KeyType)

```cangjie
public operator func !=(other: KeyType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[KeyType](#enum-keytype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(KeyType)

```cangjie
public operator func ==(other: KeyType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[KeyType](#enum-keytype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum SafeAreaEdge

```cangjie
public enum SafeAreaEdge {
    | TOP
    | BOTTOM
    | ...
}
```

**功能：** 扩展安全区域的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SafeAreaEdge>

### BOTTOM

```cangjie
BOTTOM
```

**功能：** 下方区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TOP

```cangjie
TOP
```

**功能：** 上方区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(SafeAreaEdge)

```cangjie
public operator func !=(other: SafeAreaEdge): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SafeAreaEdge](#enum-safeareaedge)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SafeAreaEdge)

```cangjie
public operator func ==(other: SafeAreaEdge): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SafeAreaEdge](#enum-safeareaedge)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum LengthMetricsUnit

```cangjie
public enum LengthMetricsUnit <: Equatable<LengthMetricsUnit> {
    | DEFAULT
    | PX
    | ...
}
```

**功能：** 长度属性单位枚举

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<LengthMetricsUnit>

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 长度类型，用于描述以默认的vp像素单位为单位的长度

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PX

```cangjie
PX
```

**功能：** 长度类型，用于描述以px像素单位为单位的长度

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(LengthMetricsUnit)

```cangjie
public operator func !=(other: LengthMetricsUnit): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LengthMetricsUnit](#enum-lengthmetricsunit)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(LengthMetricsUnit)

```cangjie
public operator func ==(other: LengthMetricsUnit): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LengthMetricsUnit](#enum-lengthmetricsunit)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum LineBreakStrategy

```cangjie
public enum LineBreakStrategy <: Equatable<LineBreakStrategy> {
    | GREEDY
    | HIGH_QUALITY
    | BALANCED
    | ...
}
```

**功能：** 文本的折行规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<LineBreakStrategy>

### BALANCED

```cangjie
BALANCED
```

**功能：** 尽可能保证在不拆词的情况下，使一个段落中每一行的宽度相同。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### GREEDY

```cangjie
GREEDY
```

**功能：** 使每一行尽量显示多的字符，直到这一行不能显示更多字符再进行折行。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### HIGH_QUALITY

```cangjie
HIGH_QUALITY
```

**功能：** 在BALANCED的基础上，尽可能填满行，在最后一行的权重上比较低，可能会出现最后一行留白比较多。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(LineBreakStrategy)

```cangjie
public operator func !=(other: LineBreakStrategy): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LineBreakStrategy](#enum-linebreakstrategy)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(LineBreakStrategy)

```cangjie
public operator func ==(other: LineBreakStrategy): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LineBreakStrategy](#enum-linebreakstrategy)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum LineCapStyle

```cangjie
public enum LineCapStyle <: Equatable<LineCapStyle> {
    | Butt
    | Round
    | Square
    | ...
}
```

**功能：** 线条样式

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<LineCapStyle>

### Butt

```cangjie
Butt
```

**功能：** 线条两端为平行线，不额外扩展

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Round

```cangjie
Round
```

**功能：** 在线条两端延伸半个圆，直径等于线宽

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Square

```cangjie
Square
```

**功能：** 在线条两端延伸半个圆，直径等于线宽

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(LineCapStyle)

```cangjie
public operator func !=(other: LineCapStyle): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LineCapStyle](#enum-linecapstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(LineCapStyle)

```cangjie
public operator func ==(other: LineCapStyle): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LineCapStyle](#enum-linecapstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum LineJoinStyle

```cangjie
public enum LineJoinStyle <: Equatable<LineJoinStyle> {
    | Miter
    | Round
    | Bevel
    | ...
}
```

**功能：** 路径段连接方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<LineJoinStyle>

### Bevel

```cangjie
Bevel
```

**功能：** 使用斜角连接路径段。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Miter

```cangjie
Miter
```

**功能：** 使用尖角连接路径段。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Round

```cangjie
Round
```

**功能：** 使用圆角连接路径段。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(LineJoinStyle)

```cangjie
public operator func !=(other: LineJoinStyle): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LineJoinStyle](#enum-linejoinstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(LineJoinStyle)

```cangjie
public operator func ==(other: LineJoinStyle): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[LineJoinStyle](#enum-linejoinstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ListItemAlign

```cangjie
public enum ListItemAlign <: Equatable<ListItemAlign> {
    | Start
    | Center
    | End
    | ...
}
```

**功能：** ListItem在List中，交叉轴方向的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ListItemAlign>

### Center

```cangjie
Center
```

**功能：** ListItem在List中，交叉轴方向居中对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** ListItem在List中，交叉轴方向尾部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** ListItem在List中，交叉轴方向首部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ListItemAlign)

```cangjie
public operator func !=(other: ListItemAlign): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ListItemAlign](#enum-listitemalign)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ListItemAlign)

```cangjie
public operator func ==(other: ListItemAlign): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ListItemAlign](#enum-listitemalign)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum MenuPolicy

```cangjie
public enum MenuPolicy <: Equatable<MenuPolicy> {
    | Default
    | Hide
    | Show
    | ...
}
```

**功能：** 菜单弹出的策略。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<MenuPolicy>

### Default

```cangjie
Default
```

**功能：** 按照底层默认逻辑决定是否弹出菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Hide

```cangjie
Hide
```

**功能：** 始终不弹出菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Show

```cangjie
Show
```

**功能：** 始终弹出菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(MenuPolicy)

```cangjie
public operator func !=(other: MenuPolicy): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MenuPolicy](#enum-menupolicy)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(MenuPolicy)

```cangjie
public operator func ==(other: MenuPolicy): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MenuPolicy](#enum-menupolicy)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ModalTransition

```cangjie
public enum ModalTransition <: Equatable<ModalTransition> {
    | Default
    | None
    | Alpha
    | ...
}
```

**功能：** 全屏模态切换动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ModalTransition>

### Alpha

```cangjie
Alpha
```

**功能：** 全屏模态透明度渐变动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Default

```cangjie
Default
```

**功能：** 全屏模态上下切换动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 全屏模态无转场动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ModalTransition)

```cangjie
public operator func !=(other: ModalTransition): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ModalTransition](#enum-modaltransition)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(ModalTransition)

```cangjie
public operator func ==(other: ModalTransition): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ModalTransition](#enum-modaltransition)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum ModifierKey

```cangjie
public enum ModifierKey <: Equatable<ModifierKey> {
    | CTRL
    | SHIFT
    | ALT
    | ...
}
```

**功能：** 输入法修饰键类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ModifierKey>

### ALT

```cangjie
ALT
```

**功能：** 表示键盘上Alt键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### CTRL

```cangjie
CTRL
```

**功能：** 表示键盘上Ctrl键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SHIFT

```cangjie
SHIFT
```

**功能：** 表示键盘上Shift键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ModifierKey)

```cangjie
public operator func !=(other: ModifierKey): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ModifierKey](#enum-modifierkey)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ModifierKey)

```cangjie
public operator func ==(other: ModifierKey): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ModifierKey](#enum-modifierkey)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum MouseAction

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

**功能：** 鼠标动作。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<MouseAction>

### Hover

```cangjie
Hover
```

**功能：** 鼠标悬浮。**说明：** 该枚举值无效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Move

```cangjie
Move
```

**功能：** 鼠标移动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 无操作。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Press

```cangjie
Press
```

**功能：** 鼠标按键按下。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Release

```cangjie
Release
```

**功能：** 鼠标按键松开。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(MouseAction)

```cangjie
public operator func !=(other: MouseAction): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MouseAction](#enum-mouseaction)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(MouseAction)

```cangjie
public operator func ==(other: MouseAction): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MouseAction](#enum-mouseaction)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 鼠标按键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<MouseButton>

### Back

```cangjie
Back
```

**功能：** 鼠标左侧后退键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Forward

```cangjie
Forward
```

**功能：** 鼠标左侧前进键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Left

```cangjie
Left
```

**功能：** 鼠标左键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Middle

```cangjie
Middle
```

**功能：** 鼠标中键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 无按键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Right

```cangjie
Right
```

**功能：** 鼠标右键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(MouseButton)

```cangjie
public operator func !=(other: MouseButton): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MouseButton](#enum-mousebutton)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(MouseButton)

```cangjie
public operator func ==(other: MouseButton): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MouseButton](#enum-mousebutton)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum NavigationType

```cangjie
public enum NavigationType <: Equatable<NavigationType> {
    | Push
    | Replace
    | Back
    | ...
}
```

**功能：** 页面路由方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<NavigationType>

### Back

```cangjie
Back
```

**功能：** 返回到指定的页面。指定的页面不存在栈中时不响应。未传入指定的页面时返回上一页。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Push

```cangjie
Push
```

**功能：** 跳转到应用内的指定页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Replace

```cangjie
Replace
```

**功能：**  用应用内的某个页面替换当前页面，并销毁被替换的页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(NavigationType)

```cangjie
public operator func !=(other: NavigationType): Bool
```

**功能：** 比较两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[NavigationType](#enum-navigationtype)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等则返回true，否则返回false。|

### func ==(NavigationType)

```cangjie
public operator func ==(other: NavigationType): Bool
```

**功能：** 比较两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[NavigationType](#enum-navigationtype)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等则返回true，否则返回false。|

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

**功能：** 可滚动组件往末尾端滚动时的嵌套滚动选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<NestedScrollMode>

### PARALLEL

```cangjie
PARALLEL
```

**功能：** 自身和父组件同时滚动，自身和父组件都到达边缘以后，如果自身有边缘效果，则自身触发边缘效果，否则父组件触发边缘效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PARENT_FIRST

```cangjie
PARENT_FIRST
```

**功能：** 父组件先滚动，父组件滚动到边缘以后自身滚动。自身滚动到边缘后，如果有边缘效果，会触发自身的边缘效果，否则触发父组件的边缘效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SELF_FIRST

```cangjie
SELF_FIRST
```

**功能：** 自身先滚动，自身滚动到边缘以后父组件滚动。父组件滚动到边缘以后，如果父组件有边缘效果，则父组件触发边缘效果，否则子组件触发边缘效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SELF_ONLY

```cangjie
SELF_ONLY
```

**功能：** 只自身滚动，不与父组件联动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(NestedScrollMode)

```cangjie
public operator func !=(other: NestedScrollMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[NestedScrollMode](#enum-nestedscrollmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(NestedScrollMode)

```cangjie
public operator func ==(other: NestedScrollMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[NestedScrollMode](#enum-nestedscrollmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum OptionWidthMode

```cangjie
public enum OptionWidthMode <: Equatable<OptionWidthMode> {
    | FIT_CONTENT
    | FIT_TRIGGER
    | ...
}
```

**功能：** 下拉菜单宽度设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<OptionWidthMode>

### FIT_CONTENT

```cangjie
FIT_CONTENT
```

**功能：** 设置该值时，下拉菜单宽度按默认2栅格显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### FIT_TRIGGER

```cangjie
FIT_TRIGGER
```

**功能：** 设置下拉菜单继承下拉按钮宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(OptionWidthMode)

```cangjie
public operator func !=(other: OptionWidthMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[OptionWidthMode](#enum-optionwidthmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(OptionWidthMode)

```cangjie
public operator func ==(other: OptionWidthMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[OptionWidthMode](#enum-optionwidthmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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
    | ...
}
```

**功能：** 气泡提示位置设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<Placement>

### Bottom

```cangjie
Bottom
```

**功能：** 气泡提示位于组件下侧，与组件下侧中心对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BottomLeft

```cangjie
BottomLeft
```

**功能：** 气泡提示位于组件下侧，与组件左侧边缘对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BottomRight

```cangjie
BottomRight
```

**功能：** 气泡提示位于组件下侧，与组件右侧边缘对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Left

```cangjie
Left
```

**功能：** 气泡提示位于组件左侧，与组件左侧中心对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### LeftBottom

```cangjie
LeftBottom
```

**功能：** 气泡提示位于组件左侧，与组件下侧边缘对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### LeftTop

```cangjie
LeftTop
```

**功能：** 气泡提示位于组件左侧，与组件上侧边缘对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 气泡提示位置无变化。（？）

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Right

```cangjie
Right
```

**功能：** 气泡提示位于组件右侧，与组件右侧中心对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### RightBottom

```cangjie
RightBottom
```

**功能：** 气泡提示位于组件右侧，与组件下侧边缘对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### RightTop

```cangjie
RightTop
```

**功能：** 气泡提示位于组件右侧，与组件上侧边缘对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 气泡提示位于组件上侧，与组件上侧中心对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TopLeft

```cangjie
TopLeft
```

**功能：** 气泡提示位于组件上侧，与组件左侧边缘对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TopRight

```cangjie
TopRight
```

**功能：** 气泡提示位于组件上侧，与组件右侧边缘对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(Placement)

```cangjie
public operator func !=(other: Placement): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Placement](#enum-placement)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(Placement)

```cangjie
public operator func ==(other: Placement): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Placement](#enum-placement)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum PlayMode

```cangjie
public enum PlayMode <: Equatable<PlayMode> {
    | Normal
    | Reverse
    | Alternate
    | AlternateReverse
    | ...
}
```

**功能：** 动画播放方向设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<PlayMode>

### Alternate

```cangjie
Alternate
```

**功能：** 动画在奇数次（1、3、5...）正向播放，在偶数次（2、4、6...）反向播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### AlternateReverse

```cangjie
AlternateReverse
```

**功能：** 动画在奇数次（1、3、5...）反向播放，在偶数次（2、4、6...）正向播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** 动画正向播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Reverse

```cangjie
Reverse
```

**功能：** 动画反向播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(PlayMode)

```cangjie
public operator func !=(other: PlayMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PlayMode](#enum-playmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PlayMode)

```cangjie
public operator func ==(other: PlayMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PlayMode](#enum-playmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** Progress组件的样式类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ProgressType>

### Capsule

```cangjie
Capsule
```

**功能：** 胶囊样式，头尾两端圆弧处的进度展示效果与Eclipse相同；中段处的进度展示效果与Linear相同。高度大于宽度的时候自适应垂直显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Eclipse

```cangjie
Eclipse
```

**功能：** 圆形样式，显示类似月圆月缺的进度展示效果，从月牙逐渐变化至满月。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Linear

```cangjie
Linear
```

**功能：** 线性样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Ring

```cangjie
Ring
```

**功能：** 环形无刻度样式，环形圆环逐渐显示至完全填充效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### ScaleRing

```cangjie
ScaleRing
```

**功能：** 环形有刻度样式，显示类似时钟刻度形式的进度展示效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ProgressType)

```cangjie
public operator func !=(other: ProgressType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ProgressType](#enum-progresstype)|是|-|<另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ProgressType)

```cangjie
public operator func ==(other: ProgressType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ProgressType](#enum-progresstype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ImageSmoothingQuality

```cangjie
public enum ImageSmoothingQuality {
    | Low
    | Medium
    | High
    | ...
}
```

**功能：** 设置图像平滑度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ImageSmoothingQuality>

### High

```cangjie
High
```

**功能：** 高画质。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Low

```cangjie
Low
```

**功能：** 低画质。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Medium

```cangjie
Medium
```

**功能：** 中画质。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ImageSmoothingQuality)

```cangjie
public operator func !=(other: ImageSmoothingQuality): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageSmoothingQuality](#enum-imagesmoothingquality)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ImageSmoothingQuality)

```cangjie
public operator func ==(other: ImageSmoothingQuality): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageSmoothingQuality](#enum-imagesmoothingquality)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 下拉状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<RefreshStatus>

### Done

```cangjie
Done
```

**功能：** 刷新结束，返回初始状态（顶部）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Drag

```cangjie
Drag
```

**功能：** 下拉中，下拉距离小于刷新距离。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Inactive

```cangjie
Inactive
```

**功能：** 默认未下拉状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### OverDrag

```cangjie
OverDrag
```

**功能：** 下拉中，下拉距离超过刷新距离。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Refresh

```cangjie
Refresh
```

**功能：** 下拉结束，回弹至刷新距离，进入刷新状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(RefreshStatus)

```cangjie
public operator func !=(other: RefreshStatus): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RefreshStatus](#enum-refreshstatus)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(RefreshStatus)

```cangjie
public operator func ==(other: RefreshStatus): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RefreshStatus](#enum-refreshstatus)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum Repetition

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

**功能：** 设置图像重复的方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<Repetition>

### clamp

```cangjie
clamp
```

**功能：** 在原始边界外绘制时，超出部分使用边缘的颜色绘制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### mirror

```cangjie
mirror
```

**功能：** 沿x轴和y轴重复翻转绘制图像。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### no_repeat

```cangjie
no_repeat
```

**功能：** 不重复绘制图像。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### repeat

```cangjie
repeat
```

**功能：** 沿x轴和y轴重复绘制图像。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### repeat_x

```cangjie
repeat_x
```

**功能：** 沿x轴重复绘制图像。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### repeat_y

```cangjie
repeat_y
```

**功能：** 沿y轴重复绘制图像。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(Repetition)

```cangjie
public operator func !=(other: Repetition): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Repetition](#enum-repetition)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(Repetition)

```cangjie
public operator func ==(other: Repetition): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Repetition](#enum-repetition)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ResponseType

```cangjie
public enum ResponseType <: Equatable<ResponseType> {
    | RightClick
    | LongPress
    | ...
}
```

**功能：** 响应类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ResponseType>

### LongPress

```cangjie
LongPress
```

**功能：** 通过长按触发菜单弹出。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### RightClick

```cangjie
RightClick
```

**功能：** 通过鼠标右键触发菜单弹出。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ResponseType)

```cangjie
public operator func !=(other: ResponseType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ResponseType](#enum-responsetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ResponseType)

```cangjie
public operator func ==(other: ResponseType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ResponseType](#enum-responsetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ScrollBarDirection

```cangjie
public enum ScrollBarDirection <: Equatable<ScrollBarDirection> {
    | Vertical
    | Horizontal
    | ...
}
```

**功能：** 设置滚动条的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ScrollBarDirection>

### Horizontal

```cangjie
Horizontal
```

**功能：** 设置滚动条方向为横向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Vertical

```cangjie
Vertical
```

**功能：** 设置滚动条方向为纵向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ScrollBarDirection)

```cangjie
public operator func !=(other: ScrollBarDirection): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScrollBarDirection](#enum-scrollbardirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ScrollBarDirection)

```cangjie
public operator func ==(other: ScrollBarDirection): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScrollBarDirection](#enum-scrollbardirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ScrollDirection

```cangjie
public enum ScrollDirection <: Equatable<ScrollDirection> {
    | Vertical
    | Horizontal
    | ...
}
```

**功能：** 滚动方向枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ScrollDirection>

### Horizontal

```cangjie
Horizontal
```

**功能：** 仅支持水平方向滚动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Vertical

```cangjie
Vertical
```

**功能：** 仅支持竖直方向滚动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ScrollDirection)

```cangjie
public operator func !=(other: ScrollDirection): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScrollDirection](#enum-scrolldirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ScrollDirection)

```cangjie
public operator func ==(other: ScrollDirection): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScrollDirection](#enum-scrolldirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ScrollSource

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

**功能：** 滑动操作的来源。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ScrollSource>

### DRAG

```cangjie
DRAG
```

**功能：** 拖拽事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### EDGE_EFFECT

```cangjie
EDGE_EFFECT
```

**功能：** EdgeEffect.Spring的边缘滚动效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### FLING

```cangjie
FLING
```

**功能：** 拖拽结束之后的惯性滑动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### OTHER_USER_INPUT

```cangjie
OTHER_USER_INPUT
```

**功能：** 除拖拽外的其他用户输入，如鼠标滚轮、键盘事件等。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SCROLLER

```cangjie
SCROLLER
```

**功能：** Scroller的不带动效方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SCROLLER_ANIMATION

```cangjie
SCROLLER_ANIMATION
```

**功能：** Scroller的带动效方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SCROLL_BAR

```cangjie
SCROLL_BAR
```

**功能：** 滚动条的拖拽事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SCROLL_BAR_FLING

```cangjie
SCROLL_BAR_FLING
```

**功能：** 滚动条拖拽结束后的带速度的惯性滑动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ScrollSource)

```cangjie
public operator func !=(other: ScrollSource): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScrollSource](#enum-scrollsource)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ScrollSource)

```cangjie
public operator func ==(other: ScrollSource): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScrollSource](#enum-scrollsource)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ScrollState

```cangjie
public enum ScrollState <: Equatable<ScrollState> {
    | Idle
    | Scrolling
    | Fling
    | ...
}
```

**功能：** 设置当前滑动状态

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ScrollState>

### Fling

```cangjie
Fling
```

**功能：** 惯性滑动状态

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Idle

```cangjie
Idle
```

**功能：** 未滑动状态

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Scrolling

```cangjie
Scrolling
```

**功能：** 手指拖动状态

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ScrollState)

```cangjie
public operator func !=(other: ScrollState): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScrollState](#enum-scrollstate)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ScrollState)

```cangjie
public operator func ==(other: ScrollState): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScrollState](#enum-scrollstate)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 阴影样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ShadowStyle>

### OuterDefaultLG

```cangjie
OuterDefaultLG
```

**功能：** 大阴影。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### OuterDefaultMD

```cangjie
OuterDefaultMD
```

**功能：** 中阴影。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### OuterDefaultSM

```cangjie
OuterDefaultSM
```

**功能：** 小阴影。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### OuterDefaultXS

```cangjie
OuterDefaultXS
```

**功能：** 超小阴影。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### OuterFloatingMD

```cangjie
OuterFloatingMD
```

**功能：** 浮动中阴影。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### OuterFloatingSM

```cangjie
OuterFloatingSM
```

**功能：** 浮动小阴影。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ShadowStyle)

```cangjie
public operator func !=(other: ShadowStyle): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ShadowStyle](#enum-shadowstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ShadowStyle)

```cangjie
public operator func ==(other: ShadowStyle): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ShadowStyle](#enum-shadowstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ShadowType

```cangjie
public enum ShadowType <: Equatable<ShadowType> {
    | Color
    | Blur
    | ...
}
```

**功能：** 阴影类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ShadowType>

### Blur

```cangjie
Blur
```

**功能：** 模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Color

```cangjie
Color
```

**功能：** 颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ShadowType)

```cangjie
public operator func !=(other: ShadowType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ShadowType](#enum-shadowtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ShadowType)

```cangjie
public operator func ==(other: ShadowType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ShadowType](#enum-shadowtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum SharedTransitionEffectType

```cangjie
public enum SharedTransitionEffectType <: Equatable<SharedTransitionEffectType> {
    | Static
    | Exchange
    | ...
}
```

**功能：** 共享元素转场动效类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SharedTransitionEffectType>

### Exchange

```cangjie
Exchange
```

**功能：** 将源页面元素移动到目标页面元素位置并适当缩放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Static

```cangjie
Static
```

**功能：** 目标页面元素的位置保持不变，可以配置透明度动画。目前，只有为重定向到目标页面而配置的静态效果才会生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(SharedTransitionEffectType)

```cangjie
public operator func !=(other: SharedTransitionEffectType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SharedTransitionEffectType](#enum-sharedtransitioneffecttype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SharedTransitionEffectType)

```cangjie
public operator func ==(other: SharedTransitionEffectType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SharedTransitionEffectType](#enum-sharedtransitioneffecttype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum SideBarContainerType

```cangjie
public enum SideBarContainerType <: Equatable<SideBarContainerType> {
    | Embed
    | Overlay
    | Auto
    | ...
}
```

**功能：** 容器内侧边栏样式枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SideBarContainerType>

### Auto

```cangjie
Auto
```

**功能：** 组件尺寸大于等于[minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength)+[minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength)时，采用Embed模式显示。

组件尺寸小于[minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength)+[minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength)时，采用Overlay模式显示。contagrid

未设置[minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength)或[minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength)时，会使用未设置接口的默认值进行计算，若计算的值小于600vp，则使用600vp做为模式切换的断点值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Embed

```cangjie
Embed
```

**功能：** 侧边栏嵌入到组件内，和内容区并列显示。

组件尺寸小于[minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength)+[minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength),并且未设置[showSideBar](./cj-grid-layout-sidebar.md#func-showsidebarbool)时，侧边栏自动隐藏。

未设置[minSideBarWidth](./cj-grid-layout-sidebar.md#func-minsidebarwidthlength)或[minContentWidth](./cj-grid-layout-sidebar.md#func-mincontentwidthlength)采用未设置接口的默认值进行计算。

组件在自动隐藏后，如果通过点击控制按钮唤出侧边栏，则侧边栏悬浮在内容区上显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Overlay

```cangjie
Overlay
```

**功能：** 侧边栏浮在内容区上面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(SideBarContainerType)

```cangjie
public operator func !=(other: SideBarContainerType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SideBarContainerType](#enum-sidebarcontainertype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SideBarContainerType)

```cangjie
public operator func ==(other: SideBarContainerType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SideBarContainerType](#enum-sidebarcontainertype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum SideBarPosition

```cangjie
public enum SideBarPosition <: Equatable<SideBarPosition> {
    | Start
    | End
    | ...
}
```

**功能：** 设置侧边栏显示位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SideBarPosition>

### End

```cangjie
End
```

**功能：** 侧边栏位于容器右侧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 侧边栏位于容器左侧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(SideBarPosition)

```cangjie
public operator func !=(other: SideBarPosition): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SideBarPosition](#enum-sidebarposition)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SideBarPosition)

```cangjie
public operator func ==(other: SideBarPosition): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SideBarPosition](#enum-sidebarposition)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 事件输入源

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SourceTool>

### Finger

```cangjie
Finger
```

**功能：** 手指输入

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Joystick

```cangjie
Joystick
```

**功能：** 手柄输入

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Mouse

```cangjie
Mouse
```

**功能：** 鼠标输入

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Pen

```cangjie
Pen
```

**功能：** 手写笔输入

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Touchpad

```cangjie
Touchpad
```

**功能：** 触控板输入。触控板单指输入被视为鼠标输入操作。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Unknown

```cangjie
Unknown
```

**功能：** 未知输入源

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(SourceTool)

```cangjie
public operator func !=(other: SourceTool): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SourceTool](#enum-sourcetool)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SourceTool)

```cangjie
public operator func ==(other: SourceTool): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SourceTool](#enum-sourcetool)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum SourceType

```cangjie
public enum SourceType <: Equatable<SourceType> {
    | Unknown
    | Mouse
    | TouchScreen
    | ...
}
```

**功能：** 事件输入设备

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SourceType>

### Mouse

```cangjie
Mouse
```

**功能：** 鼠标

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TouchScreen

```cangjie
TouchScreen
```

**功能：** 触摸屏

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Unknown

```cangjie
Unknown
```

**功能：** 未知设备

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(SourceType)

```cangjie
public operator func !=(other: SourceType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SourceType](#enum-sourcetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SourceType)

```cangjie
public operator func ==(other: SourceType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SourceType](#enum-sourcetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 设置ListItemGroup中header和footer是否要吸顶或吸底。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<StickyStyle>

### Both

```cangjie
Both
```

**功能：** 设置ListItemGroup的headerh吸顶，footer吸底。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Footer

```cangjie
Footer
```

**功能：** 设置ListItemGroup的footer吸底。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Header

```cangjie
Header
```

**功能：** 设置ListItemGroup的headerh吸顶。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 设置ListItemGroup的headerh不吸顶，footer不吸底。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(StickyStyle)

```cangjie
public operator func !=(other: StickyStyle): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[StickyStyle](#enum-stickystyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(StickyStyle)

```cangjie
public operator func ==(other: StickyStyle): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[StickyStyle](#enum-stickystyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum SwipeEdgeEffect

```cangjie
public enum SwipeEdgeEffect <: Equatable<SwipeEdgeEffect> {
    | Spring
    | None
    | ...
}
```

**功能：** ListItem的滑动效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SwipeEdgeEffect>

### None

```cangjie
None
```

**功能：** ListItem划动距离不能超过划出组件大小。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Spring

```cangjie
Spring
```

**功能：** ListItem划动距离超过划出组件大小后可以继续划动，松手后按照弹簧阻尼曲线回弹。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(SwipeEdgeEffect)

```cangjie
public operator func !=(other: SwipeEdgeEffect): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SwipeEdgeEffect](#enum-swipeedgeeffect)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SwipeEdgeEffect)

```cangjie
public operator func ==(other: SwipeEdgeEffect): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SwipeEdgeEffect](#enum-swipeedgeeffect)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取当前枚举的所表示的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|当前枚举所表示的值。|

## enum TextAlign

```cangjie
public enum TextAlign <: Equatable<TextAlign> {
    | Start
    | Center
    | End
    | ...
}
```

**功能：** 文本对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TextAlign>

### Center

```cangjie
Center
```

**功能：** 水平居中对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** 水平对齐尾部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 水平对齐首部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TextAlign)

```cangjie
public operator func !=(other: TextAlign): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextAlign](#enum-textalign)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TextAlign)

```cangjie
public operator func ==(other: TextAlign): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextAlign](#enum-textalign)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum CanvasTextAlign

```cangjie
public enum CanvasTextAlign {
    | Left
    | Right
    | Center
    | Start
    | End
    | ...
}
```

**功能：** 文本对齐方式类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TextAlignStyle>

### Center

```cangjie
Center
```

**功能：** 文本居中对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** 文本对齐界线结束的地方。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Justify

```cangjie
Justify
```

**功能：** 文本两端对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Left

```cangjie
Left
```

**功能：** 文本左对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Right

```cangjie
Right
```

**功能：** 文本右对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 文本对齐界线开始的地方。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## enum CanvasTextBaseline

```cangjie
public enum CanvasTextBaseline {
    | Alphabetic
    | Ideographic
    | Top
    | Bottom
    | Middle
    | Hanging
    | ...
}
```

**功能：** 设置文本绘制中的水平对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<CanvasTextBaseline>

### Alphabetic

```cangjie
Alphabetic
```

**功能：** 文本基线是标准的字母基线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Bottom

```cangjie
Bottom
```

**功能：** 文本基线在文本块的底部。 与ideographic基线的区别在于ideographic基线不需要考虑下行字母。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Hanging

```cangjie
Hanging
```

**功能：** 文本基线是悬挂基线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Ideographic

```cangjie
Ideographic
```

**功能：** 文字基线是表意字基线；如果字符本身超出了alphabetic基线，那么ideograhpic基线位置在字符本身的底部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Middle

```cangjie
Middle
```

**功能：** 文本基线在文本块的中间。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 文本基线在文本块的顶部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(CanvasTextBaseline)

```cangjie
public operator func !=(other: CanvasTextBaseline): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CanvasTextBaseline](#enum-canvastextbaseline)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(CanvasTextBaseline)

```cangjie
public operator func ==(other: CanvasTextBaseline): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CanvasTextBaseline](#enum-canvastextbaseline)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum TextCase

```cangjie
public enum TextCase <: Equatable<TextCase> {
    | Normal
    | LowerCase
    | UpperCase
    | ...
}
```

**功能：** 文本大小写格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TextCase>

### LowerCase

```cangjie
LowerCase
```

**功能：** 文本采用全小写。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** 保持文本原有大小写。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### UpperCase

```cangjie
UpperCase
```

**功能：** 文本采用全大写。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TextCase)

```cangjie
public operator func !=(other: TextCase): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextCase](#enum-textcase)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TextCase)

```cangjie
public operator func ==(other: TextCase): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextCase](#enum-textcase)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum TextContentStyle

```cangjie
public enum TextContentStyle <: Equatable<TextContentStyle> {
    | DEFAULT
    | INLINE
    | ...
}
```

**功能：** 文本框多态样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TextContentStyle>

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 默认风格，光标宽1.5vp，光标高度与文本选中底板高度和字体大小相关。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### INLINE

```cangjie
INLINE
```

**功能：** 内联输入风格。文本选中底板高度与输入框高度相同。
内联输入是在有明显的编辑态/非编辑态的区分场景下使用，例如：文件列表视图中的重命名。
不支持showError属性。
内联模式下，不支持拖入文本。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TextContentStyle)

```cangjie
public operator func !=(other: TextContentStyle): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextContentStyle](#enum-textcontentstyle)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TextContentStyle)

```cangjie
public operator func ==(other: TextContentStyle): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextContentStyle](#enum-textcontentstyle)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 设置文本装饰线样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TextDecorationStyle>

### DASHED

```cangjie
DASHED
```

**功能：** 虚线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### DOTTED

```cangjie
DOTTED
```

**功能：** 点线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### DOUBLE

```cangjie
DOUBLE
```

**功能：** 双实线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### SOLID

```cangjie
SOLID
```

**功能：** 单实线（默认值）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### WAVY

```cangjie
WAVY
```

**功能：** 波浪线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TextDecorationStyle)

```cangjie
public operator func !=(other: TextDecorationStyle): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextDecorationStyle](#enum-textdecorationstyle)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TextDecorationStyle)

```cangjie
public operator func ==(other: TextDecorationStyle): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextDecorationStyle](#enum-textdecorationstyle)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 装饰线类型枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TextDecorationType>

### LineThrough

```cangjie
LineThrough
```

**功能：** 穿过文本的修饰线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 不使用文本装饰线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Overline

```cangjie
Overline
```

**功能：** 文字上划线修饰。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Underline

```cangjie
Underline
```

**功能：** 文字下划线修饰。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TextDecorationType)

```cangjie
public operator func !=(other: TextDecorationType): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextDecorationType](#enum-textdecorationtype)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TextDecorationType)

```cangjie
public operator func ==(other: TextDecorationType): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextDecorationType](#enum-textdecorationtype)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum TextHeightAdaptivePolicy

```cangjie
public enum TextHeightAdaptivePolicy <: Equatable<TextHeightAdaptivePolicy> {
    | MAX_LINES_FIRST
    | MIN_FONT_SIZE_FIRST
    | LAYOUT_CONSTRAINT_FIRST
    | ...
}
```

**功能：** 设置文本高度自适应方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TextHeightAdaptivePolicy>

### LAYOUT_CONSTRAINT_FIRST

```cangjie
LAYOUT_CONSTRAINT_FIRST
```

**功能：** 设置文本高度自适应方式为以布局约束（高度）优先。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### MAX_LINES_FIRST

```cangjie
MAX_LINES_FIRST
```

**功能：** 设置文本高度自适应方式为以MaxLines优先。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### MIN_FONT_SIZE_FIRST

```cangjie
MIN_FONT_SIZE_FIRST
```

**功能：** 设置文本高度自适应方式为以缩小字体优先。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TextHeightAdaptivePolicy)

```cangjie
public operator func !=(other: TextHeightAdaptivePolicy): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextHeightAdaptivePolicy](#enum-textheightadaptivepolicy)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TextHeightAdaptivePolicy)

```cangjie
public operator func ==(other: TextHeightAdaptivePolicy): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextHeightAdaptivePolicy](#enum-textheightadaptivepolicy)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum TextOverflow

```cangjie
public enum TextOverflow <: Equatable<TextOverflow> {
    | Clip
    | Ellipsis
    | None
    | ...
}
```

**功能：** 文本超长时的显示方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TextOverflow>

### Clip

```cangjie
Clip
```

**功能：** 文本超长时按最大行截断显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Ellipsis

```cangjie
Ellipsis
```

**功能：** 文本超长时显示不下的文本用省略号代替。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 文本超长时按最大行截断显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TextOverflow)

```cangjie
public operator func !=(other: TextOverflow): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextOverflow](#enum-textoverflow)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TextOverflow)

```cangjie
public operator func ==(other: TextOverflow): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TextOverflow](#enum-textoverflow)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ThemeColorMode

```cangjie
public enum ThemeColorMode <: Equatable<ThemeColorMode> {
    | System
    | Light
    | Dark
    | ...
}
```

**功能：** 主题颜色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ThemeColorMode>

### Dark

```cangjie
Dark
```

**功能：** 固定使用深色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Light

```cangjie
Light
```

**功能：** 固定使用浅色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### System

```cangjie
System
```

**功能：** 跟随系统深浅色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ThemeColorMode)

```cangjie
public operator func !=(other: ThemeColorMode): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ThemeColorMode](#enum-themecolormode)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ThemeColorMode)

```cangjie
public operator func ==(other: ThemeColorMode): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ThemeColorMode](#enum-themecolormode)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum TitleHeight

```cangjie
public enum TitleHeight <: Equatable<TitleHeight> {
    | MainOnly
    | MainWithSub
    | ...
}
```

**功能：** 设置标题栏高度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TitleHeight>

### MainOnly

```cangjie
MainOnly
```

**功能：** 只有主标题时标题栏的推荐高度（56vp）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### MainWithSub

```cangjie
MainWithSub
```

**功能：** 同时有主标题和副标题时标题栏的推荐高度（82vp）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TitleHeight)

```cangjie
public operator func !=(other: TitleHeight): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TitleHeight](#enum-titleheight)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TitleHeight)

```cangjie
public operator func ==(other: TitleHeight): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TitleHeight](#enum-titleheight)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

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

**功能：** 触摸触发方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TouchType>

### Cancel

```cangjie
Cancel
```

**功能：** 触摸事件取消时触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Down

```cangjie
Down
```

**功能：** 手指按下时触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Move

```cangjie
Move
```

**功能：** 手指按压态在屏幕上移动时触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Unknown

```cangjie
Unknown
```

**功能：** 未知触摸操作时触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Up

```cangjie
Up
```

**功能：** 手指抬起时触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TouchType)

```cangjie
public operator func !=(other: TouchType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TouchType](#enum-touchtype)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回 true，否则返回 false|

### func ==(TouchType)

```cangjie
public operator func ==(other: TouchType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TouchType](#enum-touchtype)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## enum VerticalAlign

```cangjie
public enum VerticalAlign <: Equatable<VerticalAlign> {
    | Top
    | Center
    | Bottom
    | ...
}
```

**功能：** 垂直方向上对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<VerticalAlign>

### Bottom

```cangjie
Bottom
```

**功能：** 底部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Center

```cangjie
Center
```

**功能：** 居中对齐，默认对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 顶部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(VerticalAlign)

```cangjie
public operator func !=(other: VerticalAlign): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[VerticalAlign](#enum-verticalalign)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

### func ==(VerticalAlign)

```cangjie
public operator func ==(other: VerticalAlign): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[VerticalAlign](#enum-verticalalign)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## enum Visibility

```cangjie
public enum Visibility <: Equatable<Visibility> {
    | Visible
    | Hidden
    | None
    | ...
}
```

**功能：** 当前组件显示或隐藏。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<Visibility>

### Hidden

```cangjie
Hidden
```

**功能：** 隐藏，但参与布局进行占位。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 隐藏，但不参与布局，不进行占位。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Visible

```cangjie
Visible
```

**功能：** 显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(Visibility)

```cangjie
public operator func !=(other: Visibility): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Visibility](#enum-visibility)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

### func ==(Visibility)

```cangjie
public operator func ==(other: Visibility): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Visibility](#enum-visibility)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## enum WebDarkMode

```cangjie
public enum WebDarkMode <: Equatable<WebDarkMode> {
    | Off
    | On
    | Auto
    | ...
}
```

**功能：** Web的深色模式，默认关闭。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<WebDarkMode>

### Auto

```cangjie
Auto
```

**功能：** Web的深色模式为跟随系统。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Off

```cangjie
Off
```

**功能：** Web的深色模式为关闭。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### On

```cangjie
On
```

**功能：** Web的深色模式为开启。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(WebDarkMode)

```cangjie
public operator func !=(other: WebDarkMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WebDarkMode](#enum-webdarkmode)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

### func ==(WebDarkMode)

```cangjie
public operator func ==(other: WebDarkMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WebDarkMode](#enum-webdarkmode)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## enum WordBreak

```cangjie
public enum WordBreak <: Equatable<WordBreak> {
    | Normal
    | BreakAll
    | BreakWord
    | ...
}
```

**功能：** 设置文本断行规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<WordBreak>

### BreakAll

```cangjie
BreakAll
```

**功能：** 对于Non-CJK的文本，可在任意2个字符间断行。对于CJK与NORMAL效果一致。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### BreakWord

```cangjie
BreakWord
```

**功能：** 与BREAKALL相同，对于Non-CJK的文本可在任意2个字符间断行，一行文本中有断行破发点（如空白符）时，优先按破发点换行，保障单词优先完整显示。若整一行文本均无断行破发点时，则在任意2个字符间断行。对于CJK与NORMAL效果一致。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** CJK(中文、日文、韩文)文本可以在任意2个字符间断行，而Non-CJK文本（如英文等）只能在空白符处断行。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(WordBreak)

```cangjie
public operator func !=(other: WordBreak): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WordBreak](#enum-wordbreak)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

### func ==(WordBreak)

```cangjie
public operator func ==(other: WordBreak): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WordBreak](#enum-wordbreak)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## type CustomBuilder

```cangjie
public type CustomBuilder = () -> Unit
```

**功能：** [CustomBuilder](#type-custombuilder)是() -> Unit类型的别名。

## type TransitionFinishCallback

```cangjie
public type TransitionFinishCallback = (Bool) -> Unit
```

**功能：** [TransitionFinishCallback](#type-transitionfinishcallback)是(Bool) -> Unit类型的别名。

