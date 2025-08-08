# 用户身份认证访问控制开发指导

场景介绍及相关概念说明请参见[用户身份认证访问控制简介](./cj-huks-identity-authentication-overview.md)。

## 开发步骤

1. 生成密钥，指定指纹访问控制类型及相关属性。
   生成或导入密钥时，在密钥属性集中需指定三个参数：用户认证类型[HuksUserAuthType](../../../../API_Reference/source_zh_cn/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksuserauthtype)、授权访问类型[HuksAuthAccessType](../../../../API_Reference/source_zh_cn/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksauthaccesstype)、挑战值类型[HuksChallengeType](../../../../API_Reference/source_zh_cn/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-hukschallengetype)。

    <!--compile-->
    ```cangjie
    import kit.UniversalKeystoreKit.*

    /*
     * 确定密钥别名和封装密钥属性参数集
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
        // 指定密钥身份认证的类型：指纹。
        HuksParam(
            HuksTag.HUKS_TAG_USER_AUTH_TYPE,
            HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
        ),
        // 指定密钥安全授权的类型（失效类型）：新录入生物特征（指纹）后无效。
        HuksParam(
            HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
            HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
        ),
        // 指定挑战值的类型：默认类型。
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
     * 生成密钥
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

2. 初始化密钥会话，发起指纹认证获取认证令牌。

    <!--compile-->
    ```cangjie
    import kit.UniversalKeystoreKit.*
    import kit.UserAuthenticationKit.*

    /*
     * 确定密钥别名和封装密钥属性参数集
     */
    let IV = '1234567890123456'
    let srcKeyAlias = 'test_sm4_key_alias'
    var handle: ?HuksHandle = None
    var challenge: ?Array<UInt8> = None
    var fingerAuthToken: ?Array<UInt8> = None
    let authType = UserAuthType.FINGERPRINT
    let authTrustLevel = AuthTrustLevel.ATL1
    /* 集成生成密钥参数集 & 加密参数集 */
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
    /* 初始化HUKS中的会话，获取挑战值 */
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
    /* 调用UserIAM拉起指纹认证，触发HUKS的访问控制流程 */
    func userIAMAuthFinger(huksChallenge: Array<UInt8>) {
        // 获取认证对象。
        let authTypeList: Array<UserAuthType> = [authType]
        let authParam: AuthParam = AuthParam(
            huksChallenge,
            authTypeList,
            AuthTrustLevel.ATL1
        )
        let widgetParam: WidgetParam = WidgetParam('请输入密码', None)
        var auth: ?UserAuthInstance = None
        try {
            auth = getUserAuthInstance(authParam, widgetParam)
            AppLog.info("get auth instance success")
        } catch (e: Exception) {
            AppLog.error("get auth instance failed" + e.toString())
            return
        }
        // 订阅认证结果。
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
        // 开始认证。
        try {
            auth?.start()
            AppLog.info("authV9 start auth success")
        } catch (e: Exception) {
            AppLog.error("authV9 start auth failed, error = " + e.toString())
        }
    }

    func testInitAndAuthFinger() {
        /* 初始化密钥会话获取挑战值 */
        publicInitFunc(srcKeyAlias, huksOptions)
        /* 调用userIAM进行身份认证 */
        userIAMAuthFinger(challenge.getOrThrow())
    }
    ```

3. 传入认证令牌进行数据操作。

    <!--compile-->
    ```cangjie
    /*
     * 以下以SM4 128密钥为例
     */
    import kit.UniversalKeystoreKit.*

    /*
     * 确定封装密钥属性参数集
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

    /* 集成生成密钥参数集 & 加密参数集 */
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
        /* 传入认证令牌 */
        publicUpdateFunc(handle.getOrThrow(), fingerAuthToken.getOrThrow(), encryptOptions)
        /* 传入认证令牌 */
        publicFinishFunc(handle.getOrThrow(), fingerAuthToken.getOrThrow(), encryptOptions)
        if (finishOutData == StringToUint8Array(cipherInData)) {
            AppLog.info('test finish encrypt error ')
        } else {
            AppLog.info('test finish encrypt success')
        }
    }
    ```
