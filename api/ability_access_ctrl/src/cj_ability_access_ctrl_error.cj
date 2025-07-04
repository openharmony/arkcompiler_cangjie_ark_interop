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

package ohos.ability_access_ctrl

import std.collection.HashMap
import ohos.labels.*
import ohos.base.*

let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    (12100001, "The parameter is invalid."),
    (12100002, "The specified tokenID does not exist."),
    (12100003, "The specified permission does not exist."),
    (12100004, "The interface is not used together."),
    (12100005, "The number of listeners exceeds the limit."),
    (12100006,
        "The application specified by the tokenID is not allowed to be granted with the specified permission. Either the application is a sandbox or the tokenID is from a remote device."),
    (12100007, "Service is abnormal."),
    (12100008, "Out of memory."),
    (12100009, "Common inner error."),
    (12100010, "The request already exists"),
    (12100011, "All permissions in the permission list have been granted."),
    (12100012, "The permission list contains the permission that has not been revoked by the user."),
    (12100013, "The specific global switch is already open.")
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
