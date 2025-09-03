# ohos.resource_manager

The resource management module provides interfaces for accessing application resource objects based on the current configuration: language, region, screen orientation, MCC (Mobile Country Code), MNC (Mobile Network Code), device capability, and screen density.

## Import Module

```cangjie
import kit.LocalizationKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#Cangjie-Example-Code-Instructions).

## class Configuration

```cangjie
public class Configuration {
    public var direction: Direction
    public var locale: String
    public var deviceType: DeviceType
    public var screenDensity: ScreenDensity
    public var colorMode: ColorMode
    public var mcc: UInt32
    public var mnc: UInt32
}
```

**Description:** Represents the configuration of the current device.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### var colorMode

```cangjie
public var colorMode: ColorMode
```

**Description:** Color mode.

**Type:** [ColorMode](#enum-colormode)

**Access:** Readable and writable

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### var deviceType

```cangjie
public var deviceType: DeviceType
```

**Description:** Device type.

**Type:** [DeviceType](#enum-devicetype)

**Access:** Readable and writable

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### var direction

```cangjie
public var direction: Direction
```

**Description:** Screen orientation.

**Type:** [Direction](#enum-direction)

**Access:** Readable and writable

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### var locale

```cangjie
public var locale: String
```

**Description:** Language, script, country, and region.

**Type:** String

**Access:** Readable and writable

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### var mcc

```cangjie
public var mcc: UInt32
```

**Description:** Mobile Country Code.

**Type:** UInt32

**Access:** Readable and writable

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### var mnc

```cangjie
public var mnc: UInt32
```

**Description:** Mobile Network Code.

**Type:** UInt32

**Access:** Readable and writable

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### var screenDensity

```cangjie
public var screenDensity: ScreenDensity
```

**Description:** Screen density.

**Type:** [ScreenDensity](#enum-screendensity)

**Access:** Readable and writable

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

## class DeviceCapability

```cangjie
public class DeviceCapability {
    public let screenDensity: ScreenDensity
    public let deviceType: DeviceType
}
```

**Description:** Represents the capabilities supported by the device.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let deviceType

```cangjie
public let deviceType: DeviceType
```

**Description:** Current device type.

**Type:** [DeviceType](#enum-devicetype)

**Access:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### let screenDensity

```cangjie
public let screenDensity: ScreenDensity
```

**Description:** Current device screen density.

**Type:** [ScreenDensity](#enum-screendensity)

**Access:** Read-only

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

## class ResourceManager

```cangjie
public class ResourceManager {}
```

**Description:** Provides the capability to access application resources.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### func addResource(String)

```cangjie
public func addResource(path: String): Unit
```

**Description:** Loads the specified resource path during application runtime to implement resource overlay.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Resource path. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 9001010 | Invalid overlay path. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance id is invalid. | todo | todo |

### func closeRawFd(String)

```cangjie
public func closeRawFd(path: String): Unit
```

**Description:** Closes a rawfile file in the resources/rawfile directory.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Rawfile file path. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001005 | The resource was not found by path. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance id is invalid. | todo | todo |

### func getBoolean(UInt32)

```cangjie
public func getBoolean(resId: UInt32): Bool
```

**Description:** Gets the boolean result corresponding to the resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | Resource ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The boolean result corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource was found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance id is invalid. | todo | todo |

### func getBoolean(AppResource)

```cangjie
public func getBoolean(resource: AppResource): Bool
```

**Description:** Gets the boolean result corresponding to the resource object. This interface is used for cross-package access in multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Resource object. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The boolean result corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource was found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance id is invalid. | todo | todo |

### func getBooleanByName(String)

```cangjie
public func getBooleanByName(resName: String): Bool
```

**Description:** Gets the boolean result corresponding to the resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | Resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The boolean result corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, refer to [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource was found based on the resource name. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance id is invalid. | todo | todo |### func getColor(AppResource)

```cangjie

public func getColor(resource: AppResource): UInt32
```

**Function:** Gets the color resource value corresponding to the resource object. This interface is used for cross-package access in multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | The resource object. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The color resource value (in decimal) corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getColor(UInt32)

```cangjie

public func getColor(resId: UInt32): UInt32
```

**Function:** Gets the color resource value corresponding to the resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | The resource ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The color resource value (in decimal) corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getColorByName(String)

```cangjie

public func getColorByName(resName: String): UInt32
```

**Function:** Gets the color resource value corresponding to the resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | The resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The color resource value (in decimal) corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource is found based on the resource name. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getConfiguration()

```cangjie

public func getConfiguration(): Configuration
```

**Function:** Gets the device configuration information and returns a [Configuration](#class-configuration) object.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Configuration](#class-configuration) | The device configuration information. |

**Exceptions:**

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. @returns { Configuration } the device configuration. | todo | todo |

### func getDeviceCapability()

```cangjie

public func getDeviceCapability(): DeviceCapability
```

**Function:** Gets the device capability and returns a [DeviceCapability](#class-devicecapability) object.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [DeviceCapability](#class-devicecapability) | The device capability. |

**Exceptions:**

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. @returns { DeviceCapability } the device capability. | todo | todo |

### func getLocales(Bool)

```cangjie

public func getLocales(includeSystem!: Bool = false): Array<String>
```

**Function:** Gets the language list of the application.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| includeSystem | Bool | No | false | **Named parameter.** Whether to include system resources. The default value is false. <br> false: Indicates that only the language list of application resources is obtained. <br> true: Indicates that the language list of both system and application resources is obtained. <br> When the system resource manager obtains the language list, the includeSystem value is invalid, and the system resource language list is returned. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns the obtained language list. The strings in the list are composed of language, script (optional), and region (optional), connected in order by hyphens "-". |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getMediaBase64ByName(String, ?ScreenDensity)

```cangjie

public func getMediaBase64ByName(resName: String, density!: ?ScreenDensity = None): String
```

**Function:** Gets the image resource corresponding to the specified screen density by resource name and returns the Base64 encoding of the image resource.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | The resource ID. |
| density | ?[ScreenDensity](#enum-screendensity) | No | None | **Named parameter.** The screen density required for resource acquisition. 0 or default indicates the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The Base64 encoding of the image resource corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource is found based on the resource name. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

- IllegalMemoryException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | Out of memory. | todo | todo |

### func getMediaByName(String, ?ScreenDensity)

```cangjie

public func getMediaByName(resName: String, density!: ?ScreenDensity = None): Array<UInt8>
```

**Function:** Gets the media file content corresponding to the specified screen density by resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | The resource name. |
| density | ?[ScreenDensity](#enum-screendensity) | No | None | The screen density required for resource acquisition. 0 indicates the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | The media resource corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource is found based on the resource name. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getMediaContent(UInt32, ?ScreenDensity)

```cangjie

public func getMediaContent(resId: UInt32, density!: ?ScreenDensity = None): Array<UInt8>
```

**Function:** Gets the media file content corresponding to the specified screen density by resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | The resource ID. |
| density | ?[ScreenDensity](#enum-screendensity) | No | None | The screen density required for resource acquisition. 0 indicates the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | The media resource corresponding to the resource ID. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getMediaContent(AppResource, ?ScreenDensity)

```cangjie

public func getMediaContent(resource: AppResource, density!: ?ScreenDensity = None): Array<UInt8>
```

**Function:** Gets the media file content corresponding to the specified screen density by resource object. This interface is used for cross-package access in multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | The resource object. |
| density | ?[ScreenDensity](#enum-screendensity) | No | None | The screen density required for resource acquisition. 0 indicates the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | The media resource corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |### func getMediaContentBase64(UInt32, ?ScreenDensity)

```cangjie

public func getMediaContentBase64(resId: UInt32, density!: ?ScreenDensity = None): String
```

**Function:** Retrieves the image resource corresponding to the specified resource ID and screen density, returning the Base64 encoding of the image resource.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | Resource ID. |
| density | ?[ScreenDensity](#enum-screendensity) | No | None | **Named parameter.** The screen density required for resource retrieval. 0 or omission indicates the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The [DrawableDescriptor](#class-drawabledescriptor) object of the image resource corresponding to the resource ID. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: 1. Incorrect parameter types; 2. Parameter verification failed. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

- IllegalMemoryException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | Out of memory. | todo | todo |

### func getMediaContentBase64(AppResource, ?ScreenDensity)

```cangjie

public func getMediaContentBase64(resource: AppResource, density!: ?ScreenDensity = None): String
```

**Function:** Retrieves the image resource corresponding to the specified resource object and screen density, returning the Base64 encoding of the image resource. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Resource object. |
| density | ?[ScreenDensity](#enum-screendensity) | No | None | **Named parameter.** The screen density required for resource retrieval. 0 or omission indicates the default screen density. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The Base64 encoding of the image resource corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: 1. Incorrect parameter types; 2. Parameter verification failed. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

- IllegalMemoryException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | Out of memory. | todo | todo |

### func getNumber(UInt32)

```cangjie

public func getNumber(resId: UInt32): NumberValueType
```

**Function:** Retrieves the numeric resource corresponding to the specified resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | Resource ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| [NumberValueType](#enum-numbervaluetype) | The numeric resource corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getNumber(AppResource)

```cangjie

public func getNumber(resource: AppResource): NumberValueType
```

**Function:** Retrieves the numeric resource corresponding to the specified resource object. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Resource object. |

**Return Value:**

| Type | Description |
|:----|:----|
| [NumberValueType](#enum-numbervaluetype) | The numeric resource corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getNumberByName(String)

```cangjie

public func getNumberByName(resName: String): NumberValueType
```

**Function:** Retrieves the numeric resource corresponding to the specified resource name. If integer and float resources share the same `resName`, the integer resource value is prioritized.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | Resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| [NumberValueType](#enum-numbervaluetype) | The numeric resource corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource is found based on the resource name. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getPluralStringByName(String, Int64)

```cangjie

public func getPluralStringByName(resName: String, num: Int64): String
```

**Function:** Retrieves the plural string resource corresponding to the specified resource name and formats the string based on the given quantity.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | Resource name. |
| num | Int64 | Yes | - | Quantity value. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The plural string resource corresponding to the specified resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource is found based on the resource name. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

- IllegalMemoryException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | Out of memory. | todo | todo |

### func getPluralStringValue(UInt32, Int64)

```cangjie

public func getPluralStringValue(resId: UInt32, num: Int64): String
```

**Function:** Retrieves the plural string resource corresponding to the specified resource ID and formats the string based on the given quantity.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | Resource ID. |
| num | Int64 | Yes | - | Quantity value. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The plural string resource corresponding to the specified resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

- IllegalMemoryException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | Out of memory. | todo | todo |

### func getPluralStringValue(AppResource, Int64)

```cangjie

public func getPluralStringValue(resource: AppResource, num: Int64): String
```

**Function:** Retrieves the plural string resource corresponding to the specified resource object and formats the string based on the given quantity. This interface is used for cross-package access within multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Resource object. |
| num | Int64 | Yes | - | Quantity value. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The plural string resource corresponding to the specified resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

- IllegalMemoryException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | Out of memory. | todo | todo |### func getRawFd(String)

```cangjie

public func getRawFd(path: String): RawFileDescriptor
```

**Function:** Gets the descriptor of the corresponding rawfile under the resources/rawfile directory.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Path of the rawfile. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RawFileDescriptor](#class-rawfiledescriptor) | Descriptor of the rawfile. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001005 | Invalid relative path. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getRawFileContent(String)

```cangjie

public func getRawFileContent(path: String): Array<UInt8>
```

**Function:** Gets the content of the corresponding rawfile under the resources/rawfile directory and returns a byte array.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Path of the rawfile. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | Content of the rawfile. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001005 | Invalid relative path. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getRawFileList(String)

```cangjie

public func getRawFileList(path: String): Array<String>
```

**Function:** Gets the list of folders and files under the resources/rawfile directory and returns a string array of the file list.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Path of the rawfile folder. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | List under the rawfile folder (including subfolders and files). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001005 | Invalid relative path. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getString(UInt32)

```cangjie

public func getString(resId: UInt32): String
```

**Function:** Gets the string resource corresponding to the resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | Resource ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | String resource corresponding to the resource ID. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

- IllegalMemoryException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | Out of memory. | todo | todo |

### func getString(UInt32, Array\<ArgsValueType>)

```cangjie

public func getString(resId: UInt32, args: Array<ArgsValueType>): String
```

**Function:** Gets the string resource corresponding to the resource ID and formats it based on the args parameter.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | Resource object. |
| args | Array\<[ArgsValueType](#enum-argsvaluetype)> | Yes | - | Parameters for formatting the string resource. <br>Supported parameter types: <br /> %d, %f, %s, %%. <br>Note: %% is an escape character, escaping %. <br>Example: %%d is formatted as the string %d. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Formatted string corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |
  | 9001007 | Failed to format the resource obtained based on the resource ID. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getString(AppResource)

```cangjie

public func getString(resource: AppResource): String
```

**Function:** Gets the string resource corresponding to the resource object. This API is used for cross-package access in multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Resource object. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | String resource corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getString(AppResource, Array\<ArgsValueType>)

```cangjie

public func getString(resource: AppResource, args: Array<ArgsValueType>): String
```

**Function:** Gets the string resource corresponding to the resource object and formats it based on the args parameter.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Resource object. |
| args | Array\<[ArgsValueType](#enum-argsvaluetype)> | Yes | - | Parameters for formatting the string resource. <br>Supported parameter types: <br /> %d, %f, %s, %%. <br>Note: %% is an escape character, escaping %. <br>Example: %%d is formatted as the string %d. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Formatted string corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |
  | 9001007 | Failed to format the resource obtained based on the resource ID. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getStringArrayByName(String)

```cangjie

public func getStringArrayByName(resName: String): Array<String>
```

**Function:** Gets the string array resource corresponding to the resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | Resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | String array corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource is found based on the resource name. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getStringArrayValue(UInt32)

```cangjie

public func getStringArrayValue(resId: UInt32): Array<String>
```

**Function:** Gets the string array resource corresponding to the resource ID.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resId | UInt32 | Yes | - | Resource ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | String array corresponding to the resource ID. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getStringArrayValue(AppResource)

```cangjie

public func getStringArrayValue(resource: AppResource): Array<String>
```

**Function:** Gets the string array resource corresponding to the resource object. This API is used for cross-package access in multi-project applications.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resource | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Resource object. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | String array corresponding to the resource object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001001 | Invalid resource ID. |
  | 9001002 | No matching resource is found based on the resource ID. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getStringByName(String)

```cangjie

public func getStringByName(resName: String): String
```

**Function:** Gets the string resource corresponding to the resource name.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | Resource name. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | String resource corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource is found based on the resource name. |
  | 9001006 | The resource is referenced cyclically. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func getStringByName(String, Array\<ArgsValueType>)

```cangjie

public func getStringByName(resName: String, args: Array<ArgsValueType>): String
```

**Function:** Gets the string resource corresponding to the resource name and formats it based on the args parameter.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| resName | String | Yes | - | Resource name. |
| args | Array\<[ArgsValueType](#enum-argsvaluetype)> | Yes | - | Parameters for formatting the string resource. <br>Supported parameter types: <br /> %d, %f, %s, %%. <br>Note: %% is an escape character, escaping %. <br>Example: %%d is formatted as the string %d. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Formatted string corresponding to the resource name. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Resource Management Error Codes](../../errorcodes/cj-errorcode-resource-manager.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the input parameter is invalid. Possible causes: Incorrect parameter types. |
  | 9001003 | Invalid resource name. |
  | 9001004 | No matching resource is found based on the resource name. |
  | 9001006 | The resource is referenced cyclically. |
  | 9001008 | Failed to format the resource obtained based on the resource name. |

- IllegalStateException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | If the instance ID is invalid. | todo | todo |

### func removeResource(String)

```cangjie

public func removeResource(path: String): Unit
```

**Function:** Removes the specified resource path during runtime and restores the resources before being overwritten.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---## enum ArgsValueType

```cangjie
public enum ArgsValueType {
    | Int32Value(Int32)
    | Float32Value(Float32)
    | StringValue(String)
    | ...
}
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### Float32Value(Float32)

```cangjie
Float32Value(Float32)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### Int32Value(Int32)

```cangjie
Int32Value(Int32)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### StringValue(String)

```cangjie
StringValue(String)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

## enum ColorMode

```cangjie
public enum ColorMode {
    | Dark
    | Light
    | ...
}
```

**Function:** Represents the current device color mode.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### Dark

```cangjie
Dark
```

**Function:** Dark mode.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### Light

```cangjie
Light
```

**Function:** Light mode.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

## enum DeviceType

```cangjie
public enum DeviceType {
    | DeviceTypePhone
    | DeviceTypeTablet
    | DeviceTypeCar
    | DeviceTypePC
    | DeviceTypeTV
    | DeviceTypeWearable
    | DeviceType2In1
    | ...
}
```

**Function:** Represents the current device type.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DeviceType2In1

```cangjie
DeviceType2In1
```

**Function:** 2-in-1 device.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DeviceTypeCar

```cangjie
DeviceTypeCar
```

**Function:** Car.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DeviceTypePC

```cangjie
DeviceTypePC
```

**Function:** PC.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DeviceTypePhone

```cangjie
DeviceTypePhone
```

**Function:** Phone.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DeviceTypeTV

```cangjie
DeviceTypeTV
```

**Function:** TV.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DeviceTypeTablet

```cangjie
DeviceTypeTablet
```

**Function:** Tablet.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DeviceTypeWearable

```cangjie
DeviceTypeWearable
```

**Function:** Wearable device.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

## enum Direction

```cangjie
public enum Direction {
    | DirectionVertical
    | DirectionHorizontal
    | ...
}
```

**Function:** Represents the device screen orientation.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DirectionHorizontal

```cangjie
DirectionHorizontal
```

**Function:** Landscape orientation.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### DirectionVertical

```cangjie
DirectionVertical
```

**Function:** Portrait orientation.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

## enum NumberValueType

```cangjie
public enum NumberValueType {
    | Int32Value(Int32)
    | Float32Value(Float32)
    | ...
}
```

**Function:** Represents the numeric type obtained from resources.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### Float32Value(Float32)

```cangjie
Float32Value(Float32)
```

**Function:** Number type storing Float32 values.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### Int32Value(Int32)

```cangjie
Int32Value(Int32)
```

**Function:** Number type storing Int32 values.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

## enum ScreenDensity

```cangjie
public enum ScreenDensity {
    | ScreenSDPI
    | ScreenMDPI
    | ScreenLDPI
    | ScreenXLDPI
    | ScreenXXLDPI
    | ScreenXXXLDPI
    | ...
}
```

**Function:** Represents the current device screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### ScreenLDPI

```cangjie
ScreenLDPI
```

**Function:** Large-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### ScreenMDPI

```cangjie
ScreenMDPI
```

**Function:** Medium-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### ScreenSDPI

```cangjie
ScreenSDPI
```

**Function:** Small-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### ScreenXLDPI

```cangjie
ScreenXLDPI
```

**Function:** Extra-large-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### ScreenXXLDPI

```cangjie
ScreenXXLDPI
```

**Function:** Extra-extra-large-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21

### ScreenXXXLDPI

```cangjie
ScreenXXXLDPI
```

**Function:** Ultra-extra-large-scale screen density.

**System Capability:** SystemCapability.Global.ResourceManager

**Since:** 21