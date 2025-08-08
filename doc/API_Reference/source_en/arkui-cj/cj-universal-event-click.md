# Click Event

A click event refers to the event triggered when a component is clicked.

## func onClick((ClickEvent) -> Unit)

```cangjie
public open func onClick(callback: (ClickEvent)->Unit): This
```

**Function:** Event triggered when the component is clicked.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([ClickEvent](#class-clickevent))->Unit | Yes | - | Callback function triggered when the component is clicked. |

> **Note:**
>
> 1. If a finger is pressed for more than 800ms, the click event cannot be triggered.
> 2. If the finger moves more than 20px after being pressed, the click event cannot be triggered.

## Basic Type Definitions

### class ClickEvent

```cangjie
public class ClickEvent {
    public ClickEvent(
        public var x: Float64,
        public var y: Float64,
        public var timestamp: Int64,
        public var source: SourceType,
        public var target: EventTarget,
        public var windowX: Float64,
        public var windowY: Float64,
        public var displayX: Float64,
        public var displayY: Float64
    )
}
```

**Function:** Describes the type of click event.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### var displayX

```cangjie
public var displayX: Float64
```

**Function:** Marks the horizontal absolute coordinate of the click point relative to the top-left corner of the screen.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var displayY

```cangjie
public var displayY: Float64
```

**Function:** Marks the vertical absolute coordinate of the click point relative to the top-left corner of the screen.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var source

```cangjie
public var source: SourceType
```

**Function:** Identifies the type of device that triggered the click.

**Type:** [SourceType](./cj-common-types.md#enum-sourcetype)

**Read/Write:** Readable and Writable

**Since:** 12

#### var target

```cangjie
public var target: EventTarget
```

**Function:** The display area of the element object that triggered the event.

**Type:** [EventTarget](#class-eventtarget)

**Read/Write:** Readable and Writable

**Since:** 12

#### var timestamp

```cangjie
public var timestamp: Int64
```

**Function:** Records the time interval between the event occurrence and system startup.

**Type:** Int64

**Read/Write:** Readable and Writable

**Since:** 12

#### var windowX

```cangjie
public var windowX: Float64
```

**Function:** Locates the horizontal coordinate of the click point relative to the top-left corner of the application window.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var windowY

```cangjie
public var windowY: Float64
```

**Function:** Locates the vertical coordinate of the click point relative to the top-left corner of the application window.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var x

```cangjie
public var x: Float64
```

**Function:** Records the horizontal position coordinate of the click point within the element.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### var y

```cangjie
public var y: Float64
```

**Function:** Records the vertical position coordinate of the click point within the element.

**Type:** Float64

**Read/Write:** Readable and Writable

**Since:** 12

#### ClickEvent(Float64, Float64, Int64, SourceType, EventTarget, Float64, Float64, Float64, Float64)

```cangjie
public ClickEvent(
    public var x: Float64,
    public var y: Float64,
    public var timestamp: Int64,
    public var source: SourceType,
    public var target: EventTarget,
    public var windowX: Float64,
    public var windowY: Float64,
    public var displayX: Float64,
    public var displayY: Float64
)
```

**Function:** Constructs a ClickEvent object.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float64 | Yes | - | The X coordinate of the click position relative to the left edge of the clicked element. |
| y | Float64 | Yes | - | The Y coordinate of the click position relative to the top-left corner of the clicked element's original area. |
| timestamp | Int64 | Yes | - | Event timestamp. The time interval between the event trigger and system startup. |
| source | [SourceType](./cj-common-types.md#enum-sourcetype) | Yes | - | The input device that triggered the event. |
| target | [EventTarget](#class-eventtarget) | Yes | - | The display area of the element object that triggered the event. |
| windowX | Float64 | Yes | - | The X coordinate of the click position relative to the top-left corner of the application window. |
| windowY | Float64 | Yes | - | The Y coordinate of the click position relative to the top-left corner of the application window. |
| displayX | Float64 | Yes | - | The X coordinate of the click position relative to the top-left corner of the application screen. |
| displayY | Float64 | Yes | - | The Y coordinate of the click position relative to the top-left corner of the application screen. |

### class EventTarget

```cangjie
public class EventTarget {
    public EventTarget(public var area: Area)
}
```

**Function:** The display area of the element object that triggered the event.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### var area

```cangjie
public var area: Area
```

**Function:** Defines the target area.

**Type:** [Area](./cj-common-types.md#class-area)

**Read/Write:** Readable and Writable

**Since:** 19

#### EventTarget(Area)

```cangjie
public EventTarget(public var area: Area)
```

**Function:** Constructs an EventTarget object.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| area | [Area](./cj-common-types.md#class-area) | Yes | - | The area information of the target element. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

func resolvePosition(evt: Position) {
  return "x: " + evt.x.toString() + ", y: " + evt.y.toString()
}

func resolvePositionF64(evt: Position) {
  return evt.x + evt.y
}

func resolveEventTarget(evt: EventTarget) {
  return "area_width: ${evt.area.width}\narea_height: ${evt.area.height}\narea_position: ${resolvePosition(evt.area.position)}\narea_globalPosition : ${resolvePosition(evt.area.globalPosition)} "
}

func resolveClickEvent(evt: ClickEvent) {
  return "x: ${evt.x}\ny: ${evt.y}\ntimestamp: ${evt.timestamp}\ntarget: ${resolveEventTarget(evt.target)}\nwindowX: ${evt.windowX}\nwindowY: ${evt.windowY}\ndisplayX: ${evt.displayX}\ndisplayY: ${evt.displayY} "
}

@Entry
@Component
class EntryView{
  @State var clickEventMsg: String = ""
  @State var clickEventMsg2: String = ""

  func build() {
    Column(10) {
        Button("Click").backgroundColor(0x2788D9)
          .onClick({event =>
              this.clickEventMsg = resolveClickEvent(event) + event.source.toString()
              AppLog.info(this.clickEventMsg)
          }).width(200.vp)

        Button("Click").backgroundColor(0x2788D9)
          .onClick({event =>
              this.clickEventMsg2 = resolveClickEvent(event) + event.source.toString()
              AppLog.info(this.clickEventMsg2)
          }).width(200.px)

      Text(this.clickEventMsg).padding(15).width(100.percent)
      Text(this.clickEventMsg2).padding(15).width(100.percent)
    }
  }
}
```

![clickevent](figures/clickevent.gif)