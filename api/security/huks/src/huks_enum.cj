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

package ohos.security.huks

import ohos.labels.*

/**
 * Enum for huks exception error code.
 *
 * @relation export enum HuksExceptionErrCode
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksExceptionErrCode {
    /**
     * Permission verification failed.
     *
     * @relation HUKS_ERR_CODE_PERMISSION_FAIL = 201
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
   HuksErrCodePermissionFail
   |
        /**
         * Invalid parameters are detected. Possible causes:
         * 1. Mandatory parameters are left unspecified.
         * 2. Incorrect parameter types.
         * 3. Parameter verification failed.
         *
         * @relation HUKS_ERR_CODE_ILLEGAL_ARGUMENT = 401
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeIllegalArgument
    |
        /**
         * The API is not supported.
         *
         * @relation HUKS_ERR_CODE_NOT_SUPPORTED_API = 801
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeNotSupportedApi
    |
        /**
         * The feature is not supported.
         *
         * @relation HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED = 12000001
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeFeatureNotSupported
    |
        /**
         * Key algorithm parameters are missing.
         *
         * @relation HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT = 12000002
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeMissingCryptoAlgArgument
    |
        /**
         * Invalid key algorithm parameters are detected.
         *
         * @relation HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT = 12000003
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeInvalidCryptoAlgArgument
    |
        /**
         * The file operation failed.
         *
         * @relation HUKS_ERR_CODE_FILE_OPERATION_FAIL = 12000004
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeFileOperationFail
    |
        /**
         * The communication failed.
         *
         * @relation HUKS_ERR_CODE_COMMUNICATION_FAIL = 12000005
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeCommunicationFail
    |
        /**
         * Failed to operate the algorithm library.
         *
         * @relation HUKS_ERR_CODE_CRYPTO_FAIL = 12000006
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeCryptoFail
    |
        /**
         * Failed to access the key because the key has expired.
         *
         * @relation HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED = 12000007
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeKeyAuthPermanentlyInvalidated
    |
        /**
         * Failed to access the key because the authentication has failed.
         *
         * @relation HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED = 12000008
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeKeyAuthVerifyFailed
    |
        /**
         * Key access timed out.
         *
         * @relation HUKS_ERR_CODE_KEY_AUTH_TIME_OUT = 12000009
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeKeyAuthTimeOut
    |
        /**
         * The number of key operation sessions has reached the limit.
         *
         * @relation HUKS_ERR_CODE_SESSION_LIMIT = 12000010
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeSessionLimit
    |
        /**
         * The target object does not exist.
         *
         * @relation HUKS_ERR_CODE_ITEM_NOT_EXIST = 12000011
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeItemNotExist
    |
        /**
         * An external error occurs.
         *
         * @relation HUKS_ERR_CODE_EXTERNAL_ERROR = 12000012
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeExternalError
    |
        /**
         * The credential does not exist.
         *
         * @relation HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST = 12000013
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeCredentialNotExist
    |
        /**
         * The memory is insufficient.
         *
         * @relation HUKS_ERR_CODE_INSUFFICIENT_MEMORY = 12000014
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeInsufficientMemory
    |
        /**
         * Failed to call other system services.
         *
         * @relation HUKS_ERR_CODE_CALL_SERVICE_FAILED = 12000015
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksErrCodeCallServiceFailed
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): Int32 {
        match(this) {
            case HuksErrCodePermissionFail => 201
            case HuksErrCodeIllegalArgument => 401
            case HuksErrCodeNotSupportedApi => 801
            case HuksErrCodeFeatureNotSupported => 12000001
            case HuksErrCodeMissingCryptoAlgArgument => 12000002
            case HuksErrCodeInvalidCryptoAlgArgument => 12000003
            case HuksErrCodeFileOperationFail => 12000004
            case HuksErrCodeCommunicationFail => 12000005
            case HuksErrCodeCryptoFail => 12000006
            case HuksErrCodeKeyAuthPermanentlyInvalidated => 12000007
            case HuksErrCodeKeyAuthVerifyFailed => 12000008
            case HuksErrCodeKeyAuthTimeOut => 12000009
            case HuksErrCodeSessionLimit => 12000010
            case HuksErrCodeItemNotExist => 12000011
            case HuksErrCodeExternalError => 12000012
            case HuksErrCodeCredentialNotExist => 12000013
            case HuksErrCodeInsufficientMemory => 12000014
            case HuksErrCodeCallServiceFailed => 12000015
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for huks key purpose.
 *
 * @relation export enum HuksKeyPurpose
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksKeyPurpose {
    /**
     * Used to encrypt the plaintext.
     *
     * @relation HUKS_KEY_PURPOSE_ENCRYPT = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeEncrypt
    |
        /**
         * Used to decrypt the cipher text.
         *
         * @relation HUKS_KEY_PURPOSE_DECRYPT = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeDecrypt
    |
        /**
         * Used for signing.
         *
         * @relation HUKS_KEY_PURPOSE_SIGN = 4
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeSign
    |
        /**
         * Used to verify the signature.
         *
         * @relation HUKS_KEY_PURPOSE_VERIFY = 8
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeVerify
    |
        /**
         * Used to derive a key.
         *
         * @relation HUKS_KEY_PURPOSE_DERIVE = 16
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeDerive
    |
        /**
         * Used for an encrypted export.
         *
         * @relation HUKS_KEY_PURPOSE_WRAP = 32
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeWrap
    |
        /**
         * Used for an encrypted import.
         *
         * @relation HUKS_KEY_PURPOSE_UNWRAP = 64
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeUnwrap
    |
        /**
         * Used to generate a message authentication code (MAC).
         *
         * @relation HUKS_KEY_PURPOSE_MAC = 128
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeMac
    |
        /**
         * Used for key agreement.
         *
         * @relation HUKS_KEY_PURPOSE_AGREE = 256
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyPurposeAgree
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksKeyPurposeEncrypt => 1
            case HuksKeyPurposeDecrypt => 2
            case HuksKeyPurposeSign => 4
            case HuksKeyPurposeVerify => 8
            case HuksKeyPurposeDerive => 16
            case HuksKeyPurposeWrap => 32
            case HuksKeyPurposeUnwrap => 64
            case HuksKeyPurposeMac => 128
            case HuksKeyPurposeAgree => 256
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for huks key digest.
 *
 * @relation export enum HuksKeyDigest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksKeyDigest {
    /**
     * No digest algorithm.
     *
     * @relation HUKS_DIGEST_NONE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDigestNone
    |
        /**
         * MD5.
         *
         * @relation HUKS_DIGEST_MD5 = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDigestMd5
    |
        /**
         * SM3.
         *
         * @relation HUKS_DIGEST_SM3 = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDigestSm3
    |
        /**
         * SHA-1.
         *
         * @relation HUKS_DIGEST_SHA1 = 10
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDigestSha1
    |
        /**
         * SHA-224.
         *
         * @relation HUKS_DIGEST_SHA224 = 11
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDigestSha224
    |
        /**
         * SHA-256.
         *
         * @relation HUKS_DIGEST_SHA256 = 12
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDigestSha256
    |
        /**
         * SHA-384.
         *
         * @relation HUKS_DIGEST_SHA384 = 13
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDigestSha384
    |
         /**
         * SHA-512.
         *
         * @relation HUKS_DIGEST_SHA512 = 14
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDigestSha512
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksDigestNone => 0
            case HuksDigestMd5 => 1
            case HuksDigestSm3 => 2
            case HuksDigestSha1 => 10
            case HuksDigestSha224 => 11
            case HuksDigestSha256 => 12
            case HuksDigestSha384 => 13
            case HuksDigestSha512 => 14
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the padding algorithms.
 *
 * @relation export enum HuksKeyPadding
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksKeyPadding {
    /**
     * No padding algorithm is used.
     *
     * @relation HUKS_PADDING_NONE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksPaddingNone
    |
        /**
         * Optimal Asymmetric Encryption Padding (OAEP).
         *
         * @relation HUKS_PADDING_OAEP = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksPaddingOaep
    |
        /**
         * Probabilistic Signature Scheme (PSS).
         *
         * @relation HUKS_PADDING_PSS = 2
         */
       @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksPaddingPss
    |
        /**
         * Public Key Cryptography Standards (PKCS) #1 v1.5.
         *
         * @relation HUKS_PADDING_PKCS1_V1_5 = 3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksPaddingPkcs1V15
    |
        /**
         * PKCS #5.
         *
         * @relation HUKS_PADDING_PKCS5 = 4
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksPaddingPkcs5
    |
        /**
         * PKCS #7.
         *
         * @relation HUKS_PADDING_PKCS7 = 5
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksPaddingPkcs7
    | ...
    
    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksPaddingNone => 0
            case HuksPaddingOaep => 1
            case HuksPaddingPss => 2
            case HuksPaddingPkcs1V15 => 3
            case HuksPaddingPkcs5 => 4
            case HuksPaddingPkcs7 => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the cipher modes.
 *
 * @relation export enum HuksCipherMode
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksCipherMode {
    /**
     * Electronic Code Block (ECB) mode.
     *
     * @relation HUKS_MODE_ECB = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksModeEcb
    |
        /**
         * Cipher Block Chaining (CBC) mode.
         *
         * @relation HUKS_MODE_CBC = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksModeCbc
    |
        /**
         * Counter (CTR) mode.
         *
         * @relation HUKS_MODE_CTR = 3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksModeCtr
    |
        /**
         * Output Feedback (OFB) mode.
         *
         * @relation HUKS_MODE_OFB = 4
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksModeOfb
    |
        /**
         * Counter with CBC-MAC (CCM) mode.
         *
         * @relation HUKS_MODE_CCM = 31
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksModeCcm
    |
        /**
         * Galois/Counter (GCM) mode.
         *
         * @relation HUKS_MODE_GCM = 32
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
   HuksModeGcm
   | ...

   /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
   public func getValue(): UInt32 {
        match (this) {
            case HuksModeEcb => 1
            case HuksModeCbc => 2
            case HuksModeCtr => 3
            case HuksModeOfb => 4
            case HuksModeCcm => 31
            case HuksModeGcm => 32
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the key sizes.
 *
 * @relation export enum HuksKeySize
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksKeySize {
    /**
     * Rivest-Shamir-Adleman (RSA) key of 512 bits.
     *
     * @relation HUKS_RSA_KEY_SIZE_512 = 512
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksRsaKeySize512
    |
        /**
         * RSA key of 768 bits.
         *
         * @relation HUKS_RSA_KEY_SIZE_768 = 768
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksRsaKeySize768
    |
        /**
         * RSA key of 1024 bits.
         *
         * @relation HUKS_RSA_KEY_SIZE_1024 = 1024
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksRsaKeySize1024
    |
        /**
         * RSA key of 2048 bits.
         *
         * @relation HUKS_RSA_KEY_SIZE_2048 = 2048
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksRsaKeySize2048
    |
        /**
         * RSA key of 3072 bits.
         *
         * @relation HUKS_RSA_KEY_SIZE_3072 = 3072
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksRsaKeySize3072
    |
        /**
         * RSA key of 4096 bits.
         *
         * @relation HUKS_RSA_KEY_SIZE_4096 = 4096
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksRsaKeySize4096
    |
        /**
         * Elliptic Curve Cryptography (ECC) key of 224 bits.
         *
         * @relation HUKS_ECC_KEY_SIZE_224 = 224
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksEccKeySize224
    |
        /**
         * ECC key of 256 bits.
         *
         * @relation HUKS_ECC_KEY_SIZE_256 = 256
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksEccKeySize256
    |
        /**
         * ECC key of 384 bits.
         *
         * @relation HUKS_ECC_KEY_SIZE_384 = 384
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksEccKeySize384
    |
        /**
         * ECC key of 521 bits.
         *
         * @relation HUKS_ECC_KEY_SIZE_521 = 521
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksEccKeySize521
    |
        /**
         * Advanced Encryption Standard (AES) key of 128 bits.
         *
         * @relation HUKS_AES_KEY_SIZE_128 = 128
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAesKeySize128
    |
        /**
         * AES key of 192 bits.
         *
         * @relation HUKS_AES_KEY_SIZE_192 = 192
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAesKeySize192
    |
        /**
         * AES key of 256 bits.
         *
         * @relation HUKS_AES_KEY_SIZE_256 = 256
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAesKeySize256
    |
        /**
         * AES key of 512 bits.
         *
         * @relation HUKS_AES_KEY_SIZE_512 = 512
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAesKeySize512
    |
        /**
         * Curve25519 key of 256 bits.
         *
         * @relation HUKS_CURVE25519_KEY_SIZE_256 = 256
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksCurve25519KeySize256
    |
        /**
         * Diffie-Hellman (DH) key of 2048 bits.
         *
         * @relation HUKS_DH_KEY_SIZE_2048 = 2048
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDhKeySize2048
    |
        /**
         * DH key of 3072 bits.
         *
         * @relation HUKS_DH_KEY_SIZE_3072 = 3072
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDhKeySize3072
    |
        /**
         * DH key of 4096 bits.
         *
         * @relation HUKS_DH_KEY_SIZE_4096 = 4096
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksDhKeySize4096
    |
        /**
         * ShangMi2 (SM2) key of 256 bits.
         *
         * @relation HUKS_SM2_KEY_SIZE_256 = 256
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksSm2KeySize256
    |
        /**
         * ShangMi4 (SM4) key of 128 bits.
         *
         * @relation  HUKS_SM4_KEY_SIZE_128 = 128
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksSm4KeySize128
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksRsaKeySize512 => 512
            case HuksRsaKeySize768 => 768
            case HuksRsaKeySize1024 => 1024
            case HuksRsaKeySize2048 => 2048
            case HuksRsaKeySize3072 => 3072
            case HuksRsaKeySize4096 => 4096
            case HuksEccKeySize224 => 224
            case HuksEccKeySize256 => 256
            case HuksEccKeySize384 => 384
            case HuksEccKeySize521 => 521
            case HuksAesKeySize128 => 128
            case HuksAesKeySize192 => 192
            case HuksAesKeySize256 => 256
            case HuksAesKeySize512 => 512
            case HuksCurve25519KeySize256 => 256
            case HuksDhKeySize2048 => 2048
            case HuksDhKeySize3072 => 3072
            case HuksDhKeySize4096 => 4096
            case HuksSm2KeySize256 => 256
            case HuksSm4KeySize128 => 128          
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the key algorithms.
 *
 * @relation  export enum HuksKeyAlg
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksKeyAlg {
    /**
     * RSA.
     *
     * @relation HUKS_ALG_RSA = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgRsa
    |
        /**
         * ECC.
         *
         * @relation HUKS_ALG_ECC = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgEcc
    |
        /**
         * DSA.
         *
         * @relation HUKS_ALG_DSA = 3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgDsa
    |
        /**
         * AES.
         *
         * @relation HUKS_ALG_AES = 20
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgAes
    |
        /**
         * HMAC.
         *
         * @relation HUKS_ALG_HMAC = 50
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgHmac
    |
        /**
         * HKDF.
         *
         * @relation HUKS_ALG_HKDF = 51
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgHkdf
    |
        /**
         * PBKDF2.
         *
         * @relation HUKS_ALG_PBKDF2 = 52
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgPbkdf2
    |
        /**
         * ECDH.
         *
         * @relation HUKS_ALG_ECDH = 100
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgEcdh
    |
        /**
         * X25519.
         *
         * @relation HUKS_ALG_X25519 = 101
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgX25519
    |
        /**
         * Ed25519.
         *
         * @relation HUKS_ALG_ED25519 = 102
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgEd25519
    |
        /**
         * DH.
         *
         * @relation HUKS_ALG_DH = 103
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgDh
    |
        /**
         * SM2.
         *
         * @relation HUKS_ALG_SM2 = 150
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgSm2
    |
        /**
         * SM3.
         *
         * @relation HUKS_ALG_SM3 = 151
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgSm3
    |
        /**
         * SM4.
         *
         * @relation HUKS_ALG_SM4 = 152
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAlgSm4
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksAlgRsa => 1
            case HuksAlgEcc => 2
            case HuksAlgDsa => 3
            case HuksAlgAes => 20
            case HuksAlgHmac => 50
            case HuksAlgHkdf => 51
            case HuksAlgPbkdf2 => 52
            case HuksAlgEcdh => 100
            case HuksAlgX25519 => 101
            case HuksAlgEd25519 => 102
            case HuksAlgDh => 103
            case HuksAlgSm2 => 150
            case HuksAlgSm3 => 151
            case HuksAlgSm4 => 152

            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the algorithm suites that can be used for importing a key in ciphertext.
 *
 * @relation export enum HuksUnwrapSuite
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksUnwrapSuite {
    /**
     * Use X25519 for key agreement and then use AES-256 GCM to encrypt the key.
     *
     * @relation HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksUnwrapSuiteX25519Aes256GcmNopadding
    |
        /**
         * Use ECDH for key agreement and then use AES-256 GCM to encrypt the key.
         *
         * @relation HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksUnwrapSuiteEcdhAes256GcmNopadding
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksUnwrapSuiteX25519Aes256GcmNopadding => 1
            case HuksUnwrapSuiteEcdhAes256GcmNopadding => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for huks auth storage level.
 *
 * @relation export enum HuksAuthStorageLevel
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksAuthStorageLevel {
    /**
     * The key can be accessed only after the device is started.
     *
     * @relation HUKS_AUTH_STORAGE_LEVEL_DE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAuthStorageLevelDe
    |
        /**
         * The key can be accessed only after the first unlock of the device.
         *
         * @relation HUKS_AUTH_STORAGE_LEVEL_CE = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
   HuksAuthStorageLevelCe
   |
        /**
         * The key can be accessed only when the device is unlocked.
         *
         * @relation HUKS_AUTH_STORAGE_LEVEL_ECE = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksAuthStorageLevelEce
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksAuthStorageLevelDe => 0
            case HuksAuthStorageLevelCe => 1
            case HuksAuthStorageLevelEce => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the key generation types.
 *
 * @relation export enum HuksKeyGenerateType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksKeyGenerateType {
    /**
    * Key generated by default.
    *
    * @relation HUKS_KEY_GENERATE_TYPE_DEFAULT = 0
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyGenerateTypeDefault
    |
        /**
        * Derived key.
        *
        * @relation HUKS_KEY_GENERATE_TYPE_DERIVE = 1
        */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyGenerateTypeDerive
    |
        /**
        * Key generated by agreement.
        *
        * @relation HUKS_KEY_GENERATE_TYPE_AGREE = 2
        */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyGenerateTypeAgree
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksKeyGenerateTypeDefault => 0
            case HuksKeyGenerateTypeDerive => 1
            case HuksKeyGenerateTypeAgree => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the key generation modes.
 *
 * @relation export enum HuksKeyFlag
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksKeyFlag {
    /**
    * Import a key using an API.
    *
    * @relation HUKS_KEY_FLAG_IMPORT_KEY = 1
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyFlagImportKey
    |
        /**
        * Generate a key by using an API.
        *
        * @relation HUKS_KEY_FLAG_GENERATE_KEY = 2
        */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyFlagGenerateKey
    |
        /**
        * Generate a key by using a key agreement API.
        *
        * @relation HUKS_KEY_FLAG_AGREE_KEY = 3
        */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyFlagAgreeKey
    |
        /**
        * Derive a key by using an API.
        *
        * @relation HUKS_KEY_FLAG_DERIVE_KEY = 4
        */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyFlagDeriveKey
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksKeyFlagImportKey => 1
            case HuksKeyFlagGenerateKey => 2
            case HuksKeyFlagAgreeKey => 3
            case HuksKeyFlagDeriveKey => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for huks key storage type.
 *
 * @relation export enum HuksKeyStorageType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksKeyStorageType {
    /**
     * The key is managed locally. NOTE: This tag is deprecated since API version 10. No substitute is
     * provided because this tag is not used in key management. In key derivation scenarios, use
     * HUKS_STORAGE_ONLY_USED_IN_HUKS or HUKS_STORAGE_KEY_EXPORT_ALLOWED.
     *
     * @deprecated
     * @relation HUKS_STORAGE_TEMP = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksStorageTemp
    |
        /**
         * The key is managed by the HUKS service. NOTE: This tag is deprecated since API version 10. No
         * substitute is provided because this tag is not used in key management. In key derivation scenarios, use
         * HUKS_STORAGE_ONLY_USED_IN_HUKS or HUKS_STORAGE_KEY_EXPORT_ALLOWED.
         *
         * @deprecated
         * @relation HUKS_STORAGE_PERSISTENT = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksStoragePersistent
    |
        /**
         * The key is stored and used only in HUKS. It is mutually exclusive with HUKS_STORAGE_KEY_EXPORT_ALLOWED.
         *
         * @relation HUKS_STORAGE_ONLY_USED_IN_HUKS = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksStorageOnlyUsedInHuks
    |
        /**
         * The key can be exported. It is mutually exclusive with HUKS_STORAGE_ONLY_USED_IN_HUKS.
         *
         * @relation HUKS_STORAGE_KEY_EXPORT_ALLOWED = 3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksStorageKeyExportAllowed
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksStorageTemp => 0
            case HuksStoragePersistent => 1
            case HuksStorageOnlyUsedInHuks => 2
            case HuksStorageKeyExportAllowed => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the types of keys to import. By default, a public key is imported. This field is not
 * required when a symmetric key is imported.
 *
 * @relation export enum HuksImportKeyType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksImportKeyType {
    /**
     * Public key.
     *
     * @relation HUKS_KEY_TYPE_PUBLIC_KEY = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksKeyTypePublicKey
    |
        /**
         * Private key.
         *
         * @relation HUKS_KEY_TYPE_PRIVATE_KEY = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
   HuksKeyTypePrivateKey
   |
        /**
         * Public and private key pair.
         *
         * @relation HUKS_KEY_TYPE_KEY_PAIR = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
   HuksKeyTypeKeyPair
   | ...

   /**
    * get the corresponding mapping value
    *
    * @throws IllegalArgumentException - The type is not supported.
    */
   public func getValue(): UInt32 {
        match (this) {
            case HuksKeyTypePublicKey => 0
            case HuksKeyTypePrivateKey => 1
            case HuksKeyTypeKeyPair => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the salt_len types to set when PSS padding is used in RSA signing or signature
 * verification.
 *
 * @relation export enum HuksRsaPssSaltLenType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksRsaPssSaltLenType {
    /**
     * salt_len is set to the digest length.
     *
     * @relation HUKS_RSA_PSS_SALT_LEN_DIGEST = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksRsaPssSaltLenDigest
    |
        /**
         * salt_len is set to the maximum length.
         *
         * @relation HUKS_RSA_PSS_SALT_LEN_MAX = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksRsaPssSaltLenMax
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksRsaPssSaltLenDigest => 0
            case HuksRsaPssSaltLenMax => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the user authentication types.
 *
 * @relation export enum HuksUserAuthType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public enum HuksUserAuthType {
    /**
     * Fingerprint authentication.
     *
     * @relation HUKS_USER_AUTH_TYPE_FINGERPRINT = 1 << 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksUserAuthTypeFingerprint
    |
        /**
         * Facial authentication.
         *
         * @relation HUKS_USER_AUTH_TYPE_FACE = 1 << 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksUserAuthTypeFace
    |
        /**
         * PIN authentication.
         *
         * @relation HUKS_USER_AUTH_TYPE_PIN = 1 << 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksUserAuthTypePin
    | ...
    
    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksUserAuthTypeFingerprint => 1 << 0
            case HuksUserAuthTypeFace => 1 << 1
            case HuksUserAuthTypePin => 1 << 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the access control types.
 *
 * @relation export enum HuksAuthAccessType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public enum HuksAuthAccessType {
    /**
     * The key becomes invalid after the password is cleared.
     *
     * @relation HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD = 1 << 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksAuthAccessInvalidClearPassword
    |
        /**
         * The key becomes invalid after a new biometric feature is added.
         *
         * @relation HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL = 1 << 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksAuthAccessInvalidNewBioEnroll
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksAuthAccessInvalidClearPassword => 1 << 0
            case HuksAuthAccessInvalidNewBioEnroll => 1 << 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the types of the challenges generated when a key is used.
 *
 * @relation export enum HuksChallengeType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public enum HuksChallengeType {
    /**
     * Normal challenge, which is of 32 bytes by default.
     *
     * @relation HUKS_CHALLENGE_TYPE_NORMAL = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksChallengeTypeNormal
    |
        /**
         * Custom challenge, which supports only one authentication for multiple keys.
         *
         * @relation HUKS_CHALLENGE_TYPE_CUSTOM = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksChallengeTypeCustom
    |
        /**
         * Challenge is not required.
         *
         * @relation HUKS_CHALLENGE_TYPE_NONE = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
   HuksChallengeTypeNone
   | ...
   
   /**
    * get the corresponding mapping value
    *
    * @throws IllegalArgumentException - The type is not supported.
    */
   public func getValue(): UInt32 {
        match (this) {
            case HuksChallengeTypeNormal => 0
            case HuksChallengeTypeCustom => 1
            case HuksChallengeTypeNone => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the positions of the 8-byte valid value in a custom challenge generated.
 *
 * @relation export enum HuksChallengePosition
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public enum HuksChallengePosition {
    /**
     * Bytes 0 to 7.
     *
     * @relation HUKS_CHALLENGE_POS_0 = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksChallengePos0
    |
        /**
         * Bytes 8 to 15.
         *
         * @relation HUKS_CHALLENGE_POS_1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksChallengePos1
    |
        /**
         * Bytes 16 to 23.
         *
         * @relation HUKS_CHALLENGE_POS_2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksChallengePos2
    |
        /**
         * Bytes 24 to 31.
         *
         * @relation HUKS_CHALLENGE_POS_3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksChallengePos3
    | ...
    
    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksChallengePos0 => 0
            case HuksChallengePos1 => 1
            case HuksChallengePos2 => 2
            case HuksChallengePos3 => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
/**
 * Enumerates the signature types of the key generated or imported. 
 *
 * @relation export enum HuksSecureSignType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public enum HuksSecureSignType {
    /**
     * The signature carries authentication information. This field is specified when a key is generated or
     * imported. When the key is used for signing, the data will be added with the authentication information and then
     * be signed.
     *
     * @relation HUKS_SECURE_SIGN_WITH_AUTHINFO = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksSecureSignWithAuthinfo
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksSecureSignWithAuthinfo => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
/**
 * Enumerates the tag transfer modes.
 *
 * @relation export enum HuksSendType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksSendType {
    /**
     * The tag is sent asynchronously.
     *
     * @relation HUKS_SEND_TYPE_ASYNC = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksSendTypeAsync
    |
        /**
         * The tag is sent synchronously.
         *
         * @relation HUKS_SEND_TYPE_SYNC = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksSendTypeSync
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksSendTypeAsync => 0
            case HuksSendTypeSync => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
/**
 * Enumerates the tag data types.
 *
 * @relation export enum HuksTagType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksTagType {
    /**
     * Invalid tag type.
     *
     * @relation HUKS_TAG_TYPE_INVALID = 0 << 28
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagTypeInvalid
    |
       /**
        * Number of the int type.
        *
        * @relation HUKS_TAG_TYPE_INT = 1 << 28
        */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagTypeInt
    |
        /**
         * Number of the uint type.
         *
         * @relation HUKS_TAG_TYPE_UINT = 2 << 28
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagTypeUint
    |
        /**
         * BigInt.
         *
         * @relation HUKS_TAG_TYPE_ULONG = 3 << 28
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagTypeUlong
    |
        /**
         * Boolean.
         *
         * @relation HUKS_TAG_TYPE_BOOL = 4 << 28
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagTypeBool
    |
        /**
         * Uint8Array.
         *
         * @relation HUKS_TAG_TYPE_BYTES = 5 << 28
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagTypeBytes
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    public func getValue(): UInt32 {
        match (this) {
            case HuksTagTypeInvalid => 0 << 28
            case HuksTagTypeInt => 1 << 28
            case HuksTagTypeUint => 2 << 28
            case HuksTagTypeUlong => 3 << 28
            case HuksTagTypeBool => 4 << 28
            case HuksTagTypeBytes => 5 << 28
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
/**
 * Enum for huks tag.
 *
 * @relation export enum HuksTag 
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksTag {
    /* *
     * Store unknown value 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagsCangjieUnknown(UInt32)
    |	
        /**	
         * Invalid TAG.	
         *	
         * @deprecated
         * @relation HUKS_TAG_INVALID = HuksTagType.HUKS_TAG_TYPE_INVALID | 0
         */	
        @!APILevel[	
        21,	
        deprecated: 9,
        stagemodelonly: true,	
        syscap: "SystemCapability.Security.Huks.Core"	
    ]	
    HuksTagInvalid
    |
        /**
         * Algorithm.
         *
         * @relation HUKS_TAG_ALGORITHM = HuksTagType.HUKS_TAG_TYPE_UINT | 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAlgorithm
    | 
        /**
         * Purpose of the key.
         *
         * @relation HUKS_TAG_PURPOSE = HuksTagType.HUKS_TAG_TYPE_UINT | 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagPurpose
    |
        /**
         * Key size.
         *
         * @relation HUKS_TAG_KEY_SIZE = HuksTagType.HUKS_TAG_TYPE_UINT | 3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeySize
    |
        /**
         * Digest algorithm.
         *
         * @relation HUKS_TAG_DIGEST = HuksTagType.HUKS_TAG_TYPE_UINT | 4
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagDigest
    |
        /**
         * Padding mode.
         *
         * @relation HUKS_TAG_PADDING = HuksTagType.HUKS_TAG_TYPE_UINT | 5
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagPadding
    | 
        /**
         * Cipher mode.
         *
         * @relation HUKS_TAG_BLOCK_MODE = HuksTagType.HUKS_TAG_TYPE_UINT | 6
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagBlockMode
    | 
        /**
         * Key type.
         *
         * @relation HUKS_TAG_KEY_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 7
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeyType
    |
        /**
         * Associated authentication data.
         *
         * @relation HUKS_TAG_ASSOCIATED_DATA = HuksTagType.HUKS_TAG_TYPE_BYTES | 8
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAssociatedData
    | 
        /**
         * Nonce for key encryption and decryption.
         *
         * @relation HUKS_TAG_NONCE = HuksTagType.HUKS_TAG_TYPE_BYTES | 9
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagNonce
    | 
        /**
         * IV.
         *
         * @relation HUKS_TAG_IV = HuksTagType.HUKS_TAG_TYPE_BYTES | 10
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagIv
    |
        /**
         * Information generated during key derivation.
         *
         * @relation HUKS_TAG_INFO = HuksTagType.HUKS_TAG_TYPE_BYTES | 11
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagInfo
    |
        /**
         * Salt value used for key derivation.
         *
         * @relation HUKS_TAG_SALT = HuksTagType.HUKS_TAG_TYPE_BYTES | 12   
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagSalt
    |
        /**
         * Password used for key derivation.
         *
         * @deprecated
         * @relation HUKS_TAG_PWD = HuksTagType.HUKS_TAG_TYPE_BYTES | 13
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagPwd
    |
        /**
         * Number of iterations for key derivation.
         *
         * @relation HUKS_TAG_ITERATION = HuksTagType.HUKS_TAG_TYPE_UINT | 14
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagIteration
    |
        /**
         * Key generation type.
         *
         * @relation HUKS_TAG_KEY_GENERATE_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 15
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeyGenerateType
    |
        /**
         * Main key for key derivation.
         *
         * @deprecated
         * @relation HUKS_TAG_DERIVE_MAIN_KEY = HuksTagType.HUKS_TAG_TYPE_BYTES | 16
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagDeriveMainKey
    |
        /**
         * Factor for key derivation.
         *
         * @deprecated
         * @relation HUKS_TAG_DERIVE_FACTOR = HuksTagType.HUKS_TAG_TYPE_BYTES | 17
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagDeriveFactor
    |
        /**
         * Type of the algorithm used for key derivation.
         *
         * @deprecated
         * @relation HUKS_TAG_DERIVE_ALG = HuksTagType.HUKS_TAG_TYPE_UINT | 18
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagDeriveAlg
    |
        /**
         * Type of the algorithm used for key agreement.
         *
         * @relation HUKS_TAG_AGREE_ALG = HuksTagType.HUKS_TAG_TYPE_UINT | 19
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAgreeAlg
    |
        /**
         * Public key alias used in key agreement.
         *
         * @relation HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS = HuksTagType.HUKS_TAG_TYPE_BOOL | 20
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAgreePublicKeyIsKeyAlias
    |
        /**
         * Private key alias used in key agreement.
         *
         * @relation HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS = HuksTagType.HUKS_TAG_TYPE_BYTES | 21
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAgreePrivateKeyAlias
    |
        /**
         * Public key used in key agreement.
         *
         * @relation UKS_TAG_AGREE_PUBLIC_KEY = HuksTagType.HUKS_TAG_TYPE_BYTES | 22
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAgreePublicKey
    | 
        /**
         * Key alias.
         *
         * @relation HUKS_TAG_KEY_ALIAS = HuksTagType.HUKS_TAG_TYPE_BYTES | 23
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeyAlias
    |
        /**
         * Size of the derived key.
         *
         * @relation HUKS_TAG_DERIVE_KEY_SIZE = HuksTagType.HUKS_TAG_TYPE_UINT | 24
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagDeriveKeySize
    |
        /**
         * Type of the imported key.
         *
         * @relation HUKS_TAG_IMPORT_KEY_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 25
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagImportKeyType
    |
        /**
         * Algorithm suite required for encrypted imports.
         *
         * @relation HUKS_TAG_UNWRAP_ALGORITHM_SUITE = HuksTagType.HUKS_TAG_TYPE_UINT | 26
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagUnwrapAlgorithmSuite
    |
        /**
         * Storage type of the derived key or agreed key.
         *
         * @relation HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG = HuksTagType.HUKS_TAG_TYPE_UINT | 29
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagDerivedAgreedKeyStorageFlag
    |
        /**
         * Type of the rsa_pss_salt_length.
         *
         * @relation HUKS_TAG_RSA_PSS_SALT_LEN_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 30
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagRsaPssSaltLenType
    |
        /**
         * Key authentication related TAG: 201 - 300
         *
         * Start of validity
         * @deprecated
         * @relation HUKS_TAG_ACTIVE_DATETIME = HuksTagType.HUKS_TAG_TYPE_ULONG | 201
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagActiveDatetime
    |
        /**
         * Date when new "messages" should not be created.
         *
         * @deprecated
         * @relation HUKS_TAG_ORIGINATION_EXPIRE_DATETIME = HuksTagType.HUKS_TAG_TYPE_ULONG | 202
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagOriginationExpireDatetime
    |
        /**
         * Date when existing "messages" should not be used.
         *
         * @deprecated
         * @relation HUKS_TAG_USAGE_EXPIRE_DATETIME = HuksTagType.HUKS_TAG_TYPE_ULONG | 203
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagUsageExpireDatetime
    |
        /**
         * Key creation time.
         *
         * @deprecated
         * @relation HUKS_TAG_CREATION_DATETIME = HuksTagType.HUKS_TAG_TYPE_ULONG | 204
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagCreationDatetime
    |
        /**
         * Reserved.
         *
         * @relation HUKS_TAG_ALL_USERS = HuksTagType.HUKS_TAG_TYPE_BOOL | 301
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAllUsers
    |
        /**
         * ID of the user to which the key belongs.
         *
         * @relation HUKS_TAG_USER_ID = HuksTagType.HUKS_TAG_TYPE_UINT | 302
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagUserId
    |
        /**
         * Reserved.
         *
         * @relation HUKS_TAG_NO_AUTH_REQUIRED = HuksTagType.HUKS_TAG_TYPE_BOOL | 303
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagNoAuthRequired
    |
        /**
         * User authentication type. For details, see HuksUserAuthType. This parameter must be set together with
         * HuksAuthAccessType. You can set a maximum of two user authentication types at a time. For example, if
         * HuksAuthAccessType is HUKS_SECURE_ACCESS_INVALID_NEW_BIO_ENROLL, you can set the user authentication type to
         * HUKS_USER_AUTH_TYPE_FACE, HUKS_USER_AUTH_TYPE_FINGERPRINT or
         * HUKS_USER_AUTH_TYPE_FACE | HUKS_USER_AUTH_TYPE_FINGERPRINT.
         *
         * @relation HUKS_TAG_USER_AUTH_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 304
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagUserAuthType
    |
        /**
         * One-time validity period of the authentication token.
         *
         * @relation HUKS_TAG_AUTH_TIMEOUT = HuksTagType.HUKS_TAG_TYPE_UINT | 305
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAuthTimeout
    |
        /**
         * Authentication token.
         *
         * @relation HUKS_TAG_AUTH_TOKEN = HuksTagType.HUKS_TAG_TYPE_BYTES | 306
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAuthToken
    |
        /**
         * Access control type. For details, see HuksAuthAccessType. This parameter must be set together with
         * HuksUserAuthType.
         *
         * @relation HUKS_TAG_KEY_AUTH_ACCESS_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 307
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagKeyAuthAccessType
    |
        /**
         * Signature type of the key generated or imported.
         *
         * @relation HUKS_TAG_KEY_SECURE_SIGN_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 308
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagKeySecureSignType
    |
        /**
         * Type of the challenge generated for a key. For details, see HuksChallengeType.
         *
         * @relation HUKS_TAG_CHALLENGE_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 309
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagChallengeType
    |
        /**
         * Position of the 8-byte valid value in a custom challenge. For details, see HuksChallengePosition.
         *
         * @relation HUKS_TAG_CHALLENGE_POS = HuksTagType.HUKS_TAG_TYPE_UINT | 310
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagChallengePos
    |
        /**
         * Key authentication purpose.
         *
         * @relation HUKS_TAG_KEY_AUTH_PURPOSE = HuksTagType.HUKS_TAG_TYPE_UINT | 311
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagKeyAuthPurpose
    |
        /**
         * Challenge value used in the attestation.
         *
         * @relation HUKS_TAG_ATTESTATION_CHALLENGE = HuksTagType.HUKS_TAG_TYPE_BYTES | 501
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationChallenge
    |
        /**
         * Application ID used in the attestation.
         *
         * @relation HUKS_TAG_ATTESTATION_APPLICATION_ID = HuksTagType.HUKS_TAG_TYPE_BYTES | 502
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationApplicationId
    |
        /**
         * Brand of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_BRAND = HuksTagType.HUKS_TAG_TYPE_BYTES | 503
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdBrand
    |
        /**
         * ID of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_DEVICE = HuksTagType.HUKS_TAG_TYPE_BYTES | 504
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdDevice
    |
        /**
         * Product name of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_PRODUCT = HuksTagType.HUKS_TAG_TYPE_BYTES | 505
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdProduct
    |
        /**
         * SN of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_SERIAL = HuksTagType.HUKS_TAG_TYPE_BYTES | 506
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdSerial
    |
        /**
         * International mobile equipment identity (IMEI) of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_IMEI = HuksTagType.HUKS_TAG_TYPE_BYTES | 507
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdImei
    |
        /**
         * Mobile equipment identity (MEID) of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_MEID = HuksTagType.HUKS_TAG_TYPE_BYTES | 508
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdMeid
    |
        /**
         * Manufacturer of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_MANUFACTURER = HuksTagType.HUKS_TAG_TYPE_BYTES | 509
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdManufacturer
    |
        /**
         * Device model.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_MODEL = HuksTagType.HUKS_TAG_TYPE_BYTES | 510
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdModel
    |
        /**
         * Key alias used in the attestation.
         *
         * @relation HUKS_TAG_ATTESTATION_ID_ALIAS = HuksTagType.HUKS_TAG_TYPE_BYTES | 511
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdAlias
    |
        /**
         * System-on-a-chip (SoCID) of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_SOCID = HuksTagType.HUKS_TAG_TYPE_BYTES | 512
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdSocid
    |
        /**
         * Unique device identifier (UDID) of the device.
         *
         * @deprecated
         * @relation HUKS_TAG_ATTESTATION_ID_UDID = HuksTagType.HUKS_TAG_TYPE_BYTES | 513
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdUdid
    |
        /**
         * Security level used in the attestation.
         *
         * @relation HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO = HuksTagType.HUKS_TAG_TYPE_BYTES | 514
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdSecLevelInfo
    |
        /**
         * Version information used in the attestation.
         *
         * @relation HUKS_TAG_ATTESTATION_ID_VERSION_INFO = HuksTagType.HUKS_TAG_TYPE_BYTES | 515
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationIdVersionInfo
    | 
        /**
         * Huks Tag Attestation Base64
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationBase64
    | 
        /**
         * Huks Tag Attestation Mode
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationMode
    | 
        /**
         * Huks Tag Attestation Application Id Type
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAttestationApplicationIdType
    |
        /*
         * Whether to use the alias passed in during key generation.
         *
         * @relation HUKS_TAG_IS_KEY_ALIAS = HuksTagType.HUKS_TAG_TYPE_BOOL | 1001
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagIsKeyAlias
    |
        /*
         * Key storage mode.
         *
         * @relation HUKS_TAG_KEY_STORAGE_FLAG = HuksTagType.HUKS_TAG_TYPE_UINT | 1002
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeyStorageFlag
    |
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_IS_ALLOWED_WRAP = HuksTagType.HUKS_TAG_TYPE_BOOL | 1003
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagIsAllowedWrap
    |
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_KEY_WRAP_TYPE = HuksTagType.HUKS_TAG_TYPE_UINT | 1004
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeyWrapType
    |
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_KEY_AUTH_ID = HuksTagType.HUKS_TAG_TYPE_BYTES | 1005
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagKeyAuthId
    |
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_KEY_ROLE = HuksTagType.HUKS_TAG_TYPE_UINT | 1006
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeyRole
    |
        /*
         * Flag of the key.
         *
         * @relation HUKS_TAG_KEY_FLAG = HuksTagType.HUKS_TAG_TYPE_UINT | 1007
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeyFlag
    |
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_IS_ASYNCHRONIZED = HuksTagType.HUKS_TAG_TYPE_UINT | 1008
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagIsAsynchronized
    |
        /**
         * Reserved field.
         *
         * @deprecated
         * @relation HUKS_TAG_SECURE_KEY_ALIAS = HuksTagType.HUKS_TAG_TYPE_BOOL | 1009
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagSecureKeyAlias
    |
        /**
         * Reserved field.
         *
         * @deprecated
         * @relation HUKS_TAG_SECURE_KEY_UUID = HuksTagType.HUKS_TAG_TYPE_BYTES | 1010
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagSecureKeyUuid
    |
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_KEY_DOMAIN = HuksTagType.HUKS_TAG_TYPE_UINT | 1011
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKeyDomain
    |
        /**
         * Inner-use TAG: 10001 - 10999
         *
         * @deprecated
         * @relation HUKS_TAG_PROCESS_NAME = HuksTagType.HUKS_TAG_TYPE_BYTES | 10001
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagProcessName
    |
        /**
         * Reserved field
         *
         * @deprecated
         * @relation HUKS_TAG_PACKAGE_NAME = HuksTagType.HUKS_TAG_TYPE_BYTES | 10002
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagPackageName
    |
        /**
         * Reserved field
         *
         * @deprecated
         * @relation HUKS_TAG_ACCESS_TIME = HuksTagType.HUKS_TAG_TYPE_UINT | 10003
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagAccessTime
    |
        /**
         * Reserved field.
         *
         * @deprecated
         * @relation HUKS_TAG_USES_TIME = HuksTagType.HUKS_TAG_TYPE_UINT | 10004
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagUsesTime
    |
        /**
         * Reserved field.
         *
         * @deprecated
         * @relation HUKS_TAG_CRYPTO_CTX = HuksTagType.HUKS_TAG_TYPE_ULONG | 10005
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagCryptoCtx
    |   
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_KEY = HuksTagType.HUKS_TAG_TYPE_BYTES | 10006
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagKey
    |
        /**
         * Key version.
         *
         * @deprecated
         * @relation HUKS_TAG_KEY_VERSION = HuksTagType.HUKS_TAG_TYPE_UINT | 10007
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagKeyVersion
    |
        /**
         * Reserved field.
         *
         * @deprecated
         * @relation HUKS_TAG_PAYLOAD_LEN = HuksTagType.HUKS_TAG_TYPE_UINT | 10008
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Extension"
    ]
    HuksTagPayloadLen
    | 
        /*
         * Used to pass in the AEAD in GCM mode.
         *
         * @relation HUKS_TAG_AE_TAG = HuksTagType.HUKS_TAG_TYPE_BYTES | 10009
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAeTag
    |
        /**
         * Reserved field.
         *
         * @deprecated
         * @relation HUKS_TAG_IS_KEY_HANDLE = HuksTagType.HUKS_TAG_TYPE_ULONG | 10010
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagIsKeyHandle
    |
        /**
         * Os version related TAG.
         *
         * @deprecated
         * @relation HUKS_TAG_OS_VERSION = HuksTagType.HUKS_TAG_TYPE_UINT | 10101
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagOsVersion
    |
        /**
         * OS patch level.
         *
         * @deprecated
         * @relation HUKS_TAG_OS_PATCHLEVEL = HuksTagType.HUKS_TAG_TYPE_UINT | 10102
         */
        @!APILevel[
        21,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagOsPatchlevel
    |
        /*
         * Used to pass in the AEAD in GCM mode.
         *
         * @relation HUKS_TAG_SYMMETRIC_KEY_DATA = HuksTagType.HUKS_TAG_TYPE_BYTES | 20001
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagSymmetricKeyData
    |
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA = HuksTagType.HUKS_TAG_TYPE_BYTES | 20002
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAsymmetricPublicKeyData
    |
        /*
         * Reserved.
         *
         * @relation HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA = HuksTagType.HUKS_TAG_TYPE_BYTES | 20003
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    HuksTagAsymmetricPrivateKeyData
    | ...

    /**
     * get the corresponding mapping value
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case HuksTagsCangjieUnknown(val) => val
            case HuksTagInvalid => HuksTagType.HuksTagTypeInvalid.getValue() | 0
            case HuksTagAlgorithm => HuksTagType.HuksTagTypeUint.getValue() | 1
            case HuksTagPurpose => HuksTagType.HuksTagTypeUint.getValue() | 2
            case HuksTagKeySize => HuksTagType.HuksTagTypeUint.getValue() | 3
            case HuksTagDigest => HuksTagType.HuksTagTypeUint.getValue() | 4
            case HuksTagPadding => HuksTagType.HuksTagTypeUint.getValue() | 5
            case HuksTagBlockMode => HuksTagType.HuksTagTypeUint.getValue() | 6
            case HuksTagKeyType => HuksTagType.HuksTagTypeUint.getValue() | 7
            case HuksTagAssociatedData => HuksTagType.HuksTagTypeBytes.getValue() | 8
            case HuksTagNonce => HuksTagType.HuksTagTypeBytes.getValue() | 9
            case HuksTagIv => HuksTagType.HuksTagTypeBytes.getValue() | 10
            case HuksTagInfo => HuksTagType.HuksTagTypeBytes.getValue() | 11
            case HuksTagSalt => HuksTagType.HuksTagTypeBytes.getValue() | 12
            case HuksTagPwd => HuksTagType.HuksTagTypeBytes.getValue() | 13
            case HuksTagIteration => HuksTagType.HuksTagTypeUint.getValue() | 14
            case HuksTagKeyGenerateType => HuksTagType.HuksTagTypeUint.getValue() | 15
            case HuksTagDeriveMainKey => HuksTagType.HuksTagTypeBytes.getValue() | 16
            case HuksTagDeriveFactor => HuksTagType.HuksTagTypeBytes.getValue() | 17
            case HuksTagDeriveAlg => HuksTagType.HuksTagTypeUint.getValue() | 15
            case HuksTagAgreeAlg => HuksTagType.HuksTagTypeUint.getValue() | 19
            case HuksTagAgreePublicKeyIsKeyAlias => HuksTagType.HuksTagTypeBool.getValue() | 20
            case HuksTagAgreePrivateKeyAlias => HuksTagType.HuksTagTypeBytes.getValue() | 21
            case HuksTagAgreePublicKey => HuksTagType.HuksTagTypeBytes.getValue() | 22
            case HuksTagKeyAlias => HuksTagType.HuksTagTypeBytes.getValue() | 23
            case HuksTagDeriveKeySize => HuksTagType.HuksTagTypeUint.getValue() | 24
            case HuksTagImportKeyType => HuksTagType.HuksTagTypeUint.getValue() | 25
            case HuksTagUnwrapAlgorithmSuite => HuksTagType.HuksTagTypeUint.getValue() | 26
            case HuksTagDerivedAgreedKeyStorageFlag => HuksTagType.HuksTagTypeUint.getValue() | 29
            case HuksTagRsaPssSaltLenType => HuksTagType.HuksTagTypeUint.getValue() | 30
            case HuksTagActiveDatetime => HuksTagType.HuksTagTypeUlong.getValue() | 201
            case HuksTagOriginationExpireDatetime => HuksTagType.HuksTagTypeUlong.getValue() | 202
            case HuksTagUsageExpireDatetime => HuksTagType.HuksTagTypeUlong.getValue() | 203
            case HuksTagCreationDatetime => HuksTagType.HuksTagTypeUlong.getValue() | 204
            case HuksTagAllUsers => HuksTagType.HuksTagTypeBool.getValue() | 301
            case HuksTagUserId => HuksTagType.HuksTagTypeUint.getValue() | 302
            case HuksTagNoAuthRequired => HuksTagType.HuksTagTypeBool.getValue() | 303
            case HuksTagUserAuthType => HuksTagType.HuksTagTypeUint.getValue() | 304
            case HuksTagAuthTimeout => HuksTagType.HuksTagTypeUint.getValue() | 305
            case HuksTagAuthToken => HuksTagType.HuksTagTypeBytes.getValue() | 306
            case HuksTagKeyAuthAccessType => HuksTagType.HuksTagTypeUint.getValue() | 307
            case HuksTagKeySecureSignType => HuksTagType.HuksTagTypeUint.getValue() | 308
            case HuksTagChallengeType => HuksTagType.HuksTagTypeUint.getValue() | 309
            case HuksTagChallengePos => HuksTagType.HuksTagTypeUint.getValue() | 310
            case HuksTagKeyAuthPurpose => HuksTagType.HuksTagTypeUint.getValue() | 311
            case HuksTagAttestationChallenge => HuksTagType.HuksTagTypeBytes.getValue() | 501
            case HuksTagAttestationApplicationId => HuksTagType.HuksTagTypeBytes.getValue() | 502
            case HuksTagAttestationIdBrand => HuksTagType.HuksTagTypeBytes.getValue() | 503
            case HuksTagAttestationIdDevice => HuksTagType.HuksTagTypeBytes.getValue() | 504
            case HuksTagAttestationIdProduct => HuksTagType.HuksTagTypeBytes.getValue() | 505
            case HuksTagAttestationIdSerial => HuksTagType.HuksTagTypeBytes.getValue() | 506
            case HuksTagAttestationIdImei => HuksTagType.HuksTagTypeBytes.getValue() | 507
            case HuksTagAttestationIdMeid => HuksTagType.HuksTagTypeBytes.getValue() | 508
            case HuksTagAttestationIdManufacturer => HuksTagType.HuksTagTypeBytes.getValue() | 509
            case HuksTagAttestationIdModel => HuksTagType.HuksTagTypeBytes.getValue() | 510
            case HuksTagAttestationIdAlias => HuksTagType.HuksTagTypeBytes.getValue() | 511
            case HuksTagAttestationIdSocid => HuksTagType.HuksTagTypeBytes.getValue() | 512
            case HuksTagAttestationIdUdid => HuksTagType.HuksTagTypeBytes.getValue() | 513
            case HuksTagAttestationIdSecLevelInfo => HuksTagType.HuksTagTypeBytes.getValue() | 514
            case HuksTagAttestationIdVersionInfo => HuksTagType.HuksTagTypeBytes.getValue() | 515
            case HuksTagAttestationBase64 => HuksTagType.HuksTagTypeBool.getValue() | 516
            case HuksTagAttestationMode => HuksTagType.HuksTagTypeUint.getValue() | 517
            case HuksTagAttestationApplicationIdType => HuksTagType.HuksTagTypeUint.getValue() | 518
            case HuksTagIsKeyAlias => HuksTagType.HuksTagTypeBool.getValue() | 1001
            case HuksTagKeyStorageFlag => HuksTagType.HuksTagTypeUint.getValue() | 1002
            case HuksTagIsAllowedWrap => HuksTagType.HuksTagTypeBool.getValue() | 1003
            case HuksTagKeyWrapType => HuksTagType.HuksTagTypeUint.getValue() | 1004
            case HuksTagKeyAuthId => HuksTagType.HuksTagTypeBytes.getValue() | 1005
            case HuksTagKeyRole => HuksTagType.HuksTagTypeUint.getValue() | 1006
            case HuksTagKeyFlag => HuksTagType.HuksTagTypeUint.getValue() | 1007
            case HuksTagIsAsynchronized => HuksTagType.HuksTagTypeUint.getValue() | 1008
            case HuksTagSecureKeyAlias => HuksTagType.HuksTagTypeBool.getValue() | 1009
            case HuksTagSecureKeyUuid => HuksTagType.HuksTagTypeBytes.getValue() | 1010
            case HuksTagKeyDomain => HuksTagType.HuksTagTypeUint.getValue() | 1011
            case HuksTagProcessName => HuksTagType.HuksTagTypeBytes.getValue() | 10001
            case HuksTagPackageName => HuksTagType.HuksTagTypeBytes.getValue() | 10002
            case HuksTagAccessTime => HuksTagType.HuksTagTypeUint.getValue() | 10003
            case HuksTagUsesTime => HuksTagType.HuksTagTypeUint.getValue() | 10004
            case HuksTagCryptoCtx => HuksTagType.HuksTagTypeUlong.getValue() | 10005
            case HuksTagKey => HuksTagType.HuksTagTypeBytes.getValue() | 10006
            case HuksTagKeyVersion => HuksTagType.HuksTagTypeUint.getValue() | 10007
            case HuksTagPayloadLen => HuksTagType.HuksTagTypeUint.getValue()| 10008
            case HuksTagAeTag => HuksTagType.HuksTagTypeBytes.getValue() | 10009
            case HuksTagIsKeyHandle => HuksTagType.HuksTagTypeUlong.getValue() | 10010
            case HuksTagOsVersion => HuksTagType.HuksTagTypeUint.getValue() | 10101
            case HuksTagOsPatchlevel => HuksTagType.HuksTagTypeUint.getValue() | 10102
            case HuksTagSymmetricKeyData => HuksTagType.HuksTagTypeBytes.getValue() | 20001
            case HuksTagAsymmetricPublicKeyData => HuksTagType.HuksTagTypeBytes.getValue() | 20002
            case HuksTagAsymmetricPrivateKeyData => HuksTagType.HuksTagTypeBytes.getValue() | 20003
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static func parse(val: UInt32): HuksTag {
        match (val) {
            case 0x0 => HuksTagInvalid
            case 0x20000001 => HuksTagAlgorithm
            case 0x20000002 => HuksTagPurpose
            case 0x20000003 => HuksTagKeySize
            case 0x20000004 => HuksTagDigest
            case 0x20000005 => HuksTagPadding
            case 0x20000006 => HuksTagBlockMode
            case 0x20000007 => HuksTagKeyType
            case 0x50000008 => HuksTagAssociatedData
            case 0x50000009 => HuksTagNonce
            case 0x5000000a => HuksTagIv
            case 0x5000000b => HuksTagInfo
            case 0x5000000c => HuksTagSalt
            case 0x5000000d => HuksTagPwd
            case 0x2000000e => HuksTagIteration
            case 0x2000000f => HuksTagKeyGenerateType
            case 0x50000010 => HuksTagDeriveMainKey
            case 0x50000011 => HuksTagDeriveFactor
            case 0x20000012 => HuksTagDeriveAlg
            case 0x20000013 => HuksTagAgreeAlg
            case 0x40000014 => HuksTagAgreePublicKeyIsKeyAlias
            case 0x50000015 => HuksTagAgreePrivateKeyAlias
            case 0x50000016 => HuksTagAgreePublicKey
            case 0x50000017 => HuksTagKeyAlias
            case 0x20000018 => HuksTagDeriveKeySize
            case 0x20000019 => HuksTagImportKeyType
            case 0x2000001a => HuksTagUnwrapAlgorithmSuite
            case 0x2000001d => HuksTagDerivedAgreedKeyStorageFlag
            case 0x2000001e => HuksTagRsaPssSaltLenType
            case 0x300000c9 => HuksTagActiveDatetime
            case 0x300000ca => HuksTagOriginationExpireDatetime
            case 0x300000cb => HuksTagUsageExpireDatetime
            case 0x300000cc => HuksTagCreationDatetime
            case 0x4000012d => HuksTagAllUsers
            case 0x2000012e => HuksTagUserId
            case 0x4000012f => HuksTagNoAuthRequired
            case 0x20000130 => HuksTagUserAuthType
            case 0x20000131 => HuksTagAuthTimeout
            case 0x50000132 => HuksTagAuthToken
            case 0x20000133 => HuksTagKeyAuthAccessType
            case 0x20000134 => HuksTagKeySecureSignType
            case 0x20000135 => HuksTagChallengeType
            case 0x20000136 => HuksTagChallengePos
            case 0x20000137 => HuksTagKeyAuthPurpose
            case 0x500001f5 => HuksTagAttestationChallenge
            case 0x500001f6 => HuksTagAttestationApplicationId
            case 0x500001f7 => HuksTagAttestationIdBrand
            case 0x500001f8 => HuksTagAttestationIdDevice
            case 0x500001f9 => HuksTagAttestationIdProduct
            case 0x500001fa => HuksTagAttestationIdSerial
            case 0x500001fb => HuksTagAttestationIdImei
            case 0x500001fc => HuksTagAttestationIdMeid
            case 0x500001fd => HuksTagAttestationIdManufacturer
            case 0x500001fe => HuksTagAttestationIdModel
            case 0x500001ff => HuksTagAttestationIdAlias
            case 0x50000200 => HuksTagAttestationIdSocid
            case 0x50000201 => HuksTagAttestationIdUdid
            case 0x50000202 => HuksTagAttestationIdSecLevelInfo
            case 0x50000203 => HuksTagAttestationIdVersionInfo
            case 0x40000204 => HuksTagAttestationBase64
            case 0x20000205 => HuksTagAttestationMode
            case 0x20000206 => HuksTagAttestationApplicationIdType
            case 0x400003e9 => HuksTagIsKeyAlias
            case 0x200003ea => HuksTagKeyStorageFlag
            case 0x400003eb => HuksTagIsAllowedWrap
            case 0x200003ec => HuksTagKeyWrapType
            case 0x500003ed => HuksTagKeyAuthId
            case 0x200003ee => HuksTagKeyRole
            case 0x200003ef => HuksTagKeyFlag
            case 0x200003f0 => HuksTagIsAsynchronized           
            case 0x400003f1 => HuksTagSecureKeyAlias
            case 0x500003f2 => HuksTagSecureKeyUuid
            case 0x200003f3 => HuksTagKeyDomain
            case 0x50002711 => HuksTagProcessName
            case 0x50002712 => HuksTagPackageName
            case 0x20002713 => HuksTagAccessTime
            case 0x20002714 => HuksTagUsesTime
            case 0x30002715 => HuksTagCryptoCtx
            case 0x50002716 => HuksTagKey
            case 0x20002717 => HuksTagKeyVersion
            case 0x20002718 => HuksTagPayloadLen
            case 0x50002719 => HuksTagAeTag
            case 0x3000271a => HuksTagIsKeyHandle
            case 0x20002775 => HuksTagOsVersion
            case 0x20002776 => HuksTagOsPatchlevel
            case 0x50004e21 => HuksTagSymmetricKeyData
            case 0x50004e22 => HuksTagAsymmetricPublicKeyData
            case 0x50004e23 => HuksTagAsymmetricPrivateKeyData
            case _ => HuksTagsCangjieUnknown(val)
        }
    }
}

const HKS_SUCCESS: Int32 = 0
const HKS_ERROR_NOT_EXIST: Int32 = -13
