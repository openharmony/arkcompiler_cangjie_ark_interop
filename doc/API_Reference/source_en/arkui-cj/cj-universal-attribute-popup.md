# Popup Control

Binds a popup dialog to a component and configures its content, interaction logic, and display state.

> **Note:**
>
> The display state of the popup dialog is reported in the `onStateChange` event callback. Its visibility has no strong correlation with the creation or destruction of the component.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func bindPopup(Bool, CustomPopupOptions)

```cangjie
public func bindPopup(show: Bool, popup: CustomPopupOptions): This
```

**Function:** Binds a custom popup dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| show | Bool | Yes | - | Whether to display. |
| popup | [CustomPopupOptions](#) | Yes | - | Custom popup dialog options. |

## func bindPopup(Bool, PopupOptions)

```cangjie
public func bindPopup(show: Bool, popup: PopupOptions): This
```

**Function:** Binds a popup dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| show | Bool | Yes | - | Whether to display. |
| popup | [PopupOptions](#) | Yes | - | Popup dialog options. |

## func dismiss()

```cangjie
public func dismiss(): Unit
```

**Function:** Intercepts the interactive close action of the popup and determines the result type. Developers need to call this when exiting; no call is needed if no exit is required.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## Basic Type Definitions

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

**Function:** Parameters for displaying a popup dialog.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var arrowHeight

```cangjie
public var arrowHeight: Length = 8.vp
```

**Function:** Sets the arrow height. Default: 8.vp.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**Function:** Sets the offset of the popup arrow on the dialog. When the arrow is above or below the bubble, a value of 0 means the arrow is aligned to the far left, and the offset is the distance from the arrow to the far left (default: centered). When the arrow is to the left or right of the bubble, the offset is the distance from the arrow to the top (default: centered). If displayed at the screen edge, the bubble will automatically shift left or right, and a value of 0 ensures the arrow always points to the bound component.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var arrowPointPosition

```cangjie
public var arrowPointPosition: Option<ArrowPointPosition>= None
```

**Function:** Sets the position of the bubble's arrow relative to the parent component. The arrow can be positioned at "Start," "Center," or "End" in both vertical and horizontal directions. All positions are within the parent component's bounds and will not exceed them.

**Type:** [ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var arrowWidth

```cangjie
public var arrowWidth: Length = 16.vp
```

**Function:** Sets the arrow width. If the set width exceeds the side length minus twice the bubble's corner radius, the arrow will not be drawn. Default: 16.vp.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var autoCancel

```cangjie
public var autoCancel: Bool = true
```

**Function:** Whether to automatically close the bubble when there is a page operation. Default: true.

**Type:** Bool

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
```

**Function:** Sets the bubble's blur background parameters. Default: BlurStyle.COMPONENT_ULTRA_THICK.

**Type:** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var backgroundColor

```cangjie
public var backgroundColor: Color = Color(0x1000000)
```

**Function:** Sets the background color of the bubble.

**Type:** [Color](cj-common-types.md#class-color)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var builder

```cangjie
public var builder: CustomBuilder = { => }
```

**Function:** Builder for the bubble's content.

> **Note:**
>
> Popup is a universal property. Custom popups do not support nested popups. The first-layer container component in the builder does not support the `position` property; using it will prevent the bubble from displaying. If a custom component is used in the builder, its `aboutToAppear` and `aboutToDisappear` lifecycles are unrelated to the popup's visibility and cannot be used to determine the popup's state.

**Type:** [CustomBuilder](./cj-common-types.md#type-custombuilder)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var enableArrow

```cangjie
public var enableArrow: Bool = true
```

**Function:** Whether to display the arrow. If the bubble's length on the arrow's side is insufficient to display the arrow, it will be hidden by default. For example, if `placement` is set to `Left` and the bubble height is less than the arrow width (32.vp) plus twice the bubble corner radius (48.vp), totaling 80.vp, the arrow will not be displayed. Default: true.

**Type:** Bool

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var focusable

```cangjie
public var focusable: Bool = false
```

**Function:** Whether the bubble gains focus after popping up. Default: false.

**Type:** Bool

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var followTransformOfTarget

```cangjie
public var followTransformOfTarget: Bool = false
```

**Function:** Whether the bubble can display at the transformed position when the bound host component or its parent container has transformations like rotation or scaling. Default: false.

**Type:** Bool

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var mask

```cangjie
public var mask:?Color = None
```

**Function:** Sets the color of the mask layer.

**Type:** ?[Color](cj-common-types.md#class-color)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var maskColor

```cangjie
public var maskColor: ResourceColor = Color(0x1000000)
```

**Function:** Sets the color of the bubble's mask layer.

**Type:** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var offset

```cangjie
public var offset: Position = Position(x: 0.0, y: 0.0)
```

**Function:** Sets the offset of the popup component relative to the display position specified by `placement`. Percentage values are not supported.

**Type:** [Position](cj-common-types.md#class-position)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var onStateChange

```cangjie
public var onStateChange: Option <(PopupStateChangeParam) -> Unit>= Option.None
```

**Function:** Sets the callback for popup state changes, with the parameter being the current display state.

**Type:** ([PopupStateChangeParam](#class-popupstatechangeparam))->Unit

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var onWillDismiss

```cangjie
public var onWillDismiss: Option <(DismissPopupAction) -> Unit>= None
```

**Function:** Sets the interception switch and callback function for interactive popup closing.

> **Note:**
>
> The `onWillDismiss` callback cannot perform another `onWillDismiss` interception.

**Type:** ([DismissPopupAction](#class-dismisspopupaction))->Unit

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var placement

```cangjie
public var placement: Placement = Placement.Bottom
```

**Function:** Sets the preferred display position of the bubble component. If the current position is insufficient, it will adjust automatically. Default: Placement.Bottom.

**Type:** [Placement](cj-common-types.md#enum-placement)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var popupColor

```cangjie
public var popupColor:?Color = None
```

**Function:** Sets the color of the bubble. To remove the blur background fill effect, set `backgroundBlurStyle` to `BlurStyle.NONE`.

**Type:** ?[Color](cj-common-types.md#class-color)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var radius

```cangjie
public var radius: Length = 20.vp
```

**Function:** Sets the corner radius of the bubble. Default: 20.vp.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var shadow

```cangjie
public var shadow: ShadowStyle = ShadowStyle.OuterDefaultMD
```

**Function:** Sets the shadow of the bubble. Default: ShadowStyle.OUTER_DEFAULT_MD.

**Type:** [ShadowStyle](cj-common-types.md#enum-shadowstyle)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool = false
```

**Function:** Whether to display the bubble in a sub-window. Default: false (not displayed).

**Type:** Bool

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var targetSpace

```cangjie
public var targetSpace: Length = 0.vp
```

**Function:** Sets the gap between the popup and the target.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var transition

```cangjie
public var transition: Option<TransitionEffect> = Option.None
```

**Function:** Customizes the animation effects for popup display and exit.

> **Note:**
>
> - If not set, default display/exit animations are used.
> - Pressing the back key during the display animation interrupts it and triggers the exit animation, resulting in a combined effect of both animations.
> - Pressing the back key during the exit animation does not interrupt it; the animation continues, and the back key is ignored.

**Type:** [TransitionEffect](./cj-animation-transition.md#class-transitioneffect)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var width

```cangjie
public var width: Length = 0.vp
```

**Function:** Sets the width of the popup.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

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
    showInSubWindow!: Bool, // 5.1 start
    backgroundColor!: Color = Color(0x1000000),
    arrowOffset!: Length = 0.vp,
    mask!: ?Color = None,
    targetSpace!: Length = 0.vp,
    offset!: Position = Position(x: 0.0, y: 0.0),
    width!: Length = 0.vp,
    arrowPointPosition!: ?ArrowPointPosition = None,
    arrowWidth!: Length = 16.v### class DismissPopupAction

```cangjie
public class DismissPopupAction {
    public let reason: DismissReason
}
```

**Function:** Sets the interactive close interception switch and callback function for popup.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### let reason

```cangjie
public let reason: DismissReason
```

**Function:** The dismissal reason, returns the event reason for intercepting the popup disappearance.

**Type:** [DismissReason](./cj-dialog-actionsheet.md#enum-dismissreason)

**Access:** Read-only

### class PopupMessageOptions

```cangjie
public class PopupMessageOptions {
    public var textColor: ResourceColor
    public var font: Font
    public init(textColor!: ResourceColor = Color(0x000000), font!: Font = Font())
}
```

**Function:** Parameters for popup message text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var font

```cangjie
public var font: Font
```

**Function:** Sets the font attributes for the popup message. Does not support setting family.

**Type:** [Font](cj-common-types.md#class-font)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var textColor

```cangjie
public var textColor: ResourceColor
```

**Function:** Sets the text color for the popup message.

**Type:** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(ResourceColor, Font)

```cangjie
public init(textColor!: ResourceColor = Color(0x000000), font!: Font = Font())
```

**Function:** Creates an object of type PopupMessageOptions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| textColor | [ResourceColor](cj-common-types.md#interface-resourcecolor) | No | Color(0x000000) | Text color for the popup message. |
| font | [Font](cj-common-types.md#class-font) | No | Font() | Font attributes for the popup message. |


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

**Function:** Parameters for popup.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var arrowHeight

```cangjie
public var arrowHeight: Length = 8.0.vp
```

**Function:** Sets the arrow height. Default value: 8.vp.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**Function:** Sets the offset of the popup arrow at the popup location. When the arrow is above or below the bubble, a value of 0 means the arrow is at the far left, and the offset is the distance from the arrow to the far left, defaulting to center. When the arrow is to the left or right of the bubble, the offset is the distance from the arrow to the top, defaulting to center. If displayed at the screen edge, the bubble will automatically shift left or right, and when the value is 0, the arrow always points to the bound component.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var arrowPointPosition

```cangjie
public var arrowPointPosition: Option<ArrowPointPosition>= None
```

**Function:** Sets the position of the bubble's arrow relative to the parent component's display position. The arrow can be positioned at "Start", "Center", or "End" in both vertical and horizontal directions. All these positions are within the parent component's area and will not exceed its boundaries.

**Type:** [ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var arrowWidth

```cangjie
public var arrowWidth: Length = 16.0.vp
```

**Function:** Sets the arrow width. If the set arrow width exceeds the length of the side minus twice the bubble's corner radius, the bubble arrow will not be drawn. Default value: 16.vp.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var autoCancel

```cangjie
public var autoCancel: Bool = true
```

**Function:** Sets whether to automatically close the bubble when there is an operation on the page. Default value: true.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
```

**Function:** Sets the blur background parameters for the bubble. Default value: BlurStyle.COMPONENT_ULTRA_THICK.

**Type:** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var enableArrow

```cangjie
public var enableArrow: Bool = true
```

**Function:** Sets whether to display the arrow. Default value: true. When there is insufficient space on the page to fully avoid the bubble, the bubble will cover the component and the arrow will not be displayed.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var followTransformOfTarget

```cangjie
public var followTransformOfTarget: Bool = false
```

**Function:** When the host component bound to the bubble or its parent container has transformations such as rotation or scaling applied, sets whether the bubble can be displayed at the corresponding transformed position. Default value: false.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var mask

```cangjie
public var mask: ResourceColor = Color(0x1000000)
```

**Function:** Sets the color of the mask layer.

**Type:** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var message

```cangjie
public var message: String = ""
```

**Function:** Sets the content of the popup message.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var messageOptions

```cangjie
public var messageOptions: PopupMessageOptions = PopupMessageOptions()
```

**Function:** Sets the parameters for the popup message text.

**Type:** [PopupMessageOptions](#class-popupmessageoptions)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var offset

```cangjie
public var offset: Position = Position(x: 0.0, y: 0.0)
```

**Function:** Sets the offset of the popup component relative to the display position set by placement. Percentage values are not supported.

**Type:** [Position](cj-common-types.md#class-position)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var onStateChange

```cangjie
public var onStateChange:?(PopupStateChangeParam) -> Unit = Option.None
```

**Function:** Sets the callback for popup state change events, with the parameter being the current display state of the popup.

**Type:** ?([PopupStateChangeParam](#class-popupstatechangeparam))->Unit

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var onWillDismiss

```cangjie
public var onWillDismiss:?(DismissPopupAction) -> Unit = None
```

**Function:** Sets the interception of exit events and executes the callback function.

> **Note:**
>
> Within the onWillDismiss callback, you cannot perform another onWillDismiss interception.

**Type:** ?([DismissPopupAction](#class-dismisspopupaction))->Unit

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var placement

```cangjie
public var placement: Placement = Placement.BottomLeft
```

**Function:** Sets the display position of the popup component relative to the target, defaulting to Placement.Bottom. If both placementOnTop and placement are set, the placement setting takes effect.

**Type:** [Placement](cj-common-types.md#enum-placement)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21#### var popupColor

```cangjie
public var popupColor: ResourceColor = Color(0x1000000)
```

**Function:** Sets the color of the popup bubble. To remove the blur background effect, set `backgroundBlurStyle` to `BlurStyle.NONE`.

**Type:** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var primaryButton

```cangjie
public var primaryButton: PopupButton = PopupButton(value: "", action: { => })
```

**Function:** Sets the first button. `value`: The text of the primary button in the popup. `action`: The callback function when the primary button is clicked.

**Type:** [PopupButton](#class-popupbutton)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var radius

```cangjie
public var radius: Length = 20.0.vp
```

**Function:** Sets the corner radius of the bubble. Default value: `20.vp`.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var secondaryButton

```cangjie
public var secondaryButton: PopupButton = PopupButton(value: "", action: { => })
```

**Function:** Sets the second button. `value`: The text of the secondary button in the popup. `action`: The callback function when the secondary button is clicked.

**Type:** [PopupButton](#class-popupbutton)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var shadow

```cangjie
public var shadow: ShadowStyle = ShadowStyle.OuterDefaultMD
```

**Function:** Sets the shadow of the bubble. Default value: `ShadowStyle.OUTER_DEFAULT_MD`.

**Type:** [ShadowStyle](cj-common-types.md#enum-shadowstyle)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool = false
```

**Function:** Sets whether to display the bubble in a sub-window. Default value: `false`.

**Type:** Bool

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var targetSpace

```cangjie
public var targetSpace: Length = 0.vp
```

**Function:** Sets the gap between the popup and the target.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var transition

```cangjie
public var transition:?TransitionEffect = Option.None
```

**Function:** Customizes the animation effects for popup display and exit.

> **Note:**
>
> - If not set, the default display/exit animation will be used.
> - Pressing the back key during the display animation will interrupt it and trigger the exit animation, resulting in a combined effect of both animations.
> - Pressing the back key during the exit animation will not interrupt it; the exit animation will continue, and the back key will not be responded to.

**Type:** ?[TransitionEffect](./cj-animation-transition.md#class-transitioneffect)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var width

```cangjie
public var width: Length = 0.vp
```

**Function:** Sets the width of the popup.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

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

**Function:** Parameters for the popup.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| message | String | Yes | - | Sets the content of the popup message |
| primaryButton | [PopupButton](#class-popupbutton) | No | PopupButton(value: "", action: { => }) | Sets the first button |
| secondaryButton | [PopupButton](#class-popupbutton) | No | PopupButton(value: "", action: { => }) | Sets the second button |
| onStateChange | ([PopupStateChangeParam](#class-popupstatechangeparam))->Unit | No | Option.None | Sets the callback for popup state changes |
| arrowOffset | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Sets the offset of the popup arrow relative to the popup |
| showInSubWindow | Bool | Yes | - | Sets whether to display the bubble in a sub-window |
| messageOptions | [PopupMessageOptions](#class-popupmessageoptions) | No | PopupMessageOptions() | Sets the text parameters for the popup message |
| mask | [Color](cj-common-types.md#class-color) | No | Color(0x1000000) | Sets the color of the mask layer |
| targetSpace | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Sets the gap between the popup and the target |
| placement | [Placement](cj-common-types.md#enum-placement) | No | Placement.BottomLeft | Sets the display position of the popup relative to the target |
| offset | [Position](cj-common-types.md#class-position) | No | Position(x: 0.0, y: 0.0) | Sets the offset of the popup relative to the position defined by `placement` |
| enableArrow | Bool | No | true | Sets whether to display the arrow |
| popupColor | [Color](cj-common-types.md#class-color) | No | Color(0x1000000) | Sets the color of the popup bubble |
| autoCancel | Bool | No | true | Sets whether to automatically close the bubble when there is an operation on the page |
| width | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Sets the width of the popup |
| arrowPointPosition | ?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition) | No | None | Sets the position of the bubble arrow relative to the parent component |
| arrowWidth | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 16.vp | Sets the width of the arrow |
| arrowHeight | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 8.vp | Sets the height of the arrow |
| radius | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 20.vp | Sets the corner radius of the bubble |
| shadow | [ShadowStyle](cj-common-types.md#enum-shadowstyle) | No | ShadowStyle.OuterDefaultMD | Sets the shadow of the bubble |
| backgroundBlurStyle | [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle) | No | BlurStyle.ComponentUltraThick | Sets the blur background parameters for the bubble |
| transition | ?[TransitionEffect](cj-animation-transition.md#class-transitioneffect) | No | Option.None | Customizes the animation effects for popup display and exit |
| onWillDismiss | ([DismissPopupAction](#class-dismisspopupaction))->Unit | No | None | Sets the callback function to intercept the exit event |
| followTransformOfTarget | Bool | No | false | When the host component bound to the bubble or its parent container has transformations like rotation or scaling, sets whether the bubble can be displayed at the transformed position |