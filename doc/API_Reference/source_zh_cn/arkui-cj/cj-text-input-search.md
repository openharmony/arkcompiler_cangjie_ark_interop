# Search

提供搜索框组件，用于提供用户搜索内容的输入区域。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(String, String, Option\<AppResource>, Option\<SearchController>)

```cangjie

public init(
    value!: ResourceStr = "",
    placeholder!: ResourceStr = "",
    icon!: Option<AppResource> = Option.None,
    controller!: Option<SearchController> = Option.None
)
```

**功能：** 创建Search组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|ResourceStr|否|""| **命名参数。** 当前显示的搜索文本内容。|
|placeholder|ResourceStr|否|""| **命名参数。** 无输入时的提示文本。|
|icon|Option\<[AppResource](../apis/LocalizationKit/cj-apis-resource.md#class-appresource)>|否|Option.None|搜索图标路径，默认使用系统搜索图标。<br>**说明：** <br>icon的数据源支持本地图片和网络图片。<br> - 支持的图片格式包括png、jpg、bmp、svg、gif、pixelmap和heif。<br> - 支持Base64字符串。格式data:image/[png\|jpeg\|bmp\|webp\| **命名参数。** heif];base64,[base64 data], 其中[base64 data]为Base64字符串数据。<br>如果与属性searchIcon同时设置，则searchIcon优先。|
|controller|[SearchController](#class-searchcontroller)|否|Option.None| **命名参数。** Search组件控制器。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func copyOption(CopyOptions)

```cangjie

public func copyOption(value: CopyOptions): This
```

**功能：** 设置输入的文本是否可复制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[CopyOptions](./cj-common-types.md#enum-copyoptions)|是|-|search组件的复制选项。<br>初始值：CopyOptions.LocalDevice，支持设备内复制。|

### func placeholderColor(ResourceColor)

```cangjie

public func placeholderColor(value: ResourceColor): This
```

**功能：** 设置placeholder文本颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|目标颜色。<br>初始值：0x99000000。|

### func placeholderFont(Length, FontWeight, FontStyle, ResourceStr)

```cangjie

public func placeholderFont(
    size!: Length = 16.fp,
    weight!: FontWeight = FontWeight.W400,
    style!: FontStyle = FontStyle.Normal,
    family!: ResourceStr = ""
): This
```

**功能：** 设置placeHolder的样式，包括字体大小，字体粗细，字体族，字体风格。当前支持'HarmonyOS Sans'字体和[注册自定义字体](./cj-apis-font.md)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|16.fp| **命名参数。** placeholder的文本尺寸。Length为Int64、Float64类型时，使用fp单位。支持设置百分比字符串。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.W400| **命名参数。** placeholder字体的目标粗细。|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal| **命名参数。** placeholder字体的目标样式。|
|family|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。** placeholder字体的样式族。|

### func searchButton(String)

```cangjie
public func searchButton(value: ResourceStr): This
```

**功能：** 设置搜索框末尾搜索按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|ResourceStr|是|-|搜索框末尾搜索按钮文本内容。|

### func textFont(Length, FontWeight, FontStyle, ResourceStr)

```cangjie

public func textFont(
    size!: Length = 16.fp,
    weight!: FontWeight = FontWeight.W400,
    style!: FontStyle = FontStyle.Normal,
    family!: ResourceStr = ""
): This
```

**功能：** 设置搜索框内输入文本样式，包括字体大小，字体粗细，字体族，字体风格。目前仅支持默认字体族。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|16.fp| **命名参数。** 文本尺寸。Length为Int64、Float64类型时，使用fp单位。支持设置百分比字符串。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.W400| **命名参数。** 输入字体的目标粗细。|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal| **命名参数。** 输入字体的目标样式。|
|family|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""| **命名参数。** 输入字体的样式族。|

## 组件事件

### func onChange((String) -> Unit)

```cangjie

public func onChange(callback: (String) -> Unit): This
```

**功能：** 输入内容发生变化时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(String)->Unit|是|-|回调函数，当前输入文本内容变化时触发。|

### func onCopy((String) -> Unit)

```cangjie

public func onCopy(callback: (String) -> Unit): This
```

**功能：** 进行复制操作时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(String)->Unit|是|-|回调函数，剪切时触发。参数：返回剪切的文本内容。|

### func onCut((String) -> Unit)

```cangjie

public func onCut(callback: (String) -> Unit): This
```

**功能：** 进行剪切操作时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(String)->Unit|是|-|回调函数，剪切时触发。参数：返回剪切的文本内容。|

### func onPaste((String) -> Unit)

```cangjie

public func onPaste(callback: (String) -> Unit): This
```

**功能：** 进行粘贴操作时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(String)->Unit|是|-|回调函数，组件触发系统剪切板粘贴操作时触发。|

### func onSubmit((String) -> Unit)

```cangjie

public func onSubmit(callback: (String) -> Unit): This
```

**功能：** 点击搜索图标、搜索按钮或者按下软键盘搜索按钮时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(String)->Unit|是|-|回调函数，提交搜索内容时触发。参数：当前搜索框中输入的文本内容。|

## 基础类型定义

### class SearchController

```cangjie
public class SearchController TextContentControllerBase{

    public init()
}
```

**功能：** Search组件的控制器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init()

```cangjie

public init()
```

**功能：** 创建SearchController类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func caretPosition(Int32)

```cangjie

public func caretPosition(value: Int32): Unit
```

**功能：** 设置输入光标的位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|从字符串开始到光标所在位置的字符长度。|

## 示例代码

<!--run-->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var changeValue: String = ""
    @State var submitValue: String = ""

    let controller = SearchController()
    func build() {
        Flex(direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center) {
          Text(submitValue)
          Text(changeValue)
          Search(value: "", placeholder: "Type to search", controller: controller)
            //设置搜索框末尾搜索按钮文本内容为"SearchBtn"
            .searchButton("SearchBtn")
            //宽300，高35
            .width(300)
            .height(35)
            //设置搜索组件背景色
            .backgroundColor(0xDDDDDD)
            //设置palaceholder文本颜色
            .placeholderColor(0x000000)
            //设置placeholder文本样式
            .placeholderFont(size: 26.px, weight: FontWeight.W100, family: "serif", style: FontStyle.Normal)
            .onSubmit({value =>
              submitValue = value
            })
            .onChange({value =>
              changeValue = value
            })
            //设置外边距，组件上部距父容器30vp
            .margin(top: 30)
            .id("searchComponent")
        }
    }
}
```

![search](figures/search.png)
