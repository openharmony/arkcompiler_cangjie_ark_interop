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

import ohos.ark_interop.*
import std.unittest.testmacro.*
import std.unittest.*

@Test
class TestJSContext {
    @TestCase
    func testRequireSystemModules(): Unit {
        let jsContext = getJSContext()
        let hilog = await(jsContext) {jsContext.requireSystemNativeModule("hilog")}
        let pushService = await(jsContext) {jsContext.requireSystemNativeModule("core.push.pushService", prefix: "hms")}
        let obj = await(jsContext) {hilog.asObject(jsContext)}
        let arkTSParams = [
            await(jsContext) {jsContext.number(0).toJSValue()},
            await(jsContext) {jsContext.string("TEST").toJSValue()},
            await(jsContext) {jsContext.string("test log").toJSValue()}
        ]
        obj.callMethod("info",arkTSParams)
        let arkTSParams2 = [
            await(jsContext) {jsContext.string("TEST").toJSValue()},
            await(jsContext) {jsContext.string("test log").toJSValue()}
        ]
        obj.callMethod("info",arkTSParams2)
    }

    @TestCase
    func testRequireModules(): Unit {
        let jsContext = getJSContext()
        var err = false
        try {
            let jsModule = await(jsContext) {jsContext.requireJSModule("ArkTSModule")}
        } catch (e: Exception) {err = true}
        @Expect(err)
    }

    @TestCase
    func testRequireAppModule(){
        let jsContext = getJSContext()
        let appModule = await(jsContext) {jsContext.requireAppNativeModule("NativeModule","./")}
    }
    
    @TestCase
    func testExceptions(){
        let jsContext = getJSContext()
        let napiEnv = await(jsContext) {jsContext.getNapiEnv()}
        var err0 = false
        try {
            await(jsContext) {jsContext.arrayBuffer(0)}
        } catch (e: Exception) {err0 = true}
        @Expect(err0)

        let runtime = getJSRuntime()
        let runtime_env = runtime.getNapiEnv()
        runtime.loadEntryFromAbc("path/to/abc","entryPointName")
        runtime.loadEntryFromAbc("path/to/abc","importFunc")
        runtime.importFromEntry("entryPoint","importName")
        runtime.importFromEntry("entryPoint","#(")
    }
}