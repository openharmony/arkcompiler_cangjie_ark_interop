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

package ohos.web.webview

import ohos.ffi.*
import ohos.base.*
import std.collection.*

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (17100001, "Init error. The WebviewController must be associated with a Web compoent."),
        (17100002, "Invalid url."),
        (17100003, "Invalid resource path or file type."),
        (17100004, "Function not enable."),
        (17100005, "Invalid cookie value."),
        (17100006, "Can not register message event using this port."),
        (17100007, "Invalid back or forward operation."),
        (17100008, "Cannot delete JavaScriptProxy."),
        (17100009, "Cannot zoom in or zoom out."),
        (17100010, "Cannot post message using this port."),
        (17100011, "Invalid origin."),
        (17100012, "Invalid web storage origin."),
        (17100013, "The number of preconnect sockets is invalid."),
        (17100014, "The type does not match with the value of the message."),
        (17100015, "New failed, out of memeory."),
        (17100016, "The download is not paused."),
        (17100017, "No valid WebviewController is associated."),
        (17100018, "No WebDownloadDelegate has been set yet."),
        (17100019, "The download has not been started yet."),
        (17100020, "Failed to register custom schemes."),
        (17100021, "The resource handler is invalid."),
        (17100022, "Failed to initialize the HTTP body stream.")
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error. Error code is ${code}"
    }
}

func getStringAndFree(cString: CString): String {
    var result = ""
    // may be invalid UTF8 and may be parsed abnormally
    try {
        result = cString.toString()
    } finally {
        unsafe { LibC.free(cString) }
    }
    return result
}

func createWebviewControllerWithWebTag(webTag: String): Int64 {
    unsafe {
        let cWebTag = LibC.mallocCString(webTag)
        let id = FfiOHOSWebviewCtlConstructorWithWebTag(cWebTag)
        LibC.free(cWebTag)
        return id
    }
}

func throwIfNotSuccess(code: Int32, className: String, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        WEBVIEW_LOG.error("${className} ${funcName} failed: ${getErrorMsg(code)}")
        throw BusinessException(code, getErrorMsg(code))
    }
}

func freeArrOfflineResourceMap(ptr: CPointer<COfflineResourceMap>, len: Int64) {
    for (i in 0..len) {
        unsafe {
            ptr.read(i).free()
        }
    }
    unsafe { LibC.free(ptr) }
}
