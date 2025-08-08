# 组合手势

手势识别组合，即多种手势组合为复合手势，支持连续识别、并行识别和互斥识别。

## 导入模块

```cangjie
import kit.UIkit.*
```

## 权限列表

无

## 创建组件

### init(GestureMode, Array\<GestureType>)

```cangjie
public init(mode: GestureMode, gesture: Array<GestureType>)
```

**功能：** 创建一个手势识别组合。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|mode|[GestureMode](#enum-gesturemode)|是|GestureMode.Sequence|设置组合手势识别模式。|
|gesture|[TapGesture](./cj-universal-gesture-tapgesture.md)<br>[LongPressGesture](./cj-universal-gesture-longpressgesture.md)<br>[PanGesture](./cj-universal-gesture-pangesture.md)<br>[PinchGesture](./cj-universal-gesture-pinchgesture.md)<br>[RotationGesture](./cj-universal-gesture-rotationgesture.md)<br>[SwipeGesture](./cj-universal-gesture-swipegesture.md)<br>[GestureGroup](./cj-universal-gesture-groupgesture.md)|是|-|设置1个或者多个基础手势类型时，这些手势会被识别为组合手势。若此参数Array长度为0则组合手势识别功能不生效。<br>**说明：**<br>当需要为一个组件同时添加单击和双击手势时，可在组合手势中添加两个TapGesture，需要双击手势在前，单击手势在后，否则不生效。|

## 组件事件

### func onCancel(() -> Unit)

```cangjie
public func onCancel(callback: () -> Unit): This
```

**功能：** 顺序组合手势（GestureMode.Sequence）取消后触发该事件。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|() \-> Unit|是|-|回调函数，顺序组合手势（GestureMode.Sequence）取消后触发该回调。|

## 基础类型定义

### enum GestureMode

```cangjie
public enum GestureMode {
    | Sequence
    | Parallel
    | Exclusive
}
```

**功能：** 组合手势的识别模式。

**起始版本：** 12

#### Sequence

```cangjie
Sequence
```

**功能：** 顺序识别，按照手势的注册顺序识别手势，直到所有手势识别成功。若有一个手势识别失败，后续手势识别均失败。顺序识别手势组仅有最后一个手势可以响应onActionEnd。

**起始版本：** 12

#### Parallel

```cangjie
Parallel
```

**功能：** 并发识别，注册的手势同时识别，直到所有手势识别结束，手势识别互相不影响。

**起始版本：** 12

#### Exclusive

```cangjie
Exclusive
```

**功能：** 互斥识别，注册的手势同时识别，若有一个手势识别成功，则结束手势识别。

**起始版本：** 12

## 示例

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var count: Int64 = 0
    @State var offsetX: Float64 = 0.0
    @State var offsetY: Float64 = 0.0
    @State var positionX: Float64 = 0.0
    @State var positionY: Float64 = 0.0
    @State var borderStyles: BorderStyle = BorderStyle.Solid

    func build() {
        Column() {
            Column() {
                Text('sequence gesture\n' + 'LongPress onAction:' + this.count.toString() +
                    '\nPanGesture offset:\nX: ' + this.offsetX.toString() + '\n' + 'Y: ' + this.offsetY.toString())
            }
            .height(200)
            .width(300)
            .padding(20)
            .border(width: 3.vp, style: this.borderStyles)
            .margin(20)
            .translate(x: this.offsetX, y: this.offsetY, z: 0.0)
            .gesture(
                GestureGroup(GestureMode.Sequence,
                [
                    LongPressGesture(repeat: true)
                    .onAction({ event: GestureEvent =>
                        this.count++
                    }),
                    PanGesture()
                    .onActionStart({ event: GestureEvent =>
                        this.borderStyles = BorderStyle.Dashed
                    })
                    .onActionUpdate({ event: GestureEvent =>
                        this.offsetX = this.positionX + event.offsetX
                        this.offsetY = this.positionY + event.offsetY
                    })
                    .onActionEnd({ event: GestureEvent =>
                        this.positionX = this.offsetX
                        this.positionY = this.offsetY
                        this.borderStyles = BorderStyle.Solid
                    })
                    ]
                )
            )
        }
    }
}
```

示意图：

按顺序首先触发长按事件：

![group](figures/group_gesture_1.gif)

长按事件识别结束之后，触发拖动事件，向下方拖动：

![group](figures/group_gesture_2.gif)
