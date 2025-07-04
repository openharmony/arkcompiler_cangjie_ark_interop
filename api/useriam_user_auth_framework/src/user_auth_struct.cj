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
 * Enrolled state.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public class EnrolledState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public let credentialDigest: UInt64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public let credentialCount: UInt16

    init(credentialDigest: UInt64, credentialCount: UInt16) {
        this.credentialDigest = credentialDigest
        this.credentialCount = credentialCount
    }
}

/**
 * Auth parameter.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public class AuthParam {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public AuthParam(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let challenge: Array<Byte>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let authType: Array<UserAuthType>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let authTrustLevel: AuthTrustLevel,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let reuseUnlockResult!: ?ReuseUnlockResult = Option.None
    ) {}
}

@C
struct CAuthParam {
    CAuthParam(
        let challenge: CPointer<Byte>,
        let challengeLen: Int64,
        let authType: CPointer<UInt32>,
        let authTypeLen: Int64,
        let authTrustLevel: UInt32,
        let isReuse: Bool,
        let reuseMode: UInt32,
        let reuseDuration: UInt64
    ) {}
}

/**
 * Auth widget parameter.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public class WidgetParam {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public WidgetParam(
        /**
         * Title of widget.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let title: String,

        /**
         * The description text of navigation button.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let navigationButtonText: ?String
    ) {}
}

@C
struct CWidgetParam {
    CWidgetParam(
        let title: CString,
        let navigationButtonText: CString
    ) {}
}

/**
 * Reuse unlock authentication result.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public class ReuseUnlockResult {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public ReuseUnlockResult(
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
        public let reuseMode: ReuseMode,
        /**
         * The allowable reuse duration.The value of the duration should be between 0 and MAX_ALLOWABLE_REUSE_DURATION.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let reuseDuration: UInt64
    ) {
    }
}

/**
 * Authentication result: authentication token, credential type for authentication succeed.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public class UserAuthResult {
    UserAuthResult(
        /**
         * The authentication result.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let result: Int32,

        /**
         * The authentication result if the authentication is passed.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let token: ?Array<Byte>,

        /**
         * Credential type for authentication succeed.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let authType: ?UserAuthType,

        /**
         * The enrolled state for authentication succeed. EnrolledState would be returned when the authentication has
         * passed.
         *
         * @syscap SystemCapability.UserIAM.UserAuth.Core
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.UserIAM.UserAuth.Core"
        ]
        public let enrolledState: ?EnrolledState
    ) {}
}
/**
 * Authentication result: authentication token, credential type for authentication succeed.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@C
struct CUserAuthResult {
    CUserAuthResult(
        let result: Int32,
        let token: CPointer<Byte>,
        let tokenLen: Int64,
        let authType: UInt32,
        let credentialDigest: UInt64,
        let credentialCount: UInt16
    ) {}
}

class CallbackRef {
    CallbackRef(let ptr: CPointer<Unit>) {}
}
