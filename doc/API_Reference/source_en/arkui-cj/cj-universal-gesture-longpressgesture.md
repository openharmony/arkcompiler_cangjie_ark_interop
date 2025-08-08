# LongPressGesture

Used to trigger long-press gesture events. The minimum number of fingers required to trigger a long-press gesture is 1, and the minimum long-press duration is 500 milliseconds.

## Creating the Component

### init(Int32, Bool, Int32)

```cangjie
public init(fingers!: Int32 = 1, repeat!: Bool = false, duration!: Int32 = 500)
```

**Function:** Creates a long-press gesture recognizer. When a component inherently supports drag operations (such as Text, TextInput, TextArea, HyperLink, Image, and RichEditor components), there may be conflicts between long-press gestures and drag operations. The event priority is as follows:

If long-press trigger time < 500ms, long-press events take precedence over drag events.

If long-press trigger time >= 500ms, drag events take precedence over long-press events.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fingers | Int32 | No | 1 | **Named parameter.** Minimum number of fingers required to trigger a long-press gesture. Minimum value is 1, maximum value is 10. <br/> **Note:** <br/> If finger movement exceeds 15px after pressing down, the long-press gesture recognition will fail. |
| repeat | Bool | No | false | **Named parameter.** Whether to continuously trigger event callbacks. |
| duration | Int32 | No | 500 | **Named parameter.** Minimum duration required to trigger a long-press gesture, in milliseconds (ms). <br/> **Note:** <br/> If set to 0 or below, the default value of 500 will be used. |

## Component Events

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**Function:** Callback triggered when LongPress gesture recognition succeeds.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback function triggered when LongPress gesture recognition succeeds. |

### func onActionCancel(() -> Unit)

```cangjie
public func onActionCancel(callback: () -> Unit): This
```

**Function:** Callback triggered when LongPress gesture recognition succeeds but receives a touch cancellation event.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ()->Unit | Yes | - | Callback function triggered when LongPress gesture recognition succeeds but receives a touch cancellation event. |

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**Function:** Callback triggered after LongPress gesture recognition succeeds and the last finger is lifted.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback function triggered after LongPress gesture recognition succeeds and the last finger is lifted. |

## Example Code

This example demonstrates long-press gesture recognition using LongPressGesture.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var count: Int64 = 0

    func build() {
        Column() {
            Text("LongPress onAction:" + this.count.toString()).fontSize(28)
            .gesture(
                LongPressGesture(repeat: true)
                .onAction({event: GestureEvent  =>
                    if(event.repeat) {
                        this.count ++
                    }
                })
                .onActionEnd({event: GestureEvent  =>
                    this.count = 0
                })
            )
        }
        .height(200)
        .width(300)
        .padding(20)
        .border(width: 3.vp)
        .margin(30)
    }
}
```

![longpress](figures/longpress_gesture.gif)