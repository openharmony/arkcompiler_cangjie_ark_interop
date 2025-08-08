# 边框设置

设置组件边框样式。

## func border(Length, ResourceColor, Length, BorderStyle)

```cangjie
public func border(width!: Length, color!: ResourceColor = Color.BLACK, radius!: Length = 0.vp, style!: BorderStyle = BorderStyle.Solid): This
```

**功能：** 设置边框样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---------- | :---------- | :------- | :-------- | :--------------------------------------------------|
| width | [Length](./cj-common-types.md#interface-length) | 是 | - | **命名参数。**  边框宽度。|
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor)   | 否  | Color.BLACK | **命名参数。**  边框颜色。|
| radius | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。**  边框圆角半径。|
| style | [BorderStyle](./cj-common-types.md#enum-borderstyle) | 否 | BorderStyle.Solid | **命名参数。**  边框样式。|

## func borderStyle(BorderStyle)

```cangjie
public func borderStyle(style: BorderStyle): This
```

**功能：** 设置元素的边框线条样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :--------| :---------- | :------- | :------ | :------- |
| style | [BorderStyle](./cj-common-types.md#enum-borderstyle) | 是 | - | 元素的边框样式。<br>初始值：BorderStyle.Solid。|

## func borderWidth(Length)

```cangjie
public func borderWidth(width: Length): This
```

**功能：** 设置边框的宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------- | :---------- | :------- | :------ | :------- |
| width | [Length](./cj-common-types.md#interface-length)  | 是 | - | 设置元素的边框宽度，不支持百分比。|

## func borderWidth(EdgeWidths)

```cangjie
public func borderWidth(edgeWidths: EdgeWidths): This
```

**功能：** 设置边框的宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :------- | :---------- | :------- | :------ | :------- |
| edgeWidths | [EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths) | 是 | - | 设置元素的边框宽度，不支持百分比。|

## func borderColor(ResourceColor)

```cangjie
public func borderColor(color: ResourceColor): This
```

**功能：** 设置边框的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :------- | :---------- | :---------- | :------- | :------ |
| color |[ResourceColor](./cj-common-types.md#interface-resourcecolor)| 是 | -| 元素的边框颜色。<br>初始值：Color.BLACK。|

## func borderRadius(Length)

```cangjie
public open func borderRadius(radius: Length): This
```

**功能：** 设置边框的圆角。圆角大小受组件尺寸限制，最大值为组件宽或高的一半。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :------ | :---------- | :------- | :-------- | :---------|
| radius | [Length](./cj-common-types.md#interface-length)  | 是 | - | 元素的边框圆角半径，支持百分比，百分比依据组件宽度。设置圆角后，可搭配[clip](./cj-universal-attribute-shapclip.md#func-clipbool)属性进行裁剪，避免子组件超出组件自身。|

## func borderRadius(Length, Length, Length, Length)

```cangjie
public func borderRadius(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp, bottomRight!: Length = 0.vp): This
```

**功能：** 设置边框的圆角。圆角大小受组件尺寸限制，最大值为组件宽或高的一半。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :---------- | :---------- | :------- | :-------- | :---------|
| topLeft | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。**  左上角圆角半径。|
| topRight | [Length](./cj-common-types.md#interface-length) | 否  | 0.vp | **命名参数。**  右上角圆角半径。|
| bottomLeft | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。**  左下角圆角半径。|
| bottomRight | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。**  右下角圆角半径。|

## 基础类型定义

### class LocalizedEdgeWidths

```cangjie
public class LocalizedEdgeWidths {
    public var bottom: Option<Length>
    public var end: Option<Length>
    public var start: Option<Length>
    public var top: Option<Length>
    public init(
        bottom!: Option<Length> = Option.None,
        end!: Option<Length> = Option.None,
        start!: Option<Length> = Option.None,
        top!: Option<Length> = Option.None
    )
}
```

**功能：** 边框宽度类型，用于描述组件边框不同方向的宽度。引入该对象时，至少传入一个参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### var bottom

```cangjie
public var bottom: Option<Length>
```

**功能：** 下侧边框宽度。

**类型：** Option\<[Length](./cj-common-types.md#interface-length)>

**读写能力：** 可读写

**起始版本：** 19

#### var end

```cangjie
public var end: Option<Length>
```

**功能：** 右侧边框宽度。从右至左显示语言模式下为左侧边框宽度。

**类型：** Option\<[Length](./cj-common-types.md#interface-length)>

**读写能力：** 可读写

**起始版本：** 19

#### var start

```cangjie
public var start: Option<Length>
```

**功能：** 左侧边框宽度。从右至左显示语言模式下为右侧边框宽度。

**类型：** Option\<[Length](./cj-common-types.md#interface-length)>

**读写能力：** 可读写

**起始版本：** 19

#### var top

```cangjie
public var top: Option<Length>
```

**功能：** 上侧边框宽度。

**类型：** Option\<[Length](./cj-common-types.md#interface-length)>

**读写能力：** 可读写

**起始版本：** 19

#### init(Option\<Length>, Option\<Length>, Option\<Length>, Option\<Length>)

```cangjie
public init(bottom!: Option<Length> = Option.None, end!: Option<Length> = Option.None, start!: Option<Length> = Option.None, top!: Option<Length> = Option.None)
```

**功能：** 构造一个LocalizedEdgeWidths类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :------- | :---------- | :---------- | :------- | :------ |
| bottom |Option\<[Length](./cj-common-types.md#interface-length)>| 否 | Option.None| **命名参数。**  下侧边框宽度。|
| end |Option\<[Length](./cj-common-types.md#interface-length)>| 否 | Option.None| **命名参数。**  右侧边框宽度。从右至左显示语言模式下为左侧边框宽度。|
| start |Option\<[Length](./cj-common-types.md#interface-length)>| 否 | Option.None| **命名参数。**  左侧边框宽度。从右至左显示语言模式下为右侧边框宽度。|
| top |Option\<[Length](./cj-common-types.md#interface-length)>| 否 | Option.None| **命名参数。**  上侧边框宽度。|

### class EdgeColors

```cangjie
public class EdgeColors {
    public var bottom: Option<ResourceColor>
    public var left: Option<ResourceColor>
    public var top: Option<ResourceColor>
    public var right: Option<ResourceColor>
    public init(
        bottom!: Option<ResourceColor> = Option.None,
        left!: Option<ResourceColor> = Option.None,
        top!: Option<ResourceColor> = Option.None,
        right!: Option<ResourceColor> = Option.None
    )
}
```

**功能：** 边框颜色类型，用于描述组件边框不同方向的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### var bottom

```cangjie
public var bottom: Option<ResourceColor>
```

**功能：** 下侧边框颜色。

**类型：** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**读写能力：** 可读写

**起始版本：** 19

#### var left

```cangjie
public var left: Option<ResourceColor>
```

**功能：** 左侧边框颜色。

**类型：** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**读写能力：** 可读写

**起始版本：** 19

#### var right

```cangjie
public var right: Option<ResourceColor>
```

**功能：** 右侧边框颜色。

**类型：** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**读写能力：** 可读写

**起始版本：** 19

#### var top

```cangjie
public var top: Option<ResourceColor>
```

**功能：** 上侧边框颜色。

**类型：** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**读写能力：** 可读写

**起始版本：** 19

#### init(Option\<ResourceColor>, Option\<ResourceColor>，Option\<ResourceColor>, Option\<ResourceColor>)

```cangjie
public init(bottom!: Option<ResourceColor> = Option.None, left!: Option<ResourceColor> = Option.None, top!: Option<ResourceColor> = Option.None, right!: Option<ResourceColor> = Option.None)
```

**功能：** 构造一个EdgeColors类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :------- | :---------- | :---------- | :------- | :------ |
| bottom |Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>| 否 | Option.None| **命名参数。**  下侧边框宽度。|
| left |Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>| 否 | Option.None| **命名参数。**  左侧边框宽度。|
| top |Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>| 否 | Option.None| **命名参数。**  上侧边框宽度。|
| right |Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>| 否 | Option.None| **命名参数。**  右侧边框宽度。|

### class LocalizedEdgeColors

```cangjie
public class LocalizedEdgeColors {
    public var bottom: Option<ResourceColor>
    public var end: Option<ResourceColor>
    public var start: Option<ResourceColor>
    public var top: Option<ResourceColor>
    public init(
        bottom!: Option<ResourceColor> = Option.None,
        end!: Option<ResourceColor> = Option.None,
        start!: Option<ResourceColor> = Option.None，
        top!: Option<ResourceColor> = Option.None
    )
}
```

**功能：** 边框颜色，用于描述组件边框四条边的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### var bottom

```cangjie
public var bottom: Option<ResourceColor>
```

**功能：** 下侧边框颜色。

**类型：** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**读写能力：** 可读写

**起始版本：** 19

#### var end

```cangjie
public var end: Option<ResourceColor>
```

**功能：** 右侧边框颜色。从右至左显示语言模式下为左侧边框颜色。

**类型：** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**读写能力：** 可读写

**起始版本：** 19

#### var start

```cangjie
public var start: Option<ResourceColor>
```

**功能：** 左侧边框颜色。从右至左显示语言模式下为右侧边框颜色。

**类型：** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**读写能力：** 可读写

**起始版本：** 19

#### var top

```cangjie
public var top: Option<ResourceColor>
```

**功能：** 上侧边框颜色。

**类型：** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**读写能力：** 可读写

**起始版本：** 19

#### init(Option\<ResourceColor>, Option\<ResourceColor>, Option\<ResourceColor>, Option\<ResourceColor>)

```cangjie
public init(bottom!: Option<ResourceColor> = Option.None, end!: Option<ResourceColor> = Option.None, start!: Option<ResourceColor> = Option.None, top!: Option<ResourceColor> = Option.None)
```

**功能：** 构造一个LocalizedEdgeColors类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :------- | :---------- | :---------- | :------- | :------ |
| top |Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>| 否 | Option.None| **命名参数。**  上侧边框宽度。|
| start |Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>| 否 | Option.None| **命名参数。**  左侧边框颜色。从右至左显示语言模式下为右侧边框颜色。|
| bottom |Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>| 否 | Option.None| **命名参数。**  下侧边框宽度。|
| end |Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>| 否 | Option.None| **命名参数。**  右侧边框宽度。从右至左显示语言模式下为左侧边框颜色。|

### class LocalizedBorderRadiuses

 ```cangjie
public class LocalizedBorderRadiuses {
    public var bottomEnd: Option<Length>
    public var bottomStart: Option<Length>
    public var topEnd: Option<Length>
    public var topStart: Option<Length>
    public init(
        bottomEnd!: Option<Length> = Option.None,
        bottomStart!: Option<Length> = Option.None,
        topEnd!: Option<Length> = Option.None,
        topStart!: Option<Length> = Option.None
    )
}
 ```

**功能：** 圆角类型，用于描述组件边框圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### var bottomEnd

```cangjie
public var bottomEnd: Option<Length>
 ```

**功能：** 右下角圆角半径。从右至左显示语言模式下为左下角圆角半径。

**类型：** Option\<[Length](./cj-common-types.md#interface-length)>

**读写能力：** 可读写

**起始版本：** 19

#### var bottomStart

```cangjie
public var bottomStart: Option<Length>
 ```

**功能：** 左下角圆角半径。从右至左显示语言模式下为右下角圆角半径。

**类型：** Option\<[Length](./cj-common-types.md#interface-length)>

**读写能力：** 可读写

**起始版本：** 19

#### var topEnd

```cangjie
public var topEnd: Option<Length>
 ```

**功能：** 右上角圆角半径。从右至左显示语言模式下为左上角圆角半径。

**类型：** Option\<[Length](./cj-common-types.md#interface-length)>

**读写能力：** 可读写

**起始版本：** 19

#### var topStart

```cangjie
public var topStart: Option<Length>
 ```

**功能：** 左上角圆角半径。从右至左显示语言模式下为右上角圆角半径。

**类型：** Option\<[Length](./cj-common-types.md#interface-length)>

**读写能力：** 可读写

**起始版本：** 19

#### init(Option\<Length>, Option\<Length>, Option\<Length>, Option\<Length>)

```cangjie
public init(bottomEnd!: Option<Length> = Option.None, bottomStart!: Option<Length> = Option.None, topEnd!: Option<Length> = Option.None,topStart!: Option<Length> = Option.None)
```

**功能：** 构造一个LocalizedBorderRadiuses类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :------- | :---------- | :---------- | :------- | :------ |
| bottomEnd |Option\<[Length](./cj-common-types.md#interface-length)>| 否 | Option.None| **命名参数。**  右下角圆角半径。从右至左显示语言模式下为左下角圆角半径。|
| bottomStart |Option\<[Length](./cj-common-types.md#interface-length)>| 否 | Option.None| **命名参数。**  左下角圆角半径。从右至左显示语言模式下为右下角圆角半径。|
| topEnd |Option\<[Length](./cj-common-types.md#interface-length)>| 否 | Option.None| **命名参数。**  右上角圆角半径。从右至左显示语言模式下为左上角圆角半径。|
| topStart |Option\<[Length](./cj-common-types.md#interface-length)> |  否 |Option.None| 左上角圆角半径。从右至左显示语言模式下为右上角圆角半径。|

### class EdgeWidths

```cangjie
public class EdgeWidths {
    public var top: Length
    public var right: Length
    public var bottom: Length
    public var left: Length
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
}
```

**功能：** 设置弹窗背板的边框宽度。引入该对象时，至少传入一个参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### var top

```cangjie
public var top: Length
```

**功能：** 上侧边框宽度。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 12

#### var right

```cangjie
public var right: Length
```

**功能：** 右侧边框宽度。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 12

#### var left

```cangjie
public var left: Length
```

**功能：** 左侧边框宽度。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 12

#### var bottom

```cangjie
public var bottom: Length
```

**功能：** 下侧边框宽度。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 12

#### init(left!: Length = 0.vp, right!: Length = 0.vp, top!: Length = 0.vp, bottom!: Length = 0.vp)

```cangjie
public init(left!: Length = 0.vp, right!: Length = 0.vp, top!: Length = 0.vp, bottom!: Length = 0.vp)
```

**功能：** 构造EdgeWidths对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- |:--- |
| left | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。**  左侧边框宽度。 |
| right | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。** 右侧边框宽度。 |
| top | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。** 上侧边框宽度。 |
| bottom | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。** 下侧边框宽度。 |

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center)) {
                Text("dashed")
                .borderStyle(BorderStyle.Dashed).borderWidth(5).borderColor(0xAFEEEE).borderRadius(10)
                .width(120).height(120).textAlign(TextAlign.Center).fontSize(16)

                Text("dotted")
                .border(width: 5.px, color: Color(0x317AF7), radius: 10.px, style: BorderStyle.Dotted)
                .width(120).height(120).textAlign(TextAlign.Center).fontSize(16)
            }.width(100.percent).height(150)
        }
    }
}
```

![uni_border](figures/uni_border.png)
