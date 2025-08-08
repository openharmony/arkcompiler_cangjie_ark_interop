# ohos.security_huks（通用密钥库系统）

向应用提供密钥库能力，包括密钥管理及密钥的密码学操作等功能。

HUKS所管理的密钥可以由应用导入或者由应用调用HUKS接口生成。

## 导入模块

```cangjie
import kit.UniversalKeystoreKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func abortSession(HuksHandle, HuksOptions)

```cangjie
public func abortSession(handle: HuksHandle, options: HuksOptions): Unit
```

**功能：** abortSession操作密钥接口。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|handle|[HuksHandle](#class-hukshandle)|是|abortSession操作的handle。|
|options|[HuksOptions](#class-huksoptions)|是|abortSession操作的参数集合。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |801|Capability not supported.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

**示例：**

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

**功能：** 获取匿名化密钥证书。该操作需要联网进行，且耗时较长。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|密钥别名，存放待获取证书密钥的别名。|
|options|[HuksOptions](#class-huksoptions)|是|用于获取证书时指定所需参数与数据。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回密钥证书链。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |801|Capability not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

**示例：**

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

**功能：** 获取密钥证书。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|密钥别名，存放待获取证书的密钥别名。|
|options|[HuksOptions](#class-huksoptions)|是|用于获取证书时指定所需参数与数据。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回密钥证书链。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission verification failed.|
  |401|Parameter error.|
  |801|Capability not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

## func deleteKeyItem(String, HuksOptions)

```cangjie
public func deleteKeyItem(keyAlias: String, _: HuksOptions): Unit
```

**功能：** 删除密钥。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|密钥别名，应为生成key时传入的别名。|
|\_|[HuksOptions](#class-huksoptions)|是|用于删除时指定密钥的属性Tag，比如删除的密钥范围（全量/单个），当删除单个时，Tag字段可传空。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |801|Capability not supported.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 导出密钥。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|密钥别名，应与所用密钥生成时使用的别名相同。|
|\_|[HuksOptions](#class-huksoptions)|是|空对象（此处传空即可）。|

**返回值：**

|类型|说明|
|:----|:----|
|Bytes|返回从密钥中导出的公钥。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |801|Capability not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

**示例：**

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

**功能：** finishSession操作密钥接口。[security_huks.initSession](#func-initsessionstring-huksoptions)、[security_huks.updateSession](#func-updatesessionhukshandle-huksoptions)、[security_huks.finishSession](#func-finishsessionhukshandle-huksoptions)为三段式接口，需要一起使用。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|handle|[HuksHandle](#class-hukshandle)|是|finishSession操作的handle。|
|options|[HuksOptions](#class-huksoptions)|是|finishSession的参数集合。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Bytes>|输出处理结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|argument is invalid.|
  |801|api is not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occured in crypto engine.|
  |12000007|this credential is already invalidated permanently.|
  |12000008|verify authtoken failed.|
  |12000009|authtoken is already timeout.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

## func finishSession(HuksHandle, HuksOptions, Bytes)

```cangjie
public func finishSession(handle: HuksHandle, options: HuksOptions, token: Bytes): Option<Bytes>
```

**功能：** finishSession操作密钥接口。[security_huks.initSession](#func-initsessionstring-huksoptions)、[security_huks.updateSession](#func-updatesessionhukshandle-huksoptions-arrayuint8)、[security_huks.finishSession](#func-finishsessionhukshandle-huksoptions-arrayuint8)为三段式接口，需要一起使用。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|handle|[HuksHandle](#class-hukshandle)|是|finishSession操作的handle。|
|options|[HuksOptions](#class-huksoptions)|是|finishSession的参数集合。|
|token|Bytes|是|表示USER IAM服务的AuthToken的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Bytes>|输出处理结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:--------|:-------------|
  |401|Parameter error.|
  |801|Capability not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000007|this credential is already invalidated permanently.|
  |12000008|verify authtoken failed.|
  |12000009|authtoken is already timeout.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

**示例：**

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
        HuksParam(HuksTag.HUKS_TAG_BLOCK_MODE, HuksCipherMode.HUKS_MODE_CBC),
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

**功能：** 生成密钥。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|密钥别名。|
|options|[HuksOptions](#class-huksoptions)|是|用于存放生成key所需Tag。其中密钥使用的算法、密钥用途、密钥长度为必选参数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |801|Capability not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000012|external error.|
  |12000013|queried credential does not exist.|
  |12000014|memory is insufficient.|
  |12000015|call service failed.|

**示例：**

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

**功能：** 获取密钥属性。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|密钥别名。|
|\_|[HuksOptions](#class-huksoptions)|是|空对象（此处传空即可）。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[HuksParam](#class-huksparam)>|返回密钥属性。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |801|Capability not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

**示例：**

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

**功能：** 获取当前系统sdk版本。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回sdk版本。|

**示例：**

<!-- compile -->
```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 导入明文密钥。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|密钥别名。|
|options|[HuksOptions](#class-huksoptions)|是|用于导入时所需Tag和需要导入的密钥。其中密钥使用的算法、密钥用途、密钥长度为必选参数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|argument is invalid.|
  |801|api is not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000013|queried credential does not exist.|
  |12000014|memory is insufficient.|
  |12000015|call service failed.|

**示例：**

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

**功能：** 导入加密密钥。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|密钥别名，存放待导入密钥的别名。|
|wrappingKeyAlias|String|是|密钥别名，对应密钥用于解密加密的密钥数据。|
|options|[HuksOptions](#class-huksoptions)|是|用于导入时所需Tag和需要导入的加密的密钥数据。其中密钥使用的算法、密钥用途、密钥长度为必选参数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|argument is invalid.|
  |801|api is not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000013|queried credential does not exist.|
  |12000014|memory is insufficient.|
  |12000015|call service failed.|

## func initSession(String, HuksOptions)

```cangjie
public func initSession(keyAlias: String, options: HuksOptions): HuksSessionHandle
```

**功能：** initSession操作密钥接口。[security_huks.initSession](#func-initsessionstring-huksoptions)、[security_huks.updateSession](#func-updatesessionhukshandle-huksoptions)、[security_huks.finishSession](#func-finishsessionhukshandle-huksoptions)为三段式接口，需要一起使用。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|initSession操作密钥的别名。|
|options|[HuksOptions](#class-huksoptions)|是|initSession操作的参数集合。|

**返回值：**

|类型|说明|
|:----|:----|
|[HuksSessionHandle](#class-hukssessionhandle)|返回密钥huks Handle。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|argument is invalid.|
  |801|api is not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in cryptoengine.|
  |12000010|the number of sessions has reached limit.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

## func isKeyItemExist(String, HuksOptions)

```cangjie
public func isKeyItemExist(keyAlias: String, options: HuksOptions): Bool
```

**功能：** 判断密钥是否存在。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|keyAlias|String|是|待查找的密钥的别名。|
|options|[HuksOptions](#class-huksoptions)|是|用于查询时指定密钥的属性Tag，比如查询的密钥范围（全量/单个），当查询单个时，Tag字段可传空。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|表示密钥是否存在。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  | 401 | argument is invalid.|
  | 801 | api is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.UniversalKeystoreKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** updateSession操作密钥接口。[security_huks.initSession](#func-initsessionstring-huksoptions)、[security_huks.updateSession](#func-updatesessionhukshandle-huksoptions)、[security_huks.finishSession](#func-finishsessionhukshandle-huksoptions)为三段式接口，需要一起使用。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|handle|[HuksHandle](#class-hukshandle)|是|updateSession操作的handle。|
|options|[HuksOptions](#class-huksoptions)|是|updateSession的参数集合。|

**返回值：**

|类型|说明|
|:----|:----|
|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Bytes>|输出密钥更新结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:--------|:-------------|
  |401|argument is invalid.|
  |801|api is not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000007|this credential is already invalidated permanently.|
  |12000008|verify authtoken failed.|
  |12000009|authtoken is already timeout.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

## func updateSession(HuksHandle, HuksOptions, Bytes)

```cangjie
public func updateSession(handle: HuksHandle, options: HuksOptions, token: Bytes): Option<Bytes>
```

**功能：** updateSession操作密钥接口。[security_huks.initSession](#func-initsessionstring-huksoptions)、[security_huks.updateSession](#func-updatesessionhukshandle-huksoptions-arrayuint8)、[security_huks.finishSession](#func-finishsessionhukshandle-huksoptions-arrayuint8)为三段式接口，需要一起使用。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|handle|[HuksHandle](#class-hukshandle)|是|updateSession操作的handle。|
|options|[HuksOptions](#class-huksoptions)|是|updateSession的参数集合。|
|token|Bytes |是|表示USER IAM服务的AuthToken的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Bytes>|输出密钥更新结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[HUKS错误码](../../errorcodes/cj-errorcode-huks.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:--------|:-------------|
  |401|argument is invalid.|
  |801|api is not supported.|
  |12000001|algorithm mode is not supported.|
  |12000002|algorithm param is missing.|
  |12000003|algorithm param is invalid.|
  |12000004|operating file failed.|
  |12000005|IPC communication failed.|
  |12000006|error occurred in crypto engine.|
  |12000007|this credential is already invalidated permanently.|
  |12000008|verify authtoken failed.|
  |12000009|authtoken is already timeout.|
  |12000011|queried entity does not exist.|
  |12000012|external error.|
  |12000014|memory is insufficient.|

## class HuksAuthAccessType

```cangjie
public class HuksAuthAccessType {
    public static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD: HuksParamValue = HuksParamValue.uint32(1 << 0)
    public static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL: HuksParamValue = HuksParamValue.uint32(1 << 1)
}
```

**功能：** 表示安全访问控制类型。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD

```cangjie
public static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD: HuksParamValue = HuksParamValue.uint32(1 << 0)
```

**功能：** 表示安全访问控制类型为清除密码后密钥无效。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL

```cangjie
public static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL: HuksParamValue = HuksParamValue.uint32(1 << 1)
```

**功能：** 表示安全访问控制类型为新录入生物特征后密钥无效。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

## class HuksAuthStorageLevel

```cangjie
public class HuksAuthStorageLevel {
    public static const HUKS_AUTH_STORAGE_LEVEL_DE: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_AUTH_STORAGE_LEVEL_CE: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_AUTH_STORAGE_LEVEL_ECE: HuksParamValue = HuksParamValue.uint32(2)
}
```

**功能：** 表示生成或导入密钥时，指定该密钥的存储安全等级。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_AUTH_STORAGE_LEVEL_CE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_CE: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示密钥仅在首次解锁后可访问。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_AUTH_STORAGE_LEVEL_DE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_DE: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示密钥仅在开机后可访问。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_AUTH_STORAGE_LEVEL_ECE

```cangjie
public static const HUKS_AUTH_STORAGE_LEVEL_ECE: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示密钥仅在解锁状态时可访问。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

## class HuksChallengePosition

```cangjie
public class HuksChallengePosition {
    public static const HUKS_CHALLENGE_POS_0: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_CHALLENGE_POS_1: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_CHALLENGE_POS_2: HuksParamValue = HuksParamValue.uint32(2)
    public static const HUKS_CHALLENGE_POS_3: HuksParamValue = HuksParamValue.uint32(3)
}
```

**功能：** 表示challenge类型为用户自定义类型时，生成的challenge有效长度仅为8字节连续的数据，且仅支持4种位置 。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_CHALLENGE_POS_0

```cangjie
public static const HUKS_CHALLENGE_POS_0: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示0~7字节为当前密钥的有效challenge。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_CHALLENGE_POS_1

```cangjie
public static const HUKS_CHALLENGE_POS_1: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示8~15字节为当前密钥的有效challenge。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_CHALLENGE_POS_2

```cangjie
public static const HUKS_CHALLENGE_POS_2: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示16~23字节为当前密钥的有效challenge。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_CHALLENGE_POS_3

```cangjie
public static const HUKS_CHALLENGE_POS_3: HuksParamValue = HuksParamValue.uint32(3)
```

**功能：** 表示24~31字节为当前密钥的有效challenge。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

## class HuksChallengeType

```cangjie
public class HuksChallengeType {
    public static const HUKS_CHALLENGE_TYPE_NORMAL: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_CHALLENGE_TYPE_CUSTOM: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_CHALLENGE_TYPE_NONE: HuksParamValue = HuksParamValue.uint32(2)
}
```

**功能：** 表示密钥使用时生成challenge的类型。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_CHALLENGE_TYPE_CUSTOM

```cangjie
public static const HUKS_CHALLENGE_TYPE_CUSTOM: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示challenge为用户自定义类型。支持使用多个密钥仅一次认证。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_CHALLENGE_TYPE_NONE

```cangjie
public static const HUKS_CHALLENGE_TYPE_NONE: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示免challenge类型。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_CHALLENGE_TYPE_NORMAL

```cangjie
public static const HUKS_CHALLENGE_TYPE_NORMAL: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示challenge为普通类型，默认32字节。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

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

**功能：** 表示加密模式。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_MODE_CBC

```cangjie
public static const HUKS_MODE_CBC: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示使用CBC加密模式。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_MODE_CCM

```cangjie
public static const HUKS_MODE_CCM: HuksParamValue = HuksParamValue.uint32(31)
```

**功能：** 表示使用CCM加密模式。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_MODE_CTR

```cangjie
public static const HUKS_MODE_CTR: HuksParamValue = HuksParamValue.uint32(3)
```

**功能：** 表示使用CTR加密模式。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_MODE_ECB

```cangjie
public static const HUKS_MODE_ECB: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示使用ECB加密模式。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_MODE_GCM

```cangjie
public static const HUKS_MODE_GCM: HuksParamValue = HuksParamValue.uint32(32)
```

**功能：** 表示使用GCM加密模式。

 **系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_MODE_OFB

```cangjie
public static const HUKS_MODE_OFB: HuksParamValue = HuksParamValue.uint32(4)
```

**功能：** 表示使用OFB加密模式。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

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

**功能：** 表示错误码的枚举以及对应的错误信息，错误码表示错误类型，错误信息展示错误详情。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_ERR_CODE_CALL_SERVICE_FAILED

```cangjie
public static const HUKS_ERR_CODE_CALL_SERVICE_FAILED: Int32 = 12000015
```

**功能：** 调用其他系统服务失败。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_COMMUNICATION_FAIL

```cangjie
public static const HUKS_ERR_CODE_COMMUNICATION_FAIL: Int32 = 12000005
```

**功能：** 通信失败。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST

```cangjie
public static const HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST: Int32 = 12000013
```

**功能：** 缺失所需凭据。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_CRYPTO_FAIL

```cangjie
public static const HUKS_ERR_CODE_CRYPTO_FAIL: Int32 = 12000006
```

**功能：** 算法库操作失败。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_EXTERNAL_ERROR

```cangjie
public static const HUKS_ERR_CODE_EXTERNAL_ERROR: Int32 = 12000012
```

**功能：** 外部错误。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED

```cangjie
public static const HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED: Int32 = 12000001
```

**功能：** 不支持的功能/特性。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_FILE_OPERATION_FAIL

```cangjie
public static const HUKS_ERR_CODE_FILE_OPERATION_FAIL: Int32 = 12000004
```

**功能：** 文件操作失败。

**类型：** Int32

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_ERR_CODE_ILLEGAL_ARGUMENT

```cangjie
public static const HUKS_ERR_CODE_ILLEGAL_ARGUMENT: Int32 = 401
```

**功能：** 参数错误导致失败。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_INSUFFICIENT_MEMORY

```cangjie
public static const HUKS_ERR_CODE_INSUFFICIENT_MEMORY: Int32 = 12000014
```

**功能：** 内存不足。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT

```cangjie
public static const HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT: Int32 = 12000003
```

**功能：** 无效密钥算法参数。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_ITEM_NOT_EXIST

```cangjie
public static const HUKS_ERR_CODE_ITEM_NOT_EXIST: Int32 = 12000011
```

**功能：** 目标对象不存在。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED

```cangjie
public static const HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED: Int32 = 12000007
```

**功能：** 密钥访问失败-密钥访问失效。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_KEY_AUTH_TIME_OUT

```cangjie
public static const HUKS_ERR_CODE_KEY_AUTH_TIME_OUT: Int32 = 12000009
```

**功能：** 密钥访问失败-密钥访问超时。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED

```cangjie
public static const HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED: Int32 = 12000008
```

**功能：** 密钥访问失败-密钥认证失败。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT

```cangjie
public static const HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT: Int32 = 12000002
```

**功能：** 缺少密钥算法参数。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_NOT_SUPPORTED_API

```cangjie
public static const HUKS_ERR_CODE_NOT_SUPPORTED_API: Int32 = 801
```

**功能：** 不支持的API。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_PERMISSION_FAIL

```cangjie
public static const HUKS_ERR_CODE_PERMISSION_FAIL: Int32 = 201
```

**功能：** 权限错误导致失败。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

### static const HUKS_ERR_CODE_SESSION_LIMIT

```cangjie
public static const HUKS_ERR_CODE_SESSION_LIMIT: Int32 = 12000010
```

**功能：** 密钥操作会话数已达上限。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** Int32

**起始版本：** 21

## class HuksHandle

```cangjie
public class HuksHandle {}
```

**功能：** 表示handle值。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

## class HuksImportKeyType

```cangjie
public class HuksImportKeyType {
    public static const HUKS_KEY_TYPE_PUBLIC_KEY: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_KEY_TYPE_PRIVATE_KEY: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_KEY_TYPE_KEY_PAIR: HuksParamValue = HuksParamValue.uint32(2)
}
```

**功能：** 表示导入密钥的密钥类型，默认为导入公钥，导入对称密钥时不需要该字段。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_TYPE_KEY_PAIR

```cangjie
public static const HUKS_KEY_TYPE_KEY_PAIR: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示导入的密钥类型为公私钥对。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_TYPE_PRIVATE_KEY

```cangjie
public static const HUKS_KEY_TYPE_PRIVATE_KEY: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示导入的密钥类型为私钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_TYPE_PUBLIC_KEY

```cangjie
public static const HUKS_KEY_TYPE_PUBLIC_KEY: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示导入的密钥类型为公钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

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

**功能：** 表示密钥使用的算法。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_ALG_AES

```cangjie
public static const HUKS_ALG_AES: HuksParamValue = HuksParamValue.uint32(20)
```

**功能：** 表示使用AES算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_DH

```cangjie
public static const HUKS_ALG_DH: HuksParamValue = HuksParamValue.uint32(103)
```

**功能：** 表示使用DH算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_DSA

```cangjie
public static const HUKS_ALG_DSA: HuksParamValue = HuksParamValue.uint32(3)
```

**功能：** 表示使用DSA算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_ECC

```cangjie
public static const HUKS_ALG_ECC: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示使用ECC算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_ECDH

```cangjie
public static const HUKS_ALG_ECDH: HuksParamValue = HuksParamValue.uint32(100)
```

**功能：** 表示使用ECDH算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_ED25519

```cangjie
public static const HUKS_ALG_ED25519: HuksParamValue = HuksParamValue.uint32(102)
```

**功能：** 表示使用ED25519算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_HKDF

```cangjie
public static const HUKS_ALG_HKDF: HuksParamValue = HuksParamValue.uint32(51)
```

**功能：** 表示使用HKDF算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_HMAC

```cangjie
public static const HUKS_ALG_HMAC: HuksParamValue = HuksParamValue.uint32(50)
```

**功能：** 表示使用HMAC算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_PBKDF2

```cangjie
public static const HUKS_ALG_PBKDF2: HuksParamValue = HuksParamValue.uint32(52)
```

**功能：** 表示使用PBKDF2算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_RSA

```cangjie
public static const HUKS_ALG_RSA: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示使用RSA算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_SM2

```cangjie
public static const HUKS_ALG_SM2: HuksParamValue = HuksParamValue.uint32(150)
```

**功能：** 表示使用SM2算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_SM3

```cangjie
public static const HUKS_ALG_SM3: HuksParamValue = HuksParamValue.uint32(151)
```

**功能：** 表示使用SM3算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_SM4

```cangjie
public static const HUKS_ALG_SM4: HuksParamValue = HuksParamValue.uint32(152)
```

**功能：** 表示使用SM4算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

### static const HUKS_ALG_X25519

```cangjie
public static const HUKS_ALG_X25519: HuksParamValue = HuksParamValue.uint32(101)
```

**功能：** 表示使用X25519算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**起始版本：** 21

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

**功能：** 表示摘要算法。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DIGEST_MD5

```cangjie
public static const HUKS_DIGEST_MD5: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示MD5摘要算法。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DIGEST_NONE

```cangjie
public static const HUKS_DIGEST_NONE: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示无摘要算法。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DIGEST_SHA1

```cangjie
public static const HUKS_DIGEST_SHA1: HuksParamValue = HuksParamValue.uint32(10)
```

**功能：** 表示SHA1摘要算法。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DIGEST_SHA224

```cangjie
public static const HUKS_DIGEST_SHA224: HuksParamValue = HuksParamValue.uint32(11)
```

**功能：** 表示SHA224摘要算法。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DIGEST_SHA256

```cangjie
public static const HUKS_DIGEST_SHA256: HuksParamValue = HuksParamValue.uint32(12)
```

**功能：** 表示SHA256摘要算法。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DIGEST_SHA384

```cangjie
public static const HUKS_DIGEST_SHA384: HuksParamValue = HuksParamValue.uint32(13)
```

**功能：** 表示SHA384摘要算法。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DIGEST_SHA512

```cangjie
public static const HUKS_DIGEST_SHA512: HuksParamValue = HuksParamValue.uint32(14)
```

**功能：** 表示SHA512摘要算法。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DIGEST_SM3

```cangjie
public static const HUKS_DIGEST_SM3: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示SM3摘要算法。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

## class HuksKeyFlag

```cangjie
public class HuksKeyFlag {
    public static const HUKS_KEY_FLAG_IMPORT_KEY: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_KEY_FLAG_GENERATE_KEY: HuksParamValue = HuksParamValue.uint32(2)
    public static const HUKS_KEY_FLAG_AGREE_KEY: HuksParamValue = HuksParamValue.uint32(3)
    public static const HUKS_KEY_FLAG_DERIVE_KEY: HuksParamValue = HuksParamValue.uint32(4)
}
```

**功能：** 表示密钥的产生方式。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_FLAG_AGREE_KEY

```cangjie
public static const HUKS_KEY_FLAG_AGREE_KEY: HuksParamValue = HuksParamValue.uint32(3)
```

**功能：** 表示通过生成密钥协商接口生成的密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_FLAG_DERIVE_KEY

```cangjie
public static const HUKS_KEY_FLAG_DERIVE_KEY: HuksParamValue = HuksParamValue.uint32(4)
```

**功能：** 表示通过生成密钥派生接口生成的密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_FLAG_GENERATE_KEY

```cangjie
public static const HUKS_KEY_FLAG_GENERATE_KEY: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示通过生成密钥接口生成的密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_FLAG_IMPORT_KEY

```cangjie
public static const HUKS_KEY_FLAG_IMPORT_KEY: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示通过导入公钥接口导入的密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

## class HuksKeyGenerateType

```cangjie
public class HuksKeyGenerateType {
    public static const HUKS_KEY_GENERATE_TYPE_DEFAULT: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_KEY_GENERATE_TYPE_DERIVE: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_KEY_GENERATE_TYPE_AGREE: HuksParamValue = HuksParamValue.uint32(2)
}
```

**功能：** 表示生成密钥的类型。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_GENERATE_TYPE_AGREE

```cangjie
public static const HUKS_KEY_GENERATE_TYPE_AGREE: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 协商生成的密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_GENERATE_TYPE_DEFAULT

```cangjie
public static const HUKS_KEY_GENERATE_TYPE_DEFAULT: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 默认生成的密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_GENERATE_TYPE_DERIVE

```cangjie
public static const HUKS_KEY_GENERATE_TYPE_DERIVE: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 派生生成的密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

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

**功能：** 表示补齐算法。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_PADDING_NONE

```cangjie
public static const HUKS_PADDING_NONE: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示不使用补齐算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_PADDING_OAEP

```cangjie
public static const HUKS_PADDING_OAEP: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示使用OAEP补齐算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_PADDING_PKCS1_V1_5

```cangjie
public static const HUKS_PADDING_PKCS1_V1_5: HuksParamValue = HuksParamValue.uint32(3)
```

**功能：** 表示使用PKCS1_V1_5补齐算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_PADDING_PKCS5

```cangjie
public static const HUKS_PADDING_PKCS5: HuksParamValue = HuksParamValue.uint32(4)
```

**功能：** 表示使用PKCS5补齐算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_PADDING_PKCS7

```cangjie
public static const HUKS_PADDING_PKCS7: HuksParamValue = HuksParamValue.uint32(5)
```

**功能：** 表示使用PKCS7补齐算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_PADDING_PSS

```cangjie
public static const HUKS_PADDING_PSS: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示使用PSS补齐算法。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

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

**功能：** 表示密钥用途。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_AGREE

```cangjie
public static const HUKS_KEY_PURPOSE_AGREE: HuksParamValue = HuksParamValue.uint32(256)
```

**功能：** 表示密钥用于进行密钥协商。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_DECRYPT

```cangjie
public static const HUKS_KEY_PURPOSE_DECRYPT: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示密钥用于对密文进行解密操作。

**系统能力：** SystemCapability.Security.Huks.Core

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_DERIVE

```cangjie
public static const HUKS_KEY_PURPOSE_DERIVE: HuksParamValue = HuksParamValue.uint32(16)
```

**功能：** 表示密钥用于派生密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_ENCRYPT

```cangjie
public static const HUKS_KEY_PURPOSE_ENCRYPT: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示密钥用于对明文进行加密操作。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_MAC

```cangjie
public static const HUKS_KEY_PURPOSE_MAC: HuksParamValue = HuksParamValue.uint32(128)
```

**功能：** 表示密钥用于生成mac消息验证码。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_SIGN

```cangjie
public static const HUKS_KEY_PURPOSE_SIGN: HuksParamValue = HuksParamValue.uint32(4)
```

**功能：** 表示密钥用于对数据进行签名。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_UNWRAP

```cangjie
public static const HUKS_KEY_PURPOSE_UNWRAP: HuksParamValue = HuksParamValue.uint32(64)
```

**功能：** 表示密钥加密导入。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_VERIFY

```cangjie
public static const HUKS_KEY_PURPOSE_VERIFY: HuksParamValue = HuksParamValue.uint32(8)
```

**功能：** 表示密钥用于验证签名后的数据。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_KEY_PURPOSE_WRAP

```cangjie
public static const HUKS_KEY_PURPOSE_WRAP: HuksParamValue = HuksParamValue.uint32(32)
```

**功能：** 表示密钥用于加密导出。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

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

**功能：** 表示密钥长度。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_AES_KEY_SIZE_128

```cangjie
public static const HUKS_AES_KEY_SIZE_128: HuksParamValue = HuksParamValue.uint32(128)
```

**功能：** 表示3DES算法的密钥长度为128bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_AES_KEY_SIZE_192

```cangjie
public static const HUKS_AES_KEY_SIZE_192: HuksParamValue = HuksParamValue.uint32(192)
```

**功能：** 表示使用AES算法的密钥长度为192bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_AES_KEY_SIZE_256

```cangjie
public static const HUKS_AES_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
```

**功能：** 表示使用AES算法的密钥长度为256bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_AES_KEY_SIZE_512

```cangjie
public static const HUKS_AES_KEY_SIZE_512: HuksParamValue = HuksParamValue.uint32(512)
```

**功能：** 表示使用AES算法的密钥长度为512bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_CURVE25519_KEY_SIZE_256

```cangjie
public static const HUKS_CURVE25519_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
```

**功能：** 表示使用CURVE25519算法的密钥长度为256bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DH_KEY_SIZE_2048

```cangjie
public static const HUKS_DH_KEY_SIZE_2048: HuksParamValue = HuksParamValue.uint32(2048)
```

**功能：** 表示使用DH算法的密钥长度为2048bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DH_KEY_SIZE_3072

```cangjie
public static const HUKS_DH_KEY_SIZE_3072: HuksParamValue = HuksParamValue.uint32(3072)
```

**功能：** 表示使用DH算法的密钥长度为3072bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_DH_KEY_SIZE_4096

```cangjie
public static const HUKS_DH_KEY_SIZE_4096: HuksParamValue = HuksParamValue.uint32(4096)
```

**功能：** 表示使用DH算法的密钥长度为4096bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_ECC_KEY_SIZE_224

```cangjie
public static const HUKS_ECC_KEY_SIZE_224: HuksParamValue = HuksParamValue.uint32(224)
```

**功能：** 表示使用ECC算法的密钥长度为224bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_ECC_KEY_SIZE_256

```cangjie
public static const HUKS_ECC_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
```

**功能：** 表示使用ECC算法的密钥长度为256bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_ECC_KEY_SIZE_384

```cangjie
public static const HUKS_ECC_KEY_SIZE_384: HuksParamValue = HuksParamValue.uint32(384)
```

**功能：** 表示使用ECC算法的密钥长度为384bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_ECC_KEY_SIZE_521

```cangjie
public static const HUKS_ECC_KEY_SIZE_521: HuksParamValue = HuksParamValue.uint32(521)
```

**功能：** 表示使用ECC算法的密钥长度为521bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_RSA_KEY_SIZE_1024

```cangjie
public static const HUKS_RSA_KEY_SIZE_1024: HuksParamValue = HuksParamValue.uint32(1024)
```

**功能：** 表示使用RSA算法的密钥长度为1024bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_RSA_KEY_SIZE_2048

```cangjie
public static const HUKS_RSA_KEY_SIZE_2048: HuksParamValue = HuksParamValue.uint32(2048)
```

**功能：** 表示使用RSA算法的密钥长度为2048bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_RSA_KEY_SIZE_3072

```cangjie
public static const HUKS_RSA_KEY_SIZE_3072: HuksParamValue = HuksParamValue.uint32(3072)
```

**功能：** 表示使用RSA算法的密钥长度为3072bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_RSA_KEY_SIZE_4096

```cangjie
public static const HUKS_RSA_KEY_SIZE_4096: HuksParamValue = HuksParamValue.uint32(4096)
```

**功能：** 表示使用RSA算法的密钥长度为4096bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_RSA_KEY_SIZE_512

```cangjie
public static const HUKS_RSA_KEY_SIZE_512: HuksParamValue = HuksParamValue.uint32(512)
```

**功能：** 表示使用RSA算法的密钥长度为512bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_RSA_KEY_SIZE_768

```cangjie
public static const HUKS_RSA_KEY_SIZE_768: HuksParamValue = HuksParamValue.uint32(768)
```

**功能：** 表示使用RSA算法的密钥长度为768bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_SM2_KEY_SIZE_256

```cangjie
public static const HUKS_SM2_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
```

**功能：** 表示SM2算法的密钥长度为256bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_SM4_KEY_SIZE_128

```cangjie
public static const HUKS_SM4_KEY_SIZE_128: HuksParamValue = HuksParamValue.uint32(128)
```

**功能：** 表示SM4算法的密钥长度为128bit。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

## class HuksKeyStorageType

```cangjie
public class HuksKeyStorageType {
    public static const HUKS_STORAGE_TEMP: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_STORAGE_PERSISTENT: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_STORAGE_ONLY_USED_IN_HUKS: HuksParamValue = HuksParamValue.uint32(2)
    public static const HUKS_STORAGE_KEY_EXPORT_ALLOWED: HuksParamValue = HuksParamValue.uint32(3)
}
```

**功能：** 表示密钥存储方式。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_STORAGE_KEY_EXPORT_ALLOWED

```cangjie
public static const HUKS_STORAGE_KEY_EXPORT_ALLOWED: HuksParamValue = HuksParamValue.uint32(3)
```

**功能：** 表示主密钥派生的密钥直接导出给业务方，HUKS不对其进行托管服务。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_STORAGE_ONLY_USED_IN_HUKS

```cangjie
public static const HUKS_STORAGE_ONLY_USED_IN_HUKS: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 表示主密钥派生的密钥存储于huks中，由HUKS进行托管。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_STORAGE_PERSISTENT

```cangjie
public static const HUKS_STORAGE_PERSISTENT: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示通过HUKS service管理密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_STORAGE_TEMP

```cangjie
public static const HUKS_STORAGE_TEMP: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示通过本地直接管理密钥。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

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

**功能：** 调用接口使用的options。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static let NONE

```cangjie
public static let NONE: HuksOptions = HuksOptions(None, None)
```

**功能：** 获取一个空的HuksOptions。

**类型：** [HuksOptions](#class-huksoptions)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### var inData

```cangjie
public var inData: Option<Bytes>
```

**功能：** 输入数据。

**类型：** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]

**读写能力：** 可读写

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### var properties

```cangjie
public var properties: Option<Array<HuksParam>>
```

**功能：** 属性，用于存HuksParam的数组。

**类型：** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<[HuksParam](#class-huksparam)>>

**读写能力：** 可读写

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HuksOptions(Option\<Array\<HuksParam>>, Option\<Bytes>)

```cangjie
public HuksOptions(
    public var properties: Option<Array<HuksParam>>,
    public var inData: Option<Array<UInt8>>
)
```

**功能：** 构造调用接口使用的options实例。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|properties|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<[HuksParam](#class-huksparam)>>|否|-|属性，用于存HuksParam的数组。|
|inData|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]|否|-|输入数据。|

## class HuksParam

```cangjie
public class HuksParam {
    public HuksParam(
        public let tag: HuksTag,
        public let value: HuksParamValue
    )
}
```

**功能：** [HuksOptions](#class-huksoptions)中properties数组中的元素。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### let tag

```cangjie
public let tag: HuksTag
```

**功能：** 标签。

**类型：** [HuksTag](#enum-hukstag)

**读写能力：** 只读

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### let value

```cangjie
public let value: HuksParamValue
```

**功能：** 标签对应值。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**读写能力：** 只读

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HuksParam(HuksTag, HuksParamValue)

```cangjie
public HuksParam(
    public let tag: HuksTag,
    public let value: HuksParamValue
)
```

**功能：** 构造[HuksOptions](#class-huksoptions)中properties数组中的元素实例。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|tag|[HuksTag](#enum-hukstag)|是|标签。|
|value|[HuksParamValue](#enum-huksparamvalue)|是|标签对应值。|

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

**功能：** 表示接口返回的结果，存放返回数据。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### let certChains

```cangjie
public let certChains: Option<Array<String>>
```

**功能：** 表示证书链数据。

**类型：** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<String>>

**读写能力：** 只读

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### let outData

```cangjie
public let outData: Option<Bytes>
```

**功能：** 表示输出数据。

**类型：** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]>

**读写能力：** 只读

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### let properties

```cangjie
public let properties: Option<Array<HuksParam>>
```

**功能：** 表示属性信息。

**类型：** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<[HuksParam](#class-huksparam)>>

**读写能力：** 只读

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HuksReturnResult(Option\<Bytes>, Option\<Array\<HuksParam>>, Option\<Array\<String>>)

```cangjie
public HuksReturnResult(
    public let outData: Option<Array<UInt8>>,
    public let properties: Option<Array<HuksParam>>,
    public let certChains: Option<Array<String>>
)
```

**功能：** 构建HuksReturnResult实例。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|outData|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]>|否|-|表示输出数据。|
|properties|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<[HuksParam](#class-huksparam)>>|否|-|表示属性信息。|
|certChains|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Array\<String>>|否|-|表示证书链数据。|

## class HuksRsaPssSaltLenType

```cangjie
public class HuksRsaPssSaltLenType {
    public static const HUKS_RSA_PSS_SALT_LEN_DIGEST: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_RSA_PSS_SALT_LEN_MAX: HuksParamValue = HuksParamValue.uint32(1)
}
```

**功能：** 表示Rsa在签名或者验签且padding为pss时，需指定的salt_len类型。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_RSA_PSS_SALT_LEN_DIGEST

```cangjie
public static const HUKS_RSA_PSS_SALT_LEN_DIGEST: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示以摘要长度设置salt_len。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_RSA_PSS_SALT_LEN_MAX

```cangjie
public static const HUKS_RSA_PSS_SALT_LEN_MAX: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示以最大长度设置salt_len。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

## class HuksSecureSignType

```cangjie
public class HuksSecureSignType {
    public static const HUKS_SECURE_SIGN_WITH_AUTHINFO: HuksParamValue = HuksParamValue.uint32(1)
}
```

**功能：** 表示生成或导入密钥时，指定该密钥的签名类型。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_SECURE_SIGN_WITH_AUTHINFO

```cangjie
public static const HUKS_SECURE_SIGN_WITH_AUTHINFO: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示签名类型为携带认证信息。生成或导入密钥时指定该字段，则在使用密钥进行签名时，对待签名的数据添加认证信息后进行签名。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

## class HuksSendType

```cangjie
public class HuksSendType {
    public static const HUKS_SEND_TYPE_ASYNC: HuksParamValue = HuksParamValue.uint32(0)
    public static const HUKS_SEND_TYPE_SYNC: HuksParamValue = HuksParamValue.uint32(1)
}
```

**功能：** 表示发送Tag的方式。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_SEND_TYPE_ASYNC

```cangjie
public static const HUKS_SEND_TYPE_ASYNC: HuksParamValue = HuksParamValue.uint32(0)
```

**功能：** 表示异步发送Tag。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_SEND_TYPE_SYNC

```cangjie
public static const HUKS_SEND_TYPE_SYNC: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 表示同步发送Tag。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

## class HuksSessionHandle

```cangjie
public class HuksSessionHandle {
    public HuksSessionHandle(
        public let handle: HuksHandle,
        public let challenge: Option<Array<UInt8>>
    )
}
```

**功能：** huks Handle结构体。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### let challenge

```cangjie
public let challenge: Option<Bytes>
```

**功能：** 表示[initSession](#func-initsessionstring-huksoptions)操作之后获取到的challenge信息。

**类型：** [Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]>

**读写能力：** 只读

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### let handle

```cangjie
public let handle: HuksHandle
```

**功能：** 表示handle值。

**类型：** [HuksHandle](#class-hukshandle)

**读写能力：** 只读

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HuksSessionHandle(HuksHandle, Option\<Bytes>)

```cangjie
public HuksSessionHandle(
    public let handle: HuksHandle,
    public let challenge: Option<Array<UInt8>>
)
```

**功能：** 构建HuksSessionHandle实例

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|handle|[HuksHandle](#class-hukshandle)|否|-|表示handle值。|
|challenge|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]>|否|-|表示[initSession](#func-initsessionstring-huksoptions)操作之后获取到的challenge信息。|

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

**功能：** 表示Tag的数据类型。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_TAG_TYPE_BOOL

```cangjie
public static const HUKS_TAG_TYPE_BOOL: UInt32 = 4 << 28
```

**功能：** 表示该Tag的数据类型为boolean。

**类型：** UInt32

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_TAG_TYPE_BYTES

```cangjie
public static const HUKS_TAG_TYPE_BYTES: UInt32 = 5 << 28
```

**功能：** 表示该Tag的数据类型为Uint8Array。

**类型：** UInt32

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_TAG_TYPE_INT

```cangjie
public static const HUKS_TAG_TYPE_INT: UInt32 = 1 << 28
```

**功能：** 表示该Tag的数据类型为UInt32。

**类型：** UInt32

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_TAG_TYPE_INVALID

```cangjie
public static const HUKS_TAG_TYPE_INVALID: UInt32 = 0 << 28
```

**功能：** 表示非法的Tag类型。

**类型：** UInt32

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_TAG_TYPE_UINT

```cangjie
public static const HUKS_TAG_TYPE_UINT: UInt32 = 2 << 28
```

**功能：** 表示该Tag的数据类型为UInt32。

**类型：** UInt32

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_TAG_TYPE_ULONG

```cangjie
public static const HUKS_TAG_TYPE_ULONG: UInt32 = 3 << 28
```

**功能：** 表示该Tag的数据类型为bigint。

**类型：** UInt32

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

## class HuksUnwrapSuite

```cangjie
public class HuksUnwrapSuite {
    public static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(1)
    public static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(2)
}
```

**功能：** 表示导入加密密钥的算法套件。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING

```cangjie
public static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(2)
```

**功能：** 导入加密密钥时，ECDH密钥协商后使用AES-256 GCM加密。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING

```cangjie
public static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(1)
```

**功能：** 导入加密密钥时，X25519密钥协商后使用AES-256 GCM加密。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

## class HuksUserAuthType

```cangjie
public class HuksUserAuthType {
    public static const HUKS_USER_AUTH_TYPE_FINGERPRINT: HuksParamValue = HuksParamValue.uint32(1 << 0)
    public static const HUKS_USER_AUTH_TYPE_FACE: HuksParamValue = HuksParamValue.uint32(1 << 1)
    public static const HUKS_USER_AUTH_TYPE_PIN: HuksParamValue = HuksParamValue.uint32(1 << 2)
}
```

**功能：** 表示用户认证类型。

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_USER_AUTH_TYPE_FACE

```cangjie
public static const HUKS_USER_AUTH_TYPE_FACE: HuksParamValue = HuksParamValue.uint32(1 << 1)
```

**功能：** 表示用户认证类型为人脸。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_USER_AUTH_TYPE_FINGERPRINT

```cangjie
public static const HUKS_USER_AUTH_TYPE_FINGERPRINT: HuksParamValue = HuksParamValue.uint32(1 << 0)
```

**功能：** 表示用户认证类型为指纹。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

### static const HUKS_USER_AUTH_TYPE_PIN

```cangjie
public static const HUKS_USER_AUTH_TYPE_PIN: HuksParamValue = HuksParamValue.uint32(1 << 2)
```

**功能：** 表示用户认证类型为PIN码。

**类型：** [HuksParamValue](#enum-huksparamvalue)

**系统能力：** SystemCapability.Security.Huks.Extension

**起始版本：** 21

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

**功能：** 用于表示HuksParam中value的值，支持Bool、Int32、UInt32、UInt64、Array\<UInt8>格式。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### boolean(Bool)

```cangjie
boolean(Bool)
```

**功能：** 该字段用于传入Bool类型的value值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### bytes(Bytes)

```cangjie
bytes(Bytes)
```

**功能：** 该字段用于传入Array\<Bytes>类型的value值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### int32(Int32)

```cangjie
int32(Int32)
```

**功能：** 该字段用于传入Int32类型的value值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### uint32(UInt32)

```cangjie
uint32(UInt32)
```

**功能：** 该字段用于传入UInt32类型的value值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### uint64(UInt64)

```cangjie
uint64(UInt64)
```

**功能：** 该字段用于传入UInt64类型的value值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### func toBool()

```cangjie
public func toBool(): Option<Bool>
```

**功能：** 获取HuksParamValue的Bool值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Bool>|返回HuksParamValue的Bool值。|

### func toBytes()

```cangjie
public func toBytes(): Option<Bytes>
```

**功能：** 获取HuksParamValue的Array\<Bytes>值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<[Bytes]>|返回HuksParamValue的Bytes值。|

### func toInt32()

```cangjie
public func toInt32(): Option<Int32>
```

**功能：** 获取HuksParamValue的Int32值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<Int32>|返回HuksParamValue的Int32值。|

### func toUInt32()

```cangjie
public func toUInt32(): Option<UInt32>
```

**功能：** 获取HuksParamValue的UInt32值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<UInt32>|返回HuksParamValue的UInt32值。|

### func toUInt64()

```cangjie
public func toUInt64(): Option<UInt64>
```

**功能：** 获取HuksParamValue的UInt64值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Option](#huksoptionsoptionarrayhuksparam-optionbytes)\<UInt64>|返回HuksParamValue的UInt64值。|

### func |(HuksParamValue)

```cangjie
public operator func |(other: HuksParamValue): HuksParamValue
```

**功能：** 将当前HuksParamValue的UInt32值与另一HuksParamValue的UInt32值进行或运算。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[HuksParamValue](#enum-huksparamvalue)|是|-|需要进行或运算的HuksParamValue。|

**返回值：**

|类型|说明|
|:----|:----|
|[HuksParamValue](#enum-huksparamvalue)|返回或运算后的HuksParamValue。|

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

**功能：** 表示调用参数的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAGS_CANGJIE_UNKNOWN(UInt32)

```cangjie
HUKS_TAGS_CANGJIE_UNKNOWN(UInt32)
```

**功能：** 兼容取值未落在已知枚举范围内的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ACCESS_TIME

```cangjie
HUKS_TAG_ACCESS_TIME
```

**功能：** 原为预留字段，已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ACTIVE_DATETIME

```cangjie
HUKS_TAG_ACTIVE_DATETIME
```

**功能：** 原为证书业务预留字段，当前证书管理已独立，此字段废弃，不再预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_AE_TAG

```cangjie
HUKS_TAG_AE_TAG
```

**功能：** 用于传入GCM模式中的AEAD数据的字段。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_AGREE_ALG

```cangjie
HUKS_TAG_AGREE_ALG
```

**功能：** 表示密钥协商时的算法类型。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS

```cangjie
HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS
```

**功能：** 表示密钥协商时的私钥别名。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_AGREE_PUBLIC_KEY

```cangjie
HUKS_TAG_AGREE_PUBLIC_KEY
```

**功能：** 表示密钥协商时的公钥。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS

```cangjie
HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS
```

**功能：** 表示密钥协商时的公钥别名。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ALGORITHM

```cangjie
HUKS_TAG_ALGORITHM
```

**功能：** 表示算法的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ALL_USERS

```cangjie
HUKS_TAG_ALL_USERS
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ASSOCIATED_DATA

```cangjie
HUKS_TAG_ASSOCIATED_DATA
```

**功能：** 表示附加身份验证数据的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA

```cangjie
HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA

```cangjie
HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_APPLICATION_ID

```cangjie
HUKS_TAG_ATTESTATION_APPLICATION_ID
```

**功能：** 表示attestation时拥有该密钥的application的ID。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_APPLICATION_ID_TYPE

```cangjie
HUKS_TAG_ATTESTATION_APPLICATION_ID_TYPE
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_BASE64

```cangjie
HUKS_TAG_ATTESTATION_BASE64
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_CHALLENGE

```cangjie
HUKS_TAG_ATTESTATION_CHALLENGE
```

**功能：** 表示attestation时的挑战值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_ALIAS

```cangjie
HUKS_TAG_ATTESTATION_ID_ALIAS
```

**功能：** 表示attestation时的密钥别名。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_BRAND

```cangjie
HUKS_TAG_ATTESTATION_ID_BRAND
```

**功能：** 表示设备的品牌。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_DEVICE

```cangjie
HUKS_TAG_ATTESTATION_ID_DEVICE
```

**功能：** 表示设备的设备ID。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_IMEI

```cangjie
HUKS_TAG_ATTESTATION_ID_IMEI
```

**功能：** 表示设备的IMEI号。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_MANUFACTURER

```cangjie
HUKS_TAG_ATTESTATION_ID_MANUFACTURER
```

**功能：** 表示设备的制造商。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_MEID

```cangjie
HUKS_TAG_ATTESTATION_ID_MEID
```

**功能：** 表示设备的MEID号。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_MODEL

```cangjie
HUKS_TAG_ATTESTATION_ID_MODEL
```

**功能：** 表示设备的型号。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_PRODUCT

```cangjie
HUKS_TAG_ATTESTATION_ID_PRODUCT
```

**功能：** 表示设备的产品名。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO

```cangjie
HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO
```

**功能：** 表示attestation时的安全凭据。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_SERIAL

```cangjie
HUKS_TAG_ATTESTATION_ID_SERIAL
```

**功能：** 表示设备的SN号。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_SOCID

```cangjie
HUKS_TAG_ATTESTATION_ID_SOCID
```

**功能：** 表示设备的SOCID。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_UDID

```cangjie
HUKS_TAG_ATTESTATION_ID_UDID
```

**功能：** 表示设备的UDID。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_ID_VERSION_INFO

```cangjie
HUKS_TAG_ATTESTATION_ID_VERSION_INFO
```

**功能：** 表示attestation时的版本号。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ATTESTATION_MODE

```cangjie
HUKS_TAG_ATTESTATION_MODE
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_AUTH_TIMEOUT

```cangjie
HUKS_TAG_AUTH_TIMEOUT
```

**功能：** 表示authtoken单次有效期。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_AUTH_TOKEN

```cangjie
HUKS_TAG_AUTH_TOKEN
```

**功能：** 用于传入authToken的字段。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_BLOCK_MODE

```cangjie
HUKS_TAG_BLOCK_MODE
```

**功能：** 表示加密模式的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_CHALLENGE_POS

```cangjie
HUKS_TAG_CHALLENGE_POS
```

**功能：** 表示challenge类型为用户自定义类型时，huks产生的challenge有效长度仅为8字节连续的数据。从[HuksChallengePosition](#class-hukschallengeposition)中选择。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_CHALLENGE_TYPE

```cangjie
HUKS_TAG_CHALLENGE_TYPE
```

**功能：** 表示密钥使用时生成的challenge类型。从[HuksChallengeType](#class-hukschallengetype)中选择。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_CREATION_DATETIME

```cangjie
HUKS_TAG_CREATION_DATETIME
```

**功能：** 原为证书业务预留字段，当前证书管理已独立，此字段废弃，不再预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_CRYPTO_CTX

```cangjie
HUKS_TAG_CRYPTO_CTX
```

**功能：** 原为预留字段，已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG

```cangjie
HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG
```

**功能：** 表示派生密钥/协商密钥的存储类型。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_DERIVE_ALG

```cangjie
HUKS_TAG_DERIVE_ALG
```

**功能：** 表示密钥派生时的算法类型。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_DERIVE_FACTOR

```cangjie
HUKS_TAG_DERIVE_FACTOR
```

**功能：** 表示密钥派生时的派生因子。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_DERIVE_KEY_SIZE

```cangjie
HUKS_TAG_DERIVE_KEY_SIZE
```

**功能：** 表示派生密钥的大小。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_DERIVE_MAIN_KEY

```cangjie
HUKS_TAG_DERIVE_MAIN_KEY
```

**功能：** 表示密钥派生时的主密钥。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_DIGEST

```cangjie
HUKS_TAG_DIGEST
```

**功能：** 表示摘要算法的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_IMPORT_KEY_TYPE

```cangjie
HUKS_TAG_IMPORT_KEY_TYPE
```

**功能：** 表示导入的密钥类型。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_INFO

```cangjie
HUKS_TAG_INFO
```

**功能：** 表示密钥派生时的info。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_INVALID

```cangjie
HUKS_TAG_INVALID
```

**功能：** 表示非法的Tag。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_IS_ALLOWED_WRAP

```cangjie
HUKS_TAG_IS_ALLOWED_WRAP
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_IS_ASYNCHRONIZED

```cangjie
HUKS_TAG_IS_ASYNCHRONIZED
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_IS_KEY_ALIAS

```cangjie
HUKS_TAG_IS_KEY_ALIAS
```

**功能：** 表示是否使用生成key时传入的别名的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_IS_KEY_HANDLE

```cangjie
HUKS_TAG_IS_KEY_HANDLE
```

**功能：** 原为预留字段，已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ITERATION

```cangjie
HUKS_TAG_ITERATION
```

**功能：** 表示密钥派生时的迭代次数。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_IV

```cangjie
HUKS_TAG_IV
```

**功能：** 表示密钥初始化的向量。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY

```cangjie
HUKS_TAG_KEY
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_ALIAS

```cangjie
HUKS_TAG_KEY_ALIAS
```

**功能：** 表示密钥别名。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_AUTH_ACCESS_TYPE

```cangjie
HUKS_TAG_KEY_AUTH_ACCESS_TYPE
```

**功能：** 表示安全访问控制类型。从[HuksAuthAccessType](#class-huksauthaccesstype)中选择，需要和用户认证类型同时设置。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_AUTH_ID

```cangjie
HUKS_TAG_KEY_AUTH_ID
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_AUTH_PURPOSE

```cangjie
HUKS_TAG_KEY_AUTH_PURPOSE
```

**功能：** 表示密钥认证用途的tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_DOMAIN

```cangjie
HUKS_TAG_KEY_DOMAIN
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_FLAG

```cangjie
HUKS_TAG_KEY_FLAG
```

**功能：** 表示密钥标志的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_GENERATE_TYPE

```cangjie
HUKS_TAG_KEY_GENERATE_TYPE
```

**功能：** 表示生成密钥类型的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_ROLE

```cangjie
HUKS_TAG_KEY_ROLE
```

**功能：** 预留

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_SECURE_SIGN_TYPE

```cangjie
HUKS_TAG_KEY_SECURE_SIGN_TYPE
```

**功能：** 表示生成或导入密钥时，指定该密钥的签名类型

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_SIZE

```cangjie
HUKS_TAG_KEY_SIZE
```

**功能：** 表示密钥长度的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_STORAGE_FLAG

```cangjie
HUKS_TAG_KEY_STORAGE_FLAG
```

**功能：** 表示密钥存储方式的Tag

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_TYPE

```cangjie
HUKS_TAG_KEY_TYPE
```

**功能：** 表示密钥类型的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_VERSION

```cangjie
HUKS_TAG_KEY_VERSION
```

**功能：** 表示密钥版本的Tag。已废弃

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_KEY_WRAP_TYPE

```cangjie
HUKS_TAG_KEY_WRAP_TYPE
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_NONCE

```cangjie
HUKS_TAG_NONCE
```

**功能：** 表示密钥加解密的字段。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_NO_AUTH_REQUIRED

```cangjie
HUKS_TAG_NO_AUTH_REQUIRED
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_ORIGINATION_EXPIRE_DATETIME

```cangjie
HUKS_TAG_ORIGINATION_EXPIRE_DATETIME
```

**功能：** 原为证书业务预留字段，当前证书管理已独立，此字段废弃，不再预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_OS_PATCHLEVEL

```cangjie
HUKS_TAG_OS_PATCHLEVEL
```

**功能：** 表示操作系统补丁级别的Tag。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_OS_VERSION

```cangjie
HUKS_TAG_OS_VERSION
```

**功能：** 表示操作系统版本的Tag。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_PACKAGE_NAME

```cangjie
HUKS_TAG_PACKAGE_NAME
```

**功能：** 原为预留字段，已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_PADDING

```cangjie
HUKS_TAG_PADDING
```

**功能：** 表示补齐算法的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_PAYLOAD_LEN

```cangjie
HUKS_TAG_PAYLOAD_LEN
```

**功能：** 原为预留字段，已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_PROCESS_NAME

```cangjie
HUKS_TAG_PROCESS_NAME
```

**功能：** 表示进程名称的Tag。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_PURPOSE

```cangjie
HUKS_TAG_PURPOSE
```

**功能：** 表示密钥用途的Tag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_PWD

```cangjie
HUKS_TAG_PWD
```

**功能：** 表示密钥派生时的password。已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_RSA_PSS_SALT_LEN_TYPE

```cangjie
HUKS_TAG_RSA_PSS_SALT_LEN_TYPE
```

**功能：** 表示rsa_pss_salt_length的类型。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_SALT

```cangjie
HUKS_TAG_SALT
```

**功能：** 表示密钥派生时的盐值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_SECURE_KEY_ALIAS

```cangjie
HUKS_TAG_SECURE_KEY_ALIAS
```

**功能：** 原为预留字段，已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_SECURE_KEY_UUID

```cangjie
HUKS_TAG_SECURE_KEY_UUID
```

**功能：** 原为预留字段，已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_SYMMETRIC_KEY_DATA

```cangjie
HUKS_TAG_SYMMETRIC_KEY_DATA
```

**功能：** 预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_UNWRAP_ALGORITHM_SUITE

```cangjie
HUKS_TAG_UNWRAP_ALGORITHM_SUITE
```

**功能：** 表示导入加密密钥的套件。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_USAGE_EXPIRE_DATETIME

```cangjie
HUKS_TAG_USAGE_EXPIRE_DATETIME
```

**功能：** 原为证书业务预留字段，当前证书管理已独立，此字段废弃，不再预留。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_USER_AUTH_TYPE

```cangjie
HUKS_TAG_USER_AUTH_TYPE
```

**功能：** 表示用户认证类型。从[HuksUserAuthType](#class-huksuserauthtype)中选择，需要与安全访问控制类型同时设置。支持同时指定两种用户认证类型，如：安全访问控制类型指定为HUKS_SECURE_ACCESS_INVALID_NEW_BIO_ENROLL时，密钥访问认证类型可以指定以下三种： HUKS_USER_AUTH_TYPE_FACE 、HUKS_USER_AUTH_TYPE_FINGERPRINT、HUKS_USER_AUTH_TYPE_FACE MagIc_StrINg HUKS_USER_AUTH_TYPE_FINGERPRINT。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_USER_ID

```cangjie
HUKS_TAG_USER_ID
```

**功能：** 表示当前密钥属于哪个userID。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### HUKS_TAG_USES_TIME

```cangjie
HUKS_TAG_USES_TIME
```

**功能：** 原为预留字段，已废弃。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

### static func parse(UInt32)

```cangjie
public static func parse(val: UInt32): HuksTag
```

**功能：** 通过UInt32值构造一个HuksTag。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|UInt32|是|-|需要构造的HuksTag对应的UInt32值。|

**返回值：**

|类型|说明|
|:----|:----|
|[HuksTag](#enum-hukstag)|返回一个通过UInt32值构造的HuksTag。|

### func getValue()

```cangjie
public func getValue(): UInt32
```

**功能：** 获取HuksTag对应的UInt32值。

**系统能力：** SystemCapability.Security.Huks.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|返回HuksTag对应的UInt32值。|
