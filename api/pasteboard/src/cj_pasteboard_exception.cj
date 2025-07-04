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

package ohos.pasteboard

import std.collection.HashMap
import ohos.ffi.*
import ohos.base.*

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (1300001, "Repeated operation."),
        (1300002, "This window state is abnormal."),
        (1300003, "This window manager service works abnormally."),
        (1300004, "Unauthorized operation."),
        (1300005, "This window stage is abnormal."),
        (1300006, "This window context is abnormal."),
        (1300007, "Start ability failed."),
        (1300008, "The operation is on invalid display."),
        (1300009, "The parent window is invalid."),
        (1300010, "This operation is not support in fullscreen."),
        (12900001, "index out of range."),
        (12900002, "The number of record exceeds the maximum limit."),
        (12900003, "Another copy or paste is in progress."),
        (12900004, "Replication is prohibited.")
    ]
)

func checkInnerCode(code: Int32): Unit {
    if (code == -1) {
        throw IllegalStateException("invalid instance")
    }
    if (code == -2) {
        throw IllegalMemoryException("Out of memory.")
    }
}

func checkRet(errCode: Int32, message: String) {
    if (errCode != 0) {
        checkInnerCode(errCode)
        var msg: String
        if (let Some(v) <- getUniversalErrorMsg(errCode)) {
            msg = message + v
            throw BusinessException(errCode, msg)
        } else if (ERROR_CODE_MAP.contains(errCode)) {
            msg = message + ERROR_CODE_MAP[errCode]
            throw BusinessException(errCode, msg)
        } else {
            msg = message + "Unrecognized error code: ${errCode}"
            throw BusinessException(errCode, msg)
        }
    }
}
