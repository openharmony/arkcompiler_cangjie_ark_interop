# Setting Component-Bound Gestures

Used to configure gestures bound to components. Interfaces can be called via the UIGestureEvent object to add or remove gestures.

## class UIGestureEvent

```cangjie
public class UIGestureEvent {}
```

**Function:** Used to configure gestures bound to components.

**Initial Version:** 19

### func addGesture(GestureHandler, GesturePriority, GestureMask)

```cangjie
public func addGesture(gesture: GestureHandler, priority!: GesturePriority = GesturePriority.Low, mask!: GestureMask = GestureMask.Normal): Unit
```

**Function:** Adds a gesture.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| gesture | [GestureHandler](#class-gesturehandler) | Yes | - | Gesture handler object. |
| priority | [GesturePriority](#enum-gesturepriority) | No | GesturePriority.Low | **Named parameter.** Priority of the bound gesture. |
| mask | [GestureMask](./cj-universal-gesture-bind.md#enum-GestureMask) | No | GestureMask.Normal | **Named parameter.** Event response settings. |

### func addParallelGesture(GestureHandler, GestureMask)

```cangjie
public func addParallelGesture(gesture: GestureHandler, mask!: GestureMask = GestureMask.Normal): Unit
```

**Function:** Binds a gesture that can trigger simultaneously with child component gestures.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| gesture | [GestureHandler](#class-gesturehandler) | Yes | - | Gesture handler object. |
| mask | [GestureMask](./cj-universal-gesture-bind.md#enum-GestureMask) | No | GestureMask.Normal | **Named parameter.** Event response settings. |

### func removeGestureByTag(String)

```cangjie
public func removeGestureByTag(tag: String): Unit
```

**Function:** Removes gestures bound to the component via modifier with the specified tag.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| tag | String | Yes | - | Gesture handler tag. |

### func clearGestures()

```cangjie
public func clearGestures(): Unit
```

**Function:** Clears all gestures bound to the component via modifier.

**Initial Version:** 19

## class GestureHandler

```cangjie
public open class GestureHandler {}
```

**Function:** Base type for gesture objects.

**Initial Version:** 19

### func tag(String)

```cangjie
public func tag(tag: String): This
```

**Function:** Sets the tag for the gesture handler.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| tag | String | Yes | - | Sets the gesture handler tag. |

## class TapGestureHandler

```cangjie
public class TapGestureHandler <: GestureHandler {}
```

**Function:** Tap gesture handler object type.

**Parent Type:**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Int32)

```cangjie
public init(count!: Int32 = 1, fingers!: Int32 = 1)
```

**Function:** Creates a tap gesture handler.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| count | Int32 | No | 1 | **Named parameter.** Number of consecutive taps to recognize. When set to less than 1 or not set, it defaults to 1.<br/>**Notes:** <br/> 1. For multi-tap configurations, the timeout between the last finger lift of the previous tap and the first finger press of the next tap is 300ms.<br/> 2. If the distance between the previous tap position and the current tap position exceeds 60vp, gesture recognition fails. |
| fingers | Int32 | No | 1 | **Named parameter.** Number of fingers required to trigger the tap (min: 1, max: 10). When set to less than 1 or not set, it defaults to 1.<br/>**Notes:** <br/> 1. For multi-finger configurations, if insufficient fingers press down within 300ms of the first finger press, gesture recognition fails. When lifting fingers, if the remaining fingers fall below the threshold, timing starts. If all fingers are not lifted within 300ms, gesture recognition fails.<br/>2. If the actual number of tapping fingers exceeds the configured value, gesture recognition succeeds. |

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when Tap gesture recognition succeeds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback triggered when Tap gesture recognition succeeds. |

## class LongPressGestureHandler

```cangjie
public class LongPressGestureHandler <: GestureHandler {}
```

**Function:** Long press gesture handler configuration parameters.

**Parent Type:**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Bool, Int32)

```cangjie
public init(fingers!: Int32 = 1, repeat!: Bool = false, duration!: Int32 = 500)
```

**Function:** Creates a long press gesture.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fingers | Int32 | No | 1 | **Named parameter.** Minimum number of fingers to trigger long press (min: 1, max: 10).<br/> **Notes:** <br/> If finger movement exceeds 15px after pressing, long press gesture recognition fails. |
| repeat | Bool | No | false | **Named parameter.** Whether to trigger event callbacks continuously. |
| duration | Int32 | No | 500 | **Named parameter.** Minimum duration to trigger long press, in milliseconds (ms).<br/>**Notes:** <br/>If set to ≤0, it defaults to 500. |

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when LongPress gesture recognition succeeds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback triggered when LongPress gesture recognition succeeds. |

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered after the last finger lifts when LongPress gesture recognition succeeds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback triggered after the last finger lifts when LongPress gesture recognition succeeds. |

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when a touch cancellation event is received after LongPress gesture recognition succeeds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback triggered when a touch cancellation event is received after LongPress gesture recognition succeeds. |

## class PanGestureHandler

```cangjie
public class PanGestureHandler <: GestureHandler {}
```

**Function:** Pan (drag) gesture handler object type.

**Parent Type:**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Bool, Float64)

```cangjie
public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)
```

**Function:** Creates a pan gesture handler.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fingers | Int32 | No | 1 | **Named parameter.** Minimum number of fingers to trigger long press (min: 1, max: 10).<br/>**Notes:**<br/>If set to less than 1 or not set, it defaults to 1. |
| direction | [PanDirection](./cj-universal-gesture-pangesture.md#enum-pandirection) | No | PanDirection.All | Specifies the gesture direction to trigger panning. This enum supports logical AND (&) and OR (\| **Named parameter.** ) operations. |
| distance | Float64 | No | 5.0 | **Named parameter.** Minimum drag distance to trigger pan gesture events, in vp.<br/>**Notes:**<br/>If set to less than 0, it defaults to 5. |

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when Pan gesture recognition succeeds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback triggered when Pan gesture recognition succeeds. |

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered during Pan gesture movement.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback during Pan gesture movement. |

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered after finger lift when Pan gesture recognition succeeds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback triggered after finger lift when Pan gesture recognition succeeds. ||callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Pan gesture is successfully recognized and fingers are lifted.|

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Pan gesture is successfully recognized and a touch cancellation event is received.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Pan gesture is successfully recognized and a touch cancellation event is received.|

## class SwipeGestureHandler

```cangjie
public class SwipeGestureHandler <: GestureHandler {}
```

**Function:** Object type for swipe gesture handler.

**Parent Type:**

- [GestureHandler](#class-gesturehandler)

### init(Int32, SwipeDirection, Float64)

```cangjie
public init(fingers!: Int32 = 1, direction!: SwipeDirection = SwipeDirection.All, speed!: Float64 = 100.0)
```

**Function:** Creates a swipe gesture handler.

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|fingers|Int32|No|1| **Named parameter.** Minimum number of fingers required to trigger the swipe, default is 1 (minimum 1, maximum 10).|
|direction|[SwipeDirection](./cj-universal-gesture-swipegesture.md#enum-SwipeDirection)|No|SwipeDirection.All| **Named parameter.** Direction of the swipe gesture to be triggered.|
|speed|Float64|No|100.0| **Named parameter.** Minimum speed required to recognize the swipe.<br/>**Note:** If the speed value is less than or equal to 0, it will be converted to the default value.|

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Swipe gesture is successfully recognized.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Swipe gesture is successfully recognized.|

## class PinchGestureHandler

```cangjie
public class PinchGestureHandler <: GestureHandler {}
```

**Function:** Object type for pinch gesture handler.

**Parent Type:**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Float64)

```cangjie
public init(fingers!: Int32 = 2, distance!: Float64 = 5.0)
```

**Function:** Creates a pinch gesture handler.

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|fingers|Int32|No|2| **Named parameter.** Minimum number of fingers required to trigger the pinch, default is 2 (minimum 2, maximum 5).<br/> **Note:** <br/> More fingers than specified can trigger the gesture, but only the first fingers matching the count will participate in gesture calculation.|
|distance|Float64|No|5.0| **Named parameter.** Minimum recognition distance in vp.<br/> **Note:** <br/> If the distance value is less than or equal to 0, it will be converted to the default value.|

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Pinch gesture is successfully recognized.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Pan gesture is successfully recognized.|

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered during the movement of the Pinch gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered during the movement of the Pan gesture.|

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Pinch gesture is successfully recognized and fingers are lifted.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Pan gesture is successfully recognized and fingers are lifted.|

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Pinch gesture is successfully recognized and fingers are lifted.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Pinch gesture is successfully recognized and a touch cancellation event is received.|

## class RotationGestureHandler

```cangjie
public class RotationGestureHandler <: GestureHandler {}
```

**Function:** Object type for rotation gesture handler.

**Parent Type:**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Float64)

```cangjie
public init(fingers!: Int32 = 2, angle!: Float64 = 1.0)
```

**Function:** Creates a pinch gesture handler.

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|fingers|Int32|No|2| **Named parameter.** Minimum number of fingers required to trigger the rotation, default is 2 (minimum 2, maximum 5).<br/> **Note:** <br/> More fingers than specified can trigger the gesture, but only the first two fingers will participate in gesture calculation.|
|angle|Float64|No|1.0| **Named parameter.** Minimum angle change in degrees required to trigger the rotation gesture.<br/> **Note:** <br/> If the angle value is less than or equal to 0 or greater than 360, it will be converted to the default value.|

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Rotation gesture is successfully recognized.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-b bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Rotation gesture is successfully recognized.|

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered during the movement of the Rotation gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered during the movement of the Rotation gesture.|

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Rotation gesture is successfully recognized and fingers are lifted.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Rotation gesture is successfully recognized and fingers are lifted.|

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when the Rotation gesture is successfully recognized and a touch cancellation event is received.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|Yes|-|Triggered when the Rotation gesture is successfully recognized and a touch cancellation event is received.|

## class GestureGroupHandler

```cangjie
public class GestureGroupHandler <: GestureHandler {}
```

**Function:** Object type for gesture group handler.

**Parent Type:**

- [GestureHandler](#class-gesturehandler)

### init(GestureMode, Array\<GestureType>)

```cangjie
public init(mode: GestureMode, gesture: Array<Gesture>)
```

**Function:** Creates a gesture group handler.

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|mode|[GestureMode](./cj-universal-gesture-groupgesture.md#enum-GestureMode)|Yes|-|Sets the recognition mode for combined gestures. Initial value: GestureMode.Sequence.|
|gesture|Array\<GestureType>|Yes|-|Sets one or more basic gesture types to be recognized as combined gestures. If the array length is 0, the combined gesture recognition feature will not take effect.|

### func onCancel(() -> Unit)

```cangjie
public func onCancel(callback: () -> Unit): This
```

**Function:** Triggered when the sequential combined gesture (GestureMode.Sequence) is canceled.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full**Initial Version:** 19  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| callback | ()->Unit | Yes | - | Callback function, triggered when the sequential gesture combination (GestureMode.Sequence) is canceled. |  

## enum GesturePriority  

```cangjie  
public enum GesturePriority {  
    | Low  
    | High  
}  
```  

**Function:** Combined gesture recognition mode.  

**Initial Version:** 19  

### Low  

```cangjie  
Low  
```  

**Function:** Normal priority gesture.  

**Initial Version:** 19  

### High  

```cangjie  
High  
```  

**Function:** High-priority gesture.  

**Initial Version:** 19  

## Example  

See [Dynamic Gesture Settings](./cj-universal-attribute-gesturemodifier.md).