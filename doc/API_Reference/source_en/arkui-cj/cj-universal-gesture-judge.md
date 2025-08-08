# Custom Gesture Judgment

Provides components with the capability for custom gesture judgment. Developers can determine whether to respond to gestures during gesture recognition as needed.

## func onGestureJudgeBegin((GestureInfo, BaseGestureEvent) -> GestureJudgeResult)

```cangjie
public func onGestureJudgeBegin(callback: (GestureInfo, BaseGestureEvent) -> GestureJudgeResult): This
```

**Function:** Binds a custom gesture judgment callback to the component. When a gesture bound to this component is accepted, the user-defined callback will be triggered to obtain the result.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureInfo](#class-gestureinfo), [BaseGestureEvent](#class-basegestureevent))->[GestureJudgeResult](#enum-gesturejudgeresult) | Yes | - | Binds a custom gesture judgment callback to the component. When a gesture bound to this component is accepted, the user-defined callback will be triggered to obtain the result. |

## Basic Type Definitions

### class BaseEvent

```cangjie
public open class BaseEvent {
    public let target: EventTarget,
    public let timestamp: Int64,
    public let source: SourceType,
    public let pressure: Float64,
    public let tiltX: Int64,
    public let tiltY: Int64,
    public let sourceTool: SourceTool,
    public let axisHorizontal: Option<Float32>,
    public let axisVertical: Option<Float32>,
    public let getModifierKeyState: Option<(Array<String>) -> Bool>,
    public let deviceId: Int64
}
```

**Function:** Base class for basic event information.

**Initial Version:** 19

#### let axisHorizontal

```cangjie
public let axisHorizontal: Option<Float32>
```

**Function:** Horizontal axis value.

**Type:** Option\<Float32>

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let axisVertical

```cangjie
public let axisVertical: Option<Float32>
```

**Function:** Vertical axis value.

**Type:** Option\<Float32>

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let deviceId

```cangjie
public let deviceId: Int64
```

**Function:** Input device ID that triggered the current event.

**Type:** Int64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let getModifierKeyState

```cangjie
public let getModifierKeyState: Option <(Array<String>) -> Bool>
```

**Function:** Gets the pressed state of modifier keys. For error codes, refer to the following. Supported modifier keys: 'Ctrl'|'Alt'|'Shift'|'Fn'. External keyboards with Fn keys are not supported for Fn key queries.

**Type:** Option\<(Array\<String>)->Bool>

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let pressure

```cangjie
public let pressure: Float64
```

**Function:** Pressure value of the press.

**Type:** Float64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let source

```cangjie
public let source: SourceType
```

**Function:** Input device for the event.

**Type:** [SourceType](./cj-common-types.md#enum-sourcetype)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let sourceTool

```cangjie
public let sourceTool: SourceTool
```

**Function:** Input source for the event.

**Type:** [SourceTool](./cj-common-types.md#enum-sourcetool)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let target

```cangjie
public let target: EventTarget
```

**Function:** Gesture marker.

**Type:** [EventTarget](./cj-universal-gesture-bind.md#class-eventtarget)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let tiltX

```cangjie
public let tiltX: Int64
```

**Function:** Angle between the projection of the stylus on the device plane and the X-axis of the device plane.

**Type:** Int64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let tiltY

```cangjie
public let tiltY: Int64
```

**Function:** Angle between the projection of the stylus on the device plane and the Y-axis of the device plane.

**Type:** Int64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let timestamp

```cangjie
public let timestamp: Int64
```

**Function:** Event timestamp.

**Type:** Int64

**Read/Write Capability:** Read-only

**Initial Version:** 19

### class BaseGestureEvent

```cangjie
public open class BaseGestureEvent <: BaseEvent {
    public let fingerList: ArrayList<FingerInfo>
}
```

**Function:** Base class for basic gesture event information.

**Parent Types:**

- [BaseEvent](#class-baseevent)

#### let fingerList

```cangjie
public let fingerList: ArrayList<FingerInfo>
```

**Function:** Information about all fingers that triggered the event.

**Type:** ArrayList\<[FingerInfo](./cj-universal-gesture-bind.md#class-fingerinfo)>

**Read/Write Capability:** Read-only

**Initial Version:** 19

### class LongPressGestureEvent

```cangjie
public class LongPressGestureEvent <: BaseGestureEvent {
    public let repeat: Bool
}
```

**Function:** Basic gesture event information for long-press gestures. This object can be passed as the event parameter of onGestureJudgeBegin.

**Parent Types:**

- [BaseGestureEvent](#class-basegestureevent)

#### let repeat

```cangjie
public let repeat: Bool
```

**Function:** Whether the event is a repeated trigger.

**Type:** Bool

**Read/Write Capability:** Read-only

**Initial Version:** 19

### class PanGestureEvent

```cangjie
public class PanGestureEvent <: BaseGestureEvent {
    public let offsetX: Float64
    public let offsetY: Float64
    public let velocityX: Float64
    public let velocityY: Float64
    public let velocity: Float64
}
```

**Function:** Basic gesture event information for swipe gestures. This object can be passed as the event parameter of onGestureJudgeBegin.

**Parent Types:**

- [BaseGestureEvent](#class-basegestureevent)

#### let offsetX

```cangjie
public let offsetX: Float64
```

**Function:** Gesture event offset X, in vp units. Positive when swiping from left to right, negative otherwise.

**Type:** Float64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let offsetY

```cangjie
public let offsetY: Float64
```

**Function:** Gesture event offset Y, in vp units. Positive when swiping from top to bottom, negative otherwise.

**Type:** Float64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let velocity
```cangjie
public let velocity: Float64
```

**Function:** Gets the main directional velocity of the current gesture. It is the arithmetic square root of the sum of squared velocities in the x and y directions. Unit: vp/s.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

#### let velocityX

```cangjie
public let velocityX: Float64
```

**Function:** Gets the x-directional velocity of the current gesture. The coordinate origin is at the top-left corner of the screen, with positive and negative directional velocities. Rightward is positive, and leftward is negative. Unit: vp/s.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

#### let velocityY

```cangjie
public let velocityY: Float64
```

**Function:** Gets the y-directional velocity of the current gesture. The coordinate origin is at the top-left corner of the screen, with positive and negative directional velocities. Downward is positive, and upward is negative. Unit: vp/s.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

### class PinchGestureEvent

```cangjie
public class PinchGestureEvent <: BaseGestureEvent {
    public let scale: Float64
    public let pinchCenterX: Float64
    public let pinchCenterY: Float64
}
```

**Function:** Basic gesture event information for pinch gestures. This object can be passed as the `event` parameter of `onGestureJudgeBegin`.

**Parent Type:**

- [BaseGestureEvent](#class-basegestureevent)

#### let pinchCenterX

```cangjie
public let pinchCenterX: Float64
```

**Function:** The x-coordinate of the pinch gesture center point relative to the top-left corner of the original area of the current component element. Unit: vp.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

#### let pinchCenterY

```cangjie
public let pinchCenterY: Float64
```

**Function:** The y-coordinate of the pinch gesture center point relative to the top-left corner of the original area of the current component element. Unit: vp.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

#### let scale

```cangjie
public let scale: Float64
```

**Function:** The scaling ratio.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

### class RotationGestureEvent

```cangjie
public class RotationGestureEvent <: BaseGestureEvent {
    public let angle: Float64
}
```

**Function:** Basic gesture event information for rotation gestures. This object can be passed as the `event` parameter of `onGestureJudgeBegin`.

**Parent Type:**

- [BaseGestureEvent](#class-basegestureevent)

#### let angle

```cangjie
public let angle: Float64
```

**Function:** Represents the rotation angle in degrees (deg). Using the starting line as the coordinate system, clockwise rotation ranges from 0 to 180 degrees, and counterclockwise rotation ranges from -180 to 0 degrees.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

### class SwipeGestureEvent

```cangjie
public class SwipeGestureEvent <: BaseGestureEvent {
    public let angle: Float64
    public let speed: Float64
}
```

**Function:** Basic gesture event information for swipe gestures. This object can be passed as the `event` parameter of `onGestureJudgeBegin`.

**Parent Type:**

- [BaseGestureEvent](#class-basegestureevent)

#### let angle

```cangjie
public let angle: Float64
```

**Function:** Represents the angle of the swipe gesture, i.e., the degree of change in the angle between the line segment connecting two fingers and the horizontal direction. Unit: deg. Using the starting line as the coordinate system, clockwise rotation ranges from 0 to 180 degrees, and counterclockwise rotation ranges from -180 to 0 degrees.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

#### let speed

```cangjie
public let speed: Float64
```

**Function:** The speed of the swipe gesture, i.e., the average velocity of all fingers sliding relative to the original area of the current component element. Unit: vp/s.

**Type:** Float64

**Read/Write Permission:** Read-only

**Initial Version:** 19

### class TapGestureEvent

```cangjie
public class TapGestureEvent <: BaseGestureEvent {}
```

**Function:** Basic gesture event information for tap gestures. This object can be passed as the `event` parameter of `onGestureJudgeBegin`.

**Parent Type:**

- [BaseGestureEvent](#class-basegestureevent)

### class GestureInfo

```cangjie
public class GestureInfo {
    public let tag: String,
    public let `type`: GestureTypes,
}
```

**Function:** Basic gesture information.

**Initial Version:** 19

#### let `type`

```cangjie
public let `type`: GestureTypes
```

**Function:** The type of gesture.

**Type:** [GestureTypes](#enum-gesturetypes)

**Read/Write Permission:** Read-only

**Initial Version:** 19

#### let isSystemGesture

```cangjie
public let isSystemGesture: Bool
```

**Function:** Determines whether the current gesture is a built-in gesture of the component.

**Type:** Bool

**Read/Write Permission:** Read-only

**Initial Version:** 19

#### let tag

```cangjie
public let tag: String
```

**Function:** The gesture tag.

**Type:** String

**Read/Write Permission:** Read-only

**Initial Version:** 19

### enum GestureTypes

```cangjie
public enum GestureTypes {
    | TAP_GESTURE
    | LONG_PRESS_GESTURE
    | PAN_GESTURE
    | PINCH_GESTURE
    | SWIPE_GESTURE
    | ROTATION_GESTURE
    | DRAG
    | CLICK
}
```

**Function:** Types of gestures.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

#### CLICK

```cangjie
CLICK
```

**Function:** Click.

**Initial Version:** 19

#### DRAG

```cangjie
DRAG
```

**Function:** Drag.

**Initial Version:** 19

#### LONG_PRESS_GESTURE

```cangjie
LONG_PRESS_GESTURE
```

**Function:** Long press gesture.

**Initial Version:** 19

#### PAN_GESTURE

```cangjie
PAN_GESTURE
```

**Function:** Pan gesture.

**Initial Version:** 19

#### PINCH_GESTURE

```cangjie
# PINCH_GESTURE
```

**Function:** Pinch gesture.

**Initial Version:** 19

#### ROTATION_GESTURE

```cangjie
ROTATION_GESTURE
```

**Function:** Rotation gesture.

**Initial Version:** 19

#### SWIPE_GESTURE

```cangjie
SWIPE_GESTURE
```

**Function:** Swipe gesture.

**Initial Version:** 19

#### TAP_GESTURE

```cangjie
TAP_GESTURE
```

**Function:** Tap gesture.

**Initial Version:** 19

### enum GestureJudgeResult

```cangjie
public enum GestureJudgeResult {
    | CONTINUE
    | REJECT
}
```

**Function:** Custom gesture judgment result.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

#### CONTINUE

```cangjie
CONTINUE
```

**Function:** Does not affect the system gesture judgment flow.

**Initial Version:** 19

#### REJECT

```cangjie
REJECT
```

**Function:** Indicates failure for user-defined gesture judgment.

**Initial Version:** 19

## Example Code 1

This example implements custom judgment for long press, swipe, and drag gestures by configuring onGestureJudgeBegin.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var message: String = ""

    func build() {
        Column() {
            Row() {
                Text(message).width(200).height(80).backgroundColor(Color.GRAY)
            }
            .margin(20.vp)
        }
        .width(100.percent)
        .height(200)
        .borderWidth(2)
        .gesture(
            TapGesture()
            .onAction({ evt =>
                message = "tap1"
            })
        )
        .gesture(
            LongPressGesture()
            .onAction({ evt =>
                message = "longPress"
            })
        )
        .gesture(
            SwipeGesture()
            .onAction({ evt =>
                message = "swipe1"
            })
        )
        .gesture(
            PanGesture()
            .onActionStart({ evt =>
                message = "pan1"
            })
        )
        .onGestureJudgeBegin({ gestureInfo: GestureInfo, event: BaseGestureEvent =>
            // If the gesture type is long press, convert to long press event
            if(event is LongPressGestureEvent) {
                let longPressEvent = (event as LongPressGestureEvent).getOrThrow()
                AppLog.info("repeat = ${longPressEvent.repeat}")
            }
            // If the gesture type is swipe, convert to swipe event
            if(event is SwipeGestureEvent) {
                let swipeGesture = (event as SwipeGestureEvent).getOrThrow()
                AppLog.info("angle = ${swipeGesture.angle }")
            }
            // If the gesture type is drag, convert to drag event
            if(event is PanGestureEvent) {
                let panGesture = (event as PanGestureEvent).getOrThrow()
                AppLog.info("velocity = ${panGesture.velocity  }")
            }
            match(gestureInfo.`type`) {
                // Returning REJECT will cause the drag gesture to fail
                case GestureTypes.PAN_GESTURE => return GestureJudgeResult.REJECT
                // Returning CONTINUE maintains system judgment
                case _ => return GestureJudgeResult.CONTINUE
            }
        })
    }
}
```

![judge1](figures/gesture_judge_1.gif)

## Example Code 2

This example determines whether long press and drag gestures respond by configuring onGestureJudgeBegin to judge the area.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.prompt_action.PromptAction
import ohos.resource_manager.*

@Entry
@Component
class EntryView {
    var scroller: Scroller = Scroller()

    func build() {
        Scroll(this.scroller) {
            Column(8) {
                Text(
                    "Drag: Two layers. Upper layer binds long press, lower layer binds drag. Long press then move in upper area only triggers long press; long press then move in lower area only triggers drag"
                )
                    .width(100.percent)
                    .fontSize(20)
                Stack(Alignment.Center) {
                    // Lower area of Stack is the image region bound to drag gesture
                    Image(@r(app.media.startIcon))
                        .draggable(true)
                        .onDragStart({
                            _ => PromptAction.showToast(message: "Drag: Lower area, Image responds")
                        })
                        .width(200)
                        .height(200)
                    // Upper area of Stack is the floating region bound to long press gesture
                    Stack {

                    }
                        .width(200)
                        .height(200)
                        .hitTestBehavior(HitTestMode.Transparent)
                        .onGestureJudgeBegin(
                            {
                                gestureInfo: GestureInfo, event: BaseGestureEvent =>
                                // Check if tag has value
                                if (gestureInfo
                                    .tag
                                    .isEmpty()) {
                                    AppLog.info("gestureInfo tag" + gestureInfo
                                        .tag
                                        .toString())
                                }
                                // For long press gestures, determine if click position is in upper area
                                var isLongPressGesture = match (gestureInfo.`type`) {
                                    case GestureTypes.LONG_PRESS_GESTURE => true
                                    case _ => false
                                }
                                AppLog.info("gestureInfo type" + isLongPressGesture.toString())
                                if (isLongPressGesture) {
                                    if (event
                                        .fingerList
                                        .size > 0 && event.fingerList[0].localY < 100.0) {
                                        return GestureJudgeResult.CONTINUE
                                    } else {
                                        return GestureJudgeResult.REJECT
                                    }
                                }
                                return GestureJudgeResult.REJECT
                            }
                        )
                        .gesture(
                            GestureGroup(
                                GestureMode.Parallel,
                                LongPressGesture()
                                    .onAction(
                                        {
                                            event: GestureEvent => PromptAction.showToast(
                                                message: "LongPressGesture: Upper area responds")
                                        })
                                    .tag("tap111")
                            )
                        )
                }.width(100.percent)
            }.width(100.percent)
        }
    }
}
```

![judge2](figures/gesture_judge_2.gif)