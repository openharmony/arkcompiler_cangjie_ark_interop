# Span

作为[Text](./cj-text-input-text.md#text)组件的子组件，用于显示行内文本的组件。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(ResourceStr)

```cangjie
public init(value: ResourceStr)
```

**功能：** 创建Span组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|ResourceStr|是|-|文本内容。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func decoration(TextDecorationType, ResourceColor)

```cangjie
public func decoration(decorationType!: TextDecorationType, color!: ResourceColor = Color.Black): This
```

**功能：** 设置文本装饰线样式及其颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|decorationType|[TextDecorationType](./cj-common-types.md#enum-textdecorationtype)|是|-| **命名参数。** 文本装饰线样式。<br>初始值：TextDecorationType.None。|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black| **命名参数。** 文本装饰线颜色。|

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
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|字体颜色。|

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
|value|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|字体列表。|

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
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|字体大小。Length为Int64、Float64类型时，使用fp单位。不支持设置百分比字符串。|

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
|value|[FontWeight](./cj-common-types.md#enum-fontweight)|是|-|文本的字体粗细，设置过大可能会在不同字体下有截断。<br>初始值：FontWeight.Normal。|

### func letterSpacing(Length)

```cangjie
public func letterSpacing(value: Length): This
```

**功能：** 设置文本字符间距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|文本字符间距。单位：fp。|

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

## 示例代码

### 示例1

decoration、textCase、letterSpacing属性接口使用示例。

<!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class EntryView {
    func build() {
        Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start,
                        justifyContent: FlexAlign.SpaceBetween) {
            Text("Basic Usage")
            .fontSize(9)
            .fontColor(0xCCCCCC)
            Text() {
                Span("This is the Span component")
                .fontSize(12)
                //设置文本大小写为保持文本原有大小写
                .textCase(TextCase.Normal)
                //行内文字无修饰
                .decoration(decorationType: TextDecorationType.None, color: Color.Red)
            }
            //文本横线添加
            Text("Text Decoration")
            .fontSize(9)
            .fontColor(0xCCCCCC)
            Text() {
                Span("I am Underline-span")
                //行内文字由红色下划线修饰
                .decoration(decorationType: TextDecorationType.Underline, color: Color.Red)
                .fontSize(12)
            }
            Text() {
                Span("I am LineThrough-span")
                //行内文字由中间红色划线修饰
                .decoration(decorationType: TextDecorationType.LineThrough, color: Color.Red)
                .fontSize(12)
            }
            Text() {
                Span("I am Overline-span")
                //行内文字由红色上划线修饰
                .decoration(decorationType: TextDecorationType.Overline, color: Color.Red)
                .fontSize(12)
            }
            //文本大小写展示
            Text("Text Case").fontSize(9).fontColor(0xCCCCCC)
            Text() {
                Span("I am Lower-span")
                //设置文本大小写为全小写
                .textCase(TextCase.LowerCase)
                .fontSize(12)
                .decoration(decorationType: TextDecorationType.None, color: Color.Red)
            }
            Text() {
                Span("I am Upper-span")
                //设置文本大小写为全大写
                .textCase(TextCase.UpperCase)
                .fontSize(12)
                .decoration(decorationType: TextDecorationType.None, color: Color.Red)
            }
            //文本字符间距展示
            Text() {
                Span("I am LetterSpacing")
                .fontSize(20)
                .decoration(decorationType: TextDecorationType.None, color: Color.Red)
                //设置文本字符间距为10.fp
                .letterSpacing(10)
            }
            Text() {
                Span("I am Span1").fontSize(30)
                .decoration(decorationType: TextDecorationType.None, color: Color.Red)
                Span("I am Span2").fontSize(30)
                .decoration(decorationType: TextDecorationType.None, color: Color.Red)
            }
        }
        .width(100.percent)
        .height(250)
        .padding(left: 35, right: 35, top: 35)
    }
}
```

![span](figures/span.png)
