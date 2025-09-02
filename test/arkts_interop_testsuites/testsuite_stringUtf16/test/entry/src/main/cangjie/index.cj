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

package ohos_app_cangjie_entry

import std.time.*
import std.runtime.*
import std.collection.*

import ohos.ark_interop.*
import ohos.hilog.Hilog

func doGC(context: JSContext, callInfo: JSCallInfo): JSValue {
    gc(heavy: true)
    context.undefined().toJSValue()
}

func benchGC(context: JSContext, callInfo: JSCallInfo): JSValue {
    let times = Int64(callInfo[0].toNumber())
    let array = ArrayList<JSObject>()
    for (i in 0..times) {
        context.object()
    }
    context.undefined().toJSValue()
}

func createString(context: JSContext, callInfo: JSCallInfo): JSValue {
    let encoding = Int64(callInfo[0].toNumber())
    let length = Int64(callInfo[1].toNumber())
    let result = charsets[encoding].getSamples(length).next().getOrThrow()
    return context.string(result).toJSValue()
}

func testString(context: JSContext, callInfo: JSCallInfo): JSValue {
    let cases = ["1234005", "嘿嘿嘿哈哈哈"]
    var hasErr = false
    for (one in cases) {
        let j = context.string(one)
        let o = j.toUtf16String()
        let v = o.toString()
        if (v != one) {
            Hilog.error(0, "test", "not equal: ${one}, ${v}")
            hasErr = true
        }
    }
    if (!hasErr) {
        Hilog.error(0, "test", "string ok")
    }
    context.undefined().toJSValue()
}

let _ = JSModule.registerModule {runtime, exports =>
    exports["doGC"] = runtime.function(doGC).toJSValue()
    exports["doSync"] = runtime.function {_, callInfo =>
        let f = callInfo[0].asFunction()
        let start = DateTime.now()
        f.call()
        let cost = DateTime.now() - start
        let costNS = Float64(cost.toNanoseconds())
        runtime.number(costNS/1000.0).toJSValue()
    }.toJSValue()
    exports["readStrToJ"] = runtime.function(readStrToJ).toJSValue()
    exports["readStrToC"] = runtime.function(readStrToC).toJSValue()
    exports["createStdLaint1"] = runtime.function(createStdLaint1).toJSValue()
    exports["createStdUtf16"] = runtime.function(createStdUtf16).toJSValue()
    exports["createNewLaint1"] = runtime.function(createNewLaint1).toJSValue()
    exports["createNewUtf16"] = runtime.function(createNewUtf16).toJSValue()
    exports["benchGC"] = runtime.function(benchGC).toJSValue()
    exports["createString"] = runtime.function(createString).toJSValue()
    exports["testString"] = runtime.function(testString).toJSValue()
}