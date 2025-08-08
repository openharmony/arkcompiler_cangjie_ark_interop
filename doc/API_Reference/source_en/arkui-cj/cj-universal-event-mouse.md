# Mouse Events

When a single action triggers multiple events, the order of events is fixed, and mouse events are transmitted by default.

> Note:
>
> Currently, only external mouse triggers are supported.

## Permission List

None

## func onMouse(MouseEvent)

```cangjie
public func onMouse(callback: (MouseEvent)->Unit): This
```

**Function:** Triggered when the current component is clicked by a mouse button or when the mouse moves over the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([MouseEvent](#class-mouseevent))->Unit | Yes | - | Callback triggered when the component is clicked by a mouse button or when the mouse moves over the component. The MouseEvent parameter includes the timestamp when the event was triggered, the mouse button, the action, the coordinates of the click point on the entire screen, and the coordinates of the click point relative to the current component. |

## Basic Type Definitions

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

**Function:** Object used to describe mouse events.

**Since:** 12

#### var timestamp

```cangjie
public var timestamp: Int64
```

**Function:** Timestamp when the event was triggered.

**Type:** Int64

**Read/Write:** Readable and Writable

**Since:** 12

#### var screenX

```cangjie
public var screenX: Float64
```

**Function:** X-coordinate of the click point relative to the top-left corner of the screen.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var screenY

```cangjie
public var screenY: Float64
```

**Function:** Y-coordinate of the click point relative to the top-left corner of the screen.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var x

```cangjie
public var x: Float64
```

**Function:** X-coordinate of the click point relative to the top-left corner of the current component.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var y

```cangjie
public var y: Float64
```

**Function:** Y-coordinate of the click point relative to the top-left corner of the current component.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var button

```cangjie
public var button: MouseButton
```

**Function:** Mouse button.

**Type:** [MouseButton](./cj-common-types.md#enum-mousebutton)

**Read/Write:** Readable and Writable

**Since:** 12

#### var action

```cangjie
public var action: MouseAction
```

**Function:** Event action.

**Type:** [MouseAction](./cj-common-types.md#enum-mouseaction)

**Read/Write:** Readable and Writable

**Since:** 12

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

**Function:** Constructs an object of the mouse event type.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| timestamp | Int64 | Yes | - | Timestamp when the event was triggered. |
| screenX | Float64 | Yes | - | X-coordinate of the click point relative to the top-left corner of the screen. |
| screenY | Float64 | Yes | - | Y-coordinate of the click point relative to the top-left corner of the screen. |
| x | Float64 | Yes | - | X-coordinate of the click point relative to the top-left corner of the current component. |
| y | Float64 | Yes | - | Y-coordinate of the click point relative to the top-left corner of the current component. |
| button | [MouseButton](./cj-common-types.md#enum-mousebutton) | Yes | - | Mouse button. |
| action | [MouseAction](./cj-common-types.md#enum-mouseaction) | Yes | - | Event action. |

## Example Code

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