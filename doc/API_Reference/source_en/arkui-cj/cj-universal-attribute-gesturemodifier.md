# Dynamic Gesture Settings

Dynamically set the gestures bound to components, supporting developers in using if/else syntax during property configuration.

## func gestureModifier(GestureModifier)

```cangjie
public func gestureModifier(modifier: GestureModifier): This
```

**Function:** Dynamically sets the gestures bound to components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| modifier | [GestureModifier](#interface-gesturemodifier) | Yes | - | Gesture modifier. Developers need to implement the GestureModifier interface by defining a custom class. |

## interface GestureModifier

```cangjie
public interface GestureModifier {
    func applyGesture(event: UIGestureEvent): Unit
}
```

**Function:** Dynamically sets the gestures bound to components. Developers need to implement the GestureModifier interface by defining a custom class.

### func applyGesture(UIGestureEvent)

```cangjie
func applyGesture(event: UIGestureEvent): Unit
```

**Function:** Gestures to be bound to the component. Developers can customize the implementation of this method to set the required gestures for the component, supporting dynamic configuration using if/else syntax.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [UIGestureEvent](./cj-universal-gesture-handle.md#class-uigestureevent) | Yes | - | UIGestureEvent object used to set the gestures to be bound to the component. |

## Example Code

This example demonstrates dynamically setting component-bound gestures using GestureModifier.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

class MyButtonModifier <: GestureModifier {
    public func applyGesture(event: UIGestureEvent): Unit {
        event.addGesture(
            TapGestureHandler()
            .onAction({ evt =>
                AppLog.info("TapGestureHandler onAction")
            })
        )
    }
}

@Entry
@Component
class EntryView {
    @State var modifier: MyButtonModifier = MyButtonModifier()

    func build() {
        Scroll() {
            Column() {
                Row() {
                    Text("Tap")
                }
                .height(100)
                .width(200)
                .borderWidth(1)
                .gestureModifier(this.modifier)
            }.width(100.percent)
        }
        .width(100.percent)
        .width(100.percent)
    }
}
```

![dynamic_gestures](./figures/Dynamic_gestures.png)