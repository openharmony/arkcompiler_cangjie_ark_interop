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

package ohos.ability.interop

import ohos.ark_interop.*
import ohos.ark_interop_helper.*
import ohos.ability.WantAgent
import ohos.labels.*

foreign func FfiConvertWantAgent2Napi(env: napi_env, id: Int64): napi_value

foreign func FfiCreateWantAgentFromNapi(env: napi_env, object: napi_value): Int64

protected func ffiConvertWantAgent2Napi(env: napi_env, id: Int64): napi_value {
    unsafe { FfiConvertWantAgent2Napi(env, id) }
}

protected func ffiCreateWantAgentFromNapi(env: napi_env, object: napi_value): Int64 {
    unsafe { FfiCreateWantAgentFromNapi(env, object) }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
extend WantAgent <: JSSystemObjectInteropType<WantAgent> {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): WantAgent {
        let env = context.getNapiEnv()
        let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
        let remoteId = ffiCreateWantAgentFromNapi(env, napiValue)
        WantAgent(remoteId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = ffiConvertWantAgent2Napi(context.getNapiEnv(), getID())
        JSValue(context, napiValueToArkTsValue(napiValue))
    }
}
