# 鼠标光标控制

控制鼠标光标的显示样式。

## class CursorControl

```cangjie
public class CursorControl {
}
```

**功能：** 鼠标光标控制模块。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

### static func setCursor(PointerStyle)

```cangjie
public static func setCursor(keyValue: PointerStyle): Unit
```

**功能：** 方法语句中可使用的全局接口，调用此接口可以更改当前的鼠标光标样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| keyValue | [PointerStyle](./cj-universal-attribute-cursor.md#enum-pointerstyle) | 是 | \- | 设置的鼠标样式。 |

### static func restoreDefault()

```cangjie
public static func restoreDefault(): Unit
```

**功能：** 方法语句中可使用的全局接口，调用此接口可以将鼠标光标恢复成默认的箭头光标样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

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

**功能：** 鼠标样式类型。

**系统能力：** SystemCapability.MultimodalInput.Input.Pointer

**起始版本：** 19

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 默认。

**起始版本：** 19

### EAST

```cangjie
EAST
```

**功能：** 向东箭头。

**起始版本：** 19

### WEST

```cangjie
WEST
```

**功能：** 向西箭头。

**起始版本：** 19

### SOUTH

```cangjie
SOUTH
```

**功能：** 向南箭头。

**起始版本：** 19

### NORTH

```cangjie
NORTH
```

**功能：** 向北箭头。

**起始版本：** 19

### WEST_EAST

```cangjie
WEST_EAST
```

**功能：** 向西东箭头。

**起始版本：** 19

### NORTH_SOUTH

```cangjie
NORTH_SOUTH
```

**功能：** 向北南箭头。

**起始版本：** 19

### NORTH_EAST

```cangjie
NORTH_EAST
```

**功能：** 向东北箭头。

**起始版本：** 19

### NORTH_WEST

```cangjie
NORTH_WEST
```

**功能：** 向西北箭头。

**起始版本：** 19

### SOUTH_EAST

```cangjie
SOUTH_EAST
```

**功能：** 向东南箭头。

**起始版本：** 19

### SOUTH_WEST

```cangjie
SOUTH_WEST
```

**功能：** 向西南箭头。

**起始版本：** 19

### NORTH_EAST_SOUTH_WEST

```cangjie
NORTH_EAST_SOUTH_WEST
```

**功能：** 东北西南调整。

**起始版本：** 19

### NORTH_WEST_SOUTH_EAST

```cangjie
NORTH_WEST_SOUTH_EAST
```

**功能：** 西北东南调整。

**起始版本：** 19

### CROSS

```cangjie
CROSS
```

**功能：** 准确选择。

**起始版本：** 19

### CURSOR_COPY

```cangjie
CURSOR_COPY
```

**功能：** 拷贝。

**起始版本：** 19

### CURSOR_FORBID

```cangjie
CURSOR_FORBID
```

**功能：** 不可用。

**起始版本：** 19

### COLOR_SUCKER

```cangjie
COLOR_SUCKER
```

**功能：** 滴管。

**起始版本：** 19

### HAND_GRABBING

```cangjie
HAND_GRABBING
```

**功能：** 并拢的手。

**起始版本：** 19

### HAND_OPEN

```cangjie
HAND_OPEN
```

**功能：** 张开的手。

**起始版本：** 19

### HAND_POINTING

```cangjie
HAND_POINTING
```

**功能：** 手形指针。

**起始版本：** 19

### HELP

```cangjie
HELP
```

**功能：** 帮助选择。

**起始版本：** 19

### MOVE

```cangjie
MOVE
```

**功能：** 移动。

**起始版本：** 19

### RESIZE_LEFT_RIGHT

```cangjie
RESIZE_LEFT_RIGHT
```

**功能：** 内部左右调整。

**起始版本：** 19

### RESIZE_UP_DOWN

```cangjie
RESIZE_UP_DOWN
```

**功能：** 内部上下调整。

**起始版本：** 19

### SCREENSHOT_CHOOSE

```cangjie
SCREENSHOT_CHOOSE
```

**功能：** 截图十字准星。

**起始版本：** 19

### SCREENSHOT_CURSOR

```cangjie
SCREENSHOT_CURSOR
```

**功能：** 截图。

**起始版本：** 19

### TEXT_CURSOR

```cangjie
TEXT_CURSOR
```

**功能：** 文本选择。

**起始版本：** 19

### ZOOM_IN

```cangjie
ZOOM_IN
```

**功能：** 放大。

**起始版本：** 19

### ZOOM_OUT

```cangjie
ZOOM_OUT
```

**功能：** 缩小。

**起始版本：** 19

### MIDDLE_BTN_EAST

```cangjie
MIDDLE_BTN_EAST
```

**功能：** 向东滚动。

**起始版本：** 19

### MIDDLE_BTN_WEST

```cangjie
MIDDLE_BTN_WEST
```

**功能：** 向西滚动。

**起始版本：** 19

### MIDDLE_BTN_SOUTH

```cangjie
MIDDLE_BTN_SOUTH
```

**功能：** 向南滚动。

**起始版本：** 19

### MIDDLE_BTN_NORTH

```cangjie
MIDDLE_BTN_NORTH
```

**功能：** 向北滚动。

**起始版本：** 19

### MIDDLE_BTN_NORTH_SOUTH

```cangjie
MIDDLE_BTN_NORTH_SOUTH
```

**功能：** 向北南滚动。

**起始版本：** 19

### MIDDLE_BTN_NORTH_EAST

```cangjie
MIDDLE_BTN_NORTH_EAST
```

**功能：** 向东北滚动。

**起始版本：** 19

### MIDDLE_BTN_NORTH_WEST

```cangjie
MIDDLE_BTN_NORTH_WEST
```

**功能：** 向西北滚动。

**起始版本：** 19

### MIDDLE_BTN_SOUTH_EAST

```cangjie
MIDDLE_BTN_SOUTH_EAST
```

**功能：** 向东南滚动。

**起始版本：** 19

### MIDDLE_BTN_SOUTH_WEST

```cangjie
MIDDLE_BTN_SOUTH_WEST
```

**功能：** 向西南滚动。

**起始版本：** 19

### MIDDLE_BTN_NORTH_SOUTH_WEST_EAST

```cangjie
MIDDLE_BTN_NORTH_SOUTH_WEST_EAST
```

**功能：** 四向锥形移动。

**起始版本：** 19

### HORIZONTAL_TEXT_CURSOR

```cangjie
HORIZONTAL_TEXT_CURSOR
```

**功能：** 垂直文本选择。

**起始版本：** 19

### CURSOR_CROSS

```cangjie
CURSOR_CROSS
```

**功能：** 十字光标。

**起始版本：** 19

### CURSOR_CIRCLE

```cangjie
CURSOR_CIRCLE
```

**功能：** 圆形光标。

**起始版本：** 19

### LOADING

```cangjie
LOADING
```

**功能：** 正在载入动画光标。

**起始版本：** 19

### RUNNING

```cangjie
RUNNING
```

**功能：** 后台运行中动画光标。

**起始版本：** 19

## 示例代码

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
