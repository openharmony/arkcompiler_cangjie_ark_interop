# ohos.resource_manager（资源管理）

资源管理模块，根据当前configuration：语言、区域、横竖屏、Mcc（移动国家码）和Mnc（移动网络码）、Device capability（设备类型）、Density（分辨率）提供获取应用资源对象读取接口。

## 导入模块

```cangjie
import kit.LocalizationKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func \_\_GenerateResource\_\_(String, String, String, Int32, String, Array\<Any>, Int32)

```cangjie
public func __GenerateResource__(
    bundleName: String,
    moudleType: String,
    moduleName: String,
    resId: Int32,
    resStr: String,
    params: Array<Any>,
    resType: Int32
): AppResource
```

**功能：** 资源管理宏使用。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|bundleName|String|是|-|应用的包名称。|
|moudleType|String|是|-|应用的模块类型。|
|moduleName|String|是|-|应用的模块名称。|
|resId|Int32|是|-|资源id。|
|resStr|String|是|-|资源名称。|
|params|Array\<Any>|是|-|其他资源参数。|
|resType|Int32|是|-|资源的类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[AppResource](#class-appresource)|资源类型。|

## class AppResource

```cangjie
public class AppResource <: Length & ResourceColor {
    public AppResource(
        public let bundleName: String,
        public let moduleName: String,
        public let id: Int32,
        public let params!: ?Array<Any> = None,
        public let resType!: ?Int32 = None
    )
}
```

**功能：** 表示资源类型。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**父类型：**

- [Length](../../arkui-cj/cj-common-types.md#interface-length)
- [ResourceColor](../../arkui-cj/cj-common-types.md#interface-resourcecolor)

### let bundleName

```cangjie
public let bundleName: String
```

**功能：** 应用的包名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### let id

```cangjie
public let id: Int32
```

**功能：** 资源id。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### let moduleName

```cangjie
public let moduleName: String
```

**功能：** 应用的模块名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### let params

```cangjie
public let params: ?Array<Any>=None
```

**功能：** 其他资源参数（可选）。

**类型：** ?Array\<Any>

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### let resType

```cangjie
public let resType: ?Int32 = None
```

**功能：** 资源的类型（可选）。

**类型：** ?Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### AppResource(String, String, Int32, ?Array\<Any>, ?Int32)

```cangjie
public AppResource(
    public let bundleName: String,
    public let moduleName: String,
    public let id: Int32,
    public let params!: ?Array<Any> = None,
    public let resType!: ?Int32 = None
)
```

**功能：** 构造资源类型对象。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|bundleName|String|是|-|应用的包名称。|
|moduleName|String|是|-|应用的模块名称。|
|id|Int32|是|-|资源id。|
|params|?Array\<Any>|否|None| **命名参数。** 其他资源参数。|
|resType|?Int32|否|None| **命名参数。** 资源的类型。|

## class Configuration

```cangjie
public class Configuration <: ToString {
    public var direction: Direction
    public var locale: String
    public init(direction: Direction, locale: String)
}
```

**功能：** 表示当前设备的配置。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**父类型：**

- ToString

### var direction

```cangjie
public var direction: Direction
```

**功能：** 屏幕方向。

**类型：** [Direction](#enum-direction)

**读写能力：** 可读写

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### var locale

```cangjie
public var locale: String
```

**功能：** 语言文字国家地区。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### init(Direction, String)

```cangjie
public init(direction: Direction, locale: String)
```

**功能：** 构建当前设备状态的对象。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|direction|[Direction](#enum-direction)|是|-|屏幕方向。|
|locale|String|是|-|语言文字国家地区。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前[Configuration](#class-configuration)的信息，以字符串表示。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前[Configuration](#class-configuration)的信息。|

## class DeviceCapability

```cangjie
public class DeviceCapability <: ToString {
    public DeviceCapability(
        public let screenDensity: ScreenDensity,
        public let deviceType: DeviceType
    )
}
```

**功能：** 表示设备支持的能力。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**父类型：**

- ToString

### let deviceType

```cangjie
public let deviceType: DeviceType
```

**功能：** 当前设备类型。

**类型：** [DeviceType](#enum-devicetype)

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### let screenDensity

```cangjie
public let screenDensity: ScreenDensity
```

**功能：** 当前设备屏幕密度。

**类型：** [ScreenDensity](#enum-screendensity)

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DeviceCapability(ScreenDensity, DeviceType)

```cangjie
public DeviceCapability(
    public let screenDensity: ScreenDensity,
    public let deviceType: DeviceType
)
```

**功能：** 构建设备支持的能力的对象。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|screenDensity|[ScreenDensity](#enum-screendensity)|是|-|当前设备屏幕密度。|
|deviceType|[DeviceType](#enum-devicetype)|是|-|当前设备类型。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前[DeviceCapability](#class-devicecapability)的信息，以字符串表示。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前[DeviceCapability](#class-devicecapability)的信息。|

## class DrawableDescriptor

```cangjie
public class DrawableDescriptor {}
```

**功能：** 表示[DrawableDescriptor](#class-drawabledescriptor)实例。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

## class RawFileDescriptor

```cangjie
public class RawFileDescriptor {
    public RawFileDescriptor(
        public let fd: Int32,
        public let offset: Int64,
        public let length: Int64
    )
}
```

**功能：** 表示rawfile的描述符信息。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### let fd

```cangjie
public let fd: Int32
```

**功能：** rawfile所在hap的文件描述符。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### let length

```cangjie
public let length: Int64
```

**功能：** rawfile的文件长度。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### let offset

```cangjie
public let offset: Int64
```

**功能：** rawfile的起始偏移量。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### RawFileDescriptor(Int32, Int64, Int64)

```cangjie
public RawFileDescriptor(
    public let fd: Int32,
    public let offset: Int64,
    public let length: Int64
)
```

**功能：** 根据文件描述符，起始偏移量和文件长度，构造[RawFileDescriptor](#class-rawfiledescriptor)实例。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|rawfile所在hap的文件描述符。|
|offset|Int64|是|-|rawfile的起始偏移量。|
|length|Int64|是|-|rawfile的文件长度。|

## class ResourceManager

```cangjie
public class ResourceManager {}
```

**功能：** 提供访问应用资源的能力。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

> **说明：**
>
> - 资源文件在工程的resources目录中定义，资源ID可通过@r(资源地址).id的方式获取，例如@r(app.string.test).id。
>
> - 对于本应用包资源，通过指定资源ID或资源名进行访问。对于应用内跨包资源，通过指定[AppResource](#class-appresource)对象进行访问。

### static func getResourceManager(StageContext)

```cangjie
public static func getResourceManager(context: StageContext): ResourceManager
```

**功能：** 根据上下文，获取资源管理对象。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|上下文。|

**返回值：**

|类型|说明|
|:----|:----|
|[ResourceManager](#class-resourcemanager)|资源管理对象。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resMgr = ResourceManager.getResourceManager(stageContext)
```

### func addResource(String)

```cangjie
public func addResource(path: String): Unit
```

**功能：** 应用运行时，加载指定的资源路径，实现资源覆盖。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|资源路径。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001010|If the overlay path is invalid.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let path = "/data/storage/el2/base/haps/entry/files/library-default-unsigned.hsp"
resourceManager.addResource(path)
```

### func closeRawFd(String)

```cangjie
public func closeRawFd(path: String): Unit
```

**功能：** 关闭resources/rawfile目录下rawfile文件。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|rawfile文件路径。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001005|The resource not found by path.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let rawfd = resourceManager.closeRawFd("test.txt")
```

### func getBoolean(Int32)

```cangjie
public func getBoolean(resId: Int32): Bool
```

**功能：** 获取资源ID对应的布尔结果。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|资源对象对应的布尔结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.boolean.test)
resourceManager.getBoolean(Int32(res.id))
```

### func getBoolean(AppResource)

```cangjie
public func getBoolean(resource: AppResource): Bool
```

**功能：** 获取资源对象对应的布尔结果。此接口用于多工程应用内跨包访问。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|资源对象对应的布尔结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.boolean.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getBoolean(resource)
```

### func getBooleanByName(String)

```cangjie
public func getBooleanByName(resName: String): Bool
```

**功能：** 获取资源名对应的布尔结果。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|资源名对应的布尔结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getBooleanByName("test")
```

### func getColor(AppResource)

```cangjie
public func getColor(resource: AppResource): UInt32
```

**功能：** 获取资源对象对应颜色资源的值。此接口用于多工程应用内跨包访问。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|资源对象对应颜色资源的值（十进制）。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.color.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getColor(resource)
```

### func getColor(Int32)

```cangjie
public func getColor(resId: Int32): UInt32
```

**功能：** 获取资源ID对应颜色资源的值。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|资源对象对应颜色资源的值（十进制）。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.color.test)
resourceManager.getColor(Int32(res.id))
```

### func getColorByName(String)

```cangjie
public func getColorByName(resName: String): UInt32
```

**功能：** 获取资源名对应颜色资源的值。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|资源名对应颜色资源的值（十进制）。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getColorByName("test")
```

### func getConfiguration()

```cangjie
public func getConfiguration(): Configuration
```

**功能：** 获取设备的配置信息，返回[Configuration](#class-configuration)对象。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Configuration](#class-configuration)|设备的配置信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let configuration = resourceManager.getConfiguration()
AppLog.info(configuration.locale)
AppLog.info(configuration.direction.getValue().toString())
```

### func getDeviceCapability()

```cangjie
public func getDeviceCapability(): DeviceCapability
```

**功能：** 获取设备的设备能力，返回[DeviceCapability](#class-devicecapability)对象。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[DeviceCapability](#class-devicecapability)|设备能力。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let deviceCapability = resourceManager.getDeviceCapability()
AppLog.info(deviceCapability.screenDensity.getValue().toString())
AppLog.info(deviceCapability.deviceType.getValue().toString())
```

### func getDrawableDescriptor(Int32, UInt32)

```cangjie
public func getDrawableDescriptor(resId: Int32, density!: UInt32 = 0): DrawableDescriptor
```

**功能：** 获取资源ID对应的图片资源，返回图片资源的[DrawableDescriptor](#class-drawabledescriptor)用于图标的显示。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|
|density|UInt32|否|0| **命名参数。** 资源获取需要的屏幕密度，0或缺省表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|[DrawableDescriptor](#class-drawabledescriptor)|资源ID对应图片资源的[DrawableDescriptor](#class-drawabledescriptor)对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.media.test)
resourceManager.getDrawableDescriptor(Int32(res.id), density: 0)
```

### func getDrawableDescriptor(AppResource, UInt32)

```cangjie
public func getDrawableDescriptor(resource: AppResource, density!: UInt32 = 0): DrawableDescriptor
```

**功能：** 获取资源对象对应的图片资源，返回图片资源的[DrawableDescriptor](#class-drawabledescriptor)用于图标的显示。此接口用于多工程应用内跨包访问。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|
|density|UInt32|否|0| **命名参数。** 资源获取需要的屏幕密度，0或缺省表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|[DrawableDescriptor](#class-drawabledescriptor)|资源ID对应图片资源的[DrawableDescriptor](#class-drawabledescriptor)对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.media.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getDrawableDescriptor(resource, density: 0)
```

### func getDrawableDescriptorByName(String, UInt32)

```cangjie
public func getDrawableDescriptorByName(resName: String, density!: UInt32 = 0): DrawableDescriptor
```

**功能：** 获取资源对象对应的图片资源，返回图片资源的[DrawableDescriptor](#class-drawabledescriptor)用于图标的显示。此接口用于多工程应用内跨包访问。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|
|density|UInt32|否|0| **命名参数。** 资源获取需要的屏幕密度，0或缺省表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|[DrawableDescriptor](#class-drawabledescriptor)|资源ID对应图片资源的[DrawableDescriptor](#class-drawabledescriptor)对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getDrawableDescriptorByName("test")
```

### func getLocales(Bool)

```cangjie
public func getLocales(includeSystem!: Bool = false): Array<String>
```

**功能：** 获取应用的语言列表。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|includeSystem|Bool|否|false| **命名参数。** 是否包含系统资源，默认值为false。 <br> false：表示仅获取应用资源的语言列表。 <br>true：表示获取系统资源和应用资源的语言列表。 <br>当系统资源管理对象获取语言列表时，includeSystem值无效，返回获取系统资源语言列表。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回获取的语言列表，列表中的字符串由语言、脚本（可选）、地区（可选），按照顺序使用中划线"-"连接组成。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getLocales()
```

### func getMediaBase64ByName(String, UInt32)

```cangjie
public func getMediaBase64ByName(resName: String, density!: UInt32 = 0): String
```

**功能：** 获取资源名对应指定屏幕密度的图片资源，返回图片资源的Base64编码。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|
|density|UInt32|否|0| **命名参数。** 资源获取需要的屏幕密度，0或缺省表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源名对应图片资源的Base64编码。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getMediaBase64ByName("test")
```

### func getMediaByName(String, UInt32)

```cangjie
public func getMediaByName(resName: String, density: UInt32): Array<UInt8>
```

**功能：** 获取资源名对应指定屏幕密度的媒体文件内容。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|
|density|UInt32|是|-|资源获取需要的屏幕密度，0表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|资源名对应的媒体资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getMediaByName("test", 120)
```

### func getMediaContent(Int32, UInt32)

```cangjie
public func getMediaContent(resId: Int32, density: UInt32): Array<UInt8>
```

**功能：** 获取资源ID对应指定屏幕密度的媒体文件内容。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|
|density|UInt32|是|-|资源获取需要的屏幕密度，0表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|资源ID对应的媒体资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.media.test)
resourceManager.getMediaContent(Int32(res.id), 120)
```

### func getMediaContent(AppResource, UInt32)

```cangjie
public func getMediaContent(resource: AppResource, density: UInt32): Array<UInt8>
```

**功能：** 获取资源对象对应指定的屏幕密度媒体文件内容。此接口用于多工程应用内跨包访问源。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|
|density|UInt32|是|-|资源获取需要的屏幕密度，0表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|资源对象对应的媒体资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.media.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getMediaContent(resource, 120)
```

### func getMediaContentBase64(Int32, UInt32)

```cangjie
public func getMediaContentBase64(resId: Int32, density!: UInt32 = 0): String
```

**功能：** 获取资源ID对应指定屏幕密度的图片资源，返回图片资源的Base64编码。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|
|density|UInt32|否|0| **命名参数。** 资源获取需要的屏幕密度，0或缺省表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源对象对应图片资源的Base64编码。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.media.test)
resourceManager.getMediaContentBase64(Int32(res.id), density: 120)
```

### func getMediaContentBase64(AppResource, UInt32)

```cangjie
public func getMediaContentBase64(resource: AppResource, density!: UInt32 = 0): String
```

**功能：** 获取资源对象对应指定屏幕密度的图片资源，返回图片资源的Base64编码。此接口用于多工程应用内跨包访问。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|
|density|UInt32|否|0| **命名参数。** 资源获取需要的屏幕密度，0或缺省表示默认屏幕密度。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源对象对应图片资源的Base64编码。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|If the density invalid.|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.media.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getMediaContentBase64(resource, density: 120)
```

### func getNumber(Int32)

```cangjie
public func getNumber(resId: Int32): Number
```

**功能：** 获取资源ID对应的数字资源。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|

**返回值：**

|类型|说明|
|:----|:----|
|[Number](#enum-number)|资源对象对应的数字资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.integer.test)
let number = resourceManager.getNumber(Int32(res.id))
match (number) {
    case INT(v) => AppLog.info(v.toString())
    case FLOAT(v) => AppLog.info(v.toString())
    case _ => throw IllegalArgumentException("The type is not supported.")
}
```

### func getNumber(AppResource)

```cangjie
public func getNumber(resource: AppResource): Number
```

**功能：** 获取资源对象的数字资源。此接口用于多工程应用内跨包访问。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|

**返回值：**

|类型|说明|
|:----|:----|
|[Number](#enum-number)|资源对象对应的数字资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.integer.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
let number = resourceManager.getNumber(resource)
match (number) {
    case INT(v) => AppLog.info(v.toString())
    case FLOAT(v) => AppLog.info(v.toString())
    case _ => throw IllegalArgumentException("The type is not supported.")
}
```

### func getNumberByName(String)

```cangjie
public func getNumberByName(resName: String): Number
```

**功能：** 获取资源名的数字资源。若integer资源和float资源中有相同的`resName`，优先返回integer资源的数值。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|

**返回值：**

|类型|说明|
|:----|:----|
|[Number](#enum-number)|资源名对应的数字资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let number = resourceManager.getNumberByName("test")
match (number) {
    case INT(v) => AppLog.info(v.toString())
    case FLOAT(v) => AppLog.info(v.toString())
    case _ => throw IllegalArgumentException("The type is not supported.")
}
```

### func getPluralStringByName(String, Int64)

```cangjie
public func getPluralStringByName(resName: String, num: Int64): String
```

**功能：** 获取资源名的单复数字符串资源，并根据指定数量格式化字符串。

> **说明：**
>
> 中文环境下，字符串不区分单复数；英文环境下，字符串区分单复数。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|
|num|Int64|是|-|数量值。|

**返回值：**

|类型|说明|
|:----|:----|
|String|指定资源名的单复数字符串资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getPluralStringByName("test", 1)
```

### func getPluralStringValue(Int32, Int64)

```cangjie
public func getPluralStringValue(resId: Int32, num: Int64): String
```

**功能：** 获取资源ID的单复数字符串资源，并根据指定数量格式化字符串。

> **说明：**
>
> 中文环境下，字符串不区分单复数；英文环境下，字符串区分单复数。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|
|num|Int64|是|-|数量值。|

**返回值：**

|类型|说明|
|:----|:----|
|String|指定资源对象的单复数字符串资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.plural.test)
resourceManager.getPluralStringValue(Int32(res.id), 1)
```

### func getPluralStringValue(AppResource, Int64)

```cangjie
public func getPluralStringValue(resource: AppResource, num: Int64): String
```

**功能：** 获取资源对象的单复数字符串资源，并根据指定数量格式化字符串。此接口用于多工程应用内跨包访问。

> **说明：**
>
> 中文环境下，字符串不区分单复数；英文环境下，字符串区分单复数。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|
|num|Int64|是|-|数量值。|

**返回值：**

|类型|说明|
|:----|:----|
|String|指定资源对象的单复数字符串资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.plural.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getPluralStringValue(resource, 1)
```

### func getRawFd(String)

```cangjie
public func getRawFd(path: String): RawFileDescriptor
```

**功能：** 获取resources/rawfile目录下对应rawfile文件的descriptor。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|rawfile文件路径。|

**返回值：**

|类型|说明|
|:----|:----|
|[RawFileDescriptor](#class-rawfiledescriptor)|rawfile文件的descriptor。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001005|If the resource not found by path.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*
import ohos.base.AppLog

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let rawfd = resourceManager.getRawFd("test.txt")
AppLog.info("${rawfd.fd} ${rawfd.offset} ${rawfd.length}")
```

### func getRawFileContent(String)

```cangjie
public func getRawFileContent(path: String): Array<UInt8>
```

**功能：** 获取resources/rawfile目录下对应的rawfile文件内容，返回字节数组。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|rawfile文件路径。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|rawfile文件的内容。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001005|If the resource not found by path.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getRawFileContent("test.txt")
```

### func getRawFileList(String)

```cangjie
public func getRawFileList(path: String): Array<String>
```

**功能：** 获取resources/rawfile目录下文件夹及文件列表，返回文件列表的字符串数组。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|rawfile文件夹路径。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|rawfile文件夹下的列表（包含子文件夹和文件）。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001005|If the resource not found by path.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getRawFileList("")
```

### func getString(Int32)

```cangjie
public func getString(resId: Int32): String
```

**功能：** 获取资源ID对应的字符串资源。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源ID对应的字符串资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|
  |9001007|If the resource obtained by resId formatting error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let resource = @r(app.string.test)
resourceManager.getString(Int32(resource.id))
```

### func getString(Int32, Array\<FormatArgs>)

```cangjie
public func getString(resId: Int32, args: Array<FormatArgs>): String
```

**功能：** 获取资源ID对应的字符串资源，并根据args参数进行格式化。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源对象。|
|args|Array\<[FormatArgs](#enum-formatargs)>|是|-|格式化字符串资源参数。 <br>支持参数类型：<br /> %d、%f、%s、%%。 <br>说明：%%转译符，转译%。<br>举例：%%d格式化后为%d字符串。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源名对应的格式化字符串。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|
  |9001007|If the resource obtained by resId formatting error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let resource = @r(app.string.test)
resourceManager.getString(Int32(resource.id), FormatArgs.STRING("format string"), FormatArgs.INT(10), FormatArgs.FLOAT(98.78))
```

### func getString(AppResource)

```cangjie
public func getString(resource: AppResource): String
```

**功能：** 获取资源对象对应的字符串资源。此接口用于多工程应用内跨包访问。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源对象对应的字符串资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|
  |9001007|If the resource obtained by resId formatting error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.string.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getString(resource)
```

### func getString(AppResource, Array\<FormatArgs>)

```cangjie
public func getString(resource: AppResource, args: Array<FormatArgs>): String
```

**功能：** 获取资源对象对应的字符串资源，根据args参数进行格式化。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|
|args|Array\<[FormatArgs](#enum-formatargs)>|是|-|格式化字符串资源参数。 <br>支持参数类型：<br /> %d、%f、%s、%%。 <br>说明：%%转译符，转译%。<br>举例：%%d格式化后为%d字符串。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源名对应的格式化字符串。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|
  |9001007|If the resource obtained by resId formatting error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.string.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getString(resource, FormatArgs.STRING("format string"), FormatArgs.INT(10), FormatArgs.FLOAT(98.78))
```

### func getStringArrayByName(String)

```cangjie
public func getStringArrayByName(resName: String): Array<String>
```

**功能：** 获取资源名对应的字符串数组资源。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|对应资源名的字符串数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getStringArrayByName("test")
```

### func getStringArrayValue(Int32)

```cangjie
public func getStringArrayValue(resId: Int32): Array<String>
```

**功能：** 获取资源ID对应的字符串数组资源。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resId|Int32|是|-|资源ID。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|资源ID对应的字符串数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let re = @r(app.strarray.test)
resourceManager.getStringArrayValue(Int32(res.id))
```

### func getStringArrayValue(AppResource)

```cangjie
public func getStringArrayValue(resource: AppResource): Array<String>
```

**功能：** 获取资源对象对应的字符串数组资源。此接口用于多工程应用内跨包访问。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|是|-|资源对象。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|资源对象对应的字符串数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001001|If the resId invalid.|
  |9001002|If the resource not found by resId.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let res = @r(app.strarray.test)
let resource = AppResource("com.example.myapplication", "entry", Int32(res.id))
resourceManager.getStringArrayValue(resource)
```

### func getStringByName(String)

```cangjie
public func getStringByName(resName: String): String
```

**功能：** 获取资源名对应的字符串资源。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源名对应的字符串资源。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getStringByName("test")
```

### func getStringByName(String, Array\<FormatArgs>)

```cangjie
public func getStringByName(resName: String, args: Array<FormatArgs>): String
```

**功能：** 获取资源名对应的字符串资源，根据args参数进行格式化。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resName|String|是|-|资源名。|
|args|Array\<[FormatArgs](#enum-formatargs)>|是|-|格式化字符串资源参数。 <br>支持参数类型：<br /> %d、%f、%s、%%。 <br>说明：%%转译符，转译%。<br>举例：%%d格式化后为%d字符串。|

**返回值：**

|类型|说明|
|:----|:----|
|String|资源名对应的格式化字符串。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001003|If the resName invalid.|
  |9001004|If the resource not found by resName.|
  |9001006|If the resource re-ref too much.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
resourceManager.getStringByName("test", FormatArgs.STRING("format string"), FormatArgs.INT(10), FormatArgs.FLOAT(98.78))
```

### func removeResource(String)

```cangjie
public func removeResource(path: String): Unit
```

**功能：** 用户运行时，移除指定的资源路径，还原被覆盖前的资源。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|资源路径。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[资源管理错误码](../../errorcodes/cj-errorcode-resource-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |9001010|If the overlay path is invalid.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
import kit.AbilityKit.*

let stageContext = getStageContext(Global.abilityContext)
let resourceManager = ResourceManager.getResourceManager(stageContext)
let path = "/data/storage/el2/base/haps/entry/files/library-default-unsigned.hsp"
resourceManager.removeResource(path)
```

## enum DeviceType

```cangjie
public enum DeviceType {
    | DEVICE_TYPE_PHONE
    | DEVICE_TYPE_TABLET
    | DEVICE_TYPE_CAR
    | DEVICE_TYPE_PC
    | DEVICE_TYPE_TV
    | DEVICE_TYPE_WEARABLE
    | DEVICE_TYPE_2IN1
    | ...
}
```

**功能：** 用于表示当前设备类型。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DEVICE_TYPE_2IN1

```cangjie
DEVICE_TYPE_2IN1
```

**功能：** 二合一设备。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DEVICE_TYPE_CAR

```cangjie
DEVICE_TYPE_CAR
```

**功能：** 汽车。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DEVICE_TYPE_PC

```cangjie
DEVICE_TYPE_PC
```

**功能：** 电脑。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DEVICE_TYPE_PHONE

```cangjie
DEVICE_TYPE_PHONE
```

**功能：** 手机。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DEVICE_TYPE_TABLET

```cangjie
DEVICE_TYPE_TABLET
```

**功能：** 平板。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DEVICE_TYPE_TV

```cangjie
DEVICE_TYPE_TV
```

**功能：** 电视。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DEVICE_TYPE_WEARABLE

```cangjie
DEVICE_TYPE_WEARABLE
```

**功能：** 穿戴。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### static func parse(Int32)

```cangjie
public static func parse(val: Int32): DeviceType
```

**功能：** 根据设备类型值，构造设备类型实例。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Int32|是|-|设备类型的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[DeviceType](#enum-devicetype)|设备类型实例。|

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取设备类型的值。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|当前设备类型的值。|

## enum Direction

```cangjie
public enum Direction {
    | DIRECTION_VERTICAL
    | DIRECTION_HORIZONTAL
    | ...
}
```

**功能：** 用于表示设备屏幕方向。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DIRECTION_HORIZONTAL

```cangjie
DIRECTION_HORIZONTAL
```

**功能：** 横屏。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### DIRECTION_VERTICAL

```cangjie
DIRECTION_VERTICAL
```

**功能：** 竖屏。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### static func parse(Int32)

```cangjie
public static func parse(val: Int32): Direction
```

**功能：** 根据设备屏幕方向值，构造设备屏幕方向实例。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Int32|是|-|屏幕方向的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[Direction](#enum-direction)|屏幕方向实例。|

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取屏幕方向的值。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|当前屏幕方向的值。|

## enum FormatArgs

```cangjie
public enum FormatArgs {
    | INT(Int32)
    | FLOAT(Float32)
    | STRING(String)
    | ...
}
```

**功能：** 表示字符串的格式化数据。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### FLOAT(Float32)

```cangjie
FLOAT(Float32)
```

**功能：** 存储Float32类型值的格式化数据。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**功能：** 存储Int32类型值的格式化数据。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### STRING(String)

```cangjie
STRING(String)
```

**功能：** 存储String类型值的格式化数据。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

## enum Number

```cangjie
public enum Number {
    | INT(Int32)
    | FLOAT(Float32)
    | ...
}
```

**功能：** 表示从资源中获取到的数字类型。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### FLOAT(Float32)

```cangjie
FLOAT(Float32)
```

**功能：** 存储Float32类型值的Number类型。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**功能：** 存储Int32类型值的Number类型。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

## enum ScreenDensity

```cangjie
public enum ScreenDensity {
    | SCREEN_SDPI
    | SCREEN_MDPI
    | SCREEN_LDPI
    | SCREEN_XLDPI
    | SCREEN_XXLDPI
    | SCREEN_XXXLDPI
    | ...
}
```

**功能：** 用于表示当前设备屏幕密度。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### SCREEN_LDPI

```cangjie
SCREEN_LDPI
```

**功能：** 大规模的屏幕密度。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### SCREEN_MDPI

```cangjie
SCREEN_MDPI
```

**功能：** 中规模的屏幕密度。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### SCREEN_SDPI

```cangjie
SCREEN_SDPI
```

**功能：** 小规模的屏幕密度。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### SCREEN_XLDPI

```cangjie
SCREEN_XLDPI
```

**功能：** 特大规模的屏幕密度。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### SCREEN_XXLDPI

```cangjie
SCREEN_XXLDPI
```

**功能：** 超大规模的屏幕密度。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### SCREEN_XXXLDPI

```cangjie
SCREEN_XXXLDPI
```

**功能：** 超特大规模的屏幕密度。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

### static func parse(Int32)

```cangjie
public static func parse(val: Int32): ScreenDensity
```

**功能：** 根据屏幕密度值，构造屏幕密度实例。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Int32|是|-|屏幕密度的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[ScreenDensity](#enum-screendensity)|屏幕密度实例。|

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取屏幕密度的值。

**系统能力：** SystemCapability.Global.ResourceManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|当前屏幕密度的值。|
