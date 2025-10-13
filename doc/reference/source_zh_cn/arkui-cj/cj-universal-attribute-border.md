# 边框设置

设置组件边框样式。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func border(Length, ResourceColor, Length, BorderStyle)

```cangjie
public func border(width!: Length, color!: ResourceColor = Color.Black, radius!: Length = 0.vp,
    style!: BorderStyle = BorderStyle.Solid): This
```

**功能：** 设置组件的边框样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|边框宽度。|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black|边框颜色。|
|radius|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|边框圆角半径。|
|style|[BorderStyle](./cj-common-types.md#enum-borderstyle)|否|BorderStyle.Solid|边框样式。|

## func borderColor(ResourceColor)

```cangjie
public func borderColor(value: ResourceColor): This
```

**功能：** 设置组件的边框颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|边框颜色。|

## func borderRadius(Length)

```cangjie
public func borderRadius(value: Length): This
```

**功能：** 设置组件的圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|圆角半径。|

## func borderRadius(Length, Length, Length, Length)

```cangjie
public func borderRadius(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
    bottomRight!: Length = 0.vp): This
```

**功能：** 设置组件的四个角的圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|topLeft|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|左上角圆角半径。|
|topRight|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|右上角圆角半径。|
|bottomLeft|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|左下角圆角半径。|
|bottomRight|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|右下角圆角半径。|

## func borderStyle(BorderStyle)

```cangjie
public func borderStyle(value: BorderStyle): This
```

**功能：** 设置组件的边框样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BorderStyle](./cj-common-types.md#enum-borderstyle)|是|-|边框样式值。|

## func borderWidth(EdgeWidths)

```cangjie
public func borderWidth(value: EdgeWidths): This
```

**功能：** 设置组件的亮度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths)|是|-|边缘宽度。|

## func borderWidth(Length)

```cangjie
public func borderWidth(value: Length): This
```

**功能：** 设置组件的边框宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|边框宽度。|

**异常：**

- IllegalArgumentException：

  | 错误信息 | 可能原因 | 处理步骤 |
  | :---- | :--- | :--- |
  | Percentage values are not supported. | todo | todo |

## 基础类型定义

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

**起始版本：** 21

#### var bottom

```cangjie
public var bottom: Length
```

**功能：** 下侧边框宽度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var left

```cangjie
public var left: Length
```

**功能：** 左侧边框宽度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var right

```cangjie
public var right: Length
```

**功能：** 右侧边框宽度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var top

```cangjie
public var top: Length
```

**功能：** 上侧边框宽度。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Length, Length, Length, Length)

```cangjie
public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
```

**功能：** 构造EdgeWidths对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。** 上侧边框宽度。|
|right|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。** 右侧边框宽度。|
|bottom|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。** 下侧边框宽度。|
|left|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|**命名参数。** 左侧边框宽度。|
