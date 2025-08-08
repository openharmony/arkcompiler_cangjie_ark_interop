# 颜色渐变

设置组件的颜色渐变效果。

> **说明：**
>
> - 颜色渐变属于组件内容，绘制在背景上方。
> - 颜色渐变不支持宽高显式动画，执行宽高动画时颜色渐变会直接过渡到终点。

## func linearGradient(Option\<Float64>, GradientDirection, Array\<(Color,Float64)>, Bool)

```cangjie
public func linearGradient(
    angle!: Option<Float64> = None,
    direction!: GradientDirection = Bottom,
    colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    repeating!: Bool = false
): This
```

**功能：** 设置线性渐变。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|angle|Option\<Float64>|否|None| **命名参数。** 线性渐变的起始角度。0点方向顺时针旋转为正向角度。|
|direction|[GradientDirection](./cj-common-types.md#enum-gradientdirection)|否|GradientDirection.Bottom| **命名参数。**  线性渐变的方向，设置angle后不生效。|
|colors|Array\<([Color](./cj-common-types.md#class-color),Float64)>|否|[(Color.TRANSPARENT, 0.0)]| **命名参数。** 指定渐变色颜色和其对应的百分比位置的数组，设置非法颜色直接跳过。|
|repeating|Bool|否|false| **命名参数。** 为渐变的颜色重复着色。 |

## func sweepGradient((Length,Length), Float64, Float64, Float64, Array\<(Color,Float64)>, Bool)

```cangjie
public func sweepGradient(
    center: (Length, Length),
    start!: Float64 = 0.0,
    end!: Float64 = 0.0,
    rotation!: Float64 = 0.0,
    colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    repeating!: Bool = false
): This
```

**功能：** 设置角度渐变。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|center|([Length](./cj-common-types.md#interface-length),[Length](./cj-common-types.md#interface-length))|是|-|为角度渐变的中心点，即相对于当前组件左上角的坐标。|
|start|Float64|否|0.0| **命名参数。** 角度渐变的起点。|
|end|Float64|否|0.0| **命名参数。** 角度渐变的终点。|
|rotation|Float64|否|0.0| **命名参数。** 角度渐变的旋转角度。|
|colors|Array\<([Color](./cj-common-types.md#class-color),Float64)>|否|[(Color.TRANSPARENT, 0.0)]| **命名参数。** 指定渐变色颜色和其对应的百分比位置的数组，设置非法颜色直接跳过。|
|repeating|Bool|否|false| **命名参数。** 为渐变的颜色重复着色。|

> **说明：**
>
> start、end、rotation设置为小于0的值时，按值为0处理；设置为大于360的值时，按值为360处理。

## func radialGradient((Length,Length), Float64, Array\<(Color,Float64)>, Bool)

```cangjie
public func radialGradient(
    center: (Length, Length),
    radius: Float64,
    colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    repeating!: Bool = false
): This
```

**功能：** 设置径向渐变。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|center|([Length](./cj-common-types.md#interface-length),[Length](./cj-common-types.md#interface-length))|是|-|为角度渐变的中心点，即相对于当前组件左上角的坐标。|
|radius|Float64|是|-|径向渐变的半径。<br>取值范围：\[0.0,+∞)。<br> **说明：** <br> 设置为小于的0值时，按值为0处理。初始值：0.0。|
|colors|Array\<([Color](./cj-common-types.md#class-color), Float64)>|否|[(Color.TRANSPARENT, 0.0)]| **命名参数。** 指定渐变色颜色和其对应的百分比位置的数组，设置非法颜色直接跳过。|
|repeating|Bool|否|false| **命名参数。** 为渐变的颜色重复着色。|

## func radialGradient((Length,Length), Length, Array\<(Color,Float64)>, Bool)

```cangjie
public func radialGradient(
    center: (Length, Length),
    radius: Length,
    colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    repeating!: Bool = false
): This
```

**功能：** 设置径向渐变。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|参数类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|center|([Length](./cj-common-types.md#interface-length), Length)|是|-|为角度渐变的中心点，即相对于当前组件左上角的坐标。|
|radius|[Length](./cj-common-types.md#interface-length)|是|-|径向渐变的半径。<br>取值范围：\[0.0,+∞)。<br>说明：设置为小于的0.0值时，按值为0.0处理。初始值：0.0.vp。|
|colors|Array\<([Color](./cj-common-types.md#class-color), Float64)>|否|[(Color.TRANSPARENT, 0.0)]| **命名参数。** 指定渐变色颜色和其对应的百分比位置的数组，设置非法颜色直接跳过。|
|repeating|Bool|否|false| **命名参数。** 为渐变的颜色重复着色。|

> **说明：**
>
> - colors参数的约束：
> - Color表示填充的颜色，Float64表示指定颜色所处的位置，取值范围为[0,1.0]，0表示需要设置渐变色的容器的开始处，1.0表示容器的结尾处。想要实现多个颜色渐变效果时，多个数组中Float64参数建议递增设置，如后一个数组Float64参数比前一个数组Float64小的话，按照等于前一个数组Float64的值处理。

## 示例代码

### 示例1（颜色从右向左线性渐变）

该示例通过linearGradient来实现组件颜色线性渐变。

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
            Text("linearGradient")
                .fontSize(24.px)
                .width(90.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(100.percent)
                .height(100.px)
                .linearGradient(
                    angle: 90.0,
                    colors: [(Color(0x0000ff), 0.0), (Color(0xff0000), 0.3), (Color(0xffff00), 1.0)],
                    repeating: false
                )

            Text("linearGradient Repeat")
                .fontSize(24.px)
                .width(90.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(100.percent)
                .height(100.px)
                .linearGradient(
                    colors: [(Color(0x0000ff), 0.0), (Color(0xff0000), 0.3), (Color(0xffff00), 0.5)],
                    direction: GradientDirection.Left,
                    repeating: true
                )
        }
    }
}
```

![gradientColor1](figures/gradientColor1.png)

### 示例2（颜色按旋转角度渐变）

该示例通过sweepGradient来实现组件颜色旋转角度渐变。

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
            Text("sweepGradient")
                .fontSize(24.px)
                .width(30.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(200.px)
                .height(200.px)
                .sweepGradient(
                    (100.0.px, 100.0.px),
                    start: 0.0,
                    end: 359.0,
                    colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 1.0)],
                    repeating: false
                )

            Text("sweepGradient Reapeat")
                .fontSize(24.px)
                .width(30.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(200.px)
                .height(200.px)
                .sweepGradient(
                    (100.0.px, 100.0.px),
                    start: 0.0,
                    end: 359.0,
                    rotation: 45.0,
                    colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 0.5)],
                    repeating: true
                )
        }
    }
}
```

![gradientColor2](figures/gradientColor2.png)

### 示例3（颜色按径向渐变）

该示例通过radialGradient来实现组件颜色径向渐变。

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
            Text("radialGradient")
                .fontSize(24.px)
                .width(30.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(200.px)
                .height(200.px)
                .radialGradient(
                    (100.0.px, 100.0.px),
                    120.0,
                    colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 1.0)]
                )

            Text("radialGradient Repeat")
                .fontSize(24.px)
                .width(30.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(200.px)
                .height(200.px)
                .radialGradient(
                    (100.0.px, 100.0.px),
                    120.0,
                    colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 0.5)],
                    repeating: true
                )
        }
    }
}
```

![gradientColor3](figures/gradientColor3.png)
