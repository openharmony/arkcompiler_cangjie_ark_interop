# 背景设置

设置组件的背景样式。

## func backdropBlur(Float64)

```cangjie
public func backdropBlur(value: Float64): This
```

**功能：** 为组件添加背景模糊效果，可以自定义设置模糊半径和灰阶参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

| 名称    | 类型     | 必填     | 默认值     |  说明     |
|:-------| :---------- | :------- | :-------- |:--------|
| value  | Float64  | 是 | - | 为当前组件添加背景模糊效果，入参为模糊半径，模糊半径越大越模糊，为0时不模糊。 |

> **说明：**
>
> blur和backdropBlur是实时模糊接口，会每帧进行实时渲染，性能负载较高。

## func backgroundColor(ResourceColor)

```cangjie
public open func backgroundColor(color: ResourceColor): This
```

**功能：** 设置组件背景颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

| 名称    | 类型     | 必填     | 默认值     |  说明     |
|:-------| :---------- | :------- | :-------- |:--------|
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor)  | 是 | - | 组件的背景色。 |

> **说明：**
>
> 当通过[backgroundBlurStyle](./cj-universal-attribute-background.md#func-backgroundblurstyleblurstyle-optionbackgroundblurstyleoptions)中的inactiveColor指定背景色时，不建议再通过[backgroundColor](./cj-universal-attribute-background.md#func-backgroundcolorresourcecolor)设置背景色。

## func backgroundImage(AppResource, ImageRepeat)

```cangjie
public func backgroundImage(src!: AppResource, repeat!: ImageRepeat = ImageRepeat.NoRepeat): This
```

**功能：** 设置组件的背景图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

| 名称    | 类型          | 必填     | 默认值     | 说明                                      |
|:--------|:--------------| :------- | :-------- |:----------------------------------------|
| src  | [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource)  | 是 | - | **命名参数。**  图片地址，支持网络图片资源和本地图片资源地址和Base64，不支持svg类型的图片。 |
| repeat  | [ImageRepeat](./cj-common-types.md#enum-imagerepeat) | 否 | ImageRepeat.NoRepeat | **命名参数。**  设置背景图片的重复样式，默认不重复。当设置的背景图片为透明底色图片，且同时设置了backgroundColor时，二者叠加显示，背景颜色在最底部。|

## func backgroundImage(String, ImageRepeat)

```cangjie
public func backgroundImage(src!: String, repeat!: ImageRepeat = ImageRepeat.NoRepeat): This
```

**功能：** 设置组件的背景图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

| 名称     | 类型          | 必填     | 默认值     | 说明                                      |
|:--------|:--------------| :------- | :-------- |:----------------------------------------|
| src | String | 是 | - | **命名参数。**  图片地址，支持网络图片资源和本地图片资源地址和Base64，不支持svg类型的图片。 |
| repeat  | [ImageRepeat](./cj-common-types.md#enum-imagerepeat) | 否 | ImageRepeat.NoRepeat | **命名参数。**  背景图片的重复样式，默认不重复。当设置的背景图片为透明底色图片，且同时设置了backgroundColor时，二者叠加显示，背景颜色在最底部。|

## func backgroundImageSize(ImageSize)

```cangjie
public func backgroundImageSize(imageSize: ImageSize): This
```

**功能：** 设置组件背景图片的宽高。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

| 名称 | 类型| 必填 | 默认值     | 说明                                |
|:----|:---------------|:---| :-------- |:----------------------------------|
|imageSize | [ImageSize](./cj-common-types.md#enum-imagesize) | 是  | - | 背景图像的高度和宽度。<br>初始值：ImageSize.Auto。|

## func backgroundImageSize(Length, Length)

```cangjie
public func backgroundImageSize(width!: Length = 0.vp, height!: Length = 0.vp): This
```

**功能：** 设置组件背景图片的宽高。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

| 名称     | 类型        | 必填     | 默认值     | 说明                                              |
|:--------|:------------| :------- | :-------- |:------------------------------------------------|
| width | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。**  背景图片的宽度。|
| height | [Length](./cj-common-types.md#interface-length)  | 否 | 0.vp | **命名参数。**  背景图片的高度。 |

> **说明：**
>
> - 如果只设置一个属性，则第二个属性保持图片原始宽高比进行调整。默认保持原图的比例不变，width和height取值范围： [0, +∞)。
> - width和height均设置为小于或等于0的值时，按值为0显示。当width和height中只有一个值未设置或者设置为小于等于0的值时，另一个会根据图片原始宽高比进行调整。

## func backgroundImagePosition(Length, Length)

```cangjie
public func backgroundImagePosition(x!: Length = 0.vp, y!: Length = 0.vp): This
```

**功能：** 设置背景图的位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

| 名称 | 类型  | 必填 | 默认值 |      说明       |
|:----|:------|:---|:----|:--------------|
| x  | [Length](./cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  相对于组件左上角的x坐标。 |
| y  | [Length](./cj-common-types.md#interface-length) | 否 | 0.vp | **命名参数。**  相对于组件左上角的y坐标。 |

> **说明：**
>
> x和y值设置百分比时，偏移量是相对组件自身宽高计算的。

## func backgroundImagePosition(Alignment)

```cangjie
public func backgroundImagePosition(align: Alignment): This
```

**功能：** 设置背景图的位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

| 名称 | 类型  | 必填 | 默认值   | 说明                   |
|:----|:------|:---|:------|:--------------------------------|
| align | [Alignment](./cj-common-types.md#enum-alignment) | 是  | - | 背景图在组件中显示位置。 |

## func BackgroundBlurStyle(BlurStyle, Option\<BackgroundBlurStyleOptions>)

```cangjie
public func backgroundBlurStyle(value!: BlurStyle, options!: Option<BackgroundBlurStyleOptions> = None): This
```

**功能：** 为当前组件提供一种在背景和内容之间的模糊能力，通过枚举值的方式封装了不同的模糊半径、蒙版颜色、蒙版透明度、饱和度、亮度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|是|-| **命名参数。** 背景模糊样式。模糊样式中封装了模糊半径、蒙版颜色、蒙版透明度、饱和度、亮度五个参数。|
|options|[BackgroundBlurStyleOptions](./cj-universal-attribute-background.md#class-backgroundblurstyleoptions)|否|None| **命名参数。** 背景模糊选项。|

## func backgroundImageResizable(EdgeWidths)

```cangjie
public func backgroundImageResizable(slice: EdgeWidths): This
```

**功能：** 设置背景图在拉伸时可调整大小的图像选项。

设置合法的ResizableOptions时，[backgroundImage](./cj-universal-attribute-background.md#func-backgroundimageappresource-imagerepeat)属性中的repeat参数设置不生效。

当设置top+bottom大于原图的高或者left+right大于原图的宽时，ResizableOptions属性设置不生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|slice|[EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths)|是|-|边框宽度类型，用于描述组件边框不同方向的宽度。<br>只有当bottom和right同时大于0时，该属性生效。默认单位：vp。|

## func backgroundBrightness(Float64, Float64)

```cangjie
public func backgroundBrightness(rate: Float64, lightUpDegree: Float64): This
```

**功能：** 设置组件背景提亮效果，包含亮度变化速率和提亮程度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rate|Float64|是|-|亮度变化速率。亮度变化速率越大，提亮程度下降速度越快。若rate为0，则lightUpDegree将不生效，即不会产生任何提亮效果。<br>初始值：0.0。<br>取值范围：[-1.0, 1.0]。|
|lightUpDegree|Float64|是|-|提亮程度。提亮程度越大，亮度提升程度越大。<br>初始值：0.0。<br>取值范围：(0.0, +∞)。|

## func backgroundEffect(BackgroundEffectOptions)

```cangjie
public func backgroundEffect(value: BackgroundEffectOptions): This
```

**功能：** 设置组件背景属性，包含背景模糊半径，亮度，饱和度，颜色等参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BackgroundEffectOptions](./cj-universal-attribute-background.md#class-backgroundeffectoptions)|是|-|组件背景属性包括：饱和度，亮度，颜色。|

## func background(() -> Unit, Alignment)

```cangjie
public func background(builder: () -> Unit, align!: Alignment=Alignment.Center): This
```

**功能：** 设置组件背景。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|() -> Unit|是|-|自定义背景。使用时结合@Builder和bind方法使用。|
|align|[Alignment](./cj-common-types.md#enum-alignment)|否|Alignment.Center| **命名参数。** 自定义背景与组件的对齐方式。<br>同时设置了background，backgroundColor，backgroundImage时，叠加显示，background在最上层。|

## 基础类型定义

### class BackgroundBlurStyleOptions

```cangjie
public class BackgroundBlurStyleOptions <: BlurStyleOptions {
    public let inactiveColor: Color
    public let policy: BlurStyleActivePolicy
    public init(
        colorMode!: ThemeColorMode = ThemeColorMode.SYSTEM,
        adaptiveColor!: AdaptiveColor = AdaptiveColor.DEFAULT,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        scale!: Float32 = 1.0,
        policy!: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_ACTIVE,
        inactiveColor!: ResourceColor = Color.TRANSPARENT
    )
}
```

**功能：** 背景模糊选项类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**父类型：**

- [BlurStyleOptions](./cj-universal-attribute-foregroundblurstyle.md#class-blurstyleoptions)

#### let inactiveColor

```cangjie
public let inactiveColor: ResourceColor
```

**功能：** 窗口失焦后，窗口内控件模糊效果会被移除，则使用inactiveColor作为控件背板颜色。

**类型：** [ResourceColor](./cj-common-types.md#interface-resourcecolor)

**读写能力：** 只读

**起始版本：** 19

#### let policy

```cangjie
public let policy: BlurStyleActivePolicy
```

**功能：** 模糊激活策略。

**类型：** [BlurStyleActivePolicy](./cj-common-types.md#enum-blurstyleactivepolicy)

**读写能力：** 只读

**起始版本：** 19

#### init(ThemeColorMode, AdaptiveColor, BlurOptions, Float32, BlurStyleActivePolicy, ResourceColor)

```cangjie
public init(colorMode!: ThemeColorMode, adaptiveColor!: AdaptiveColor,
blurOptions!: BlurOptions, scale!: Float32, policy!: BlurStyleActivePolicy, inactiveColor!: ResourceColor)
```

**功能：** 构造一个BackgroundBlurStyleOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|colorMode|[ThemeColorMode](./cj-common-types.md#enum-themecolormode)|否|ThemeColorMode.SYSTEM|**命名参数。** 内容模糊效果使用的深浅色模式。|
|adaptiveColor|[AdaptiveColor](./cj-common-types.md#enum-adaptivecolor)|否|AdaptiveColor.DEFAULT| **命名参数。** 内容模糊效果使用的取色模式。|
|blurOptions|[BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions)|否|grayscale[0.0, 0.0]| **命名参数。** 灰阶模糊参数。|
|scale|Float32|否|1.0| **命名参数。** 内容模糊效果程度。|
|policy|[BlurStyleActivePolicy](./cj-common-types.md#enum-blurstyleactivepolicy)|否|BlurStyleActivePolicy.ALWAYS_ACTIVE| **命名参数。** 内模糊激活策略。|
|inactiveColor|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|否|Color.TRANSPARENT| **命名参数。** 窗口失焦后，窗口内控件模糊效果会被移除，则使用inactiveColor作为控件背板颜色。|

### class BackgroundEffectOptions

```cangjie
public class BackgroundEffectOptions {
    public let adaptiveColor: AdaptiveColor
    public let blurOptions: BlurOptions
    public let brightness: Float64
    public let color: Color
    public let inactiveColor: Color
    public let policy: BlurStyleActivePolicy
    public let radius: Float64
    public let saturation: Float64
    public init(
        adaptiveColor!: AdaptiveColor = AdaptiveColor.DEFAULT,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        brightness!: Float64 = 1.0,
        color!: Color = Color.TRANSPARENT,
        inactiveColor!: Color = Color.TRANSPARENT,
        policy!: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_ACTIVE,
        radius!: Float64,
        saturation!: Float64 = 1.0
        )
}
```

**功能：** 背景效果参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### let adaptiveColor

```cangjie
public let adaptiveColor: AdaptiveColor
```

**功能：** 背景模糊效果使用的取色模式，默认为DEFAULT。使用AVERAGE时color必须带有透明度，取色模式才生效。

**类型：** [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor)

**读写能力：** 只读

**起始版本：** 19

#### let blurOptions

```cangjie
public let blurOptions: BlurOptions
```

**功能：** 灰阶模糊参数。

**类型：** [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions)

**读写能力：** 只读

**起始版本：** 19

#### let brightness

```cangjie
public let brightness: Float64
```

**功能：** 亮度，取值范围：[0, +∞)。推荐取值范围：[0, 2]。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let color

```cangjie
public let color: Color
```

**功能：** 颜色。

**类型：** [Color](./cj-common-types.md#color)

**读写能力：** 只读

**起始版本：** 19

#### let inactiveColor

```cangjie
public let inactiveColor: Color
```

**功能：** 窗口失焦后，窗口内控件模糊效果会被移除，则使用inactiveColor作为控件背板颜色。

**类型：** [Color](./cj-common-types.md#color)

**读写能力：** 只读

**起始版本：** 19

#### let policy

```cangjie
public let policy: BlurStyleActivePolicy
```

**功能：** 模糊激活策略。

**类型：** [BlurStyleActivePolicy](./cj-universal-attribute-background.md#enum-blurstyleactivepolicy)

**读写能力：** 只读

**起始版本：** 19

#### let radius

```cangjie
public let radius: Float64
```

**功能：** 模糊半径，取值范围：[0, +∞)。初始值为0.0。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### let saturation

```cangjie
public let saturation: Float64
```

**功能：** 饱和度，取值范围：[0, +∞)。推荐取值范围：[0, 50]。

**类型：** Float64

**读写能力：** 只读

**起始版本：** 19

#### init(AdaptiveColor, BlurOptions, Float64, Color, Color, BlurStyleActivePolicy, Float64, Float64)

```cangjie
public init(adaptiveColor!: AdaptiveColor = AdaptiveColor.DEFAULT, blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]), brightness!: Float64 = 1.0, color!: Color = Color.TRANSPARENT, inactiveColor!: Color = Color.TRANSPARENT, policy!: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_ACTIVE, radius!: Float64, saturation!: Float64 = 1.0)  
```

**功能：** 构造一个BackgroundEffectOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|adaptiveColor|[AdaptiveColor](./cj-common-types.md#enum-adaptivecolor)|否|AdaptiveColor.DEFAULT| **命名参数。** 背景模糊效果使用的取色模式,默认为DEFAULT。使用AVERAGE时color必须带有透明度，取色模式才生效。|
|blurOptions|[BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions)|否|BlurOptions([0.0, 0.0])| **命名参数。** 灰阶模糊参数。|
|brightness|Float64|否|1.0| **命名参数。** 亮度，取值范围：[0, +∞)，推荐取值范围：[0, 2]。|
|color|[Color](./cj-common-types.md#color)|否|Color.TRANSPARENT| **命名参数。** 颜色。|
|inactiveColor|[Color](./cj-common-types.md#color)|否| Color.TRANSPARENT| **命名参数。** 窗口失焦后，窗口内控件模糊效果会被移除，则使用inactiveColor作为控件背板颜色。|
|policy|[BlurStyleActivePolicy](./cj-common-types.md#enum-blurstyleactivepolicy)|否|BlurStyleActivePolicy.ALWAYS_ACTIVE| **命名参数。** 内模糊激活策略。|
|radius|Float64|是|-| **命名参数。** 模糊半径，取值范围：[0, +∞)。<br>初始值：0.0。|
|saturation|Float64|否|1.0| **命名参数。** 饱和度，取值范围：[0, +∞)，推荐取值范围：[0, 50]。|

### enum BlurStyle

```cangjie
public enum BlurStyle {
    | BACKGROUND_THIN
    | BACKGROUND_REGULAR
    | BACKGROUND_THICK
    | BACKGROUND_ULTRA_THICK
    | COMPONENT_ULTRA_THIN
    | COMPONENT_THIN
    | COMPONENT_REGULAR
    | COMPONENT_THICK
    | COMPONENT_ULTRA_THICK
    | Regular
    | NONE
    | Thin
    | Thick
}
```

**功能：** 模糊设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### BACKGROUND_THIN

```cangjie
BACKGROUND_THIN
```

**功能：** 近距景深模糊。

**起始版本：** 12

#### BACKGROUND_REGULAR

```cangjie
BACKGROUND_REGULAR
```

**功能：** 中距景深模糊。

**起始版本：** 12

#### BACKGROUND_THICK

```cangjie
BACKGROUND_THICK
```

**功能：** 远距景深模糊。

**起始版本：** 12

#### BACKGROUND_ULTRA_THICK

```cangjie
BACKGROUND_ULTRA_THICK
```

**功能：** 超远距景深模糊。

**起始版本：** 12

#### COMPONENT_ULTRA_THIN

```cangjie
COMPONENT_ULTRA_THIN
```

**功能：** 组件超轻薄材质模糊。

**起始版本：** 12

#### COMPONENT_THIN

```cangjie
COMPONENT_THIN
```

**功能：** 组件普通材质模糊。

**起始版本：** 12

#### COMPONENT_REGULAR

```cangjie
COMPONENT_REGULAR
```

**功能：** 组件普通材质模糊。

**起始版本：** 12

#### COMPONENT_THICK

```cangjie
COMPONENT_THICK
```

**功能：** 组件厚材质模糊。

**起始版本：** 12

#### COMPONENT_ULTRA_THICK

```cangjie
COMPONENT_ULTRA_THICK
```

**功能：** 组件超厚材质模糊。

**起始版本：** 12

#### NONE

```cangjie
NONE
```

**功能：** 关闭模糊。

**起始版本：** 12

#### Regular

```cangjie
Regular
```

**功能：** 普通厚度材质模糊。

**起始版本：** 12

#### Thin

```cangjie
Thin
```

**功能：** 轻薄材质模糊。

**起始版本：** 12

#### Thick

```cangjie
Thick
```

**功能：** 厚材质模糊。

**起始版本：** 12

#### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取枚举的数值类型。

**返回值：**

|类型|说明|
| :-------   | :---------- |
| Int32   |  枚举的数值。  |

### enum BlurStyleActivePolicy

```cangjie
public enum BlurStyleActivePolicy {
    | ALWAYS_ACTIVE
    | ALWAYS_INACTIVE
    | FOLLOWS_WINDOW_ACTIVE_STATE
}
```

**功能：** 模糊效果设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### ALWAYS_ACTIVE

```cangjie
ALWAYS_ACTIVE
```

**功能：** 一直有模糊效果。

**起始版本：** 19

#### ALWAYS_INACTIVE

```cangjie
ALWAYS_INACTIVE
```

**功能：** 一直无模糊效果。

**起始版本：** 19

#### FOLLOWS_WINDOW_ACTIVE_STATE

```cangjie
FOLLOWS_WINDOW_ACTIVE_STATE
```

**功能：** 模糊效果跟随窗口焦点状态变化，非焦点不模糊，焦点模糊。

**起始版本：** 19

#### getValue

```cangjie
public getValue(): Int32
```

**功能：** 获取枚举的数值类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**返回值：**

|类型|说明|
| :-------   | :---------- |
| Int32   |  枚举的数值。  |