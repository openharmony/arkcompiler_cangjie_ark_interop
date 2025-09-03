# Action Sheet Dialog (ActionSheet)

A list dialog.

## class ActionSheet

```cangjie
public class ActionSheet {}
```

**Function:** List dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static func show(ActionSheetOptions, ShadowOptions)

```cangjie
public static func show(value: ActionSheetOptions, shadow: ShadowOptions): Unit
```

**Function:** Defines and displays a list dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ActionSheetOptions](#class-actionsheetoptions) | Yes | - | Parameters for configuring the action sheet dialog. |
| shadow | [ShadowOptions](cj-common-types.md#class-shadowoptions) | Yes | - | Sets the shadow of the dialog backdrop. |

**Example:**

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row {
            Column() {
                Button("Click to Show ActionSheet").onClick(
                    {
                        evt =>
                        let sheets: Array<SheetInfo> = [SheetInfo("apple", {=> Hilog.info(0, "AppLogCj", "apple")}),
                            SheetInfo("banana", {=> Hilog.info(0, "AppLogCj", "banana")}), SheetInfo("pears", {=> Hilog.info(0, "AppLogCj", "pears")})]
                        let confirm: Confirm = Confirm("Confirm button", {=> Hilog.info(0, "AppLogCj", "Get Alert Dialog handled")},
                            defaultFocus: true, style: DialogButtonStyle.HIGHLIGHT)
                        ActionSheet.show(
                            ActionSheetOptions(
                                "ActionSheet title",
                                "message",
                                sheets,
                                subtitle: "ActionSheet subtitle",
                                autoCancel: true,
                                confirm: confirm,
                                width: 300,
                                height: 350,
                                cornerRadius: BorderRadiuses(topLeft: 20.vp, topRight: 20.vp, bottomLeft: 20.vp,
                                    bottomRight: 20.vp),
                                borderWidth: 1.vp,
                                borderStyle: EdgeStyle.SOILD,
                                borderColor: Color.White,
                                cancel: {=> Hilog.info(0, "AppLogCj", "actionSheet canceled")},
                                onWillDismiss: {
                                    action =>
                                    match (action.reason) {
                                        case PRESS_BACK => Hilog.info(0, "AppLogCj", "PRESS_BACK")
                                        case TOUCH_OUTSIDE => Hilog.info(0, "AppLogCj", "TOUCH_OUTSIDE")
                                        case CLOSE_BUTTON => Hilog.info(0, "AppLogCj", "CLOSE_BUTTON")
                                        case SLIDE_DOWN => Hilog.info(0, "AppLogCj", "SLIDE_DOWN")
                                        case _ => throw Exception()
                                    }
                                    action.dismiss()
                                },
                                alignment: DialogAlignment.Bottom,
                                offset: Offset(0, -10)
                            ),
                            ActionSheetShadowOptions(20.0, color: Color.Gray, offsetX: 50.0, offsetY: 0.0)
                        )
                    }
                )
            }.width(100.percent)
        }.height(100.percent)
    }
}
```

![actionsheet1](./figures/actionsheet1.gif)

### static func show(ActionSheetOptions, ShadowStyle)

```cangjie
public static func show(value: ActionSheetOptions, shadow: ShadowStyle): Unit
```

**Function:** Defines and displays a list dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ActionSheetOptions](#class-actionsheetoptions) | Yes | - | Parameters for configuring the action sheet dialog. |
| shadow | [ShadowStyle](cj-common-types.md#enum-shadowstyle) | Yes | - | Sets the shadow style of the dialog backdrop. |

### static func show(ActionSheetOptions)

```cangjie
public static func show(value: ActionSheetOptions): Unit
```

**Function:** Defines and displays a list dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ActionSheetOptions](#class-actionsheetoptions) | Yes | - | Parameters for configuring the action sheet dialog. |


## class ActionSheetButtonOptions

```cangjie
public class ActionSheetButtonOptions {
    public var value: ResourceStr
    public var action: VoidCallback
    public var enabled: Bool
    public var defaultFocus: Bool
    public var style: DialogButtonStyle

    public init(
        value!: ResourceStr,
        action!: VoidCallback,
        enabled!: Bool = true,
        defaultFocus!: Bool = false,
        style!: DialogButtonStyle = DialogButtonStyle.Default
    )
}
```

**Function:** Styles for buttons in the dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var action

```cangjie
public var action: VoidCallback
```

**Function:** Callback when the button is selected.

**Type:** [VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var defaultFocus

```cangjie
public var defaultFocus: Bool
```

**Function:** Sets whether the button is the default focus.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var enabled

```cangjie
public var enabled: Bool
```

**Function:** Whether the button responds to clicks.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var style

```cangjie
public var style: DialogButtonStyle
```

**Function:** Sets the style of the button.

**Type:** [DialogButtonStyle](./cj-common-types.md#enum-dialogbuttonstyle)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var value

```cangjie
public var value: ResourceStr
```

**Function:** Text content of the button.

**Type:** [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(ResourceStr, VoidCallback, Bool, Bool, DialogButtonStyle)

```cangjie

public init(
    value!: ResourceStr,
    action!: VoidCallback,
    enabled!: Bool = true,
    defaultFocus!: Bool = false,
    style!: DialogButtonStyle = DialogButtonStyle.Default
)
```

**Function:** Button parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | Text content of the button. |
| action | [VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback) | Yes | - | Callback when the button is selected. |
| enabled | Bool | No | true | **Named parameter.** Whether the button responds to clicks. true means the button responds, false means it does not. |
| defaultFocus | Bool | No | false | **Named parameter.** Sets whether the button is the default focus. true means it is the default focus, false means it is not. |
| style | [DialogButtonStyle](./cj-common-types.md#enum-dialogbuttonstyle) | No | DialogButtonStyle.Default | DialogButtonStyle.DEFAULT | **Named parameter.** Sets the style of the button. |

## class ActionSheetOffset

```cangjie
public class ActionSheetOffset {
    public var dx: Length
    public var dy: Length

    public init(
        dx!: Length,
        dy!: Length
    )
}
```

**Function:** Alignment method for the dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var dx

```cangjie
public var dx: Length
```

**Function:** The dx offset of the popup window relative to the alignment position. Requires explicit pixel units, e.g., '10px', or percentage strings, e.g., '100%'.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var dy

```cangjie
public var dy: Length
```

**Function:** The dy offset of the popup window relative to the alignment position. Requires explicit pixel units, e.g., '10px', or percentage strings, e.g., '100%'.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, Length)

```cangjie

public init(
    dx!: Length,
    dy!: Length
)
```

**Function:** Constructor for the ActionSheetOffset class.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| dx | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The dx offset of the popup window relative to the alignment position. Requires explicit pixel units, e.g., '10px', or percentage strings, e.g., '100%'. |
| dy | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The dy offset of the popup window relative to the alignment position. Requires explicit pixel units, e.g., '10px', or percentage strings, e.g., '100%'. |

## class ActionSheetOptions

```cangjie
public class ActionSheetOptions {
    public var title: ResourceStr
    public var message: ResourceStr
    public var sheets: Array<SheetInfo>
    public var subtitle: ResourceStr
    public var confirm: ActionSheetButtonOptions
    public var autoCancel: Bool
    public var cancel: VoidCallback
    public var alignment: DialogAlignment
    public var offset: ActionSheetOffset
    public var maskRect: Rectangle
    public var showInSubWindow: Bool
    public var isModal: Bool
    public var backgroundColor: ResourceColor
    public var backgroundBlurStyle: BlurStyle
    public var onWillDismiss:?Callback<DismissDialogAction, Unit>
    public var cornerRadius: BorderRadiuses
    public var borderWidth: Length
    public var borderColor: ResourceColor
    public var borderStyle: EdgeStyles
    public var width:?Length
    public var height:?Length
    public var transition:?TransitionEffect

    /**
     * Constructor of ActionSheetOptions
     *
     * @param { ResourceStr } title
     * @param { ResourceStr } message
     * @param { Array<SheetInfo> } sheets
     * @param { ResourceStr } subtitle
     * @param { ActionSheetButtonOptions } confirm
     * @param { Bool } autoCancel
     * @param { VoidCallback } cancel
     * @param { DialogAlignment } alignment
     * @param { ?ActionSheetOffset } offset
     * @param { Rectangle } maskRect
     * @param { Bool } showInSubWindow
     * @param { ResourceColor } backgroundColor
     * @param { BlurStyle } backgroundBlurStyle
     * @param { ?Callback<DismissDialogAction, Unit> } onWillDismiss
     * @param { BorderRadiuses } cornerRadius
     * @param { Length } borderWidth
     * @param { ResourceColor } borderColor
     * @param { EdgeStyles } borderStyle
     * @param { ?Length } width
     * @param { ?Length } height
     * @param { ?TransitionEffect } transition
     * @returns { ActionSheetOptions }
     * @relation interface ActionSheetOptions
     */
    public init(
        title!: ResourceStr,
        message!: ResourceStr,
        sheets!: Array<SheetInfo>,
        subtitle!: ResourceStr = "",
        confirm!: ActionSheetButtonOptions = ActionSheetButtonOptions(value: "", action: {=>}),
        autoCancel!: Bool = true,
        cancel!: VoidCallback = {=>},
        alignment!: DialogAlignment = DialogAlignment.Bottom,
        offset!: ?ActionSheetOffset = None,
        maskRect!: Rectangle = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: ResourceColor = Color.Transparent,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
            bottomLeft: 32.vp, bottomRight: 32.vp),
        borderWidth!: Length = 0.vp,
        borderColor!: ResourceColor = Color.Black,
        borderStyle!: EdgeStyles = EdgeStyles(),
        width!: ?Length = None,
        height!: ?Length = None,
        transition!: ?TransitionEffect = None
    )
}
```

**Function:** Constructs an object of type ActionSheetOptions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21### var alignment

```cangjie
public var alignment: DialogAlignment
```

**Function:** The vertical alignment of the popup dialog.

**Type:** [DialogAlignment](./cj-common-types.md#enum-dialogalignment)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var autoCancel

```cangjie
public var autoCancel: Bool
```

**Function:** Whether to close the popup when clicking the mask layer.

**Type:** Bool

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle
```

**Function:** The blur material of the popup's background panel.

**Type:** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var backgroundColor

```cangjie
public var backgroundColor: ResourceColor
```

**Function:** The background color of the popup panel.

**Type:** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var borderColor

```cangjie
public var borderColor: ResourceColor
```

**Function:** Sets the border color of the popup's background panel. If using the `borderColor` property, it must be used together with the `borderWidth` property.

**Type:** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var borderStyle

```cangjie
public var borderStyle: EdgeStyles
```

**Function:** Sets the border style of the popup's background panel. If using the `borderStyle` property, it must be used together with the `borderWidth` property.

**Type:** [EdgeStyles](cj-dialog-actionsheet.md#class-edgestyle)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var borderWidth

```cangjie
public var borderWidth: Length
```

**Function:** Sets the border width of the popup's background panel.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var cancel

```cangjie
public var cancel: VoidCallback
```

**Function:** Callback when the dialog is closed by clicking the mask layer.

**Type:** [VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var confirm

```cangjie
public var confirm: ActionSheetButtonOptions
```

**Function:** The enabled state, default focus, button style, text content, and click callback of the confirm button. When the popup gains focus and no tab key navigation is performed, this button defaults to responding to the Enter key, and multiple popups can automatically gain focus for continuous responses.

**Type:** [ActionSheetButtonOptions](#class-actionsheetbuttonoptions)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var cornerRadius

```cangjie
public var cornerRadius: BorderRadiuses
```

**Function:** Sets the corner radius of the background panel. The radius of each of the four corners can be set separately.

**Type:** [BorderRadiuses](./cj-common-types.md#class-borderradiuses)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var height

```cangjie
public var height:?Length
```

**Function:** Sets the height of the popup's background panel.

**Type:** ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var isModal

```cangjie
public var isModal: Bool
```

**Function:** Whether the popup is a modal window. Modal windows have a mask layer, while non-modal windows do not.

**Type:** Bool

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var maskRect

```cangjie
public var maskRect: Rectangle
```

**Function:** The area of the popup's mask layer. Events within the mask layer area are not transmitted, while events outside the mask layer area are transmitted.

**Type:** [Rectangle](./cj-common-types.md#class-rectangle>)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var message

```cangjie
public var message: ResourceStr
```

**Function:** The content of the popup.

**Type:** [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var offset

```cangjie
public var offset: ActionSheetOffset
```

**Function:** The offset of the popup relative to the position specified by `alignment`.

**Type:** [ActionSheetOffset](#class-actionsheetoffset)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var onWillDismiss

```cangjie
public var onWillDismiss:?Callback<DismissDialogAction, Unit>
```

**Function:** Interactive close callback function.

**Type:** ?[Callback](../apis/BasicServicesKit/cj-apis-base.md#type-Callback)\<[DismissDialogAction](#class-dismissdialogaction),Unit>

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var sheets

```cangjie
public var sheets: Array<SheetInfo>
```

**Function:** Sets the option content, where each option supports setting an image, text, and selection callback.

**Type:** Array\<[SheetInfo](#class-sheetinfo)>

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var showInSubWindow

```cangjie
public var showInSubWindow: Bool
```

**Function:** Whether to display this popup in a sub-window when it needs to be shown outside the main window.

**Type:** Bool

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var subtitle

```cangjie
public var subtitle: ResourceStr
```

**Function:** The subtitle of the popup.

**Type:** [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var title

```cangjie
public var title: ResourceStr
```

**Function:** The title of the popup.

**Type:** [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var transition

```cangjie
public var transition:?TransitionEffect
```

**Function:** Sets the transition effect for the popup's display and exit.

**Type:** ?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var width

```cangjie
public var width:?Length
```

**Function:** Sets the width of the popup's background panel.

**Type:** ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(ResourceStr, ResourceStr, Array\<SheetInfo>, ResourceStr, ActionSheetButtonOptions, Bool, VoidCallback, DialogAlignment, ?ActionSheetOffset, Rectangle, Bool, Bool, ResourceColor, BlurStyle, ?Callback\<DismissDialogAction,Unit>, BorderRadiuses, Length, ResourceColor, EdgeStyles, ?Length, ?Length, ?TransitionEffect)

```cangjie

/**
 * Constructor of ActionSheetOptions
 *
 * @param { ResourceStr } title
 * @param { ResourceStr } message
 * @param { Array<SheetInfo> } sheets
 * @param { ResourceStr } subtitle
 * @param { ActionSheetButtonOptions } confirm
 * @param { Bool } autoCancel
 * @param { VoidCallback } cancel
 * @param { DialogAlignment } alignment
 * @param { ?ActionSheetOffset } offset
 * @param { Rectangle } maskRect
 * @param { Bool } showInSubWindow
 * @param { ResourceColor } backgroundColor
 * @param { BlurStyle } backgroundBlurStyle
 * @param { ?Callback<DismissDialogAction, Unit> } onWillDismiss
 * @param { BorderRadiuses } cornerRadius
 * @param { Length } borderWidth
 * @param { ResourceColor } borderColor
 * @param { EdgeStyles } borderStyle
 * @param { ?Length } width
 * @param { ?Length } height
 * @param { ?TransitionEffect } transition
 * @returns { ActionSheetOptions }
 * @relation interface ActionSheetOptions
 */
public init(
    title!: ResourceStr,
    message!: ResourceStr,
    sheets!: Array<SheetInfo>,
    subtitle!: ResourceStr = "",
    confirm!: ActionSheetButtonOptions = ActionSheetButtonOptions(value: "", action: {=>}),
    autoCancel!: Bool = true,
    cancel!: VoidCallback = {=>},
    alignment!: DialogAlignment = DialogAlignment.Bottom,
    offset!: ?ActionSheetOffset = None,
    maskRect!: Rectangle = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
    showInSubWindow!: Bool = false,
    isModal!: Bool = true,
    backgroundColor!: ResourceColor = Color.Transparent,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
    onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
    cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
        bottomLeft: 32.vp, bottomRight: 32.vp),
    borderWidth!: Length = 0.vp,
    borderColor!: ResourceColor = Color.Black,
    borderStyle!: EdgeStyles = EdgeStyles(),
    width!: ?Length = None,
    height!: ?Length = None,
    transition!: ?TransitionEffect = None
)
```

**Function:** Constructs an object of type `ActionSheetOptions`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| title | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | The title of the popup. <br/>If the text content is too long to display, an ellipsis replaces the hidden part. |
| message | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | The content of the popup. <br/>A scrollbar is triggered if the text is too long. |
| sheets | Array\<[SheetInfo](#class-sheetinfo)> | Yes | - | Sets the option content, where each option supports setting an image, text, and selection callback. |
| subtitle | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | "" | **Named parameter.** The subtitle of the popup. <br/>If the text content is too long to display, an ellipsis replaces the hidden part. |
| confirm | [ActionSheetButtonOptions](#class-actionsheetbuttonoptions) | No | ActionSheetButtonOptions(value: "", action: { => }) | **Named parameter.** The enabled state, default focus, button style, text content, and click callback of the confirm button. When the popup gains focus and no tab key navigation is performed, this button defaults to responding to the Enter key, and multiple popups can automatically gain focus for continuous responses. The default Enter key response does not take effect when `defaultFocus` is true. <br/>`enabled`: Whether the button responds to clicks. `true` means the button can respond, `false` means it cannot. <br/>Initial value: `true`. <br/>`defaultFocus`: Sets whether the button is the default focus. `true` means it is the default focus, `false` means it is not. <br/>Initial value: `false`. <br/>`style`: Sets the button's style. <br/>Initial value: `DialogButtonStyle.DEFAULT`. <br/>`value`: The button's text content. If the text is too long to display, an ellipsis replaces the hidden part. <br/>`action`: Callback when the button is selected. |
| autoCancel | Bool | No | true | **Named parameter.** Whether to close the popup when clicking the mask layer. <br/>`true` means clicking the mask layer closes the popup, `false` means it does not. |
| cancel | [VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback) | No | { => } | **Named parameter.** Callback when the dialog is closed by clicking the mask layer. |
| alignment | [DialogAlignment](./cj-common-types.md#enum-dialogalignment) | No | DialogAlignment.Bottom | **Named parameter.** The vertical alignment of the popup. |
| offset | ?[ActionSheetOffset](#class-actionsheetoffset) | No | None | **Named parameter.** Requires explicit specification of pixel units, e.g., `10.vp`, or percentage strings, e.g., `100.percent`. <br/>If pixel units are not specified, the default unit is `vp`, e.g., `10` is equivalent to `10.vp`. <br/>The offset of the popup relative to the position specified by `alignment`. <br/>Initial values: <br/>1. When `alignment` is set to `Top`, `TopStart`, or `TopEnd`, the default is `{dx: 0, dy: 40.vp}`. <br/>2. For other `alignment` settings, the default is `{dx: 0, dy: -40.vp}`. |
| maskRect | [Rectangle](./cj-common-types.md#class-rectangle) | No | Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent) | **Named parameter.** The area of the popup's mask layer. Events within the mask layer area are not transmitted, while events outside the mask layer area are transmitted. <br>**Note:** <br> `maskRect` does not take effect when `showInSubWindow` is `true`. |
| showInSubWindow | Bool | No | false | **Named parameter.** Whether to display this popup in a sub-window when it needs to be shown outside the main window. <br>Initial value: `false`, meaning the popup is displayed within the application, not in an independent sub-window. <br>**Note:** <br> A popup with `showInSubWindow` set to `true` cannot trigger another popup with `showInSubWindow` set to `true`. |
| isModal | Bool | No | true | **Named parameter.** Whether the popup is a modal window. Modal windows have a mask layer, while non-modal windows do not. <br/>Initial value: `true`, meaning the popup has a mask layer. |
| backgroundColor | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | No | Color.Transparent | **Named parameter.** The background color of the popup panel. <br>**Note:** <br> When `backgroundColor` is set to a non-transparent color, `backgroundBlurStyle` must be set to `BlurStyle.NONE`; otherwise, the color display may not meet expectations. |
| backgroundBlurStyle | [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle) | No | BlurStyle.ComponentUltraThick | **Named parameter.** The blur material of the popup's background panel. <br>**Note:** <br> Set to `BlurStyle.NONE` to disable background blurring. When `backgroundBlurStyle` is set to a non-`NONE` value, do not set `backgroundColor`; otherwise, the color display may not meet expectations. |
| onWillDismiss | ?[Callback](../apis/B## class DismissDialogAction

```cangjie
public class DismissDialogAction {
    public var reason: DismissReason

    public init(reason: DismissReason)
}
```

**Function:** Information about Dialog closure.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var reason

```cangjie
public var reason: DismissReason
```

**Function:** Reason why the Dialog cannot be closed. Allows developers to choose whether the Dialog should close under different operations.

**Type:** [DismissReason](cj-dialog-actionsheet.md#enum-dismissreason)

**Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(DismissReason)

```cangjie
public init(reason: DismissReason)
```

**Function:** Information about Dialog closure.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| reason | [DismissReason](cj-dialog-actionsheet.md#enum-dismissreason) | Yes | - | Reason why the Dialog cannot be closed. Allows developers to choose whether the Dialog should close under different operations. |

### func dismiss()

```cangjie
public func dismiss(): Unit
```

**Function:** Dialog closure callback function. Invoked by developers when exiting is required; no invocation is needed otherwise.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## class SheetInfo

```cangjie
public class SheetInfo {
    public var title: ResourceStr
    public var action: VoidCallback
    public var icon:?ResourceStr

    public init(
        title!: ResourceStr,
        action!: VoidCallback,
        icon!: ?ResourceStr = None
    )
}
```

**Function:** Sets option content. Each option supports configuring an image, text, and selection callback.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var action

```cangjie
public var action: VoidCallback
```

**Function:** Callback when the option is selected.

**Type:** [VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback)

**Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var icon

```cangjie
public var icon:?ResourceStr
```

**Function:** Icon for the option. No icon is displayed by default.

**Type:** ?[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var title

```cangjie
public var title: ResourceStr
```

**Function:** Text content of the option.

**Type:** [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(ResourceStr, VoidCallback, ?ResourceStr)

```cangjie
public init(
    title!: ResourceStr,
    action!: VoidCallback,
    icon!: ?ResourceStr = None
)
```

**Function:** Option content parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| title | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | Text content of the option.<br/>A scrollbar appears when the text exceeds the display area. |
| action | [VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback) | Yes | - | Callback when the option is selected. |
| icon | ?[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | None | **Named parameter.** Icon for the option. No icon is displayed by default.<br/>String format can be used to load web or local images, typically for web images. When referencing local images using relative paths, e.g., Image("common/test.jpg"). |

## enum DismissReason

```cangjie
public enum DismissReason {
    | PressBack
    | TouchOutside
    | CloseButton
    | SlideDown
    | ...
}
```

**Function:** Reason for popup closure.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### CloseButton

```cangjie
CloseButton
```

**Function:** Clicked the close button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PressBack

```cangjie
PressBack
```

**Function:** Pressed the three-key back, swiped left/right, or pressed ESC on the keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### SlideDown

```cangjie
SlideDown
```

**Function:** Closed by sliding down.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### TouchOutside

```cangjie
TouchOutside
```

**Function:** Clicked the mask layer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21