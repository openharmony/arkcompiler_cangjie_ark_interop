# Full-Screen Modal Transition

The `bindContentCover` property allows components to be bound to full-screen modal pages. Transition effects can be displayed during component insertion and deletion by configuring the `ModalTransition` parameters.

> **Note:**
>
> - Does not support landscape/portrait switching.
> - Does not support route navigation.

## func bindContentCover(Bool, () -> Unit, ContentCoverOptions)

```cangjie
public func bindContentCover(isShow: Bool, builder: () -> Unit, contentCoverOptions: ContentCoverOptions): This
```

**Function:** Binds a full-screen modal page to a component, which displays upon click. The modal page content is customizable, with display modes configurable for no animation transition, slide-up/down transition, or opacity fade transition.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| isShow | Bool | Yes | \- | Whether to display the full-screen modal page. |
| builder | () -> Unit | Yes | \- | Configures the content of the full-screen modal page. |
| contentCoverOptions | [ContentCoverOptions](./cj-universal-attribute-bindcontentcover.md#class-contentcoveroptions) | Yes | \- | Configures optional properties of the full-screen modal page. |

## Basic Type Definitions

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

**Function:** Full-screen modal page transition.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parent Type:**

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

**Function:** Constructs a `ContentCoverOptions` object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| modalTransition | [ModalTransition](./cj-common-types.md#enum-modaltransition) | No | ModalTransition.DEFAULT | **Named parameter.** Transition style for the full-screen modal page. |
| onWillDismiss | Option<(DismissContentCoverAction) -> Unit> | No | Option.None | **Named parameter.** Callback function for interactive dismissal of the full-screen modal page. |
| transition | Option<TransitionEffect> | No | Option.None | **Named parameter.** Custom transition effect for the full-screen modal page. |
| onAppear | Option<() -> Unit> | No | Option.None | **Named parameter.** Callback function triggered after the full-screen modal page appears (post-animation). |
| onDisappear | Option<() -> Unit> | No | Option.None | **Named parameter.** Callback function triggered after the full-screen modal page disappears (post-animation). |
| onWillAppear | Option<() -> Unit> | No | Option.None | **Named parameter.** Callback function triggered before the full-screen modal page appears (pre-animation). |
| onWillDisappear | Option<() -> Unit> | No | Option.None | **Named parameter.** Callback function triggered before the full-screen modal page disappears (pre-animation). |

## Example Code

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