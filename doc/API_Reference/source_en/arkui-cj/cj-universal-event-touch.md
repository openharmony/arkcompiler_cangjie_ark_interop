# Touch Event

Triggered when a finger presses, slides, or lifts on a component.

## Permission List

None

## func onTouch((TouchEvent)->Unit)

```cangjie
public func onTouch(callback: (TouchEvent)->Unit): This
```

**Function:** Triggered by finger touch actions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([TouchEvent](#class-touchevent))->Unit | Yes | - | Callback function triggered by finger touch actions. |

## Basic Type Definitions

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

**Function:** Inherits from [BaseEvent](./cj-universal-gesture-judge.md#class-baseevent). In non-event injection scenarios, `changedTouches` are points resampled at the screen refresh rate, while `touches` are points reported at the device refresh rate. Data in `changedTouches` may differ from that in `touches`.

**Since:** 12

#### var isStopPropagation

```cangjie
public var isStopPropagation: Bool = false
```

**Function:** Controls event propagation.

**Type:** Bool

**Read/Write:** Readable and Writable

**Since:** 12

#### var eventType

```cangjie
public var eventType: TouchType
```

**Function:** Type of the touch event.

**Type:** [TouchType](cj-common-types.md#enum-touchtype)

**Read/Write:** Readable and Writable

**Since:** 12

#### var touches

```cangjie
public var touches: ArrayList<TouchObject>
```

**Function:** Information about all fingers.

**Type:** ArrayList\<[TouchObject](#class-touchobject)>

**Read/Write:** Readable and Writable

**Since:** 12

#### var changedTouches

```cangjie
public var changedTouches: ArrayList<TouchObject>
```

**Function:** Information about currently changed fingers.

**Type:** ArrayList\<[TouchObject](#class-touchobject)>

**Read/Write:** Readable and Writable

**Since:** 12

#### var timestamp

```cangjie
public var timestamp: Int64
```

**Function:** Timestamp relative to system boot time, in milliseconds.

**Type:** Int64

**Read/Write:** Readable and Writable

**Since:** 12

#### var target

```cangjie
public var target: EventTarget
```

**Function:** The touched element object.

**Type:** [EventTarget](cj-universal-gesture-bind.md#class-eventtarget)

**Read/Write:** Readable and Writable

**Since:** 12

#### var source

```cangjie
public var source: SourceType
```

**Function:** Event input device.

**Type:** [SourceType](cj-common-types.md#enum-sourcetype)

**Read/Write:** Readable and Writable

**Since:** 12

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

**Function:** Constructs an object of touch event type.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| eventType | [TouchType](cj-common-types.md#enum-touchtype) | Yes | - | Type of the touch event. |
| touches | ArrayList\<[TouchObject](#class-touchobject)> | Yes | - | Information about all fingers. |
| changedTouches | ArrayList\<[TouchObject](#class-touchobject)> | Yes | - | Information about currently changed fingers. |
| timestamp | Int64 | Yes | - | Timestamp relative to system boot time, in milliseconds. |
| target | [EventTarget](cj-universal-gesture-bind.md#class-eventtarget) | Yes | - | The touched element object. |
| source | [SourceType](cj-common-types.md#enum-sourcetype) | Yes | - | Event input device. |

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

**Function:** Represents the type of information about currently changed fingers.

**Since:** 12

#### var touchType

```cangjie
public var touchType: TouchType
```

**Function:** Type of the touch event.

**Type:** [TouchType](./cj-common-types.md#enum-touchtype)

**Read/Write:** Readable and Writable

**Since:** 12

#### var id

```cangjie
public var id: Int32
```

**Function:** Unique identifier of the finger.

**Type:** Int32

**Read/Write:** Readable and Writable

**Since:** 12

#### var screenX

```cangjie
public var screenX: Float64
```

**Function:** X-coordinate of the touch point relative to the left edge of the device screen.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var screenY

```cangjie
public var screenY: Float64
```

**Function:** Y-coordinate of the touch point relative to the top edge of the device screen.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var x

```cangjie
public var x: Float64
```

**Function:** X-coordinate of the touch point relative to the left edge of the touched element.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var y

```cangjie
public var y: Float64
```

**Function:** Y-coordinate of the touch point relative to the top edge of the touched element.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

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

**Function:** Constructs an object of touch event type.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| touchType | [TouchType](./cj-common-types.md#enum-touchtype) | Yes | - | Type of the touch event. |
| id | Int32 | Yes | - | Unique identifier of the finger. |
| screenX | Float64 | Yes | - | X-coordinate of the touch point relative to the left edge of the device screen. |
| screenY | Float64 | Yes | - | Y-coordinate of the touch point relative to the top edge of the device screen. |
| x | Float64 | Yes | - | X-coordinate of the touch point relative to the left edge of the touched element. |
| y | Float64 | Yes | - | Y-coordinate of the touch point relative to the top edge of the touched element. |## Example Code

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