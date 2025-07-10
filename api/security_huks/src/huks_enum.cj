/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.security_huks

import ohos.labels.*

/**
 * Enum for huks exception error code.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksExceptionErrCode {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_PERMISSION_FAIL: Int32 = 201
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_ILLEGAL_ARGUMENT: Int32 = 401
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_NOT_SUPPORTED_API: Int32 = 801
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED: Int32 = 12000001
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT: Int32 = 12000002
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT: Int32 = 12000003
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_FILE_OPERATION_FAIL: Int32 = 12000004
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_COMMUNICATION_FAIL: Int32 = 12000005
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_CRYPTO_FAIL: Int32 = 12000006
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED: Int32 = 12000007
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED: Int32 = 12000008
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_KEY_AUTH_TIME_OUT: Int32 = 12000009
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_SESSION_LIMIT: Int32 = 12000010
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_ITEM_NOT_EXIST: Int32 = 12000011
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_EXTERNAL_ERROR: Int32 = 12000012
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST: Int32 = 12000013
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_INSUFFICIENT_MEMORY: Int32 = 12000014
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ERR_CODE_CALL_SERVICE_FAILED: Int32 = 12000015
}

/**
 * Enum for huks key purpose.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksKeyPurpose {
    /* Usable with RSA, EC and AES keys. */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_ENCRYPT: HuksParamValue = HuksParamValue.uint32(1)
    /* Usable with RSA, EC and AES keys. */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_DECRYPT: HuksParamValue = HuksParamValue.uint32(2)
    /**
     * Usable with RSA, EC keys.
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_SIGN: HuksParamValue = HuksParamValue.uint32(4)
    /**
     * Usable with RSA, EC keys.
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_VERIFY: HuksParamValue = HuksParamValue.uint32(8)
    /**
     * Usable with EC keys.
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_DERIVE: HuksParamValue = HuksParamValue.uint32(16)
    /**
     * Usable with wrap key.
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_WRAP: HuksParamValue = HuksParamValue.uint32(32)
    /**
     * Usable with unwrap key.
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_UNWRAP: HuksParamValue = HuksParamValue.uint32(64)
    /**
     * Usable with mac.
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_MAC: HuksParamValue = HuksParamValue.uint32(128)
    /**
     * Usable with agree.
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_PURPOSE_AGREE: HuksParamValue = HuksParamValue.uint32(256)
}

/**
 * Enum for huks key digest.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksKeyDigest {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DIGEST_NONE: HuksParamValue = HuksParamValue.uint32(0)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DIGEST_MD5: HuksParamValue = HuksParamValue.uint32(1)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DIGEST_SM3: HuksParamValue = HuksParamValue.uint32(2)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DIGEST_SHA1: HuksParamValue = HuksParamValue.uint32(10)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DIGEST_SHA224: HuksParamValue = HuksParamValue.uint32(11)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DIGEST_SHA256: HuksParamValue = HuksParamValue.uint32(12)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DIGEST_SHA384: HuksParamValue = HuksParamValue.uint32(13)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DIGEST_SHA512: HuksParamValue = HuksParamValue.uint32(14)
}

/**
 * Enum for huks key padding.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksKeyPadding {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_PADDING_NONE: HuksParamValue = HuksParamValue.uint32(0)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_PADDING_OAEP: HuksParamValue = HuksParamValue.uint32(1)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_PADDING_PSS: HuksParamValue = HuksParamValue.uint32(2)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_PADDING_PKCS1_V1_5: HuksParamValue = HuksParamValue.uint32(3)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_PADDING_PKCS5: HuksParamValue = HuksParamValue.uint32(4)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_PADDING_PKCS7: HuksParamValue = HuksParamValue.uint32(5)
}

/**
 * Enum for huks cipher mode.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksCipherMode {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_MODE_ECB: HuksParamValue = HuksParamValue.uint32(1)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_MODE_CBC: HuksParamValue = HuksParamValue.uint32(2)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_MODE_CTR: HuksParamValue = HuksParamValue.uint32(3)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_MODE_OFB: HuksParamValue = HuksParamValue.uint32(4)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_MODE_CCM: HuksParamValue = HuksParamValue.uint32(31)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_MODE_GCM: HuksParamValue = HuksParamValue.uint32(32)
}

/**
 * Enum for huks key size.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksKeySize {
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_RSA_KEY_SIZE_512: HuksParamValue = HuksParamValue.uint32(512)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_RSA_KEY_SIZE_768: HuksParamValue = HuksParamValue.uint32(768)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_RSA_KEY_SIZE_1024: HuksParamValue = HuksParamValue.uint32(1024)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_RSA_KEY_SIZE_2048: HuksParamValue = HuksParamValue.uint32(2048)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_RSA_KEY_SIZE_3072: HuksParamValue = HuksParamValue.uint32(3072)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_RSA_KEY_SIZE_4096: HuksParamValue = HuksParamValue.uint32(4096)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ECC_KEY_SIZE_224: HuksParamValue = HuksParamValue.uint32(224)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ECC_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ECC_KEY_SIZE_384: HuksParamValue = HuksParamValue.uint32(384)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ECC_KEY_SIZE_521: HuksParamValue = HuksParamValue.uint32(521)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_AES_KEY_SIZE_128: HuksParamValue = HuksParamValue.uint32(128)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_AES_KEY_SIZE_192: HuksParamValue = HuksParamValue.uint32(192)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_AES_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_AES_KEY_SIZE_512: HuksParamValue = HuksParamValue.uint32(512)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_CURVE25519_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DH_KEY_SIZE_2048: HuksParamValue = HuksParamValue.uint32(2048)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DH_KEY_SIZE_3072: HuksParamValue = HuksParamValue.uint32(3072)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_DH_KEY_SIZE_4096: HuksParamValue = HuksParamValue.uint32(4096)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_SM2_KEY_SIZE_256: HuksParamValue = HuksParamValue.uint32(256)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_SM4_KEY_SIZE_128: HuksParamValue = HuksParamValue.uint32(128)
}

/**
 * Enum for huks key algorithm.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksKeyAlg {
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_RSA: HuksParamValue = HuksParamValue.uint32(1)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_ECC: HuksParamValue = HuksParamValue.uint32(2)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_DSA: HuksParamValue = HuksParamValue.uint32(3)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_AES: HuksParamValue = HuksParamValue.uint32(20)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_HMAC: HuksParamValue = HuksParamValue.uint32(50)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_HKDF: HuksParamValue = HuksParamValue.uint32(51)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_PBKDF2: HuksParamValue = HuksParamValue.uint32(52)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_ECDH: HuksParamValue = HuksParamValue.uint32(100)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_X25519: HuksParamValue = HuksParamValue.uint32(101)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_ED25519: HuksParamValue = HuksParamValue.uint32(102)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_DH: HuksParamValue = HuksParamValue.uint32(103)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_SM2: HuksParamValue = HuksParamValue.uint32(150)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_SM3: HuksParamValue = HuksParamValue.uint32(151)
    /**
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_ALG_SM4: HuksParamValue = HuksParamValue.uint32(152)
}

/**
 * Enum for huks unwrap suite.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksUnwrapSuite {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(1)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING: HuksParamValue = HuksParamValue.uint32(2)
}

/**
 * Enum for huks auth storage level.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksAuthStorageLevel {
    /**
     * Key file storage security level for device encryption standard.
     * @syscap SystemCapability.Security.Huks.Core
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_AUTH_STORAGE_LEVEL_DE: HuksParamValue = HuksParamValue.uint32(0)
    /**
     * Key file storage security level for credential encryption standard.
     * @syscap SystemCapability.Security.Huks.Core
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_AUTH_STORAGE_LEVEL_CE: HuksParamValue = HuksParamValue.uint32(1)
    /**
     * Key file storage security level for enhanced credential encryption standard.
     * @syscap SystemCapability.Security.Huks.Core
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_AUTH_STORAGE_LEVEL_ECE: HuksParamValue = HuksParamValue.uint32(2)
}

/**
 * Enum for huks key generate type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksKeyGenerateType {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_GENERATE_TYPE_DEFAULT: HuksParamValue = HuksParamValue.uint32(0)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_GENERATE_TYPE_DERIVE: HuksParamValue = HuksParamValue.uint32(1)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_GENERATE_TYPE_AGREE: HuksParamValue = HuksParamValue.uint32(2)
}
/**
 * Enum for huks key flag.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksKeyFlag {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_FLAG_IMPORT_KEY: HuksParamValue = HuksParamValue.uint32(1)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_FLAG_GENERATE_KEY: HuksParamValue = HuksParamValue.uint32(2)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_FLAG_AGREE_KEY: HuksParamValue = HuksParamValue.uint32(3)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_FLAG_DERIVE_KEY: HuksParamValue = HuksParamValue.uint32(4)
}
/**
 * Enum for huks key storage type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksKeyStorageType {
    /**
     * @syscap SystemCapability.Security.Huks.Core
     * @deprecated
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_STORAGE_TEMP: HuksParamValue = HuksParamValue.uint32(0)
    /**
     * @syscap SystemCapability.Security.Huks.Core
     * @deprecated
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_STORAGE_PERSISTENT: HuksParamValue = HuksParamValue.uint32(1)
    /**
     * The key is stored and used only in HUKS. It is mutually exclusive with HUKS_STORAGE_KEY_EXPORT_ALLOWED.
     *
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_STORAGE_ONLY_USED_IN_HUKS: HuksParamValue = HuksParamValue.uint32(2)
    /**
     * The key can be exported. It is mutually exclusive with HUKS_STORAGE_ONLY_USED_IN_HUKS.
     *
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_STORAGE_KEY_EXPORT_ALLOWED: HuksParamValue = HuksParamValue.uint32(3)
}
/**
 * Enum for huks import key type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksImportKeyType {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_TYPE_PUBLIC_KEY: HuksParamValue = HuksParamValue.uint32(0)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_TYPE_PRIVATE_KEY: HuksParamValue = HuksParamValue.uint32(1)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_KEY_TYPE_KEY_PAIR: HuksParamValue = HuksParamValue.uint32(2)
}
/**
 * Enum for rsa salt len type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksRsaPssSaltLenType {
    /**
     * Salt length that matches the digest length.
     *
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_RSA_PSS_SALT_LEN_DIGEST: HuksParamValue = HuksParamValue.uint32(0)
    /**
     * Maximum salt length.
     *
     * @syscap SystemCapability.Security.Huks.Extension
     */
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_RSA_PSS_SALT_LEN_MAX: HuksParamValue = HuksParamValue.uint32(1)
}
/**
 * Enum for huks user auth type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public class HuksUserAuthType {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_USER_AUTH_TYPE_FINGERPRINT: HuksParamValue = HuksParamValue.uint32(1 << 0)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_USER_AUTH_TYPE_FACE: HuksParamValue = HuksParamValue.uint32(1 << 1)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_USER_AUTH_TYPE_PIN: HuksParamValue = HuksParamValue.uint32(1 << 2)
}

/**
 * Enum for huks auth access type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public class HuksAuthAccessType {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD: HuksParamValue = HuksParamValue.uint32(1 << 0)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL: HuksParamValue = HuksParamValue.uint32(1 << 1)
}
/**
 * Enum for huks auth access challenge type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public class HuksChallengeType {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_CHALLENGE_TYPE_NORMAL: HuksParamValue = HuksParamValue.uint32(0)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_CHALLENGE_TYPE_CUSTOM: HuksParamValue = HuksParamValue.uint32(1)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_CHALLENGE_TYPE_NONE: HuksParamValue = HuksParamValue.uint32(2)
}
/**
 * Enum for huks challenge position.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public class HuksChallengePosition {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_CHALLENGE_POS_0: HuksParamValue = HuksParamValue.uint32(0)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_CHALLENGE_POS_1: HuksParamValue = HuksParamValue.uint32(1)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_CHALLENGE_POS_2: HuksParamValue = HuksParamValue.uint32(2)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_CHALLENGE_POS_3: HuksParamValue = HuksParamValue.uint32(3)
}
/**
 * Enum for huks secure sign type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public class HuksSecureSignType {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    public static const HUKS_SECURE_SIGN_WITH_AUTHINFO: HuksParamValue = HuksParamValue.uint32(1)
}
/**
 * Enum for huks ipc send type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksSendType {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_SEND_TYPE_ASYNC: HuksParamValue = HuksParamValue.uint32(0)
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_SEND_TYPE_SYNC: HuksParamValue = HuksParamValue.uint32(1)
}
/**
 * Enum for huks base tag type.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksTagType {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_TAG_TYPE_INVALID: UInt32 = 0 << 28
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_TAG_TYPE_INT: UInt32 = 1 << 28
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_TAG_TYPE_UINT: UInt32 = 2 << 28
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_TAG_TYPE_ULONG: UInt32 = 3 << 28
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_TAG_TYPE_BOOL: UInt32 = 4 << 28
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static const HUKS_TAG_TYPE_BYTES: UInt32 = 5 << 28
}
/**
 * Enum for huks tag.
 *
 * @enum { number }
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksTag {
    /* Store unknown value */
    @!APILevel[
        15,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAGS_CANGJIE_UNKNOWN(UInt32)
    |
        /**
         * Invalid TAG
         *
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_INVALID
    |
        /* Base algrithom TAG: 1 - 200 */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_ALGORITHM
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_PURPOSE
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_SIZE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_DIGEST
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_PADDING
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_BLOCK_MODE
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_TYPE
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_ASSOCIATED_DATA
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_NONCE
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_IV
    |
        /* Key derivation TAG */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_INFO
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_SALT
    |
        /**
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_PWD
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_ITERATION
    |
        /* choose from enum HuksKeyGenerateType */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_GENERATE_TYPE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_DERIVE_MAIN_KEY
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_DERIVE_FACTOR
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_DERIVE_ALG
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_AGREE_ALG
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_AGREE_PUBLIC_KEY
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_ALIAS
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_DERIVE_KEY_SIZE
    |
        /**
         * Choose from enum HuksImportKeyType
         *
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_IMPORT_KEY_TYPE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_UNWRAP_ALGORITHM_SUITE
    |
        /**
         * Key storage type, which can be HUKS_STORAGE_ONLY_USED_IN_HUKS or HUKS_STORAGE_KEY_EXPORT_ALLOWED.
         *
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG
    |
        /**
         * RSA salt length type. For details, see HuksRsaPssSaltLenType.
         *
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_RSA_PSS_SALT_LEN_TYPE
    |
        /*
         * Key authentication related TAG: 201 - 300
         *
         * Start of validity
         */
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ACTIVE_DATETIME
    |
        /**
         * Date when new "messages" should not be created.
         *
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_ORIGINATION_EXPIRE_DATETIME
    |
        /**
         * Date when existing "messages" should not be used.
         *
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_USAGE_EXPIRE_DATETIME
    |
        /**
         * Key creation time.
         *
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_CREATION_DATETIME
    |
        /* Other authentication related TAG: 301 - 500 */
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_ALL_USERS
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_USER_ID
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_NO_AUTH_REQUIRED
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_USER_AUTH_TYPE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_AUTH_TIMEOUT
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_AUTH_TOKEN
    |
        /* Key secure access control and user auth TAG */
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_KEY_AUTH_ACCESS_TYPE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_KEY_SECURE_SIGN_TYPE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_CHALLENGE_TYPE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_CHALLENGE_POS
    |
        /**
         * Supported key secure access control purpose tag, the value from enum HuksKeyPurpose.
         *
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_KEY_AUTH_PURPOSE
    |
        /* Attestation related TAG: 501 - 600 */
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_CHALLENGE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_APPLICATION_ID
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_BRAND
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_DEVICE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_PRODUCT
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_SERIAL
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_IMEI
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_MEID
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_MANUFACTURER
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_MODEL
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_ALIAS
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_SOCID
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_UDID
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_ID_VERSION_INFO
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_BASE64
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_MODE
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ATTESTATION_APPLICATION_ID_TYPE
    |
        /*
         * Other reserved TAG: 601 - 1000
         *
         * Extention TAG: 1001 - 9999
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_IS_KEY_ALIAS
    |
        /* choose from enum HuksKeyStorageType */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_STORAGE_FLAG
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_IS_ALLOWED_WRAP
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_WRAP_TYPE
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_AUTH_ID
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_ROLE
    |
        /* choose from enum HuksKeyFlag */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_FLAG
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_IS_ASYNCHRONIZED
    |
        /**
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_SECURE_KEY_ALIAS
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_SECURE_KEY_UUID
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY_DOMAIN
    |
        /* Inner-use TAG: 10001 - 10999 */
        /**
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_PROCESS_NAME
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_PACKAGE_NAME
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_ACCESS_TIME
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_USES_TIME
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_CRYPTO_CTX
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_KEY
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_KEY_VERSION
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HUKS_TAG_PAYLOAD_LEN
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_AE_TAG
    |
        /**
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_IS_KEY_HANDLE
    |
        /* Os version related TAG */
        /**
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_OS_VERSION
    |
        /**
         * @syscap SystemCapability.Security.Huks.Core
         * @deprecated
         */
        @!APILevel[
        15,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_OS_PATCHLEVEL
    |
        /*
         * Reversed TAGs for SOTER: 11000 - 12000
         *
         * Other TAGs: 20001 - N
         * TAGs used for paramSetOut
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_SYMMETRIC_KEY_DATA
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA
    |
        /**
         * @syscap SystemCapability.Security.Huks.Extension
         */
        @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA
    | ...

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case HUKS_TAGS_CANGJIE_UNKNOWN(val) => val
            case HUKS_TAG_INVALID => HuksTagType.HUKS_TAG_TYPE_INVALID | 0
            case HUKS_TAG_ALGORITHM => HuksTagType.HUKS_TAG_TYPE_UINT | 1
            case HUKS_TAG_PURPOSE => HuksTagType.HUKS_TAG_TYPE_UINT | 2
            case HUKS_TAG_KEY_SIZE => HuksTagType.HUKS_TAG_TYPE_UINT | 3
            case HUKS_TAG_DIGEST => HuksTagType.HUKS_TAG_TYPE_UINT | 4
            case HUKS_TAG_PADDING => HuksTagType.HUKS_TAG_TYPE_UINT | 5
            case HUKS_TAG_BLOCK_MODE => HuksTagType.HUKS_TAG_TYPE_UINT | 6
            case HUKS_TAG_KEY_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 7
            case HUKS_TAG_ASSOCIATED_DATA => HuksTagType.HUKS_TAG_TYPE_BYTES | 8
            case HUKS_TAG_NONCE => HuksTagType.HUKS_TAG_TYPE_BYTES | 9
            case HUKS_TAG_IV => HuksTagType.HUKS_TAG_TYPE_BYTES | 10
            case HUKS_TAG_INFO => HuksTagType.HUKS_TAG_TYPE_BYTES | 11
            case HUKS_TAG_SALT => HuksTagType.HUKS_TAG_TYPE_BYTES | 12
            case HUKS_TAG_PWD => HuksTagType.HUKS_TAG_TYPE_BYTES | 13
            case HUKS_TAG_ITERATION => HuksTagType.HUKS_TAG_TYPE_UINT | 14
            case HUKS_TAG_KEY_GENERATE_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 15
            case HUKS_TAG_DERIVE_MAIN_KEY => HuksTagType.HUKS_TAG_TYPE_BYTES | 16
            case HUKS_TAG_DERIVE_FACTOR => HuksTagType.HUKS_TAG_TYPE_BYTES | 17
            case HUKS_TAG_DERIVE_ALG => HuksTagType.HUKS_TAG_TYPE_UINT | 15
            case HUKS_TAG_AGREE_ALG => HuksTagType.HUKS_TAG_TYPE_UINT | 19
            case HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS => HuksTagType.HUKS_TAG_TYPE_BOOL | 20
            case HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS => HuksTagType.HUKS_TAG_TYPE_BYTES | 21
            case HUKS_TAG_AGREE_PUBLIC_KEY => HuksTagType.HUKS_TAG_TYPE_BYTES | 22
            case HUKS_TAG_KEY_ALIAS => HuksTagType.HUKS_TAG_TYPE_BYTES | 23
            case HUKS_TAG_DERIVE_KEY_SIZE => HuksTagType.HUKS_TAG_TYPE_UINT | 24
            case HUKS_TAG_IMPORT_KEY_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 25
            case HUKS_TAG_UNWRAP_ALGORITHM_SUITE => HuksTagType.HUKS_TAG_TYPE_UINT | 26
            case HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG => HuksTagType.HUKS_TAG_TYPE_UINT | 29
            case HUKS_TAG_RSA_PSS_SALT_LEN_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 30
            case HUKS_TAG_ACTIVE_DATETIME => HuksTagType.HUKS_TAG_TYPE_ULONG | 201
            case HUKS_TAG_ORIGINATION_EXPIRE_DATETIME => HuksTagType.HUKS_TAG_TYPE_ULONG | 202
            case HUKS_TAG_USAGE_EXPIRE_DATETIME => HuksTagType.HUKS_TAG_TYPE_ULONG | 203
            case HUKS_TAG_CREATION_DATETIME => HuksTagType.HUKS_TAG_TYPE_ULONG | 204
            case HUKS_TAG_ALL_USERS => HuksTagType.HUKS_TAG_TYPE_BOOL | 301
            case HUKS_TAG_USER_ID => HuksTagType.HUKS_TAG_TYPE_UINT | 302
            case HUKS_TAG_NO_AUTH_REQUIRED => HuksTagType.HUKS_TAG_TYPE_BOOL | 303
            case HUKS_TAG_USER_AUTH_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 304
            case HUKS_TAG_AUTH_TIMEOUT => HuksTagType.HUKS_TAG_TYPE_UINT | 305
            case HUKS_TAG_AUTH_TOKEN => HuksTagType.HUKS_TAG_TYPE_BYTES | 306
            case HUKS_TAG_KEY_AUTH_ACCESS_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 307
            case HUKS_TAG_KEY_SECURE_SIGN_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 308
            case HUKS_TAG_CHALLENGE_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 309
            case HUKS_TAG_CHALLENGE_POS => HuksTagType.HUKS_TAG_TYPE_UINT | 310
            case HUKS_TAG_KEY_AUTH_PURPOSE => HuksTagType.HUKS_TAG_TYPE_UINT | 311
            case HUKS_TAG_ATTESTATION_CHALLENGE => HuksTagType.HUKS_TAG_TYPE_BYTES | 501
            case HUKS_TAG_ATTESTATION_APPLICATION_ID => HuksTagType.HUKS_TAG_TYPE_BYTES | 502
            case HUKS_TAG_ATTESTATION_ID_BRAND => HuksTagType.HUKS_TAG_TYPE_BYTES | 503
            case HUKS_TAG_ATTESTATION_ID_DEVICE => HuksTagType.HUKS_TAG_TYPE_BYTES | 504
            case HUKS_TAG_ATTESTATION_ID_PRODUCT => HuksTagType.HUKS_TAG_TYPE_BYTES | 505
            case HUKS_TAG_ATTESTATION_ID_SERIAL => HuksTagType.HUKS_TAG_TYPE_BYTES | 506
            case HUKS_TAG_ATTESTATION_ID_IMEI => HuksTagType.HUKS_TAG_TYPE_BYTES | 507
            case HUKS_TAG_ATTESTATION_ID_MEID => HuksTagType.HUKS_TAG_TYPE_BYTES | 508
            case HUKS_TAG_ATTESTATION_ID_MANUFACTURER => HuksTagType.HUKS_TAG_TYPE_BYTES | 509
            case HUKS_TAG_ATTESTATION_ID_MODEL => HuksTagType.HUKS_TAG_TYPE_BYTES | 510
            case HUKS_TAG_ATTESTATION_ID_ALIAS => HuksTagType.HUKS_TAG_TYPE_BYTES | 511
            case HUKS_TAG_ATTESTATION_ID_SOCID => HuksTagType.HUKS_TAG_TYPE_BYTES | 512
            case HUKS_TAG_ATTESTATION_ID_UDID => HuksTagType.HUKS_TAG_TYPE_BYTES | 513
            case HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO => HuksTagType.HUKS_TAG_TYPE_BYTES | 514
            case HUKS_TAG_ATTESTATION_ID_VERSION_INFO => HuksTagType.HUKS_TAG_TYPE_BYTES | 515
            case HUKS_TAG_ATTESTATION_BASE64 => HuksTagType.HUKS_TAG_TYPE_BOOL | 516
            case HUKS_TAG_ATTESTATION_MODE => HuksTagType.HUKS_TAG_TYPE_UINT | 517
            case HUKS_TAG_ATTESTATION_APPLICATION_ID_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 518
            case HUKS_TAG_IS_KEY_ALIAS => HuksTagType.HUKS_TAG_TYPE_BOOL | 1001
            case HUKS_TAG_KEY_STORAGE_FLAG => HuksTagType.HUKS_TAG_TYPE_UINT | 1002
            case HUKS_TAG_IS_ALLOWED_WRAP => HuksTagType.HUKS_TAG_TYPE_BOOL | 1003
            case HUKS_TAG_KEY_WRAP_TYPE => HuksTagType.HUKS_TAG_TYPE_UINT | 1004
            case HUKS_TAG_KEY_AUTH_ID => HuksTagType.HUKS_TAG_TYPE_BYTES | 1005
            case HUKS_TAG_KEY_ROLE => HuksTagType.HUKS_TAG_TYPE_UINT | 1006
            case HUKS_TAG_KEY_FLAG => HuksTagType.HUKS_TAG_TYPE_UINT | 1007
            case HUKS_TAG_IS_ASYNCHRONIZED => HuksTagType.HUKS_TAG_TYPE_UINT | 1008
            case HUKS_TAG_SECURE_KEY_ALIAS => HuksTagType.HUKS_TAG_TYPE_BOOL | 1009
            case HUKS_TAG_SECURE_KEY_UUID => HuksTagType.HUKS_TAG_TYPE_BYTES | 1010
            case HUKS_TAG_KEY_DOMAIN => HuksTagType.HUKS_TAG_TYPE_UINT | 1011
            case HUKS_TAG_PROCESS_NAME => HuksTagType.HUKS_TAG_TYPE_BYTES | 10001
            case HUKS_TAG_PACKAGE_NAME => HuksTagType.HUKS_TAG_TYPE_BYTES | 10002
            case HUKS_TAG_ACCESS_TIME => HuksTagType.HUKS_TAG_TYPE_UINT | 10003
            case HUKS_TAG_USES_TIME => HuksTagType.HUKS_TAG_TYPE_UINT | 10004
            case HUKS_TAG_CRYPTO_CTX => HuksTagType.HUKS_TAG_TYPE_ULONG | 10005
            case HUKS_TAG_KEY => HuksTagType.HUKS_TAG_TYPE_BYTES | 10006
            case HUKS_TAG_KEY_VERSION => HuksTagType.HUKS_TAG_TYPE_UINT | 10007
            case HUKS_TAG_PAYLOAD_LEN => HuksTagType.HUKS_TAG_TYPE_UINT | 10008
            case HUKS_TAG_AE_TAG => HuksTagType.HUKS_TAG_TYPE_BYTES | 10009
            case HUKS_TAG_IS_KEY_HANDLE => HuksTagType.HUKS_TAG_TYPE_ULONG | 10010
            case HUKS_TAG_OS_VERSION => HuksTagType.HUKS_TAG_TYPE_UINT | 10101
            case HUKS_TAG_OS_PATCHLEVEL => HuksTagType.HUKS_TAG_TYPE_UINT | 10102
            case HUKS_TAG_SYMMETRIC_KEY_DATA => HuksTagType.HUKS_TAG_TYPE_BYTES | 20001
            case HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA => HuksTagType.HUKS_TAG_TYPE_BYTES | 20002
            case HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA => HuksTagType.HUKS_TAG_TYPE_BYTES | 20003
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static func parse(val: UInt32): HuksTag {
        match (val) {
            case 0x0 => HUKS_TAG_INVALID
            case 0x20000001 => HUKS_TAG_ALGORITHM
            case 0x20000002 => HUKS_TAG_PURPOSE
            case 0x20000003 => HUKS_TAG_KEY_SIZE
            case 0x20000004 => HUKS_TAG_DIGEST
            case 0x20000005 => HUKS_TAG_PADDING
            case 0x20000006 => HUKS_TAG_BLOCK_MODE
            case 0x20000007 => HUKS_TAG_KEY_TYPE
            case 0x50000008 => HUKS_TAG_ASSOCIATED_DATA
            case 0x50000009 => HUKS_TAG_NONCE
            case 0x5000000a => HUKS_TAG_IV
            case 0x5000000b => HUKS_TAG_INFO
            case 0x5000000c => HUKS_TAG_SALT
            case 0x5000000d => HUKS_TAG_PWD
            case 0x2000000e => HUKS_TAG_ITERATION
            case 0x2000000f => HUKS_TAG_KEY_GENERATE_TYPE
            case 0x50000010 => HUKS_TAG_DERIVE_MAIN_KEY
            case 0x50000011 => HUKS_TAG_DERIVE_FACTOR
            case 0x20000012 => HUKS_TAG_DERIVE_ALG
            case 0x20000013 => HUKS_TAG_AGREE_ALG
            case 0x40000014 => HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS
            case 0x50000015 => HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS
            case 0x50000016 => HUKS_TAG_AGREE_PUBLIC_KEY
            case 0x50000017 => HUKS_TAG_KEY_ALIAS
            case 0x20000018 => HUKS_TAG_DERIVE_KEY_SIZE
            case 0x20000019 => HUKS_TAG_IMPORT_KEY_TYPE
            case 0x2000001a => HUKS_TAG_UNWRAP_ALGORITHM_SUITE
            case 0x2000001d => HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG
            case 0x2000001e => HUKS_TAG_RSA_PSS_SALT_LEN_TYPE
            case 0x300000c9 => HUKS_TAG_ACTIVE_DATETIME
            case 0x300000ca => HUKS_TAG_ORIGINATION_EXPIRE_DATETIME
            case 0x300000cb => HUKS_TAG_USAGE_EXPIRE_DATETIME
            case 0x300000cc => HUKS_TAG_CREATION_DATETIME
            case 0x4000012d => HUKS_TAG_ALL_USERS
            case 0x2000012e => HUKS_TAG_USER_ID
            case 0x4000012f => HUKS_TAG_NO_AUTH_REQUIRED
            case 0x20000130 => HUKS_TAG_USER_AUTH_TYPE
            case 0x20000131 => HUKS_TAG_AUTH_TIMEOUT
            case 0x50000132 => HUKS_TAG_AUTH_TOKEN
            case 0x20000133 => HUKS_TAG_KEY_AUTH_ACCESS_TYPE
            case 0x20000134 => HUKS_TAG_KEY_SECURE_SIGN_TYPE
            case 0x20000135 => HUKS_TAG_CHALLENGE_TYPE
            case 0x20000136 => HUKS_TAG_CHALLENGE_POS
            case 0x20000137 => HUKS_TAG_KEY_AUTH_PURPOSE
            case 0x500001f5 => HUKS_TAG_ATTESTATION_CHALLENGE
            case 0x500001f6 => HUKS_TAG_ATTESTATION_APPLICATION_ID
            case 0x500001f7 => HUKS_TAG_ATTESTATION_ID_BRAND
            case 0x500001f8 => HUKS_TAG_ATTESTATION_ID_DEVICE
            case 0x500001f9 => HUKS_TAG_ATTESTATION_ID_PRODUCT
            case 0x500001fa => HUKS_TAG_ATTESTATION_ID_SERIAL
            case 0x500001fb => HUKS_TAG_ATTESTATION_ID_IMEI
            case 0x500001fc => HUKS_TAG_ATTESTATION_ID_MEID
            case 0x500001fd => HUKS_TAG_ATTESTATION_ID_MANUFACTURER
            case 0x500001fe => HUKS_TAG_ATTESTATION_ID_MODEL
            case 0x500001ff => HUKS_TAG_ATTESTATION_ID_ALIAS
            case 0x50000200 => HUKS_TAG_ATTESTATION_ID_SOCID
            case 0x50000201 => HUKS_TAG_ATTESTATION_ID_UDID
            case 0x50000202 => HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO
            case 0x50000203 => HUKS_TAG_ATTESTATION_ID_VERSION_INFO
            case 0x40000204 => HUKS_TAG_ATTESTATION_BASE64
            case 0x20000205 => HUKS_TAG_ATTESTATION_MODE
            case 0x20000206 => HUKS_TAG_ATTESTATION_APPLICATION_ID_TYPE
            case 0x400003e9 => HUKS_TAG_IS_KEY_ALIAS
            case 0x200003ea => HUKS_TAG_KEY_STORAGE_FLAG
            case 0x400003eb => HUKS_TAG_IS_ALLOWED_WRAP
            case 0x200003ec => HUKS_TAG_KEY_WRAP_TYPE
            case 0x500003ed => HUKS_TAG_KEY_AUTH_ID
            case 0x200003ee => HUKS_TAG_KEY_ROLE
            case 0x200003ef => HUKS_TAG_KEY_FLAG
            case 0x200003f0 => HUKS_TAG_IS_ASYNCHRONIZED
            case 0x400003f1 => HUKS_TAG_SECURE_KEY_ALIAS
            case 0x500003f2 => HUKS_TAG_SECURE_KEY_UUID
            case 0x200003f3 => HUKS_TAG_KEY_DOMAIN
            case 0x50002711 => HUKS_TAG_PROCESS_NAME
            case 0x50002712 => HUKS_TAG_PACKAGE_NAME
            case 0x20002713 => HUKS_TAG_ACCESS_TIME
            case 0x20002714 => HUKS_TAG_USES_TIME
            case 0x30002715 => HUKS_TAG_CRYPTO_CTX
            case 0x50002716 => HUKS_TAG_KEY
            case 0x20002717 => HUKS_TAG_KEY_VERSION
            case 0x20002718 => HUKS_TAG_PAYLOAD_LEN
            case 0x50002719 => HUKS_TAG_AE_TAG
            case 0x3000271a => HUKS_TAG_IS_KEY_HANDLE
            case 0x20002775 => HUKS_TAG_OS_VERSION
            case 0x20002776 => HUKS_TAG_OS_PATCHLEVEL
            case 0x50004e21 => HUKS_TAG_SYMMETRIC_KEY_DATA
            case 0x50004e22 => HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA
            case 0x50004e23 => HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA
            case _ => HUKS_TAGS_CANGJIE_UNKNOWN(val)
        }
    }
}

const HKS_SUCCESS: Int32 = 0
const HKS_ERROR_NOT_EXIST: Int32 = -13
