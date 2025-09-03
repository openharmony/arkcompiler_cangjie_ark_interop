# Drag Events

Drag events refer to events triggered when a component is long-pressed and dragged.

> **Note:**
>
> Preloaded resource files in the application (i.e., resource files existing in the HAP package before installation) only support intra-application drag-and-drop within the local environment.

The ArkUI framework provides default drag-and-drop capabilities for the following components, supporting data drag-out or drag-in responses. Developers can also customize drag-and-drop responses by implementing generic drag events.

- Components with default drag-out capability (data can be dragged from these components): [Search](./cj-text-input-search.md), [TextInput](./cj-text-input-textinput.md), [TextArea](./cj-text-input-textarea.md), [RichEditor](./cj-text-input-richeditor.md), [Text](./cj-text-input-text.md), [Image](./cj-image-video-image.md). Developers can control the use of default drag capabilities by setting the `draggable` property of these components.

- Components with default drag-in capability (target components can respond to dragged-in data): [Search](./cj-text-input-search.md), [TextInput](./cj-text-input-textinput.md), [TextArea](./cj-text-input-textarea.md), [RichEditor](./cj-text-input-richeditor.md). Developers can disable the default drag-in capability by setting the `allowDrop` property of these components to `null`.

<!--RP1--><!--RP1End-->Other components require developers to set the `draggable` property to `true` and implement data transfer-related content in interfaces such as `onDragStart` to handle drag-and-drop correctly.

> **Note:**
>
> The `Text` component must be used in conjunction with [copyOption](./cj-text-input-text.md#func-copyoptioncopyoptions), setting `copyOptions` to either `CopyOptions.InApp` or `CopyOptions.LocalDevice`.

## Import Module

```cangjie
import kit.ArkUI.*
```

## class DragInfo

```cangjie
public class DragInfo {
    public var extraParams: String
    public var touchPoint: Position
}
```

**Function:** Configuration type for drag action parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

### var extraParams

```cangjie
public var extraParams: String
```

**Function:** Stores additional information for drag events.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

### var touchPoint

```cangjie
public var touchPoint: Position
```

**Function:** Stores coordinate information of the drag point.

**Type:** [Position](./cj-common-types.md#class-position)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

## class DragItemInfo

```cangjie
public class DragItemInfo {
    public var pixelMap: PixelMap = PixelMap(0)
    public var builder: CustomBuilder = { => }
    public var extraInfo: String
    public init(pixelMap: PixelMap, builder: CustomBuilder, extraInfo: String)
}
```

**Function:** Information about the component displayed during the drag process.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

### var builder

```cangjie
public var builder: CustomBuilder = { => }
```

**Function:** Uses a custom builder for drawing. If `pixelMap` is set, this value is ignored.

**Type:** [CustomBuilder](./cj-common-types.md#type-custombuilder)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

### var extraInfo

```cangjie
public var extraInfo: String
```

**Function:** Configures the description of the drag item.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

### var pixelMap

```cangjie
public var pixelMap: PixelMap = PixelMap(0)
```

**Function:** Sets the image displayed during the drag process.

**Type:** [PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

### init(PixelMap, CustomBuilder, String)

```cangjie
public init(pixelMap: PixelMap, builder: CustomBuilder, extraInfo: String)
```

**Function:** Creates an object of type `DragItemInfo`.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| pixelMap | [PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap) | Yes | - | Sets the image displayed during the drag process. |
| builder | [CustomBuilder](./cj-common-types.md#type-custombuilder) | Yes | - | Uses a custom builder for drawing. If `pixelMap` is set, this value is ignored. |
| extraInfo | String | Yes | - | Description of the drag item. |