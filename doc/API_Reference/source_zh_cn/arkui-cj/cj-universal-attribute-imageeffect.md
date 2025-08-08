# 图像效果

设置组件的模糊、阴影、球面效果以及设置图片的图像效果。

## func blendMode(BlendMode, BlendApplyType)

```cangjie
public func blendMode(value: BlendMode, `type`: BlendApplyType): This
```

**功能：** 将当前控件的内容（包含子节点内容）与下方画布（可能为离屏画布）已有内容进行混合。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BlendMode](./cj-common-types.md#enum-blendmode)|是|\-|混合模式。<br> 初始值：BlendMode.NONE。<br> **说明：** <br>混合模式设置为BlendMode.NONE时，blend效果实际为默认的BlendMode.SRC_OVER，且BlendApplyType不生效。|
|blendType|[BlendApplyType](./cj-common-types.md#enum-blendapplytype)|是|\-|blendMode实现方式是否离屏。<br> **说明：** <br> 1. 设置BlendApplyType.FAST时，不离屏。<br>2. 设置BlendApplyType.OFFSCREEN时，会创建当前组件大小的离屏画布，再将当前组件（含子组件）的内容绘制到离屏画布上，再用指定的混合模式与下方画布已有内容进行混合。使用该实现方式时，将导致[linearGradientBlur](#func-lineargradientblurfloat64-lineargradientbluroptions)，[backgroundEffect](./cj-universal-attribute-background.md#func-backgroundeffectbackgroundeffectoptions)，[brightness](#func-brightnessfloat64)等需要截屏的接口无法截取到正确的画面。|

## func blur(Float64)

```cangjie
public func blur(value: Float64): This
```

**功能：** 为组件添加内容模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|为当前组件添加内容模糊效果，入参为模糊半径，模糊半径越大越模糊，为 0 时不模糊。|

## func blur(Int64)

```cangjie
public func blur(value: Int64): This
```

**功能：** 为组件添加内容模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|\-|为当前组件添加背景模糊效果，入参为模糊半径，模糊半径越大越模糊，为0时不模糊。|

## func brightness(Float64)

```cangjie
public func brightness(value: Float64): This
```

**功能：** 为组件添加高光效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|为当前组件添加高光效果，入参为高光比例，值为1时没有效果，小于1.0时亮度变暗，0.0为全黑，大于1.0时亮度增加，数值越大亮度越大，亮度为2.0时会变为全白。<br> 初始值：1.0。 <br>取值范围：[0.0, 2.0]。<br>**说明：**<br> 设置小于0.0的值时，按值为0.0处理。|

## func brightness(Int64)

```cangjie
public func brightness(value: Int64): This
```

**功能：** 为组件添加高光效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|\-|为当前组件添加高光效果，入参为高光比例，值为1时没有效果，小于1时亮度变暗，0为全黑，大于1时亮度增加，数值越大亮度越大，亮度为2时会变为全白。<br> 初始值：1。 <br>取值范围：[0, 2]。<br>**说明：**<br> 设置小于0的值时，按值为0处理。|

## func colorBlend(ResourceColor)

```cangjie
public func colorBlend(color: ResourceColor): This
```

**功能：** 为组件添加颜色叠加效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|是|-|为当前组件添加颜色叠加效果，入参为叠加的颜色。|

## func contrast(Float64)

```cangjie
public func contrast(value: Float64): This
```

**功能：** 为组件添加对比度效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|为当前组件添加对比度效果，入参为对比度的值。值为1时，显示原图，大于1.0时，值越大对比度越高，图像越清晰醒目，小于1.0时，值越小对比度越低，当对比度为0.0时，图像变为全灰。<br> 初始值：1.0。 <br>推荐取值范围：[0.0, 10.0)。<br>**说明：**<br> 设置小于0.0的值时，按值为0.0处理。|

## func contrast(Int64)

```cangjie
public func contrast(value: Int64): This
```

**功能：** 为组件添加对比度效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|\-|为当前组件添加对比度效果，入参为对比度的值。值为1时，显示原图，大于1时，值越大对比度越高，图像越清晰醒目，小于1时，值越小对比度越低，当对比度为0时，图像变为全灰。<br> 初始值：1。 <br>推荐取值范围：[0, 10)。<br> **说明：** <br> 设置小于0的值时，按值为0处理。|

## func freeze(Bool)

```cangjie
public func freeze(value: Bool): This
```

**功能：** 设置当前控件和子控件是否整体离屏渲染绘制后重复绘制缓存，不再进行内部属性更新。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|\-|当前控件和子控件是否整体离屏渲染绘制后重复绘制缓存，不再进行内部属性更新。当前控件的不透明度不为1时绘制效果可能有差异。<br> 初始值：false。 <br> true时离屏渲染绘制后重复绘制缓存，false时离屏渲染绘制后不重复绘制缓存。|

## func grayscale(Float64)

```cangjie
public func grayscale(value: Float64): This
```

**功能：** 为组件添加灰度效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|为当前组件添加灰度效果。值定义为灰度转换的比例，入参1.0则完全转为灰度图像，入参0.0则图像无变化，入参在0.0和1.0之间时，效果呈线性变化。 <br> 初始值：0.0。 <br>取值范围：[0.0, 1.0]。<br>**说明：**<br> 设置小于0.0的值时，按值为0.0处理。设置大于1.0的值时，按值为1.0处理。|

## func grayscale(Int64)

```cangjie
public func grayscale(value: Int64): This
```

**功能：** 为组件添加灰度效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|\-|为当前组件添加灰度效果。值定义为灰度转换的比例，入参1则完全转为灰度图像，入参0则图像无变化，入参在0和1之间时，效果呈线性变化。 <br> 初始值：0。 <br>取值范围：[0, 1]。<br>**说明：**<br> 设置小于0的值时，按值为0处理。设置大于1的值时，按值为1处理。|

## func hueRotate(Float32)

```cangjie
public func hueRotate(value: Float32): This
```

**功能：** 色相旋转效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float32|是|\-|色相旋转效果，输入参数为旋转角度。<br>初始值：0.0。 <br>取值范围：(-∞, +∞)。 <br>**说明：**<br>色调旋转360度会显示原始颜色。先将色调旋转 180 度，然后再旋转-180度会显示原始颜色。|

## func hueRotate(Int32)

```cangjie
public func hueRotate(value: Int32): This
```

**功能：** 色相旋转效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|\-|色相旋转效果，输入参数为旋转角度。<br>初始值：0。 <br>取值范围：(-∞, +∞)。 <br>**说明：**<br>色调旋转360度会显示原始颜色。先将色调旋转 180 度，然后再旋转-180度会显示原始颜色。|

## func invert(Float64)

```cangjie
public func invert(value: Float64): This
```

**功能：** 反转输入的图像。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|反转输入的图像。入参为图像反转的比例，值为1.0时完全反转，值为0.0则图像无变化。<br> 初始值：0.0。 <br>取值范围：[0.0, 1.0]。<br>**说明：**<br> 设置小于0.0的值时，按值为0.0处理。|

## func invert(Int64)

```cangjie
public func invert(value: Int64): This
```

**功能：** 反转输入的图像。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|\-|反转输入的图像。入参为图像反转的比例，值为1时完全反转，值为0则图像无变化。<br> 初始值：0。 <br>取值范围：[0, 1]。<br>**说明：**<br> 设置小于0的值时，按值为0处理。|

## func invert(Float64, Float64, Float64, Float64)

```cangjie
public func invert(low!: Float64, high!: Float64, threshold!: Float64, thresholdRange!: Float64): This
```

**功能：** 反转输入的图像。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|low|Float64|是|-| **命名参数。** 背景颜色灰度值大于阈值区间时的取值。<br> 取值范围：[0,1]。|
|high|Float64|是|-| **命名参数。** 背景颜色灰度值小于阈值区间时的取值。<br> 取值范围：[0,1]。|
|threshold|Float64|是|-| **命名参数。** 灰度阈值。<br> 取值范围：[0,1]。|
|thresholdRange|Float64|是|-| **命名参数。** 阈值范围。<br> 取值范围：[0,1]。 <br>**说明：**<br> 灰度阈值上下偏移thresholdRange构成阈值区间，背景颜色灰度值在区间内取值由high线性渐变到low。|

## func lightUpEffect(Float64)

```cangjie
public func lightUpEffect(value: Float64): This
```

**功能：** 设置组件图像亮起程度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|组件图像亮起程度。<br> 取值范围：[0,1]。<br> 如果value等于0则图像为全黑，如果value等于1则图像为全亮效果。0到1之间数值越大，表示图像亮度越高。value < 0 或者 value > 1为异常情况，value < 0按0处理，value > 1按1处理。|

## func linearGradientBlur(Float64, LinearGradientBlurOptions)

```cangjie
public func linearGradientBlur(value: Float64, options: LinearGradientBlurOptions): This
```

**功能：** 为组件添加内容线性渐变模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|模糊半径，模糊半径越大越模糊，为0时不模糊。<br>取值范围：\[0, 1000]。<br>线性梯度模糊包含两个部分fractionStops和direction。|
|options|[LinearGradientBlurOptions](#class-lineargradientbluroptions)|是|-|线性渐变模糊效果。|

## func renderGroup(Bool)

```cangjie
public func renderGroup(value: Bool): This
```

**功能：** 设置当前控件和子控件是否先整体离屏渲染绘制后再与父控件融合绘制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|\-|当前控件和子控件是否先整体离屏渲染绘制后再与父控件融合绘制。当前控件的不透明度不为1时绘制效果可能有差异。<br>初始值：false。|

## func pixelStretchEffect(Length, Length, Length, Length)

```cangjie
public func pixelStretchEffect(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp,
    left!: Length = 0.vp): This
```

**功能：** 设置组件的图像边缘像素扩展距离。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

> **说明：**
>
> - 如果距离为正值，表示向外扩展，放大原来图像大小。上下左右四个方向分别用边缘像素填充，填充的距离即为设置的边缘扩展的距离。
> - 如果距离为负值，表示内缩，但是最终图像大小不变。<br> 内缩方式：<br> 图像根据参数的设置缩小，缩小大小为四个方向边缘扩展距离的绝对值。图像用边缘像素扩展到原来大小。
> - 对参数的输入约束：上下左右四个方向的扩展统一为非正值或者非负值。即四个边同时向外扩或者内缩，方向一致。<br> 所有方向的输入均为百分比或者具体值，不支持百分比和具体值混用。<br> 所有异常情况下，显示为{0，0，0，0}效果，即跟原图保持一致。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[Length](./cj-common-types.md#interface-length)|否|0.vp| **命名参数。** 组件图像上边沿像素扩展距离。|
|right|[Length](./cj-common-types.md#interface-length)|否|0.vp| **命名参数。** 组件图像右边沿像素扩展距离。|
|bottom|[Length](./cj-common-types.md#interface-length)|否|0.vp| **命名参数。** 组件图像下边沿像素扩展距离。|
|left|[Length](./cj-common-types.md#interface-length)|否|0.vp| **命名参数。** 组件图像左边沿像素扩展距离。|

## func saturate(Float64)

```cangjie
public func saturate(value: Float64): This
```

**功能：** 为组件添加饱和度效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-| 为当前组件添加饱和度效果，饱和度为颜色中的含色成分和消色成分(灰)的比例，入参为1时，显示原图像，大于1.0时含色成分越大，饱和度越大，小于1.0时消色成分越大，饱和度越小。<br> 初始值：1.0。 <br>推荐取值范围：[0.0, 50.0)。<br>**说明：**<br> 设置小于0.0的值时，按值为0.0处理。|

## func saturate(Int64)

```cangjie
public func saturate(value: Int64): This
```

**功能：** 为组件添加饱和度效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|\-|为当前组件添加饱和度效果，饱和度为颜色中的含色成分和消色成分(灰)的比例，入参为1时，显示原图像，大于1时含色成分越大，饱和度越大，小于1时消色成分越大，饱和度越小。<br> 初始值：1。<br>推荐取值范围：[0, 50)。<br>**说明：**<br> 设置小于0的值时，按值为0处理。|

## func sepia(Float64)

```cangjie
public func sepia(value: Float64): This
```

**功能：** 将图像转换为深褐色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|将图像转换为深褐色，降低色彩度，产生温暖复古的图像风格。入参为褐色滤镜强度，值为1则完全是深褐色的，值小于等于0则图像无变化，值大于1会进一步放大色彩偏移比例，图像整体会变得更亮且色彩更加偏黄/偏红，但不属于标准sepia效果。<br> 取值范围：[0.0, +∞)，推荐取值范围：(0.0, 1.0]。|

## func sepia(Int64)

```cangjie
public func sepia(value: Int64): This
```

**功能：** 将图像转换为深褐色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|\-|将图像转换为深褐色，降低色彩度，产生温暖复古的图像风格。入参为褐色滤镜强度，值为1则完全是深褐色的，值小于等于0则图像无变化，值大于1会进一步放大色彩偏移比例，图像整体会变得更亮且色彩更加偏黄/偏红，但不属于标准sepia效果。<br> 取值范围：[0, +∞)，推荐取值范围：(0, 1]。|

## func shadow(Float64, ResourceColor, Float64, Float64)

```cangjie
public func shadow(
    radius!: Float64,
    color!: ResourceColor = Color(0x666666),
    offsetX!: Float64 = 0.0,
    offsetY!: Float64 = 0.0
): This
```

**功能：** 为组件添加阴影效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|radius|Float64|是|\-| **命名参数。** 阴影模糊半径。<br>取值范围：[0, +∞)。<br>单位：px。<br>**说明：**<br> 设置小于0的值时，按值为0处理。|
|color|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|否|0x666666| **命名参数。** 阴影的颜色|
|offsetX|Float64|否|0.0| **命名参数。** 阴影的X轴偏移量。<br>单位：px。|
|offsetY|Float64|否|0.0| **命名参数。** 阴影的Y轴偏移量。<br>单位：px。|

## func shadow(Int64, ResourceColor, Int64, Int64)

```cangjie
public func shadow(
    radius!: Int64,
    color!: ResourceColor = Color(0x666666),
    offsetX!: Int64 = 0,
    offsetY!: Int64 = 0
): This
```

**功能：** 为组件添加阴影效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|radius|Int64|是|\-| **命名参数。** 阴影模糊半径。<br>取值范围：[0, +∞)。<br>单位：px。<br>**说明：**<br> 设置小于0的值时，按值为0处理。|
|color|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|否|0x666666| **命名参数。** 阴影的颜色|
|offsetX|Int64|否|0| **命名参数。** 阴影的X轴偏移量。<br>单位：px。|
|offsetY|Int64|否|0| **命名参数。** 阴影的Y轴偏移量。<br>单位：px。|

## func sphericalEffect(Float64)

```cangjie
public func sphericalEffect(value: Float64): This
```

**功能：** 设置组件的图像球面化程度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|\-|设置组件的图像球面化程度。<br> 取值范围：[0,1]。<br> **说明：** <br> 1. 如果value等于0则图像保持原样，如果value等于1则图像为完全球面化效果。在0和1之间，数值越大，则球面化程度越高。value < 0 或者 value > 1为异常情况，value < 0按0处理，value > 1按1处理。 <br> 2. 组件阴影和外描边不支持球面效果。<br> 3. 设置value大于0时，组件冻屏不更新并且把组件内容绘制到透明离屏buffer上，如果要更新组件属性则需要把value设置为0。|

## func systemBarEffect()

```cangjie
public func systemBarEffect(): This
```

**功能：** 根据背景进行智能反色并且带有模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

## func useShadowBatching(Bool)

```cangjie
public func useShadowBatching(value: Bool): This
```

**功能：** 控件内部子节点的阴影进行同层绘制，同层元素阴影重叠。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|\-|控件内部子节点的阴影进行同层绘制，同层元素阴影重叠。 <br> 初始值：false。<br>**说明：** <br> 1. 默认不开启，如果子节点的阴影半径较大，节点各自的阴影会互相重叠。 当开启时，元素的阴影将不会重叠。<br>2. 不推荐useShadowBatching嵌套使用，如果嵌套使用，只会对当前的子节点生效，无法递推。|

## 基础类型定义

### class LinearGradientBlurOptions

```cangjie
public class LinearGradientBlurOptions {
    public LinearGradientBlurOptions(
        public var fractionStops!: Array<(Float64, Float64)>,
        public var direction!: GradientDirection
    )
}
```

**功能：** 设置线性渐变模糊效果。

**起始版本：** 19

#### var direction

```cangjie
public var direction: GradientDirection
```

**功能：** 渐变模糊方向。

**类型：** [GradientDirection](./cj-common-types.md#enum-gradientdirection)

**读写能力：** 可读写

**起始版本：** 19

#### var fractionStops

```cangjie
public var fractionStops: Array<(Float64, Float64)>
```

**功能：** 数组中保存的每一个二元数组（取值0-1，小于0则为0，大于1则为1）表示\[模糊程度, 模糊位置]。

**类型：** Array\<(Float64, Float64)>

**读写能力：** 可读写

**起始版本：** 19

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

> **说明：**
>
> 模糊位置需严格递增，开发者传入的数据不符合规范会记录日志。渐变模糊数组中二元数组个数必须大于等于2，否则渐变模糊不生效。

#### LinearGradientBlurOptions(Array\<(Float64, Float64)>, GradientDirection)

```cangjie
public LinearGradientBlurOptions(
    public var fractionStops!: Array<(Float64, Float64)>,
    public var direction!: GradientDirection
)
```

**功能：** 创建 LinearGradientBlurOptions 对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fractionStops|Array\<(Float64, Float64)>|是|\-| **命名参数。** 数组中保存的每一个二元数组（取值0-1，小于0则为0，大于1则为1）表示\[模糊程度, 模糊位置]；模糊位置需严格递增，开发者传入的数据不符合规范会记录日志，渐变模糊数组中二元数组个数必须大于等于2，否则渐变模糊不生效。|
|direction|[GradientDirection](./cj-common-types.md#enum-gradientdirection)|是|\-| **命名参数。** 渐变模糊方向。<br>初始值：GradientDirection.Bottom。|

## 示例代码

### 示例1（设置图片不同属性效果）

设置图片的效果，包括阴影，灰度，高光，饱和度，对比度，图像反转，叠色，色相旋转等。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    @State
    var cnt: Int64 = 0
    func build() {
        Scroll() {
            Column(10) {
                Text("font blur")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Flex(FlexParams(alignItems: ItemAlign.Center)) {
                    Text("original text")
                        .margin(10)
                    Text("blur text")
                        .blur(5)
                        .margin(10)
                    Text("blur text")
                        .blur(10)
                        .margin(10)
                    Text("blur text")
                        .blur(15)
                        .margin(10)
                }
                    .width(90.percent)
                    .height(40)
                    .backgroundColor(0xF9CF93)

                // 对背景进行模糊
                Text("backdropBlur")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Text("")
                    .width(90.percent)
                    .height(40)
                    .fontSize(16)
                    .backdropBlur(3)
                    .backgroundImage(src: @r(app.media.icon))
                    .backgroundImageSize(width: 300, height: 160)

                Text("shadow")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .shadow(radius: 10)
                    .height(40)

                // 灰度效果0~1，越接近1，灰度越明显
                Text("grayscale")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                Image(@r(app.media.icon))
                    .grayscale(0.3)
                    .height(40)
                Image(@r(app.media.icon))
                    .grayscale(0.8)
                    .height(40)

                // 高光效果，1为正常图片，<1变暗，>1亮度增大
                Text("brightness")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                Image(@r(app.media.icon))
                    .brightness(1.8)
                    .height(40)
                Image(@r(app.media.icon))
                    .brightness(0)
                    .height(40)

                // 饱和度，原图为1
                Text("saturate")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .saturate(2.0)
                    .height(40)
                Image(@r(app.media.icon))
                    .saturate(0.7)
                    .height(40)

                // 对比度，1为原图，>1值越大越清晰，<1值越小越模糊
                Text("contrast")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .contrast(2.0)
                    .height(40)
                Image(@r(app.media.icon))
                    .contrast(0.8)
                    .height(40)

                // 图像反转比例
                Text("invert")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .invert(0.2)
                    .height(40)
                Image(@r(app.media.icon))
                    .invert(0.8)
                    .height(40)

                // 叠色添加
                Text("colorBlend")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .colorBlend(Color.GREEN)
                    .height(40)
                Image(@r(app.media.icon))
                    .colorBlend(Color.BLUE)
                    .height(40)

                // 深褐色
                Text("sepia")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .sepia(0.8)
                    .height(40)

                // 色相旋转
                Text("hueRotate")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .hueRotate(90)
                    .height(40)
            }
        }
    }
}
```

![uni_image_effect](figures/uni_image_effect.png)

### 示例2（设置图片不同变化效果）

该示例主要演示通过invert来实现前景智能取反色，通过pixelStretchEffect设置组件的图像边缘像素扩展效果，通过blendMode将当前组件内容与下方画布内容混合，通过lightUpEffect设置组件的图像渐亮效果，通过sphericalEffect设置组件的图像球面效果，通过renderGroup来设置组件是否先整体离屏渲染绘制后，再与父控件融合绘制，通过systemBarEffect来实现系统导航条智能反色，通过useShadowBatching搭配shadow实现同层阴影不重叠效果，通过freeze设置当前控件和子控件是否整体离屏渲染绘制后重复绘制缓存，通过linearGradientBlur设置组件的内容线性渐变模糊效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.resource_manager.{AppResource, __GenerateResource__}

@Entry
@Component
class EntryView {
    public func build() {
        Scroll() {
            Column() {
                Text("invert").margin(5)
                Stack() {
                    Column()
                    Stack() {
                        Image(@r(app.media.background))
                        Column() {
                            Column()
                                .width(100.percent)
                                .height(30.vp)
                                .invert(
                                    low: 0.0,
                                    high: 1.0,
                                    threshold: 0.5,
                                    thresholdRange: 0.2
                                )
                            Column()
                                .width(100.percent)
                                .height(30.vp)
                                .invert(
                                    low: 0.2,
                                    high: 0.5,
                                    threshold: 0.3,
                                    thresholdRange: 0.2
                                )
                        }
                    }
                    .width(100.vp)
                    .height(100.vp)
                }

                Text("pixelStretchEffect").margin(5)
                Column() {
                    Text('This is the text content with letterSpacing 0.')
                        .letterSpacing(0)
                        .fontSize(12)
                        .borderWidth(1.vp)
                        .padding(10.vp)
                        .width(50.percent)
                        .pixelStretchEffect(top: 5.vp, left: 20.vp, bottom: 10.vp)
                        .id("test_pixelStretchEffect")
                }
                .width(200.vp)
                .height(110.vp)
                Column() {
                    Text('This is the text content with letterSpacing 0.')
                        .letterSpacing(0)
                        .fontSize(12)
                        .borderWidth(1.vp)
                        .padding(10.vp)
                        .width(50.percent)
                }
                .width(200.vp)
                .height(110.vp)

                Text("blendMode")
                Column() {
                    Column() {
                        Text("Blue")
                            .width(40)
                            .height(40)
                            .backgroundColor(Color.BLUE)
                        Text("red")
                            .width(40)
                            .height(40)
                            .backgroundColor(Color.RED)
                            .position(x: 20, y: 20)
                    }
                        .height(80)
                        .width(100)
                        .blendMode(BlendMode.OVERLAY, BlendApplyType.OFFSCREEN)
                        .id("test_blendMode")
                }
                    .height(90)
                    .width(200)
                    .backgroundImage(repeat: ImageRepeat.X, src: @r(app.media.background))

                Text("lightUpEffect")
                Text('This is the text content with letterSpacing 0.')
                    .borderWidth(1)
                    .padding(10)
                    .width(100)
                    .lightUpEffect(0.6)
                    .id("test_lightUpEffect")

                Text("sphericalEffect")
                TextInput(placeholder: "请输入变化范围百分比（[0%,100%]）")
                    .width(200)
                    .height(35)
                    .caretColor(Color.RED)
                    .placeholderColor(Color.BLUE)
                    .placeholderFont(size: 20.vp)
                    .sphericalEffect(0.5)
                    .id("test_sphericalEffect")

                Text("renderGroup")
                Column() {
                    Row() {
                        Row() {
                            Row()
                                .backgroundColor(Color.BLACK)
                                .width(100.vp)
                                .height(100.vp)
                                .opacity(1)
                        }
                        .backgroundColor(Color.WHITE)
                        .width(150.vp)
                        .height(150.vp)
                        .justifyContent(FlexAlign.Center)
                        .opacity(0.6)
                        .renderGroup(true)
                    }
                    .backgroundColor(Color.BLACK)
                    .width(200)
                    .height(200)
                    .justifyContent(FlexAlign.Center)
                    .opacity(1)
                    .margin(20.vp)

                    Row() {
                        Row() {
                            Row()
                                .backgroundColor(Color.BLACK)
                                .width(100.vp)
                                .height(100.vp)
                                .opacity(1)
                        }
                        .backgroundColor(Color.WHITE)
                        .width(150.vp)
                        .height(150.vp)
                        .justifyContent(FlexAlign.Center)
                        .opacity(0.6)
                        .renderGroup(false)
                        .id("test_renderGroup")
                    }
                    .backgroundColor(Color.BLACK)
                    .width(200)
                    .height(200)
                    .justifyContent(FlexAlign.Center)
                    .opacity(1)
                    .margin(20.vp)
                }
                .width(380.vp)
                .height(500.vp)

                Text("systemBarEffect")
                Stack() {
                    Image("")
                        .width(100)
                        .height(100)
                        .backgroundColor(Color.BLUE)
                    Column()
                        .width(80)
                        .height(10)
                        .systemBarEffect()
                        .borderRadius(5)
                        .margin(bottom: 20)
                        .id("test_systemBarEffect")
                }

                Text("useShadowBatching")
                Column() {
                    Column() {
                    }
                    .width(200)
                    .height(30)
                    .margin(top: 5)
                    .backgroundColor(0xFFE4C4)
                    .shadow(radius: 120, color: Color.GREEN, offsetX: 0, offsetY: 0)

                    Column() {
                    }
                    .width(200)
                    .height(30)
                    .margin(top: 5)
                    .backgroundColor(0xFFE4C4)
                    .shadow(radius: 120, color: Color.RED, offsetX: 0, offsetY: 0)
                    .backgroundColor(Color.WHITE)
                }
                .borderWidth(1)
                .width(300)
                .height(100)
                .useShadowBatching(true)
                .id("test_useShadowBatching")

                Text("freeze")
                Column() {
                    Text("freeze: true")
                        .width(100)
                        .height(40)
                        .backgroundColor(Color.BLUE)
                }
                .opacity(0.5)
                .freeze(true)
                .id("test_freeze")
                Column() {
                    Text("freeze: false")
                        .width(100)
                        .height(40)
                        .backgroundColor(Color.BLUE)
                }
                .opacity(0.5)
                .freeze(false)

                Text("linearGradientBlur")
                Image(@r(app.media.startIcon))
                    .linearGradientBlur(
                        60.0,
                        LinearGradientBlurOptions(fractionStops: [(0.0, 0.0), (0.0, 0.33), (1.0, 0.66), (1.0, 1.0)],
                        direction: GradientDirection.Bottom)
                    )
                    .width(200)
                    .height(200)
                    .id("test_linearGradientBlur")
            }
            .width(380)
            .borderWidth(1)
            .backgroundColor(Color.GRAY)
        }
    }
}
```

![uni_image_effect](figures/uni_image_effect_1.png)

![uni_image_effect](figures/uni_image_effect_2.png)

![uni_image_effect](figures/uni_image_effect_3.png)
