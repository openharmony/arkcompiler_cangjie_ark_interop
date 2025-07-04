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

import std.sync.*
import ohos.labels.*
import ohos.base.Callback1Argument
import ohos.ffi.*
import ohos.base.BusinessException

class RemoteObjectLite <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public open class RemoteObject <: IRemoteObject {
    private var remoteBroker: ?IRemoteBroker = None
    private var lite: ?RemoteObjectLite = None

    protected init(id: Int64) {
        lite = RemoteObjectLite(id)
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public init(descriptor: String) {
        let stringValue = unsafe { LibC.mallocCString(descriptor) }
        let id = unsafe { FfiRpcRemoteObjectConstructor(stringValue) }
        unsafe { LibC.free(stringValue) }
        if (id <= 0) {
            throw BusinessException(ErrorCode.CHECK_PARAM_ERROR, "Parameter error.")
        }
        lite = RemoteObjectLite(id)
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
        callback: Callback1Argument<RequestResult>): Unit {
        let wrapper = {
            data: CRequestResult => callback.invoke(data.toCJ())
        }
        let funRegisterCall = Callback1Param<CRequestResult, Unit>(wrapper)
        let errCode = unsafe {
            FfiRpcRemoteObjectSendMessageRequest(getID(), code, data.getID(), reply.getID(),
                MesOption(options.getFlags(), options.getWaitTime()), funRegisterCall.getID())
        }
        checkRet(errCode)
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func modifyLocalInterface(localInterface: IRemoteBroker, descriptor: String): Unit {
        let stringValue = unsafe { LibC.mallocCString(descriptor) }
        var errCode = 0i32
        unsafe { FfiRpcRemoteObjectModifyLocalInterface(getID(), stringValue, inout errCode) }
        unsafe { LibC.free(stringValue) }
        checkRet(errCode)
        remoteBroker = localInterface
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getDescriptor(): String {
        var errCode: Int32 = 0
        let stringValue = unsafe { FfiRpcRemoteObjectGetDescriptor(getID(), inout errCode) }
        checkRet(errCode)
        let descriptor = stringValue.toString()
        unsafe { LibC.free(stringValue) }
        return descriptor
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getCallingUid(): Int32 {
        return unsafe { FfiRpcRemoteObjectGetCallingUid() }
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getCallingPid(): Int32 {
        return unsafe { FfiRpcRemoteObjectGetCallingPid() }
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getLocalInterface(descriptor: String): IRemoteBroker {
        remoteBroker.getOrThrow({=> Exception("failed to get IRemoteBroker.")})
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit {
        throw BusinessException(ErrorCode.ONLY_PROXY_OBJECT_PERMITTED_ERROR, "only proxy object permitted")
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit {
        throw BusinessException(ErrorCode.ONLY_PROXY_OBJECT_PERMITTED_ERROR, "only proxy object permitted")
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func isObjectDead(): Bool {
        return false
    }

    protected func getID(): Int64 {
        return lite.getOrThrow().getID()
    }
}
