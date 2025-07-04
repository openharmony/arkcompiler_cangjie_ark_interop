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

package ohos.system_date_time

import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.hilog.*

let SYSTEM_DATE_TIME_DOMAIN_ID: UInt32 = 0xD001C04
const SYSTEM_ERROR: Int32 = -1

func getErrorInfo(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else {
        return "Unknown error"
    }
}

func throwIfNotSuccess(code: Int32): Unit {
    if (code != SUCCESS_CODE) {
        if (code == SYSTEM_ERROR) {
            throw IllegalStateException("system error")
        }
        Hilog.error(SYSTEM_DATE_TIME_DOMAIN_ID, "Date-Time", getErrorInfo(code))
        throw BusinessException(code, getErrorInfo(code))
    }
}
