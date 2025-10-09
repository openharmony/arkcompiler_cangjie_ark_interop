# Canvas

提供画布组件，用于自定义绘制图形。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

不支持子组件。

## 创建组件

### init(Option\<CanvasRenderingContext2D>)

```cangjie
public init(context: Option<CanvasRenderingContext2D>)
```

**功能：** 初始化一个绘制画布组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|Option<CanvasRenderingContext2D>|是|-|不支持多个Canvas共用一个[CanvasRenderingContext2D](./cj-canvas-drawing-canvasrenderingcontext2d.md#class-canvasrenderingcontext2d)对象，具体描述见[CanvasRenderingContext2D](./cj-canvas-drawing-canvasrenderingcontext2d.md#class-canvasrenderingcontext2d)对象。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件事件

### func onReady(() -> Unit)

```cangjie
public func onReady(callback: () -> Unit): This
```

**功能：** Canvas组件初始化完成时或者Canvas组件发生大小变化时的事件回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|()->Unit|是|-|Canvas组件初始化完成时或者Canvas组件发生大小变化时的事件回调。<br>当该事件被触发时画布被清空，该事件之后Canvas组件宽高确定且可获取，可使用Canvas相关API进行绘制。当Canvas组件仅发生位置变化时，只触发[onAreaChange](./cj-ui-framework.md#func-onareachangeareaarea---unit)事件、不触发onReady事件。[onAreaChange](./cj-ui-framework.md#func-onareachangeareaarea---unit)事件在onReady事件后触发。。|

## 基础类型定义

### class CanvasGradient

```cangjie
public class CanvasGradient {}
```

**功能：** 渐变对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### func addColorStop(Float64, ResourceColor)

```cangjie
public func addColorStop(offset: Float64, color: ResourceColor): Unit
```

**功能：** 设置渐变断点值，包括偏移和颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offset|Float64|是|-|设置渐变点距离起点的位置占总体长度的比例，范围为0到1。设置offset<0或offset>1无渐变效果。|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|设置渐变的颜色。颜色格式参考[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)中string类型说明。未按格式设置颜色无渐变效果。|

### class RenderingContextSettings

```cangjie
public class RenderingContextSettings {
    public var antialias: Bool
    public init(antialias!: Bool = false)
}
```

**功能：** 用来配置CanvasRenderingContext2D对象的参数，包括是否开启抗锯齿。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### var antialias

```cangjie
public var antialias: Bool
```

**功能：** 表明canvas是否开启抗锯齿。

**类型：** Bool

**读写能力：** 可读写

#### init(Bool)

```cangjie
public init(antialias!: Bool = false)
```

**功能：** 用来配置CanvasRenderingContext2D对象的参数，包括是否开启抗锯齿。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|antialias|Bool|否|false| **命名参数。** 表明canvas是否开启抗锯齿。初始值：false|

### class TextMetrics

```cangjie
public class TextMetrics {
    public let width: Float64
    public let height: Float64
}
```

**功能：** 用来描述文本方块的尺寸信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### let height

```cangjie
public let height: Float64
```

**功能：** 文本方块的高度。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### let width

```cangjie
public let width: Float64
```

**功能：** 文本方块的宽度。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

## 示例代码

### 示例1（使用CanvasRenderingContext2D中的方法）

该示例实现了如何在Canvas组件使用CanvasRenderingContext2D中的方法进行绘制。

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    func build() {
        Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Center,
            justifyContent: FlexAlign.Center) {
            Canvas(this.context).width(100.percent).height(100.percent).backgroundColor(0xffff00).onReady(
                {
                => this.context.fillRect(0.0, 30.0, 100.0, 100.0)
            })
        }.width(100.percent).height(100.percent)
    }
}
```

