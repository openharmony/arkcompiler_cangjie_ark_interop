# CanvasRenderingContext2D

使用RenderingContext在Canvas组件上进行绘制，绘制对象可以是矩形、文本、图片等。

> **说明**
>
> - 本文绘制接口在调用时会存入被关联的Canvas组件的指令队列中。仅在当前帧进入渲染阶段且关联的Canvas组件处于可见状态时，这些指令才会从队列中被提取并执行。因此，在Canvas组件不可见的情况下，应尽量避免频繁调用绘制接口，以防止指令在队列中堆积，从而避免内存占用过大的问题。
> - Canvas组件的宽或高超过8000px时使用CPU渲染，会导致性能明显下降。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class CanvasRenderingContext2D

```cangjie
public class CanvasRenderingContext2D {
    public init(settings: RenderingContextSettings)
}
```

**功能：** 表示使用RenderingContext在Canvas组件上进行绘制的类型，绘制对象可以是矩形、文本、图片等。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop direction

```cangjie
public mut prop direction: Option<CanvasDirection>
```

**功能：** 文字绘制方向

**类型：** [Option\<CanvasDirection>](./cj-common-types.md#enum-canvasdirection)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop filter

```cangjie
public mut prop filter: Option<String>
```

**功能：** 提供模糊、灰度等滤镜效果

**类型：** Option<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop globalAlpha

```cangjie
public mut prop globalAlpha: Option<Float64>
```

**功能：** 透明度

**类型：** Option\<Float64>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop globalCompositeOperation

```cangjie
public mut prop globalCompositeOperation: Option<GlobalCompositeOperation>
```

**功能：** 绘制新形状时应用的合成作类型

**类型：** Option\<GlobalCompositeOperation>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop height

```cangjie
public prop height: Float64
```

**功能：** 默认值为 0，与指定画布的高度绑定。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop imageSmoothingEnabled

```cangjie
public mut prop imageSmoothingEnabled: Option<Bool>
```

**功能：** 指定是否平滑图像。

**类型：** Option\<Bool>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop imageSmoothingQuality

```cangjie
public mut prop imageSmoothingQuality: Option<ImageSmoothingQuality>
```

**功能：** 当前图像的平滑度级别

**类型：** Option\<ImageSmoothingQuality>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop lineCap

```cangjie
public mut prop lineCap: Option<LineCapStyle>
```

**功能：** 线段端点属性。

**类型：** Option\<LineCapStyle>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop lineDashOffset

```cangjie
public mut prop lineDashOffset: Option<Float64>
```

**功能：** 虚线偏移属性。

**类型：** Option\<Float64>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop lineJoin

```cangjie
public mut prop lineJoin: Option<LineJoinStyle>
```

**功能：** 线段连接点属性

**类型：** Option\<LineJoinStyle>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop lineWidth

```cangjie
public mut prop lineWidth: Option<Float64>
```

**功能：** 线粗细属性。

**类型：**[Option\<Float64>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop miterLimit

```cangjie
public mut prop miterLimit: Option<Float64>
```

**功能：** 此参数的值不能是0或负数。

**类型：** Option\<Float64>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop shadowBlur

```cangjie
public mut prop shadowBlur: Option<Float64>
```

**功能：** 阴影模糊半径

**类型：** Option\<Float64>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop shadowColor

```cangjie
public mut prop shadowColor: Option<ResourceColor>
```

**功能：** 阴影颜色。

**类型：** Option\<ResourceColor>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop shadowOffsetX

```cangjie
public mut prop shadowOffsetX: Option<Float64>
```

**功能：** 阴影的水平偏移距离。

**类型：** Option\<Float64>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop shadowOffsetY

```cangjie
public mut prop shadowOffsetY: Option<Float64>
```

**功能：** 阴影的垂直偏移距离

**类型：** Option\<Float64>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop textAlign

```cangjie
public mut prop textAlign: Option<CanvasTextAlign>
```

**功能：** 文本对齐模式

**类型：** Option\<CanvasTextAlign>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop textBaseline

```cangjie
public mut prop textBaseline: Option<CanvasTextBaseline>
```

**功能：** 文本基线

**类型：** Option\<CanvasTextBaseline>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### prop width

```cangjie
public prop width: Float64
```

**功能：** 默认值为 0，与指定画布的宽度绑定。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(RenderingContextSettings)

```cangjie
public init(settings: RenderingContextSettings)
```

**功能：** 构造一个CanvasRenderingContext2D类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|settings|[RenderingContextSettings](./cj-canvas-drawing-canvas.md#class-renderingcontextsettings)|是|-|用来配置CanvasRenderingContext2D对象的参数。|

### func arc(Float64, Float64, Float64, Float64, Float64, Bool)

```cangjie
public func arc(
    x: Float64,
    y: Float64,
    radius: Float64,
    startAngle: Float64,
    endAngle: Float64,
    counterclockwise!: Bool = false
): Unit
```

**功能：** 绘制弧线路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|弧线圆心的x坐标值。<br>默认单位：vp。|
|y|Float64|是|-|弧线圆心的y坐标值。<br>默认单位：vp。|
|radius|Float64|是|-|弧线的圆半径。<br>默认单位：vp。|
|startAngle|Float64|是|-|弧线的起始弧度。<br>单位：弧度。|
|endAngle|Float64|是|-|弧线的终止弧度。<br>单位：弧度。|
|counterclockwise|Bool|否|false|**命名参数。** 是否逆时针绘制圆弧。<br>是否逆时针绘制圆弧。<br>true：逆时针方向绘制椭圆。<br>false：顺时针方向绘制椭圆。|

### func arcTo(Float64, Float64, Float64, Float64, Float64)

```cangjie
public func arcTo(x1: Float64, y1: Float64, x2: Float64, y2: Float64, radius: Float64): Unit
```

**功能：** 依据圆弧经过的点和圆弧半径创建圆弧路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x1|Float64|是|-|圆弧经过的第一个点的x坐标值。<br>默认单位：vp。|
|y1|Float64|是|-|圆弧经过的第一个点的y坐标值。<br>默认单位：vp。|
|x2|Float64|是|-|圆弧经过的第二个点的x坐标值。<br>默认单位：vp。|
|y2|Float64|是|-|圆弧经过的第二个点的y坐标值。<br>默认单位：vp。|
|radius|Float64|是|-|圆弧的圆半径值。<br>默认单位：vp。|

### func beginPath()

```cangjie
public func beginPath(): Unit
```

**功能：** 创建一个新的绘制路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func bezierCurveTo(Float64, Float64, Float64, Float64, Float64, Float64)

```cangjie
public func bezierCurveTo(cp1x: Float64, cp1y: Float64, cp2x: Float64, cp2y: Float64, x: Float64, y: Float64): Unit
```

**功能：** 创建三次贝赛尔曲线的路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cp1x|Float64|是|-|第一个贝塞尔参数的x坐标值。<br>默认单位：vp。|
|cp1y|Float64|是|-|第一个贝塞尔参数的y坐标值。<br>默认单位：vp。|
|cp2x|Float64|是|-|第二个贝塞尔参数的x坐标值。<br>默认单位：vp。|
|cp2y|Float64|是|-|第二个贝塞尔参数的y坐标值。<br>默认单位：vp。|
|x|Float64|是|-|路径结束时的x坐标值。<br>默认单位：vp。|
|y|Float64|是|-|路径结束时的y坐标值。<br>默认单位：vp。|

### func clearRect(Float64, Float64, Float64, Float64)

```cangjie
public func clearRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit
```

**功能：** 清除矩形区域的绘图内容

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|指定矩形左上角点的x坐标。<br>默认单位：vp。|
|y|Float64|是|-|指定矩形左上角点的y坐标。<br>默认单位：vp。|
|width|Float64|是|-|指定矩形的宽度。<br>默认单位：vp。|
|height|Float64|是|-|指定矩形的高度。<br>默认单位：vp。|

### func clip(CanvasFillRule)

```cangjie
public func clip(fillRule!: CanvasFillRule = CanvasFillRule.NonZero): Unit
```

**功能：** 设置当前路径为剪切路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fillRule|[CanvasFillRule](./cj-common-types.md#enum-canvasfillrule)|否|CanvasFillRule.NonZero|指定要剪切对象的规则。<br/>可选参数为：nonzero, evenodd。<br>初始值：nonzero。|

### func clip(Path2D, CanvasFillRule)

```cangjie
public func clip(path: Path2D, fillRule!: CanvasFillRule = CanvasFillRule.NonZero): Unit
```

**功能：** 设置当前路径为剪切路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|[Path2D](./cj-canvas-drawing-path2d.md#class-path2d)|是|-|Path2D剪切路径。|
|fillRule|[CanvasFillRule](./cj-common-types.md#enum-canvasfillrule)|否|CanvasFillRule.NonZero|**命名参数。** 指定要剪切对象的规则。<br/>可选参数为：nonzero, evenodd。|

### func closePath()

```cangjie
public func closePath(): Unit
```

**功能：** 结束当前路径形成一个封闭路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func createConicGradient(Float64, Float64, Float64)

```cangjie
public func createConicGradient(startAngle: Float64, x: Float64, y: Float64): CanvasGradient
```

**功能：** 创建一个圆锥渐变色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|startAngle|Float64|是|-|开始渐变的角度。角度测量从中心右侧水平开始，顺时针移动。<br>单位：弧度。|
|x|Float64|是|-|圆锥渐变的中心x轴坐标。<br>默认单位：vp。|
|y|Float64|是|-|圆锥渐变的中心y轴坐标。<br>默认单位：vp。|

**返回值：**

|类型|说明|
|:----|:----|
|[CanvasGradient](cj-canvas-drawing-canvas.md#class-canvasgradient)|新的CanvasGradient对象，用于在canvas上创建渐变效果。|

### func createImageData(Float64, Float64)

```cangjie
public func createImageData(sw: Float64, sh: Float64): ImageData
```

**功能：** 创建新的、空白的、指定大小的ImageData 对象，请参考[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)，该接口存在内存拷贝行为，高耗时，应避免频繁使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sw|Float64|是|-|ImageData的宽度。<br>默认单位：vp。|
|sh|Float64|是|-|ImageData的高度。<br>默认单位：vp。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)|新的ImageData对象。|

### func createImageData(ImageData)

```cangjie
public func createImageData(imageData: ImageData): ImageData
```

**功能：** 根据一个现有的ImageData对象重新创建一个宽、高相同的ImageData对象（不会复制图像数据），请参考[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)，该接口存在内存拷贝行为，高耗时，应避免频繁使用。createImageData示例同[putImageData](#func-putimagedataimagedata-float64-float64-float64-float64-float64-float64)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|imageData|[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)|是|-|现有的ImageData对象。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)|新的ImageData对象|

### func createLinearGradient(Float64, Float64, Float64, Float64)

```cangjie
public func createLinearGradient(x0: Float64, y0: Float64, x1: Float64, y1: Float64): CanvasGradient
```

**功能：** 创建一个线性渐变色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x0|Float64|是|-|起点的x轴坐标。<br>默认单位：vp。|
|y0|Float64|是|-|起点的y轴坐标。<br>默认单位：vp。|
|x1|Float64|是|-|终点的x轴坐标。<br>默认单位：vp。|
|y1|Float64|是|-|终点的y轴坐标。<br>默认单位：vp。|

**返回值：**

|类型|说明|
|:----|:----|
|[CanvasGradient](cj-canvas-drawing-canvas.md#class-canvasgradient)|渐变对象。使用完毕后需要释放，详见[CanvasGradient](cj-canvas-drawing-canvas.md#class-canvasgradient)。|

### func createPattern(ImageBitmap, Repetition)

```cangjie
public func createPattern(image: ImageBitmap, repetition: Repetition): CanvasPattern
```

**功能：** 通过指定图像和重复方式创建图片填充的模板。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|image|[ImageBitmap](./cj-canvas-drawing-imagebitmap.md#class-imagebitmap)|是|-|图源对象，具体参考ImageBitmap对象。|
|repetition|[Repetition](./cj-common-types.md#enum-repetition)|是|-|设置图像重复的方式：<br>repeat：沿x轴和y轴重复绘制图像；<br>repeat-x：沿x轴重复绘制图像；<br>repeat-y：沿y轴重复绘制图像；<br>no-repeat：不重复绘制图像；<br>clamp：在原始边界外绘制时，超出部分使用边缘的颜色绘制；<br>mirror：沿x轴和y轴重复翻转绘制图像。|

**返回值：**

|类型|说明|
|:----|:----|
|[CanvasPattern](./cj-canvas-drawing-canvaspattern.md#class-canvaspattern)|通过指定图像和重复方式创建图片填充的模板对象。|

### func createRadialGradient(Float64, Float64, Float64, Float64, Float64, Float64)

```cangjie
public func createRadialGradient(x0: Float64, y0: Float64, r0: Float64, x1: Float64, y1: Float64, r1: Float64): CanvasGradient
```

**功能：** 创建一个径向渐变色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x0|Float64|是|-|起始圆的x轴坐标。<br>默认单位：vp。|
|y0|Float64|是|-|起始圆的y轴坐标。<br>默认单位：vp。|
|r0|Float64|是|-|起始圆的半径。必须是非负且有限的。<br>默认单位：vp。|
|x1|Float64|是|-|终点圆的x轴坐标。<br>默认单位：vp。|
|y1|Float64|是|-|终点圆的y轴坐标。<br>默认单位：vp。|
|r1|Float64|是|-|终点圆的半径。必须为非负且有限的。<br>默认单位：vp。|

**返回值：**

|类型|说明|
|:----|:----|
|[CanvasGradient](cj-canvas-drawing-canvas.md#class-canvasgradient)|渐变对象。使用完毕后需要释放，详见[CanvasGradient](cj-canvas-drawing-canvas.md#class-canvasgradient)。|

### func drawImage(ImageBitmap, Float64, Float64)

```cangjie
public func drawImage(image: ImageBitmap, dx: Float64, dy: Float64): Unit
```

**功能：** 进行图像绘制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|image|[ImageBitmap](./cj-canvas-drawing-imagebitmap.md#class-imagebitmap)|是|-|图片资源，请参考[ImageBitmap](./cj-canvas-drawing-imagebitmap.md#class-imagebitmap)。|
|dx|Float64|是|-|绘制区域左上角在 x 轴的位置。<br>默认单位：vp。|
|dy|Float64|是|-|绘制区域左上角在 y 轴的位置。<br>默认单位：vp。|

### func drawImage(ImageBitmap, Float64, Float64, Float64, Float64)

```cangjie
public func drawImage(image: ImageBitmap, dx: Float64, dy: Float64, dWidth: Float64, dHeight: Float64): Unit
```

**功能：** 进行图像绘制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|image|[ImageBitmap](./cj-canvas-drawing-imagebitmap.md#class-imagebitmap)|是|-|图片资源，请参考[ImageBitmap](./cj-canvas-drawing-imagebitmap.md#class-imagebitmap)。|
|dx|Float64|是|-|绘制区域左上角在 x 轴的位置。<br>默认单位：vp。|
|dy|Float64|是|-|绘制区域左上角在 y 轴的位置。<br>默认单位：vp。|
|dWidth|Float64|是|-|绘制区域的宽度。当绘制区域的宽度和裁剪图像的宽度不一致时，将图像宽度拉伸或压缩为绘制区域的宽度。<br>默认单位：vp。|
|dHeight|Float64|是|-|绘制区域的高度。当绘制区域的高度和裁剪图像的高度不一致时，将图像高度拉伸或压缩为绘制区域的高度。<br>默认单位：vp。|

### func drawImage(ImageBitmap, Float64, Float64, Float64, Float64, Float64, Float64, Float64, Float64)

```cangjie
public func drawImage(
    image: ImageBitmap,
    sx: Float64,
    sy: Float64,
    sWidth: Float64,
    sHeight: Float64,
    dx: Float64,
    dy: Float64,
    dWidth: Float64,
    dHeight: Float64
): Unit
```

**功能：** 进行图像绘制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|image|[ImageBitmap](./cj-canvas-drawing-imagebitmap.md#class-imagebitmap)|是|-|图片资源，请参考[ImageBitmap](./cj-canvas-drawing-imagebitmap.md#class-imagebitmap)。|
|sx|Float64|是|-|裁切源图像时距离源图像左上角的x坐标值。<br>单位：px。|
|sy|Float64|是|-|裁切源图像时距离源图像左上角的y坐标值。<br>单位：px。|
|sWidth|Float64|是|-|裁切源图像时需要裁切的宽度。<br>单位：px。|
|sHeight|Float64|是|-|裁切源图像时需要裁切的高度。<br>单位：px。|
|dx|Float64|是|-|绘制区域左上角在 x 轴的位置。<br>默认单位：vp。|
|dy|Float64|是|-|绘制区域左上角在 y 轴的位置。<br>默认单位：vp。|
|dWidth|Float64|是|-|绘制区域的宽度。当绘制区域的宽度和裁剪图像的宽度不一致时，将图像宽度拉伸或压缩为绘制区域的宽度。<br>默认单位：vp。|
|dHeight|Float64|是|-|绘制区域的高度。当绘制区域的高度和裁剪图像的高度不一致时，将图像高度拉伸或压缩为绘制区域的高度。<br>默认单位：vp。|

### func drawImage(PixelMap, Float64, Float64)

```cangjie
public func drawImage(pixelMap: PixelMap, dx: Float64, dy: Float64): Unit
```

**功能：** 进行图像绘制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pixelMap|[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)|是|-| 图片资源，请参考[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)。|
|dx|Float64|是|-|绘制区域左上角在 x 轴的位置。<br>默认单位：vp。|
|dy|Float64|是|-|绘制区域左上角在 y 轴的位置。<br>默认单位：vp。|

### func drawImage(PixelMap, Float64, Float64, Float64, Float64)

```cangjie
public func drawImage(pixelMap: PixelMap, dx: Float64, dy: Float64, dWidth: Float64, dHeight: Float64): Unit
```

**功能：** 进行图像绘制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pixelMap|[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)|是|-|图片资源，请参考[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)。|
|dx|Float64|是|-|绘制区域左上角在 x 轴的位置。<br>默认单位：vp。|
|dy|Float64|是|-|绘制区域左上角在 y 轴的位置。<br>默认单位：vp。|
|dWidth|Float64|是|-|绘制区域的宽度。当绘制区域的宽度和裁剪图像的宽度不一致时，将图像宽度拉伸或压缩为绘制区域的宽度。<br>默认单位：vp。|
|dHeight|Float64|是|-|绘制区域的高度。当绘制区域的高度和裁剪图像的高度不一致时，将图像高度拉伸或压缩为绘制区域的高度。<br>默认单位：vp。|

### func drawImage(PixelMap, Float64, Float64, Float64, Float64, Float64, Float64, Float64, Float64)

```cangjie
public func drawImage(
    pixelMap: PixelMap,
    sx: Float64,
    sy: Float64,
    sWidth: Float64,
    sHeight: Float64,
    dx: Float64,
    dy: Float64,
    dWidth: Float64,
    dHeight: Float64
): Unit
```

**功能：** 进行图像绘制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pixelMap|[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)|是|-|图片资源，请参考[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)。|
|sx|Float64|是|-|裁切源图像时距离源图像左上角的x坐标值。<br>单位：px。|
|sy|Float64|是|-|裁切源图像时距离源图像左上角的y坐标值。<br>单位：px。|
|sWidth|Float64|是|-|裁切源图像时需要裁切的宽度。<br>单位：px。|
|sHeight|Float64|是|-|裁切源图像时需要裁切的高度。<br>单位：px。|
|dx|Float64|是|-|绘制区域左上角在 x 轴的位置。<br>默认单位：vp。|
|dy|Float64|是|-|绘制区域左上角在 y 轴的位置。<br>默认单位：vp。|
|dWidth|Float64|是|-|绘制区域的宽度。当绘制区域的宽度和裁剪图像的宽度不一致时，将图像宽度拉伸或压缩为绘制区域的宽度。<br>默认单位：vp。|
|dHeight|Float64|是|-|绘制区域的高度。当绘制区域的高度和裁剪图像的高度不一致时，将图像高度拉伸或压缩为绘制区域的高度。<br>默认单位：vp。|

### func ellipse(Float64, Float64, Float64, Float64, Float64, Float64, Float64, Bool)

```cangjie
public func ellipse(
    x: Float64,
    y: Float64,
    radiusX: Float64,
    radiusY: Float64,
    rotation: Float64,
    startAngle: Float64,
    endAngle: Float64,
    counterclockwise!: Bool = false
): Unit
```

**功能：** 在规定的矩形区域绘制一个椭圆。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|椭圆圆心的x轴坐标，单位：vp。|
|y|Float64|是|-|椭圆圆心的y轴坐标，单位：vp。|
|radiusX|Float64|是|-|椭圆x轴的半径长度，单位：vp。|
|radiusY|Float64|是|-|椭圆y轴的半径长度，单位：vp。|
|rotation|Float64|是|-|椭圆的旋转角度，单位为弧度。|
|startAngle|Float64|是|-|椭圆绘制的起始点角度，以弧度表示。|
|endAngle|Float64|是|-|椭圆绘制的结束点角度，以弧度表示。|
|counterclockwise|Bool|否|false| **命名参数。** 是否以逆时针方向绘制椭圆。</br>true:逆时针方向绘制椭圆。</br>false:顺时针方向绘制椭圆。|

### func fill(CanvasFillRule)

```cangjie
public func fill(fillRule!: CanvasFillRule = CanvasFillRule.NonZero): Unit
```

**功能：** 对封闭路径进行填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fillRule|[CanvasFillRule](./cj-common-types.md#enum-canvasfillrule)|否|CanvasFillRule.NonZero|指定要剪切对象的规则。<br/>可选参数为：nonzero, evenodd。<br>初始值：nonzero。|

### func fill(Path2D, CanvasFillRule)

```cangjie
public func fill(path: Path2D, fillRule!: CanvasFillRule = CanvasFillRule.NonZero): Unit
```

**功能：** 对封闭路径进行填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|[Path2D](./cj-canvas-drawing-path2d.md#class-path2d)|是|-| Path2D剪切路径。|
|fillRule|[CanvasFillRule](./cj-common-types.md#enum-canvasfillrule)|否|CanvasFillRule.NonZero| **命名参数。**  指定要剪切对象的规则。<br/>可选参数为：nonzero, evenodd。|

### func fillRect(Float64, Float64, Float64, Float64)

```cangjie
public func fillRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit
```

**功能：** 填充一个矩形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|指定矩形左上角点的x坐标。<br>默认单位：vp。|
|y|Float64|是|-|指定矩形左上角点的y坐标。<br>默认单位：vp。|
|width|Float64|是|-|指定矩形的宽度。<br>默认单位：vp。|
|height|Float64|是|-|指定矩形的高度。<br>默认单位：vp。|

### func fillStyle(ResourceColor)

```cangjie
public func fillStyle(color: ResourceColor): Unit
```

**功能：** 指定绘制的填充色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|表示设置填充区域的颜色。|

### func fillStyle(CanvasGradient)

```cangjie
public func fillStyle(gradient: CanvasGradient): Unit
```

**功能：** 指定绘制的填充色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gradient|[CanvasGradient](cj-canvas-drawing-canvas.md#class-canvasgradient)|是|-|表示渐变对象，使用createLinearGradient方法创建。|

### func fillStyle(CanvasPattern)

```cangjie
public func fillStyle(pattern: CanvasPattern): Unit
```

**功能：** 指定绘制的填充色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pattern|[CanvasPattern](./cj-canvas-drawing-canvaspattern.md#class-canvaspattern)|是|-|通过指定图像和重复方式创建图片填充的模板对象。|

### func fillText(String, Float64, Float64, Option\<Float64>)

```cangjie
public func fillText(text: String, x: Float64, y: Float64, maxWidth!: Option<Float64> = Option.None): Unit
```

**功能：** 绘制填充类文本。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|text|String|是|-|需要绘制的文本内容。|
|x|Float64|是|-|需要绘制的文本的左下角x坐标。<br>默认单位：vp。|
|y|Float64|是|-|需要绘制的文本的左下角y坐标。<br>默认单位：vp。|
|maxWidth|Option<Float64>|否|Option.None|指定文本允许的最大宽度。<br>默认单位：vp。<br>初始值：不限制宽度。|

### func font(FontStyle, FontWeight, Length, String)

```cangjie
public func font(
    style!: FontStyle = FontStyle.Normal,
    weight!: FontWeight = FontWeight.Normal,
    size!: Length = 14.px,
    family!: String = "sans-serif"
): Unit
```

**功能：** 设置文本绘制中的字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal|**命名参数。** 用于指定字体样式。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.Normal|**命名参数。** 用于指定字体的粗细。|
|size|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|14.px|**命名参数。** 指定字号和行高。|
|family|String|否|"sans-serif"|**命名参数。** 指定字体系列。|

### func getImageData(Float64, Float64, Float64, Float64)

```cangjie
public func getImageData(sx: Float64, sy: Float64, sw: Float64, sh: Float64): ImageData
```

**功能：** 以当前canvas指定区域内的像素创建ImageData对象，该接口存在内存拷贝行为，高耗时，应避免频繁使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sx|Float64|是|-|需要输出的区域的左上角x坐标。<br> 默认单位：vp。|
|sy|Float64|是|-|需要输出的区域的左上角y坐标。<br> 默认单位：vp。|
|sw|Float64|是|-|需要输出的区域的宽度。<br> 默认单位：vp。|
|sh|Float64|是|-|需要输出的区域的高度。<br> 默认单位：vp。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)|<新的ImageData对象。|

### func getLineDash()

```cangjie
public func getLineDash(): Array<Float64>
```

**功能：** 获得当前画布的虚线样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Float64>|返回数组，该数组用来描述线段如何交替和间距长度。<br>默认单位：vp。|

### func getPixelMap(Float64, Float64, Float64, Float64)

```cangjie
public func getPixelMap(left: Float64, top: Float64, width: Float64, height: Float64): PixelMap
```

**功能：** 以当前canvas指定区域内的像素创建[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|left|Float64|是|-|需要输出的区域的左上角x坐标。<br>默认单位：vp。|
|top|Float64|是|-|需要输出的区域的左上角y坐标。<br>默认单位：vp。|
|width|Float64|是|-|需要输出的区域的宽度。<br>默认单位：vp。|
|height|Float64|是|-|需要输出的区域的高度。<br>默认单位：vp。|

**返回值：**

|类型|说明|
|:----|:----|
|[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)|新的[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)对象。|

### func getTransform()

```cangjie
public func getTransform(): Matrix2D
```

**功能：** 获取当前被应用到上下文的转换矩阵。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Matrix2D](./cj-canvas-drawing-matrix2d.md#class-matrix2d)|矩阵对象。|

### func lineTo(Float64, Float64)

```cangjie
public func lineTo(x: Float64, y: Float64): Unit
```

**功能：** 从当前点到指定点进行路径连接。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|指定位置的x坐标。<br>默认单位：vp。|
|y|Float64|是|-|指定位置的y坐标。<br>默认单位：vp。|

### func measureText(String)

```cangjie
public func measureText(text: String): TextMetrics
```

**功能：** 该方法返回一个文本测算的对象，通过该对象可以获取指定文本的宽度值。不同设备上获取的宽度值可能不同。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|text|String|是|-|需要进行测量的文本。|

**返回值：**

|类型|说明|
|:----|:----|
|[TextMetrics](cj-canvas-drawing-canvas.md#class-textmetrics)|文本的尺寸信息|

### func moveTo(Float64, Float64)

```cangjie
public func moveTo(x: Float64, y: Float64): Unit
```

**功能：** 路径从当前点移动到指定点。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|指定位置的x坐标。<br>默认单位：vp。|
|y|Float64|是|-|指定位置的y坐标。<br>默认单位：vp。|

### func putImageData(ImageData, Length, Length)

```cangjie
public func putImageData(imageData: ImageData, dx: Length, dy: Length): Unit
```

**功能：** 使用[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)数据填充新的矩形区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|imageData|[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)|是|-| 包含像素值的ImageData对象。|
|dx|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|填充区域在x轴方向的偏移量。<br>默认单位：vp。|
|dy|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|填充区域在y轴方向的偏移量。<br>默认单位：vp。|

### func putImageData(ImageData, Float64, Float64, Float64, Float64, Float64, Float64)

```cangjie
public func putImageData(
    imageData: ImageData,
    dx: Float64,
    dy: Float64,
    dirtyX: Float64,
    dirtyY: Float64,
    dirtyWidth: Float64,
    dirtyHeight: Float64
): Unit
```

**功能：** 使用[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)数据填充新的矩形区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|imageData|[ImageData](./cj-canvas-drawing-imagedata.md#class-imagedata)|是|-| 包含像素值的ImageData对象。|
|dx|Float64|是|-|填充区域在x轴方向的偏移量。<br>默认单位：vp。|
|dy|Float64|是|-|填充区域在y轴方向的偏移量。<br>默认单位：vp。|
|dirtyX|Float64|是|-|源图像数据矩形裁切范围左上角距离源图像左上角的x轴偏移量。<br>默认单位：vp。|
|dirtyY|Float64|是|-|源图像数据矩形裁切范围左上角距离源图像左上角的y轴偏移量。<br>默认单位：vp。|
|dirtyWidth|Float64|是|-|源图像数据矩形裁切范围的宽度。<br>默认单位：vp。|
|dirtyHeight|Float64|是|-|源图像数据矩形裁切范围的高度。<br>默认单位：vp。|

### func quadraticCurveTo(Float64, Float64, Float64, Float64)

```cangjie
public func quadraticCurveTo(cpx: Float64, cpy: Float64, x: Float64, y: Float64): Unit
```

**功能：** 创建二次贝赛尔曲线的路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cpx|Float64|是|-|贝塞尔参数的x坐标值。<br>默认单位：vp。|
|cpy|Float64|是|-|贝塞尔参数的y坐标值。<br>默认单位：vp。|
|x|Float64|是|-|路径结束时的x坐标值。<br>默认单位：vp。|
|y|Float64|是|-|路径结束时的y坐标值。<br>默认单位：vp。|

### func rect(Float64, Float64, Float64, Float64)

```cangjie
public func rect(x: Float64, y: Float64, width: Float64, height: Float64): Unit
```

**功能：** 创建矩形路径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|指定矩形的左上角x坐标值。<br>默认单位：vp。|
|y|Float64|是|-|指定矩形的左上角y坐标值。<br>默认单位：vp。|
|width|Float64|是|-|指定矩形的宽度。<br>默认单位：vp。|
|height|Float64|是|-|指定矩形的高度。<br>默认单位：vp。|

### func reset()

```cangjie
public func reset(): Unit
```

**功能：** 将CanvasRenderingContext2D重置为其默认状态，清除后台缓冲区、绘制状态栈、绘制路径和样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func resetTransform()

```cangjie
public func resetTransform(): Unit
```

**功能：** 使用单位矩阵重新设置当前矩阵。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func restore()

```cangjie
public func restore(): Unit
```

**功能：** 对保存的绘图上下文进行恢复。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func restoreLayer()

```cangjie
public func restoreLayer(): Unit
```

**功能：** 恢复图像变换和裁剪状态至saveLayer前的状态，并将图层绘制在canvas上。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func rotate(Float64)

```cangjie
public func rotate(angle: Float64): Unit
```

**功能：** 针对当前坐标轴进行顺时针旋转。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|angle|Float64|是|-|设置顺时针旋转的弧度值，可以通过Float64.PI / 180将角度转换为弧度值。<br>单位：弧度。|

### func save()

```cangjie
public func save(): Unit
```

**功能：** 将当前状态放入栈中，保存canvas的全部状态，通常在需要保存绘制状态时调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func saveLayer()

```cangjie
public func saveLayer(): Unit
```

**功能：** 创建一个图层。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func scale(Float64, Float64)

```cangjie
public func scale(x: Float64, y: Float64): Unit
```

**功能：** 设置canvas画布的缩放变换属性，后续的绘制操作将按照缩放比例进行缩放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|设置水平方向的缩放值。<br>默认单位：vp。|
|y|Float64|是|-|设置垂直方向的缩放值。<br>默认单位：vp。|

### func setLineDash(Array\<Float64>)

```cangjie
public func setLineDash(dashArr: Array<Float64>): Unit
```

**功能：** 设置画布的虚线样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dashArr|Array\<Float64>|是|-|描述线段如何交替和线段间距长度的数组。<br>默认单位：vp|

### func setPixelMap(Option\<PixelMap>)

```cangjie
public func setPixelMap(pixelMap: Option<PixelMap>): Unit
```

**功能：** 将当前传入[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)对象绘制在画布上。setPixelMap示例同[getPixelMap](#func-getpixelmapfloat64-float64-float64-float64)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pixelMap|Option<PixelMap>|是|-|包含像素值的PixelMap对象。<br>初始值：None。|

### func setTransform(Float64, Float64, Float64, Float64, Float64, Float64)

```cangjie
public func setTransform(
    scaleX: Float64,
    skewX: Float64,
    skewY: Float64,
    scaleY: Float64,
    translateX: Float64,
    translateY: Float64
): Unit
```

**功能：** 对应一个变换矩阵，想对一个图形进行变化的时候，只要设置此变换矩阵相应的参数，对图形的各个定点的坐标分别乘以这个矩阵，就能得到新的定点的坐标。setTransform()方法会重置现有的变换矩阵并创建新的变换矩阵。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scaleX|Float64|是|-|指定水平缩放值。|
|skewX|Float64|是|-|指定水平倾斜值。|
|skewY|Float64|是|-|指定垂直倾斜值。|
|scaleY|Float64|是|-|指定垂直缩放值。|
|translateX|Float64|是|-|指定水平移动值。<br>默认单位：vp。|
|translateY|Float64|是|-|指定垂直移动值。<br>默认单位：vp。|

### func setTransform(Option\<Matrix2D>)

```cangjie
public func setTransform(matrix: Option<Matrix2D>): Unit
```

**功能：** 以Matrix2D对象为模板重置现有的变换矩阵并创建新的变换矩阵。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|matrix|Option<Matrix2D>|是|-|变换矩阵。|

### func stroke()

```cangjie
public func stroke(): Unit
```

**功能：** 进行边框绘制操作。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func stroke(Path2D)

```cangjie
public func stroke(path2D: Path2D): Unit
```

**功能：** 进行边框绘制操作。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path2D|[Path2D](./cj-canvas-drawing-path2d.md#class-path2d)|是|-|需要绘制的Path2D。|

### func strokeRect(Float64, Float64, Float64, Float64)

```cangjie
public func strokeRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit
```

**功能：** 绘制具有边框的矩形，矩形内部不填充。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|指定矩形左上角点的x坐标。<br>默认单位：vp。|
|y|Float64|是|-|指定矩形左上角点的y坐标。<br>默认单位：vp。|
|width|Float64|是|-|指定矩形的宽度。<br>默认单位：vp。|
|height|Float64|是|-|指定矩形的高度。<br>默认单位：vp。|

### func strokeStyle(ResourceColor)

```cangjie
public func strokeStyle(color: ResourceColor): Unit
```

**功能：** 设置描边的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|表示设置填充区域的颜色。|

### func strokeStyle(CanvasGradient)

```cangjie
public func strokeStyle(gradient: CanvasGradient): Unit
```

**功能：** 设置描边的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gradient|[CanvasGradient](cj-canvas-drawing-canvas.md#class-canvasgradient)|是|-|表示渐变对象，使用createLinearGradient方法创建。|

### func strokeStyle(CanvasPattern)

```cangjie
public func strokeStyle(pattern: CanvasPattern): Unit
```

**功能：** 设置绘制线条的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pattern|[CanvasPattern](./cj-canvas-drawing-canvaspattern.md#class-canvaspattern)|是|-|定图像和重复方式创建图片填充的模板，使用createPattern方法创建。|

### func strokeText(String, Float64, Float64, Option\<Float64>)

```cangjie
public func strokeText(text: String, x: Float64, y: Float64, maxWidth!: Option<Float64> = Option.None): Unit
```

**功能：** 绘制描边类文本。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|text|String|是|-|需要绘制的文本内容。|
|x|Float64|是|-|需要绘制的文本的左下角x坐标。<br>默认单位：vp。|
|y|Float64|是|-|需要绘制的文本的左下角y坐标。<br>默认单位：vp。|
|maxWidth|Option\<Float64>|否|Option.None|需要绘制的文本的最大宽度。<br>默认单位：vp。|

### func toDataURL(ImageType, Float64)

```cangjie
public func toDataURL(imageType!: ImageType = ImageType.Png, quality!: Float64 = 0.92): String
```

**功能：** 生成一个包含图片展示的URL，该接口存在内存拷贝行为，高耗时，应避免频繁使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|imageType|[ImageType](./cj-common-types.md#enum-imagetype)|否|ImageType.Png|**命名参数。** 用于指定图像格式。|
|quality|Float64|否|0.92|**命名参数。** 在指定图片格式为image/jpeg或image/webp的情况下，可以从0到1的区间内选择图片的质量。如果超出取值范围，将会使用默认值0.92。|

**返回值：**

|类型|说明|
|:----|:----|
|String|图像的URL地址。|

### func transferFromImageBitmap(ImageBitmap)

```cangjie
public func transferFromImageBitmap(bitmap: ImageBitmap): Unit
```

**功能：** 显示给定的ImageBitmap对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|bitmap|[ImageBitmap](./cj-canvas-drawing-imagebitmap.md#class-imagebitmap)|是|-|待显示的ImageBitmap对象。|

### func transform(Float64, Float64, Float64, Float64, Float64, Float64)

```cangjie
public func transform(
    scaleX: Float64,
    skewX: Float64,
    skewY: Float64,
    scaleY: Float64,
    translateX: Float64,
    translateY: Float64
): Unit
```

**功能：** transform方法对应一个变换矩阵。在对一个图形进行变化时，只要设置此变换矩阵相应的参数，对图形的各个定点的坐标分别乘以这个矩阵，就能得到新的定点的坐标。矩阵变换效果可叠加。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scaleX|Float64|是|-|指定水平缩放值。|
|skewX|Float64|是|-|指定水平倾斜值。|
|skewY|Float64|是|-|指定垂直倾斜值。|
|scaleY|Float64|是|-|指定垂直缩放值。|
|translateX|Float64|是|-|指定水平移动值。<br>默认单位：vp。|
|translateY|Float64|是|-|指定垂直移动值。<br>默认单位：vp。|

### func translate(Float64, Float64)

```cangjie
public func translate(x: Float64, y: Float64): Unit
```

**功能：** 移动当前坐标系的原点。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float64|是|-|设置水平平移量。<br>默认单位：vp。|
|y|Float64|是|-|设置竖直平移量。<br>默认单位：vp。|

## 示例代码

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    private let settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    private let context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    @State var message: String = ""
    func build() {
            Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center)  {
                Canvas(this.context)
                    .width(100.percent)
                    .height(100.percent)
                    .backgroundColor(0xffff00)
                    .onReady({=>
                        this.context.fillRect(10.0, 10.0, 50.0, 50.0)
                        this.context.translate(70.0, 70.0)
                        this.context.fillRect(10.0, 10.0, 50.0, 50.0)
                        })
            }.width(100.percent).height(100.percent)
    }
}

```
