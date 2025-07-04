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

package ohos.common_event_manager

import ohos.base.*
import ohos.ffi.*
import std.collection.*

const MEMORY_ERROR: Int32 = -2
const ERROR_CES_FAILED: Int32 = 1
const ERROR_NOT_SYSTEM_SERVICES: Int32 = 1500004
const ERROR_SENDING_MSG_TO_CES: Int32 = 1500007
const ERROR_CES_UNINITIALIZED: Int32 = 1500008
const ERROR_OBTAINING_SYSTEM_PARAMETERS: Int32 = 1500009
let ERROR_CODE_MAP = HashMap<Int32, String>(
    (ERROR_NOT_SYSTEM_SERVICES, "Not System services."),
    (ERROR_SENDING_MSG_TO_CES, "Error sending message to Common Event Service."),
    (ERROR_CES_UNINITIALIZED, "Common Event Service does not complete initialization."),
    (ERROR_OBTAINING_SYSTEM_PARAMETERS, "Error obtaining system parameters.")
)

func getErrorCode(code: Int32): Int32 {
    if (code == MEMORY_ERROR || code == INVALID_CODE || code == ERROR_CES_FAILED) {
        ERROR_CES_UNINITIALIZED
    } else {
        code
    }
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

func throwIfNotSuccess(code: Int32, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        let errCode = getErrorCode(code)
        throw BusinessException(errCode, "${funcName} failed: ${getErrorMsg(errCode)}")
    }
}
