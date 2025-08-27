# 菜单控制

为组件绑定弹出式菜单，弹出式菜单以垂直列表形式显示菜单项，可通过长按、点击或鼠标右键触发。

> **说明：**
>
> - CustomBuilder里不支持再使用bindMenu、bindContextMenu弹出菜单。多级菜单可使用[Menu](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-popup-and-menu-components-menu.md##菜单控制（Menu）)组件。
> - 弹出菜单的文本内容不支持长按选中。
> - 若组件是可拖动节点，绑定bindContextMenu未指定preview时，菜单弹出会浮起拖拽预览图且菜单选项和预览图不会发生避让。对此，开发者可根据使用场景设置preview或者将目标节点设置成不可拖动节点。
> - 菜单支持长按500ms弹出子菜单，支持按压态跟随手指移动。<br> a.仅支持使用[Menu](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-popup-and-menu-components-menu.md##菜单控制（Menu）)组件且子组件包含[MenuItem](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-popup-and-menu-components-menu.md##菜单控制（Menu）)或[MenuItemGroup](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-popup-and-menu-components-menu.md##菜单控制（Menu）)的场景。<br> b.仅支持[MenuPreviewMode](./cj-common-types.md#enum-menupreviewmode)为NONE的菜单。


## 导入模块

```cangjie
import kit.ArkUI.*
```


## func bindContextMenu(CustomBuilder, ResponseType, ContextMenuOptions)

```cangjie
public func bindContextMenu(content: CustomBuilder, responseType: ResponseType,
    options!: ContextMenuOptions = ContextMenuOptions()): This
```

**功能：** 绑定上下文菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|content|[CustomBuilder](#type-custombuilder)|是|-|内容构建器。|
|responseType|[ResponseType](#)|是|-|响应类型。|
|options|[ContextMenuOptions](#)|否|ContextMenuOptions()|上下文菜单选项。|


## func bindMenu(Array\<MenuElement>)

```cangjie
public func bindMenu(content: Array<MenuElement>): This
```

**功能：** 绑定菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|content|Array\<[MenuElement](#)>|是|-|菜单元素数组。|


## func bindMenu(CustomBuilder)

```cangjie
public func bindMenu(content: CustomBuilder): This
```

**功能：** 绑定自定义菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|content|[CustomBuilder](#type-custombuilder)|是|-|内容构建器。|

## 基础类型定义

### class ContextMenuAnimationOptions

```cangjie
public class ContextMenuAnimationOptions {
    public var scale:?VArray<Float64, $2>= None
    public var transition:?TransitionEffect = None
    public var hoverScale:?VArray<Float64, $2>= None
    public init(scale!: ?VArray<Float64, $2> = None, transition!: ?TransitionEffect = None,
        hoverScale!: ?VArray<Float64, $2> = None)
}
```

**功能：** 控制长按预览显示动画开始倍率和结束倍率（相对预览原图比例）参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var hoverScale

```cangjie
public var hoverScale:?VArray<Float64, $2>= None
```

**功能：** 设置预览自定义长按场景下，浮起原组件截图的缩放动画开始和结束时相对预览原图缩放比例，且有与预览图的切换的过渡动效。

**类型：** ?VArray\<Float64,$2>

**读写能力：** 可读写

#### var scale

```cangjie
public var scale:?VArray<Float64, $2>= None
```

**功能：** 动画开始和结束时相对预览原图缩放比例。

**类型：** ?VArray\<Float64,$2>

**读写能力：** 可读写

#### var transition

```cangjie
public var transition:?TransitionEffect = None
```

**功能：** 设置菜单显示和退出的过渡效果。

**类型：** ?[TransitionEffect](<font color="yellow" face="bold">please add lnk</font>)

**读写能力：** 可读写

#### init(?VArray\<Float64,$2>, ?TransitionEffect, ?VArray\<Float64,$2>)

```cangjie
public init(scale!: ?VArray<Float64, $2> = None, transition!: ?TransitionEffect = None,
    hoverScale!: ?VArray<Float64, $2> = None)
```

**功能：** 创建 ContextMenuAnimationOptions 对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scale|?VArray\<Float64,$2>|否|None| **命名参数。** 动画开始和结束时相对预览原图缩放比例。<br> **说明：** 缩放比例需要根据实际开发场景设置，建议设置值为小于预览图宽度或布局的最大限制。|
|transition|?[TransitionEffect](<font color="yellow" face="bold">please add lnk</font>)|否|None| **命名参数。** 菜单显示和退出的过渡效果。<br> **说明：** 菜单退出动效过程中，进行横竖屏切换，菜单会避让。二级菜单不继承自定义动效。弹出过程可以点击二级菜单，退出动效执行过程不允许点击二级菜单。详细描述见TransitionEffect对象说明。|
|hoverScale|?VArray\<Float64,$2>|否|None| **命名参数。** 预览自定义长按场景下，浮起原组件截图的缩放动画开始和结束时相对预览原图缩放比例，且有与预览图的切换的过渡动效。<br> **说明：** 倍率设置参数小于等于0时，不生效。<br> 设置transition接口时，不生效。<br>使用此接口且同时使用scale接口时，scale接口起始值不生效。<br> 为保障最佳体验，最终预览图尺寸不建议小于原组件截图尺寸。当前预览动效宽高会受组件截图和自定义预览大小影响，请根据实际使用情况自行保障展示效果。|


### class ContextMenuOptions

```cangjie
public class ContextMenuOptions {
    public var offset: Position = Position(x: 0.0, y: 0.0)
    public var placement: Option<Placement>= Option.None
    public var enableArrow: Bool = false
    public var arrowOffset: Length = 0.vp
    public var preview:?CustomBuilder = Option.None
    public var previewAnimationOptions:?ContextMenuAnimationOptions = None
    public var onAppear:?() -> Unit = None
    public var onDisappear:?() -> Unit = None
    public var aboutToAppear:?() -> Unit = None
    public var aboutToDisappear:?() -> Unit = None
    public var backgroundColor: ResourceColor = Color.Transparent
    public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
    public var transition:?TransitionEffect = None
    public init(
        offset!: Position = Position(),
        placement!: Option<Placement> = Option.None,
        enableArrow!: Bool = false,
        arrowOffset!: Length = 0.vp,
        preview!: Option<() -> Unit> = Option.None,
        onAppear!: ?() -> Unit = None,
        onDisappear!: ?() -> Unit = None,
        aboutToAppear!: ?() -> Unit = None,
        aboutToDisappear!: ?() -> Unit = None,
        backgroundColor!: ResourceColor = Color.Transparent,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        transition!: ?TransitionEffect = None,
        borderRadius!: ?BorderRadiuses = None,
        layoutRegionMargin!: ?Margin = None
    )
}
```

**功能：** 配置弹出菜单的参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var aboutToAppear

```cangjie
public var aboutToAppear:?() -> Unit = None
```

**功能：** 菜单显示动效前的事件回调。

**类型：** ?()->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var aboutToDisappear

```cangjie
public var aboutToDisappear:?() -> Unit = None
```

**功能：** 菜单退出动效前的事件回调。

**类型：** ?()->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**功能：** 箭头在菜单处的偏移。偏移量必须合法且转换为具体数值时大于0才会生效，另外该值生效时不会导致箭头超出菜单四周的安全距离。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
```

**功能：** 弹窗背板模糊材质。

**类型：** [BlurStyle](<font color="yellow" face="bold">please add lnk</font>)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var backgroundColor

```cangjie
public var backgroundColor: ResourceColor = Color.Transparent
```

**功能：** 弹窗背板颜色。

**类型：** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var enableArrow

```cangjie
public var enableArrow: Bool = false
```

**功能：** 是否显示箭头。如果菜单的大小和位置不足以放置箭头时，不会显示箭头。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offset

```cangjie
public var offset: Position = Position(x: 0.0, y: 0.0)
```

**功能：** 菜单弹出位置的偏移量，不会导致菜单显示超出屏幕范围。

**类型：** [Position](cj-common-types.md#class-position)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onAppear

```cangjie
public var onAppear:?() -> Unit = None
```

**功能：** 菜单弹出时的事件回调。

**类型：** ?()->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onDisappear

```cangjie
public var onDisappear:?() -> Unit = None
```

**功能：** 菜单消失时的事件回调。

**类型：** ?()->Unit

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var placement

```cangjie
public var placement: Option<Placement>= Option.None
```

**功能：** 菜单组件优先显示的位置，当前位置显示不下时，会自动调整位置。

**类型：** [Option](#initposition-optionplacement-bool-length-option---unit----unit----unit----unit----unit-resourcecolor-blurstyle-transitioneffect-borderradiuses-margin)\<[Placement](cj-common-types.md#enum-placement)>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var preview

```cangjie
public var preview:?CustomBuilder = Option.None
```

**功能：** 长按悬浮菜单或使用bindContextMenu显示菜单的预览内容样式，为用户自定义的内容。

**类型：** ?[CustomBuilder](<font color="yellow" face="bold">please add lnk</font>)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var previewAnimationOptions

```cangjie
public var previewAnimationOptions:?ContextMenuAnimationOptions = None
```

**功能：** 控制长按预览显示动画开始倍率和结束倍率（相对预览原图比例）。

**类型：** ?[ContextMenuAnimationOptions](#class-contextmenuanimationoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var transition

```cangjie
public var transition:?TransitionEffect = None
```

**功能：** 设置菜单显示和退出的过渡效果。

**类型：** ?[TransitionEffect](<font color="yellow" face="bold">please add lnk</font>)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Position, Option\<Placement>, Bool, Length, Option\<() -> Unit>, ?() -> Unit, ?() -> Unit, ?() -> Unit, ?() -> Unit, ResourceColor, BlurStyle, ?TransitionEffect, ?BorderRadiuses, ?Margin)

```cangjie
public init(
    offset!: Position = Position(),
    placement!: Option<Placement> = Option.None,
    enableArrow!: Bool = false,
    arrowOffset!: Length = 0.vp,
    preview!: Option<() -> Unit> = Option.None,
    onAppear!: ?() -> Unit = None,
    onDisappear!: ?() -> Unit = None,
    aboutToAppear!: ?() -> Unit = None,
    aboutToDisappear!: ?() -> Unit = None,
    backgroundColor!: ResourceColor = Color.Transparent,
    backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
    transition!: ?TransitionEffect = None,
    borderRadius!: ?BorderRadiuses = None,
    layoutRegionMargin!: ?Margin = None
)
```

**功能：** 创建 ContextMenuOptions 对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offset|[Position](cj-common-types.md#class-position)|否|Position()| **命名参数。** 菜单弹出位置的偏移量，不会导致菜单显示超出屏幕范围。<br> **说明：**<br> 菜单类型为相对⽗组件区域弹出时，⾃动根据菜单位置属性 (placement)将区域的宽或⾼计⼊偏移量中。<br> 当菜单相对父组件出现在上侧时（placement设置为Placement.TopLeft，Placement.Top，Placement.TopRight），x为正值，菜单相对组件向右进行偏移，y为正值，菜单相对组件向上进行偏移。<br> 当菜单相对父组件出现在下侧时（placement设置为Placement.BottomLeft，Placement.Bottom，Placement.BottomRight），x为正值，菜单相对组件向右进行偏移，y为正值，菜单相对组件向下进行偏移。<br> 当菜单相对父组件出现在左侧时（placement设置为Placement.LeftTop，Placement.Left，Placement.LeftBottom），x为正值，菜单相对组件向左进行偏移，y为正值，菜单相对组件向下进行偏移。<br> 当菜单相对父组件出现在右侧时（placement设置为Placement.RightTop，Placement.Right，Placement.RightBottom），x为正值，菜单相对组件向右进行偏移，y为正值，菜单相对组件向下进行偏移。<br> 如果菜单调整了显示位置（与placement初始值主方向不⼀致），则偏移值 (offset) 失效。|
|placement|[Option](#initposition-optionplacement-bool-length-option---unit----unit----unit----unit----unit-resourcecolor-blurstyle-transitioneffect-borderradiuses-margin)\<[Placement](cj-common-types.md#enum-placement)>|否|Option.None| **命名参数。** 菜单组件优先显示的位置，当前位置显示不下时，会自动调整位置。<br> **说明：**<br> placement值设置为undefined、null或没有设置此选项时，按未设置placement处理，当使用bindMenu，按初始值：Placement.BottomLeft设置。|
|enableArrow|Bool|否|false| **命名参数。** 是否显示箭头。如果菜单的大小和位置不足以放置箭头时，不会显示箭头。<br> **说明：** <br> enableArrow为true时，placement未设置或者值为非法值，默认在目标物上方显示，否则按照placement的位置优先显示。当前位置显示不下时，会自动调整位置，enableArrow为undefined时，不显示箭头。|
|arrowOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)|否|0.vp| **命名参数。** 箭头在菜单处的偏移。偏移量必须合法且转换为具体数值时大于0才会生效，另外该值生效时不会导致箭头超出菜单四周的安全距离。<br> 单位：vp<br> **说明：**<br> 箭头距菜单四周的安全距离为菜单圆角大小与箭头宽度的一半之和。<br> 根据配置的placement来计算是在水平还是垂直方向上偏移。<br> 箭头在菜单水平方向时，偏移量为箭头至最左侧箭头安全距离处的距离。箭头在菜单垂直方向时，偏移量为箭头至最上侧箭头安全距离处的距离。<br> 根据配置的placement的不同，箭头展示的默认位置不同：<br> 在菜单不发生避让的情况下，placement设置为Placement.Top、Placement.Bottom时，箭头显示在水平方向且默认居中；<br> placement设置为Placement.Left、Placement.Right时，箭头显示在垂直方向且默认居中；<br> placement设置为Placement.TopLeft、Placement.BottomLeft时，箭头默认显示在水平方向，且距离菜单左侧边缘距离为箭头安全距离；<br> placement设置为Placement.TopRight、Placement.BottomRight时，箭头默认显示在水平方向，且距离菜单右侧距离为箭头安全距离；<br> placement设置为Placement.LeftTop、Placement.RightTop时，箭头默认显示在垂直方向，且距离菜单上侧距离为箭头安全距离；<br> placement设置为Placement.LeftBottom、Placement.RightBottom时，箭头默认显示在垂直方向，且距离菜单下侧距离为箭头安全距离。|
|preview|[Option](#initposition-optionplacement-bool-length-option---unit----unit----unit----unit----unit-resourcecolor-blurstyle-transitioneffect-borderradiuses-margin)\<()->Unit>|否|Option.None| **命名参数。** 长按悬浮菜单或使用bindContextMenu显示菜单的预览内容样式，为用户自定义的内容。<br> **说明：** <br> - 不支持responseType为ResponseType.RightClick时触发，如果responseType为ResponseType.RightClick，则不会显示预览内容。<br> - 当未设置preview参数时，enableArrow参数生效。<br> - 当preview参数设置为CustomBuilder时，enableArrow为true时也不显示箭头。|
|onAppear|?()->Unit|否|None| **命名参数。** 菜单弹出时的事件回调。|
|onDisappear|?()->Unit|否|None| **命名参数。** 菜单消失时的事件回调。|
|aboutToAppear|?()->Unit|否|None| **命名参数。** 菜单显示动效前的事件回调。|
|aboutToDisappear|?()->Unit|否|None| **命名参数。** 菜单退出动效前的事件回调。|
|backgroundColor|[ResourceColor](cj-common-types.md#interface-resourcecolor)|否|Color.Transparent| **命名参数。** 弹窗背板颜色。|
|backgroundBlurStyle|[BlurStyle](<font color="yellow" face="bold">please add lnk</font>)|否|BlurStyle.ComponentUltraThick| **命名参数。** 弹窗背板模糊材质。|
|transition|?[TransitionEffect](<font color="yellow" face="bold">please add lnk</font>)|否|None| **命名参数。** 菜单显示和退出的过渡效果。<br> **说明：**<br> 菜单退出动效过程中，进行横竖屏切换，菜单会避让。二级菜单不继承自定义动效。弹出过程可以点击二级菜单，退出动效执行过程不允许点击二级菜单。<br> 详细描述见TransitionEffect对象说明。|
|borderRadius|?[BorderRadiuses](cj-common-types.md#class-borderradiuses)|否|None| **命名参数。** 设置菜单显示区域的圆角。|
|layoutRegionMargin|?[Margin](cj-common-types.md#class-margin)|否|None| **命名参数。** 设置菜单的布局区域的边距。|


### class MenuElement

```cangjie
public class MenuElement {
    public init(value!: ResourceStr, action!: () -> Unit)
}
```

**功能：** 配置菜单项图标和文本。

#### init(ResourceStr, () -> Unit)

```cangjie
public init(value!: ResourceStr, action!: () -> Unit)
```

**功能：** 创建 MenuElement 对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|菜单项文本。|
|action|()->Unit|是|-|点击菜单项的事件回调。|
