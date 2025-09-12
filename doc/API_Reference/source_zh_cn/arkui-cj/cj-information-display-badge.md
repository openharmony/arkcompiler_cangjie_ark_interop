# Badge

信息标记组件，可以附加在单个组件上用于信息提醒的容器组件。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

支持单个子组件。

> **说明：**
>
> 子组件类型：系统组件和自定义组件，支持渲染控制类型（[if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md)、[ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md)、[LazyForEach](cj-state-rendering-lazyforeach.md)）。

## 创建组件

### init(Int32, BadgeStyle, BadgePosition, Int32, () -> Unit)

```cangjie
public init(count!: Int32, style!: BadgeStyle, position!: BadgePosition = BadgePosition.RightTop,
    maxCount!: Int32 = 99, child!: () -> Unit)
```

**功能：** 根据数字创建标记组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|count|Int32|是|-| **命名参数。** 设置提醒消息数。小于等于0时不显示信息标记。|
|style|[BadgeStyle](#class-badgestyle)|是|-| **命名参数。** Badge组件可设置的样式，支持设置文本颜色、尺寸、圆点颜色和尺寸。|
|position|[BadgePosition](#enum-badgeposition)|否|BadgePosition.RightTop| **命名参数。** 提示点显示位置。|
|maxCount|Int32|否|99| **命名参数。** 最大消息数，超过最大消息时仅显示 maxCount+。|
|child|()->Unit|是|-|容器的子组件。|

### init(String, BadgeStyle, BadgePosition, () -> Unit)

```cangjie
public init(value!: String, style!: BadgeStyle, position!: BadgePosition = BadgePosition.RightTop, child!: () -> Unit)
```

**功能：** 根据数字创建标记组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|数字标记组件参数。|
|style|[BadgeStyle](#class-badgestyle)|是|-| **命名参数。** Badge组件可设置的样式，支持设置文本颜色、尺寸、圆点颜色和尺寸。|
|position|[BadgePosition](#enum-badgeposition)|否|BadgePosition.RightTop| **命名参数。** 提示点显示位置。|
|child|()->Unit|是|-|容器的子组件。|

## 通用属性/通用事件

通用属性：除文本样式外，其余全部支持。

通用事件：全部支持。

## 基础类型定义

### class BadgeStyle

```cangjie
public class BadgeStyle {
    public var color: ResourceColor
    public var fontSize: Length
    public var badgeSize: Length
    public var badgeColor: ResourceColor
    public var fontWeight: FontWeight
    public var borderColor: ResourceColor
    public var borderWidth: Length
    public init(color!: ResourceColor = Color.White, fontSize!: Length = 10.fp, badgeSize!: Length = 16.vp,
        badgeColor!: ResourceColor = Color.Red, fontWeight!: FontWeight = FontWeight.Normal,
        borderColor!: ResourceColor = Color.Red, borderWidth!: Length = 1.vp)
}
```

**功能：** 包含Badge组件的样式参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var badgeColor

```cangjie
public var badgeColor: ResourceColor
```

**功能：** badge的颜色。

**类型：** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var badgeSize

```cangjie
public var badgeSize: Length
```

**功能：** badge的大小，单位为vp。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var borderColor

```cangjie
public var borderColor: ResourceColor
```

**功能：** 底板描边颜色。

**类型：** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var borderWidth

```cangjie
public var borderWidth: Length
```

**功能：** 底板描边粗细。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var color

```cangjie
public var color: ResourceColor
```

**功能：** 文本颜色。

**类型：** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontSize

```cangjie
public var fontSize: Length
```

**功能：** 文本大小，单位为fp。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fontWeight

```cangjie
public var fontWeight: FontWeight
```

**功能：** 设置文本的字体粗细。

**类型：** [FontWeight](./cj-common-types.md#enum-fontweight)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(ResourceColor, Length, Length, ResourceColor, FontWeight, ResourceColor, Length)

```cangjie
public init(color!: ResourceColor = Color.White, fontSize!: Length = 10.fp, badgeSize!: Length = 16.vp,
    badgeColor!: ResourceColor = Color.Red, fontWeight!: FontWeight = FontWeight.Normal,
    borderColor!: ResourceColor = Color.Red, borderWidth!: Length = 1.vp)
```

**功能：** 创建一个BadgeStyle对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.White|**命名参数。** 文本颜色。|
|fontSize|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|10.fp|**命名参数。** 文本大小。<br>单位：fp。|
|badgeSize|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。** badge的大小。<br>单位：fp。|
|badgeColor|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Red|**命名参数。** badge的颜色。|
|fontWeight|[FontWeight](./cj-common-types.md#enum-fontweight)|否|FontWeight.Normal|**命名参数。** 设置文本的字体粗细。|
|borderColor|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Red|**命名参数。** 底板描边颜色。|
|borderWidth|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|否|1.vp|**命名参数。** 底板描边粗细。<br>单位：vp。|

### enum BadgePosition

```cangjie
public enum BadgePosition {
    | RightTop
    | Right
    | Left
}
```

**功能：** 圆点显示位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Left

```cangjie
Left
```

**功能：** 圆点显示在左侧纵向居中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Right

```cangjie
Right
```

**功能：**  圆点显示在右侧纵向居中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RightTop

```cangjie
RightTop
```

**功能：** 圆点显示在右上角。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func ==(BadgePosition)

```cangjie
public operator func ==(other: BadgePosition): Bool
```

**功能：** 判断两个BadgePosition是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|BadgePosition|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## 示例代码

### 示例1（设置标记组件内容）

该示例通过value和count属性，实现了传入空值、字符、数字时标记组件展现不同的效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Text("numberBadge").width(80.percent)
            Row(space: 10) {
                // 数字上标，maxCount默认99,超过99展示99+
                Badge(
                    count: 1,
                    style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                        fontWeight: FontWeight.Bolder, borderColor: Color.Black, borderWidth: 2.vp),
                    position: BadgePosition.RightTop,
                    maxCount: 99
                ) {
                    Button("message").width(100).height(50).backgroundColor(0x317aff)
                }.width(100).height(50)
                Badge(
                    count: 1,
                    style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                        fontWeight: FontWeight.Bolder, borderColor: Color.Green, borderWidth: 2.vp),
                    position: BadgePosition.Left,
                    maxCount: 99
                ) {
                    Button("message").width(100).height(50).backgroundColor(0x317aff)
                }.width(100).height(50)
                // 数字上标
                Badge(
                    count: 1,
                    style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                        fontWeight: FontWeight.Regular, borderColor: Color.Gray, borderWidth: 4.vp),
                    position: BadgePosition.Right,
                    maxCount: 99
                ) {
                    Button("message").width(100).height(50).backgroundColor(0x317aff)
                }.width(100).height(50)
            }.margin(10)
            Text("stringBadge").width(80.percent)
            Row(space: 30) {
                Badge(
                    value: "new",
                    style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 9, badgeSize: 20, badgeColor: Color.Blue)
                ) {
                    Text("message")
                        .width(80)
                        .height(50)
                        .fontSize(16)
                        .lineHeight(37)
                        .borderRadius(10)
                        .textAlign(TextAlign.Center)
                        .backgroundColor(0xF3F4ED)
                }.width(80).height(50)
                // value为空，设置圆点标记
                Badge(
                    value: "",
                    style: BadgeStyle(badgeSize: 6, badgeColor: Color.Blue),
                    position: BadgePosition.Right
                ) {
                    Text("message")
                        .width(90)
                        .height(50)
                        .fontSize(16)
                        .lineHeight(37)
                        .borderRadius(10)
                        .textAlign(TextAlign.Center)
                        .backgroundColor(0xF3F4ED)
                }.width(90).height(50)
            }.margin(10)
        }
    }
}
```

![badge](./figures/badge.png)

### 示例2（设置数字控制标记显隐）

该示例通过count属性，实现了设置数字0和1时标记组件的隐藏和显示效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var badgeCount: Int32 = 1
    func build() {
        Column() {
            Badge(
                count: this.badgeCount,
                style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,fontWeight: FontWeight.Bolder, borderColor: Color.Black, borderWidth: 2.vp),
                position: BadgePosition.RightTop,
            ){
                Text("message")
                    .width(100)
                    .height(50)
                    .backgroundColor(0x317aff)
            }
                .width(100)
                .height(50)
            Button("count 0")
                .onClick{ evt =>  this.badgeCount =0;}
            Button("count 1")
                .onClick{ evt =>  this.badgeCount =1;}
        }.margin(10)
    }
}
```

![badge1](./figures/badge1.gif)
