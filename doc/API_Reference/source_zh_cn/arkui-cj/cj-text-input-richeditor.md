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
|callback|[Callback](../apis/BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorDeleteValue](#class-richeditordeletevalue),Bool>|是|-|回调函数，输入法删除内容前触发该回调 。<br>[RichEditorDeleteValue](#class-richeditordeletevalue)：准备删除的内容所在的文本Span信息。<br>true：组件执行删除操作。<br>false：组件不执行删除操作。|

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
|callback|[Callback](../apis/BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorInsertValue](#class-richeditorinsertvalue),Bool>|是|-|回调函数，输入法输入内容前触发。<br>[RichEditorInsertValue](#class-richeditorinsertvalue)：输入法将要输入内容信息。<br>true：组件执行添加内容操作。<br>false：组件不执行添加内容操作。|

### func bindSelectionMenu(RichEditorSpanType, CustomBuilder, ResponseType, SelectionMenuOptions)

```cangjie

public func bindSelectionMenu(
    spantype!: RichEditorSpanType = RichEditorSpanType.TEXT,
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
|spantype|[RichEditorSpanType](#enum-richeditorspantype)|否|RichEditorSpanType.TEXT| **命名参数。** 指定选择菜单的类型。|
|content|[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-| **命名参数。** 指定选择菜单的内容。使用时结合[@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|
|responseType|[ResponseType](#enum-responsetype)|否|ResponseType.LongPress| **命名参数。** 指定选择菜单的响应类型。|
|options|[SelectionMenuOptions](#func-bindselectionmenutextspantype----unit-textresponsetype-int32int32---unit----unit)|是|-| **命名参数。** 指定选择菜单的选项。|

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
|value|[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-| **命名参数。** 富文本编辑器的自定义键盘。使用时结合[@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|

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
|callback|[VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback)|是|-|回调函数，订阅输入法完成删除时触发。|

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
|callback|[Callback](../apis/BasicServicesKit/cj-apis-base.md#type-Callback)\<[RichEditorTextSpanResult](#class-richeditortextspanresult),Unit>|是|-|回调函数，输入法完成输入后触发回调。<br>RichEditorTextSpanResult：输入法完成输入后的文本Span信息。|

**返回值：**

|类型|说明|
|:----|:----|
|[RichEditor](#class-richeditor)|RichEditor实例。|

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
|callback|[PasteEventCallback](<font color="red" face="bold">please add link</font>)|是|-|回调函数，完成粘贴前，触发回调。<br>PasteEvent：定义用户粘贴事件。|

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
|callback|[VoidCallback](../apis/BasicServicesKit/cj-apis-base.md#type-VoidCallback)|是|-|回调函数，富文本组件初始化完成后触发回调。|

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
|callback|[Callback](../apis/BasicServicesKit/cj-apis-base.md#type-callback)\<[RichEditorSelection](#class-richeditorselection),Unit>|是|-|回调函数，鼠标左键按下选择，松开左键后触发回调。<br>用手指选择时，松开手指触发回调。<br>RichEditorSelection：选中的所有Span信息。|

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

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var color

```cangjie
public var color: ResourceColor
```

**功能：** 装饰线颜色。

**类型：** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var decorationType

```cangjie
public var decorationType: TextDecorationType
```

**功能：** <font color="red" face="bold">please add description</font>

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

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|decorationType|[TextDecorationType](./cj-common-types.md#enum-textdecorationtype)|是|-|<font color="red" face="bold">please add description</font>|
|color|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|设置文本识别成功后的实体颜色。<br>默认值：'#ff0a59f7'<br>元服务API： 从API version 12开始，该接口支持在元服务中使用。|

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

**类型：** ArrayList\<[RichEditorSpanResult](<font color="red" face="bold">please add link</font>)>

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
|richEditorDeleteSpans|ArrayList\<[RichEditorSpanResult](<font color="red" face="bold">please add link</font>)>|是|-|删除的文本或者图片Span的具体信息。|

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

- [RichEditorSpanResult](<font color="red" face="bold">please add link</font>)

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

**类型：** Option\<[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)>

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
|valuePixelMap|Option\<[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)>|是|-|图片内容。|
|valueResourceStr|String|是|-|图片资源id。|
|imageStyle|[RichEditorImageSpanStyleResult](#class-richeditorimagespanstyleresult)|是|-|图片样式。|
|offsetInSpan|(Int32,Int32)|是|-|Span里图片的起始和结束位置。|

### class RichEditorImageSpanStyleResult

```cangjie
public class RichEditorImageSpanStyleResult {
    public var size:(Float64, Float64) =(0.0, 0.0)
    public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.CENTER
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

**类型：** [RichEditorLayoutStyle](#var-layoutStyle)

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
public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.CENTER
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

**类型：** ArrayList\<[RichEditorSpanResult](<font color="red" face="bold">please add link</font>)>

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
|spans|ArrayList\<[RichEditorSpanResult](<font color="red" face="bold">please add link</font>)>|是|-|Span信息。|

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

- [RichEditorSpanResult](<font color="red" face="bold">please add link</font>)

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

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|start|Int32|是|-|起始索引。|
|end|Int32|是|-|结束索引。|

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

## 示例代码

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
