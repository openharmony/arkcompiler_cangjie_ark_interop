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

import std.deriving.*
import ohos.base.*
import ohos.ffi.*
import ohos.rpc.*
import ohos.labels.*

foreign {
    func FFIAbilityCallerRelease(id: Int64): Int32

    func FFIAbilityCallerOnRelease(id: Int64, callbackId: Int64): Int32

    func FFIAbilityCallerOnRemoteStateChange(id: Int64, callbackId: Int64): Int32
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class OnReleaseCallback <: Callback1Argument<String> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public OnReleaseCallback(let callback: (String) -> Unit) {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func invoke(arg1: String): Unit {
        callback(arg1)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class OnRemoteStateChangeCallback <: Callback1Argument<String> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public OnRemoteStateChangeCallback(let callback: (String) -> Unit) {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func invoke(arg1: String): Unit {
        callback(arg1)
    }
}

class CallerCallback <: Callback1Argument<RequestResult> {
    CallerCallback(let callback: (RequestResult) -> Unit) {}

    public func invoke(arg1: RequestResult): Unit {
        callback(arg1)
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum CallerType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    RELEASE | ...

    func toString(): String {
        match (this) {
            case RELEASE => "release"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class Caller <: RemoteDataLite {
    let callee: IRemoteObject
    var releaseState: Bool = false

    init(id: Int64, remoteId: Int64) {
        super(id)
        this.callee = createIRemoteObject(remoteId)
    }

    ~init() {
        if (!releaseState) {
            releaseCaller(myDataId)
        }
        releaseFFIData(myDataId)
    }

    func callcheck(method: String): Unit {
        if (method == "") {
            throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
        }
        if (this.releaseState == true) {
            throw BusinessException(ERROR_CODE_INVALID_CALLER, getErrorMsg(ERROR_CODE_INVALID_CALLER))
        }
    }

    /*
     * @brief call(method: string, data: rpc.Parcelable): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func call(method: String, data: Parcelable, callback: Callback0Argument): Unit {
        callcheck(method)

        let msgData = buildMsgData(method, data)
        let msgReply = MessageSequence.create()

        let cb = CallerCallback(
            {
                retData: RequestResult =>
                if (retData.errCode != 0) {
                    msgData.reclaim()
                    msgReply.reclaim()
                    throw BusinessException(retData.errCode, getErrorMsg(retData.errCode))
                }
                let retval: Int32
                let str: String
                try {
                    retval = retData.reply.readInt()
                    str = retData.reply.readString()
                } catch (e: Exception) {
                    throw BusinessException(ERROR_CODE_INNER, getErrorMsg(ERROR_CODE_INNER))
                } finally {
                    msgData.reclaim()
                    msgReply.reclaim()
                }
                if (retval != REQUEST_SUCCESS || str != "object") {
                    throw BusinessException(retval, getErrorMsg(retData.errCode))
                }
                callback.invoke()
            }
        )
        this.callee.sendMessageRequest(EVENT_CALL_NOTIFY, msgData, msgReply, MessageOption(), cb)
    }

    /*
     * @brief callWithResult(method: string, data: rpc.Parcelable): Promise<rpc.MessageSequence>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func callWithResult(method: String, data: Parcelable, callback: Callback1Argument<MessageSequence>): Unit {
        callcheck(method)
        let msgData = buildMsgData(method, data)
        let msgReply = MessageSequence.create()

        let cb = CallerCallback(
            {
                retData: RequestResult =>
                if (retData.errCode != 0) {
                    msgData.reclaim()
                    msgReply.reclaim()
                    throw BusinessException(retData.errCode, getErrorMsg(retData.errCode))
                }
                try {
                    let retval = retData.reply.readInt()
                    let str = retData.reply.readString()
                    if (retval == REQUEST_SUCCESS && str == "object") {
                        msgData.reclaim()
                    } else {
                        msgData.reclaim()
                        msgReply.reclaim()
                        throw BusinessException(retval, getErrorMsg(retval))
                    }
                } catch (e: Exception) {
                    msgData.reclaim()
                    msgReply.reclaim()
                    throw BusinessException(ERROR_CODE_INNER, getErrorMsg(ERROR_CODE_INNER))
                }
                callback.invoke(retData.reply)
            }
        )
        this.callee.sendMessageRequest(EVENT_CALL_NOTIFY, msgData, msgReply, MessageOption(), cb)
    }

    /*
     * @brief release(): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func release(): Unit {
        if (this.releaseState == true) {
            throw BusinessException(ERROR_CODE_INVALID_CALLER, getErrorMsg(ERROR_CODE_INVALID_CALLER))
        }
        this.releaseState = true
        unsafe {
            let errorCode = FFIAbilityCallerRelease(this.getID())
            if (errorCode != 0) {
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
        }
    }

    /*
     * @brief onRelease(callback: OnReleaseCallback): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func onRelease(callback: OnReleaseCallback): Unit {
        if (this.releaseState == true) {
            throw BusinessException(ERROR_CODE_INVALID_CALLER, getErrorMsg(ERROR_CODE_INVALID_CALLER))
        }
        unsafe {
            let wrapper = {
                value: CString =>
                let str = value.toString()
                callback.invoke(str)
            }
            let lambdaData = Callback1Param<CString, Unit>(wrapper)
            let errorCode = FFIAbilityCallerOnRelease(this.getID(), lambdaData.getID())
            if (errorCode != 0) {
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
        }
    }

    /*
     * @brief onRemoteStateChange(callback: OnRemoteStateChangeCallback): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func onRemoteStateChange(callback: OnRemoteStateChangeCallback): Unit {
        if (this.releaseState == true) {
            throw BusinessException(ERROR_CODE_INVALID_CALLER, getErrorMsg(ERROR_CODE_INVALID_CALLER))
        }
        unsafe {
            let wrapper = {
                value: CString =>
                let str = value.toString()
                callback.invoke(str)
            }
            let lambdaData = Callback1Param<CString, Unit>(wrapper)
            let errorCode = FFIAbilityCallerOnRemoteStateChange(this.getID(), lambdaData.getID())
            if (errorCode != 0) {
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
        }
    }

    /*
     * @brief on(type: 'release', callback: OnReleaseCallback): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(onType: CallerType, callback: OnReleaseCallback): Unit {
        if (this.releaseState == true) {
            throw BusinessException(ERROR_CODE_INVALID_CALLER, getErrorMsg(ERROR_CODE_INVALID_CALLER))
        }
        if (onType != RELEASE) {
            throw BusinessException(INVALID_PARA, "ApplicationContext on failed: ${getErrorMsg(INVALID_PARA)}")
        }
        unsafe {
            let wrapper = {
                value: CString =>
                let str = value.toString()
                callback.invoke(str)
            }
            let lambdaData = Callback1Param<CString, Unit>(wrapper)
            let errorCode = FFIAbilityCallerOnRelease(this.getID(), lambdaData.getID())
            if (errorCode != 0) {
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
        }
    }

    /*
     * @brief off(type: 'release', callback: OnReleaseCallback): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(onType: CallerType, callback: OnRemoteStateChangeCallback): Unit {
        if (onType != RELEASE) {
            throw BusinessException(INVALID_PARA, "ApplicationContext on failed: ${getErrorMsg(INVALID_PARA)}")
        }
    }

    /*
     * @brief off(type: 'release'): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(onType: CallerType): Unit {
        if (onType != RELEASE) {
            throw BusinessException(INVALID_PARA, "ApplicationContext on failed: ${getErrorMsg(INVALID_PARA)}")
        }
    }
}

func buildMsgData(method: String, data: Parcelable): MessageSequence {
    let msgData = MessageSequence.create()
    msgData.writeString(method)
    msgData.writeParcelable(data)
    return msgData
}

func releaseCaller(id: Int64) {
    unsafe {
        FFIAbilityCallerRelease(id)
    }
}
