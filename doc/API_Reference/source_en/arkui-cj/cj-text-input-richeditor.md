# RichEditor

A component that supports mixed text-image layout and interactive text editing.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

None

## Creating the Component

### init(RichEditorController)

```cangjie
public init(controller: RichEditorController)
```

**Function:** Creates a RichEditor component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| controller | [RichEditorController](#class-richeditorcontroller) | Yes | - | Rich text controller. |

## Common Attributes/Common Events

Common Attributes: All supported.

> **Note:**
>
> - The `align` attribute only supports top, middle, and bottom alignment.
> - The `borderImage` attribute is not supported.

Common Events: All supported.

## Component Attributes

### func aboutToDelete(Callback\<RichEditorDeleteValue,Bool>)

```cangjie
public func aboutToDelete(callback: Callback<RichEditorDeleteValue, Bool>): This
```

**Function:** Triggers an event before the input method deletes content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [Callback](../apis/BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorDeleteValue](#class-richeditordeletevalue),Bool> | Yes | - | Callback function triggered before the input method deletes content.<br>[RichEditorDeleteValue](#class-richeditordeletevalue): Text Span information where the content to be deleted resides.<br>true: The component performs the delete operation.<br>false: The component does not perform the delete operation. |

### func aboutToIMEInput(Callback\<RichEditorInsertValue,Bool>)

```cangjie
public func aboutToIMEInput(callback: Callback<RichEditorInsertValue, Bool>): This
```

**Function:** Triggers an event before the input method inputs content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [Callback](../apis/BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorInsertValue](#class-richeditorinsertvalue),Bool> | Yes | - | Callback function triggered before the input method inputs content.<br>[RichEditorInsertValue](#class-richeditorinsertvalue): Information about the content to be input by the input method.<br>true: The component performs the add content operation.<br>false: The component does not perform the add content operation. |

### func bindSelectionMenu(RichEditorSpanType, CustomBuilder, ResponseType, SelectionMenuOptions)

```cangjie
public func bindSelectionMenu(
    spantype!: RichEditorSpanType = RichEditorSpanType.TEXT,
    content!: CustomBuilder,
    responseType!: ResponseType = ResponseType.LongPress,
    options!: SelectionMenuOptions
): This
```

**Function:** Sets a custom selection menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| spantype | [RichEditorSpanType](#enum-richeditorspantype) | No | RichEditorSpanType.TEXT | **Named parameter.** Specifies the type of the selection menu. |
| content | [CustomBuilder](./cj-common-types.md#type-custombuilder) | Yes | - | **Named parameter.** Specifies the content of the selection menu. Use with [@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md) and bind methods. |
| responseType | [ResponseType](#enum-responsetype) | No | ResponseType.LongPress | **Named parameter.** Specifies the response type of the selection menu. |
| options | [SelectionMenuOptions](#func-bindselectionmenutextspantype----unit-textresponsetype-int32int32---unit----unit) | Yes | - | **Named parameter.** Specifies the options of the selection menu. |

### func copyOptions(CopyOptions)

```cangjie
public func copyOptions(value: CopyOptions): This
```

**Function:** Sets the capability to support copy and paste for text content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [CopyOptions](./cj-common-types.md#enum-copyoptions) | Yes | - | Copy and paste capability.<br>Initial value: CopyOptions.LocalDevice. |

### func customKeyboard(CustomBuilder)

```cangjie
public func customKeyboard(value!: CustomBuilder): This
```

**Function:** Defines a custom keyboard.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [CustomBuilder](./cj-common-types.md#type-custombuilder) | Yes | - | **Named parameter.** Custom keyboard for the rich text editor. Use with [@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md) and bind methods. |

## Component Events

### func onDeleteComplete(VoidCallback)

```cangjie
public func onDeleteComplete(callback: VoidCallback): This
```

**Function:** Triggers an event after the input method completes deletion.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback) | Yes | - | Callback function triggered when the input method completes deletion. |

### func onDidChange(OnDidChangeCallback)

```cangjie
public func onDidChange(callback: OnDidChangeCallback): This
```

**Function:** Triggers an event after the component performs add or delete operations. The event is not triggered if no actual text addition or deletion occurs.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [OnDidChangeCallback](#type-ondidchangecallback) | Yes | - | Callback function triggered after the component performs add or delete operations. The callback is not triggered if no actual text addition or deletion occurs. Parameter: Content range before and after the change. |

### func onIMEInputComplete(Callback\<RichEditorTextSpanResult,Unit>)

```cangjie
public func onIMEInputComplete(callback: Callback<RichEditorTextSpanResult, Unit>): RichEditor
```

**Function:** Triggers an event after the input method completes input.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [Callback](../apis/BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorTextSpanResult](#class-richeditortextspanresult),Unit> | Yes | - | Callback function triggered after the input method completes input.<br>RichEditorTextSpanResult: Text Span information after the input method completes input. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RichEditor](#class-richeditor) | RichEditor instance. |

### func onPaste(PasteEventCallback)

```cangjie
public func onPaste(callback: PasteEventCallback): This
```

**Function:** Triggers an event before completing paste.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [PasteEventCallback](<font color="red" face="bold">please add link</font>) | Yes | - | Callback function triggered before completing paste.<br>PasteEvent: Defines the user paste event. |

### func onReady(VoidCallback)

```cangjie
public func onReady(callback: VoidCallback): This
```

**Function:** Triggers an event after the rich text component is initialized.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback) | Yes | - | Callback function triggered after the rich text component is initialized. |

### func onSelect(Callback\<RichEditorSelection,Unit>)

```cangjie
public func onSelect(callback: Callback<RichEditorSelection, Unit>): This
```

**Function:** Triggers an event when content is selected by double-clicking the left mouse button; the event is triggered again after releasing the left mouse button. Triggers an event when content is selected by long-pressing with a finger; the event is triggered again after releasing the finger.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [Callback](../apis/BasicServicesKit/cj-apis-base.md#type-callback)\<[RichEditorSelection](#class-richeditorselection),Unit> | Yes | - | Callback function triggered after selecting with the left mouse button and releasing it.<br>Triggered after releasing the finger when selecting with a finger.<br>RichEditorSelection: Information about all selected Spans. |

## Basic Type Definitions

### class DecorationStyleResult

```cangjie
public class DecorationStyleResult {
    public var decorationType: TextDecorationType
    public var color: ResourceColor

    public init(
        decorationType: TextDecorationType,
        color: ResourceColor
    )
}
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var color

```cangjie
public var color: ResourceColor
```

**Function:** Decoration line color.

**Type:** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var decorationType

```cangjie
public var decorationType: TextDecorationType
```

**Function:** <font color="red" face="bold">please add description</font>

**Type:** [TextDecorationType](./cj-common-types.md#enum-textdecorationtype)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(TextDecorationType, ResourceColor)

```cangjie
public init(
    decorationType: TextDecorationType,
    color: ResourceColor
)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| decorationType | [TextDecorationType](./cj-common-types.md#enum-textdecorationtype) | Yes | - | <font color="red" face="bold">please add description</font> |
| color | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | Sets the entity color after successful text recognition.<br>Default value: '#ff0a59f7'<br>Meta Service API: Supported in meta services starting from API version 12. |

### class PasteEvent

```cangjie
public class PasteEvent {}
```

**Function:** Defines the user paste event.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func preventDefault()

```cangjie
public func preventDefault(): Unit
```

**Function:** Prevents the system default paste event.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### class RichEditorDeleteValue

```cangjie
public class RichEditorDeleteValue {
    public var offset: Int32
    public var direction: RichEditorDeleteDirection
    public var length: Int32
    public var richEditorDeleteSpans: ArrayList<RichEditorSpanResult>

    public init(
        offset: Int32,
        direction: RichEditorDeleteDirection,
        length: Int32,
        richEditorDeleteSpans: ArrayList<RichEditorSpanResult>
    )
}
```

**Function:** Information about the delete operation and the content to be deleted.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var direction

```cangjie
public var direction: RichEditorDeleteDirection
```

**Function:** Indicates the direction of the delete operation.

**Type:** [RichEditorDeleteDirection](#enum-richeditordeletedirection)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var length

```cangjie
public var length: Int32
```

**Function:** Indicates the length of the content to be deleted.

**Type:** Int32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var offset

```cangjie
public var offset: Int32
```

**Function:** Indicates the offset position of the content to be deleted.

**Type:** Int32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var richEditorDeleteSpans

```cangjie
public var richEditorDeleteSpans: ArrayList<RichEditorSpanResult>
```

**Function:** Indicates the specific information of the text or image Spans to be deleted.

**Type:** ArrayList\<[RichEditorSpanResult](<font color="red" face="bold">please add link</font>)>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Int32, RichEditorDeleteDirection, Int32, ArrayList\<RichEditorSpanResult>)

```cangjie
public init(
    offset: Int32,
    direction: RichEditorDeleteDirection,
    length: Int32,
    richEditorDeleteSpans: ArrayList<RichEditorSpanResult>
)
```

**Function:** Creates an object of type RichEditorDeleteValue.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| offset | Int32 | Yes | - | Offset position of the content to be deleted. |
| direction | [RichEditorDeleteDirection](#enum-richeditordeletedirection) | Yes | - | Direction of the delete operation. |
| length | Int32 | Yes | - | Length of the content to be deleted. |
| richEditorDeleteSpans | ArrayList\<[RichEditorSpanResult](<font color="red" face="bold">please add link</font>)> | Yes | - | Specific information of the text or image Spans to be deleted. |### class RichEditorImageSpanResult

```cangjie
public class RichEditorImageSpanResult <: RichEditorSpanResult {
    public var spanPosition: RichEditorSpanPosition = RichEditorSpanPosition(0,(0, 0))
    public var valuePixelMap: Option<PixelMap>= None
    public var valueResourceStr: String = ""
    public var imageStyle: RichEditorImageSpanStyleResult = RichEditorImageSpanStyleResult()
    public var offsetInSpan:(Int32, Int32) =(0, 0)


    public init(
        spanPosition: RichEditorSpanPosition,
        valuePixelMap: Option<PixelMap>,
        valueResourceStr: String,
        imageStyle: RichEditorImageSpanStyleResult,
        offsetInSpan: (Int32, Int32)
    )
}
```

**Function:** Represents the type of image information returned by the backend.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [RichEditorSpanResult](<font color="red" face="bold">please add link</font>)

#### var imageStyle

```cangjie
public var imageStyle: RichEditorImageSpanStyleResult = RichEditorImageSpanStyleResult()
```

**Function:** Represents the image style.

**Type:** [RichEditorImageSpanStyleResult](#class-richeditorimagespanstyleresult)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var offsetInSpan

```cangjie
public var offsetInSpan:(Int32, Int32) =(0, 0)
```

**Function:** Represents the start and end positions of the image within the Span.

**Type:** (Int32,Int32)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var spanPosition

```cangjie
public var spanPosition: RichEditorSpanPosition = RichEditorSpanPosition(0,(0, 0))
```

**Function:** Represents the Span position.

**Type:** [RichEditorSpanPosition](#class-richeditorspanposition)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var valuePixelMap

```cangjie
public var valuePixelMap: Option<PixelMap>= None
```

**Function:** Represents the image content.

**Type:** Option\<[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)>

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var valueResourceStr

```cangjie
public var valueResourceStr: String = ""
```

**Function:** Represents the image resource ID.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(RichEditorSpanPosition, Option\<PixelMap>, String, RichEditorImageSpanStyleResult, (Int32,Int32))

```cangjie

public init(
    spanPosition: RichEditorSpanPosition,
    valuePixelMap: Option<PixelMap>,
    valueResourceStr: String,
    imageStyle: RichEditorImageSpanStyleResult,
    offsetInSpan: (Int32, Int32)
)
```

**Function:** Creates an object of type RichEditorImageSpanResult.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| spanPosition | [RichEditorSpanPosition](#class-richeditorspanposition) | Yes | - | Span position. |
| valuePixelMap | Option\<[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)> | Yes | - | Image content. |
| valueResourceStr | String | Yes | - | Image resource ID. |
| imageStyle | [RichEditorImageSpanStyleResult](#class-richeditorimagespanstyleresult) | Yes | - | Image style. |
| offsetInSpan | (Int32,Int32) | Yes | - | Start and end positions of the image within the Span. |

### class RichEditorImageSpanStyleResult

```cangjie
public class RichEditorImageSpanStyleResult {
    public var size:(Float64, Float64) =(0.0, 0.0)
    public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.CENTER
    public var objectFit: ImageFit = ImageFit.Auto
    public var layoutStyle: RichEditorLayoutStyle = RichEditorLayoutStyle()
}
```

**Function:** Represents the image style information returned by the backend.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var layoutStyle

```cangjie
public var layoutStyle: RichEditorLayoutStyle = RichEditorLayoutStyle()
```

**Function:** Represents the image layout style.

**Type:** [RichEditorLayoutStyle](#var-layoutStyle)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var objectFit

```cangjie
public var objectFit: ImageFit = ImageFit.Auto
```

**Function:** Represents the image scaling type.

**Type:** [ImageFit](./cj-common-types.md#enum-imagefit)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var size

```cangjie
public var size:(Float64, Float64) =(0.0, 0.0)
```

**Function:** Represents the width and height of the image.

**Type:** (Float64,Float64)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var verticalAlign

```cangjie
public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.CENTER
```

**Function:** Represents the vertical alignment of the image.

**Type:** [ImageSpanAlignment](cj-common-types.md#enum-imagespanalignment)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### class RichEditorInsertValue

```cangjie
public class RichEditorInsertValue {
    public var insertOffset: Int32
    public var insertValue: String


    public init(
        insertOffset: Int32,
        insertValue: String
    )
}
```

**Function:** Represents the inserted text information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var insertOffset

```cangjie
public var insertOffset: Int32
```

**Function:** Represents the offset position of the inserted text.

**Type:** Int32

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var insertValue

```cangjie
public var insertValue: String
```

**Function:** Represents the content of the inserted text.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Int32, String)

```cangjie

public init(
    insertOffset: Int32,
    insertValue: String
)
```

**Function:** Creates an object of type RichEditorInsertValue.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| insertOffset | Int32 | Yes | - | Offset position of the inserted text. |
| insertValue | String | Yes | - | Content of the inserted text. |

### class RichEditorSelection

```cangjie
public class RichEditorSelection {
    public var selection:(Int32, Int32)
    public var spans: ArrayList<RichEditorSpanResult>


    public init(selection: (Int32, Int32), spans: ArrayList<RichEditorSpanResult>)
}
```

**Function:** Represents the selected content information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var selection

```cangjie
public var selection:(Int32, Int32)
```

**Function:** Represents the selection range.

**Type:** (Int32,Int32)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var spans

```cangjie
public var spans: ArrayList<RichEditorSpanResult>
```

**Function:** Represents the Span information.

**Type:** ArrayList\<[RichEditorSpanResult](<font color="red" face="bold">please add link</font>)>

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init((Int32,Int32), ArrayList\<RichEditorSpanResult>)

```cangjie

public init(selection: (Int32, Int32), spans: ArrayList<RichEditorSpanResult>)
```

**Function:** Creates an object of type RichEditorSelection.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| selection | (Int32,Int32) | Yes | - | Selection range. |
| spans | ArrayList\<[RichEditorSpanResult](<font color="red" face="bold">please add link</font>)> | Yes | - | Span information. |

### class RichEditorSpanPosition

```cangjie
public class RichEditorSpanPosition {
    public var spanIndex: Int32
    public var spanRange:(Int32, Int32)


    public init(
        spanIndex: Int32,
        spanRange: (Int32, Int32)
    )
}
```

**Function:** Represents the Span position information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var spanIndex

```cangjie
public var spanIndex: Int32
```

**Function:** Represents the Span index value.

**Type:** Int32

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var spanRange

```cangjie
public var spanRange:(Int32, Int32)
```

**Function:** Represents the start and end positions of the Span content within the RichEditor.

**Type:** (Int32,Int32)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Int32, (Int32,Int32))

```cangjie

public init(
    spanIndex: Int32,
    spanRange: (Int32, Int32)
)
```

**Function:** Creates an object of type RichEditorSpanPosition.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| spanIndex | Int32 | Yes | - | Span index value. |
| spanRange | (Int32,Int32) | Yes | - | Start and end positions of the Span content within the RichEditor. |### class RichEditorTextSpanResult

```cangjie
public class RichEditorTextSpanResult <: RichEditorSpanResult {
    public var spanPosition: RichEditorSpanPosition
    public var value: String
    public var textStyle: RichEditorTextStyleResult
    public var offsetInSpan:(Int32, Int32)


    public init(
        spanPosition: RichEditorSpanPosition,
        value: String,
        textStyle: RichEditorTextStyleResult,
        offsetInSpan: (Int32, Int32)
    )
}
```

**Function:** Backend-returned text style information type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [RichEditorSpanResult](<font color="red" face="bold">please add link</font>)

#### var offsetInSpan

```cangjie
public var offsetInSpan:(Int32, Int32)
```

**Function:** Indicates the start and end positions of valid content within the text span.

**Type:** (Int32,Int32)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var spanPosition

```cangjie
public var spanPosition: RichEditorSpanPosition
```

**Function:** Indicates the span position.

**Type:** [RichEditorSpanPosition](#class-richeditorspanposition)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var textStyle

```cangjie
public var textStyle: RichEditorTextStyleResult
```

**Function:** Indicates the text span style information.

**Type:** [RichEditorTextStyleResult](#class-richeditortextstyleresult)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var value

```cangjie
public var value: String
```

**Function:** Indicates the text span content.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(RichEditorSpanPosition, String, RichEditorTextStyleResult, (Int32,Int32))

```cangjie

public init(
    spanPosition: RichEditorSpanPosition,
    value: String,
    textStyle: RichEditorTextStyleResult,
    offsetInSpan: (Int32, Int32)
)
```

**Function:** Creates a RichEditorTextSpanResult.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|spanPosition|[RichEditorSpanPosition](#class-richeditorspanposition)|Yes|-|Span position.|
|value|String|Yes|-|Text span content.|
|textStyle|[RichEditorTextStyleResult](#class-richeditortextstyleresult)|Yes|-|Text span style information.|
|offsetInSpan|(Int32,Int32)|Yes|-|Start and end positions of valid content within the text span.|

### class RichEditorTextStyleResult

```cangjie
public class RichEditorTextStyleResult {
    public var fontColor: String
    public var fontSize: Float64
    public var fontStyle: FontStyle
    public var fontWeight: Int32
    public var fontFamily: String
    public var decoration: DecorationStyleResult


    public init(
        fontColor: String,
        fontSize: Float64,
        fontStyle: FontStyle,
        fontWeight: Int32,
        fontFamily: String,
        decoration: DecorationStyleResult
    )
}
```

**Function:** Backend-returned text style information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var decoration

```cangjie
public var decoration: DecorationStyleResult
```

**Function:** Indicates the text decoration line style and its color.

**Type:** [DecorationStyleResult](#class-decorationstyleresult)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var fontColor

```cangjie
public var fontColor: String
```

**Function:** Indicates the text color.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var fontFamily

```cangjie
public var fontFamily: String
```

**Function:** Indicates the font list.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var fontSize

```cangjie
public var fontSize: Float64
```

**Function:** Indicates the font size.

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var fontStyle

```cangjie
public var fontStyle: FontStyle
```

**Function:** Indicates the font style.

**Type:** [FontStyle](./cj-common-types.md#enum-fontstyle)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var fontWeight

```cangjie
public var fontWeight: Int32
```

**Function:** Indicates the font weight.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(String, Float64, FontStyle, Int32, String, DecorationStyleResult)

```cangjie

public init(
    fontColor: String,
    fontSize: Float64,
    fontStyle: FontStyle,
    fontWeight: Int32,
    fontFamily: String,
    decoration: DecorationStyleResult
)
```

**Function:** Creates a RichEditorTextStyleResult.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|fontColor|String|Yes|-|Text color.|
|fontSize|Float64|Yes|-|Font size.|
|fontStyle|[FontStyle](./cj-common-types.md#enum-fontstyle)|Yes|-|Font style.|
|fontWeight|Int32|Yes|-|Font weight.|
|fontFamily|String|Yes|-|Font list.|
|decoration|[DecorationStyleResult](#class-decorationstyleresult)|Yes|-|Text decoration line style and its color.|

### class ShadowOptionsResult

```cangjie
public class ShadowOptionsResult {}
```

**Function:** Text shadow effect.

#### let color

```cangjie
public let color: String
```

**Function:** Indicates the shadow color.

**Type:** String

**Access:** Read-only

#### let offsetX

```cangjie
public let offsetX: Float64
```

**Function:** Indicates the X-axis offset of the shadow.

**Type:** Float64

**Access:** Read-only

#### let offsetY

```cangjie
public let offsetY: Float64
```

**Function:** Indicates the Y-axis offset of the shadow.

**Type:** Float64

**Access:** Read-only

#### let radius

```cangjie
public let radius: Float64
```

**Function:** Indicates the shadow blur radius.

**Type:** Float64

**Access:** Read-only

### class TextRange

```cangjie
public class TextRange {
    public var start: Int32
    public var end: Int32


    public init(start: Int32, end: Int32)
}
```

**Function:** Text range.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var end

```cangjie
public var end: Int32
```

**Function:** Indicates the end index.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var start

```cangjie
public var start: Int32
```

**Function:** Indicates the start index.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Int32, Int32)

```cangjie

public init(start: Int32, end: Int32)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|start|Int32|Yes|-|Start index.|
|end|Int32|Yes|-|End index.|

### enum RichEditorDeleteDirection

```cangjie
public enum RichEditorDeleteDirection <: Equatable<RichEditorDeleteDirection> {
    | BACKWARD
    | FORWARD
    | ...
}
```

**Function:** Indicates the direction of delete operations.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<RichEditorDeleteDirection>

#### BACKWARD

```cangjie
BACKWARD
```

**Function:** Indicates backward deletion.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### FORWARD

```cangjie
FORWARD
```

**Function:** Indicates forward deletion.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(RichEditorDeleteDirection)

```cangjie
public operator func !=(other: RichEditorDeleteDirection): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[RichEditorDeleteDirection](#enum-richeditordeletedirection)|Yes|-|Another enum value.|

**Returns:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

#### func ==(RichEditorDeleteDirection)

```cangjie
public operator func ==(other: RichEditorDeleteDirection): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[RichEditorDeleteDirection](#enum-richeditordeletedirection)|Yes|-|Another enum value.|

**Returns:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### enum RichEditorSpanType

```cangjie
public enum RichEditorSpanType <: Equatable<RichEditorSpanType> {
    | TEXT
    | IMAGE
    | MIXED
    | ...
}
```

**Function:** Indicates span type information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<RichEditorSpanType>

#### IMAGE

```cangjie
IMAGE
```

**Function:** Indicates the span is of image type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### MIXED

```cangjie
MIXED
```

**Function:** Indicates the span is of mixed text-image type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### TEXT

```cangjie
TEXT
```

**Function:** Indicates the span is of text type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(RichEditorSpanType)

```cangjie
public operator func !=(other: RichEditorSpanType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[RichEditorSpanType](#enum-richeditorspantype)|Yes|-|Another enum value.|

**Returns:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

#### func ==(RichEditorSpanType)

```cangjie
public operator func ==(other: RichEditorSpanType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[RichEditorSpanType](#enum-richeditorspantype)|Yes|-|Another enum value.|

**Returns:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

#### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the enum value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Returns:**

|Type|Description|
|:----|:----|
|Int32|The enum value.|

### enum SpanType

```cangjie
public enum SpanType <: Equatable<SpanType> {
    | TEXT
    | IMAGE
    | ...
}
```

**Function:** Indicates the type of span type information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<SpanType>

#### IMAGE

```cangjie
IMAGE
```

**Function:** Indicates the span is of image type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### TEXT

```cangjie
TEXT
```

**Function:** Indicates the span is of text type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(SpanType)

```cangjie
public operator func !=(other: SpanType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SpanType](#enum-spantype)|Yes|-|Another enum value.|

**Returns:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

#### func ==(SpanType)

```cangjie
public operator func ==(other: SpanType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[SpanType](#enum-spantype)|Yes|-|Another enum value.|

**Returns:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|## Sample Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    let controller = RichEditorController()

    @State var position: Int64 = 0

    @Builder
    func builder(){
        Column {
            ForEach(["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"], itemGeneratorFunc: {item: String, idx: Int64 =>
                Button(item)
                .width(40.vp)
                .height(40.vp)
                .fontColor(0x66000000)
                .fontSize(16.fp)
            })
        }
        .borderRadius(24.vp)
        .padding(top: 4.vp, bottom: 4.vp, left: 16.vp, right: 16.vp)
        .backgroundColor(Color.Green)
        .margin(right: 24.vp, bottom: 4.vp, top: 0.vp)
        .width(130.vp)
    }

    func build() {
        Column(30) {
            Row {
                Button("getCaretOffset")
                .onClick {
                    evt =>
                    Hilog.info(0, "AppLogCj", controller.getCaretOffset().toString())
                    this.position = controller.getCaretOffset()
                }.width(400.px).height(150.px)

                Text("position: ${this.position.toString()}")
            }

            Row {
                Button("setCaretOffset 0")
                .onClick {
                    evt =>
                    controller.setCaretOffset(0)
                }.width(400.px).height(150.px)

                Text("position: ${this.position.toString()}")
            }

            Row {
                Button("addText Hello")
                .onClick {
                    evt =>
                    controller.addTextSpan(
                        value: "Hello",
                        options: RichEditorTextSpanOptions(
                            style: RichEditorTextStyle(
                                fontColor: Color(0XFF1298),
                                fontSize: 20.fp,
                                fontStyle: FontStyle.Italic,
                                decoration: TextDecoration(
                                    `type`: TextDecorationType.Overline,
                                    color: Color(0X12FF98)
                                ),
                            )
                        )
                    )
                }.width(400.px).height(150.px)

                Button("addImage")
                .onClick {
                    evt =>
                    controller.addImageSpan(
                        value: @r(app.media.startIcon),
                        options: RichEditorImageSpanOptions(
                            imageStyle: RichEditorImageSpanStyle(
                                size: (24.vp, 24.vp)
                            )
                        )
                    )
                }.width(400.px).height(150.px)
            }

            Row {
                Button("getSpans")
                .onClick {
                     evt =>
                    let array = controller.getSpans(start: 0, end: 10)
                    for(i in 0..array.size) {
                        match(array[i].spanType) {
                            case TEXT =>
                                let textResult = array[i].textResult.getOrThrow()
                                Hilog.info(0, "AppLogCj", "RichEditor textResult. value: ${textResult.value}")
                            case IMAGE =>
                                let imageResult = array[i].imageResult.getOrThrow()
                                Hilog.info(0, "AppLogCj", "RichEditor ImageResult. size: ${imageResult.size[0].toString()} - ${imageResult.size[1].toString()}")
                            case _ => return
                        }
                    }
                }.width(400.px).height(150.px)
            }

            Row {
                Button("updateParagraphStyle")
                .onClick {
                    evt =>
                    let array = controller.updateParagraphStyle(
                        start: 0,
                        end: 100,
                        style: RichEditorParagraphStyle(
                            textAlign: TextAlign.Center,
                            leadingMargin: 24.px
                        )
                    )
                }.width(400.px).height(150.px)
            }

            RichEditor(controller)
            .customKeyboard(builder: bind(builder, this))
            .bindSelectionMenu(
                spantype: RichEditorSpanType.TEXT,
                content: bind(builder, this),
                responseType: ResponseType.LongPress,
                options: SelectionMenuOptions(onAppear: { => Hilog.info(0, "AppLogCj", "SelectionMenuOptions onAppear")}, onDisappear: { => Hilog.info(0, "AppLogCj", "SelectionMenuOptions onDisappear")})
            )
            .copyOptions(CopyOptions.None)
            .onReady({ => Hilog.info(0, "AppLogCj", "RichEditor onReady!!")})
            .onDeleteComplete({ => Hilog.info(0, "AppLogCj", "RichEditor onDeleteComplete!!")})
            .onSelect({ value =>
                Hilog.info(0, "AppLogCj", "RichEditor onSelect. ${value.selection[0]} ~ ${value.selection[1]}")
            })
        }
    }
}
```

![richeditor](figures/richeditor.gif)