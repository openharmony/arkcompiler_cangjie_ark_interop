# ImageSpan

作为[Text](./cj-text-input-text.md#text)组件的子组件，用于显示行内图片。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(ResourceStr)

```cangjie
public init(src: ResourceStr)
```

**功能：** 创建ImageSpan组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|[ResourceStr](<font color="red" face="bold">please add link</font>)|是|-|图片的数据源，支持本地图片和网络图片。<br/>支持的图片格式包括png、jpg、bmp、svg、gif和heif。|

### init(PixelMap)

```cangjie
public init(src: PixelMap)
```

**功能：** 创建ImageSpan组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)|是|-|图片的数据源，支持本地图片和网络图片。<br>PixelMap格式为像素图，常用于图片编辑的场景。<br>支持Base64字符串。格式data:image[png\|jpeg\|bmp\|webp\|heif]；base64，[base64 data]，其中[base64 data]为Base64字符串数据。|

## 通用属性/通用事件

通用属性：支持[尺寸设置](./cj-universal-attribute-size.md)、[背景设置](./cj-universal-attribute-background.md)、[边框设置](./cj-universal-attribute-border.md)。

通用事件：仅支持[点击事件](./cj-universal-event-click.md#func-onclick)。

## 组件属性

### func colorFilter(ColorFilter)

```cangjie
public func colorFilter(filter: ColorFilter): This
```

**功能：** 设置图像的颜色滤镜效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|filter|[ColorFilter](cj-image-video-image#class-colorfilter)|是|-|颜色滤镜效果。<br> 矩阵第一行表示R（红色）的向量值，第二行表示G（绿色）的向量值，第三行表示B（蓝色）的向量值，第四行表示A（透明度）的向量值，4行分别代表不同的RGBA的向量值。<br>当矩阵对角线值为1，其余值为0时，保持图片原有色彩。其中，svg类型的图源需具有stroke属性。<br>计算规则：<br>如果输入的滤镜矩阵为：<br>![iamgespan](figures/spanimageExample1.PNG)<br>像素点为[R, G, B, A]<br>则过滤后的颜色为 [R’, G’, B’, A’]<br>![iamgespan](figures/imagespanExample2.jpg)|

### func objectFit(ImageFit)

```cangjie
public func objectFit(value: ImageFit): This
```

**功能：** 设置图片的缩放类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ImageFit](./cj-common-types.md#enum-imagefit)|是|-|图片的缩放类型。<br>初始值：ImageFit.Cover。|

### func verticalAlign(ImageSpanAlignment)

```cangjie
public func verticalAlign(value: ImageSpanAlignment): This
```

**功能：** 设置图片基于行高的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ImageSpanAlignment](cj-common-types.md#enum-imagespanalignment)|是|-|图片基于文本的对齐方式。<br>初始值：ImageSpanAlignment.BOTTOM。|

## 组件事件

### func onComplete(ImageCompleteCallback)

```cangjie
public func onComplete(callback: ImageCompleteCallback): This
```

**功能：** 图片数据加载成功和解码成功时均触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[ImageCompleteCallback](<font color="red" face="bold">please add link</font>)|是|-|回调函数，图片数据加载成功和解码成功时触发。参数：成功加载的图片尺寸。|

### func onError(ImageErrorCallback)

```cangjie
public func onError(callback: ImageErrorCallback): This
```

**功能：** 图片加载异常时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[ImageErrorCallback](<font color="red" face="bold">please add link</font>)|是|-|回调函数，图片加载出现异常时触发。参数：图片加载异常信息。|

## 基础类型定义

### class ImageLoadResult

```cangjie
public class ImageLoadResult {
    public var width: Float64
    public var height: Float64
    public var componentWidth: Float64
    public var componentHeight: Float64
    public var loadingStatus: Int64
    public var contentWidth: Float64
    public var contentHeight: Float64
    public var contentOffsetX: Float64
    public var contentOffsetY: Float64
}
```

**功能：** 图片加载成功类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var componentHeight

```cangjie
public var componentHeight: Float64
```

**功能：** 表示组件的高。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var componentWidth

```cangjie
public var componentWidth: Float64
```

**功能：** 表示组件的宽。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var contentHeight

```cangjie
public var contentHeight: Float64
```

**功能：** 表示图片实际绘制的高度。仅在loadingStatus返回1时有效。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var contentOffsetX

```cangjie
public var contentOffsetX: Float64
```

**功能：** 表示实际绘制内容相对于组件自身的x轴偏移。仅在loadingStatus返回1时有效。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var contentOffsetY

```cangjie
public var contentOffsetY: Float64
```

**功能：** 表示实际绘制内容相对于组件自身的y轴偏移。仅在loadingStatus返回1时有效。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var contentWidth

```cangjie
public var contentWidth: Float64
```

**功能：** 表示图片实际绘制的宽度。仅在loadingStatus返回1时有效。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var height

```cangjie
public var height: Float64
```

**功能：** 表示图片的高。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var loadingStatus

```cangjie
public var loadingStatus: Int64
```

**功能：** 表示图片加载成功的状态值。

> **说明：**
>
> 返回的状态值为0时，表示图片数据加载成功。返回的状态值为1时，表示图片解码成功。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var width

```cangjie
public var width: Float64
```

**功能：** 表示图片的宽。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

### 示例1

该示例通过verticalAlign、objectFit属性展示了ImageSpan的对齐方式以及缩放效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    func build() {
        Column {
            Flex(FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center)) {
                Text() {
                    //以设定大小和排布方式加载图片资源
                    ImageSpan(@r(app.media.startIcon))
                        .width(150.px)
                        .height(250.px)
                        .objectFit(ImageFit.Contain)
                        .verticalAlign(ImageSpanAlignment.CENTER)
                    //对图片进行文本修饰
                    Span("This is the Span and ImageSpan component")
                        .decoration(decorationType: TextDecorationType.LineThrough, color: Color.Red).fontSize(25)
                    ImageSpan(@r(app.media.startIcon))
                       .width(150.px)
                       .height(50.px)
                        .objectFit(ImageFit.Contain)
                       .verticalAlign(ImageSpanAlignment.TOP)
                    Span("I am Underline-span2")
                        .decoration(decorationType: TextDecorationType.LineThrough, color: Color.Red).fontSize(25)
                    ImageSpan(@r(app.media.startIcon))
                        .width(150.px)
                        .height(250.px)
                        .objectFit(ImageFit.Fill)
                        .verticalAlign(ImageSpanAlignment.BASELINE)
                    Span("I am Underline-span3")
                        .decoration(decorationType: TextDecorationType.LineThrough, color: Color.Red).fontSize(25)
                    ImageSpan(@r(app.media.startIcon))
                        .width(150.px)
                        .height(50.px)
                        .objectFit(ImageFit.Auto)
                        .verticalAlign(ImageSpanAlignment.BOTTOM)
                    Span("I am Underline-span4")
                        .decoration(decorationType: TextDecorationType.LineThrough, color: Color.Red).fontSize(25)
                }.textAlign(TextAlign.Center)
            }
        }
        .height(720)
        .width(360)
        .padding(left:0, right: 0, top: 0)
    }
}
```

![imageSpan](figures/imageSpan.png)

### 示例2

该示例通过textBackgroundStyle属性展示了文本设置背景样式的效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Text() {
                ImageSpan(@r(app.media.startIcon))//建议使用自定义的本地图片
                .width(200.vp)
                .height(200.vp)
                //设置图片中间与行中间对齐。
                .verticalAlign(ImageSpanAlignment.CENTER)
                //设置图片背景颜色和图片背景圆角大小。
                .textBackgroundStyle(color: Color.Red, radius: BorderRadiuses(topLeft: 0.vp, topRight: 12.vp, bottomLeft: 24.vp, bottomRight: 48.vp))
            }
        }.width(100.percent).alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center)
    }
}
```

![imageSpan2](figures/imageSpan2.png)
