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

package ohos.form.form_info

import std.collection.HashMap
import ohos.base.{BusinessException, ERR_PARAMETER_ERROR}
import ohos.base.getUniversalErrorMsg

protected const INTERNAL_ERROR: Int32 = 16501000
let ERROR_MSG_MAP = HashMap<Int32, String>(
    [
        (16500050, "IPC connection error."),
        (16500060, "Service connection error."),
        (16500100, "Failed to obtain configuration information."),
        (INTERNAL_ERROR, "An internal functional error occurred."),
        (16501001, "The ID of the form to be operated does not exist."),
        (16501002, "The number of forms exceeds the maximum allowed."),
        (16501003, "The form cannot be operated by the current application."),
        (16501006, "FormRenderService is stopped. Connect to the service again."),
        (16501007, "Form is not trust."),
        (16501008, "Waiting for the form addition to the desktop timed out."),
        (2293761, "Some internal server error occurs."),
        (2293766, "The requested bundle name does not exist."),
        (2293767, "Invalid params received on operating form."),
        (2293795, "Get bms rpc failed."),
        (2293798, "Get fms rpc failed."),
        (2293802, "Get system manager service failed.")
    ]
)

protected func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    }
    match (ERROR_MSG_MAP.get(code)) {
        case Some(v) => v
        case None => "Unknown error. Error code is ${code}"
    }
}

protected func formKitCheckCodeAndThrow(code: Int32): Unit {
    if (code == ERR_PARAMETER_ERROR) {
        throw IllegalArgumentException("Parameter is error, please check")
    }
    if (code != 0) {
        throw BusinessException(code, getErrorMsg(code))
    }
}
