# Key Agreement (Cangjie)

Taking X25519 as the negotiated key type and the scenario where the key is only used within HUKS as an example, complete the key agreement. For specific scenario descriptions and supported algorithm specifications, please refer to [Supported Algorithms for Key Generation](./cj-huks-key-generation-overview.md#supported-algorithms).

## Development Steps

### Generate Keys

Device A and Device B each generate an asymmetric key. For details, refer to [Key Generation](./cj-huks-key-generation-overview.md) or [Key Import](./cj-huks-key-import-overview.md).

During key generation, the parameter HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG (optional) can be specified to indicate whether the key derived from this key agreement is managed by HUKS.

- When the TAG is set to HUKS_STORAGE_ONLY_USED_IN_HUKS, it means the key derived from this key agreement is managed by HUKS, ensuring the key's entire lifecycle remains within the secure environment.

- When the TAG is set to HUKS_STORAGE_KEY_EXPORT_ALLOWED, it means the key derived from this key agreement is returned to the caller for management, and the application is responsible for ensuring the key's security.

- If the application does not specify a value for the TAG, the key derived from this key agreement can either be managed by HUKS or returned to the caller. The application can later choose how to protect the key during the agreement process.

### Export Keys

Device A and Device B export the public key material of their asymmetric key pairs. For details, refer to [Key Export](./cj-huks-export-key.md).

### Key Agreement

Device A and Device B each derive a shared key based on their local private key and the peer device's public key.

During key agreement, the parameter HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG (optional) can be specified to indicate whether the negotiated key is managed by HUKS.

| Generation | Agreement | Specification |
| :-------- | :-------- | :-------- |
| HUKS_STORAGE_ONLY_USED_IN_HUKS | HUKS_STORAGE_ONLY_USED_IN_HUKS | Key managed by HUKS |
| HUKS_STORAGE_KEY_EXPORT_ALLOWED | HUKS_STORAGE_KEY_EXPORT_ALLOWED | Key returned to caller for management |
| TAG value not specified | HUKS_STORAGE_ONLY_USED_IN_HUKS | Key managed by HUKS |
| TAG value not specified | HUKS_STORAGE_KEY_EXPORT_ALLOWED | Key returned to caller for management |
| TAG value not specified | TAG value not specified | Key returned to caller for management |

The TAG value specified during agreement must not conflict with the TAG value specified during generation. The table only lists valid specification methods.

### Delete Keys

When the keys are no longer needed, Device A and Device B must delete them. For details, refer to [Key Deletion](./cj-huks-delete-key.md).

## Example

Below are examples of agreement using X25519 and DH keys, respectively.

- X25519 Asymmetric Key Agreement Example
  
    <!--compile-->
    ```cangjie
    /*
     * The following demonstrates the usage of X25519 key operations
     */
    import kit.UniversalKeystoreKit.*

    /*
     * Determine key aliases and encapsulate key property parameter sets
     */
    let srcKeyAliasFirst = "AgreeX25519KeyFirstAlias"
    let srcKeyAliasSecond = "AgreeX25519KeySecondAlias"
    let agreeX25519InData = 'AgreeX25519TestIndata'
    var finishOutData: ?Array<UInt8> = None
    var handle: ?HuksHandle = None
    var exportKey: ?Array<UInt8> = None
    var exportKeyFirst: ?Array<UInt8> = None
    var exportKeySecond: ?Array<UInt8> = None
    /* Integrate key generation parameter set */
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_X25519,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_CURVE25519_KEY_SIZE_256,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_NONE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_NONE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_CBC,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
            HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
        )
    ]
    var huksOptions: HuksOptions = HuksOptions(
        properties,
        None
    )
    /* Integrate first agreement parameter set */
    let finishProperties1: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
            HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_IS_KEY_ALIAS,
            boolean(true)
        ),
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_AES,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_AES_KEY_SIZE_256,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_NONE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_NONE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_ECB,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_ALIAS,
            bytes(StringToUint8Array(srcKeyAliasFirst + 'final'))
        )
    ]
    let finishOptionsFirst: HuksOptions = HuksOptions(
        finishProperties1,
        StringToUint8Array(agreeX25519InData)
    )
    /* Integrate second agreement parameter set */
    let finishProperties2: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
            HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_IS_KEY_ALIAS,
            boolean(true)
        ),
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_AES,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_AES_KEY_SIZE_256,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_DIGEST,
            HuksKeyDigest.HUKS_DIGEST_NONE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_NONE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BOCK_MODE,
            HuksCipherMode.HUKS_MODE_ECB,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_ALIAS,
            bytes(StringToUint8Array(srcKeyAliasSecond + 'final'))
        )
    ]
    let finishOptionsSecond: HuksOptions = HuksOptions(
        finishProperties2,
        StringToUint8Array(agreeX25519InData)
    )

    func StringToUint8Array(str: String) {
        return str.toArray()
    }

    class throwObject {
        var isThrow: Bool = false

        init(isThrow: Bool) {
            this.isThrow = isThrow
        }
    }

    /* Generate key */
    func generateKeyItem(keyAlias: String, huksOptions: HuksOptions, throwObject: throwObject) {
        try {
            generateKeyItem(keyAlias, huksOptions)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    /* Call generateKeyItem to generate key */
    func publicGenKeyFunc(keyAlias: String, huksOptions: HuksOptions) {
        AppLog.info("enter generateKeyItem")
        let throwObject: throwObject = throwObject(false)
        try {
            generateKeyItem(keyAlias, huksOptions, throwObject)
        } catch (e: Exception) {
            AppLog.error("generateKeyItem input arg invalid, ${e}")
        }
    }

    /* Initialize key session interface and obtain a handle (required) and challenge value (optional) */
    func initSession(keyAlias: String, huksOptions: HuksOptions, throwObject: throwObject) {
        return try {
            initSession(keyAlias, huksOptions).handle
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    /* Call initSession to obtain handle */
    func publicInitFunc(keyAlias: String, huksOptions: HuksOptions) {
        AppLog.info("enter doInit")
        let throwObject: throwObject = throwObject(false)
        try {
            handle = initSession(keyAlias, huksOptions, throwObject)
        } catch (e: Exception) {
            AppLog.error("doInit input arg invalid, ${e}")
        }
    }

    /* Add data for key operation in segments and perform corresponding key operations, outputting processed data */
    func updateSession(handle: HuksHandle, huksOptions: HuksOptions, throwObject: throwObject) {
        return try {
            updateSession(handle, huksOptions)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    /* Call updateSession for agreement operation */
    func publicUpdateFunc(handle: HuksHandle, huksOptions: HuksOptions) {
        AppLog.info("enter doUpdate")
        let throwObject: throwObject = throwObject(false)
        try {
            updateSession(handle, huksOptions, throwObject)
        } catch (e: Exception) {
            AppLog.error("doUpdate input arg invalid, ${e}")
        }
    }

    /* End key session and perform corresponding key operations, outputting processed data */
    func finishSession(handle: HuksHandle, huksOptions: HuksOptions, throwObject: throwObject) {
        return try {
            finishSession(handle, huksOptions)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    /* Call finishSession to end operation */
    func publicFinishFunc(handle: HuksHandle, huksOptions: HuksOptions) {
        AppLog.info("enter doFinish")
        let throwObject: throwObject = throwObject(false)
        try {
            finishOutData = finishSession(handle, huksOptions, throwObject)
        } catch (e: Exception) {
            AppLog.error("doFinish input arg invalid, ${e}")
        }
    }

    /* Export key */
    func exportKeyItem(keyAlias: String, huksOptions: HuksOptions, throwObject: throwObject) {
        return try {
            exportKeyItem(keyAlias, huksOptions)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    /* Call exportKeyItem to export public key operation */
    func publicExportKeyFunc(keyAlias: String, huksOptions: HuksOptions) {
        AppLog.info("enter export")
        let throwObject: throwObject = throwObject(false)
        try {
            exportKey = exportKeyItem(keyAlias, huksOptions, throwObject)```kotlin
        } catch (e: Exception) {
            AppLog.error("exportKeyItem input arg invalid, ${e}")
        }
    }

    /* Key deletion operation */
    func deleteKeyItem(keyAlias: String, huksOptions: HuksOptions, throwObject: throwObject) {
        return try {
            deleteKeyItem(keyAlias, huksOptions)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    /* Invoke deleteKeyItem for key deletion */
    func publicDeleteKeyFunc(keyAlias: String, huksOptions: HuksOptions) {
        AppLog.info("enter deleteKeyItem")
        let throwObject: throwObject = throwObject(false)
        try {
            deleteKeyItem(keyAlias, huksOptions, throwObject)
        } catch (e: Exception) {
            AppLog.error("deleteKeyItem input arg invalid, ${e}")
        }
    }

    func testAgree() {
        /* 1. Define key aliases and parameter sets: Device A: srcKeyAliasFirst, Device B: srcKeyAliasSecond */
        /* 2. Device A generates key */
        publicGenKeyFunc(srcKeyAliasFirst, huksOptions)
        /* 3. Device B generates key */
        publicGenKeyFunc(srcKeyAliasSecond, huksOptions)
        /* 4. Devices A and B export public keys of asymmetric keys */
        publicExportKeyFunc(srcKeyAliasFirst, huksOptions)
        exportKeyFirst = exportKey
        publicExportKeyFunc(srcKeyAliasSecond, huksOptions)
        exportKeySecond = exportKey
        /* 5. Perform key agreement for the first key (three-phase) */
        publicInitFunc(srcKeyAliasFirst, huksOptions)
        huksOptions.inData = exportKeySecond
        publicUpdateFunc(handle.getOrThrow(), huksOptions)
        publicFinishFunc(handle.getOrThrow(), finishOptionsFirst)
        /* 5. Perform key agreement for the second key (three-phase) */
        publicInitFunc(srcKeyAliasSecond, huksOptions)
        huksOptions.inData = exportKeyFirst
        publicUpdateFunc(handle.getOrThrow(), huksOptions)
        publicFinishFunc(handle.getOrThrow(), finishOptionsSecond)
        /* 6. Devices A and B delete keys */
        publicDeleteKeyFunc(srcKeyAliasFirst, huksOptions)
        publicDeleteKeyFunc(srcKeyAliasSecond, huksOptions)
    }
    ```

- DH Key Agreement Example

    <!--compile-->
    ```cangjie
    /*
     * The following demonstrates DH key operations
     */
    import kit.UniversalKeystoreKit.*
    import std.math.numeric.BigInt

    func StringToUint8Array(str: String) {
        return str.toArray()
    }

    func Uint8ArrayToBigInt(arr: Array<UInt8>): BigInt {
        var i = 0
        let byteMax: BigInt = BigInt('100')
        var result: BigInt = BigInt('0')
        while (i < arr.size) {
            result = result * byteMax
            result = result + BigInt(arr[i])
            i += 1
        }
        return result
    }

    let dhAgree: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_DH,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE,
        )
    ]
    let dh2048Agree: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_DH,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_DH_KEY_SIZE_2048,
        )
    ]
    let dhGenOptions: HuksOptions = HuksOptions(
        dh2048Agree,
        None
    )
    let emptyOptions: HuksOptions = HuksOptions([], [])

    func HuksDhAgreeExportKey(
        keyAlias: String,
        peerPubKey: ?Array<UInt8>
    ): ?Array<UInt8> {
        let initHandle = initSession(keyAlias, dhGenOptions)
        let dhAgreeUpdateBobPubKey: HuksOptions = HuksOptions(
            [
                HuksParam(
                    HuksTag.HUKS_TAG_ALGORITHM,
                    HuksKeyAlg.HUKS_ALG_DH,
                ),
                HuksParam(
                    HuksTag.HUKS_TAG_PURPOSE,
                    HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE,
                ),
                HuksParam(
                    HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_KEY_EXPORT_ALLOWED,
                )
            ],
            peerPubKey
        )
        updateSession(initHandle.handle, dhAgreeUpdateBobPubKey)
        return finishSession(initHandle.handle, emptyOptions)
    }

    func HuksDhAgreeExportTest(aliasA: String, aliasB: String, pubKeyA: ?Array<UInt8>, pubKeyB: ?Array<UInt8>) {
        let agreedKeyFromAlice = HuksDhAgreeExportKey(aliasA, pubKeyB).getOrThrow()
        AppLog.info("ok! agreedKeyFromAlice export is 0x${Uint8ArrayToBigInt(agreedKeyFromAlice).toString(radix: 16)}")

        let agreedKeyFromBob = HuksDhAgreeExportKey(aliasB, pubKeyA).getOrThrow()
        AppLog.info("ok! agreedKeyFromBob export is 0x${Uint8ArrayToBigInt(agreedKeyFromBob).toString(radix: 16)}")
    }

    func HuksDhAgreeInHuks(keyAlias: String, peerPubKey: ?Array<UInt8>, aliasAgreedKey: String): ?Array<UInt8> {
        let onlyUsedInHuks: Array<HuksParam> = [
            HuksParam(
                HuksTag.HUKS_TAG_KEY_STORAGE_FLAG,
                HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
            ),
            HuksParam(
                HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
                HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
            )
        ]
        let dhAgreeInit: HuksOptions = HuksOptions(
            [
                HuksParam(
                    HuksTag.HUKS_TAG_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
                ),
                HuksParam(
                    HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
                ),
                HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_256),
                HuksParam(
                    HuksTag.HUKS_TAG_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
                ),
                HuksParam(
                    HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
                )
            ],
            None
        )
        let dhAgreeFinishParams: Array<HuksParam> = [
            HuksParam(
                HuksTag.HUKS_TAG_KEY_STORAGE_FLAG,
                HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
            ),
            HuksParam(
                HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
                HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
            ),
            HuksParam(HuksTag.HUKS_TAG_IS_KEY_ALIAS, boolean(true)),
            HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
            HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_256),
            HuksParam(
                HuksTag.HUKS_TAG_PURPOSE,
                HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            )
        ]

        let handle = initSession(keyAlias, dhAgreeInit)
        let dhAgreeUpdatePubKey: HuksOptions = HuksOptions(
            [
                HuksParam(
                    HuksTag.HUKS_TAG_ALGORITHM,
                    HuksKeyAlg.HUKS_ALG_DH,
                ),
                HuksParam(
                    HuksTag.HUKS_TAG_PURPOSE,
                    HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE,
                ),
                HuksParam(
                    HuksTag.HUKS_TAG_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
                ),
                HuksParam(
                    HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
                )
            ],
            peerPubKey
        )
        updateSession(handle.handle, dhAgreeUpdatePubKey)
        let dhAgreeAliceFinnish: HuksOptions = HuksOptions(
            [
                HuksParam(
                    HuksTag.HUKS_TAG_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
                ),
                HuksParam(
                    HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
                    HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
                ),
                HuksParam(HuksTag.HUKS_TAG_IS_KEY_ALIAS, boolean(true)),
                HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
                HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_256),
                HuksParam(
                    HuksTag.HUKS_TAG_PURPOSE,
                    HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                ),
                HuksParam(HuksTag.HUKS_TAG_KEY_ALIAS, bytes(StringToUint8Array(aliasAgreedKey)))
            ],
            None
        )
        return finishSession(handle.handle, dhAgreeAliceFinnish)
    }

    func HuksDhAgreeInHuksTest(aliasA: String, aliasB: String, pubKeyA: ?Array<UInt8>, pubKeyB: ?Array<UInt8>,
        aliasAgreedKeyFromA: String, aliasAgreedKeyFromB: String) {
        let finishAliceResult = HuksDhAgreeInHuks(aliasA, pubKeyB, aliasAgreedKeyFromA).getOrThrow()
        AppLog.info("ok! finishAliceResult in huks is 0x${Uint8ArrayToBigInt(finishAliceResult).toString(radix: 16)}")
        let aliceAgreedExist = isKeyItemExist(aliasAgreedKeyFromA, emptyOptions)
        AppLog.info("ok! aliceAgreedExist in huks is ${aliceAgreedExist}")

        let finishBobResult = HuksDhAgreeInHuks(aliasB, pubKeyA, aliasAgreedKeyFromB).getOrThrow()
        AppLog.info("ok! finishBobResult in huks is 0x${Uint8ArrayToBigInt(finishBobResult).toString(radix: 16)}")
        let bobAgreedExist = isKeyItemExist(aliasAgreedKeyFromB, emptyOptions)
        AppLog.info("ok! bobAgreedExist in huks is ${bobAgreedExist}")

        deleteKeyItem(aliasAgreedKeyFromA, emptyOptions)
        deleteKeyItem(aliasAgreedKeyFromB, emptyOptions)
    }

    func huksDhAgreeTest() {
        let aliasAlice = 'alice'
        let aliasBob = 'bob'

        /* Invoke generateKeyItem to create two keys with aliases 'alice' and 'bob' */
        generateKeyItem(aliasAlice, dhGenOptions)
        generateKeyItem(aliasBob, dhGenOptions)

        /* Export public keys of asymmetric keys 'alice' and 'bob' */
        let pubKeyAlice = exportKeyItem(aliasAlice, emptyOptions)
        let pubKeyBob = exportKeyItem(aliasBob, emptyOptions)

        /* Start agreement, with negotiated keys returned to application management */
        HuksDhAgreeExportTest(aliasAlice, aliasBob, pubKeyAlice, pubKeyBob)

        /* Start agreement, with negotiated keys managed by HUKS */
        HuksDhAgreeInHuksTest(aliasAlice, aliasBob, pubKeyAlice, pubKeyBob, 'agreedKeyFromAlice', 'agreedKeyFromBob')

        deleteKeyItem(aliasAlice, emptyOptions)
        deleteKeyItem(aliasBob, emptyOptions)
    }
    ```