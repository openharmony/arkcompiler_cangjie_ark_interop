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

package ohos.advertising.advertising

import std.collection.HashMap
import ohos.base.*

const SYSTEM_INTERNAL_ERROR: Int32 = 21800001
const FAILED_TO_LOAD_AD: Int32 = 21800003
const FAILED_TO_DISPLAY_AD: Int32 = 21800004
const FAILED_TO_PARSE_AD: Int32 = 21800005
let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    (SYSTEM_INTERNAL_ERROR, "System internal error."),
    (FAILED_TO_LOAD_AD, "Failed to load the ad request."),
    (FAILED_TO_DISPLAY_AD, "Failed to display the ad."),
    (FAILED_TO_PARSE_AD, "Failed to parse the ad response."),
)

func getErrorInfo(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}
