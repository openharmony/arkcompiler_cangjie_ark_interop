# Shape

绘制组件的父组件，父组件中会描述所有绘制组件均支持的通用属性。

1、绘制组件使用Shape作为父组件，实现类似SVG的效果。

2、绘制组件单独使用，用于在页面上绘制指定的图形。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

包含 [Rect](./cj-graphic-drawing-rect.md)、[Circle](./cj-graphic-drawing-circle.md)、[Ellipse](./cj-graphic-drawing-ellipse.md)、[Image](./cj-image-video-image.md)、[Text](./cj-text-input-text.md)、[Column](./cj-row-column-stack-column.md)、[Row](./cj-row-column-stack-row.md)、Shape子组件。

## 创建组件

### init(() -> Unit)

```cangjie
public init(child!: () -> Unit = { => })
```

**功能：** 创建一个 Shape 绘制容器，并执行 `child` 闭包以声明其内部绘制子组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|child|()->Unit|否|{ => }| **命名参数。** 声明Shape容器内支持的子组件。|

### init(PixelMap)

```cangjie
public init(value!: PixelMap)
```

**功能：** 基于指定的 `PixelMap` 创建 Shape，以像素图作为绘制内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|是|-| **命名参数。** 绘制目标，可将图形绘制在指定的PixelMap对象中，若未设置，则在当前绘制目标中进行绘制。|

## 通用属性/通用事件

通用属性：支持通用属性。

通用事件：全部支持。

## 组件属性

### func mesh(Array\<Float64>, UInt32, UInt32)

```cangjie
public func mesh(array: Array<Float64>, column: UInt32, row: UInt32): This
```

**功能：** 设置网格变形数据，按给定列数与行数定义网格，并用坐标数组对内容进行网格扭曲/采样变换。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|array|Array\<Float64>|是|-|长度（column + 1）\*（row + 1）\* 2的数组，它记录了扭曲后的位图各个顶点位置。网格控制点坐标序列（按 [x0, y0, x1, y1, …] 排列）。|
|column|UInt32|是|-|网格列数。|
|row|UInt32|是|-|网格行数。|

### func viewPort(Length, Length, Length, Length)

```cangjie
public func viewPort(
    x!: Length = 0.vp,
    y!: Length = 0.vp,
    width!: Length = 0.vp,
    height!: Length = 0.vp
): This
```

**功能：** 设置Shape的视口。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。** 视口起始点x坐标。|
|y|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。** 视口起始点y坐标。|
|width|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。** 视口宽度。|
|height|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。** 视口高度。|

## 基础类型定义

### class ShapeComponent

```cangjie
public abstract class ShapeComponent <: ContainerBase {}
```

**功能：** 图形绘制组件的抽象基类，提供填充、描边、抗锯齿与尺寸等通用绘制属性与能力。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ContainerBase](./cj-ui-framework.md#containerbase)

#### func antiAlias(Bool)

```cangjie
public func antiAlias(value: Bool): This
```

**功能：** 是否启用抗锯齿渲染。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否开启抗锯齿（`true` 开启，`false` 关闭）。|

#### func fill(ResourceColor)

```cangjie
public func fill(value: ResourceColor): This
```

**功能：** 设置填充区域的颜色（异常值按默认值处理）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|填充颜色（支持资源色/纯色）。|

#### func fillOpacity(Float64)

```cangjie
public func fillOpacity(value: Float64): This
```

**功能：** 设置填充区域的不透明度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|不透明度数值，范围 0.0–1.0。|

#### func fillOpacity(AppResource)

```cangjie
public func fillOpacity(value: AppResource): This
```

**功能：** 从资源设置填充区域的不透明度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AppResource](../LocalizationKit/cj-apis-resource.md#class-appresource)|是|-|不透明度资源。|

#### func stroke(ResourceColor)

```cangjie
public func stroke(value: ResourceColor): This
```

**功能：** 设置描边（边框）颜色；未设置时默认无描边。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|描边颜色（支持资源色/纯色）。|

#### func strokeDashArray(Array\<Length>)

```cangjie
public func strokeDashArray(value: Array<Length>): This
```

**功能：** 设置描边虚线样式（线段与间隔的长度序列）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Array\<[Length](../BasicServicesKit/cj-apis-base.md#interface-length)>|是|-|虚线模式的长度数组，每个元素表示线段或间隔长度，支持长度单位。|

#### func strokeDashOffset(Length)

```cangjie
public func strokeDashOffset(value: Length): This
```

**功能：** 设置虚线起始位置的绘制偏移。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|起始偏移量，支持长度单位。|

#### func strokeLineCap(LineCapStyle)

```cangjie
public func strokeLineCap(value: LineCapStyle): This
```

**功能：** 设置描边端点的绘制样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[LineCapStyle](./cj-common-types.md#enum-linecapstyle)|是|-|端点样式（如平头、圆头、方头）。|

#### func strokeLineJoin(LineJoinStyle)

```cangjie
public func strokeLineJoin(value: LineJoinStyle): This
```

**功能：** 设置描边拐角的连接样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[LineJoinStyle](./cj-common-types.md#enum-linejoinstyle)|是|-|拐角样式（如斜接、圆角、斜角）。|

#### func strokeMiterLimit(Float64)

```cangjie
public func strokeMiterLimit(miterLimit: Float64): This
```

**功能：** 设置斜接限制（尖角长度与线宽之比的最大值），仅在斜接拐角样式下生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|miterLimit|Float64|是|-|斜接限制比值。|

#### func strokeOpacity(Float64)

```cangjie
public func strokeOpacity(value: Float64): This
```

**功能：** 设置描边的不透明度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|不透明度数值，范围 0.0–1.0。|

#### func strokeOpacity(AppResource)

```cangjie
public func strokeOpacity(value: AppResource): This
```

**功能：** 从资源设置描边不透明度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AppResource](../LocalizationKit/cj-apis-resource.md#class-appresource)|是|-|不透明度资源。|

#### func strokeWidth(Length)

```cangjie
public func strokeWidth(value: Length): This
```

**功能：** 设置描边（边框）宽度，支持长度单位。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|描边宽度（如 vp/px 等）。|

### class BaseShape

```cangjie
public abstract class BaseShape {}
```

**功能：** 绘制组件的父组件，父组件中会描述所有绘制组件均支持的通用属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func fill(ResourceColor)

```cangjie
public func fill(color: ResourceColor): This
```

**功能：** 设置填充区域的颜色，异常值按照初始值处理。与通用属性[foregroundColor](./cj-universal-attribute-foregroundcolor.md#func-foregroundcolorcoloringstrategy)同时设置时，后设置的属性生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|填充区域颜色。初始值：Color.BLACK。|

#### func height(Length)

```cangjie
public func height(height: Length): This
```

**功能：** 设置组件高度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|height|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|组件高度。<br>单位：vp。|

#### func offset(Length, Length)

```cangjie
public func offset(x!: Length, y!: Length): This
```

**功能：** 设置相对偏移，组件相对原本的布局位置进行偏移。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** x轴偏移量。<br>单位：vp。|
|y|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** y轴偏移量。<br>单位：vp。|

#### func size(Length, Length)

```cangjie
public func size(width!: Length, height!: Length): This
```

**功能：** 设置组件宽高。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 组件宽度。<br>单位：vp。|
|height|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 组件高度。<br>单位：vp。|

#### func width(Length)

```cangjie
public func width(width: Length): This
```

**功能：** 设置组件宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|组件宽度。</br>单位：vp。|

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(space: 10) {
            Text("basic")
                .fontSize(11)
                .fontColor(0xCCCCCC)
                .width(320)
            Shape() {
                Rect()
                    .width(300)
                    .height(50)
                Ellipse()
                    .width(300)
                    .height(50)
                    .offset(x: 0, y: 60)
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
                    .offset(x: 0, y: 120)
            }
            .width(350)
            .height(140)
            .viewPort(x: -2, y: -2, width: 304, height: 130)
            .fill(0x317AF7)
            .stroke(Color.Black)
            .strokeWidth(4)
            .strokeDashArray([20])
            .strokeDashOffset(10)
            .strokeLineCap(LineCapStyle.Round)
            .strokeLineJoin(LineJoinStyle.Round)
            .antiAlias(true)
            // 分别在Shape的(0, 0)、(-5, -5)点绘制一个 300 * 50 带边框的矩形,可以看出之所以将视口的起始位置坐标设为负值是因为绘制的起点默认为线宽的中点位置，因此要让边框完全显示则需要让视口偏移半个线宽
            Shape() {
                Rect()
                    .width(300)
                    .height(50)
            }
            .width(350)
            .height(80)
            .viewPort(x: 0, y: 0, width: 320, height: 70)
            .fill(0x317AF7)
            .stroke(Color.Black)
            .strokeWidth(10)

            Shape() {
                Rect()
                    .width(300)
                    .height(50)
            }
            .width(350)
            .height(80)
            .viewPort(x: -5, y: -5, width: 320, height: 70)
            .fill(0x317AF7)
            .stroke(Color.Black)
            .strokeWidth(10)

            Text("path")
                .fontSize(11)
                .fontColor(0xCCCCCC)
                .width(320)
            // 在Shape的(0, -5)点绘制一条直线路径,颜色0xEE8443,线条宽度10,线条间隙20
            Shape() {
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
            }
            .width(350)
            .height(20)
            .viewPort(x: 0, y: -5, width: 300, height: 20)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeDashArray([20])
            // 在Shape的(0, -5)点绘制一条直线路径,颜色0xEE8443,线条宽度10,线条间隙20,向左偏移10
            Shape() {
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
            }
            .width(350)
            .height(20)
            .viewPort(x: 0, y: -5, width: 300, height: 20)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeDashArray([20])
            .strokeDashOffset(10)
            // 在Shape的(0, -5)点绘制一条直线路径,颜色0xEE8443,线条宽度10,透明度0.5
            Shape() {
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
            }
            .width(350)
            .height(20)
            .viewPort(x: 0, y: -5, width: 300, height: 20)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeOpacity(0.5)
            // 在Shape的(0, -5)点绘制一条直线路径,颜色0xEE8443,线条宽度10,线条间隙20,线条两端样式为半圆
            Shape() {
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
            }
            .width(350)
            .height(20)
            .viewPort(x: 0, y: -5, width: 300, height: 20)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeDashArray([20])
            .strokeLineCap(LineCapStyle.Round)
            // 在Shape的(-20, -5)点绘制一个封闭路径,颜色0x317AF7,线条宽度10,边框颜色0xEE8443,拐角样式锐角（初始值）
            Shape() {
                Path()
                    .width(200)
                    .height(60)
                    .commands("M0 0 L400 0 L400 150 Z")
            }
            .width(300)
            .height(200)
            .viewPort(x: -20, y: -5, width: 310, height: 90)
            .fill(0x317AF7)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeLineJoin(LineJoinStyle.Miter)
            .strokeMiterLimit(5.0)
        }.width(100.percent).margin(top: 15)
    }
}
```

![shape2](./figures/shape2.png)
