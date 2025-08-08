# Popup控制

给组件绑定popup弹窗，并设置弹窗内容，交互逻辑和显示状态。

> **说明：**
>
> popup弹窗的显示状态在onStateChange事件回调中反馈，其显隐与组件的创建或销毁无强对应关系。

## func bindPopup(Bool, CustomPopupOptions)

```cangjie
public func bindPopup(
    show!: Bool,
    popup!: CustomPopupOptions
)
```

**功能：** 给组件绑定Popup弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| show | Bool | 是 | - | **命名参数。**  弹窗显示状态。<br/>初始值：false，表示隐藏弹窗。popup弹窗必须等待页面全部构建完成才能展示，因此show不能在页面构建中设置为true，否则会导致popup弹窗显示位置及形状错误。|
| popup | [CustomPopupOptions](#class-custompopupoptions) | 是 | -  | **命名参数。**  配置当前弹窗提示的参数。 |

## func bindPopup(Bool, PopupOptions)

```cangjie
public func bindPopup(
    show!: Bool,
    popup!: PopupOptions
)
```

**功能：** 给组件绑定Popup弹窗。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| show | Bool | 是 | -| **命名参数。**  弹窗显示状态。<br/>初始值：false，表示隐藏弹窗。popup弹窗必须等待页面全部构建完成才能展示，因此show不能在页面构建中设置为true，否则会导致popup弹窗显示位置及形状错误。|
| popup | [PopupOptions](#class-popupoptions) | 是 | - | **命名参数。**  配置当前弹窗提示的参数。 |

## 基础类型定义

### class Action

```cangjie
public class Action {
    public Action(
        let value!: String,
        let action!: () -> Unit
    )
}
```

**功能：** 用于配置弹窗按钮参数的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### let value

```cangjie
let value: String
```

**功能：** 弹窗里主按钮的文本。

**类型：** String

**读写能力：** 只读

**起始版本：** 12

#### let action

```cangjie
let action: () -> Unit
```

**功能：** 点击辅助按钮的回调函数。

**类型：** () -> Unit

**读写能力：** 只读

**起始版本：** 12

#### Action(String, () -> Unit)

```cangjie
public Action(let value!: String, let action!: () -> Unit)
```

**功能：** 构建一个Action类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|  String | 是 | - | **命名参数。**  弹窗里主按钮的文本。 |
|action|  () -> Unit| 否 | None | **命名参数。**  点击辅助按钮的回调函数。 |

### class CustomPopupOptions

```cangjie
public class CustomPopupOptions {
    public var builder: () -> Unit = {=>}
    public var placement: Placement = Placement.Bottom
    public var maskColor: Color = Color(0x1000000)
    public var backgroundColor: Color = Color(0x1000000)
    public var enableArrow: Bool = true
    public var autoCancel: Bool = true
    public var onStateChange: Option<(StateChangeEvent) -> Unit> = Option.None
    public var popupColor: ?Color = None
    public var arrowOffset: Length = 0.vp
    public var showInSubWindow: Bool = false
    public var mask: ?Color = None
    public var targetSpace: Length = 0.vp
    public var offset: Position = Position(0.0, 0.0)
    public var width: Length = 0.vp
    public var arrowPointPosition: Option<ArrowPointPosition> = None
    public var arrowWidth: Length = 16.vp
    public var arrowHeight: Length = 8.vp
    public var radius: Length = 20.vp
    public var shadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD
    public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
    public var focusable: Bool = false
    public var transition: Option<TransitionEffect> = Option.None
    public var onWillDismiss: Option<(DismissPopupAction) -> Unit> = Noneic var followTransformOfTarget: Bool = false
    public init(
        builder!: () -> Unit,
        placement!: Placement = Placement.Bottom,
        maskColor!: Color = Color(0x1000000),
        popupColor!: Color = Color(0x1000000),
        enableArrow!: Bool = true,
        autoCancel!: Bool = true,
        onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None
    )
    public init(
        builder!: () -> Unit,
        placement!: Placement = Placement.Bottom,
        maskColor!: Color = Color(0x1000000),
        popupColor!: Color = Color(0x1000000),
        enableArrow!: Bool = true,
        autoCancel!: Bool = true,
        onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None,
        showInSubWindow!: Bool, // 5.1 start
        backgroundColor!: Color = Color(0x1000000),
        arrowOffset!: Length = 0.vp,
        mask!: ?Color = None,
        targetSpace!: Length = 0.vp,
        offset!: Position = Position(0.0, 0.0),
        width!: Length = 0.vp,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: Length = 16.vp,
        arrowHeight!: Length = 16.vp,
        radius!: Length = 20.vp,
        shadow!: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        focusable!: Bool = false,
        transition!: Option<TransitionEffect> = Option.None,
        onWillDismiss! : Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: Bool = false
    )
    public init() {}
}
```

**功能：** 弹出弹窗的参数。

**起始版本：** 12

#### var arrowHeight

```cangjie
public var arrowHeight: Length = 8.vp
```

**功能：** 设置箭头高度。默认值：8.vp。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**功能：** 设置popup箭头在弹窗处的偏移。箭头在气泡上下方时，数值为0表示箭头居最左侧，偏移量为箭头至最左侧的距离，默认居中。箭头在气泡左右侧时，偏移量为箭头至最上侧的距离，默认居中。如果显示在屏幕边缘，气泡会自动左右偏移，数值为0时箭头始终指向绑定组件。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var arrowPointPosition

```cangjie
public var arrowPointPosition: Option<ArrowPointPosition>= None
```

**功能：** 设置气泡尖角相对于父组件显示位置，气泡尖角在垂直和水平方向上有 "Start"、"Center"、"End"三个位置点可选。以上所有位置点均位于父组件区域所在的范围内，不会超出父组件的边界范围。

**类型：** ?[ArrowPointPosition](./cj-common-types.md#enum-arrowpointposition)

**读写能力：** 可读写

**起始版本：** 19

#### var arrowWidth

```cangjie
public var arrowWidth: Length = 16.vp
```

**功能：** 设置箭头宽度。若所设置的箭头宽度超过所在边的长度减去两倍的气泡圆角大小，则不绘制气泡箭头。默认值：16.vp。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var autoCancel

```cangjie
public var autoCancel: Bool = true
```

**功能：** 页面有操作时，是否自动关闭气泡。默认值：true。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 12

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
```

**功能：** 设置气泡模糊背景参数。默认值：BlurStyle.COMPONENT_ULTRA_THICK。

**类型：** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**读写能力：** 可读写

**起始版本：** 19

#### var backgroundColor

```cangjie
public var backgroundColor: Color = Color(0x1000000)
```

**功能：** 设置提示气泡背景颜色。

**类型：** [Color](./cj-common-types.md#class-color)

**读写能力：** 可读写

**起始版本：** 19

#### var builder

```cangjie
public var builder:() -> Unit
```

**功能：** 提示气泡内容的构造器。

> **说明：**
>
> popup为通用属性，自定义popup中不支持再次弹出popup。对builder下的第一层容器组件不支持使用position属性，如果使用将导致气泡不显示。builder中若使用自定义组件，自定义组件的aboutToAppear和aboutToDisappear生命周期与popup弹窗的显隐无关，不能使用其生命周期判断popup弹窗的显隐。

**类型：** ()->Unit

**读写能力：** 可读写

**起始版本：** 12

#### var enableArrow

```cangjie
public var enableArrow: Bool = true
```

**功能：** 设置是否显示箭头。如果箭头所在方位侧的气泡长度不足以显示下箭头，则会默认不显示箭头。例如placement设置为Left，此时如果气泡高度小于箭头的宽度（32.vp）与气泡圆角两倍（48.vp）之和（80.vp），则实际不会显示箭头。默认值：true。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 19

#### var focusable

```cangjie
public var focusable: Bool = false
```

**功能：** 设置气泡弹出后是否获焦。默认值：false。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 19

#### var followTransformOfTarget

```cangjie
public var followTransformOfTarget: Bool = false
```

**功能：** 气泡绑定的宿主组件或其宿主组件的父容器添加了旋转、缩放等变换时，气泡是否能显示在对应变化后的位置上。默认值：false。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 19

#### var mask

```cangjie
public var mask: Color = Color(0x1000000)
```

**功能：** 设置遮罩层的颜色。

**类型：** [Color](./cj-common-types.md#class-color)

**读写能力：** 可读写

**起始版本：** 19

#### var maskColor

```cangjie
public var maskColor: Color = Color(0x1000000)
```

**功能：** 设置气泡遮罩层颜色。

**类型：** [Color](./cj-common-types.md#class-color)

**读写能力：** 可读写

**起始版本：** 12

#### var offset

```cangjie
public var offset: Position = Position(0.0, 0.0)
```

**功能：** 设置popup组件相对于placement设置的显示位置的偏移。不支持设置百分比。

**类型：** [Position](./cj-common-types.md#class-position)

**读写能力：** 可读写

**起始版本：** 19

#### var onStateChange

```cangjie
public var onStateChange: Option <(StateChangeEvent) -> Unit>= Option.None
```

**功能：** 设置弹窗状态变化事件回调，参数为弹窗当前的显示状态。

**类型：** ?[StateChangeEvent](#class-statechangeevent)

**读写能力：** 可读写

**起始版本：** 12

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

**起始版本：** 19

#### var placement

```cangjie
public var placement: Placement = Placement.Bottom
```

**功能：** 设置气泡组件优先显示的位置，当前位置显示不下时，会自动调整位置。默认值：Placement.Bottom。

**类型：** [Placement](./cj-common-types.md#enum-placement)

**读写能力：** 可读写

**起始版本：** 12

#### var popupColor

```cangjie
public var popupColor: Color = Color(0x1000000)
```

**功能：** 设置提示气泡的颜色。如需去除模糊背景填充效果，需将backgroundBlurStyle设置为BlurStyle.NONE。

**类型：** [Color](./cj-common-types.md#class-color)

读写能力：可读写

**起始版本：** 12

#### var radius

```cangjie
public var radius: Length = 20.vp
```

**功能：** 设置气泡圆角半径。默认值：20.vp。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var shadow

```cangjie
public var shadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD
```

**功能：** 设置气泡阴影。默认值：ShadowStyle.OUTER_DEFAULT_MD。

**类型：** [ShadowStyle](cj-common-types.md#enum-shadowstyle)

**读写能力：** 可读写

**起始版本：** 19

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool = false
```

**功能：** 设置是否在子窗口显示气泡，默认值为false，不显示。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 19

#### var targetSpace

```cangjie
public var targetSpace: Length = 0.vp
```

**功能：** 设置popup与目标的间隙。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var transition

```cangjie
public var transition: Option<TransitionEffect>= Option.None
```

**功能：** 自定义设置popup弹窗显示和退出的动画效果。

**类型：** ?TransitionEffect

**读写能力：** 可读写

**起始版本：** 19

> **说明：**
>
> - 如果不设置，则使用默认的显示/退出动效。
> - 显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。
> - 退出动效中按back键，不会打断退出动效，退出动效继续执行，back键不被响应。

**读写能力：** 可读写

**起始版本：** 19

#### var width

```cangjie
public var width: Length = 0.vp
```

**功能：** 设置弹窗宽度。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

### init(() -> Unit, Placement, Color, Color, Bool, Bool, Option\<(StateChangeEvent) -> Unit>)

```cangjie
public init(
    builder!: () -> Unit,
    placement!: Placement = Placement.Bottom,
    maskColor!: Color = Color(0x1000000),
    popupColor!: Color = Color(0x1000000),
    enableArrow!: Bool = true,
    autoCancel!: Bool = true,
    onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None
)
```

**功能：** 创建CustomPopupOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| builder | ()->Unit | 是 |  - | **命名参数。**  提示气泡内容的构造器。使用时结合@Builder和bind方法使用。 |
| placement | [Placement](./cj-common-types.md#enum-placement) | 否 | Placement.Bottom | **命名参数。**  气泡组件优先显示的位置。<br>**说明：** 当前位置显示不下时，会自动调整位置。 |
| maskColor  | [Color](./cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**   提示气泡遮障层的颜色。 |
| popupColor | [Color](./cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**  提示气泡的颜色。 |
| arrowOffset | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  popup箭头在弹窗处的偏移。<br>**说明：** 箭头在气泡上下方时，数值为0表示箭头居最左侧，偏移量为箭头至最左侧的距离，默认居中。箭头在气泡左右侧时，偏移量为箭头至最上侧的距离，默认居中。如果显示在屏幕边缘，气泡会自动左右偏移，数值为0时箭头始终指向绑定组件。 |
| enableArrow | Bool | 否 | true | **命名参数。**  是否显示箭头。<br>**说明：** 如果箭头所在方位侧的气泡长度不足以显示下箭头，则会默认不显示箭头。比如：placement设置为Left，但气泡高度小于箭头的宽度（32vp），则实际不会显示箭头。 |
| autoCancel | Bool | 否 | true | **命名参数。**  页面有操作时，是否自动关闭气泡。 |
| onStateChange | ?([StateChangeEvent](#class-statechangeevent))->Unit | 否 | None | **命名参数。**  弹窗状态变化事件回调，参数为弹窗当前的显示状态。 |

#### init(() -> Unit, Placement, Color, Bool, Bool, Option\<(StateChangeEvent) -> Unit>, Length, Bool, Color, Color, Color, Length, Position, Length, ?ArrowPointPosition, Length, Length, Length, ShadowStyle, BlurStyle, Bool, ?TransitionEffect, ?(DismissPopupAction) -> Unit, Bool)

```cangjie
public init(
    builder!: () -> Unit,
    placement!: Placement = Placement.Bottom,
    maskColor!: Color = Color(0x1000000),
    popupColor!: Color = Color(0x1000000),
    enableArrow!: Bool = true,
    autoCancel!: Bool = true,
    onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None,
    showInSubWindow!: Bool, // 5.1 start
    backgroundColor!: Color = Color(0x1000000),
    arrowOffset!: Length = 0.vp,
    mask!: ?Color = None,
    targetSpace!: Length = 0.vp,
    offset!: Position = Position(0.0, 0.0),
    width!: Length = 0.vp,
    arrowPointPosition!: ?ArrowPointPosition = None,
    arrowWidth!: Length = 16.vp,
    arrowHeight!: Length = 16.vp,
    radius!: Length = 20.vp,
    shadow!: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD,
    backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
    focusable!: Bool = false,
    transition!: Option<TransitionEffect> = Option.None,
    onWillDismiss! : Option<(DismissPopupAction) -> Unit> = None,
    followTransformOfTarget!: Bool = false
)
```

**功能：** 创建CustomPopupOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| builder | ()->Unit | 是 |  - | **命名参数。**  提示气泡内容的构造器。使用时结合@Builder和bind方法使用。 |
| placement | [Placement](./cj-common-types.md#enum-placement) | 否 | Placement.Bottom | **命名参数。**  气泡组件优先显示的位置。<br>**说明：** 当前位置显示不下时，会自动调整位置。 |
| maskColor  | [Color](./cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**   提示气泡遮障层的颜色。 |
| backgroundColor | [Color](cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**  提示气泡的背景颜色。 |
| enableArrow | Bool | 否 | true | **命名参数。**  是否显示箭头。<br>**说明：** 如果箭头所在方位侧的气泡长度不足以显示下箭头，则会默认不显示箭头。比如：placement设置为Left，但气泡高度小于箭头的宽度（32vp），则实际不会显示箭头。 |
| autoCancel | Bool | 否 | true | **命名参数。**  页面有操作时，是否自动关闭气泡。 |
| onStateChange | ?([StateChangeEvent](#class-statechangeevent))->Unit | 否 | None | **命名参数。**  弹窗状态变化事件回调，参数为弹窗当前的显示状态。 |
| popupColor | [Color](./cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**  提示气泡的颜色。 |
| arrowOffset | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  popup箭头在弹窗处的偏移。<br>**说明：** 箭头在气泡上下方时，数值为0表示箭头居最左侧，偏移量为箭头至最左侧的距离，默认居中。箭头在气泡左右侧时，偏移量为箭头至最上侧的距离，默认居中。如果显示在屏幕边缘，气泡会自动左右偏移，数值为0时箭头始终指向绑定组件。 |
|  showInSubWindow| Bool | 否 | false | **命名参数。**  是否在子窗口显示气泡。 |
| mask  | [Color](./cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**   提示气泡遮障层的颜色。 |
| targetSpace  | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**   设置popup与目标的间隙。 |
| offset  | [Position](./cj-common-types.md#class-position) | 否 | Position(0.0, 0.0) | **命名参数。**   popup组件相对于placement设置的显示位置的偏移。<br>**说明：** 不支持设置百分比。 |
| width  | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**   弹窗宽度。<br>**说明：**  showInSubWindow=true时最大高度为设备屏幕高度，showInSubWindow=false时最大高度为应用窗口高度。高度限定逻辑=最大高度-状态栏高度（没有时高度为0）-dock栏高度（没有时高度为0）-40VP-40VP。|
| arrowPointPosition  | ?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition) | 否 | None | **命名参数。**   气泡尖角相对于父组件显示位置，气泡尖角在垂直和水平方向上有 ”Start“、”Center“、”End“三个位置点可选。以上所有位置点均位于父组件区域的范围内，不会超出父组件的边界范围。 |
| arrowWidth  | [Length](cj-common-types.md#interface-length) | 否 | 16.vp | **命名参数。**  箭头宽度。<br>**说明：** 若所设置的箭头宽度超过所在边的长度减去两倍的气泡圆角大小，则不绘制气泡箭头。|
| arrowHeight  | [Length](cj-common-types.md#interface-length) | 否 | 8.vp | **命名参数。**  箭头高度。<br>**说明：** 不支持设置百分比。 |
| radius  | [Length](cj-common-types.md#interface-length) | 否 | 20.vp | **命名参数。**  气泡圆角半径。|
| shadow  | [ShadowStyle](cj-common-types.md#enum-shadowstyle) | 否 | ShadowStyle.OUTER_DEFAULT_MD | **命名参数。**  气泡阴影。 |
| backgroundBlurStyle  | [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)| 否 | BlurStyle.COMPONENT_ULTRA_THICK | **命名参数。**  气泡模糊背景参数。 |
|focusable  |Bool | 否 | false | **命名参数。**   设置气泡弹出后是否获焦。 |
|transition | ?TransitionEffect | 否 | None | **命名参数。**   自定义popup弹窗显示和退出的动画效果。<br/>**说明：**<br/>1.如果不设置，则使用默认的显示/退出动效。<br/>2.显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。<br/>3.退出动效中按back键，不会打断退出动效，退出动效继续执行，back键不被响应。 |
| onWillDismiss | ([DismissPopupAction](#class-dismisspopupaction)) -> Unit | 否 | None | **命名参数。**   拦截退出事件且执行回调函数。<br>**说明：** 在onWillDismiss回调中，不能再做onWillDismiss拦截。 |
| followTransformOfTarget | Bool | 否 | false | **命名参数。**   气泡绑定的宿主组件或其宿主组件的父容器添加了旋转、缩放等变换时，气泡是否能显示在对应变化后的位置上。|

#### init()

```cangjie
public init()
```

**功能：** 创建空的CustomPopupOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

### class DismissPopupAction

```cangjie
public class DismissPopupAction {
    public DismissPopupAction(public let reason!: DismissReason)
}
```

**功能：** 设置popup交互式关闭拦截开关及拦截回调函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### let reason

```cangjie
public let reason: DismissReason
```

**功能：** 关闭原因，返回本次拦截popup消失的事件原因。

**类型：** DismissReason

**读写能力：** 只读

**起始版本：** 19

#### DismissPopupAction(DismissReason)

```cangjie
public DismissPopupAction(public let reason!: DismissReason)
```

**功能：** 构建一个DismissPopupAction的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|reason|  DismissReason| 否 | - | **命名参数。**  关闭原因，返回本次拦截popup消失的事件原因。 |

#### func dismiss()

```cangjie
public func dismiss()
```

**功能：** popup交互式关闭拦截开关及拦截结果类型。开发者需要退出时调用，不需要退出时无需调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

### struct PopupMessageOptions

```cangjie
public struct PopupMessageOptions {
    public PopupMessageOptions(
        public let textColor!: Color = Color(0x000000),
        public let font!: Fonts = Fonts()
    )
}
```

**功能：** 弹窗信息文本参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### let font

```cangjie
public let font: Fonts = Fonts()
```

**功能：** 设置弹窗信息字体属性。不支持设置family。

**类型：** [Fonts](./cj-common-types.md#class-fonts)

**读写能力：** 只读

**起始版本：** 19

#### let textColor

```cangjie
public let textColor: Color = Color(0x000000)
```

**功能：** 设置弹窗信息文本颜色。

**类型：** [Color](./cj-common-types.md#class-color)

**读写能力：** 只读

**起始版本：** 19

#### PopupMessageOptions(Color, Fonts)

```cangjie
public PopupMessageOptions(
    public let textColor!: Color = Color(0x000000),
    public let font!: Fonts = Fonts()
)
```

**功能：** 创建一个PopupMessageOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|textColor| [Color](./cj-common-types.md#class-color) | 否 | Color(0x000000) | **命名参数。**  弹窗信息文本颜色。 |
| font |[Fonts](./cj-common-types.md#class-fonts) | 否 | Fonts() | **命名参数。** 弹窗信息字体属性。 |

### class PopupOptions

```cangjie
public class PopupOptions {
    public var message: String = ""
    public var placementOnTop: Bool = false
    public var primaryButton: Action = Action(value: "", action: {=>})
    public var secondaryButton: Action = Action(value: "", action: {=>})
    public var onStateChange: Option<(StateChangeEvent) -> Unit> = Option.None
    public var messageOptions: PopupMessageOptions = PopupMessageOptions()
    public var arrowOffset: Length = 0.vp
    public var showInSubWindow: Bool = false
    public var mask: Color = Color(0x1000000)
    public var targetSpace: Length = 0.vp
    public var placement: ?Placement = Option.None
    public var offset: Position = Position(0.0, 0.0)
    public var enableArrow: Bool = true
    public var popupColor: Color = Color(0x1000000)
    public var autoCancel: Bool = true
    public var width: Length = 0.vp
    public var arrowPointPosition: Option<ArrowPointPosition> = None
    public var arrowWidth: Length = 16.vp
    public var arrowHeight: Length = 8.vp
    public var radius: Length = 20.vp
    public var shadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD
    public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
    public var transition: Option<TransitionEffect> = Option.None
    public var onWillDismiss: Option<(DismissPopupAction) -> Unit> = None
    public var followTransformOfTarget: Bool = false
    public init(
        message!: String,
        placementOnTop!: Bool = false,
        primaryButton!: Action = Action(value: "", action: { => }),
        secondaryButton!: Action = Action(value: "", action: { => }),
        onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None
    )
    public init(
        message!: String,
        placementOnTop!: Bool = false,
        primaryButton!: Action = Action(value: "", action: { => }),
        secondaryButton!: Action = Action(value: "", action: { => }),
        onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None,
        arrowOffset!: Length = 0.vp,
        showInSubWindow!: Bool,
        messageOptions!: PopupMessageOptions = PopupMessageOptions(),
        mask!: Color = Color(0x1000000),
        targetSpace!: Length = 0.vp,
        placement!: ?Placement = Option.None,
        offset!: Position = Position(0.0, 0.0),
        enableArrow!: Bool = true,
        popupColor!: Color = Color(0x1000000),
        autoCancel!: Bool = true,
        width!: Length = 0.vp,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: Length = 16.vp,
        arrowHeight!: Length = 8.vp,
        radius!: Length = 20.vp,
        shadow!: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        transition!: ?TransitionEffect = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: Bool = false
    )
    public init() {}
}
```

**功能：** 弹窗的参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### var arrowHeight

```cangjie
public var arrowHeight: Length = 8.vp
```

**功能：** 设置箭头高度。默认值：8.vp。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 12

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**功能：** 设置popup箭头在弹窗处的偏移。箭头在气泡上下方时，数值为0表示箭头居最左侧，偏移量为箭头至最左侧的距离，默认居中。箭头在气泡左右侧时，偏移量为箭头至最上侧的距离，默认居中。如果显示在屏幕边缘，气泡会自动左右偏移，数值为0时箭头始终指向绑定组件。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 12

#### var arrowPointPosition

```cangjie
public var arrowPointPosition: Option<ArrowPointPosition>= None
```

**功能：** 设置气泡尖角相对于父组件显示位置，气泡尖角在垂直和水平方向上有 "Start"、"Center"、"End"三个位置点可选。以上所有位置点均位于父组件区域所在的范围内，不会超出父组件的边界范围。

**类型：** ?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)

**读写能力：** 可读写

**起始版本：** 12

#### var arrowWidth

```cangjie
public var arrowWidth: Length = 16.vp
```

**功能：** 设置箭头宽度。若所设置的箭头宽度超过所在边的长度减去两倍的气泡圆角大小，则不绘制气泡箭头。默认值：16.vp。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var autoCancel

```cangjie
public var autoCancel: Bool = true
```

**功能：** 页面有操作时，设置是否自动关闭气泡。默认值：true。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 12

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
```

**功能：** 设置气泡模糊背景参数。默认值：BlurStyle.COMPONENT_ULTRA_THICK。

**类型：** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**读写能力：** 可读写

**起始版本：** 19

#### var enableArrow

```cangjie
public var enableArrow: Bool = true
```

**功能：** 设置是否显示箭头。默认值：true。当页面可用空间无法让气泡完全避让时，气泡会覆盖到组件上并且不显示箭头。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 19

#### var followTransformOfTarget

```cangjie
public var followTransformOfTarget: Bool = false
```

**功能：** 气泡绑定的宿主组件或其宿主组件的父容器添加了旋转、缩放等变换时，设置气泡是否能显示在对应变化后的位置上。默认值：false。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 19

#### var mask

```cangjie
public var mask: Color = Color(0x1000000)
```

**功能：** 设置遮罩层的颜色。

**类型：** [Color](./cj-common-types.md#class-color)

**读写能力：** 可读写

**起始版本：** 19

#### var message

```cangjie
public var message: String
```

**功能：** 设置弹窗信息内容。

**类型：** String

**读写能力：** 可读写

**起始版本：** 12

#### var messageOptions

```cangjie
public var messageOptions: PopupMessageOptions = PopupMessageOptions()
```

**功能：** 设置弹窗信息文本参数。

**类型：** [PopupMessageOptions](#struct-popupmessageoptions)

**读写能力：** 可读写

**起始版本：** 19

#### var offset

```cangjie
public var offset: Position = Position(0.0, 0.0)
```

**功能：** 设置popup组件相对于placement设置的显示位置的偏移。不支持设置百分比。

**类型：** [Position](./cj-common-types.md#class-position)

**读写能力：** 可读写

**起始版本：** 19

#### var onStateChange

```cangjie
public var onStateChange: Option <(StateChangeEvent) -> Unit>= Option.None
```

**功能：** 设置弹窗状态变化事件回调，参数为弹窗当前的显示状态。

**类型：** ?([StateChangeEvent](#class-statechangeevent))->Unit

**读写能力：** 可读写

**起始版本：** 12

#### var onWillDismiss

```cangjie
public var onWillDismiss: Option <(DismissPopupAction) -> Unit>= None
```

**功能：** 设置拦截退出事件且执行回调函数。

> **说明：**
>
> 在onWillDismiss回调中，不能再做onWillDismiss拦截。

**类型：** ([DismissPopupAction](#class-dismisspopupaction))->Unit

**读写能力：** 可读写

**起始版本：** 12

#### var placement

```cangjie
public var placement: Placement = Placement.Bottom
```

**功能：** 设置popup组件相对于目标的显示位置，默认值为Placement.Bottom。如果同时设置了placementOnTop和placement，则以placement的设置生效。

**类型：** [Placement](./cj-common-types.md#enum-placement)

**读写能力：** 可读写

**起始版本：** 12

#### var placementOnTop<sup>(deprecated)</sup>

```cangjie
public var placementOnTop: Bool = false
```

**功能：** 设置是否在组件上方显示，默认值为false。已经废弃，建议使用placement替代。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 12

#### var popupColor

```cangjie
public var popupColor: Color = Color(0x1000000)
```

**功能：** 设置提示气泡的颜色。如需去除模糊背景填充效果，需将backgroundBlurStyle设置为BlurStyle.NONE。

**类型：** [Color](./cj-common-types.md#class-color)

**读写能力：** 可读写

**起始版本：** 12

#### var primaryButton

```cangjie
public var primaryButton: Action = Action(value: "", action: { => })
```

**功能：** 设置第一个按钮。value: 弹窗里主按钮的文本。action: 点击主按钮的回调函数。

**类型：** [Action](#class-action)

**读写能力：** 可读写

**起始版本：** 12

#### var radius

```cangjie
public var radius: Length = 20.vp
```

**功能：** 设置气泡圆角半径。默认值：20.vp。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var secondaryButton

```cangjie
public var secondaryButton: Action = Action(value: "", action: { => })
```

**功能：** 设置第二个按钮。 value: 弹窗里辅助按钮的文本。action: 点击辅助按钮的回调函数。

**类型：** [Action](#class-action)

**读写能力：** 可读写

**起始版本：** 12

#### var shadows

```cangjie
public var shadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD
```

**功能：** 设置气泡阴影。默认值：ShadowStyle.OUTER_DEFAULT_MD。

**类型：** [ShadowStyle](cj-common-types.md#enum-shadowstyle)

**读写能力：** 可读写

**起始版本：** 19

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool = false
```

**功能：** 设置是否在子窗口显示气泡，默认值为false。

**类型：** Bool

**读写能力：** 可读写

**起始版本：** 19

#### var targetSpace

```cangjie
public var targetSpace: Length = 0.vp
```

**功能：** 设置popup与目标的间隙。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var transition

```cangjie
public var transition: Option<TransitionEffect>= Option.None
```

**功能：** 自定义设置popup弹窗显示和退出的动画效果。

> **说明：**
>
> - 如果不设置，则使用默认的显示/退出动效。
> - 显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。
> - 退出动效中按back键，不会打断退出动效，退出动效继续执行，back键不被响应。

**类型：** ?TransitionEffect

**读写能力：** 可读写

**起始版本：** 19

#### var width

```cangjie
public var width: Length = 0.vp
```

**功能：** 设置弹窗宽度。

**类型：** [Length](cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

### init(String，Bool，Action，Action，Option<(StateChangeEvent) -> Unit>)

```cangjie
public init(
    message!: String,
    placementOnTop!: Bool = false,
    primaryButton!: Action = Action(value: "", action: { => }),
    secondaryButton!: Action = Action(value: "", action: { => }),
    onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None
)
```

**功能：** 构建一个PopupOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| message | string | 是 |  | **命名参数。**  弹窗信息内容。 |
| placementOnTop | Bool | 否 | false | **命名参数。**  是否在组件上方显示。 |
| primaryButton| [Action](#class-action) | 否 | Action(value: "", action: {=>}) | **命名参数。**  第一个按钮。 <br/>value:&nbsp;弹窗里主按钮的文本。<br/>action:&nbsp;点击主按钮的回调函数。|
| secondaryButton| [Action](#class-action) | 否 | Action(value: "", action: {=>}) | **命名参数。**  第二个按钮。<br/>value:&nbsp;弹窗里主按钮的文本。<br/>action:&nbsp;点击主按钮的回调函数。 |
| onStateChange | ?([StateChangeEvent](#class-statechangeevent))->Unit | 否 | None | **命名参数。**  弹窗状态变化事件回调，参数为弹窗当前的显示状态。 |

#### init(String, Bool, Action, Action, Option\<(StateChangeEvent) -> Unit>, Length, Bool, Color, PopupMessageOptions, Length, Placement, Position, Bool, Color, Bool, Length, ?ArrowPointPosition, Length, Length, Length, ShadowStyle, BlurStyle, ?TransitionEffect, ?(DismissPopupAction) -> Unit, Bool)

```cangjie
public init(
    message!: String,
    placementOnTop!: Bool = false,
    primaryButton!: Action = Action(value: "", action: { => }),
    secondaryButton!: Action = Action(value: "", action: { => }),
    onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None,
    arrowOffset!: Length = 0.vp,
    showInSubWindow!: Bool,
    messageOptions!: PopupMessageOptions = PopupMessageOptions(),
    mask!: Color = Color(0x1000000),
    targetSpace!: Length = 0.vp,
    placement!: ?Placement = Option.None,
    offset!: Position = Position(0.0, 0.0),
    enableArrow!: Bool = true,
    popupColor!: Color = Color(0x1000000),
    autoCancel!: Bool = true,
    width!: Length = 0.vp,
    arrowPointPosition!: ?ArrowPointPosition = None,
    arrowWidth!: Length = 16.vp,
    arrowHeight!: Length = 8.vp,
    radius!: Length = 20.vp,
    shadow!: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD,
    backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
    transition!: ?TransitionEffect = Option.None,
    onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
    followTransformOfTarget!: Bool = false
)
```

**功能：** 构建一个PopupOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| message | string | 是 |  | **命名参数。**  弹窗信息内容。 |
| placementOnTop | Bool | 否 | false | **命名参数。**  是否在组件上方显示。 |
| primaryButton| [Action](#class-action) | 否 | Action(value: "", action: {=>}) | **命名参数。**  第一个按钮。 <br/>value:&nbsp;弹窗里主按钮的文本。<br/>action:&nbsp;点击主按钮的回调函数。|
| secondaryButton| [Action](#class-action) | 否 | Action(value: "", action: {=>}) | **命名参数。**  第二个按钮。<br/>value:&nbsp;弹窗里主按钮的文本。<br/>action:&nbsp;点击主按钮的回调函数。 |
| onStateChange | ?([StateChangeEvent](#class-statechangeevent))->Unit | 否 | None | **命名参数。**  弹窗状态变化事件回调，参数为弹窗当前的显示状态。 |
| messageOptions  | [PopupMessageOptions](#struct-popupmessageoptions) | 否 | PopupMessageOptions() | **命名参数。**   弹窗信息文本参数。 |
| arrowOffset | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  popup箭头在弹窗处的偏移。<br>**说明：** 箭头在气泡上下方时，数值为0表示箭头居最左侧，偏移量为箭头至最左侧的距离，默认居中。箭头在气泡左右侧时，偏移量为箭头至最上侧的距离，默认居中。如果显示在屏幕边缘，气泡会自动左右偏移，数值为0时箭头始终指向绑定组件。 |
|  showInSubWindow| Bool | 否 | false | **命名参数。**  是否在子窗口显示气泡。 |
| mask  | [Color](./cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**   提示气泡遮障层的颜色。 |
| targetSpace  | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**   popup与目标的间隙。 |
| placement| [Placement](./cj-common-types.md#enum-placement) | 否 | Placement.Bottom | **命名参数。** popup组件相对于目标的显示位置。<br>**说明：** 如果同时设置了placementOnTop和placement，则以placement的设置生效。 |
| offset  | [Position](./cj-common-types.md#class-position) | 否 | Position(0.0, 0.0) | **命名参数。**   popup组件相对于placement设置的显示位置的偏移。<br>**说明：** 不支持设置百分比。 |
| enableArrow | Bool | 否 | true | **命名参数。**  是否显示箭头。<br>**说明：** 如果箭头所在方位侧的气泡长度不足以显示下箭头，则会默认不显示箭头。比如：placement设置为Left，但气泡高度小于箭头的宽度（32vp），则实际不会显示箭头。 |
| popupColor | [Color](./cj-common-types.md#class-color) | 否 | Color(0x1000000) | **命名参数。**  提示气泡的颜色。 |
| autoCancel | Bool | 否 | true | **命名参数。**  页面有操作时，是否自动关闭气泡。 |
| width  | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**   弹窗宽度。 |
| arrowPointPosition  | ?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)| 否 | None | **命名参数。**   气泡尖角相对于父组件显示位置，气泡尖角在垂直和水平方向上有 ”Start“、”Center“、”End“三个位置点可选。以上所有位置点均位于父组件区域的范围内，不会超出父组件的边界范围。 |
| arrowHeight  | [Length](cj-common-types.md#interface-length) | 否 | 8.vp | **命名参数。**  箭头高度。<br>**说明：** 不支持设置百分比。 |
| arrowWidth  | [Length](cj-common-types.md#interface-length) | 否 | 16.vp | **命名参数。**  箭头宽度。<br>**说明：** 若所设置的箭头宽度超过所在边的长度减去两倍的气泡圆角大小，则不绘制气泡箭头。 |
| radius  | [Length](cj-common-types.md#interface-length) | 否 | 20.vp | **命名参数。**   气泡圆角半径。|
| shadow  | [ShadowStyle](cj-common-types.md#enum-shadowstyle) | 否 | ShadowStyle.OUTER_DEFAULT_MD | **命名参数。**   气泡阴影。 |
| backgroundBlurStyle  |[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)| 否 | BlurStyle.COMPONENT_ULTRA_THICK | **命名参数。**   气泡模糊背景参数。 |
|transition |?TransitionEffect| 否 | None | **命名参数。**   自定义popup弹窗显示和退出的动画效果。<br/>**说明：**<br/>1.如果不设置，则使用默认的显示/退出动效。<br/>2.显示动效中按back键，打断显示动效，执行退出动效，动画效果为显示动效与退出动效的曲线叠加后的效果。<br/>3.退出动效中按back键，不会打断退出动效，退出动效继续执行，back键不被响应。  |
| onWillDismiss |([DismissPopupAction](#class-dismisspopupaction)) -> Unit | 否 | None | **命名参数。**   拦截退出事件且执行回调函数。 |
| followTransformOfTarget | Bool | 否 | false | **命名参数。**   气泡绑定的宿主组件或其宿主组件的父容器添加了旋转、缩放等变换时，气泡是否能显示在对应变化后的位置上。|

### init()

```cangjie
public init()
```

**功能：** 构建一个空的PopupOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

### class StateChangeEvent

```cangjie
public class StateChangeEvent {
    public StateChangeEvent(public let isVisible: Bool)
}
```

**功能：** 表示显示状态的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### let isVisible

```cangjie
public let isVisible: Bool
```

**功能：** 当前的显示状态。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 12

#### StateChangeEvent(Bool)

```cangjie
public StateChangeEvent(public let isVisible: Bool)
```

**功能：** 构建一个StateChangeEvent类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isVisible|  Bool | 是 | - | 当前的显示状态。 |

## 示例代码

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.base.{LengthProp, Length, AppLog, Color, nativeLog, BaseLog, LengthType}

@Builder
func popupBuilder() {
    Column {
        Text("Custom Popup")
    }
}

@Entry
@Component
class EntryView {
    @State var msg: String = "State Change Wait"
    @State var dismiss: String = "Dismiss Wait"
    @State var custom: String = "Custom Wait"
    @State var handlePopup: Bool = false
    @State var customPopup: Bool = false

    public func build() {
        Flex(FlexOptions(direction: FlexDirection.Column)) {
            Text(msg)
            Text(dismiss)
            Text(custom)
            Button('PopupOptions')
                .margin(top: 200)
                .onClick {
                    this.handlePopup = !this.handlePopup
                }
                .bindPopup(
                    show: this.handlePopup,
                    popup: PopupOptions(
                        message: 'This is a popup with PopupOptions',
                        placementOnTop: true,
                        primaryButton: Action(
                            value: 'confirm',
                            action: {
                                => this.handlePopup = !this.handlePopup
                            }
                        ),
                        secondaryButton: Action(
                            value: 'cancel',
                            action: {
                                => this.handlePopup = !this.handlePopup
                            }
                        ),
                        onStateChange: {
                            e =>
                            this.msg = "PopUp"
                            if (!e.isVisible) {
                                this.msg = "Wait"
                                this.handlePopup = false
                            }
                        },
                        showInSubWindow: false,
                        arrowOffset: 60.0.vp,
                        targetSpace: 20.0.vp,
                        enableArrow: true,
                        arrowHeight: 30.0.vp,
                        arrowWidth: 30.0.vp,
                        radius: 25.0.vp,
                        autoCancel: true,
                        backgroundBlurStyle: BlurStyle.Thick,
                        shadow: ShadowStyle.OUTER_FLOATING_SM,
                        offset: Position(50.0, 50.0),
                        placement: Placement.Top,
                        arrowPointPosition: ArrowPointPosition.CENTER,
                        mask: Color(0x33000000),
                        popupColor: Color.GREEN,
                        messageOptions: PopupMessageOptions(textColor: Color.BLUE, font: Fonts(size: 20.vp)),
                        transition: TransitionEffect.SLIDE_SWITCH,
                        onWillDismiss: {
                            dismissPopupAction: DismissPopupAction =>
                            dismissPopupAction.dismiss()
                            match (dismissPopupAction.reason) {
                                case PRESS_BACK => this.dismiss = "dismissReason: PRESS_BACK"
                                case TOUCH_OUTSIDE => this.dismiss = "dismissReason: TOUCH_OUTSIDE"
                                case _ => this.dismiss = "dismissReason: unknown"
                            }
                        },
                        followTransformOfTarget: true
                    )
                )
            Button("CustomPopupOptions")
                .onClick({=> customPopup = !customPopup})
                .bindPopup(
                    show: customPopup,
                    popup: CustomPopupOptions(
                        builder: bind(popupBuilder, this),
                        enableArrow: true,
                        placement: Placement.BottomLeft,
                        popupColor: Color.RED,
                        arrowHeight: 24.0.vp,
                        arrowWidth: 24.0.vp,
                        radius: 10.vp,
                        offset: Position(5.0, 5.0),
                        width: 300.vp,
                        autoCancel: true,
                        targetSpace: 10.vp,
                        arrowOffset: 5.vp,
                        focusable: true,
                        arrowPointPosition: ArrowPointPosition.CENTER,
                        transition: TransitionEffect.SLIDE_SWITCH,
                        onStateChange: {
                            evt =>
                            custom = "stateChange: ${evt.isVisible}"
                            if (!evt.isVisible) {
                                customPopup = true
                            }
                        }
                    )
                )
        }
    }
}

```

![bindpopup](figures/bind_popup.gif)
