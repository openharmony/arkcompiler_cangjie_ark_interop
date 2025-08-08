# TapGesture

Supports recognition of single-tap, double-tap, and multi-tap events.

## Creating the Component

### init(Int32, Int32)

```cangjie
public init(count!: Int32 = 1, fingers!: Int32 = 1)
```

**Function:** Creates a tap gesture.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| count | Int32 | No | 1 | **Named parameter.** Number of consecutive taps to recognize. When set to less than 1 or not set, it will be converted to the default value.<br/> **Note:** <br/> 1. When configuring multi-tap, the timeout between the last finger lift of the previous tap and the first finger press of the next tap is 300ms.<br/> 2. If the distance between the previous tap position and the current tap position exceeds 60vp, gesture recognition fails. |
| fingers | Int32 | No | 1 | **Named parameter.** Number of fingers required to trigger the tap, minimum 1 finger, maximum 10 fingers. When set to less than 1 or not set, it will be converted to the default value.<br/> **Note:** <br/> 1. When configuring multi-finger, if enough fingers are not pressed within 300ms after the first finger press, gesture recognition fails. When fingers are lifted, timing starts if the remaining fingers are below the threshold. If all fingers are not lifted within 300ms, gesture recognition fails.<br/> 2. If the actual number of fingers tapped exceeds the configured value, gesture recognition succeeds. |

## Component Events

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**Function:** Triggered when Tap gesture recognition succeeds.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit | Yes | - | Callback function triggered when Tap gesture recognition succeeds. |

## Example Code

This example demonstrates double-tap gesture recognition using TapGesture.

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