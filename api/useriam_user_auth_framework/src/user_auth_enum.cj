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

import ohos.labels.*

/**
 * Credential type for authentication.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public enum UserAuthType {
    /**
     * Authentication type pin.
     *
     * @syscap SystemCapability.UserIAM.UserAuth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    PIN
    |
        /**
         * Authentication type face.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    FACE
    |
        /**
         * Authentication type fingerprint.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    FINGERPRINT
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case PIN => 1
            case FACE => 2
            case FINGERPRINT => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
    static func parse(val: UInt32): UserAuthType {
        match (val) {
            case 1 => PIN
            case 2 => FACE
            case 4 => FINGERPRINT
            case _ => PIN
        }
    }
}

/**
 * Trust level of authentication results.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public enum AuthTrustLevel {
    /**
     * Authentication result trusted level 1.
     *
     * @syscap SystemCapability.UserIAM.UserAuth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    ATL1
    |
        /**
         * Authentication result trusted level 2.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    ATL2
    |
        /**
         * Authentication result trusted level 3.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    ATL3
    |
        /**
         * Authentication result trusted level 4.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    ATL4
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case ATL1 => 10000
            case ATL2 => 20000
            case ATL3 => 30000
            case ATL4 => 40000
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * The mode for reusing unlock authentication result.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public enum ReuseMode {
    /**
     * Authentication type relevant.The unlock authentication result can be reused only when the result is within
     * valid duration as well as it comes from one of specified UserAuthTypes of the AuthParam.
     *
     * @syscap SystemCapability.UserIAM.UserAuth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    AUTH_TYPE_RELEVANT
    |

        /**
         * Authentication type irrelevant.The unlock authentication result can be reused as long as the result is within
         * valid duration.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    AUTH_TYPE_IRRELEVANT
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case AUTH_TYPE_RELEVANT => 1
            case AUTH_TYPE_IRRELEVANT => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
