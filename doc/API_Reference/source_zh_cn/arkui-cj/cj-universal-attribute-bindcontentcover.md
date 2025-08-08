# 全屏模态转场

通过bindContentCover属性为组件绑定全屏模态页面，在组件插入和删除时可通过设置转场参数ModalTransition显示过渡动效。

> **说明：**
>
> - 不支持横竖屏切换。
> - 不支持路由跳转。

## func bindContentCover(Bool, () -> Unit, ContentCoverOptions)

```cangjie
public func bindContentCover(isShow: Bool, builder: () -> Unit, contentCoverOptions: ContentCoverOptions): This
```

**功能：** 给组件绑定全屏模态页面，点击后显示模态页面。模态页面内容自定义，显示方式可设置无动画过渡，上下切换过渡以及透明渐变过渡方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------   | :---------- | :------- | :-------- | :----------|
| isShow | Bool |  是   |   \-   | 是否显示全屏模态页面。 |
| builder | () -> Unit |    是  |    \-  |  配置全屏模态页面内容。 |
| contentCoverOptions | [ContentCoverOptions](./cj-universal-attribute-bindcontentcover.md#class-contentcoveroptions) |   是   |   \-   |  配置全屏模态页面的可选属性。 |

## 基础类型定义

### class ContentCoverOptions

```cangjie
public class ContentCoverOptions <: BindOptions {
    public init(
        modalTransition!: ModalTransition = ModalTransition.DEFAULT,
        onWillDismiss!: Option<(DismissContentCoverAction) -> Unit> = Option.None,
        transition!: Option<TransitionEffect> = Option.None,
        backgroundColor!: Option<Color> = Option.None,
        onAppear!: Option<() -> Unit> = Option.None,
        onDisappear!: Option<() -> Unit> = Option.None,
        onWillAppear!: Option<() -> Unit> = Option.None,
        onWillDisappear!: Option<() -> Unit> = Option.None
    )
}
```

**功能：** 全屏模态页面转场。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

- BindOptions

#### init(ModalTransition, Option\<(DismissContentCoverAction) -> Unit>, Option\< TransitionEffect >, Option\< Color >, Option\<() -> Unit>, Option\<() -> Unit>, Option\<() -> Unit>, Option\<() -> Unit>)

```cangjie
public init(
    modalTransition!: ModalTransition = ModalTransition.DEFAULT,
    onWillDismiss!: Option<(DismissContentCoverAction) -> Unit> = Option.None,
    transition!: Option<TransitionEffect> = Option.None,
    backgroundColor!: Option<Color> = Option.None,
    onAppear!: Option<() -> Unit> = Option.None,
    onDisappear!: Option<() -> Unit> = Option.None,
    onWillAppear!: Option<() -> Unit> = Option.None,
    onWillDisappear!: Option<() -> Unit> = Option.None
)
```

**功能：** 构造一个ContentCoverOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------   | :---------- | :------- | :-------- | :----------|
| modalTransition | [ModalTransition](./cj-common-types.md#enum-modaltransition) |   否  | ModalTransition.DEFAULT  | **命名参数。**  全屏模态页面的转场方式。|
| onWillDismiss |Option<(DismissContentCoverAction) -> Unit> |   否  | Option.None | **命名参数。**  全屏模态页面交互式关闭回调函数。|
| transition |Option<TransitionEffect> |   否  | Option.None | **命名参数。**  全屏模态页面的自定义转场方式。|
| onAppear|Option<() -> Unit> |否|Option.None|**命名参数。** 全模态页面显示（动画结束后）回调函数。|
| onDisappear |Option<() -> Unit>|   否  | Option.None | **命名参数。**  全模态页面回退（动画结束后）回调函数。|
| onWillAppear |Option<() -> Unit>|   否  | Option.None | **命名参数。**  全模态页面显示（动画开始前）回调函数。 |
| onWillDisappear |Option<() -> Unit>|   否  | Option.None | **命名参数。**  全模态页面回退（动画开始前）回调函数。|

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
        AppLog.info("BindContentCover onAppear.")
    }
    public func onDisappear() {
        AppLog.info("BindContentCover onDisappear.")
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
            }).bindContentCover(this.isShow2, myBuilder2, ContentCoverOptions(
                modalTransition: ModalTransition.DEFAULT,
                backgroundColor: Color.GREEN,
                onAppear: onAppear,
                onDisappear: onDisappear)
            )

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
            .bindContentCover(this.isShow, myBuilder, ContentCoverOptions(
                 modalTransition: ModalTransition.DEFAULT,
                 backgroundColor: Color.RED,
                 onAppear: onAppear,
                 onDisappear: onDisappear)
            )
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.WHITE)
        .width(100.percent)
        .height(100.percent)
    }
}
```

![uni_bind_content_cover](figures/uni_bind_content_cover.gif)
