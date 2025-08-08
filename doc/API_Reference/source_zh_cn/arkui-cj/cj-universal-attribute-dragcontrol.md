# 拖拽控制

设置组件是否可以响应拖拽事件。

> **说明：**
>
> 开发者可以通过实现通用拖拽事件来自定义拖拽响应。
>
> <!--RP1--><!--RP1End-->需要开发者将draggable属性设置为true，并在onDragStart等接口中实现数据传输相关内容，才能正确处理拖拽。
>

## func draggable(Bool)

```cangjie
public open func draggable(value: Bool): This
```

**功能：** 设置该组件是否允许进行拖拽。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|组件是否允许进行拖拽。true表示允许拖拽，false表示不允许拖拽。<br/>初始值：false。|

## func dragPreview(DragItemInfo)

```cangjie
public func dragPreview(value: DragItemInfo): This
```

**功能：** 设置组件拖拽过程中的预览图。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[DragItemInfo](./cj-universal-event-drag.md#struct-dragiteminfo)|是|-|组件拖拽过程中的预览图，仅在[onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo)拖拽方式中有效。<br/>当组件支持拖拽并同时设置[bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype)的预览图时，则长按浮起的预览图以[bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype)设置的预览图为准。开发者在[onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring------unit)中返回的背板图优先级低于[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreviewdragiteminfo)设置的预览图，当设置了[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit)预览图时，拖拽过程中的背板图使用[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit)预览图。<br>当传入类型为string的id时，则将id对应组件的截图作为预览图。如果id对应的组件无法查找到，或者id对应的组件Visibility属性设置成none/hidden，则对组件自身进行截图作为拖拽预览图。目前截图不含有亮度、阴影、模糊和旋转等视觉效果。<br>初始值：空。|

## func dragPreview(String)

```cangjie
public func dragPreview(value: String): This
```

**功能：** 设置组件拖拽过程中的预览图。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|组件拖拽过程中的预览图，仅在[onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo)拖拽方式中有效。<br/>当组件支持拖拽并同时设置[bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype)的预览图时，则长按浮起的预览图以[bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype)设置的预览图为准。开发者在[onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo)中返回的背板图优先级低于[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit)设置的预览图，当设置了[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit)预览图时，拖拽过程中的背板图使用[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit)预览图。<br>当传入类型为string的id时，则将id对应组件的截图作为预览图。如果id对应的组件无法查找到，或者id对应的组件Visibility属性设置成none/hidden，则对组件自身进行截图作为拖拽预览图。目前截图不含有亮度、阴影、模糊和旋转等视觉效果。<br>初始值：空。|

## func dragPreview(() -> Unit)

```cangjie
public func dragPreview(builder: () -> Unit): This
```

**功能：** 设置组件拖拽过程中的预览图。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|() -> Unit|是|-|组件拖拽过程中的预览图，仅在[onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo)拖拽方式中有效。<br/>当组件支持拖拽并同时设置[bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype)的预览图时，则长按浮起的预览图以[bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype)设置的预览图为准。开发者在[onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo)中返回的背板图优先级低于[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit)设置的预览图，当设置了[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit)预览图时，拖拽过程中的背板图使用[dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit)预览图。<br>当传入类型为string的id时，则将id对应组件的截图作为预览图。如果id对应的组件无法查找到，或者id对应的组件Visibility属性设置成none/hidden，则对组件自身进行截图作为拖拽预览图。目前截图不含有亮度、阴影、模糊和旋转等视觉效果。<br>初始值：空。使用时结合@Builder和bind方法使用。|

## 基础类型定义

### class DragInteractionOptions

```cangjie
public class DragInteractionOptions {
    public DragInteractionOptions(
        public let isMultiSelectionEnabled!: Bool = false,
        public let defaultAnimationBeforeLifting!: Bool = false
    )
}
```

**功能：** 拖拽过程中的效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### let isMultiSelectionEnabled

```cangjie
public let isMultiSelectionEnabled: Bool = false
```

**功能：** 表示拖拽过程中背板图是否支持多选聚拢效果。true表示支持多选聚拢效果，false表示不支持多选聚拢效果。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 19

#### let defaultAnimationBeforeLifting

```cangjie
public let defaultAnimationBeforeLifting: Bool = false
```

**功能：** 表示是否启用长按浮起阶段组件自身的默认点按效果（缩小）。true表示启用默认点按效果，false表示不启用默认点按效果。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 19

#### DragInteractionOptions(Bool, Bool)

```cangjie
public DragInteractionOptions(public let isMultiSelectionEnabled!: Bool = false, public let defaultAnimationBeforeLifting!: Bool = false)
```

**功能：** 构造DragInteractionOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isMultiSelectionEnabled|Bool|否|false| **命名参数。** 表示拖拽过程中背板图是否支持多选聚拢效果。true表示支持多选聚拢效果，false表示不支持多选聚拢效果。|
|defaultAnimationBeforeLifting|Bool|否|false| **命名参数。** 表示是否启用长按浮起阶段组件自身的默认点按效果（缩小）。true表示启用默认点按效果，false表示不启用默认点按效果。|

### enum DragPreviewMode

```cangjie
public enum DragPreviewMode {
    | AUTO
    | DISABLE_SCALE
    | ENABLE_DEFAULT_SHADOW
    | ENABLE_DEFAULT_RADIUS
}
```

**功能：** 拖拽行为控制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### AUTO

```cangjie
AUTO
```

**功能：** 系统根据拖拽场景自动改变跟手点位置，根据规则自动对拖拽背板图进行缩放变换等。

**起始版本：** 19

#### DISABLE_SCALE

```cangjie
DISABLE_SCALE
```

**功能：** 禁用系统对拖拽背板图的缩放行为。

**起始版本：** 19

#### ENABLE_DEFAULT_SHADOW

```cangjie
ENABLE_DEFAULT_SHADOW
```

**功能：** 启用非文本类组件默认阴影效果。

**起始版本：** 19

#### ENABLE_DEFAULT_RADIUS

```cangjie
ENABLE_DEFAULT_RADIUS
```

**功能：** 启用非文本类组件统一圆角效果，默认值12vp。当应用自身设置的圆角值大于默认值或modifier设置的圆角时，则显示应用自定义圆角效果。

**起始版本：** 19
