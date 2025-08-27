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
foreign func ARKTS_CreateSymbol(env: JSEnv, description: CPointer<UInt8>, length: Int32): JSValue_

@FastNative
foreign func ARKTS_IsSymbol(env: JSEnv, value: JSValue_): Bool

@FastNative
foreign func ARKTS_GetSymbolDesc(env: JSEnv, symbol: JSValue_): CString

/**
 * The JSSymbol object is used to represent a safe reference to the ArkTS symbol type.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkCompiler.Cangjie"
]
public class JSSymbol <: JSHeapObject & JSKeyable {
    private var desc_: ?String = None

    init(context: JSContext, value: JSValue_) {
        super(context, value)
    }

    init(context: JSContext, description: String) {
        super(context, createSymbol(context, description))
        desc_ = description
    }

    ~init() {
        unsafe { ARKTS_DisposeGlobal(context.env_, globalValue_) }
    }

    static func createSymbol(context: JSContext, description: String): JSValue_ {
        if (description.isEmpty()) {
            unsafe { ARKTS_CreateSymbol(context.env, CPointer<UInt8>(), Int32(0)) }
        } else {
            unsafe {
                let rawHandle = acquireArrayRawData(description.rawData())
                let result = ARKTS_CreateSymbol(context.env, rawHandle.pointer, Int32(description.size))
                releaseArrayRawData(rawHandle)
                result
            }
        }
    }

    /**
     * Convert JSSymbol to JSValue.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkCompiler.Cangjie"
    ]
    public func toJSValue(_: JSContext): JSValue {
        JSValue(context, innerValue)
    }

    /**
     * The description of symbol.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkCompiler.Cangjie"
    ]
    public prop description: String {
        get() {
            if (let Some(desc) <- desc_) {
                desc
            } else {
                let desc = unsafe {
                    let cDesc = ARKTS_GetSymbolDesc(context.env, innerValue)
                    let desc = cDesc.toString()
                    ARKTS_FreeCString(cDesc)
                    desc
                }
                desc_ = desc
                desc
            }
        }
    }

    /**
     * Return a String that represents the JSSymbol.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkCompiler.Cangjie"
    ]
    public func toString(): String {
        let desc = description
        if (desc.isEmpty()) {
            return "[symbol]"
        } else {
            return "[symbol: ${desc}]"
        }
    }
}
