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
import ohos.ability.{UIAbilityContext, AbilityStageContext, ApplicationContext, PhotoEditorExtensionContext, 
    UIExtensionContext, Context}
import ohos.labels.*

foreign {
    func FfiConvertBaseContext2Napi(env: napi_env, id: Int64): napi_value

    func FfiCreateBaseContextFromNapi(env: napi_env, object: napi_value): Int64

    func FfiConvertUIAbilityContext2Napi(env: napi_env, id: Int64): napi_value

    func FfiCreateUIAbilityContextFromNapi(env: napi_env, object: napi_value): Int64

    func FfiConvertAbilityStageContext2Napi(env: napi_env, id: Int64): napi_value

    func FfiCreateAbilityStageContextFromNapi(env: napi_env, object: napi_value): Int64

    func FfiConvertApplicationContext2Napi(env: napi_env, id: Int64): napi_value

    func FfiCreateApplicationContextFromNapi(env: napi_env, object: napi_value): Int64

    func FfiConvertPhotoExtCtx2Napi(env: napi_env, id: Int64): napi_value

    func FfiCreatePhotoExtCtxFromNapi(env: napi_env, object: napi_value): Int64

    func FfiConvertUIExtCtx2Napi(env: napi_env, id: Int64): napi_value

    func FfiCreateUIExtCtxFromNapi(env: napi_env, object: napi_value): Int64
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
extend Context <: SystemObjectInteropTypeToJS {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = unsafe {
            match (this) {
                case _: UIAbilityContext => FfiConvertUIAbilityContext2Napi(context.getNapiEnv(), getID())
                case _: AbilityStageContext => FfiConvertAbilityStageContext2Napi(context.getNapiEnv(), getID())
                case _: ApplicationContext => FfiConvertApplicationContext2Napi(context.getNapiEnv(), getID())
                case _: PhotoEditorExtensionContext => FfiConvertPhotoExtCtx2Napi(context.getNapiEnv(), getID())
                case _: UIExtensionContext => FfiConvertUIExtCtx2Napi(context.getNapiEnv(), getID())
                case _ => FfiConvertBaseContext2Napi(context.getNapiEnv(), getID())
            }
        }
        JSValue(context, napiValueToArkTsValue(napiValue))
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func createAbilityContextFromJSValue(context: JSContext, input: JSValue): UIAbilityContext {
    let env = context.getNapiEnv()
    let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
    let remoteId = unsafe { FfiCreateUIAbilityContextFromNapi(env, napiValue) }
    UIAbilityContext(remoteId)
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func createAbilityStageContextFromJSValue(context: JSContext, input: JSValue): AbilityStageContext {
    let env = context.getNapiEnv()
    let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
    let remoteId = unsafe { FfiCreateAbilityStageContextFromNapi(env, napiValue) }
    AbilityStageContext(remoteId)
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func createApplicationContextFromJSValue(context: JSContext, input: JSValue): ApplicationContext {
    let env = context.getNapiEnv()
    let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
    let remoteId = unsafe { FfiCreateApplicationContextFromNapi(env, napiValue) }
    ApplicationContext(remoteId)
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func createPhotoEditorExtensionContextFromJSValue(context: JSContext, input: JSValue): PhotoEditorExtensionContext {
    let env = context.getNapiEnv()
    let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
    let remoteId = unsafe { FfiCreatePhotoExtCtxFromNapi(env, napiValue) }
    PhotoEditorExtensionContext(remoteId)
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func createUIExtensionContextFromJSValue(context: JSContext, input: JSValue): UIExtensionContext {
    let env = context.getNapiEnv()
    let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
    let remoteId = unsafe { FfiCreateUIExtCtxFromNapi(env, napiValue) }
    UIExtensionContext(remoteId)
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func createContextFromJSValue(context: JSContext, input: JSValue): Context {
    let env = context.getNapiEnv()
    let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
    let remoteId = unsafe { FfiCreateBaseContextFromNapi(env, napiValue) }
    Context(remoteId)
}
