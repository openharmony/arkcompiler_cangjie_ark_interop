# 半模态转场

通过bindSheet属性为组件绑定半模态页面，在组件插入时可通过设置自定义或默认的内置高度确定半模态大小。

> **说明：**
>
> 不支持路由跳转。

## func bindSheet(Bool, () -> Unit, SheetOptions)

```cangjie
public func bindSheet(isShow: Bool, builder: () -> Unit, options!: SheetOptions = SheetOptions()): This
```

**功能：** 给组件绑定半模态页面，点击后显示模态页面。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| isShow | Bool | 是 | \- | 是否显示半模态页面。 |
| builder | () -> Unit | 是 |  \- | 配置半模态页面内容。使用时结合@Builder使用。 |
| options | [SheetOptions](#class-sheetoptions) | 否 | SheetOptions() | **命名参数。**  配置半模态页面的可选属性。 |

> **说明：**
>
> - 在半模态单挡位向上拖拽或是多挡位上滑换挡情况下，内容在拖拽结束或换挡结束后更新显示区域。
> - 半模态是一个严格和宿主节点绑定在一起的弹窗。若是想实现类似“页面显示的瞬间就弹出半模态”的效果，请确认宿主节点是否已挂载上树。若宿主节点还没上树就将isShow置为true，半模态将不生效。建议使用[onAppear](./cj-universal-event-appear.md#func-onappear---unit)函数，确保在宿主节点挂载后再显示半模态。
> - 尤其是 [SheetMode](#enum-sheetmode) = EMBEDDED 时，除宿主节点外，还需确保对应的页面节点成功挂载。
> - 半模态页面的离场动效不支持打断，动效执行期间无法响应其他手势动作。目前离场动效使用弹簧曲线，该动画曲线存在视觉上并不明显的拖尾动画。因此，在半模态退出时，视觉上半模态页面已经消失，但此时动效可能还未结束，若想再次点击拉起半模态页面则不会响应。需要等动效完全结束后，才可以再次拉起。

## 基础类型定义

### class BindOptions

```cangjie
public class BindOptions {
    public init(
        backgroundColor!: Option<Color> = Option.None,
        onAppear!: Option<() -> Unit> = Option.None,
        onDisappear!: Option<() -> Unit> = Option.None,
        onWillAppear!: Option<() -> Unit> = Option.None,
        onWillDisappear!: Option<() -> Unit> = Option.None
    )
}
```

**功能：** 配置半模态页面的可选属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### init(Option\<Color>, Option\<() -> Unit>, Option\<() -> Unit>, Option\<() -> Unit>, Option\<() -> Unit>)

```cangjie
public init(
    backgroundColor!: Option<Color> = Option.None,
    onAppear!: Option<() -> Unit> = Option.None,
    onDisappear!: Option<() -> Unit> = Option.None,
    onWillAppear!: Option<() -> Unit> = Option.None,
    onWillDisappear!: Option<() -> Unit> = Option.None
)
```

**功能：** 配置半模态页面的可选属性构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| backgroundColor | Option\<[Color](./cj-common-types.md#class-color)> | 否 | Option.None | **命名参数。**  半模态页面的背板颜色，默认白色。 |
| onAppear | Option\<() -> Unit> | 否 | Option.None | **命名参数。**  半模态页面显示（动画结束后）回调函数。 |
| onDisappear | Option\<() -> Unit> | 否 | Option.None | **命名参数。**  半模态页面回退（动画结束后）回调函数。 |
| onWillAppear | Option\<() -> Unit> | 否 |  Option.None | **命名参数。**  半模态页面显示（动画开始前）回调函数。 |
| onWillDisappear | Option\<() -> Unit> | 否 | Option.None | **命名参数。**  半模态页面回退（动画开始前）回调函数。<br>**说明：** 不允许在onWillDisappear函数中修改状态变量，可能会导致组件行为不稳定。 |

### class DismissSheetAction

```cangjie
public class DismissSheetAction {
    public DismissSheetAction(reason: DismissReason)
}
```

**功能：** 半模态页面关闭回调函数类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### DismissSheetAction(DismissReason)

```cangjie
public DismissSheetAction(reason: DismissReason)
```

**功能：** 半模态页面关闭回调函数类型的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| reason | DismissReason | 是 | \-  | 返回本次半模态页面退出的操作类型。|

#### func dismiss()

```cangjie
public func dismiss()
```

**功能：** 半模态页面关闭回调函数。开发者需要退出页面时调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

### class SheetDismiss

```cangjie
public class SheetDismiss {
    public SheetDismiss()
}
```

**功能：** 控制半模态的关闭类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### SheetDismiss()

```cangjie
public SheetDismiss()
```

**功能：** 控制半模态的关闭类型的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### func dismiss()

```cangjie
public func dismiss()
```

**功能：** 半模态面板关闭回调函数。开发者需要退出时调用，不需要退出时无需调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

### class SheetOptions

```cangjie
public class SheetOptions <: BindOptions {
    public init(
        backgroundColor!: Option<Color> = Color.WHITE,
        onAppear!: Option<() -> Unit> = Option.None,
        onDisappear!: Option<() -> Unit> = Option.None,
        onWillAppear!: Option<() -> Unit> = Option.None,
        onWillDisappear!: Option<() -> Unit> = Option.None,
        height!: Option<SheetSize> = Option.None,
        detents!: Option<Array<SheetSize>> = Option.None,
        preferType!: Option<SheetType> = Option.None,
        showClose!: Option<Bool> = Option.None,
        dragBar!: Option<Bool> = Option.None,
        blurStyle!: Option<BlurStyle> =  Option.None,
        maskColor!: Option<Color> = Option.None,
        title!: Option<() -> Unit> = Option.None,
        enableOutsideInteractive!: Option<Bool> = Option.None,
        shouldDismiss!: Option<(SheetDismiss) -> Unit> = Option.None,
        onWillDismiss!: Option<(DismissSheetAction) -> Unit> = Option.None,
        onWillSpringBackWhenDismiss!: Option<(SpringBackAction) -> Unit> =  Option.None,
        onHeightDidChange!: Option<(Float32) -> Unit> = Option.None,
        onDetentsDidChange!: Option<(Float32) -> Unit> = Option.None,
        onWidthDidChange!: Option<(Float32) -> Unit> = Option.None,
        onTypeDidChange!: Option<(Float32) -> Unit> = Option.None,
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<Color> = Color.BLACK,
        borderStyle!: Option<EdgeStyle> = EdgeStyle.SOILD,
        width!: Option<Length> = Option.None,
        shadow!: Option<ShadowOptions> = Option.None,
        mode!: Option<SheetMode> = SheetMode.OVERLAY,
        scrollSizeMode!: Option<ScrollSizeMode> = ScrollSizeMode.FOLLOW_DETENT
    )
}
```

**功能：** 配置半模态页面的可选属性，继承自[BindOptions](#class-bindoptions)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### init(...)

```cangjie
public init(
    backgroundColor!: Option<Color> = Color.WHITE,
    onAppear!: Option<() -> Unit> = Option.None,
    onDisappear!: Option<() -> Unit> = Option.None,
    onWillAppear!: Option<() -> Unit> = Option.None,
    onWillDisappear!: Option<() -> Unit> = Option.None,
    height!: Option<SheetSize> = Option.None,
    detents!: Option<Array<SheetSize>> = Option.None,
    preferType!: Option<SheetType> = Option.None,
    showClose!: Option<Bool> = Option.None,
    dragBar!: Option<Bool> = Option.None,
    blurStyle!: Option<BlurStyle> =  Option.None,
    maskColor!: Option<Color> = Option.None,
    title!: Option<() -> Unit> = Option.None,
    enableOutsideInteractive!: Option<Bool> = Option.None,
    shouldDismiss!: Option<(SheetDismiss) -> Unit> = Option.None,
    onWillDismiss!: Option<(DismissSheetAction) -> Unit> = Option.None,
    onWillSpringBackWhenDismiss!: Option<(SpringBackAction) -> Unit> = Option.None,
    onHeightDidChange!: Option<(Float32) -> Unit> = Option.None,
    onDetentsDidChange!: Option<(Float32) -> Unit> = Option.None,
    onWidthDidChange!: Option<(Float32) -> Unit> = Option.None,
    onTypeDidChange!: Option<(Float32) -> Unit> = Option.None,
    borderWidth!: Option<Length> = 0.vp,
    borderColor!: Option<Color> = Color.BLACK,
    borderStyle!: Option<EdgeStyle> = EdgeStyle.SOILD,
    width!: Option<Length> = Option.None,
    shadow!: Option<ShadowOptions> = Option.None,
    mode!: Option<SheetMode> = SheetMode.OVERLAY,
    scrollSizeMode!: Option<ScrollSizeMode> = ScrollSizeMode.FOLLOW_DETENT
)
```

**功能：** 配置半模态页面的可选属性构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| backgroundColor | Option\<[Color](./cj-common-types.md#color)> | 否 | Color.WHITE  | **命名参数。**  半模态页面的背板颜色，默认为白色。 |
| onAppear | Option\<() -> Unit> | 否 | Option.None  | **命名参数。**  半模态页面显示（动画结束后）回调函数。 |
| onDisappear | Option\<() -> Unit> | 否 | Option.None | **命名参数。**  半模态页面回退（动画结束后）回调函数。 |
| onWillAppear | Option\<() -> Unit> | 否 | Option.None | **命名参数。**  半模态页面显示（动画开始前）回调函数。 |
| onWillDisappear | Option\<() -> Unit> | 否 | Option.None | **命名参数。**  半模态页面回退（动画开始前）回调函数。<br>**说明：**<br>不允许在onWillDisappear函数中修改状态变量，可能会导致组件行为不稳定。 |
| height | Option\<() -> Unit> | 否 | Option.None  | **命名参数。**  半模态高度。<br>**说明：**<br>底部弹窗竖屏时，当设置detents时，该属性设置无效。<br>底部弹窗竖屏时，最大高度为距离信号栏8vp。<br>底部弹窗横屏时，该属性设置无效，高度为距离屏幕顶部8vp。<br>居中弹窗和跟手弹窗设置类型为SheetSize.LARGE和SheetSize.MUDIUM无效，显示默认高度560vp。居中弹窗和跟手弹窗最小高度为320vp，最大高度为窗口短边的90%。当使用Length设置的高度和使用SheetSize.FIT\_CONTENT自适应的高度大于最大高度，则显示最大高度，小于最小高度，则显示最小高度。 |
| detents | Option\<Array\<[SheetSize](#enum-sheetsize)>> | 否 | Option.None | **命名参数。**  半模态页面的切换高度档位。<br>**说明：**<br>底部弹窗竖屏生效，元组中第一个高度为初始高度。<br>面板可跟手滑动切换档位，松手后是否滑动至目标档位有两个判断条件：速度和距离。速度超过阈值，则执行滑动至与手速方向一致的目标档位；速度小于阈值，则引入距离判断条件，当位移距离>当前位置与目标位置的1/2，滑动至与手速方向一致的目标档位，位移距离当前位置与目标位置的1/2，返回至当前档位。速度阈值：1000，距离阈值：50%。 |
| preferType | Option\<[SheetType](#enum-sheettype)> | 否 | Option.None | **命名参数。**  半模态页面的样式。<br>**说明：**<br>preferType不可设置为SheetType.BOTTOM。 |
| showClose | Option\<Bool> | 否 | Option.None | **命名参数。**  是否显示关闭图标，默认显示关闭图标。使用关闭图标关闭半模态页面时，需要在onDisappear回调函数中将isShow参数置为false。参考示例代码。<br>**说明：**<br>Resource需要为Bool类型。 |
| dragBar | Option\<Bool> | 否  | Option.None | **命名参数。**  是否显示控制条。<br>**说明：**<br>半模态面板的dentents属性设置多个不同高度并且设置生效时，默认显示控制条。否则不显示控制条。 |
| blurStyle | Option\<BlurStyle> | 否  | Option.None | **命名参数。**  半模态面板的模糊背景。 |
| maskColor | Option\<[Color](./cj-common-types.md#color)> | 否  | \- | **命名参数。**  半模态页面的背景蒙层颜色。 |
| title | Option\<() -> Unit> | 否  | Option.None | **命名参数。**  半模态面板的标题。在使用时结合@Builder使用。 |
| enableOutsideInteractive | Option\<Bool> | 否  | Option.None | **命名参数。**  半模态所在页面是否允许交互。<br>**说明：**<br>设置为true时允许交互，不显示蒙层；设置为false时不允许交互，显示蒙层；若不进行设置，默认底部弹窗与居中弹窗不允许交互，跟手弹窗允许交互。当设置为true时，maskColor设置无效。 |
| shouldDismiss | Option\<([SheetDismiss](#class-sheetdismiss)) -> Unit> | 否  | Option.None  | **命名参数。**  半模态页面交互式关闭回调函数。<br>**说明：**<br>当用户执行下拉关闭/back事件/点击蒙层关闭/关闭按钮关闭交互操作时，如果注册该回调函数，则不会立刻关闭。 |
| onWillDismiss | Option\<([DismissSheetAction](#class-dismisssheetaction)) -> Unit> | 否  | Option.None  | **命名参数。**  半模态页面的交互式关闭回调函数允许开发者注册，以获取关闭操作的类型，并决定是否关闭半模态状态。<br>**说明：**<br>当用户触发关闭操作时，若已注册回调函数，则不会立即关闭页面，而是由开发者通过回调函数中的reason参数判断关闭操作的类型，进而根据具体原因自主选择是否关闭半模态页面。如果不注册该回调函数，则用户执行关闭操作时，正常关闭半模态，无其他行为。在onWillDismiss回调中，不能再做onWillDismiss拦截。建议在二次确认场景使用。 |
| onWillSpringBackWhenDismiss | Option\<([SpringBackAction](#springbackaction)) -> Unit> | 否  | Option.None  | **命名参数。**  半模态页面交互式关闭前控制回弹函数允许开发者注册，以控制半模态页面交互式关闭时的回弹效果。<br>**说明：**<br>当用户触发执行下拉关闭操作并同时注册该回调函数与shouldDimiss或onWillDismiss时，由开发者控制下滑关闭时是否回弹。在回调函数中可以通过调用springBack来实现回弹效果。也可以通过不调用springBack来取消回弹效果。<br>若不注册该回调函数，但注册shouldDimiss或onWillDismiss时，则默认在下滑关闭时，会触发回弹效果，回弹后再根据shouldDimiss或onWillDismiss内的回调行为决定半模态是否关闭。<br>如果不注册该回调函数，且未注册shouldDimiss或onWillDismiss时，默认在下滑关闭时，触发半模态关闭。|
| onHeightDidChange | Option\<(Float32) -> Unit> | 否  | Option.None  | **命名参数。**  半模态页面高度变化回调函数。<br>**说明：**<br>底部弹窗时，只有档位变化和拖拽跟手才返回每一帧高度，拉起半模态和避让软键盘只返回最后的高度，其他弹窗只在半模态拉起返回最后高度。返回值为px。 |
| onDetentsDidChange | Option\<(Float32) -> Unit> | 否  | Option.None  | **命名参数。**  半模态页面档位变化回调函数。<br>**说明：**<br>底部弹窗时，档位变化返回最后的高度。返回值为px。 |
| onWidthDidChange | Option\<(Float32) -> Unit> | 否  | Option.None  | **命名参数。**  半模态页面宽度变化回调函数。<br>**说明：**<br>宽度变化时返回最后的宽度。返回值为px。 |
| onTypeDidChange | Option\<(Float32) -> Unit> | 否  | Option.None  | **命名参数。**  半模态页面形态变化回调函数。<br>**说明：**<br>形态变化时返回最后的形态。 |
| borderWidth | Option\<Length> | 否  | 0.vp  | **命名参数。**  设置半模态页面的边框宽度。可分别设置4个边框宽度。<br>百分比参数方式：以父元素半模态页面宽的百分比来设置半模态页面的边框宽度。<br>当半模态页面左边框和右边框大于半模态页面宽度，半模态页面上边框和下边框大于半模态页面高度，显示可能不符合预期。<br>**说明：**<br>底部弹窗时，底部边框宽度设置无效。 |
| borderColor | Option\<Color> | 否  | Color.BLACK  | **命名参数。**  设置半模态页面的边框颜色。如果使用borderColor属性，需要和borderWidth属性一起使用。<br>**说明：**<br>底部弹窗时，底部边框颜色设置无效。 |
| borderStyle | Option\<[EdgeStyles](./cj-common-types.md#class-edgestyles)> | 否  | BorderStyle.Solid  | **命名参数。**  设置半模态页面的边框样式。如果使用borderStyle属性，需要和borderWidth属性一起使用。<br>**说明：**<br>底部弹窗时，底部边框样式设置无效。 |
| width | Option\<Length> | 否  | Option.None  | **命名参数。**  设置半模态页面的宽度。百分比参数方式：以父元素宽的百分比来设置半模态页面的宽度。 |
| shadow | Option\<ShadowOptions> | 否  | Option.None | **命名参数。**  设置半模态页面的阴影。 |
| mode | Option\<[SheetMode](#enum-sheetmode)> | 否  | SheetMode.OVERLAY  | **命名参数。**  设置半模态页面的显示层级。<br>**说明：**<br>半模态显示期间mode属性不支持动态切换，两种模式的显示层级完全不同，无法做到显示期间同一个半模态从一个层级变换到另一个层级。建议在使用时明确诉求固定mode值。 |
| scrollSizeMode | Option\<[ScrollSizeMode](#enum-scrollsizemode)> | 否  | ScrollSizeMode.FOLLOW_DETENT | **命名参数。**  设置半模态面板滑动时，内容区域刷新时机。 |

### class SheetTitleOptions

```cangjie
public class SheetTitleOptions {
    public init(title!: String, subtitle!: Option<String>)
}
```

**功能：** 半模态面板的标题。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### init(String, Option\<String>)

```cangjie
public init(title!: String, subtitle!: Option<String>)
```

**功能：** 半模态面板的标题的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| title | String | 是 | \-  | **命名参数。**  半模态面板的主标题。|
| subtitle | Option\<String> | 否 | \- | **命名参数。**  半模态面板的副标题。|

### class SpringBackAction

```cangjie
public class SpringBackAction {
    public SpringBackAction()
}
```

**功能：** 控制半模态关闭前的回弹类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### SpringBackAction()

```cangjie
public SpringBackAction()
```

**功能：** 控制半模态关闭前的回弹类型的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### func springBack()

```cangjie
public func springBack()
```

**功能：** 半模态页面关闭前控制回弹函数，开发者需要半模态回弹时调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

### enum ScrollSizeMode

```cangjie
public enum ScrollSizeMode {
    | FOLLOW_DETENT
    | CONTINUOUS
}
```

**功能：** 设置半模态面板滑动时，内容区域刷新时机。

**起始版本：** 19

#### FOLLOW_DETENT

```cangjie
FOLLOW_DETENT
```

**功能：** 设置半模态面板跟手滑动结束后更新内容显示区域。

**起始版本：** 19

#### CONTINUOUS

```cangjie
CONTINUOUS
```

**功能：** 设置半模态面板在滑动过程中持续更新内容显示区域。

**起始版本：** 19

### enum SheetMode

```cangjie
public enum SheetMode {
    | OVERLAY
    | EMBEDDED
}
```

**功能：** 设置半模态页面的显示层级。

**起始版本：** 19

#### OVERLAY

```cangjie
OVERLAY
```

**功能：** 设置半模态面板在当前UIContext内顶层显示，在所有页面之上。和弹窗类组件显示在一个层级。

**起始版本：** 19

#### EMBEDDED

```cangjie
EMBEDDED
```

**功能：** 设置半模态面板在当前页面内的顶层显示。

> **说明：**
>
> 目前只支持挂载在Page或者NavDestination节点上，若有NavDestination优先挂载在NavDestination上。只支持在这两种页面内顶层显示。<br>该模式下新起的页面可以覆盖在半模态弹窗上，页面返回后该半模态依旧存在，半模态面板内容不丢失。<br>该模式下需确保目标页面节点如Page节点已挂载上树，再拉起半模态，否则半模态将无法挂载到对应的页面节点内。

### enum SheetSize

```cangjie
public enum SheetSize {
    | MEDIUM
    | LARGE
    | FIT_CONTENT
}
```

**功能：** 设置半模态页面的切换高度档位。

**起始版本：** 12

#### MEDIUM

```cangjie
MEDIUM
```

**功能：** 指定半模态高度为屏幕高度一半。

**起始版本：** 12

#### LARGE

```cangjie
LARGE
```

**功能：** 指定半模态高度几乎为屏幕高度。

**起始版本：** 12

#### FIT_CONTENT

```cangjie
FIT_CONTENT
```

**功能：** 指定半模态高度为适应内容的高度。

**起始版本：** 12

### enum SheetType

```cangjie
public enum SheetType {
    | BOTTOM
    | CENTER
    | POPUP
}
```

**功能：** 设置半模态弹窗的样式。

**起始版本：** 12

#### BOTTOM

```cangjie
BOTTOM
```

**功能：** 底部弹窗。

**起始版本：** 12

#### CENTER

```cangjie
CENTER
```

**功能：** 居中弹窗。

**起始版本：** 12

#### POPUP

```cangjie
POPUP
```

**功能：** 跟手弹窗。跟手弹窗面板不支持跟手滑动，下滑面板不关闭。

**起始版本：** 12

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var isShow: Bool = false
    @State var isShow2: Bool = false
    public func onAppear() {
        AppLog.info("BindSheet onAppear.")
    }
    public func onDisappear() {
        AppLog.info("BindSheet onDisappear.")
    }
    @Builder
    public func myBuilder2() {
        Column() {
          Button("close modal 2")
            .margin(10)
            .fontSize(20)
            .onClick{
                this.isShow2 = false
            }
        }.width(100.percent)
         .height(100.percent)
         .justifyContent(FlexAlign.Center)
    }

    @Builder
    public func myBuilder() {
        Column() {
          Button("transition modal 2")
            .margin(10)
            .fontSize(20)
            .onClick({
              => this.isShow2 = true
            }).bindSheet(this.isShow2, myBuilder2)

          Button("close modal 1")
            .margin(10)
            .fontSize(20)
            .onClick({
              => this.isShow = false;
            })
        }
        .width(100.percent)
        .height(100.percent)
        .justifyContent(FlexAlign.Center)
    }
    func build() {
        Column {
            Button("transition modal 1")
            .onClick({
              => this.isShow = true
            })
            .fontSize(20)
            .margin(10)
            .bindSheet(this.isShow, myBuilder, options: SheetOptions(onDisappear: {=> this.isShow = false}) )
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.WHITE)
        .width(100.percent)
        .height(100.percent)
    }
}
```

![uni_bind_sheet](figures/uni_bind_sheet.gif)
