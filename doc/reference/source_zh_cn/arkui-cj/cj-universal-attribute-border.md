# 边框设置

设置组件边框样式。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func border(?Length, ?ResourceColor, ?Length, ?BorderStyle)

```cangjie
public func border(width!: ?Length, color!: ?ResourceColor = None, radius!: ?Length = None,
    style!: ?BorderStyle = Option.None): T
```

**功能：** 设置组件的边框样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|**命名参数。** 边框宽度。初始值:  0.vp|
|color|?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|None|**命名参数。** 边框颜色。初始值:  Color.Black|
|radius|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None|**命名参数。** 边框圆角半径。初始值:  0.vp|
|style|?[BorderStyle](./cj-common-types.md#enum-borderstyle)|否|Option.None|**命名参数。** 边框样式。初始值:  BorderStyle.Solid|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func borderColor(?ResourceColor)

```cangjie
public func borderColor(value: ?ResourceColor): T
```

**功能：** 设置组件的边框颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor) |是|-|边框颜色。初始值:  Color.Black|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func borderRadius(?Length)

```cangjie
public func borderRadius(value: ?Length): T
```

**功能：** 设置组件的圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|圆角半径。初始值:  0.0.vp|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func borderRadius(?Length, ?Length, ?Length, ?Length)

```cangjie
public func borderRadius(topLeft!: ?Length = None, topRight!: ?Length = None, bottomLeft!: ?Length = None,
    bottomRight!: ?Length = None): T
```

**功能：** 设置组件的四个角的圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|topLeft|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None|**命名参数。** 左上角圆角半径。初始值:  0.vp|
|topRight|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None|**命名参数。** 右上角圆角半径。初始值:  0.vp|
|bottomLeft|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None|**命名参数。** 左下角圆角半径。初始值:  0.vp|
|bottomRight|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None|**命名参数。** 右下角圆角半径。初始值:  0.vp|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func borderStyle(?BorderStyle)

```cangjie
public func borderStyle(value: ?BorderStyle): T
```

**功能：** 设置组件的边框样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[BorderStyle](./cj-common-types.md#enum-borderstyle)|是|-|边框样式值。初始值:  BorderStyle.Solid|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func borderWidth(?EdgeWidths)

```cangjie
public func borderWidth(value: ?EdgeWidths): T
```

**功能：** 设置组件的边框宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[EdgeWidths](./cj-common-types.md#class-edgewidths)|是|-|边缘宽度。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func borderWidth(?Length)

```cangjie
public func borderWidth(value: ?Length): T
```

**功能：** 设置组件的边框宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|边框宽度。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|
