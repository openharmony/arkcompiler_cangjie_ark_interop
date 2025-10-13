# RichEditor

支持图文混排和文本交互式编辑的组件。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(RichEditorController)

```cangjie

public init(controller: RichEditorController)
```

**功能：** 创建RichEditor组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|controller|[RichEditorController](#class-richeditorcontroller)|是|-|富文本控制器。|

## 通用属性/通用事件

通用属性：全部支持。

> **说明：**
>
> - align属性只支持上方、中间和下方位置的对齐方式。
> - 不支持borderImage属性。

通用事件：全部支持。

## 组件属性

### func aboutToDelete(Callback\<RichEditorDeleteValue,Bool>)

```cangjie

public func aboutToDelete(callback: Callback<RichEditorDeleteValue, Bool>): This
```

**功能：** 输入法删除内容前，触发事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorDeleteValue](#class-richeditordeletevalue),Bool>|是|-|回调函数，输入法删除内容前触发该回调 。<br>[RichEditorDeleteValue](#class-richeditordeletevalue)：准备删除的内容所在的文本Span信息。<br>true：组件执行删除操作。<br>false：组件不执行删除操作。|

### func aboutToIMEInput(Callback\<RichEditorInsertValue,Bool>)

```cangjie

public func aboutToIMEInput(callback: Callback<RichEditorInsertValue, Bool>): This
```

**功能：** 输入法输入内容前，触发事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorInsertValue](#class-richeditorinsertvalue),Bool>|是|-|回调函数，输入法输入内容前触发。<br>[RichEditorInsertValue](#class-richeditorinsertvalue)：输入法将要输入内容信息。<br>true：组件执行添加内容操作。<br>false：组件不执行添加内容操作。|

### func bindSelectionMenu(RichEditorSpanType, CustomBuilder, ResponseType, SelectionMenuOptions)

```cangjie

public func bindSelectionMenu(
    spantype!: RichEditorSpanType = RichEditorSpanType.Text,
    content!: CustomBuilder,
    responseType!: ResponseType = ResponseType.LongPress,
    options!: SelectionMenuOptions
): This
```

**功能：** 设置自定义选择菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|spantype|[RichEditorSpanType](#enum-richeditorspantype)|否|RichEditorSpanType.Text| **命名参数。** 指定选择菜单的类型。|
|content|[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-| **命名参数。** 指定选择菜单的内容。使用时结合[@Builder](../../../application-dev/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|
|responseType|[ResponseType](./cj-common-types.md#enum-responsetype)|否|ResponseType.LongPress| **命名参数。** 指定选择菜单的响应类型。|
|options|[SelectionMenuOptions](#class-selectionmenuoptions)|是|-| **命名参数。** 指定选择菜单的选项。|

### func copyOptions(CopyOptions)

```cangjie

public func copyOptions(value: CopyOptions): This
```

**功能：** 设置文本内容支持复制粘贴的能力。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[CopyOptions](./cj-common-types.md#enum-copyoptions)|是|-|复制粘贴的能力。<br>初始值：CopyOptions.LocalDevice。|

### func customKeyboard(CustomBuilder)

```cangjie

public func customKeyboard(value!: CustomBuilder): This
```

**功能：** 定义自定义键盘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-| **命名参数。** 富文本编辑器的自定义键盘。使用时结合[@Builder](../../../application-dev/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|

## 组件事件

### func onDeleteComplete(VoidCallback)

```cangjie

public func onDeleteComplete(callback: VoidCallback): This
```

**功能：** 输入法完成删除后，触发事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[VoidCallback](../BasicServicesKit/cj-apis-base.md#type-VoidCallback)|是|-|回调函数，订阅输入法完成删除时触发。|

### func onDidChange(OnDidChangeCallback)

```cangjie

public func onDidChange(callback: OnDidChangeCallback): This
```

**功能：** 组件执行增删操作后，触发事件。文本实际未发生增删时，不触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[OnDidChangeCallback](#type-ondidchangecallback)|是|-|回调函数，件执行增删操作后，触发回调。文本实际未发生增删时，不触发该回调。参数：图文变化前后的内容范围。|

### func onIMEInputComplete(Callback\<RichEditorTextSpanResult,Unit>)

```cangjie

public func onIMEInputComplete(callback: Callback<RichEditorTextSpanResult, Unit>): RichEditor
```

**功能：** 输入法完成输入后，触发事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorTextSpanResult](#class-richeditortextspanresult),Unit>|是|-|回调函数，输入法完成输入后触发回调。<br>RichEditorTextSpanResult：输入法完成输入后的文本Span信息。|

**返回值：**

|类型|说明|
|:----|:----|
|[RichEditor](#richeditor)|RichEditor实例。|

### func onPaste(PasteEventCallback)

```cangjie

public func onPaste(callback: PasteEventCallback): This
```

**功能：** 完成粘贴前，触发事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|PasteEventCallback|是|-|回调函数，完成粘贴前，触发回调。<br>PasteEvent：定义用户粘贴事件。|

### func onReady(VoidCallback)

```cangjie

public func onReady(callback: VoidCallback): This
```

**功能：** 富文本组件初始化完成后，触发事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[VoidCallback](../BasicServicesKit/cj-apis-base.md#type-VoidCallback)|是|-|回调函数，富文本组件初始化完成后触发回调。|

### func onSelect(Callback\<RichEditorSelection,Unit>)

```cangjie

public func onSelect(callback: Callback<RichEditorSelection, Unit>): This
```

**功能：** 鼠标左键双击选中内容时，会触发事件；松开鼠标左键后，会再次触发事件。手指长按选中内容时，会触发事件；松开手指后，会再次触发事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-callback)\<[RichEditorSelection](#class-richeditorselection),Unit>|是|-|回调函数，鼠标左键按下选择，松开左键后触发回调。<br>用手指选择时，松开手指触发回调。<br>RichEditorSelection：选中的所有Span信息。|

## 基础类型定义

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

**功能：** 后端返回的文本装饰线样式信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var color

```cangjie
public var color: ResourceColor
```

**功能：** 装饰线颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var decorationType

```cangjie
public var decorationType: TextDecorationType
```

**功能：** 装饰线类型。

**类型：** [TextDecorationType](./cj-common-types.md#enum-textdecorationtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(TextDecorationType, ResourceColor)

```cangjie

public init(
    decorationType: TextDecorationType,
    color: ResourceColor
)
```

**功能：** 创建文本装饰线样式对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|decorationType|[TextDecorationType](./cj-common-types.md#enum-textdecorationtype)|是|-|装饰线类型。|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|设置文本识别成功后的实体颜色。<br>默认值：'#ff0a59f7'<br>元服务API： 从API version 12开始，该接口支持在元服务中使用。|

### class PasteEvent

```cangjie
public class PasteEvent {}
```

**功能：** 定义用户粘贴事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func preventDefault()

```cangjie

public func preventDefault(): Unit
```

**功能：** 阻止系统默认粘贴事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 删除操作的信息和被删除内容的信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var direction

```cangjie
public var direction: RichEditorDeleteDirection
```

**功能：** 表示删除操作的方向。

**类型：** [RichEditorDeleteDirection](#enum-richeditordeletedirection)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var length

```cangjie
public var length: Int32
```

**功能：** 表示删除内容长度。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offset

```cangjie
public var offset: Int32
```

**功能：** 表示删除内容的偏移位置。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var richEditorDeleteSpans

```cangjie
public var richEditorDeleteSpans: ArrayList<RichEditorSpanResult>
```

**功能：** 表示删除的文本或者图片Span的具体信息。

**类型：** ArrayList\<RichEditorSpanResult

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Int32, RichEditorDeleteDirection, Int32, ArrayList\<RichEditorSpanResult>)

```cangjie

public init(
    offset: Int32,
    direction: RichEditorDeleteDirection,
    length: Int32,
    richEditorDeleteSpans: ArrayList<RichEditorSpanResult>
)
```

**功能：** 创建RichEditorDeleteValue类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offset|Int32|是|-|删除内容的偏移位置。|
|direction|[RichEditorDeleteDirection](#enum-richeditordeletedirection)|是|-|删除操作的方向。|
|length|Int32|是|-|删除内容长度。|
|richEditorDeleteSpans|ArrayList\<RichEditorSpanResult>|是|-|删除的文本或者图片Span的具体信息。|

### class RichEditorImageSpanResult

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

**功能：** 表示后端返回的图片信息的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- RichEditorSpanResult

#### var imageStyle

```cangjie
public var imageStyle: RichEditorImageSpanStyleResult = RichEditorImageSpanStyleResult()
```

**功能：** 表示图片样式。

**类型：** [RichEditorImageSpanStyleResult](#class-richeditorimagespanstyleresult)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offsetInSpan

```cangjie
public var offsetInSpan:(Int32, Int32) =(0, 0)
```

**功能：** 表示Span里图片的起始和结束位置。

**类型：** (Int32,Int32)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var spanPosition

```cangjie
public var spanPosition: RichEditorSpanPosition = RichEditorSpanPosition(0,(0, 0))
```

**功能：** 表示Span位置。

**类型：** [RichEditorSpanPosition](#class-richeditorspanposition)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var valuePixelMap

```cangjie
public var valuePixelMap: Option<PixelMap>= None
```

**功能：** 表示图片内容。

**类型：** Option\<[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var valueResourceStr

```cangjie
public var valueResourceStr: String = ""
```

**功能：** 表示图片资源id。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 创建RichEditorImageSpanResult类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|spanPosition|[RichEditorSpanPosition](#class-richeditorspanposition)|是|-|Span位置。|
|valuePixelMap|Option\<[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)>|是|-|图片内容。|
|valueResourceStr|String|是|-|图片资源id。|
|imageStyle|[RichEditorImageSpanStyleResult](#class-richeditorimagespanstyleresult)|是|-|图片样式。|
|offsetInSpan|(Int32,Int32)|是|-|Span里图片的起始和结束位置。|

### class RichEditorImageSpanStyleResult

```cangjie
public class RichEditorImageSpanStyleResult {
    public var size:(Float64, Float64) =(0.0, 0.0)
    public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.Center
    public var objectFit: ImageFit = ImageFit.Auto
    public var layoutStyle: RichEditorLayoutStyle = RichEditorLayoutStyle()
}
```

**功能：** 后端返回的图片样式信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var layoutStyle

```cangjie
public var layoutStyle: RichEditorLayoutStyle = RichEditorLayoutStyle()
```

**功能：** 表示图片布局风格。

**类型：** [RichEditorLayoutStyle](#class-richeditorlayoutstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var objectFit

```cangjie
public var objectFit: ImageFit = ImageFit.Auto
```

**功能：** 表示图片缩放类型。

**类型：** [ImageFit](./cj-common-types.md#enum-imagefit)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var size

```cangjie
public var size:(Float64, Float64) =(0.0, 0.0)
```

**功能：** 表示图片的宽度和高度。

**类型：** (Float64,Float64)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var verticalAlign

```cangjie
public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.Center
```

**功能：** 表示图片垂直对齐方式。

**类型：** [ImageSpanAlignment](cj-common-types.md#enum-imagespanalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 插入文本信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var insertOffset

```cangjie
public var insertOffset: Int32
```

**功能：** 表示插入的文本偏移位置。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var insertValue

```cangjie
public var insertValue: String
```

**功能：** 表示插入的文本内容。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Int32, String)

```cangjie

public init(
    insertOffset: Int32,
    insertValue: String
)
```

**功能：** 创建RichEditorInsertValue类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|insertOffset|Int32|是|-|插入的文本偏移位置。|
|insertValue|String|是|-|插入的文本内容。|

### interface RichEditorSpanResult

```cangjie
public interface RichEditorSpanResult {}
```

**功能：** 支持图文混排和文本交互式编辑的组件结果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

### class RichEditorSelection

```cangjie
public class RichEditorSelection {
    public var selection:(Int32, Int32)
    public var spans: ArrayList<RichEditorSpanResult>

    public init(selection: (Int32, Int32), spans: ArrayList<RichEditorSpanResult>)
}
```

**功能：** 选中内容信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var selection

```cangjie
public var selection:(Int32, Int32)
```

**功能：** 表示选中范围。

**类型：** (Int32,Int32)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var spans

```cangjie
public var spans: ArrayList<RichEditorSpanResult>
```

**功能：** 表示Span信息。

**类型：** ArrayList\<RichEditorSpanResult>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init((Int32,Int32), ArrayList\<RichEditorSpanResult>)

```cangjie

public init(selection: (Int32, Int32), spans: ArrayList<RichEditorSpanResult>)
```

**功能：** 创建RichEditorSelection类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|selection|(Int32,Int32)|是|-|选中范围。|
|spans|ArrayList\<RichEditorSpanResult>|是|-|Span信息。|

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

**功能：** Span位置信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var spanIndex

```cangjie
public var spanIndex: Int32
```

**功能：** 表示Span索引值。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var spanRange

```cangjie
public var spanRange:(Int32, Int32)
```

**功能：** 表示Span内容在RichEditor内的起始和结束位置。

**类型：** (Int32,Int32)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Int32, (Int32,Int32))

```cangjie

public init(
    spanIndex: Int32,
    spanRange: (Int32, Int32)
)
```

**功能：** 创建RichEditorSpanPosition类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|spanIndex|Int32|是|-|Span索引值。|
|spanRange|(Int32,Int32)|是|-|Span内容在RichEditor内的起始和结束位置。|

### class RichEditorTextSpanResult

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

**功能：** 后端返回的文本样式信息类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- RichEditorSpanResult

#### var offsetInSpan

```cangjie
public var offsetInSpan:(Int32, Int32)
```

**功能：** 表示文本Span内容里有效内容的起始和结束位置。

**类型：** (Int32,Int32)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var spanPosition

```cangjie
public var spanPosition: RichEditorSpanPosition
```

**功能：** 表示Span位置。

**类型：** [RichEditorSpanPosition](#class-richeditorspanposition)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var textStyle

```cangjie
public var textStyle: RichEditorTextStyleResult
```

**功能：** 表示文本Span样式信息。

**类型：** [RichEditorTextStyleResult](#class-richeditortextstyleresult)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var value

```cangjie
public var value: String
```

**功能：** 表示文本Span内容。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(RichEditorSpanPosition, String, RichEditorTextStyleResult, (Int32,Int32))

```cangjie

public init(
    spanPosition: RichEditorSpanPosition,
    value: String,
    textStyle: RichEditorTextStyleResult,
    offsetInSpan: (Int32, Int32)
)
```

**功能：** 创建RichEditorTextSpanResult。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|spanPosition|[RichEditorSpanPosition](#class-richeditorspanposition)|是|-|Span位置。|
|value|String|是|-|文本Span内容。|
|textStyle|[RichEditorTextStyleResult](#class-richeditortextstyleresult)|是|-|文本Span样式信息。|
|offsetInSpan|(Int32,Int32)|是|-|文本Span内容里有效内容的起始和结束位置。|

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

**功能：** 后端返回的文本样式信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var decoration

```cangjie
public var decoration: DecorationStyleResult
```

**功能：** 表示文本装饰线样式及其颜色。

**类型：** [DecorationStyleResult](#class-decorationstyleresult)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontColor

```cangjie
public var fontColor: String
```

**功能：** 表示文本颜色。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontFamily

```cangjie
public var fontFamily: String
```

**功能：** 表示字体列表。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontSize

```cangjie
public var fontSize: Float64
```

**功能：** 表示字体大小。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontStyle

```cangjie
public var fontStyle: FontStyle
```

**功能：** 表示字体样式。

**类型：** [FontStyle](./cj-common-types.md#enum-fontstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontWeight

```cangjie
public var fontWeight: Int32
```

**功能：** 表示字体粗细。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

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

**功能：** 创建RichEditorTextStyleResult。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fontColor|String|是|-|文本颜色。|
|fontSize|Float64|是|-|字体大小。|
|fontStyle|[FontStyle](./cj-common-types.md#enum-fontstyle)|是|-|字体样式。|
|fontWeight|Int32|是|-|字体粗细。|
|fontFamily|String|是|-|字体列表。|
|decoration|[DecorationStyleResult](#class-decorationstyleresult)|是|-|文本装饰线样式及其颜色。|

### class ShadowOptionsResult

```cangjie
public class ShadowOptionsResult {}
```

**功能：** 文字阴影效果。

#### let color

```cangjie
public let color: String
```

**功能：** 表示阴影的颜色。

**类型：** String

**读写能力：** 只读

#### let offsetX

```cangjie
public let offsetX: Float64
```

**功能：** 表示阴影的X轴偏移量。

**类型：** Float64

**读写能力：** 只读

#### let offsetY

```cangjie
public let offsetY: Float64
```

**功能：** 表示阴影的Y轴偏移量。

**类型：** Float64

**读写能力：** 只读

#### let radius

```cangjie
public let radius: Float64
```

**功能：** 表示阴影模糊半径。

**类型：** Float64

**读写能力：** 只读

### class TextRange

```cangjie
public class TextRange {
    public var start: Int32
    public var end: Int32

    public init(start: Int32, end: Int32)
}
```

**功能：** 文本范围。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var end

```cangjie
public var end: Int32
```

**功能：** 表示结束索引。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var start

```cangjie
public var start: Int32
```

**功能：** 表示起始索引。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Int32, Int32)

```cangjie

public init(start: Int32, end: Int32)
```

**功能：** 创建文本范围对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|start|Int32|是|-|起始索引。|
|end|Int32|是|-|结束索引。|

### class LeadingMarginPlaceholder

```cangjie
public class LeadingMarginPlaceholder {
    public var pixelMap: PixelMap
    public var size:(Length, Length)
    public init(pixelMap!: PixelMap, size!: (Length, Length))
}
```

**功能：** 前导边距占位符，用于表示文本段落左侧与组件边缘之间的距离。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var pixelMap

```cangjie
public var pixelMap: PixelMap
```

**功能：** 图片内容。

**类型：** [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var size

```cangjie
public var size:(Length, Length)
```

**功能：** 图片大小，不支持设置百分比。

**类型：** ([Length](../BasicServicesKit/cj-apis-base.md#interface-length), [Length](../BasicServicesKit/cj-apis-base.md#interface-length))

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(PixelMap, (Length,Length))

```cangjie
public init(pixelMap!: PixelMap, size!: (Length, Length))
```

**功能：** 创建LeadingMarginPlaceholder类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pixelMap|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|是|-|图片内容。|
|size|([Length](../BasicServicesKit/cj-apis-base.md#interface-length),[Length](../BasicServicesKit/cj-apis-base.md#interface-length))|是|-|图片大小，不支持设置百分比。|

### class RichEditorBaseController

```cangjie
public open class RichEditorBaseController {}
```

**功能：** RichEditor组件的控制器基类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func getCaretOffset()

```cangjie
public func getCaretOffset(): Int64
```

**功能：** 获取当前光标所在位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|当前光标所在位置。|

#### func setCaretOffset(Int64)

```cangjie
public func setCaretOffset(offset: Int64): Bool
```

**功能：** 设置光标位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offset|Int64|是|-|光标偏移位置。超出文本范围时，设置失败。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|光标是否设置成功。|

### class RichEditorController

```cangjie
public class RichEditorController <: RichEditorBaseController {
    public init()
}
```

**功能：** RichEditor组件的控制器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [RichEditorBaseController](#class-richeditorbasecontroller)

#### init()

```cangjie
public init()
```

**功能：** 创建RichEditorController类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func addImageSpan(String, RichEditorImageSpanOptions)

```cangjie
public func addImageSpan(value!: String, options!: RichEditorImageSpanOptions = RichEditorImageSpanOptions()): Int32
```

**功能：** 添加图片内容，如果组件光标闪烁，插入后光标位置更新为新插入图片的后面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|图片内容。|
|options|[RichEditorImageSpanOptions](#class-richeditorimagespanoptions)|否|RichEditorImageSpanOptions()|图片选项。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|添加完成的ImageSpan所在的位置。|

#### func addImageSpan(AppResource, RichEditorImageSpanOptions)

```cangjie
public func addImageSpan(value!: AppResource, options!: RichEditorImageSpanOptions = RichEditorImageSpanOptions()): Int32
```

**功能：** 添加图片内容，如果组件光标闪烁，插入后光标位置更新为新插入图片的后面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AppResource](../LocalizationKit/cj-apis-resource.md#class-appresource)|是|-|图片内容。|
|options|[RichEditorImageSpanOptions](#class-richeditorimagespanoptions)|否|RichEditorImageSpanOptions()|图片选项。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|添加完成的ImageSpan所在的位置。|

#### func addTextSpan(ResourceStr, RichEditorTextSpanOptions)

```cangjie
public func addTextSpan(value!: ResourceStr, options!: RichEditorTextSpanOptions = RichEditorTextSpanOptions()): Int32
```

**功能：** 添加文本内容，如果组件光标闪烁，插入后光标位置更新为新插入文本的后面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|文本内容。|
|options|[RichEditorTextSpanOptions](#class-richeditortextspanoptions)|否|RichEditorTextSpanOptions()|文本选项。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|添加完成的TextSpan所在的位置。|

#### func closeSelectionMenu()

```cangjie
public func closeSelectionMenu(): Unit
```

**功能：** 关闭自定义选择菜单或系统默认选择菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func deleteSpans(Int32, Int32)

```cangjie
public func deleteSpans(start!: Int32 = 0, end!: Int32 = Int32.Max): Unit
```

**功能：** 删除指定范围内的文本和图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|start|Int32|否|0|起始位置，省略或者设置负值时表示从0开始。|
|end|Int32|否|Int32.Max|结束位置，省略或者超出文本范围时表示到结尾。|

#### func getSpans(Int32, Int32)

```cangjie
public func getSpans(start!: Int32 = -1, end!: Int32 = -1): ArrayList<RichEditorSpanResult>
```

**功能：** 获取Span信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|start|Int32|否|-1|起始位置，省略或者设置负值时表示从0开始。|
|end|Int32|否|-1|结束位置，省略或者超出文本范围时表示无穷大。|

**返回值：**

|类型|说明|
|:----|:----|
|ArrayList\<[RichEditorSpanResult](#interface-richeditorspanresult)>|存储span信息类型的数组。|

#### func updateParagraphStyle(Int32, Int32, RichEditorParagraphStyle)

```cangjie
public func updateParagraphStyle(start!: Int32 = 0, end!: Int32 = -1, style!: RichEditorParagraphStyle): Unit
```

**功能：** 更新段落的样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|start|Int32|否|0|需要更新样式的文本起始位置，省略或者设置负值时表示从0开始。|
|end|Int32|否|-1|需要更新样式的文本结束位置，省略或者超出文本范围时表示无穷大。|
|style|[RichEditorParagraphStyle](#class-richeditorparagraphstyle)|是|-|段落样式。|

#### func updateSpanStyle(Int32, Int32, RichEditorTextStyle)

```cangjie
public func updateSpanStyle(start!: Int32 = 0, end!: Int32 = Int32.Max, textStyle!: RichEditorTextStyle): Unit
```

**功能：** 表示添加图片的偏移位置和图片样式信息的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|start|Int32|否|0|需要更新样式的文本起始位置，省略或者设置负值时表示从0开始。|
|end|Int32|否|Int32.Max|需要更新样式的文本结束位置，省略或者超出文本范围时表示无穷大。|
|textStyle|[RichEditorTextStyle](#class-richeditortextstyle)|是|-|文本样式。|

#### func updateSpanStyle(Int32, Int32, RichEditorImageSpanStyle)

```cangjie
public func updateSpanStyle(start!: Int32 = 0, end!: Int32 = Int32.Max, imageStyle!: RichEditorImageSpanStyle): Unit
```

**功能：** 更新文本、图片或SymbolSpan样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|start|Int32|否|0|需要更新样式的文本起始位置，省略或者设置负值时表示从0开始。|
|end|Int32|否|Int32.Max|需要更新样式的文本结束位置，省略或者超出文本范围时表示无穷大。|
|imageStyle|[RichEditorImageSpanStyle](#class-richeditorimagespanstyle)|是|-|图片样式。|

### class RichEditorImageSpanOptions

```cangjie
public class RichEditorImageSpanOptions {
    public var offset: Int32
    public var imageStyle: RichEditorImageSpanStyle
    public init(
        offset!: Int32 = Int32.Max,
        imageStyle!: RichEditorImageSpanStyle = RichEditorImageSpanStyle()
    )
}
```

**功能：** 表示添加图片的偏移位置和图片样式信息的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var imageStyle

```cangjie
public var imageStyle: RichEditorImageSpanStyle
```

**功能：** 表示图片样式信息的类型。省略时，使用系统默认图片信息。

**类型：** [RichEditorImageSpanStyle](#class-richeditorimagespanstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offset

```cangjie
public var offset: Int32
```

**功能：** 表示添加图片的位置。省略时，添加到所有文本字符串的最后。当值小于0时，放在字符串最前面；当值大于字符串长度时，放在字符串最后面。

**类型：** Int32

**读写能力：** 可读写

**系统能力:** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Int32, RichEditorImageSpanStyle)

```cangjie
public init(
    offset!: Int32 = Int32.Max,
    imageStyle!: RichEditorImageSpanStyle = RichEditorImageSpanStyle()
)
```

**功能：** 创建RichEditorImageSpanOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offset|Int32|否|Int32.Max|添加图片的位置。省略时，添加到所有文本字符串的最后。当值小于0时，放在字符串最前面；当值大于字符串长度时，放在字符串最后面。|
|imageStyle|[RichEditorImageSpanStyle](#class-richeditorimagespanstyle)|否|RichEditorImageSpanStyle()|图片样式信息。省略时，使用系统默认图片信息。|

### class RichEditorImageSpanStyle

```cangjie
public class RichEditorImageSpanStyle {
    public var size: Option <(Length, Length)>
    public var verticalAlign: ImageSpanAlignment
    public var objectFit: ImageFit
    public init(
        size!: (Length, Length),
        verticalAlign!: ImageSpanAlignment = ImageSpanAlignment.Baseline,
        objectFit!: ImageFit = ImageFit.Cover
    )
    public init(
        verticalAlign!: ImageSpanAlignment = ImageSpanAlignment.Baseline,
        objectFit!: ImageFit = ImageFit.Cover
    )
}
```

**功能：** 图片样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var objectFit

```cangjie
public var objectFit: ImageFit
```

**功能：** 图片缩放类型。

**类型：** [ImageFit](./cj-common-types.md#enum-imagefit)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var size

```cangjie
public var size: Option <(Length, Length)>
```

**功能：** 图片宽度和高度。

**类型：** Option\<([Length](../BasicServicesKit/cj-apis-base.md#interface-length),[Length](../BasicServicesKit/cj-apis-base.md#interface-length))>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var verticalAlign

```cangjie
public var verticalAlign: ImageSpanAlignment
```

**功能：** 图片垂直对齐方式。

**类型：** [ImageSpanAlignment](./cj-common-types.md#enum-imagespanalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init((Length,Length), ImageSpanAlignment, ImageFit)

```cangjie
public init(
    size!: (Length, Length),
    verticalAlign!: ImageSpanAlignment = ImageSpanAlignment.Baseline,
    objectFit!: ImageFit = ImageFit.Cover
)
```

**功能：** 创建RichEditorImageSpanStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|([Length](../BasicServicesKit/cj-apis-base.md#interface-length),[Length](../BasicServicesKit/cj-apis-base.md#interface-length))|是|-|图片宽度和高度。|
|verticalAlign|[ImageSpanAlignment](./cj-common-types.md#enum-imagespanalignment)|否|ImageSpanAlignment.Baseline|图片垂直对齐方式。|
|objectFit|[ImageFit](./cj-common-types.md#enum-imagefit)|否|ImageFit.Cover|图片缩放类型。|

#### init(ImageSpanAlignment, ImageFit)

```cangjie
public init(
    verticalAlign!: ImageSpanAlignment = ImageSpanAlignment.Baseline,
    objectFit!: ImageFit = ImageFit.Cover
)
```

**功能：** 创建RichEditorImageSpanStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|verticalAlign|[ImageSpanAlignment](./cj-common-types.md#enum-imagespanalignment)|否|ImageSpanAlignment.Baseline|图片垂直对齐方式。|
|objectFit|[ImageFit](./cj-common-types.md#enum-imagefit)|否|ImageFit.Cover|图片缩放类型。|

### class RichEditorLayoutStyle

```cangjie
public class RichEditorLayoutStyle {
    public var margin: Margin
    public var borderRadius: BorderRadiuses
    public init(margin!: Margin = Margin(), borderRadius!: BorderRadiuses = BorderRadiuses())
    public init(margin!: Length, borderRadius!: Length)
}
```

**功能：** 图片布局风格。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var borderRadius

```cangjie
public var borderRadius: BorderRadiuses
```

**功能：** 圆角类型，用于描述组件边框圆角半径。

**类型：** [BorderRadiuses](./cj-common-types.md#class-borderradiuses)

**读写能力：** 可读写

#### var margin

```cangjie
public var margin: Margin
```

**功能：** 外边距类型，用于描述组件不同方向的外边距。

**类型：** [Margin](./cj-common-types.md#class-margin)

**读写能力：** 可读写

#### init(Margin, BorderRadiuses)

```cangjie
public init(margin!: Margin = Margin(), borderRadius!: BorderRadiuses = BorderRadiuses())
```

**功能：** 创建RichEditorLayoutStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|margin|[Margin](./cj-common-types.md#class-margin)|否|Margin()|外边距类型。|
|borderRadius|[BorderRadiuses](./cj-common-types.md#class-borderradiuses)|否|BorderRadiuses()|圆角类型。|

#### init(Length, Length)

```cangjie
public init(margin!: Length, borderRadius!: Length)
```

**功能：** 创建RichEditorLayoutStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|margin|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|外边距值。|
|borderRadius|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|圆角半径值。|

### class RichEditorParagraphStyle

```cangjie
public class RichEditorParagraphStyle {
    public var textAlign: TextAlign
    public var leadingMargin: LeadingMarginType
    public init(textAlign!: TextAlign = TextAlign.Start)
    public init(textAlign!: TextAlign = TextAlign.Start, leadingMargin!: Length)
    public init(textAlign!: TextAlign = TextAlign.Start, leadingMargin!: LeadingMarginPlaceholder)
}
```

**功能：** 段落样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var leadingMargin

```cangjie
public var leadingMargin: LeadingMarginType
```

**功能：** 表示文本段落缩进。

**类型：** [LeadingMarginType](#enum-leadingmargintype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var textAlign

```cangjie
public var textAlign: TextAlign
```

**功能：** 表示文本段落在水平方向的对齐方式。

**类型:** [TextAlign](./cj-common-types.md#enum-textalign)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(TextAlign)

```cangjie
public init(textAlign!: TextAlign = TextAlign.Start)
```

**功能：** 创建RichEditorParagraphStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|textAlign|[TextAlign](./cj-common-types.md#enum-textalign)|否|TextAlign.Start|文本段落在水平方向的对齐方式。|

#### init(TextAlign, Length)

```cangjie
public init(textAlign!: TextAlign = TextAlign.Start, leadingMargin!: Length)
```

**功能：** 创建RichEditorParagraphStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|textAlign|[TextAlign](./cj-common-types.md#enum-textalign)|否|TextAlign.Start|文本段落在水平方向的对齐方式。|
|leadingMargin|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|文本段落缩进，不支持设置百分比。|

#### init(TextAlign, LeadingMarginPlaceholder)

```cangjie
public init(textAlign!: TextAlign = TextAlign.Start, leadingMargin!: LeadingMarginPlaceholder)
```

**功能：** 创建RichEditorParagraphStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|textAlign|[TextAlign](./cj-common-types.md#enum-textalign)|否|TextAlign.Start|文本段落在水平方向的对齐方式。|
|leadingMargin|[LeadingMarginPlaceholder](#class-leadingmarginplaceholder)|是|-|文本段落缩进，不支持设置百分比。|

### class RichEditorTextSpanOptions

```cangjie
public class RichEditorTextSpanOptions {
    public var offset: Int32
    public var style: RichEditorTextStyle
    public init(offset!: Int32 = Int32.Max, style!: RichEditorTextStyle = RichEditorTextStyle())
}
```

**功能：** 添加文本的偏移位置和文本样式信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offset

```cangjie
public var offset: Int32
```

**功能：** 表示添加文本的位置。省略时，添加到所有文本字符串的最后。当值小于0时，放在字符串最前面；当值大于字符串长度时，放在字符串最后面。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var style

```cangjie
public var style: RichEditorTextStyle
```

**功能：** 表示文本样式信息的类型。省略时，使用系统默认文本信息。

**类型：** [RichEditorTextStyle](#class-richeditortextstyle)

**读写能力:** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Int32, RichEditorTextStyle)

```cangjie
public init(offset!: Int32 = Int32.Max, style!: RichEditorTextStyle = RichEditorTextStyle())
```

**功能：** 创建RichEditorTextSpanOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offset|Int32|否|Int32.Max|添加文本的位置。省略时，添加到所有文本字符串的最后。当值小于0时，放在字符串最前面；当值大于字符串长度时，放在字符串最后面。|
|style|[RichEditorTextStyle](#class-richeditortextstyle)|否|RichEditorTextStyle()|文本样式信息。省略时，使用系统默认文本信息。|

### class RichEditorTextStyle

```cangjie
public class RichEditorTextStyle {
    public var fontColor: ResourceColor
    public var fontSize: Length
    public var fontStyle: FontStyle
    public var fontWeight: FontWeight
    public var fontFamily: ResourceStr
    public var decoration: TextDecorationOptions
    public init(
        fontColor!: ResourceColor = Color.Black,
        fontSize!: Length = 16.vp,
        fontStyle!: FontStyle = FontStyle.Normal,
        fontWeight!: FontWeight = FontWeight.Normal,
        fontFamily!: ResourceStr = DEFAULT_FONT,
        decoration!: TextDecorationOptions = TextDecorationOptions(decorationType: TextDecorationType.None, color: Color.Black)
    )
}
```

**功能：** 文本样式信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var decoration

```cangjie
public var decoration: TextDecorationOptions
```

**功能：** 文本装饰线样式及其颜色。

**类型：** [TextDecorationOptions](#class-textdecorationoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontColor

```cangjie
public var fontColor: ResourceColor
```

**功能：** 文本颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontFamily

```cangjie
public var fontFamily: ResourceStr
```

**功能：** 字体列表。

**类型：** [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontSize

```cangjie
public var fontSize: Length
```

**功能：** 字体大小，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontStyle

```cangjie
public var fontStyle: FontStyle
```

**功能：** 字体样式。

**类型：** [FontStyle](./cj-common-types.md#enum-fontstyle)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本:** 21

#### var fontWeight

```cangjie
public var fontWeight: FontWeight
```

**功能：** 字体粗细。

**类型：** [FontWeight](./cj-common-types.md#enum-fontweight)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(ResourceColor, Length, FontStyle, FontWeight, ResourceStr, TextDecorationOptions)

```cangjie
public init(
    fontColor!: ResourceColor = Color.Black,
    fontSize!: Length = 16.vp,
    fontStyle!: FontStyle = FontStyle.Normal,
    fontWeight!: FontWeight = FontWeight.Normal,
    fontFamily!: ResourceStr = DEFAULT_FONT,
    decoration!: TextDecorationOptions = TextDecorationOptions(decorationType: TextDecorationType.None, color: Color.Black)
)
```

**功能：** 创建RichEditorTextStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fontColor|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black|文本颜色。|
|fontSize|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|字体大小，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|fontStyle|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal|字体样式。|
|fontWeight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.Normal|字体粗细。|
|fontFamily|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|DEFAULT_FONT|字体列表。|
|decoration|[TextDecorationOptions](#class-textdecorationoptions)|否|TextDecorationOptions(decorationType: TextDecorationType.None, color: Color.Black)|文本装饰线样式及其颜色。|

### class SelectionMenuOptions

```cangjie
public class SelectionMenuOptions {
    public var onAppear: VoidCallback
    public var onDisappear: VoidCallback
    public init(onAppear!: () -> Unit = {=>}, onDisappear!: () -> Unit = {=>})
}
```

**功能：** 菜单选项类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onAppear

```cangjie
public var onAppear: VoidCallback
```

**功能：** 回调函数，自定义选择菜单弹出时触发回调函数。

**类型：** [VoidCallback](../BasicServicesKit/cj-apis-base.md#type-voidcallback)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var onDisappear

```cangjie
public var onDisappear: VoidCallback
```

**功能：** 回调函数，自定义选择菜单关闭时触发回调函数。

**类型：** [VoidCallback](../BasicServicesKit/cj-apis-base.md#type-voidcallback)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(() -> Unit, () -> Unit)

```cangjie
public init(onAppear!: () -> Unit = {=>}, onDisappear!: () -> Unit = {=>})
```

**功能：** 创建SelectionMenuOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|onAppear|()->Unit|否|{ => }|回调函数，自定义选择菜单弹出时触发回调函数。|
|onDisappear|()->Unit|否|{ => }|回调函数，自定义选择菜单关闭时触发回调函数。|

### class TextDecorationOptions

```cangjie
public class TextDecorationOptions {
    public var decorationType: TextDecorationType
    public var color: ResourceColor
    public init(decorationType!: TextDecorationType, color!: ResourceColor = Color.Black)
}
```

**功能：** 文本装饰线的配置项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var color

```cangjie
public var color: ResourceColor
```

**功能：**  设置文本装饰线颜色。

**类型：** [ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var decorationType

```cangjie
public var decorationType: TextDecorationType
```

**功能：**  设置文本装饰线类型。

**类型：** [TextDecorationType](./cj-common-types.md#enum-textdecorationtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(TextDecorationType, ResourceColor)

```cangjie
public init(decorationType!: TextDecorationType, color!: ResourceColor = Color.Black)
```

**功能：** 创建的文本装饰线对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|decorationType|[TextDecorationType](./cj-common-types.md#enum-textdecorationtype)|是|-|装饰线类型。|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black|装饰颜色。|

### enum LeadingMarginType

```cangjie
public enum LeadingMarginType {
    | LengthType(Length)
    | PlaceholderType(LeadingMarginPlaceholder)
    | None
    | ...
}
```

**功能：** 文本段落缩进类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### LengthType(Length)

```cangjie
LengthType(Length)
```

**功能：** 文本段落缩进距离。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### None

```cangjie
None
```

**功能：** 文本段落不缩进。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### PlaceholderType(LeadingMarginPlaceholder)

```cangjie
PlaceholderType(LeadingMarginPlaceholder)
```

**功能：** 前导边距占位符，用于表示文本段落左侧与组件边缘之间的距离。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### enum RichEditorDeleteDirection

```cangjie
public enum RichEditorDeleteDirection <: Equatable<RichEditorDeleteDirection> {
    | BACKWARD
    | FORWARD
    | ...
}
```

**功能：** 表示删除操作的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<RichEditorDeleteDirection>

#### BACKWARD

```cangjie
BACKWARD
```

**功能：** 表示向后删除。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### FORWARD

```cangjie
FORWARD
```

**功能：** 表示向前删除。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(RichEditorDeleteDirection)

```cangjie
public operator func !=(other: RichEditorDeleteDirection): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RichEditorDeleteDirection](#enum-richeditordeletedirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

#### func ==(RichEditorDeleteDirection)

```cangjie
public operator func ==(other: RichEditorDeleteDirection): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RichEditorDeleteDirection](#enum-richeditordeletedirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### enum RichEditorSpanType

```cangjie
public enum RichEditorSpanType <: Equatable<RichEditorSpanType> {
    | TEXT
    | IMAGE
    | MIXED
    | ...
}
```

**功能：** 表示Span类型信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<RichEditorSpanType>

#### IMAGE

```cangjie
IMAGE
```

**功能：** 表示Span为图像类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### MIXED

```cangjie
MIXED
```

**功能：** 表示Span为图文混合类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### TEXT

```cangjie
TEXT
```

**功能：** 表示Span为文字类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(RichEditorSpanType)

```cangjie
public operator func !=(other: RichEditorSpanType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RichEditorSpanType](#enum-richeditorspantype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

#### func ==(RichEditorSpanType)

```cangjie
public operator func ==(other: RichEditorSpanType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RichEditorSpanType](#enum-richeditorspantype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

#### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|枚举的值。|

### enum SpanType

```cangjie
public enum SpanType <: Equatable<SpanType> {
    | TEXT
    | IMAGE
    | ...
}
```

**功能：** 表示Span类型信息的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SpanType>

#### IMAGE

```cangjie
IMAGE
```

**功能：** 表示Span为图像类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### TEXT

```cangjie
TEXT
```

**功能：** 表示Span为文字类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(SpanType)

```cangjie
public operator func !=(other: SpanType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SpanType](#enum-spantype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

#### func ==(SpanType)

```cangjie
public operator func ==(other: SpanType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SpanType](#enum-spantype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### type OnDidChangeCallback

```cangjie
public type OnDidChangeCallback = (rangeBefore: TextRange, rangeAfter: TextRange) -> Unit
```

**功能：** (rangeBefore: TextRange, rangeAfter: TextRange) -> Unit 的类型别名。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import kit.PerformanceAnalysisKit.*

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
        Column(space: 30) {
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
                                decoration: TextDecorationOptions(
                                    decorationType: TextDecorationType.Overline,
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
            .customKeyboard(value: bind(builder, this))
            .bindSelectionMenu(
                spantype: RichEditorSpanType.Text,
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
