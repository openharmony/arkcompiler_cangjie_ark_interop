# Encryption and Decryption (Cangjie)

Using AES 128, RSA 2048, and SM2 as examples, complete encryption and decryption operations. For specific scenarios and supported algorithm specifications, refer to [Supported Algorithms for Key Generation](./cj-huks-encryption-decryption-overview.md#supported-algorithms).

## Development Steps

### Generate Key

1. Specify a key alias.

2. Initialize the key property set.

3. Call [generateKeyItem](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-generatekeyitemstring-huksoptions) to generate the key. For details, refer to [Key Generation](./cj-huks-key-generation-overview.md).

Additionally, developers can refer to [Key Import](./cj-huks-key-import-overview.md) to import existing keys.

### Encryption

1. Obtain the key alias specified during [key generation](#generate-key).

2. Obtain the data to be encrypted.

3. Configure the encryption [algorithm parameters](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksparam).

    The document provides multiple examples. When using different algorithms, ensure the corresponding parameters are configured.

    - For AES encryption, if the selected block mode is CBC and padding mode is PKCS7, the IV parameter must be specified. Refer to [Development Example: AES/CBC/PKCS7](#aescbcpkcs7).
    - For AES encryption, if the selected block mode is GCM, the NONCE parameter must be specified, while AAD is optional. Refer to [Development Example: AES/GCM/NoPadding](#aesgcmnopadding).
    - For RSA encryption, select the corresponding block mode, padding mode, and digest algorithm (DIGEST). Refer to [Development Example: RSA/ECB/PKCS1_V1_5](#rsaecbpkcs1_v1_5) and [Development Example: RSA/ECB/OAEP/SHA256](#rsaecboaepsha256).
    - For SM2 encryption, the digest algorithm (DIGEST) must be specified as SM3. Refer to [Development Example: SM2](#sm2).

    For detailed specifications, refer to [Encryption/Decryption Introduction and Algorithm Specifications](./cj-huks-encryption-decryption-overview.md).

4. Call [initSession](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-initsessionstring-huksoptions) to initialize the key session and obtain the session handle.

5. Call [finishSession](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-finishsessionhukshandle-huksoptions) to complete the key session and obtain the encrypted ciphertext.

### Decryption

1. Obtain the key alias specified during [key generation](#generate-key).

2. Obtain the ciphertext to be decrypted.

3. Configure the decryption [algorithm parameters](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksparam).

    The document provides multiple examples. When using different algorithms, ensure the corresponding parameters are configured.

    - For AES decryption, if the selected block mode is GCM, the NONCE and AEAD parameters must be specified, while AAD is optional. Refer to [Development Example: AES/GCM/NoPadding](#aesgcmnopadding).
    - For other examples, the parameters are consistent with the encryption requirements.

    For detailed specifications, refer to [Encryption/Decryption Introduction and Algorithm Specifications](./cj-huks-encryption-decryption-overview.md).

4. Call [initSession](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-initsessionstring-huksoptions) to initialize the key session and obtain the session handle.

5. Call [finishSession](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-finishsessionhukshandle-huksoptions) to complete the key session and obtain the decrypted data.

### Delete Key

When a key is no longer needed, call [deleteKeyItem](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-deletekeyitemstring-huksoptions) to delete it. For details, refer to [Key Deletion](./cj-huks-delete-key.md).

## Development Examples

### AES/CBC/PKCS7

<!--compile-->
```cangjie
/*
 * The following demonstrates the operation of AES/CBC/PKCS7.
 */
import kit.UniversalKeystoreKit.*

let aesKeyAlias = 'test_aesKeyAlias'  // Key alias, specified during key generation and used for encryption, decryption, and key deletion.
var handle: ?HuksHandle = None
let plainText = '123456'  // Plaintext to be encrypted.
let IV = '001122334455' // Sample code; actual usage requires random values.
var cipherData: ?Array<UInt8> = None // Encrypted ciphertext data.

func StringToUint8Array(str: String) {
    return str.toArray()
}

func Uint8ArrayToString(fileData: Array<UInt8>) {
    return String.fromUtf8(fileData)
}

func GetAesGenerateProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_AES
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_AES_KEY_SIZE_128
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        )
    ]
    return properties
}

func GetAesEncryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_AES
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_AES_KEY_SIZE_128
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_PKCS7
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_CBC
        ),
        HuksParam(
            HuksTag.HUKS_TAG_IV,
            bytes(StringToUint8Array(IV))
        )
    ]
    return properties
}

func GetAesDecryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_AES
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_AES_KEY_SIZE_128
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_PKCS7
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BOCK_MODE,
            HuksCipherMode.HUKS_MODE_CBC
        ),
        HuksParam(
            HuksTag.HUKS_TAG_IV,
            bytes(StringToUint8Array(IV))
        )
    ]
    return properties
}

/*
 * Simulate key generation scenario.
 */
func GenerateAesKey() {
    // Obtain key generation algorithm parameters.
    let genProperties = GetAesGenerateProperties()
    let options: HuksOptions = HuksOptions(genProperties, None)

    // Call generateKeyItem; aesKeyAlias is the key alias specified by the user.
    generateKeyItem(aesKeyAlias, options)
}

/*
 * Simulate encryption scenario.
 */
func EncryptData() {
    // Obtain encryption algorithm parameters.
    let encryptProperties = GetAesEncryptProperties()
    let options: HuksOptions = HuksOptions(
        encryptProperties,
        StringToUint8Array(plainText) // plainText is the data to be encrypted.
    )
    // Call initSession to obtain the handle; aesKeyAlias is the key alias specified during key generation.
    handle = initSession(aesKeyAlias, options).handle
    // Call finishSession to obtain the encrypted ciphertext.
    cipherData = finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate decryption scenario.
 */
func DecryptData() {
    // Obtain decryption algorithm parameters.
    let decryptOptions = GetAesDecryptProperties()
    let options: HuksOptions = HuksOptions(
        decryptOptions,
        cipherData
    )
    // Call initSession to obtain the handle; aesKeyAlias is the key alias specified during key generation.
    handle = initSession(aesKeyAlias, options).handle
    // Call finishSession to obtain the decrypted data.
    let result = finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate key deletion scenario.
 */
func DeleteKey() {
    let emptyOptions: HuksOptions = HuksOptions.NONE
    // Call deleteKeyItem to delete the key; aesKeyAlias is the key alias specified during key generation.
    deleteKeyItem(aesKeyAlias, emptyOptions)
}
```

### AES/GCM/NoPadding

<!--compile-->
```cangjie
/*
 * The following demonstrates the operation of AES/GCM/NoPadding.
 */
import kit.UniversalKeystoreKit.*

let aesKeyAlias = 'test_aesKeyAlias' // Key alias, specified during key generation and used for encryption, decryption, and key deletion.
var handle: ?HuksHandle = None
let plainText = '123456'  // Plaintext to be encrypted.
var cipherData: ?Array<UInt8> = None  // Encrypted ciphertext data.
let AAD = '1234567890123456'
let NONCE = '001122334455' // Sample code; actual usage requires random values.

func StringToUint8Array(str: String) {
    return str.toArray()
}

func Uint8ArrayToString(fileData: Array<UInt8>) {
    return String.fromUtf8(fileData)
}

func GetAesGenerateProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_AES
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_AES_KEY_SIZE_128
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        )
    ]
    return properties
}

func GetAesGcmEncryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_AES
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_AES_KEY_SIZE_128
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_NONE
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_GCM
        ),
        HuksParam(
            HuksTag.HUKS_TAG_NONCE,
            bytes(StringToUint8Array(NONCE))
        ),
        HuksParam(
            HuksTag.HUKS_TAG_ASSOCIATED_DATA,
            bytes(StringToUint8Array(AAD))
        )
    ]
    return properties
}

func GetAesGcmDecryptProperties(cipherData: Array<UInt8>) {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_AES
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_AES_KEY_SIZE_128
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_NONE
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_GCM
        ),
        HuksParam(
            HuksTag.HUKS_TAG_NONCE,
            bytes(StringToUint8Array(NONCE))
        ),
        HuksParam(
            HuksTag.HUKS_TAG_ASSOCIATED_DATA,
            bytes(StringToUint8Array(AAD))
        ),
        HuksParam(
            HuksTag.HUKS_TAG_AE_TAG,
            bytes(cipherData.slice(cipherData.size - 16, 16))
        )
    ]
    return properties
}

/*
 * Simulate key generation scenario
 */
func GenerateAesKey() {
    // Get algorithm parameter configuration for key generation
    let genProperties = GetAesGenerateProperties()
    let options: HuksOptions = HuksOptions(genProperties, None)
    // Call generateKeyItem, aesKeyAlias is the key alias specified by the user
    generateKeyItem(aesKeyAlias, options)
}

/*
 * Simulate encryption scenario
 */
func EncryptData() {
    // Get algorithm parameter configuration for encryption
    let encryptProperties = GetAesGcmEncryptProperties()
    let options: HuksOptions = HuksOptions(
        encryptProperties,
        StringToUint8Array(plainText)
    )
    // Call initSession to get handle, aesKeyAlias is the key alias specified during key generation
    handle = initSession(aesKeyAlias, options).handle
    // Call finishSession to get the encrypted ciphertext
    cipherData = finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate decryption scenario
 */
func DecryptData() {
    // Get algorithm parameter configuration for decryption
    let decryptOptions = GetAesGcmDecryptProperties(cipherData.getOrThrow())
    let options: HuksOptions = HuksOptions(
        decryptOptions,
        cipherData
            .getOrThrow()
            .slice(0, cipherData
                .getOrThrow()
                .size - 16)
    )
    // Call initSession to get handle, aesKeyAlias is the key alias specified during key generation
    handle = initSession(aesKeyAlias, options).handle
    // Call finishSession to get the decrypted data
    let result = finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate key deletion scenario
 */
func DeleteKey() {
    let emptyOptions: HuksOptions = HuksOptions.NONE
    // Call deleteKeyItem to delete the key, aesKeyAlias is the key alias specified during key generation
    deleteKeyItem(aesKeyAlias, emptyOptions)
}
```

### RSA/ECB/PKCS1_V1_5

<!--compile-->
```cangjie
/*
 * The following demonstrates operations using RSA/ECB/PKCS1_V1_5 mode
 */
import kit.UniversalKeystoreKit.*

let rsaKeyAlias = 'test_rsaKeyAlias'  // Key alias, specified during key generation and used for encryption, decryption, and key deletion
var handle: ?HuksHandle = None
let plainText = '123456' // Plaintext to be encrypted
var cipherData: ?Array<UInt8> = None // Encrypted ciphertext data

func StringToUint8Array(str: String) {
    return str.toArray()
}

func Uint8ArrayToString(fileData: Array<UInt8>) {
    return String.fromUtf8(fileData)
}

func GetRsaGenerateProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_RSA
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_RSA_KEY_SIZE_2048
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        )
    ]
    return properties
}

func GetRsaEncryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_RSA
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_RSA_KEY_SIZE_2048
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_ECB
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_NONE
        )
    ]
    return properties
}

func GetRsaDecryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_RSA
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_RSA_KEY_SIZE_2048
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_ECB
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_NONE
        )
    ]
    return properties
}

/*
 * Simulate key generation scenario
 */
func GenerateRsaKey() {
    // Get algorithm parameter configuration for key generation
    let genProperties = GetRsaGenerateProperties()
    let options: HuksOptions = HuksOptions(genProperties, None)
    // Call generateKeyItem, rsaKeyAlias is the key alias specified by the user
    generateKeyItem(rsaKeyAlias, options)
}

/*
 * Simulate encryption scenario
 */
func EncryptData() {
    // Get algorithm parameter configuration for encryption
    let encryptProperties = GetRsaEncryptProperties()
    let options: HuksOptions = HuksOptions(
        encryptProperties,
        StringToUint8Array(plainText) // plainText is the plaintext data to be encrypted
    )
    // Call initSession to get handle, rsaKeyAlias is the key alias specified during key generation
    handle = initSession(rsaKeyAlias, options).handle
    // Call finishSession to get the encrypted ciphertext
    finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate decryption scenario
 */
func DecryptData() {
    // Get algorithm parameter configuration for decryption
    let decryptOptions = GetRsaDecryptProperties()
    let options: HuksOptions = HuksOptions(
        decryptOptions,
        cipherData  // Encrypted ciphertext data
    )
    // Call initSession to get handle, rsaKeyAlias is the key alias specified during key generation
    handle = initSession(rsaKeyAlias, options).handle
    // Call finishSession to get the decrypted data
    finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate key deletion scenario
 */
func DeleteKey() {
    let emptyOptions: HuksOptions = HuksOptions.NONE
    // Call deleteKeyItem to delete the key, rsaKeyAlias is the key alias specified during key generation
    deleteKeyItem(rsaKeyAlias, emptyOptions)
}
```

### RSA/ECB/OAEP/SHA256

<!--compile-->
```cangjie
/*
 * The following demonstrates operations using RSA/ECB/OAEP/SHA256 mode
 */
import kit.UniversalKeystoreKit.*

let rsaKeyAlias = 'test_rsaKeyAlias' // Key alias, specified during key generation and used for encryption, decryption, and key deletion
var handle: ?HuksHandle = None
let plainText = '123456' // Plaintext to be encrypted
var cipherData: ?Array<UInt8> = None // Encrypted ciphertext data

func StringToUint8Array(str: String) {
    return str.toArray()
}

func Uint8ArrayToString(fileData: Array<UInt8>) {
    return String.fromUtf8(fileData)
}

func GetRsaGenerateProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_RSA
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_RSA_KEY_SIZE_2048
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        )
    ]
    return properties
}

func GetRsaEncryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_RSA
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_RSA_KEY_SIZE_2048
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_OAEP
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_ECB
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_SHA256
        )
    ]
    return properties
}

func GetRsaDecryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_RSA
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_RSA_KEY_SIZE_2048
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_OAEP
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_ECB
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_SHA256
        )
    ]
    return properties
}

/*
 * Simulate key generation scenario
 */
func GenerateRsaKey() {
    // Get algorithm parameter configuration for key generation
    let genProperties = GetRsaGenerateProperties()
    let options: HuksOptions = HuksOptions(genProperties, None)
    // Call generateKeyItem, where rsaKeyAlias is the key alias specified during key generation
    generateKeyItem(rsaKeyAlias, options)
}

/*
 * Simulate encryption scenario
 */
func EncryptData() {
    // Get encryption algorithm parameter configuration
    let encryptProperties = GetRsaEncryptProperties()
    let options: HuksOptions = HuksOptions(
        encryptProperties,
        StringToUint8Array(plainText)
    )
    // Call initSession to obtain handle, where rsaKeyAlias is the key alias specified during key generation
    handle = initSession(rsaKeyAlias, options).handle
    // Call finishSession to obtain encrypted ciphertext
    finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate decryption scenario
 */
func DecryptData() {
    // Get decryption algorithm parameter configuration
    let decryptOptions = GetRsaDecryptProperties()
    let options: HuksOptions = HuksOptions(
        decryptOptions,
        cipherData // Encrypted ciphertext data
    )
    // Call initSession to obtain handle, where rsaKeyAlias is the key alias specified during key generation
    handle = initSession(rsaKeyAlias, options).handle
    // Call finishSession to obtain decrypted data
    finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate key deletion scenario
 */
func DeleteKey() {
    let emptyOptions: HuksOptions = HuksOptions.NONE
    // Call deleteKeyItem to delete the key, where rsaKeyAlias is the key alias specified during key generation
    deleteKeyItem(rsaKeyAlias, emptyOptions)
}
```

### SM2

<!--compile-->
```cangjie
/*
 * The following demonstrates operations in SM2 mode
 */
import kit.UniversalKeystoreKit.*

let sm2KeyAlias = 'test_sm2KeyAlias' // Key alias specified during key generation, used for encryption, decryption, and key deletion
var handle: ?HuksHandle = None
let plainText = '123456' // Plaintext to be encrypted
var cipherData: ?Array<UInt8> = None // Encrypted ciphertext data

func StringToUint8Array(str: String) {
    return str.toArray()
}

func Uint8ArrayToString(fileData: Array<UInt8>) {
    return String.fromUtf8(fileData)
}

func GetSm2GenerateProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_SM2
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_SM2_KEY_SIZE_256
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        )
    ]
    return properties
}

func GetSm2EncryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_SM2
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_SM2_KEY_SIZE_256
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_SM3
        )
    ]
    return properties
}

func GetSm2DecryptProperties() {
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_SM2
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_SM2_KEY_SIZE_256
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_SM3
        )
    ]
    return properties
}

/*
 * Simulate key generation scenario
 */
func GenerateSm2Key() {
    // Get algorithm parameter configuration for key generation
    let genProperties = GetSm2GenerateProperties()
    let options: HuksOptions = HuksOptions(genProperties, None)
    // Call generateKeyItem to generate key, where sm2KeyAlias is the key alias specified during key generation
    generateKeyItem(sm2KeyAlias, options)
}

/*
 * Simulate encryption scenario
 */
func EncryptDataSm2() {
    // Get encryption algorithm parameter configuration
    let encryptProperties = GetSm2EncryptProperties()
    let options: HuksOptions = HuksOptions(
        encryptProperties,
        StringToUint8Array(plainText) // plainText is the plaintext data to be encrypted
    )
    // Call initSession to obtain handle, where sm2KeyAlias is the key alias specified during key generation
    handle = initSession(sm2KeyAlias, options).handle
    // Call finishSession to obtain encrypted ciphertext
    finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate decryption scenario
 */
func DecryptDataSm2() {
    // Get decryption algorithm parameter configuration
    let decryptOptions = GetSm2DecryptProperties()
    let options: HuksOptions = HuksOptions(
        decryptOptions,
        cipherData // Encrypted ciphertext data
    )
    // Call initSession to obtain handle, where sm2KeyAlias is the key alias specified during key generation
    handle = initSession(sm2KeyAlias, options).handle
    // Call finishSession to obtain decrypted data
    finishSession(handle.getOrThrow(), options)
}

/*
 * Simulate key deletion scenario
 */
func DeleteKey() {
    let emptyOptions: HuksOptions = HuksOptions.NONE
    // Call deleteKeyItem to delete the key, where sm2KeyAlias is the key alias specified during key generation
    deleteKeyItem(sm2KeyAlias, emptyOptions)
}
```