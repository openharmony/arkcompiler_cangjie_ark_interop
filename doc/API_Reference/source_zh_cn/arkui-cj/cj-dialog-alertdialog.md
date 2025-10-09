# AlertDialog

显示警告弹窗组件，可设置文本内容与响应回调。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 基础类型定义

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

**功能：** 定义警告弹窗中的按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var action

```cangjie
public var action: VoidCallback
```

**功能：** Button选中时的回调。

**类型：** VoidCallback

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var backgroundColor

```cangjie
public var backgroundColor:?ResourceColor
```

**功能：** Button背景颜色。

**类型：** ?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var defaultFocus

```cangjie
public var defaultFocus: Bool
```

**功能：** 设置Button是否是默认焦点。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var enabled

```cangjie
public var enabled: Bool
```

**功能：** 点击Button是否响应。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontColor

```cangjie
public var fontColor:?ResourceColor
```

**功能：** Button的文本颜色。

**类型：** ?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var style

```cangjie
public var style: DialogButtonStyle
```

**功能：** 设置Button的风格样式。

**类型：** DialogButtonStyle

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var value

```cangjie
public var value: ResourceStr
```

**功能：** 点击Button是否响应。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 定义警告弹窗中的按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|enabled|Bool|否|true| **命名参数。**  点击Button是否响应。 |
|defaultFocus|Bool|否|false| **命名参数。**  设置Button是否是默认焦点。 |
|style|DialogButtonStyle|否|DialogButtonStyle.Default| **命名参数。**  设置Button的风格样式。 |
|value|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-| **命名参数。**  Button的文本内容。 |
|fontColor|?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|None| **命名参数。**  Button的文本颜色。 |
|backgroundColor|?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|None| **命名参数。**  Button背景颜色。 |
|action|VoidCallback|是|-| **命名参数。**  Button选中时的回调。 |

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

**功能：** 定义警告弹窗中的按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)

#### var primary

```cangjie
public var primary: Bool
```

**功能：** 在弹窗获焦且未进行tab键走焦时，按钮是否默认响应Enter键。多个Button时，只允许一个Button的该字段配置为true，否则所有Button均不响应。多重弹窗可自动获焦连续响应。在defaultFocus为true时不生效。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 定义警告弹窗中的按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|enabled|Bool|否|true| **命名参数。**  点击Button是否响应。 |
|defaultFocus|Bool|否|false| **命名参数。**  设置Button是否是默认焦点。 |
|style|DialogButtonStyle|否|DialogButtonStyle.Default| **命名参数。**  设置Button的风格样式。 |
|value|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-| **命名参数。**  Button的文本内容。 |
|fontColor|?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|None| **命名参数。**  Button的文本颜色。 |
|backgroundColor|?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|None| **命名参数。**  Button背景颜色。 |
|action|VoidCallback|是|-| **命名参数。**  Button选中时的回调。 |
|primary|Bool|否|false| **命名参数。**  在弹窗获焦且未进行tab键走焦时，按钮是否默认响应Enter键。多个Button时，只允许一个Button的该字段配置为true，否则所有Button均不响应。多重弹窗可自动获焦连续响应。在defaultFocus为true时不生效。|

### class AlertDialogParam

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
    public var shadow: ShadowOptions
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
        shadow!: ShadowOptions = ShadowOptions(radius: 0.0),
        textStyle!: WordBreak = WordBreak.BreakAll
    )
}
```

**功能：** 定义告警弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var alignment

```cangjie
public var alignment: DialogAlignment
```

**功能：** 弹窗在竖直方向上的对齐方式。

**类型：** DialogAlignment

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var autoCancel

```cangjie
public var autoCancel: Bool
```

**功能：** 点击遮障层时，是否关闭弹窗。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle
```

**功能：** 弹窗背板模糊材质。

**类型：** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var backgroundColor

```cangjie
public var backgroundColor: ResourceColor
```

**功能：** 弹窗背板颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var borderColor

```cangjie
public var borderColor: ResourceColor
```

**功能：** 设置弹窗背板的边框颜色。如果使用borderColor属性，需要和borderWidth属性一起使用。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var borderStyle

```cangjie
public var borderStyle: EdgeStyles
```

**功能：** 设置弹窗背板的边框样式。如果使用borderStyle属性，需要和borderWidth属性一起使用。

**类型：** [EdgeStyles](./cj-common-types.md#class-edgestyles)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var borderWidth

```cangjie
public var borderWidth: Length
```

**功能：** 设置弹窗背板的边框宽度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var cancel

```cangjie
public var cancel: VoidCallback
```

**功能：** 点击遮障层关闭dialog时的回调。

**类型：** VoidCallback

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var cornerRadius

```cangjie
public var cornerRadius: BorderRadiuses
```

**功能：** 设置背板的圆角半径。可分别设置4个圆角的半径。

**类型：** [BorderRadiuses](./cj-common-types.md#class-borderradiuses)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var gridCount

```cangjie
public var gridCount: UInt32
```

**功能：** 弹窗容器宽度所占用栅格数。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var height

```cangjie
public var height:?Length
```

**功能：** 设置弹窗背板的高度。

**类型：** ?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var isModal

```cangjie
public var isModal: Bool
```

**功能：** 弹窗是否为模态窗口，模态窗口有蒙层，非模态窗口无蒙层。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var maskRect

```cangjie
public var maskRect: Rectangle
```

**功能：** 弹窗遮蔽层区域，在遮蔽层区域内的事件不透传，在遮蔽层区域外的事件透传。

**类型：** [Rectangle](./cj-common-types.md#class-rectangle>)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var message

```cangjie
public var message: ResourceStr
```

**功能：** 弹窗内容。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offset

```cangjie
public var offset: Offset
```

**功能：** 弹窗相对alignment所在位置的偏移量。

**类型：** Offset

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onWillDismiss

```cangjie
public var onWillDismiss:?Callback<DismissDialogAction, Unit>
```

**功能：** 交互式关闭回调函数。

**类型：** ?Callback\<DismissDialogAction,Unit>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool
```

**功能：** 某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var subtitle

```cangjie
public var subtitle: ResourceStr
```

**功能：** 弹窗副标题。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var shadow

```cangjie
public var shadow: ShadowOptions
```

**功能：** 设置弹窗背板的阴影。

**类型：** ?[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var textStyle

```cangjie
public var textStyle: WordBreak
```

**功能：** 设置弹窗message内容的文本样式。

**类型：** WordBreak

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var title

```cangjie
public var title: ResourceStr
```

**功能：** 弹窗标题。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var transition

```cangjie
public var transition:?TransitionEffect
```

**功能：** 设置弹窗显示和退出的过渡效果。

**类型：** ?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var width

```cangjie
public var width:?Length
```

**功能：** 设置弹窗背板的宽度。

**类型：** ?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 定义告警弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|title|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。**  弹窗标题。 |
|subtitle|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。**  弹窗副标题。 |
|message|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|  弹窗内容。  |
|autoCancel|Bool|否|true| **命名参数。**  点击遮障层时是否关闭弹窗。true表示关闭弹窗,false表示不关闭弹窗。 |
|cancel|VoidCallback|否|{ => }| **命名参数。**  点击遮障层关闭dialog时的回调。 |
|alignment|DialogAlignment|否|DialogAlignment.Default| **命名参数。**  弹窗在竖直方向上的对齐方式。|
|offset|Offset|否|Offset(0, 0)| **命名参数。**  弹窗相对alignment所在位置的偏移量。|
|gridCount|UInt32|否|4| **命名参数。**  弹窗容器宽度所占用栅格数。|
|maskRect|[Rectangle](./cj-common-types.md#class-rectangle>)|否|Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)| **命名参数。**  弹窗遮蔽层区域，在遮蔽层区域内的事件不透传，在遮蔽层区域外的事件透传。<br/>**说明：**<br/>showInSubWindow为true时，maskRect不生效。 |
|showInSubWindow|Bool|否|false| **命名参数。**  某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。<br/>初始值：false，弹窗显示在应用内，而非独立子窗口。<br/>**说明**：showInSubWindow为true的弹窗无法触发显示另一个showInSubWindow为true的弹窗。 |
|isModal|Bool|否|true| **命名参数。**  弹窗是否为模态窗口。模态窗口有蒙层，非模态窗口无蒙层。<br/>初始值：true，此时弹窗有蒙层。 |
|backgroundColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Transparent| **命名参数。**  弹窗背板颜色。<br/>**说明：** <br/>当设置了backgroundColor为非透明色时，backgroundBlurStyle需要设置为BlurStyle.NONE，否则颜色显示将不符合预期效果。 |
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick| **命名参数。**  弹窗背板模糊材质。<br/>**说明：** <br/>设置为BlurStyle.NONE即可关闭背景虚化。当设置了backgroundBlurStyle为非NONE值时，则不要设置backgroundColor，否则颜色显示将不符合预期效果。 |
|onWillDismiss|?Callback\<DismissDialogAction,Unit>|否|None| **命名参数。**  交互式关闭回调函数。<br/>**说明：**<br/>1.当用户执行点击遮障层关闭、左滑/右滑、三键back、键盘ESC关闭交互操作时，如果注册该回调函数，则不会立刻关闭弹窗。在回调函数中可以通过reason得到阻拦关闭弹窗的操作类型，从而根据原因选择是否能关闭弹窗。当前组件返回的reason中，暂不支持CLOSE_BUTTON的枚举值。<br/>2.在onWillDismiss回调中，不能再做onWillDismiss拦截。 |
|cornerRadius|[BorderRadiuses](./cj-common-types.md#class-borderradiuses)|否|BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp)| **命名参数。**  设置背板的圆角半径。<br />可分别设置4个圆角的半径。<br /> 圆角大小受组件尺寸限制，最大值为组件宽或高的一半，若值为负，则按照默认值处理。 <br /> 百分比参数方式：以父元素弹窗宽和高的百分比来设置弹窗的圆角。<br/>**说明：**<br/>当cornerRadius属性类型为LocalizedBorderRadiuses时，支持随语言习惯改变布局顺序。 |
|transition|?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)|否|None| **命名参数。**  设置弹窗显示和退出的过渡效果。<br/>**说明：**<br/> 1.如果不设置，则使用默认的显示/退出动效。<br/> 2.显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。<br/> 3.退出动效中按back键，不会打断退出动效，退出动效继续执行，继续按back键退出应用。 |
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。**  设置弹窗背板的宽度。<br />**说明：**<br>- 弹窗宽度默认最大值：None。<br />- 百分比参数方式：弹窗参考宽度为所在窗口的宽度，在此基础上调小或调大。 |
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。**  设置弹窗背板的高度。<br />**说明：**<br />- 弹窗高度默认最大值：None。<br />- 百分比参数方式：弹窗参考高度为（窗口高度 - 安全区域），在此基础上调小或调大。 |
|borderWidth|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0| **命名参数。**  可分别设置4个边框宽度。<br /> 百分比参数方式：以父元素弹窗宽的百分比来设置弹窗的边框宽度。<br />当弹窗左边框和右边框大于弹窗宽度，弹窗上边框和下边框大于弹窗高度，显示可能不符合预期。<br/>**说明：**<br/>当borderWidth属性类型为LocalizedEdgeWidths时，支持随语言习惯改变布局顺序。 |
|borderColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black| **命名参数。**  设置弹窗背板的边框颜色。<br/> 如果使用borderColor属性，需要和borderWidth属性一起使用。**说明：**<br/>当borderColor属性类型为LocalizedEdgeColors时，支持随语言习惯改变布局顺序。 |
|borderStyle|[EdgeStyles](./cj-common-types.md#class-edgestyles)|否|EdgeStyles()| **命名参数。**  设置弹窗背板的边框样式。<br/>如果使用borderStyle属性，需要和borderWidth属性一起使用。 |
|textStyle|WordBreak|否|WordBreak.BreakAll| **命名参数。**  设置弹窗message内容的文本样式。 |

### class AlertDialogParamWithButtons

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

**功能：** 定义带有两个确认按钮的警告弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [AlertDialogParam](#class-alertdialogparam)

#### var primaryButton

```cangjie
public var primaryButton: AlertDialogButtonBaseOptions
```

**功能：** 确认Button的使能状态、默认焦点、按钮风格、文本内容、文本色、按钮背景色和点击回调。

**类型：** [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var secondaryButton

```cangjie
public var secondaryButton: AlertDialogButtonBaseOptions
```

**功能：** 确认Button的使能状态、默认焦点、按钮风格、文本内容、文本色、按钮背景色和点击回调。

**类型：** [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 定义带有两个确认按钮的警告弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|title|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。**  弹窗标题。 |
|subtitle|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。**  弹窗副标题。 |
|message|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-| 弹窗内容。 |
|autoCancel|Bool|否|true| **命名参数。**  点击遮障层时是否关闭弹窗。true表示关闭弹窗,false表示不关闭弹窗。 |
|cancel|VoidCallback|否|{ => }| **命名参数。**  点击遮障层关闭dialog时的回调。 |
|alignment|DialogAlignment|否|DialogAlignment.Default| **命名参数。**  弹窗在竖直方向上的对齐方式。|
|offset|Offset|否|Offset(0, 0)| **命名参数。**  弹窗相对alignment所在位置的偏移量。|
|gridCount|UInt32|否|4| **命名参数。**  弹窗容器宽度所占用栅格数。|
|maskRect|[Rectangle](./cj-common-types.md#class-rectangle>)|否|Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)| **命名参数。**  弹窗遮蔽层区域，在遮蔽层区域内的事件不透传，在遮蔽层区域外的事件透传。<br/>**说明：**<br/>showInSubWindow为true时，maskRect不生效。 |
|showInSubWindow|Bool|否|false| **命名参数。**  某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。<br/>初始值：false，弹窗显示在应用内，而非独立子窗口。<br/>**说明**：showInSubWindow为true的弹窗无法触发显示另一个showInSubWindow为true的弹窗。 |
|isModal|Bool|否|true| **命名参数。**  弹窗是否为模态窗口。模态窗口有蒙层，非模态窗口无蒙层。<br/>初始值：true，此时弹窗有蒙层。 |
|backgroundColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Transparent| **命名参数。**  弹窗背板颜色。<br/>**说明：** <br/>当设置了backgroundColor为非透明色时，backgroundBlurStyle需要设置为BlurStyle.NONE，否则颜色显示将不符合预期效果。 |
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick| **命名参数。**  弹窗背板模糊材质。<br/>**说明：** <br/>设置为BlurStyle.NONE即可关闭背景虚化。当设置了backgroundBlurStyle为非NONE值时，则不要设置backgroundColor，否则颜色显示将不符合预期效果。 |
|onWillDismiss|?Callback\<DismissDialogAction,Unit>|否|None| **命名参数。**  交互式关闭回调函数。<br/>**说明：**<br/>1.当用户执行点击遮障层关闭、左滑/右滑、三键back、键盘ESC关闭交互操作时，如果注册该回调函数，则不会立刻关闭弹窗。在回调函数中可以通过reason得到阻拦关闭弹窗的操作类型，从而根据原因选择是否能关闭弹窗。当前组件返回的reason中，暂不支持CLOSE_BUTTON的枚举值。<br/>2.在onWillDismiss回调中，不能再做onWillDismiss拦截。|
|cornerRadius|[BorderRadiuses](./cj-common-types.md#class-borderradiuses)|否|BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp)| **命名参数。**  设置背板的圆角半径。可分别设置4个圆角的半径。<br />可分别设置4个圆角的半径。<br /> 圆角大小受组件尺寸限制，最大值为组件宽或高的一半，若值为负，则按照默认值处理。 <br /> 百分比参数方式：以父元素弹窗宽和高的百分比来设置弹窗的圆角。<br/>**说明：**<br/>当cornerRadius属性类型为LocalizedBorderRadiuses时，支持随语言习惯改变布局顺序。 |
|transition|?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)|否|None| **命名参数。**  设置弹窗显示和退出的过渡效果。<br/>**说明：**<br/> 1.如果不设置，则使用默认的显示/退出动效。<br/> 2.显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。<br/> 3.退出动效中按back键，不会打断退出动效，退出动效继续执行，继续按back键退出应用。 |
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。**  设置弹窗背板的宽度。<br />**说明：**<br>- 弹窗宽度默认最大值：None。<br />- 百分比参数方式：弹窗参考宽度为所在窗口的宽度，在此基础上调小或调大。 |
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。**  设置弹窗背板的高度。<br />**说明：**<br />- 弹窗高度默认最大值：None。<br />- 百分比参数方式：弹窗参考高度为（窗口高度 - 安全区域），在此基础上调小或调大。|
|borderWidth|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0| **命名参数。**  可分别设置4个边框宽度。<br /> 百分比参数方式：以父元素弹窗宽的百分比来设置弹窗的边框宽度。<br />当弹窗左边框和右边框大于弹窗宽度，弹窗上边框和下边框大于弹窗高度，显示可能不符合预期。<br/>**说明：**<br/>当borderWidth属性类型为LocalizedEdgeWidths时，支持随语言习惯改变布局顺序。 |
|borderColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black| **命名参数。**  设置弹窗背板的边框颜色。<br/> 如果使用borderColor属性，需要和borderWidth属性一起使用。**说明：**<br/>当borderColor属性类型为LocalizedEdgeColors时，支持随语言习惯改变布局顺序。 |
|borderStyle|[EdgeStyles](./cj-common-types.md#class-edgestyles)|否|EdgeStyles()| **命名参数。**  设置弹窗背板的边框样式。<br/>如果使用borderStyle属性，需要和borderWidth属性一起使用。 |
|textStyle|WordBreak|否|WordBreak.BreakAll| **命名参数。**  设置弹窗message内容的文本样式。 |
|primaryButton|[AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)|是|-| **命名参数。**  确认Button的使能状态、默认焦点、按钮风格、文本内容、文本色、按钮背景色和点击回调。 |
|secondaryButton|[AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)|是|-| **命名参数。**  确认Button的使能状态、默认焦点、按钮风格、文本内容、文本色、按钮背景色和点击回调。 |

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
        confirm!: AlertDialogButtonBaseOptions = AlertDialogButtonOptions(value: "", action: {=>})
    )
}
```

**功能：** 定义带有确认按钮的警告弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [AlertDialogParam](#class-alertdialogparam)

#### var confirm

```cangjie
public var confirm: AlertDialogButtonBaseOptions
```

**功能：** 设置确认Button的使能状态、默认焦点、按钮风格、文本内容、文本色、按钮背景色和点击回调。

**类型：** [AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(ResourceStr, ResourceStr, ResourceStr, Bool, VoidCallback, DialogAlignment, Offset, UInt32, Rectangle, Bool, Bool, ResourceColor, BlurStyle, ?Callback\<DismissDialogAction,Unit>, BorderRadiuses, ?TransitionEffect, ?Length, ?Length, Length, ResourceColor, EdgeStyles, WordBreak, AlertDialogButtonBaseOptions)

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
    confirm!: AlertDialogButtonBaseOptions = AlertDialogButtonOptions(value: "", action: {=>})
)
```

**功能：** 定义带有确认按钮的警告弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|title|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。**  弹窗标题。 |
|subtitle|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。**  弹窗副标题。 |
|message|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-| 弹窗内容。 |
|autoCancel|Bool|否|true| **命名参数。**  点击遮障层时是否关闭弹窗。true表示关闭弹窗,false表示不关闭弹窗。 |
|cancel|VoidCallback|否|{ => }| **命名参数。**  点击遮障层关闭dialog时的回调。 |
|alignment|DialogAlignment|否|DialogAlignment.Default| **命名参数。**  弹窗在竖直方向上的对齐方式。|
|offset|Offset|否|Offset(0, 0)| **命名参数。**  弹窗相对alignment所在位置的偏移量。|
|gridCount|UInt32|否|4| **命名参数。**  弹窗容器宽度所占用栅格数。|
|maskRect|[Rectangle](./cj-common-types.md#class-rectangle>)|否|Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)| **命名参数。**  弹窗遮蔽层区域，在遮蔽层区域内的事件不透传，在遮蔽层区域外的事件透传。<br/>**说明：**<br/>showInSubWindow为true时，maskRect不生效。 |
|showInSubWindow|Bool|否|false| **命名参数。**  某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。<br/>初始值：false，弹窗显示在应用内，而非独立子窗口。<br/>**说明**：showInSubWindow为true的弹窗无法触发显示另一个showInSubWindow为true的弹窗。 |
|isModal|Bool|否|true| **命名参数。**  弹窗是否为模态窗口。模态窗口有蒙层，非模态窗口无蒙层。<br/>初始值：true，此时弹窗有蒙层。 |
|backgroundColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Transparent| **命名参数。**  弹窗背板颜色。<br/>**说明：** <br/>当设置了backgroundColor为非透明色时，backgroundBlurStyle需要设置为BlurStyle.NONE，否则颜色显示将不符合预期效果。 |
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick| **命名参数。**  弹窗背板模糊材质。<br/>**说明：** <br/>设置为BlurStyle.NONE即可关闭背景虚化。当设置了backgroundBlurStyle为非NONE值时，则不要设置backgroundColor，否则颜色显示将不符合预期效果。 |
|onWillDismiss|?Callback\<DismissDialogAction,Unit>|否|None| **命名参数。**  交互式关闭回调函数。<br/>**说明：**<br/>1.当用户执行点击遮障层关闭、左滑/右滑、三键back、键盘ESC关闭交互操作时，如果注册该回调函数，则不会立刻关闭弹窗。在回调函数中可以通过reason得到阻拦关闭弹窗的操作类型，从而根据原因选择是否能关闭弹窗。当前组件返回的reason中，暂不支持CLOSE_BUTTON的枚举值。<br/>2.在onWillDismiss回调中，不能再做onWillDismiss拦截。 |
|cornerRadius|[BorderRadiuses](./cj-common-types.md#class-borderradiuses)|否|BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp)| **命名参数。**  设置背板的圆角半径。<br />可分别设置4个圆角的半径。<br /> 圆角大小受组件尺寸限制，最大值为组件宽或高的一半，若值为负，则按照默认值处理。 <br /> 百分比参数方式：以父元素弹窗宽和高的百分比来设置弹窗的圆角。<br/>**说明：**<br/>当cornerRadius属性类型为LocalizedBorderRadiuses时，支持随语言习惯改变布局顺序。 |
|transition|?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)|否|None| **命名参数。**  设置弹窗显示和退出的过渡效果。<br/>**说明：**<br/> 1.如果不设置，则使用默认的显示/退出动效。<br/> 2.显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。<br/> 3.退出动效中按back键，不会打断退出动效，退出动效继续执行，继续按back键退出应用。 |
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。**  设置弹窗背板的宽度。<br />**说明：**<br>- 弹窗宽度默认最大值：None。<br />- 百分比参数方式：弹窗参考宽度为所在窗口的宽度，在此基础上调小或调大。 |
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。**  设置弹窗背板的高度。<br />**说明：**<br />- 弹窗高度默认最大值：None。<br />- 百分比参数方式：弹窗参考高度为（窗口高度 - 安全区域），在此基础上调小或调大。 |
|borderWidth|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0| **命名参数。**  可分别设置4个边框宽度。<br /> 百分比参数方式：以父元素弹窗宽的百分比来设置弹窗的边框宽度。<br />当弹窗左边框和右边框大于弹窗宽度，弹窗上边框和下边框大于弹窗高度，显示可能不符合预期。<br/>**说明：**<br/>当borderWidth属性类型为LocalizedEdgeWidths时，支持随语言习惯改变布局顺序。 |
|borderColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black| **命名参数。**  设置弹窗背板的边框颜色。<br/> 如果使用borderColor属性，需要和borderWidth属性一起使用。<br/>**说明：**<br/>当borderColor属性类型为LocalizedEdgeColors时，支持随语言习惯改变布局顺序。 |
|borderStyle|[EdgeStyles](./cj-common-types.md#class-edgestyles)|否|EdgeStyles()| **命名参数。**  设置弹窗背板的边框样式。<br/>如果使用borderStyle属性，需要和borderWidth属性一起使用。 |
|textStyle|WordBreak|否|WordBreak.BreakAll| **命名参数。**  设置弹窗message内容的文本样式。 |
|confirm|[AlertDialogButtonBaseOptions](#class-alertdialogbuttonbaseoptions)|否|AlertDialogButtonOptions(value: "", action: { => })| **命名参数。**  设置确认Button的使能状态、默认焦点、按钮风格、文本内容、文本色、按钮背景色和点击回调。 |

### class AlertDialogParamWithOptions

```cangjie
public class AlertDialogParamWithOptions <: AlertDialogParam {
    public var buttons: Array<AlertDialogButtonOptions>
    public var buttonDirection: DialogButtonDirection
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
        buttons!: Array<AlertDialogButtonOptions>,
        buttonDirection!: DialogButtonDirection = DialogButtonDirection.Auto
    )
}
```

**功能：** 定义了包含多个按钮的警告弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [AlertDialogParam](#class-alertdialogparam)

#### var buttonDirection

```cangjie
public var buttonDirection: DialogButtonDirection
```

**功能：** 按钮排布方向默认值为DialogButtonDirection.AUTO，建议3个以上按钮使用Auto模式（两个以上按钮会切换为纵向模式，通常能显示更多按钮），非Auto模式下，3个以上按钮可能会显示不全，超出显示范围的按钮会被截断。

**类型：** [DialogButtonDirection](#enum-dialogbuttondirection)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var buttons

```cangjie
public var buttons: Array<AlertDialogButtonOptions>
```

**功能：** 弹窗容器中的多个按钮。

**类型：** Array\<[AlertDialogButtonOptions](#class-alertdialogbuttonoptions)>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(ResourceStr, ResourceStr, ResourceStr, Bool, VoidCallback, DialogAlignment, Offset, UInt32, Rectangle, Bool, Bool, ResourceColor, BlurStyle, ?Callback\<DismissDialogAction,Unit>, BorderRadiuses, ?TransitionEffect, ?Length, ?Length, Length, ResourceColor, EdgeStyles, WordBreak, Array\<AlertDialogButtonOptions>, DialogButtonDirection)

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
    buttons!: Array<AlertDialogButtonOptions>,
    buttonDirection!: DialogButtonDirection = DialogButtonDirection.Auto
)
```

**功能：** 定义了包含多个按钮的警告弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|title|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。**  弹窗标题。 |
|subtitle|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。**  弹窗副标题。 |
|message|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-| 弹窗内容。 |
|autoCancel|Bool|否|true| **命名参数。**  点击遮障层时是否关闭弹窗。true表示关闭弹窗,false表示不关闭弹窗。 |
|cancel|VoidCallback|否|{ => }| **命名参数。**  点击遮障层关闭dialog时的回调。 |
|alignment|DialogAlignment|否|DialogAlignment.Default| **命名参数。**  弹窗在竖直方向上的对齐方式。|
|offset|Offset|否|Offset(0, 0)| **命名参数。**  弹窗相对alignment所在位置的偏移量。|
|gridCount|UInt32|否|4| **命名参数。**  弹窗容器宽度所占用栅格数。|
|maskRect|[Rectangle](./cj-common-types.md#class-rectangle>)|否|Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)| **命名参数。**  弹窗遮蔽层区域，在遮蔽层区域内的事件不透传，在遮蔽层区域外的事件透传。<br/>**说明：**<br/>showInSubWindow为true时，maskRect不生效。 |
|showInSubWindow|Bool|否|false| **命名参数。**  某弹框需要显示在主窗口之外时，是否在子窗口显示此弹窗。<br/>初始值：false，弹窗显示在应用内，而非独立子窗口。<br/>**说明**：showInSubWindow为true的弹窗无法触发显示另一个showInSubWindow为true的弹窗。 |
|isModal|Bool|否|true| **命名参数。**  弹窗是否为模态窗口。模态窗口有蒙层，非模态窗口无蒙层。<br/>初始值：true，此时弹窗有蒙层。 |
|backgroundColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Transparent| **命名参数。**  弹窗背板颜色。<br/>**说明：** <br/>当设置了backgroundColor为非透明色时，backgroundBlurStyle需要设置为BlurStyle.NONE，否则颜色显示将不符合预期效果。 |
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick| **命名参数。**  弹窗背板模糊材质。<br/>**说明：** <br/>设置为BlurStyle.NONE即可关闭背景虚化。当设置了backgroundBlurStyle为非NONE值时，则不要设置backgroundColor，否则颜色显示将不符合预期效果。 |
|onWillDismiss|?Callback\<DismissDialogAction,Unit>|否|None| **命名参数。**  交互式关闭回调函数。<br/>**说明：**<br/>1.当用户执行点击遮障层关闭、左滑/右滑、三键back、键盘ESC关闭交互操作时，如果注册该回调函数，则不会立刻关闭弹窗。在回调函数中可以通过reason得到阻拦关闭弹窗的操作类型，从而根据原因选择是否能关闭弹窗。当前组件返回的reason中，暂不支持CLOSE_BUTTON的枚举值。<br/>2.在onWillDismiss回调中，不能再做onWillDismiss拦截。 |
|cornerRadius|[BorderRadiuses](./cj-common-types.md#class-borderradiuses)|否|BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp)| **命名参数。**  设置背板的圆角半径。<br />可分别设置4个圆角的半径。<br /> 圆角大小受组件尺寸限制，最大值为组件宽或高的一半，若值为负，则按照默认值处理。 <br /> 百分比参数方式：以父元素弹窗宽和高的百分比来设置弹窗的圆角。<br/>**说明：**<br/>当cornerRadius属性类型为LocalizedBorderRadiuses时，支持随语言习惯改变布局顺序。 |
|transition|?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)|否|None| **命名参数。**  设置弹窗显示和退出的过渡效果。<br/>**说明：**<br/> 1.如果不设置，则使用默认的显示/退出动效。<br/> 2.显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。<br/> 3.退出动效中按back键，不会打断退出动效，退出动效继续执行，继续按back键退出应用。 |
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。**  设置弹窗背板的宽度。<br />**说明：**<br>- 弹窗宽度默认最大值：None。<br />- 百分比参数方式：弹窗参考宽度为所在窗口的宽度，在此基础上调小或调大。 |
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。**  设置弹窗背板的高度。<br />**说明：**<br />- 弹窗高度默认最大值：None。<br />- 百分比参数方式：弹窗参考高度为（窗口高度 - 安全区域），在此基础上调小或调大。 |
|borderWidth|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0| **命名参数。**  可分别设置4个边框宽度。<br /> 百分比参数方式：以父元素弹窗宽的百分比来设置弹窗的边框宽度。<br />当弹窗左边框和右边框大于弹窗宽度，弹窗上边框和下边框大于弹窗高度，显示可能不符合预期。<br/>**说明：**<br/>当borderWidth属性类型为LocalizedEdgeWidths时，支持随语言习惯改变布局顺序。 |
|borderColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black| **命名参数。**  设置弹窗背板的边框颜色。<br/> 如果使用borderColor属性，需要和borderWidth属性一起使用。<br/>**说明：**<br/>当borderColor属性类型为LocalizedEdgeColors时，支持随语言习惯改变布局顺序。 |
|borderStyle|[EdgeStyles](./cj-common-types.md#class-edgestyles)|否|EdgeStyles()| **命名参数。**  设置弹窗背板的边框样式。<br/>如果使用borderStyle属性，需要和borderWidth属性一起使用。 |
|textStyle|WordBreak|否|WordBreak.BreakAll| **命名参数。**  设置弹窗message内容的文本样式。 |
|buttons|Array\<[AlertDialogButtonOptions](#class-alertdialogbuttonoptions)>|是|-| **命名参数。**  弹窗容器中的多个按钮。 |
|buttonDirection|[DialogButtonDirection](#enum-dialogbuttondirection)|否|DialogButtonDirection.Auto| **命名参数。**  按钮排布方向默认值为DialogButtonDirection.AUTO，建议3个以上按钮使用Auto模式（两个以上按钮会切换为纵向模式，通常能显示更多按钮），非Auto模式下，3个以上按钮可能会显示不全，超出显示范围的按钮会被截断。 |

### enum DialogButtonDirection

```cangjie
public enum DialogButtonDirection {
    | Auto
    | Horizontal
    | Vertical
    | ...
}
```

**功能：** 警告弹窗中按钮排列方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Auto

```cangjie
Auto
```

**功能：** 两个及以下按钮水平排布，两个以上为竖直排布。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Horizontal

```cangjie
Horizontal
```

**功能：** 按钮水平布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Vertical

```cangjie
Vertical
```

**功能：** 按钮竖直布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

### 示例1（弹出多个按钮的弹窗）

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    func build() {
        Column(space:5.vp) {
            Button("one button dialog")
                .onClick({ evt =>
                        AlertDialogParamWithConfirm(message:"text",
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
                                action: {=> Hilog.info(0, "AppLogCj", "Button-clicking callback")}))
                })
            .backgroundColor(0x317aff)
            Button("two button dialog")
                .onClick({ evt =>
                        AlertDialogParamWithButtons(message: "text",
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
                                style: DialogButtonStyle.Highlight, value: "OK",
                                action: {=> Hilog.info(0, "AppLogCj", "Callback when second button is clicked")}))
                })
            .backgroundColor(0x317aff)
            Button("three button dialog")
                .onClick({ evt =>
                        AlertDialogParamWithOptions(
                            message: "text",
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
                                AlertDialogButtonOptions(value: "按钮",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")}),
                                AlertDialogButtonOptions(value: "按钮",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")}),
                                AlertDialogButtonOptions(value: "按钮",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")})
                            ]
                        )
                })
                .backgroundColor(0x317aff)
        }
    }
}
```

!alertdialog1

### 示例2（可在主窗外弹出的弹窗）

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    func build() {
        Column(space: 5.vp) {
            Button("button dialog")
                .onClick({ evt =>
                        AlertDialogParamWithOptions(
                            message: "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            cancel: {=> Hilog.info(0, "AppLogCj", "Closed callbacks")},
                            alignment: DialogAlignment.Center,
                            offset: Offset(0, -20),
                            showInSubWindow: true,
                            buttonDirection: DialogButtonDirection.Horizontal,
                            gridCount: 4,
                            onWillDismiss: {
                                dismissDialogAction: DismissDialogAction => match (dismissDialogAction.reason) {
                                    case PRESS_BACK => dismissDialogAction.dismiss()
                                    case TOUCH_OUTSIDE => dismissDialogAction.dismiss()
                                    case _ => ()
                                }
                            },
                            buttons: [
                                AlertDialogButtonOptions(value: "按钮",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")}),
                                AlertDialogButtonOptions(value: "按钮",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")}),
                                AlertDialogButtonOptions(value: "按钮",
                                    action: {=> Hilog.info(0, "AppLogCj", "Callback when button1 is clicked")})
                            ]
                        )
                })
                .backgroundColor(0x317aff)
        }
    }
}

```

!alertdialog2
