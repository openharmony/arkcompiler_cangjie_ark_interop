# 全屏模态转场

通过bindContentCover属性为组件绑定全屏模态页面，在组件插入和删除时可通过设置转场参数ModalTransition显示过渡动效。

> **说明：**
>
> - 不支持横竖屏切换。
> - 不支持路由跳转。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func bindContentCover(Bool, CustomBuilder, ContentCoverOptions)

```cangjie
public func bindContentCover(isShow: Bool, builder: CustomBuilder,
    options!: ContentCoverOptions = ContentCoverOptions()): This
```

**功能：** 绑定内容覆盖层。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isShow|Bool|是|-|是否显示。|
|builder|[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-|自定义构建器。|
|options|[ContentCoverOptions](#class-contentcoveroptions))|否|ContentCoverOptions()|内容覆盖层选项。|

## 基础类型定义

### class ContentCoverOptions

```cangjie
public class ContentCoverOptions <: BindOptions {
    public init(
        modalTransition!: ModalTransition = ModalTransition.Default,
        onWillDismiss!: ?(DismissContentCoverAction) -> Unit = Option.None,
        transition!: ?TransitionEffect = Option.None,
        backgroundColor!: ?ResourceColor = Option.None,
        onAppear!: ?() -> Unit = Option.None,
        onDisappear!: ?() -> Unit = Option.None,
        onWillAppear!: ?() -> Unit = Option.None,
        onWillDisappear!: ?() -> Unit = Option.None
    )
}
```

**功能：** 全屏模态页面转场

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [BindOptions](./cj-universal-attribute-sheettransition.md#class-bindoptions)

#### init(ModalTransition, ?(DismissContentCoverAction) -> Unit, ?TransitionEffect, ?ResourceColor, ?() -> Unit, ?() -> Unit, ?() -> Unit, ?() -> Unit)

```cangjie
public init(
    modalTransition!: ModalTransition = ModalTransition.Default,
    onWillDismiss!: ?(DismissContentCoverAction) -> Unit = Option.None,
    transition!: ?TransitionEffect = Option.None,
    backgroundColor!: ?ResourceColor = Option.None,
    onAppear!: ?() -> Unit = Option.None,
    onDisappear!: ?() -> Unit = Option.None,
    onWillAppear!: ?() -> Unit = Option.None,
    onWillDisappear!: ?() -> Unit = Option.None
)
```

**功能：** 构造一个ContentCoverOptions类型的对象

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|modalTransition|[ModalTransition](./cj-common-types.md#enum-modaltransition)|否|ModalTransition.Default|**命名参数。** 全屏模态页面的转场方式|
|onWillDismiss|?([DismissContentCoverAction](./cj-common-types.md#class-dismisscontentcoveraction))->Unit|否|Option.None|**命名参数。** 全屏模态页面交互式关闭回调函数|
|transition|?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)|否|Option.None|**命名参数。** 全屏模态页面的自定义转场方式|
|backgroundColor|?[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Option.None|**命名参数。** 全模态页面的背板颜色。|
|onAppear|?()->Unit|否|Option.None|**命名参数。** 全模态页面显示（动画结束后）回调函数|
|onDisappear|?()->Unit|否|Option.None|**命名参数。** 全模态页面回退（动画结束后）回调函数|
|onWillAppear|?()->Unit|否|Option.None|**命名参数。** 全模态页面显示（动画开始前）回调函数|
|onWillDisappear|?()->Unit|否|Option.None|**命名参数。** 全模态页面回退（动画开始前）回调函数|
