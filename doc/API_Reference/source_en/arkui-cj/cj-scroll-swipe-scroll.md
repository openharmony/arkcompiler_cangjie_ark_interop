# Scroll

A scrollable container component that allows content to scroll when the layout size of child components exceeds the parent component's dimensions.

> **Note:**
>
> - When this component nests a List child component for scrolling, if the List does not have width and height set, it will load all content by default. For performance-sensitive scenarios, it is recommended to specify the List's width and height.
> - The prerequisite for this component to scroll is that the main axis size is smaller than the content size.
> - The default value of the Scroll component's [universal attribute clip](./cj-universal-attribute-shapclip.md#func-clipbool) is true.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

The layout size exceeds the parent component's dimensions, allowing content to scroll.

> **Note:**
>
> - When this component nests a List child component for scrolling, if the List does not have width and height set, it will load all content by default. For performance-sensitive scenarios, it is recommended to specify the List's width and height.
> - The prerequisite for this component to scroll is that the main axis size is smaller than the content size.
> - The default value of the Scroll component's [universal attribute clip](./cj-universal-attribute-shapclip.md#func-clipbool) is true.

## Create Component

### init()

```cangjie
public init()
```

**Function:** Creates a Scroll container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**Function:** Creates a Scroll container with child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| child | ()->Unit | Yes | - | Declares the child components within the container. |

### init(Scroller, () -> Unit)

```cangjie
public init(scroller: Scroller, child: () -> Unit)
```

**Function:** Creates a Scroll container with child components and binds a scrollbar controller.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scroller | [Scroller](#class-scroller) | Yes | - | The scrollbar controller. |
| child | ()->Unit | Yes | - | Declares the child components within the container. |

## Component Attributes

### func scrollable(ScrollDirection)

```cangjie
public func scrollable(scrollDirection: ScrollDirection): This
```

**Function:** Sets the scrolling direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scrollDirection | [ScrollDirection](./cj-common-types.md#enum-scrolldirection) | Yes | - | The scrolling direction.<br>Initial value: ScrollDirection.Vertical. |

## Component Events

### func onDidScroll(ScrollOnScrollCallback)

```cangjie
public func onDidScroll(callback: ScrollOnScrollCallback): This
```

**Function:** Scroll event callback, triggered when Scroll scrolls.

Returns the offset of the current frame's scroll and the current scroll state.

Conditions for triggering this event:

1. Triggered when the scroll component initiates scrolling, supporting keyboard/mouse operations and other input settings that trigger scrolling.

2. Triggered when called via the scroll controller API.

3. Overbound rebound.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [ScrollOnScrollCallback](<font color="red" face="bold">please add link</font>) | Yes | - | Callback function, triggered when Scroll scrolls.<br>Parameter 1: Horizontal offset per frame during scrolling. Positive when content scrolls left, negative when content scrolls right. Unit: vp.<br>Parameter 2: Vertical offset per frame during scrolling. Positive when content scrolls up, negative when content scrolls down. Unit: vp.<br>Parameter 3: Current scroll state. |

### func onScrollEdge(OnScrollEdgeCallback)

```cangjie
public func onScrollEdge(event: OnScrollEdgeCallback): This
```

**Function:** Triggered when scrolling to the edge.

Conditions for triggering this event:

1. Triggered when the scroll component reaches the edge, supporting keyboard/mouse operations and other input settings that trigger scrolling.

2. Triggered when called via the scroll controller API.

3. Overbound rebound.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [OnScrollEdgeCallback](<font color="red" face="bold">please add link</font>) | Yes | - | The edge position reached during scrolling.<br>When Scroll is set to horizontal scrolling, Edge.Center indicates the starting position in the horizontal direction, and Edge.Baseline indicates the ending position in the horizontal direction. Since the Edge.Center and Edge.Baseline enum values are deprecated, it is recommended to use onReachStart and onReachEnd events to monitor whether scrolling reaches the boundary. |

### func onScrollFrameBegin(OnScrollFrameBeginCallback)

```cangjie
public func onScrollFrameBegin(event: OnScrollFrameBeginCallback): This
```

**Function:** Triggered at the start of each frame's scroll. The event parameters include the upcoming scroll amount. The event handler can calculate the actual required scroll amount based on the application scenario and return it as the handler's return value. Scroll will scroll according to the returned actual scroll amount.

Supports negative values for offsetRemain.

If implementing nested scrolling via the onScrollFrameBegin event and scrollBy method, set the child scroll node's EdgeEffect to None. For example, when Scroll nests a List for scrolling, the List component's edgeEffect property should be set to EdgeEffect.None.

Conditions for triggering this event:

1. Triggered when the scroll component initiates scrolling, including keyboard/mouse operations and other input settings that trigger scrolling.

2. Not triggered when called via the controller API.

3. Not triggered during overbound rebound.

4. Not triggered when dragging the scrollbar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [OnScrollFrameBeginCallback](<font color="red" face="bold">please add link</font>) | Yes | - | Callback function triggered at the start of each frame's scroll. |

### func onWillScroll((Float64,Float64,ScrollState,ScrollSource) -> OffsetResult)

```cangjie
public func onWillScroll(handler: (Float64, Float64, ScrollState, ScrollSource) -> OffsetResult): This
```

**Function:** Scroll event callback, triggered before Scroll scrolls.

Returns the upcoming scroll offset, current scroll state, and scroll operation source. The returned offset is the calculated upcoming scroll value, not the final actual scroll offset. The callback return value can specify the upcoming scroll offset.

Conditions for triggering this event:

1. Triggered when the scroll component initiates scrolling, supporting keyboard/mouse operations and other input settings that trigger scrolling.

2. Triggered when called via the scroll controller API.

3. Overbound rebound.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| handler | (Float64,Float64,[ScrollState](./cj-common-types.md#enum-scrollstate),[ScrollSource](./cj-common-types.md#enum-scrollsource))->[OffsetResult](#class-offsetresult) | Yes | - | Callback function, triggered before Scroll scrolls.<br>Parameter 1: Horizontal offset per frame during scrolling. Positive when content scrolls left, negative when content scrolls right. Unit: vp.<br>Parameter 2: Vertical offset per frame during scrolling. Positive when content scrolls up, negative when content scrolls down. Unit: vp.<br>Parameter 3: Current scroll state.<br>Parameter 4: Source of the current scroll operation.<br>Return value: Scroll offset object. Returns OffsetResult to scroll according to the developer-specified offset. |

### func onWillScroll((Float64,Float64,ScrollState,ScrollSource) -> Unit)

```cangjie
public func onWillScroll(handler: (Float64, Float64, ScrollState, ScrollSource) -> Unit): This
```

**Function:** Scroll event callback, triggered before Scroll scrolls.

Returns the upcoming scroll offset, current scroll state, and scroll operation source. The returned offset is the calculated upcoming scroll value, not the final actual scroll offset. The callback return value can specify the upcoming scroll offset.

Conditions for triggering this event:

1. Triggered when the scroll component initiates scrolling, supporting keyboard/mouse operations and other input settings that trigger scrolling.

2. Triggered when called via the scroll controller API.

3. Overbound rebound.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| handler | (Float64,Float64,[ScrollState](./cj-common-types.md#enum-scrollstate),[ScrollSource](./cj-common-types.md#enum-scrollsource))->Unit | Yes | - | Callback function, triggered before Scroll scrolls.<br>Parameter 1: Horizontal offset per frame during scrolling. Positive when content scrolls left, negative when content scrolls right. Unit: vp.<br>Parameter 2: Vertical offset per frame during scrolling. Positive when content scrolls up, negative when content scrolls down. Unit: vp.<br>Parameter 3: Current scroll state.<br>Parameter 4: Source of the current scroll operation. |

## Basic Type Definitions

### class FadingEdgeOptions

```cangjie
public class FadingEdgeOptions {
    public var fadingEdgeLength: Length
    public init(fadingEdgeLength!: Length = 32.vp)
}
```

**Function:** Edge fading parameter object for the fadingEdge attribute.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var fadingEdgeLength

```cangjie
public var fadingEdgeLength: Length
```

**Function:** Sets the edge fading length. If set to a value less than 0, the default value is used. The default length is 32vp.
If the set length exceeds half the container height, the fading length is set to half the container height.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### init(Length)

```cangjie
public init(fadingEdgeLength!: Length = 32.vp)
```

**Function:** Creates a FadingEdgeOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fadingEdgeLength | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 32.vp | Sets the edge fading length. If set to a value less than 0, the default value is used. The default length is 32vp. If the set length exceeds half the container height, the fading length is set to half the container height. |

### class NestedScrollOptions

```cangjie
public class NestedScrollOptions {
    public NestedScrollOptions(
        public var scrollForward: NestedScrollMode,
        public var scrollBackward: NestedScrollMode
    )
}
```

**Function:** Parameter object for the nestedScroll attribute.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var scrollBackward

```cangjie
public var scrollBackward: NestedScrollMode
```

**Function:** Nested scroll option when the scroll component scrolls toward the start.

**Type:** [NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var scrollForward

```cangjie
public var scrollForward: NestedScrollMode
```

**Function:** Nested scroll option when the scroll component scrolls toward the end.

**Type:** [NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### NestedScrollOptions(NestedScrollMode, NestedScrollMode)

```cangjie
public NestedScrollOptions(
    public var scrollForward: NestedScrollMode,
    public var scrollBackward: NestedScrollMode
)
```

**Function:** Nested scroll options.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scrollForward | [NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode) | Yes | - | Nested scroll option when the scroll component scrolls toward the end. |
| scrollBackward | [NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode) | Yes | - | Nested scroll option when the scroll component scrolls toward the start. |

### class OffsetResult

```cangjie
public class OffsetResult {
    public var xOffset: Float64
    public var yOffset: Float64
    public init(xOffset: Float64, yOffset: Float64)
}
```

**Function:** Scroll offset object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var xOffset

```cangjie
public var xOffset: Float64
```

**Function:** Horizontal scroll offset.

**Type:** Float64

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var yOffset

```cangjie
public var yOffset: Float64
```

**Function:** Vertical scroll offset.

**Type:** Float64

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### init(Float64, Float64)

```cangjie
public init(xOffset: Float64, yOffset: Float64)
```

**Function:** Constructs an OffsetResult object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| xOffset | Float64 | Yes | - | Horizontal scroll offset. Unit: vp. |
| yOffset | Float64 | Yes | - | Vertical scroll offset. Unit: vp. |### class RectResult

```cangjie
public class RectResult {
    public var x: Float64
    public var y: Float64
    public var width: Float64
    public var height: Float64
    public init(
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    )
}
```

**Description:** Size and position of a subcomponent relative to its parent component. Unit: vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var height

```cangjie
public var height: Float64
```

**Description:** Component height

**Type:** Float64

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var width

```cangjie
public var width: Float64
```

**Description:** Component width

**Type:** Float64

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var x

```cangjie
public var x: Float64
```

**Description:** Horizontal offset

**Type:** Float64

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var y

```cangjie
public var y: Float64
```

**Description:** Vertical offset

**Type:** Float64

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Float64, Float64, Float64, Float64)

```cangjie
public init(
    x: Float64,
    y: Float64,
    width: Float64,
    height: Float64
)
```

**Description:** Constructs a RectResult object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | Float64 | Yes | - | Horizontal offset |
| y | Float64 | Yes | - | Vertical offset |
| width | Float64 | Yes | - | Component width |
| height | Float64 | Yes | - | Component height |

### class ScrollAnimationOptions

```cangjie
public class ScrollAnimationOptions {
    public var duration: Float64
    public var curve: Curve
    public var canOverScroll: Bool
    public init(
        duration!: Float64 = 1000.0,
        curve!: Curve = Curve.Ease,
        canOverScroll!: Bool = false
    )
}
```

**Description:** Custom scroll animation parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var canOverScroll

```cangjie
public var canOverScroll: Bool
```

**Description:** Sets whether scrolling can overshoot boundaries.

**Type:** Bool

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var curve

```cangjie
public var curve: Curve
```

**Description:** Sets the scroll curve.

**Type:** [Curve](./cj-common-types.md#enum-curve)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var duration

```cangjie
public var duration: Float64
```

**Description:** Sets the scroll duration.

**Type:** Float64

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Float64, Curve, Bool)

```cangjie
public init(
    duration!: Float64 = 1000.0,
    curve!: Curve = Curve.Ease,
    canOverScroll!: Bool = false
)
```

**Description:** Constructs a ScrollAnimationOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| duration | Float64 | No | 1000.0 | **Named parameter.** Sets the scroll duration. If set to a value less than 0, the default value is used. |
| curve | [Curve](./cj-common-types.md#enum-curve) | No | Curve.Ease | **Named parameter.** Sets the scroll curve. |
| canOverScroll | Bool | No | false | **Named parameter.** Sets whether scrolling can overshoot boundaries.<br>**Note:**<br>Overscrolling is only allowed when set to true and the component's edgeEffect is set to EdgeEffect.Spring, triggering a bounce animation when overshooting occurs. |

### class ScrollEdgeOptions

```cangjie
public class ScrollEdgeOptions {
    public var velocity: Float32 = 0.0
    public init(velocity!: Float32 = 0.0)
}
```

**Description:** Parameters for scrolling to edge positions.

#### var velocity

```cangjie
public var velocity: Float32 = 0.0
```

**Description:** Sets the fixed speed for scrolling to container edges.

**Type:** Float32

**Read-Write Access:** Read-Write

#### init(Float32)

```cangjie
public init(velocity!: Float32 = 0.0)
```

**Description:** Constructs a ScrollEdgeOptions object.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| velocity | Float32 | No | 0.0 | Sets the fixed speed for scrolling to container edges. If set to a value less than or equal to 0, this parameter does not take effect.<br>Default: 0<br>Unit: vp/s |

### class ScrollResult

```cangjie
public class ScrollResult {
    public var offsetRemain: Float64
    public init(offsetRemain!: Float64)
}
```

**Description:** Return value object for OnWillScrollCallback.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var offsetRemain

```cangjie
public var offsetRemain: Float64
```

**Description:** Pending scroll offset

**Type:** Float64

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Float64)

```cangjie
public init(offsetRemain!: Float64)
```

**Description:** Constructs a ScrollResult object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| offsetRemain | Float64 | Yes | - | Pending scroll offset, in vp. |

### class ScrollToIndexOptions

```cangjie
public class ScrollToIndexOptions {
    public var extraOffset: Length = 0.vp
    public init(extraOffset!: Length = 0.vp)
}
```

**Description:** Parameters for scrolling to a specified index.

#### var extraOffset

```cangjie
public var extraOffset: Length = 0.vp
```

**Description:** Extra offset for scrolling to a specified index.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read-Write Access:** Read-Write

#### init(Length)

```cangjie
public init(extraOffset!: Length = 0.vp)
```

**Description:** Constructs a ScrollToIndexOptions object.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| extraOffset | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | Extra offset for scrolling to a specified index. A positive value adds an offset towards the bottom, while a negative value adds an offset towards the top. |

### class ScrollableBase

```cangjie
public abstract class ScrollableBase <: ContainerBase {}
```

**Description:** Describes common properties of scrollable components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [ContainerBase](./cj-ui-framework.md#containerbase)

#### func clipContent(ContentClipMode)

```cangjie
public func clipContent(clip: ContentClipMode): This
```

**Description:** Sets the clipping region for the content layer of a scrollable container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| clip | [ContentClipMode](#enum-contentclipmode) | Yes | Default: ContentClipMode.BOUNDARY for Grid and Scroll, ContentClipMode.CONTENT_ONLY for List and WaterFlow. | Clipping only applies to the content of the scrollable container (i.e., its child nodes), and does not affect the background. When using RectShape to define a custom rectangular area, only width, height, and [offset](./cj-universal-attribute-location.md#func-offsetlength-length) relative to the component's top-left corner are supported; rounded corners are not supported.<br/> |

#### func clipContent(RectShape)

```cangjie
public func clipContent(clip: RectShape): This
```

**Description:** Sets the clipping region for the content layer of a scrollable container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| clip | [RectShape](<font color="red" face="bold">please add link</font>) | Yes | Default: ContentClipMode.BOUNDARY for Grid and Scroll, ContentClipMode.CONTENT_ONLY for List and WaterFlow. | Clipping only applies to the content of the scrollable container (i.e., its child nodes), and does not affect the background. When using RectShape to define a custom rectangular area, only width, height, and [offset](./cj-universal-attribute-location.md#func-offsetlength-length) relative to the component's top-left corner are supported; rounded corners are not supported.<br/> |

#### func enableScrollInteraction(Bool)

```cangjie
public func enableScrollInteraction(value: Bool): This
```

**Description:** Sets whether scroll gestures are supported.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | true | Whether scroll gestures are supported. When set to true, scrolling can be performed via finger or mouse; when set to false, scrolling via finger or mouse is disabled, but scrolling via the [Scroller](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-scroll.md#scroller) controller is unaffected.<br/> |

#### func fadingEdge(Option\<Bool>)

```cangjie
public func fadingEdge(enabled: Option<Bool>): This
```

**Description:** Enables or disables edge fading effects and sets the fading length.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enabled | [Option](<font color="red" face="bold">please add link</font>)\<Bool> | Yes | false | When fadingEdge is enabled, it overrides the component's .overlay() property.<br/>When fadingEdge is enabled, it is recommended not to set background-related properties on the component, as this may affect the fading display effect.<br/>When fadingEdge is enabled, the component is clipped to its boundaries, and setting the component's clip property to false does not take effect.<br/>Set to true to enable edge fading effects; set to false to disable them. |

#### func fadingEdge(Option\<Bool>, FadingEdgeOptions)

```cangjie
public func fadingEdge(enabled: Option<Bool>, options: FadingEdgeOptions): This
```

**Description:** Enables or disables edge fading effects and sets the fading length.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enabled | [Option](<font color="red" face="bold">please add link</font>)\<Bool> | Yes | false | When fadingEdge is enabled, it overrides the component's .overlay() property.<br/>When fadingEdge is enabled, it is recommended not to set background-related properties on the component, as this may affect the fading display effect.<br/>When fadingEdge is enabled, the component is clipped to its boundaries, and setting the component's clip property to false does not take effect.<br/>Set to true to enable edge fading effects; set to false to disable them. |
| options | [FadingEdgeOptions](#class-fadingedgeoptions) | Yes | - | Edge fading parameters object. This object can be used to define edge fading effect properties, such as fading length. |

#### func flingSpeedLimit(Float64)

```cangjie
public func flingSpeedLimit(speedLimit: Float64): This
```

**Description:** Limits the maximum initial speed when a fling animation starts after finger-tracking scrolling ends.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| speedLimit | Float64 | Yes | 9000 | Maximum initial speed when a fling animation starts. Unit: vp/s<br/>Valid range: (0, +∞). If set to a value less than or equal to 0, the default value is used. |

#### func friction(Float64)

```cangjie
public func friction(value: Float64): This
```

**Description:** Sets the friction coefficient, which takes effect during manual scrolling and only affects the inertial scrolling process, indirectly influencing chained effects during inertial scrolling. If set to a value less than or equal to 0, the default value is used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | Default: 0.6 for non-wearable devices, 0.9 for wearable devices.<br/>From API version 11, the default is 0.7 for non-wearable devices.<br/>From API version 12, the default is 0.75 for non-wearable devices.<br/>Valid range: (0, +∞). If set to a value less than or equal to 0, the default value is used. | Friction coefficient. |

#### func friction(AppResource)

```cangjie
public func friction(value: AppResource): This
```

**Description:** Sets the friction coefficient, which takes effect during manual scrolling and only affects the inertial scrolling process, indirectly influencing chained effects during inertial scrolling. If set to a value less than or equal to 0, the default value is used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | Default: 0.6 for non-wearable devices, 0.9 for wearable devices.<br/>From API version 11, the default is 0.7 for non-wearable devices.<br/>From API version 12, the default is 0.75 for non-wearable devices.<br/>Valid range: (0, +∞). If set to a value less than or equal to 0, the default value is used. | Friction coefficient. |

#### func nestedScroll(NestedScrollOptions)

```cangjie
public func nestedScroll(value: NestedScrollOptions): This
```

**Description:** Sets the nested scroll mode for both forward and backward directions to achieve scroll linkage with parent components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [NestedScrollOptions](#class-nestedscrolloptions) | Yes | - | Nested scroll options. |

#### func onDidScroll(OnScrollCallBack)

```cangjie
public func onDidScroll(handler: OnScrollCallBack): This
```

**Description:** Triggered when a scrollable component is scrolled, returning the offset of the current frame and the current scroll state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| handler | [OnScrollCallBack](<font color="red" face="bold">please add link</font>) | Yes | - | Callback triggered when the scrollable component is scrolled. |

#### func onReachEnd(() -> Unit)

```cangjie
public func onReachEnd(event: () -> Unit): This
```

**Description:** Triggered when a scrollable component reaches the end position.

When the edge effect is set to spring, this event is triggered once when scrolling past the end position and again when bouncing back to the end position.

**System Capability:** System### class Scroller

```cangjie
public class Scroller {
    public init()
}
```

**Function:** Controller for scrollable container components. It can be bound to container components to control their scrolling behavior. A single controller cannot manage multiple container components. Currently supports binding to List, Scroll, ScrollBar, Grid, and WaterFlow.

> **Note:**
>
> 1. The binding between the Scroller controller and scrollable container components occurs during the component creation phase.
>
> 2. The Scroller methods can only be called normally after the controller is bound to a scrollable container component. Otherwise, depending on the interface called, the operation may either fail silently or throw an exception.
>
> 3. Taking [aboutToAppear](cj-universal-attribute-menu.md#func-abouttoappear) as an example, `aboutToAppear` executes after creating a new instance of a custom component but before its `build()` method. Therefore, if the scrollable component is within the `build` method of a custom component, the Scroller methods cannot be called normally during the `aboutToAppear` execution of that custom component because the internal scrollable component has not yet been created.
>
> 4. Taking [onAppear](cj-ui-framework.md#func-Onappear---unit) as an example, this callback is triggered after the component is mounted and displayed. Thus, during the `onAppear` callback of the scrollable component, the component has already been created and successfully bound to the Scroller, allowing normal invocation of Scroller methods.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init()

```cangjie
public init()
```

**Function:** Constructs a Scroller object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func currentOffset()

```cangjie
public func currentOffset(): OffsetResult
```

**Function:** Retrieves the current scroll offset.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[OffsetResult](#class-offsetresult)|Returns the current scroll offset.<br/>**Note:**<br/>When the Scroller controller is not bound to a container component or the container component is abnormally released, `currentOffset` returns an empty value.|

#### func fling(Float64)

```cangjie
public func fling(velocity: Float64): Unit
```

**Function:** Enables inertial scrolling for scrollable components based on the provided initial velocity.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|velocity|Float64|Yes|A `velocity` value of 0 is considered invalid, and scrolling will not occur. Positive values scroll toward the top; negative values scroll toward the bottom.<br/>Range: (-∞, +∞)|Initial velocity for inertial scrolling. Unit: vp/s|

#### func getItemIndex(Float64, Float64)

```cangjie
public func getItemIndex(x: Float64, y: Float64): Int32
```

**Function:** Retrieves the index of a child component based on coordinates.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|x|Float64|Yes|-|X-axis coordinate, in vp.|
|y|Float64|Yes|-|Y-axis coordinate, in vp.|

**Note:**

- Invalid values return an index of -1.

**Return Value:**

| Type | Description |
|:----|:----|
|Int32|Returns the index of the child component. Unit: vp.|

#### func getItemRect(Int32)

```cangjie
public func getItemRect(index: Int32): RectResult
```

**Function:** Retrieves the size and position of a child component relative to the container component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|index|Int32|Yes|-|Index value of the child component.|

**Return Value:**

| Type | Description |
|:----|:----|
|[RectResult](#class-rectresult)|Size and position of the child component relative to the container.<br/>Unit: vp.|

#### func isAtEnd()

```cangjie
public func isAtEnd(): Bool
```

**Function:** Checks whether the component has scrolled to the bottom.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|Bool|`true` indicates the component has scrolled to the bottom; `false` indicates it has not.|

#### func scrollBy(Length, Length)

```cangjie
public func scrollBy(xOffset!: Length, yOffset!: Length): Unit
```

**Function:** Scrolls by a specified distance.

**Note:**

- Supports Scroll, List, Grid, and WaterFlow components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|xOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|Yes|-|Horizontal scroll distance. Percentage values are not supported.<br/>Range: (-∞, +∞)|
|yOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|Yes|-|Vertical scroll distance. Percentage values are not supported. Range: (-∞, +∞)|

#### func scrollEdge(Edge)

```cangjie
public func scrollEdge(value: Edge): Unit
```

**Function:** Scrolls to the edge of the container, regardless of the scroll axis direction. `Edge.Top` and `Edge.Start` behave the same, as do `Edge.Bottom` and `Edge.End`. Scroll components have animations by default; Grid, List, and WaterFlow components do not.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|value|[Edge](./cj-common-types.md#enum-edge)|Yes|-|Edge position to scroll to.|

#### func scrollEdge(Edge, ScrollEdgeOptions)

```cangjie
public func scrollEdge(value: Edge, options: ScrollEdgeOptions): Unit
```

**Function:** Scrolls to the edge of the container, regardless of the scroll axis direction. `Edge.Top` and `Edge.Start` behave the same, as do `Edge.Bottom` and `Edge.End`. Scroll components have animations by default; Grid, List, and WaterFlow components do not.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|value|[Edge](./cj-common-types.md#enum-edge)|Yes|-|Edge position to scroll to.|
|options|[ScrollEdgeOptions](#class-scrolledgeoptions)|No||Configures the mode for scrolling to the edge.|

#### func scrollPage(Bool)

```cangjie
public func scrollPage(next: Bool): Unit
```

**Function:** Scrolls to the next or previous page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|next|Bool|Yes|-|Whether to scroll to the next page. `true` scrolls down; `false` scrolls up.|

#### func scrollPage(Bool, Bool)

```cangjie
public func scrollPage(next: Bool, animation!: Bool = false): Unit
```

**Function:** Scrolls to the next or previous page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|next|Bool|Yes|-|Whether to scroll to the next page. `true` scrolls down; `false` scrolls up.|
|animation|Bool|No|false|Animation configuration.<br/>\- `boolean`: Enables the default spring animation.|

#### func scrollTo(Length, Length)

```cangjie
public func scrollTo(xOffset!: Length, yOffset!: Length): Unit
```

**Function:** Scrolls to a specified position.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|xOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|Yes|-| **Named parameter.** Horizontal scroll offset (values of type Int64 or Float64 are in vp).<br>**Note:**<br>Percentage values are not supported.<br>Only effective when the scroll axis is the x-axis.<br>For values less than 0, non-animated scrolling treats them as 0. Animated scrolling defaults to stopping at the starting position. |
|yOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|Yes|-| **Named parameter.** Vertical scroll offset (values of type Int64 or Float64 are in vp).<br>**Note:**<br>Percentage values are not supported.<br>Only effective when the scroll axis is the y-axis.<br>For values less than 0, non-animated scrolling treats them as 0. Animated scrolling defaults to stopping at the starting position.|

#### func scrollTo(Length, Length, ScrollAnimationOptions)

```cangjie
public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: ScrollAnimationOptions): Unit
```

**Function:** Scrolls to a specified position.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|xOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|Yes|-|Horizontal scroll offset.<br/>**Note:**<br/>Percentage values are not supported.<br/>Only effective when the scroll axis is the x-axis.<br/>Range: For values less than 0, non-animated scrolling treats them as 0. Animated scrolling defaults to stopping at the starting position. The `animation` parameter can enable rebound animations when scrolling exceeds bounds.|
|yOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|Yes|-|Vertical scroll offset.<br/>**Note:**<br/>Percentage values are not supported.<br/>Only effective when the scroll axis is the y-axis.<br/>Range: For values less than 0, non-animated scrolling treats them as 0. Animated scrolling defaults to stopping at the starting position. The `animation` parameter can enable rebound animations when scrolling exceeds bounds.|
|animation|[ScrollAnimationOptions](#class-scrollanimationoptions)\|Bool|No|Default: ScrollAnimationOptions: { duration: 1000, curve: Curve.Ease, canOverScroll: false } boolean: false|Animation configuration. - ScrollAnimationOptions: Custom scroll animation. - boolean: Enables the default spring animation.|

#### func scrollTo(Length, Length, Bool)

```cangjie
public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: Bool): Unit
```

**Function:** Scrolls to a specified position.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|xOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|Yes|-|Horizontal scroll offset.<br/>**Note:**<br/>Percentage values are not supported.<br/>Only effective when the scroll axis is the x-axis.<br/>Range: For values less than 0, non-animated scrolling treats them as 0. Animated scrolling defaults to stopping at the starting position. The `animation` parameter can enable rebound animations when scrolling exceeds bounds.|
|yOffset|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|Yes|-|Vertical scroll offset.<br/>**Note:**<br/>Percentage values are not supported.<br/>Only effective when the scroll axis is the y-axis.<br/>Range: For values less than 0, non-animated scrolling treats them as 0. Animated scrolling defaults to stopping at the starting position. The `animation` parameter can enable rebound animations when scrolling exceeds bounds.|
| animation | Bool | Yes | \- | **Named parameter.** Animation configuration, enabling the default spring animation.<br>Initial value: false.|

#### func scrollToIndex(Int32, Bool, ScrollAlign, ScrollToIndexOptions)

```cangjie
public func scrollToIndex(
    index: Int32,
    smooth!: Bool = false,
    align!: ScrollAlign = ScrollAlign.Start,
    options!: ScrollToIndexOptions = ScrollToIndexOptions()
): This
```

**Function:** Scrolls to a specified index, supporting additional offset configuration.

Enabling `smooth` animation may cause performance issues when loading and laying out numerous items during scrolling.

> **Note:**
>
> Only supports Grid, List, and WaterFlow components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|index|Int32|Yes|-|Target element index within the current container.<br/>**Note:**<br/>Negative values or values exceeding the maximum index of child components are invalid, and scrolling will not occur.|
|smooth|Bool|No|false|Whether to enable smooth animation when scrolling to the target index. `true` enables animation; `false` disables it.<br/>Default: false.|
|align|[ScrollAlign](#enum-scrollalign)|No|Default for List: ScrollAlign.START. Default for Grid: ScrollAlign.AUTO. Default for WaterFlow: ScrollAlign.START. **Note:** Only List, Grid, and WaterFlow components support this parameter.|Alignment of the target element relative to the container.|
|options|[ScrollToIndexOptions](#class-scrolltoindexoptions)|No|ScrollToIndexOptions()|Options for scrolling to the specified index, such as additional offsets.<br/>Default: 0, unit: vp.|

### enum ContentClipMode

```cangjie
public enum ContentClipMode {
    | ContentOnly
    | Boundary
    | SafeArea
}
```

**Function:** Defines the clipping region enumeration for scrollable container content layers.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Boundary

```cangjie
Boundary
```

**Function:** Clips to the component boundary.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### ContentOnly

```cangjie
ContentOnly
```

**Function:** Clips to the content area only.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### SafeArea

```cangjie
SafeArea
```

**Function:** Clips to the SafeArea region configured for the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### enum ScrollAlign

```cangjie
public enum ScrollAlign {
    | Start
    | Center
    | End
    | Auto
}
```

**Function:** Alignment method enumeration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Auto

```cangjie
Auto
```

**Function:** Auto alignment.

If the specified item is entirely within the display area, no adjustment is made. Otherwise, it aligns the item's start or end with the List based on the shortest scroll distance to ensure the item is fully visible.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Center

```cangjie
Center
```

**Function:** Center alignment. The specified item is center-aligned with the List along the main axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### End

```cangjie
End
```

**Function:** End alignment. The specified item's end is aligned with the List's end.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Start

```cangjie
Start
```

**Function:** Start alignment. The specified item's start is aligned with the List's start.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21## Example Code 1 (Setting Scroller Controller)

This example demonstrates the usage of some properties of the Scroll component and the scroller controller.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    let scroller = Scroller()
    var arr: ArrayList<String> = ArrayList(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])

    func build() {
        Stack(Alignment.TopStart) {
            Scroll(this.scroller) {
                Column {
                    ForEach(
                        this.arr,
                        itemGeneratorFunc: {
                            item: String, idx: Int64 => Text(item)
                                .width(90.percent)
                                .height(150)
                                .backgroundColor(0xFFFFFF)
                                .borderRadius(15)
                                .textAlign(TextAlign.Center)
                                .fontSize(16)
                                .margin(top: 10)
                        }
                    )
                }
            }
                .scrollable(ScrollDirection.Vertical) // Vertical scrolling direction
                .scrollBar(BarState.On) // Persistent scrollbar display
                .scrollBarColor(Color.Gray) // Scrollbar color
                .scrollBarWidth(10.px) // Scrollbar width
                .friction(0.6)
                .edgeEffect(EdgeEffect.None)
                .onScrollEdge(
                    {
                        edge => match (edge) {
                            case Edge.Top => nativeLog("Top")
                            case Edge.Bottom => nativeLog("Bottom")
                            case _ => nativeLog("None")
                        }
                    })
                .onScrollStop({
                    => nativeLog("Scroll Stop")
                })

            Button("scroll 150")
                .onClick({
                    evt => // Scroll down by specified distance 150.0vp after click
                    this
                        .scroller
                        .scrollBy(xOffset: 0, yOffset: 150)
                })
                .margin(top: 10, left: 20)

            Button("scroll 100")
                .onClick(
                    {
                        evt => // Scroll to specified position (100.0vp down) after click
                        nativeLog("current offset ${this.scroller.currentOffset().yOffset}")
                        nativeLog("CALCULATE offset ${this.scroller.currentOffset().yOffset + 100.0}")
                        let curyOffset = this
                            .scroller
                            .currentOffset()
                            .yOffset
                        this
                            .scroller
                            .scrollTo(xOffset: 0.vp, yOffset: (curyOffset + 100.0).vp, duration: 0.0, curve: Curve.Ease)
                    }
                )
                .margin(top: 60, left: 20)

            Button("back top")
                .onClick({
                    evt => // Return to top after click
                    this
                        .scroller
                        .scrollEdge(Edge.Top)
                })
                .margin(top: 110, left: 20)

            Button("next page")
                .onClick({
                    evt => // Scroll to next page after click
                    this
                        .scroller
                        .scrollPage(true, animation: false)
                })
                .margin(top: 160, left: 20)

            Button("fling -3000")
                .onClick({
                    evt => // Trigger inertial scrolling with initial velocity of -3000vp/s after click
                    this
                        .scroller
                        .fling(-3000)
                })
                .margin(top: 210, left: 20)

            Button("next page slowly")
                .onClick({
                    evt => // Scroll to next page with animation enabled after click
                    this
                        .scroller
                        .scrollPage(true, animation: true)
                })
                .margin(top: 260, left: 20)
        }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
    }
}
```

## Example Code 2 (Nested Scrolling Implementation Method 1)

This example implements nested scrolling between an inner List component and an outer Scroll component using the onScrollFrameBegin event.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    @State
    var listPosition: Int32 = 0 // 0 means scrolled to top of List, 1 means intermediate value, 2 means scrolled to bottom of List.
    let scroller = Scroller()
    let scrollerForList = Scroller()
    var arr: ArrayList<String> = ArrayList(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])

    func build() {
        Flex() {
            Scroll(this.scroller) {
                Column() {
                    Text("Scroll Area")
                        .width(100.percent)
                        .height(40.percent)
                        .backgroundColor(0x330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                        .onClick(
                            {
                                evt => this
                                    .scrollerForList
                                    .scrollToIndex(5, smooth: false, align: ScrollAlign.START, extraOffset: 5.vp)
                            })

                    List(space: 20, scroller: this.scrollerForList) {
                        ForEach(
                            this.arr,
                            itemGeneratorFunc: {
                                item: String, idx: Int64 => ListItem() {
                                    Text("ListItem" + item)
                                        .width(100.percent)
                                        .height(100.percent)
                                        .backgroundColor(Color.White)
                                        .borderRadius(15)
                                        .textAlign(TextAlign.Center)
                                        .fontSize(16)
                                        .margin(top: 10)
                                }
                                    .width(100.percent)
                                    .height(100)
                            }
                        )
                    }
                        .width(100.percent)
                        .height(50.percent)
                        .edgeEffect(EdgeEffect.None)
                        .friction(0.6)
                        .onReachStart({
                            => this.listPosition = 0
                        })
                        .onReachEnd({
                            => this.listPosition = 2
                        })
                        .onScrollFrameBegin(
                            {
                                x: Float64, y: ScrollState =>
                                if ((this.listPosition == 0 && x <= 0.0) || (this.listPosition == 2 && x >= 0.0)) {
                                    this
                                        .scroller
                                        .scrollBy(xOffset: 0.0, yOffset: x)
                                    return 0.0
                                }
                                this.listPosition = 1
                                return x
                            }
                        )

                    Text("Scroll Area")
                        .width(100.percent)
                        .height(40.percent)
                        .backgroundColor(0x330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                }
            }
                .width(100.percent)
                .height(100.percent)
        }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
            .padding(20)
    }
}
```

## Example Code 3 (Nested Scrolling Implementation Method 2)

This example implements nested scrolling between an inner List component and an outer Scroll component using the nestedScroll property.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    @State
    var arr: ArrayList<Int64> = ArrayList<Int64>(30)

    func build() {
        Scroll {
            Column {
                Text("Scroll Area")
                    .width(100.percent)
                    .height(40.percent)
                    .backgroundColor(0x00800C)
                    .textAlign(TextAlign.Center)
                Tabs(BarPosition.Start) {
                    TabContent {
                        List(space: 10) {
                            ForEach(
                                this.arr,
                                itemGeneratorFunc: {
                                    item: Int64, idx: Int64 => ListItem {
                                        Text("item" + item.toString()).fontSize(16)
                                    }
                                        .backgroundColor(Color.White)
                                        .height(72)
                                        .width(100.percent)
                                        .borderRadius(12)
                                },
                                keyGeneratorFunc: {
                                    item: Int64, idx: Int64 => item.toString()
                                }
                            )
                        }
                            .width(100.percent)
                            .edgeEffect(EdgeEffect.Spring)
                            .nestedScroll(
                                NestedScrollOptions(NestedScrollMode.PARENT_FIRST, NestedScrollMode.SELF_FIRST))
                    }.tabBar("Tab1")

                    TabContent {
                    }.tabBar("Tab2")
                }
                    .vertical(false)
                    .height(100.percent)
            }.width(100.percent)
        }
            .edgeEffect(EdgeEffect.Spring)
            .friction(0.6)
            .backgroundColor(0xDCDCDC)
            .scrollBar(BarState.Off)
            .width(100.percent)
            .height(100.percent)
    }

    protected override func aboutToAppear() {
        for (i in 0..30) {
            this.arr.add(i)
        }
    }
}
```

## Example Code 4 (Parent-to-Child Scrolling Transfer in Nested Scrolling)

This example implements scrolling transfer from parent component to child component using the enableScrollInteraction property and onScrollFrameBegin event.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    private var headerHeight: Float64 = 0.0
    private var arr: ArrayList<Int64> = ArrayList<Int64>()
    private var scrollerForParent: Scroller = Scroller()
    private var scrollerForChild: Scroller = Scroller()

    protected override func aboutToAppear() {
        for (i in 0..10) {
            this.arr.add(i)
        }
    }

    func build() {
        Scroll(this.scrollerForParent) {
            Column {
                Text("Scroll Area")
                    .width(100.percent)
                    .height(40.percent)
                    .backgroundColor(0x330000FF)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .onAreaChange({
                        oldValue: Area, newValue: Area => this.headerHeight = newValue.height
                    })

                List(space: 20, scroller: this.scrollerForChild) {
                    ForEach(
                        this.arr,
                        itemGeneratorFunc: {
                            item: Int64, idx: Int64 => ListItem {
                                Text("ListItem" + item.toString())
                                    .width(100.percent)
                                    .height(100.percent)
                                    .borderRadius(15)
                                    .fontSize(16)
                                    .textAlign(TextAlign.Center)
                                    .backgroundColor(Color.White)
                            }
                                .width(100.percent)
                                .height(100)
                        },
                        keyGeneratorFunc: {
                            item: Int64, idx: Int64 => item.toString()
                        }
                    )
                }
                    .width(100.percent)
                    .height(100.percent)
                    .edgeEffect(EdgeEffect.None)
                    .scrollBar(BarState.Off)
                    .enableScrollInteraction(false)

                Text("Scroll Area")
                    .width(100.percent)
                    .height(40.percent)
                    .backgroundColor(0x330000FF)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
            }
        }
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .onScrollFrameBegin(
                {
                    offset: Float64, state: ScrollState =>
                    var retOffset = offset
                    var currentOffset = this
                        .scrollerForParent
                        .currentOffset()
                        .yOffset
                    var newOffset = currentOffset + offset
                    if (offset > 0.0) {
                        if (this
                            .scrollerForChild
                            .isAtEnd()) {
                            return offset
                        }
                        if (newOffset > this.headerHeight) {
                            this
                                .scrollerForChild
                                .scrollBy(xOffset: 0.0, yOffset: retOffset)
                            if (currentOffset < this.headerHeight) {
                                return this.headerHeight - currentOffset
                            } else {
                                return 0.0
                            }
                        }
                    } else {
                        if (this
                            .scrollerForChild
                            .currentOffset()
                            .yOffset <= 0.0) {
                            return offset
                        }
                        if (newOffset < this.headerHeight) {
                            this
                                .scrollerForChild
                                .scrollBy(xOffset: 0.0, yOffset: retOffset)
                            return 0.0
                            if (currentOffset > this.headerHeight) {
                                return this.headerHeight - currentOffset
                            } else {
                                return 0.0
                            }
                        }
                    }
                    return offset
                }
            )
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
    }
}
```## Sample Code 5 (Setting Scroll Limits)

This example demonstrates scroll boundary limitation for the Scroll component.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    var scroller: Scroller = Scroller()
    private var arr: ArrayList<Int64> = ArrayList<Int64>(16, {i => i+1})
    func build() {
        Scroll(this.scroller) {
            Column {
                ForEach(this.arr, itemGeneratorFunc: {item: Int64, idx: Int64 =>
                            Text(item.toString())
                            .width(90.percent)
                            .height(200)
                            .backgroundColor(0xFFFFFF)
                            .borderWidth(1)
                            .borderRadius(15)
                            .fontSize(16)
                            .textAlign(TextAlign.Center)
                })
            }.width(100.percent).backgroundColor(0xDCDCDC)
        }
        .backgroundColor(Color.White)
        .height(100.percent)
        .edgeEffect(EdgeEffect.Spring)
        .scrollSnap(ScrollSnapOptions(ScrollSnapAlign.START, snapPagination: 400, enableSnapToStart: true, enableSnapToEnd: true))
    }
}
```

## Sample Code 6 (Setting Child Component Index)

This example shows how to obtain child component indices in a List component.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    private var arr: ArrayList<Int64> = ArrayList<Int64>([])
    private var scroller: ListScroller = ListScroller()
    @State
    var listSpace: Int64 = 10
    @State
    var listIndex: Int64 = 0

    protected override func aboutToAppear() {
        for (i in 0..10) {
            this.arr.add(i)
        }
    }

    func build() {
        Column {
            List(space: this.listSpace, initialIndex: 4, scroller: this.scroller) {
                ForEach(
                    this.arr,
                    itemGeneratorFunc: {
                        item: Int64, idx: Int64 => ListItem {
                            Text("item-" + item.toString())
                                .height(100)
                                .width(90.percent)
                                .fontSize(16)
                                .textAlign(TextAlign.Center)
                                .borderRadius(10)
                                .backgroundColor(Color.White)
                                .onClick({
                                    _ => this.listIndex = item
                                })
                        }
                    }
                )
            }
                .backgroundColor(Color.Gray)
                .layoutWeight(1)
                .scrollBar(BarState.On)
                .alignListItem(ListItemAlign.Center)

            Text("Current item index: " + this
                .listIndex
                .toString())
                .fontColor(Color.Red)
                .height(50)
        }
    }
}
```

## Sample Code 7 (Setting Edge Fading Effect)

This example implements edge fading effect for the Scroll component and configures the fading length.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
    var scroller: Scroller = Scroller()
    private var arr: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])

    func build() {
        Stack(Alignment.TopStart) {
            Scroll(this.scroller) {
                Column {
                    ForEach(
                        this.arr,
                        itemGeneratorFunc: {
                            item: Int64, idx: Int64 => Text(item.toString())
                                .width(90.percent)
                                .height(150)
                                .backgroundColor(0xFFFFFF)
                                .borderRadius(15)
                                .fontSize(16)
                                .textAlign(TextAlign.Center)
                                .margin(top: 10)
                        }
                    )
                }.width(100.percent)
            }.fadingEdge(true, FadingEdgeOptions(fadingEdgeLength: 80))
        }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
    }
}
```

![scroll7](./figures/scroll7.gif)