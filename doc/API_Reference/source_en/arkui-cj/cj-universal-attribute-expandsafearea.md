# Safe Area

The safe area refers to the visible region of a page that, by default, does not overlap with system-defined non-safe areas such as the status bar or navigation bar. By default, interfaces developed by developers are laid out within the safe area. Property methods are provided to allow developers to extend component rendering beyond the safe area constraints. The [expandSafeArea](./cj-universal-attribute-expandsafearea.md#func-expandsafeareaarraysafeareatype-arraysafeareaedge) attribute enables components to extend their rendering area beyond the safe area without altering the layout. The [setKeyboardAvoidMode](./cj-universal-attribute-expandsafearea.md#func-setkeyboardavoidmodevalue-keyboardavoidmode) method configures the page's avoidance mode when the virtual keyboard is displayed. For components like title bars where text should not overlap with non-safe areas, it is recommended to set the `expandSafeArea` attribute for an immersive effect. Alternatively, the immersive mode can be directly enabled via the window interface [setWindowLayoutFullScreen](./cj-apis-window.md#).

> **Note:**
>
> By default, the camera cutout area is not considered a non-safe area, and the page does not avoid the cutout.

```json5
"metadata": [
  {
    "name": "avoid_cutout",
    "value": "true",
  }
],
```

## func expandSafeArea(Array\<SafeAreaType>, Array\<SafeAreaEdge>)

```cangjie
public func expandSafeArea(types!: [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD], edges!: Array<SafeAreaEdge> =[SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END]): This
```

**Function:** Configures the component to extend its safe area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| types | Array\<[SafeAreaType](./cj-universal-attribute-expandsafearea.md#enum-safeareatype)> | No | [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD] | **Named parameter.** Configures the type of safe area extension.<br>When the `metadata` configuration is absent, the page does not avoid cutouts, and the `CUTOUT` type is ineffective. |
| edges | Array\<[SafeAreaType](./cj-universal-attribute-expandsafearea.md#enum-safeareatype)> | No | [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END] | **Named parameter.** Configures the direction of safe area extension.<br>Extends to all non-safe areas. |

> **Notes:**
>
> - When using the `expandSafeArea` attribute to extend component rendering, avoid setting fixed dimensions (except percentages). If fixed dimensions are set, only [SafeAreaEdge.TOP, SafeAreaEdge.START] directions are supported, and the component size remains unchanged.
> - The safe area does not constrain the layout or size of internal components and does not clip them.
> - The `expandSafeArea` attribute is ineffective when the parent container is a scrollable container.
> - If no parameters are passed to `expandSafeArea()`, default values are applied. Passing empty arrays (`expandSafeArea([],[])`) renders the attribute ineffective.
> - Conditions for `expandSafeArea` to take effect:
>   1. When `type` is `SafeAreaType.KEYBOARD`, it takes effect by default, and the component does not avoid the keyboard.
>   2. For other `type` settings, the component must overlap with the safe area boundary to extend into it. For example, if the device's status bar height is 100, the component's absolute position must satisfy `0 <= y <= 100`.
> - Components extending into the safe area may have events (e.g., clicks) intercepted by the system, prioritizing system components like the status bar.
> - Avoid setting `expandSafeArea` on components within scrollable containers. If necessary, ensure all direct ancestors up to the scrollable container are also configured with `expandSafeArea` to prevent failure during scrolling (see example).
> - The `expandSafeArea` attribute applies only to the current component and does not propagate to parent or child components. All relevant components must be configured accordingly.
> - When both `expandSafeArea` and `position` attributes are set, `position` takes precedence. For components without `position` or `offset` attributes, `expandSafeArea` is ineffective if the component does not overlap with the avoidance area (e.g., dialogs or semi-modal components).
> - For scenarios where `expandSafeArea` is ineffective, manually adjust component coordinates to place them in the avoidance area.

## func setKeyboardAvoidMode(value: KeyboardAvoidMode)

```cangjie
public func setKeyboardAvoidMode(value: KeyboardAvoidMode): void
```

**Function:** Controls the page's avoidance mode when the virtual keyboard is displayed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| value | [KeyboardAvoidMode](./cj-universal-attribute-expandsafearea.md#enum-keyboardavoidmode) | Yes | - | Configures the page's avoidance mode when the keyboard is displayed.<br>Default: `KeyboardAvoidMode.OFFSET`, which lifts the page when the keyboard is displayed. |

> **Notes:**
>
> - The `RESIZE` mode of `KeyboardAvoidMode` compresses the `Page` size. Components with percentage dimensions adjust accordingly, while fixed-size components retain their layout. `expandSafeArea([SafeAreaType.KEYBOARD],[SafeAreaEdge.BOTTOM])` is ineffective in `RESIZE` mode.
> - `KeyboardAvoidMode.NONE` disables keyboard avoidance, allowing the keyboard to overlay the `Page`.

## Basic Type Definitions

### enum KeyboardAvoidMode

```cangjie
public enum KeyboardAvoidMode {
    | OFFSET
    | RESIZE
    | OFFSET_WITH_CARET
    | RESIZE_WITH_CARET
    | NONE
}
```

**Function:** Determines whether the dialog automatically avoids the soft keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### OFFSET

```cangjie
OFFSET
```

**Function:** Lift mode.

**Since:** 19

#### RESIZE

```cangjie
RESIZE
```

**Function:** Compression mode.

**Since:** 19

#### OFFSET_WITH_CARET

```cangjie
OFFSET_WITH_CARET
```

**Function:** Lift mode, triggered when the input cursor position changes.

**Since:** 19

#### RESIZE_WITH_CARET

```cangjie
RESIZE_WITH_CARET
```

**Function:** Compression mode, triggered when the input cursor position changes.

**Since:** 19

#### NONE

```cangjie
NONE
```

**Function:** No avoidance of the soft keyboard.

**Since:** 19

### enum SafeAreaType

```cangjie
public enum SafeAreaType {
    | SYSTEM
    | CUTOUT
    | KEYBOARD
}
```

**Function:** Enumeration for extending the safe area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### SYSTEM

```cangjie
SYSTEM
```

**Function:** System-defined non-safe areas, including the status bar and navigation bar.

**Since:** 12

#### CUTOUT

```cangjie
CUTOUT
```

**Function:** Device-specific non-safe areas, such as notches or punch-hole screens.

**Since:** 12

#### KEYBOARD

```cangjie
KEYBOARD
```

**Function:** Soft keyboard area.

**Since:** 12

### enum SafeAreaEdge

```cangjie
public enum SafeAreaEdge {
    | TOP
    | BOTTOM
    | START
    | END
}
```

**Function:** Direction for extending the safe area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### TOP

```cangjie
TOP
```

**Function:** Top area.

**Since:** 12

#### BOTTOM

```cangjie
BOTTOM
```

**Function:** Bottom area.

**Since:** 12

#### START

```cangjie
START
```

**Function:** Start area.

**Since:** 12

#### END

```cangjie
END
```

**Function:** End area.

**Since:** 12

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    let controller: TextInputController = TextInputController()
    func build() {
        Stack() {
            Column()
                .height(100.percent).width(100.percent)
                .backgroundImage(src: @r(app.media.background)).backgroundImageSize(ImageSize.Cover)
                .expandSafeArea(types: [SafeAreaType.SYSTEM, SafeAreaType.KEYBOARD], edges: [SafeAreaEdge.BOTTOM])
            Column() {
                Button("Set caretPosition 1")
                    .onClick{
                        this.controller.caretPosition(1)
                    }
                TextInput(controller: this.controller)
                    .placeholderFont(size: 14.px)
                    .width(320).height(40).offset(x:0, y: 120)
                    .fontSize(14)
            }.width(100.percent).alignItems(HorizontalAlign.Center)
        }
    }
}
```

![uni_expand_safe_area](figures/uni-safe.jpg)