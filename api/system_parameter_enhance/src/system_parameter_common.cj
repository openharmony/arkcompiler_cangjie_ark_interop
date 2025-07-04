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

package ohos.system_parameter_enhance

import ohos.base.*
import ohos.ffi.*
import ohos.hilog.*
import std.collection.*

const LOG_CORE: UInt32 = 3
const LOG_TAG_DOMAIN_ID_PARA: UInt32 = 0xD002C0C
const MAX_NAME_LENGTH = 128
const MAX_VALUE_LENGTH = 4096
let PARAM_LOG = HilogChannel(LOG_CORE, LOG_TAG_DOMAIN_ID_PARA, "CJ-Param")

foreign func FfiOHOSSysTemParameterGet(key: CString, def: CString): RetDataCString

foreign func FfiOHOSSysTemParameterSet(key: CString, value: CString): Int32

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (14700101, "System parameter can not be found."),
        (14700102, "System parameter value is invalid."),
        (14700103, "System permission operation permission denied."),
        (14700104, "System internal error including out of memory, deadlock etc.")
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error. Error code is ${code}"
    }
}
