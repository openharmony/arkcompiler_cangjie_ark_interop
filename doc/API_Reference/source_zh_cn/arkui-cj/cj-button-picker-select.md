# Select

提供下拉选择菜单，可以让用户在多个选项之间选择。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(Array\<SelectOption>)

```cangjie
public init(values: Array<SelectOption>)
```

**功能：** 构造一个下拉选择菜单组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|values|Array\<[SelectOption](#class-selectoption)>|是|-|设置下拉选项。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func arrowPosition(ArrowPosition)

```cangjie
public func arrowPosition(value: ArrowPosition): This
```

**功能：** 设置下拉菜单项的文本与箭头之间的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ArrowPosition](#enum-arrowposition)|是|-|下拉菜单项的文本与箭头之间的对齐方式。<br>初始值：ArrowPosition.END。|

### func font(FontStyle, FontWeight, Length, ResourceStr)

```cangjie
public func font(
    style!: FontStyle = FontStyle.Normal,
    weight!: FontWeight = FontWeight.Medium,
    size!: Length = 16.vp,
    family!: ResourceStr = "sans-serif"
): This
```

**功能：** 设置下拉按钮本身的文本样式。当size为0的时候，文本不显示，当size为负值的时候，文本的size按照初始值显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal|**命名参数。** 用于指定字体样式。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.Medium|**命名参数。** 用于指定字体的粗细。|
|size|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。** 指定字号和行高，不支持百分比设置。|
|family|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|"sans-serif"|**命名参数。** 指定字体系列。|

### func fontColor(ResourceColor)

```cangjie
public func fontColor(value: ResourceColor): This
```

**功能：** 根据指定的Color，设置下拉按钮本身的文本颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|下拉按钮本身的文本颜色。<br>初始值：@r(sys.color.ohos_id_color_text_primary)混合@r(sys.color.ohos_id_alpha_content_primary)的透明度。|

### func menuAlign(MenuAlignType, Offset)

```cangjie
public func menuAlign(alignType!: MenuAlignType, offset!: Offset): This
```

**功能：** 设置下拉按钮与下拉菜单间的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|alignType|[MenuAlignType](#enum-menualigntype)|是|-| **命名参数。** 对齐方式类型。<br/>初始值：MenuAlignType.START。|
|offset|[Offset](./cj-common-types.md#class-offset)|是|-| **命名参数。** 按照对齐类型对齐后，下拉菜单相对下拉按钮的偏移量。<br>初始值：MenuOffset(0, 0)。|

### func menuBackgroundBlurStyle(BlurStyle)

```cangjie
public func menuBackgroundBlurStyle(value: BlurStyle): This
```

**功能：** 设置下拉菜单的背景模糊材质。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|是|-|下拉菜单的背景模糊材质。<br/>初始值：BlurStyle.COMPONENT_ULTRA_THICK。|

### func menuBackgroundColor(ResourceColor)

```cangjie
public func menuBackgroundColor(value: ResourceColor): This
```

**功能：** 根据指定的Color，设置下拉菜单的背景色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|下拉菜单的背景色。<br>初始值：Color.Transparent。|

### func optionBgColor(ResourceColor)

```cangjie
public func optionBgColor(value: ResourceColor): This
```

**功能：** 根据指定的Color，设置下拉菜单项的背景色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|下拉菜单项的背景色。<br>初始值：Color.Transparent。|

### func optionFont(FontStyle, FontWeight, Length, ResourceStr)

```cangjie
public func optionFont(
    style!: FontStyle = FontStyle.Normal,
    weight!: FontWeight = FontWeight.Medium,
    size!: Length = 16.vp,
    family!: ResourceStr = "sans-serif"
): This
```

**功能：** 设置下拉菜单项的文本样式。当size为0的时候，文本不显示，当size为负值的时候，文本的size按照初始值显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal|**命名参数。** 用于指定字体样式。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.Medium|**命名参数。** 用于指定字体的粗细。|
|size|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。** 指定字号和行高，不支持百分比设置。|
|family|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|"sans-serif"|**命名参数。** 指定字体系列。|

### func optionFontColor(ResourceColor)

```cangjie
public func optionFontColor(value: ResourceColor): This
```

**功能：** 根据指定的Color，设置下拉菜单项的文本颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|下拉菜单项的文本颜色。<br>初始值：@r(sys.color.ohos_id_color_text_primary)。|

### func optionHeight(Length)

```cangjie
public func optionHeight(value: Length): This
```

**功能：** 根据指定的Length类型值，设置下拉菜单显示的最大高度。下拉菜单的初始最大高度是屏幕可用高度的80%，设置的菜单最大高度不能超过初始最大高度。

当设置为负数与零时，属性不生效，下拉菜单最大高度设为初始值，即下拉菜单最大高度默认值为屏幕可用高度的80%。

正常值范围大于0。如果下拉菜单所有选项的实际高度没有设定的高度大，下拉菜单的高度按实际高度显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|下拉菜单显示的最大高度。|

### func optionWidth(OptionWidthMode)

```cangjie
public func optionWidth(value: OptionWidthMode): This
```

**功能：** 设置下拉菜单项的宽度。OptionWidthMode类型为枚举类型，OptionWidthMode决定下拉菜单是否继承下拉按钮宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[OptionWidthMode](./cj-common-types.md#enum-optionwidthmode)|是|-|下拉菜单项的宽度。|

### func optionWidth(Length)

```cangjie
public func optionWidth(value: Length): This
```

**功能：** 根据指定的Length类型值，设置下拉菜单项的宽度，不支持设置百分比。

当设置为异常值或小于最小宽度56.vp时，属性不生效，菜单项宽度设为初始值，即菜单初始宽度为2栅格。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|下拉菜单项的宽度。|

### func selected(Int32)

```cangjie
public func selected(value: Int32): This
```

**功能：** 设置下拉菜单初始选项的索引，第一项的索引为0。当不设置selected属性或设置异常值时，初始选择值为-1，菜单项不选中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|下拉菜单初始选项的索引。|

### func selectedOptionBgColor(ResourceColor)

```cangjie
public func selectedOptionBgColor(value: ResourceColor): This
```

**功能：** 根据指定的Color，设置下拉菜单选中项的背景色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|下拉菜单选中项的背景色。<br> 初始值：@r(sys.color.ohos_id_color_component_activated)混合@r(sys.color.ohos_id_alpha_highlight_bg)的透明度。|

### func selectedOptionFont(FontStyle, FontWeight, Length, String)

```cangjie
public func selectedOptionFont(
    style!: FontStyle = FontStyle.Normal,
    weight!: FontWeight = FontWeight.Medium,
    size!: Length = 16.vp,
    family!: String = "sans-serif"
): This
```

**功能：** 设置下拉菜单选中项的文本样式。当size为0的时候，文本不显示，当size为负值的时候，文本的size按照初始值显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|style|[FontStyle](./cj-common-types.md#enum-fontstyle)|否|FontStyle.Normal|**命名参数。** 用于指定字体样式。|
|weight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.Medium|**命名参数。** 用于指定字体的粗细。|
|size|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。** 文本尺寸。不支持百分比设置。|
|family|String|否|"sans-serif"|**命名参数。** 指定字体列表。|

### func selectedOptionFontColor(ResourceColor)

```cangjie
public func selectedOptionFontColor(value: ResourceColor): This
```

**功能：** 根据指定的Color，设置下拉菜单选中项的文本颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|下拉菜单选中项的文本颜色。<br>初始值：@r(sys.color.ohos_id_color_text_primary_activated)|

### func space(Length)

```cangjie
public func space(value: Length): This
```

**功能：** 根据指定的Length类型值，设置下拉菜单项的文本与箭头之间的间距。不支持设置百分比。设置为小于等于8的值，取初始值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|下拉菜单项的文本与箭头之间的间距。<br>初始值：8|

### func value(ResourceStr)

```cangjie
public func value(value: ResourceStr): This
```

**功能：**  设置下拉按钮本身的文本内容。当菜单选中时默认会替换为菜单项文本内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|content|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|下拉按钮本身的文本内容。文本长度大于列宽时，文本被截断。|

## 组件事件

### func onSelect(OnSelectCallback)

```cangjie
public func onSelect(callback: OnSelectCallback): This
```

**功能：** 下拉菜单选中某一项时触发该回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|OnSelectCallback|是|-|选中项的索引和值。|

## 基础类型定义

### class SelectOption

```cangjie
public class SelectOption {
    public var value: ResourceStr
    public var icon: ResourceStr
    public init(value!: ResourceStr, icon!: ResourceStr)
}
```

**功能：** 设置下拉菜单组件参数的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var icon

```cangjie
public var icon: ResourceStr
```

**功能：** 下拉选项图标。

**类型：** ResourceStr

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var value

```cangjie
public var value: ResourceStr
```

**功能：** 下拉选项内容。

**类型：** ResourceStr

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(ResourceStr, ResourceStr)

```cangjie
public init(value!: ResourceStr, icon!: ResourceStr)
```

**功能：** 构造SelectOption对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-| **命名参数。** 下拉选项内容。|
|icon|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-| **命名参数。** 下拉选项图标。|

#### init(String, String)

```cangjie
public init(value: String, icon!: String)
```

**功能：** 构造SelectOption对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|下拉选项内容。|
|icon|String|是|-|**命名参数。** 下拉选项图标。|

#### init(String, AppResource)

```cangjie
public init(value: String, icon!: AppResource)
```

**功能：** 构造SelectOption对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|下拉选项内容。|
|icon|[AppResource](../apis/LocalizationKit/cj-apis-resource.md#class-appresource)|是|-|**命名参数。** 下拉选项图标。|

#### init(AppResource, String)

```cangjie
public init(value: AppResource, icon!: String)
```

**功能：** 构造SelectOption对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AppResource](../apis/LocalizationKit/cj-apis-resource.md#class-appresource)|是|-|下拉选项内容。|
|icon|String|是|-|**命名参数。** 下拉选项图标。|

#### init(AppResource, AppResource)

```cangjie
public init(value: AppResource, icon!: AppResource)
```

**功能：** 构造SelectOption对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AppResource](../apis/LocalizationKit/cj-apis-resource.md#class-appresource)|是|-|下拉选项内容。|
|icon|[AppResource](../apis/LocalizationKit/cj-apis-resource.md#class-appresource)|是|-|**命名参数。** 下拉选项图标。|

### enum ArrowPosition

```cangjie
public enum ArrowPosition <: Equatable<ArrowPosition> {
    | END
    | START
    | ...
}
```

**功能：** 下拉菜单项的文本与箭头之间的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ArrowPosition>

#### END

```cangjie
END
```

**功能：** 文字在前，箭头在后。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### START

```cangjie
START
```

**功能：** 箭头在前，文字在后。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(ArrowPosition)

```cangjie
public operator func !=(other: ArrowPosition): Bool
```

**功能：** 比较两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ArrowPosition](#enum-arrowposition)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等则返回true，否则返回false。|

#### func ==(ArrowPosition)

```cangjie
public operator func ==(other: ArrowPosition): Bool
```

**功能：** 比较两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ArrowPosition](#enum-arrowposition)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等则返回true，否则返回false。|

### enum MenuAlignType

```cangjie
public enum MenuAlignType <: Equatable<MenuAlignType> {
    | START
    | CENTER
    | END
    | ...
}
```

**功能：** 菜单对齐类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<MenuAlignType>

#### CENTER

```cangjie
CENTER
```

**功能：** 居中对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### END

```cangjie
END
```

**功能：** 按照语言方向末端对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### START

```cangjie
START
```

**功能：** 按照语言方向起始端对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(MenuAlignType)

```cangjie
public operator func !=(other: MenuAlignType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MenuAlignType](#enum-menualigntype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

#### func ==(MenuAlignType)

```cangjie
public operator func ==(other: MenuAlignType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MenuAlignType](#enum-menualigntype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## 示例代码

### 示例1（设置下拉菜单）

该示例通过配置SelectOptions实现下拉菜单。

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    @State var text: String = "TTTTT"
    @State var index: Int32 = 2
    @State var space: Int64 = 8

    @State var values1: Array<SelectOption> = [
            SelectOption(value: "aaa", icon: @r(app.media.startIcon)),
            SelectOption(value: "bbb", icon: @r(app.media.startIcon)),
            SelectOption(value: "ccc", icon: @r(app.media.startIcon)),
            SelectOption(value: "ddd", icon: @r(app.media.startIcon))]

    @State var arrow: ArrowPosition = ArrowPosition.End

    func build() {
        Column {
            Select(this.values1)
            .selected(1)
            .value(this.text)
            .font(size: 16.vp, weight: FontWeight.W500)
            .fontColor(0x182431)
            .selectedOptionFont(size: 16.vp, weight: FontWeight.W400)
            .space(this.space)
            .arrowPosition(this.arrow)
            .menuAlign(alignType: MenuAlignType.Start, offset: Offset(0, 0))
            .optionWidth(200)
            .optionHeight(300)
            .onSelect({ index: Int32, text: String =>
                Hilog.info(0, "AppLogCj", " ==================  Select ====================: ${index}")
                Hilog.info(0, "AppLogCj", " ==================  text ====================: ${text}")
                this.index = index;
                this.text = text;
            })
        }.width(100.percent)
    }
}
```

![selectExample](./figures/selectExample.png)
