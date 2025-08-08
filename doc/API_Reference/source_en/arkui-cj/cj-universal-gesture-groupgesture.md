# Composite Gestures

Gesture recognition combination refers to the composition of multiple gestures into a composite gesture, supporting sequential recognition, parallel recognition, and exclusive recognition.

## Import Module

```cangjie
import kit.UIkit.*
```

## Permission List

None

## Creating Components

### init(GestureMode, Array\<GestureType>)

```cangjie
public init(mode: GestureMode, gesture: Array<GestureType>)
```

**Function:** Creates a gesture recognition combination.

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|mode|[GestureMode](#enum-gesturemode)|Yes|GestureMode.Sequence|Sets the recognition mode for composite gestures.|
|gesture|[TapGesture](./cj-universal-gesture-tapgesture.md)<br>[LongPressGesture](./cj-universal-gesture-longpressgesture.md)<br>[PanGesture](./cj-universal-gesture-pangesture.md)<br>[PinchGesture](./cj-universal-gesture-pinchgesture.md)<br>[RotationGesture](./cj-universal-gesture-rotationgesture.md)<br>[SwipeGesture](./cj-universal-gesture-swipegesture.md)<br>[GestureGroup](./cj-universal-gesture-groupgesture.md)|Yes|-|When setting one or more basic gesture types, these gestures will be recognized as composite gestures. If the length of this parameter Array is 0, the composite gesture recognition feature will not take effect.<br>**Note:**<br>When adding both single-tap and double-tap gestures to a component simultaneously, you can add two TapGestures to the composite gesture. The double-tap gesture must come before the single-tap gesture; otherwise, it will not work.|

## Component Events

### func onCancel(() -> Unit)

```cangjie
public func onCancel(callback: () -> Unit): This
```

**Function:** Triggered when a sequential composite gesture (GestureMode.Sequence) is canceled.

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|callback|() \-> Unit|Yes|-|Callback function triggered when a sequential composite gesture (GestureMode.Sequence) is canceled.|

## Basic Type Definitions

### enum GestureMode

```cangjie
public enum GestureMode {
    | Sequence
    | Parallel
    | Exclusive
}
```

**Function:** Recognition mode for composite gestures.

**Initial Version:** 12

#### Sequence

```cangjie
Sequence
```

**Function:** Sequential recognition. Gestures are recognized in the order they are registered until all gestures are successfully recognized. If any gesture fails to recognize, subsequent gestures will also fail. Only the last gesture in a sequential gesture group can respond to onActionEnd.

**Initial Version:** 12

#### Parallel

```cangjie
Parallel
```

**Function:** Concurrent recognition. Registered gestures are recognized simultaneously until all gestures complete recognition, with no mutual interference.

**Initial Version:** 12

#### Exclusive

```cangjie
Exclusive
```

**Function:** Exclusive recognition. Registered gestures are recognized simultaneously. If any gesture is successfully recognized, the gesture recognition process ends.

**Initial Version:** 12

## Example

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var count: Int64 = 0
    @State var offsetX: Float64 = 0.0
    @State var offsetY: Float64 = 0.0
    @State var positionX: Float64 = 0.0
    @State var positionY: Float64 = 0.0
    @State var borderStyles: BorderStyle = BorderStyle.Solid

    func build() {
        Column() {
            Column() {
                Text('sequence gesture\n' + 'LongPress onAction:' + this.count.toString() +
                    '\nPanGesture offset:\nX: ' + this.offsetX.toString() + '\n' + 'Y: ' + this.offsetY.toString())
            }
            .height(200)
            .width(300)
            .padding(20)
            .border(width: 3.vp, style: this.borderStyles)
            .margin(20)
            .translate(x: this.offsetX, y: this.offsetY, z: 0.0)
            .gesture(
                GestureGroup(GestureMode.Sequence,
                [
                    LongPressGesture(repeat: true)
                    .onAction({ event: GestureEvent =>
                        this.count++
                    }),
                    PanGesture()
                    .onActionStart({ event: GestureEvent =>
                        this.borderStyles = BorderStyle.Dashed
                    })
                    .onActionUpdate({ event: GestureEvent =>
                        this.offsetX = this.positionX + event.offsetX
                        this.offsetY = this.positionY + event.offsetY
                    })
                    .onActionEnd({ event: GestureEvent =>
                        this.positionX = this.offsetX
                        this.positionY = this.offsetY
                        this.borderStyles = BorderStyle.Solid
                    })
                    ]
                )
            )
        }
    }
}
```

Illustration:

First, the long-press event is triggered sequentially:

![group](figures/group_gesture_1.gif)

After the long-press event recognition completes, the drag event is triggered, dragging downward:

![group](figures/group_gesture_2.gif)