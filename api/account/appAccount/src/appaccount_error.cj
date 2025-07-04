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

package ohos.account.appAccount

import std.collection.HashMap
import ohos.base.*
import ohos.ffi.*

// ERRORCODE
const OUT_MEMORY_ERR: Int32 = 12100008
const SYSTEM_SERVICE_EXCEPTION: Int32 = 12300001
const INVALID_PARAMETER: Int32 = 12300002
const ACCOUNT_NOT_FOUND: Int32 = 12300003
const ACCOUNT_ALREADY_EXISTS: Int32 = 12300004
const ACCOUNTS_NUMBER_REACHES_UPPER: Int32 = 12300007
const ACCOUNT_SERVICE_BUSY: Int32 = 12300010
const CREDENTIAL_NOT_FOUND: Int32 = 12300102
const AUTHTYPE_NOT_FOUND: Int32 = 12300107
const SESSION_NOT_FOUND: Int32 = 12300108
const AUTHENTICATOR_SERVICE_NOT_FOUND: Int32 = 12300113
const AUTHENTICATOR_SERVICE_EXCEPTION: Int32 = 12300114
const APPLICATION_NOT_FOUND: Int32 = 12400001
const CUSTOM_DATA_NOT_FOUND: Int32 = 12400002
const CUSTOM_DATA_REACHES_UPPER: Int32 = 12400003
const TOKENS_REACHES_UPPER: Int32 = 12400004
const AUTHORIZATION_LIST_REACHES_UPPER: Int32 = 12400005
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (OUT_MEMORY_ERR, "out memory error"),
        (SYSTEM_SERVICE_EXCEPTION, "System service exception"),
        (INVALID_PARAMETER, "Invalid parameter"),
        (ACCOUNT_NOT_FOUND, "Account not found"),
        (ACCOUNT_ALREADY_EXISTS, "Account already exists"),
        (ACCOUNTS_NUMBER_REACHES_UPPER, "The number of accounts reaches the upper limit"),
        (ACCOUNT_SERVICE_BUSY, "Account service busy"),
        (CREDENTIAL_NOT_FOUND, "Credential not found"),
        (AUTHTYPE_NOT_FOUND, "AuthType not found"),
        (SESSION_NOT_FOUND, "Session not found"),
        (AUTHENTICATOR_SERVICE_NOT_FOUND, "Authenticator service not found"),
        (AUTHENTICATOR_SERVICE_EXCEPTION, "Authenticator service exception"),
        (APPLICATION_NOT_FOUND, "Application not found"),
        (CUSTOM_DATA_NOT_FOUND, "Custom data not found"),
        (CUSTOM_DATA_REACHES_UPPER, "The number of custom data reaches the upper limit"),
        (TOKENS_REACHES_UPPER, "The number of tokens reaches the upper limit"),
        (AUTHORIZATION_LIST_REACHES_UPPER, "The size of authorization list reaches the upper limit")
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}
