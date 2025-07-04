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

package ohos.user_auth

import std.collection.HashMap
import ohos.labels.*

/**
 * Enum for operation result.
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public class UserAuthResultCode {
    /**
     * Indicates that permission verification failed.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const OHOS_CHECK_PERMISSION_FAILED: Int32 = 201
    /**
     * Indicates that the caller is not a system application.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const OHOS_CHECK_SYSTEM_APP_FAILED: Int32 = 202
    /**
     * Indicates that incorrect parameters.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const OHOS_INVALID_PARAM: Int32 = 401
    /**
     * Indicates that the result is success or ability is supported.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const SUCCESS: Int32 = 12500000
    static const MIN: Int32 = SUCCESS
    /**
     * Indicates that the authentication result is failed.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const FAIL: Int32 = 12500001
    /**
     * Indicates other errors.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const GENERAL_ERROR: Int32 = 12500002
    /**
     * Indicates that this operation is canceled.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const CANCELED: Int32 = 12500003
    /**
     * Indicates that this operation is time-out.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const TIMEOUT: Int32 = 12500004
    /**
     * Indicates that this authentication type is not supported.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const TYPE_NOT_SUPPORT: Int32 = 12500005
    /**
     * Indicates that the authentication trust level is not supported.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const TRUST_LEVEL_NOT_SUPPORT: Int32 = 12500006
    /**
     * Indicates that the authentication task is busy. Wait for a few seconds and try again.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const BUSY: Int32 = 12500007
    /**
     * Indicates that the authenticator is locked.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const LOCKED: Int32 = 12500009
    /**
     * Indicates that the user has not enrolled the authenticator.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const NOT_ENROLLED: Int32 = 12500010
    /**
     * Indicates that this operation is canceled from widget's navigation button.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const CANCELED_FROM_WIDGET: Int32 = 12500011
    /**
     * Indicates that hardware is not supported.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const HARDWARE_NOT_SUPPORTED: Int32 = 12500012
    /**
     * Indicates that current operation failed because of PIN expired.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public static const PIN_EXPIRED: Int32 = 12500013
    static const MAX: Int32 = PIN_EXPIRED
}

class ResultCode {
    /** The result is fail, because parameters is invalid. */
    static const INVALID_PARAMETERS: Int32 = 8
    /** The result is fail, because permission check is failed. */
    static const CHECK_PERMISSION_FAILED: Int32 = 1005
    /** The result is fail, because the caller app is not system. */
    static const CHECK_SYSTEM_APP_FAILED: Int32 = 1007
}

let EXCEPTION_MAP = HashMap<Int32, String>(
    [
        (UserAuthResultCode.OHOS_INVALID_PARAM, "Invalid authentication parameters."),
        (UserAuthResultCode.OHOS_CHECK_PERMISSION_FAILED, "Permission denied."),
        (UserAuthResultCode.OHOS_CHECK_SYSTEM_APP_FAILED, "The caller is not a system application."),
        (UserAuthResultCode.SUCCESS, "Authentication succeeded."),
        (UserAuthResultCode.FAIL, "Authentication failed."),
        (UserAuthResultCode.GENERAL_ERROR, "Unknown errors."),
        (UserAuthResultCode.CANCELED, "Authentication canceled."),
        (UserAuthResultCode.TIMEOUT, "Authentication timeout."),
        (UserAuthResultCode.TYPE_NOT_SUPPORT, "Unsupport authentication type."),
        (UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT, "Unsupport authentication trust level."),
        (UserAuthResultCode.BUSY, "Authentication service is busy."),
        (UserAuthResultCode.LOCKED, "Authentication is lockout."),
        (UserAuthResultCode.NOT_ENROLLED, "Authentication template has not been enrolled."),
        (UserAuthResultCode.CANCELED_FROM_WIDGET, "Authentication is canceled from widget."),
        (UserAuthResultCode.PIN_EXPIRED, "Operation failed because of PIN expired.")
    ]
)
