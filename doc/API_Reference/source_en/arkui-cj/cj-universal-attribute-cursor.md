# Mouse Cursor Control

Controls the display style of the mouse cursor.

## class CursorControl

```cangjie
public class CursorControl {
}
```

**Functionality:** Mouse cursor control module.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

### static func setCursor(PointerStyle)

```cangjie
public static func setCursor(keyValue: PointerStyle): Unit
```

**Functionality:** A global interface available in method statements. Calling this interface can change the current mouse cursor style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| keyValue | [PointerStyle](./cj-universal-attribute-cursor.md#enum-pointerstyle) | Yes | \- | The mouse style to be set. |

### static func restoreDefault()

```cangjie
public static func restoreDefault(): Unit
```

**Functionality:** A global interface available in method statements. Calling this interface can restore the mouse cursor to the default arrow style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

## enum PointerStyle

```cangjie
public enum PointerStyle {
    | DEFAULT
    | EAST
    | WEST
    | SOUTH
    | NORTH
    | WEST_EAST
    | NORTH_SOUTH
    | NORTH_EAST
    | NORTH_WEST
    | SOUTH_EAST
    | SOUTH_WEST
    | NORTH_EAST_SOUTH_WEST
    | NORTH_WEST_SOUTH_EAST
    | CROSS
    | CURSOR_COPY
    | CURSOR_FORBID
    | COLOR_SUCKER
    | HAND_GRABBING
    | HAND_OPEN
    | HAND_POINTING
    | HELP
    | MOVE
    | RESIZE_LEFT_RIGHT
    | RESIZE_UP_DOWN
    | SCREENSHOT_CHOOSE
    | SCREENSHOT_CURSOR
    | TEXT_CURSOR
    | ZOOM_IN
    | ZOOM_OUT
    | MIDDLE_BTN_EAST
    | MIDDLE_BTN_WEST
    | MIDDLE_BTN_SOUTH
    | MIDDLE_BTN_NORTH
    | MIDDLE_BTN_NORTH_SOUTH
    | MIDDLE_BTN_NORTH_EAST
    | MIDDLE_BTN_NORTH_WEST
    | MIDDLE_BTN_SOUTH_EAST
    | MIDDLE_BTN_SOUTH_WEST
    | MIDDLE_BTN_NORTH_SOUTH_WEST_EAST
    | HORIZONTAL_TEXT_CURSOR
    | CURSOR_CROSS
    | CURSOR_CIRCLE
    | LOADING
    | RUNNING
}
```

**Functionality:** Mouse cursor style types.

**System Capability:** SystemCapability.MultimodalInput.Input.Pointer

**Since:** 19

### DEFAULT

```cangjie
DEFAULT
```

**Functionality:** Default.

**Since:** 19

### EAST

```cangjie
EAST
```

**Functionality:** Eastward arrow.

**Since:** 19

### WEST

```cangjie
WEST
```

**Functionality:** Westward arrow.

**Since:** 19

### SOUTH

```cangjie
SOUTH
```

**Functionality:** Southward arrow.

**Since:** 19

### NORTH

```cangjie
NORTH
```

**Functionality:** Northward arrow.

**Since:** 19

### WEST_EAST

```cangjie
WEST_EAST
```

**Functionality:** West-east arrow.

**Since:** 19

### NORTH_SOUTH

```cangjie
NORTH_SOUTH
```

**Functionality:** North-south arrow.

**Since:** 19

### NORTH_EAST

```cangjie
NORTH_EAST
```

**Functionality:** Northeast arrow.

**Since:** 19

### NORTH_WEST

```cangjie
NORTH_WEST
```

**Functionality:** Northwest arrow.

**Since:** 19

### SOUTH_EAST

```cangjie
SOUTH_EAST
```

**Functionality:** Southeast arrow.

**Since:** 19

### SOUTH_WEST

```cangjie
SOUTH_WEST
```

**Functionality:** Southwest arrow.

**Since:** 19

### NORTH_EAST_SOUTH_WEST

```cangjie
NORTH_EAST_SOUTH_WEST
```

**Functionality:** Northeast-southwest adjustment.

**Since:** 19

### NORTH_WEST_SOUTH_EAST

```cangjie
NORTH_WEST_SOUTH_EAST
```

**Functionality:** Northwest-southeast adjustment.

**Since:** 19

### CROSS

```cangjie
CROSS
```

**Functionality:** Precise selection.

**Since:** 19

### CURSOR_COPY

```cangjie
CURSOR_COPY
```

**Functionality:** Copy.

**Since:** 19

### CURSOR_FORBID

```cangjie
CURSOR_FORBID
```

**Functionality:** Unavailable.

**Since:** 19

### COLOR_SUCKER

```cangjie
COLOR_SUCKER
```

**Functionality:** Eyedropper.

**Since:** 19

### HAND_GRABBING

```cangjie
HAND_GRABBING
```

**Functionality:** Closed hand.

**Since:** 19

### HAND_OPEN

```cangjie
HAND_OPEN
```

**Functionality:** Open hand.

**Since:** 19

### HAND_POINTING

```cangjie
HAND_POINTING
```
**Function:** Hand pointer.

**Initial Version:** 19

### HELP

```cangjie
HELP
```

**Function:** Help selection.

**Initial Version:** 19

### MOVE

```cangjie
MOVE
```

**Function:** Move.

**Initial Version:** 19

### RESIZE_LEFT_RIGHT

```cangjie
RESIZE_LEFT_RIGHT
```

**Function:** Internal horizontal resizing.

**Initial Version:** 19

### RESIZE_UP_DOWN

```cangjie
RESIZE_UP_DOWN
```

**Function:** Internal vertical resizing.

**Initial Version:** 19

### SCREENSHOT_CHOOSE

```cangjie
SCREENSHOT_CHOOSE
```

**Function:** Screenshot crosshair.

**Initial Version:** 19

### SCREENSHOT_CURSOR

```cangjie
SCREENSHOT_CURSOR
```

**Function:** Screenshot.

**Initial Version:** 19

### TEXT_CURSOR

```cangjie
TEXT_CURSOR
```

**Function:** Text selection.

**Initial Version:** 19

### ZOOM_IN

```cangjie
ZOOM_IN
```

**Function:** Zoom in.

**Initial Version:** 19

### ZOOM_OUT

```cangjie
ZOOM_OUT
```

**Function:** Zoom out.

**Initial Version:** 19

### MIDDLE_BTN_EAST

```cangjie
MIDDLE_BTN_EAST
```

**Function:** Scroll east.

**Initial Version:** 19

### MIDDLE_BTN_WEST

```cangjie
MIDDLE_BTN_WEST
```

**Function:** Scroll west.

**Initial Version:** 19

### MIDDLE_BTN_SOUTH

```cangjie
MIDDLE_BTN_SOUTH
```

**Function:** Scroll south.

**Initial Version:** 19

### MIDDLE_BTN_NORTH

```cangjie
MIDDLE_BTN_NORTH
```

**Function:** Scroll north.

**Initial Version:** 19

### MIDDLE_BTN_NORTH_SOUTH

```cangjie
MIDDLE_BTN_NORTH_SOUTH
```

**Function:** Scroll north-south.

**Initial Version:** 19

### MIDDLE_BTN_NORTH_EAST

```cangjie
MIDDLE_BTN_NORTH_EAST
```

**Function:** Scroll northeast.

**Initial Version:** 19

### MIDDLE_BTN_NORTH_WEST

```cangjie
MIDDLE_BTN_NORTH_WEST
```

**Function:** Scroll northwest.

**Initial Version:** 19

### MIDDLE_BTN_SOUTH_EAST

```cangjie
MIDDLE_BTN_SOUTH_EAST
```

**Function:** Scroll southeast.

**Initial Version:** 19

### MIDDLE_BTN_SOUTH_WEST

```cangjie
MIDDLE_BTN_SOUTH_WEST
```

**Function:** Scroll southwest.

**Initial Version:** 19

### MIDDLE_BTN_NORTH_SOUTH_WEST_EAST

```cangjie
MIDDLE_BTN_NORTH_SOUTH_WEST_EAST
```

**Function:** Four-directional conical movement.

**Initial Version:** 19

### HORIZONTAL_TEXT_CURSOR

```cangjie
HORIZONTAL_TEXT_CURSOR
```

**Function:** Vertical text selection.

**Initial Version:** 19

### CURSOR_CROSS

```cangjie
CURSOR_CROSS
```

**Function:** Crosshair cursor.

**Initial Version:** 19

### CURSOR_CIRCLE

```cangjie
CURSOR_CIRCLE
```

**Function:** Circle cursor.

**Initial Version:** 19

### LOADING

```cangjie
LOADING
```

**Function:** Loading animation cursor.

**Initial Version:** 19

### RUNNING

```cangjie
RUNNING
```

**Function:** Background running animation cursor.

**Initial Version:** 19

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import ohos.state_macro_manage.*
import ohos.state_manage.*
import ohos.component.*
import ohos.base.LengthProp

import ohos.component.CursorControl

@Entry
@Component
class EntryView {
    @State var enable: Bool = false

    func build() {
        Column() {
            Text(this.enable.toString())
            Row {
                Button("CursorControl")
                .onClick {}
                .fontSize(40)
                .height(80)
                .onHover ({isHover =>
                    if (this.enable){
                        CursorControl.setCursor(PointerStyle.WEST)
                    } else {
                        CursorControl.restoreDefault()
                    }
                })
                .onClick {
                    this.enable = !this.enable
                }

            }
        }.width(100.percent).margin(top: 20)
    }
}
```

![cursor_control](./figures/cursorControl.gif)