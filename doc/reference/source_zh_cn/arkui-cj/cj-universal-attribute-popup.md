# Popup控制

给组件绑定popup弹窗，并设置弹窗内容，交互逻辑和显示状态。

> **说明：**
>
> popup弹窗的显示状态在onStateChange事件回调中反馈，其显隐与组件的创建或销毁无强对应关系。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func bindPopup(Bool, CustomPopupOptions)

```cangjie
public func bindPopup(show: Bool, popup: CustomPopupOptions): This
```

**功能：** 绑定自定义弹出框。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|show|Bool|是|-|是否显示。|
|popup|[CustomPopupOptions](#class-custompopupoptions)|是|-|自定义弹出框选项。|

## func bindPopup(Bool, PopupOptions)

```cangjie
public func bindPopup(show: Bool, popup: PopupOptions): This
```

**功能：** 绑定弹出框。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|show|Bool|是|-|是否显示。|
|popup|[PopupOptions](#class-popupoptions)|是|-|弹出框选项。|

## 基础类型定义

### class CustomPopupOptions

```cangjie
public class CustomPopupOptions {
    public var builder: CustomBuilder = { => }
    public var placement: Placement = Placement.Bottom
    public var maskColor: ResourceColor = Color(0x1000000)
    public var backgroundColor: Color = Color(0x1000000)
    public var enableArrow: Bool = true
    public var autoCancel: Bool = true
    public var onStateChange: Option <(PopupStateChangeParam) -> Unit>= Option.None
    public var popupColor:?Color = None
    public var arrowOffset: Length = 0.vp
    public var showInSubWindow: Bool = false
    public var mask:?Color = None
    public var targetSpace: Length = 0.vp
    public var offset: Position = Position(x: 0.0, y: 0.0)
    public var width: Length = 0.vp
    public var arrowPointPosition: Option<ArrowPointPosition>= None
    public var arrowWidth: Length = 16.vp
    public var arrowHeight: Length = 8.vp
    public var radius: Length = 20.vp
    public var shadow: ShadowStyle = ShadowStyle.OuterDefaultMD
    public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
    public var focusable: Bool = false
    public var transition: Option<TransitionEffect>= Option.None
    public var onWillDismiss: Option <(DismissPopupAction) -> Unit>= None
    public var followTransformOfTarget: Bool = false
    public init(
        builder!: () -> Unit,
        placement!: Placement = Placement.Bottom,
        maskColor!: Color = Color(0x1000000),
        popupColor!: Color = Color(0x1000000),
        enableArrow!: Bool = true,
        autoCancel!: Bool = true,
        onStateChange!: Option<(PopupStateChangeParam) -> Unit> = Option.None,
        showInSubWindow!: Bool, // 5.1 start
        backgroundColor!: Color = Color(0x1000000),
        arrowOffset!: Length = 0.vp,
        mask!: ?Color = None,
        targetSpace!: Length = 0.vp,
        offset!: Position = Position(x: 0.0, y: 0.0),
        width!: Length = 0.vp,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: Length = 16.vp,
        arrowHeight!: Length = 16.vp,
        radius!: Length = 20.vp,
        shadow!: ShadowStyle = ShadowStyle.OuterDefaultMD,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        focusable!: Bool = false,
        transition!: Option<TransitionEffect> = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: Bool = false
    )
}
```

**功能：** 弹出弹窗的参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowHeight

```cangjie
public var arrowHeight: Length = 8.vp
```

**功能：** 设置箭头高度。默认值：8.vp。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**功能：**  设置popup箭头在弹窗处的偏移。箭头在气泡上下方时，数值为0表示箭头居最左侧，偏移量为箭头至最左侧的距离，默认居中。箭头在气泡左右侧时，偏移量为箭头至最上侧的距离，默认居中。如果显示在屏幕边缘，气泡会自动左右偏移，数值为0时箭头始终指向绑定组件。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowPointPosition

```cangjie
public var arrowPointPosition: Option<ArrowPointPosition>= None
```

**功能：** 设置气泡尖角相对于父组件显示位置，气泡尖角在垂直和水平方向上有 "Start"、"Center"、"End"三个位置点可选。以上所有位置点均位于父组件区域所在的范围内，不会超出父组件的边界范围。

**类型：** [ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowWidth

```cangjie
public var arrowWidth: Length = 16.vp
```

**功能：**设置箭头宽度。若所设置的箭头宽度超过所在边的长度减去两倍的气泡圆角大小，则不绘制气泡箭头。默认值：16.vp。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var autoCancel

```cangjie
public var autoCancel: Bool = true
```

**功能：** 页面有操作时，是否自动关闭气泡。默认值：true。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
```

**功能：** 设置气泡模糊背景参数。默认值：BlurStyle.COMPONENT_ULTRA_THICK。

**类型：** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var backgroundColor

```cangjie
public var backgroundColor: Color = Color(0x1000000)
```

**功能：** 设置提示气泡背景颜色。

**类型：** [Color](cj-common-types.md#class-color)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var builder

```cangjie
public var builder: CustomBuilder = { => }
```

**功能：** 提示气泡内容的构造器。

> **说明：**
>
> popup为通用属性，自定义popup中不支持再次弹出popup。对builder下的第一层容器组件不支持使用position属性，如果使用将导致气泡不显示。builder中若使用自定义组件，自定义组件的aboutToAppear和aboutToDisappear生命周期与popup弹窗的显隐无关，不能使用其生命周期判断popup弹窗的显隐。

**类型：** [CustomBuilder](./cj-common-types.md#type-custombuilder)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var enableArrow

```cangjie
public var enableArrow: Bool = true
```

**功能：** 设置是否显示箭头。如果箭头所在方位侧的气泡长度不足以显示下箭头，则会默认不显示箭头。例如placement设置为Left，此时如果气泡高度小于箭头的宽度（32.vp）与气泡圆角两倍（48.vp）之和（80.vp），则实际不会显示箭头。默认值：true。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var focusable

```cangjie
public var focusable: Bool = false
```

**功能：** 设置气泡弹出后是否获焦。默认值：false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var followTransformOfTarget

```cangjie
public var followTransformOfTarget: Bool = false
```

**功能：** 气泡绑定的宿主组件或其宿主组件的父容器添加了旋转、缩放等变换时，气泡是否能显示在对应变化后的位置上。默认值：false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var mask

```cangjie
public var mask:?Color = None
```

**功能：** 设置遮罩层的颜色。

**类型：** ?[Color](cj-common-types.md#class-color)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var maskColor

```cangjie
public var maskColor: ResourceColor = Color(0x1000000)
```

**功能：** 设置气泡遮罩层颜色。

**类型：** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offset

```cangjie
public var offset: Position = Position(x: 0.0, y: 0.0)
```

**功能：** 设置popup组件相对于placement设置的显示位置的偏移。不支持设置百分比。

**类型：** [Position](cj-common-types.md#class-position)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onStateChange

```cangjie
public var onStateChange: Option <(PopupStateChangeParam) -> Unit>= Option.None
```

**功能：** 设置弹窗状态变化事件回调，参数为弹窗当前的显示状态。

**类型：** ([PopupStateChangeParam](./cj-common-types.md#class-popupstatechangeparam))->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onWillDismiss

```cangjie
public var onWillDismiss: Option <(DismissPopupAction) -> Unit>= None
```

**功能：** 设置popup交互式关闭拦截开关及拦截回调函数。

> **说明：**
>
> 在onWillDismiss回调中，不能再做onWillDismiss拦截。

**类型：** ([DismissPopupAction](#class-dismisspopupaction))->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var placement

```cangjie
public var placement: Placement = Placement.Bottom
```

**功能：** 设置气泡组件优先显示的位置，当前位置显示不下时，会自动调整位置。默认值：Placement.Bottom。

**类型：** [Placement](cj-common-types.md#enum-placement)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var popupColor

```cangjie
public var popupColor:?Color = None
```

**功能：** 设置提示气泡的颜色。如需去除模糊背景填充效果，需将backgroundBlurStyle设置为BlurStyle.NONE。

**类型：** ?[Color](cj-common-types.md#class-color)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var radius

```cangjie
public var radius: Length = 20.vp
```

**功能：** 设置气泡圆角半径。默认值：20.vp。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var shadow

```cangjie
public var shadow: ShadowStyle = ShadowStyle.OuterDefaultMD
```

**功能：** 设置气泡阴影。默认值：ShadowStyle.OUTER_DEFAULT_MD。

**类型：** [ShadowStyle](cj-common-types.md#enum-shadowstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool = false
```

**功能：** 设置是否在子窗口显示气泡，默认值为false，不显示。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var targetSpace

```cangjie
public var targetSpace: Length = 0.vp
```

**功能：** 设置popup与目标的间隙。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var transition

```cangjie
public var transition: Option<TransitionEffect> = Option.None
```

**功能：** 自定义设置popup弹窗显示和退出的动画效果。

> **说明：**
>
> - 如果不设置，则使用默认的显示/退出动效。
> - 显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。
> - 退出动效中按back键，不会打断退出动效，退出动效继续执行，back键不被响应。

**类型：** [TransitionEffect](./cj-animation-transition.md#class-transitioneffect)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var width

```cangjie
public var width: Length = 0.vp
```

**功能：** 设置弹窗宽度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(() -> Unit, Placement, Color, Color, Bool, Bool, Option\<(PopupStateChangeParam) -> Unit>, Bool, Color, Length, ?Color, Length, Position, Length, ?ArrowPointPosition, Length, Length, Length, ShadowStyle, BlurStyle, Bool, Option\<TransitionEffect>, Option\<(DismissPopupAction) -> Unit>, Bool)

```cangjie
public init(
    builder!: () -> Unit,
    placement!: Placement = Placement.Bottom,
    maskColor!: Color = Color(0x1000000),
    popupColor!: Color = Color(0x1000000),
    enableArrow!: Bool = true,
    autoCancel!: Bool = true,
    onStateChange!: Option<(PopupStateChangeParam) -> Unit> = Option.None,
    showInSubWindow!: Bool=false, // 5.1 start
    backgroundColor!: Color = Color(0x1000000),
    arrowOffset!: Length = 0.vp,
    mask!: ?Color = None,
    targetSpace!: Length = 0.vp,
    offset!: Position = Position(x: 0.0, y: 0.0),
    width!: Length = 0.vp,
    arrowPointPosition!: ?ArrowPointPosition = None,
    arrowWidth!: Length = 16.vp,
    arrowHeight!: Length = 16.vp,
    radius!: Length = 20.vp,
    shadow!: ShadowStyle = ShadowStyle.OuterDefaultMD,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
    focusable!: Bool = false,
    transition!: Option<TransitionEffect> = Option.None,
    onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
    followTransformOfTarget!: Bool = false
)
```

**功能：** 创建CustomPopupOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|()->Unit|是|-|**命名参数。**  提示气泡内容的构造器。使用时结合[@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|
|placement|[Placement](cj-common-types.md#enum-placement)|否|Placement.Bottom|**命名参数。**  气泡组件优先显示的位置。<br>**说明：** 当前位置显示不下时，会自动调整位置。|
|maskColor| [Color](./cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**   提示气泡遮障层的颜色。 |
|popupColor| [Color](cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**  提示气泡的背景颜色。 |
|enableArrow| Bool | 否 | true | **命名参数。**  是否显示箭头。<br>**说明：** 如果箭头所在方位侧的气泡长度不足以显示下箭头，则会默认不显示箭头。比如：placement设置为Left，但气泡高度小于箭头的宽度（32vp），则实际不会显示箭头。 |
|autoCancel| Bool | 否 | true | **命名参数。**  页面有操作时，是否自动关闭气泡。 |
|onStateChange | Option<(PopupStateChangeParam) -> Unit> | 否 | Option.None | **命名参数。**  弹窗状态变化事件回调，参数为弹窗当前的显示状态。|
|showInSubWindow|Bool|否|false| **命名参数。**  是否在子窗口显示气泡。|
|backgroundColor| [Color](cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**  提示气泡的背景颜色。 |
|arrowOffset|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。**  popup箭头在弹窗处的偏移。<br>**说明：** 箭头在气泡上下方时，数值为0表示箭头居最左侧，偏移量为箭头至最左侧的距离，默认居中。箭头在气泡左右侧时，偏移量为箭头至最上侧的距离，默认居中。如果显示在屏幕边缘，气泡会自动左右偏移，数值为0时箭头始终指向绑定组件。|
|mask|?[Color](cj-common-types.md#class-color)|否|None|**命名参数。**   提示气泡遮障层的颜色。|
|targetSpace|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。**   设置popup与目标的间隙。|
|offset|[Position](cj-common-types.md#class-position)|否|Position(x: 0.0, y: 0.0)|**命名参数。**   popup组件相对于placement设置的显示位置的偏移。<br>**说明：** 不支持设置百分比。 |
|width|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。**   弹窗宽度。<br>**说明：**  showInSubWindow=true时最大高度为设备屏幕高度，showInSubWindow=false时最大高度为应用窗口高度。高度限定逻辑=最大高度-状态栏高度（没有时高度为0）-dock栏高度（没有时高度为0）-40VP-40VP。|
|arrowPointPosition|?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)|否|None|**命名参数。**   气泡尖角相对于父组件显示位置，气泡尖角在垂直和水平方向上有 ”Start“、”Center“、”End“三个位置点可选。以上所有位置点均位于父组件区域的范围内，不会超出父组件的边界范围。|
|arrowWidth|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。**  箭头宽度。<br>**说明：** 若所设置的箭头宽度超过所在边的长度减去两倍的气泡圆角大小，则不绘制气泡箭头。|
|arrowHeight|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。**  箭头高度。<br>**说明：** 不支持设置百分比。|
|radius|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|20.vp|**命名参数。**  气泡圆角半径。|
|shadow|[ShadowStyle](cj-common-types.md#enum-shadowstyle)|否|ShadowStyle.OuterDefaultMD|**命名参数。**  气泡阴影。|
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick|**命名参数。**  气泡模糊背景参数。|
|focusable|Bool|否|false|**命名参数。**   设置气泡弹出后是否获焦。|
|transition|Option<[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)>|否|Option.None|**命名参数。**   自定义popup弹窗显示和退出的动画效果。<br/>**说明：**<br/>1.如果不设置，则使用默认的显示/退出动效。<br/>2.显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。<br/>3.退出动效中按back键，不会打断退出动效，退出动效继续执行，back键不被响应。|
|onWillDismiss|Option<([DismissPopupAction](#class-dismisspopupaction))->Unit>|否|None|**命名参数。**   拦截退出事件且执行回调函数。<br>**说明：** 在onWillDismiss回调中，不能再做onWillDismiss拦截。|
|followTransformOfTarget|Bool|否|false|**命名参数。**   气泡绑定的宿主组件或其宿主组件的父容器添加了旋转、缩放等变换时，气泡是否能显示在对应变化后的位置上。|

### class DismissPopupAction

```cangjie
public class DismissPopupAction {
    public let reason: DismissReason
}
```

**功能：** 设置popup交互式关闭拦截开关及拦截回调函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### let reason

```cangjie
public let reason: DismissReason
```

**功能：** 关闭原因，返回本次拦截popup消失的事件原因。

**类型：** [DismissReason](./cj-dialog-actionsheet.md#enum-dismissreason)

**读写能力：** 只读

## func dismiss()

```cangjie
public func dismiss(): Unit
```

**功能：** popup交互式关闭拦截开关及拦截结果类型。开发者需要退出时调用，不需要退出时无需调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### class PopupMessageOptions

```cangjie
public class PopupMessageOptions {
    public var textColor: ResourceColor
    public var font: Font
    public init(textColor!: ResourceColor = Color(0x000000), font!: Font = Font())
}
```

**功能：** 弹窗信息文本参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var font

```cangjie
public var font: Font
```

**功能：** 设置弹窗信息字体属性。不支持设置family。

**类型：** [Font](cj-common-types.md#class-font)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var textColor

```cangjie
public var textColor: ResourceColor
```

**功能：** 设置弹窗信息文本颜色。

**类型：** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(ResourceColor, Font)

```cangjie
public init(textColor!: ResourceColor = Color(0x000000), font!: Font = Font())
```

**功能：** 创建一个PopupMessageOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|textColor|[ResourceColor](cj-common-types.md#interface-resourcecolor)|否|Color(0x000000)|弹窗信息文本颜色。|
|font|[Font](cj-common-types.md#class-font)|否|Font()|弹窗信息字体属性。|

### class PopupOptions

```cangjie
public class PopupOptions {
    public var message: String = ""
    public var primaryButton: PopupButton = PopupButton(value: "", action: { => })
    public var secondaryButton: PopupButton = PopupButton(value: "", action: { => })
    public var onStateChange:?(PopupStateChangeParam) -> Unit = Option.None
    public var messageOptions: PopupMessageOptions = PopupMessageOptions()
    public var arrowOffset: Length = 0.vp
    public var showInSubWindow: Bool = false
    public var mask: ResourceColor = Color(0x1000000)
    public var targetSpace: Length = 0.vp
    public var placement: Placement = Placement.BottomLeft
    public var offset: Position = Position(x: 0.0, y: 0.0)
    public var enableArrow: Bool = true
    public var popupColor: ResourceColor = Color(0x1000000)
    public var autoCancel: Bool = true
    public var width: Length = 0.vp
    public var arrowPointPosition: Option<ArrowPointPosition>= None
    public var arrowWidth: Length = 16.0.vp
    public var arrowHeight: Length = 8.0.vp
    public var radius: Length = 20.0.vp
    public var shadow: ShadowStyle = ShadowStyle.OuterDefaultMD
    public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
    public var transition:?TransitionEffect = Option.None
    public var onWillDismiss:?(DismissPopupAction) -> Unit = None
    public var followTransformOfTarget: Bool = false
    public init(
        message!: String,
        primaryButton!: PopupButton = PopupButton(value: "", action: {=>}),
        secondaryButton!: PopupButton = PopupButton(value: "", action: {=>}),
        onStateChange!: Option<(PopupStateChangeParam) -> Unit> = Option.None,
        arrowOffset!: Length = 0.vp,
        showInSubWindow!: Bool,
        messageOptions!: PopupMessageOptions = PopupMessageOptions(),
        mask!: Color = Color(0x1000000),
        targetSpace!: Length = 0.vp,
        placement!: Placement = Placement.BottomLeft,
        offset!: Position = Position(x:0.0, y: 0.0),
        enableArrow!: Bool = true,
        popupColor!: Color = Color(0x1000000),
        autoCancel!: Bool = true,
        width!: Length = 0.vp,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: Length = 16.vp,
        arrowHeight!: Length = 8.vp,
        radius!: Length = 20.vp,
        shadow!: ShadowStyle = ShadowStyle.OuterDefaultMD,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        transition!: ?TransitionEffect = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: Bool = false
    )
}
```

**功能：** 弹窗的参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowHeight

```cangjie
public var arrowHeight: Length = 8.0.vp
```

**功能：** 设置箭头高度。默认值：8.vp。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**功能：** 设置popup箭头在弹窗处的偏移。箭头在气泡上下方时，数值为0表示箭头居最左侧，偏移量为箭头至最左侧的距离，默认居中。箭头在气泡左右侧时，偏移量为箭头至最上侧的距离，默认居中。如果显示在屏幕边缘，气泡会自动左右偏移，数值为0时箭头始终指向绑定组件。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowPointPosition

```cangjie
public var arrowPointPosition: Option<ArrowPointPosition>= None
```

**功能：** 设置气泡尖角相对于父组件显示位置，气泡尖角在垂直和水平方向上有 "Start"、"Center"、"End"三个位置点可选。以上所有位置点均位于父组件区域所在的范围内，不会超出父组件的边界范围。

**类型：** [ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowWidth

```cangjie
public var arrowWidth: Length = 16.0.vp
```

**功能：** 设置箭头宽度。若所设置的箭头宽度超过所在边的长度减去两倍的气泡圆角大小，则不绘制气泡箭头。默认值：16.vp。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var autoCancel

```cangjie
public var autoCancel: Bool = true
```

**功能：** 页面有操作时，设置是否自动关闭气泡。默认值：true。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
```

**功能：** 设置气泡模糊背景参数。默认值：BlurStyle.COMPONENT_ULTRA_THICK。

**类型：** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var enableArrow

```cangjie
public var enableArrow: Bool = true
```

**功能：** 设置是否显示箭头。默认值：true。当页面可用空间无法让气泡完全避让时，气泡会覆盖到组件上并且不显示箭头。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var followTransformOfTarget

```cangjie
public var followTransformOfTarget: Bool = false
```

**功能：** 气泡绑定的宿主组件或其宿主组件的父容器添加了旋转、缩放等变换时，设置气泡是否能显示在对应变化后的位置上。默认值：false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var mask

```cangjie
public var mask: ResourceColor = Color(0x1000000)
```

**功能：** 设置遮罩层的颜色。

**类型：** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var message

```cangjie
public var message: String = ""
```

**功能：** 设置弹窗信息内容。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var messageOptions

```cangjie
public var messageOptions: PopupMessageOptions = PopupMessageOptions()
```

**功能：** 设置弹窗信息文本参数。

**类型：** [PopupMessageOptions](#class-popupmessageoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offset

```cangjie
public var offset: Position = Position(x: 0.0, y: 0.0)
```

**功能：** 设置popup组件相对于placement设置的显示位置的偏移。不支持设置百分比。

**类型：** [Position](cj-common-types.md#class-position)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onStateChange

```cangjie
public var onStateChange:?(PopupStateChangeParam) -> Unit = Option.None
```

**功能：** 设置弹窗状态变化事件回调，参数为弹窗当前的显示状态。

**类型：** ?([PopupStateChangeParam](./cj-common-types.md#class-popupstatechangeparam))->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onWillDismiss

```cangjie
public var onWillDismiss:?(DismissPopupAction) -> Unit = None
```

**功能：** 设置拦截退出事件且执行回调函数。

> **说明：**
>
> 在onWillDismiss回调中，不能再做onWillDismiss拦截。

**类型：** ?([DismissPopupAction](#class-dismisspopupaction))->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var placement

```cangjie
public var placement: Placement = Placement.BottomLeft
```

**功能：** 设置popup组件相对于目标的显示位置，默认值为Placement.Bottom。如果同时设置了placementOnTop和placement，则以placement的设置生效。

**类型：** [Placement](cj-common-types.md#enum-placement)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var popupColor

```cangjie
public var popupColor: ResourceColor = Color(0x1000000)
```

**功能：** 设置提示气泡的颜色。如需去除模糊背景填充效果，需将backgroundBlurStyle设置为BlurStyle.NONE。

**类型：** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var primaryButton

```cangjie
public var primaryButton: PopupButton = PopupButton(value: "", action: { => })
```

**功能：** 设置第一个按钮。value: 弹窗里主按钮的文本。action: 点击主按钮的回调函数。

**类型：** [PopupButton](./cj-common-types.md#class-popupbutton)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var radius

```cangjie
public var radius: Length = 20.0.vp
```

**功能：** 设置气泡圆角半径。默认值：20.vp。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var secondaryButton

```cangjie
public var secondaryButton: PopupButton = PopupButton(value: "", action: { => })
```

**功能：** 设置第二个按钮。 value: 弹窗里辅助按钮的文本。action: 点击辅助按钮的回调函数。

**类型：** [PopupButton](./cj-common-types.md#class-popupbutton)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var shadow

```cangjie
public var shadow: ShadowStyle = ShadowStyle.OuterDefaultMD
```

**功能：** 设置气泡阴影。默认值：ShadowStyle.OUTER_DEFAULT_MD。

**类型：** [ShadowStyle](cj-common-types.md#enum-shadowstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool = false
```

**功能：** 设置是否在子窗口显示气泡，默认值为false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var targetSpace

```cangjie
public var targetSpace: Length = 0.vp
```

**功能：** 设置popup与目标的间隙。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var transition

```cangjie
public var transition:?TransitionEffect = Option.None
```

**功能：** 自定义设置popup弹窗显示和退出的动画效果。

> **说明：**
>
> - 如果不设置，则使用默认的显示/退出动效。
> - 显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。
> - 退出动效中按back键，不会打断退出动效，退出动效继续执行，back键不被响应。

**类型：** ?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var width

```cangjie
public var width: Length = 0.vp
```

**功能：** 设置弹窗宽度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(String, PopupButton, PopupButton, Option\<(PopupStateChangeParam) -> Unit>, Length, Bool, PopupMessageOptions, Color, Length, Placement, Position, Bool, Color, Bool, Length, ?ArrowPointPosition, Length, Length, Length, ShadowStyle, BlurStyle, ?TransitionEffect, Option\<(DismissPopupAction) -> Unit>, Bool)

```cangjie
public init(
    message!: String,
    primaryButton!: PopupButton = PopupButton(value: "", action: {=>}),
    secondaryButton!: PopupButton = PopupButton(value: "", action: {=>}),
    onStateChange!: Option<(PopupStateChangeParam) -> Unit> = Option.None,
    arrowOffset!: Length = 0.vp,
    showInSubWindow!: Bool,
    messageOptions!: PopupMessageOptions = PopupMessageOptions(),
    mask!: Color = Color(0x1000000),
    targetSpace!: Length = 0.vp,
    placement!: Placement = Placement.BottomLeft,
    offset!: Position = Position(x:0.0, y: 0.0),
    enableArrow!: Bool = true,
    popupColor!: Color = Color(0x1000000),
    autoCancel!: Bool = true,
    width!: Length = 0.vp,
    arrowPointPosition!: ?ArrowPointPosition = None,
    arrowWidth!: Length = 16.vp,
    arrowHeight!: Length = 8.vp,
    radius!: Length = 20.vp,
    shadow!: ShadowStyle = ShadowStyle.OuterDefaultMD,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
    transition!: ?TransitionEffect = Option.None,
    onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
    followTransformOfTarget!: Bool = false
)
```

**功能：** 弹窗的参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|message|String|是|-|设置弹窗信息内容|
|primaryButton|[PopupButton](./cj-common-types.md#class-popupbutton)|否|PopupButton(value: "", action: { => })|设置第一个按钮|
|secondaryButton|[PopupButton](./cj-common-types.md#class-popupbutton)|否|PopupButton(value: "", action: { => })|设置第二个按钮|
|onStateChange|Option<(PopupStateChangeParam) -> Unit>|否|Option.None|设置弹窗状态变化事件回调|
|arrowOffset|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|设置popup箭头在弹窗处的偏移|
|showInSubWindow|Bool|是|-|设置是否在子窗口显示气泡|
|messageOptions|[PopupMessageOptions](#class-popupmessageoptions)|否|PopupMessageOptions()|设置弹窗信息文本参数|
|mask|[Color](../BasicServicesKit/cj-apis-base.md#class-color)|否|Color(0x1000000)|设置遮罩层的颜色|
|targetSpace|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|设置popup与目标的间隙|
|placement|[Placement](cj-common-types.md#enum-placement)|否|Placement.BottomLeft|设置popup组件相对于目标的显示位置|
|offset|[Position](cj-common-types.md#class-position)|否|Position(x: 0.0, y: 0.0)|设置popup组件相对于placement设置的显示位置的偏移|
|enableArrow|Bool|否|true|设置是否显示箭头|
|popupColor|[Color](../BasicServicesKit/cj-apis-base.md#class-color)|否|Color(0x1000000)|设置提示气泡的颜色|
|autoCancel|Bool|否|true|页面有操作时，设置是否自动关闭气泡|
|width|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|设置弹窗宽度|
|arrowPointPosition|?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)|否|None|设置气泡尖角相对于父组件显示位置|
|arrowWidth|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|设置箭头宽度|
|arrowHeight|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|8.vp|设置箭头高度|
|radius|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|20.vp|设置气泡圆角半径|
|shadow|[ShadowStyle](cj-common-types.md#enum-shadowstyle)|否|ShadowStyle.OuterDefaultMD|设置气泡阴影|
|backgroundBlurStyle|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|否|BlurStyle.ComponentUltraThick|设置气泡模糊背景参数|
|transition|?[TransitionEffect](cj-animation-transition.md#class-transitioneffect)|否|Option.None|自定义设置popup弹窗显示和退出的动画效果|
|onWillDismiss|Option<(DismissPopupAction) -> Unit>|否|None|设置拦截退出事件且执行回调函数|
|followTransformOfTarget|Bool|否|false|气泡绑定的宿主组件或其宿主组件的父容器添加了旋转、缩放等变换时，设置气泡是否能显示在对应变化后的位置上|
