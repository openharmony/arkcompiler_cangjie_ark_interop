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

package ohos.request.agent

import std.collection.*
import ohos.base.*
import ohos.ffi.*

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (EXCEPTION_FILEIO, "file operation error"),
        (EXCEPTION_FILEPATH, "bad file path"),
        (EXCEPTION_SERVICE, "task service ability error"),
        (EXCEPTION_OTHERS, "other error")
    ]
)

func getErrorMsg(err: RetError): String {
    if (err.errMsg.isNull()) {
        return getErrorMsg(err.errCode)
    }

    err.errMsg.toString()
}

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}
