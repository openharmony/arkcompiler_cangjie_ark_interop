# 图像效果

设置组件的模糊、阴影、球面效果以及设置图片的图像效果。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func blur(Float64)

```cangjie
public func blur(value: Float64): This
```

**功能：** 设置组件的模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|模糊半径。|

## func brightness(Float64)

```cangjie
public func brightness(value: Float64): This
```

**功能：** 设置组件的亮度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|亮度值。|

## func colorBlend(ResourceColor)

```cangjie
public func colorBlend(value: ResourceColor): This
```

**功能：** 设置组件的颜色混合模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](#)|是|-|颜色混合值。|

## func contrast(Float64)

```cangjie
public func contrast(value: Float64): This
```

**功能：** 设置组件的对比度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|对比度值。|

## func grayscale(Float64)

```cangjie
public func grayscale(value: Float64): This
```

**功能：** 设置组件的灰度值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|反相值。|

## func hueRotate(Float32)

```cangjie
public func hueRotate(value: Float32): This
```

**功能：** 设置组件的色相旋转。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float32|是|-|单精度浮点数值。|

## func invert(Float64)

```cangjie
public func invert(value: Float64): This
```

**功能：** 设置组件的反色值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|透明度。|

## func invert(Float64, Float64, Float64, Float64)

```cangjie
public func invert(low!: Float64, high!: Float64, threshold!: Float64, thresholdRange!: Float64): This
```

**功能：** 设置组件的反色范围和阈值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|low|Float64|是|-|低阈值。|
|high|Float64|是|-|高阈值。|
|threshold|Float64|是|-|阈值。|
|thresholdRange|Float64|是|-|阈值范围。|

## func saturate(Float64)

```cangjie
public func saturate(value: Float64): This
```

**功能：** 设置组件的饱和度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|棕褐色值。|

## func sepia(Float64)

```cangjie
public func sepia(value: Float64): This
```

**功能：** 设置组件的棕褐色调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|将图像转换为深褐色，降低色彩度，产生温暖复古的图像风格。入参为褐色滤镜强度，值为1则完全是深褐色的，值小于等于0则图像无变化，值大于1会进一步放大色彩偏移比例，图像整体会变得更亮且色彩更加偏黄/偏红，但不属于标准sepia效果。<br> 取值范围：[0.0, +∞)，推荐取值范围：(0.0, 1.0]。|

## func shadow(Float64, ResourceColor, Float64, Float64)

```cangjie
public func shadow(radius!: Float64, color!: ResourceColor = Color(0x666666), offsetX!: Float64 = 0.0,
    offsetY!: Float64 = 0.0): This
```

**功能：** 设置组件的阴影。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|radius|Float64|是|-|阴影模糊半径。|
|color|[ResourceColor](#)|否|Color(0x666666)|阴影颜色。|
|offsetX|Float64|否|0.0|阴影X轴偏移量。|
|offsetY|Float64|否|0.0|阴影Y轴偏移量。|

