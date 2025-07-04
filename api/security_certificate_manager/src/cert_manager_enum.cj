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

package ohos.cert_manager

import std.deriving.*
import ohos.labels.*

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public enum CmKeyPurpose {
    /**
     * Indicates that key for signature.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_KEY_PURPOSE_SIGN
    |
        /**
         * Indicates that key for verify.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_KEY_PURPOSE_VERIFY
    | ...

    func getValue(): UInt32 {
        match (this) {
            case CM_KEY_PURPOSE_SIGN => 4
            case CM_KEY_PURPOSE_VERIFY => 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public enum CmKeyPadding {
    /**
     * Indicates that key padding is none.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_PADDING_NONE
    |
        /**
         * Indicates that key padding is PSS.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_PADDING_PSS
    |
        /**
         * Indicates that key padding is PKCS1_V1_5.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_PADDING_PKCS1_V1_5
    | ...

    func getValue(): UInt32 {
        match (this) {
            case CM_PADDING_NONE => 0
            case CM_PADDING_PSS => 2
            case CM_PADDING_PKCS1_V1_5 => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public enum CmKeyDigest {
    /**
     * Indicates that key digest is none.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_DIGEST_NONE
    |
        /**
         * Indicates that key digest is md5.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_DIGEST_MD5
    |
        /**
         * Indicates that key digest is sha1.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_DIGEST_SHA1
    |
        /**
         * Indicates that key digest is sha224.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_DIGEST_SHA224
    |
        /**
         * Indicates that key digest is sha256.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_DIGEST_SHA256
    |
        /**
         * Indicates that key digest is sha384.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_DIGEST_SHA384
    |
        /**
         * Indicates that key digest is sha512.
         *
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    CM_DIGEST_SHA512
    | ...

    func getValue(): UInt32 {
        match (this) {
            case CM_DIGEST_NONE => 0
            case CM_DIGEST_MD5 => 1
            case CM_DIGEST_SHA1 => 10
            case CM_DIGEST_SHA224 => 11
            case CM_DIGEST_SHA256 => 12
            case CM_DIGEST_SHA384 => 13
            case CM_DIGEST_SHA512 => 14
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
