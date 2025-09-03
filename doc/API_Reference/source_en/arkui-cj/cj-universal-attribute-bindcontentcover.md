# Full-Screen Modal Transition

The `bindContentCover` property can be used to bind a full-screen modal page to a component. Transition effects can be displayed during component insertion and deletion by setting the `ModalTransition` parameters.

> **Note:**
>
> - Does not support landscape/portrait switching.
> - Does not support route navigation.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func bindContentCover(Bool, CustomBuilder, ContentCoverOptions)

```cangjie
public func bindContentCover(isShow: Bool, builder: CustomBuilder,
    options!: ContentCoverOptions = ContentCoverOptions()): This
```

**Function:** Binds a content overlay.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isShow | Bool | Yes | - | Whether to display. |
| builder | [CustomBuilder](#type-custombuilder) | Yes | - | Custom builder. |
| options | [ContentCoverOptions](#) | No | ContentCoverOptions() | Content overlay options. |

## Basic Type Definitions

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

**Function:** Full-screen modal page transition.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [BindOptions](#class-bindoptions)

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

**Function:** Constructs a `ContentCoverOptions` object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| modalTransition | [ModalTransition](#enum-modaltransition) | No | ModalTransition.Default | **Named parameter.** Transition style for the full-screen modal page. |
| onWillDismiss | ?([DismissContentCoverAction](#class-dismisscontentcoveraction))->Unit | No | Option.None | **Named parameter.** Callback function for interactive closing of the full-screen modal page. |
| transition | ?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect) | No | Option.None | **Named parameter.** Custom transition style for the full-screen modal page. |
| backgroundColor | ?[ResourceColor](cj-common-types.md#interface-resourcecolor) | No | Option.None | **Named parameter.** Background color of the full-screen modal page. |
| onAppear | ?()->Unit | No | Option.None | **Named parameter.** Callback function after the full-screen modal page is displayed (after animation ends). |
| onDisappear | ?()->Unit | No | Option.None | **Named parameter.** Callback function after the full-screen modal page is dismissed (after animation ends). |
| onWillAppear | ?()->Unit | No | Option.None | **Named parameter.** Callback function before the full-screen modal page is displayed (before animation starts). |
| onWillDisappear | ?()->Unit | No | Option.None | **Named parameter.** Callback function before the full-screen modal page is dismissed (before animation starts). |