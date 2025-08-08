# PinchGesture

Used to trigger pinch gestures. The minimum number of fingers required is 2, the maximum is 5, and the minimum recognition distance is 5vp.

## Creating the Component

### init(Int32, Float64)

```cangjie
public init(fingers!: Int32 = 2, distance!: Float64 = 5.0)
```

**Function:** Creates a pinch gesture.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|fingers|Int32|No|2| **Named parameter.** Minimum number of fingers required to trigger the pinch gesture (minimum 2, maximum 5).<br/> **Note:** <br/> More fingers than specified can be used to trigger the gesture, but only the first fingers that make contact (equal to the specified number) will participate in gesture calculation.|
|distance|Float64|No|5.0| **Named parameter.** Minimum recognition distance in vp units. <br/> **Note:** <br/> If the recognition distance value is less than or equal to 0, it will be converted to the default value.|

## Component Events

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Pinch gesture is successfully recognized.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Callback function triggered when the pinch gesture is successfully recognized.|

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered during movement of the Pinch gesture.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Callback function triggered during movement of the Pinch gesture.|

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when fingers are lifted after successful recognition of the Pinch gesture.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Callback function triggered when fingers are lifted after successful recognition of the Pinch gesture.|

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when a touch cancellation event is received after successful recognition of the Pinch gesture.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Callback function triggered when a touch cancellation event is received after successful recognition of the Pinch gesture.|

## Example Code

This example demonstrates three-finger pinch gesture recognition through PinchGesture configuration.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
@State var scaleValue: Float64 = 1.0
    @State var pinchValue: Float64 = 1.0
    @State var pinchX: Float64 = 0.0
    @State var pinchY: Float64 = 0.0

    func build() {
        Column() {
            Column() {
                Text('PinchGesture scale:\n' + this.scaleValue.toString())
                Text('PinchGesture center:\n(' + this.pinchX.toString() + ',' + this.pinchY.toString() + ')')
            }
            .height(200)
            .width(300)
            .padding(20)
            .border(width: 3.vp)
            .scale(x: Float32(this.scaleValue), y: Float32(this.scaleValue), z: 1.0)
            .gesture(
                PinchGesture(fingers: 3)
                .onActionUpdate({ event: GestureEvent =>
                    this.scaleValue = this.pinchValue * event.scale
                    this.pinchX = event.pinchCenterX
                    this.pinchY = event.pinchCenterY
                })
                .onActionEnd({ event: GestureEvent =>
                    this.pinchValue = this.scaleValue
                })
            )
        }
    }
}
```

![pinch](figures/pinch_gesture.gif)