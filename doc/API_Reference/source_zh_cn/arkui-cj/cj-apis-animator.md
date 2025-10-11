# ohos.animator（动画）

本模块提供组件动画效果，包括定义动画、启动动画和以相反的顺序播放动画等。

## 导入模块

```cangjie
import kit.UIKit.*
```

## class AnimatorOptions

```cangjie
public class AnimatorOptions {
    public var duration: Int32
    public var easing: String
    public var delay: Int32
    public var fill: AnimatorFill
    public var direction: AnimatorDirection
    public var iterations: Int32
    public var begin: Float64
    public var end: Float64
    public init(
        duration!: Int32,
        easing!: String,
        delay!: Int32,
        fill!: AnimatorFill,
        direction!: AnimatorDirection,
        iterations!: Int32,
        begin!: Float64,
        end!: Float64
    )
}
```

**功能：** 动画选项类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var begin

```cangjie
public var begin: Float64
```

**功能：** 设置动画插值起点。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var delay

```cangjie
public var delay: Int32
```

**功能：** 设置动画延时播放时长。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var direction

```cangjie
public var direction: AnimatorDirection
```

**功能：** 设置动画播放模式。

**类型：** [AnimatorDirection](#enum-animatordirection)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var duration

```cangjie
public var duration: Int32
```

**功能：** 设置动画播放的时长。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var easing

```cangjie
public var easing: String
```

**功能：** 设置动画插值曲线。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var end

```cangjie
public var end: Float64
```

**功能：** 设置动画插值终点。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var fill

```cangjie
public var fill: AnimatorFill
```

**功能：** 设置动画执行后是否恢复到初始状态。

**类型：** [AnimatorFill](#enum-animatorfill)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var iterations

```cangjie
public var iterations: Int32
```

**功能：** 设置动画播放次数。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Int32, String, Int32, AnimatorFill, AnimatorDirection, Int32, Float64, Float64)

```cangjie
public init(
    duration!: Int32,
    easing!: String,
    delay!: Int32,
    fill!: AnimatorFill,
    direction!: AnimatorDirection,
    iterations!: Int32,
    begin!: Float64,
    end!: Float64
)
```

**功能：** 创建动画选项对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|duration|Int32|否|0| **命名参数。** 动画播放的时长，单位毫秒。<br>取值范围：[0, +∞)。|
|easing|String|否|"ease"| **命名参数。** 动画插值曲线。<br>"linear"：动画线性变化。<br>"ease"：动画开始和结束时的速度较慢，cubic-bezier(0.25、0.1、0.25、1.0)。<br>"ease-in"：动画播放速度先慢后快，cubic-bezier(0.42, 0.0, 1.0, 1.0)。<br>"ease-out"：动画播放速度先快后慢，cubic-bezier(0.0, 0.0, 0.58, 1.0)。<br>"ease-in-out"：动画播放速度先加速后减速，cubic-bezier(0.42, 0.0, 0.58, 1.0)。<br>"fast-out-slow-in"：标准曲线，cubic-bezier(0.4，0.0，0.2，1.0)。<br>"linear-out-slow-in"：减速曲线，cubic-bezier(0.0，0.0，0.2，1.0)。<br>"fast-out-linear-in"：加速曲线，cubic-bezier(0.4, 0.0, 1.0, 1.0)。<br>"friction"：阻尼曲线，cubic-bezier(0.2, 0.0, 0.2, 1.0)。<br>"extreme-deceleration"：急缓曲线，cubic-bezier(0.0, 0.0, 0.0, 1.0)。<br>"rhythm"：节奏曲线，cubic-bezier(0.7, 0.0, 0.2, 1.0)。<br>"sharp"：锐利曲线，cubic-bezier(0.33, 0.0, 0.67, 1.0)。<br>"smooth"：平滑曲线，cubic-bezier(0.4, 0.0, 0.4, 1.0)。<br>"cubic-bezier(x1,y1,x2,y2)"：三次贝塞尔曲线，x1、x2的值必须处于0-1之间。例如"cubic-bezier(0.42,0.0,0.58,1.0)"。<br>"steps(number,step-position)"：阶梯曲线，number必须设置，为正整数，step-position参数可选，支持设置start或end，默认值为end。例如"steps(3,start)"。<br>"interpolating-spring(velocity,mass,stiffness,damping)"：插值弹簧曲线。velocity、mass、stiffness、damping都是数值类型，且mass、stiffness、damping参数均应该大于0，具体参数含义参考[插值弹簧曲线](./cj-apis-curves.md#static-func-interpolatingspringfloat32-float32-float32-float32)。使用interpolating-spring时，duration不生效，由弹簧参数决定；fill、direction、iterations设置无效，fill固定设置为"forwards"，direction固定设置为"normal"，iterations固定设置为1，且对animator的[reverse](#reverse)函数调用无效。即animator使用interpolating-spring时只能正向播放1次。|
|delay|Int32|否|0| **命名参数。** 动画延时播放时长，单位毫秒，设置为0时，表示不延时。设置为负数时动画提前播放，如果提前播放的时长大于动画总时长，动画直接过渡到终点。|
|fill|[AnimatorFill](#enum-animatorfill)|否|AnimatorFill.None| **命名参数。** 动画执行后是否恢复到初始状态，动画执行后，动画结束时的状态（在最后一个关键帧中定义）将保留。|
|direction|[AnimatorDirection](#enum-animatordirection)|否|AnimatorDirection.Normal| **命名参数。** 动画播放模式。|
|iterations|Int32|否|0| **命名参数。** 动画播放次数。设置为0时不播放，设置为-1时无限次播放,设置大于0时为播放次数。<br />**说明：** <br />设置为除-1外其他负数视为无效取值，无效取值动画默认播放1次。|
|begin|Float64|否|0.0| **命名参数。** 动画插值起点。|
|end|Float64|否|1.0| **命名参数。** 动画插值终点。|

## class AnimatorResult

```cangjie
public class AnimatorResult {}
```

**功能：** 定义动画的初始化类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop onCancel

```cangjie
public mut prop onCancel: () -> Unit
```

**功能：** 动画被取消时回调。即将废弃，推荐使用onCancel。

**类型：** () -> Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop onFinish

```cangjie
public mut prop onFinish: () -> Unit
```

**功能：** 动画完成时回调。即将废弃，推荐使用onFinish。

**类型：** () -> Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop onFrame

```cangjie
public mut prop onFrame: (Float64) -> Unit
```

**功能：** 接收到帧时回调。即将废弃，推荐使用onFrame。

**类型：** (Float64) -> Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop onRepeat

```cangjie
public mut prop onRepeat: () -> Unit
```

**功能：** 动画重复时回调。即将废弃，推荐使用onRepeat。

**类型：** () -> Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func cancel()

```cangjie
public func cancel(): Unit
```

**功能：** 取消动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func finish()

```cangjie
public func finish(): Unit
```

**功能：** 结束动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func pause()

```cangjie
public func pause(): Unit
```

**功能：** 暂停动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func play()

```cangjie
public func play(): Unit
```

**功能：** 启动动画。动画会保留上一次的播放状态，比如播放状态设置reverse后，再次播放会保留reverse的播放状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func reset(AnimatorOptions)

```cangjie
public func reset(options: AnimatorOptions): Unit
```

**功能：** 更新当前动画器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[AnimatorOptions](#class-animatoroptions)|是|-|定义动画选项。|

### func reverse()

```cangjie
public func reverse(): Unit
```

**功能：** 以相反的顺序播放动画。使用interpolating-spring曲线时此接口无效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func setExpectedFrameRateRange(ExpectedFrameRateRange)

```cangjie
public func setExpectedFrameRateRange(rateRange: ExpectedFrameRateRange): Unit
```

**功能：** 设置期望的帧率范围。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rateRange|[ExpectedFrameRateRange](./cj-animation-animateto.md#class-expectedframeraterange)|是|-|设置期望的帧率范围。要求满足约束：0 < ExpectedFrameRateRange.min <= ExpectedFrameRateRange.expected <= ExpectedFrameRateRange.max，如不满足要求，按照默认值 ExpectedFrameRateRange(min:60, max:120, expected:60) 传参。|

## enum AnimatorDirection

```cangjie
public enum AnimatorDirection <: Equatable<AnimatorDirection> {
    | Normal
    | Reverse
    | Alternate
    | AlternateReverse
    | ...
}
```

**功能：** 动画播放模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Alternate

```cangjie
Alternate
```

**功能：** 设置动画交替循环播放，奇数次正向播放，偶数次反向播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### AlternateReverse

```cangjie
AlternateReverse
```

**功能：** 设置动画反向循环播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** 设置动画正向循环播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Reverse

```cangjie
Reverse
```

**功能：** 设置动画反向循环播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(AnimatorDirection)

```cangjie
public operator func !=(other: AnimatorDirection): Bool
```

**功能：** 比较两个AnimatorDirection值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AnimatorDirection](#enum-animatordirection)|是|-|**命名参数。** 动画播放模式。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|比较两个AnimatorDirection值是否不相等。|

### func ==(AnimatorDirection)

```cangjie
public operator func ==(other: AnimatorDirection): Bool
```

**功能：** 比较两个AnimatorDirection值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AnimatorDirection](#enum-animatordirection)|是|-|**命名参数。** 动画播放模式。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|比较两个AnimatorDirection值是否相等。|

## enum AnimatorFill

```cangjie
public enum AnimatorFill <: Equatable<AnimatorFill> {
    | None
    | Forwards
    | Backwards
    | Both
    | ...
}
```

**功能：** 设置动画执行后是否恢复到初始状态，动画执行后，动画结束时的状态（在最后一个关键帧中定义）将保留。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Backwards

```cangjie
Backwards
```

**功能：** 设置动画将在animation-delay期间应用第一个关键帧中定义的值。当animation-direction为Normal或Alternate时应用from关键帧中的值，当animation-direction为Reverse或AlternateReverse时应用to关键帧中的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Both

```cangjie
Both
```

**功能：** 设置动画将遵循forwards和backwards的规则，从而在两个方向上扩展动画属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Forwards

```cangjie
Forwards
```

**功能：** 设置在动画结束后，目标将保留动画结束时的状态（在最后一个关键帧中定义）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 设置在动画执行之前和之后都不会应用任何样式到目标上。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(AnimatorFill)

```cangjie
public operator func !=(other: AnimatorFill): Bool
```

**功能：** 比较两个AnimatorFill值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AnimatorFill](#enum-animatorfill)|是|-|**命名参数。** 动画执行后是否恢复到初始状态，动画执行后，动画结束时的状态（在最后一个关键帧中定义）将保留。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|比较两个AnimatorFill值是否不相等。|

### func ==(AnimatorFill)

```cangjie
public operator func ==(other: AnimatorFill): Bool
```

**功能：** 比较两个AnimatorFill值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AnimatorFill](#enum-animatorfill)|是|-|**命名参数。** 动画执行后是否恢复到初始状态，动画执行后，动画结束时的状态（在最后一个关键帧中定义）将保留。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|比较两个AnimatorFill值是否相等。|
