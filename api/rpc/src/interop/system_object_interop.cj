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

package ohos.rpc.interop

import ohos.ark_interop.*
import ohos.ark_interop_helper.*
import ohos.base.BusinessException
import ohos.rpc.*
import ohos.labels.*

foreign func FfiConvertRemoteObject2Napi(env: napi_env, id: Int64): napi_value

foreign func FfiCreateRemoteObjectFromNapi(env: napi_env, object: napi_value): Int64

foreign func FfiRpcGetRemoteType(id: Int64): Int32

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public interface SystemObjectInteropTypeToJS {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func toJSValue(context: JSContext): JSValue
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
extend RemoteObject <: SystemObjectInteropTypeToJS {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = unsafe { FfiConvertRemoteObject2Napi(context.getNapiEnv(), getID()) }
        JSValue(context, napiValueToArkTsValue(napiValue))
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
extend RemoteProxy <: SystemObjectInteropTypeToJS {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = unsafe { FfiConvertRemoteObject2Napi(context.getNapiEnv(), getID()) }
        JSValue(context, napiValueToArkTsValue(napiValue))
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public func fromJSValue(context: JSContext, input: JSValue): IRemoteObject {
    let env = context.getNapiEnv()
    let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
    let remoteId = unsafe { FfiCreateRemoteObjectFromNapi(env, napiValue) }
    if (remoteId == 0) {
        throw BusinessException(401, "Parameter error.")
    }
    let remoteType = unsafe { FfiRpcGetRemoteType(remoteId) }
    if (remoteType == 0) {
        return RemoteObject(remoteId)
    } else {
        return RemoteProxy(remoteId)
    }
}
