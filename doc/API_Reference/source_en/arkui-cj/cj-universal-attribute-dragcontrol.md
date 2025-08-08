# Drag Control

Sets whether a component can respond to drag events.

> **Note:**
>
> Developers can customize drag responses by implementing universal drag events.
>
> <!--RP1--><!--RP1End-->Developers need to set the `draggable` attribute to `true` and implement data transfer-related content in interfaces such as `onDragStart` to properly handle dragging.

## func draggable(Bool)

```cangjie
public open func draggable(value: Bool): This
```

**Function:** Sets whether the component allows dragging.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether the component allows dragging. `true` means dragging is allowed, `false` means dragging is not allowed.<br/>Initial value: `false`. |

## func dragPreview(DragItemInfo)

```cangjie
public func dragPreview(value: DragItemInfo): This
```

**Function:** Sets the preview image during component dragging.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [DragItemInfo](./cj-universal-event-drag.md#struct-dragiteminfo) | Yes | - | The preview image during component dragging, effective only in the [onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo) drag mode.<br/>When a component supports dragging and simultaneously sets a preview image via [bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype), the long-press floating preview image will prioritize the one set by [bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype). The backplate image returned by developers in [onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring------unit) has lower priority than the preview image set by [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreviewdragiteminfo). When [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit) is set, the backplate image during dragging will use the [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit) preview image.<br>When a string-type `id` is passed, the screenshot of the component corresponding to the `id` will be used as the preview image. If the component corresponding to the `id` cannot be found, or if the `Visibility` attribute of the component is set to `none`/`hidden`, the component itself will be screenshot for the drag preview image. Currently, the screenshot does not include visual effects such as brightness, shadow, blur, or rotation.<br>Initial value: empty. |

## func dragPreview(String)

```cangjie
public func dragPreview(value: String): This
```

**Function:** Sets the preview image during component dragging.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | The preview image during component dragging, effective only in the [onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo) drag mode.<br/>When a component supports dragging and simultaneously sets a preview image via [bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype), the long-press floating preview image will prioritize the one set by [bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype). The backplate image returned by developers in [onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo) has lower priority than the preview image set by [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit). When [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit) is set, the backplate image during dragging will use the [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit) preview image.<br>When a string-type `id` is passed, the screenshot of the component corresponding to the `id` will be used as the preview image. If the component corresponding to the `id` cannot be found, or if the `Visibility` attribute of the component is set to `none`/`hidden`, the component itself will be screenshot for the drag preview image. Currently, the screenshot does not include visual effects such as brightness, shadow, blur, or rotation.<br>Initial value: empty. |

## func dragPreview(() -> Unit)

```cangjie
public func dragPreview(builder: () -> Unit): This
```

**Function:** Sets the preview image during component dragging.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| builder | () -> Unit | Yes | - | The preview image during component dragging, effective only in the [onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo) drag mode.<br/>When a component supports dragging and simultaneously sets a preview image via [bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype), the long-press floating preview image will prioritize the one set by [bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype). The backplate image returned by developers in [onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring---dragiteminfo) has lower priority than the preview image set by [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit). When [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit) is set, the backplate image during dragging will use the [dragPreview](./cj-universal-attribute-dragcontrol.md#func-dragpreview---unit) preview image.<br>When a string-type `id` is passed, the screenshot of the component corresponding to the `id` will be used as the preview image. If the component corresponding to the `id` cannot be found, or if the `Visibility` attribute of the component is set to `none`/`hidden`, the component itself will be screenshot for the drag preview image. Currently, the screenshot does not include visual effects such as brightness, shadow, blur, or rotation.<br>Initial value: empty. Use in combination with `@Builder` and `bind` methods. |

## Basic Type Definitions

### class DragInteractionOptions

```cangjie
public class DragInteractionOptions {
    public DragInteractionOptions(
        public let isMultiSelectionEnabled!: Bool = false,
        public let defaultAnimationBeforeLifting!: Bool = false
    )
}
```

**Function:** Effects during dragging.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### let isMultiSelectionEnabled

```cangjie
public let isMultiSelectionEnabled: Bool = false
```

**Function:** Indicates whether the backplate image supports multi-selection clustering during dragging. `true` means multi-selection clustering is supported, `false` means it is not.

**Type:** Bool

**Read/Write:** Read-only

**Since:** 19

#### let defaultAnimationBeforeLifting

```cangjie
public let defaultAnimationBeforeLifting: Bool = false
```

**Function:** Indicates whether to enable the component's default tap effect (scaling down) during the long-press floating phase. `true` means the default tap effect is enabled, `false` means it is not.

**Type:** Bool

**Read/Write:** Read-only

**Since:** 19

#### DragInteractionOptions(Bool, Bool)

```cangjie
public DragInteractionOptions(public let isMultiSelectionEnabled!: Bool = false, public let defaultAnimationBeforeLifting!: Bool = false)
```

**Function:** Constructs a `DragInteractionOptions` object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| isMultiSelectionEnabled | Bool | No | false | **Named parameter.** Indicates whether the backplate image supports multi-selection clustering during dragging. `true` means multi-selection clustering is supported, `false` means it is not. |
| defaultAnimationBeforeLifting | Bool | No | false | **Named parameter.** Indicates whether to enable the component's default tap effect (scaling down) during the long-press floating phase. `true` means the default tap effect is enabled, `false` means it is not. |

### enum DragPreviewMode

```cangjie
public enum DragPreviewMode {
    | AUTO
    | DISABLE_SCALE
    | ENABLE_DEFAULT_SHADOW
    | ENABLE_DEFAULT_RADIUS
}
```

**Function:** Drag behavior control.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### AUTO

```cangjie
AUTO
```

**Function:** The system automatically changes the follow-point position based on the drag scenario and applies scaling transformations to the drag backplate image according to rules.

**Since:** 19

#### DISABLE_SCALE

```cangjie
DISABLE_SCALE
```

**Function:** Disables the system's scaling behavior for the drag backplate image.

**Since:** 19

#### ENABLE_DEFAULT_SHADOW

```cangjie
ENABLE_DEFAULT_SHADOW
```

**Function:** Enables the default shadow effect for non-text components.

**Since:** 19

#### ENABLE_DEFAULT_RADIUS

```cangjie
ENABLE_DEFAULT_RADIUS
```

**Function:** Enables a uniform rounded corner effect for non-text components, with a default value of 12vp. If the rounded corner value set by the application is greater than the default value or the rounded corner set by `modifier`, the application's custom rounded corner effect will be displayed.

**Since:** 19