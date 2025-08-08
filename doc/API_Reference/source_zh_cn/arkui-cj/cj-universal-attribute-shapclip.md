# 形状裁剪

用于对组件进行裁剪、遮罩处理。

## func clip(Bool)

```cangjie
public func clip(isClip: Bool): This
```

**功能：** 是否对子组件超出当前组件范围外的区域进行裁剪。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| isClip  | Bool | 是   | - | 是否按照父容器边缘轮廓进行裁剪。<br/>初始值：false<br/>**说明：** true表示进行裁剪，false表示不进行裁剪。<br/>设置为true后，子组件超出当前组件范围外的区域将不响应绑定的手势事件。|

## func clip(CircleShape)

```cangjie
public func clip(shape: CircleShape): This
```

**功能：** 按[CircleShape](#class-circleshape)的形状对当前组件进行裁剪。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| shape  | [CircleShape](#class-circleshape) | 是   | - | 对当前组件进行裁剪的指定的形状。|

## func clip(EllipseShape)

```cangjie
public func clip(shape: EllipseShape): This
```

**功能：** 按[EllipseShape](#class-ellipseshape)的形状对当前组件进行裁剪。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| shape  | [EllipseShape](#class-ellipseshape) | 是   | - | 对当前组件进行裁剪的指定的形状。|

## func clip(RectShape)

```cangjie
public func clip(shape: RectShape): This
```

**功能：** 按[RectShape](#class-rectshape)的形状对当前组件进行裁剪。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| shape  | [RectShape](#class-rectshape) | 是   | - | 对当前组件进行裁剪的指定的形状。|

## func clip(PathShape)

```cangjie
public func clip(shape: PathShape): This
```

**功能：** 按[PathShape](#class-pathshape)的形状对当前组件进行裁剪。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| shape  | [PathShape](#class-pathshape) | 是   | - | 对当前组件进行裁剪的指定的形状。|

## func mask(CircleShape)

```cangjie
public func mask(shape: CircleShape): This
```

**功能：** 为组件上添加[CircleShape](#class-circleshape)形状的遮罩。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| shape  | [CircleShape](#class-circleshape) | 是   | - | 对当前组件进行遮罩指定的形状。|

## func mask(EllipseShape)

```cangjie
public func mask(shape: EllipseShape): This
```

**功能：** 为组件上添加[EllipseShape](#class-ellipseshape)形状的遮罩。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| shape  | [EllipseShape](#class-ellipseshape) | 是   | - | 对当前组件进行遮罩指定的形状。|

## func mask(RectShape)

```cangjie
public func mask(shape: RectShape): This
```

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**功能：** 为组件上添加[RectShape](#class-rectshape)形状的遮罩。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| shape  | [RectShape](#class-rectshape) | 是   | - | 对当前组件进行遮罩指定的形状。|

## func mask(PathShape)

```cangjie
public func mask(shape: PathShape): This
```

**功能：** 为组件上添加[PathShape](#class-pathshape)形状的遮罩。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| shape  | [PathShape](#class-pathshape) | 是   | - | 对当前组件进行遮罩指定的形状。|

## func mask(ProgressMask)

```cangjie
public func mask(value: ProgressMask): This
```

**功能：** 为组件上添加[ProgressMask](#class-progressmask)形状的遮罩。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ProgressMask](#class-progressmask)|是|-|在当前组件上加上可动态设置进度、最大值和颜色的遮罩。|

## 基础类型定义

### class ShapeAbstract

```cangjie
sealed abstract class ShapeAbstract {}
```

**功能：** CircleShape，RectShape，PathShape，EllipseShape的基类，重新定义了fill，height，offset，size，width等相关的公共成员方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### func fill(ResourceColor)

```cangjie
public func fill(color: ResourceColor): This
```

**功能：** 设置填充区域颜色。异常值按照初始值处理。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|是|-|填充区颜色。</br>初始值：0xff0000。|

#### func height(Length)

```cangjie
public func height(value: Length): This
```

**功能：** 设置组件自身高度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](./cj-common-types.md#interface-length)|是|-|组件高度。</br>单位：vp。|

#### func offset(Length, Length)

```cangjie
public func offset(x!: Length, y!: Length): This
```

**功能：** 设置相对偏移，组件相对原本的布局位置进行偏移。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** x轴坐标。|
|y|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** y轴坐标。|

#### func size(Length, Length)

```cangjie
 public func size(width!: Length, height!: Length): This
```

**功能：** 设置组件的高宽。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** 组件宽度。</br>单位：vp。|
|height|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** 组件高度。</br>单位：vp。|

#### func width(Length)

```cangjie
public func width(value: Length): This
```

**功能：** 设置组件自身的宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](./cj-common-types.md#interface-length)|是|-|组件宽度。</br>单位：vp。|

### class CircleShape

```cangjie
public class CircleShape <: ShapeAbstract {
    public init()
    public init(width!: Length, height!: Length)
}
```

**功能：** 用于clip和mask接口的圆形形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

[ShapeAbstract](#class-shapeabstract)

#### init()

```cangjie
public init()
```

**功能：** 构造一个宽度0，高度0的圆形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### init(length, length)

```cangjie
public init(width!: Length, height!: Length)
```

**功能：** 构造一个宽度width，高度height的圆形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| width | [Length](./cj-common-types.md#interface-length)| 是 | - | **命名参数。**  宽度。<br>初始值：0.vp。 |
| height | [Length](./cj-common-types.md#interface-length) | 是 | - | **命名参数。**  高度。<br>初始值：0.vp。 |

### class EllipseShape

```cangjie
public class EllipseShape <: ShapeAbstract {
    public init()
    public init(width!: Length, height!: Length)
}
```

**功能：** 用于clip和mask接口的椭圆形形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

[ShapeAbstract](#class-shapeabstract)

#### init()

```cangjie
public init()
```

**功能：** 构造一个宽度0，高度0的椭圆形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

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
| width | [Length](./cj-common-types.md#interface-length)| 是 | - | **命名参数。**  宽度。<br>初始值：0.vp。 |
| height | [Length](./cj-common-types.md#interface-length) | 是 | - | **命名参数。**  高度。 <br>初始值：0.vp。|

### class RectShape

```cangjie
public class RectShape <: ShapeAbstract {
    public init()
    public init(width!: Length, height!: Length)
}
```

**功能：** 用于clip和mask接口的矩形形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

[ShapeAbstract](#class-shapeabstract)

#### init()

```cangjie
public init()
```

**功能：** 构造一个宽度0，高度0的矩形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### init(Length，Length)

```cangjie
public init(width!: Length, height!: Length)
```

**功能：** 构造一个宽度width，高度height的矩形。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| width | [Length](./cj-common-types.md#interface-length)| 是 | - | **命名参数。**  宽度。<br>初始值：0.vp。 |
| height | [Length](./cj-common-types.md#interface-length) | 是 | - | **命名参数。**  高度。 <br>初始值：0.vp。|

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
|value|[Length](./cj-common-types.md#interface-length)|是|-|圆角的宽度。</br>初始值：0.vp。|

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
|value|[Length](./cj-common-types.md#interface-length)|是|-|圆角的高度。</br>初始值：0.vp。|

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
|value|[Length](./cj-common-types.md#interface-length)|是|-|圆角的半径大小。</br>初始值：0.vp。|

### class PathShape

```cangjie
public class PathShape <: ShapeAbstract {
    public init()
    public init(commands!: String)
    public init(width!: Length, height!: Length, commands!: String = "")
}
```

**功能：** 用于clip和mask接口的自定义绘制路径形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**父类型：**

[ShapeAbstract](#class-shapeabstract)

#### init()

```cangjie
public init()
```

**功能：** 构造一个默认参数的自定义形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### init(String)

```cangjie
public init(commands!: String)
```

**功能：** 根据路径绘制的命令字符串，构造一个自定义形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|commands|String|是|-| **命名参数。** 路径绘制的命令字符串。|

#### init(Length, Length, String)

```cangjie
public init(width!: Length, height!: Length, commands!: String = "")
```

**功能：** 根据设定的长宽、路径绘制的命令字符串，构造一个自定义形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** 路径所在矩形的宽度。|
|height|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** 路径所在矩形的高度。|
|commands|String|否|""| **命名参数。** 路径绘制的命令字符串。|

### class ProgressMask

```cangjie
public class ProgressMask {
    public init(value!:Float32,total!:Float32,color!:Color)
}
```

**功能：** 设置遮罩的进度、最大值和遮罩颜色的形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### init(Float32, Float32, Color)

```cangjie
public init(value!:Float32,total!:Float32,color!:Color)
```

**功能：** 构造ProgressMask对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float32|是| - | 进度遮罩的当前值。|
|total|Float32|是| - |进度遮罩的最大值。 |
|color|[Color](./cj-common-types.md#class-color)|是| - |进度遮罩的颜色。 |

#### func updateProgress(Float32)

```cangjie
public func updateProgress(number: Float32): Unit
```

**功能：** 更新进度遮罩的进度值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|number|Float32|是| - | 进度遮罩的当前值。|

#### func updateColor(Color)

```cangjie
public func updateProgress(color: Color): Unit
```

**功能：** 更新进度遮罩的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[Color](./cj-common-types.md#class-color)|是| - | 进度遮罩的颜色。|

#### func enableBreathingAnimation(Bool)

```cangjie
public func enableBreathingAnimation(value:Bool):Unit
```

**功能：** 进度满时的呼吸光晕动画开关。默认关闭呼吸光晕动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是| - | 是否开启呼吸光晕动画。</br> 设置为true则开启呼吸光晕动画。初始值：false。 |

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    func build() {
        Column {
            Text("clip").fontSize(12)
            Row() {
              Image(@r(app.media.startIcon)).width(300).height(180)
            }.clip(true).borderRadius(20)
            Text("first end").fontSize(12)
            Image(@r(app.media.startIcon)).width(300).height(180).clip(CircleShape(width: 280, height:160))
            Text("secend end").fontSize(12)
            Text("mask").fontSize(12)
            Image(@r(app.media.startIcon)).mask(RectShape(width: 500, height: 140).fill(Color.GRAY))
            .width(500).height(140)
            Text("first end").fontSize(12)
            Image(@r(app.media.startIcon)).mask(CircleShape(width: 140, height: 140).fill(Color.GRAY))
            .width(500).height(140)
            Text("secend end").fontSize(12)
        }
    }
}
```

![uni_shape_clip](figures/uni_shape_clip.png)
