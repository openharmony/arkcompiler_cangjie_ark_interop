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

package ohos.net.webSocket

import ohos.base.*
import ohos.ffi.*
import std.collection.HashMap
import ohos.hilog.*

/**
 * Log for WebSocket.
 */
let WEB_SOCKET_LOG = HilogChannel(0, 0xD0015B0, "CJ-net-WebSocket")

/**
 * Exception Handle.
 */
const WEB_PERMISSION_DENIED = 201i32
const PARAM_INVALID = 401i32
const ERROR_CODE_URL_ERROR = 2302001i32
const ERROR_CODE_FILE_NOT_EXIST = 2302002i32
const ERROR_CODE_CONNECT_ALREADY_EXIST = 2302003i32
const NOT_ALLOWED_HOST = 2302008i32
const UNKNOWN_OTHER_ERROR = 2302009i32
let ERROR_MESSAGE = HashMap<Int32, String>(
    [
        (WEB_PERMISSION_DENIED, "Permission denied."),
        (PARAM_INVALID, "Parameter error."),
        (ERROR_CODE_URL_ERROR, "Websocket url error."),
        (ERROR_CODE_FILE_NOT_EXIST, "Websocket file not exist."),
        (ERROR_CODE_CONNECT_ALREADY_EXIST, "Websocket connection exist."),
        (NOT_ALLOWED_HOST, "It is not allowed to access this domain."),
        (UNKNOWN_OTHER_ERROR, "Websocket unknown Other Error.")
    ]
)

func getErrorMsg(code: Int32): String {
    ERROR_MESSAGE.get(code) ?? "Unknown error code ${code}"
}

func checkRet(errCode: Int32, message: String) {
    if (errCode != 0) {
        if (let Some(errMsg) <- ERROR_MESSAGE.get(errCode)) {
            let msg = message + errMsg
            throw BusinessException(errCode, msg)
        }
        let msg = message + "Unrecognized error code: ${errCode}"
        throw BusinessException(errCode, msg)
    }
}
