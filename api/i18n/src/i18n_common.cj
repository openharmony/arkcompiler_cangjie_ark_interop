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

package ohos.i18n

import std.deriving.Derive
import std.time.DateTime
import ohos.base.*
import ohos.ffi.*
import ohos.labels.*
import std.collection.HashMap

protected const INVALID_PARAMETER = 890001i32
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [(INVALID_PARAMETER, "Invalid parameter. Possible causes: Parameter verification failed.")])

protected func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}

@C
struct CDate {
    CDate(
        let year: Int64,
        let month: Int64,
        let day: Int64,
        let icuUdate: Float64,
        let isNull: Bool
    ) {}

    init(date: DateTime) {
        this.year = date.year
        this.month = date.month.toInteger()
        this.day = date.dayOfMonth
        this.icuUdate = Float64(date.toUnixTimeStamp().toMilliseconds())
        this.isNull = false
    }

    init() {
        this.year = 0
        this.month = 0
        this.day = 0
        this.icuUdate = 0.0
        this.isNull = true
    }
}