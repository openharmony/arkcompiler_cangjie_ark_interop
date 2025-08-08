# SwipeGesture

Used to trigger swipe events, recognized successfully when swipe speed exceeds 100vp/s.

## Creating Components

### init(Int32, SwipeDirection, Float64)

```cangjie
public init(fingers!: Int32 = 1, direction!: SwipeDirection = SwipeDirection.All, speed!: Float64 = 100.0)
```

**Function:** Creates a swipe gesture.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fingers | Int32 | No | 1 | **Named parameter.** Minimum number of fingers required to trigger swipe (default: 1, min: 1, max: 10). |
| direction | [SwipeDirection](#enum-swipedirection) | No | SwipeDirection.All | **Named parameter.** Swipe direction to trigger the gesture. |
| speed | Float64 | No | 100.0 | **Named parameter.** Minimum speed required for recognition.<br/>**Note:** Values ≤0 will be converted to default. |

## Component Events

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when swipe gesture recognition succeeds.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback function triggered upon successful swipe recognition. |

## Basic Type Definitions

### enum SwipeDirection

```cangjie
public enum SwipeDirection {
    | Horizontal
    | Vertical
    | All
    | None
}
```

**Function:** Specifies swipe direction for gesture triggering.

**Since:** 19

#### All

```cangjie
All
```

**Function:** All directions.

**Since:** 19

#### Horizontal

```cangjie
Horizontal
```

**Function:** Horizontal direction (triggered when swipe angle with x-axis <45°).

**Since:** 19

#### None

```cangjie
None
```

**Function:** Disables swipe gesture triggering in all directions.

**Since:** 19

#### Vertical

```cangjie
Vertical
```

**Function:** Vertical direction (triggered when swipe angle with y-axis <45°).

**Since:** 19

## Example Code

This example implements swipe gesture recognition through SwipeGesture configuration.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var rotateAngle: Float64 = 0.0
    @State var speed: Float64 = 1.0

    func build() {
        Column() {
            Column() {
                Text("SwipeGesture speed\n" + this.speed.toString())
                Text("SwipeGesture angle\n" + this.rotateAngle.toString())
            }
            .height(200)
            .width(300)
            .padding(20)
            .border(width: 3.vp)
            .margin(80)
            .rotate(Float32(this.rotateAngle))
            .gesture(
                SwipeGesture(direction: SwipeDirection.Vertical)
                .onAction({ event: GestureEvent =>
                    this.speed = event.speed
                    this.rotateAngle = event.angle
                })
            )
        }
    }
}
```

![swipe](figures/swipe_gesture.gif)