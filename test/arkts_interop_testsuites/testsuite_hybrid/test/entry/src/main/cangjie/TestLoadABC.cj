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

import ohos.file_fs.FileFs
import ohos.ark_interop.{JSValue, JSArrayRangeMisMatch, JSRuntime, JSContext, JSCallInfo, JSModule}

class Global {
    static var jsRuntime: Option<JSRuntime> = None
    static func getJSRuntime() {
        match (Global.jsRuntime) {
            case Some(jsRuntime) => jsRuntime
            case None =>
                let newJSRuntime = JSRuntime()
                Global.jsRuntime = newJSRuntime
                newJSRuntime
        }
    }
    static func getJSContext() {
        Global.getJSRuntime().mainContext
    }
}

func testLoadAbc00(jsContext: JSContext, jsCallInfo: JSCallInfo): JSValue {
    const abcFilePath = "/data/storage/el1/base/arkts_module_02/modules.abc"
    let abcFileExists = FileFs.access(abcFilePath)
    Assert.isTrue(abcFileExists)
    const entryPoint = "com.example.arkts_module_02/entry@arkts_static_library_00/ets/test00"
    let jsRuntime = Global.getJSRuntime()
    //    let jsContext = jsRuntime.mainContext
    //    let isLoadSuccess = jsRuntime.loadEntryFromAbc(abcFilePath, entryPoint)
    //    Assert.isTrue(isLoadSuccess)
    //    let jsValue = jsRuntime.importFromEntry(entryPoint, "myFunction")
    //    let f = jsValue.asFunction(jsContext)
    //    let res = f.call([jsContext.number(1.0).toJSValue(), jsContext.number(2.0).toJSValue()])
    //    Assert.isTrue(res.isNumber())
    //    Assert.equals(res.toNumber(), 3.0)
    jsContext.undefined().toJSValue()
}

let _ = JSModule.registerModule {
    jsContext, jsObject => jsObject["testLoadAbc00"] = jsContext.function(testLoadAbc00).toJSValue()
}
