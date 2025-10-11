# 组件内容模糊

为当前组件添加内容模糊效果。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func foregroundBlurStyle(BlurStyle)

```cangjie
public func foregroundBlurStyle(value: BlurStyle): This
```

**功能：** 为当前组件提供内容模糊能力，使用默认内容模糊选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|是|-|内容模糊样式。|

## func foregroundBlurStyle(BlurStyle, ForegroundBlurStyleOptions)

```cangjie
public func foregroundBlurStyle(value: BlurStyle, options: ForegroundBlurStyleOptions): This
```

**功能：** 为当前组件提供内容模糊能力。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|是|-|内容模糊样式。|
|options|[ForegroundBlurStyleOptions](#class-foregroundblurstyleoptions)|是|-|内容模糊选项。|

## 基础类型定义

### class BlurOptions

```cangjie
public class BlurOptions {
    public var grayscale: VArray<Float32, $2>
    public init(grayscale: VArray<Float32, $2>)
}
```

**功能：** 灰阶模糊参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var grayscale

```cangjie
public var grayscale: VArray<Float32, $2>
```

**功能：** 灰阶模糊参数，参数取值范围[0, 127]。

**类型：** VArray\<Float32,$2>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(VArray\<Float32,$2>)

```cangjie
public init(grayscale: VArray<Float32, $2>)
```

**功能：** 构造BlurOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|grayscale|VArray\<Float32,$2>|是|-|灰阶模糊参数，参数取值范围[0, 127]。|

### class ForegroundBlurStyleOptions

```cangjie
public class ForegroundBlurStyleOptions {
    public var colorMode: ThemeColorMode = ThemeColorMode.System
    public var adaptiveColor: AdaptiveColor = AdaptiveColor.Default
    public var blurOptions: BlurOptions = BlurOptions([0.0, 0.0])
    public var scale: Float32 = 1.0
    public init(
        colorMode!: ThemeColorMode = ThemeColorMode.System,
        adaptiveColor!: AdaptiveColor = AdaptiveColor.Default,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        scale!: Float32 = 1.0
    )
}
```

**功能：** 内容模糊选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var adaptiveColor

```cangjie
public var adaptiveColor: AdaptiveColor = AdaptiveColor.Default
```

**功能：** 内容模糊效果使用的取色模式。

**类型：** [AdaptiveColor](cj-common-types.md#enum-adaptivecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var blurOptions

```cangjie
public var blurOptions: BlurOptions = BlurOptions([0.0, 0.0])
```

**功能：** 灰阶模糊参数。

**类型：** [BlurOptions](#class-bluroptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var colorMode

```cangjie
public var colorMode: ThemeColorMode = ThemeColorMode.System
```

**功能：** 内容模糊效果使用的深浅色模式。

**类型：** [ThemeColorMode](cj-common-types.md#enum-themecolormode)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var scale

```cangjie
public var scale: Float32 = 1.0
```

**功能：** 内容模糊效果程度。取值范围：[0.0, 1.0]。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(ThemeColorMode, AdaptiveColor, BlurOptions, Float32)

```cangjie
public init(
    colorMode!: ThemeColorMode = ThemeColorMode.System,
    adaptiveColor!: AdaptiveColor = AdaptiveColor.Default,
    blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
    scale!: Float32 = 1.0
)
```

**功能：** 构造一个ForegroundBlurStyleOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|colorMode|[ThemeColorMode](cj-common-types.md#enum-themecolormode)|否|ThemeColorMode.System|内容模糊效果使用的深浅色模式。|
|adaptiveColor|[AdaptiveColor](cj-common-types.md#enum-adaptivecolor)|否|AdaptiveColor.Default|内容模糊效果使用的取色模式。|
|blurOptions|[BlurOptions](#class-bluroptions)|否|BlurOptions([0.0, 0.0])|灰阶模糊参数。|
|scale|Float32|否|1.0|内容模糊效果程度。<br>取值范围：[0.0, 1.0]。|
