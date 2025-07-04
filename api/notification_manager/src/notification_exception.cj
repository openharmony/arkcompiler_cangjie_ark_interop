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

package ohos.notification_manager

import std.collection.HashMap
import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*

const NOTIFICATION_DOMAIN_ID = 0xD001200u32
let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    // Notification error code
    (1600001, "Internal error."),
    (1600002, "marshalling or unmarshalling error."),
    (1600003, "Failed to connect service."),
    (1600004, "Notification is not enabled."),
    (1600005, "Notification slot is not enabled."),
    (1600006, "Notification is not allowed to remove."),
    (1600007, "The notification is not exist."),
    (1600008, "The user is not exist."),
    (1600009, "Over max number notifications per second."),
    (1600010, "Distributed operation failed."),
    (1600011, "Read template config failed."),
    (1600012, "No memory space."),
    (1600013, "Enable notification dialog is popping."),
    (1600014, "No right."),
    (1600015, "Repeat create or end."),
    (1600016, "Low update version."),
    (2300007, "Network unreachable."),
    (17700001, "The specified bundle name was not found.")
)

func getErrorInfo(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error."
    }
}
