# Gesture Binding Methods

Bind different types of gesture events to components and set their response methods.

## Binding Gesture Recognition

Bind gesture recognition to components through the following properties. When gesture recognition succeeds, the component will be notified via event callbacks. The gesture recognition area can be specified using [Touch Target](./cj-universal-attribute-touchtarget.md#touch-target-settings).

### func gesture(GestureType)

```cangjie
public func gesture(gesture: GestureType): This
```

**Function:** Binds a gesture.

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|Yes|-|The type of gesture to bind.|

### func gesture(GestureType, GestureMask)

```cangjie
public func gesture(gesture: GestureType, mask: GestureMask): This
```

**Function:** Binds a gesture.

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|Yes|-|The type of gesture to bind.|
|mask|[GestureMask](#enum-gesturemask)|Yes|-|Event response settings.|

### func parallelGesture(GestureType)

```cangjie
public func priorityGesture(gesture: GestureType): This
```

**Function:** Binds a gesture that can be triggered simultaneously with child component gestures.

> **Note:**
>
> Gesture events are non-bubbling events. When a parent component sets parallelGesture, both parent and child components can trigger the same gesture event, achieving a bubbling-like effect. If both parent and child components bind tap and double-tap gestures, only the tap gesture will be responded to.

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|Yes|-|The type of gesture to bind.|

### func parallelGesture(GestureType, GestureMask)

```cangjie
public func priorityGesture(gesture: GestureType, mask: GestureMask): This
```

**Function:** Binds a gesture that can be triggered simultaneously with child component gestures.

> **Note:**
>
> Gesture events are non-bubbling events. When a parent component sets parallelGesture, both parent and child components can trigger the same gesture event, achieving a bubbling-like effect. If both parent and child components bind tap and double-tap gestures, only the tap gesture will be responded to.

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|Yes|-|The type of gesture to bind.|
|mask|[GestureMask](#enum-gesturemask)|Yes|-|Event response settings.|

### func priorityGesture(GestureType)

```cangjie
public func priorityGesture(gesture: GestureType): This
```

**Function:** Binds a priority recognition gesture.

> **Note:**
>
> - By default, child components prioritize recognizing gestures bound via gesture. When a parent component configures priorityGesture, the parent component prioritizes recognizing gestures bound via priorityGesture.
> - For long-press gestures, the component with the smallest minimum long-press trigger time will respond first, ignoring priorityGesture settings.

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|Yes|-|The type of gesture to bind.|

### func priorityGesture(GestureType, GestureMask)

```cangjie
public func priorityGesture(gesture: GestureType, mask: GestureMask): This
```

**Function:** Binds a priority recognition gesture.

> **Note:**
>
> - By default, child components prioritize recognizing gestures bound via gesture. When a parent component configures priorityGesture, the parent component prioritizes recognizing gestures bound via priorityGesture.
> - For long-press gestures, the component with the smallest minimum long-press trigger time will respond first, ignoring priorityGesture settings.

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|gesture|[GestureType](#class-gesturetype)|Yes|-|The type of gesture to bind.|
|mask|[GestureMask](#enum-gesturemask)|Yes|-|Event response settings.|

## Responding to Gesture Events

Components bind gesture objects of different GestureType through gesture events. Each gesture object provides gesture-related information in the event callback when responding to gesture operations. Below, the onAction event of the TapGesture gesture object is used to respond to tap events and obtain event-related information. For event definitions of other gesture objects, refer to their respective chapters. To bind multiple gestures, use [Combined Gestures](../../../../../API_Reference/source_en/arkui-cj/cj-universal-gesture-groupgesture.md).

### func onAction(GestureEvent -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when Tap gesture recognition succeeds.

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|callback|[GestureEvent](#class-gestureevent)|Yes|-|Callback function, triggered when Tap gesture recognition succeeds.|

## Basic Type Definitions

### class GestureEvent

```cangjie
public class GestureEvent <: BaseEvent {
    public let repeat: Bool
    public let fingerList: ArrayList<FingerInfo>
    public let offsetX: Float64
    public let offsetY: Float64
    public let scale: Float64
    public let pinchCenterX: Float64
    public let pinchCenterY: Float64
    public let angle: Float64
    public let speed: Float64
    public let velocityX: Float64
    public let velocityY: Float64
    public let velocity: Float64
    public init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviveId: Int64,
        repeat: Bool,
        offsetX: Float64,
        offsetY: Float64,
        angle: Float64,
        scale: Float64,
        pinchCenterX: Float64,
        pinchCenterY: Float64,
        speed: Float64,
        fingerList: ArrayList<FingerInfo>,
        velocityX: Float64,
        velocityY: Float64,
        velocity: Float64
    )
}
```

**Function:** Describes the type of gesture event.

**Parent Type:**

- [BaseEvent](cj-universal-gesture-judge.md#class-baseevent)

#### let angle

```cangjie
public let angle: Float64
```

**Function:** Represents the rotation angle in RotationGesture scenarios. In SwipeGesture scenarios, it represents the angle of the swipe gesture, i.e., the degree of change in the angle between the line connecting two fingers and the horizontal direction.

> **Note:**
>
> Angle calculation method: After the swipe gesture is recognized, the line connecting two fingers is identified as the starting line. As the fingers move, the line between them rotates. The arctangent function is used to calculate the angle relative to the horizontal direction for both the starting and current lines. The rotation angle is arctan2(cy2-cy1,cx2-cx1)-arctan2(y2-y1,x2-x1). Using the starting line as the coordinate system, clockwise rotation is 0 to 180 degrees, and counterclockwise rotation is -180 to 0 degrees.

**Type:** Float64

**Read/Write:** Read-only

**Initial Version:** 19

#### let fingerList

```cangjie
public let fingerList: ArrayList<FingerInfo>
```

**Function:** For gestures generated by touchscreen input, fingerList contains information about all touch points that triggered the event. For gestures initiated by a mouse, fingerList contains only one record. Touchpad events are categorized similarly to mouse events, so gestures initiated by a touchpad will also carry only one record in fingerList.

> **Note:**
>
> Finger indices correspond to positions, i.e., fingerList[index].id equals index. Fingers that were pressed earlier but did not participate in the current gesture trigger will have null values in fingerList.

**Type:** ArrayList\<[FingerInfo](#class-fingerinfo)>

**Read/Write:** Read-only

**Initial Version:** 19

#### let offsetX

```cangjie
public let offsetX: Float64
```

**Function:** The X-axis offset of the gesture event, in vp units. Used in [PanGesture](cj-universal-gesture-pangesture.md) scenarios. Positive when swiping left to right, negative otherwise.

**Type:** Float64

**Read/Write:** Read-only

**Initial Version:** 19

#### let offsetY

```cangjie
public let offsetY: Float64
```

**Function:** The Y-axis offset of the gesture event, in vp units. Used in [PanGesture](cj-universal-gesture-pangesture.md) scenarios. Positive when swiping top to bottom, negative otherwise.

**Type:** Float64

**Read/Write:** Read-only

**Initial Version:** 19

#### let pinchCenterX

```cangjie
public let pinchCenterX: Float64
```

**Function:** The X-axis coordinate of the pinch gesture center point, in vp units. Used in [PinchGesture](./cj-universal-gesture-pinchgesture.md) scenarios.

**Type:** Float64

**Read/Write:** Read-only

**Initial Version:** 19

#### let pinchCenterY

```cangjie
public let pinchCenterY: Float64
```

**Function:** The Y-axis coordinate of the pinch gesture center point, in vp units. Used in [PinchGesture](./cj-universal-gesture-pinchgesture.md) scenarios.

**Type:** Float64

**Read/Write:** Read-only

**Initial Version:** 19

#### let repeat

```cangjie
public let repeat: Bool
```

**Function:** Indicates whether the event is a repeated trigger. Used in [LongPressGesture](./cj-universal-gesture-longpressgesture.md) scenarios.

**Type:** Bool

**Read/Write:** Read-only

**Initial Version:** 19

#### let scale

```cangjie
public let scale: Float64
```

**Function:** The scaling ratio. Used in [PinchGesture](./cj-universal-gesture-pinchgesture.md) scenarios.

**Type:** Float64

**Read/Write:** Read-only**Initial Version:** 19  

#### let speed  

```cangjie  
public let speed: Float64  
```  

**Function:** The swipe gesture speed, representing the average velocity of all fingers relative to the original area of the current component element, in units of vp/s. Used in [SwipeGesture](./cj-universal-gesture-swipegesture.md) gesture triggering scenarios.  

**Type:** Float64  

**Read-Write Capability:** Read-only  

**Initial Version:** 19  

#### let velocity  

```cangjie  
public let velocity: Float64  
```  

**Function:** Used in [PanGesture](./cj-universal-gesture-pangesture.md#pangesture) gestures to obtain the primary directional velocity of the current gesture. It is the arithmetic square root of the sum of the squares of the velocities in the x and y axes. Units are vp/s.  

**Type:** Float64  

**Read-Write Capability:** Read-only  

**Initial Version:** 19  

#### let velocityX  

```cangjie  
public let velocityX: Float64  
```  

**Function:** Used in [PanGesture](./cj-universal-gesture-pangesture.md#pangesture) gestures to obtain the x-axis velocity of the current gesture. The coordinate origin is at the top-left corner of the screen, with positive and negative directional velocities: left to right is positive, and vice versa. Units are vp/s.  

**Type:** Float64  

**Read-Write Capability:** Read-only  

**Initial Version:** 19  

#### let velocityY  

```cangjie  
public let velocityY: Float64  
```  

**Function:** Used in [PanGesture](./cj-universal-gesture-pangesture.md#pangesture) gestures to obtain the y-axis velocity of the current gesture. The coordinate origin is at the top-left corner of the screen, with positive and negative directional velocities: top to bottom is positive, and vice versa. Units are vp/s.  

**Type:** Float64  

**Read-Write Capability:** Read-only  

**Initial Version:** 19  

#### init(EventTarget, Int64, SourceType, Float64, Int64, Int64, SourceTool, Option\<Float32>, Option\<Float32>, Option\<(Array\<String>) -> Bool>, Int64, Bool, Float64, Float64, Float64, Float64, Float64, Float64, Float64, ArrayList\<FingerInfo>, Float64, Float64, Float64)  

```cangjie  
public init(  
    target: EventTarget,  
    timestamp: Int64,  
    source: SourceType,  
    pressure: Float64,  
    tiltX: Int64,  
    tiltY: Int64,  
    sourceTool: SourceTool,  
    axisHorizontal: Option<Float32>,  
    axisVertical: Option<Float32>,  
    getModifierKeyState: Option<(Array<String>) -> Bool>,  
    deviveId: Int64,  
    repeat: Bool,  
    offsetX: Float64,  
    offsetY: Float64,  
    angle: Float64,  
    scale: Float64,  
    pinchCenterX: Float64,  
    pinchCenterY: Float64,  
    speed: Float64,  
    fingerList: ArrayList<FingerInfo>,  
    velocityX: Float64,  
    velocityY: Float64,  
    velocity: Float64  
)  
```  

**Function:** Constructs an object of the gesture event type.  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [EventTarget](#class-eventtarget) | Yes | - | The display area of the element object triggering the gesture event. |  
| timestamp | Int64 | Yes | - | Event timestamp, the time interval from system startup when the event is triggered. <br>Unit: ns |  
| source | [SourceType](./cj-common-types.md#enum-sourcetype) | Yes | - | Event input device. |  
| pressure | Float64 | Yes | - | The pressure magnitude of the press. |  
| tiltX | Int64 | Yes | - | The angle between the projection of the stylus on the device plane and the X-axis of the device plane. |  
| tiltY | Int64 | Yes | - | The angle between the projection of the stylus on the device plane and the Y-axis of the device plane. |  
| sourceTool | [SourceTool](./cj-common-types.md#enum-sourcetool) | Yes | - | The input source of the event. |  
| axisHorizontal | Option\<Float32> | Yes | - | Horizontal axis value. |  
| axisVertical | Option\<Float32> | Yes | - | Vertical axis value. |  
| getModifierKeyState | Option\<(Array\<String>)->Bool> | Yes | - | Gets the pressed state of modifier keys. |  
| deviveId | Int64 | Yes | - | The ID of the input device triggering the current event. |  
| repeat | Bool | Yes | - | Whether the event is triggered repeatedly, used in LongPressGesture gesture triggering scenarios. |  
| offsetX | Float64 | Yes | - | The X-axis offset of the gesture event, in units of vp, used in PanGesture gesture triggering scenarios. Left to right swipe is positive, and vice versa. |  
| offsetY | Float64 | Yes | - | The Y-axis offset of the gesture event, in units of vp, used in PanGesture gesture triggering scenarios. Top to bottom swipe is positive, and vice versa. |  
| angle | Float64 | Yes | - | In RotationGesture triggering scenarios, represents the rotation angle. <br>In SwipeGesture triggering scenarios, represents the angle of the swipe gesture, i.e., the degree change of the angle between the line segment connecting two fingers and the horizontal direction. |  
| scale | Float64 | Yes | - | The scaling ratio, used in PinchGesture gesture triggering scenarios. |  
| pinchCenterX | Float64 | Yes | - | The x-axis coordinate of the pinch gesture center point, in units of vp, used in PinchGesture gesture triggering scenarios. |  
| pinchCenterY | Float64 | Yes | - | The y-axis coordinate of the pinch gesture center point, in units of vp, used in PinchGesture gesture triggering scenarios. |  
| speed | Float64 | Yes | - | The swipe gesture speed, representing the average velocity of all fingers relative to the original area of the current component element, in units of vp/s. Used in SwipeGesture gesture triggering scenarios. |  
| fingerList | ArrayList\<[FingerInfo](#class-fingerinfo)> | Yes | - | For gestures generated by touch input, fingerList contains information about all touch points triggering the event; for gestures initiated by a mouse, fingerList contains only one record; touchpad events are categorized similarly to mouse events, so gestures initiated by a touchpad will also have only one record in fingerList. <br>**Note:**<br>The finger index number corresponds to its position, i.e., fingerList[index] has an id of index. Fingers that were pressed earlier but are not involved in the current gesture trigger will have null entries in fingerList. |  
| velocityX | Float64 | Yes | - | Used in PanGesture gestures to obtain the x-axis velocity of the current gesture. The coordinate origin is at the top-left corner of the screen, with positive and negative directional velocities: left to right is positive, and vice versa. Units are vp/s. |  
| velocityY | Float64 | Yes | - | Used in PanGesture gestures to obtain the y-axis velocity of the current gesture. The coordinate origin is at the top-left corner of the screen, with positive and negative directional velocities: top to bottom is positive, and vice versa. Units are vp/s. |  
| velocity | Float64 | Yes | - | Used in PanGesture gestures to obtain the primary directional velocity of the current gesture. It is the arithmetic square root of the sum of the squares of the velocities in the x and y axes. Units are vp/s. |  

### class GestureType  

```cangjie  
public open class GestureType {}  
```  

**Function:** The base type for all gesture types.  

**Initial Version:** 19  

#### func tag(String)  

```cangjie  
public func tag(tag: String): This  
```  

**Function:** Sets a gesture tag to distinguish bound gestures during custom gesture determination.  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| tag | String | Yes | - | Sets a gesture tag to distinguish bound gestures during custom gesture determination. |  

### class EventTarget  

```cangjie  
public class EventTarget {  
    public EventTarget(  
        public var area: Area  
    )  
}  
```  

**Function:** The display area of the element object triggering the gesture event.  

**Initial Version:** 12  

#### var area  

```cangjie  
public var area: Area  
```  

**Function:** The area information of the target element.  

**Type:** [Area](cj-common-types.md#class-area)  

**Read-Write Capability:** Read-write  

**Initial Version:** 19  

#### EventTarget(Area)  

```cangjie  
public EventTarget(  
    public var area: Area  
)  
```  

**Function:** Constructs an object of the display area type for the element object triggering the gesture event.  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| area | Area | Yes | - | The area information of the target element. |  

### class FingerInfo  

```cangjie  
public class FingerInfo{  
    public let id: Int32  
    public let globalX: Float64  
    public let globalY: Float64  
    public let localX: Float64  
    public let localY: Float64  
}  
```  

**Function:** Finger information.  

**Initial Version:** 12  

#### let id  

```cangjie  
public let id: Int32  
```  

**Function:** The index number of the finger.  

**Type:** Int32  

**Read-Write Capability:** Read-only  

**Initial Version:** 12  

#### let globalX  

```cangjie  
public let globalX: Float64  
```  

**Function:** The x-axis coordinate relative to the top-left corner of the application window, in units of vp.  

**Type:** Float64  

**Read-Write Capability:** Read-only  

**Initial Version:** 12  

#### let globalY  

```cangjie  
public let globalY: Float64  
```  

**Function:** The y-axis coordinate relative to the top-left corner of the application window, in units of vp.  

**Type:** Float64  

**Read-Write Capability:** Read-only  

**Initial Version:** 12  

#### let localX  

```cangjie  
public let localX: Float64  
```  

**Function:** The x-axis coordinate relative to the top-left corner of the original area of the current component element, in units of vp.  

**Type:** Float64  

**Read-Write Capability:** Read-only  

**Initial Version:** 12  

#### let localY  

```cangjie  
public let localY: Float64  
```  

**Function:** The y-axis coordinate relative to the top-left corner of the original area of the current component element, in units of vp.  

**Type:** Float64  

**Read-Write Capability:** Read-only  

**Initial Version:** 12  

### enum GestureMask  

```cangjie  
public enum GestureMask {  
    | Normal  
    | IgnoreInternal  
}  
```  

**Function:** Event response settings.  

**Initial Version:** 19  

#### Normal  

```cangjie  
Normal  
```  

**Function:** Does not block child component gestures; recognition follows the default gesture recognition order.  

**Initial Version:** 19  

#### IgnoreInternal  

```cangjie  
IgnoreInternal  
```
**Function:** Blocks gestures on child components, including system-built-in gestures on child components. For example, when the child component is a List component, its built-in swipe gesture will also be blocked. If there is partial overlap between the parent and child component areas, only the overlapping portion will be blocked.

**Initial Version:** 19

## Example

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var priorityTestValue: String = ""
    @State var parallelTestValue: String = ""

    func build() {
        Column() {
            Column() {
                Text('TapGesture:' + this.priorityTestValue).fontSize(28)
                .gesture(
                    TapGesture()
                    .onAction({ event: GestureEvent =>
                        this.priorityTestValue += '\nText'
                    }),
                    GestureMask.Normal
                )
            }
            .height(200)
            .width(250)
            .padding(20)
            .margin(20)
            .border(width: 3.vp)
            // When set as priorityGesture, tapping the text will ignore the TapGesture event of the Text component and prioritize recognizing the TapGesture event of the parent Column component.
            .priorityGesture(
                TapGesture()
                .onAction({event: GestureEvent  =>
                    this.priorityTestValue += '\nColumn'
                }),
                GestureMask.IgnoreInternal
            )

            Column() {
                Text('TapGesture:' + this.parallelTestValue).fontSize(28)
                .gesture(
                    TapGesture()
                    .onAction({ event: GestureEvent =>
                        this.parallelTestValue += '\nText'
                    }),
                    GestureMask.Normal
                )
            }
            .height(200)
            .width(250)
            .padding(20)
            .margin(20)
            .border(width: 3.vp)
            // When set as parallelGesture, tapping the text will simultaneously trigger the TapGesture events of both the child Text component and the parent Column component.
            .parallelGesture(
                TapGesture()
                    .onAction({ event: GestureEvent  =>
                        this.parallelTestValue += '\nColumn'
                }), GestureMask.Normal
            )
        }
    }
}
```

![bind_gesture](figures/bind_gesture.gif)