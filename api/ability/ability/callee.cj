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

package ohos.ability

import std.collection.HashMap
import std.deriving.*
import ohos.base.*
import ohos.rpc.*
import ohos.labels.*

const EVENT_CALL_NOTIFY: UInt32 = 1
const REQUEST_SUCCESS: Int32 = 0
const PERMISSION_ABILITY_BACKGROUND_COMMUNICATION = 'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION'

foreign func FfiOHOSAbilityAccessCtrlCheckAccessTokenSync(tokenID: UInt32, cPermissionName: CString): Int32

@Derive[ToString, Equatable]
enum CallerGrantStatus {
    | PermissionDenied
    | PermissionGranted

    static func toGrantStatus(code: Int32): CallerGrantStatus {
        if (code == -1) {
            return PermissionDenied
        } else {
            return PermissionGranted
        }
    }
}

func checkAccessToken(tokenID: UInt32, permissionName: String): CallerGrantStatus {
    if (tokenID == 0) {
        throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
    }
    unsafe {
        let cPermissionName = LibC.mallocCString(permissionName)
        let ret = FfiOHOSAbilityAccessCtrlCheckAccessTokenSync(tokenID, cPermissionName)
        LibC.free(cPermissionName)
        return CallerGrantStatus.toGrantStatus(ret)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class CalleeCallback <: Callback1ArgumentWithReturn<MessageSequence, Parcelable> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public CalleeCallback(let callback: (MessageSequence) -> Parcelable) {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func invoke(arg1: MessageSequence): Parcelable {
        return callback(arg1)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class Callee <: RemoteObject {
    let callList: HashMap<String, CalleeCallback>
    var startUpNewRule: Bool

    init() {
        super("rpc.application.callee")
        this.callList = HashMap<String, CalleeCallback>()
        this.startUpNewRule = false
    }

    func setNewRuleFlag(flag: Bool) {
        this.startUpNewRule = flag
    }

    private func startUpRuleCheck(): Bool {
        if (this.startUpNewRule && IPCSkeleton.isLocalCalling()) {
            let accessTokenId = IPCSkeleton.getCallingTokenId()
            let grantStatus = checkAccessToken(accessTokenId, PERMISSION_ABILITY_BACKGROUND_COMMUNICATION)
            if (grantStatus == PermissionDenied) {
                ABILITY_LOG.error(
                    "Callee onRemoteMessageRequest error, the Caller does not have PERMISSION_ABILITY_BACKGROUND_COMMUNICATION")
                return false
            }
        }
        return true
    }

    /*
     * @brief on(method: string, callback: CalleeCallback): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(method: String, callback: CalleeCallback): Unit {
        if (method == "") {
            throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
        }
        if (callList.contains(method)) {
            throw BusinessException(ERROR_CODE_FUNC_REGISTERED, getErrorMsg(ERROR_CODE_FUNC_REGISTERED))
        }
        this.callList.add(method, callback)
    }

    /*
     * @brief off(method: string): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(method: String): Unit {
        if (method == "") {
            throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
        }
        if (!callList.contains(method)) {
            throw BusinessException(ERROR_CODE_FUNC_NOT_EXIST, getErrorMsg(ERROR_CODE_FUNC_NOT_EXIST))
        }
        callList.remove(method)
    }
}
