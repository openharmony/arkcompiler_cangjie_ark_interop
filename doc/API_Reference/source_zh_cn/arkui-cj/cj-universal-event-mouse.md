# 鼠标事件

在单个动作触发多个事件时，事件的顺序是固定的，鼠标事件默认透传。

> 说明：
>
> 目前仅支持通过外接鼠标触发。

## 权限列表

无

## func onMouse(MouseEvent)

```cangjie
public func onMouse(callback: (MouseEvent)->Unit): This
```

**功能：** 当前组件被鼠标按键点击时或者鼠标在组件上移动时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([MouseEvent](#class-mouseevent))->Unit|是|-|组件被鼠标按键点击时或者鼠标在组件上移动时触发该回调。MouseEvent参数包含触发事件时的时间戳、鼠标按键、动作、点击触点在整个屏幕上的坐标和点击触点相对于当前组件的坐标。|

## 基础类型定义

### class MouseEvent

```cangjie
public class MouseEvent {
    public MouseEvent(
        public var timestamp: Int64,
        public var screenX: Float64,
        public var screenY: Float64,
        public var x: Float64,
        public var y: Float64,
        public var button: MouseButton,
        public var action: MouseAction
    )
}
```

**功能：** 用于描述鼠标事件的对象。

**起始版本：** 12

#### var timestamp

```cangjie
public var timestamp: Int64
```

**功能：** 触发事件时的时间戳。

**类型：** Int64

**读写能力：** 可读写

**起始版本：** 12

#### var screenX

```cangjie
public var screenX: Float64
```

**功能：** 点击触点相对于屏幕左上角的x轴坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

#### var screenY

```cangjie
public var screenY: Float64
```

**功能：** 点击触点相对于屏幕左上角的y轴坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

#### var x

```cangjie
public var x: Float64
```

**功能：** 点击触点相对于当前组件左上角的x轴坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

#### var y

```cangjie
public var y: Float64
```

**功能：** 点击触点相对于当前组件左上角的y轴坐标。

**类型：** Float64

**读写能力：** 可读写

**起始版本：** 12

#### var button

```cangjie
public var button: MouseButton
```

**功能：** 鼠标按键。

**类型：** [MouseButton](./cj-common-types.md#enum-mousebutton)

**读写能力：** 可读写

**起始版本：** 12

#### var action

```cangjie
public var action: MouseAction
```

**功能：** 事件动作。

**类型：** [MouseAction](./cj-common-types.md#enum-mouseaction)

**读写能力：** 可读写

**起始版本：** 12

#### MouseEvent(Int64, Float64, Float64, Float64, Float64, MouseButton, MouseAction)

```cangjie
public MouseEvent(
    public var timestamp: Int64,
    public var screenX: Float64,
    public var screenY: Float64,
    public var x: Float64,
    public var y: Float64,
    public var button: MouseButton,
    public var action: MouseAction
)
```

**功能：** 构造鼠标事件类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|timestamp|Int64|是|-|触发事件时的时间戳。|
|screenX|Float64|是|-|点击触点相对于屏幕左上角的x轴坐标。|
|screenY|Float64|是|-|点击触点相对于屏幕左上角的y轴坐标。|
|x|Float64|是|-|点击触点相对于当前组件左上角的x轴坐标。|
|y|Float64|是|-|点击触点相对于当前组件左上角的y轴坐标。|
|button|[MouseButton](./cj-common-types.md#enum-mousebutton)|是|-|鼠标按键。|
|action|[MouseAction](./cj-common-types.md#enum-mouseaction)|是|-|事件动作。|

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var hoverText: String = "no hover"
    @State var mouseText: String = "MouseText"
    @State var color: Color = Color.BLUE
    func build() {
        Column(20) {
            Button(this.hoverText)
            .onHover({isHover =>
            if (isHover) {
                this.hoverText = "on hover"
                this.color = Color.RED
            } else {
                this.hoverText = "no hover"
                this.color = Color.BLUE
            }
            })
            .backgroundColor(this.color)

            Button("onMouse")
            .onMouse({event =>
                this.mouseText = """
                    onMouse:
                    Button = ${event.button.toString()}
                    Action = ${event.action.toString()}
                    localXY = (${event.x} , ${event.y})
                    screenXY = (${event.screenX} , ${event.screenY})
                    """
                AppLog.info(this.mouseText)
            })
            Text(this.mouseText)
        }.width(100.percent)
    }
}
```

![mouse_event](figures/mouse_event.png)
