# ohos.security.huks

Provides applications with keystore capabilities, including key management and cryptographic operations.

Keys managed by HUKS can be either imported by applications or generated through HUKS interfaces.

## Import Module

```cangjie
import kit.UniversalKeystoreKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code has a "// index.cj" comment in its first line, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## func abortSession(HuksHandleId, HuksOptions)

```cangjie

public func abortSession(handle: HuksHandleId, options: HuksOptions): Unit
```

**Description:** Interface for aborting a key operation session.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| handle | [HuksHandleId](#class-hukshandleid) | Yes | - | The handle for the abortSession operation. |
| options | [HuksOptions](#class-huksoptions) | Yes | - | Parameter set for the abortSession operation. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid |
  | 801 | api is not supported |
  | 12000004 | operating file failed |
  | 12000005 | IPC communication failed |
  | 12000006 | error occurred in crypto engine |
  | 12000012 | external error |
  | 12000014 | memory is insufficient |

## func anonAttestKeyItem(String, HuksOptions)

```cangjie

public func anonAttestKeyItem(keyAlias: String, options: HuksOptions): Array<String>
```

**Description:** Obtains an anonymized key certificate. This operation requires network connectivity and may take a long time.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| keyAlias | String | Yes | - | Key alias, storing the alias of the key for which the certificate is to be obtained. |
| options | [HuksOptions](#class-huksoptions) | Yes | - | Specifies the required parameters and data for obtaining the certificate. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns the key certificate chain. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | check permission failed |
  | 401 | argument is invalid |
  | 801 | api is not supported |
  | 12000001 | algorithm mode is not supported |
  | 12000002 | algorithm param is missing |
  | 12000003 | algorithm param is invalid |
  | 12000004 | operating file failed |
  | 12000005 | IPC communication failed |
  | 12000006 | error occurred in crypto engine |
  | 12000011 | queried entity does not exist |
  | 12000012 | external error |
  | 12000014 | memory is insufficient |

## func attestKeyItem(String, HuksOptions)

```cangjie

public func attestKeyItem(keyAlias: String, options: HuksOptions): Array<String>
```

**Description:** Obtains a key certificate.

**Required Permission:** ohos.permission.ATTEST_KEY

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| keyAlias | String | Yes | - | Key alias, storing the alias of the key for which the certificate is to be obtained. |
| options | [HuksOptions](#class-huksoptions) | Yes | - | Specifies the required parameters and data for obtaining the certificate. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns the key certificate chain. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | check permission failed |
  | 401 | argument is invalid |
  | 801 | api is not supported |
  | 12000001 | algorithm mode is not supported |
  | 12000002 | algorithm param is missing |
  | 12000003 | algorithm param is invalid |
  | 12000004 | operating file failed |
  | 12000005 | IPC communication failed |
  | 12000006 | error occurred in crypto engine |
  | 12000011 | queried entity does not exist |
  | 12000012 | external error |
  | 12000014 | memory is insufficient |
@permission ohos.permission.ATTEST_KEY |

## func deleteKeyItem(String, HuksOptions)

```cangjie

public func deleteKeyItem(keyAlias: String, options: HuksOptions): Unit
```

**Description:** Deletes a key.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| keyAlias | String | Yes | - | Key alias, which should be the same as the alias used when generating the key. |
| options | [HuksOptions](#class-huksoptions) | Yes | - | Specifies the key attribute Tag for deletion, such as the scope of deletion (full/single). For single deletion, the Tag field can be left empty. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid |
  | 801 | api is not supported |
  | 12000004 | operating file failed |
  | 12000005 | IPC communication failed |
  | 12000011 | queried entity does not exist |
  | 12000012 | external error |
  | 12000014 | memory is insufficient |

## func exportKeyItem(String, HuksOptions)

```cangjie

public func exportKeyItem(keyAlias: String, _: HuksOptions): Bytes
```

**Description:** Exports a key.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| keyAlias | String | Yes | - | Key alias, which should be the same as the alias used when generating the key. |
| _ | [HuksOptions](#class-huksoptions) | Yes | - | Empty object (pass empty here). |

**Return Value:**

| Type | Description |
|:----|:----|
| [Bytes](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#Unsigned-Integer-Types) | Returns the public key exported from the key. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid |
  | 801 | api is not supported |
  | 12000001 | algorithm mode is not supported |
  | 12000002 | algorithm param is missing |
  | 12000003 | algorithm param is invalid |
  | 12000004 | operating file failed |
  | 12000005 | IPC communication failed |
  | 12000006 | error occurred in crypto engine |
  | 12000011 | queried entity does not exist |
  | 12000012 | external error |
  | 12000014 | memory is insufficient |

## func finishSession(HuksHandleId, HuksOptions, Bytes)

```cangjie

public func finishSession(handle: HuksHandleId, options: HuksOptions, token!: Bytes): Option<Bytes>
```

**Description:** Interface for finishing a key operation session. [security_huks.initSession](#func-initsessionstring-huksoptions), [security_huks.updateSession](#func-updatesessionhukshandle-huksoptions-arrayuint8), and [security_huks.finishSession](#func-finishsessionhukshandle-huksoptions-arrayuint8) are three-phase interfaces that must be used together.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| handle | [HuksHandleId](#class-hukshandleid) | Yes | - | The handle for the finishSession operation. |
| options | [HuksOptions](#class-huksoptions) | Yes | - | Parameter set for the finishSession operation. |
| token | [Bytes](#class-huksoptions) | Yes | - | Represents the AuthToken value from the USER IAM service. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Option](please add link)\<[Bytes](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#Unsigned-Integer-Types)> | Represents the AuthToken value from the USER IAM service. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes:
1. Mandatory parameters are left unspecified.
2. Incorrect parameter types.
3. Parameter verification failed. |
  | 801 | api is not supported |
  | 12000001 | algorithm mode is not supported |
  | 12000002 | algorithm param is missing |
  | 12000003 | algorithm param is invalid |
  | 12000004 | operating file failed |
  | 12000005 | IPC communication failed |
  | 12000006 | error occurred in crypto engine |
  | 12000007 | this credential is already invalidated permanently |
  | 12000008 | verify auth token failed |
  | 12000009 | auth token is already timeout |
  | 12000011 | queried entity does not exist |
  | 12000012 | Device environment or input parameter abnormal |
  | 12000014 | memory is insufficient |

## func generateKeyItem(String, HuksOptions)

```cangjie

public func generateKeyItem(keyAlias: String, options: HuksOptions): Unit
```

**Description:** Generates a key.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| keyAlias | String | Yes | - | Key alias. |
| options | [HuksOptions](#class-huksoptions) | Yes | - | Stores the required Tags for key generation. The algorithm, key purpose, and key length are mandatory parameters. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid |
  | 801 | api is not supported |
  | 12000001 | algorithm mode is not supported |
  | 12000002 | algorithm param is missing |
  | 12000003 | algorithm param is invalid |
  | 12000004 | operating file failed |
  | 12000005 | IPC communication failed |
  | 12000006 | error occurred in crypto engine |
  | 12000012 | external error |
  | 12000013 | queried credential does not exist |
  | 12000014 | memory is insufficient |
  | 12000015 | call service failed |

## func getKeyItemProperties(String, HuksOptions)

```cangjie

public func getKeyItemProperties(keyAlias: String, _: HuksOptions): Array<HuksParam>
```

**Description:** Obtains key properties.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| keyAlias | String | Yes | - | Key alias. |
| _ | [HuksOptions](#class-huksoptions) | Yes | - | Empty object (pass empty here). |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[HuksParam](#class-huksparam)> | Returns the key properties. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid |
  | 801 | api is not supported |
  | 12000001 | algorithm mode is not supported |
  | 12000002 | algorithm param is missing |
  | 12000003 | algorithm param is invalid |
  | 12000004 | operating file failed |
  | 12000005 | IPC communication failed |
  | 12000006 | error occurred in crypto engine |
  | 12000011 | queried entity does not exist |
  | 12000012 | external error |
  | 12000014 | memory is insufficient |## func getSdkVersion()

```cangjie

public func getSdkVersion(): String
```

**Function:** Gets the current system SDK version.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the SDK version.|

## func importKeyItem(String, HuksOptions)

```cangjie

public func importKeyItem(keyAlias: String, options: HuksOptions): Unit
```

**Function:** Imports a plaintext key.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|keyAlias|String|Yes|-|Key alias.|
|options|[HuksOptions](#class-huksoptions)|Yes|-|Tags required for import and the key to be imported. The algorithm, key purpose, and key length are mandatory parameters.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid
 |
  | 801 | api is not supported
 |
  | 12000001 | algorithm mode is not supported
 |
  | 12000002 | algorithm param is missing
 |
  | 12000003 | algorithm param is invalid
 |
  | 12000004 | operating file failed
 |
  | 12000005 | IPC communication failed
 |
  | 12000006 | error occured in crypto engine
 |
  | 12000011 | queried entity does not exist
 |
  | 12000012 | external error
 |
  | 12000013 | queried credential does not exist
 |
  | 12000014 | memory is insufficient
 |
  | 12000015 | call service failed
 |

## func importWrappedKeyItem(String, String, HuksOptions)

```cangjie

public func importWrappedKeyItem(keyAlias: String, wrappingKeyAlias: String, options: HuksOptions): Unit
```

**Function:** Imports an encrypted key.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|keyAlias|String|Yes|-|Key alias for storing the key to be imported.|
|wrappingKeyAlias|String|Yes|-|Key alias corresponding to the key used to decrypt the encrypted key data.|
|options|[HuksOptions](#class-huksoptions)|Yes|-|Tags required for import and the encrypted key data to be imported. The algorithm, key purpose, and key length are mandatory parameters.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid
 |
  | 801 | api is not supported
 |
  | 12000001 | algorithm mode is not supported
 |
  | 12000002 | algorithm param is missing
 |
  | 12000003 | algorithm param is invalid
 |
  | 12000004 | operating file failed
 |
  | 12000005 | IPC communication failed
 |
  | 12000006 | error occured in crypto engine
 |
  | 12000011 | queried entity does not exist
 |
  | 12000012 | external error
 |
  | 12000013 | queried credential does not exist
 |
  | 12000014 | memory is insufficient
 |
  | 12000015 | call service failed
 |

## func initSession(String, HuksOptions)

```cangjie

public func initSession(keyAlias: String, options: HuksOptions): HuksSessionHandle
```

**Function:** Initializes a key operation session. [security_huks.initSession](#func-initsessionstring-huksoptions), [security_huks.updateSession](#func-updatesessionhukshandle-huksoptions), and [security_huks.finishSession](#func-finishsessionhukshandle-huksoptions) are three-phase APIs that must be used together.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|keyAlias|String|Yes|-|Alias of the key for the initSession operation.|
|options|[HuksOptions](#class-huksoptions)|Yes|-|Parameter set for the initSession operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[HuksSessionHandle](#class-hukssessionhandle)|Returns the Huks Handle of the key.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid
 |
  | 801 | api is not supported
 |
  | 12000001 | algorithm mode is not supported
 |
  | 12000002 | algorithm param is missing
 |
  | 12000003 | algorithm param is invalid
 |
  | 12000004 | operating file failed
 |
  | 12000005 | IPC communication failed
 |
  | 12000006 | error occured in crypto engine
 |
  | 12000010 | the number of sessions has reached limit
 |
  | 12000011 | queried entity does not exist
 |
  | 12000012 | external error
 |
  | 12000014 | memory is insufficient
 |

## func isKeyItemExist(String, HuksOptions)

```cangjie

public func isKeyItemExist(keyAlias: String, options: HuksOptions): Bool
```

**Function:** Checks whether a key exists.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|keyAlias|String|Yes|-|Alias of the key to be checked.|
|options|[HuksOptions](#class-huksoptions)|Yes|-|Specifies the key attribute tags for the query, such as the key scope (all/single). For a single query, the Tag field can be left empty.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Indicates whether the key exists.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | argument is invalid
 |
  | 801 | api is not supported
 |
  | 12000002 | algorithm param is missing
 |
  | 12000003 | algorithm param is invalid
 |
  | 12000004 | operating file failed
 |
  | 12000005 | IPC communication failed
 |
  | 12000006 | error occured in crypto engine
 |
  | 12000012 | external error
 |
  | 12000014 | memory is insufficient
 |

## func updateSession(HuksHandleId, HuksOptions, Bytes)

```cangjie

public func updateSession(handle: HuksHandleId, options: HuksOptions, token!: Bytes): Option<Bytes>
```

**Function:** Updates a key operation session. [security_huks.initSession](#func-initsessionstring-huksoptions), [security_huks.updateSession](#func-updatesessionhukshandle-huksoptions-arrayuint8), and [security_huks.finishSession](#func-finishsessionhukshandle-huksoptions-arrayuint8) are three-phase APIs that must be used together.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|handle|[HuksHandleId](#class-hukshandleid)|Yes|-|Handle for the updateSession operation.|
|options|[HuksOptions](#class-huksoptions)|Yes|-|Parameter set for the updateSession operation.|
|token|[Bytes](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#无符号整数类型)|Yes|-|Represents the AuthToken value of the USER IAM service.|

**Return Value:**

|Type|Description|
|:----|:----|
|[Bytes](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#无符号整数类型)|Outputs the key update result.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes:
1. Mandatory parameters are left unspecified.
2. Incorrect parameter types.
3. Parameter verification failed.
 |
  | 801 | api is not supported
 |
  | 12000001 | algorithm mode is not supported
 |
  | 12000002 | algorithm param is missing
 |
  | 12000003 | algorithm param is invalid
 |
  | 12000004 | operating file failed
 |
  | 12000005 | IPC communication failed
 |
  | 12000006 | error occurred in crypto engine
 |
  | 12000007 | this credential is already invalidated permanently
 |
  | 12000008 | verify auth token failed
 |
  | 12000009 | auth token is already timeout
 |
  | 12000011 | queried entity does not exist
 |
  | 12000012 | Device environment or input parameter abnormal
 |
  | 12000014 | memory is insufficient
 |

## class HuksAuthAccessType

```cangjie
public class HuksAuthAccessType {
    public static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD: HuksParamValue = HuksParamValue.Uint32Value(1 << 0)
    public static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL: HuksParamValue = HuksParamValue.Uint32Value(1 << 1)
}
```

**Function:** Represents the secure access control type.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD

```cangjie
public static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD: HuksParamValue = HuksParamValue.Uint32Value(1 << 0)
```

**Function:** Indicates that the secure access control type is that the key is always valid.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL

```cangjie
public static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL: HuksParamValue = HuksParamValue.Uint32Value(1 << 1)
```

**Function:** Indicates that the secure access control type is that the key becomes invalid after the password is cleared.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

## class HuksAuthStorageLevel

```cangjie
public class HuksAuthStorageLevel {
    public static const HUKS_AUTH_STORAGE_LEVEL_DE: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_AUTH_STORAGE_LEVEL_CE: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_AUTH_STORAGE_LEVEL_ECE: HuksParamValue = HuksParamValue.Uint32Value(2)
}
```

**Function:** Specifies the storage security level of a key when generating or importing the key.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AUTH_STORAGE_LEVEL_CE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_CE: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Function:** Indicates that the key is accessible only after the first unlock.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AUTH_STORAGE_LEVEL_DE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_DE: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Function:** Indicates that the key is accessible only after the device is powered on.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AUTH_STORAGE_LEVEL_ECE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_ECE: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Function:** Indicates that the key is accessible only when the device is unlocked.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21## class HuksChallengePosition

```cangjie
public class HuksChallengePosition {
    public static const HUKS_CHALLENGE_POS_0: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_CHALLENGE_POS_1: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_CHALLENGE_POS_2: HuksParamValue = HuksParamValue.Uint32Value(2)
    public static const HUKS_CHALLENGE_POS_3: HuksParamValue = HuksParamValue.Uint32Value(3)
}
```

**Description:** Indicates that when the challenge type is user-defined, the generated challenge has an effective length of only 8 consecutive bytes of data, and supports only 4 positions.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_POS_0

```cangjie
public static const HUKS_CHALLENGE_POS_0: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Description:** Indicates that bytes 0~7 are the valid challenge for the current key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_POS_1

```cangjie
public static const HUKS_CHALLENGE_POS_1: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates that bytes 8~15 are the valid challenge for the current key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_POS_2

```cangjie
public static const HUKS_CHALLENGE_POS_2: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates that bytes 16~23 are the valid challenge for the current key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_POS_3

```cangjie
public static const HUKS_CHALLENGE_POS_3: HuksParamValue = HuksParamValue.Uint32Value(3)
```

**Description:** Indicates that bytes 24~31 are the valid challenge for the current key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

## class HuksChallengeType

```cangjie
public class HuksChallengeType {
    public static const HUKS_CHALLENGE_TYPE_NORMAL: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_CHALLENGE_TYPE_CUSTOM: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_CHALLENGE_TYPE_NONE: HuksParamValue = HuksParamValue.Uint32Value(2)
}
```

**Description:** Indicates the type of challenge generated during key usage.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_TYPE_CUSTOM

```cangjie
public static const HUKS_CHALLENGE_TYPE_CUSTOM: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates a user-defined challenge type. Supports single authentication for multiple keys.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_TYPE_NONE

```cangjie
public static const HUKS_CHALLENGE_TYPE_NONE: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates a no-challenge type.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_TYPE_NORMAL

```cangjie
public static const HUKS_CHALLENGE_TYPE_NORMAL: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Description:** Indicates a normal challenge type, defaulting to 32 bytes.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

## class HuksCipherMode

```cangjie
public class HuksCipherMode {
    public static const HUKS_MODE_ECB: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_MODE_CBC: HuksParamValue = HuksParamValue.Uint32Value(2)
    public static const HUKS_MODE_CTR: HuksParamValue = HuksParamValue.Uint32Value(3)
    public static const HUKS_MODE_OFB: HuksParamValue = HuksParamValue.Uint32Value(4)
    public static const HUKS_MODE_CCM: HuksParamValue = HuksParamValue.Uint32Value(31)
    public static const HUKS_MODE_GCM: HuksParamValue = HuksParamValue.Uint32Value(32)
}
```

**Description:** Indicates encryption modes.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_MODE_CBC

```cangjie
public static const HUKS_MODE_CBC: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates using CBC encryption mode.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_MODE_CCM

```cangjie
public static const HUKS_MODE_CCM: HuksParamValue = HuksParamValue.Uint32Value(31)
```

**Description:** Indicates using CCM encryption mode.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_MODE_CTR

```cangjie
public static const HUKS_MODE_CTR: HuksParamValue = HuksParamValue.Uint32Value(3)
```

**Description:** Indicates using CTR encryption mode.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_MODE_ECB

```cangjie
public static const HUKS_MODE_ECB: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates using ECB encryption mode.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_MODE_GCM

```cangjie
public static const HUKS_MODE_GCM: HuksParamValue = HuksParamValue.Uint32Value(32)
```

**Description:** Indicates using GCM encryption mode.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_MODE_OFB

```cangjie
public static const HUKS_MODE_OFB: HuksParamValue = HuksParamValue.Uint32Value(4)
```

**Description:** Indicates using OFB encryption mode.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksHandleId

```cangjie
public class HuksHandleId {}
```

**Description:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

## class HuksImportKeyType

```cangjie
public class HuksImportKeyType {
    public static const HUKS_KEY_TYPE_PUBLIC_KEY: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_KEY_TYPE_PRIVATE_KEY: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_KEY_TYPE_KEY_PAIR: HuksParamValue = HuksParamValue.Uint32Value(2)
}
```

**Description:** Indicates the key type for importing keys. Default is importing public key. This field is not required when importing symmetric keys.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_TYPE_KEY_PAIR

```cangjie
public static const HUKS_KEY_TYPE_KEY_PAIR: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates importing a key pair (public-private key pair).

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_TYPE_PRIVATE_KEY

```cangjie
public static const HUKS_KEY_TYPE_PRIVATE_KEY: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates importing a private key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_TYPE_PUBLIC_KEY

```cangjie
public static const HUKS_KEY_TYPE_PUBLIC_KEY: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Description:** Indicates importing a public key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeyAlg

```cangjie
public class HuksKeyAlg {
    public static const HUKS_ALG_RSA: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_ALG_ECC: HuksParamValue = HuksParamValue.Uint32Value(2)
    public static const HUKS_ALG_DSA: HuksParamValue = HuksParamValue.Uint32Value(3)
    public static const HUKS_ALG_AES: HuksParamValue = HuksParamValue.Uint32Value(20)
    public static const HUKS_ALG_HMAC: HuksParamValue = HuksParamValue.Uint32Value(50)
    public static const HUKS_ALG_HKDF: HuksParamValue = HuksParamValue.Uint32Value(51)
    public static const HUKS_ALG_PBKDF2: HuksParamValue = HuksParamValue.Uint32Value(52)
    public static const HUKS_ALG_ECDH: HuksParamValue = HuksParamValue.Uint32Value(100)
    public static const HUKS_ALG_X25519: HuksParamValue = HuksParamValue.Uint32Value(101)
    public static const HUKS_ALG_ED25519: HuksParamValue = HuksParamValue.Uint32Value(102)
    public static const HUKS_ALG_DH: HuksParamValue = HuksParamValue.Uint32Value(103)
    public static const HUKS_ALG_SM2: HuksParamValue = HuksParamValue.Uint32Value(150)
    public static const HUKS_ALG_SM3: HuksParamValue = HuksParamValue.Uint32Value(151)
    public static const HUKS_ALG_SM4: HuksParamValue = HuksParamValue.Uint32Value(152)
}
```

**Description:** Indicates the algorithm used by the key.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_AES

```cangjie
public static const HUKS_ALG_AES: HuksParamValue = HuksParamValue.Uint32Value(20)
```

**Description:** Indicates using AES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_DH

```cangjie
public static const HUKS_ALG_DH: HuksParamValue = HuksParamValue.Uint32Value(103)
```

**Description:** Indicates using DH algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_DSA

```cangjie
public static const HUKS_ALG_DSA: HuksParamValue = HuksParamValue.Uint32Value(3)
```

**Description:** Indicates using DSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_ECC

```cangjie
public static const HUKS_ALG_ECC: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates using ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_ECDH

```cangjie
public static const HUKS_ALG_ECDH: HuksParamValue = HuksParamValue.Uint32Value(100)
```

**Description:** Indicates using ECDH algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_ED25519

```cangjie
public static const HUKS_ALG_ED25519: HuksParamValue = HuksParamValue.Uint32Value(102)
```

**Description:** Indicates using ED25519 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_HKDF

```cangjie
public static const HUKS_ALG_HKDF: HuksParamValue = HuksParamValue.Uint32Value(51)
```

**Description:** Indicates using HKDF algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_HMAC

```cangjie
public static const HUKS_ALG_HMAC: HuksParamValue = HuksParamValue.Uint32Value(50)
```

**Description:** Indicates using HMAC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_PBKDF2

```cangjie
public static const HUKS_ALG_PBKDF2: HuksParamValue = HuksParamValue.Uint32Value(52)
```

**Description:** Indicates using PBKDF2 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_RSA

```cangjie
public static const HUKS_ALG_RSA: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates using RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_SM2

```cangjie
public static const HUKS_ALG_SM2: HuksParamValue = HuksParamValue.Uint32Value(150)
```

**Description:** Indicates using SM2 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_SM3

```cangjie
public static const HUKS_ALG_SM3: HuksParamValue = HuksParamValue.Uint32Value(151)
```

**Description:** Indicates using SM3 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_SM4

```cangjie
public static const HUKS_ALG_SM4: HuksParamValue = HuksParamValue.Uint32Value(152)
```

**Description:** Indicates using SM4 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ALG_X25519

```cangjie
public static const HUKS_ALG_X25519: HuksParamValue = HuksParamValue.Uint32Value(101)
```

**Description:** Indicates using X25519 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21```markdown
## class HuksKeyDigest

```cangjie
public class HuksKeyDigest {
    public static const HUKS_DIGEST_NONE: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_DIGEST_MD5: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_DIGEST_SM3: HuksParamValue = HuksParamValue.Uint32Value(2)
    public static const HUKS_DIGEST_SHA1: HuksParamValue = HuksParamValue.Uint32Value(10)
    public static const HUKS_DIGEST_SHA224: HuksParamValue = HuksParamValue.Uint32Value(11)
    public static const HUKS_DIGEST_SHA256: HuksParamValue = HuksParamValue.Uint32Value(12)
    public static const HUKS_DIGEST_SHA384: HuksParamValue = HuksParamValue.Uint32Value(13)
    public static const HUKS_DIGEST_SHA512: HuksParamValue = HuksParamValue.Uint32Value(14)
}
```

**Description:** Represents digest algorithms.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_MD5

```cangjie
public static const HUKS_DIGEST_MD5: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates MD5 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_NONE

```cangjie
public static const HUKS_DIGEST_NONE: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Description:** Indicates no digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA1

```cangjie
public static const HUKS_DIGEST_SHA1: HuksParamValue = HuksParamValue.Uint32Value(10)
```

**Description:** Indicates SHA1 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA224

```cangjie
public static const HUKS_DIGEST_SHA224: HuksParamValue = HuksParamValue.Uint32Value(11)
```

**Description:** Indicates SHA224 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA256

```cangjie
public static const HUKS_DIGEST_SHA256: HuksParamValue = HuksParamValue.Uint32Value(12)
```

**Description:** Indicates SHA256 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA384

```cangjie
public static const HUKS_DIGEST_SHA384: HuksParamValue = HuksParamValue.Uint32Value(13)
```

**Description:** Indicates SHA384 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA512

```cangjie
public static const HUKS_DIGEST_SHA512: HuksParamValue = HuksParamValue.Uint32Value(14)
```

**Description:** Indicates SHA512 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SM3

```cangjie
public static const HUKS_DIGEST_SM3: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates SM3 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeyFlag

```cangjie
public class HuksKeyFlag {
    public static const HUKS_KEY_FLAG_IMPORT_KEY: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_KEY_FLAG_GENERATE_KEY: HuksParamValue = HuksParamValue.Uint32Value(2)
    public static const HUKS_KEY_FLAG_AGREE_KEY: HuksParamValue = HuksParamValue.Uint32Value(3)
    public static const HUKS_KEY_FLAG_DERIVE_KEY: HuksParamValue = HuksParamValue.Uint32Value(4)
}
```

**Description:** Represents key generation methods.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_FLAG_AGREE_KEY

```cangjie
public static const HUKS_KEY_FLAG_AGREE_KEY: HuksParamValue = HuksParamValue.Uint32Value(3)
```

**Description:** Indicates keys generated through key agreement interfaces.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_FLAG_DERIVE_KEY

```cangjie
public static const HUKS_KEY_FLAG_DERIVE_KEY: HuksParamValue = HuksParamValue.Uint32Value(4)
```

**Description:** Indicates keys generated through key derivation interfaces.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_FLAG_GENERATE_KEY

```cangjie
public static const HUKS_KEY_FLAG_GENERATE_KEY: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates keys generated through key generation interfaces.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_FLAG_IMPORT_KEY

```cangjie
public static const HUKS_KEY_FLAG_IMPORT_KEY: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates keys imported through public key import interfaces.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeyGenerateType

```cangjie
public class HuksKeyGenerateType {
    public static const HUKS_KEY_GENERATE_TYPE_DEFAULT: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_KEY_GENERATE_TYPE_DERIVE: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_KEY_GENERATE_TYPE_AGREE: HuksParamValue = HuksParamValue.Uint32Value(2)
}
```

**Description:** Represents key generation types.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_GENERATE_TYPE_AGREE

```cangjie
public static const HUKS_KEY_GENERATE_TYPE_AGREE: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Keys generated through agreement.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_GENERATE_TYPE_DEFAULT

```cangjie
public static const HUKS_KEY_GENERATE_TYPE_DEFAULT: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Description:** Default generated keys.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_GENERATE_TYPE_DERIVE

```cangjie
public static const HUKS_KEY_GENERATE_TYPE_DERIVE: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Keys generated through derivation.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeyPadding

```cangjie
public class HuksKeyPadding {
    public static const HUKS_PADDING_NONE: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_PADDING_OAEP: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_PADDING_PSS: HuksParamValue = HuksParamValue.Uint32Value(2)
    public static const HUKS_PADDING_PKCS1_V1_5: HuksParamValue = HuksParamValue.Uint32Value(3)
    public static const HUKS_PADDING_PKCS5: HuksParamValue = HuksParamValue.Uint32Value(4)
    public static const HUKS_PADDING_PKCS7: HuksParamValue = HuksParamValue.Uint32Value(5)
}
```

**Description:** Represents padding algorithms.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_PADDING_NONE

```cangjie
public static const HUKS_PADDING_NONE: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Description:** Indicates no padding algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_PADDING_OAEP

```cangjie
public static const HUKS_PADDING_OAEP: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates OAEP padding algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_PADDING_PKCS1_V1_5

```cangjie
public static const HUKS_PADDING_PKCS1_V1_5: HuksParamValue = HuksParamValue.Uint32Value(3)
```

**Description:** Indicates PKCS1_V1_5 padding algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_PADDING_PKCS5

```cangjie
public static const HUKS_PADDING_PKCS5: HuksParamValue = HuksParamValue.Uint32Value(4)
```

**Description:** Indicates PKCS5 padding algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_PADDING_PKCS7

```cangjie
public static const HUKS_PADDING_PKCS7: HuksParamValue = HuksParamValue.Uint32Value(5)
```

**Description:** Indicates PKCS7 padding algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_PADDING_PSS

```cangjie
public static const HUKS_PADDING_PSS: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates PSS padding algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeyPurpose

```cangjie
public class HuksKeyPurpose {
    public static const HUKS_KEY_PURPOSE_ENCRYPT: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_KEY_PURPOSE_DECRYPT: HuksParamValue = HuksParamValue.Uint32Value(2)
    public static const HUKS_KEY_PURPOSE_SIGN: HuksParamValue = HuksParamValue.Uint32Value(4)
    public static const HUKS_KEY_PURPOSE_VERIFY: HuksParamValue = HuksParamValue.Uint32Value(8)
    public static const HUKS_KEY_PURPOSE_DERIVE: HuksParamValue = HuksParamValue.Uint32Value(16)
    public static const HUKS_KEY_PURPOSE_WRAP: HuksParamValue = HuksParamValue.Uint32Value(32)
    public static const HUKS_KEY_PURPOSE_UNWRAP: HuksParamValue = HuksParamValue.Uint32Value(64)
    public static const HUKS_KEY_PURPOSE_MAC: HuksParamValue = HuksParamValue.Uint32Value(128)
    public static const HUKS_KEY_PURPOSE_AGREE: HuksParamValue = HuksParamValue.Uint32Value(256)
}
```

**Description:** Represents key purposes.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_AGREE

```cangjie
public static const HUKS_KEY_PURPOSE_AGREE: HuksParamValue = HuksParamValue.Uint32Value(256)
```

**Description:** Indicates keys used for key agreement.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_DECRYPT

```cangjie
public static const HUKS_KEY_PURPOSE_DECRYPT: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** Indicates keys used for decrypting ciphertext.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_DERIVE

```cangjie
public static const HUKS_KEY_PURPOSE_DERIVE: HuksParamValue = HuksParamValue.Uint32Value(16)
```

**Description:** Indicates keys used for key derivation.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_ENCRYPT

```cangjie
public static const HUKS_KEY_PURPOSE_ENCRYPT: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates keys used for encrypting plaintext.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_MAC

```cangjie
public static const HUKS_KEY_PURPOSE_MAC: HuksParamValue = HuksParamValue.Uint32Value(128)
```

**Description:** Indicates keys used for generating MAC message authentication codes.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_SIGN

```cangjie
public static const HUKS_KEY_PURPOSE_SIGN: HuksParamValue = HuksParamValue.Uint32Value(4)
```

**Description:** Indicates keys used for encrypted import.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_UNWRAP

```cangjie
public static const HUKS_KEY_PURPOSE_UNWRAP: HuksParamValue = HuksParamValue.Uint32Value(64)
```

**Description:** Indicates keys used for encrypted import.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_VERIFY

```cangjie
public static const HUKS_KEY_PURPOSE_VERIFY: HuksParamValue = HuksParamValue.Uint32Value(8)
```

**Description:** Indicates keys used for verifying signed data.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_WRAP

```cangjie
public static const HUKS_KEY_PURPOSE_WRAP: HuksParamValue = HuksParamValue.Uint32Value(32)
```

**Description:** Indicates keys used for encrypted export.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21
```## class HuksKeySize

```cangjie
public class HuksKeySize {
    public static const HUKS_RSA_KEY_SIZE_512: HuksParamValue = HuksParamValue.Uint32Value(512)
    public static const HUKS_RSA_KEY_SIZE_768: HuksParamValue = HuksParamValue.Uint32Value(768)
    public static const HUKS_RSA_KEY_SIZE_1024: HuksParamValue = HuksParamValue.Uint32Value(1024)
    public static const HUKS_RSA_KEY_SIZE_2048: HuksParamValue = HuksParamValue.Uint32Value(2048)
    public static const HUKS_RSA_KEY_SIZE_3072: HuksParamValue = HuksParamValue.Uint32Value(3072)
    public static const HUKS_RSA_KEY_SIZE_4096: HuksParamValue = HuksParamValue.Uint32Value(4096)
    public static const HUKS_ECC_KEY_SIZE_224: HuksParamValue = HuksParamValue.Uint32Value(224)
    public static const HUKS_ECC_KEY_SIZE_256: HuksParamValue = HuksParamValue.Uint32Value(256)
    public static const HUKS_ECC_KEY_SIZE_384: HuksParamValue = HuksParamValue.Uint32Value(384)
    public static const HUKS_ECC_KEY_SIZE_521: HuksParamValue = HuksParamValue.Uint32Value(521)
    public static const HUKS_AES_KEY_SIZE_128: HuksParamValue = HuksParamValue.Uint32Value(128)
    public static const HUKS_AES_KEY_SIZE_192: HuksParamValue = HuksParamValue.Uint32Value(192)
    public static const HUKS_AES_KEY_SIZE_256: HuksParamValue = HuksParamValue.Uint32Value(256)
    public static const HUKS_AES_KEY_SIZE_512: HuksParamValue = HuksParamValue.Uint32Value(512)
    public static const HUKS_CURVE25519_KEY_SIZE_256: HuksParamValue = HuksParamValue.Uint32Value(256)
    public static const HUKS_DH_KEY_SIZE_2048: HuksParamValue = HuksParamValue.Uint32Value(2048)
    public static const HUKS_DH_KEY_SIZE_3072: HuksParamValue = HuksParamValue.Uint32Value(3072)
    public static const HUKS_DH_KEY_SIZE_4096: HuksParamValue = HuksParamValue.Uint32Value(4096)
    public static const HUKS_SM2_KEY_SIZE_256: HuksParamValue = HuksParamValue.Uint32Value(256)
    public static const HUKS_SM4_KEY_SIZE_128: HuksParamValue = HuksParamValue.Uint32Value(128)
}
```

**Function:** Represents key length.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AES_KEY_SIZE_128

```cangjie
public static const HUKS_AES_KEY_SIZE_128: HuksParamValue = HuksParamValue.Uint32Value(128)
```

**Function:** Indicates a 128-bit key length for the 3DES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AES_KEY_SIZE_192

```cangjie
public static const HUKS_AES_KEY_SIZE_192: HuksParamValue = HuksParamValue.Uint32Value(192)
```

**Function:** Indicates a 192-bit key length for the 3DES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AES_KEY_SIZE_256

```cangjie
public static const HUKS_AES_KEY_SIZE_256: HuksParamValue = HuksParamValue.Uint32Value(256)
```

**Function:** Indicates a 256-bit key length for the AES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AES_KEY_SIZE_512

```cangjie
public static const HUKS_AES_KEY_SIZE_512: HuksParamValue = HuksParamValue.Uint32Value(512)
```

**Function:** Indicates a 512-bit key length for the AES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_CURVE25519_KEY_SIZE_256

```cangjie
public static const HUKS_CURVE25519_KEY_SIZE_256: HuksParamValue = HuksParamValue.Uint32Value(256)
```

**Function:** Indicates a 256-bit key length for the CURVE25519 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DH_KEY_SIZE_2048

```cangjie
public static const HUKS_DH_KEY_SIZE_2048: HuksParamValue = HuksParamValue.Uint32Value(2048)
```

**Function:** Indicates a 2048-bit key length for the DH algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DH_KEY_SIZE_3072

```cangjie
public static const HUKS_DH_KEY_SIZE_3072: HuksParamValue = HuksParamValue.Uint32Value(3072)
```

**Function:** Indicates a 3072-bit key length for the DH algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DH_KEY_SIZE_4096

```cangjie
public static const HUKS_DH_KEY_SIZE_4096: HuksParamValue = HuksParamValue.Uint32Value(4096)
```

**Function:** Indicates a 4096-bit key length for the DH algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ECC_KEY_SIZE_224

```cangjie
public static const HUKS_ECC_KEY_SIZE_224: HuksParamValue = HuksParamValue.Uint32Value(224)
```

**Function:** Indicates a 224-bit key length for the ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ECC_KEY_SIZE_256

```cangjie
public static const HUKS_ECC_KEY_SIZE_256: HuksParamValue = HuksParamValue.Uint32Value(256)
```

**Function:** Indicates a 256-bit key length for the ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ECC_KEY_SIZE_384

```cangjie
public static const HUKS_ECC_KEY_SIZE_384: HuksParamValue = HuksParamValue.Uint32Value(384)
```

**Function:** Indicates a 384-bit key length for the ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ECC_KEY_SIZE_521

```cangjie
public static const HUKS_ECC_KEY_SIZE_521: HuksParamValue = HuksParamValue.Uint32Value(521)
```

**Function:** Indicates a 521-bit key length for the ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_1024

```cangjie
public static const HUKS_RSA_KEY_SIZE_1024: HuksParamValue = HuksParamValue.Uint32Value(1024)
```

**Function:** Indicates a 1024-bit key length for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_2048

```cangjie
public static const HUKS_RSA_KEY_SIZE_2048: HuksParamValue = HuksParamValue.Uint32Value(2048)
```

**Function:** Indicates a 2048-bit key length for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_3072

```cangjie
public static const HUKS_RSA_KEY_SIZE_3072: HuksParamValue = HuksParamValue.Uint32Value(3072)
```

**Function:** Indicates a 3072-bit key length for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_4096

```cangjie
public static const HUKS_RSA_KEY_SIZE_4096: HuksParamValue = HuksParamValue.Uint32Value(4096)
```

**Function:** Indicates a 4096-bit key length for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_512

```cangjie
public static const HUKS_RSA_KEY_SIZE_512: HuksParamValue = HuksParamValue.Uint32Value(512)
```

**Function:** Indicates a 512-bit key length for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_768

```cangjie
public static const HUKS_RSA_KEY_SIZE_768: HuksParamValue = HuksParamValue.Uint32Value(768)
```

**Function:** Indicates a 768-bit key length for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_SM2_KEY_SIZE_256

```cangjie
public static const HUKS_SM2_KEY_SIZE_256: HuksParamValue = HuksParamValue.Uint32Value(256)
```

**Function:** Indicates a 256-bit key length for the SM2 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_SM4_KEY_SIZE_128

```cangjie
public static const HUKS_SM4_KEY_SIZE_128: HuksParamValue = HuksParamValue.Uint32Value(128)
```

**Function:** Indicates a 128-bit key length for the SM4 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeyStorageType

```cangjie
public class HuksKeyStorageType {
    public static const HUKS_STORAGE_ONLY_USED_IN_HUKS: HuksParamValue = HuksParamValue.Uint32Value(2)
    public static const HUKS_STORAGE_KEY_EXPORT_ALLOWED: HuksParamValue = HuksParamValue.Uint32Value(3)
}
```

**Function:** Represents key storage method.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_STORAGE_KEY_EXPORT_ALLOWED

```cangjie
public static const HUKS_STORAGE_KEY_EXPORT_ALLOWED: HuksParamValue = HuksParamValue.Uint32Value(3)
```

**Function:** Indicates that the key derived from the master key can be directly exported to service providers, without being managed by HUKS.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_STORAGE_ONLY_USED_IN_HUKS

```cangjie
public static const HUKS_STORAGE_ONLY_USED_IN_HUKS: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Function:** Indicates that the key derived from the master key is stored in HUKS and managed by HUKS.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksOptions

```cangjie
public class HuksOptions {
    public var properties: Array<HuksParam>
    public var inData: Bytes


    public init(properties!: Array<HuksParam> = Array<HuksParam>(), inData!: Bytes = Bytes())
}
```

**Function:** Options used for API calls.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### var inData

```cangjie
public var inData: Bytes
```

**Function:** Input data.

**Type:** [Bytes](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#unsigned-integer-types)

**Read/Write Permission:** Readable and writable

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### var properties

```cangjie
public var properties: Array<HuksParam>
```

**Function:** Properties, an array for storing HuksParam objects.

**Type:** Array\<[HuksParam](#class-huksparam)>

**Read/Write Permission:** Readable and writable

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### init(Array\<HuksParam>, Bytes)

```cangjie

public init(properties!: Array<HuksParam> = Array<HuksParam>(), inData!: Bytes = Bytes())
```

**Function:** Constructs an options instance for API calls.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| properties | Array\<[HuksParam](#class-huksparam)> | No | Array<HuksParam>() | Properties, an array for storing HuksParam objects. |
| inData | [Bytes](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#unsigned-integer-types) | No | Bytes() | Input data. |## class HuksParam

```cangjie
public class HuksParam {
    public var tag: HuksTag
    public var value: HuksParamValue


    public init(tag: HuksTag, value: HuksParamValue)
}
```

**Description:** An element in the properties array of [HuksOptions](#class-huksoptions).

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### var tag

```cangjie
public var tag: HuksTag
```

**Description:** The tag.

**Type:** [HuksTag](#enum-hukstag)

**Access:** Read-Write

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### var value

```cangjie
public var value: HuksParamValue
```

**Description:** The value corresponding to the tag.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Access:** Read-Write

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### init(HuksTag, HuksParamValue)

```cangjie

public init(tag: HuksTag, value: HuksParamValue)
```

**Description:** Constructs an instance of an element in the properties array of [HuksOptions](#class-huksoptions).

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|tag|[HuksTag](#enum-hukstag)|Yes|-|The tag.|
|value|[HuksParamValue](#enum-huksparamvalue)|Yes|-|The value corresponding to the tag.|

## class HuksRsaPssSaltLenType

```cangjie
public class HuksRsaPssSaltLenType {
    public static const HUKS_RSA_PSS_SALT_LEN_DIGEST: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_RSA_PSS_SALT_LEN_MAX: HuksParamValue = HuksParamValue.Uint32Value(1)
}
```

**Description:** Represents the salt_len type to be specified when RSA performs signing or verification with PSS padding.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_PSS_SALT_LEN_DIGEST

```cangjie
public static const HUKS_RSA_PSS_SALT_LEN_DIGEST: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Description:** Indicates setting salt_len based on the digest length.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_PSS_SALT_LEN_MAX

```cangjie
public static const HUKS_RSA_PSS_SALT_LEN_MAX: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates setting salt_len to the maximum length.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksSecureSignType

```cangjie
public class HuksSecureSignType {
    public static const HUKS_SECURE_SIGN_WITH_AUTHINFO: HuksParamValue = HuksParamValue.Uint32Value(1)
}
```

**Description:** Specifies the signature type of a key when generating or importing it.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_SECURE_SIGN_WITH_AUTHINFO

```cangjie
public static const HUKS_SECURE_SIGN_WITH_AUTHINFO: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates that the signature type carries authentication information. When this field is specified during key generation or import, authentication information is added to the data to be signed before signing.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

## class HuksSendType

```cangjie
public class HuksSendType {
    public static const HUKS_SEND_TYPE_ASYNC: HuksParamValue = HuksParamValue.Uint32Value(0)
    public static const HUKS_SEND_TYPE_SYNC: HuksParamValue = HuksParamValue.Uint32Value(1)
}
```

**Description:** Represents the method of sending a Tag.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_SEND_TYPE_ASYNC

```cangjie
public static const HUKS_SEND_TYPE_ASYNC: HuksParamValue = HuksParamValue.Uint32Value(0)
```

**Description:** Indicates sending a Tag asynchronously.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_SEND_TYPE_SYNC

```cangjie
public static const HUKS_SEND_TYPE_SYNC: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** Indicates sending a Tag synchronously.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksSessionHandle

```cangjie
public class HuksSessionHandle {
    public var handle: HuksHandleId
    public var challenge: Bytes
}
```

**Description:** The huks Handle structure.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### var challenge

```cangjie
public var challenge: Bytes
```

**Description:** Represents the challenge information obtained after the [initSession](#func-initsessionstring-huksoptions) operation.

**Type:** [Bytes](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#unsigned-integer-types)

**Access:** Read-Write

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### var handle

```cangjie
public var handle: HuksHandleId
```

**Description:** Represents the handle value.

**Type:** [HuksHandleId](#class-hukshandleid)

**Access:** Read-Write

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksTagType

```cangjie
public class HuksTagType {
    public static const HUKS_TAG_TYPE_INVALID: UInt32 = 0 << 28
    public static const HUKS_TAG_TYPE_INT: UInt32 = 1 << 28
    public static const HUKS_TAG_TYPE_UINT: UInt32 = 2 << 28
    public static const HUKS_TAG_TYPE_ULONG: UInt32 = 3 << 28
    public static const HUKS_TAG_TYPE_BOOL: UInt32 = 4 << 28
    public static const HUKS_TAG_TYPE_BYTES: UInt32 = 5 << 28
}
```

**Description:** Represents the data type of a Tag.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_TAG_TYPE_BOOL

```cangjie
public static const HUKS_TAG_TYPE_BOL: UInt32 = 4 << 28
```

**Description:** Indicates that the Tag's data type is boolean.

**Type:** UInt32

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_TAG_TYPE_BYTES

```cangjie
public static const HUKS_TAG_TYPE_BYTES: UInt32 = 5 << 28
```

**Description:** Indicates that the Tag's data type is Uint8Array.

**Type:** UInt32

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_TAG_TYPE_INT

```cangjie
public static const HUKS_TAG_TYPE_INT: UInt32 = 1 << 28
```

**Description:** Indicates that the Tag's data type is UInt32.

**Type:** UInt32

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_TAG_TYPE_INVALID

```cangjie
public static const HUKS_TAG_TYPE_INVALID: UInt32 = 0 << 28
```

**Description:** Indicates an invalid Tag type.

**Type:** UInt32

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_TAG_TYPE_UINT

```cangjie
public static const HUKS_TAG_TYPE_UINT: UInt32 = 2 << 28
```

**Description:** Indicates that the Tag's data type is UInt32.

**Type:** UInt32

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_TAG_TYPE_ULONG

```cangjie
public static const HUKS_TAG_TYPE_ULONG: UInt32 = 3 << 28
```

**Description:** Indicates that the Tag's data type is bigint.

**Type:** UInt32

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksUnwrapSuite

```cangjie
public class HuksUnwrapSuite {
    public static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.Uint32Value(1)
    public static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.Uint32Value(2)
}
```

**Description:** Represents the algorithm suite for importing encrypted keys.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING

```cangjie
public static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.Uint32Value(2)
```

**Description:** When importing an encrypted key, uses AES-256 GCM encryption after ECDH key agreement.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING

```cangjie
public static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.Uint32Value(1)
```

**Description:** When importing an encrypted key, uses AES-256 GCM encryption after X25519 key agreement.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksUserAuthType

```cangjie
public class HuksUserAuthType {
    public static const HUKS_USER_AUTH_TYPE_FINGERPRINT: HuksParamValue = HuksParamValue.Uint32Value(1 << 0)
    public static const HUKS_USER_AUTH_TYPE_FACE: HuksParamValue = HuksParamValue.Uint32Value(1 << 1)
    public static const HUKS_USER_AUTH_TYPE_PIN: HuksParamValue = HuksParamValue.Uint32Value(1 << 2)
}
```

**Description:** Represents the user authentication type.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_USER_AUTH_TYPE_FACE

```cangjie
public static const HUKS_USER_AUTH_TYPE_FACE: HuksParamValue = HuksParamValue.Uint32Value(1 << 1)
```

**Description:** Indicates that the user authentication type is face recognition.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_USER_AUTH_TYPE_FINGERPRINT

```cangjie
public static const HUKS_USER_AUTH_TYPE_FINGERPRINT: HuksParamValue = HuksParamValue.Uint32Value(1 << 0)
```

**Description:** Indicates that the user authentication type is fingerprint.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_USER_AUTH_TYPE_PIN

```cangjie
public static const HUKS_USER_AUTH_TYPE_PIN: HuksParamValue = HuksParamValue.Uint32Value(1 << 2)
```

**Description:** Indicates that the user authentication type is PIN code.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21## enum HuksParamValue

```cangjie
public enum HuksParamValue {
    | BooleanValue(Bool)
    | Int32Value(Int32)
    | Uint32Value(UInt32)
    | Uint64Value(UInt64)
    | BytesValue(Bytes)
    | ...
}
```

**Description:** Used to represent the value of `value` in HuksParam, supporting Bool, Int32, UInt32, UInt64, and Array\<UInt8> formats.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### BooleanValue(Bool)

```cangjie
BooleanValue(Bool)
```

**Description:** This field is used to pass a Bool-type value.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### BytesValue(Bytes)

```cangjie
BytesValue(Bytes)
```

**Description:** This field is used to pass a Bytes-type value.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### Int32Value(Int32)

```cangjie
Int32Value(Int32)
```

**Description:** This field is used to pass an Int32-type value.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### Uint32Value(UInt32)

```cangjie
Uint32Value(UInt32)
```

**Description:** This field is used to pass a UInt32-type value.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### Uint64Value(UInt64)

```cangjie
Uint64Value(UInt64)
```

**Description:** This field is used to pass a UInt64-type value.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## enum HuksTag

```cangjie
public enum HuksTag {
    | HuksTagInvalid
    | HuksTagAlgorithm
    | HuksTagPurpose
    | HuksTagKeySize
    | HuksTagDigest
    | HuksTagPadding
    | HuksTagBlockMode
    | HuksTagKeyType
    | HuksTagAssociatedData
    | HuksTagNonce
    | HuksTagIv
    | HuksTagInfo
    | HuksTagSalt
    | HuksTagPwd
    | HuksTagIteration
    | HuksTagKeyGenerateType
    | HuksTagDeriveMainKey
    | HuksTagDeriveFactor
    | HuksTagDeriveAlg
    | HuksTagAgreeAlg
    | HuksTagAgreePublicKeyIsKeyAlias
    | HuksTagAgreePrivateKeyAlias
    | HuksTagAgreePublicKey
    | HuksTagKeyAlias
    | HuksTagDeriveKeySize
    | HuksTagImportKeyType
    | HuksTagUnwrapAlgorithmSuite
    | HuksTagDerivedAgreedKeyStorageFlag
    | HuksTagRsaPssSaltLenType
    | HuksTagActiveDatetime
    | HuksTagOriginationExpireDatetime
    | HuksTagUsageExpireDatetime
    | HuksTagCreationDatetime
    | HuksTagAllUsers
    | HuksTagUserId
    | HuksTagNoAuthRequired
    | HuksTagUserAuthType
    | HuksTagAuthTimeout
    | HuksTagAuthToken
    | HuksTagKeyAuthAccessType
    | HuksTagKeySecureSignType
    | HuksTagChallengeType
    | HuksTagChallengePos
    | HuksTagKeyAuthPurpose
    | HuksTagAttestationChallenge
    | HuksTagAttestationApplicationId
    | HuksTagAttestationIdBrand
    | HuksTagAttestationIdDevice
    | HuksTagAttestationIdProduct
    | HuksTagAttestationIdSerial
    | HuksTagAttestationIdImei
    | HuksTagAttestationIdMeid
    | HuksTagAttestationIdManufacturer
    | HuksTagAttestationIdModel
    | HuksTagAttestationIdAlias
    | HuksTagAttestationIdSocid
    | HuksTagAttestationIdUdid
    | HuksTagAttestationIdSecLevelInfo
    | HuksTagAttestationIdVersionInfo
    | HuksTagAttestationBase64
    | HuksTagIsKeyAlias
    | HuksTagKeyStorageFlag
    | HuksTagIsAllowedWrap
    | HuksTagKeyWrapType
    | HuksTagKeyAuthId
    | HuksTagKeyRole
    | HuksTagKeyFlag
    | HuksTagIsAsynchronized
    | HuksTagSecureKeyAlias
    | HuksTagSecureKeyUuid
    | HuksTagKeyDomain
    | HuksTagProcessName
    | HuksTagPackageName
    | HuksTagAccessTime
    | HuksTagUsesTime
    | HuksTagCryptoCtx
    | HuksTagKey
    | HuksTagKeyVersion
    | HuksTagPayloadLen
    | HuksTagAeTag
    | HuksTagIsKeyHandle
    | HuksTagOsVersion
    | HuksTagOsPatchlevel
    | HuksTagSymmetricKeyData
    | HuksTagAsymmetricPublicKeyData
    | HuksTagAsymmetricPrivateKeyData
    | ...
}
```

**Description:** Represents the tags for calling parameters.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAccessTime

```cangjie
HuksTagAccessTime
```

**Description:** Originally reserved field, now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagActiveDatetime

```cangjie
HuksTagActiveDatetime
```

**Description:** Originally reserved for certificate services, now deprecated as certificate management has been separated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAeTag

```cangjie
HuksTagAeTag
```

**Description:** Field used to pass AEAD data in GCM mode.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAgreeAlg

```cangjie
HuksTagAgreeAlg
```

**Description:** Represents the algorithm type for key agreement.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAgreePrivateKeyAlias

```cangjie
HuksTagAgreePrivateKeyAlias
```

**Description:** Represents the private key alias for key agreement.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAgreePublicKey

```cangjie
HuksTagAgreePublicKey
```

**Description:** Represents the public key for key agreement.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAgreePublicKeyIsKeyAlias

```cangjie
HuksTagAgreePublicKeyIsKeyAlias
```

**Description:** Represents the public key alias for key agreement.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAlgorithm

```cangjie
HuksTagAlgorithm
```

**Description:** Represents the algorithm tag.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAllUsers

```cangjie
HuksTagAllUsers
```

**Description:** SystemCapability.Security.Huks.Extension

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAssociatedData

```cangjie
HuksTagAssociatedData
```

**Description:** Represents the tag for additional authenticated data.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAsymmetricPrivateKeyData

```cangjie
HuksTagAsymmetricPrivateKeyData
```

**Description:** SystemCapability.Security.Huks.Extension

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAsymmetricPublicKeyData

```cangjie
HuksTagAsymmetricPublicKeyData
```

**Description:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationApplicationId

```cangjie
HuksTagAttestationApplicationId
```

**Description:** Represents the ID of the application owning the key during attestation.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationBase64

```cangjie
HuksTagAttestationBase64
```

**Description:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationChallenge

```cangjie
HuksTagAttestationChallenge
```

**Description:** Represents the challenge value during attestation.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdAlias

```cangjie
HuksTagAttestationIdAlias
```

**Description:** Represents the key alias during attestation.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdBrand

```cangjie
HuksTagAttestationIdBrand
```

**Description:** Represents the device brand. Now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdDevice

```cangjie
HuksTagAttestationIdDevice
```

**Description:** Represents the device ID. Now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdImei

```cangjie
HuksTagAttestationIdImei
```

**Description:** Represents the device's IMEI number. Now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21### HuksTagAttestationIdManufacturer

```cangjie
HuksTagAttestationIdManufacturer
```

**Function:** Indicates the device manufacturer. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdMeid

```cangjie
HuksTagAttestationIdMeid
```

**Function:** Indicates the MEID number of the device. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdModel

```cangjie
HuksTagAttestationIdModel
```

**Function:** Indicates the device model. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdProduct

```cangjie
HuksTagAttestationIdProduct
```

**Function:** Indicates the product name of the device. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdSecLevelInfo

```cangjie
HuksTagAttestationIdSecLevelInfo
```

**Function:** Indicates the security credential during attestation.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdSerial

```cangjie
HuksTagAttestationIdSerial
```

**Function:** Indicates the serial number (SN) of the device. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdSocid

```cangjie
HuksTagAttestationIdSocid
```

**Function:** Indicates the SOCID of the device. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdUdid

```cangjie
HuksTagAttestationIdUdid
```

**Function:** Indicates the UDID of the device. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAttestationIdVersionInfo

```cangjie
HuksTagAttestationIdVersionInfo
```

**Function:** Indicates the version number during attestation.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAuthTimeout

```cangjie
HuksTagAuthTimeout
```

**Function:** Indicates the single-use validity period of the auth token.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagAuthToken

```cangjie
HuksTagAuthToken
```

**Function:** Field used to pass the auth token.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagBlockMode

```cangjie
HuksTagBlockMode
```

**Function:** Tag indicating the encryption mode.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagChallengePos

```cangjie
HuksTagChallengePos
```

**Function:** When the challenge type is user-defined, the effective length of the challenge generated by Huks is only 8 bytes of consecutive data. Selected from [HuksChallengePosition](#class-hukschallengeposition).

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagChallengeType

```cangjie
HuksTagChallengeType
```

**Function:** Indicates the type of challenge generated during key usage. Selected from [HuksChallengeType](#class-hukschallengetype).

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagCreationDatetime

```cangjie
HuksTagCreationDatetime
```

**Function:** Originally reserved for certificate services. Now that certificate management is independent, this field is deprecated and no longer reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagCryptoCtx

```cangjie
HuksTagCryptoCtx
```

**Function:** Originally a reserved field. Now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagDeriveAlg

```cangjie
HuksTagDeriveAlg
```

**Function:** Indicates the algorithm type during key derivation. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagDeriveFactor

```cangjie
HuksTagDeriveFactor
```

**Function:** Indicates the derivation factor during key derivation. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagDeriveKeySize

```cangjie
HuksTagDeriveKeySize
```

**Function:** Indicates the size of the derived key.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagDeriveMainKey

```cangjie
HuksTagDeriveMainKey
```

**Function:** Indicates the master key during key derivation. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagDerivedAgreedKeyStorageFlag

```cangjie
HuksTagDerivedAgreedKeyStorageFlag
```

**Function:** Indicates the storage type of derived/agreed keys.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagDigest

```cangjie
HuksTagDigest
```

**Function:** Tag indicating the digest algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagImportKeyType

```cangjie
HuksTagImportKeyType
```

**Function:** Indicates the type of imported key.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagInfo

```cangjie
HuksTagInfo
```

**Function:** Indicates the info during key derivation.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagInvalid

```cangjie
HuksTagInvalid
```

**Function:** Indicates an invalid tag. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagIsAllowedWrap

```cangjie
HuksTagIsAllowedWrap
```

**Function:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagIsAsynchronized

```cangjie
HuksTagIsAsynchronized
```

**Function:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagIsKeyAlias

```cangjie
HuksTagIsKeyAlias
```

**Function:** Tag indicating whether to use the alias passed during key generation.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagIsKeyHandle

```cangjie
HuksTagIsKeyHandle
```

**Function:** Originally a reserved field. Now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagIteration

```cangjie
HuksTagIteration
```

**Function:** Indicates the iteration count during key derivation.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagIv

```cangjie
HuksTagIv
```

**Function:** Indicates the initialization vector for the key.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagKey

```cangjie
HuksTagKey
```

**Function:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagKeyAlias

```cangjie
HuksTagKeyAlias
```

**Function:** Indicates the key alias.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksTagKeyAuthAccessType

```cangjie
HuksTagKeyAuthAccessType
```

**Function:** Indicates the security access control type. Selected from [HuksAuthAccessType](#class-huksauthaccesstype). Must be set together with the user authentication type.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21### HuksTagKeyAuthId

```cangjie
HuksTagKeyAuthId
```

**Functionality:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyAuthPurpose

```cangjie
HuksTagKeyAuthPurpose
```

**Functionality:** Represents the tag for key authentication purpose.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyDomain

```cangjie
HuksTagKeyDomain
```

**Functionality:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyFlag

```cangjie
HuksTagKeyFlag
```

**Functionality:** Represents the tag for key flags.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyGenerateType

```cangjie
HuksTagKeyGenerateType
```

**Functionality:** Represents the tag for key generation type.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyRole

```cangjie
HuksTagKeyRole
```

**Functionality:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeySecureSignType

```cangjie
HuksTagKeySecureSignType
```

**Functionality:** Specifies the signature type of the key when generating or importing it.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeySize

```cangjie
HuksTagKeySize
```

**Functionality:** Represents the tag for key length.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyStorageFlag

```cangjie
HuksTagKeyStorageFlag
```

**Functionality:** Represents the tag for key storage method.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyType

```cangjie
HuksTagKeyType
```

**Functionality:** Represents the tag for key type.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyVersion

```cangjie
HuksTagKeyVersion
```

**Functionality:** Represents the tag for key version. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagKeyWrapType

```cangjie
HuksTagKeyWrapType
```

**Functionality:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagNoAuthRequired

```cangjie
HuksTagNoAuthRequired
```

**Functionality:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagNonce

```cangjie
HuksTagNonce
```

**Functionality:** Represents the NONCE field for key encryption/decryption.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagOriginationExpireDatetime

```cangjie
HuksTagOriginationExpireDatetime
```

**Functionality:** Originally reserved for certificate services. Now that certificate management is independent, this field is deprecated and no longer reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagOsPatchlevel

```cangjie
HuksTagOsPatchlevel
```

**Functionality:** Represents the tag for OS patch level. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagOsVersion

```cangjie
HuksTagOsVersion
```

**Functionality:** Represents the tag for OS version. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagPackageName

```cangjie
HuksTagPackageName
```

**Functionality:** Originally a reserved field, now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagPadding

```cangjie
HuksTagPadding
```

**Functionality:** Represents the tag for padding algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagPayloadLen

```cangjie
HuksTagPayloadLen
```

**Functionality:** Originally a reserved field, now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagProcessName

```cangjie
HuksTagProcessName
```

**Functionality:** Represents the tag for process name. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagPurpose

```cangjie
HuksTagPurpose
```

**Functionality:** Represents the tag for key purpose.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagPwd

```cangjie
HuksTagPwd
```

**Functionality:** Represents the password for key derivation. Deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagRsaPssSaltLenType

```cangjie
HuksTagRsaPssSaltLenType
```

**Functionality:** Represents the type of rsa_pss_salt_length.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagSalt

```cangjie
HuksTagSalt
```

**Functionality:** Represents the salt value for key derivation.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagSecureKeyAlias

```cangjie
HuksTagSecureKeyAlias
```

**Functionality:** Originally a reserved field, now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagSecureKeyUuid

```cangjie
HuksTagSecureKeyUuid
```

**Functionality:** Originally a reserved field, now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagSymmetricKeyData

```cangjie
HuksTagSymmetricKeyData
```

**Functionality:** Reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagUnwrapAlgorithmSuite

```cangjie
HuksTagUnwrapAlgorithmSuite
```

**Functionality:** Represents the suite for importing encrypted keys.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagUsageExpireDatetime

```cangjie
HuksTagUsageExpireDatetime
```

**Functionality:** Originally reserved for certificate services. Now that certificate management is independent, this field is deprecated and no longer reserved.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagUserAuthType

```cangjie
HuksTagUserAuthType
```

**Functionality:** Represents the user authentication type. Selected from [HuksUserAuthType](#class-huksuserauthtype), must be set simultaneously with secure access control type. Supports specifying two user authentication types simultaneously. For example: When the secure access control type is set to HUKS_SECURE_ACCESS_INVALID_NEW_BIO_ENROLL, the key access authentication type can be specified as one of the following three: HUKS_USER_AUTH_TYPE_FACE, HUKS_USER_AUTH_TYPE_FINGERPRINT, HUKS_USER_AUTH_TYPE_FACE MagIc_StrINg HUKS_USER_AUTH_TYPE_FINGERPRINT.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagUserId

```cangjie
HuksTagUserId
```

**Functionality:** Represents which userID the current key belongs to.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21

### HuksTagUsesTime

```cangjie
HuksTagUsesTime
```

**Functionality:** Originally a reserved field, now deprecated.

**System Capability:** SystemCapability.Security.Huks.Core

**Initial Version:** 21