# ohos.color_manager（色彩管理）

本模块提供管理抽象化色域对象的一些基础能力，包括色域对象的创建与色域基础属性的获取等。

## 导入模块

```cangjie
import kit.ArkGraphics2D.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func create(ColorSpace)

```cangjie
public func create(colorSpaceName: ColorSpace): ColorSpaceManager
```

**功能：** 创建标准色域对象。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|colorSpaceName|[ColorSpace](#enum-colorspace)|是|-|标准色域类型枚举值。UNKNOWN与CUSTOM不可用于直接创建色域对象。|

**返回值：**

|类型|说明|
|:----|:----|
|[ColorSpaceManager](#class-colorspacemanager)|返回当前创建的色域对象实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[色彩管理错误码](../../errorcodes/cj-errorcode-colorspace-manager.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. |
| 18600001 | Parameter value is abnormal.@brief function create(colorSpaceName: ColorSpace): ColorSpaceManager |
**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkGraphics2D.*

let colorSpaceManager = create(ColorSpace.SRGB)
```

## func create(ColorSpacePrimaries, Float32)

```cangjie
public func create(primaries: ColorSpacePrimaries, gamma: Float32): ColorSpaceManager
```

**功能：** 创建用户自定义色域对象。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|primaries|[ColorSpacePrimaries](#struct-colorspaceprimaries)|是|-|色域标准三原色。|
|gamma|Float32|是|-|色域gamma值。|

**返回值：**

|类型|说明|
|:----|:----|
|[ColorSpaceManager](#class-colorspacemanager)|返回当前创建的色域对象实例。色域类型定义为[ColorSpace.CUSTOM](#custom)。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[色彩管理错误码](../../errorcodes/cj-errorcode-colorspace-manager.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. |
| 18600001 | Parameter value is abnormal.@brief function create(primaries: ColorSpacePrimaries, gamma: number): ColorSpaceManager |
**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkGraphics2D.*

let primaries = ColorSpacePrimaries(
    redX: 0.1,
    redY: 0.1,
    greenX: 0.2,
    greenY: 0.2,
    blueX: 0.3,
    blueY: 0.3,
    whitePointX: 0.4,
    whitePointY: 0.4
)
let gamma = 2.2f32
let colorSpaceManager = create(primaries, gamma)
```

## class ColorSpaceManager

```cangjie
public class ColorSpaceManager {}
```

**功能：** 当前色域对象实例。

> **说明：**
>
> 先使用[create()](#func-createcolorspace)获取到ColorSpaceManager实例，再通过此实例调用下述对应方法。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### func getColorSpaceName()

```cangjie
public func getColorSpaceName(): ColorSpace
```

**功能：** 获取色域类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ColorSpace](#enum-colorspace)|返回色域类型枚举值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[色彩管理错误码](../../errorcodes/cj-errorcode-colorspace-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |18600001|Parameter value is abnormal.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkGraphics2D.*

let colorSpaceManagerInstance = create(ColorSpace.SRGB)
let colorSpace: ColorSpace = colorSpaceManagerInstance.getColorSpaceName()
```

### func getGamma()

```cangjie
public func getGamma(): Float32
```

**功能：** 获取色域gamma值。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Float32|返回色域gamma值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[色彩管理错误码](../../errorcodes/cj-errorcode-colorspace-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |18600001|The parameter value is abnormal.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkGraphics2D.*

let colorSpaceManagerInstance = create(SRGB)
let colorSpace = colorSpaceManagerInstance.getGamma()
```

### func getWhitePoint()

```cangjie
public func getWhitePoint(): Array<Float32>
```

**功能：** 获取色域白点值。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Float32>|返回色域白点值[x, y]。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[色彩管理错误码](../../errorcodes/cj-errorcode-colorspace-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |18600001|The parameter value is abnormal.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkGraphics2D.*

let colorSpaceManagerInstance = create(SRGB)
let colorSpace = colorSpaceManagerInstance.getWhitePoint()
```

## struct ColorSpacePrimaries

```cangjie
public struct ColorSpacePrimaries {
    public ColorSpacePrimaries(
        public let redX!: Float32,
        public let redY!: Float32,
        public let greenX!: Float32,
        public let greenY!: Float32,
        public let blueX!: Float32,
        public let blueY!: Float32,
        public let whitePointX!: Float32,
        public let whitePointY!: Float32
    )
}
```

**功能：** 色域标准三原色（红、绿、蓝）和白色，使用(x, y)表示其在色彩空间中的位置。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### let blueX

```cangjie
public let blueX: Float32
```

**功能：** 标准蓝色在色彩空间的x坐标值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### let blueY

```cangjie
public let blueY: Float32
```

**功能：** 标准蓝色在色彩空间的y坐标值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### let greenX

```cangjie
public let greenX: Float32
```

**功能：** 标准绿色在色彩空间的x坐标值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### let greenY

```cangjie
public let greenY: Float32
```

**功能：** 标准绿色在色彩空间的y坐标值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### let redX

```cangjie
public let redX: Float32
```

**功能：** 标准红色在色彩空间的x坐标值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### let redY

```cangjie
public let redY: Float32
```

**功能：** 标准红色在色彩空间的y坐标值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### let whitePointX

```cangjie
public let whitePointX: Float32
```

**功能：** 标准白色在色彩空间的x坐标值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### let whitePointY

```cangjie
public let whitePointY: Float32
```

**功能：** 标准白色在色彩空间的y坐标值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### ColorSpacePrimaries(Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32)

```cangjie
public ColorSpacePrimaries(
    public let redX!: Float32,
    public let redY!: Float32,
    public let greenX!: Float32,
    public let greenY!: Float32,
    public let blueX!: Float32,
    public let blueY!: Float32,
    public let whitePointX!: Float32,
    public let whitePointY!: Float32
)
```

**功能：** ColorSpacePrimaries的主构造函数。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|redX|Float32|是|-| **命名参数。** 标准红色在色彩空间的x坐标值。|
|redY|Float32|是|-| **命名参数。** 标准红色在色彩空间的y坐标值。|
|greenX|Float32|是|-| **命名参数。** 标准绿色在色彩空间的x坐标值。|
|greenY|Float32|是|-| **命名参数。** 标准绿色在色彩空间的y坐标值。|
|blueX|Float32|是|-| **命名参数。** 标准蓝色在色彩空间的x坐标值。|
|blueY|Float32|是|-| **命名参数。** 标准蓝色在色彩空间的y坐标值。|
|whitePointX|Float32|是|-| **命名参数。** 标准白色在色彩空间的x坐标值。|
|whitePointY|Float32|是|-| **命名参数。** 标准白色在色彩空间的y坐标值。|

## enum ColorSpace

```cangjie
public enum ColorSpace <: ToString {
    | UNKNOWN
    | ADOBE_RGB_1998
    | DCI_P3
    | DISPLAY_P3
    | SRGB
    | CUSTOM
    | BT709
    | BT601_EBU
    | BT601_SMPTE_C
    | BT2020_HLG
    | BT2020_PQ
    | P3_HLG
    | P3_PQ
    | ADOBE_RGB_1998_LIMIT
    | DISPLAY_P3_LIMIT
    | SRGB_LIMIT
    | BT709_LIMIT
    | BT601_EBU_LIMIT
    | BT601_SMPTE_C_LIMIT
    | BT2020_HLG_LIMIT
    | BT2020_PQ_LIMIT
    | P3_HLG_LIMIT
    | P3_PQ_LIMIT
    | LINEAR_P3
    | LINEAR_SRGB
    | LINEAR_BT709
    | LINEAR_BT2020
    | DISPLAY_SRGB
    | DISPLAY_P3_SRGB
    | DISPLAY_P3_HLG
    | DISPLAY_P3_PQ
    | ...
}
```

**功能：** 色域类型枚举。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**父类型：**

- ToString

### ADOBE_RGB_1998

```cangjie
ADOBE_RGB_1998
```

**功能：** RGB色域为Adobe RGB(1998)类型；转换函数为Adobe RGB(1998)类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### ADOBE_RGB_1998_LIMIT

```cangjie
ADOBE_RGB_1998_LIMIT
```

**功能：** RGB色域为Adobe RGB(1998)类型；转换函数为Adobe RGB(1998)类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT2020_HLG

```cangjie
BT2020_HLG
```

**功能：** RGB色域为BT2020类型；转换函数为HLG类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT2020_HLG_LIMIT

```cangjie
BT2020_HLG_LIMIT
```

**功能：** RGB色域为BT2020类型；转换函数为HLG类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT2020_PQ

```cangjie
BT2020_PQ
```

**功能：** RGB色域为BT2020类型；转换函数为PQ类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT2020_PQ_LIMIT

```cangjie
BT2020_PQ_LIMIT
```

**功能：** RGB色域为BT2020类型；转换函数为PQ类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT601_EBU

```cangjie
BT601_EBU
```

**功能：** RGB色域为BT601_P类型；转换函数为BT709类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT601_EBU_LIMIT

```cangjie
BT601_EBU_LIMIT
```

**功能：** RGB色域为BT601_P类型；转换函数为BT709类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT601_SMPTE_C

```cangjie
BT601_SMPTE_C
```

**功能：** RGB色域为BT601_N类型；转换函数为BT709类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT601_SMPTE_C_LIMIT

```cangjie
BT601_SMPTE_C_LIMIT
```

**功能：** RGB色域为BT601_N类型；转换函数为BT709类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT709

```cangjie
BT709
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### BT709_LIMIT

```cangjie
BT709_LIMIT
```

**功能：** RGB色域为BT709类型；转换函数为BT709类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### CUSTOM

```cangjie
CUSTOM
```

**功能：** 用户自定义色域类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### DCI_P3

```cangjie
DCI_P3
```

**功能：** RGB色域为DCI-P3类型；转换函数为Gamma 2.6类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### DISPLAY_P3

```cangjie
DISPLAY_P3
```

**功能：** RGB色域为Display P3类型；转换函数为SRGB类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### DISPLAY_P3_HLG

```cangjie
DISPLAY_P3_HLG
```

**功能：** 与P3_HLG相同；RGB色域为Display P3类型；转换函数为HLG类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### DISPLAY_P3_LIMIT

```cangjie
DISPLAY_P3_LIMIT
```

**功能：** RGB色域为Display P3类型；转换函数为SRGB类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### DISPLAY_P3_PQ

```cangjie
DISPLAY_P3_PQ
```

**功能：** 与P3_PQ相同；RGB色域为Display P3类型；转换函数为PQ类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### DISPLAY_P3_SRGB

```cangjie
DISPLAY_P3_SRGB
```

**功能：** 与DISPLAY_P3相同；RGB色域为Display P3类型；转换函数为SRGB类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### DISPLAY_SRGB

```cangjie
DISPLAY_SRGB
```

**功能：** 与SRGB相同；RGB色域为SRGB类型；转换函数为SRGB类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### LINEAR_BT2020

```cangjie
LINEAR_BT2020
```

**功能：** RGB色域为BT2020类型；转换函数为Linear类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### LINEAR_BT709

```cangjie
LINEAR_BT709
```

**功能：** 与LINEAR_SRGB相同；RGB色域为BT709类型；转换函数为Linear类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### LINEAR_P3

```cangjie
LINEAR_P3
```

**功能：** RGB色域为Display P3类型；转换函数为Linear类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### LINEAR_SRGB

```cangjie
LINEAR_SRGB
```

**功能：** RGB色域为SRGB类型；转换函数为Linear类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### P3_HLG

```cangjie
P3_HLG
```

**功能：** RGB色域为Display P3类型；转换函数为HLG类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### P3_HLG_LIMIT

```cangjie
P3_HLG_LIMIT
```

**功能：** RGB色域为Display P3类型；转换函数为HLG类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### P3_PQ

```cangjie
P3_PQ
```

**功能：** RGB色域为Display P3类型；转换函数为PQ类型；编码范围为Full类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### P3_PQ_LIMIT

```cangjie
P3_PQ_LIMIT
```

**功能：** RGB色域为Display P3类型；转换函数为PQ类型；编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### SRGB

```cangjie
SRGB
```

**功能：** RGB色域为SRGB类型；转换函数为SRGB类型；编码范围为Full类型；系统默认色域类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### SRGB_LIMIT

```cangjie
SRGB_LIMIT
```

**功能：** RGB色域为SRGB类型。转换函数为SRGB类型。编码范围为Limit类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**功能：** 未知的色域类型。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

### static func parse(UInt32)

```cangjie
public static func parse(cs: UInt32): ColorSpace
```

**功能：** 将UInt32类型值转换为[ColorSpace](#enum-colorspace)枚举值。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cs|UInt32|是|-|[ColorSpace](#enum-colorspace)枚举值对应的整型数。|

**返回值：**

|类型|说明|
|:----|:----|
|[ColorSpace](#enum-colorspace)|[ColorSpace](#enum-colorspace)枚举值。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkGraphics2D.*

let value: ColorSpace = ColorSpace.parse(1)
```

### func toString()

```cangjie
public func toString(): String
```

**功能：** 将[ColorSpace](#enum-colorspace)枚举值转换为字符串。

**系统能力：** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|[ColorSpace](#enum-colorspace)枚举值对应的字符串。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkGraphics2D.*

let value: String = ColorSpace.DISPLAY_P3.toString()
```
