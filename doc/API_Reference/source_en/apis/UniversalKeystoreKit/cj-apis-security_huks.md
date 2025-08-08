# ohos.security_huks (Universal Keystore System)

Provides applications with keystore capabilities, including key management and cryptographic operations on keys.

Keys managed by HUKS can be either imported by applications or generated through HUKS interfaces.

## Import Module

```cangjie
import kit.UniversalKeystoreKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code begins with a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration needs to be done in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-sample-code-instructions).

## func abortSession(HuksHandle, HuksOptions)

```cangjie
public func abortSession(handle: HuksHandle, options: HuksOptions): Unit
```

**Function:** Interface for aborting key operations.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| handle | [HuksHandle](#class-hukshandle) | Yes | The handle for the abortSession operation. |
| options | [HuksOptions](#class-huksoptions) | Yes | Parameter set for the abortSession operation. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 801 | Capability not supported. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

let keyAlias = "test_abort"
let plainText = "123456"
let iv = "0011223344556677"
let options = HuksOptions(
    [
        HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
        HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        )
    ],
    None
)
let encOptions = HuksOptions(
    [
        HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
        HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),
        HuksParam(HuksTag.HUKS_TAG_PURPOSE, HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
        HuksParam(HuksTag.HUKS_TAG_PADDING, HuksKeyPadding.HUKS_PADDING_PKCS7),
        HuksParam(HuksTag.HUKS_TAG_BLOCK_MODE, HuksCipherMode.HUKS_MODE_CBC),
        HuksParam(HuksTag.HUKS_TAG_IV, HuksParamValue.bytes(iv.toArray()))
    ],
    plainText.toArray()
)

generateKeyItem(keyAlias, options)

// encrypt and abort
let handle = initSession(keyAlias, encOptions).handle

abortSession(handle, encOptions)
```

## func anonAttestKeyItem(String, HuksOptions)

```cangjie
public func anonAttestKeyItem(keyAlias: String, options: HuksOptions): Array<String>
```

**Function:** Obtains an anonymized key certificate. This operation requires network connectivity and may take significant time.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| keyAlias | String | Yes | Key alias, storing the alias of the key for which the certificate is to be obtained. |
| options | [HuksOptions](#class-huksoptions) | Yes | Specifies parameters and data required for obtaining the certificate. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns the key certificate chain. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 801 | Capability not supported. |
  | 12000001 | Algorithm mode is not supported. |
  | 12000002 | Algorithm param is missing. |
  | 12000003 | Algorithm param is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

let keyAlias = "test_rsa_anno"
// generate key
generateKeyItem(
    keyAlias,
    HuksOptions(
        [
            HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_RSA),
            HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_RSA_KEY_SIZE_2048),
            HuksParam(HuksTag.HUKS_TAG_PURPOSE, HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
            HuksParam(HuksTag.HUKS_TAG_DIGEST, HuksKeyDigest.HUKS_DIGEST_SHA256),
            HuksParam(HuksTag.HUKS_TAG_PADDING, HuksKeyPadding.HUKS_PADDING_PSS),
            HuksParam(HuksTag.HUKS_TAG_BLOCK_MODE, HuksCipherMode.HUKS_MODE_ECB)
        ],
        None
    )
)

let challenge = "hi_challenge_data"
let chains = anonAttestKeyItem(
    keyAlias,
    HuksOptions(
        [
            HuksParam(HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, HuksParamValue.bytes(challenge.toArray())),
            HuksParam(HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS, HuksParamValue.bytes(keyAlias.toArray()))
        ],
        None
    )
)
```

## func attestKeyItem(String, HuksOptions)

```cangjie
public func attestKeyItem(keyAlias: String, options: HuksOptions): Array<String>
```

**Function:** Obtains a key certificate.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| keyAlias | String | Yes | Key alias, storing the alias of the key for which the certificate is to be obtained. |
| options | [HuksOptions](#class-huksoptions) | Yes | Specifies parameters and data required for obtaining the certificate. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns the key certificate chain. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission verification failed. |
  | 401 | Parameter error. |
  | 801 | Capability not supported. |
  | 12000001 | Algorithm mode is not supported. |
  | 12000002 | Algorithm param is missing. |
  | 12000003 | Algorithm param is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

## func deleteKeyItem(String, HuksOptions)

```cangjie
public func deleteKeyItem(keyAlias: String, _: HuksOptions): Unit
```

**Function:** Deletes a key.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| keyAlias | String | Yes | Key alias, should be the same as the alias used when generating the key. |
| \_ | [HuksOptions](#class-huksoptions) | Yes | Specifies the attribute Tag for deletion, such as the scope of deletion (full/single). When deleting a single key, the Tag field can be left empty. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 801 | Capability not supported. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

// This code can be added to dependency definitions
func generateSimpleKey(keyAlias: String) {
    let options = HuksOptions(
        [
            HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
            HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),
            HuksParam(
                HuksTag.HUKS_TAG_PURPOSE,
                HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            )
        ],
        None
    )
    generateKeyItem(keyAlias, options)
}

func test_delete_key() {
    let keyAlias = "test_delete_key"
    generateSimpleKey(keyAlias)
    // delete
    deleteKeyItem(keyAlias, HuksOptions.NONE)
}

test_delete_key()
```

## func exportKeyItem(String, HuksOptions)

```cangjie
public func exportKeyItem(keyAlias: String, _: HuksOptions): Bytes
```

**Function:** Exports a key.

**System Capability:** SystemCapability.Security.Huks.Extension**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| keyAlias | String | Yes | The alias of the key, which should match the alias used during key generation. |  
| \_ | [HuksOptions](#class-huksoptions) | Yes | Empty object (pass an empty object here). |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bytes | Returns the public key exported from the key. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. |  
  | 801 | Capability not supported. |  
  | 12000001 | Algorithm mode is not supported. |  
  | 12000002 | Algorithm parameter is missing. |  
  | 12000003 | Algorithm parameter is invalid. |  
  | 12000004 | Operating file failed. |  
  | 12000005 | IPC communication failed. |  
  | 12000006 | Error occurred in crypto engine. |  
  | 12000011 | Queried entity does not exist. |  
  | 12000012 | External error. |  
  | 12000014 | Memory is insufficient. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.UniversalKeystoreKit.*  

let keyAlias = "test_export_key"  
/* 1. Generate Key */  
generateKeyItem(  
    keyAlias,  
    HuksOptions(  
        [  
            HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_ECC),  
            HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_ECC_KEY_SIZE_256),  
            HuksParam(  
                HuksTag.HUKS_TAG_PURPOSE,  
                HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY | HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN  
            ),  
            HuksParam(HuksTag.HUKS_TAG_DIGEST, HuksKeyDigest.HUKS_DIGEST_SHA256)  
        ],  
        None  
    )  
)  
/* 2. Export Key */  
let data = exportKeyItem(keyAlias, HuksOptions.NONE)  
```  

## func finishSession(HuksHandle, HuksOptions)  

```cangjie  
public func finishSession(handle: HuksHandle, options: HuksOptions): Option<Bytes>  
```  

**Function:** The `finishSession` operation key interface. [security_huks.initSession](#func-initsessionstring-huksoptions), [security_huks.updateSession](#func-updatesessionhukshandle-huksoptions), and [security_huks.finishSession](#func-finishsessionhukshandle-huksoptions) are three-stage interfaces and must be used together.  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| handle | [HuksHandle](#class-hukshandle) | Yes | The handle for the `finishSession` operation. |  
| options | [HuksOptions](#class-huksoptions) | Yes | The parameter set for `finishSession`. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Option\<Bytes> | Outputs the processing result. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:----|:---|  
  | 401 | Argument is invalid. |  
  | 801 | API is not supported. |  
  | 12000001 | Algorithm mode is not supported. |  
  | 12000002 | Algorithm parameter is missing. |  
  | 12000003 | Algorithm parameter is invalid. |  
  | 12000004 | Operating file failed. |  
  | 12000005 | IPC communication failed. |  
  | 12000006 | Error occurred in crypto engine. |  
  | 12000007 | This credential is already invalidated permanently. |  
  | 12000008 | Verify authtoken failed. |  
  | 12000009 | Authtoken is already timeout. |  
  | 12000011 | Queried entity does not exist. |  
  | 12000012 | External error. |  
  | 12000014 | Memory is insufficient. |  

## func finishSession(HuksHandle, HuksOptions, Bytes)  

```cangjie  
public func finishSession(handle: HuksHandle, options: HuksOptions, token: Bytes): Option<Bytes>  
```  

**Function:** The `finishSession` operation key interface. [security_huks.initSession](#func-initsessionstring-huksoptions), [security_huks.updateSession](#func-updatesessionhukshandle-huksoptions-arrayuint8), and [security_huks.finishSession](#func-finishsessionhukshandle-huksoptions-arrayuint8) are three-stage interfaces and must be used together.  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| handle | [HuksHandle](#class-hukshandle) | Yes | The handle for the `finishSession` operation. |  
| options | [HuksOptions](#class-huksoptions) | Yes | The parameter set for `finishSession`. |  
| token | Bytes | Yes | Represents the value of the AuthToken from the USER IAM service. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Option\<Bytes> | Outputs the processing result. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:--------|:-------------|  
  | 401 | Parameter error. |  
  | 801 | Capability not supported. |  
  | 12000001 | Algorithm mode is not supported. |  
  | 12000002 | Algorithm parameter is missing. |  
  | 12000003 | Algorithm parameter is invalid. |  
  | 12000004 | Operating file failed. |  
  | 12000005 | IPC communication failed. |  
  | 12000006 | Error occurred in crypto engine. |  
  | 12000007 | This credential is already invalidated permanently. |  
  | 12000008 | Verify authtoken failed. |  
  | 12000009 | Authtoken is already timeout. |  
  | 12000011 | Queried entity does not exist. |  
  | 12000012 | External error. |  
  | 12000014 | Memory is insufficient. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import ohos.hilog.Hilog  
import kit.UniversalKeystoreKit.*  

let keyAlias = "test_encrypt_decrypt_cbc_pkcs7"  
let plainText = "123456"  
let iv = "1122334455667788"  
let options = HuksOptions(  
    [  
        HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),  
        HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),  
        HuksParam(  
            HuksTag.HUKS_TAG_PURPOSE,  
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT  
        ),  
        HuksParam(HuksTag.HUKS_TAG_PADDING, HuksKeyPadding.HUKS_PADDING_PKCS7),  
        HuksParam(HuksTag.HUKS_TAG_BLOCK_MODE, HuksCipherMode.HUKS_MODE_CBC),  
        HuksParam(HuksTag.HUKS_TAG_IV, HuksParamValue.bytes(iv.toArray()))  
    ],  
    None  
)  
let encOptions = HuksOptions(  
    [  
        HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),  
        HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),  
        HuksParam(HuksTag.HUKS_TAG_PURPOSE, HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),  
        HuksParam(HuksTag.HUKS_TAG_PADDING, HuksKeyPadding.HUKS_PADDING_PKCS7),  
        HuksParam(HuksTag.HUKS_TAG_BOCK_MODE, HuksCipherMode.HUKS_MODE_CBC),  
        HuksParam(HuksTag.HUKS_TAG_IV, HuksParamValue.bytes(iv.toArray()))  
    ],  
    plainText.toArray()  
)  
generateKeyItem(keyAlias, options)  
// encrypt  
let handle1 = initSession(keyAlias, encOptions).handle  
let cipherData = finishSession(handle1, encOptions)  
let decOptions = HuksOptions(  
    [  
        HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),  
        HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),  
        HuksParam(HuksTag.HUKS_TAG_PURPOSE, HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT),  
        HuksParam(HuksTag.HUKS_TAG_PADDING, HuksKeyPadding.HUKS_PADDING_PKCS7),  
        HuksParam(HuksTag.HUKS_TAG_BLOCK_MODE, HuksCipherMode.HUKS_MODE_CBC),  
        HuksParam(HuksTag.HUKS_TAG_IV, HuksParamValue.bytes(iv.toArray()))  
    ],  
    cipherData  
)  
// decrypt  
let handle2 = initSession(keyAlias, decOptions).handle  
let decData = finishSession(handle2, decOptions)  
let dec = String.fromUtf8(decData.getOrThrow())  
Hilog.info(0, "Hks testEntry", "${plainText == dec}")  
abortSession(handle1, HuksOptions([], None))  
abortSession(handle2, HuksOptions([], None))  
```  

## func generateKeyItem(String, HuksOptions)  

```cangjie  
public func generateKeyItem(keyAlias: String, options: HuksOptions): Unit  
```  

**Function:** Generates a key.  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| keyAlias | String | Yes | The alias of the key. |  
| options | [HuksOptions](#class-huksoptions) | Yes | Contains the tags required for key generation. The algorithm, key purpose, and key size are mandatory parameters. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. |  
  | 801 | Capability not supported. |  
  | 12000001 | Algorithm mode is not supported. |  
  | 12000002 | Algorithm parameter is missing. |  
  | 12000003 | Algorithm parameter is invalid. |  
  | 12000004 | Operating file failed. |  
  | 12000005 | IPC communication failed. |  
  | 12000006 | Error occurred in crypto engine. |  
  | 12000012 | External error. |  
  | 12000013 | Queried credential does not exist. |  
  | 12000014 | Memory is insufficient. |  
  | 12000015 | Call service failed. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.UniversalKeystoreKit.*  

let keyAlias = "test_generate_key"  
let options = HuksOptions(  
    [  
        HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),  
        HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),  
        HuksParam(  
            HuksTag.HUKS_TAG_PURPOSE,  
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT  
        )  
    ],  
    None  
)  
generateKeyItem(keyAlias, options)  
```  

## func getKeyItemProperties(String, HuksOptions)  

```cangjie  
public func getKeyItemProperties(keyAlias: String, _: HuksOptions): Array<HuksParam>  
```  

**Function:** Retrieves key properties.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| keyAlias | String | Yes | The alias of the key. |  
| \_ | [HuksOptions](#class-huksoptions) | Yes | Empty object (pass an empty object here). |**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[HuksParam](#class-huksparam)> | Returns the key properties. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 801 | Capability not supported. |
  | 12000001 | Algorithm mode is not supported. |
  | 12000002 | Algorithm parameter is missing. |
  | 12000003 | Algorithm parameter is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

let keyAlias = "test_get_key_item_properties"
let options = HuksOptions(
    [
        HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
        HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        )
    ],
    Option.None
)
let properties = getKeyItemProperties(keyAlias, HuksOptions.NONE)
```

## func getSdkVersion()

```cangjie
public func getSdkVersion(): String
```

**Function:** Gets the current system SDK version.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the SDK version. |

**Example:**

<!-- compile -->
```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

// Code can be added here in the dependency definitions
func test_get_sdk_version() {
    let res = getSdkVersion()
    return res
}

test_get_sdk_version()
```

## func importKeyItem(String, HuksOptions)

```cangjie
public func importKeyItem(keyAlias: String, options: HuksOptions): Unit
```

**Function:** Imports a plaintext key.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| keyAlias | String | Yes | Key alias. |
| options | [HuksOptions](#class-huksoptions) | Yes | Tags required for import and the key to be imported. The algorithm, key purpose, and key length are mandatory parameters. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Argument is invalid. |
  | 801 | API is not supported. |
  | 12000001 | Algorithm mode is not supported. |
  | 12000002 | Algorithm parameter is missing. |
  | 12000003 | Algorithm parameter is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000013 | Queried credential does not exist. |
  | 12000014 | Memory is insufficient. |
  | 12000015 | Call service failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

let keyAlias = "test_import_aes"
let key = Array<UInt8>(Int64(HuksKeySize.HUKS_AES_KEY_SIZE_256.toUInt32().getOrThrow() / 8),
    {i => UInt8(i & 0xFF)})
importKeyItem(
    keyAlias,
    HuksOptions(
        [
            HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
            HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_256),
            HuksParam(
                HuksTag.HUKS_TAG_PURPOSE,
                HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            )
        ],
        key
    )
)
```

## func importWrappedKeyItem(String, String, HuksOptions)

```cangjie
public func importWrappedKeyItem(keyAlias: String, wrappingKeyAlias: String, options: HuksOptions): Unit
```

**Function:** Imports an encrypted key.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| keyAlias | String | Yes | Key alias for storing the key to be imported. |
| wrappingKeyAlias | String | Yes | Key alias corresponding to the key used to decrypt the encrypted key data. |
| options | [HuksOptions](#class-huksoptions) | Yes | Tags required for import and the encrypted key data to be imported. The algorithm, key purpose, and key length are mandatory parameters. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Argument is invalid. |
  | 801 | API is not supported. |
  | 12000001 | Algorithm mode is not supported. |
  | 12000002 | Algorithm parameter is missing. |
  | 12000003 | Algorithm parameter is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000013 | Queried credential does not exist. |
  | 12000014 | Memory is insufficient. |
  | 12000015 | Call service failed. |

## func initSession(String, HuksOptions)

```cangjie
public func initSession(keyAlias: String, options: HuksOptions): HuksSessionHandle
```

**Function:** Initializes a session for key operations. [security_huks.initSession](#func-initsessionstring-huksoptions), [security_huks.updateSession](#func-updatesessionhukshandle-huksoptions), and [security_huks.finishSession](#func-finishsessionhukshandle-huksoptions) are three-phase APIs that must be used together.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| keyAlias | String | Yes | Alias of the key for the session initialization. |
| options | [HuksOptions](#class-huksoptions) | Yes | Parameter set for the session initialization operation. |

**Return Value:**

| Type | Description |
|:----|:----|
| [HuksSessionHandle](#class-hukssessionhandle) | Returns the HUKS session handle. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Argument is invalid. |
  | 801 | API is not supported. |
  | 12000001 | Algorithm mode is not supported. |
  | 12000002 | Algorithm parameter is missing. |
  | 12000003 | Algorithm parameter is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000010 | The number of sessions has reached the limit. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

## func isKeyItemExist(String, HuksOptions)

```cangjie
public func isKeyItemExist(keyAlias: String, options: HuksOptions): Bool
```

**Function:** Checks whether a key exists.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| keyAlias | String | Yes | Alias of the key to be checked. |
| options | [HuksOptions](#class-huksoptions) | Yes | Specifies the key attribute tags for the query, such as the key scope (all/single). When querying a single key, the Tag field can be left empty. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Indicates whether the key exists. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Argument is invalid. |
  | 801 | API is not supported. |
  | 12000002 | Algorithm parameter is missing. |
  | 12000003 | Algorithm parameter is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

// Code can be added here in the dependency definitions
func generateSimpleKey(keyAlias: String) {
    let options = HuksOptions(
        [
            HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
            HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),
            HuksParam(
                HuksTag.HUKS_TAG_PURPOSE,
                HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            )
        ],
        Option.None
    )
    generateKeyItem(keyAlias, options)
}

let keyAlias = "test_is_key_item_exist"
isKeyItemExist(keyAlias, HuksOptions.NONE) // false
generateSimpleKey(keyAlias)
isKeyItemExist(keyAlias, HuksOptions.NONE) // true
```

## func updateSession(HuksHandle, HuksOptions)

```cangjie
public func updateSession(handle: HuksHandle, options: HuksOptions): Option<Bytes>
```

**Function:** The updateSession operation interface for keys. [security_huks.initSession](#func-initsessionstring-huksoptions), [security_huks.updateSession](#func-updatesessionhukshandle-huksoptions), and [security_huks.finishSession](#func-finishsessionhukshandle-huksoptions) form a three-stage interface that must be used together.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| handle | [HuksHandle](#class-hukshandle) | Yes | The handle for the updateSession operation. |
| options | [HuksOptions](#class-huksoptions) | Yes | The parameter set for updateSession. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Bytes> | Outputs the key update result. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:--------|:-------------|
  | 401 | Argument is invalid. |
  | 801 | API is not supported. |
  | 12000001 | Algorithm mode is not supported. |
  | 12000002 | Algorithm parameter is missing. |
  | 12000003 | Algorithm parameter is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000007 | This credential is already invalidated permanently. |
  | 12000008 | Verify authtoken failed. |
  | 12000009 | Authtoken is already timeout. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

## func updateSession(HuksHandle, HuksOptions, Bytes)

```cangjie
public func updateSession(handle: HuksHandle, options: HuksOptions, token: Bytes): Option<Bytes>
```

**Function:** The updateSession operation interface for keys. [security_huks.initSession](#func-initsessionstring-huksoptions), [security_huks.updateSession](#func-updatesessionhukshandle-huksoptions-arrayuint8), and [security_huks.finishSession](#func-finishsessionhukshandle-huksoptions-arrayuint8) form a three-stage interface that must be used together.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| handle | [HuksHandle](#class-hukshandle) | Yes | The handle for the updateSession operation. |
| options | [HuksOptions](#class-huksoptions) | Yes | The parameter set for updateSession. |
| token | Bytes | Yes | Represents the AuthToken value from the USER IAM service. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<Bytes> | Outputs the key update result. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [HUKS Error Codes](../../errorcodes/cj-errorcode-huks.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:--------|:-------------|
  | 401 | Argument is invalid. |
  | 801 | API is not supported. |
  | 12000001 | Algorithm mode is not supported. |
  | 12000002 | Algorithm parameter is missing. |
  | 12000003 | Algorithm parameter is invalid. |
  | 12000004 | Operating file failed. |
  | 12000005 | IPC communication failed. |
  | 12000006 | Error occurred in crypto engine. |
  | 12000007 | This credential is already invalidated permanently. |
  | 12000008 | Verify authtoken failed. |
  | 12000009 | Authtoken is already timeout. |
  | 12000011 | Queried entity does not exist. |
  | 12000012 | External error. |
  | 12000014 | Memory is insufficient. |

## class HuksAuthAccessType

```cangjie
public class HuksAuthAccessType {
    public static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD: HuksParamValue = HuksParamValue.uint32(1 << 0)
    public static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL: HuksParamValue = HuksParamValue.uint32(1 << 1)
}
```

**Function:** Represents security access control types.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD

```cangjie
public static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD: HuksParamValue = HuksParamValue.uint32(1 << 0)
```

**Function:** Indicates that the security access control type is invalidating the key after clearing the password.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL

```cangjie
public static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL: HuksParamValue = HuksParamValue.uint32(1 << 1)
```

**Function:** Indicates that the security access control type is invalidating the key after new biometric enrollment.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

## class HuksAuthStorageLevel

```cangjie
public class HuksAuthStorageLevel {
    public static const HUKS_AUTH_STORAGE_LEVEL_DE: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_AUTH_STORAGE_LEVEL_CE: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_AUTH_STORAGE_LEVEL_ECE: HuksParamValue = HuksParamValue.uint32(2)
}
```

**Function:** Specifies the storage security level of a key when generating or importing it.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AUTH_STORAGE_LEVEL_CE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_CE: HuksParamValue = HuksParamValue.uint32(1)
```

**Function:** Indicates that the key is accessible only after the first unlock.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AUTH_STORAGE_LEVEL_DE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_DE: HuksParamValue = HuksParamValue.uint32(0)
```

**Function:** Indicates that the key is accessible only after booting.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AUTH_STORAGE_LEVEL_ECE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_ECE: HuksParamValue = HuksParamValue.uint32(2)
```

**Function:** Indicates that the key is accessible only when the device is unlocked.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksChallengePosition

```cangjie
public class HuksChallengePosition {
    public static const HUKS_CHALLENGE_POS_0: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_CHALLENGE_POS_1: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_CHALLENGE_POS_2: HuksParamValue = HuksParamValue.uint32(2)
    public static const HUKS_CHALLENGE_POS_3: HuksParamValue = HuksParamValue.uint32(3)
}
```

**Function:** When the challenge type is user-defined, the generated challenge has an effective length of only 8 consecutive bytes of data, and only 4 positions are supported.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_POS_0

```cangjie
public static const HUKS_CHALLENGE_POS_0: HuksParamValue = HuksParamValue.uint32(0)
```

**Function:** Indicates that bytes 0~7 are the valid challenge for the current key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_POS_1

```cangjie
public static const HUKS_CHALLENGE_POS_1: HuksParamValue = HuksParamValue.uint32(1)
```

**Function:** Indicates that bytes 8~15 are the valid challenge for the current key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_POS_2

```cangjie
public static const HUKS_CHALLENGE_POS_2: HuksParamValue = HuksParamValue.uint32(2)
```

**Function:** Indicates that bytes 16~23 are the valid challenge for the current key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_POS_3

```cangjie
public static const HUKS_CHALLENGE_POS_3: HuksParamValue = HuksParamValue.uint32(3)
```

**Function:** Indicates that bytes 24~31 are the valid challenge for the current key.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

## class HuksChallengeType

```cangjie
public class HuksChallengeType {
    public static const HUKS_CHALLENGE_TYPE_NORMAL: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_CHALLENGE_TYPE_CUSTOM: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_CHALLENGE_TYPE_NONE: HuksParamValue = HuksParamValue.uint32(2)
}
```

**Function:** Represents the type of challenge generated when using a key.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_CHALLENGE_TYPE_CUSTOM

```cangjie
public static const HUKS_CHALLENGE_TYPE_CUSTOM: HuksParamValue = HuksParamValue.uint32(1)
```

**Function:** Indicates that the challenge is of a user-defined type. Supports one-time authentication for multiple keys.

**Type:** [HuksParamValue](#enum-huksparamvalue)
**System Capability:** SystemCapability.Security.Huks.Extension  

**Initial Version:** 21  

### static const HUKS_CHALLENGE_TYPE_NONE  

```cangjie  
public static const HUKS_CHALLENGE_TYPE_NONE: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Description:** Indicates the no-challenge type.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Initial Version:** 21  

### static const HUKS_CHALLENGE_TYPE_NORMAL  

```cangjie  
public static const HUKS_CHALLENGE_TYPE_NORMAL: HuksParamValue = HuksParamValue.uint32(0)  
```  

**Description:** Indicates the normal challenge type, with a default length of 32 bytes.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Initial Version:** 21  

## class HuksCipherMode  

```cangjie  
public class HuksCipherMode {  
    public static const HUKS_MODE_ECB: HuksParamValue = HuksParamValue.uint32(1)  
    public static const HUKS_MODE_CBC: HuksParamValue = HuksParamValue.uint32(2)  
    public static const HUKS_MODE_CTR: HuksParamValue = HuksParamValue.uint32(3)  
    public static const HUKS_MODE_OFB: HuksParamValue = HuksParamValue.uint32(4)  
    public static const HUKS_MODE_CCM: HuksParamValue = HuksParamValue.uint32(31)  
    public static const HUKS_MODE_GCM: HuksParamValue = HuksParamValue.uint32(32)  
}  
```  

**Description:** Represents encryption modes.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_MODE_CBC  

```cangjie  
public static const HUKS_MODE_CBC: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Description:** Indicates the CBC encryption mode.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_MODE_CCM  

```cangjie  
public static const HUKS_MODE_CCM: HuksParamValue = HuksParamValue.uint32(31)  
```  

**Description:** Indicates the CCM encryption mode.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_MODE_CTR  

```cangjie  
public static const HUKS_MODE_CTR: HuksParamValue = HuksParamValue.uint32(3)  
```  

**Description:** Indicates the CTR encryption mode.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_MODE_ECB  

```cangjie  
public static const HUKS_MODE_ECB: HuksParamValue = HuksParamValue.uint32(1)  
```  

**Description:** Indicates the ECB encryption mode.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_MODE_GCM  

```cangjie  
public static const HUKS_MODE_GCM: HuksParamValue = HuksParamValue.uint32(32)  
```  

**Description:** Indicates the GCM encryption mode.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_MODE_OFB  

```cangjie  
public static const HUKS_MODE_OFB: HuksParamValue = HuksParamValue.uint32(4)  
```  

**Description:** Indicates the OFB encryption mode.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

## class HuksExceptionErrCode  

```cangjie  
public class HuksExceptionErrCode {  
    public static const HUKS_ERR_CODE_PERMISSION_FAIL: Int32 = 201  
    public static const HUKS_ERR_CODE_ILLEGAL_ARGUMENT: Int32 = 401  
    public static const HUKS_ERR_CODE_NOT_SUPPORTED_API: Int32 = 801  
    public static const HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED: Int32 = 12000001  
    public static const HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT: Int32 = 12000002  
    public static const HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT: Int32 = 12000003  
    public static const HUKS_ERR_CODE_FILE_OPERATION_FAIL: Int32 = 12000004  
    public static const HUKS_ERR_CODE_COMMUNICATION_FAIL: Int32 = 12000005  
    public static const HUKS_ERR_CODE_CRYPTO_FAIL: Int32 = 12000006  
    public static const HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED: Int32 = 12000007  
    public static const HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED: Int32 = 12000008  
    public static const HUKS_ERR_CODE_KEY_AUTH_TIME_OUT: Int32 = 12000009  
    public static const HUKS_ERR_CODE_SESSION_LIMIT: Int32 = 12000010  
    public static const HUKS_ERR_CODE_ITEM_NOT_EXIST: Int32 = 12000011  
    public static const HUKS_ERR_CODE_EXTERNAL_ERROR: Int32 = 12000012  
    public static const HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST: Int32 = 12000013  
    public static const HUKS_ERR_CODE_INSUFFICIENT_MEMORY: Int32 = 12000014  
    public static const HUKS_ERR_CODE_CALL_SERVICE_FAILED: Int32 = 12000015  
}  
```  

**Description:** Represents error codes and corresponding error messages, where error codes indicate the type of error and error messages provide details.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_CALL_SERVICE_FAILED  

```cangjie  
public static const HUKS_ERR_CODE_CALL_SERVICE_FAILED: Int32 = 12000015  
```  

**Description:** Failed to call another system service.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_COMMUNICATION_FAIL  

```cangjie  
public static const HUKS_ERR_CODE_COMMUNICATION_FAIL: Int32 = 12000005  
```  

**Description:** Communication failure.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST  

```cangjie  
public static const HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST: Int32 = 12000013  
```  

**Description:** Required credential is missing.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_CRYPTO_FAIL  

```cangjie  
public static const HUKS_ERR_CODE_CRYPTO_FAIL: Int32 = 12000006  
```  

**Description:** Cryptographic library operation failed.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_EXTERNAL_ERROR  

```cangjie  
public static const HUKS_ERR_CODE_EXTERNAL_ERROR: Int32 = 12000012  
```  

**Description:** External error.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED  

```cangjie  
public static const HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED: Int32 = 12000001  
```  

**Description:** Unsupported feature/functionality.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_FILE_OPERATION_FAIL  

```cangjie  
public static const HUKS_ERR_CODE_FILE_OPERATION_FAIL: Int32 = 12000004  
```  

**Description:** File operation failed.  

**Type:** Int32  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_ILLEGAL_ARGUMENT  

```cangjie  
public static const HUKS_ERR_CODE_ILLEGAL_ARGUMENT: Int32 = 401  
```  

**Description:** Failed due to invalid parameters.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_INSUFFICIENT_MEMORY  

```cangjie  
public static const HUKS_ERR_CODE_INSUFFICIENT_MEMORY: Int32 = 12000014  
```  

**Description:** Insufficient memory.  

**System Capability:** SystemCapability.Security.Huks.Core**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT  

```cangjie  
public static const HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT: Int32 = 12000003  
```  

**Function:** Invalid cryptographic algorithm parameter.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_ITEM_NOT_EXIST  

```cangjie  
public static const HUKS_ERR_CODE_ITEM_NOT_EXIST: Int32 = 12000011  
```  

**Function:** Target object does not exist.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED  

```cangjie  
public static const HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED: Int32 = 12000007  
```  

**Function:** Key access failed - Key access permanently invalidated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_KEY_AUTH_TIME_OUT  

```cangjie  
public static const HUKS_ERR_CODE_KEY_AUTH_TIME_OUT: Int32 = 12000009  
```  

**Function:** Key access failed - Key access timeout.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED  

```cangjie  
public static const HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED: Int32 = 12000008  
```  

**Function:** Key access failed - Key authentication failed.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT  

```cangjie  
public static const HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT: Int32 = 12000002  
```  

**Function:** Missing cryptographic algorithm parameter.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_NOT_SUPPORTED_API  

```cangjie  
public static const HUKS_ERR_CODE_NOT_SUPPORTED_API: Int32 = 801  
```  

**Function:** Unsupported API.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_PERMISSION_FAIL  

```cangjie  
public static const HUKS_ERR_CODE_PERMISSION_FAIL: Int32 = 201  
```  

**Function:** Failure due to permission error.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

### static const HUKS_ERR_CODE_SESSION_LIMIT  

```cangjie  
public static const HUKS_ERR_CODE_SESSION_LIMIT: Int32 = 12000010  
```  

**Function:** Maximum number of key operation sessions reached.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** Int32  

**Initial Version:** 21  

## class HuksHandle  

```cangjie  
public class HuksHandle {}  
```  

**Function:** Represents a handle value.  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Initial Version:** 21  

## class HuksImportKeyType  

```cangjie  
public class HuksImportKeyType {  
    public static const HUKS_KEY_TYPE_PUBLIC_KEY: HuksParamValue = HuksParamValue.uint32(0)  
    public static const HUKS_KEY_TYPE_PRIVATE_KEY: HuksParamValue = HuksParamValue.uint32(1)  
    public static const HUKS_KEY_TYPE_KEY_PAIR: HuksParamValue = HuksParamValue.uint32(2)  
}  
```  

**Function:** Represents the key type for importing keys. Default is public key. This field is not required when importing symmetric keys.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_TYPE_KEY_PAIR  

```cangjie  
public static const HUKS_KEY_TYPE_KEY_PAIR: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Function:** Indicates the imported key type is a key pair (public-private key pair).  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_TYPE_PRIVATE_KEY  

```cangjie  
public static const HUKS_KEY_TYPE_PRIVATE_KEY: HuksParamValue = HuksParamValue.uint32(1)  
```  

**Function:** Indicates the imported key type is a private key.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_TYPE_PUBLIC_KEY  

```cangjie  
public static const HUKS_KEY_TYPE_PUBLIC_KEY: HuksParamValue = HuksParamValue.uint32(0)  
```  

**Function:** Indicates the imported key type is a public key.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

## class HuksKeyAlg  

```cangjie  
public class HuksKeyAlg {  
    public static const HUKS_ALG_RSA: HuksParamValue = HuksParamValue.uint32(1)  
    public static const HUKS_ALG_ECC: HuksParamValue = HuksParamValue.uint32(2)  
    public static const HUKS_ALG_DSA: HuksParamValue = HuksParamValue.uint32(3)  
    public static const HUKS_ALG_AES: HuksParamValue = HuksParamValue.uint32(20)  
    public static const HUKS_ALG_HMAC: HuksParamValue = HuksParamValue.uint32(50)  
    public static const HUKS_ALG_HKDF: HuksParamValue = HuksParamValue.uint32(51)  
    public static const HUKS_ALG_PBKDF2: HuksParamValue = HuksParamValue.uint32(52)  
    public static const HUKS_ALG_ECDH: HuksParamValue = HuksParamValue.uint32(100)  
    public static const HUKS_ALG_X25519: HuksParamValue = HuksParamValue.uint32(101)  
    public static const HUKS_ALG_ED25519: HuksParamValue = HuksParamValue.uint32(102)  
    public static const HUKS_ALG_DH: HuksParamValue = HuksParamValue.uint32(103)  
    public static const HUKS_ALG_SM2: HuksParamValue = HuksParamValue.uint32(150)  
    public static const HUKS_ALG_SM3: HuksParamValue = HuksParamValue.uint32(151)  
    public static const HUKS_ALG_SM4: HuksParamValue = HuksParamValue.uint32(152)  
}  
```  

**Function:** Represents the algorithm used by the key.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_ALG_AES  

```cangjie  
public static const HUKS_ALG_AES: HuksParamValue = HuksParamValue.uint32(20)  
```  

**Function:** Indicates the use of AES algorithm.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**Initial Version:** 21  

### static const HUKS_ALG_DH  

```cangjie  
public static const HUKS_ALG_DH: HuksParamValue = HuksParamValue.uint32(103)  
```  

**Function:** Indicates the use of DH algorithm.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**Initial Version:** 21  

### static const HUKS_ALG_DSA  

```cangjie  
public static const HUKS_ALG_DSA: HuksParamValue = HuksParamValue.uint32(3)  
```  

**Function:** Indicates the use of DSA algorithm.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**Initial Version:** 21  

### static const HUKS_ALG_ECC  

```cangjie  
public static const HUKS_ALG_ECC: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Function:** Indicates the use of ECC algorithm.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**Initial Version:** 21  

### static const HUKS_ALG_ECDH  

```cangjie  
public static const HUKS_ALG_ECDH: HuksParamValue = HuksParamValue.uint32(100)  
```  

**Function:** Indicates the use of ECDH algorithm.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**Initial Version:** 21  

### static const HUKS_ALG_ED25519
```cangjie
public static const HUKS_ALG_ED25519: HuksParamValue = HuksParamValue.uint32(102)
```

**Description:** Indicates the ED25519 algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

### static const HUKS_ALG_HKDF

```cangjie
public static const HUKS_ALG_HKDF: HuksParamValue = HuksParamValue.uint32(51)
```

**Description:** Indicates the HKDF algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

### static const HUKS_ALG_HMAC

```cangjie
public static const HUKS_ALG_HMAC: HuksParamValue = HuksParamValue.uint32(50)
```

**Description:** Indicates the HMAC algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

### static const HUKS_ALG_PBKDF2

```cangjie
public static const HUKS_ALG_PBKDF2: HuksParamValue = HuksParamValue.uint32(52)
```

**Description:** Indicates the PBKDF2 algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

### static const HUKS_ALG_RSA

```cangjie
public static const HUKS_ALG_RSA: HuksParamValue = HuksParamValue.uint32(1)
```

**Description:** Indicates the RSA algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

### static const HUKS_ALG_SM2

```cangjie
public static const HUKS_ALG_SM2: HuksParamValue = HuksParamValue.uint32(150)
```

**Description:** Indicates the SM2 algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

### static const HUKS_ALG_SM3

```cangjie
public static const HUKS_ALG_SM3: HuksParamValue = HuksParamValue.uint32(151)
```

**Description:** Indicates the SM3 algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

### static const HUKS_ALG_SM4

```cangjie
public static const HUKS_ALG_SM4: HuksParamValue = HuksParamValue.uint32(152)
```

**Description:** Indicates the SM4 algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

### static const HUKS_ALG_X25519

```cangjie
public static const HUKS_ALG_X25519: HuksParamValue = HuksParamValue.uint32(101)
```

**Description:** Indicates the X25519 algorithm.

**System Capability:** SystemCapability.Security.Huks.Core

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Since:** 21

## class HuksKeyDigest

```cangjie
public class HuksKeyDigest {
    public static const HUKS_DIGEST_NONE: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_DIGEST_MD5: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_DIGEST_SM3: HuksParamValue = HuksParamValue.uint32(2)
    public static const HUKS_DIGEST_SHA1: HuksParamValue = HuksParamValue.uint32(10)
    public static const HUKS_DIGEST_SHA224: HuksParamValue = HuksParamValue.uint32(11)
    public static const HUKS_DIGEST_SHA256: HuksParamValue = HuksParamValue.uint32(12)
    public static const HUKS_DIGEST_SHA384: HuksParamValue = HuksParamValue.uint32(13)
    public static const HUKS_DIGEST_SHA512: HuksParamValue = HuksParamValue.uint32(14)
}
```

**Description:** Indicates digest algorithms.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_MD5

```cangjie
public static const HUKS_DIGEST_MD5: HuksParamValue = HuksParamValue.uint32(1)
```

**Description:** Indicates the MD5 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_NONE

```cangjie
public static const HUKS_DIGEST_NONE: HuksParamValue = HuksParamValue.uint32(0)
```

**Description:** Indicates no digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA1

```cangjie
public static const HUKS_DIGEST_SHA1: HuksParamValue = HuksParamValue.uint32(10)
```

**Description:** Indicates the SHA1 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA224

```cangjie
public static const HUKS_DIGEST_SHA224: HuksParamValue = HuksParamValue.uint32(11)
```

**Description:** Indicates the SHA224 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA256

```cangjie
public static const HUKS_DIGEST_SHA256: HuksParamValue = HuksParamValue.uint32(12)
```

**Description:** Indicates the SHA256 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA384

```cangjie
public static const HUKS_DIGEST_SHA384: HuksParamValue = HuksParamValue.uint32(13)
```

**Description:** Indicates the SHA384 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SHA512

```cangjie
public static const HUKS_DIGEST_SHA512: HuksParamValue = HuksParamValue.uint32(14)
```

**Description:** Indicates the SHA512 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DIGEST_SM3

```cangjie
public static const HUKS_DIGEST_SM3: HuksParamValue = HuksParamValue.uint32(2)
```

**Description:** Indicates the SM3 digest algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeyFlag

```cangjie
public class HuksKeyFlag {
    public static const HUKS_KEY_FLAG_IMPORT_KEY: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_KEY_FLAG_GENERATE_KEY: HuksParamValue = HuksParamValue.uint32(2)
    public static const HUKS_KEY_FLAG_AGREE_KEY: HuksParamValue = HuksParamValue.uint32(3)
    public static const HUKS_KEY_FLAG_DERIVE_KEY: HuksParamValue = HuksParamValue.uint32(4)
}
```

**Description:** Indicates key generation methods.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_FLAG_AGREE_KEY

```cangjie
public static const HUKS_KEY_FLAG_AGREE_KEY: HuksParamValue = HuksParamValue.uint32(3)
```

**Description:** Indicates keys generated through key agreement interfaces.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_FLAG_DERIVE_KEY

```cangjie
public static const HUKS_KEY_FLAG_DERIVE_KEY: HuksParamValue = HuksParamValue.uint32(4)
```

**Description:** Indicates keys generated through key derivation interfaces.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21**Initial Version:** 21  

### static const HUKS_KEY_FLAG_GENERATE_KEY  

```cangjie  
public static const HUKS_KEY_FLAG_GENERATE_KEY: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Function:** Indicates a key generated via the key generation interface.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_FLAG_IMPORT_KEY  

```cangjie  
public static const HUKS_KEY_FLAG_IMPORT_KEY: HuksParamValue = HuksParamValue.uint32(1)  
```  

**Function:** Indicates a key imported via the public key import interface.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

## class HuksKeyGenerateType  

```cangjie  
public class HuksKeyGenerateType {  
    public static const HUKS_KEY_GENERATE_TYPE_DEFAULT: HuksParamValue = HuksParamValue.uint32(0)  
    public static const HUKS_KEY_GENERATE_TYPE_DERIVE: HuksParamValue = HuksParamValue.uint32(1)  
    public static const HUKS_KEY_GENERATE_TYPE_AGREE: HuksParamValue = HuksParamValue.uint32(2)  
}  
```  

**Function:** Indicates the type of key generation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_GENERATE_TYPE_AGREE  

```cangjie  
public static const HUKS_KEY_GENERATE_TYPE_AGREE: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Function:** A key generated via negotiation.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_GENERATE_TYPE_DEFAULT  

```cangjie  
public static const HUKS_KEY_GENERATE_TYPE_DEFAULT: HuksParamValue = HuksParamValue.uint32(0)  
```  

**Function:** A key generated by default.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_GENERATE_TYPE_DERIVE  

```cangjie  
public static const HUKS_KEY_GENERATE_TYPE_DERIVE: HuksParamValue = HuksParamValue.uint32(1)  
```  

**Function:** A key generated via derivation.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

## class HuksKeyPadding  

```cangjie  
public class HuksKeyPadding {  
    public static const HUKS_PADDING_NONE: HuksParamValue = HuksParamValue.uint32(0)  
    public static const HUKS_PADDING_OAEP: HuksParamValue = HuksParamValue.uint32(1)  
    public static const HUKS_PADDING_PSS: HuksParamValue = HuksParamValue.uint32(2)  
    public static const HUKS_PADDING_PKCS1_V1_5: HuksParamValue = HuksParamValue.uint32(3)  
    public static const HUKS_PADDING_PKCS5: HuksParamValue = HuksParamValue.uint32(4)  
    public static const HUKS_PADDING_PKCS7: HuksParamValue = HuksParamValue.uint32(5)  
}  
```  

**Function:** Indicates the padding algorithm.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_PADDING_NONE  

```cangjie  
public static const HUKS_PADDING_NONE: HuksParamValue = HuksParamValue.uint32(0)  
```  

**Function:** Indicates no padding algorithm is used.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_PADDING_OAEP  

```cangjie  
public static const HUKS_PADDING_OAEP: HuksParamValue = HuksParamValue.uint32(1)  
```  

**Function:** Indicates the OAEP padding algorithm is used.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_PADDING_PKCS1_V1_5  

```cangjie  
public static const HUKS_PADDING_PKCS1_V1_5: HuksParamValue = HuksParamValue.uint32(3)  
```  

**Function:** Indicates the PKCS1_V1_5 padding algorithm is used.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_PADDING_PKCS5  

```cangjie  
public static const HUKS_PADDING_PKCS5: HuksParamValue = HuksParamValue.uint32(4)  
```  

**Function:** Indicates the PKCS5 padding algorithm is used.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_PADDING_PKCS7  

```cangjie  
public static const HUKS_PADDING_PKCS7: HuksParamValue = HuksParamValue.uint32(5)  
```  

**Function:** Indicates the PKCS7 padding algorithm is used.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_PADDING_PSS  

```cangjie  
public static const HUKS_PADDING_PSS: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Function:** Indicates the PSS padding algorithm is used.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

## class HuksKeyPurpose  

```cangjie  
public class HuksKeyPurpose {  
    public static const HUKS_KEY_PURPOSE_ENCRYPT: HuksParamValue = HuksParamValue.uint32(1)  
    public static const HUKS_KEY_PURPOSE_DECRYPT: HuksParamValue = HuksParamValue.uint32(2)  
    public static const HUKS_KEY_PURPOSE_SIGN: HuksParamValue = HuksParamValue.uint32(4)  
    public static const HUKS_KEY_PURPOSE_VERIFY: HuksParamValue = HuksParamValue.uint32(8)  
    public static const HUKS_KEY_PURPOSE_DERIVE: HuksParamValue = HuksParamValue.uint32(16)  
    public static const HUKS_KEY_PURPOSE_WRAP: HuksParamValue = HuksParamValue.uint32(32)  
    public static const HUKS_KEY_PURPOSE_UNWRAP: HuksParamValue = HuksParamValue.uint32(64)  
    public static const HUKS_KEY_PURPOSE_MAC: HuksParamValue = HuksParamValue.uint32(128)  
    public static const HUKS_KEY_PURPOSE_AGREE: HuksParamValue = HuksParamValue.uint32(256)  
}  
```  

**Function:** Indicates the purpose of the key.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_PURPOSE_AGREE  

```cangjie  
public static const HUKS_KEY_PURPOSE_AGREE: HuksParamValue = HuksParamValue.uint32(256)  
```  

**Function:** Indicates the key is used for key agreement.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_PURPOSE_DECRYPT  

```cangjie  
public static const HUKS_KEY_PURPOSE_DECRYPT: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Function:** Indicates the key is used for decrypting ciphertext.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_PURPOSE_DERIVE  

```cangjie  
public static const HUKS_KEY_PURPOSE_DERIVE: HuksParamValue = HuksParamValue.uint32(16)  
```  

**Function:** Indicates the key is used for key derivation.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_PURPOSE_ENCRYPT  

```cangjie  
public static const HUKS_KEY_PURPOSE_ENCRYPT: HuksParamValue = HuksParamValue.uint32(1)  
```  

**Function:** Indicates the key is used for encrypting plaintext.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_PURPOSE_MAC  

```cangjie  
public static const HUKS_KEY_PURPOSE_MAC: HuksParamValue = HuksParamValue.uint32(128)  
```  

**Function:** Indicates the key is used for generating MAC (Message Authentication Code).  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static const HUKS_KEY_PURPOSE_SIGN
```cangjie
public static const HUKS_KEY_PURPOSE_SIGN: HuksParamValue = HuksParamValue.uint32(4)
```

**Function:** Indicates the key is used for data signing.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_UNWRAP

```cangjie
public static const HUKS_KEY_PURPOSE_UNWRAP: HuksParamValue = HuksParamValue.uint32(64)
```

**Function:** Indicates the key is used for encrypted import.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_VERIFY

```cangjie
public static const HUKS_KEY_PURPOSE_VERIFY: HuksParamValue = HuksParamValue.uint32(8)
```

**Function:** Indicates the key is used for verifying signed data.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_KEY_PURPOSE_WRAP

```cangjie
public static const HUKS_KEY_PURPOSE_WRAP: HuksParamValue = HuksParamValue.uint32(32)
```

**Function:** Indicates the key is used for encrypted export.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeySize

```cangjie
public class HuksKeySize {
    public static const HUKS_RSA_KEY_SIZE_512: HuksParamValue = HuksParamValue.uint32(512)
    public static const HUKS_RSA_KEY_SIZE_768: HuksParamValue = HuksParamValue.uint32(768)
    public static const HUKS_RSA_KEY_SIZE_1024: HuksParamValue = HuksParamValue.uint32(1024)
    public static const HUKS_RSA_KEY_SIZE_2048: HuksParamValue = HuksParamValue.uint32(2048)
    public static const HUKS_RSA_KEY_SIZE_3072: HuksParamValue = HuksParamValue.uint32(3072)
    public static const HUKS_RSA_KEY_SIZE_4096: HuksParamValue = HuksParamValue.uint32(4096)
    public static const HUKS_ECC_KEY_SIZE_224: HuksParamValue = HuksParamValue.uint32(224)
    public static const HUKS_ECC_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
    public static const HUKS_ECC_KEY_SIZE_384: HuksParamValue = HuksParamValue.uint32(384)
    public static const HUKS_ECC_KEY_SIZE_521: HuksParamValue = HuksParamValue.uint32(521)
    public static const HUKS_AES_KEY_SIZE_128: HuksParamValue = HuksParamValue.uint32(128)
    public static const HUKS_AES_KEY_SIZE_192: HuksParamValue = HuksParamValue.uint32(192)
    public static const HUKS_AES_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
    public static const HUKS_AES_KEY_SIZE_512: HuksParamValue = HuksParamValue.uint32(512)
    public static const HUKS_CURVE25519_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
    public static const HUKS_DH_KEY_SIZE_2048: HuksParamValue = HuksParamValue.uint32(2048)
    public static const HUKS_DH_KEY_SIZE_3072: HuksParamValue = HuksParamValue.uint32(3072)
    public static const HUKS_DH_KEY_SIZE_4096: HuksParamValue = HuksParamValue.uint32(4096)
    public static const HUKS_SM2_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
    public static const HUKS_SM4_KEY_SIZE_128: HuksParamValue = HuksParamValue.uint32(128)
}
```

**Function:** Represents the key size.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AES_KEY_SIZE_128

```cangjie
public static const HUKS_AES_KEY_SIZE_128: HuksParamValue = HuksParamValue.uint32(128)
```

**Function:** Indicates a 128-bit key size for the 3DES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AES_KEY_SIZE_192

```cangjie
public static const HUKS_AES_KEY_SIZE_192: HuksParamValue = HuksParamValue.uint32(192)
```

**Function:** Indicates a 192-bit key size for the AES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AES_KEY_SIZE_256

```cangjie
public static const HUKS_AES_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
```

**Function:** Indicates a 256-bit key size for the AES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_AES_KEY_SIZE_512

```cangjie
public static const HUKS_AES_KEY_SIZE_512: HuksParamValue = HuksParamValue.uint32(512)
```

**Function:** Indicates a 512-bit key size for the AES algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_CURVE25519_KEY_SIZE_256

```cangjie
public static const HUKS_CURVE25519_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
```

**Function:** Indicates a 256-bit key size for the CURVE25519 algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DH_KEY_SIZE_2048

```cangjie
public static const HUKS_DH_KEY_SIZE_2048: HuksParamValue = HuksParamValue.uint32(2048)
```

**Function:** Indicates a 2048-bit key size for the DH algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DH_KEY_SIZE_3072

```cangjie
public static const HUKS_DH_KEY_SIZE_3072: HuksParamValue = HuksParamValue.uint32(3072)
```

**Function:** Indicates a 3072-bit key size for the DH algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_DH_KEY_SIZE_4096

```cangjie
public static const HUKS_DH_KEY_SIZE_4096: HuksParamValue = HuksParamValue.uint32(4096)
```

**Function:** Indicates a 4096-bit key size for the DH algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ECC_KEY_SIZE_224

```cangjie
public static const HUKS_ECC_KEY_SIZE_224: HuksParamValue = HuksParamValue.uint32(224)
```

**Function:** Indicates a 224-bit key size for the ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ECC_KEY_SIZE_256

```cangjie
public static const HUKS_ECC_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
```

**Function:** Indicates a 256-bit key size for the ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ECC_KEY_SIZE_384

```cangjie
public static const HUKS_ECC_KEY_SIZE_384: HuksParamValue = HuksParamValue.uint32(384)
```

**Function:** Indicates a 384-bit key size for the ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_ECC_KEY_SIZE_521

```cangjie
public static const HUKS_ECC_KEY_SIZE_521: HuksParamValue = HuksParamValue.uint32(521)
```

**Function:** Indicates a 521-bit key size for the ECC algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_1024

```cangjie
public static const HUKS_RSA_KEY_SIZE_1024: HuksParamValue = HuksParamValue.uint32(1024)
```

**Function:** Indicates a 1024-bit key size for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_2048

```cangjie
public static const HUKS_RSA_KEY_SIZE_2048: HuksParamValue = HuksParamValue.uint32(2048)
```

**Function:** Indicates a 2048-bit key size for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_3072

```cangjie
public static const HUKS_RSA_KEY_SIZE_3072: HuksParamValue = HuksParamValue.uint32(3072)
```

**Function:** Indicates a 3072-bit key size for the RSA algorithm.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_4096
```cangjie
public static const HUKS_RSA_KEY_SIZE_4096: HuksParamValue = HuksParamValue.uint32(4096)
```

**Function:** Indicates the RSA algorithm key length is 4096 bits.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_512

```cangjie
public static const HUKS_RSA_KEY_SIZE_512: HuksParamValue = HuksParamValue.uint32(512)
```

**Function:** Indicates the RSA algorithm key length is 512 bits.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_KEY_SIZE_768

```cangjie
public static const HUKS_RSA_KEY_SIZE_768: HuksParamValue = HuksParamValue.uint32(768)
```

**Function:** Indicates the RSA algorithm key length is 768 bits.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_SM2_KEY_SIZE_256

```cangjie
public static const HUKS_SM2_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
```

**Function:** Indicates the SM2 algorithm key length is 256 bits.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_SM4_KEY_SIZE_128

```cangjie
public static const HUKS_SM4_KEY_SIZE_128: HuksParamValue = HuksParamValue.uint32(128)
```

**Function:** Indicates the SM4 algorithm key length is 128 bits.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksKeyStorageType

```cangjie
public class HuksKeyStorageType {
    public static const HUKS_STORAGE_TEMP: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_STORAGE_PERSISTENT: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_STORAGE_ONLY_USED_IN_HUKS: HuksParamValue = HuksParamValue.uint32(2)
    public static const HUKS_STORAGE_KEY_EXPORT_ALLOWED: HuksParamValue = HuksParamValue.uint32(3)
}
```

**Function:** Represents key storage methods.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_STORAGE_KEY_EXPORT_ALLOWED

```cangjie
public static const HUKS_STORAGE_KEY_EXPORT_ALLOWED: HuksParamValue = HuksParamValue.uint32(3)
```

**Function:** Indicates that the key derived from the master key is directly exported to the service provider, and HUKS does not provide hosting services for it.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_STORAGE_ONLY_USED_IN_HUKS

```cangjie
public static const HUKS_STORAGE_ONLY_USED_IN_HUKS: HuksParamValue = HuksParamValue.uint32(2)
```

**Function:** Indicates that the key derived from the master key is stored in HUKS and hosted by HUKS.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_STORAGE_PERSISTENT

```cangjie
public static const HUKS_STORAGE_PERSISTENT: HuksParamValue = HuksParamValue.uint32(1)
```

**Function:** Indicates that the key is managed through the HUKS service.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_STORAGE_TEMP

```cangjie
public static const HUKS_STORAGE_TEMP: HuksParamValue = HuksParamValue.uint32(0)
```

**Function:** Indicates that the key is managed locally.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksOptions

```cangjie
public class HuksOptions {
    public HuksOptions(
        public var properties: Option<Array<HuksParam>>,
        public var inData: Option<Array<UInt8>>
    )
    public static let NONE = HuksOptions(None, None)
}
```

**Function:** Options used for API calls.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static let NONE

```cangjie
public static let NONE: HuksOptions = HuksOptions(None, None)
```

**Function:** Obtains an empty HuksOptions instance.

**Type:** [HuksOptions](#class-huksoptions)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### var inData

```cangjie
public var inData: Option<Bytes>
```

**Function:** Input data.

**Type:** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]

**Access:** Readable and writable

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### var properties

```cangjie
public var properties: Option<Array<HuksParam>>
```

**Function:** Properties, used to store an array of HuksParam.

**Type:** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<[HuksParam](#class-huksparam)>>

**Access:** Readable and writable

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksOptions(Option\<Array\<HuksParam>>, Option\<Bytes>)

```cangjie
public HuksOptions(
    public var properties: Option<Array<HuksParam>>,
    public var inData: Option<Array<UInt8>>
)
```

**Function:** Constructs an options instance for API calls.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| properties | [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<[HuksParam](#class-huksparam)>> | No | - | Properties, used to store an array of HuksParam. |
| inData | [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes] | No | - | Input data. |

## class HuksParam

```cangjie
public class HuksParam {
    public HuksParam(
        public let tag: HuksTag,
        public let value: HuksParamValue
    )
}
```

**Function:** Element in the properties array of [HuksOptions](#class-huksoptions).

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### let tag

```cangjie
public let tag: HuksTag
```

**Function:** Tag.

**Type:** [HuksTag](#enum-hukstag)

**Access:** Read-only

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### let value

```cangjie
public let value: HuksParamValue
```

**Function:** Value corresponding to the tag.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**Access:** Read-only

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksParam(HuksTag, HuksParamValue)

```cangjie
public HuksParam(
    public let tag: HuksTag,
    public let value: HuksParamValue
)
```

**Function:** Constructs an element instance for the properties array in [HuksOptions](#class-huksoptions).

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Description |
|:---|:---|:---|:---|
| tag | [HuksTag](#enum-hukstag) | Yes | Tag. |
| value | [HuksParamValue](#enum-huksparamvalue) | Yes | Value corresponding to the tag. |

## class HuksReturnResult
```cangjie
public class HuksReturnResult {
    public HuksReturnResult(
        public let outData: Option<Array<UInt8>>,
        public let properties: Option<Array<HuksParam>>,
        public let certChains: Option<Array<String>>
    )
}
```

**Function:** Represents the interface return result, storing returned data.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### let certChains

```cangjie
public let certChains: Option<Array<String>>
```

**Function:** Represents certificate chain data.

**Type:** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<String>>

**Access:** Read-only

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### let outData

```cangjie
public let outData: Option<Bytes>
```

**Function:** Represents output data.

**Type:** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]>

**Access:** Read-only

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### let properties

```cangjie
public let properties: Option<Array<HuksParam>>
```

**Function:** Represents property information.

**Type:** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<[HuksParam](#class-huksparam)>>

**Access:** Read-only

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksReturnResult(Option\<Bytes>, Option\<Array\<HuksParam>>, Option\<Array\<String>>)

```cangjie
public HuksReturnResult(
    public let outData: Option<Array<UInt8>>,
    public let properties: Option<Array<HuksParam>>,
    public let certChains: Option<Array<String>>
)
```

**Function:** Constructs a HuksReturnResult instance.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| outData | [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]> | No | - | Represents output data. |
| properties | [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<[HuksParam](#class-huksparam)>> | No | - | Represents property information. |
| certChains | [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<String>> | No | - | Represents certificate chain data. |

## class HuksRsaPssSaltLenType

```cangjie
public class HuksRsaPssSaltLenType {
    public static const HUKS_RSA_PSS_SALT_LEN_DIGEST: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_RSA_PSS_SALT_LEN_MAX: HuksParamValue = HuksParamValue.uint32(1)
}
```

**Function:** Represents the salt_len type required when RSA performs signing or verification with PSS padding.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_PSS_SALT_LEN_DIGEST

```cangjie
public static const HUKS_RSA_PSS_SALT_LEN_DIGEST: HuksParamValue = HuksParamValue.uint32(0)
```

**Function:** Sets salt_len using digest length.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_RSA_PSS_SALT_LEN_MAX

```cangjie
public static const HUKS_RSA_PSS_SALT_LEN_MAX: HuksParamValue = HuksParamValue.uint32(1)
```

**Function:** Sets salt_len using maximum length.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksSecureSignType

```cangjie
public class HuksSecureSignType {
    public static const HUKS_SECURE_SIGN_WITH_AUTHINFO: HuksParamValue = HuksParamValue.uint32(1)
}
```

**Function:** Specifies the signature type of a key during generation or import.

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

### static const HUKS_SECURE_SIGN_WITH_AUTHINFO

```cangjie
public static const HUKS_SECURE_SIGN_WITH_AUTHINFO: HuksParamValue = HuksParamValue.uint32(1)
```

**Function:** Indicates the signature type includes authentication information. When specified during key generation or import, authentication information will be added to the data before signing.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Extension

**Since:** 21

## class HuksSendType

```cangjie
public class HuksSendType {
    public static const HUKS_SEND_TYPE_ASYNC: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_SEND_TYPE_SYNC: HuksParamValue = HuksParamValue.uint32(1)
}
```

**Function:** Represents the method of sending Tags.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_SEND_TYPE_ASYNC

```cangjie
public static const HUKS_SEND_TYPE_ASYNC: HuksParamValue = HuksParamValue.uint32(0)
```

**Function:** Indicates asynchronous Tag sending.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_SEND_TYPE_SYNC

```cangjie
public static const HUKS_SEND_TYPE_SYNC: HuksParamValue = HuksParamValue.uint32(1)
```

**Function:** Indicates synchronous Tag sending.

**Type:** [HuksParamValue](#enum-huksparamvalue)

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

## class HuksSessionHandle

```cangjie
public class HuksSessionHandle {
    public HuksSessionHandle(
        public let handle: HuksHandle,
        public let challenge: Option<Array<UInt8>>
    )
}
```

**Function:** Represents the huks Handle structure.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### let challenge

```cangjie
public let challenge: Option<Bytes>
```

**Function:** Represents the challenge information obtained after [initSession](#func-initsessionstring-huksoptions) operation.

**Type:** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]>

**Access:** Read-only

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### let handle

```cangjie
public let handle: HuksHandle
```

**Function:** Represents the handle value.

**Type:** [HuksHandle](#class-hukshandle)

**Access:** Read-only

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### HuksSessionHandle(HuksHandle, Option\<Bytes>)

```cangjie
public HuksSessionHandle(
    public let handle: HuksHandle,
    public let challenge: Option<Array<UInt8>>
)
```

**Function:** Constructs a HuksSessionHandle instance.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| handle | [HuksHandle](#class-hukshandle) | No | - | Represents the handle value. |
| challenge | [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]> | No | - | Represents the challenge information obtained after [initSession](#func-initsessionstring-huksoptions) operation. |

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

**Function:** Represents the data type of a Tag.

**System Capability:** SystemCapability.Security.Huks.Core

**Since:** 21

### static const HUKS_TAG_TYPE_BOOL

```cangjie
public static const HUKS_TAG_TYPE_BOOL: UInt32 = 4 << 28
```

**Function:** Indicates the Tag's data type is boolean.
**Type:** UInt32  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### static const HUKS_TAG_TYPE_BYTES  

```cangjie  
public static const HUKS_TAG_TYPE_BYTES: UInt32 = 5 << 28  
```  

**Description:** Indicates the data type of this Tag is Uint8Array.  

**Type:** UInt32  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### static const HUKS_TAG_TYPE_INT  

```cangjie  
public static const HUKS_TAG_TYPE_INT: UInt32 = 1 << 28  
```  

**Description:** Indicates the data type of this Tag is UInt32.  

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

**Description:** Indicates the data type of this Tag is UInt32.  

**Type:** UInt32  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### static const HUKS_TAG_TYPE_ULONG  

```cangjie  
public static const HUKS_TAG_TYPE_ULONG: UInt32 = 3 << 28  
```  

**Description:** Indicates the data type of this Tag is bigint.  

**Type:** UInt32  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

## class HuksUnwrapSuite  

```cangjie  
public class HuksUnwrapSuite {  
    public static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(1)  
    public static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(2)  
}  
```  

**Description:** Represents the algorithm suite for importing encrypted keys.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING  

```cangjie  
public static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(2)  
```  

**Description:** When importing an encrypted key, uses AES-256 GCM encryption after ECDH key agreement.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING  

```cangjie  
public static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(1)  
```  

**Description:** When importing an encrypted key, uses AES-256 GCM encryption after X25519 key agreement.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

## class HuksUserAuthType  

```cangjie  
public class HuksUserAuthType {  
    public static const HUKS_USER_AUTH_TYPE_FINGERPRINT: HuksParamValue = HuksParamValue.uint32(1 << 0)  
    public static const HUKS_USER_AUTH_TYPE_FACE: HuksParamValue = HuksParamValue.uint32(1 << 1)  
    public static const HUKS_USER_AUTH_TYPE_PIN: HuksParamValue = HuksParamValue.uint32(1 << 2)  
}  
```  

**Description:** Represents user authentication types.  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Since:** 21  

### static const HUKS_USER_AUTH_TYPE_FACE  

```cangjie  
public static const HUKS_USER_AUTH_TYPE_FACE: HuksParamValue = HuksParamValue.uint32(1 << 1)  
```  

**Description:** Indicates the user authentication type is facial recognition.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Since:** 21  

### static const HUKS_USER_AUTH_TYPE_FINGERPRINT  

```cangjie  
public static const HUKS_USER_AUTH_TYPE_FINGERPRINT: HuksParamValue = HuksParamValue.uint32(1 << 0)  
```  

**Description:** Indicates the user authentication type is fingerprint.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Since:** 21  

### static const HUKS_USER_AUTH_TYPE_PIN  

```cangjie  
public static const HUKS_USER_AUTH_TYPE_PIN: HuksParamValue = HuksParamValue.uint32(1 << 2)  
```  

**Description:** Indicates the user authentication type is PIN.  

**Type:** [HuksParamValue](#enum-huksparamvalue)  

**System Capability:** SystemCapability.Security.Huks.Extension  

**Since:** 21  

## enum HuksParamValue  

```cangjie  
public enum HuksParamValue {  
    | boolean(Bool)  
    | int32(Int32)  
    | uint32(UInt32)  
    | uint64(UInt64)  
    | bytes(Bytes)  
    | ...  
}  
```  

**Description:** Used to represent the value of `value` in HuksParam, supporting Bool, Int32, UInt32, UInt64, and Array\<UInt8> formats.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### boolean(Bool)  

```cangjie  
boolean(Bool)  
```  

**Description:** This field is used to pass a Bool-type value.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### bytes(Bytes)  

```cangjie  
bytes(Bytes)  
```  

**Description:** This field is used to pass an Array\<Bytes>-type value.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### int32(Int32)  

```cangjie  
int32(Int32)  
```  

**Description:** This field is used to pass an Int32-type value.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### uint32(UInt32)  

```cangjie  
uint32(UInt32)  
```  

**Description:** This field is used to pass a UInt32-type value.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### uint64(UInt64)  

```cangjie  
uint64(UInt64)  
```  

**Description:** This field is used to pass a UInt64-type value.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

### func toBool()  

```cangjie  
public func toBool(): Option<Bool>  
```  

**Description:** Gets the Bool value of HuksParamValue.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Bool> | Returns the Bool value of HuksParamValue. |  

### func toBytes()  

```cangjie  
public func toBytes(): Option<Bytes>  
```  

**Description:** Gets the Array\<Bytes> value of HuksParamValue.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]> | Returns the Bytes value of HuksParamValue. |  

### func toInt32()  

```cangjie  
public func toInt32(): Option<Int32>  
```  

**Description:** Gets the Int32 value of HuksParamValue.**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Int32> | Returns the Int32 value of HuksParamValue. |  

### func toUInt32()  

```cangjie  
public func toUInt32(): Option<UInt32>  
```  

**Function:** Gets the UInt32 value of HuksParamValue.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<UInt32> | Returns the UInt32 value of HuksParamValue. |  

### func toUInt64()  

```cangjie  
public func toUInt64(): Option<UInt64>  
```  

**Function:** Gets the UInt64 value of HuksParamValue.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<UInt64> | Returns the UInt64 value of HuksParamValue. |  

### func |(HuksParamValue)  

```cangjie  
public operator func |(other: HuksParamValue): HuksParamValue  
```  

**Function:** Performs a bitwise OR operation between the UInt32 value of the current HuksParamValue and another HuksParamValue's UInt32 value.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [HuksParamValue](#enum-huksparamvalue) | Yes | - | The HuksParamValue to perform the OR operation with. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [HuksParamValue](#enum-huksparamvalue) | Returns the HuksParamValue after the OR operation. |  

## enum HuksTag  

```cangjie  
public enum HuksTag {  
    | HUKS_TAGS_CANGJIE_UNKNOWN(UInt32)  
    | HUKS_TAG_INVALID  
    | HUKS_TAG_ALGORITHM  
    | HUKS_TAG_PURPOSE  
    | HUKS_TAG_KEY_SIZE  
    | HUKS_TAG_DIGEST  
    | HUKS_TAG_PADDING  
    | HUKS_TAG_BLOCK_MODE  
    | HUKS_TAG_KEY_TYPE  
    | HUKS_TAG_ASSOCIATED_DATA  
    | HUKS_TAG_NONCE  
    | HUKS_TAG_IV  
    | HUKS_TAG_INFO  
    | HUKS_TAG_SALT  
    | HUKS_TAG_PWD  
    | HUKS_TAG_ITERATION  
    | HUKS_TAG_KEY_GENERATE_TYPE  
    | HUKS_TAG_DERIVE_MAIN_KEY  
    | HUKS_TAG_DERIVE_FACTOR  
    | HUKS_TAG_DERIVE_ALG  
    | HUKS_TAG_AGREE_ALG  
    | HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS  
    | HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS  
    | HUKS_TAG_AGREE_PUBLIC_KEY  
    | HUKS_TAG_KEY_ALIAS  
    | HUKS_TAG_DERIVE_KEY_SIZE  
    | HUKS_TAG_IMPORT_KEY_TYPE  
    | HUKS_TAG_UNWRAP_ALGORITHM_SUITE  
    | HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG  
    | HUKS_TAG_RSA_PSS_SALT_LEN_TYPE  
    | HUKS_TAG_ACTIVE_DATETIME  
    | HUKS_TAG_ORIGINATION_EXPIRE_DATETIME  
    | HUKS_TAG_USAGE_EXPIRE_DATETIME  
    | HUKS_TAG_CREATION_DATETIME  
    | HUKS_TAG_ALL_USERS  
    | HUKS_TAG_USER_ID  
    | HUKS_TAG_NO_AUTH_REQUIRED  
    | HUKS_TAG_USER_AUTH_TYPE  
    | HUKS_TAG_AUTH_TIMEOUT  
    | HUKS_TAG_AUTH_TOKEN  
    | HUKS_TAG_KEY_AUTH_ACCESS_TYPE  
    | HUKS_TAG_KEY_SECURE_SIGN_TYPE  
    | HUKS_TAG_CHALLENGE_TYPE  
    | HUKS_TAG_CHALLENGE_POS  
    | HUKS_TAG_KEY_AUTH_PURPOSE  
    | HUKS_TAG_ATTESTATION_CHALLENGE  
    | HUKS_TAG_ATTESTATION_APPLICATION_ID  
    | HUKS_TAG_ATTESTATION_ID_BRAND  
    | HUKS_TAG_ATTESTATION_ID_DEVICE  
    | HUKS_TAG_ATTESTATION_ID_PRODUCT  
    | HUKS_TAG_ATTESTATION_ID_SERIAL  
    | HUKS_TAG_ATTESTATION_ID_IMEI  
    | HUKS_TAG_ATTESTATION_ID_MEID  
    | HUKS_TAG_ATTESTATION_ID_MANUFACTURER  
    | HUKS_TAG_ATTESTATION_ID_MODEL  
    | HUKS_TAG_ATTESTATION_ID_ALIAS  
    | HUKS_TAG_ATTESTATION_ID_SOCID  
    | HUKS_TAG_ATTESTATION_ID_UDID  
    | HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO  
    | HUKS_TAG_ATTESTATION_ID_VERSION_INFO  
    | HUKS_TAG_ATTESTATION_BASE64  
    | HUKS_TAG_ATTESTATION_MODE  
    | HUKS_TAG_ATTESTATION_APPLICATION_ID_TYPE  
    | HUKS_TAG_IS_KEY_ALIAS  
    | HUKS_TAG_KEY_STORAGE_FLAG  
    | HUKS_TAG_IS_ALLOWED_WRAP  
    | HUKS_TAG_KEY_WRAP_TYPE  
    | HUKS_TAG_KEY_AUTH_ID  
    | HUKS_TAG_KEY_ROLE  
    | HUKS_TAG_KEY_FLAG  
    | HUKS_TAG_IS_ASYNCHRONIZED  
    | HUKS_TAG_SECURE_KEY_ALIAS  
    | HUKS_TAG_SECURE_KEY_UUID  
    | HUKS_TAG_KEY_DOMAIN  
    | HUKS_TAG_PROCESS_NAME  
    | HUKS_TAG_PACKAGE_NAME  
    | HUKS_TAG_ACCESS_TIME  
    | HUKS_TAG_USES_TIME  
    | HUKS_TAG_CRYPTO_CTX  
    | HUKS_TAG_KEY  
    | HUKS_TAG_KEY_VERSION  
    | HUKS_TAG_PAYLOAD_LEN  
    | HUKS_TAG_AE_TAG  
    | HUKS_TAG_IS_KEY_HANDLE  
    | HUKS_TAG_OS_VERSION  
    | HUKS_TAG_OS_PATCHLEVEL  
    | HUKS_TAG_SYMMETRIC_KEY_DATA  
    | HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA  
    | HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA  
}  
```  

**Function:** Represents the tags for calling parameters.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAGS_CANGJIE_UNKNOWN(UInt32)  

```cangjie  
HUKS_TAGS_CANGJIE_UNKNOWN(UInt32)  
```  

**Function:** Compatible with tags whose values fall outside the known enumeration range.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ACCESS_TIME  

```cangjie  
HUKS_TAG_ACCESS_TIME  
```  

**Function:** Originally reserved, now deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ACTIVE_DATETIME  

```cangjie  
HUKS_TAG_ACTIVE_DATETIME  
```  

**Function:** Originally reserved for certificate services, now deprecated as certificate management has been separated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_AE_TAG  

```cangjie  
HUKS_TAG_AE_TAG  
```  

**Function:** Used for passing AEAD data in GCM mode.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_AGREE_ALG  

```cangjie  
HUKS_TAG_AGREE_ALG  
```  

**Function:** Represents the algorithm type for key agreement.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS  

```cangjie  
HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS  
```  

**Function:** Represents the private key alias for key agreement.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_AGREE_PUBLIC_KEY  

```cangjie  
HUKS_TAG_AGREE_PUBLIC_KEY  
```  

**Function:** Represents the public key for key agreement.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS  

```cangjie  
HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS  
```  

**Function:** Represents the public key alias for key agreement.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ALGORITHM  

```cangjie  
HUKS_TAG_ALGORITHM  
```  

**Function:** Represents the tag for algorithms.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ALL_USERS  

```cangjie  
HUKS_TAG_ALL_USERS  
```  

**Function:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ASSOCIATED_DATA  

```cangjie  
HUKS_TAG_ASSOCIATED_DATA  
```  

**Function:** Represents the tag for additional authenticated data.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA  

```cangjie  
HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA  
```  

**Functionality:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA  

```cangjie  
HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA  
```  

**Functionality:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_APPLICATION_ID  

```cangjie  
HUKS_TAG_ATTESTATION_APPLICATION_ID  
```  

**Functionality:** Represents the ID of the application that owns the key during attestation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_APPLICATION_ID_TYPE  

```cangjie  
HUKS_TAG_ATTESTATION_APPLICATION_ID_TYPE  
```  

**Functionality:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_BASE64  

```cangjie  
HUKS_TAG_ATTESTATION_BASE64  
```  

**Functionality:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_CHALLENGE  

```cangjie  
HUKS_TAG_ATTESTATION_CHALLENGE  
```  

**Functionality:** Represents the challenge value during attestation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_ALIAS  

```cangjie  
HUKS_TAG_ATTESTATION_ID_ALIAS  
```  

**Functionality:** Represents the key alias during attestation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_BRAND  

```cangjie  
HUKS_TAG_ATTESTATION_ID_BRAND  
```  

**Functionality:** Represents the device brand. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_DEVICE  

```cangjie  
HUKS_TAG_ATTESTATION_ID_DEVICE  
```  

**Functionality:** Represents the device ID. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_IMEI  

```cangjie  
HUKS_TAG_ATTESTATION_ID_IMEI  
```  

**Functionality:** Represents the device IMEI number. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_MANUFACTURER  

```cangjie  
HUKS_TAG_ATTESTATION_ID_MANUFACTURER  
```  

**Functionality:** Represents the device manufacturer. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_MEID  

```cangjie  
HUKS_TAG_ATTESTATION_ID_MEID  
```  

**Functionality:** Represents the device MEID number. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_MODEL  

```cangjie  
HUKS_TAG_ATTESTATION_ID_MODEL  
```  

**Functionality:** Represents the device model. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_PRODUCT  

```cangjie  
HUKS_TAG_ATTESTATION_ID_PRODUCT  
```  

**Functionality:** Represents the device product name. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO  

```cangjie  
HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO  
```  

**Functionality:** Represents the security credentials during attestation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_SERIAL  

```cangjie  
HUKS_TAG_ATTESTATION_ID_SERIAL  
```  

**Functionality:** Represents the device serial number. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_SOCID  

```cangjie  
HUKS_TAG_ATTESTATION_ID_SOCID  
```  

**Functionality:** Represents the device SOCID. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_UDID  

```cangjie  
HUKS_TAG_ATTESTATION_ID_UDID  
```  

**Functionality:** Represents the device UDID. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_ID_VERSION_INFO  

```cangjie  
HUKS_TAG_ATTESTATION_ID_VERSION_INFO  
```  

**Functionality:** Represents the version number during attestation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ATTESTATION_MODE  

```cangjie  
HUKS_TAG_ATTESTATION_MODE  
```  

**Functionality:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_AUTH_TIMEOUT  

```cangjie  
HUKS_TAG_AUTH_TIMEOUT  
```  

**Functionality:** Represents the single-use validity period of the auth token.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_AUTH_TOKEN  

```cangjie  
HUKS_TAG_AUTH_TOKEN  
```  

**Functionality:** Field used to pass the authToken.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_BLOCK_MODE  

```cangjie  
HUKS_TAG_BLOCK_MODE  
```  

**Functionality:** Represents the tag for encryption mode.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_CHALLENGE_POS  

```cangjie  
HUKS_TAG_CHALLENGE_POS  
```  

**Functionality:** When the challenge type is user-defined, the effective length of the challenge generated by Huks is only 8 bytes of consecutive data. Selected from [HuksChallengePosition](#class-hukschallengeposition).  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_CHALLENGE_TYPE  

```cangjie  
HUKS_TAG_CHALLENGE_TYPE  
```  

**Functionality:** Represents the type of challenge generated during key usage. Selected from [HuksChallengeType](#class-hukschallengetype).  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_CREATION_DATETIME  

```cangjie 
HUKS_TAG_CREATION_DATETIME  
```  

**Description:** Originally reserved for certificate services. Now that certificate management has been decoupled, this field is deprecated and no longer reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_CRYPTO_CTX  

```cangjie
HUKS_TAG_CRYPTO_CTX  
```  

**Description:** Originally a reserved field, now deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG  

```cangjie
HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG  
```  

**Description:** Indicates the storage type of derived/agreed keys.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_DERIVE_ALG  

```cangjie
HUKS_TAG_DERIVE_ALG  
```  

**Description:** Indicates the algorithm type for key derivation. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_DERIVE_FACTOR  

```cangjie
HUKS_TAG_DERIVE_FACTOR  
```  

**Description:** Indicates the derivation factor for key derivation. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_DERIVE_KEY_SIZE  

```cangjie
HUKS_TAG_DERIVE_KEY_SIZE  
```  

**Description:** Indicates the size of the derived key.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_DERIVE_MAIN_KEY  

```cangjie
HUKS_TAG_DERIVE_MAIN_KEY  
```  

**Description:** Indicates the master key for key derivation. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_DIGEST  

```cangjie
HUKS_TAG_DIGEST  
```  

**Description:** Represents the tag for digest algorithms.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_IMPORT_KEY_TYPE  

```cangjie
HUKS_TAG_IMPORT_KEY_TYPE  
```  

**Description:** Indicates the type of imported keys.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_INFO  

```cangjie
HUKS_TAG_INFO  
```  

**Description:** Represents the info parameter for key derivation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_INVALID  

```cangjie
HUKS_TAG_INVALID  
```  

**Description:** Indicates an invalid tag. Deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_IS_ALLOWED_WRAP  

```cangjie
HUKS_TAG_IS_ALLOWED_WRAP  
```  

**Description:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_IS_ASYNCHRONIZED  

```cangjie
HUKS_TAG_IS_ASYNCHRONIZED  
```  

**Description:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_IS_KEY_ALIAS  

```cangjie
HUKS_TAG_IS_KEY_ALIAS  
```  

**Description:** Indicates whether to use the alias passed during key generation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_IS_KEY_HANDLE  

```cangjie
HUKS_TAG_IS_KEY_HANDLE  
```  

**Description:** Originally a reserved field, now deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ITERATION  

```cangjie
HUKS_TAG_ITERATION  
```  

**Description:** Indicates the iteration count for key derivation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_IV  

```cangjie
HUKS_TAG_IV  
```  

**Description:** Represents the initialization vector for key initialization.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY  

```cangjie
HUKS_TAG_KEY  
```  

**Description:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_ALIAS  

```cangjie
HUKS_TAG_KEY_ALIAS  
```  

**Description:** Represents the key alias.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_AUTH_ACCESS_TYPE  

```cangjie
HUKS_TAG_KEY_AUTH_ACCESS_TYPE  
```  

**Description:** Indicates the secure access control type. Selected from [HuksAuthAccessType](#class-huksauthaccesstype) and must be set concurrently with the user authentication type.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_AUTH_ID  

```cangjie
HUKS_TAG_KEY_AUTH_ID  
```  

**Description:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_AUTH_PURPOSE  

```cangjie
HUKS_TAG_KEY_AUTH_PURPOSE  
```  

**Description:** Represents the tag for key authentication purposes.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_DOMAIN  

```cangjie
HUKS_TAG_KEY_DOMAIN  
```  

**Description:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_FLAG  

```cangjie
HUKS_TAG_KEY_FLAG  
```  

**Description:** Represents the tag for key flags.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_GENERATE_TYPE  

```cangjie
HUKS_TAG_KEY_GENERATE_TYPE  
```  

**Description:** Represents the tag for key generation types.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_ROLE  

```cangjie  
HUKS_TAG_KEY_ROLE  
```  

**Description:** Reserved  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_SECURE_SIGN_TYPE  

```cangjie  
HUKS_TAG_KEY_SECURE_SIGN_TYPE  
```  

**Description:** Specifies the signature type of the key during generation or import.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_SIZE  

```cangjie  
HUKS_TAG_KEY_SIZE  
```  

**Description:** Tag indicating the key length.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_STORAGE_FLAG  

```cangjie  
HUKS_TAG_KEY_STORAGE_FLAG  
```  

**Description:** Tag indicating the key storage method.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_TYPE  

```cangjie  
HUKS_TAG_KEY_TYPE  
```  

**Description:** Tag indicating the key type.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_VERSION  

```cangjie  
HUKS_TAG_KEY_VERSION  
```  

**Description:** Tag indicating the key version. (Deprecated)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_KEY_WRAP_TYPE  

```cangjie  
HUKS_TAG_KEY_WRAP_TYPE  
```  

**Description:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_NONCE  

```cangjie  
HUKS_TAG_NONCE  
```  

**Description:** Field used for key encryption/decryption.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_NO_AUTH_REQUIRED  

```cangjie  
HUKS_TAG_NO_AUTH_REQUIRED  
```  

**Description:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_ORIGINATION_EXPIRE_DATETIME  

```cangjie  
HUKS_TAG_ORIGINATION_EXPIRE_DATETIME  
```  

**Description:** Originally reserved for certificate services. Now deprecated as certificate management has been separated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_OS_PATCHLEVEL  

```cangjie  
HUKS_TAG_OS_PATCHLEVEL  
```  

**Description:** Tag indicating the operating system patch level. (Deprecated)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_OS_VERSION  

```cangjie  
HUKS_TAG_OS_VERSION  
```  

**Description:** Tag indicating the operating system version. (Deprecated)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_PACKAGE_NAME  

```cangjie  
HUKS_TAG_PACKAGE_NAME  
```  

**Description:** Originally reserved. Now deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_PADDING  

```cangjie  
HUKS_TAG_PADDING  
```  

**Description:** Tag indicating the padding algorithm.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_PAYLOAD_LEN  

```cangjie  
HUKS_TAG_PAYLOAD_LEN  
```  

**Description:** Originally reserved. Now deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_PROCESS_NAME  

```cangjie  
HUKS_TAG_PROCESS_NAME  
```  

**Description:** Tag indicating the process name. (Deprecated)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_PURPOSE  

```cangjie  
HUKS_TAG_PURPOSE  
```  

**Description:** Tag indicating the key purpose.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_PWD  

```cangjie  
HUKS_TAG_PWD  
```  

**Description:** Password used during key derivation. (Deprecated)  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_RSA_PSS_SALT_LEN_TYPE  

```cangjie  
HUKS_TAG_RSA_PSS_SALT_LEN_TYPE  
```  

**Description:** Indicates the type of `rsa_pss_salt_length`.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_SALT  

```cangjie  
HUKS_TAG_SALT  
```  

**Description:** Salt value used during key derivation.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_SECURE_KEY_ALIAS  

```cangjie  
HUKS_TAG_SECURE_KEY_ALIAS  
```  

**Description:** Originally reserved. Now deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_SECURE_KEY_UUID  

```cangjie  
HUKS_TAG_SECURE_KEY_UUID  
```  

**Description:** Originally reserved. Now deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_SYMMETRIC_KEY_DATA  

```cangjie  
HUKS_TAG_SYMMETRIC_KEY_DATA  
```  

**Description:** Reserved.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_UNWRAP_ALGORITHM_SUITE  

```cangjie  
HUKS_TAG_UNWRAP_ALGORITHM_SUITE  
```  

**Description:** Indicates the suite for importing encrypted keys.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_USAGE_EXPIRE_DATETIME  

```cangjie  
HUKS_TAG_USAGE_EXPIRE_DATETIME  
```  

**Description:** Originally reserved for certificate services. Now deprecated as certificate management has been separated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_USER_AUTH_TYPE  

```cangjie  
HUKS_TAG_USER_AUTH_TYPE  
```  

**Description:** Indicates the user authentication type. Selected from [HuksUserAuthType](#class-huksuserauthtype), it must be set together with the secure access control type. Supports specifying two user authentication types simultaneously. For example: when the secure access control type is specified as `HUKS_SECURE_ACCESS_INVALID_NEW_BIO_ENROLL`, the key access authentication type can be specified as one of the following three: `HUKS_USER_AUTH_TYPE_FACE`, `HUKS_USER_AUTH_TYPE_FINGERPRINT`, or `HUKS_USER_AUTH_TYPE_FACE MagIc_StrINg HUKS_USER_AUTH_TYPE_FINGERPRINT`.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_USER_ID  

```cangjie  
HUKS_TAG_USER_ID  
```  

**Description:** Indicates which userID the current key belongs to.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### HUKS_TAG_USES_TIME  

```cangjie  
HUKS_TAG_USES_TIME  
```  

**Description:** Originally a reserved field, now deprecated.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

### static func parse(UInt32)  

```cangjie  
public static func parse(val: UInt32): HuksTag  
```  

**Description:** Constructs a `HuksTag` from a UInt32 value.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---------|:-----|:---------|:-------------|:------------|  
| val | UInt32 | Yes | - | The UInt32 value corresponding to the `HuksTag` to be constructed. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| [HuksTag](#enum-hukstag) | Returns a `HuksTag` constructed from the UInt32 value. |  

### func getValue()  

```cangjie  
public func getValue(): UInt32  
```  

**Description:** Retrieves the UInt32 value corresponding to the `HuksTag`.  

**System Capability:** SystemCapability.Security.Huks.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| UInt32 | Returns the UInt32 value corresponding to the `HuksTag`. |