# 组件内转场 (transition)

组件内转场主要通过transition属性配置转场参数，在组件插入和删除时显示过渡动效，主要用于容器组件中的子组件插入和删除时，提升用户体验。

> **说明：**
>
> 当前有两种方式触发组件的transition：
>
> - 当组件插入或删除时（如if条件改变、ForEach新增删除组件），会递归的触发所有新插入/删除的组件的transition效果。
> - 当组件[Visibility](./cj-universal-attribute-visibility.md)属性在可见和不可见之间改变时，只触发该组件的transition效果。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class RotateOptions

```cangjie
public class RotateOptions {
    public var angle: Float32
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public var centerX: Length
    public var centerY: Length
    public var centerZ: Length
    public var perspective: Float32
    public init(angle: Float32, x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 0.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent, centerZ!: Length = 0, perspective!: Float32 = 0.0)
}
```

**功能：** 设置旋转参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var angle

```cangjie
public var angle: Float32
```

**功能：** 表示旋转角度。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerX

```cangjie
public var centerX: Length
```

**功能：** 表示组件变换中心点（即锚点）的x方向坐标。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerY

```cangjie
public var centerY: Length
```

**功能：** 表示组件变换中心点（即锚点）的y方向坐标。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerZ

```cangjie
public var centerZ: Length
```

**功能：** 表示z轴锚点，即3D旋转中心点的z轴分量。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var perspective

```cangjie
public var perspective: Float32
```

**功能：** 表示视距，即视点到z=0平面的距离。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float32
```

**功能：** 表示旋转轴向量x坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float32
```

**功能：** 表示旋转轴向量y坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var z

```cangjie
public var z: Float32
```

**功能：** 表示旋转轴向量z坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Float32, Float32, Float32, Float32, Length, Length, Length, Float32)

```cangjie
public init(angle: Float32, x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 0.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent, centerZ!: Length = 0, perspective!: Float32 = 0.0)
```

**功能：** RotateOptions构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|angle|Float32|是|-|旋转角度。取值为正时相对于旋转轴方向顺时针转动，取值为负时相对于旋转轴方向逆时针转动。|
|x|Float32|否|0.0| **命名参数。** 旋转轴向量x坐标。|
|y|Float32|否|0.0| **命名参数。** 旋转轴向量y坐标。|
|z|Float32|否|0.0| **命名参数。** 旋转轴向量z坐标。|
|centerX|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|50.percent| **命名参数。** 变换中心点x轴坐标。表示组件变换中心点（即锚点）的x方向坐标。|
|centerY|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|50.percent| **命名参数。** 变换中心点y轴坐标。表示组件变换中心点（即锚点）的y方向坐标。|
|centerZ|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0| **命名参数。** z轴锚点，即3D旋转中心点的z轴分量。|
|perspective|Float32|否|0.0| **命名参数。** 视距，即视点到z=0平面的距离。<br>旋转轴和旋转中心点都基于坐标系设定，组件发生位移时，坐标系不会随之移动。|

## class ScaleOptions

```cangjie
public class ScaleOptions {
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public var centerX: Length
    public var centerY: Length
    public init(x!: Float32 = 1.0, y!: Float32 = 1.0, z!: Float32 = 1.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent)
}
```

**功能：** 设置缩放参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerX

```cangjie
public var centerX: Length
```

**功能：** 表示变换中心点x轴坐标。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerY

```cangjie
public var centerY: Length
```

**功能：** 表示变换中心点y轴坐标。

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float32
```

**功能：** 表示x轴的缩放倍数。x>1时以x轴方向放大，0\<x\<1时以x轴方向缩小，x\<0时沿x轴反向并缩放。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float32
```

**功能：** 表示y轴的缩放倍数。y>1时以y轴方向放大，0\<y\<1时以y轴方向缩小，y\<0时沿y轴反向并缩放。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var z

```cangjie
public var z: Float32
```

**功能：** 表示z轴的缩放倍数。z>1时以z轴方向放大，0\<z\<1时以z轴方向缩小，z\<0时沿z轴反向并缩放。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Float32, Float32, Float32, Length, Length)

```cangjie
public init(x!: Float32 = 1.0, y!: Float32 = 1.0, z!: Float32 = 1.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent)
```

**功能：** ScaleOptions构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|否|1.0| **命名参数。** x轴的缩放倍数。x>1时以x轴方向放大，0<x<1时以x轴方向缩小，x<0时沿x轴反向并缩放。|
|y|Float32|否|1.0| **命名参数。** y轴的缩放倍数。y>1时以y轴方向放大，0<y<1时以y轴方向缩小，y<0时沿y轴反向并缩放。|
|z|Float32|否|1.0| **命名参数。** z轴的缩放倍数。z>1时以z轴方向放大，0<z<1时以z轴方向缩小，z<0时沿z轴反向并缩放。|
|centerX|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|50.percent| **命名参数。** 变换中心点x轴坐标。表示组件变换中心点（即锚点）的x方向坐标。|
|centerY|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|50.percent| **命名参数。** 变换中心点y轴坐标。表示组件变换中心点（即锚点）的y方向坐标。|

## class TransitionEffect

```cangjie
public class TransitionEffect {
    public static let IDENTITY: TransitionEffect = unsafe {    TransitionEffect(FfiOHOSAceFrameworkTransitionEffectIdentity())}
    public static let OPACITY: TransitionEffect = TransitionEffect.opacity(0.0)
    public static let SLIDE: TransitionEffect = TransitionEffect.asymmetric(TransitionEffect.move(TransitionEdge.Start), TransitionEffect.move(TransitionEdge.End))
    public static let SLIDE_SWITCH: TransitionEffect = unsafe {    TransitionEffect(FfiOHOSAceFrameworkTransitionEffectSlideSwitch())}
}
```

**功能：** 以函数形式指定转场效果类型。

> **说明：**
>
> - TransitionEffect可通过combine函数实现多个转场效果的组合，可以为每个效果分别指定animation参数，且前一效果的animation的参数也可适用于后一效果。例如，TransitionEffect.OPACITY.animation(AnimateParam(duration: 1000)).combine(TransitionEffect.translate(TranslateOptions(x:100)))，则时长为1000ms的动画参数对OPACITY和translate均生效。
> - 动画参数的生效顺序为：本TransitionEffect指定的animation参数 > 前面的TransitionEffect指定的animation参数 > 触发该组件出现消失的animateTo中的动画参数。
> - 如果未使用animateTo触发转场动画且TransitionEffect中也无animation参数，则该组件直接出现或者消失。
> - TransitionEffect中指定的属性值如与默认值相同，则该属性不会产生转场动画。如TransitionEffect.opacity(1.0).animation(AnimateParam(duration: 1000))，由于opacity默认值也为1.0，未产生透明度动画，该组件直接出现或者消失。
> - 更详细的关于scale、rotate效果的介绍可参考[图形变换](./cj-universal-attribute-transform.md)。
> - 如果在动画范围([animateTo](./cj-animation-animateto.md)、[animation](./cj-animation-animation.md))内触发组件的上下树或可见性([Visibility](./cj-universal-attribute-visibility.md))改变，而根组件没有配置transition，会给该组件加上默认透明度转场，即TransitionEffect.OPACITY，动画参数跟随所处动画环境的参数。如不需要可通过主动配置TransitionEffect.IDENTITY来禁用，使该组件直接出现或消失。
> - 当通过删除整棵子树的方式触发消失转场，如需看到完整的消失转场过程，需要保证被删除子树的根组件的有充足的消失转场时间，见[示例3](#示例代码3设置父子组件为transition)。
> - 下述提供的静态函数用于构造TransitionEffect对象，而非静态函数作用于构造好的TransitionEffect对象，以指定多种转场效果的组合效果和动画参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static let IDENTITY

```cangjie
public static let IDENTITY: TransitionEffect = unsafe {    TransitionEffect(FfiOHOSAceFrameworkTransitionEffectIdentity())}
```

**功能：** 禁用转场效果。

**类型：** [TransitionEffect](#class-transitioneffect)

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static let OPACITY

```cangjie
public static let OPACITY: TransitionEffect = TransitionEffect.opacity(0.0)
```

**功能：** 为组件添加透明度转场效果，出现时透明度从0到1、消失时透明度从1到0，相当于TransitionEffect.opacity(0.0)。

**类型：** [TransitionEffect](#class-transitioneffect)

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static let SLIDE

```cangjie
public static let SLIDE: TransitionEffect = TransitionEffect.asymmetric(TransitionEffect.move(TransitionEdge.Start), TransitionEffect.move(TransitionEdge.End))
```

**功能：** 设置从START边滑入，END边滑出。即在LTR模式下，从左侧滑入，右侧滑出；在RTL模式下，从右侧滑入，左侧滑出。相当于TransitionEffect.asymmetric(TransitionEffect.move(TransitionEdge.START), TransitionEffect.move(TransitionEdge.END))。

**类型：** [TransitionEffect](#class-transitioneffect)

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static let SLIDE_SWITCH

```cangjie
public static let SLIDE_SWITCH: TransitionEffect = unsafe {    TransitionEffect(FfiOHOSAceFrameworkTransitionEffectSlideSwitch())}
```

**功能：** 指定出现时从右先缩小再放大侧滑入、消失时从左侧先缩小再放大滑出的转场效果。自带动画参数，也可覆盖动画参数，自带的动画参数时长600ms，指定动画曲线cubicBezierCurve(0.24, 0.0, 0.50, 1.0)，最小缩放比例为0.8。

**类型：** [TransitionEffect](#class-transitioneffect)

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func asymmetric(TransitionEffect, TransitionEffect)

```cangjie
public static func asymmetric(appear: TransitionEffect, disappear: TransitionEffect): TransitionEffect
```

**功能：** 用于指定非对称的转场效果。

> **说明：**
>
> 如不通过asymmetric函数构造TransitionEffect，则表明该效果在组件出现和消失时均生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|appear|[TransitionEffect](#class-transitioneffect)|是|-|指定出现的转场效果。|
|disappear|[TransitionEffect](#class-transitioneffect)|是|-|指定消失的转场效果。|

**返回值：**

|类型|说明|
|:----|:----|
|[TransitionEffect](#class-transitioneffect)|组件转场效果。|

### static func move(TransitionEdge)

```cangjie
public static func move(edge: TransitionEdge): TransitionEffect
```

**功能：** 指定组件转场时从屏幕边缘滑入和滑出的效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|edge|[TransitionEdge](#enum-transitionedge)|是|-|指定组件转场时从屏幕边缘滑入和滑出的效果，本质为平移效果，为插入时起点和删除时终点的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[TransitionEffect](#class-transitioneffect)|组件转场效果。|

### static func opacity(Float64)

```cangjie
public static func opacity(alpha: Float64): TransitionEffect
```

**功能：** 设置组件转场时的透明度效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|alpha|Float64|是|-|设置组件转场时的透明度效果，为插入时起点和删除时终点的值。取值范围：[0, 1]。<br> **说明：** <br>设置小于0的非法值按0处理，大于1的非法值按1处理。|

**返回值：**

|类型|说明|
|:----|:----|
|[TransitionEffect](#class-transitioneffect)|组件转场效果。|

### static func rotate(RotateOptions)

```cangjie
public static func rotate(options: RotateOptions): TransitionEffect
```

**功能：** 设置组件转场时的旋转效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[RotateOptions](#class-rotateoptions)|是|-|设置组件转场时的旋转效果，为插入时起点和删除时终点的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[TransitionEffect](#class-transitioneffect)|组件转场效果。|

### static func scale(ScaleOptions)

```cangjie
public static func scale(options: ScaleOptions): TransitionEffect
```

**功能：** 设置组件转场时的缩放效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[ScaleOptions](#class-scaleoptions)|是|-|设置组件转场时的缩放效果，为插入时起点和删除时终点的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[TransitionEffect](#class-transitioneffect)|组件转场效果。|

### static func translate(TranslateOptions)

```cangjie
public static func translate(options: TranslateOptions): TransitionEffect
```

**功能：** 设置组件转场时的平移效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[TranslateOptions](#class-translateoptions)|是|-|设置组件转场时的平移效果，为插入时起点和删除时终点的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[TransitionEffect](#class-transitioneffect)|组件转场效果。|

### func animation(AnimateParam)

```cangjie
public func animation(value: AnimateParam): TransitionEffect
```

**功能：** 指定该TransitionEffect的动画参数。

> **说明：**
>
> 该参数只用来指定动画参数，其入参AnimateParam的onFinish回调不生效。如果通过combine进行TransitionEffect的组合，前一TransitionEffect的动画参数也可用于后一TransitionEffect。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AnimateParam](./cj-common-types.md#class-animateparam)|是|-|动画效果参数。|

**返回值：**

|类型|说明|
|:----|:----|
|[TransitionEffect](#class-transitioneffect)|组件转场效果。|

### func combine(TransitionEffect)

```cangjie
public func combine(transitionEffect: TransitionEffect): TransitionEffect
```

**功能：** 用于对TransitionEffect进行链式组合，以形成包含多种转场效果的TransitionEffect。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|transitionEffect|[TransitionEffect](#class-transitioneffect)|是|-|用于链式组合的组件转场效果。|

**返回值：**

|类型|说明|
|:----|:----|
|[TransitionEffect](#class-transitioneffect)|组件转场效果。|

## class TranslateOptions

```cangjie
public class TranslateOptions {
    public var x: Length
    public var y: Length
    public var z: Length
    public init(x!: Length = 0.0.vp, y!: Length = 0.0.vp, z!: Length = 0.0.vp)
}
```

**功能：** 设置平移参数

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Length
```

**功能：** 表示x轴的平移距离

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Length
```

**功能：** 表示y轴的平移距离

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var z

```cangjie
public var z: Length
```

**功能：** 表示z轴的平移距离

**类型：** [Length](../BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Length, Length, Length)

```cangjie
public init(x!: Length = 0.0.vp, y!: Length = 0.0.vp, z!: Length = 0.0.vp)
```

**功能：** TranslateOptions构造函数

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.0.vp| **命名参数。** x轴的平移距离。<br>单位为vp。<br>取值范围 (-∞, +∞)|
|y|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.0.vp| **命名参数。** y轴的平移距离。<br>单位为vp。<br>取值范围 (-∞, +∞)|
|z|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.0.vp| **命名参数。** z轴的平移距离。<br>单位为vp。<br>取值范围 (-∞, +∞)|

## enum TransitionEdge

```cangjie
public enum TransitionEdge <: Equatable<TransitionEdge> {
    | Top
    | Bottom
    | Start
    | End
    | ...
}
```

**功能：** 窗口的边缘信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<TransitionEdge>

### Bottom

```cangjie
Bottom
```

**功能：** 设置窗口的下边缘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### End

```cangjie
End
```

**功能：** 设置窗口的终止边缘，LTR时为右边缘，RTL时为左边缘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Start

```cangjie
Start
```

**功能：** 设置窗口的起始边缘，LTR时为左边缘，RTL时为右边缘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 设置窗口的上边缘。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(TransitionEdge)

```cangjie
public operator func !=(other: TransitionEdge): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TransitionEdge](#enum-transitionedge)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

### func ==(TransitionEdge)

```cangjie
public operator func ==(other: TransitionEdge): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TransitionEdge](#enum-transitionedge)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## func transition(TransitionEffect)

```cangjie
public func transition(value: TransitionEffect): This
```

**功能：** 设置组件的过渡效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|TransitionEffect|是|-|以函数的形式指定转场效果。|

## func transition(TransitionEffect, ?TransitionFinishCallback)

```cangjie
public func transition(value: TransitionEffect, onFinish: ?TransitionFinishCallback): This
```

**功能：** 设置组件插入显示和删除隐藏的过渡效果和转场动画结束回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[TransitionEffect](#class-transitioneffect)|是|-|以函数的形式指定转场效果。|
|onFinish|?[TransitionFinishCallback](./cj-common-types.md#type-transitionfinishcallback)|是|-|组件转场动画的结束回调函数。|

## 示例代码

### 示例代码1（使用同一接口实现图片出现消失）

该示例主要演示如何通过同一TransitionEffect来实现图片的出现与消失，出现和消失互为逆过程。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    @State var flag = true
    @State var show = "show"
    func build() {
        Column {
            Button(this.show)
                .onClick {
                    evt =>
                    Hilog.info(0, "cangjie", "Hello Cangjie")
                    if (this.flag) {
                        this.show = "hide"
                    } else {
                        this.show = "show"
                    }
                    this.flag = !this.flag
                }
                .width(800.px)
                .height(400.px)

            if (this.flag) {
                Button("abc")
                    .width(800.px)
                    .height(400.px)
                    .transition(
                        TransitionEffect
                            .OPACITY
                            .animation(AnimateParam(duration: 2000, curve: Curve.Ease))
                            .combine(TransitionEffect.rotate(RotateOptions(180.0, z: 1.0))))
            }
        }
    }
}
```

![transition](figures/transition_api.gif)

### 示例代码2（使用不同接口实现图片出现消失）

该示例主要演示使用不同TransitionEffect来实现图片的出现和消失。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    @State var flag = true
    @State var show = "show"
    func build() {
        Column {
            Button(this.show)
                .onClick {
                    evt =>
                    Hilog.info(0, "cangjie", "Hello Cangjie")
                    if (this.flag) {
                        this.show = "hide"
                    } else {
                        this.show = "show"
                    }
                    this.flag = !this.flag
                }
                .width(800.px)
                .height(400.px)

            if (this.flag) {
                Button("abc")
                    .width(800.px)
                    .height(400.px)
                    .transition(
                        TransitionEffect
                            .OPACITY
                            .animation(AnimateParam(duration: 2000, curve: Curve.Ease))
                            .combine(TransitionEffect.rotate(RotateOptions(180.0, z: 1.0))))

                Button("abc")
                    .width(800.px)
                    .height(400.px)
                    .transition(
                        TransitionEffect
                            .asymmetric(
                                TransitionEffect.scale(ScaleOptions()),
                                TransitionEffect.IDENTITY
                            )
                            .animation(AnimateParam(duration: 2000, curve: Curve.Ease)))
            }
        }
    }
}
```

![transition2](./figures/transition2_api.gif)

### 示例代码3（设置父子组件为transition）

该示例主要演示通过父子组件都配置transition来实现图片的出现和消失。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.resource_manager.AppResource

@Entry
@Component
class EntryView {
    @State var flag = true
    @State var show = "show"
    func build() {
        Column {
            Button(this.show)
                .onClick {
                    evt =>
                    Hilog.info(0, "cangjie", "Hello Cangjie")
                    if (this.flag) {
                        this.show = "hide"
                    } else {
                        this.show = "show"
                    }
                    this.flag = !this.flag
                }
                .width(800.px)
                .height(400.px)

            if (this.flag) {
                Column() {
                    Row() {
                        Image(@r(app.media.startIcon))
                            .width(150)
                            .height(150)
                            .id("image1")
                            .transition(TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 2000)))
                    }
                    Image(@r(app.media.startIcon))
                        .width(150)
                        .height(150)
                        .id("image2")
                        .transition(TransitionEffect
                            .OPACITY
                            .animation(AnimateParam(duration: 1000)))
                }.transition(TransitionEffect
                    .OPACITY
                    .animation(AnimateParam(duration: 1000)))
            }
        }
    }
}
```

![transition3](figures/transition3.gif)
