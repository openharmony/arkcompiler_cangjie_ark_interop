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

package ohos.screen_lock_file_manager

import std.collection.*
import ohos.ffi.*
import ohos.base.*

let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    (29300001, "Invalid DataType."),
    (29300002, "The system ability work abnormally."),
    (29300003, "The application is not enabled the data protection under lock screen."),
    (29300004, "File access is denied."),
    (29300005, "File access was not acquired.")
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
