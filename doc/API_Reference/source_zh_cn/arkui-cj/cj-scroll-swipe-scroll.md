# Scroll

可滚动的容器组件，当子组件的布局尺寸超过父组件的尺寸时，内容可以滚动。

> **说明：**
>
> - 该组件嵌套List子组件滚动时，若List不设置宽高，则默认全部加载，在对性能有要求的场景下建议指定List的宽高。
> - 该组件滚动的前提是主轴方向大小小于内容大小。
> - Scroll组件[通用属性clip](./cj-universal-attribute-shapclip.md#func-clipbool)的默认值为true。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

的布局尺寸超过父组件的尺寸时，内容可以滚动。

> **说明：**
>
> - 该组件嵌套List子组件滚动时，若List不设置宽高，则默认全部加载，在对性能有要求的场景下建议指定List的宽高。
> - 该组件滚动的前提是主轴方向大小小于内容大小。
> - Scroll组件[通用属性clip](./cj-universal-attribute-shapclip.md#func-clipbool)的默认值为true。

## 创建组件

### init()

```cangjie
public init()
```

**功能：** 创建一个Scroll容器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**功能：** 创建一个包含子组件的Scroll容器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|child|()->Unit|是|-|声明容器内的子组件。|

### init(Scroller, () -> Unit)

```cangjie
public init(scroller: Scroller, child: () -> Unit)
```

**功能：** 创建一个包含子组件的Scroll容器，并绑定一个滚动条控制器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scroller|[Scroller](#class-scroller)|是|-|滚动条控制器。|
|child|()->Unit|是|-|声明容器内的子组件。|

## 组件属性

### func scrollable(ScrollDirection)

```cangjie
public func scrollable(scrollDirection: ScrollDirection): This
```

**功能：** 设置滚动方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scrollDirection|[ScrollDirection](./cj-common-types.md#enum-scrolldirection)|是|-|滚动方向。<br>初始值：ScrollDirection.Vertical。|

## 组件事件

### func onDidScroll(ScrollOnScrollCallback)

```cangjie
public func onDidScroll(callback: ScrollOnScrollCallback): This
```

**功能：** 滚动事件回调，Scroll滚动时触发。

返回当前帧滚动的偏移量和当前滚动状态。

触发该事件的条件 ：

1. 滚动组件触发滚动时触发，支持键鼠操作和其他触发滚动的输入设置。

2. 通过滚动控制器API接口调用。

3. 越界回弹。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|ScrollOnScrollCallback|是|-|回调函数，Scroll滚动时触发。<br>参数一：每帧滚动时水平方向的偏移量，Scroll中的内容向左滚动时偏移量为正，向右滚动时偏移量为负。单位vp。<br>参数二：每帧滚动时竖直方向的偏移量，Scroll中的内容向上滚动时偏移量为正，向下滚动时偏移量为负。单位vp。<br>参数三：当前滚动状态。|

### func onScrollEdge(OnScrollEdgeCallback)

```cangjie
public func onScrollEdge(event: OnScrollEdgeCallback): This
```

**功能：** 滚动到边缘时触发该事件。

触发该事件的条件 ：

1. 滚动组件滚动到边缘时触发，支持键鼠操作和其他触发滚动的输入设置。

2. 通过滚动控制器API接口调用。

3. 越界回弹。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|OnScrollEdgeCallback|是|-|滚动到的边缘位置。<br>当Scroll设置为水平方向滚动时，上报Edge.Center表示水平方向起始位置，上报Edge.Baseline表示水平方向末尾位置。由于Edge.Center和Edge.Baseline枚举值已经废弃，推荐使用onReachStart、onReachEnd事件监听是否滚动到边界。|

### func onScrollFrameBegin(OnScrollFrameBeginCallback)

```cangjie
public func onScrollFrameBegin(event: OnScrollFrameBeginCallback): This
```

**功能：** 每帧开始滚动时触发该事件，事件参数传入即将发生的滚动量，事件处理函数中可根据应用场景计算实际需要的滚动量并作为事件处理函数的返回值返回，Scroll将按照返回值的实际滚动量进行滚动。

支持offsetRemain为负值。

若通过onScrollFrameBegin事件和scrollBy方法实现容器嵌套滚动，需设置子滚动节点的EdgeEffect为None。如Scroll嵌套List滚动时，List组件的edgeEffect属性需设置为EdgeEffect.None。

触发该事件的条件：

1. 滚动组件触发滚动时触发，包括键鼠操作和其他触发滚动的输入设置。

2. 调用控制器接口时不触发。

3. 越界回弹不触发。

4. 拖动滚动条不触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|OnScrollFrameBeginCallback|是|-|每帧滚动开始回调函数。|

### func onWillScroll((Float64,Float64,ScrollState,ScrollSource) -> OffsetResult)

```cangjie
public func onWillScroll(handler: (Float64, Float64, ScrollState, ScrollSource) -> OffsetResult): This
```

**功能：** 滚动事件回调，Scroll滚动前触发该事件。

回调当前帧将要滚动的偏移量和当前滚动状态和滚动操作来源，其中回调的偏移量为计算得到的将要滚动的偏移量值，并非最终实际滚动偏移。可以通过该回调返回值指定Scroll将要滚动的偏移。

触发该事件的条件 ：

1. 滚动组件触发滚动时触发，支持键鼠操作和其他触发滚动的输入设置。

2. 通过滚动控制器API接口调用。

3. 越界回弹。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|handler|(Float64,Float64,[ScrollState](./cj-common-types.md#enum-scrollstate),[ScrollSource](./cj-common-types.md#enum-scrollsource))->[OffsetResult](#class-offsetresult)|是|-|回调函数，Scroll滚动前触发。<br>参数一：每帧滚动时水平方向的偏移量，Scroll中的内容向左滚动时偏移量为正，向右滚动时偏移量为负。单位vp。<br>参数二：每帧滚动时竖直方向的偏移量，Scroll中的内容向上滚动时偏移量为正，向下滚动时偏移量为负。单位vp。<br>参数三：当前滚动状态。<br>参数四：当前滚动操作的来源。<br>返回值：滑动偏移量对象。返回OffsetResult时按照开发者指定的偏移量滚动。|

### func onWillScroll((Float64,Float64,ScrollState,ScrollSource) -> Unit)

```cangjie
public func onWillScroll(handler: (Float64, Float64, ScrollState, ScrollSource) -> Unit): This
```

**功能：** 滚动事件回调，Scroll滚动前触发该事件。

回调当前帧将要滚动的偏移量和当前滚动状态和滚动操作来源，其中回调的偏移量为计算得到的将要滚动的偏移量值，并非最终实际滚动偏移。可以通过该回调返回值指定Scroll将要滚动的偏移。

触发该事件的条件 ：

1. 滚动组件触发滚动时触发，支持键鼠操作和其他触发滚动的输入设置。

2. 通过滚动控制器API接口调用。

3. 越界回弹。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|handler|(Float64,Float64,[ScrollState](./cj-common-types.md#enum-scrollstate),[ScrollSource](./cj-common-types.md#enum-scrollsource))->Unit|是|-|回调函数，Scroll滚动前触发。<br>参数一：每帧滚动时水平方向的偏移量，Scroll中的内容向左滚动时偏移量为正，向右滚动时偏移量为负。单位vp。<br>参数二：每帧滚动时竖直方向的偏移量，Scroll中的内容向上滚动时偏移量为正，向下滚动时偏移量为负。单位vp。<br>参数三：当前滚动状态。<br>参数四：当前滚动操作的来源。|

## 基础类型定义

### class FadingEdgeOptions

```cangjie
public class FadingEdgeOptions {
    public var fadingEdgeLength: Length
    public init(fadingEdgeLength!: Length = 32.vp)
}
```

**功能：** fadingEdge属性边缘渐隐参数对象

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fadingEdgeLength

```cangjie
public var fadingEdgeLength: Length
```

**功能：** 设置边缘渐隐长度。如果设置小于0的值则取默认值，默认长度为32vp。
如果设置的长度超过容器高度的一半时，渐隐长度取容器高度的一半。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Length)

```cangjie
public init(fadingEdgeLength!: Length = 32.vp)
```

**功能：** 创建FadingEdgeOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fadingEdgeLength|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|32.vp|设置边缘渐隐长度。如果设置小于0的值则取默认值，默认长度为32vp。如果设置的长度超过容器高度的一半时，渐隐长度取容器高度的一半。|

### class NestedScrollOptions

```cangjie
public class NestedScrollOptions {
    public NestedScrollOptions(
        public var scrollForward: NestedScrollMode,
        public var scrollBackward: NestedScrollMode,
        public init(scrollForward: NestedScrollMode, scrollBackward: NestedScrollMode)
    )
}
```

**功能：** nestedScroll属性参数对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var scrollBackward

```cangjie
public var scrollBackward: NestedScrollMode
```

**功能：** 滚动组件往起始端滚动时的嵌套滚动选项。

**类型：** [NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var scrollForward

```cangjie
public var scrollForward: NestedScrollMode
```

**功能：** 滚动组件往末尾端滚动时的嵌套滚动选项。

**类型：** [NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(NestedScrollMode, NestedScrollMode)

```cangjie
public init(scrollForward: NestedScrollMode, scrollBackward: NestedScrollMode)
```

**功能：** 构造一个NestedScrollOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scrollForward|NestedScrollMode|是|-|滚动组件往末尾端滚动时的嵌套滚动选项|
|scrollBackward|NestedScrollMode|是|-|滚动组件往起始端滚动时的嵌套滚动选项。|

#### NestedScrollOptions(NestedScrollMode, NestedScrollMode)

```cangjie
public class NestedScrollOptions(
    public var scrollForward: NestedScrollMode,
    public var scrollBackward: NestedScrollMode
)
```

**功能：** 嵌套滚动选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scrollForward|[NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode)|是|-|滚动组件往末尾端滚动时的嵌套滚动选项。|
|scrollBackward|[NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode)|是|-|滚动组件往起始端滚动时的嵌套滚动选项。|

### class OffsetResult

```cangjie
public class OffsetResult {
    public var xOffset: Float64
    public var yOffset: Float64
    public init(xOffset: Float64, yOffset: Float64)
}
```

**功能：** 滑动偏移量对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var xOffset

```cangjie
public var xOffset: Float64
```

**功能：** 水平滑动偏移。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var yOffset

```cangjie
public var yOffset: Float64
```

**功能：** 竖直滑动偏移。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Float64, Float64)

```cangjie
public init(xOffset: Float64, yOffset: Float64)
```

**功能：** 构造一个OffsetResult对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|xOffset|Float64|是|-|水平滑动偏移。单位为vp。|
|yOffset|Float64|是|-|竖直滑动偏移。单位为vp。|

### class RectResult

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

**功能：** 子组件的大小和相对于组件的位置。单位：vp。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var height

```cangjie
public var height: Float64
```

**功能：** 组件高度

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var width

```cangjie
public var width: Float64
```

**功能：** 组件宽度

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var x

```cangjie
public var x: Float64
```

**功能：** 水平偏移量

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var y

```cangjie
public var y: Float64
```

**功能：**     垂直偏移量

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Float64, Float64, Float64, Float64)

```cangjie
public init(
    x: Float64,
    y: Float64,
    width: Float64,
    height: Float64
)
```

**功能：** 构造一个RectResult对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|水平偏移量|
|y|Float64|是|-|垂直偏移量|
|width|Float64|是|-|组件宽度|
|height|Float64|是|-|组件高度|

### class ScrollAnimationOptions

```cangjie
public class ScrollAnimationOptions {
    public var duration: Float64
    public var curve: Curve
    public var canOverScroll: Bool
    public init(
        duration!: Float64 = 1000.0,
        curve!: Curve = Curve.Ease,
        canOverScroll!: Bool = false
    )
}
```

**功能：** 自定义滚动动效的参数选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var canOverScroll

```cangjie
public var canOverScroll: Bool
```

**功能：** 设置滚动是否可越界。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var curve

```cangjie
public var curve: Curve
```

**功能：** 设置滚动曲线。

**类型：** [Curve](./cj-common-types.md#enum-curve)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var duration

```cangjie
public var duration: Float64
```

**功能：** 设置滚动时长。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Float64, Curve, Bool)

```cangjie
public init(
    duration!: Float64 = 1000.0,
    curve!: Curve = Curve.Ease,
    canOverScroll!: Bool = false
)
```

**功能：** 构造一个ScrollAnimationOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|duration|Float64|否|1000.0|**命名参数。** 设置滚动时长。设置为小于0的值时，按默认值显示。|
|curve|[Curve](./cj-common-types.md#enum-curve)|否|Curve.Ease|**命名参数。** 设置滚动曲线。|
|canOverScroll|Bool|否|false|**命名参数。** 设置滚动是否可越界。<br>**说明：**<br>仅在设置为true，且组件的edgeEffect设置为EdgeEffect.Spring时，滚动能够越界，并在越界时启动回弹动画。|

### class ScrollEdgeOptions

```cangjie
public class ScrollEdgeOptions {
    public var velocity: Float32 = 0.0
    public init(velocity!: Float32 = 0.0)
}
```

**功能：** 滚动到边缘位置的参数选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var velocity

```cangjie
public var velocity: Float32 = 0.0
```

**功能：** 设置滚动到容器边缘的固定速度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**类型：** Float32

**读写能力：** 可读写


#### init(Float32)

```cangjie
public init(velocity!: Float32 = 0.0)
```

**功能：** 构造一个ScrollEdgeOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|velocity|Float32|否|0.0|设置滚动到容器边缘的固定速度。如果设置小于等于0的值，参数不生效。<br>默认值：0<br>单位： vp/s|

### class ScrollResult

```cangjie
public class ScrollResult {
    public var offsetRemain: Float64
    public init(offsetRemain!: Float64)
}
```

**功能：** OnWillScrollCallback返回值对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offsetRemain

```cangjie
public var offsetRemain: Float64
```

**功能：** 将要滑动偏移量

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Float64)

```cangjie
public init(offsetRemain!: Float64)
```

**功能：** 构造一个ScrollResult对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offsetRemain|Float64|是|-|将要滑动偏移量，单位vp。|

### class ScrollToIndexOptions

```cangjie
public class ScrollToIndexOptions {
    public var extraOffset: Length = 0.vp
    public init(extraOffset!: Length = 0.vp)
}
```

**功能：** 滑动到指定Index的参数选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var extraOffset

```cangjie
public var extraOffset: Length = 0.vp
```

**功能：** 滑动到指定Index的额外偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

#### init(Length)

```cangjie
public init(extraOffset!: Length = 0.vp)
```

**功能：**  构造一个ScrollToIndexOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|extraOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|滑动到指定Index的额外偏移量。如果值为正数，则向底部额外偏移；如果值为负数，则向顶部额外偏移。|

### class ScrollableBase

```cangjie
public abstract class ScrollableBase <: ContainerBase {}
```

**功能：** 描述滚动组件通用属性

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ContainerBase](./cj-ui-framework.md#containerbase)

#### func clipContent(ContentClipMode)

```cangjie
public func clipContent(clip: ContentClipMode): This
```

**功能：**设置滚动容器的内容层裁剪区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|clip|[ContentClipMode](#enum-contentclipmode)|是|-|Grid、Scroll的默认值为ContentClipMode.BOUNDARY，List、WaterFlow的默认值为ContentClipMode.CONTENT_ONLY。裁剪只针对滚动容器的内容，即其子节点，背景不受影响。通过RectShape传入自定义矩形区域时仅支持设置宽高和相对于组件左上角的[offset](./cj-universal-attribute-location.md#func-offsetlength-length)，不支持圆角。<br/>|

#### func clipContent(RectShape)

```cangjie
public func clipContent(clip: RectShape): This
```

**功能：**设置滚动容器的内容层裁剪区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|clip|RectShape|是|-|Grid、Scroll的默认值为ContentClipMode.BOUNDARY，List、WaterFlow的默认值为ContentClipMode.CONTENT_ONLY。裁剪只针对滚动容器的内容，即其子节点，背景不受影响。通过RectShape传入自定义矩形区域时仅支持设置宽高和相对于组件左上角的[offset](./cj-universal-attribute-location.md#func-offsetlength-length)，不支持圆角。<br/>|

#### func enableScrollInteraction(Bool)

```cangjie
public func enableScrollInteraction(value: Bool): This
```

**功能：** 设置是否支持滚动手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否支持滚动手势。设置为true时可以通过手指或者鼠标滚动，设置为false时无法通过手指或者鼠标滚动，但不影响控制器[Scroller](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-scroll.md#scroller)的滚动接口。<br/>|

#### func fadingEdge(Option\<Bool>)

```cangjie
public func fadingEdge(enabled: Option<Bool>): This
```

**功能：**设置是否开启边缘渐隐效果及设置边缘渐隐长度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|enabled|Option\<Bool>|是|-|fadingEdge生效时，会覆盖原组件的.overlay()属性。<br/>fadingEdge生效时，建议不在该组件上设置background相关属性，会影响渐隐的显示效果。<br/>fadingEdge生效时，组件会裁剪到边界，设置组件的clip属性为false不生效。<br/>设置为true时开启边缘渐隐效果，设置为false时不开启边缘渐隐效果。|

#### func fadingEdge(Option\<Bool>, FadingEdgeOptions)

```cangjie
public func fadingEdge(enabled: Option<Bool>, options: FadingEdgeOptions): This
```

**功能：**设置是否开启边缘渐隐效果及设置边缘渐隐长度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|enabled|Option\<Bool>|是|-|fadingEdge生效时，会覆盖原组件的.overlay()属性。<br/>fadingEdge生效时，建议不在该组件上设置background相关属性，会影响渐隐的显示效果。<br/>fadingEdge生效时，组件会裁剪到边界，设置组件的clip属性为false不生效。<br/>设置为true时开启边缘渐隐效果，设置为false时不开启边缘渐隐效果。|
|options|[FadingEdgeOptions](#class-fadingedgeoptions)|是|-|边缘渐隐参数对象。可以通过该对象定义边缘渐隐效果属性，比如设置渐隐长度。|

#### func flingSpeedLimit(Float64)

```cangjie
public func flingSpeedLimit(speedLimit: Float64): This
```

**功能：**限制跟手滑动结束后，Fling动效开始时的最大初始速度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|speedLimit|Float64|是|-|Fling动效开始时的最大初始速度。单位：vp/s<br/>取值范围：(0, +∞)，设置为小于等于0的值时，按默认值处理。|

#### func friction(Float64)

```cangjie
public func friction(value: Float64): This
```

**功能：** 设置摩擦系数，手动划动滚动区域时生效，仅影响惯性滚动过程，对惯性滚动过程中的链式效果有间接影响。设置为小于等于0的值时，按默认值处理。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|摩擦系数。默认值：非wearable设备为0.6，wearable设备为0.9。<br/>从API version 11开始，非wearable设备默认值为0.7。<br/>从API version 12开始，非wearable设备默认值为0.75。<br/>取值范围：(0, +∞)，设置为小于等于0的值时，按默认值处理。|

#### func friction(AppResource)

```cangjie
public func friction(value: AppResource): This
```

**功能：** 设置摩擦系数，手动划动滚动区域时生效，仅影响惯性滚动过程，对惯性滚动过程中的链式效果有间接影响。设置为小于等于0的值时，按默认值处理。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AppResource](../apis/LocalizationKit/cj-apis-resource.md#class-appresource)|是|-|摩擦系数。默认值：非wearable设备为0.6，wearable设备为0.9。<br/>从API version 11开始，非wearable设备默认值为0.7。<br/>从API version 12开始，非wearable设备默认值为0.75。<br/>取值范围：(0, +∞)，设置为小于等于0的值时，按默认值处理。|

#### func nestedScroll(NestedScrollOptions)

```cangjie
public func nestedScroll(value: NestedScrollOptions): This
```

**功能：**设置前后两个方向的嵌套滚动模式，实现与父组件的滚动联动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[NestedScrollOptions](#class-nestedscrolloptions)|是|-|嵌套滚动选项。|

#### func onDidScroll(OnScrollCallBack)

```cangjie
public func onDidScroll(handler: OnScrollCallBack): This
```

**功能：** 滚动组件滑动时触发，返回当前帧滑动的偏移量和当前滑动状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|handler|OnScrollCallBack|是|-|滚动组件滑动时触发的回调。|

#### func onReachEnd(() -> Unit)

```cangjie
public func onReachEnd(event: () -> Unit): This
```

**功能：**滚动组件到达末尾位置时触发。

滚动组件边缘效果为弹簧效果时，划动经过末尾位置时触发一次，回弹回末尾位置时再触发一次。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|滚动组件到达末尾位置时的回调。|

#### func onReachStart(() -> Unit)

```cangjie
public func onReachStart(event: () -> Unit): This
```

**功能：**滚动组件到达起始位置时触发。

滚动组件初始化时会触发一次，滚动到起始位置时触发一次。边缘效果为弹簧效果时，划动经过起始位置时触发一次，回弹回起始位置时再触发一次

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|滚动组件到达起始位置时的回调。|

#### func onScrollStart(() -> Unit)

```cangjie
public func onScrollStart(event: () -> Unit): This
```

**功能：**滚动开始时触发。手指拖动滚动组件或拖动滚动组件的滚动条触发的滚动开始时，会触发该事件。使用[Scroller](#class-scroller)滚动控制器触发的带动画的滚动，动画开始时会触发该事件。

触发该事件的条件：

1、滚动组件开始滚动时触发，支持键鼠操作等其他触发滚动的输入设置。

2、通过滚动控制器API接口调用后开始，带过渡动效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|滚动开始时的回调。|

#### func onScrollStop(() -> Unit)

```cangjie
public func onScrollStop(event: () -> Unit): This
```

**功能：**滚动停止时触发。手拖动滚动组件或拖动滚动组件的滚动条触发的滚动，手离开屏幕并且滚动停止时会触发该事件。使用[Scroller](#class-scroller)滚动控制器触发的带动画的滚动，动画停止时会触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|滚动停止时的回调。|

#### func onWillScroll(Option\<(Float64,ScrollState,ScrollSource) -> ScrollResult>)

```cangjie
public func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): This
```

**功能：**滚动事件回调，滚动组件滚动前触发。

回调当前帧将要滚动的偏移量和当前滚动状态和滚动操作来源，其中回调的偏移量为计算得到的将要滚动的偏移量值，并非最终实际滚动偏移。可以通过该回调返回值指定滚动组件将要滚动的偏移。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|handler|Option\<(Float64,[ScrollState](./cj-common-types.md#enum-scrollstate),[ScrollSource](./cj-common-types.md#enum-scrollsource))->[ScrollResult](#class-scrollresult)>|是|-|滚动组件滑动前触发的回调。|

#### func onWillScroll(Option\<(Float64,ScrollState,ScrollSource) -> Unit>)

```cangjie
public func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): This
```

**功能：**滚动事件回调，滚动组件滚动前触发。

回调当前帧将要滚动的偏移量和当前滚动状态和滚动操作来源，其中回调的偏移量为计算得到的将要滚动的偏移量值，并非最终实际滚动偏移。可以通过该回调返回值指定滚动组件将要滚动的偏移。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|handler|Option\<(Float64,[ScrollState](./cj-common-types.md#enum-scrollstate),[ScrollSource](./cj-common-types.md#enum-scrollsource))->Unit>|是|-|滚动组件滑动前触发的回调。|

#### func scrollBar(BarState)

```cangjie
public func scrollBar(barState: BarState): This
```

**功能：**设置滚动条状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|barState|[BarState](./cj-common-types.md#enum-barstate)|是|-|滚动条状态。List、Grid、Scroll组件默认BarState.Auto，WaterFlow组件默认BarState.Off。|

#### func scrollBarColor(ResourceColor)

```cangjie
public func scrollBarColor(color: ResourceColor): This
```

**功能：**设置滚动条的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|滚动条的颜色。<br/>默认值：‘#182431’（40%不透明度）<br/>number为HEX格式颜色，支持rgb或者argb，示例：0xffffff。string为rgb或者argb格式颜色，示例：‘#ffffff’。|

#### func scrollBarWidth(Length)

```cangjie
public func scrollBarWidth(value: Length): This
```

**功能：**设置滚动条的宽度，不支持百分比设置。宽度设置后，滚动条正常状态和按压状态宽度均为滚动条的宽度值。如果滚动条的宽度超过滚动组件主轴方向的高度，则滚动条的宽度会变为默认值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|滚动条的宽度。默认值：4<br/>单位：vp<br/>取值范围：设置为小于0的值时，按默认值处理。设置为0时，不显示滚动条。|

### class Scroller

```cangjie
public class Scroller {
    public init()
}
```

**功能：** 可滚动容器组件的控制器，可以将此组件绑定至容器组件，然后通过它控制容器组件的滚动，同一个控制器不可以控制多个容器组件，目前支持绑定到List、Scroll、ScrollBar、Grid、WaterFlow上。

> **说明：**
>
> 1、Scroller控制器与滚动容器组件的绑定发生在组件创建阶段。
>
> 2、Scroller控制器与滚动容器组件绑定后才可以正常调用Scroller方法，否则根据调用接口不同会不生效或者抛异常。
>
> 3、以[aboutToAppear](cj-universal-attribute-menu.md#func-abouttoappear)为例，aboutToAppear在创建自定义组件的新实例后，在执行其build()方法之前执行。因此如果滚动组件在自定义组件build内，在该自定义组件aboutToAppear执行时，内部滚动组件还没有创建，是不能正常调用上述Scroller方法的。
>
> 4、以[onAppear](cj-ui-framework.md#func-Onappear---unit)为例，组件挂载显示后触发此回调。因此在滚动组件的onAppear回调执行时，滚动组件已经创建并已经和Scroller绑定成功，是可以正常调用Scroller方法的。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init()

```cangjie
public init()
```

**功能：** 构造一个Scroller对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func currentOffset()

```cangjie
public func currentOffset(): OffsetResult
```

**功能：**获取当前的滚动偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[OffsetResult](#class-offsetresult)|返回当前的滚动偏移量。<br/>**说明：**<br/>当scroller控制器未绑定容器组件或者容器组件被异常释放时，currentOffset的返回值为空。|

#### func fling(Float64)

```cangjie
public func fling(velocity: Float64): Unit
```

**功能：**滚动类组件开启按传入的初始速度进行惯性滚动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|velocity|Float64|是|-|velocity值设置为0，视为异常值，本次滚动不生效。如果值为正数，则向顶部滚动；如果值为负数，则向底部滚动。<br/>取值范围：(-∞, +∞)惯性滚动的初始速度值。单位：vp/s|

#### func getItemIndex(Float64, Float64)

```cangjie
public func getItemIndex(x: Float64, y: Float64): Int32
```

**功能：**通过坐标获取子组件的索引。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|x轴坐标，单位为vp。|
|y|Float64|是|-|y轴坐标，单位为vp。|

**说明：**

- 非法值返回的索引为-1。

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回子组件的索引，单位：vp。|

#### func getItemRect(Int32)

```cangjie
public func getItemRect(index: Int32): RectResult
```

**功能：**获取子组件的大小及相对容器组件的位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int32|是|-|子组件的索引值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RectResult](#class-rectresult)|子组件的大小和相对于组件的位置。<br/>单位：vp。|

#### func isAtEnd()

```cangjie
public func isAtEnd(): Bool
```

**功能：**查询组件是否滚动到底部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true表示组件已经滚动到底部，false表示组件还没滚动到底部。|

#### func scrollBy(Length, Length)

```cangjie
public func scrollBy(xOffset!: Length, yOffset!: Length): Unit
```

**功能：**滑动指定距离。

**说明：**

- 支持Scroll、List、Grid、WaterFlow组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|xOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|水平方向滚动距离，不支持百分比形式。<br/>取值范围：(-∞, +∞)|
|yOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|竖直方向滚动距离，不支持百分比形式。 取值范围：(-∞, +∞)|

#### func scrollEdge(Edge)

```cangjie
public func scrollEdge(value: Edge): Unit
```

**功能：** 滚动到容器边缘，不区分滚动轴方向，Edge.Top和Edge.Start表现相同，Edge.Bottom和Edge.End表现相同。 Scroll组件默认有动画，Grid、List、WaterFlow组件默认无动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Edge](./cj-common-types.md#enum-edge)|是|-| 滚动到的边缘位置。 |

#### func scrollEdge(Edge, ScrollEdgeOptions)

```cangjie
public func scrollEdge(value: Edge, options: ScrollEdgeOptions): Unit
```

**功能：** 滚动到容器边缘，不区分滚动轴方向，Edge.Top和Edge.Start表现相同，Edge.Bottom和Edge.End表现相同。 Scroll组件默认有动画，Grid、List、WaterFlow组件默认无动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Edge](./cj-common-types.md#enum-edge)|是|-|滚动到的边缘位置。|
|options|[ScrollEdgeOptions](#class-scrolledgeoptions)|是||设置滚动到边缘位置的模式。|

#### func scrollPage(Bool)

```cangjie
public func scrollPage(next: Bool): Unit
```

**功能：**滚动到下一页或者上一页。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|next|Bool|是|-|是否向下翻页。true表示向下翻页，false表示向上翻页。|

#### func scrollPage(Bool, Bool)

```cangjie
public func scrollPage(next: Bool, animation!: Bool = false): Unit
```

**功能：**滚动到下一页或者上一页。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|next|Bool|是|-|是否向下翻页。true表示向下翻页，false表示向上翻页。|
|animation|Bool|否|false|动画配置。<br/>\- boolean: 使能默认弹簧动效。|

#### func scrollTo(Length, Length)

```cangjie
public func scrollTo(xOffset!: Length, yOffset!: Length): Unit
```

**功能：** 滑动到指定位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|xOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。**  水平滚动偏移（Int64、Float64类型值单位为vp）。<br>**说明：**<br>该参数值不支持设置百分比。<br>仅滚动轴为x轴时生效。<br>当值小于0时，不带动画的滚动，按0处理。带动画的滚动，默认滚动到起始位置后停止。 |
|yOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。**  竖直滚动偏移（Int64、Float64类型值单位为vp）。<br>**说明：**<br>该参数值不支持设置百分比。<br>仅滚动轴为y轴时生效。<br>当值小于0时，不带动画的滚动，按0处理。带动画的滚动，默认滚动到起始位置后停止。|

#### func scrollTo(Length, Length, ScrollAnimationOptions)

```cangjie
public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: ScrollAnimationOptions): Unit
```

**功能：** 滑动到指定位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|xOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|水平滚动偏移。<br/>**说明：**<br/>该参数值不支持设置百分比。<br/>仅滚动轴为x轴时生效。<br/>取值范围：当值小于0时，不带动画的滚动，按0处理。带动画的滚动，默认滚动到起始位置后停止，可通过设置animation参数，使滚动在越界时启动回弹动画。|
|yOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|垂直滚动偏移。<br/>**说明：**<br/>该参数值不支持设置百分比。<br/>仅滚动轴为y轴时生效。<br/>取值范围：当值小于0时，不带动画的滚动，按0处理。带动画的滚动，默认滚动到起始位置后停止，可通过设置animation参数，使滚动在越界时启动回弹动画。|
|animation|[ScrollAnimationOptions](#class-scrollanimationoptions)|是|-|自定义滚动动效，初始值：ScrollAnimationOptions(duration: 1000, curve: Curve.Ease, canOverScroll: false)|

#### func scrollTo(Length, Length, Bool)

```cangjie
public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: Bool): Unit
```

**功能：**滑动到指定位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|xOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|水平滚动偏移。<br/>**说明：**<br/>该参数值不支持设置百分比。<br/>仅滚动轴为x轴时生效。<br/>取值范围：当值小于0时，不带动画的滚动，按0处理。带动画的滚动，默认滚动到起始位置后停止，可通过设置animation参数，使滚动在越界时启动回弹动画。|
|yOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|垂直滚动偏移。<br/>**说明：**<br/>该参数值不支持设置百分比。<br/>仅滚动轴为y轴时生效。<br/>取值范围：当值小于0时，不带动画的滚动，按0处理。带动画的滚动，默认滚动到起始位置后停止，可通过设置animation参数，使滚动在越界时启动回弹动画。|
| animation | Bool | 是 | - | **命名参数。**  动画配置，使能默认弹簧动效。<br>初始值：false。|

#### func scrollToIndex(Int32, Bool, ScrollAlign, ScrollToIndexOptions)

```cangjie
public func scrollToIndex(
    index: Int32,
    smooth!: Bool = false,
    align!: ScrollAlign = ScrollAlign.Start,
    options!: ScrollToIndexOptions = ScrollToIndexOptions()
): This
```

**功能：**滑动到指定Index，支持设置滑动额外偏移量。

开启smooth动效时，会对经过的所有item进行加载和布局计算，当大量加载item时会导致性能问题。

> **说明：**
>
> 仅支持Grid、List、WaterFlow组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int32|是|-|要滑动到的目标元素在当前容器中的索引值。<br/>**说明：**<br/>value值设置成负值或者大于当前容器子组件的最大索引值，视为异常值，本次跳转不生效。|
|smooth|Bool|否|false|设置滑动到列表项在列表中的索引值时是否有动效，true表示有动效，false表示没有动效。<br/>默认值：false。|
|align|[ScrollAlign](#enum-scrollalign)|否|ScrollAlign.Start|List中的默认值为：ScrollAlign.START。Grid中默认值为：ScrollAlign.AUTO。WaterFlow中的默认值为：ScrollAlign.START。 **说明：** 仅List、Grid、WaterFlow组件支持该参数。指定滑动到的元素与当前容器的对齐方式。|
|options|[ScrollToIndexOptions](#class-scrolltoindexoptions)|否|ScrollToIndexOptions()|设置滑动到指定Index的选项，如额外偏移量。<br/>默认值：0，单位：vp。|

### enum ContentClipMode

```cangjie
public enum ContentClipMode {
    | ContentOnly
    | Boundary
    | SafeArea
}
```

**功能：** 定义滚动容器的内容层裁剪区域枚举值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Boundary

```cangjie
Boundary
```

**功能：**按组件区域裁剪。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### ContentOnly

```cangjie
ContentOnly
```

**功能：**按内容区裁剪。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### SafeArea

```cangjie
SafeArea
```

**功能：**按组件配置的SafeArea区域裁剪。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### enum ScrollAlign

```cangjie
public enum ScrollAlign {
    | Start
    | Center
    | End
    | Auto
}
```

**功能：** 对齐方式枚举。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Auto

```cangjie
Auto
```

**功能：** 自动对齐。

若指定item完全处于显示区，不做调整。否则依照滑动距离最短的原则，将指定item首部对齐或尾部对齐于List，使指定item完全处于显示区。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Center

```cangjie
Center
```

**功能：** 居中对齐。指定item主轴方向居中对齐于List。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### End

```cangjie
End
```

**功能：** 尾部对齐。指定item尾部与List尾部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Start

```cangjie
Start
```

**功能：** 首部对齐。指定item首部与List首部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码1（设置scroller控制器）

该示例展示了Scroll组件部分属性和scroller控制器的使用。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList
import kit.PerformanceAnalysisKit.Hilog

func loggerInfo(str: String) {
    Hilog.info(0, "CangjieTest", str)
}

@Entry
@Component
class EntryView {
    let scroller = Scroller()
    var arr: ArrayList<String> = ArrayList(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])

    func build() {
        Stack(alignContent: Alignment.TopStart) {
            Scroll(this.scroller) {
                Column {
                    ForEach(
                        this.arr,
                        itemGeneratorFunc: {
                            item: String, idx: Int64 => Text(item)
                                .width(90.percent)
                                .height(150)
                                .backgroundColor(0xFFFFFF)
                                .borderRadius(15)
                                .textAlign(TextAlign.Center)
                                .fontSize(16)
                                .margin(top: 10)
                        }
                    )
                }
            }
                .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
                .scrollBar(BarState.On) // 滚动条常驻显示
                .scrollBarColor(Color.Gray) // 滚动条颜色
                .scrollBarWidth(10.px) // 滚动条宽度
                .friction(0.6)
                .onScrollEdge(
                    {
                        edge => match (edge) {
                            case Edge.Top => loggerInfo("Top")
                            case Edge.Bottom => loggerInfo("Bottom")
                            case _ => loggerInfo("None")
                        }
                    })
                .onScrollStop({
                    => loggerInfo("Scroll Stop")
                })

            Button("scroll 150")
                .onClick({
                    evt => // 点击后下滑指定距离150.0vp
                    this
                        .scroller
                        .scrollBy(xOffset: 0, yOffset: 150)
                })
                .margin(top: 10, left: 20)

            Button("scroll 100")
                .onClick(
                    {
                        evt => //点击后滑动到指定位置，即下滑100.0vp的距离
                        loggerInfo("current offset ${this.scroller.currentOffset().yOffset}")
                        loggerInfo("CALCULATE offset ${this.scroller.currentOffset().yOffset + 100.0}")
                        let curyOffset = this
                            .scroller
                            .currentOffset()
                            .yOffset
                        this
                            .scroller
                            .scrollTo(xOffset: 0.vp, yOffset: (curyOffset + 100.0).vp, animation: ScrollAnimationOptions(duration: 0.0, curve: Curve.Ease))
                    }
                )
                .margin(top: 60, left: 20)

            Button("back top")
                .onClick({
                    evt => // 点击后回到顶部
                    this
                        .scroller
                        .scrollEdge(Edge.Top)
                })
                .margin(top: 110, left: 20)

            Button("next page")
                .onClick({
                    evt => // 点击后滑到下一页
                    this
                        .scroller
                        .scrollPage(true, animation: false)
                })
                .margin(top: 160, left: 20)

            Button("fling -3000")
                .onClick({
                    evt => // 点击后触发初始速度为-3000vp/s的惯性滚动
                    this
                        .scroller
                        .fling(-3000.0)
                })
                .margin(top: 210, left: 20)

            Button("next page slowly")
                .onClick({
                    evt => // 点击后滑到下一页，滑动过程开启动画
                    this
                        .scroller
                        .scrollPage(true, animation: true)
                })
                .margin(top: 260, left: 20)
        }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
    }
}
```

## 示例代码2（嵌套滚动实现方式一）

该示例使用onScrollFrameBegin事件实现了内层List组件和外层Scroll组件的嵌套滚动。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    @State
    var listPosition: Int32 = 0 // 0代表滚动到List顶部，1代表中间值，2代表滚动到List底部。
    let scroller = Scroller()
    let scrollerForList = Scroller()
    var arr: ArrayList<String> = ArrayList(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])

    func build() {
        Flex() {
            Scroll(this.scroller) {
                Column() {
                    Text("Scroll Area")
                        .width(100.percent)
                        .height(40.percent)
                        .backgroundColor(0x330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                        .onClick(
                            {
                                evt => this
                                    .scrollerForList
                                    .scrollToIndex(5, smooth: false, align: ScrollAlign.Start, options: ScrollToIndexOptions(extraOffset: 5.vp))
                            })

                    List(space: 20, scroller: this.scrollerForList) {
                        ForEach(
                            this.arr,
                            itemGeneratorFunc: {
                                item: String, idx: Int64 => ListItem() {
                                    Text("ListItem" + item)
                                        .width(100.percent)
                                        .height(100.percent)
                                        .backgroundColor(Color.White)
                                        .borderRadius(15)
                                        .textAlign(TextAlign.Center)
                                        .fontSize(16)
                                        .margin(top: 10)
                                }
                                    .width(100.percent)
                                    .height(100)
                            }
                        )
                    }
                        .width(100.percent)
                        .height(50.percent)
                        .edgeEffect(EdgeEffect.None)
                        .friction(0.6)
                        .onReachStart({
                            => this.listPosition = 0
                        })
                        .onReachEnd({
                            => this.listPosition = 2
                        })
                        .onScrollFrameBegin(
                            {
                                x: Float64, y: ScrollState =>
                                if ((this.listPosition == 0 && x <= 0.0) || (this.listPosition == 2 && x >= 0.0)) {
                                    this
                                        .scroller
                                        .scrollBy(xOffset: 0.0, yOffset: x)
                                    return onScrollFrameBeginHandleResult(offsetRemain: 0.0)
                                }
                                this.listPosition = 1
                                return onScrollFrameBeginHandleResult(offsetRemain: x)
                            }
                        )

                    Text("Scroll Area")
                        .width(100.percent)
                        .height(40.percent)
                        .backgroundColor(0x330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                }
            }
                .width(100.percent)
                .height(100.percent)
        }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
            .padding(20)
    }
}
```

## 示例代码3（嵌套滚动实现方式二）

该示例使用nestedScroll属性实现了内层List组件和外层Scroll组件的嵌套滚动。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    @State
    var arr: ArrayList<Int64> = ArrayList<Int64>(30)

    func build() {
        Scroll {
            Column {
                Text("Scroll Area")
                    .width(100.percent)
                    .height(40.percent)
                    .backgroundColor(0x00800C)
                    .textAlign(TextAlign.Center)
                Tabs(barPosition: BarPosition.Start) {
                    TabContent {
                        List(space: 10) {
                            ForEach(
                                this.arr,
                                itemGeneratorFunc: {
                                    item: Int64, idx: Int64 => ListItem {
                                        Text("item" + item.toString()).fontSize(16)
                                    }
                                        .backgroundColor(Color.White)
                                        .height(72)
                                        .width(100.percent)
                                        .borderRadius(12)
                                },
                                keyGeneratorFunc: {
                                    item: Int64, idx: Int64 => item.toString()
                                }
                            )
                        }
                            .width(100.percent)
                            .edgeEffect(EdgeEffect.Spring)
                            .nestedScroll(
                                NestedScrollOptions(NestedScrollMode.ParentFirst, NestedScrollMode.SelfFirst))
                    }.tabBar("Tab1")

                    TabContent {
                    }.tabBar("Tab2")
                }
                    .vertical(false)
                    .height(100.percent)
            }.width(100.percent)
        }
            .friction(0.6)
            .backgroundColor(0xDCDCDC)
            .scrollBar(BarState.Off)
            .width(100.percent)
            .height(100.percent)
    }

    protected override func aboutToAppear() {
        for (i in 0..30) {
            this.arr.add(i)
        }
    }
}
```

## 示例代码4（嵌套滚动父组件向子组件传递滚动）

该示例使用enableScrollInteraction属性和onScrollFrameBegin事件实现了父组件向子组件传递滚动。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    private var headerHeight: Float64 = 0.0
    private var arr: ArrayList<Int64> = ArrayList<Int64>()
    private var scrollerForParent: Scroller = Scroller()
    private var scrollerForChild: Scroller = Scroller()

    protected override func aboutToAppear() {
        for (i in 0..10) {
            this.arr.add(i)
        }
    }

    func build() {
        Scroll(this.scrollerForParent) {
            Column {
                Text("Scroll Area")
                    .width(100.percent)
                    .height(40.percent)
                    .backgroundColor(0x330000FF)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)

                List(space: 20, scroller: this.scrollerForChild) {
                    ForEach(
                        this.arr,
                        itemGeneratorFunc: {
                            item: Int64, idx: Int64 => ListItem {
                                Text("ListItem" + item.toString())
                                    .width(100.percent)
                                    .height(100.percent)
                                    .borderRadius(15)
                                    .fontSize(16)
                                    .textAlign(TextAlign.Center)
                                    .backgroundColor(Color.White)
                            }
                                .width(100.percent)
                                .height(100)
                        },
                        keyGeneratorFunc: {
                            item: Int64, idx: Int64 => item.toString()
                        }
                    )
                }
                    .width(100.percent)
                    .height(100.percent)
                    .edgeEffect(EdgeEffect.None)
                    .scrollBar(BarState.Off)
                    .enableScrollInteraction(false)

                Text("Scroll Area")
                    .width(100.percent)
                    .height(40.percent)
                    .backgroundColor(0x330000FF)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
            }
        }
            .scrollBar(BarState.Off)
            .onScrollFrameBegin(
                {
                    offset: Float64, state: ScrollState =>
                    var retOffset = offset
                    var currentOffset = this
                        .scrollerForParent
                        .currentOffset()
                        .yOffset
                    var newOffset = currentOffset + offset
                    if (offset > 0.0) {
                        if (this
                            .scrollerForChild
                            .isAtEnd()) {
                            return offset
                        }
                        if (newOffset > this.headerHeight) {
                            this
                                .scrollerForChild
                                .scrollBy(xOffset: 0.0, yOffset: retOffset)
                            if (currentOffset < this.headerHeight) {
                                return this.headerHeight - currentOffset
                            } else {
                                return 0.0
                            }
                        }
                    } else {
                        if (this
                            .scrollerForChild
                            .currentOffset()
                            .yOffset <= 0.0) {
                            return offset
                        }
                        if (newOffset < this.headerHeight) {
                            this
                                .scrollerForChild
                                .scrollBy(xOffset: 0.0, yOffset: retOffset)
                            return 0.0
                            if (currentOffset > this.headerHeight) {
                                return this.headerHeight - currentOffset
                            } else {
                                return 0.0
                            }
                        }
                    }
                    return offset
                }
            )
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
    }
}
```

## 示例代码5（设置限位滚动）

该示例实现了Scroll组件的限位滚动。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    var scroller: Scroller = Scroller()
    private var arr: ArrayList<Int64> = ArrayList<Int64>(16, {i => i+1})
    func build() {
        Scroll(this.scroller) {
            Column {
                ForEach(this.arr, itemGeneratorFunc: {item: Int64, idx: Int64 =>
                            Text(item.toString())
                            .width(90.percent)
                            .height(200)
                            .backgroundColor(0xFFFFFF)
                            .borderWidth(1)
                            .borderRadius(15)
                            .fontSize(16)
                            .textAlign(TextAlign.Center)
                })
            }.width(100.percent).backgroundColor(0xDCDCDC)
        }
        .backgroundColor(Color.White)
        .height(100.percent)
    }
}
```

## 示例代码7（设置边缘渐隐）

该示例实现了Scroll组件开启边缘渐隐效果并设置边缘渐隐长度。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    var scroller: Scroller = Scroller()
    private var arr: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])

    func build() {
        Stack(alignContent: Alignment.TopStart) {
            Scroll(this.scroller) {
                Column {
                    ForEach(
                        this.arr,
                        itemGeneratorFunc: {
                            item: Int64, idx: Int64 => Text(item.toString())
                                .width(90.percent)
                                .height(150)
                                .backgroundColor(0xFFFFFF)
                                .borderRadius(15)
                                .fontSize(16)
                                .textAlign(TextAlign.Center)
                                .margin(top: 10)
                        }
                    )
                }.width(100.percent)
            }.fadingEdge(true, FadingEdgeOptions(fadingEdgeLength: 80))
        }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
    }
}
```

![scroll7](./figures/scroll7.gif)
