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

package ohos.hidebug

import ohos.ffi.*
import std.collection.HashMap
import ohos.base.*

const SYSTEM_ABILITY_NOT_FOUND = 11400101i32
const HAVA_ALREADY_TRACE = 11400102i32
const WITHOUT_WRITE_PERMISSON = 11400103i32
const SYSTEM_STATUS_ABNORMAL = 11400104i32
const NO_CAPTURE_TRACE_RUNNING = 11400105i32
const MEM_ERR = 1i32
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (SYSTEM_ABILITY_NOT_FOUND, "ServiceId invalid. The system ability does not exist."),
        (HAVA_ALREADY_TRACE, "Capture trace already enabled."),
        (WITHOUT_WRITE_PERMISSON, "No write permission on the file."),
        (SYSTEM_STATUS_ABNORMAL, "The status of the trace is abnormal"),
        (NO_CAPTURE_TRACE_RUNNING, "No capture trace running")
    ]
)

func getErrorCode(code: Int32): Int32 {
    if (code == MEM_ERR) {
        SYSTEM_STATUS_ABNORMAL
    } else {
        code
    }
}

func getErrMsg(code: Int32): String {
    let errCode = getErrorCode(code)
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}
