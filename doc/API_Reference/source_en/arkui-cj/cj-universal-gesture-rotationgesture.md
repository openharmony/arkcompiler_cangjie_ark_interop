# RotationGesture

Used to trigger rotation gesture events. The minimum number of fingers required to trigger a rotation gesture is 2, with a maximum of 5 fingers. The minimum rotation angle change is 1 degree.

## Creating the Component

### init(Int32, Float64)

```cangjie
public init(fingers!: Int32 = 2, angle!: Float64 = 1.0)
```

**Function:** Creates a rotation gesture.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fingers | Int32 | No | 2 | **Named parameter.** Minimum number of fingers required to trigger rotation (min: 2, max: 5).<br/> **Note:** <br/> More fingers than specified can touch, but only the first two fingers will participate in gesture calculation. |
| angle | Float64 | No | 1.0 | **Named parameter.** Minimum rotation angle change required to trigger the gesture (unit: deg). <br/> **Note:** <br/> Values ≤0 or >360 will be converted to the default value. |

## Component Events

### func onActionCancel(() -> Unit)

```cangjie
public func onActionCancel(callback: () -> Unit): This
```

**Function:** Triggered when rotation gesture recognition succeeds and receives a touch cancel event.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ()->Unit | Yes | - | Callback function triggered when rotation gesture recognition succeeds and receives a touch cancel event. |

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when rotation gesture recognition succeeds and fingers are lifted.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback function triggered when rotation gesture recognition succeeds and fingers are lifted. |

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when rotation gesture recognition succeeds.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback function triggered when rotation gesture recognition succeeds. |

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered during rotation gesture movement.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback function triggered during rotation gesture movement. |

## Example Code

This example implements two-finger rotation gesture recognition through RotationGesture configuration.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var scaleValue: Float64 = 1.0
    @State var angle: Float64 = 0.0
    @State var rotateValue: Float64 = 0.0

    func build() {
        Column() {
            Column() {
                Text('RotationGesture angle:' + this.angle.toString())
            }
            .height(200)
            .width(300)
            .padding(20)
            .border(width: 3.vp)
            .margin(80)
            .rotate(Float32(this.angle))
            .gesture(
                RotationGesture()
                .onActionUpdate({ event: GestureEvent =>
                    this.angle = this.rotateValue + event.angle
                })
                .onActionEnd({ event: GestureEvent =>
                    this.rotateValue = this.angle
                })
            )
        }
    }
}
```

![rotation](figures/rotation_gesture.gif)