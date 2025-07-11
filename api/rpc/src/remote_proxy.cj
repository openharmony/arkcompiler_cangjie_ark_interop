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

import std.sync.Mutex
import std.collection.HashMap
import ohos.base.Callback1Argument
import ohos.ffi.*
import ohos.base.BusinessException
import ohos.labels.*

let CALLBACK_MANAGER = HashMap<Int64, DeathRecipient>()

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public class RemoteProxy <: RemoteDataLite & IRemoteObject {
    private let mutex = Mutex()
    /**
     * Indicates the message code for a Ping operation.
     *
     * @type { Int32 }
     * @default 1599098439
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const PING_TRANSACTION: Int32 = 0x5f504e47 // 1599098439

    /**
     * Indicates the message code for a dump operation.
     *
     * @type { Int32 }
     * @default 1598311760
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const DUMP_TRANSACTION: Int32 = 0x5f444d50 // 1598311760

    /**
     * Indicates the message code for a transmission.
     *
     * @type { Int32 }
     * @default 1598968902
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const INTERFACE_TRANSACTION: Int32 = 0x5f4e5446 // 1598968902

    /**
     * Indicates the minimum value of a valid message code.
     * <p>This constant is used to check the validity of an operation.
     *
     * @type { Int32 }
     * @default 0x1
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const MIN_TRANSACTION_ID: Int32 = 0x00000001
    /**
     * Indicates the maximum value of a valid message code.
     * <p>This constant is used to check the validity of an operation.
     *
     * @type { Int32 }
     * @default 0x00FFFFFF
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const MAX_TRANSACTION_ID: Int32 = 0x00FFFFFF // 16777215

    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    @!APILevel[
        21,
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
            FfiRpcRemoteProxySendMessageRequest(getID(), code, data.getID(), reply.getID(),
                MesOption(options.getFlags(), options.getWaitTime()), funRegisterCall.getID())
        }
        checkRet(errCode)
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getDescriptor(): String {
        var errCode: Int32 = 0
        let stringValue = unsafe { FfiRpcRemoteProxyGetDescriptor(getID(), inout errCode) }
        checkRet(errCode)
        let descriptor = stringValue.toString()
        unsafe { LibC.free(stringValue) }
        return descriptor
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit {
        synchronized(mutex) {
            let wrapper = {=> recipient.onRemoteDied()}
            let registerCall = Callback0Param(wrapper)
            var errCode = 0i32
            unsafe { FfiRpcRemoteProxyRegisterDeathRecipient(getID(), registerCall.getID(), flags, inout errCode) }
            checkRet(errCode)
            CALLBACK_MANAGER.add(registerCall.getID(), recipient)
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit {
        synchronized(mutex) {
            let (funcId, flag) = findCallbackObject(recipient)
            if (flag) {
                var errCode = 0i32
                unsafe { FfiRpcRemoteProxyUnregisterDeathRecipient(getID(), funcId, flags, inout errCode) }
                checkRet(errCode)
                CALLBACK_MANAGER.remove(funcId)
            }
        }
    }

    private func findCallbackObject(recipient: DeathRecipient): (Int64, Bool) {
        for ((k, v) in CALLBACK_MANAGER) {
            if (refEq(v, recipient)) {
                return (k, true)
            }
        }
        return (-1, false)
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func isObjectDead(): Bool {
        return unsafe { FfiRpcRemoteProxyIsObjectDead(getID()) }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getLocalInterface(descriptor: String): IRemoteBroker {
        throw BusinessException(ErrorCode.ONLY_REMOTE_OBJECT_PERMITTED_ERROR, "Only remote object permitted.")
    }
}
