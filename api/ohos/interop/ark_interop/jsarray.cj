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

@FastNative
foreign func ARKTS_CreateArray(env: JSEnv, size: UInt32): JSValue_

@FastNative
foreign func ARKTS_CreateArrayWithInit(env: JSEnv, size: UInt32, data: CPointer<JSValue_>): JSValue_

@FastNative
foreign func ARKTS_GetArrayLength(env: JSEnv, arr: JSValue_): UInt32

@FastNative
foreign func ARKTS_SetElement(env: JSEnv, arr: JSValue_, index: UInt32, setValue: JSValue_): Unit

@FastNative
foreign func ARKTS_GetElement(env: JSEnv, arr: JSValue_, index: UInt32): JSValue_

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSArray <: JSHeapObject {
    init(context: JSContext, value: JSValue_) {
        super(context, value)
    }

    init(context: JSContext, arr: Array<JSValue>) {
        super(context, createWithInit(context, arr))
    }

    static func createWithInit(context: JSContext, arr: Array<JSValue>): JSValue_ {
        if (arr.size > 0) {
            let jsArr = Array<JSValue_>(arr.size) {
                index => arr[index].value
            }
            unsafe {
                let rawArr = acquireArrayRawData(jsArr)
                let result = ARKTS_CreateArrayWithInit(context.env, UInt32(arr.size), rawArr.pointer)
                releaseArrayRawData(rawArr)
                result
            }
        } else {
            unsafe { ARKTS_CreateArrayWithInit(context.env, 0, CPointer<JSValue_>()) }
        }
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
    public prop size: Int64 {
        get() {
            Int64(unsafe { ARKTS_GetArrayLength(context.env, innerValue) })
        }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func [](index: Int64): JSValue {
        if (index < 0 || index >= size) {
            throw JSArrayRangeMisMatch(0, size, index)
        }
        let result = unsafe { ARKTS_GetElement(context.env, innerValue, UInt32(index)) }
        JSValue(context, result)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func [](index: Int64, value!: JSValue): Unit {
        if (index < 0) {
            throw JSArrayRangeMisMatch(0, size, index)
        }
        unsafe { ARKTS_SetElement(context.env, innerValue, UInt32(index), value.value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func [](index: Int64, value!: JSHeapObject): Unit {
        if (index < 0) {
            throw JSArrayRangeMisMatch(0, size, index)
        }
        unsafe { ARKTS_SetElement(context.env, innerValue, UInt32(index), value.innerValue) }
    }
}
