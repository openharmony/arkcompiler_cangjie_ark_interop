# PanGesture  

A swipe gesture event that triggers when the minimum swipe distance reaches the set threshold.  

## Creating the Component  

### init(Int32, PanDirection, Float64)  

```cangjie  
public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)  
```  

**Function:** Creates a swipe gesture.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| fingers | Int32 | No | 1 | **Named parameter.** The minimum number of fingers required to trigger the swipe, with a minimum of 1 and a maximum of 10. <br/> **Note:** <br/> If the set value is less than 1 or not set, it will be converted to the default value. |  
| direction | [PanDirection](#enum-pandirection) | No | PanDirection.All | Specifies the swipe direction for triggering the gesture. This enumeration supports logical AND (&) and logical OR (\| **Named parameter.** ) operations. |  
| distance | Float64 | No | 5.0 | **Named parameter.** Specifies the minimum swipe distance (in pixels) required to trigger the swipe gesture event. <br/> **Note:** <br/> If the set value is less than 0, it will default to 5. |  

### init(PanGestureOptions)  

```cangjie  
public init(panGestureOptions: PanGestureOptions)  
```  

**Function:** Creates a swipe gesture.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| panGestureOptions | [PanGestureOptions](#enum-pandirection) | Yes | - | The PanGestureOptions object allows dynamic modification of the pan gesture recognizer's properties, avoiding UI refreshes caused by state variable changes. |  

## Component Events  

### func onActionCancel(() -> Unit)  

```cangjie  
public func onActionCancel(callback: () -> Unit): This  
```  

**Function:** Callback triggered when the pan gesture is successfully recognized and a touch cancellation event is received.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| callback | () -> Unit | Yes | - | Callback function triggered when the pan gesture is recognized and a touch cancellation event occurs. |  

### func onActionEnd((GestureEvent) -> Unit)  

```cangjie  
public func onActionEnd(callback: (GestureEvent) -> Unit): This  
```  

**Function:** Callback triggered when the pan gesture is successfully recognized and the finger is lifted.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent)) -> Unit | Yes | - | Callback function triggered when the pan gesture is recognized and the finger is lifted. |  

### func onActionStart((GestureEvent) -> Unit)  

```cangjie  
public func onActionStart(callback: (GestureEvent) -> Unit): This  
```  

**Function:** Callback triggered when the pan gesture is successfully recognized.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent)) -> Unit | Yes | - | Callback function triggered when the pan gesture is recognized. |  

### func onActionUpdate((GestureEvent) -> Unit)  

```cangjie  
public func onActionUpdate(callback: (GestureEvent) -> Unit): This  
```  

**Function:** Callback triggered during pan gesture movement.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent)) -> Unit | Yes | - | Callback function triggered during pan gesture movement. |  

## Basic Type Definitions  

### class PanGestureOptions  

```cangjie  
public class PanGestureOptions {  
    public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)  
}  
```  

**Function:** The PanGestureOptions object allows dynamic modification of the pan gesture recognizer's properties, avoiding UI refreshes caused by state variable changes.  

**Since Version:** 19  

#### init(Int32, PanDirection, Float64)  

```cangjie  
public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)  
```  

**Function:** Creates a PanGestureOptions object.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| fingers | Int32 | No | 1 | **Named parameter.** Specifies the minimum number of fingers required to trigger the swipe, with a minimum of 1 and a maximum of 10. <br/> Valid range: [1, 10]. <br/> **Note:** <br/> If the set value is less than 1 or not set, it will be converted to 1. |  
| direction | [PanDirection](#enum-pandirection) | No | PanDirection.All | Specifies the swipe direction for triggering the gesture. This enumeration supports logical AND (&) and logical OR (\| **Named parameter.** ) operations. |  
| distance | Float64 | No | 5.0 | **Named parameter.** Specifies the minimum swipe distance (in pixels) required to trigger the swipe gesture event. <br/> **Note:** <br/> When the Tabs component swipe and this gesture event coexist, set `distance` to 1 for better sensitivity and to avoid event conflicts. <br/> If the set value is less than 0, it will default to 5.0. |  

#### func setDirection(PanDirection)  

```cangjie  
public func setDirection(value: PanDirection): Unit  
```  

**Function:** Sets the swipe direction.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| value | [PanDirection](#enum-pandirection) | Yes | - | Specifies the swipe direction for triggering the gesture. This enumeration supports logical AND and logical OR operations. |  

#### func setDistance(Float64)  

```cangjie  
public func setDistance(value: Float64): Unit  
```  

**Function:** Sets the minimum swipe distance (in pixels) required to trigger the swipe gesture event.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| value | Float64 | Yes | - | Specifies the minimum swipe distance (in pixels) required to trigger the swipe gesture event. <br/> **Note:** <br/> When the Tabs component swipe and this gesture event coexist, set `distance` to 1 for better sensitivity and to avoid event conflicts. <br/> If the set value is less than 0, it will default to 5.0. |  

#### func setFingers(Int32)  

```cangjie  
public func setFingers(value: Int32): Unit  
```  

**Function:** Sets the minimum number of fingers required to trigger the swipe.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| value | Int32 | Yes | - | Specifies the minimum number of fingers required to trigger the swipe, with a minimum of 1 and a maximum of 10. <br/> Valid range: [1, 10]. <br/> **Note:** <br/> If the set value is less than 1 or not set, it will be converted to 1. |  

### enum PanDirection  

```cangjie  
public enum PanDirection {  
    | None  
    | Left  
    | Right  
    | Horizontal  
    | Up  
    | Down  
    | Vertical  
    | All  
    | Computed(UInt32)  
}  
```  

**Function:** Direction of the pan gesture.  

**Since Version:** 19  

#### All  

```cangjie  
All  
```  

**Function:** All directions.  

**Since Version:** 19  

#### Computed(UInt32)  

```cangjie  
Computed(UInt32)  
```  

**Function:** Supports logical AND (&) and logical OR (|) operations.  

**Since Version:** 19  

#### Down  

```cangjie  
Down  
```  

**Function:** Swipe downward.  

**Since Version:** 19  

#### Horizontal  

```cangjie  
Horizontal  
```  

**Function:** Horizontal direction.  

**Since Version:** 19  

#### Left  

```cangjie  
Left  
```  

**Function:** Swipe left.  

**Since Version:** 19  

#### None  

```cangjie  
None  
```  

**Function:** All directions.  

**Since Version:** 19  

#### Right  

```cangjie  
Right  
```  

**Function:** Swipe right.  

**Since Version:** 19  

#### Up  

```cangjie  
Up  
```  

**Function:** Swipe upward.  

**Since Version:** 19  

#### Vertical  

```cangjie  
Vertical  
```  

**Function:** Vertical direction.  

**Since Version:** 19  

#### func &(PanDirection)  

```cangjie  
public operator func &(right: PanDirection): PanDirection  
```  

**Function:** Performs a logical AND (&) operation on PanDirection.  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| right | [PanDirection](#enum-pandirection) | Yes | - | Swipe direction |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [PanDirection](#enum-pandirection) | Swipe direction |  

#### func |(PanDirection)  

```cangjie  
public operator func |(right: PanDirection): PanDirection  
```
**Function:** Performs a logical OR (|) operation on PanDirection.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| right | [PanDirection](#enum-pandirection) | Yes | - | Swipe direction |

**Return Value:**

| Type | Description |
|:----|:----|
| [PanDirection](#enum-pandirection) | Swipe direction |

## Example Code

This example demonstrates single-finger swipe gesture recognition using PanGesture.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var offsetX: Float64 = 0.0
    @State var offsetY: Float64 = 0.0
    @State var positionX: Float64 = 0.0
    @State var positionY: Float64 = 0.0

    func build() {
        Column() {
            Column() {
                Text('PanGesture offset:\nX: ' + this.offsetX.toString() + '\n' + 'Y: ' + this.offsetY.toString())
            }
            .height(200)
            .width(300)
            .padding(20)
            .border(width: 3.vp)
            .margin(50)
            .translate(x: this.offsetX, y: this.offsetY, z: 0.0) // Moves with the component's top-left corner as the coordinate origin
            .gesture(
                PanGesture()
                .onActionUpdate({ event: GestureEvent =>
                    this.offsetX = this.positionX + event.offsetX
                    this.offsetY = this.positionY + event.offsetY
                })
                .onActionEnd({ event: GestureEvent =>
                    this.positionX = this.offsetX
                    this.positionY = this.offsetY
                })
            )
        }
    }
}
```

![pan](figures/pan_gesture.gif)