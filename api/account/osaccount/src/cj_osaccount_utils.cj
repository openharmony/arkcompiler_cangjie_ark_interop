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

package ohos.account.osAccount

import ohos.base.*
import std.collection.HashMap

protected const ACCOUNT_SYSTEM_ERROR = 12300001i32
protected const INVALID_PARAMETER = 12300002i32
protected const NOT_EXIST_ACCOUNT_ERROR = 12300003i32
protected const NOT_EXIST_ACCOUNT_BY_SERIALNUMBER_ERROR = 12300003i32
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (ACCOUNT_SYSTEM_ERROR, "System service exception."),
        (INVALID_PARAMETER, "Invalid parameter."),
        (NOT_EXIST_ACCOUNT_ERROR, "Account not found."),
        (NOT_EXIST_ACCOUNT_BY_SERIALNUMBER_ERROR, "The account indicated by serialNumber dose not exist.")
    ]
)

protected func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code: ${code}"
    }
}

func checkRet(errCode: Int32, message: String) {
    if (errCode != 0) {
        let msg = message + getErrorMsg(errCode)
        throw BusinessException(errCode, msg)
    }
}
