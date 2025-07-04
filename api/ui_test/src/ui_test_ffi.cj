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

package ohos.ui_test

import ohos.ffi.*
import ohos.base.*
import std.convert.Parsable
import ohos.encoding.json.*
import std.convert.*
import ohos.system_parameter_enhance.*
import ohos.ability_delegator_registry.*
import ohos.ability.*

foreign func CJ_InitConnection(token: CString): Unit
// if ret code is 0, then the data is result; else data is error message
foreign func CJ_ApiCall(param: ApiCallParams): RetDataCString

foreign func CJ_UITestObjDelete(ref: CString): Unit

@C
struct CUIElementInfo {
    CUIElementInfo(
        let bundleName: CString,
        let componentType: CString,
        let text: CString
    ) {}
}

@C
struct ApiCallParams {
    let apiId: CString
    let callerObjRef: CString
    let params: CString

    init(id: String, ref: String, param: String) {
        apiId = mallocCString(id)
        try {
            callerObjRef = mallocCString(ref)
        } catch (e: Exception) {
            unsafe { LibC.free(apiId) }
            throw e
        }
        try {
            params = mallocCString(param)
        } catch (e: Exception) {
            unsafe {
                LibC.free(apiId)
                LibC.free(callerObjRef)
            }
            throw e
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(apiId)
            LibC.free(callerObjRef)
            LibC.free(params)
        }
    }
}

func mallocCString(str: String): CString {
    if (str.isEmpty()) {
        CString(CPointer<UInt8>())
    } else {
        unsafe { LibC.mallocCString(str) }
    }
}
