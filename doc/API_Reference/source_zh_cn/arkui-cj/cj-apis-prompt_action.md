# ohos.prompt_action

创建并显示文本提示框、对话框和操作菜单。

> **说明：**
>
> ohos.prompt_action仅支持纯仓颉场景，不支持用于ArkTS与仓颉混合开发场景。

## 导入模块

```cangjie
import kit.UIKit.*
```

## class ActionMenuOptions

```cangjie
public open class ActionMenuOptions {
    public var title: ResourceStr
    public var buttons: Array<ButtonInfo>
    public var showInSubWindow: Bool
    public var isModal: Bool
    public init(
        title!: ResourceStr = '',
        buttons!: Array<ButtonInfo>,
        showInSubWindow!: Bool = false,
        isModal!: Bool = true
    )
}
```

**功能：** 操作菜单的选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var buttons

```cangjie
public var buttons: Array<ButtonInfo>
```

**功能：** 表示菜单中菜单项按钮的数组，结构为：ButtonInfo("button", Color.BLACK)，支持1-6个按钮。按钮数量大于6个时，仅显示前6个按钮，之后的按钮不显示。

**类型：** Array\<[ButtonInfo](#class-buttoninfo)>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var isModal

```cangjie
public var isModal: Bool
```

**功能：** 是否以模态方式显示操作菜单。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var showInSubWindow

```cangjie
public var showInSubWindow: Bool
```

**功能：** 是否在子窗口中显示操作菜单。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var title

```cangjie
public var title: ResourceStr
```

**功能：** 操作菜单的标题。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(ResourceStr, Array\<ButtonInfo>, Bool, Bool)

```cangjie
public init(
    title!: ResourceStr = '',
    buttons!: Array<ButtonInfo>,
    showInSubWindow!: Bool = false,
    isModal!: Bool = true
)
```

**功能：** 操作菜单的选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|title|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|''|操作菜单的标题。|
|buttons|Array\<[ButtonInfo](#class-buttoninfo)>|是|-|菜单中菜单项按钮的数组，结构为：ButtonInfo("button",Color.BLACK)，支持1-6个按钮。按钮数量大于6个时，仅显示前6个按钮，之后的按钮不显示。|
|showInSubWindow|Bool|否|false|某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。默认弹窗显示在应用内，而非独立子窗口。<br>**说明：** <br> - showInSubWindow 为 true 的弹窗无法触发显示另一个 showInSubWindow 为 true 的弹窗。|
|isModal|Bool|否|true|弹窗是否为模态窗口，模态窗口有蒙层，非模态窗口无蒙层。默认弹窗有蒙层。|

## class BaseDialogOptions

```cangjie
public open class BaseDialogOptions {
    public var maskRect: Rectangle
    public var alignment: DialogAlignment
    public var offset: Offset
    public var isModal: Bool
    public var showInSubWindow: Bool
    public var autoCancel: Bool
    public var maskColor: ResourceColor
    public var transition: TransitionEffect
    public var onDidAppear:() -> Unit
    public var onDidDisappear:() -> Unit
    public var onWillAppear:() -> Unit
    public var onWillDisappear:() -> Unit
    public var keyboardAvoidMode: KeyboardAvoidMode
    public var enableHoverMode: Bool
    public var hoverModeArea: HoverModeAreaType
    public init(
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        isModal!: Bool = true,
        showInSubWindow!: Bool = false,
        autoCancel!: Bool = true,
        maskColor!: ResourceColor = Color(0x33000000),
        transition!: TransitionEffect = TransitionEffect.OPACITY,
        onDidAppear!: () -> Unit = {=>},
        onDidDisappear!: () -> Unit = {=>},
        onWillAppear!: () -> Unit = {=>},
        onWillDisappear!: () -> Unit = {=>},
        keyboardAvoidMode!: KeyboardAvoidMode = KeyboardAvoidMode.Default,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
    )
}
```

**功能：** 弹窗的选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var alignment

```cangjie
public var alignment: DialogAlignment
```

**功能：** 表示弹窗在竖直方向上的对齐方式。

**类型：** [DialogAlignment](./cj-common-types.md#enum-dialogalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var autoCancel

```cangjie
public var autoCancel: Bool
```

**功能：** 点击遮障层时，是否关闭弹窗，true表示关闭弹窗。false表示不关闭弹窗。<br>初始值：true

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var enableHoverMode

```cangjie
public var enableHoverMode: Bool
```

**功能：** 表示是否响应悬停态。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var hoverModeArea

```cangjie
public var hoverModeArea: HoverModeAreaType
```

**功能：** 表示悬停态下弹窗默认展示区域。

**类型：** [HoverModeAreaType](#enum-hovermodeareatype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var isModal

```cangjie
public var isModal: Bool
```

**功能：** 表示弹窗是否为模态窗口。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var keyboardAvoidMode

```cangjie
public var keyboardAvoidMode: KeyboardAvoidMode
```

**功能：** 表示用于设置弹窗是否在拉起软键盘时进行自动避让。

**类型：** [KeyboardAvoidMode](#enum-keyboardavoidmode)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var maskColor

```cangjie
public var maskColor: ResourceColor
```

**功能：** 表示自定义蒙层颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var maskRect

```cangjie
public var maskRect: Rectangle
```

**功能：** 表示弹窗遮蔽层区域。

**类型：** [Rectangle](./cj-common-types.md#class-rectangle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var offset

```cangjie
public var offset: Offset
```

**功能：** 表示弹窗相对alignment所在位置的偏移量。

**类型：** [Offset](./cj-common-types.md#class-offset)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var onDidAppear

```cangjie
public var onDidAppear:() -> Unit
```

**功能：** 表示弹窗弹出时的事件回调。

**类型：** ()->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var onDidDisappear

```cangjie
public var onDidDisappear:() -> Unit
```

**功能：** 表示弹窗消失时的事件回调。

**类型：** ()->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var onWillAppear

```cangjie
public var onWillAppear:() -> Unit
```

**功能：** 表示弹窗显示动效前的事件回调。

**类型：** ()->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var onWillDisappear

```cangjie
public var onWillDisappear:() -> Unit
```

**功能：** 表示弹窗退出动效前的事件回调。

**类型：** ()->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var showInSubWindow

```cangjie
public var showInSubWindow: Bool
```

**功能：** 表示弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var transition

```cangjie
public var transition: TransitionEffect
```

**功能：** 表示弹窗显示和退出的过渡效果。

**类型：** [TransitionEffect](./cj-animation-transition.md#class-transitioneffect)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Rectangle, DialogAlignment, Offset, Bool, Bool, Bool, ResourceColor, TransitionEffect, () -> Unit, () -> Unit, () -> Unit, () -> Unit, KeyboardAvoidMode, Bool, HoverModeAreaType)

```cangjie
public init(
    maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
    alignment!: DialogAlignment = DialogAlignment.Default,
    offset!: Offset = Offset(0.vp, 0.vp),
    isModal!: Bool = true,
    showInSubWindow!: Bool = false,
    autoCancel!: Bool = true,
    maskColor!: ResourceColor = Color(0x33000000),
    transition!: TransitionEffect = TransitionEffect.OPACITY,
    onDidAppear!: () -> Unit = {=>},
    onDidDisappear!: () -> Unit = {=>},
    onWillAppear!: () -> Unit = {=>},
    onWillDisappear!: () -> Unit = {=>},
    keyboardAvoidMode!: KeyboardAvoidMode = KeyboardAvoidMode.Default,
    enableHoverMode!: Bool = false,
    hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
)
```

**功能：** 构造BaseDialogOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|maskRect|[Rectangle](./cj-common-types.md#class-rectangle)|否|Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent)|弹窗遮蔽层区域，在遮蔽层区域内的事件不透传，在遮蔽层区域外的事件透传。|
|alignment|[DialogAlignment](./cj-common-types.md#enum-dialogalignment)|否|DialogAlignment.Default|弹窗在竖直方向上的对齐方式。|
|offset|[Offset](./cj-apis-componentutils.md#class-offset)|否|Offset(0.vp, 0.vp)|弹窗相对alignment所在位置的偏移量。|
|isModal|Bool|否|true|弹窗是否为模态窗口，模态窗口有蒙层，非模态窗口无蒙层。默认弹窗有蒙层。|
|showInSubWindow|Bool|否|false|某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。默认弹窗显示在应用内，而非独立子窗口。|
|autoCancel|Bool|否|true|点击遮障层时，是否关闭弹窗，true表示关闭弹窗。false表示不关闭弹窗。|
|maskColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color(0x33000000)|自定义蒙层颜色。|
|transition|[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)|否|TransitionEffect.OPACITY|设置弹窗显示和退出的过渡效果。|
|onDidAppear|()->Unit|否|{ => }|弹窗弹出时的事件回调。|
|onDidDisappear|()->Unit|否|{ => }|弹窗消失时的事件回调。|
|onWillAppear|()->Unit|否|{ => }|弹窗显示动效前的事件回调。|
|onWillDisappear|()->Unit|否|{ => }|弹窗退出动效前的事件回调。|
|keyboardAvoidMode|[KeyboardAvoidMode](#enum-keyboardavoidmode)|否|KeyboardAvoidMode.Default|用于设置弹窗是否在拉起软键盘时进行自动避让。|
|enableHoverMode|Bool|否|false|是否响应悬停态。|
|hoverModeArea|[HoverModeAreaType](#enum-hovermodeareatype)|否|HoverModeAreaType.BottomScreen|悬停态下弹窗默认展示区域。|

## class ButtonInfo

```cangjie
public class ButtonInfo {
    public var text: ResourceStr
    public var color: ResourceColor
    public var primary: Bool
    public init(text!: ResourceStr, color!: ResourceColor, primary!: Bool = false)
}
```

**功能：** 菜单中的菜单项按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var color

```cangjie
public var color: ResourceColor
```

**功能：** 表示按钮文本颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var primary

```cangjie
public var primary: Bool
```

**功能：** 表示在弹窗获焦且未进行tab键走焦时，按钮是否默认响应Enter键。多个Button时，只允许一个Button的该字段配置为true，否则所有Button均不响应。多重弹窗可自动获焦连续响应。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var text

```cangjie
public var text: ResourceStr
```

**功能：** 表示按钮文本内容。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(ResourceStr, ResourceColor, Bool)

```cangjie
public init(text!: ResourceStr, color!: ResourceColor, primary!: Bool = false)
```

**功能：** 构造ButtonInfo对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|text|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|按钮文本内容。|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|按钮文本颜色。|
|primary|Bool|否|false|在弹窗获焦且未进行tab键走焦时，按钮是否默认响应Enter键。|

## class CustomDialogOptions

```cangjie
public class CustomDialogOptions <: BaseDialogOptions {
    public var builder:() -> Unit
    public var backgroundColor: ResourceColor
    public var cornerRadius: BorderRadiuses
    public var borderWidth: EdgeWidths
    public var borderColor: EdgeColors
    public var borderStyle: EdgeStyles
    public var width: Length
    public var height: Length
    public var shadow:?ShadowOptions
    public var backgroundBlurStyle: BlurStyle
    public init(
        builder!: () -> Unit,
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        isModal!: Bool = true,
        showInSubWindow!: Bool = false,
        autoCancel!: Bool = true,
        maskColor!: ResourceColor = Color(0x33000000),
        transition!: TransitionEffect = TransitionEffect.OPACITY,
        onDidAppear!: () -> Unit = {=>},
        onDidDisappear!: () -> Unit = {=>},
        onWillAppear!: () -> Unit = {=>},
        onWillDisappear!: () -> Unit = {=>},
        keyboardAvoidMode!: KeyboardAvoidMode = KeyboardAvoidMode.Default,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen,
        backgroundColor!: ResourceColor = Color.Transparent,
        cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        borderWidth!: EdgeWidths = EdgeWidths(top: 0.vp, right: 0.vp, bottom: 0.vp, left: 0.vp),
        borderColor!: EdgeColors = EdgeColors(top: Color.Black, right: Color.Black, bottom: Color.Black, left: Color.Black),
        borderStyle!: EdgeStyles = EdgeStyles(),
        width!: Length = 400.vp,
        height!: Length = 100.vp,
        shadow!: ?ShadowOptions = None,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick
    )
}
```

**功能：** 自定义弹窗的内容，继承自BaseDialogOptions。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [BaseDialogOptions](#class-basedialogoptions)

### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle
```

**功能：** 表示弹窗背板模糊材质。

**类型：** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var backgroundColor

```cangjie
public var backgroundColor: ResourceColor
```

**功能：** 表示弹窗背板颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var borderColor

```cangjie
public var borderColor: EdgeColors
```

**功能：** 表示弹窗背板的边框颜色。

**类型：** [EdgeColors](#class-edgecolors)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var borderStyle

```cangjie
public var borderStyle: EdgeStyles
```

**功能：** 表示弹窗背板的边框样式。

**类型：** [EdgeStyles](./cj-common-types.md#class-edgestyles)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var borderWidth

```cangjie
public var borderWidth: EdgeWidths
```

**功能：** 表示弹窗背板的边框宽度。

**类型：** EdgeWidths

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var builder

```cangjie
public var builder:() -> Unit
```

**功能：** 表示自定义弹窗的内容。

**类型：** ()->Unit

**读写能力：** 可读写

**系统能力:** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var cornerRadius

```cangjie
public var cornerRadius: BorderRadiuses
```

**功能：** 表示背板的圆角半径。

**类型：** [BorderRadiuses](./cj-common-types.md#class-borderradiuses)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var height

```cangjie
public var height: Length
```

**功能：** 表示弹窗背板的高度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var shadow

```cangjie
public var shadow:?ShadowOptions
```

**功能：** 表示弹窗背板阴影。

**类型：** ?[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var width

```cangjie
public var width: Length
```

**功能：** 表示弹窗背板的宽度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(() -> Unit, Rectangle, DialogAlignment, Offset, Bool, Bool, Bool, ResourceColor, TransitionEffect, () -> Unit, () -> Unit, () -> Unit, () -> Unit, KeyboardAvoidMode, Bool, HoverModeAreaType, ResourceColor, BorderRadiuses, EdgeWidths, EdgeColors, EdgeStyles, Length, Length, ?ShadowOptions, BlurStyle)

```cangjie
public init(
    builder!: () -> Unit,
    maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
    alignment!: DialogAlignment = DialogAlignment.Default,
    offset!: Offset = Offset(0.vp, 0.vp),
    isModal!: Bool = true,
    showInSubWindow!: Bool = false,
    autoCancel!: Bool = true,
    maskColor!: ResourceColor = Color(0x33000000),
    transition!: TransitionEffect = TransitionEffect.OPACITY,
    onDidAppear!: () -> Unit = {=>},
    onDidDisappear!: () -> Unit = {=>},
    onWillAppear!: () -> Unit = {=>},
    onWillDisappear!: () -> Unit = {=>},
    keyboardAvoidMode!: KeyboardAvoidMode = KeyboardAvoidMode.Default,
    enableHoverMode!: Bool = false,
    hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen,
    backgroundColor!: ResourceColor = Color.Transparent,
    cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
        bottomRight: 32.vp),
    borderWidth!: EdgeWidths = EdgeWidths(top: 0.vp, right: 0.vp, bottom: 0.vp, left: 0.vp),
    borderColor!: EdgeColors = EdgeColors(top: Color.Black, right: Color.Black, bottom: Color.Black, left: Color.Black),
    borderStyle!: EdgeStyles = EdgeStyles(),
    width!: Length = 400.vp,
    height!: Length = 100.vp,
    shadow!: ?ShadowOptions = None,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick
)
```

**功能：** CustomDialogOptions构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|()->Unit|是|-|设置自定义弹窗的内容。|
|maskRect|[Rectangle](./cj-common-types.md#class-rectangle)|否|Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent)|弹窗遮蔽层区域，在遮蔽层区域内的事件不透传，在遮蔽层区域外的事件透传。|
|alignment|[DialogAlignment](./cj-common-types.md#enum-dialogalignment)|否|DialogAlignment.Default|弹窗在竖直方向上的对齐方式。|
|offset|[Offset](./cj-apis-componentutils.md#class-offset)|否|Offset(0.vp, 0.vp)|弹窗相对alignment所在位置的偏移量。|
|isModal|Bool|否|true|弹窗是否为模态窗口，模态窗口有蒙层，非模态窗口无蒙层。默认弹窗有蒙层。|
|showInSubWindow|Bool|否|false|某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。默认弹窗显示在应用内，而非独立子窗口。|
|autoCancel|Bool|否|true|点击遮障层时，是否关闭弹窗，true表示关闭弹窗。false表示不关闭弹窗。|
|maskColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color(0x33000000)|自定义蒙层颜色。|
|transition|[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)|否|TransitionEffect.OPACITY|设置弹窗显示和退出的过渡效果。|
|onDidAppear|()->Unit|否|{ => }|弹窗弹出时的事件回调。|
|onDidDisappear|()->Unit|否|{ => }|弹窗消失时的事件回调。|
|onWillAppear|()->Unit|否|{ => }|弹窗显示动效前的事件回调。|
|onWillDisappear|()->Unit|否|{ => }|弹窗退出动效前的事件回调。|
|keyboardAvoidMode|[KeyboardAvoidMode](#enum-keyboardavoidmode)|否|KeyboardAvoidMode.Default|用于设置弹窗是否在拉起软键盘时进行自动避让。|
|enableHoverMode|Bool|否|false|是否响应悬停态。|
|hoverModeArea|[HoverModeAreaType](#enum-hovermodeareatype)|否|HoverModeAreaType.BottomScreen|悬停态下弹窗默认展示区域。|
|backgroundColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Transparent|设置弹窗背板颜色。|
|cornerRadius|[BorderRadiuses](./cj-common-types.md#class-borderradiuses)|否|BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp)|设置背板的圆角半径。|
|borderWidth|EdgeWidths|否|EdgeWidths(top: 0.vp, right: 0.vp, bottom: 0.vp, left: 0.vp)|设置弹窗背板的边框宽度。|
|borderColor|[EdgeColors](#class-edgecolors)|否|EdgeColors(top: Color.Black, right: Color.Black, bottom: Color.Black, left: Color.Black)|设置弹窗背板的边框颜色。|
|borderStyle|[EdgeStyles](./cj-common-types.md#class-edgestyles)|否|EdgeStyles()|设置弹窗背板的边框样式。|
|width|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|400.vp|设置弹窗背板的宽度。|
|height|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|100.vp|设置弹窗背板的高度。|
|shadow|?[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)|否|None|设置弹窗背板阴影。|
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick|弹窗背板模糊材质。|

## class EdgeColors

```cangjie
public class EdgeColors {
    public var top: ResourceColor
    public var right: ResourceColor
    public var bottom: ResourceColor
    public var left: ResourceColor
    public init(
        top!: ResourceColor = Color.Black,
        right!: ResourceColor = Color.Black,
        bottom!: ResourceColor = Color.Black,
        left!: ResourceColor = Color.Black
    )
}
```

**功能：** 边框颜色，用于描述组件边框四条边的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var bottom

```cangjie
public var bottom: ResourceColor
```

**功能：** 设置组件下边框颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var left

```cangjie
public var left: ResourceColor
```

**功能：** 设置组件左边框颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var right

```cangjie
public var right: ResourceColor
```

**功能：** 设置组件右边框颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var top

```cangjie
public var top: ResourceColor
```

**功能：** 设置组件上边框颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(ResourceColor, ResourceColor, ResourceColor, ResourceColor)

```cangjie
public init(
    top!: ResourceColor = Color.Black,
    right!: ResourceColor = Color.Black,
    bottom!: ResourceColor = Color.Black,
    left!: ResourceColor = Color.Black
)
```

**功能：** 构造EdgeColor对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black|组件上边框颜色。|
|right|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black|组件右边框颜色。|
|bottom|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)| 否 | Option.None| 下侧边框颜色。|
|right|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black|组件左边框颜色。|

## class PromptActionInner

```cangjie
public class PromptActionInner {}
```

**功能：** 创建弹窗和响应弹窗动作。

## class ShowDialogOptions

```cangjie
public open class ShowDialogOptions {
    public var title: ResourceStr
    public var message: ResourceStr
    public var buttons: Array<ButtonInfo>
    public var alignment: DialogAlignment
    public var offset: Offset
    public var maskRect: Rectangle
    public var showInSubWindow: Bool
    public var isModal: Bool
    public var backgroundColor: ResourceColor
    public var backgroundBlurStyle: BlurStyle
    public var shadow:?ShadowOptions
    public var enableHoverMode: Bool
    public var hoverModeArea: HoverModeAreaType
    public init(
        title!: ResourceStr = '',
        message!: ResourceStr = '',
        buttons!: Array<ButtonInfo> = [],
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: Color = Color.Transparent,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        shadow!: ?ShadowOptions = None,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
    )
}
```

**功能：** 对话框的选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var alignment

```cangjie
public var alignment: DialogAlignment
```

**功能：** 表示弹窗在竖直方向上的对齐方式。

**类型：** [DialogAlignment](./cj-common-types.md#enum-dialogalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle
```

**功能：** 表示弹窗背板模糊材质。

**类型：** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var backgroundColor

```cangjie
public var backgroundColor: ResourceColor
```

**功能：** 表示弹窗背板颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var buttons

```cangjie
public var buttons: Array<ButtonInfo>
```

**功能：** 表示对话框中按钮的数组，支持1-3个按钮。

**类型：** Array\<[ButtonInfo](#class-buttoninfo)>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var enableHoverMode

```cangjie
public var enableHoverMode: Bool
```

**功能：** 表示是否响应悬停态。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var hoverModeArea

```cangjie
public var hoverModeArea: HoverModeAreaType
```

**功能：** 表示悬停态下弹窗默认展示区域。

**类型：** [HoverModeAreaType](#enum-hovermodeareatype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var isModal

```cangjie
public var isModal: Bool
```

**功能：** 表示弹窗是否为模态窗口。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var maskRect

```cangjie
public var maskRect: Rectangle
```

**功能：** 表示弹窗遮蔽层区域。

**类型：** [Rectangle](./cj-common-types.md#class-rectangle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var message

```cangjie
public var message: ResourceStr
```

**功能：** 表示对话框的消息内容。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var offset

```cangjie
public var offset: Offset
```

**功能：** 表示弹窗相对alignment所在位置的偏移量。

**类型：** [Offset](./cj-apis-componentutils.md#class-offset)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var shadow

```cangjie
public var shadow:?ShadowOptions
```

**功能：** 表示弹窗背板阴影。

**类型：** ?[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var showInSubWindow

```cangjie
public var showInSubWindow: Bool
```

**功能：** 表示弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var title

```cangjie
public var title: ResourceStr
```

**功能：** 表示对话框的标题。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(ResourceStr, ResourceStr, Array\<ButtonInfo>, DialogAlignment, Offset, Rectangle, Bool, Bool, Color, BlurStyle, ?ShadowOptions, Bool, HoverModeAreaType)

```cangjie
public init(
    title!: ResourceStr = '',
    message!: ResourceStr = '',
    buttons!: Array<ButtonInfo> = [],
    alignment!: DialogAlignment = DialogAlignment.Default,
    offset!: Offset = Offset(0.vp, 0.vp),
    maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
    showInSubWindow!: Bool = false,
    isModal!: Bool = true,
    backgroundColor!: Color = Color.Transparent,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
    shadow!: ?ShadowOptions = None,
    enableHoverMode!: Bool = false,
    hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
)
```

**功能：** 构造ShowDialogOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|title|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|''|对话框的标题文本。|
|message|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|''|对话框的消息内容文本。|
|buttons|Array\<[ButtonInfo](#class-buttoninfo)>|否|[]|对话框中按钮的数组，支持1-3个按钮。|
|alignment|[DialogAlignment](./cj-common-types.md#enum-dialogalignment)|否|DialogAlignment.Default|弹窗在竖直方向上的对齐方式。|
|offset|[Offset](./cj-apis-componentutils.md#class-offset)|否|Offset(0.vp, 0.vp)|弹窗相对alignment所在位置的偏移量。|
|maskRect|[Rectangle](./cj-common-types.md#class-rectangle)|否|Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent)|弹窗遮蔽层区域，在遮蔽层区域内的事件不透传，在遮蔽层区域外的事件透传。|
|showInSubWindow|Bool|否|false|某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。默认弹窗显示在应用内，而非独立子窗口。|
|isModal|Bool|否|true|弹窗是否为模态窗口，模态窗口有蒙层，非模态窗口无蒙层。默认弹窗有蒙层。|
|backgroundColor|[Color](./cj-common-types.md#class-color)|否|Color.Transparent|弹窗背板颜色。|
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick|弹窗背板模糊材质。|
|shadow|?[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)|否|None|弹窗背板阴影。|
|enableHoverMode|Bool|否|false|是否响应悬停态。|
|hoverModeArea|[HoverModeAreaType](#enum-hovermodeareatype)|否|HoverModeAreaType.BottomScreen|悬停态下弹窗默认展示区域。|

## class ShowToastOptions

```cangjie
public class ShowToastOptions {
    public var message: ResourceStr
    public var duration: UInt32
    public var bottom: Length
    public var showMode: ToastShowMode
    public var alignment: Alignment
    public var offset: Offset
    public var backgroundColor: ResourceColor
    public var textColor: ResourceColor
    public var backgroundBlurStyle: BlurStyle
    public var shadow:?ShadowOptions = None
    public var enableHoverMode: Bool
    public var hoverModeArea: HoverModeAreaType
    public init(
        message!: ResourceStr,
        duration!: UInt32 = 1500,
        bottom!: Length = 80.vp,
        showMode!: ToastShowMode = ToastShowMode.Default,
        alignment!: Alignment = Alignment.Bottom,
        offset!: Offset = Offset(0.vp, 0.vp),
        backgroundColor!: Color = Color.Transparent,
        textColor!: Color = Color.Black,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        shadow!: ?ShadowOptions = None,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
    )
}
```

**功能：** 文本提示框的选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var alignment

```cangjie
public var alignment: Alignment
```

**功能：** 表示文本提示框的对齐方式。

**类型：** [Alignment](./cj-common-types.md#enum-alignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle
```

**功能：** 表示文本提示框背板模糊材质。

**类型：** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var backgroundColor

```cangjie
public var backgroundColor: ResourceColor
```

**功能：** 表示文本提示框背板颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var bottom

```cangjie
public var bottom: Length
```

**功能：** 表示文本提示框距离屏幕底部的距离。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var duration

```cangjie
public var duration: UInt32
```

**功能：** 表示文本提示框显示的持续时间，单位为毫秒。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var enableHoverMode

```cangjie
public var enableHoverMode: Bool
```

**功能：** 表示是否响应悬停态。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var hoverModeArea

```cangjie
public var hoverModeArea: HoverModeAreaType
```

**功能：** 表示悬停态下文本提示框默认展示区域。

**类型：** [HoverModeAreaType](#enum-hovermodeareatype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var message

```cangjie
public var message: ResourceStr
```

**功能：** 表示文本提示框的消息内容。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力:** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var offset

```cangjie
public var offset: Offset
```

**功能：** 表示文本提示框相对alignment所在位置的偏移量。

**类型：** [Offset](./cj-apis-componentutils.md#class-offset)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var shadow

```cangjie
public var shadow:?ShadowOptions = None
```

**功能：** 表示文本提示框背板阴影。

**类型：** ?[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var showMode

```cangjie
public var showMode: ToastShowMode
```

**功能：** 表示文本提示框的显示模式。

**类型：** [ToastShowMode](#enum-toastshowmode)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var textColor

```cangjie
public var textColor: ResourceColor
```

**功能：** 表示文本提示框的文本颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(ResourceStr, UInt32, Length, ToastShowMode, Alignment, Offset, Color, Color, BlurStyle, ?ShadowOptions, Bool, HoverModeAreaType)

```cangjie
public init(
    message!: ResourceStr,
    duration!: UInt32 = 1500,
    bottom!: Length = 80.vp,
    showMode!: ToastShowMode = ToastShowMode.Default,
    alignment!: Alignment = Alignment.Bottom,
    offset!: Offset = Offset(0.vp, 0.vp),
    backgroundColor!: Color = Color.Transparent,
    textColor!: Color = Color.Black,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
    shadow!: ?ShadowOptions = None,
    enableHoverMode!: Bool = false,
    hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
)
```

**功能：** 构造ShowToastOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|message|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|显示的文本信息。|
|duration|UInt32|否|1500|弹窗持续时间，取值区间：1500ms-10000ms。若小于1500ms则取默认值，若大于10000ms则取上限值10000ms。|
|bottom|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|80.vp|设置弹窗底部边框距离导航条的高度。|
|showMode|[ToastShowMode](#enum-toastshowmode)|否|ToastShowMode.Default|设置弹窗是否显示在应用之上。默认显示在应用内。|
|alignment|[Alignment](./cj-common-types.md#enum-alignment)|否|Alignment.Bottom|设置弹窗对齐方式。默认底部位置。|
|offset|[Offset](./cj-apis-componentutils.md#class-offset)|否|Offset(0.vp, 0.vp)|设置弹窗在对齐方式上的偏移。默认没有偏移。|
|backgroundColor|[Color](./cj-common-types.md#class-color)|否|Color.Transparent|设置文本提示框背板颜色。|
|textColor|[Color](./cj-common-types.md#class-color)|否|Color.Black|设置文本提示框文本颜色。|
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick|设置文本提示框背板模糊材质。|
|shadow|?[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)|否|None|设置文本提示框背板阴影。|
|enableHoverMode|Bool|否|false|设置弹窗是否响应悬停态。默认不响应。|
|hoverModeArea|[HoverModeAreaType](#enum-hovermodeareatype)|否|HoverModeAreaType.BottomScreen|设置响应悬停态时，弹窗的显示区域。默认显示在下半屏。|

## enum HoverModeAreaType

```cangjie
public enum HoverModeAreaType <: Equatable<HoverModeAreaType> {
    | TopScreen
    | BottomScreen
    | ...
}
```

**功能：** 悬停态下弹窗默认展示区域类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<HoverModeAreaType>

### BottomScreen

```cangjie
BottomScreen
```

**功能：** 表示弹窗在屏幕底部展示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TopScreen

```cangjie
TopScreen
```

**功能：** 表示弹窗在屏幕顶部展示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(HoverModeAreaType)

```cangjie
public operator func !=(other: HoverModeAreaType): Bool
```

**功能：** 判断两个HoverModeAreaType是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[HoverModeAreaType](#enum-hovermodeareatype)|是|-|要比较的另一个HoverModeAreaType值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果不相等返回true，否则返回false。|

### func ==(HoverModeAreaType)

```cangjie
public operator func ==(other: HoverModeAreaType): Bool
```

**功能：** 判断两个HoverModeAreaType是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[HoverModeAreaType](#enum-hovermodeareatype)|是|-|要比较的另一个HoverModeAreaType值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果相等返回true，否则返回false。|

## enum KeyboardAvoidMode

```cangjie
public enum KeyboardAvoidMode <: Equatable<KeyboardAvoidMode> {
    | Default
    | None
    | ...
}
```

**功能：** 键盘避让模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<KeyboardAvoidMode>

### Default

```cangjie
Default
```

**功能：** 表示默认键盘避让模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 表示不进行键盘避让。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(KeyboardAvoidMode)

```cangjie
public operator func !=(other: KeyboardAvoidMode): Bool
```

**功能：** 判断两个KeyboardAvoidMode是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[KeyboardAvoidMode](#enum-keyboardavoidmode)|是|-|要比较的另一个KeyboardAvoidMode值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果不相等返回true，否则返回false。|

### func ==(KeyboardAvoidMode)

```cangjie
public operator func ==(other: KeyboardAvoidMode): Bool
```

**功能：** 判断两个KeyboardAvoidMode是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[KeyboardAvoidMode](#enum-keyboardavoidmode)|是|-|要比较的另一个KeyboardAvoidMode值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果相等返回true，否则返回false。|

## enum ToastShowMode

```cangjie
public enum ToastShowMode <: Equatable<ToastShowMode> {
    | Default
    | TopMost
    | ...
}
```

**功能：** 文本提示框显示模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ToastShowMode>

### Default

```cangjie
Default
```

**功能：** 表示默认显示模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### TopMost

```cangjie
TopMost
```

**功能：** 表示在最顶层显示模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ToastShowMode)

```cangjie
public operator func !=(other: ToastShowMode): Bool
```

**功能：** 判断两个ToastShowMode是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ToastShowMode](#enum-toastshowmode)|是|-|要比较的另一个ToastShowMode值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果不相等返回true，否则返回false。|

### func ==(ToastShowMode)

```cangjie
public operator func ==(other: ToastShowMode): Bool
```

**功能：** 判断两个ToastShowMode是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ToastShowMode](#enum-toastshowmode)|是|-|要比较的另一个ToastShowMode值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果相等返回true，否则返回false。|

## type ShowActionMenuCallBack

```cangjie
public type ShowActionMenuCallBack = AsyncCallback<Int32>
```

**功能：** [ShowActionMenuCallBack](#type-showactionmenucallback)是[AsyncCallback\<Int32>](../BasicServicesKit/cj-apis-base.md#type-asynccallback)类型的别名。

## type ShowDialogCallBack

```cangjie
public type ShowDialogCallBack = AsyncCallback<Int32>
```

**功能：** [ShowDialogCallBack](#type-showdialogcallback)是[AsyncCallback\<Int32>](../BasicServicesKit/cj-apis-base.md#type-asynccallback)类型的别名。
