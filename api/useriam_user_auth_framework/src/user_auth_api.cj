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

import ohos.base.BusinessException
import ohos.labels.*

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.permission.ACCESS_BIOMETRIC",
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public func getAvailableStatus(authType: UserAuthType, authTrustLevel: AuthTrustLevel): Unit {
    let resultCode = unsafe { FfiUserAuthGetAvailableStatus(authType.getValue(), authTrustLevel.getValue()) }
    let userAuthResultCode = codeConvert(resultCode)
    if (userAuthResultCode == UserAuthResultCode.SUCCESS) {
        return
    }
    throw BusinessException(userAuthResultCode, EXCEPTION_MAP[userAuthResultCode])
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.permission.ACCESS_BIOMETRIC",
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public func getEnrolledState(authType: UserAuthType): EnrolledState {
    var enrolledState = CEnrolledState(0, 0)
    let resultCode = unsafe { FfiUserAuthGetEnrolledState(authType.getValue(), inout enrolledState) }
    let userAuthResultCode = codeConvert(resultCode)
    if (userAuthResultCode == UserAuthResultCode.SUCCESS) {
        return enrolledState.toEnrolledState()
    }
    throw BusinessException(userAuthResultCode, EXCEPTION_MAP[userAuthResultCode])
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public func getUserAuthInstance(authParam: AuthParam, widgetParam: WidgetParam): UserAuthInstance {
    UserAuthInstance(authParam, widgetParam)
}
