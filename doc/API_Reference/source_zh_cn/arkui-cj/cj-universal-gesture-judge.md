# 自定义手势判定

为组件提供自定义手势判定能力。开发者可根据需要，在手势识别期间，决定是否响应手势。

## func onGestureJudgeBegin((GestureInfo, BaseGestureEvent) -> GestureJudgeResult)

```cangjie
public func onGestureJudgeBegin(callback: (GestureInfo, BaseGestureEvent) -> GestureJudgeResult): This
```

**功能：** 给组件绑定自定义手势判定回调，当绑定到该组件的手势被接受时，会触发用户定义的回调来获取结果。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureInfo](#class-gestureinfo), [BaseGestureEvent](#class-basegestureevent))->[GestureJudgeResult](#enum-gesturejudgeresult)|是|-|给组件绑定自定义手势判定回调，当绑定到该组件的手势被接受时，会触发用户定义的回调来获取结果。|

## 基础类型定义

### class BaseEvent

```cangjie
public open class BaseEvent {
    public let target: EventTarget,
    public let timestamp: Int64,
    public let source: SourceType,
    public let pressure: Float64,
    public let tiltX: Int64,
    public let tiltY: Int64,
    public let sourceTool: SourceTool,
    public let axisHorizontal: Option<Float32>,
    public let axisVertical: Option<Float32>,
    public let getModifierKeyState: Option<(Array<String>) -> Bool>,
    public let deviceId: Int64
}
```

**功能：** 基础事件信息基类。

**起始版本：** 19

#### let axisHorizontal

```cangjie
public let axisHorizontal: Option<Float32>
```

**功能：** 水平轴值。

**类型：** Option\<Float32>

**读写能力：** 只读

**起始版本：** 19

#### let axisVertical

```cangjie
public let axisVertical: Option<Float32>
```

**功能：** 垂直轴值。

**类型：** Option\<Float32>

**读写能力：** 只读

**起始版本：** 19

#### let deviceId

```cangjie
public let deviceId: Int64
```

**功能：** 触发当前事件的输入设备ID。

**类型：** Int64

**读写能力：** 只读

**起始版本：** 19

#### let getModifierKeyState

```cangjie
public let getModifierKeyState: Option <(Array<String>) -> Bool>
```

**功能：** 获取功能键按压状态。报错信息请参考以下错误码。支持功能键 'Ctrl'|'Alt'|'Shift'|'Fn'，设备外接带Fn键的键盘不支持Fn键查询。

**类型：** Option\<(Array\<String>)->Bool>

**读写能力：** 只读

**起始版本：** 19

#### let pressure

```cangjie
public let pressure: Float64
```

**功能：** 按压的压力大小。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let source

```cangjie
public let source: SourceType
```

**功能：** 事件输入设备。

**类型：** [SourceType](./cj-common-types.md#enum-sourcetype)

**读写能力：** 只读

**起始版本：** 19

#### let sourceTool

```cangjie
public let sourceTool: SourceTool
```

**功能：** 事件输入源。

**类型：** [SourceTool](./cj-common-types.md#enum-sourcetool)

**读写能力：** 只读

**起始版本：** 19

#### let target

```cangjie
public let target: EventTarget
```

**功能：** 手势标记。

**类型：** [EventTarget](./cj-universal-gesture-bind.md#class-eventtarget)

**读写能力：** 只读

**起始版本：** 19

#### let tiltX

```cangjie
public let tiltX: Int64
```

**功能：** 手写笔在设备平面上的投影与设备平面X轴的夹角。

**类型：** Int64

**读写能力：** 只读

**起始版本：** 19

#### let tiltY

```cangjie
public let tiltY: Int64
```

**功能：** 手写笔在设备平面上的投影与设备平面Y轴的夹角。

**类型：** Int64

**读写能力：** 只读

**起始版本：** 19

#### let timestamp

```cangjie
public let timestamp: Int64
```

**功能：** 事件时间戳。

**类型：** Int64

**读写能力：** 只读

**起始版本：** 19

### class BaseGestureEvent

```cangjie
public open class BaseGestureEvent <: BaseEvent {
    public let fingerList: ArrayList<FingerInfo>
}
```

**功能：** 基础手势事件信息的基类。

**父类型：**

- [BaseEvent](#class-baseevent)

#### let fingerList

```cangjie
public let fingerList: ArrayList<FingerInfo>
```

**功能：** 触发事件的所有手指信息。

**类型：** ArrayList\<[FingerInfo](./cj-universal-gesture-bind.md#class-fingerinfo)>

**读写能力：** 只读

**起始版本：** 19

### class LongPressGestureEvent

```cangjie
public class LongPressGestureEvent <: BaseGestureEvent {
    public let repeat: Bool
}
```

**功能：** 长按手势的基础手势事件信息，可将该对象作为onGestureJudgeBegin的event参数来传递。

**父类型：**

- [BaseGestureEvent](#class-basegestureevent)

#### let repeat

```cangjie
public let repeat: Bool
```

**功能：** 是否为重复触发事件。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 19

### class PanGestureEvent

```cangjie
public class PanGestureEvent <: BaseGestureEvent {
    public let offsetX: Float64
    public let offsetY: Float64
    public let velocityX: Float64
    public let velocityY: Float64
    public let velocity: Float64
}
```

**功能：** 滑动手势的基础手势事件信息，可将该对象作为onGestureJudgeBegin的event参数来传递。

**父类型：**

- [BaseGestureEvent](#class-basegestureevent)

#### let offsetX

```cangjie
public let offsetX: Float64
```

**功能：** 手势事件偏移量X，单位为vp，从左向右滑动offsetX为正，反之为负。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let offsetY

```cangjie
public let offsetY: Float64
```

**功能：** 手势事件偏移量Y，单位为vp，从上向下滑动offsetY为正，反之为负。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let velocity

```cangjie
public let velocity: Float64
```

**功能：** 获取当前手势的主方向速度。为xy轴方向速度的平方和的算术平方根。单位为vp/s。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let velocityX

```cangjie
public let velocityX: Float64
```

**功能：** 获取当前手势的x轴方向速度。坐标轴原点为屏幕左上角，分正负方向速度，从左往右为正，反之为负。单位为vp/s。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let velocityY

```cangjie
public let velocityY: Float64
```

**功能：** 获取当前手势的y轴方向速度。坐标轴原点为屏幕左上角，分正负方向速度，从上往下为正，反之为负。单位为vp/s。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

### class PinchGestureEvent

```cangjie
public class PinchGestureEvent <: BaseGestureEvent {
    public let scale: Float64
    public let pinchCenterX: Float64
    public let pinchCenterY: Float64
}
```

**功能：** 捏合手势的基础手势事件信息，可将该对象作为onGestureJudgeBegin的event参数来传递。

**父类型：**

- [BaseGestureEvent](#class-basegestureevent)

#### let pinchCenterX

```cangjie
public let pinchCenterX: Float64
```

**功能：** 捏合手势中心点相对于当前组件元素原始区域左上角x轴坐标，单位为vp。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let pinchCenterY

```cangjie
public let pinchCenterY: Float64
```

**功能：** 捏合手势中心点相对于当前组件元素原始区域左上角y轴坐标，单位为vp。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let scale

```cangjie
public let scale: Float64
```

**功能：** 缩放比例。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

### class RotationGestureEvent

```cangjie
public class RotationGestureEvent <: BaseGestureEvent {
    public let angle: Float64
}
```

**功能：** 旋转手势的基础手势事件信息，可将该对象作为onGestureJudgeBegin的event参数来传递。

**父类型：**

- [BaseGestureEvent](#class-basegestureevent)

#### let angle

```cangjie
public let angle: Float64
```

**功能：** 表示旋转角度，单位为deg。以起始线条为坐标系，顺时针旋转为0到180度，逆时针旋转为-180到0度。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

### class SwipeGestureEvent

```cangjie
public class SwipeGestureEvent <: BaseGestureEvent {
    public let angle: Float64
    public let speed: Float64
}
```

**功能：** swipe手势的基础手势事件信息，可将该对象作为onGestureJudgeBegin的event参数来传递。

**父类型：**

- [BaseGestureEvent](#class-basegestureevent)

#### let angle

```cangjie
public let angle: Float64
```

**功能：** 表示滑动手势的角度，即两根手指间的线段与水平方向的夹角变化的度数，单位为deg。以起始线条为坐标系，顺时针旋转为0到180度，逆时针旋转为-180到0度。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let speed

```cangjie
public let speed: Float64
```

**功能：** 滑动手势速度，即所有手指相对当前组件元素原始区域滑动的平均速度，单位为vp/s。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

### class TapGestureEvent

```cangjie
public class TapGestureEvent <: BaseGestureEvent {}
```

**功能：** 点击手势的基础手势事件信息，可将该对象作为onGestureJudgeBegin的event参数来传递。

**父类型：**

- [BaseGestureEvent](#class-basegestureevent)

### class GestureInfo

```cangjie
public class GestureInfo {
    public let tag: String,
    public let `type`: GestureTypes,
}
```

**功能：** 手势基础信息。

**起始版本：** 19

#### let `type`

```cangjie
public let `type`: GestureTypes
```

**功能：** 手势类型。

**类型：** [GestureTypes](#enum-gesturetypes)

**读写能力：** 只读

**起始版本：** 19

#### let isSystemGesture

```cangjie
public let isSystemGesture: Bool
```

**功能：** 判断当前手势是否是组件自带的手势。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 19

#### let tag

```cangjie
public let tag: String
```

**功能：** 手势标记。

**类型：** String

**读写能力：** 只读

**起始版本：** 19

### enum GestureTypes

```cangjie
public enum GestureTypes {
    | TAP_GESTURE
    | LONG_PRESS_GESTURE
    | PAN_GESTURE
    | PINCH_GESTURE
    | SWIPE_GESTURE
    | ROTATION_GESTURE
    | DRAG
    | CLICK
}
```

**功能：** 手势类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### CLICK

```cangjie
CLICK
```

**功能：** 点击。

**起始版本：** 19

#### DRAG

```cangjie
DRAG
```

**功能：** 拖拽。

**起始版本：** 19

#### LONG_PRESS_GESTURE

```cangjie
LONG_PRESS_GESTURE
```

**功能：** 长按手势。

**起始版本：** 19

#### PAN_GESTURE

```cangjie
PAN_GESTURE
```

**功能：** 拖动手势。

**起始版本：** 19

#### PINCH_GESTURE

```cangjie
PINCH_GESTURE
```

**功能：** 捏合手势。

**起始版本：** 19

#### ROTATION_GESTURE

```cangjie
ROTATION_GESTURE
```

**功能：** 旋转手势。

**起始版本：** 19

#### SWIPE_GESTURE

```cangjie
SWIPE_GESTURE
```

**功能：** 滑动手势。

**起始版本：** 19

#### TAP_GESTURE

```cangjie
TAP_GESTURE
```

**功能：** 点击手势。

**起始版本：** 19

### enum GestureJudgeResult

```cangjie
public enum GestureJudgeResult {
    | CONTINUE
    | REJECT
}
```

**功能：** 自定义的手势判定结果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### CONTINUE

```cangjie
CONTINUE
```

**功能：** 不影响系统手势判定流程。

**起始版本：** 19

#### REJECT

```cangjie
REJECT
```

**功能：** 对于用户自定义的手势判定结果为失败。

**起始版本：** 19

## 示例代码1

该示例通过配置onGestureJudgeBegin实现了对长按、滑动和拖动手势的自定义判定。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var message: String = ""

    func build() {
        Column() {
            Row() {
                Text(message).width(200).height(80).backgroundColor(Color.GRAY)
            }
            .margin(20.vp)
        }
        .width(100.percent)
        .height(200)
        .borderWidth(2)
        .gesture(
            TapGesture()
            .onAction({ evt =>
                message = "tap1"
            })
        )
        .gesture(
            LongPressGesture()
            .onAction({ evt =>
                message = "longPress"
            })
        )
        .gesture(
            SwipeGesture()
            .onAction({ evt =>
                message = "swipe1"
            })
        )
        .gesture(
            PanGesture()
            .onActionStart({ evt =>
                message = "pan1"
            })
        )
        .onGestureJudgeBegin({ gestureInfo: GestureInfo, event: BaseGestureEvent =>
            // 若该手势类型为长按手势，转换为长按手势事件
            if(event is LongPressGestureEvent) {
                let longPressEvent = (event as LongPressGestureEvent).getOrThrow()
                AppLog.info("repeat = ${longPressEvent.repeat}")
            }
            // 若该手势类型为滑动手势，转换为滑动手势事件
            if(event is SwipeGestureEvent) {
                let swipeGesture = (event as SwipeGestureEvent).getOrThrow()
                AppLog.info("angle = ${swipeGesture.angle }")
            }
            // 若该手势类型为拖动手势，转换为拖动手势事件
            if(event is PanGestureEvent) {
                let panGesture = (event as PanGestureEvent).getOrThrow()
                AppLog.info("velocity = ${panGesture.velocity  }")
            }
            match(gestureInfo.`type`) {
                // 返回 REJECT 会使拖动手势失败
                case GestureTypes.PAN_GESTURE => return GestureJudgeResult.REJECT
                // 返回 CONTINUE 将保持系统判定。
                case _ => return GestureJudgeResult.CONTINUE
            }
        })
    }
}
```

![judge1](figures/gesture_judge_1.gif)

## 示例代码2

该示例通过配置onGestureJudgeBegin判定区域决定长按手势和拖拽是否响应。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.prompt_action.PromptAction
import ohos.resource_manager.*

@Entry
@Component
class EntryView {
    var scroller: Scroller = Scroller()

    func build() {
        Scroll(this.scroller) {
            Column(8) {
                Text(
                    "Drag 上下两层 上层绑定长按，下层绑定拖拽。先长按后平移上半区只会响应长按，先长按后平移下半区只会响应拖拽"
                )
                    .width(100.percent)
                    .fontSize(20)
                Stack(Alignment.Center) {
                    // Stack的下半区是绑定了拖动手势的图像区域
                    Image(@r(app.media.startIcon))
                        .draggable(true)
                        .onDragStart({
                            _ => PromptAction.showToast(message: "Drag 下半区，Image响应")
                        })
                        .width(200)
                        .height(200)
                    // Stack的上半区是绑定了长按手势的浮动区域
                    Stack {

                    }
                        .width(200)
                        .height(200)
                        .hitTestBehavior(HitTestMode.Transparent)
                        .onGestureJudgeBegin(
                            {
                                gestureInfo: GestureInfo, event: BaseGestureEvent =>
                                // 确定tag标志是否有值
                                if (gestureInfo
                                    .tag
                                    .isEmpty()) {
                                    AppLog.info("gestureInfo tag" + gestureInfo
                                        .tag
                                        .toString())
                                }
                                //如果是长按类型手势，判断点击的位置是否在上半区
                                var isLongPressGesture = match (gestureInfo.`type`) {
                                    case GestureTypes.LONG_PRESS_GESTURE => true
                                    case _ => false
                                }
                                AppLog.info("gestureInfo type" + isLongPressGesture.toString())
                                if (isLongPressGesture) {
                                    if (event
                                        .fingerList
                                        .size > 0 && event.fingerList[0].localY < 100.0) {
                                        return GestureJudgeResult.CONTINUE
                                    } else {
                                        return GestureJudgeResult.REJECT
                                    }
                                }
                                return GestureJudgeResult.REJECT
                            }
                        )
                        .gesture(
                            GestureGroup(
                                GestureMode.Parallel,
                                LongPressGesture()
                                    .onAction(
                                        {
                                            event: GestureEvent => PromptAction.showToast(
                                                message: "LongPressGesture 长按上半区 上半区响应")
                                        })
                                    .tag("tap111")
                            )
                        )
                }.width(100.percent)
            }.width(100.percent)
        }
    }
}
```

![judge2](figures/gesture_judge_2.gif)
