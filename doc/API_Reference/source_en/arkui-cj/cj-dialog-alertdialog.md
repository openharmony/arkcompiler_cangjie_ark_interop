# AlertDialog

Displays an alert dialog component, allowing configuration of text content and response callbacks.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Component Attributes

### static func show(AlertDialogParamWithConfirm)

```cangjie
public static func show(value: AlertDialogParamWithConfirm): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithConfirm](#class-alertdialogparamwithconfirm) | Yes | - | Defines and displays the AlertDialog component. |

### static func show(AlertDialogParamWithConfirm, ShadowOptions)

```cangjie
public static func show(value: AlertDialogParamWithConfirm, shadow: ShadowOptions): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithConfirm](#class-alertdialogparamwithconfirm) | Yes | - | Defines and displays the AlertDialog component. |
| shadow | [ShadowOptions](<font color="red" face="bold">please add link</font>) | Yes | - | Sets the shadow of the dialog backdrop. Default is no shadow. |

### static func show(AlertDialogParamWithConfirm, ShadowStyle)

```cangjie
public static func show(value: AlertDialogParamWithConfirm, shadow: ShadowStyle): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithConfirm](#class-alertdialogparamwithconfirm) | Yes | - | Defines and displays the AlertDialog component. |
| shadow | [ShadowStyle](<font color="red" face="bold">please add link</font>) | Yes | - | Sets the shadow of the dialog backdrop. Default is no shadow. |

### static func show(AlertDialogParamWithButtons)

```cangjie
public static func show(value: AlertDialogParamWithButtons): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithButtons](#class-alertdialogparamwithbuttons) | Yes | - | Defines and displays the AlertDialog component. |

### static func show(AlertDialogParamWithButtons, ShadowOptions)

```cangjie
public static func show(value: AlertDialogParamWithButtons, shadow: ShadowOptions): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithButtons](#class-alertdialogparamwithbuttons) | Yes | - | Defines and displays the AlertDialog component. |
| shadow | [ShadowOptions](<font color="red" face="bold">please add link</font>) | Yes | - | Sets the shadow of the dialog backdrop. Default is no shadow. |

### static func show(AlertDialogParamWithButtons, ShadowStyle)

```cangjie
public static func show(value: AlertDialogParamWithButtons, shadow: ShadowStyle): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithButtons](#class-alertdialogparamwithbuttons) | Yes | - | Defines and displays the AlertDialog component. |
| shadow | [ShadowStyle](<font color="red" face="bold">please add link</font>) | Yes | - | Sets the shadow of the dialog backdrop. Default is no shadow. |

### static func show(AlertDialogParamWithOptions)

```cangjie
public static func show(value: AlertDialogParamWithOptions): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithOptions](#class-alertdialogparamwithoptions) | Yes | - | Defines and displays the AlertDialog component. |

### static func show(AlertDialogParamWithOptions, ShadowOptions)

```cangjie
public static func show(value: AlertDialogParamWithOptions, shadow: ShadowOptions): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithOptions](#class-alertdialogparamwithoptions) | Yes | - | Defines and displays the AlertDialog component. |
| shadow | [ShadowOptions](<font color="red" face="bold">please add link</font>) | Yes | - | Sets the shadow of the dialog backdrop. Default is no shadow. |

### static func show(AlertDialogParamWithOptions, ShadowStyle)

```cangjie
public static func show(value: AlertDialogParamWithOptions, shadow: ShadowStyle): Unit
```

**Function:** Defines and displays an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AlertDialogParamWithOptions](#class-alertdialogparamwithoptions) | Yes | - | Defines and displays the AlertDialog component. |
| shadow | [ShadowStyle](<font color="red" face="bold">please add link</font>) | Yes | - | Sets the shadow of the dialog backdrop. Default is no shadow. |

## Basic Type Definitions

### class AlertDialogButtonBaseOptions

```cangjie
public open class AlertDialogButtonBaseOptions {
    public var enabled: Bool
    public var defaultFocus: Bool
    public var style: DialogButtonStyle
    public var value: ResourceStr
    public var fontColor:?ResourceColor
    public var backgroundColor:?ResourceColor
    public var action: VoidCallback
    public init(
        enabled!: Bool = true,
        defaultFocus!: Bool = false,
        style!: DialogButtonStyle = DialogButtonStyle.Default,
        value!: ResourceStr,
        fontColor!: ?ResourceColor = None,
        backgroundColor!: ?ResourceColor = None,
        action!: VoidCallback
    )
}
```

**Function:** Defines a button in an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var action

```cangjie
public var action: VoidCallback
```

**Function:** Callback when the button is selected.

**Type:** [VoidCallback](<font color="red" face="bold">please add link</font>)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var backgroundColor

```cangjie
public var backgroundColor:?ResourceColor
```

**Function:** Background color of the button.

**Type:** ?[ResourceColor](<font color="red" face="bold">please add link</font>)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var defaultFocus

```cangjie
public var defaultFocus: Bool
```

**Function:** Sets whether the button is the default focus.

**Type:** Bool

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var enabled

```cangjie
public var enabled: Bool
```

**Function:** Determines whether the button responds to clicks.

**Type:** Bool

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var fontColor

```cangjie
public var fontColor:?ResourceColor
```

**Function:** Text color of the button.

**Type:** ?[ResourceColor](<font color="red" face="bold">please add link</font>)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var style

```cangjie
public var style: DialogButtonStyle
```

**Function:** Sets the style of the button.

**Type:** [DialogButtonStyle](<font color="red" face="bold">please add link</font>)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var value

```cangjie
public var value: ResourceStr
```

**Function:** Determines whether the button responds to clicks.

**Type:** [ResourceStr](<font color="red" face="bold">please add link</font>)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Bool, Bool, DialogButtonStyle, ResourceStr, ?ResourceColor, ?ResourceColor, VoidCallback)

```cangjie
public init(
    enabled!: Bool = true,
    defaultFocus!: Bool = false,
    style!: DialogButtonStyle = DialogButtonStyle.Default,
    value!: ResourceStr,
    fontColor!: ?ResourceColor = None,
    backgroundColor!: ?ResourceColor = None,
    action!: VoidCallback
)
```

**Function:** Defines a button in an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enabled | Bool | No | true | **Named parameter.** Determines whether the button responds to clicks. |
| defaultFocus | Bool | No | false | **Named parameter.** Sets whether the button is the default focus. |
| style | [DialogButtonStyle](<font color="red" face="bold">please add link</font>) | No | DialogButtonStyle.Default | **Named parameter.** Sets the style of the button. |
| value | [ResourceStr](<font color="red" face="bold">please add link</font>) | Yes | - | **Named parameter.** Text content of the button. |
| fontColor | ?[ResourceColor](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Text color of the button. |
| backgroundColor | ?[ResourceColor](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Background color of the button. |
| action | [VoidCallback](<font color="red" face="bold">please add link</font>) | Yes | - | **Named parameter.** Callback when the button is selected. |

### class AlertDialogButtonOptions

```cangjie
public class AlertDialogButtonOptions <: AlertDialogButtonBaseOptions {
    public var primary: Bool
    public init(
        enabled!: Bool = true,
        defaultFocus!: Bool = false,
        style!: DialogButtonStyle = DialogButtonStyle.Default,
        value!: ResourceStr,
        fontColor!: ?ResourceColor = None,
        backgroundColor!: ?ResourceColor = None,
        action!: VoidCallback,
        primary!: Bool = false
    )
}
```

**Function:** Defines a button in an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)

#### var primary

```cangjie
public var primary: Bool
```

**Function:** Determines whether the button responds to the Enter key when the dialog is focused and no tab navigation has occurred. Only one button can have this field set to true among multiple buttons; otherwise, none will respond. Multiple dialogs can automatically focus and respond sequentially. Does not take effect when defaultFocus is true.

**Type:** Bool

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Bool, Bool, DialogButtonStyle, ResourceStr, ?ResourceColor, ?ResourceColor, VoidCallback, Bool)

```cangjie
public init(
    enabled!: Bool = true,
    defaultFocus!: Bool = false,
    style!: DialogButtonStyle = DialogButtonStyle.Default,
    value!: ResourceStr,
    fontColor!: ?ResourceColor = None,
    backgroundColor!: ?ResourceColor = None,
    action!: VoidCallback,
    primary!: Bool = false
)
```

**Function:** Defines a button in an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enabled | Bool | No | true | **Named parameter.** Determines whether the button responds to clicks. |
| defaultFocus | Bool | No | false | **Named parameter.** Sets whether the button is the default focus. |
| style | [DialogButtonStyle](<font color="red" face="bold">please add link</font>) | No | DialogButtonStyle.Default | **Named parameter.** Sets the style of the button. |
| value | [ResourceStr](<font color="red" face="bold">please add link</font>) | Yes | - | **Named parameter.** Text content of the button. |
| fontColor | ?[ResourceColor](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Text color of the button. |
| backgroundColor | ?[ResourceColor](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Background color of the button. |
| action | [VoidCallback](<font color="red" face="bold">please add link</font>) | Yes | - | **Named parameter.** Callback when the button is selected. |
| primary | Bool | No | false | **Named parameter.** Determines whether the button responds to the Enter key when the dialog is focused and no tab navigation has occurred. Only one button can have this field set to true among multiple buttons; otherwise, none will respond. Multiple dialogs can automatically focus and respond sequentially. Does not take effect when defaultFocus is true. |### class AlertDialogParam

```cangjie
public open class AlertDialogParam {
    public var title: ResourceStr
    public var subtitle: ResourceStr
    public var message: ResourceStr
    public var autoCancel: Bool
    public var cancel: VoidCallback
    public var alignment: DialogAlignment
    public var offset: Offset
    public var gridCount: UInt32
    public var maskRect: Rectangle
    public var showInSubWindow: Bool
    public var isModal: Bool
    public var backgroundColor: ResourceColor
    public var backgroundBlurStyle: BlurStyle
    public var onWillDismiss:?Callback<DismissDialogAction, Unit>
    public var cornerRadius: BorderRadiuses
    public var transition:?TransitionEffect
    public var width:?Length
    public var height:?Length
    public var borderWidth: Length
    public var borderColor: ResourceColor
    public var borderStyle: EdgeStyles
    public var textStyle: WordBreak
    public init(
        title!: ResourceStr = "",
        subtitle!:ResourceStr = "",
        message!: ResourceStr,
        autoCancel!: Bool = true,
        cancel!: VoidCallback = {=>},
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0, 0),
        gridCount!: UInt32 = 4,
        maskRect!: Rectangle = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: ResourceColor = Color.Transparent,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        transition!: ?TransitionEffect = None,
        width!: ?Length = None,
        height!: ?Length = None,
        borderWidth!: Length = 0,
        borderColor!: ResourceColor = Color.Black,
        borderStyle!: EdgeStyles = EdgeStyles(),
        textStyle!: WordBreak = WordBreak.BreakAll
    )
}
```

**Function:** Defines an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var alignment

```cangjie
public var alignment: DialogAlignment
```

**Function:** Vertical alignment of the dialog.

**Type:** [DialogAlignment](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var autoCancel

```cangjie
public var autoCancel: Bool
```

**Function:** Whether to close the dialog when clicking the mask layer.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle
```

**Function:** Blur material of the dialog background panel.

**Type:** [BlurStyle](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var backgroundColor

```cangjie
public var backgroundColor: ResourceColor
```

**Function:** Background color of the dialog panel.

**Type:** [ResourceColor](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var borderColor

```cangjie
public var borderColor: ResourceColor
```

**Function:** Sets the border color of the dialog background panel. Must be used together with the borderWidth property.

**Type:** [ResourceColor](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var borderStyle

```cangjie
public var borderStyle: EdgeStyles
```

**Function:** Sets the border style of the dialog background panel. Must be used together with the borderWidth property.

**Type:** [EdgeStyles](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var borderWidth

```cangjie
public var borderWidth: Length
```

**Function:** Sets the border width of the dialog background panel.

**Type:** [Length](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var cancel

```cangjie
public var cancel: VoidCallback
```

**Function:** Callback when the dialog is closed by clicking the mask layer.

**Type:** [VoidCallback](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var cornerRadius

```cangjie
public var cornerRadius: BorderRadiuses
```

**Function:** Sets the corner radius of the background panel. Can set radius for each corner separately.

**Type:** [BorderRadiuses](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var gridCount

```cangjie
public var gridCount: UInt32
```

**Function:** Number of grid columns occupied by the dialog container width.

**Type:** UInt32

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var height

```cangjie
public var height:?Length
```

**Function:** Sets the height of the dialog background panel.

**Type:** ?[Length](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var isModal

```cangjie
public var isModal: Bool
```

**Function:** Whether the dialog is a modal window. Modal windows have a mask layer, non-modal windows don't.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var maskRect

```cangjie
public var maskRect: Rectangle
```

**Function:** Mask layer area of the dialog. Events within this area are not passed through, while events outside are.

**Type:** [Rectangle](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var message

```cangjie
public var message: ResourceStr
```

**Function:** Content of the dialog.

**Type:** [ResourceStr](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var offset

```cangjie
public var offset: Offset
```

**Function:** Offset of the dialog relative to the alignment position.

**Type:** [Offset](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var onWillDismiss

```cangjie
public var onWillDismiss:?Callback<DismissDialogAction, Unit>
```

**Function:** Interactive close callback function.

**Type:** ?[Callback](<font color="red" face="bold">please add link</font>)\<[DismissDialogAction](<font color="red" face="bold">please add link</font>),Unit>

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool
```

**Function:** Whether to display this dialog in a sub-window when it needs to appear outside the main window.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var subtitle

```cangjie
public var subtitle: ResourceStr
```

**Function:** Subtitle of the dialog.

**Type:** [ResourceStr](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var textStyle

```cangjie
public var textStyle: WordBreak
```

**Function:** Sets the text style of the dialog message content.

**Type:** [WordBreak](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var title

```cangjie
public var title: ResourceStr
```

**Function:** Title of the dialog.

**Type:** [ResourceStr](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var transition

```cangjie
public var transition:?TransitionEffect
```

**Function:** Sets the transition effect when the dialog appears and exits.

**Type:** ?[TransitionEffect](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var width

```cangjie
public var width:?Length
```

**Function:** Sets the width of the dialog background panel.

**Type:** ?[Length](<font color="red" face="bold">please add link</font>)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(ResourceStr, ResourceStr, ResourceStr, Bool, VoidCallback, DialogAlignment, Offset, UInt32, Rectangle, Bool, Bool, ResourceColor, BlurStyle, ?Callback\<DismissDialogAction,Unit>, BorderRadiuses, ?TransitionEffect, ?Length, ?Length, Length, ResourceColor, EdgeStyles, WordBreak)

```cangjie
public init(
    title!: ResourceStr = "",
    subtitle!:ResourceStr = "",
    message!: ResourceStr,
    autoCancel!: Bool = true,
    cancel!: VoidCallback = {=>},
    alignment!: DialogAlignment = DialogAlignment.Default,
    offset!: Offset = Offset(0, 0),
    gridCount!: UInt32 = 4,
    maskRect!: Rectangle = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
    showInSubWindow!: Bool = false,
    isModal!: Bool = true,
    backgroundColor!: ResourceColor = Color.Transparent,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
    onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
    cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
        bottomRight: 32.vp),
    transition!: ?TransitionEffect = None,
    width!: ?Length = None,
    height!: ?Length = None,
    borderWidth!: Length = 0,
    borderColor!: ResourceColor = Color.Black,
    borderStyle!: EdgeStyles = EdgeStyles(),
    textStyle!: WordBreak = WordBreak.BreakAll
)
```

**Function:** Defines an alert dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| title | [ResourceStr](<font color="red" face="bold">please add link</font>) | No | "" | **Named parameter.** Title of the dialog. |
| subtitle | [ResourceStr](<font color="red" face="bold">please add link</font>) | No | "" | **Named parameter.** Subtitle of the dialog. |
| message | [ResourceStr](<font color="red" face="bold">please add link</font>) | Yes | - | Content of the dialog. |
| autoCancel | Bool | No | true | **Named parameter.** Whether to close the dialog when clicking the mask layer. true means close, false means don't close. |
| cancel | [VoidCallback](<font color="red" face="bold">please add link</font>) | No | { => } | **Named parameter.** Callback when the dialog is closed by clicking the mask layer. |
| alignment | [DialogAlignment](<font color="red" face="bold">please add link</font>) | No | DialogAlignment.Default | **Named parameter.** Vertical alignment of the dialog. |
| offset | [Offset](<font color="red" face="bold">please add link</font>) | No | Offset(0, 0) | **Named parameter.** Offset of the dialog relative to the alignment position. |
| gridCount | UInt32 | No | 4 | **Named parameter.** Number of grid columns occupied by the dialog container width. |
| maskRect | [Rectangle](<font color="red" face="bold">please add link</font>) | No | Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent) | **Named parameter.** Mask layer area of the dialog. Events within this area are not passed through, while events outside are.<br/>**Note:**<br/>maskRect doesn't take effect when showInSubWindow is true. |
| showInSubWindow | Bool | No | false | **Named parameter.** Whether to display this dialog in a sub-window when it needs to appear outside the main window.<br/>Default: false, dialog appears within the application, not in an independent sub-window.<br/>**Note:** Dialogs with showInSubWindow=true cannot trigger another dialog with showInSubWindow=true. |
| isModal | Bool | No | true | **Named parameter.** Whether the dialog is a modal window. Modal windows have a mask layer, non-modal windows don't.<br/>Default: true, dialog has a mask layer. |
| backgroundColor | [ResourceColor](<font color="red" face="bold">please add link</font>) | No | Color.Transparent | **Named parameter.** Background color of the dialog panel.<br/>**Note:** <br/>When backgroundColor is set to a non-transparent color, backgroundBlurStyle should be set to BlurStyle.NONE, otherwise the color display may not meet expectations. |
| backgroundBlurStyle | [BlurStyle](<font color="red" face="bold">please add link</font>) | No | BlurStyle.ComponentUltraThick | **Named parameter.** Blur material of the dialog background panel.<br/>**Note:** <br/>Set to BlurStyle.NONE to disable background blur. When backgroundBlurStyle is set to a non-NONE value, backgroundColor should not be set, otherwise the color display may not meet expectations. |
| onWillDismiss | ?[Callback](<font color="red" face="bold">please add link</font>)\<[DismissDialogAction](<font color="red" face="bold">please add link</font>),Unit> | No | None | **Named parameter.** Interactive close callback function.<br/>**Note:**<br/>1. When users perform actions like clicking the mask layer to close, swiping left/right, pressing back button, or ESC key to close, if this callback is registered, the dialog won't close immediately. The callback can get the operation type that triggered the close attempt through reason, and decide whether to allow closing based on the reason. Currently, the reason returned by this component doesn't support the CLOSE_BUTTON enum value.<br/>2. The onWillDismiss callback cannot intercept another onWillDismiss callback. |
| cornerRadius | [BorderRadiuses](<font color="red" face="bold">please add link</font>) | No | BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp) | **Named parameter.** Sets the corner radius of the background panel.<br />Can set radius for each corner separately.<br />The corner radius is limited by component dimensions, with a maximum value of half the component's width or height. Negative values will be treated as default values.<br />Percentage parameter: Sets the dialog's corner radius as a percentage of the parent dialog's width and height.<br/>**Note:**<br/>When cornerRadius is of type LocalizedBorderRadiuses, it supports changing layout order based on language conventions. |
| transition | ?[TransitionEffect](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Sets the transition effect when the dialog appears and exits.<br/>**Note:**<br/>1. If not set, default appear/exit animations are used.<br/>2. Pressing back during appear animation will interrupt it and execute exit animation, with the effect being a combination of both animations.<br/>3. Pressing back during exit animation won't interrupt it, the animation continues, and pressing back again exits the application. |
| width | ?[Length](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Sets the width of the dialog background panel.<br />### class AlertDialogParamWithButtons

```cangjie
public class AlertDialogParamWithButtons <: AlertDialogParam {
    public var primaryButton: AlertDialogButtonBaseOptions
    public var secondaryButton: AlertDialogButtonBaseOptions
    public init(
        title!: ResourceStr = "",
        subtitle!:ResourceStr = "",
        message!: ResourceStr,
        autoCancel!: Bool = true,
        cancel!: VoidCallback = {=>},
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0, 0),
        gridCount!: UInt32 = 4,
        maskRect!: Rectangle = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: ResourceColor = Color.Transparent,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        transition!: ?TransitionEffect = None,
        width!: ?Length = None,
        height!: ?Length = None,
        borderWidth!: Length = 0,
        borderColor!: ResourceColor = Color.Black,
        borderStyle!: EdgeStyles = EdgeStyles(),
        textStyle!: WordBreak = WordBreak.BreakAll,
        primaryButton!: AlertDialogButtonBaseOptions,
        secondaryButton!: AlertDialogButtonBaseOptions
    )
}
```

**Function:** Defines an alert dialog with two confirmation buttons.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [AlertDialogParam](#class-alertdialogparam)

#### var primaryButton

```cangjie
public var primaryButton: AlertDialogButtonBaseOptions
```

**Function:** Specifies the enabled state, default focus, button style, text content, text color, button background color, and click callback for the primary confirmation button.

**Type:** [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var secondaryButton

```cangjie
public var secondaryButton: AlertDialogButtonBaseOptions
```

**Function:** Specifies the enabled state, default focus, button style, text content, text color, button background color, and click callback for the secondary confirmation button.

**Type:** [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(ResourceStr, ResourceStr, ResourceStr, Bool, VoidCallback, DialogAlignment, Offset, UInt32, Rectangle, Bool, Bool, ResourceColor, BlurStyle, ?Callback\<DismissDialogAction,Unit>, BorderRadiuses, ?TransitionEffect, ?Length, ?Length, Length, ResourceColor, EdgeStyles, WordBreak, AlertDialogButtonBaseOptions, AlertDialogButtonBaseOptions)

```cangjie
public init(
    title!: ResourceStr = "",
    subtitle!:ResourceStr = "",
    message!: ResourceStr,
    autoCancel!: Bool = true,
    cancel!: VoidCallback = {=>},
    alignment!: DialogAlignment = DialogAlignment.Default,
    offset!: Offset = Offset(0, 0),
    gridCount!: UInt32 = 4,
    maskRect!: Rectangle = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
    showInSubWindow!: Bool = false,
    isModal!: Bool = true,
    backgroundColor!: ResourceColor = Color.Transparent,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
    onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
    cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
        bottomRight: 32.vp),
    transition!: ?TransitionEffect = None,
    width!: ?Length = None,
    height!: ?Length = None,
    borderWidth!: Length = 0,
    borderColor!: ResourceColor = Color.Black,
    borderStyle!: EdgeStyles = EdgeStyles(),
    textStyle!: WordBreak = WordBreak.BreakAll,
    primaryButton!: AlertDialogButtonBaseOptions,
    secondaryButton!: AlertDialogButtonBaseOptions
)
```

**Function:** Defines an alert dialog with two confirmation buttons.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| title | [ResourceStr](<font color="red" face="bold">please add link</font>) | No | "" | **Named parameter.** Dialog title. |
| subtitle | [ResourceStr](<font color="red" face="bold">please add link</font>) | No | "" | **Named parameter.** Dialog subtitle. |
| message | [ResourceStr](<font color="red" face="bold">please add link</font>) | Yes | - | Dialog content. |
| autoCancel | Bool | No | true | **Named parameter.** Whether to close the dialog when clicking the mask layer. true: close; false: do not close. |
| cancel | [VoidCallback](<font color="red" face="bold">please add link</font>) | No | { => } | **Named parameter.** Callback when the dialog is closed by clicking the mask layer. |
| alignment | [DialogAlignment](<font color="red" face="bold">please add link</font>) | No | DialogAlignment.Default | **Named parameter.** Vertical alignment of the dialog. |
| offset | [Offset](<font color="red" face="bold">please add link</font>) | No | Offset(0, 0) | **Named parameter.** Offset relative to the alignment position. |
| gridCount | UInt32 | No | 4 | **Named parameter.** Number of grid columns occupied by the dialog container width. |
| maskRect | [Rectangle](<font color="red" face="bold">please add link</font>) | No | Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent) | **Named parameter.** Mask layer area of the dialog. Events within this area are not transmitted, while events outside are transmitted.<br/>**Note:**<br/>maskRect does not take effect when showInSubWindow is true. |
| showInSubWindow | Bool | No | false | **Named parameter.** Whether to display the dialog in a sub-window when it needs to be shown outside the main window.<br/>Default: false, the dialog is displayed within the application rather than in an independent sub-window.<br/>**Note:** A dialog with showInSubWindow=true cannot trigger another dialog with showInSubWindow=true. |
| isModal | Bool | No | true | **Named parameter.** Whether the dialog is a modal window. Modal windows have a mask layer, while non-modal windows do not.<br/>Default: true, the dialog has a mask layer. |
| backgroundColor | [ResourceColor](<font color="red" face="bold">please add link</font>) | No | Color.Transparent | **Named parameter.** Background color of the dialog.<br/>**Note:** <br/>When backgroundColor is set to a non-transparent color, backgroundBlurStyle must be set to BlurStyle.NONE; otherwise, the color display may not meet expectations. |
| backgroundBlurStyle | [BlurStyle](<font color="red" face="bold">please add link</font>) | No | BlurStyle.ComponentUltraThick | **Named parameter.** Background blur effect of the dialog.<br/>**Note:** <br/>Set to BlurStyle.NONE to disable background blur. When backgroundBlurStyle is set to a non-NONE value, do not set backgroundColor; otherwise, the color display may not meet expectations. |
| onWillDismiss | ?[Callback](<font color="red" face="bold">please add link</font>)\<[DismissDialogAction](<font color="red" face="bold">please add link</font>),Unit> | No | None | **Named parameter.** Interactive close callback function.<br/>**Note:**<br/>1. When the user performs operations such as clicking the mask layer to close, swiping left/right, pressing the back button, or pressing the ESC key to close the dialog, if this callback is registered, the dialog will not close immediately. The callback function can determine whether to close the dialog based on the operation type obtained from reason. Currently, the reason returned by this component does not support the CLOSE_BUTTON enumeration value.<br/>2. The onWillDismiss callback cannot be intercepted within the onWillDismiss callback. |
| cornerRadius | [BorderRadiuses](<font color="red" face="bold">please add link</font>) | No | BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp) | **Named parameter.** Sets the corner radius of the background.<br />The radius of each corner can be set separately.<br />The corner radius is limited by the component size, with a maximum value of half the component width or height. Negative values are treated as default values.<br />Percentage parameter: Sets the dialog corner radius as a percentage of the parent dialog's width and height.<br/>**Note:**<br/>When the cornerRadius property type is LocalizedBorderRadiuses, it supports layout order changes based on language habits. |
| transition | ?[TransitionEffect](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Sets the transition effect for dialog display and exit.<br/>**Note:**<br/>1. If not set, the default show/exit animation is used.<br/>2. Pressing the back key during the show animation interrupts the show animation and executes the exit animation, with the effect being a combination of the show and exit animation curves.<br/>3. Pressing the back key during the exit animation does not interrupt the exit animation, which continues to execute, and pressing the back key again exits the application. |
| width | ?[Length](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Sets the width of the dialog background.<br />**Note:**<br>- Default maximum dialog width: None.<br />- Percentage parameter: The reference width is the window width, which can be adjusted up or down. |
| height | ?[Length](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Sets the height of the dialog background.<br />**Note:**<br />- Default maximum dialog height: None.<br />- Percentage parameter: The reference height is (window height - safe area), which can be adjusted up or down. |
| borderWidth | [Length](<font color="red" face="bold">please add link</font>) | No | 0 | **Named parameter.** Sets the width of each border separately.<br />Percentage parameter: Sets the dialog border width as a percentage of the parent dialog's width.<br />If the left/right borders exceed the dialog width or the top/bottom borders exceed the dialog height, the display may not meet expectations.<br/>**Note:**<br/>When the borderWidth property type is LocalizedEdgeWidths, it supports layout order changes based on language habits. |
| borderColor | [ResourceColor](<font color="red" face="bold">please add link</font>) | No | Color.Black | **Named parameter.** Sets the border color of the dialog background.<br/>The borderColor property must be used together with the borderWidth property.<br/>**Note:**<br/>When the borderColor property type is LocalizedEdgeColors, it supports layout order changes based on language habits. |
| borderStyle | [EdgeStyles](<font color="red" face="bold">please add link</font>) | No | EdgeStyles() | **Named parameter.** Sets the border style of the dialog background.<br/>The borderStyle property must be used together with the borderWidth property. |
| textStyle | [WordBreak](<font color="red" face="bold">please add link</font>) | No | WordBreak.BreakAll | **Named parameter.** Sets the text style of the dialog message content. |
| primaryButton | [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions) | Yes | - | **Named parameter.** Specifies the enabled state, default focus, button style, text content, text color, button background color, and click callback for the primary confirmation button. |
| secondaryButton | [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions) | Yes | - | **Named parameter.** Specifies the enabled state, default focus, button style, text content, text color, button background color, and click callback for the secondary confirmation button. |

### class AlertDialogParamWithConfirm

```cangjie
public class AlertDialogParamWithConfirm <: AlertDialogParam {
    public var confirm: AlertDialogButtonBaseOptions
    public init(
        title!: ResourceStr = "",
        subtitle!:ResourceStr = "",
        message!: ResourceStr,
        autoCancel!: Bool = true,
        cancel!: VoidCallback = {=>},
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0, 0),
        gridCount!: UInt32 = 4,
        maskRect!: Rectangle = Rectangle(x: 0, y: 0, width: 极抱歉，我还没有学会回答这个问题。如果你有其他问题，我非常乐意为你提供帮助。## Sample Code

### Example 1 (Popup with Multiple Buttons)

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(5.vp) {
            Button("one button dialog")
                .onClick({ =>
                    AlertDialog.show(
                        AlertDialogParamWithConfirm("text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            cancel: {=> Hilog.info(0, "AppLogCj", "Closed callbacks")}, alignment: DialogAlignment.Center,
                            offset: Offset(0, -20), gridCount: 4,
                            onWillDismiss: {
                                dismissDialogAction: DismissDialogAction => match (dismissDialogAction.reason) {
                                    case PRESS_BACK => dismissDialogAction.dismiss()
                                    case TOUCH_OUTSIDE => dismissDialogAction.dismiss()
                                    case _ => ()
                                }
                            },
                            confirm: AlertDialogButtonOptions(value: "button",
                                action: {=> Hilog.info(0, "AppLogCj", "Button-clicking callback")})))
                })
            .backgroundColor(0x317aff)
            Button("two button dialog")
                .onClick({ =>
                    AlertDialog.show(
                        AlertDialogParamWithButtons("text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            cancel: {=> Hilog.info(0, "AppLogCj", "Closed callbacks")},
                            alignment: DialogAlignment.Center,
                            offset: Offset(0, -20), gridCount: 4,
                            onWillDismiss: {
                                dismissDialogAction: DismissDialogAction => match (dismissDialogAction.reason) {
                                    case PRESS_BACK => dismissDialogAction.dismiss()
                                    case TOUCH_OUTSIDE => dismissDialogAction.dismiss()
                                    case _ => ()
                                }
                            },
                            primaryButton: AlertDialogButtonOptions(value: "Cancel",
                                action: {=> Hilog.info(0, "AppLogCj", "Callback when second button is clicked")}),
                            secondaryButton: AlertDialogButtonOptions(enabled: true, defaultFocus: true,
                                style: DialogButtonStyle.HIGHLIGHT, value: "OK",
                                action: {=> Hilog.info(0, "AppLogCj", "Callback when second button is clicked")})))
                })
            .backgroundColor(0x317aff)
            Button("three button dialog")
                .onClick({ =>
                    AlertDialog.show(
                        AlertDialogParamWithOptions(
                            "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            cancel: {=> Hilog.info(0, "AppLogCj", "Callback when third button is clicked")},
                            alignment: DialogAlignment.Center,
                            offset: Offset(0, -20),
                            gridCount: 4,
                            onWillDismiss: {
                                dismissDialogAction: DismissDialogAction => match (dismissDialogAction.reason) {
                                    case PRESS_BACK => dismissDialogAction.dismiss()
                                    case TOUCH_OUTSIDE => dismissDialogAction.dismiss()
                                    case _ => ()
                                }
                            },
                            buttons: [
                                AlertDialogButtonOptions(value: "Button",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")}),
                                AlertDialogButtonOptions(value: "Button",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")}),
                                AlertDialogButtonOptions(value: "Button",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")})
                            ]
                        )
                    )
                })
                .backgroundColor(0x317aff)
        }
    }
}
```

![alertdialog1](<font color="red" face="bold">please add link</font>)

### Example 2 (Popup Displayable Outside Main Window)

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(5.vp) {
            Button("button dialog")
                .onClick({ =>
                    AlertDialog.show(
                        AlertDialogParamWithOptions(
                            "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            cancel: {=> Hilog.info(0, "AppLogCj", "Closed callbacks")},
                            alignment: DialogAlignment.Center,
                            offset: Offset(0, -20),
                            showInSubWindow: true,
                            buttonDirection: DialogButtonDirection.HORIZONTAL,
                            gridCount: 4,
                            onWillDismiss: {
                                dismissDialogAction: DismissDialogAction => match (dismissDialogAction.reason) {
                                    case PRESS_BACK => dismissDialogAction.dismiss()
                                    case TOUCH_OUTSIDE => dismissDialogAction.dismiss()
                                    case _ => ()
                                }
                            },
                            buttons: [
                                AlertDialogButtonOptions(value: "Button",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")}),
                                AlertDialogButtonOptions(value: "Button",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")}),
                                AlertDialogButtonOptions(value: "Button",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")})
                            ]
                        )
                    )
                })
                .backgroundColor(0x317aff)
        }
    }
}

```

![alertdialog2](<font color="red" face="bold">please add link</font>)

### Example 3 (Setting Popup Styles)

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(5.vp) {
            Button("button dialog")
                .onClick(
                    {
                        => AlertDialog.show(
                            AlertDialogParamWithConfirm(
                                "button dialog",
                                title: "AlertDialog 1",
                                autoCancel: true,
                                cancel: {=> Hilog.info(0, "AppLogCj", "Closed callbacks")},
                                alignment: DialogAlignment.Center,
                                offset: Offset(0, -20),
                                gridCount: 3,
                                width: 300,
                                height: 200,
                                cornerRadius: BorderRadiuses(topLeft: 20, topRight: 20, bottomLeft: 20, bottomRight: 20),
                                borderWidth: 1,
                                borderStyle: EdgeStyle.DASHED,
                                borderColor: Color.Blue,
                                backgroundColor: Color.White,
                                onWillDismiss: {
                                    dismissDialogAction: DismissDialogAction => match (dismissDialogAction.reason) {
                                        case PRESS_BACK => dismissDialogAction.dismiss()
                                        case TOUCH_OUTSIDE => dismissDialogAction.dismiss()
                                        case _ => ()
                                    }
                                },
                                confirm: AlertDialogButtonOptions(value: "button",
                                    action: {=> Hilog.info(0, "AppLogCj", "Button-clicking callback")})
                            ), ActionSheetShadowOptions(20.0, color: Color.GREY, offsetX: 50.0, offsetY: 0.0)
                        )
                    })
                .backgroundColor(0x317aff)
        }
    }
}
```

![alertdialog3](<font color="red" face="bold">please add link</font>)