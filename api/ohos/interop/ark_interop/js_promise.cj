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

package ohos.ark_interop

@C
struct JSPromisePrivate {}

type JSPromiseCap = CPointer<JSPromisePrivate>

@FastNative
foreign func ARKTS_CreatePromiseCapability(env: JSEnv): JSPromiseCap

@FastNative
foreign func ARKTS_GetPromiseFromCapability(env: JSEnv, promise: JSPromiseCap): JSValue_

foreign func ARKTS_PromiseCapabilityResolve(env: JSEnv, promise: JSPromiseCap, result: JSValue_): Unit

foreign func ARKTS_PromiseCapabilityReject(env: JSEnv, promise: JSPromiseCap, message: JSValue_): Unit

foreign func ARKTS_PromiseThen(env: JSEnv, prom: JSValue_, onFulfilled: JSValue_, onRejected: JSValue_): JSValue_

foreign func ARKTS_PromiseCatch(env: JSEnv, prom: JSValue_, callback: JSValue_): Unit

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSPromise <: JSHeapObject {
    init(context: JSContext, value: JSValue_) {
        super(context, value)
    }

    ~init() {
        unsafe { ARKTS_DisposeGlobal(context.env_, globalValue_) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func then(onFulfilled: JSFunction, onRejected!: ?JSFunction = None): Unit {
        let onFulfilledValue = onFulfilled.innerValue
        let onRejectedValue = if (let Some(fun) <- onRejected) {
            fun.innerValue
        } else {
            context.undefined().toJSValue().value
        }
        unsafe {
            ARKTS_PromiseThen(context.env, innerValue, onFulfilledValue, onRejectedValue)
        }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func catchError(callback: JSFunction): Unit {
        unsafe {
            ARKTS_PromiseCatch(context.env, innerValue, callback.innerValue)
        }
    }
}

/**
 * JSPromiseCapability is not a JSValue but a JSVM internal type,
 * the main purpose is enhance performance
 */
@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSPromiseCapability {
    static func create(context: JSContext): JSPromiseCap {
        unsafe { ARKTS_CreatePromiseCapability(context.env) }
    }

    private let context: JSContext
    private let promise: JSPromiseCap
    private var isComplete: Bool

    init(context: JSContext) {
        this.context = context
        promise = create(context)
        isComplete = false
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func resolve(value: JSValue): Unit {
        if (isComplete) {
            throw JSObjUseAfterFree(message: "JSPromiseCapability has been fulfilled or rejected")
        }
        unsafe {
            ARKTS_PromiseCapabilityResolve(context.env, promise, value.value)
        }
        isComplete = true
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func reject(value: JSValue): Unit {
        if (isComplete) {
            throw JSObjUseAfterFree(message: "JSPromiseCapability has been fulfilled or rejected")
        }
        unsafe {
            ARKTS_PromiseCapabilityReject(context.env, promise, value.value)
        }
        isComplete = true
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(): JSValue {
        if (isComplete) {
            throw JSObjUseAfterFree(message: "JSPromiseCapability has been fulfilled or rejected")
        }
        let result = unsafe { ARKTS_GetPromiseFromCapability(context.env, promise) }
        JSValue(context, result)
    }
}
