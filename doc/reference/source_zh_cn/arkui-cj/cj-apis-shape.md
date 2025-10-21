# ohos.arkui.shape

提供绘制图形的基础能力。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class BaseShape

```cangjie
public abstract class BaseShape {}
```

**功能：** 图形基类，提供图形的基本属性和方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

### func fill(?ResourceColor)

```cangjie
public func fill(color: ?ResourceColor): This
```

**功能：** 设置填充区域的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|?[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|填充区域的颜色。|

**返回值：**

|类型|说明|
|:----|:----|
|This|返回当前对象。|

### func height(?Length)

```cangjie
public func height(height: ?Length): This
```

**功能：** 设置图形高度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|图形高度。|

**返回值：**

|类型|说明|
|:----|:----|
|This|返回当前对象。|

### func offset(?Length, ?Length)

```cangjie
public func offset(x!: ?Length, y!: ?Length): This
```

**功能：** 设置图形偏移。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** x轴偏移。<br>初始值：0.0.px。|
|y|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** y轴偏移。<br>初始值：0.0.px。|

**返回值：**

|类型|说明|
|:----|:----|
|This|返回当前对象。|

### func size(?Length, ?Length)

```cangjie
public func size(width!: ?Length, height!: ?Length): This
```

**功能：** 设置图形尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 图形宽度。<br>初始值：0.0.vp。|
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 图形高度。<br>初始值：0.0.vp。|

**返回值：**

|类型|说明|
|:----|:----|
|This|返回当前对象。|

### func width(?Length)

```cangjie
public func width(width: ?Length): This
```

**功能：** 设置图形宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|图形宽度。|

**返回值：**

|类型|说明|
|:----|:----|
|This|返回当前对象。|

## class CircleShape

```cangjie
public class CircleShape <: BaseShape {
    public init(width!: ?Length = None, height!: ?Length = None)
}
```

**功能：** 圆形图形类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**父类型：**

- [BaseShape](#class-baseshape)

### init(?Length, ?Length)

```cangjie
public init(width!: ?Length = None, height!: ?Length = None)
```

**功能：** CircleShape的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。** 圆形宽度。<br>初始值：0.vp。|
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。** 圆形高度。<br>初始值：0.vp。|

## class EllipseShape

```cangjie
public class EllipseShape <: BaseShape {
    public init(width!: ?Length = None, height!: ?Length = None)
}
```

**功能：** 椭圆形图形类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**父类型：**

- [BaseShape](#class-baseshape)

### init(?Length, ?Length)

```cangjie
public init(width!: ?Length = None, height!: ?Length = None)
```

**功能：** EllipseShape的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。** 椭圆形宽度。<br>初始值：0.vp。|
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。** 椭圆形高度。<br>初始值：0.vp。|

## class PathShape

```cangjie
public class PathShape <: BaseShape {
    public init(commands!: ?ResourceStr = None)
    public init(width!: ?Length, height!: ?Length, commands!: ?ResourceStr = None)
}
```

**功能：** 路径图形类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**父类型：**

- [BaseShape](#class-baseshape)

### init(?ResourceStr)

```cangjie
public init(commands!: ?ResourceStr = None)
```

**功能：** PathShape的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|commands|?[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|None| **命名参数。** 路径命令。<br>初始值：""。|

### init(?Length, ?Length, ?ResourceStr)

```cangjie
public init(width!: ?Length, height!: ?Length, commands!: ?ResourceStr = None)
```

**功能：** PathShape的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 路径宽度。<br>初始值：0.vp。|
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 路径高度。<br>初始值：0.vp。|
|commands|?[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|None| **命名参数。** 路径命令。<br>初始值：""。|

## class RectShape

```cangjie
public class RectShape <: BaseShape {
    public init(width!: ?Length = None, height!: ?Length = None)
}
```

**功能：** 矩形图形类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**父类型：**

- [BaseShape](#class-baseshape)

### init(?Length, ?Length)

```cangjie
public init(width!: ?Length = None, height!: ?Length = None)
```

**功能：** RectShape的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。** 矩形宽度。<br>初始值：0.vp。|
|height|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|None| **命名参数。** 矩形高度。<br>初始值：0.vp。|

### func radius(?Length)

```cangjie
public func radius(value: ?Length): This
```

**功能：** 设置矩形圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|矩形圆角半径。<br>初始值：0.vp。|

**返回值：**

|类型|说明|
|:----|:----|
|This|返回当前对象。|

### func radiusHeight(?Length)

```cangjie
public func radiusHeight(value: ?Length): This
```

**功能：** 设置矩形垂直圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|矩形垂直圆角半径。<br>初始值：0.vp。|

**返回值：**

|类型|说明|
|:----|:----|
|This|返回当前对象。|

### func radiusWidth(?Length)

```cangjie
public func radiusWidth(value: ?Length): This
```

**功能：** 设置矩形水平圆角半径。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|矩形水平圆角半径。<br>初始值：0.vp。|

**返回值：**

|类型|说明|
|:----|:----|
|This|返回当前对象。|