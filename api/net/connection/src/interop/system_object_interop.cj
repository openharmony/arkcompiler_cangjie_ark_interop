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

package ohos.net.connection.interop

import ohos.ark_interop_helper.*
import ohos.ark_interop.*
import ohos.net.connection.*
import ohos.labels.*

foreign func FfiConvertNetHandle2Napi(env: napi_env, netId: Int32): napi_value

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public interface JSSystemObjectInteropType<T> {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    static func fromJSValue(context: JSContext, input: JSValue): T
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    func toJSValue(context: JSContext): JSValue
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
extend NetHandle <: JSSystemObjectInteropType<NetHandle> {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): NetHandle {
        let obj = input.asObject()
        NetHandle(Int32.fromJSValue(context, obj["netId"]))
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = unsafe { FfiConvertNetHandle2Napi(context.getNapiEnv(), this.netId) }
        JSValue(context, unsafe { napiValueToArkTsValue(napiValue) })
    }
}
