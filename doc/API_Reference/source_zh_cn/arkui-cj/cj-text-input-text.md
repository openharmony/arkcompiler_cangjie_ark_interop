# Text

显示一段文本的组件。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

可以包含[Span](./cj-text-input-span.md#span)、[ImageSpan](./cj-text-input-imagespan.md#imagespan)子组件。

## 创建组件

### init(ResourceStr, TextController)

```cangjie
public init(content: ResourceStr, controller!: TextController = TextController())
```

**功能：** 创建Text组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|content|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|文本内容，引入系统资源或者应用资源中的文本。|
|controller|[TextController](#class-textcontroller)|否|TextController()|**命名参数。** Text组件的控制器。|

### init(ResourceStr, TextController, () -> Unit)

```cangjie
public init(content: ResourceStr, controller!: TextController = TextController(), child!: () -> Unit)
```

**功能：** 创建Text组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|content|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|文本内容。包含子组件Span且未设置属性字符串时不生效，显示Span内容，并且此时text组件的样式不生效。<br/>初始值：''。|
|controller|[TextController](#class-textcontroller)|否|TextController()|**命名参数。** Text组件的控制器。|
|child|()->Unit|否|{ =>}|Text的子组件。|

### init(TextController, () -> Unit)

```cangjie
public init(controller!: TextController = TextController(), child!: () -> Unit)
```

**功能：** 创建Text组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|controller|[TextController](#class-textcontroller)|否|TextController()|**命名参数。** Text组件的控制器。|
|child|()->Unit|是|-|Text的子组件。|

### init(TextController)

```cangjie
public init(controller!: TextController = TextController())
```

**功能：** 创建Text组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|controller|[TextController](#class-textcontroller)|否|TextController()|**命名参数。** Text组件的控制器。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func baselineOffset(Length)

```cangjie
public func baselineOffset(value: Length): This
```

**功能：** 设置文本基线的偏移量。

> **说明：**
>
> - 正数内容向上偏移，负数向下偏移。
> - 设置该值为百分比时，按默认值显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|文本基线的偏移量。设置该值为百分比时，按默认值显示。<br>初始值：0。|

### func decoration(TextDecorationType, ResourceColor, TextDecorationStyle)

```cangjie
public func decoration(decorationType!: TextDecorationType, color!: ResourceColor,
    decorationStyle!: TextDecorationStyle = TextDecorationStyle.Solid): This
```

**功能：** 设置文本装饰线样式及其颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|decorationType|[TextDecorationType](./cj-common-types.md#enum-textdecorationtype)|是|-| **命名参数。** 文本装饰线样式。<br>初始值：TextDecorationType.None。|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|**命名参数。** 文本装饰线颜色。<br>初始值：Color.Black。|
|decorationStyle|[TextDecorationStyle](./cj-common-types.md#enum-textdecorationstyle)|否|TextDecorationStyle.Solid|**命名参数。** 文本装饰线样式。|

### func fontColor(ResourceColor)

```cangjie
public func fontColor(value: ResourceColor): This
```

**功能：** 设置字体颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|使用引入资源的方式设置字体颜色。<br>初始值：'e6182431'。|

### func fontFamily(ResourceStr)

```cangjie
public func fontFamily(value: ResourceStr): This
```

**功能：** 设置字体列表。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|字体列表。默认字体'HarmonyOS Sans'。|

### func fontSize(Length)

```cangjie
public func fontSize(value: Length): This
```

**功能：** 设置字体大小。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|字体大小。不支持百分比单位。<br>初始值：16.fp。|

### func fontStyle(FontStyle)

```cangjie
public func fontStyle(value: FontStyle): This
```

**功能：** 设置字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FontStyle](./cj-common-types.md#enum-fontstyle)|是|-|字体样式。<br>初始值：FontStyle.Normal。|

### func fontWeight(FontWeight)

```cangjie
public func fontWeight(value: FontWeight): This
```

**功能：** 设置文本的字体粗细，设置过大可能会在不同字体下有截断。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FontWeight](./cj-common-types.md#enum-fontweight)|是|-|文本的字体粗细。<br>初始值：FontWeight.Normal。|

### func lineHeight(Length)

```cangjie
public func lineHeight(value: Length): This
```

**功能：** 根据Length设置文本的文本行高。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|文本的文本行高，设置值不大于 0 时，不限制文本行高，自适应字体大小。|

### func lineSpacing(Length)

```cangjie
public func lineSpacing(value: Length): This
```

**功能：** 设置文本的行间距，设置值不大于0时，取默认值0。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|文本的行间距。<br>初始值：0。|

### func maxFontSize(Length)

```cangjie
public func maxFontSize(value: Length): This
```

**功能：** 根据Length设置文本最大显示字号。

> **说明：**
>
> - 需配合[minFontSize](#func-minfontsizelength)以及[maxLines](#func-maxfontsizelength)或布局大小限制使用，单独设置不生效，对子组件和属性字符串不生效。
> - 自适应字号生效时，fontSize设置不生效。
> - maxFontSize小于或等于0时，自适应字号不生效，此时按照[fontSize](#func-fontsizelength)属性的值生效，未设置时按照其默认值生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|文本最大显示字号。单位：fp。|

### func maxLines(Int32)

```cangjie
public func maxLines(value: Int32): This
```

**功能：** 设置文本的最大行数。

> **说明：**
>
> 默认情况下，文本是自动折行的，如果指定此属性，则文本最多不会超过指定的行。如果有多余的文本，可以通过[textOverflow](#func-textoverflowtextoverflow)来指定截断方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|文本的最大行数。|

### func minFontSize(Length)

```cangjie
public func minFontSize(value: Length): This
```

**功能：** 根据Length设置文本最小显示字号。

> **说明：**
>
> - 需配合[maxFontSize](#func-maxfontsizelength)以及[maxLines](#func-maxlinesint32)或布局大小限制使用，单独设置不生效，对子组件和属性字符串不生效。
> - 自适应字号生效时，fontSize设置不生效。
> - minFontSize小于或等于0时，自适应字号不生效，此时按照[fontSize](#func-fontsizelength)属性的值生效，未设置时按照其默认值生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|文本最小显示字号。单位：fp。|

### func textAlign(TextAlign)

```cangjie
public func textAlign(value: TextAlign): This
```

**功能：** 设置文本段落在水平方向的对齐方式。

> **说明：**
>
> - 文本段落宽度占满Text组件宽度。
> - 可通过[align](./cj-universal-attribute-location.md#func-alignalignment)属性控制文本段落在垂直方向上的位置，此组件中不可通过align属性控制文本段落在水平方向上的位置，具体效果如下：
Alignment.TopStart、Alignment.Top、Alignment.TopEnd：内容顶部对其。
Alignment.Start、Alignment.Center、Alignment.End：内容垂直居中。
Alignment.BottomStart、Alignment.Bottom、Alignment.BottomEnd：内容底部对齐。
> - 当textAlign属性设置为TextAlign.JUSTIFY时，需要根据文本内容设置[wordBreak](./cj-common-types.md#enum-wordbreak)属性，且最后一行文本不参与两端对齐，为水平对齐首部效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[TextAlign](./cj-common-types.md#enum-textalign)|是|-|多行文本的文本对齐方式。<br>初始值：TextAlign.Start。|

### func textCase(TextCase)

```cangjie
public func textCase(value: TextCase): This
```

**功能：** 设置文本大小写。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[TextCase](./cj-common-types.md#enum-textcase)|是|-|文本大小写。<br>初始值：TextCase.Normal。|

### func textOverflow(TextOverflow)

```cangjie
public func textOverflow(value: TextOverflow): This
```

**功能：** 设置文本超长时的显示方式。

> **说明：**
>
> - 文本截断是按字截断。例如，英文以单词为最小单位进行截断，若需要以字母为单位进行截断，可在字母间添加零宽空格：\u200B。从API version 11开始，建议优先组合wordBreak属性设置为WordBreak.BREAK_ALL方式实现字母为单位进行截断。
> - 当overflow设置为TextOverflow.None、TextOverflow.Clip、TextOverflow.Ellipsis时，需配合maxLines使用，单独设置不生效。设置TextOverflow.None与TextOverflow.Clip效果一样。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[TextOverflow](./cj-common-types.md#enum-textoverflow)|是|-|文本超长时的显示方式，需配合maxLines使用，单独设置不生效。<br>初始值：TextOverflow.Clip。|

## 基础类型定义

### class ShadowOptions

```cangjie
public class ShadowOptions {
    public var radius: Float64
    public var shadowType: ShadowType
    public var color: ResourceColor
    public var offsetX: Float64
    public var offsetY: Float64
    public var fill: Bool
    public init(
        radius!: Float64,
        shadowType!: ShadowType = ShadowType.Color,
        color!: ResourceColor = Color.Black,
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0,
        fill!: Bool = false
    )
}
```

**功能：** 阴影选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var color

```cangjie
public var color: ResourceColor
```

**功能：** 设置阴影颜色。

**类型：** [ResourceColor](cj-common-types.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fill

```cangjie
public var fill: Bool
```

**功能：** 设置阴影是否填充。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offsetX

```cangjie
public var offsetX: Float64
```

**功能：** 设置阴影的水平偏移量。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offsetY

```cangjie
public var offsetY: Float64
```

**功能：** 设置阴影的垂直偏移量。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var radius

```cangjie
public var radius: Float64
```

**功能：** 设置阴影的模糊半径。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var shadowType

```cangjie
public var shadowType: ShadowType
```

**功能：** 设置阴影类型。

**类型：** [ShadowType](cj-common-types.md#enum-shadowtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Float64, ShadowType, ResourceColor, Float64, Float64, Bool)

```cangjie
public init(
    radius!: Float64,
    shadowType!: ShadowType = ShadowType.Color,
    color!: ResourceColor = Color.Black,
    offsetX!: Float64 = 0.0,
    offsetY!: Float64 = 0.0,
    fill!: Bool = false
)
```

**功能：** 构造一个ShadowOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|radius|Float64|是|-|设置阴影的模糊半径。|
|shadowType|[ShadowType](cj-common-types.md#enum-shadowtype)|否|ShadowType.Color|设置阴影类型。|
|color|[ResourceColor](cj-common-types.md#interface-resourcecolor)|否|Color.Black|设置阴影颜色。|
|offsetX|Float64|否|0.0|设置阴影的水平偏移量。|
|offsetY|Float64|否|0.0|设置阴影的垂直偏移量。|
|fill|Bool|否|false|设置阴影是否填充。|

### class TextController

```cangjie
public class TextController {
    public init()
}
```

**功能：** Text组件的控制器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init()

```cangjie
public init()
```

**功能：** 创建TextController类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func closeSelectionMenu()

```cangjie
public func closeSelectionMenu(): Unit
```

**功能：** 关闭自定义选择菜单或系统默认选择菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

<!--run-->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.*
import ohos.arkui.component.CopyOptions as MyCopyOptions
import std.collection.ArrayList
import std.ast.Block

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello"
    let controller: TextController = TextController()
    @State var shadowOptionsArray: Array<ShadowOptions> = [ShadowOptions(radius: 10.0), ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, color: Color.Red, offsetX: 1.0, offsetY: 1.0, fill: true)]
    @Builder func LongPressTextCustomMenu() {
        Column() {
            Button('LongPress')
        }
    }

    @Builder func RightClickTextCustomMenu() {
        Column() {
            Button('RightClick')
        }
    }

    @Builder func SelectTextCustomMenu() {
        Column() {
            Button('Select')
        }
    }

    func build() {
        Scroll() {
            Column {
                //展示设置的文本样式效果
                Text(message)
                    .fontFamily(@r(app.string.fontFamily))
                    .height(100.vp)
                    .width(100.vp)
                    .id("textComponent1")
                Text(message)
                    .fontSize(20)
                    .fontColor(0XFFFF0000)
                    .fontStyle(FontStyle.Italic)
                    .fontWeight(FontWeight.W900)
                    .id("textComponent2")
                //设置文本行高
                Blank(min: 10)
                Text(message)
                    .textAlign(TextAlign.End).baselineOffset(10.vp)
                    .id("textComponent3")
                    .minFontSize(@r(app.string.font_size))
                    .lineHeight(@r(app.string.line_height))

                Text(message)
                    .decoration(decorationType: TextDecorationType.None, color: Color.Red)
                    .id("textComponent4")
                //设置文本基线偏移
                Text(
                    "This is the text with the height adaptive policy set.This is the text with the height adaptive policy set."
                )
                    .minFontSize(10.fp)
                    .maxFontSize(30.fp)
                    .maxLines(1).id("textComponent5")
                    .baselineOffset(@r(app.string.baselineOffset))
                    .fontColor(@r(app.color.blue_23C452))
                //设置文本超长时的显示方式
                Text(
                    "This is the text with the height adaptive policy set.This is the text with the height adaptive policy set"
                )
                    .fontSize(24.vp)
                    .maxLines(1)
                    .textOverflow(TextOverflow.Ellipsis)
                    .id("textComponent6")
                //设置文本全大写显示
                Text("Hello")
                    .textCase(TextCase.UpperCase)
                    .id("textComponent7")
                    .maxFontSize(@r(app.string.font_size))
                //设置文本全小写显示
                Text("Hello")
                    .foregroundColor(Color.Blue)
                    .id("textComponent8")
                    .fontSize(@r(app.string.font_size))
                    .textOverflow(TextOverflow.None)
                    .textCase(TextCase.LowerCase)
                //触摸热区设置
                Text("Hello")
                    .responseRegion(Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent))
                    .responseRegion([Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent),Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent)])
                Text('This is the text content with given settings. This is the text content with given settings')
                    .baselineOffset(10)
                    .decoration(decorationType: TextDecorationType.Underline, color: Color.Red, decorationStyle: TextDecorationStyle.Dotted)
                    .fontColor(Color.Red)
                    .fontFamily("HarmonyOS Sans")
                    .fontSize(10.fp)
                    .fontStyle(FontStyle.Italic)
                    .fontWeight(FontWeight.Bolder)
                    .lineHeight(40)
                    .lineSpacing(20)
                    .maxLines(1)
                    .textAlign(TextAlign.Center)
                    .textCase(TextCase.LowerCase)
                    .textOverflow(TextOverflow.None)
                    .id("TextGivenSetting")
                //展示文本设置样式的效果
                Text('This is the text content with given font settings.')
                    .size(width:15, height: 15)
                    .fontWeight(FontWeight.Bolder)
                    .fontFamily('HarmonyOS Sans')
                    .fontStyle(FontStyle.Italic)
                    .decoration(decorationType: TextDecorationType.LineThrough, color: Color.Red, decorationStyle: TextDecorationStyle.Dashed)
                    .textCase(TextCase.UpperCase)
                    .id("TextGivenFont")
                //以资源调用的形式设置文本效果并展示
                Text(@r(app.string.module_desc))
                    .fontSize(@r(app.string.font_size))
                    .maxFontSize(@r(app.string.font_size))
                    .minFontSize(@r(app.string.font_size))
                    .fontFamily(@r(app.string.fontFamily))
                    .lineHeight(@r(app.string.line_height))
                    .baselineOffset(@r(app.string.baselineOffset))
                    .fontColor(@r(app.color.blue_23C452))
                    .id("TextResource")

                Text('邮箱：xxx@xxxxxx.com')
                    .textOverflow(TextOverflow.None)
                    .id("TextDetectConfig4")
                //展示默认样式的字体效果
                Text('This is the text content with default settings.')
                    .id("TextDefault1")
                //设置文本偏移
                Text('This is the text content with percent baselineOffset.')
                    .baselineOffset(10.percent)
                    .decoration(decorationType: TextDecorationType.Overline, color: Color.Red, decorationStyle: TextDecorationStyle.Double)
                    .id("TextBoundaryValue1")
                //展示用百分比设置文字大小的效果
                Text('This is the text content with percent fontSize.')
                    .fontSize(10.percent)
                    .id("TextBoundaryValue4")
                //展示文本行高为负值时的效果
                Text('This is the text content with -10 lineHeight.')
                    .lineHeight(-10)
                    .fontSize(20)
                    .id("TextBoundaryValue6")
                Text('This is the text content with -10 lineSpacing.')
                    .lineSpacing(-10)
                    .id("TextBoundaryValue7")
                //设置文本超长时显示不下的文本用省略号代替
                Text("textOverflow line line line line line line line line line line line line line line line line line.")
                    .textOverflow(TextOverflow.Ellipsis)
                    .maxLines(1)
                    .id("TextCombine1")
                Text("This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content. ")
                    .minFontSize(10)
                    .maxFontSize(30)
                    .maxLines(1)
                    .fontSize(50)
                    .id("TextCombine6")
                Text("This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content. ")
                    .minFontSize(-10)
                    .maxFontSize(30)
                    .maxLines(1)
                    .id("TextCombine7")
            }
        }.height(100.percent).width(100.percent)
    }
}
```

![text](figures/text.gif)
