# Popup Control

Bind popup dialogs to components and configure their content, interaction logic, and display state.

> **Note:**
>
> The display state of popup dialogs is reported in the `onStateChange` event callback. Their visibility has no strict correspondence with the creation or destruction of components.

## func bindPopup(Bool, CustomPopupOptions)

```cangjie
public func bindPopup(
    show!: Bool,
    popup!: CustomPopupOptions
)
```

**Function:** Binds a Popup dialog to a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| show | Bool | Yes | - | **Named parameter.** The display state of the popup dialog.<br/>Initial value: false, indicating the popup is hidden. The popup dialog must wait for the page to fully render before displaying. Therefore, `show` cannot be set to true during page construction, as this may cause incorrect popup positioning or shape. |
| popup | [CustomPopupOptions](#class-custompopupoptions) | Yes | - | **Named parameter.** Configures the parameters for the current popup dialog. |

## func bindPopup(Bool, PopupOptions)

```cangjie
public func bindPopup(
    show!: Bool,
    popup!: PopupOptions
)
```

**Function:** Binds a Popup dialog to a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| show | Bool | Yes | - | **Named parameter.** The display state of the popup dialog.<br/>Initial value: false, indicating the popup is hidden. The popup dialog must wait for the page to fully render before displaying. Therefore, `show` cannot be set to true during page construction, as this may cause incorrect popup positioning or shape. |
| popup | [PopupOptions](#class-popupoptions) | Yes | - | **Named parameter.** Configures the parameters for the current popup dialog. |

## Basic Type Definitions

### class Action

```cangjie
public class Action {
    public Action(
        let value!: String,
        let action!: () -> Unit
    )
}
```

**Function:** Configures the parameters for popup buttons.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### let value

```cangjie
let value: String
```

**Function:** The text of the primary button in the popup.

**Type:** String

**Access:** Read-only

**Since:** 12

#### let action

```cangjie
let action: () -> Unit
```

**Function:** The callback function triggered when the auxiliary button is clicked.

**Type:** () -> Unit

**Access:** Read-only

**Since:** 12

#### Action(String, () -> Unit)

```cangjie
public Action(let value!: String, let action!: () -> Unit)
```

**Function:** Constructs an object of type `Action`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | **Named parameter.** The text of the primary button in the popup. |
| action | () -> Unit | No | None | **Named parameter.** The callback function triggered when the auxiliary button is clicked. |

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

**Function:** Parameters for displaying popup dialogs.

**Since:** 12

#### var arrowHeight

```cangjie
public var arrowHeight: Length = 8.vp
```

**Function:** Sets the height of the arrow. Default: 8.vp.

**Type:** [Length](./cj-common-types.md#interface-length)

**Access:** Read-write

**Since:** 19

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**Function:** Sets the offset of the popup arrow relative to the dialog. When the arrow is positioned above or below the bubble, a value of 0 indicates the arrow is aligned to the far left, and the offset is the distance from the arrow to the far left (default: centered). When the arrow is positioned to the left or right of the bubble, the offset is the distance from the arrow to the top (default: centered). If displayed at the screen edge, the bubble will automatically adjust horizontally. A value of 0 ensures the arrow always points to the bound component.

**Type:** [Length](./cj-common-types.md#interface-length)

**Access:** Read-write

**Since:** 19

#### var arrowPointPosition

```cangjie
public var arrowPointPosition: Option<ArrowPointPosition>= None
```

**Function:** Sets the position of the bubble's arrow relative to the parent component. The arrow can be positioned at "Start," "Center," or "End" in both vertical and horizontal directions. All positions are within the parent component's bounds and will not exceed them.

**Type:** ?[ArrowPointPosition](./cj-common-types.md#enum-arrowpointposition)

**Access:** Read-write

**Since:** 19

#### var arrowWidth

```cangjie
public var arrowWidth: Length = 16.vp
```

**Function:** Sets the width of the arrow. If the set arrow width exceeds the length of the side minus twice the bubble's corner radius, the arrow will not be drawn. Default: 16.vp.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-write

**Since:** 19

#### var autoCancel

```cangjie
public var autoCancel: Bool = true
```

**Function:** Determines whether the bubble automatically closes when there is user interaction on the page. Default: true.

**Type:** Bool

**Access:** Read-write

**Since:** 12

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
```

**Function:** Sets the blur effect parameters for the bubble background. Default: BlurStyle.COMPONENT_ULTRA_THICK.

**Type:** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**Access:** Read-write

**Since:** 19

#### var backgroundColor

```cangjie
public var backgroundColor: Color = Color(0x1000000)
```

**Function:** Sets the background color of the bubble.

**Type:** [Color](./cj-common-types.md#class-color)

**Access:** Read-write

**Since:** 19

#### var builder

```cangjie
public var builder:() -> Unit
```

**Function:** The constructor for the bubble's content.

> **Note:**
>
> `popup` is a general property. Custom popups do not support nested popups. The first-layer container component in `builder` does not support the `position` property; using it will prevent the bubble from displaying. If custom components are used in `builder`, their `aboutToAppear` and `aboutToDisappear` lifecycles are unrelated to the popup's visibility and should not be used to determine the popup's state.

**Type:** ()->Unit**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var enableArrow

```cangjie
public var enableArrow: Bool = true
```

**Function:** Sets whether to display the arrow. If the bubble length on the arrow's side is insufficient to display the arrow, it will not be shown by default. For example, when placement is set to Left, if the bubble height is less than the sum of the arrow width (32.vp) and twice the bubble corner radius (48.vp) (80.vp), the arrow will not be displayed. Default value: true.

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var focusable

```cangjie
public var focusable: Bool = false
```

**Function:** Sets whether the bubble gains focus after popping up. Default value: false.

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var followTransformOfTarget

```cangjie
public var followTransformOfTarget: Bool = false
```

**Function:** Determines whether the bubble can be displayed at the transformed position when the host component it is bound to or the parent container of the host component undergoes transformations such as rotation or scaling. Default value: false.

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var mask

```cangjie
public var mask: Color = Color(0x1000000)
```

**Function:** Sets the color of the mask layer.

**Type:** [Color](./cj-common-types.md#class-color)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var maskColor

```cangjie
public var maskColor: Color = Color(0x1000000)
```

**Function:** Sets the color of the bubble mask layer.

**Type:** [Color](./cj-common-types.md#class-color)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var offset

```cangjie
public var offset: Position = Position(0.0, 0.0)
```

**Function:** Sets the offset of the popup component relative to the display position specified by placement. Percentage values are not supported.

**Type:** [Position](./cj-common-types.md#class-position)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var onStateChange

```cangjie
public var onStateChange: Option <(StateChangeEvent) -> Unit>= Option.None
```

**Function:** Sets the callback for popup state change events, with the parameter being the current display state of the popup.

**Type:** ?[StateChangeEvent](#class-statechangeevent)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var onWillDismiss

```cangjie
public var onWillDismiss: Option <(DismissPopupAction) -> Unit>= None
```

**Function:** Sets the interactive close interception switch and callback function for the popup.

> **Note:**
>
> Within the onWillDismiss callback, no further onWillDismiss interception can be performed.

**Type:** ([DismissPopupAction](#class-dismisspopupaction))->Unit

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var placement

```cangjie
public var placement: Placement = Placement.Bottom
```

**Function:** Sets the preferred display position of the bubble component. If the current position cannot accommodate it, the position will be automatically adjusted. Default value: Placement.Bottom.

**Type:** [Placement](./cj-common-types.md#enum-placement)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var popupColor

```cangjie
public var popupColor: Color = Color(0x1000000)
```

**Function:** Sets the color of the tooltip bubble. To remove the blur background effect, set backgroundBlurStyle to BlurStyle.NONE.

**Type:** [Color](./cj-common-types.md#class-color)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var radius

```cangjie
public var radius: Length = 20.vp
```

**Function:** Sets the corner radius of the bubble. Default value: 20.vp.

**Type:** [Length](./cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var shadow

```cangjie
public var shadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD
```

**Function:** Sets the shadow of the bubble. Default value: ShadowStyle.OUTER_DEFAULT_MD.

**Type:** [ShadowStyle](cj-common-types.md#enum-shadowstyle)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool = false
```

**Function:** Sets whether to display the bubble in a sub-window. Default value: false (not displayed).

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var targetSpace

```cangjie
public var targetSpace: Length = 0.vp
```

**Function:** Sets the gap between the popup and the target.

**Type:** [Length](cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var transition

```cangjie
public var transition: Option<TransitionEffect>= Option.None
```

**Function:** Customizes the animation effects for popup display and exit.

**Type:** ?TransitionEffect

**Read-Write Capability:** Read-Write

**Initial Version:** 19

> **Note:**
>
> - If not set, the default display/exit animation effects will be used.
> - Pressing the back key during the display animation will interrupt the display animation and execute the exit animation, with the effect being a combination of the display and exit animation curves.
> - Pressing the back key during the exit animation will not interrupt it; the exit animation will continue, and the back key will not be responded to.

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var width

```cangjie
public var width: Length = 0.vp
```

**Function:** Sets the width of the popup.

**Type:** [Length](./cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

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

**Function:** Creates an object of type CustomPopupOptions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| builder | ()->Unit | Yes | - | **Named parameter.** Constructor for the tooltip bubble content. Used in combination with @Builder and bind methods. |
| placement | [Placement](./cj-common-types.md#enum-placement) | No | Placement.Bottom | **Named parameter.** Preferred display position of the bubble component.<br>**Note:** If the current position cannot accommodate it, the position will be automatically adjusted. |
| maskColor | [Color](./cj-common-types.md#class-color) | No | Color(0x1000000) | **Named parameter.** Color of the tooltip bubble mask layer. |
| popupColor | [Color](./cj-common-types.md#class-color) | No | Color(0x1000000) | **Named parameter.** Color of the tooltip bubble. |
| arrowOffset | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Offset of the popup arrow on the popup.<br>**Note:** When the arrow is on the top or bottom of the bubble, a value of 0 means the arrow is aligned to the far left, and the offset is the distance from the arrow to the far left (default is centered). When the arrow is on the left or right side of the bubble, the offset is the distance from the arrow to the top (default is centered). If displayed at the screen edge, the bubble will automatically shift left or right, and a value of 0 ensures the arrow always points to the bound component. |
| enableArrow | Bool | No | true | **Named parameter.** Whether to display the arrow.<br>**Note:** If the bubble length on the arrow's side is insufficient to display the arrow, it will not be shown by default. For example, when placement is set to Left, if the bubble height is less than the arrow width (32vp), the arrow will not be displayed. |
| autoCancel | Bool | No | true | **Named parameter.** Whether to automatically close the bubble when there is an operation on the page. |
| onStateChange | ?([StateChangeEvent](#class-statechangeevent))->Unit | No | None | **Named parameter.** Callback for popup state change events, with the parameter being the current display state of the popup. |

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

**Function:** Creates an object of type CustomPopupOptions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| builder | ()->Unit | Yes | - | **Named parameter.** Builder for popup content. Used with @Builder and bind methods. |
| placement | [Placement](./cj-common-types.md#enum-placement) | No | Placement.Bottom | **Named parameter.** Preferred display position of the popup component.<br>**Note:** If insufficient space is available at the current position, the position will be automatically adjusted. |
| maskColor | [Color](./cj-common-types.md#class-color) | No | Color(0x1000000) | **Named parameter.** Color of the popup mask layer. |
| backgroundColor | [Color](cj-common-types.md#class-color) | No | Color(0x1000000) | **Named parameter.** Background color of the popup. |
| enableArrow | Bool | No | true | **Named parameter.** Whether to display the arrow.<br>**Note:** If the popup length on the arrow's side is insufficient to display the arrow, it will be hidden by default. For example: if placement is set to Left but the popup height is less than the arrow width (32vp), the arrow will not be displayed. |
| autoCancel | Bool | No | true | **Named parameter.** Whether to automatically close the popup when there is user interaction on the page. |
| onStateChange | ?([StateChangeEvent](#class-statechangeevent))->Unit | No | None | **Named parameter.** Callback for popup state changes, with the parameter being the current display state of the popup. |
| popupColor | [Color](./cj-common-types.md#class-color) | No | Color(0x1000000) | **Named parameter.** Color of the popup. |
| arrowOffset | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Offset of the popup arrow relative to the popup.<br>**Note:** When the arrow is positioned above or below the popup, a value of 0 indicates the arrow is aligned to the far left, with the offset being the distance from the arrow to the far left (default is centered). When the arrow is positioned to the left or right of the popup, the offset is the distance from the arrow to the top (default is centered). If displayed at the screen edge, the popup will automatically adjust horizontally, with a value of 0 ensuring the arrow always points to the bound component. |
| showInSubWindow | Bool | No | false | **Named parameter.** Whether to display the popup in a sub-window. |
| mask | [Color](./cj-common-types.md#class-color) | No | Color(0x1000000) | **Named parameter.** Color of the popup mask layer. |
| targetSpace | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Gap between the popup and the target. |
| offset | [Position](./cj-common-types.md#class-position) | No | Position(0.0, 0.0) | **Named parameter.** Offset of the popup component relative to the position set by placement.<br>**Note:** Percentage values are not supported. |
| width | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Width of the popup.<br>**Note:** When showInSubWindow=true, the maximum height is the device screen height; when showInSubWindow=false, the maximum height is the application window height. Height limitation logic = maximum height - status bar height (0 if none) - dock height (0 if none) - 40VP - 40VP. |
| arrowPointPosition | ?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition) | No | None | **Named parameter.** Position of the popup arrow relative to the parent component's display area. The arrow can be positioned at "Start," "Center," or "End" in both vertical and horizontal directions. All positions are within the parent component's boundaries. |
| arrowWidth | [Length](cj-common-types.md#interface-length) | No | 16.vp | **Named parameter.** Width of the arrow.<br>**Note:** If the set arrow width exceeds the side length minus twice the popup corner radius, the arrow will not be drawn. |
| arrowHeight | [Length](cj-common-types.md#interface-length) | No | 8.vp | **Named parameter.** Height of the arrow.<br>**Note:** Percentage values are not supported. |
| radius | [Length](cj-common-types.md#interface-length) | No | 20.vp | **Named parameter.** Corner radius of the popup. |
| shadow | [ShadowStyle](cj-common-types.md#enum-shadowstyle) | No | ShadowStyle.OUTER_DEFAULT_MD | **Named parameter.** Shadow of the popup. |
| backgroundBlurStyle | [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle) | No | BlurStyle.COMPONENT_ULTRA_THICK | **Named parameter.** Blur effect parameters for the popup background. |
| focusable | Bool | No | false | **Named parameter.** Whether the popup gains focus after being displayed. |
| transition | ?TransitionEffect | No | None | **Named parameter.** Custom animation effects for popup display and exit.<br>**Note:**<br>1. If not set, default display/exit animations are used.<br>2. Pressing the back key during display animation interrupts the display and triggers the exit animation, with the combined effect of both animations.<br>3. Pressing the back key during exit animation does not interrupt the exit animation, and the back key is not processed. |
| onWillDismiss | ([DismissPopupAction](#class-dismisspopupaction)) -> Unit | No | None | **Named parameter.** Intercepts the exit event and executes a callback function.<br>**Note:** The onWillDismiss callback cannot be nested within another onWillDismiss callback. |
| followTransformOfTarget | Bool | No | false | **Named parameter.** Whether the popup follows the transformed position (e.g., rotation, scaling) of the bound host component or its parent container. |

#### init()

```cangjie
public init()
```

**Function:** Creates an empty CustomPopupOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

### class DismissPopupAction

```cangjie
public class DismissPopupAction {
    public DismissPopupAction(public let reason!: DismissReason)
}
```

**Function:** Sets the interactive dismissal interception switch and callback function for the popup.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### let reason

```cangjie
public let reason: DismissReason
```

**Function:** Dismissal reason, returns the event reason for intercepting the popup disappearance.

**Type:** DismissReason

**Access:** Read-only

**Since:** 19

#### DismissPopupAction(DismissReason)

```cangjie
public DismissPopupAction(public let reason!: DismissReason)
```

**Function:** Constructs a DismissPopupAction object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| reason | DismissReason | No | - | **Named parameter.** Dismissal reason, returns the event reason for intercepting the popup disappearance. |

#### func dismiss()

```cangjie
public func dismiss()
```

**Function:** Interactive dismissal interception switch and result type for the popup. Developers must call this method to exit; no call is needed if exit is not required.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

### struct PopupMessageOptions

```cangjie
public struct PopupMessageOptions {
    public PopupMessageOptions(
        public let textColor!: Color = Color(0x000000),
        public let font!: Fonts = Fonts()
    )
}
```

**Function:** Parameters for popup message text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### let font

```cangjie
public let font: Fonts = Fonts()
```

**Function:** Sets font attributes for the popup message. Does not support setting family.

**Type:** [Fonts](./cj-common-types.md#class-fonts)

**Access:** Read-only

**Since:** 19

#### let textColor

```cangjie
public let textColor: Color = Color(0x000000)
```

**Function:** Sets the text color for the popup message.

**Type:** [Color](./cj-common-types.md#class-color)

**Access:** Read-only

**Since:** 19

#### PopupMessageOptions(Color, Fonts)

```cangjie
public PopupMessageOptions(
    public let textColor!: Color = Color(0x000000),
    public let font!: Fonts = Fonts()
)
```

**Function:** Creates a PopupMessageOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| textColor | [Color](./cj-common-types.md#class-color) | No | Color(0x000000) | **Named parameter.** Text color for the popup message. |
| font | [Fonts](./cj-common-types.md#class-fonts) | No | Fonts() | **Named parameter.** Font attributes for the popup message. |

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

**Function:** Parameters for the popup.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### var arrowHeight

```cangjie
public var arrowHeight: Length = 8.vp
```

**Function:** Sets the arrow height. Default value: 8.vp.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-write

**Since:** 12

#### var arrowOffset

```cangjie
public var arrowOffset: Length = 0.vp
```

**Function:** Sets the offset of the popup arrow relative to the popup. When the arrow is positioned above or below the popup, a value of 0 indicates the arrow is aligned to the far left, with the offset being the distance from the arrow to the far left (default is centered). When the arrow is positioned to the left or right of the popup, the offset is the distance from the arrow to the top (default is centered). If displayed at the screen edge, the popup will automatically adjust horizontally, with a value of 0 ensuring the arrow always points to the bound component.

**Type:** [Length](cj-common-types.md#interface-length)

**Access:** Read-write

**Since:** 12

#### var arrowPointPosition

```cangjie
public var arrowPointPosition: Option<ArrowPointPosition>= None
```

**Function:** Sets the position of the popup arrow relative to the parent component's display area. The arrow can be positioned at "Start," "Center," or "End" in both vertical and horizontal directions. All positions are within the parent component's boundaries.

**Type:** ?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition)

**Access:** Read-write

**Since:** 12

#### var arrowWidth

```cangjie
public var arrowWidth: Length = 16.vp
```

**Function:** Sets the arrow width. If the set arrow width exceeds the side length minus twice the popup corner radius, the arrow will not be drawn. Default value: 16.vp.**Type:** [Length](cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var autoCancel

```cangjie
public var autoCancel: Bool = true
```

**Function:** Sets whether to automatically close the bubble when there is an operation on the page. Default value: true.

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var backgroundBlurStyle

```cangjie
public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
```

**Function:** Sets the blur background parameters for the bubble. Default value: BlurStyle.COMPONENT_ULTRA_THICK.

**Type:** [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var enableArrow

```cangjie
public var enableArrow: Bool = true
```

**Function:** Sets whether to display the arrow. Default value: true. When the available space on the page cannot fully accommodate the bubble, the bubble will overlay the component without displaying the arrow.

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var followTransformOfTarget

```cangjie
public var followTransformOfTarget: Bool = false
```

**Function:** When the host component bound to the bubble or its parent container has transformations such as rotation or scaling applied, sets whether the bubble can be displayed at the corresponding transformed position. Default value: false.

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var mask

```cangjie
public var mask: Color = Color(0x1000000)
```

**Function:** Sets the color of the mask layer.

**Type:** [Color](./cj-common-types.md#class-color)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var message

```cangjie
public var message: String
```

**Function:** Sets the content of the popup message.

**Type:** String

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var messageOptions

```cangjie
public var messageOptions: PopupMessageOptions = PopupMessageOptions()
```

**Function:** Sets the text parameters for the popup message.

**Type:** [PopupMessageOptions](#struct-popupmessageoptions)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var offset

```cangjie
public var offset: Position = Position(0.0, 0.0)
```

**Function:** Sets the offset of the popup component relative to the display position specified by placement. Percentage values are not supported.

**Type:** [Position](./cj-common-types.md#class-position)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var onStateChange

```cangjie
public var onStateChange: Option <(StateChangeEvent) -> Unit>= Option.None
```

**Function:** Sets the callback for popup state change events, with the parameter being the current display state of the popup.

**Type:** ?([StateChangeEvent](#class-statechangeevent))->Unit

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var onWillDismiss

```cangjie
public var onWillDismiss: Option <(DismissPopupAction) -> Unit>= None
```

**Function:** Sets the callback function to intercept and handle the dismiss event.

> **Note:**
>
> Within the onWillDismiss callback, further onWillDismiss interception is not allowed.

**Type:** ([DismissPopupAction](#class-dismisspopupaction))->Unit

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var placement

```cangjie
public var placement: Placement = Placement.Bottom
```

**Function:** Sets the display position of the popup component relative to the target, with a default value of Placement.Bottom. If both placementOnTop and placement are set, the placement setting takes precedence.

**Type:** [Placement](./cj-common-types.md#enum-placement)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var placementOnTop<sup>(deprecated)</sup>

```cangjie
public var placementOnTop: Bool = false
```

**Function:** Sets whether to display above the component, with a default value of false. This is deprecated; it is recommended to use placement instead.

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var popupColor

```cangjie
public var popupColor: Color = Color(0x1000000)
```

**Function:** Sets the color of the tooltip bubble. To remove the blur background fill effect, set backgroundBlurStyle to BlurStyle.NONE.

**Type:** [Color](./cj-common-types.md#class-color)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var primaryButton

```cangjie
public var primaryButton: Action = Action(value: "", action: { => })
```

**Function:** Sets the first button. value: The text of the primary button in the popup. action: The callback function when the primary button is clicked.

**Type:** [Action](#class-action)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var radius

```cangjie
public var radius: Length = 20.vp
```

**Function:** Sets the corner radius of the bubble. Default value: 20.vp.

**Type:** [Length](cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var secondaryButton

```cangjie
public var secondaryButton: Action = Action(value: "", action: { => })
```

**Function:** Sets the second button. value: The text of the secondary button in the popup. action: The callback function when the secondary button is clicked.

**Type:** [Action](#class-action)

**Read-Write Capability:** Read-Write

**Initial Version:** 12

#### var shadows

```cangjie
public var shadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD
```

**Function:** Sets the shadow of the bubble. Default value: ShadowStyle.OUTER_DEFAULT_MD.

**Type:** [ShadowStyle](cj-common-types.md#enum-shadowstyle)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var showInSubWindow

```cangjie
public var showInSubWindow: Bool = false
```

**Function:** Sets whether to display the bubble in a sub-window, with a default value of false.

**Type:** Bool

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var targetSpace

```cangjie
public var targetSpace: Length = 0.vp
```

**Function:** Sets the gap between the popup and the target.

**Type:** [Length](cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var transition

```cangjie
public var transition: Option<TransitionEffect>= Option.None
```

**Function:** Customizes the animation effects for popup display and dismissal.

> **Note:**
>
> - If not set, the default show/exit animations will be used.
> - Pressing the back key during the show animation will interrupt the show animation and trigger the exit animation, resulting in a combined effect of both animations.
> - Pressing the back key during the exit animation will not interrupt it; the exit animation will continue, and the back key will not be responded to.

**Type:** ?TransitionEffect

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var width

```cangjie
public var width: Length = 0.vp
```

**Function:** Sets the width of the popup.

**Type:** [Length](cj-common-types.md#interface-length)

**Readable/Writable:** Readable and Writable

**Initial Version:** 19

### init(String, Bool, Action, Action, Option<(StateChangeEvent) -> Unit>)

```cangjie
public init(
    message!: String,
    placementOnTop!: Bool = false,
    primaryButton!: Action = Action(value: "", action: { => }),
    secondaryButton!: Action = Action(value: "", action: { => }),
    onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None
)
```

**Function:** Constructs a PopupOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| message | string | Yes |  | **Named parameter.** The content of the popup message. |
| placementOnTop | Bool | No | false | **Named parameter.** Whether to display above the component. |
| primaryButton | [Action](#class-action) | No | Action(value: "", action: {=>}) | **Named parameter.** The first button. <br/>value: The text of the primary button in the popup.<br/>action: The callback function when the primary button is clicked. |
| secondaryButton | [Action](#class-action) | No | Action(value: "", action: {=>}) | **Named parameter.** The second button.<br/>value: The text of the secondary button in the popup.<br/>action: The callback function when the secondary button is clicked. |
| onStateChange | ?([StateChangeEvent](#class-statechangeevent))->Unit | No | None | **Named parameter.** The callback for popup state change events, with the parameter being the current display state of the popup. |

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

**Function:** Constructs a PopupOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| message | string | Yes |  | **Named parameter.** The content of the popup message. |
| placementOnTop | Bool | No | false | **Named parameter.** Whether to display above the component. |
| primaryButton | [Action](#class-action) | No | Action(value: "", action: {=>}) | **Named parameter.** The first button. <br/>value: The text of the primary button in the popup.<br/>action: The callback function when the primary button is clicked. |
| secondaryButton | [Action](#class-action) | No | Action(value: "", action: {=>}) | **Named parameter.** The second button.<br/>value: The text of the secondary button in the popup.<br/>action: The callback function when the secondary button is clicked. |
| onStateChange | ?([StateChangeEvent](#class-statechangeevent))->Unit | No | None | **Named parameter.** The callback for popup state change events, with the parameter being the current display state of the popup. |
| messageOptions | [PopupMessageOptions](#struct-popupmessageoptions) | No | PopupMessageOptions() | **Named parameter.** The text parameters for the popup message. |
| arrowOffset | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The offset of the popup arrow at the popup location.<br>**Note:** When the arrow is above or below the bubble, a value of 0 means the arrow is aligned to the far left, and the offset is the distance from the arrow to the far left, defaulting to center. When the arrow is to the left or right of the bubble, the offset is the distance from the arrow to the top, defaulting to center. If displayed at the screen edge, the bubble will automatically shift left or right, with the arrow always pointing to the bound component when the value is 0. |
| showInSubWindow | Bool | No | false | **Named parameter.** Whether to display the bubble in a sub-window. |
| mask | [Color](./cj-common-types.md#class-color) | No | Color(0x1000000) | **Named parameter.** The color of the bubble's mask layer. |
| targetSpace | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The gap between the popup and the target. |
| placement | [Placement](./cj-common-types.md#enum-placement) | No | Placement.Bottom | **Named parameter.** The display position of the popup relative to the target.<br>**Note:** If both placementOnTop and placement are set, placement takes precedence. |
| offset | [Position](./cj-common-types.md#class-position) | No | Position(0.0, 0.0) | **Named parameter.** The offset of the popup relative to the position set by placement.<br>**Note:** Percentage values are not supported. |
| enableArrow | Bool | No | true | **Named parameter.** Whether to display the arrow.<br>**Note:** If the bubble length on the side where the arrow is located is insufficient to display the arrow, the arrow will not be shown by default. For example: if placement is set to Left but the bubble height is less than the arrow width (32vp), the arrow will not be displayed. |
| popupColor | [Color](./cj-common-types.md#class-color) | No | Color(0x1000000) | **Named parameter.** The color of the bubble. |
| autoCancel | Bool | No | true | **Named parameter.** Whether to automatically close the bubble when there is an operation on the page. |
| width | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The width of the popup. |
| arrowPointPosition | ?[ArrowPointPosition](cj-common-types.md#enum-arrowpointposition) | No | None | **Named parameter.** The position of the bubble's arrow relative to the parent component's display position. The arrow can be positioned at "Start," "Center," or "End" in both vertical and horizontal directions. All positions are within the parent component's area and will not exceed its boundaries. |
| arrowHeight | [Length](cj-common-types.md#interface-length) | No | 8.vp | **Named parameter.** The height of the arrow.<br>**Note:** Percentage values are not supported. |
| arrowWidth | [Length](cj-common-types.md#interface-length) | No | 16.vp | **Named parameter.** The width of the arrow.<br>**Note:** If the set arrow width exceeds the side length minus twice the bubble's corner radius, the arrow will not be drawn. |
| radius | [Length](cj-common-types.md#interface-length) | No | 20.vp | **Named parameter.** The corner radius of the bubble. |
| shadow | [ShadowStyle](cj-common-types.md#enum-shadowstyle) | No | ShadowStyle.OUTER_DEFAULT_MD | **Named parameter.** The shadow of the bubble. |
| backgroundBlurStyle | [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle) | No | BlurStyle.COMPONENT_ULTRA_THICK | **Named parameter.** The blur background parameters of the bubble. |
| transition | ?TransitionEffect | No | None | **Named parameter.** Custom animation effects for popup display and exit.<br>**Note:**<br/>1. If not set, the default display/exit animations are used.<br/>2. Pressing the back key during the display animation interrupts it and triggers the exit animation, with the effect being a combination of both animations.<br/>3. Pressing the back key during the exit animation does not interrupt it, and the back key is not responded to. |
| onWillDismiss | ([DismissPopupAction](#class-dismisspopupaction)) -> Unit | No | None | **Named parameter.** Intercepts the exit event and executes the callback function. |
| followTransformOfTarget | Bool | No | false | **Named parameter.** Whether the bubble can be displayed at the transformed position when the bound host component or its parent container has transformations like rotation or scaling applied. |

### init()

```cangjie
public init()
```

**Function:** Constructs an empty PopupOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

### class StateChangeEvent

```cangjie
public class StateChangeEvent {
    public StateChangeEvent(public let isVisible: Bool)
}
```

**Function:** Represents the type of display state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

#### let isVisible

```cangjie
public let isVisible: Bool
```

**Function:** The current display state.

**Type:** Bool

**Readable/Writable:** Read-only

**Initial Version:** 12

#### StateChangeEvent(Bool)

```cangjie
public StateChangeEvent(public let isVisible: Bool)
```

**Function:** Constructs a StateChangeEvent object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| isVisible | Bool | Yes | - | The current display state. |

## Example Code

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