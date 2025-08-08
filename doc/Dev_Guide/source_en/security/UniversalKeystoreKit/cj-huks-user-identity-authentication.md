# User Identity Authentication Access Control Development Guide

For scenario introduction and related concepts, please refer to [User Identity Authentication Access Control Overview](./cj-huks-identity-authentication-overview.md).

## Development Steps

1. Generate a key and specify fingerprint access control type and related attributes.
   When generating or importing a key, three parameters need to be specified in the key attribute set: user authentication type [HuksUserAuthType](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksuserauthtype), authorization access type [HuksAuthAccessType](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksauthaccesstype), and challenge value type [HuksChallengeType](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-hukschallengetype).

    <!--compile-->
    ```cangjie
    import kit.UniversalKeystoreKit.*

    /*
     * Determine key alias and encapsulate key attribute parameter set
     */
    let keyAlias = 'test_sm4_key_alias'
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_SM4
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_SM4_KEY_SIZE_128,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_CBC,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_NONE,
        ),
        // Specify the type of key identity authentication: fingerprint.
        HuksParam(
            HuksTag.HUKS_TAG_USER_AUTH_TYPE,
            HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
        ),
        // Specify the type of key security authorization (invalidation type): invalid after new biometric (fingerprint) enrollment.
        HuksParam(
            HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
            HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
        ),
        // Specify the type of challenge value: default type.
        HuksParam(
            HuksTag.HUKS_TAG_CHALLENGE_TYPE,
            HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL
        )
    ]
    let huksOptions: HuksOptions = HuksOptions(
        properties,
        None
    )

    /*
     * Generate key
     */
    class throwObject {
        var isThrow: Bool = false

        init(isThrow: Bool) {
            this.isThrow = isThrow
        }
    }

    func generateKeyItem(keyAlias: String, huksOptions: HuksOptions, throwObject: throwObject) {
        try {
            generateKeyItem(keyAlias, huksOptions)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    func publicGenKeyFunc(keyAlias: String, huksOptions: HuksOptions) {
        AppLog.info("enter generateKeyItem")
        let throwObject: throwObject = throwObject(false)
        try {
            generateKeyItem(keyAlias, huksOptions, throwObject)
        } catch (e: Exception) {
            AppLog.error("generateKeyItem input arg invalid, " + e.toString())
        }
    }

    func testGenKeyForFingerprintAccessControl() {
        publicGenKeyFunc(keyAlias, huksOptions)
    }
    ```

2. Initialize the key session and initiate fingerprint authentication to obtain the authentication token.

    <!--compile-->
    ```cangjie
    import kit.UniversalKeystoreKit.*
    import kit.UserAuthenticationKit.*

    /*
     * Determine key alias and encapsulate key attribute parameter set
     */
    let IV = '1234567890123456'
    let srcKeyAlias = 'test_sm4_key_alias'
    var handle: ?HuksHandle = None
    var challenge: ?Array<UInt8> = None
    var fingerAuthToken: ?Array<UInt8> = None
    let authType = UserAuthType.FINGERPRINT
    let authTrustLevel = AuthTrustLevel.ATL1
    /* Integrate key generation parameter set & encryption parameter set */
    let properties: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_SM4,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_SM4_KEY_SIZE_128,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_BLOCK_MODE,
            HuksCipherMode.HUKS_MODE_CBC,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PADDING,
            HuksKeyPadding.HUKS_PADDING_NONE,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_IV,
            bytes(StringToUint8Array(IV)),
        )
    ]

    func StringToUint8Array(str: String) {
        return str.toArray()
    }

    let huksOptions: HuksOptions = HuksOptions(
        properties,
        None
    )

    class throwObject {
        var isThrow: Bool = false

        init(isThrow: Bool) {
            this.isThrow = isThrow
        }
    }

    func initSession(keyAlias: String, huksOptions: HuksOptions, throwObject: throwObject) {
        return try {
            initSession(keyAlias, huksOptions)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }
    /* Initialize session in HUKS to obtain challenge value */
    func publicInitFunc(keyAlias: String, huksOptions: HuksOptions) {
        AppLog.info("enter doInit")
        let throwObject: throwObject = throwObject(false)
        try {
            let data = initSession(keyAlias, huksOptions, throwObject)
            handle = data.handle
            challenge = data.challenge
        } catch (e: Exception) {
            AppLog.error("doInit input arg invalid, " + e.toString())
        }
    }
    /* Invoke UserIAM to trigger fingerprint authentication and initiate HUKS access control flow */
    func userIAMAuthFinger(huksChallenge: Array<UInt8>) {
        // Obtain authentication object.
        let authTypeList: Array<UserAuthType> = [authType]
        let authParam: AuthParam = AuthParam(
            huksChallenge,
            authTypeList,
            AuthTrustLevel.ATL1
        )
        let widgetParam: WidgetParam = WidgetParam('Enter password', None)
        var auth: ?UserAuthInstance = None
        try {
            auth = getUserAuthInstance(authParam, widgetParam)
            AppLog.info("get auth instance success")
        } catch (e: Exception) {
            AppLog.error("get auth instance failed" + e.toString())
            return
        }
        // Subscribe to authentication result.
        try {
            auth?.on(
                "result",
                {
                    result =>
                    AppLog.info("[HUKS] -> [IAM]  userAuthInstance callback result = ${result.result}")
                    fingerAuthToken = result.token
                }
            )
            AppLog.info("subscribe authentication event success")
        } catch (e: Exception) {
            AppLog.error("subscribe authentication event failed, " + e.toString())
        }
        // Start authentication.
        try {
            auth?.start()
            AppLog.info("authV9 start auth success")
        } catch (e: Exception) {
            AppLog.error("authV9 start auth failed, error = " + e.toString())
        }
    }

    func testInitAndAuthFinger() {
        /* Initialize key session to obtain challenge value */
        publicInitFunc(srcKeyAlias, huksOptions)
        /* Invoke userIAM for identity authentication */
        userIAMAuthFinger(challenge.getOrThrow())
    }
    ```

3. Pass the authentication token for data operations.

    <!--compile-->
    ```cangjie
    /*
     * The following uses SM4 128-bit key as an example
     */
    import kit.UniversalKeystoreKit.*

    /*
     * Determine encapsulated key attribute parameter set
     */
    let IV = '1234567890123456'
    let cipherInData = 'Hks_SM4_Cipher_Test_101010101010101010110_string'
    let handle: ?HuksHandle = None
    let fingerAuthToken: ?Array<UInt8> = None
    let finishOutData: ?Array<UInt8> = None

    class throwObject {
        var isThrow: Bool = false

        init(isThrow: Bool) {
            this.isThrow = isThrow
        }
    }

    /* Integrate key generation parameter set & encryption parameter set */
    let propertiesEncrypt: Array<HuksParam> = [
        HuksParam(
            HuksTag.HUKS_TAG_ALGORITHM,
            HuksKeyAlg.HUKS_ALG_SM4,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT,
        ),
        HuksParam(
            HuksTag.HUKS_TAG_KEY_SIZE,
            HuksKeySize.HUKS_SM4_KEY_SIZE_128,
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
            HuksTag.HUKS_TAG_IV,
            bytes(StringToUint8Array(IV)),
        )
    ]
    var encryptOptions: HuksOptions = HuksOptions(
        propertiesEncrypt,
        None
    )

    func StringToUint8Array(str: String) {
        return str.toArray()
    }

    func updateSession(handle: HuksHandle, huksOptions: HuksOptions, token: Array<UInt8>, throwObject: throwObject) {
        try {
            updateSession(handle, huksOptions, token)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    func publicUpdateFunc(handle: HuksHandle, token: Array<UInt8>, huksOptions: HuksOptions) {
        AppLog.info("enter doUpdate")
        let throwObject: throwObject = throwObject(false)
        try {
            updateSession(handle, huksOptions, token, throwObject)
        } catch (e: Exception) {
            AppLog.error("doUpdate input arg invalid, " + e.toString())
        }
    }

    func finishSession(handle: HuksHandle, huksOptions: HuksOptions, token: Array<UInt8>, throwObject: throwObject) {
        try {
            finishSession(handle, huksOptions, token)
        } catch (e: Exception) {
            throwObject.isThrow = true
            throw e
        }
    }

    func publicFinishFunc(handle: HuksHandle, token: Array<UInt8>, huksOptions: HuksOptions) {
        AppLog.info("enter doFinish")
        let throwObject: throwObject = throwObject(false)
        try {
            finishSession(handle, huksOptions, token, throwObject)
        } catch (e: Exception) {
            AppLog.error("doFinish input arg invalid, " + e.toString())
        }
    }

    func testSm4Cipher() {
        encryptOptions.inData = StringToUint8Array(cipherInData)
        /* Pass in authentication token */
        publicUpdateFunc(handle.getOrThrow(), fingerAuthToken.getOrThrow(), encryptOptions)
        /* Pass in authentication token */
        publicFinishFunc(handle.getOrThrow(), fingerAuthToken.getOrThrow(), encryptOptions)
        if (finishOutData == StringToUint8Array(cipherInData)) {
            AppLog.info('test finish encrypt error ')
        } else {
            AppLog.info('test finish encrypt success')
        }
    }
    ```
```