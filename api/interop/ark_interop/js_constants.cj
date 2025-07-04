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

protected class LazyInit<T> {
    private var data_: ?T = None
    private var func_: ?() -> T

    protected init(lambda: () -> T) {
        func_ = lambda
    }

    protected prop data: T {
        get() {
            if (let Some(v) <- data_) {
                v
            } else {
                let v = func_.getOrThrow()()
                func_ = None
                data_ = v
                v
            }
        }
    }
}

class JSBuiltinText {
    let WeakSet: JSString
    let add: JSString
    let delete: JSString
    let has: JSString
    let WeakMap: JSString
    let get: JSString
    let set: JSString
    let constructor: JSString

    let Error: JSString
    let name: JSString
    let message: JSString
    let stack: JSString
    let prototype: JSString
    let __proto__: JSString
    let __cj_object__: JSSymbol

    init(context: JSContext) {
        WeakSet = context.string("WeakSet")
        add = context.string("add")
        delete = context.string("delete")
        has = context.string("has")
        WeakMap = context.string("WeakMap")
        get = context.string("get")
        set = context.string("set")
        constructor = context.string("constructor")
        Error = context.string("Error")
        name = context.string("name")
        message = context.string("message")
        stack = context.string("stack")
        prototype = context.string("prototype")
        __proto__ = context.string("__proto__")
        __cj_object__ = context.symbol(description: "__cj_object__")
    }
}

class JSTypedArrayFuncs {
    let arrayBuffer: LazyInit<JSClass>
    let dataView: LazyInit<JSClass>
    let uint8Array: LazyInit<JSClass>
    let uint8Clamped: LazyInit<JSClass>
    let int8Array: LazyInit<JSClass>
    let uint16Array: LazyInit<JSClass>
    let int16Array: LazyInit<JSClass>
    let uint32Array: LazyInit<JSClass>
    let int32Array: LazyInit<JSClass>
    let uint64Array: LazyInit<JSClass>
    let int64Array: LazyInit<JSClass>
    let float32Array: LazyInit<JSClass>
    let float64Array: LazyInit<JSClass>

    init(context: JSContext) {
        arrayBuffer = LazyInit {
            context.global["ArrayBuffer"].asClass()
        }
        dataView = LazyInit {
            context.global["DataView"].asClass()
        }
        uint8Array = LazyInit {
            context.global["Uint8Array"].asClass()
        }
        uint8Clamped = LazyInit {
            context.global["Uint8ClampedArray"].asClass()
        }
        int8Array = LazyInit {
            context.global["Int8Array"].asClass()
        }
        uint16Array = LazyInit {
            context.global["Uint16Array"].asClass()
        }
        int16Array = LazyInit {
            context.global["Int16Array"].asClass()
        }
        uint32Array = LazyInit {
            context.global["Uint32Array"].asClass()
        }
        int32Array = LazyInit {
            context.global["Int32Array"].asClass()
        }
        int64Array = LazyInit {
            context.global["BigInt64Array"].asClass()
        }
        uint64Array = LazyInit {
            context.global["BigUint64Array"].asClass()
        }
        float32Array = LazyInit {
            context.global["Float32Array"].asClass()
        }
        float64Array = LazyInit {
            context.global["Float64Array"].asClass()
        }
    }
}

class JSConstants {
    let builtinText: JSBuiltinText
    let errorFuncs: JSErrorFuncs
    let mapFuncs: JSMapFuncs
    let typedArray: JSTypedArrayFuncs

    init(context: JSContext) {
        builtinText = JSBuiltinText(context)
        errorFuncs = JSErrorFuncs(context, builtinText)
        mapFuncs = JSMapFuncs(context)
        typedArray = JSTypedArrayFuncs(context)
    }
}
