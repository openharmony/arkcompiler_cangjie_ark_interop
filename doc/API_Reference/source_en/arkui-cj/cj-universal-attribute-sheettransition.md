# Half-Modal Transition

The `bindSheet` property is used to bind a half-modal page to a component. When the component is inserted, the size of the half-modal can be determined by setting a custom or default built-in height.

> **Note:**
>
> Routing jumps are not supported.

## func bindSheet(Bool, () -> Unit, SheetOptions)

```cangjie
public func bindSheet(isShow: Bool, builder: () -> Unit, options!: SheetOptions = SheetOptions()): This
```

**Function:** Binds a half-modal page to a component, which is displayed when clicked.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isShow | Bool | Yes | \- | Whether to display the half-modal page. |
| builder | () -> Unit | Yes | \- | Configures the content of the half-modal page. Use with `@Builder`. |
| options | [SheetOptions](#class-sheetoptions) | No | SheetOptions() | **Named parameter.** Configures optional properties of the half-modal page. |

> **Notes:**
>
> - In cases of upward dragging for single-level half-modals or multi-level upward sliding for level switching, the content area updates after dragging ends or level switching completes.
> - A half-modal is strictly bound to its host node. To achieve an effect where the half-modal appears instantly when the page is displayed, ensure the host node is already mounted. If `isShow` is set to `true` before the host node is mounted, the half-modal will not take effect. It is recommended to use the [onAppear](./cj-universal-event-appear.md#func-onappear---unit) function to ensure the half-modal is displayed after the host node is mounted.
> - Especially when [SheetMode](#enum-sheetmode) = EMBEDDED, ensure both the host node and the corresponding page node are successfully mounted.
> - The exit animation of the half-modal page cannot be interrupted and does not respond to other gestures during execution. Currently, the exit animation uses a spring curve, which may have a visually subtle trailing effect. Therefore, when the half-modal exits, it may appear visually gone before the animation fully completes. Clicking to reopen the half-modal during this period will not respond. Wait for the animation to fully complete before reopening.

## Basic Type Definitions

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

**Function:** Configures optional properties for the half-modal page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

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

**Function:** Constructor for configuring optional properties of the half-modal page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| backgroundColor | Option\<[Color](./cj-common-types.md#class-color)> | No | Option.None | **Named parameter.** Background color of the half-modal page, default is white. |
| onAppear | Option\<() -> Unit> | No | Option.None | **Named parameter.** Callback function when the half-modal page appears (after animation ends). |
| onDisappear | Option\<() -> Unit> | No | Option.None | **Named parameter.** Callback function when the half-modal page exits (after animation ends). |
| onWillAppear | Option\<() -> Unit> | No | Option.None | **Named parameter.** Callback function when the half-modal page is about to appear (before animation starts). |
| onWillDisappear | Option\<() -> Unit> | No | Option.None | **Named parameter.** Callback function when the half-modal page is about to exit (before animation starts).<br>**Note:** Do not modify state variables in `onWillDisappear`, as it may cause unstable component behavior. |

### class DismissSheetAction

```cangjie
public class DismissSheetAction {
    public DismissSheetAction(reason: DismissReason)
}
```

**Function:** Callback function type for closing a half-modal page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### DismissSheetAction(DismissReason)

```cangjie
public DismissSheetAction(reason: DismissReason)
```

**Function:** Constructor for the half-modal page close callback function type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| reason | DismissReason | Yes | \- | Returns the operation type that triggered the half-modal page exit. |

#### func dismiss()

```cangjie
public func dismiss()
```

**Function:** Callback function for closing the half-modal page. Called by developers when the page needs to exit.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

### class SheetDismiss

```cangjie
public class SheetDismiss {
    public SheetDismiss()
}
```

**Function:** Controls the closing type of the half-modal.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### SheetDismiss()

```cangjie
public SheetDismiss()
```

**Function:** Constructor for controlling the closing type of the half-modal.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### func dismiss()

```cangjie
public func dismiss()
```

**Function:** Callback function for closing the half-modal panel. Called by developers when exiting is required; no need to call if not exiting.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

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
        blurStyle!: Option<BlurStyle> = Option.None,
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
}
```

**Function:** Configures optional properties for the half-modal page, inherits from [BindOptions](#class-bindoptions).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

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
    blurStyle!: Option<BlurStyle> = Option.None,
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

**Function:** Constructor for configuring optional properties of the half-modal page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| backgroundColor | Option\<[Color](./cj-common-types.md#color)> | No | Color.WHITE | **Named parameter.** Background color of the half-modal page, default is white. |
| onAppear | Option\<() -> Unit> | No | Option.None | **Named parameter.** Callback function when the half-modal page appears (after animation ends). |
| onDisappear | Option\<() -> Unit> | No | Option.None | **Named parameter.** Callback function when the half-modal page exits (after animation ends). |
| onWillAppear | Option\<() -> Unit> | No | Option.None | **Named parameter.** Callback function when the half-modal page is about to appear (before animation starts). |
| onWillDisappear | Option\<() -> Unit> | No | Option.None | **Named parameter.** Callback function when the half-modal page is about to exit (before animation starts).<br>**Note:**<br>Do not modify state variables in `onWillDisappear`, as it may cause unstable component behavior. |
| height | Option\<() -> Unit> | No | Option.None | **Named parameter.** Height of the half-modal.<br>**Notes:**<br>- For bottom sheets in portrait mode, this property is invalid if `detents` is set.<br>- Maximum height in portrait mode is 8vp from the signal bar.<br>- In landscape mode, this property is invalid; height is fixed at 8vp from the top.<br>- For center and follow-hand sheets, `SheetSize.LARGE` and `SheetSize.MEDIUM` are invalid; default height is 560vp. Minimum height is 320vp, maximum is 90% of the window's shorter side. If the height exceeds these limits, it is clamped. |
| detents | Option\<Array\<[SheetSize](#enum-sheetsize)>> | No | Option.None | **Named parameter.** Height levels for the half-modal page.<br>**Notes:**<br>- Effective only for bottom sheets in portrait mode. The first height in the array is the initial height.<br>- Panel can switch levels via drag. Two conditions determine whether it snaps to the target level: speed and distance. If speed exceeds a threshold, it snaps in the direction of the drag; otherwise, if distance > 50% of the current-to-target distance, it snaps. Speed threshold: 1000, distance threshold: 50%. |
| preferType | Option\<[SheetType](#enum-sheettype)> | No | Option.None | **Named parameter.** Style of the half-modal page.<br>**Note:**<br>`preferType` cannot be set to `SheetType.BOTTOM`. |
| showClose | Option\<Bool> | No | Option.None | **Named parameter.** Whether to show the close icon (default: true). When using the close icon, set `isShow` to `false` in `onDisappear`.<br>**Note:**<br>`Resource` must be of type `Bool`. |
| dragBar | Option\<Bool> | No | Option.None | **Named parameter.** Whether to show the control bar.<br>**Note:**<br>Shown by default if `detents` has multiple heights; otherwise hidden. |
| blurStyle | Option\<BlurStyle> | No | Option.None | **Named parameter.** Blur effect for the half-modal panel background. |
| maskColor | Option\<[Color](./cj-common-types.md#color)> | No | \- | **Named parameter.** Background mask color of the half-modal page. |
| title | Option\<() -> Unit> | No | Option.None | **Named parameter.** Title of the half-modal panel. Use with `@Builder`. |
| enableOutsideInteractive | Option\<Bool> | No | Option.None | **Named parameter.** Whether the host page is interactive.<br>**Note:**<br>- `true`: interactive, no mask; `false`: non-interactive, mask shown.<br>- Default: bottom and center sheets are non-interactive; follow-hand sheets are interactive.<br>- If `true`, `maskColor` is ignored. |
| shouldDismiss | Option\<([SheetDismiss](#class-sheetdismiss)) -> Unit> | No | Option.None | **Named parameter.** Callback for interactive closing.<br>**Note:**<br>If registered, closing (via drag/back/mask/close button) is delayed until handled. |
| onWillDismiss | Option\<([DismissSheetAction](#class-dismisssheetaction)) -> Unit> | No | Option.None | **Named parameter.** Callback for interactive closing, allowing developers to inspect the close reason and decide whether to close.<br>**Note:**<br>If registered, closing is delayed. Do not nest `onWillDismiss` calls. Recommended for confirmation dialogs. |
| onWillSpringBackWhenDismiss | Option\<([SpringBackAction](#springbackaction)) -> Unit> | No | Option.None | **Named parameter.** Callback to control rebound effect during interactive closing.<br>**Note:**<br>If registered with `shouldDismiss` or `onWillDismiss`, developers can control rebound via `springBack`. Default rebound occurs if only `shouldDismiss`/`onWillDismiss` is registered. If neither is registered, closing proceeds directly. |
| onHeightDidChange | Option\<(Float32) -> Unit> | No | Option.None | **Named parameter.** Callback for height changes.<br>**Note:**<br>- For bottom sheets: returns every frame during drag/level switch; final height only for opening/keyboard avoidance.<br>- For other sheets: final height only. Values in px. |
| onDetentsDidChange | Option\<(Float32) -> Unit> | No | Option.None | **Named parameter.** Callback for level changes.<br>**Note:**<br>For bottom sheets: returns final height after level switch. Values in px. |
| onWidthDidChange | Option\<(Float32) -> Unit> | No | Option.None | **Named parameter.** Callback for width changes.<br>**Note:**<br>Returns final width. Values in px. |
| onTypeDidChange | Option\<(Float32) -> Unit> | No | Option.None | **Named parameter.** Callback for style changes.<br>**Note:**<br>Returns final style. |
| borderWidth | Option\<Length> | No | 0.vp | **Named parameter.** Border width of the half-modal page. Supports per-edge settings.<br>**Note:**<br>- Percentage values are relative to the parent's width.<br>- If borders exceed the modal's dimensions, rendering may be unexpected.<br>- Bottom border width is ignored for bottom sheets. |
| borderColor | Option\<Color> | No | Color.BLACK | **Named parameter.** Border color. Requires `borderWidth`.<br>**Note:**<br>Bottom border color is ignored for bottom sheets. |
| borderStyle | Option\<[EdgeStyles](./cj-common-types.md#class-edgestyles)> | No | BorderStyle.Solid | **Named parameter.** Border style. Requires `borderWidth`.<br>**Note**Function:** Constructor for the title of a semi-modal panel.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| title | String | Yes | \- | **Named parameter.** Main title of the semi-modal panel. |
| subtitle | Option\<String> | No | \- | **Named parameter.** Subtitle of the semi-modal panel. |

### class SpringBackAction

```cangjie
public class SpringBackAction {
    public SpringBackAction()
}
```

**Function:** Controls the rebound type before closing a semi-modal panel.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### SpringBackAction()

```cangjie
public SpringBackAction()
```

**Function:** Constructor for controlling the rebound type before closing a semi-modal panel.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### func springBack()

```cangjie
public func springBack()
```

**Function:** Controls the rebound function before closing a semi-modal page. Developers should call this when a semi-modal rebound is needed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

### enum ScrollSizeMode

```cangjie
public enum ScrollSizeMode {
    | FOLLOW_DETENT
    | CONTINUOUS
}
```

**Function:** Sets the refresh timing of the content area during semi-modal panel scrolling.

**Since:** 19

#### FOLLOW_DETENT

```cangjie
FOLLOW_DETENT
```

**Function:** Sets the semi-modal panel to update the content display area after the hand-following scroll ends.

**Since:** 19

#### CONTINUOUS

```cangjie
CONTINUOUS
```

**Function:** Sets the semi-modal panel to continuously update the content display area during scrolling.

**Since:** 19

### enum SheetMode

```cangjie
public enum SheetMode {
    | OVERLAY
    | EMBEDDED
}
```

**Function:** Sets the display hierarchy of a semi-modal page.

**Since:** 19

#### OVERLAY

```cangjie
OVERLAY
```

**Function:** Sets the semi-modal panel to display at the top level within the current UIContext, above all pages. It shares the same hierarchy as popup components.

**Since:** 19

#### EMBEDDED

```cangjie
EMBEDDED
```

**Function:** Sets the semi-modal panel to display at the top level within the current page.

> **Note:**
>
> Currently, it only supports mounting on Page or NavDestination nodes. If NavDestination exists, it will be preferentially mounted on NavDestination. It only supports top-level display within these two types of pages.<br>In this mode, newly opened pages can overlay the semi-modal dialog. After returning to the page, the semi-modal dialog remains, and its content is preserved.<br>In this mode, ensure that the target page node (e.g., Page node) is already mounted on the tree before launching the semi-modal dialog; otherwise, the semi-modal dialog cannot be mounted to the corresponding page node.

### enum SheetSize

```cangjie
public enum SheetSize {
    | MEDIUM
    | LARGE
    | FIT_CONTENT
}
```

**Function:** Sets the height levels for switching semi-modal pages.

**Since:** 12

#### MEDIUM

```cangjie
MEDIUM
```

**Function:** Specifies the semi-modal height as half of the screen height.

**Since:** 12

#### LARGE

```cangjie
LARGE
```

**Function:** Specifies the semi-modal height to be almost the full screen height.

**Since:** 12

#### FIT_CONTENT

```cangjie
FIT_CONTENT
```

**Function:** Specifies the semi-modal height to adapt to the content height.

**Since:** 12

### enum SheetType

```cangjie
public enum SheetType {
    | BOTTOM
    | CENTER
    | POPUP
}
```

**Function:** Sets the style of the semi-modal dialog.

**Since:** 12

#### BOTTOM

```cangjie
BOTTOM
```

**Function:** Bottom dialog.

**Since:** 12

#### CENTER

```cangjie
CENTER
```

**Function:** Centered dialog.

**Since:** 12

#### POPUP

```cangjie
POPUP
```

**Function:** Hand-following dialog. The hand-following dialog panel does not support hand-following scrolling, and sliding down the panel does not close it.

**Since:** 12

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