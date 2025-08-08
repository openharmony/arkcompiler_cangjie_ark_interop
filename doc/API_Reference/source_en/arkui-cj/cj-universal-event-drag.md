# Drag Events

Drag events refer to the events triggered when a component is long-pressed and dragged.

> **Note:**
>
> The pre-installed resource files of the application (i.e., resource files existing in the HAP package before installation) only support intra-application local dragging.

Developers can customize drag responses by implementing generic drag events.

<!--RP1--><!--RP1End-->Developers need to set the `draggable` attribute to `true` and implement data transfer-related content in interfaces such as `onDragStart` to properly handle dragging.

## func onDragStart((DragInfo) -> DragItemInfo)

```cangjie
public func onDragStart(callback: (DragInfo)-> DragItemInfo): This
```

**Function:** Triggers the callback when the component bound to this event is dragged for the first time, with a long-press duration ≥ 500ms and finger movement distance ≥ 10vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Event Priority:** If the long-press trigger time < 500ms, the long-press event takes precedence over the drag event response. If the long-press trigger time ≥ 500ms, the drag event takes precedence over the long-press event response.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragInfo](#class-draginfo))->[DragItemInfo](#struct-dragiteminfo) | Yes | - | Callback function triggered when dragging starts.<br/>The input parameter is the drag event information, including the drag point coordinates.<br/>The return parameter is the component information displayed during dragging. |

## func onDragStart((DragInfo) -> (() -> Unit))

```cangjie
public func onDragStart(callback: (DragInfo)-> (() -> Unit)): This
```

**Function:** Overloads the drag event. Triggers the callback when the component bound to this event is dragged for the first time, with a long-press duration ≥ 500ms and finger movement distance ≥ 10vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragInfo](#class-draginfo)) | Yes | - | Callback function triggered when dragging starts.<br/>The input parameter is the drag event information, including the drag point coordinates.<br/>The return parameter is the component information displayed during dragging, to be used in combination with @Builder and bind methods. |

## func onDragStart((DragInfo) -> Unit)

```cangjie
public func onDragStart(callback: (DragInfo)-> Unit): This
```

**Function:** Overloads the drag event. Triggers the callback when the component bound to this event is dragged for the first time, with a long-press duration ≥ 500ms and finger movement distance ≥ 10vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragInfo](#class-draginfo))->Unit | Yes | - | Callback function triggered when dragging starts.<br/>The input parameter is the drag event information, including the drag point coordinates.<br/>The return parameter is the component information displayed during dragging. |

## func onDragStart((DragEvent,?String) -> DragItemInfo)

```cangjie
public func onDragStart(callback: (DragEvent, ?String)->DragItemInfo): This
```

**Function:** Overloads the drag event. Triggers the callback when the component bound to this event is dragged for the first time, with a long-press duration ≥ 500ms and finger movement distance ≥ 10vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragEvent](#class-dragevent),?String)->[DragItemInfo](#struct-dragiteminfo) | Yes | - | Callback function.<br/>The first parameter is the drag event information, including the drag point coordinates.<br/>The second parameter is additional drag event information, which needs to be parsed into JSON format. Refer to [extraParams description](#extraparams说明).<br/>The return parameter is the component information displayed during dragging. |

## func onDragStart((DragEvent,?String) -> (() -> Unit))

```cangjie
public func onDragStart(callback: (DragEvent, ?String)->(()->Unit)): This
```

**Function:** Overloads the drag event. Triggers the callback when the component bound to this event is dragged for the first time, with a long-press duration ≥ 500ms and finger movement distance ≥ 10vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragEvent](#class-dragevent),?String)->(()->Unit) | Yes | - | Callback function.<br/>The first parameter is the drag event information, including the drag point coordinates.<br/>The second parameter is additional drag event information, which needs to be parsed into JSON format. Refer to [extraParams description](#extraparams说明). |

## func onDragStart((DragEvent,?String) -> Unit)

```cangjie
public func onDragStart(callback: (DragEvent, ?String)->Unit): This
```

**Function:** Overloads the drag event. Triggers the callback when the component bound to this event is dragged for the first time, with a long-press duration ≥ 500ms and finger movement distance ≥ 10vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragEvent](#class-dragevent),?String)->Unit | Yes | - | Callback function.<br/>The first parameter is the drag event information, including the drag point coordinates.<br/>The second parameter is additional drag event information, which needs to be parsed into JSON format. Refer to [extraParams description](#extraparams说明). |

## func onDragEnter((DragInfo) -> Unit)

```cangjie
public func onDragEnter(callback: (DragInfo)->Unit): This
```

**Function:** Triggers the event when dragging enters the component's bounds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

> **Note:**
>
> This event is only valid when the `onDrop` event is monitored.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragInfo](#class-draginfo))->Unit | Yes | - | Callback function triggered when dragging enters the component's bounds. |

## func onDragEnter((DragEvent,?String) -> Unit)

```cangjie
public func onDragEnter(callback: (DragEvent, ?String)->Unit): This
```

**Function:** Triggers the event when dragging enters the component's bounds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragEvent](#class-dragevent),?String)->Unit | Yes | - | Callback function.<br/>The first parameter is the drag event information, including the drag point coordinates.<br/>The second parameter is additional drag event information, which needs to be parsed into JSON format. Refer to [extraParams description](#extraparams说明). |

## func onDragMove((DragEvent,?String) -> Unit)

```cangjie
public func onDragMove(callback: (DragEvent, ?String)->Unit): This
```

**Function:** Triggers the callback when dragging moves within the component's bounds. This event is only valid when the `onDrop` event is monitored.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragEvent](#class-dragevent),?String)->Unit | Yes | - | Callback function triggered when dragging moves within the component's bounds.<br/>The first parameter is the drag event information, including the drag point coordinates.<br/>The second parameter is additional drag event information, which needs to be parsed into JSON format. Refer to [extraParams description](#extraparams说明). |

## func onDragMove((DragInfo) -> Unit)

```cangjie
public func onDragMove(callback: (DragInfo)->Unit): This
```

**Function:** Triggers the event when dragging moves within the component's bounds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

> **Note:**
>
> This event is only valid when the `onDrop` event is monitored.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragInfo](#class-draginfo))->Unit | Yes | - | Callback function triggered when dragging moves within the component's bounds. |

## func onDragLeave((DragEvent,?String) -> Unit)

```cangjie
public func onDragLeave(callback: (DragEvent, ?String)->Unit): This
```

**Function:** Triggers the callback when dragging leaves the component's bounds. This event is only valid when the `onDrop` event is monitored.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragEvent](#class-dragevent),?String)->Unit | Yes | - | Callback function triggered when dragging moves within the component's bounds.<br/>The first parameter is the drag event information, including the drag point coordinates.<br/>The second parameter is additional drag event information, which needs to be parsed into JSON format. Refer to [extraParams description](#extraparams说明). |

## func onDragLeave((DragInfo) -> Unit)

```cangjie
public func onDragLeave(callback: (DragInfo)->Unit): This
```

**Function:** Triggers the event when dragging leaves the component's bounds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

> **Note:**
>
> This event is only valid when the `onDrop` event is monitored.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragInfo](#class-draginfo))->Unit | Yes | - | Callback function triggered when dragging leaves the component's bounds.<br/>The input parameter is the drag event information, including the drag point coordinates. |

## func onDrop((DragEvent,?String) -> Unit)

```cangjie
public func onDrop(callback: (DragEvent, ?String)->Unit): This
```

**Function:** The component bound to this event can serve as a drag release target. Triggers the callback when the drag behavior stops within the component's bounds. If the developer does not actively call `event.setResult()` in `onDrop` to set the drag reception result, for components that support default drag-and-drop by the system, the system's actual data processing result will be used. For other components, the system will treat the data reception as successful.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragEvent](#class-dragevent),?String)->Unit | Yes | - | Callback function triggered when the drag behavior stops within the component's bounds.<br/>The first parameter is the drag event information, including the drag point coordinates.<br/>The second parameter is additional drag event information, which needs to be parsed into JSON format. Refer to [extraParams description](#extraparams说明). |

## func onDrop((DragInfo) -> Unit)

```cangjie
public func onDrop(callback: (DragInfo)->Unit): This
```

**Function:** The component bound to this event can serve as a drag release target. Triggers the event when the drag behavior stops within the component's bounds.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragInfo](#class-draginfo))->Unit | Yes | - | Callback function triggered when the drag behavior stops within the component's bounds.<br/>The input parameter is the drag event information, including the drag point coordinates. |

## func onDragEnd((DragEvent,?String) -> Unit)

```cangjie
public func onDragEnd(callback: (DragEvent, ?String)->Unit): This
```

**Function:** Triggers the callback after the drag initiated by the component bound to this event ends.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([DragEvent](#class-dragevent),?String)->Unit | Yes | - | Callback function triggered after dragging ends.<br/>The first parameter is the drag event information, including the drag point coordinates.<br/>The second parameter is additional drag event information, which needs to be parsed into JSON format. Refer to [extraParams description](#extraparams说明). |

## func onPreDrag((PreDragStatus) -> Unit)

```cangjie
public func onPreDrag(callback: (PreDragStatus)->Unit): This
```

**Function:** Binds to the component that triggers this event, invoking a callback when different phases before drag initiation occur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([PreDragStatus](#enum-predragstatus))->Unit | Yes | - | Callback function triggered before drag initiation. |

## Explanation of extraParams

Used to return additional information required by the component during dragging.

extraParams is a String converted from a Json object. After conversion via the Json library, the following attributes can be obtained.

| Parameter Name | Parameter Type | Description |
|:---------|:-----------|:----------------|
| selectedIndex | Int64 | When the drag event is set on a child element of a parent container, selectedIndex indicates that the currently dragged child element is the selectedIndex-th child of the parent container, starting from 0.<br/>Only effective in drag events of ListItem components. |
| insertIndex | Int64 | When the dragged element is dropped in a List component, insertIndex indicates the position where the dragged element is inserted as the insertIndex-th element, starting from 0.<br/>Only effective in drag events of List components. |

## Basic Type Definitions

### class DragEvent

```cangjie
public class DragEvent {
    public let useCustomDropAnimation: Bool
    public let dragBehavior: DragBehavior
}
```

**Function:** Drag event type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

#### let dragBehavior

```cangjie
public let dragBehavior: DragBehavior
```

**Function:** Toggles the display state of the corner marker for copy and cut modes.

**Type:** [DragBehavior](#enum-dragbehavior)

**Read-Write Capability:** Read-only

**Initial Version:** 19

#### let useCustomDropAnimation

```cangjie
public let useCustomDropAnimation: Bool
```

**Function:** Determines whether to enable and use the system's default drop animation when dragging ends.<br/>Applications can set this value to true to disable the default drop animation and implement their own custom drop animation.<br/>If not configured or set to false, the system's default drop animation takes effect. If the control at the release position can receive dragged data, the animation is a shrink-and-disappear effect; if not, it is an expand-and-disappear effect.<br/>If the default drop animation is not disabled, applications should not implement custom animations to avoid conflicts.

**Type:** Bool

**Read-Write Capability:** Read-only

**Initial Version:** 19

#### func getDisplayX()

```cangjie
public func getDisplayX(): Float64
```

**Function:** Gets the x-coordinate of the current drag point relative to the top-left corner of the screen, in vp units.

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | x-coordinate value. |

#### func getDisplayY()

```cangjie
public func getDisplayY(): Float64
```

**Function:** Gets the y-coordinate of the current drag point relative to the top-left corner of the screen, in vp units.

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | y-coordinate value. |

#### func getModifierKeyState(Array\<String>)

```cangjie
public func getModifierKeyState(keys: Array<String>): Bool
```

**Function:** Gets the pressed state of modifier keys. Error messages refer to the following error codes. Supported modifier keys: "Ctrl"|"Alt"|"Shift"|"Fn". External keyboards with an Fn key are not supported for Fn key queries.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| keys | Array\<String> | Yes | - | Array of modifier key strings. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Pressed state. |

#### func getPreviewRect()

```cangjie
public func getPreviewRect(): Rectangle
```

**Function:** Gets the position of the drag preview relative to the current window, as well as its size information, in vp units. The x and y values represent the window coordinates of the top-left corner of the preview, while width and height represent its dimensions.

**Return Value:**

| Type | Description |
|:----|:----|
| [Rectangle](./cj-common-types.md#class-rectangle) | Position information of the drag preview. |

#### func getResult()

```cangjie
public func getResult(): DragResult
```

**Function:** Retrieves the drag result from DragEvent.

**Return Value:**

| Type | Description |
|:----|:----|
| [DragResult](#enum-dragresult) | Drag result. |

#### func getVelocity()

```cangjie
public func getVelocity(): Float64
```

**Function:** Gets the primary drag velocity of the current drag operation. Calculated as the square root of the sum of the squares of the x and y-axis velocities.

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | Primary drag velocity. |

#### func getVelocityX()

```cangjie
public func getVelocityX(): Float64
```

**Function:** Gets the x-axis drag velocity of the current drag operation. The origin of the coordinate axis is the top-left corner of the screen, in vp units. Positive velocity indicates rightward movement, while negative indicates leftward.

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | x-axis drag velocity. |

#### func getVelocityY()

```cangjie
public func getVelocityY(): Float64
```

**Function:** Gets the y-axis drag velocity of the current drag operation. The origin of the coordinate axis is the top-left corner of the screen, in vp units. Positive velocity indicates downward movement, while negative indicates upward.

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | y-axis drag velocity. |

#### func getWindowX()

```cangjie
public func getWindowX(): Float64
```

**Function:** Gets the x-coordinate of the current drag point relative to the top-left corner of the window, in vp units.

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | x-coordinate value. |

#### func getWindowY()

```cangjie
public func getWindowY(): Float64
```

**Function:** Gets the y-coordinate of the current drag point relative to the top-left corner of the window, in vp units.

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | y-coordinate value. |

#### func setResult(DragResult)

```cangjie
public func setResult(dragRect: DragResult): Unit
```

**Function:** Sets the drag result in DragEvent.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| dragRect | [DragResult](#enum-dragresult) | Yes | - | Drag result. |

### class DragInfo

```cangjie
public class DragInfo {
    public DragInfo(
        public var extraParams: String,
        public var dragEvent: Position
    )
}
```

**Function:** Configuration type for drag action parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

#### var dragEvent

```cangjie
public var dragEvent: Position
```

**Function:** Stores drag point coordinate information.

**Type:** [Position](./cj-common-types.md#class-position)

**Read-Write Capability:** Read-write

**Initial Version:** 12

#### var extraParams

```cangjie
public var extraParams: String
```

**Function:** Stores additional information for drag events.

**Type:** String

**Read-Write Capability:** Read-write

**Initial Version:** 12

#### DragInfo(String, Position)

```cangjie
public DragInfo(
    public var extraParams: String,
    public var dragEvent: Position
)
```

**Function:** Creates an object of type DragInfo.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| extraParams | String | Yes | - | Additional information for drag events. |
| dragEvent | [Position](./cj-common-types.md#class-position) | Yes | - | Drag event information, including drag point coordinates. |

> **Note:**
>
> - extraParams contains additional information for drag events, set by the drag component.
> - extraParams is a String converted from a Json object.
> - When the drag event is set on a child element of a parent container, selectedIndex indicates that the currently dragged child element is the selectedIndex-th child of the parent container, starting from 0.
> - When the dragged element is dropped in a List component, insertIndex indicates the position where the dragged element is inserted as the insertIndex-th element, starting from 0.### struct DragItemInfo

```cangjie
public struct DragItemInfo {
    public DragItemInfo(
        public var pixelMap!: Option<PixelMap> = Option.None ,
        public var builder!: Option<() -> Unit> = Option.None,
        public var extraInfo!: String = ""
    )
}
```

**Description:** Component information displayed during the drag process.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### var builder

```cangjie
public var builder: Option <() -> Unit> = Option.None
```

**Description:** Uses a custom builder for drawing. If pixelMap is set, this value becomes invalid.

**Type:** Option\<()->Unit>

**Access:** Read-write

**Since:** 12

#### var extraInfo

```cangjie
public var extraInfo: String = ""
```

**Description:** Configures the description of the drag item.

**Type:** String

**Access:** Read-write

**Since:** 12

#### var pixelMap

```cangjie
public var pixelMap: Option<PixelMap>= Option.None
```

**Description:** Sets the image displayed during the drag process.

**Type:** Option\<[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)>

**Access:** Read-write

**Since:** 12

#### DragItemInfo(Option\<PixelMap>, Option\<() -> Unit>, String)

```cangjie
public DragItemInfo(
    public var pixelMap!: Option<PixelMap> = Option.None ,
    public var builder!: Option<() -> Unit> = Option.None,
    public var extraInfo!: String = ""
)
```

**Description:** Creates a DragItemInfo object.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| pixelMap | Option\<[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)> | No | Option.None | **Named parameter.** Sets the image displayed during the drag process. |
| builder | Option\<()->Unit> | No | Option.None | **Named parameter.** Uses a custom builder for drawing. If pixelMap is set, this value is ignored. |
| extraInfo | String | No | "" | **Named parameter.** Description of the drag item. |

### enum DragBehavior

```cangjie
public enum DragBehavior {
    | COPY
    | MOVE
    | UNKNOWN
}
```

**Description:** When [DragResult](#enum-dragresult) is set to DROP_ENABLED, DragBehavior can be set to COPY or MOVE. DragBehavior describes to developers whether the data processing method is COPY or MOVE, but it cannot ultimately determine the actual processing method of the data. DragBehavior is returned to the data source through onDragEnd, allowing the drag initiator to distinguish between COPY and MOVE behaviors.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### COPY

```cangjie
COPY
```

**Description:** Specifies the data processing method as COPY.

**Since:** 19

#### MOVE

```cangjie
MOVE
```

**Description:** Specifies the data processing method as MOVE.

**Since:** 19

#### UNKNOWN

```cangjie
UNKNOWN
```

**Description:** Unknown behavior, can be used for error handling.

**Since:** 19

### enum DragResult

```cangjie
public enum DragResult {
    | DRAG_SUCCESSFUL
    | DRAG_FAILED
    | DRAG_CANCELED
    | DROP_ENABLED
    | DROP_DISABLED
    | DRAG_DEFAULT
}
```

**Description:** Drag result.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### DRAG_CANCELED

```cangjie
DRAG_CANCELED
```

**Description:** Drag canceled, used in onDrop.

**Since:** 19

#### DRAG_DEFAULT

```cangjie
DRAG_DEFAULT
```

**Description:** Default drag result.

**Since:** 19

#### DRAG_FAILED

```cangjie
DRAG_FAILED
```

**Description:** Drag failed, used in onDrop.

**Since:** 19

#### DRAG_SUCCESSFUL

```cangjie
DRAG_SUCCESSFUL
```

**Description:** Drag successful, used in onDrop.

**Since:** 19

#### DROP_DISABLED

```cangjie
DROP_DISABLED
```

**Description:** Component does not allow drop, used in onDragMove.

**Since:** 19

#### DROP_ENABLED

```cangjie
DROP_ENABLED
```

**Description:** Component allows drop, used in onDragMove.

**Since:** 19

### enum PreDragStatus

```cangjie
public enum PreDragStatus {
    | ACTION_DETECTING_STATUS
    | READY_TO_TRIGGER_DRAG_ACTION
    | PREVIEW_LIFT_STARTED
    | PREVIEW_LIFT_FINISHED
    | PREVIEW_LANDING_STARTED
    | PREVIEW_LANDING_FINISHED
    | ACTION_CANCELED_BEFORE_DRAG
}
```

**Description:** Drag initiation status.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### ACTION_CANCELED_BEFORE_DRAG

```cangjie
ACTION_CANCELED_BEFORE_DRAG
```

**Description:** Drag lift landing animation interrupted. (Triggered when the finger is lifted after reaching READY_TO_TRIGGER_DRAG_ACTION status but before the animation phase).

**Since:** 19

#### ACTION_DETECTING_STATUS

```cangjie
ACTION_DETECTING_STATUS
```

**Description:** Drag gesture initiation phase. (Triggered after 50ms of pressing).

**Since:** 19

#### PREVIEW_LANDING_FINISHED

```cangjie
PREVIEW_LANDING_FINISHED
```

**Description:** Drag landing animation completion phase. (Triggered when the landing animation ends).

**Since:** 19

#### PREVIEW_LANDING_STARTED

```cangjie
PREVIEW_LANDING_STARTED
```

**Description:** Drag landing animation initiation phase. (Triggered when the landing animation starts).

**Since:** 19

#### PREVIEW_LIFT_FINISHED

```cangjie
PREVIEW_LIFT_FINISHED
```

**Description:** Drag lift animation completion phase. (Triggered when the lift animation fully ends).

**Since:** 19

#### PREVIEW_LIFT_STARTED

```cangjie
PREVIEW_LIFT_STARTED
```

**Description:** Drag lift animation initiation phase. (Triggered after 800ms of pressing).

**Since:** 19

#### READY_TO_TRIGGER_DRAG_ACTION

```cangjie
READY_TO_TRIGGER_DRAG_ACTION
```

**Description:** Drag preparation completed, ready to initiate drag phase. (Triggered after 500ms of pressing).

**Since:** 19