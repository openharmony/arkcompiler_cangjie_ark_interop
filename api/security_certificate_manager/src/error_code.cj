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

import std.collection.HashMap
import ohos.labels.*

const APPLICATION_CERTIFICATE_STORE: UInt32 = 0
const APPLICATION_PRIVATE_CERTIFICATE_STORE: UInt32 = 3
const CM_USER_TRUSTED_STORE: UInt32 = 2
const OUT_HANLDE_SIZE: UInt32 = 8
const OUT_SIGNATURE_SIZE: UInt32 = 1000
const MAX_LEN_URI: UInt32 = 256
const MAX_LEN_CERTIFICATE: UInt32 = 8196

/**
 * An enum type containing the Asset error codes.
 *
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public class ErrorCode {
    static const CM_SUCCESS: Int32 = 0
    /**
     * Indicates that the application has no permission to call the API.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const HAS_NO_PERMISSION: Int32 = 201
    /**
     * Indicates that the input parameters are invalid.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const PARAM_ERROR: Int32 = 401
    /**
     * Indicates that internal error.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const INNER_FAILURE: Int32 = 17500001
    /**
     * Indicates that the certificate does not exist.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const NOT_FOUND: Int32 = 17500002
    /**
     * Indicates that the keystore is in an invalid format or the keystore password is incorrect.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const INVALID_CERT_FORMAT: Int32 = 17500003
    /**
     * Indicates that the number of certificates or credentials reaches the maximum allowed.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const MAX_CERT_COUNT_REACHED: Int32 = 17500004
    /**
     * Indicates that the application is not authorized by the user.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const NO_AUTHORIZATION: Int32 = 17500005
    /**
     * Indicates that the application is not system application.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const NOT_SYSTEM_APP: Int32 = 202
    /**
     * Indicates that the input alias length reaches the max.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const ALIAS_LENGTH_REACHED_LIMIT: Int32 = 17500006
    /**
     * Indicates that the device enters advanced security mode.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const DEVICE_ENTER_ADVSECMODE: Int32 = 17500007
    /**
     * Indicates that the input password is error.
     *
     * @syscap SystemCapability.Security.CertificateManager
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public static const PASSWORD_IS_ERROR: Int32 = 17500008
}

class NativeCode {
    static const CMR_ERROR_INVALID_ARGUMENT: Int32 = -7
    static const CMR_ERROR_PERMISSION_DENIED: Int32 = -23
    static const CMR_ERROR_NOT_SYSTEMP_APP: Int32 = -26
    static const CMR_ERROR_INVALID_CERT_FORMAT: Int32 = -20
    static const CMR_ERROR_INSUFFICIENT_DATA: Int32 = -18
    static const CMR_ERROR_NOT_FOUND: Int32 = -5
    static const CMR_ERROR_NOT_EXIST: Int32 = -16
    static const CMR_ERROR_MAX_CERT_COUNT_REACHED: Int32 = -27
    static const CMR_ERROR_AUTH_CHECK_FAILED: Int32 = -24
    static const CMR_ERROR_ALIAS_LENGTH_REACHED_LIMIT: Int32 = -28
    static const CMR_ERROR_DEVICE_ENTER_ADVSECMODE: Int32 = -30
    static const CMR_ERROR_PASSWORD_IS_ERR: Int32 = -36
}

let ERROR_CODE_MAP = HashMap<Int32, Int32>(
    (NativeCode.CMR_ERROR_INVALID_ARGUMENT, ErrorCode.PARAM_ERROR),
    (NativeCode.CMR_ERROR_PERMISSION_DENIED, ErrorCode.HAS_NO_PERMISSION),
    (NativeCode.CMR_ERROR_NOT_SYSTEMP_APP, ErrorCode.NOT_SYSTEM_APP),
    (NativeCode.CMR_ERROR_INVALID_CERT_FORMAT, ErrorCode.INVALID_CERT_FORMAT),
    (NativeCode.CMR_ERROR_INSUFFICIENT_DATA, ErrorCode.INVALID_CERT_FORMAT),
    (NativeCode.CMR_ERROR_NOT_FOUND, ErrorCode.NOT_FOUND),
    (NativeCode.CMR_ERROR_NOT_EXIST, ErrorCode.NOT_FOUND),
    (NativeCode.CMR_ERROR_MAX_CERT_COUNT_REACHED, ErrorCode.MAX_CERT_COUNT_REACHED),
    (NativeCode.CMR_ERROR_AUTH_CHECK_FAILED, ErrorCode.NO_AUTHORIZATION),
    (NativeCode.CMR_ERROR_ALIAS_LENGTH_REACHED_LIMIT, ErrorCode.ALIAS_LENGTH_REACHED_LIMIT),
    (NativeCode.CMR_ERROR_DEVICE_ENTER_ADVSECMODE, ErrorCode.DEVICE_ENTER_ADVSECMODE),
    (NativeCode.CMR_ERROR_PASSWORD_IS_ERR, ErrorCode.PASSWORD_IS_ERROR),
)

extend Int32 {
    func toEpt() {
        ERROR_CODE_MAP.get(this).getOrDefault({=> ErrorCode.PARAM_ERROR})
    }
}
