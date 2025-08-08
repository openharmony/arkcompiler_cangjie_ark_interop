# 触摸事件

当手指在组件上按下、滑动、抬起时触发。

## 权限列表

无

## func onTouch((TouchEvent)->Unit)

```cangjie
public func onTouch(callback: (TouchEvent)->Unit): This
```

**功能：** 手指触摸动作触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([TouchEvent](#class-touchevent))->Unit|是|-|回调函数，手指触摸动作触发该回调。|

## 基础类型定义

### class TouchEvent

```cangjie
public class TouchEvent {
    public var isStopPropagation: Bool = false
    public TouchEvent(
        public var eventType: TouchType,
        public var touches: ArrayList<TouchObject>,
        public var changedTouches: ArrayList<TouchObject>,
        public var timestamp: Int64,
        public var target: EventTarget,
        public var source: SourceType
    )
}
```

**功能：** 继承于[BaseEvent](./cj-universal-gesture-judge.md#class-baseevent)。非事件注入场景下，changedTouches是按屏幕显示刷新率重采样的点，touches是按器件刷新率报上来的点，changedTouches的数据可能会和touches里面的不相同。

**起始版本：** 12

#### var isStopPropagation

```cangjie
public var isStopPropagation: Bool = false
```

**功能：** 控制事件的传播。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 12

#### var eventType

```cangjie
public var eventType: TouchType
```

**功能：** 触摸事件的类型。

**类型：** [TouchType](cj-common-types.md#enum-touchtype)

**读写能力：** 可读写

**起始版本：** 12

#### var touches

```cangjie
public var touches: ArrayList<TouchObject>
```

**功能：** 全部手指信息。

**类型：** ArrayList\<[TouchObject](#class-touchobject)>

**读写能力：** 可读写

**起始版本：** 12

#### var changedTouches

```cangjie
public var changedTouches: ArrayList<TouchObject>
```

**功能：** 当前发生变化的手指信息。

**类型：** ArrayList\<[TouchObject](#class-touchobject)>

**读写能力：** 可读写

**起始版本：** 12

#### var timestamp

```cangjie
public var timestamp: Int64
```

**功能：** 距离开机时间的时间戳，单位为毫秒。

**类型：** Int64

**读写能力：** 可读写

**起始版本：** 12

#### var target

```cangjie
public var target: EventTarget
```

**功能：** 被触摸元素对象。

**类型：** [EventTarget](cj-universal-gesture-bind.md#class-eventtarget)

**读写能力：** 可读写

**起始版本：** 12

#### var source

```cangjie
public var source: SourceType
```

**功能：** 事件输入设备。

**类型：** [SourceType](cj-common-types.md#enum-sourcetype)

**读写能力：** 可读写

**起始版本：** 12

#### TouchEvent(TouchType, ArrayList\<TouchObject>, ArrayList\<TouchObject>, Int64, EventTarget, SourceType)

```cangjie
public TouchEvent(
    public var eventType: TouchType,
    public var touches: ArrayList<TouchObject>,
    public var changedTouches: ArrayList<TouchObject>,
    public var timestamp: Int64,
    public var target: EventTarget,
    public var source: SourceType
)
```

**功能：** 构造触摸事件类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|eventType|[TouchType](cj-common-types.md#enum-touchtype)|是|-|触摸事件的类型。|
|touches|ArrayList\<[TouchObject](#class-touchobject)>|是|-|全部手指信息。|
|changedTouches|ArrayList\<[TouchObject](#class-touchobject)>|是|-|当前发生变化的手指信息。|
|timestamp|Int64|是|-|距离开机时间的时间戳，单位为毫秒。|
|target|[EventTarget](cj-universal-gesture-bind.md#class-eventtarget)|是|-|被触摸元素对象。|
|source|[SourceType](cj-common-types.md#enum-sourcetype)|是|-|事件输入设备。|

### class TouchObject

```cangjie
public class TouchObject {
    public TouchObject(
        public var touchType: TouchType,
        public var id: Int32,
        public var screenX: Float64,
        public var screenY: Float64,
        public var x: Float64,
        public var y: Float64
    )
}
```

**功能：** 表示当前发生变化的手指信息类型。

**起始版本：** 12

#### var touchType

```cangjie
public var touchType: TouchType
```

**功能：** 触摸事件的类型。

**类型：** [TouchType](./cj-common-types.md#enum-touchtype)

**读写能力：** 可读写

**起始版本：** 12

#### var id

```cangjie
public var id: Int32
```

**功能：** 手指唯一标识符。

**类型：** Int32

**读写能力：** 可读写

**起始版本：** 12

#### var screenX

```cangjie
public var screenX: Float64
```

**功能：** 触摸点相对于设备屏幕左边沿的X坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

#### var screenY

```cangjie
public var screenY: Float64
```

**功能：** 触摸点相对于设备屏幕上边沿的Y坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

#### var x

```cangjie
public var x: Float64
```

**功能：** 触摸点相对于被触摸元素左边沿的X坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

#### var y

```cangjie
public var y: Float64
```

**功能：** 触摸点相对于被触摸元素上边沿的Y坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

#### TouchObject(TouchType, Int32, Float64, Float64, Float64, Float64)

```cangjie
public TouchObject(
    public var touchType: TouchType,
    public var id: Int32,
    public var screenX: Float64,
    public var screenY: Float64,
    public var x: Float64,
    public var y: Float64
)
```

**功能：** 构造触摸事件类型对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|touchType|[TouchType](./cj-common-types.md#enum-touchtype)|是|-|触摸事件的类型。|
|id|Int32|是|-|手指唯一标识符。|
|screenX|Float64|是|-|触摸点相对于设备屏幕左边沿的X坐标。|
|screenY|Float64|是|-|触摸点相对于设备屏幕上边沿的Y坐标。|
|x|Float64|是|-|触摸点相对于被触摸元素左边沿的X坐标。|
|y|Float64|是|-|触摸点相对于被触摸元素上边沿的Y坐标。|

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView{
    @State var text: String = ""
    func build(): Unit {
        Column() {
            Button("Click").backgroundColor(0x2788D9)
                .onTouch({event =>
                    this.text = """
                    TouchType: ${event.eventType.toString()}
                    timestamp: ${event.timestamp}
                    Distance between touch point and touch element:
                    x: ${event.touches[0].x}
                    y: ${event.touches[0].y}
                    Component localPos:(${event.target.area.position.x}, ${event.target.area.position.y})
                    Component globalPos:(${event.target.area.globalPosition.x}, ${event.target.area.globalPosition.y})
                    width: ${event.target.area.width}
                    height: ${event.target.area.height}
                    """
                    AppLog.info(this.text)
                }).width(200.vp)

            Button("Click").backgroundColor(0x2788D9)
                .onTouch({event =>
                    this.text = """
                    TouchType: ${event.eventType.toString()}
                    timestamp: ${event.timestamp}
                    Distance between touch point and touch element:
                    x: ${event.touches[0].x}
                    y: ${event.touches[0].y}
                    Component localPos:(${event.target.area.position.x}, ${event.target.area.position.y})
                    Component globalPos:(${event.target.area.globalPosition.x}, ${event.target.area.globalPosition.y})
                    width: ${event.target.area.width}
                    height: ${event.target.area.height}
                    """
                    AppLog.info(this.text)
                }).width(200.px)
            Text(this.text).padding(15).width(100.percent)
            }
    }
}
```

![touch_event](figures/touch_event.gif)
