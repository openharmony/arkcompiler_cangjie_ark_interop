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

private var globalValue: Float64 = 0.0

public func toggleGlobalValue(jsContext: JSContext, jsCallInfo: JSCallInfo): JSValue {
    let delta = jsCallInfo[0].toNumber()
    globalValue += delta
    jsContext
        .undefined()
        .toJSValue()
}

public func getGlobalValue(jsContext: JSContext, jsCallInfo: JSCallInfo): JSValue {
    jsContext
        .number(globalValue)
        .toJSValue()
}

private let _ = JSModule.registerModule {
    jsContext: JSContext, jsObject: JSObject =>
    jsObject["toggleGlobalValue"] = jsContext
        .function(toggleGlobalValue)
        .toJSValue()
    jsObject["getGlobalValue"] = jsContext
        .function(getGlobalValue)
        .toJSValue()
}
