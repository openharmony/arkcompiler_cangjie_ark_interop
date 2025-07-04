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

package ohos.hiappevent

import ohos.ffi.*
import std.collection.*
import ohos.base.*

let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    (11100001, "Function is disabled."),
    (11101001, "Invalid event domain."),
    (11101002, "Invalid event name."),
    (11101003, "Invalid number of event parameters."),
    (11101004, "Invalid string length of the event parameter."),
    (11101005, "Invalid event parameter name."),
    (11101006, "Invalid array length of the event parameter."),
    (11101007, "The number of parameter keys exceeds the limit."),
    (11102001, "Invalid watcher name."),
    (11102002, "Invalid filtering event domain."),
    (11102003, "Invalid row value."),
    (11102004, "Invalid size value."),
    (11102005, "Invalid timeout value."),
    (11103001, "Invalid max storage quota value."),
    (11104001, "Invalid size value."),
    (16000003, "Id does not exist.")
)

func getErrorInfo(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}
