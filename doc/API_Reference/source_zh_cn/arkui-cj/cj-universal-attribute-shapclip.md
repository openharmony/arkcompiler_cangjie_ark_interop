# 形状裁剪

用于对组件进行裁剪、遮罩处理。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func clip(Bool)

```cangjie
public func clip(value: Bool): This
```

**功能：** 设置组件是否裁剪超出边界的内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否裁剪。|

## func clipShape(BaseShape)

```cangjie
public func clipShape(value: BaseShape): This
```

**功能：** 设置组件的裁剪形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BaseShape](./cj-graphic-drawing-shape.md#class-baseshape)|是|-|裁剪形状。|

## func maskShape(BaseShape)

```cangjie
public func maskShape(value: BaseShape): This
```

**功能：** 为组件上添加指定形状的遮罩。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|BaseShape|是|-|在当前组件上加上指定形状的遮罩。|

### class CircleShape

```cangjie
public class CircleShape <: BaseShape {
    public init(width!: Length = 0.vp, height!: Length = 0.vp)
}
```

**功能：** 用于clip和mask接口的圆形形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

[BaseShape](./cj-graphic-drawing-shape.md#class-baseshape)

#### init(length, length)

```cangjie
public init(width!: Length = 0.vp, height!: Length = 0.vp)
```

**功能：** 构造一个宽度width，高度height的圆形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| width | [Length](../BasicServicesKit/cj-apis-base.md#interface-length)| 是 | - | **命名参数。**  宽度。<br>初始值：0.vp。 |
| height | [Length](../BasicServicesKit/cj-apis-base.md#interface-length) | 是 | - | **命名参数。**  高度。<br>初始值：0.vp。 |

### class EllipseShape

```cangjie
public class EllipseShape <: BaseShape {
    public init(width!: Length, height!: Length)
}
```

**功能：** 用于clip和mask接口的椭圆形形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

[BaseShape](./cj-graphic-drawing-shape.md#class-baseshape)

#### init(length, length)

```cangjie
public init(width!: Length, height!: Length)
```

**功能：** 构造一个宽度width，高度height的椭圆形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| width | [Length](../BasicServicesKit/cj-apis-base.md#interface-length)| 是 | - | **命名参数。**  宽度。<br>初始值：0.vp。 |
| height | [Length](../BasicServicesKit/cj-apis-base.md#interface-length) | 是 | - | **命名参数。**  高度。 <br>初始值：0.vp。|

### class RectShape

```cangjie
public class RectShape <: BaseShape {
    public init(width!: Length = 0.vp, height!: Length = 0.vp)
    public func radiusWidth(value: Length): This
    public func radiusHeight(value: Length): This
    public func radius(value: Length): This
}
```

**功能：** 用于clip和mask接口的矩形形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

[BaseShape](./cj-graphic-drawing-shape.md#class-baseshape)

#### init(Length，Length)

```cangjie
public init(width!: Length = 0.vp, height!: Length = 0.vp)
```

**功能：** 构造一个宽度width，高度height的矩形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| width | [Length](../BasicServicesKit/cj-apis-base.md#interface-length)| 是 | - | **命名参数。**  宽度。<br>初始值：0.vp。 |
| height | [Length](../BasicServicesKit/cj-apis-base.md#interface-length) | 是 | - | **命名参数。**  高度。 <br>初始值：0.vp。|

#### func radiusWidth(Length)

```cangjie
public func radiusWidth(value: Length): This
```

**功能：** 设置圆角的宽度，仅设置宽时宽高一致。异常值按照初始值处理。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|圆角的宽度。</br>初始值：0.vp。|

#### func radiusHeight(Length)

```cangjie
public func radiusHeight(value: Length): This
```

**功能：** 设置圆角的高度，仅设置高时宽高一致。异常值按照初始值处理。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|圆角的高度。</br>初始值：0.vp。|

#### func radius(Length)

```cangjie
public func radius(value: Length): This
```

**功能：** 设置圆角半径大小。异常值按照初始值处理。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|圆角的半径大小。</br>初始值：0.vp。|

