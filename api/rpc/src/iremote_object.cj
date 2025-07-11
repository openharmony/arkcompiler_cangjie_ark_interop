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

package ohos.rpc

import ohos.base.Callback1Argument
import ohos.labels.*
import ohos.ffi.*
import ohos.base.BusinessException

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public interface IRemoteObject {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func getLocalInterface(descriptor: String): IRemoteBroker
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
        callback: Callback1Argument<RequestResult>): Unit
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func getDescriptor(): String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func isObjectDead(): Bool
}

foreign func FfiRpcGetRemoteType(objectId: Int64): Int32

const REMOTE_OBJCET_TYPE: Int32 = 0
const REMOTE_PROXY_TYPE: Int32 = 1

protected func createIRemoteObject(objectId: Int64): IRemoteObject {
    let remoteType = unsafe { FfiRpcGetRemoteType(objectId) }
    let res: IRemoteObject = if (remoteType == REMOTE_OBJCET_TYPE) {
        RemoteObject(objectId)
    } else if (remoteType == REMOTE_PROXY_TYPE) {
        RemoteProxy(objectId)
    } else {
        throw BusinessException(remoteType, "error remote type")
    }
    return res
}
