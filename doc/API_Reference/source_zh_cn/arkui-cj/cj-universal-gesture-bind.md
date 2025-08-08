# 绑定手势方法

为组件绑定不同类型的手势事件，并设置事件的响应方法。

## 绑定手势识别

通过下面属性给组件绑定手势识别，手势识别成功后可以通过事件回调通知组件。 可以通过[触摸热区](./cj-universal-attribute-touchtarget.md#触摸热区设置)指定可识别手势的区域。

### func gesture(GestureType)

```cangjie
public func gesture(gesture: GestureType): This
```

**功能：** 绑定手势。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|是|-|绑定的手势类型。|

### func gesture(GestureType, GestureMask)

```cangjie
public func gesture(gesture: GestureType, mask: GestureMask): This
```

**功能：** 绑定手势。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|是|-|绑定的手势类型。|
|mask|[GestureMask](#enum-gesturemask)|是|-|事件响应设置。|

### func parallelGesture(GestureType)

```cangjie
public func priorityGesture(gesture: GestureType): This
```

**功能：** 绑定可与子组件手势同时触发的手势。

> **说明：**
>
> 手势事件为非冒泡事件。父组件设置parallelGesture时，父子组件相同的手势事件都可以触发，实现类似冒泡效果。若父子组件中同时绑定单击手势事件和双击手势事件，则只响应单击手势事件。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|是|-|绑定的手势类型。|

### func parallelGesture(GestureType, GestureMask)

```cangjie
public func priorityGesture(gesture: GestureType, mask: GestureMask): This
```

**功能：** 绑定可与子组件手势同时触发的手势。

> **说明：**
>
> 手势事件为非冒泡事件。父组件设置parallelGesture时，父子组件相同的手势事件都可以触发，实现类似冒泡效果。若父子组件中同时绑定单击手势事件和双击手势事件，则只响应单击手势事件。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|是|-|绑定的手势类型。|
|mask|[GestureMask](#enum-gesturemask)|是|-|事件响应设置。|

### func priorityGesture(GestureType)

```cangjie
public func priorityGesture(gesture: GestureType): This
```

**功能：** 绑定优先识别手势。

> **说明：**
>
> - 默认情况下，子组件优先识别通过gesture绑定的手势，当父组件配置priorityGesture时，父组件优先识别priorityGesture绑定的手势。
> - 长按手势时，设置触发长按的最短时间小的组件会优先响应，会忽略priorityGesture设置。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|是|-|绑定的手势类型。|

### func priorityGesture(GestureType, GestureMask)

```cangjie
public func priorityGesture(gesture: GestureType, mask: GestureMask): This
```

**功能：** 绑定优先识别手势。

> **说明：**
>
> - 默认情况下，子组件优先识别通过gesture绑定的手势，当父组件配置priorityGesture时，父组件优先识别priorityGesture绑定的手势。
> - 长按手势时，设置触发长按的最短时间小的组件会优先响应，会忽略priorityGesture设置。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|是|-|绑定的手势类型。|
|mask|[GestureMask](#enum-gesturemask)|是|-|事件响应设置。|

## 响应手势事件

组件通过手势事件绑定不同GestureType的手势对象，各手势对象在响应手势操作的事件回调中提供手势相关信息。下面通过TapGesture手势对象的onAction事件响应点击事件，获取事件相关信息。其余手势对象的事件定义见各个手势对象章节。 若需绑定多种手势请使用[组合手势](../../../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-gesture-groupgesture.md)。

### func onAction(GestureEvent -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**功能：** Tap手势识别成功触发该事件。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[GestureEvent](#class-gestureevent)|是|-|回调函数，Tap手势识别成功后触发该回调。|

## 基础类型定义

### class GestureEvent

```cangjie
public class GestureEvent <: BaseEvent {
    public let repeat: Bool
    public let fingerList: ArrayList<FingerInfo>
    public let offsetX: Float64
    public let offsetY: Float64
    public let scale: Float64
    public let pinchCenterX: Float64
    public let pinchCenterY: Float64
    public let angle: Float64
    public let speed: Float64
    public let velocityX: Float64
    public let velocityY: Float64
    public let velocity: Float64
    public init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviveId: Int64,
        repeat: Bool,
        offsetX: Float64,
        offsetY: Float64,
        angle: Float64,
        scale: Float64,
        pinchCenterX: Float64,
        pinchCenterY: Float64,
        speed: Float64,
        fingerList: ArrayList<FingerInfo>,
        velocityX: Float64,
        velocityY: Float64,
        velocity: Float64
    )
}
```

**功能：** 用于描述手势事件的类型。

**父类型：**

- [BaseEvent](cj-universal-gesture-judge.md#class-baseevent)

#### let angle

```cangjie
public let angle: Float64
```

**功能：** 用于RotationGesture手势触发场景时，表示旋转角度。用于SwipeGesture手势触发场景时，表示滑动手势的角度，即两根手指间的线段与水平方向的夹角变化的度数。

> **说明：**
>
> 角度计算方式：滑动手势被识别到后，连接两根手指之间的线被识别为起始线条，随着手指的滑动，手指之间的线条会发生旋转，根据起始线条两端点和当前线条两端点的坐标，使用反正切函数分别计算其相对于水平方向的夹角，最后arctan2(cy2-cy1,cx2-cx1)-arctan2(y2-y1,x2-x1)为旋转的角度。以起始线条为坐标系，顺时针旋转为0到180度，逆时针旋转为-180到0度。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let fingerList

```cangjie
public let fingerList: ArrayList<FingerInfo>
```

**功能：** 输入源为触屏产生的手势，fingerList中会包含触发事件的所有触点信息；由鼠标发起的手势，fingerList中只会有一条记录；触摸板的事件大类与鼠标一致，所以由触摸板发起的手势，fingerList只会携带一条记录。

> **说明：**
>
> 手指索引编号与位置对应，即fingerList[index]的id为index。先按下且未参与当前手势触发的手指在fingerList中对应位置为空。

**类型：** ArrayList\<[FingerInfo](#class-fingerinfo)>

**读写能力：** 只读

**起始版本：** 19

#### let offsetX

```cangjie
public let offsetX: Float64
```

**功能：** 手势事件偏移量X，单位为vp，用于[PanGesture](cj-universal-gesture-pangesture.md)手势触发场景，从左向右滑动offsetX为正，反之为负。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let offsetY

```cangjie
public let offsetY: Float64
```

**功能：** 手势事件偏移量Y，单位为vp，用于[PanGesture](cj-universal-gesture-pangesture.md)手势触发场景，从上向下滑动offsetY为正，反之为负。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let pinchCenterX

```cangjie
public let pinchCenterX: Float64
```

**功能：** 捏合手势中心点的x轴坐标，单位为vp，用于[PinchGesture](./cj-universal-gesture-pinchgesture.md)手势触发场景。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let pinchCenterY

```cangjie
public let pinchCenterY: Float64
```

**功能：** 捏合手势中心点的y轴坐标，单位为vp，用于[PinchGesture](./cj-universal-gesture-pinchgesture.md)手势触发场景。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let repeat

```cangjie
public let repeat: Bool
```

**功能：** 是否为重复触发事件，用于[LongPressGesture](./cj-universal-gesture-longpressgesture.md)手势触发场景。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 19

#### let scale

```cangjie
public let scale: Float64
```

**功能：** 缩放比例，用于[PinchGesture](./cj-universal-gesture-pinchgesture.md)手势触发场景。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let speed

```cangjie
public let speed: Float64
```

**功能：** 滑动手势速度，即所有手指相对当前组件元素原始区域滑动的平均速度，单位为vp/秒，用于[SwipeGesture](./cj-universal-gesture-swipegesture.md)手势触发场景。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let velocity

```cangjie
public let velocity: Float64
```

**功能：** 用于[PanGesture](./cj-universal-gesture-pangesture.md#pangesture)手势中，获取当前手势的主方向速度。为xy轴方向速度的平方和的算术平方根。单位为vp/s。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let velocityX

```cangjie
public let velocityX: Float64
```

**功能：** 用于[PanGesture](./cj-universal-gesture-pangesture.md#pangesture)手势中，获取当前手势的x轴方向速度。坐标轴原点为屏幕左上角，分正负方向速度，从左往右为正，反之为负。单位为vp/s。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let velocityY

```cangjie
public let velocityY: Float64
```

**功能：** 用于[PanGesture](./cj-universal-gesture-pangesture.md#pangesture)手势中，获取当前手势的y轴方向速度。坐标轴原点为屏幕左上角，分正负方向速度，从上往下为正，反之为负。单位为vp/s。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### init(EventTarget, Int64, SourceType, Float64, Int64, Int64, SourceTool, Option\<Float32>, Option\<Float32>, Option\<(Array\<String>) -> Bool>, Int64, Bool, Float64, Float64, Float64, Float64, Float64, Float64, Float64, ArrayList\<FingerInfo>, Float64, Float64, Float64)

```cangjie
public init(
    target: EventTarget,
    timestamp: Int64,
    source: SourceType,
    pressure: Float64,
    tiltX: Int64,
    tiltY: Int64,
    sourceTool: SourceTool,
    axisHorizontal: Option<Float32>,
    axisVertical: Option<Float32>,
    getModifierKeyState: Option<(Array<String>) -> Bool>,
    deviveId: Int64,
    repeat: Bool,
    offsetX: Float64,
    offsetY: Float64,
    angle: Float64,
    scale: Float64,
    pinchCenterX: Float64,
    pinchCenterY: Float64,
    speed: Float64,
    fingerList: ArrayList<FingerInfo>,
    velocityX: Float64,
    velocityY: Float64,
    velocity: Float64
)
```

**功能：** 构造手势事件类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|target|[EventTarget](#class-eventtarget)|是|-|触发手势事件的元素对象显示区域。|
|timestamp|Int64|是|-|事件时间戳，触发事件时距离系统启动的时间间隔。<br>单位：ns|
|source|[SourceType](./cj-common-types.md#enum-sourcetype)|是|-|事件输入设备。|
|pressure|Float64|是|-|按压的压力大小。|
|tiltX|Int64|是|-|手写笔在设备平面上的投影与设备平面X轴的夹角。|
|tiltY|Int64|是|-|手写笔在设备平面上的投影与设备平面Y轴的夹角。|
|sourceTool|[SourceTool](./cj-common-types.md#enum-sourcetool)|是|-|事件输入源。|
|axisHorizontal|Option\<Float32>|是|-|水平轴值。|
|axisVertical|Option\<Float32>|是|-|垂直轴值。|
|getModifierKeyState|Option\<(Array\<String>)->Bool>|是|-|获取功能键按压状态。|
|deviveId|Int64|是|-|触发当前事件的输入设备ID。|
|repeat|Bool|是|-|是否为重复触发事件，用于LongPressGesture手势触发场景。|
|offsetX|Float64|是|-|手势事件偏移量X，单位为vp，用于PanGesture手势触发场景，从左向右滑动offsetX为正，反之为负。|
|offsetY|Float64|是|-|手势事件偏移量Y，单位为vp，用于PanGesture手势触发场景，从上向下滑动offsetY为正，反之为负。|
|angle|Float64|是|-|用于RotationGesture手势触发场景时，表示旋转角度。<br>用于SwipeGesture手势触发场景时，表示滑动手势的角度，即两根手指间的线段与水平方向的夹角变化的度数。|
|scale|Float64|是|-|缩放比例，用于PinchGesture手势触发场景。|
|pinchCenterX|Float64|是|-|捏合手势中心点的x轴坐标，单位为vp，用于PinchGesture手势触发场景。|
|pinchCenterY|Float64|是|-|捏合手势中心点的y轴坐标，单位为vp，用于PinchGesture手势触发场景。|
|speed|Float64|是|-|滑动手势速度，即所有手指相对当前组件元素原始区域滑动的平均速度，单位为vp/秒，用于SwipeGesture手势触发场景。|
|fingerList|ArrayList\<[FingerInfo](#class-fingerinfo)>|是|-|输入源为触屏产生的手势，fingerList中会包含触发事件的所有触点信息；由鼠标发起的手势，fingerList中只会有一条记录；触摸板的事件大类与鼠标一致，所以由触摸板发起的手势，fingerList只会携带一条记录。<br>**说明：**<br>手指索引编号与位置对应，即fingerList[index]的id为index。先按下且未参与当前手势触发的手指在fingerList中对应位置为空。|
|velocityX|Float64|是|-|用于PanGesture手势中，获取当前手势的x轴方向速度。坐标轴原点为屏幕左上角，分正负方向速度，从左往右为正，反之为负。单位为vp/s。|
|velocityY|Float64|是|-|用于PanGesture手势中，获取当前手势的y轴方向速度。坐标轴原点为屏幕左上角，分正负方向速度，从上往下为正，反之为负。单位为vp/s。|
|velocity|Float64|是|-|用于PanGesture手势中，获取当前手势的主方向速度。为xy轴方向速度的平方和的算术平方根。单位为vp/s。|

### class GestureType

```cangjie
public open class GestureType {}
```

**功能：** 所有手势类型的基础类型。

**起始版本：** 19

#### func tag(String)

```cangjie
public func tag(tag: String): This
```

**功能：** 设置手势标志，用于自定义手势判定时区分绑定的手势。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|tag|String|是|-|设置手势标志，用于自定义手势判定时区分绑定的手势。|

### class EventTarget

```cangjie
public class EventTarget {
    public EventTarget(
        public var area: Area
    )
}
```

**功能：** 触发手势事件的元素对象显示区域。

**起始版本：** 12

#### var area

```cangjie
public var area: Area
```

**功能：** 目标元素的区域信息。

**类型：** [Area](cj-common-types.md#class-area)

**读写能力：** 可读写

**起始版本：** 19

#### EventTarget(Area)

```cangjie
public EventTarget(
    public var area: Area
)
```

**功能：** 构造触发手势事件的元素对象显示区域类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|area|Area|是|-|目标元素的区域信息。|

### class FingerInfo

```cangjie
public class FingerInfo{
    public let id: Int32
    public let globalX: Float64
    public let globalY: Float64
    public let localX: Float64
    public let localY: Float64
}
```

**功能：** 手指信息。

**起始版本：** 12

#### let id

```cangjie
public let id: Int32
```

**功能：** 手指的索引编号。

**类型：** Int32

**读写能力：** 只读

**起始版本：** 12

#### let globalX

```cangjie
public let globalX: Float64
```

**功能：** 相对于应用窗口左上角的x轴坐标，单位为vp。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 12

#### let globalY

```cangjie
public let globalY: Float64
```

**功能：** 相对于应用窗口左上角的y轴坐标，单位为vp。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 12

#### let localX

```cangjie
public let localX: Float64
```

**功能：** 相对于当前组件元素原始区域左上角的x轴坐标，单位为vp。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 12

#### let localY

```cangjie
public let localY: Float64
```

**功能：** 相对于当前组件元素原始区域左上角的y轴坐标，单位为vp。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 12

### enum GestureMask

```cangjie
public enum GestureMask {
    | Normal
    | IgnoreInternal
}
```

**功能：** 事件响应设置。

**起始版本：** 19

#### Normal

```cangjie
Normal
```

**功能：** 不屏蔽子组件的手势，按照默认手势识别顺序进行识别。

**起始版本：** 19

#### IgnoreInternal

```cangjie
IgnoreInternal
```

**功能：** 屏蔽子组件的手势，包括子组件上系统内置的手势，如子组件为List组件时，内置的滑动手势同样会被屏蔽。 若父子组件区域存在部分重叠，则只会屏蔽父子组件重叠的部分。

**起始版本：** 19

## 示例

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var priorityTestValue: String = ""
    @State var parallelTestValue: String = ""

    func build() {
        Column() {
            Column() {
                Text('TapGesture:' + this.priorityTestValue).fontSize(28)
                .gesture(
                    TapGesture()
                    .onAction({ event: GestureEvent =>
                        this.priorityTestValue += '\nText'
                    }),
                    GestureMask.Normal
                )
            }
            .height(200)
            .width(250)
            .padding(20)
            .margin(20)
            .border(width: 3.vp)
            // 设置为priorityGesture时，点击文本会忽略Text组件的TapGesture手势事件，优先识别父组件Column的TapGesture手势事件
            .priorityGesture(
                TapGesture()
                .onAction({event: GestureEvent  =>
                    this.priorityTestValue += '\nColumn'
                }),
                GestureMask.IgnoreInternal
            )

            Column() {
                Text('TapGesture:' + this.parallelTestValue).fontSize(28)
                .gesture(
                    TapGesture()
                    .onAction({ event: GestureEvent =>
                        this.parallelTestValue += '\nText'
                    }),
                    GestureMask.Normal
                )
            }
            .height(200)
            .width(250)
            .padding(20)
            .margin(20)
            .border(width: 3.vp)
            // 设置为parallelGesture时，点击文本会同时触发子组件Text与父组件Column的TapGesture手势事件
            .parallelGesture(
                TapGesture()
                    .onAction({ event: GestureEvent  =>
                        this.parallelTestValue += '\nColumn'
                }), GestureMask.Normal
            )
        }
    }
}
```

![bind_gesture](figures/bind_gesture.gif)
