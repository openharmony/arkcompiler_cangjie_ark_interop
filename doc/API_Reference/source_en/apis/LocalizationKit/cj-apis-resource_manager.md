# ohos.resource_manager (Resource Management)

The resource management module provides interfaces for obtaining application resource objects based on the current configuration: language, region, screen orientation, MCC (Mobile Country Code) and MNC (Mobile Network Code), device capability (device type), and density (resolution).

## Import Module

```cangjie
import kit.LocalizationKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of the example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

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

**Function:** Macro usage for resource management.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| bundleName | String | Yes | - | The package name of the application. |
| moudleType | String | Yes | - | The module type of the application. |
| moduleName | String | Yes | - | The module name of the application. |
| resId | Int32 | Yes | - | The resource ID. |
| resStr | String | Yes | - | The resource name. |
| params | Array\<Any> | Yes | - | Other resource parameters. |
| resType | Int32 | Yes | - | The type of the resource. |

**Return Value:**

| Type | Description |
|:----|:----|
| [AppResource](#class-appresource) | The resource type. |

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

**Function:** Represents the resource type.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parent Types:**

- [Length](../../arkui-cj/cj-common-types.md#interface-length)
- [ResourceColor](../../arkui-cj/cj-common-types.md#interface-resourcecolor)

### let bundleName

```cangjie
public let bundleName: String
```

**Function:** The package name of the application.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let id

```cangjie
public let id: Int32
```

**Function:** The resource ID.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let moduleName

```cangjie
public let moduleName: String
```

**Function:** The module name of the application.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let params

```cangjie
public let params: ?Array<Any>=None
```

**Function:** Other resource parameters (optional).

**Type:** ?Array\<Any>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let resType

```cangjie
public let resType: ?Int32 = None
```

**Function:** The type of the resource (optional).

**Type:** ?Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

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

**Function:** Constructs a resource type object.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| bundleName | String | Yes | - | The package name of the application. |
| moduleName | String | Yes | - | The module name of the application. |
| id | Int32 | Yes | - | The resource ID. |
| params | ?Array\<Any> | No | None | **Named parameter.** Other resource parameters. |
| resType | ?Int32 | No | None | **Named parameter.** The type of the resource. |

## class Configuration

```cangjie
public class Configuration <: ToString {
    public var direction: Direction
    public var locale: String
    public init(direction: Direction, locale: String)
}
```

**Function:** Represents the configuration of the current device.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parent Types:**

- ToString

### var direction

```cangjie
public var direction: Direction
```

**Function:** The screen orientation.

**Type:** [Direction](#enum-direction)

**Read/Write Capability:** Read/Write

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### var locale

```cangjie
public var locale: String
```

**Function:** The language, script, and region.

**Type:** String

**Read/Write Capability:** Read/Write

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### init(Direction, String)

```cangjie
public init(direction: Direction, locale: String)
```

**Function:** Constructs an object representing the current device state.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| direction | [Direction](#enum-direction) | Yes | - | The screen orientation. |
| locale | String | Yes | - | The language, script, and region. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the information of the current [Configuration](#class-configuration) as a string.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The information of the current [Configuration](#class-configuration). |

## class DeviceCapability

```cangjie
public class DeviceCapability <: ToString {
    public DeviceCapability(
        public let screenDensity: ScreenDensity,
        public let deviceType: DeviceType
    )
}
```

**Function:** Represents the capabilities supported by the device.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parent Types:**

- ToString### let deviceType

```cangjie
public let deviceType: DeviceType
```

**Function:** Current device type.

**Type:** [DeviceType](#enum-devicetype)

**Access:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let screenDensity

```cangjie
public let screenDensity: ScreenDensity
```

**Function:** Current device screen density.

**Type:** [ScreenDensity](#enum-screendensity)

**Access:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DeviceCapability(ScreenDensity, DeviceType)

```cangjie
public DeviceCapability(
    public let screenDensity: ScreenDensity,
    public let deviceType: DeviceType
)
```

**Function:** Constructs a device capability object.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| screenDensity | [ScreenDensity](#enum-screendensity) | Yes | - | Current device screen density. |
| deviceType | [DeviceType](#enum-devicetype) | Yes | - | Current device type. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the information of the current [DeviceCapability](#class-devicecapability) as a string.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Information of the current [DeviceCapability](#class-devicecapability). |

## class DrawableDescriptor

```cangjie
public class DrawableDescriptor {}
```

**Function:** Represents a [DrawableDescriptor](#class-drawabledescriptor) instance.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

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

**Function:** Represents descriptor information of a rawfile.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let fd

```cangjie
public let fd: Int32
```

**Function:** File descriptor of the HAP where the rawfile is located.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let length

```cangjie
public let length: Int64
```

**Function:** Length of the rawfile.

**Type:** Int64

**Access:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let offset

```cangjie
public let offset: Int64
```

**Function:** Starting offset of the rawfile.

**Type:** Int64

**Access:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### RawFileDescriptor(Int32, Int64, Int64)

```cangjie
public RawFileDescriptor(
    public let fd: Int32,
    public let offset: Int64,
    public let length: Int64
)
```

**Function:** Constructs a [RawFileDescriptor](#class-rawfiledescriptor) instance based on the file descriptor, starting offset, and file length.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor of the HAP where the rawfile is located. |
| offset | Int64 | Yes | - | Starting offset of the rawfile. |
| length | Int64 | Yes | - | Length of the rawfile. |

## class ResourceManager

```cangjie
public class ResourceManager {}
```

**Function:** Provides the capability to access application resources.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

> **Note:**
>
> - Resource files are defined in the `resources` directory of the project. Resource IDs can be obtained via `@r(resource address).id`, e.g., `@r(app.string.test).id`.
>
> - For resources within the current application package, access is via specified resource IDs or names. For cross-package resources within the application, access is via specified [AppResource](#class-appresource) objects.

### static func getResourceManager(StageContext)

```cangjie
public static func getResourceManager(context: StageContext): ResourceManager
```

**Function:** Obtains the resource manager object based on the context.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ResourceManager](#class-resourcemanager) | Resource manager object. |

**Example:**

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

**Function:** Loads the specified resource path during application runtime to achieve resource overlay.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Resource path. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001010 | If the overlay path is invalid. |

**Example:**

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

**Function:** Closes a rawfile in the `resources/rawfile` directory.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Rawfile path. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001005 | The resource not found by path. |

**Example:**<!-- compile -->

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

**Function:** Retrieves the boolean result corresponding to the resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resId | Int32 | Yes | - | Resource ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Boolean result corresponding to the resource object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the boolean result corresponding to the resource object. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](#class-appresource) | Yes | - | Resource object. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Boolean result corresponding to the resource object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the boolean result corresponding to the resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | Resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Boolean result corresponding to the resource name. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001003 | If the resName is invalid. |
  | 9001004 | If the resource is not found by resName. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the value of the color resource corresponding to the resource object. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](#class-appresource) | Yes | - | Resource object. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Value of the color resource corresponding to the resource object (in decimal). |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the value of the color resource corresponding to the resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resId | Int32 | Yes | - | Resource ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Value of the color resource corresponding to the resource object (in decimal). |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the value of the color resource corresponding to the resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | Resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Value of the color resource corresponding to the resource name (in decimal). |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001003 | If the resName is invalid. |
  | 9001004 | If the resource is not found by resName. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**<!-- compile -->

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

**Function:** Retrieves the device configuration information and returns a [Configuration](#class-configuration) object.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Configuration](#class-configuration) | The device configuration information. |

**Example:**

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

**Function:** Retrieves the device capabilities and returns a [DeviceCapability](#class-devicecapability) object.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [DeviceCapability](#class-devicecapability) | The device capabilities. |

**Example:**

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

**Function:** Retrieves the image resource corresponding to the resource ID and returns a [DrawableDescriptor](#class-drawabledescriptor) for displaying the icon.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resId | Int32 | Yes | - | The resource ID. |
| density | UInt32 | No | 0 | **Named parameter.** The screen density required for resource retrieval; 0 or omitted means the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DrawableDescriptor](#class-drawabledescriptor) | The [DrawableDescriptor](#class-drawabledescriptor) object corresponding to the image resource. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | If the density is invalid. |
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |

**Example:**

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

**Function:** Retrieves the image resource corresponding to the resource object and returns a [DrawableDescriptor](#class-drawabledescriptor) for displaying the icon. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](#class-appresource) | Yes | - | The resource object. |
| density | UInt32 | No | 0 | **Named parameter.** The screen density required for resource retrieval; 0 or omitted means the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DrawableDescriptor](#class-drawabledescriptor) | The [DrawableDescriptor](#class-drawabledescriptor) object corresponding to the image resource. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | If the density is invalid. |
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |

**Example:**

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

**Function:** Retrieves the image resource corresponding to the resource name and returns a [DrawableDescriptor](#class-drawabledescriptor) for displaying the icon. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | The resource name. |
| density | UInt32 | No | 0 | **Named parameter.** The screen density required for resource retrieval; 0 or omitted means the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DrawableDescriptor](#class-drawabledescriptor) | The [DrawableDescriptor](#class-drawabledescriptor) object corresponding to the image resource. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | If the density is invalid. |
  | 9001003 | If the resName is invalid. |
  | 9001004 | If the resource is not found by resName. |

**Example:**

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

**Function:** Retrieves the list of languages supported by the application.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| includeSystem | Bool | No | false | **Named parameter.** Whether to include system resources; the default is false. <br> false: Only retrieves the language list of application resources. <br> true: Retrieves the language list of both system and application resources. <br> When retrieving the language list from the system resource manager, the includeSystem parameter is ignored, and the system resource language list is returned. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns the list of languages, where each string is composed of language, script (optional), and region (optional), connected by hyphens "-". |

**Example:**

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

**Function:** Retrieves the image resource corresponding to the specified screen density by resource name and returns its Base64 encoding.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | The resource name. |
| density | UInt32 | No | 0 | **Named parameter.** The screen density required for resource retrieval; 0 or omitted means the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The Base64 encoding of the image resource corresponding to the resource name. |**Exceptions:**

- BusinessException: For detailed information on error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|If the density is invalid.|
  |9001003|If the resName is invalid.|
  |9001004|If the resource is not found by resName.|

**Example:**

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

**Function:** Retrieves the media file content corresponding to the specified resource name and screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|resName|String|Yes|-|Resource name.|
|density|UInt32|Yes|-|Screen density required for resource retrieval, where 0 indicates the default screen density.|

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<UInt8>|Media resource corresponding to the resource name.|

**Exceptions:**

- BusinessException: For detailed information on error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|If the density is invalid.|
  |9001003|If the resName is invalid.|
  |9001004|If the resource is not found by resName.|

**Example:**

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

**Function:** Retrieves the media file content corresponding to the specified resource ID and screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|resId|Int32|Yes|-|Resource ID.|
|density|UInt32|Yes|-|Screen density required for resource retrieval, where 0 indicates the default screen density.|

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<UInt8>|Media resource corresponding to the resource ID.|

**Exceptions:**

- BusinessException: For detailed information on error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|If the density is invalid.|
  |9001001|If the resId is invalid.|
  |9001002|If the resource is not found by resId.|

**Example:**

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

**Function:** Retrieves the media file content corresponding to the specified resource object and screen density. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|Yes|-|Resource object.|
|density|UInt32|Yes|-|Screen density required for resource retrieval, where 0 indicates the default screen density.|

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<UInt8>|Media resource corresponding to the resource object.|

**Exceptions:**

- BusinessException: For detailed information on error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|If the density is invalid.|
  |9001001|If the resId is invalid.|
  |9001002|If the resource is not found by resId.|

**Example:**

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

**Function:** Retrieves the image resource corresponding to the specified resource ID and screen density, returning the Base64 encoding of the image resource.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|resId|Int32|Yes|-|Resource ID.|
|density|UInt32|No|0| **Named parameter.** Screen density required for resource retrieval, where 0 or omission indicates the default screen density.|

**Return Value:**

|Type|Description|
|:----|:----|
|String|Base64 encoding of the image resource corresponding to the resource object.|

**Exceptions:**

- BusinessException: For detailed information on error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|If the density is invalid.|
  |9001001|If the resId is invalid.|
  |9001002|If the resource is not found by resId.|

**Example:**

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

**Function:** Retrieves the image resource corresponding to the specified resource object and screen density, returning the Base64 encoding of the image resource. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|Yes|-|Resource object.|
|density|UInt32|No|0| **Named parameter.** Screen density required for resource retrieval, where 0 or omission indicates the default screen density.|

**Return Value:**

|Type|Description|
|:----|:----|
|String|Base64 encoding of the image resource corresponding to the resource object.|

**Exceptions:**

- BusinessException: For detailed information on error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|If the density is invalid.|
  |9001001|If the resId is invalid.|
  |9001002|If the resource is not found by resId.|

**Example:**

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

**Function:** Retrieves the numeric resource corresponding to the specified resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|resId|Int32|Yes|-|Resource ID.|

**Return Value:**| Type | Description |
|:----|:----|
|[Number](#enum-number)|The numeric resource corresponding to the resource object.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |9001001|If the resId is invalid.|
  |9001002|If the resource is not found by resId.|
  |9001006|If the resource is re-referenced too many times.|

**Example:**

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

**Function:** Gets the numeric resource of the resource object. This interface is used for cross-package access in multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|Yes|-|The resource object.|

**Return Value:**

| Type | Description |
|:----|:----|
|[Number](#enum-number)|The numeric resource corresponding to the resource object.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |9001001|If the resId is invalid.|
  |9001002|If the resource is not found by resId.|
  |9001006|If the resource is re-referenced too many times.|

**Example:**

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

**Function:** Gets the numeric resource by resource name. If both integer and float resources have the same `resName`, the integer resource value is returned first.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|resName|String|Yes|-|The resource name.|

**Return Value:**

| Type | Description |
|:----|:----|
|[Number](#enum-number)|The numeric resource corresponding to the resource name.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |9001003|If the resName is invalid.|
  |9001004|If the resource is not found by resName.|
  |9001006|If the resource is re-referenced too many times.|

**Example:**

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

**Function:** Gets the singular/plural string resource by resource name and formats the string according to the specified quantity.

> **Note:**
>
> In Chinese environments, strings do not distinguish between singular and plural forms. In English environments, strings do distinguish between singular and plural forms.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|resName|String|Yes|-|The resource name.|
|num|Int64|Yes|-|The quantity value.|

**Return Value:**

| Type | Description |
|:----|:----|
|String|The singular/plural string resource corresponding to the specified resource name.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |9001003|If the resName is invalid.|
  |9001004|If the resource is not found by resName.|
  |9001006|If the resource is re-referenced too many times.|

**Example:**

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

**Function:** Gets the singular/plural string resource by resource ID and formats the string according to the specified quantity.

> **Note:**
>
> In Chinese environments, strings do not distinguish between singular and plural forms. In English environments, strings do distinguish between singular and plural forms.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|resId|Int32|Yes|-|The resource ID.|
|num|Int64|Yes|-|The quantity value.|

**Return Value:**

| Type | Description |
|:----|:----|
|String|The singular/plural string resource corresponding to the specified resource object.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |9001001|If the resId is invalid.|
  |9001002|If the resource is not found by resId.|
  |9001006|If the resource is re-referenced too many times.|

**Example:**

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

**Function:** Gets the singular/plural string resource of the resource object and formats the string according to the specified quantity. This interface is used for cross-package access in multi-project applications.

> **Note:**
>
> In Chinese environments, strings do not distinguish between singular and plural forms. In English environments, strings do distinguish between singular and plural forms.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|resource|[AppResource](#class-appresource)|Yes|-|The resource object.|
|num|Int64|Yes|-|The quantity value.|

**Return Value:**

| Type | Description |
|:----|:----|
|String|The singular/plural string resource corresponding to the specified resource object.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |9001001|If the resId is invalid.|
  |9001002|If the resource is not found by resId.|
  |9001006|If the resource is re-referenced too many times.|

**Example:**

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

**Function:** Obtains the descriptor of the rawfile under the resources/rawfile directory.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description            |
|:----------|:-------|:----------|:--------|:-----------------------|
| path      | String | Yes       | -       | Path of the rawfile.   |

**Return Value:**

| Type                          | Description                     |
|:------------------------------|:--------------------------------|
| [RawFileDescriptor](#class-rawfiledescriptor) | Descriptor of the rawfile.      |

**Exceptions:**

- BusinessException: For details about error codes, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message                  |
  |:--------------|:-------------------------------|
  | 9001005       | If the resource not found by path. |

**Example:**

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

**Function:** Obtains the content of the rawfile under the resources/rawfile directory and returns a byte array.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description            |
|:----------|:-------|:----------|:--------|:-----------------------|
| path      | String | Yes       | -       | Path of the rawfile.   |

**Return Value:**

| Type            | Description                     |
|:----------------|:--------------------------------|
| Array\<UInt8>   | Content of the rawfile.         |

**Exceptions:**

- BusinessException: For details about error codes, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message                  |
  |:--------------|:-------------------------------|
  | 9001005       | If the resource not found by path. |

**Example:**

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

**Function:** Obtains the list of files and subdirectories under the resources/rawfile directory and returns a string array of the file list.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description            |
|:----------|:-------|:----------|:--------|:-----------------------|
| path      | String | Yes       | -       | Path of the rawfile directory. |

**Return Value:**

| Type            | Description                     |
|:----------------|:--------------------------------|
| Array\<String>  | List under the rawfile directory (including subdirectories and files). |

**Exceptions:**

- BusinessException: For details about error codes, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message                  |
  |:--------------|:-------------------------------|
  | 9001005       | If the resource not found by path. |

**Example:**

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

**Function:** Obtains the string resource corresponding to the resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description            |
|:----------|:-------|:----------|:--------|:-----------------------|
| resId     | Int32  | Yes       | -       | Resource ID.           |

**Return Value:**

| Type   | Description                     |
|:-------|:--------------------------------|
| String | String resource corresponding to the resource ID. |

**Exceptions:**

- BusinessException: For details about error codes, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message                  |
  |:--------------|:-------------------------------|
  | 9001001       | If the resId invalid.          |
  | 9001002       | If the resource not found by resId. |
  | 9001006       | If the resource re-ref too much. |
  | 9001007       | If the resource obtained by resId formatting error. |

**Example:**

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

**Function:** Obtains the string resource corresponding to the resource ID and formats it based on the args parameter.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type                     | Mandatory | Default | Description            |
|:----------|:-------------------------|:----------|:--------|:-----------------------|
| resId     | Int32                    | Yes       | -       | Resource object.       |
| args      | Array\<[FormatArgs](#enum-formatargs)> | Yes       | -       | Parameters for formatting the string resource. <br>Supported parameter types: <br /> %d, %f, %s, %%. <br>Note: %% is an escape character for %. <br>Example: %%d is formatted as the string %d. |

**Return Value:**

| Type   | Description                     |
|:-------|:--------------------------------|
| String | Formatted string corresponding to the resource name. |

**Exceptions:**

- BusinessException: For details about error codes, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message                  |
  |:--------------|:-------------------------------|
  | 9001001       | If the resId invalid.          |
  | 9001002       | If the resource not found by resId. |
  | 9001006       | If the resource re-ref too much. |
  | 9001007       | If the resource obtained by resId formatting error. |

**Example:**

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

**Function:** Obtains the string resource corresponding to the resource object. This API is used for cross-package access in multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type                     | Mandatory | Default | Description            |
|:----------|:-------------------------|:----------|:--------|:-----------------------|
| resource  | [AppResource](#class-appresource) | Yes       | -       | Resource object.       |

**Return Value:**

| Type   | Description                     |
|:-------|:--------------------------------|
| String | String resource corresponding to the resource object. |

**Exceptions:**

- BusinessException: For details about error codes, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message                  |
  |:--------------|:-------------------------------|
  | 9001001       | If the resId invalid.          |
  | 9001002       | If the resource not found by resId. |
  | 9001006       | If the resource re-ref too much. |
  | 9001007       | If the resource obtained by resId formatting error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.*
```
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

**Function:** Retrieves the string resource corresponding to the resource object and formats it based on the args parameter.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](#class-appresource) | Yes | - | The resource object. |
| args | Array\<[FormatArgs](#enum-formatargs)> | Yes | - | Parameters for formatting the string resource. <br>Supported parameter types: <br /> %d, %f, %s, %%. <br>Note: %% is an escape character that translates to %. <br>Example: %%d will be formatted as the string %d. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The formatted string corresponding to the resource name. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |
  | 9001006 | If the resource is re-referenced too many times. |
  | 9001007 | If the resource obtained by resId has a formatting error. |

**Example:**

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

**Function:** Retrieves the string array resource corresponding to the resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | The resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | The string array corresponding to the resource name. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001003 | If the resName is invalid. |
  | 9001004 | If the resource is not found by resName. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the string array resource corresponding to the resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | Int32 | Yes | - | The resource ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | The string array corresponding to the resource ID. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the string array resource corresponding to the resource object. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](#class-appresource) | Yes | - | The resource object. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | The string array corresponding to the resource object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001001 | If the resId is invalid. |
  | 9001002 | If the resource is not found by resId. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the string resource corresponding to the resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | The resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string resource corresponding to the resource name. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001003 | If the resName is invalid. |
  | 9001004 | If the resource is not found by resName. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Retrieves the string resource corresponding to the resource name and formats it based on the args parameter.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | The resource name. |
| args | Array\<[FormatArgs](#enum-formatargs)> | Yes | - | Parameters for formatting the string resource. <br>Supported parameter types: <br /> %d, %f, %s, %%. <br>Note: %% is an escape character that translates to %. <br>Example: %%d will be formatted as the string %d. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The formatted string corresponding to the resource name. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001003 | If the resName is invalid. |
  | 9001004 | If the resource is not found by resName. |
  | 9001006 | If the resource is re-referenced too many times. |

**Example:**

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

**Function:** Removes the specified resource path at runtime and restores the pre-overridden resources.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Resource path. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 9001010 | If the overlay path is invalid. |

**Example:**

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

**Function:** Represents the current device type.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DEVICE_TYPE_2IN1

```cangjie
DEVICE_TYPE_2IN1
```

**Function:** 2-in-1 device.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DEVICE_TYPE_CAR

```cangjie
DEVICE_TYPE_CAR
```

**Function:** Car.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DEVICE_TYPE_PC

```cangjie
DEVICE_TYPE_PC
```

**Function:** PC.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DEVICE_TYPE_PHONE

```cangjie
DEVICE_TYPE_PHONE
```

**Function:** Phone.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DEVICE_TYPE_TABLET

```cangjie
DEVICE_TYPE_TABLET
```

**Function:** Tablet.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DEVICE_TYPE_TV

```cangjie
DEVICE_TYPE_TV
```

**Function:** TV.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DEVICE_TYPE_WEARABLE

```cangjie
DEVICE_TYPE_WEARABLE
```

**Function:** Wearable.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### static func parse(Int32)

```cangjie
public static func parse(val: Int32): DeviceType
```

**Function:** Constructs a device type instance based on the device type value.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| val | Int32 | Yes | - | Device type value. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DeviceType](#enum-devicetype) | Device type instance. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the device type value.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Current device type value. |

## enum Direction

```cangjie
public enum Direction {
    | DIRECTION_VERTICAL
    | DIRECTION_HORIZONTAL
    | ...
}
```

**Function:** Represents the device screen orientation.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DIRECTION_HORIZONTAL

```cangjie
DIRECTION_HORIZONTAL
```

**Function:** Landscape.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DIRECTION_VERTICAL

```cangjie
DIRECTION_VERTICAL
```

**Function:** Portrait.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### static func parse(Int32)

```cangjie
public static func parse(val: Int32): Direction
```

**Function:** Constructs a screen orientation instance based on the screen orientation value.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| val | Int32 | Yes | - | Screen orientation value. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Direction](#enum-direction) | Screen orientation instance. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the screen orientation value.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Current screen orientation value. |

## enum FormatArgs

```cangjie
public enum FormatArgs {
    | INT(Int32)
    | FLOAT(Float32)
    | STRING(String)
    | ...
}
```

**Function:** Represents string formatting data.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### FLOAT(Float32)
```cangjie
FLOAT(Float32)
```

**Function:** Stores formatted data of Float32 type values.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**Function:** Stores formatted data of Int32 type values.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### STRING(String)

```cangjie
STRING(String)
```

**Function:** Stores formatted data of String type values.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

## enum Number

```cangjie
public enum Number {
    | INT(Int32)
    | FLOAT(Float32)
    | ...
}
```

**Function:** Represents numeric types obtained from resources.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### FLOAT(Float32)

```cangjie
FLOAT(Float32)
```

**Function:** Stores Float32 type values as Number type.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**Function:** Stores Int32 type values as Number type.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

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

**Function:** Represents the screen density of the current device.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### SCREEN_LDPI

```cangjie
SCREEN_LDPI
```

**Function:** Large-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### SCREEN_MDPI

```cangjie
SCREEN_MDPI
```

**Function:** Medium-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### SCREEN_SDPI

```cangjie
SCREEN_SDPI
```

**Function:** Small-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### SCREEN_XLDPI

```cangjie
SCREEN_XLDPI
```

**Function:** Extra-large-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### SCREEN_XXLDPI

```cangjie
SCREEN_XXLDPI
```

**Function:** Ultra-large-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### SCREEN_XXXLDPI

```cangjie
SCREEN_XXXLDPI
```

**Function:** Super extra-large-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### static func parse(Int32)

```cangjie
public static func parse(val: Int32): ScreenDensity
```

**Function:** Constructs a screen density instance based on the screen density value.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| val | Int32 | Yes | - | The screen density value. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ScreenDensity](#enum-screendensity) | The screen density instance. |

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Retrieves the screen density value.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The current screen density value. |