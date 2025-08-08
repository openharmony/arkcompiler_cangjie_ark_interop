# ohos.color_manager (Color Management)

This module provides fundamental capabilities for managing abstract color gamut objects, including the creation of color gamut objects and retrieval of basic color gamut properties.

## Importing the Module

```cangjie
import kit.ArkGraphics2D.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code begins with a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## func create(ColorSpace)

```cangjie
public func create(colorSpaceName: ColorSpace): ColorSpaceManager
```

**Function:** Creates a standard color gamut object.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| colorSpaceName | [ColorSpace](#enum-colorspace) | Yes | - | Enumeration value of standard color gamut type. UNKNOWN and CUSTOM cannot be used to directly create color gamut objects. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ColorSpaceManager](#class-colorspacemanager) | Returns the instance of the currently created color gamut object. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Color Management Error Codes](../../errorcodes/cj-errorcode-colorspace-manager.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | Parameter error. |
| 18600001 | Parameter value is abnormal.@brief function create(colorSpaceName: ColorSpace): ColorSpaceManager |

**Example:**

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

**Function:** Creates a user-defined color gamut object.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| primaries | [ColorSpacePrimaries](#struct-colorspaceprimaries) | Yes | - | Standard tristimulus values of the color gamut. |
| gamma | Float32 | Yes | - | Gamma value of the color gamut. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ColorSpaceManager](#class-colorspacemanager) | Returns the instance of the currently created color gamut object. The color gamut type is defined as [ColorSpace.CUSTOM](#custom). |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Color Management Error Codes](../../errorcodes/cj-errorcode-colorspace-manager.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | Parameter error. |
| 18600001 | Parameter value is abnormal.@brief function create(primaries: ColorSpacePrimaries, gamma: number): ColorSpaceManager |

**Example:**

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

**Function:** Instance of the current color gamut object.

> **Note:**
>
> First use [create()](#func-createcolorspace) to obtain a ColorSpaceManager instance, then call the corresponding methods through this instance.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Initial Version:** 21

### func getColorSpaceName()

```cangjie
public func getColorSpaceName(): ColorSpace
```

**Function:** Retrieves the color gamut type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ColorSpace](#enum-colorspace) | Returns the enumeration value of the color gamut type. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Color Management Error Codes](../../errorcodes/cj-errorcode-colorspace-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 18600001 | Parameter value is abnormal. |

**Example:**

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

**Function:** Retrieves the gamma value of the color gamut.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Float32 | Returns the gamma value of the color gamut. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Color Management Error Codes](../../errorcodes/cj-errorcode-colorspace-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 18600001 | The parameter value is abnormal. |

**Example:**

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

**Function:** Retrieves the white point value of the color gamut.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Float32> | Returns the white point value [x, y] of the color gamut. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Color Management Error Codes](../../errorcodes/cj-errorcode-colorspace-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 18600001 | The parameter value is abnormal. |

**Example:**

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

**Function:** Standard tristimulus values (red, green, blue) and white point of the color gamut, represented by their (x, y) coordinates in the color space.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Initial Version:** 21

### let blueX

```cangjie
public let blueX: Float32
```

**Function:** The x-coordinate value of the standard blue color in the color space.

**Type:** Float32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Initial Version:** 21

### let blueY

```cangjie
public let blueY: Float32
```

**Function:** The y-coordinate value of standard blue in the color space.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### let greenX

```cangjie
public let greenX: Float32
```

**Function:** The x-coordinate value of standard green in the color space.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### let greenY

```cangjie
public let greenY: Float32
```

**Function:** The y-coordinate value of standard green in the color space.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### let redX

```cangjie
public let redX: Float32
```

**Function:** The x-coordinate value of standard red in the color space.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### let redY

```cangjie
public let redY: Float32
```

**Function:** The y-coordinate value of standard red in the color space.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### let whitePointX

```cangjie
public let whitePointX: Float32
```

**Function:** The x-coordinate value of standard white in the color space.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### let whitePointY

```cangjie
public let whitePointY: Float32
```

**Function:** The y-coordinate value of standard white in the color space.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

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

**Function:** The primary constructor of ColorSpacePrimaries.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| redX | Float32 | Yes | - | **Named parameter.** The x-coordinate value of standard red in the color space. |
| redY | Float32 | Yes | - | **Named parameter.** The y-coordinate value of standard red in the color space. |
| greenX | Float32 | Yes | - | **Named parameter.** The x-coordinate value of standard green in the color space. |
| greenY | Float32 | Yes | - | **Named parameter.** The y-coordinate value of standard green in the color space. |
| blueX | Float32 | Yes | - | **Named parameter.** The x-coordinate value of standard blue in the color space. |
| blueY | Float32 | Yes | - | **Named parameter.** The y-coordinate value of standard blue in the color space. |
| whitePointX | Float32 | Yes | - | **Named parameter.** The x-coordinate value of standard white in the color space. |
| whitePointY | Float32 | Yes | - | **Named parameter.** The y-coordinate value of standard white in the color space. |

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

**Function:** Enumeration of color gamut types.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

**Parent Type:**

- ToString

### ADOBE_RGB_1998

```cangjie
ADOBE_RGB_1998
```

**Function:** RGB gamut is Adobe RGB (1998) type; transfer function is Adobe RGB (1998) type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### ADOBE_RGB_1998_LIMIT

```cangjie
ADOBE_RGB_1998_LIMIT
```

**Function:** RGB gamut is Adobe RGB (1998) type; transfer function is Adobe RGB (1998) type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT2020_HLG

```cangjie
BT2020_HLG
```

**Function:** RGB gamut is BT2020 type; transfer function is HLG type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT2020_HLG_LIMIT

```cangjie
BT2020_HLG_LIMIT
```

**Function:** RGB gamut is BT2020 type; transfer function is HLG type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT2020_PQ

```cangjie
BT2020_PQ
```

**Function:** RGB gamut is BT2020 type; transfer function is PQ type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT2020_PQ_LIMIT

```cangjie
BT2020_PQ_LIMIT
```

**Function:** RGB gamut is BT2020 type; transfer function is PQ type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT601_EBU

```cangjie
BT601_EBU
```

**Function:** RGB gamut is BT601_P type; transfer function is BT709 type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT601_EBU_LIMIT

```cangjie
BT601_EBU_LIMIT
```

**Function:** RGB gamut is BT601_P type; transfer function is BT709 type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT601_SMPTE_C

```cangjie
BT601_SMPTE_C
```

**Function:** RGB gamut is BT601_N type; transfer function is BT709 type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT601_SMPTE_C_LIMIT
```cangjie
BT601_SMPTE_C_LIMIT
```

**Function:** RGB gamut is BT601_N type; transfer function is BT709 type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT709

```cangjie
BT709
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### BT709_LIMIT

```cangjie
BT709_LIMIT
```

**Function:** RGB gamut is BT709 type; transfer function is BT709 type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### CUSTOM

```cangjie
CUSTOM
```

**Function:** User-defined gamut type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### DCI_P3

```cangjie
DCI_P3
```

**Function:** RGB gamut is DCI-P3 type; transfer function is Gamma 2.6 type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### DISPLAY_P3

```cangjie
DISPLAY_P3
```

**Function:** RGB gamut is Display P3 type; transfer function is SRGB type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### DISPLAY_P3_HLG

```cangjie
DISPLAY_P3_HLG
```

**Function:** Same as P3_HLG; RGB gamut is Display P3 type; transfer function is HLG type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### DISPLAY_P3_LIMIT

```cangjie
DISPLAY_P3_LIMIT
```

**Function:** RGB gamut is Display P3 type; transfer function is SRGB type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### DISPLAY_P3_PQ

```cangjie
DISPLAY_P3_PQ
```

**Function:** Same as P3_PQ; RGB gamut is Display P3 type; transfer function is PQ type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### DISPLAY_P3_SRGB

```cangjie
DISPLAY_P3_SRGB
```

**Function:** Same as DISPLAY_P3; RGB gamut is Display P3 type; transfer function is SRGB type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### DISPLAY_SRGB

```cangjie
DISPLAY_SRGB
```

**Function:** Same as SRGB; RGB gamut is SRGB type; transfer function is SRGB type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### LINEAR_BT2020

```cangjie
LINEAR_BT2020
```

**Function:** RGB gamut is BT2020 type; transfer function is Linear type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### LINEAR_BT709

```cangjie
LINEAR_BT709
```

**Function:** Same as LINEAR_SRGB; RGB gamut is BT709 type; transfer function is Linear type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### LINEAR_P3

```cangjie
LINEAR_P3
```

**Function:** RGB gamut is Display P3 type; transfer function is Linear type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### LINEAR_SRGB

```cangjie
LINEAR_SRGB
```

**Function:** RGB gamut is SRGB type; transfer function is Linear type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### P3_HLG

```cangjie
P3_HLG
```

**Function:** RGB gamut is Display P3 type; transfer function is HLG type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### P3_HLG_LIMIT

```cangjie
P3_HLG_LIMIT
```

**Function:** RGB gamut is Display P3 type; transfer function is HLG type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### P3_PQ

```cangjie
P3_PQ
```

**Function:** RGB gamut is Display P3 type; transfer function is PQ type; encoding range is Full type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### P3_PQ_LIMIT

```cangjie
P3_PQ_LIMIT
```

**Function:** RGB gamut is Display P3 type; transfer function is PQ type; encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### SRGB

```cangjie
SRGB
```

**Function:** RGB gamut is SRGB type; transfer function is SRGB type; encoding range is Full type; system default gamut type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### SRGB_LIMIT

```cangjie
SRGB_LIMIT
```

**Function:** RGB gamut is SRGB type. Transfer function is SRGB type. Encoding range is Limit type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**Function:** Unknown gamut type.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

### static func parse(UInt32)

```cangjie
public static func parse(cs: UInt32): ColorSpace
```

**Function:** Converts a UInt32 value to a [ColorSpace](#enum-colorspace) enumeration value.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| cs | UInt32 | Yes | - | Integer corresponding to the [ColorSpace](#enum-colorspace) enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ColorSpace](#enum-colorspace) | [ColorSpace](#enum-colorspace) enumeration value. |

**Example:**

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

**Function:** Converts the [ColorSpace](#enum-colorspace) enumeration value to a string.

**System Capability:** SystemCapability.Graphic.Graphic2D.ColorManager.Core

**Since:** 21

**Return Value:**

| Type    | Description |
|:--------|:------------|
| String  | The string corresponding to the [ColorSpace](#enum-colorspace) enumeration value. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkGraphics2D.*

let value: String = ColorSpace.DISPLAY_P3.toString()
```