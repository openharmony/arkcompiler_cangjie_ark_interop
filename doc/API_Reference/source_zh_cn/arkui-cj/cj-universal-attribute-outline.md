# 外描边设置

设置组件外描边（outline）样式。外描边绘制在组件的外侧，不影响布局，不会占用组件本身大小。

![outlineTest](figures/outlineTest.PNG)

## func outline(Length, ResourceColor, Length, OutlineStyle)

```cangjie
public func outline(
    width!: Length,
    color!: ResourceColor = Color.BLACK,
    radius!: Length = 0.vp,
    style!: OutlineStyle = OutlineStyle.SOLID
): This
```

**功能：** 设置外描边样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| width | [Length](cj-common-types.md#interface-length) | 是 |\- | **命名参数。**  外描边宽度，不支持百分比。<br>**说明：**  width为必设项，否则不显示外描边。|
| color | [ResourceColor](cj-common-types.md#interface-resourcecolor) | 否  | Color.BLACK | **命名参数。**  外描边颜色。|
| radius | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  外描边圆角半径，不支持百分比。<br>**说明：** 最大生效值：组件width/2 + outlineWidth或组件height/2 + outlineWidth。|
| style | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | 否 | OutlineStyle.SOLID | **命名参数。**  外描边样式。|

## func outlineColor(ResourceColor)

```cangjie
public func outlineColor(value: ResourceColor): This
```

**功能：** 设置元素的外描边颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value | [ResourceColor](cj-common-types.md#interface-resourcecolor) | 是 | \- | 元素的外描边颜色。<br> 初始值：Color.BLACK |

## func outlineColor(ResourceColor, ResourceColor, ResourceColor, ResourceColor)

```cangjie
public func outlineColor(
    top!: ResourceColor = Color.BLACK, right!: ResourceColor = Color.BLACK, bottom!: ResourceColor = Color.BLACK, left!: ResourceColor = Color.BLACK): This
```

**功能：** 设置元素的外描边颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| top | [ResourceColor](cj-common-types.md#interface-resourcecolor) | 否 | Color.BLACK | **命名参数。**  上侧外描边颜色。|
| right | [ResourceColor](cj-common-types.md#interface-resourcecolor) | 否 | Color.BLACK | **命名参数。**  右侧外描边颜色。|
| bottom | [ResourceColor](cj-common-types.md#interface-resourcecolor) | 否 | Color.BLACK | **命名参数。**  下侧外描边颜色。 |
| left | [ResourceColor](cj-common-types.md#interface-resourcecolor) | 否 | Color.BLACK | **命名参数。**  左侧外描边颜色。|

## func outlineRadius(Length)

```cangjie
public open func outlineRadius(value: Length): This
```

**功能：** 设置元素的外描边圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value | [Length](cj-common-types.md#interface-length) | 是 | \- |元素的外描边圆角半径，不支持百分比。 <br> 初始值：0。 <br> 最大生效值：组件width/2 + outlineWidth或组件height/2 + outlineWidth。|

## func outlineRadius(Length, Length, Length, Length)

```cangjie
public func outlineRadius(
    topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp, bottomRight!: Length = 0.vp): This
```

**功能：** 设置元素的外描边圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| topLeft | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  左上角圆角半径。|
| topRight | [Length](cj-common-types.md#interface-length) | 否  | 0.vp | **命名参数。**  右上角圆角半径。|
| bottomLeft | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  左下角圆角半径。|
| bottomRight | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  右下角圆角半径。|

## func outlineStyle(OutlineStyle)

```cangjie
public open func outlineStyle(value: OutlineStyle): This
```

**功能：** 设置元素的外描边样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | 是 | \- | 元素的外描边样式。<br>初始值：OutlineStyle.SOLID|

## func outlineStyle(OutlineStyle, OutlineStyle, OutlineStyle, OutlineStyle)

```cangjie
public func outlineStyle(
    top!: OutlineStyle = OutlineStyle.SOLID, right!: OutlineStyle = OutlineStyle.SOLID, bottom!: OutlineStyle = OutlineStyle.SOLID, left!: OutlineStyle = OutlineStyle.SOLID): This
```

**功能：** 设置元素的外描边样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| top | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | 否 | OutlineStyle.SOLID | **命名参数。**  上侧外描边样式。|
| right | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | 否 | OutlineStyle.SOLID | **命名参数。**  右侧外描边样式。|
| bottom | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | 否 | OutlineStyle.SOLID | **命名参数。**  下侧外描边样式。|
| left | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | 否 | OutlineStyle.SOLID | **命名参数。**  左侧外描边样式。|

## func outlineWidth(Length)

```cangjie
public open func outlineWidth(value: Length): This
```

**功能：** 设置元素的外描边宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value | [Length](cj-common-types.md#interface-length) | 是 | \- | 元素的外描边宽度。初始值：0 。<br> **说明：** 不支持百分比。<br> 外描边效果width为必设项。|

## func outlineWidth(Length, Length, Length, Length)

```cangjie
public func outlineWidth(
    top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**功能：** 设置外描边的宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| top | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  上侧外描边宽度。|
| right | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  右侧外描边宽度。|
| bottom | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  下侧外描边宽度。|
| left | [Length](cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  左侧外描边宽度。|

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    public func build() {
        Column() {
            Row(30) {
                // 线段
                Text('DASHED')
                    .backgroundColor(Color.PINK)
                    .outlineStyle(OutlineStyle.DASHED)
                    .outlineWidth(5.vp)
                    .outlineColor(Color.BLUE)
                    .outlineRadius(10.vp)
                    .width(120.vp)
                    .height(120.vp)
                    .textAlign(TextAlign.Center)
                    .fontSize(16)
                // 点线
                Text('DOTTED')
                    .backgroundColor(Color.PINK)
                    .outline(width: 5.vp, color: Color.GREEN, radius: 10.vp, style: OutlineStyle.DOTTED)
                    .width(120.vp)
                    .height(120.vp)
                    .textAlign(TextAlign.Center)
                    .fontSize(16)
            }
                .width(300.vp)
                .height(150)

            Text('.outlineWidth/outlineColor/outlineRadius/outlineStyle')
                .backgroundColor(Color.PINK)
                .fontSize(20.vp)
                .width(300.vp)
                .height(300.vp)
                .textAlign(TextAlign.Center)
                .outlineWidth(left: 3, right: 6, top: 10, bottom: 15)
                .outlineColor(left: Color.ORANGE, right: Color.BLUE, top: Color.RED, bottom: Color.GREEN)
                .outlineRadius(topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80)
                .outlineStyle(
                    left: OutlineStyle.DOTTED,
                    right: OutlineStyle.DOTTED,
                    top: OutlineStyle.SOLID,
                    bottom: OutlineStyle.DASHED
                )
        }
            .height(700.vp)
            .width(380.vp)
            .borderWidth(1.vp)
    }
}
```

![uni_border](figures/uni_outline.png)
