# Keyboard and Mouse Events

Keyboard and mouse events refer to input events from external devices such as keyboards and mice.

## Mouse Events

Supported mouse events include those triggered by external mice or touchpads.

The mouse can trigger the following events:

| Name                                       | Description                                       |
|:---------------------------------------- |:---------------------------------------- |
|  onHover(callback: (isHover: Bool)->Unit) | Triggered when the mouse enters or exits a component.<br>isHover: Indicates whether the mouse is hovering over the component. It is true when the mouse enters and false when it exits. |
|  onMouse(callback: (event: MouseEvent)->Unit) | Triggered when the current component is clicked by a mouse button or when the mouse hovers and moves over the component.<br>The event return value includes the timestamp when the event was triggered, the mouse button, the action, the mouse coordinates on the entire screen, and the coordinates relative to the current component. |

When a component is bound to the onHover event, the [hoverEffect](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-hovereffect.md) property can be used to set the hover state display effect of the component.

The principle of mouse events is illustrated below:

After a mouse event is passed to ArkUI, it first determines whether the mouse event is a left-button press/release/move and then responds differently:

- Yes: The mouse event is first converted into a touch event at the same position, and the touch event's collision detection, gesture judgment, and callback response are executed. Then, the mouse event's collision detection and callback response are performed.

- No: The event is only used to perform the mouse event's collision detection and callback response.

> **Note:**
>
> All single-finger responsive touch events/gesture events can be operated and responded to via the left mouse button. For example, if we need to develop a feature where clicking a Button navigates to a page and it must support both finger taps and left mouse button clicks, binding just one click event (onClick) can achieve this effect. If different effects are needed for finger taps and left mouse button clicks, the source field in the callback parameters of onClick can be used to determine whether the event was triggered by a finger or a mouse.

### onHover

```cangjie
public func onHover(callback: (Bool)->Unit): This
```

Mouse hover event. The parameter type is Bool, indicating whether the mouse enters or leaves the component. This event does not support custom bubbling settings and defaults to parent-child bubbling.

If a component is bound to this interface, the event is triggered when the mouse pointer moves from outside the component into it, with the parameter value being true. The event is also triggered when the mouse pointer leaves the component, with the parameter value being false.

> **Note:**
>
> Event bubbling: In a tree structure, after a child node processes an event, the event is passed to its parent node for processing.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var hoverText: String = 'Not Hover'
    @State
    var color: Color = Color.GRAY

    func build() {
        Column() {
            Button(this.hoverText)
                .width(200)
                .height(100)
                .backgroundColor(this.color)
                .onHover(
                    {
                        isHover => // Use the onHover interface to monitor whether the mouse is hovering over the Button component
                        if (isHover) {
                            this.hoverText = 'Hovered!'
                            this.color = Color.GREEN
                        } else {
                            this.hoverText = ' Hover'
                            this.color = Color.GRAY
                        }
                    })
        }
            .width(100.percent)
            .height(100.percent)
            .justifyContent(FlexAlign.Center)
    }
}

```

This example creates a Button component with an initial gray background and the text "Not Hover". The Button component in the example is bound to the onHover callback.

When the mouse moves from outside the Button into it, the callback is triggered with the parameter value true, changing the component's background color to Color.Green and the text to "Hovered!".

When the mouse moves from inside the Button out of it, the callback is triggered with the parameter value false, reverting the component to its initial style.

![onHover](./figures/onHover.gif)

### onMouse

```cangjie
public func onMouse(callback: (MouseEvent)->Unit): This
```

Mouse event callback. Whenever the mouse pointer performs an action (MouseAction) within a component bound to this API, the event callback is triggered. The parameter is a [MouseEvent](../../../API_Reference/source_en/arkui-cj/cj-universal-event-mouse.md#struct-mouseevent) object, representing the mouse event that triggered this action. This event supports custom bubbling settings and defaults to parent-child bubbling. It is commonly used for developer-defined mouse behavior logic.

Developers can obtain the coordinates (screenX/screenY/x/y), button ([MouseButton](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-mousebutton)), action ([MouseAction](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-mouseaction)), timestamp (timestamp), interactive component area ([EventTarget](../../../API_Reference/source_en/arkui-cj/cj-universal-event-click.md#struct-eventtarget)), and event source ([SourceType](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-sourcetype)) from the MouseEvent object in the callback.

> **Note:**
>
> The values of MouseButton: Left/Right/Middle/Back/Forward correspond to physical buttons on the mouse. Events for these buttons are triggered when they are pressed or released. None indicates no button, which occurs in events triggered by mouse movement without any button pressed or released.

### hoverEffect

```cangjie
public func hoverEffect(value: HoverEffect)
```

A universal property for setting mouse hover effects. The parameter type is HoverEffect. The Auto, Scale, and Highlight effects provided by HoverEffect are fixed effects, and developers cannot customize the effect parameters.

| HoverEffect Enum Value                    | Effect Description                                      |
|:---------------------------------------- |:---------------------------------------- |
|  Auto | The default hover effect provided by the component, defined by each component. |
|  Scale | Animation playback: When the mouse hovers, the component size scales from 100% to 105%. When the mouse leaves, the component size scales back from 105% to 100%. |
|  Highlight | Animation playback: When the mouse hovers, the component background color is overlaid with a 5% opacity white, visually darkening the original background color. When the mouse leaves, the background color reverts to its original style. |
|  None | Disables the hover effect. |

## Key Events

### onKeyEvent

```cangjie
public func onKeyEvent(callback: (KeyEvent)->Unit): This
```

When the bound component is in a focused state, key events from an external keyboard trigger this method. The callback parameter is [KeyEvent](../../../API_Reference/source_en/arkui-cj/cj-universal-event-key.md#keyevent), from which the current key event's key behavior ([KeyType](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-keytype)), key code (keyCode), key name in English (keyText), event source device type ([KeySource](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-keysource)), event source device ID (deviceId), meta key press state (metaKey), and timestamp (timestamp) can be obtained.