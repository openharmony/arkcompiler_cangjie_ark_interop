# TextInput

单行文本输入框组件。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(ResourceStr, ResourceStr, TextInputController)

```cangjie
public init(placeholder!: ResourceStr = "", text!: ResourceStr = "", controller!: TextInputController = TextInputController())
```

**功能：** 创建TextInput组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|placeholder|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""|**命名参数。** 无输入时的提示文本。|
|text|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""|**命名参数。**。 输入框当前的文本内容。建议通过onChange事件将状态变量与文本实时绑定，避免组件刷新时TextInput中的文本内容异常。|
|controller|[TextInputController](#class-textinputcontroller)|否|TextInputController()|**命名参数。** TextInput控制器。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func caretColor(ResourceColor)

```cangjie
public func caretColor(value: ResourceColor): This
```

**功能：** 设置输入框光标颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|输入框光标颜色。<br>初始值：0xFF0A59F7。|

### func customKeyboard(CustomBuilder, Bool)

```cangjie
public func customKeyboard(value: CustomBuilder, supportAvoidance!: Bool = false): This
```

**功能：** 设置自定义键盘。

> **说明：**
>
> - 当设置自定义键盘时，输入框激活后不会打开系统输入法，而是加载指定的自定义组件。
> - 自定义键盘的高度可以通过自定义组件根节点的height属性设置，宽度不可设置，使用系统默认值。
> - 自定义键盘采用覆盖原始界面的方式呈现，当没有开启避让模式或者输入框不需要避让的场景不会对应用原始界面产生压缩或者上提。
> - 自定义键盘无法获取焦点，但是会拦截手势事件。
> - 默认在输入控件失去焦点时，关闭自定义键盘，开发者也可以通过[TextInputController](#class-textinputcontroller).[stopEditing](#func-stopediting)方法控制键盘关闭。
> - 如果设备支持拍摄输入，设置自定义键盘后，该输入框会不支持拍摄输入。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-|自定义键盘。使用时结合[@Builder](../../../application-dev/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|
|supportAvoidance|Bool|否|false|**命名参数。** 自定义键盘是否支持避让功能。|

### func enableKeyboardOnFocus(Bool)

```cangjie
public func enableKeyboardOnFocus(value: Bool): This
```

**功能：** 设置TextInput通过点击以外的方式获焦时，是否主动拉起软键盘。获焦默认绑定输入法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|通过点击以外的方式获焦时，是否主动拉起软键盘。<br>初始值：true。|

### func enterKeyType(EnterKeyType)

```cangjie
public func enterKeyType(value: EnterKeyType): This
```

**功能：** 设置输入法回车键类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[EnterKeyType](#enum-enterkeytype)|是|-|输入法回车键类型。<br>初始值：EnterKeyType.Done。|

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
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|字体颜色。<br/>初始值：0xE5000000。|

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
|value|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|字体列表。默认字体'HarmonyOS Sans'。应用当前支持'HarmonyOS Sans'字体和[注册自定义字体](./cj-text-input-text.md)。|

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
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|字体大小。Length为Int64、Float64类型时，使用fp单位。不支持设置百分比字符串。<br/>初始值：16.fp。|

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
|value|[FontStyle](./cj-common-types.md#enum-fontstyle)|是|-|字体样式。 初始值：FontStyle.Normal。|

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
|value|[FontWeight](./cj-common-types.md#enum-fontweight)|是|-|文本的字体粗细。<br/>初始值：FontWeight.Normal。|

### func inputFilter(ResourceStr, ?(String) -> Unit)

```cangjie
public func inputFilter(value: ResourceStr, error!: ?(String) -> Unit = None): This
```

**功能：** 通过正则表达式设置输入过滤器。

> **说明：**
>
> 匹配表达式的输入允许显示，不匹配的输入将被过滤。仅支持单个字符匹配，不支持字符串匹配。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|**命名参数。** 正则表达式。|
|error|?(String)->Unit|否|None|**命名参数。** 正则匹配失败时，返回被过滤的内容。|

### func maxLength(UInt32)

```cangjie
public func maxLength(value: UInt32): This
```

**功能：** 设置文本的最大输入字符数。

> **说明：**
>
> 默认不设置最大输入字符数限制。到达文本最大字符限制，将无法继续输入字符，同时边框变为红色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|UInt32|是|-|文本的最大输入字符数。|

### func maxLines(Int32)

```cangjie
public func maxLines(value: Int32): This
```

**功能：** 设置内联输入风格编辑态时文本可显示的最大行数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|内联输入风格编辑态时文本可显示的最大行数。<br>初始值：3。<br>取值范围：(0, +∞)。|

### func placeholderColor(ResourceColor)

```cangjie
public func placeholderColor(value: ResourceColor): This
```

**功能：** 设置placeholder文本颜色。InputType设置为Password后，设置placeholderColor不生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|placeholder文本颜色。<br>初始值：跟随主题。|

### func placeholderFont(Length, FontWeight, String, FontStyle)

```cangjie
public func placeholderFont(size!: Length, weight!: FontWeight = FontWeight.W400, family!: String = "",
    style!: FontStyle = FontStyle.Normal): This
```

**功能：** 设置placeholder文本样式，包括字体大小，字体粗细，字体族，字体风格。当前支持'HarmonyOS Sans'字体和[注册自定义字体](./cj-text-input-text.md)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|**命名参数。** 文本尺寸。 单位：fp。<br>初始值：16.fp。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.W400|**命名参数。** 文本的字体粗细。|
|family|String|否|""|**命名参数。** 文本的字体列表。|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal|**命名参数。** 文本的字体样式。|

### func selectionMenuHidden(Bool)

```cangjie
public func selectionMenuHidden(value: Bool): This
```

**功能：** 设置是否隐藏系统文本选择菜单。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否不弹出系统文本选择菜单。<br/>设置为true时，单击输入框光标、长按输入框、双击输入框、三击输入框或者右键输入框，隐藏系统文本选择菜单。<br/>设置为false时，显示系统文本选择菜单。<br>初始值：false。|

### func showUnderline(Bool)

```cangjie
public func showUnderline(value: Bool): This
```

**功能：** 设置是否开启下划线。

> **说明：**
>
> 下划线默认颜色为0x33182431，默认粗细为1.px，文本框尺寸48.vp，下划线只支持InputType.Normal类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否开启下划线。true表示开启，false表示不开启。<br>初始值：false。|

### func style(TextInputStyle)

```cangjie
public func style(value: TextInputStyle): This
```

**功能：** 设置输入框为默认风格或内联输入风格，内联输入风格只支持InputType.Normal类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[TextInputStyle](#enum-textinputstyle)|是|-|输入框为默认风格或内联输入风格。<br>初始值:TextInputStyle.Default。|

### func textAlign(TextAlign)

```cangjie
public func textAlign(value: TextAlign): This
```

**功能：** 设置文本在输入框中的水平对齐方式。

> **说明：**
>
> - 仅支持TextAlign.Start、TextAlign.Center和TextAlign.End。
> - 可通过[align](./cj-universal-attribute-location.md#func-alignalignment)属性控制文本段落在垂直方向上的位置，此组件中不可通过align属性控制文本段落在水平方向上的位置，即align属性中Alignment.TopStart、Alignment.Top、Alignment.TopEnd效果相同，控制内容在顶部，Alignment.Start、Alignment.Center、Alignment.End效果相同，控制内容垂直居中，Alignment.BottomStart、Alignment.Bottom、Alignment.BottomEnd效果相同，控制内容在底部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[TextAlign](./cj-common-types.md#enum-textalign)|是|-|水平对齐方式。仅支持TextAlign.Start、TextAlign.Center和TextAlign.End。<br>初始值:TextAlign.Start。|

## 组件事件

### func onChange((String) -> Unit)

```cangjie
public func onChange(callback: (String) -> Unit): This
```

**功能：** 输入内容发生变化时，触发该事件。

> **说明：**
>
> 在本事件中，若执行了光标操作，需要开发者在预上屏场景下依据previewText参数调整光标逻辑，以适应预上屏场景。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(String)->Unit|是|-|回调函数，文本内容改变时触发。参数：返回当前的文本内容。|

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
|callback|(String)->Unit|是|-|回调函数，复制时触发。参数：返回复制的文本内容。|

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

### func onEditChange((Bool) -> Unit)

```cangjie
public func onEditChange(callback: (Bool) -> Unit): This
```

**功能：** 输入状态变化时，触发该事件。

> **说明：**
>
> 有光标时为编辑态，无光标时为非编辑态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(Bool)->Unit|是|-|回调函数，编辑状态改变时触发。参数：返回当前编辑状态。参数为true表示正在输入。|

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
|callback|(String)->Unit|是|-|回调函数，粘贴时触发。参数：返回粘贴的文本内容。|

### func onSubmit((EnterKeyType) -> Unit)

```cangjie
public func onSubmit(callback: (EnterKeyType) -> Unit): This
```

**功能：** 按下输入法回车键触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([EnterKeyType](#enum-enterkeytype))->Unit|是|-|回调函数，回车键或者软键盘回车键触发该回调。参数：当前软键盘回车键类型。|

## 基础类型定义

### class TextInputController

```cangjie
public class TextInputController {
    public init()
}
```

**功能：** TextInput组件的控制器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init()

```cangjie
public init()
```

**功能：** 创建TextInputController类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func caretPosition(Int32)

```cangjie
public func caretPosition(value: Int32): Unit
```

**功能：** 设置输入光标的位置。当取值小于0时，取0，大于文本长度时，显示在文本末尾。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|从字符串开始到光标所在位置的字符长度。|

#### func setTextSelection(Int32, Int32, MenuPolicy)

```cangjie
public func setTextSelection(selectionStart: Int32, selectionEnd: Int32, options!: MenuPolicy = MenuPolicy.Default): Unit
```

**功能：** 组件在获焦状态下，调用该接口设置文本选择区域并高亮显示，且只有在selectionStart小于selectionEnd时，文字才会被选取并高亮显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|selectionStart|Int32|是|-|文本选择区域起始位置，文本框中文字的起始位置为0。<br/>当selectionStart小于0时、按照0处理；当selectionStart大于文字最大长度时、按照文字最大长度处理。|
|selectionEnd|Int32|是|-|文本选择区域结束位置。<br/>当selectionEnd小于0时、按照0处理；当selectionEnd大于文字最大长度时、按照文字最大长度处理。|
|options|[MenuPolicy](./cj-common-types.md#enum-menupolicy)|否|MenuPolicy.Default|**命名参数。** 选中文字时的配置。|

#### func stopEditing()

```cangjie
public func stopEditing(): Unit
```

**功能：** 退出编辑态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## enum EnterKeyType

```cangjie
public enum EnterKeyType <: Equatable<EnterKeyType> {
    | Go
    | EntrySearch
    | Send
    | Next
    | Done
    | Previous
    | NewLine
    | ...
}
```

**功能：** 表示键盘操作按钮的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<EnterKeyType>

### Done

```cangjie
Done
```

**功能：** 表示显示为完成样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### EntrySearch

```cangjie
EntrySearch
```

**功能：** 表示显示为搜索样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Go

```cangjie
Go
```

**功能：** 表示显示Go文本。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### NewLine

```cangjie
NewLine
```

**功能：** 表示显示为换行样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Next

```cangjie
Next
```

**功能：** 表示显示为下一个样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Previous

```cangjie
Previous
```

**功能：** 表示显示为上一个样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Send

```cangjie
Send
```

**功能：** 表示显示为发送样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(EnterKeyType)

```cangjie
public operator func !=(other: EnterKeyType): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[EnterKeyType](#enum-enterkeytype)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(EnterKeyType)

```cangjie
public operator func ==(other: EnterKeyType): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[EnterKeyType](#enum-enterkeytype)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum InputType

```cangjie
public enum InputType <: Equatable<InputType> {
    | Normal
    | Number
    | Email
    | Password
    | PhoneNumber
    | ...
}
```

**功能：** 表示输入框的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<InputType>

### Email

```cangjie
Email
```

**功能：** 表示e-mail地址输入模式，仅能输入标准邮箱格式支持的字符。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** 表示基本输入模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Number

```cangjie
Number
```

**功能：** 表示纯数字输入模式，仅能输入表示数字的字符。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Password

```cangjie
Password
```

**功能：** 表示密码输入模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### PhoneNumber

```cangjie
PhoneNumber
```

**功能：** 表示电话号码输入模式。支持输入数字、空格、+ 、-、*、#、(、)，长度不限。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(InputType)

```cangjie
public operator func !=(other: InputType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[InputType](#enum-inputtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(InputType)

```cangjie
public operator func ==(other: InputType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[InputType](#enum-inputtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum TextInputStyle

```cangjie
public enum TextInputStyle {
    | Default
    | Inline
    | ...
}
```

**功能：** 表示输入风格。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Default

```cangjie
Default
```

**功能：** 表示默认风格，光标宽1.5.vp，光标高度与文本选中底板高度和字体大小相关。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Inline

```cangjie
Inline
```

**功能：** 表示内联输入风格。文本选中底板高度与输入框高度相同。内联输入适用于需要明显区分编辑状态和非编辑状态的场景，如文件列表视图中的重命名。内联输入不支持`showError`属性，并且在内联模式下不支持拖入文本功能。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

<!--run-->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.PerformanceAnalysisKit.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var text: String = ''
    @State var passwordState: Bool = false
    var controller: TextInputController = TextInputController()

    func build() {
    Column() {
        TextInput(text: this.text, placeholder: 'input your word...', controller: this.controller)
            .placeholderColor(Color.Gray)
            .placeholderFont(size: 14, weight: FontWeight.W100)
            .caretColor(Color.Blue)
            .width(95.percent)
            .height(40)
            .margin(20)
            .fontSize(14)
            .fontColor(Color.Black)
            .inputFilter('[a-z]', error: { info: String =>
              Hilog.error(0, "AppLogCj", "inputFilter error")
            })
            .onChange({ value: String =>
              this.text = value
            })
        Text(this.text)
        Button('Set caretPosition 1')
            .margin(15)
        Button('Get CaretOffset')
            .margin(15)
        // 密码输入框
        TextInput(placeholder: 'input your password...')
            .width(95.percent)
            .height(40)
            .margin(20)
            .maxLength(9)
        // 邮箱地址自动填充类型
        TextInput(placeholder: 'input your email...' )
            .width(95.percent)
            .height(40)
            .margin(20)
            .maxLength(9)
        // 内联风格输入框
        TextInput( text: 'inline style' )
            .width(95.percent)
            .height(50)
            .margin(20)
            .borderRadius(0)
            .style(TextInputStyle.Inline)
            }.
        width(100.percent)
    }
}
```

![textinput](figures/textinput.png)
