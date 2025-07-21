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

package ohos.bluetooth

import std.collection.HashMap
import ohos.hilog.*
import ohos.base.*
import ohos.ffi.*

protected let BLUETOOTH_LOG = HilogChannel(0, 0xD000101, "CJ-Bluetooth")
protected const SERVICE_STOPPED = 2900001i32
protected const BLUETOOTH_DISABLED = 2900003i32
protected const PROFILE_NOT_SUPPORTED = 2900004i32
protected const DEVICE_NOT_CONNECTED = 2900005i32
protected const THE_MAXIMUM_NUMBER_OF_CONNECTIONS_HAS_BEEN_REACHED = 2900006i32
protected const THE_VALUE_OF_PROXY_IS_A_NULL_POINTER = 2900008i32
protected const OPERATION_FAILED = 2900099i32
protected const IPC_FAILED = 2900100i32
protected const READ_FORBIDDEN = 2901000i32
protected const WRITE_FORBIDDEN = 2901001i32
protected const IO_ERROR = 2901054i32

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (SERVICE_STOPPED, "Service stopped."),
        (BLUETOOTH_DISABLED, "Bluetooth disabled."),
        (PROFILE_NOT_SUPPORTED, "Profile not supported."),
        (DEVICE_NOT_CONNECTED, "Device not connected."),
        (THE_MAXIMUM_NUMBER_OF_CONNECTIONS_HAS_BEEN_REACHED, "The maximum number of connections has been reached."),
        (THE_VALUE_OF_PROXY_IS_A_NULL_POINTER, "The value of proxy is a null pointer."),
        (OPERATION_FAILED, "Operation failed."),
        (IPC_FAILED, "IPC failed."),
        (READ_FORBIDDEN, "Read forbidden."),
        (WRITE_FORBIDDEN, "Write forbidden."),
        (IO_ERROR, "IO error.")
    ]
)

protected func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Inner error code ${code}"
    }
}

const INVALID_PARAMETER: Int32 = 401

protected func checkRet(errorCode: Int32): Unit {
    if (errorCode == INVALID_PARAMETER) {
        throw IllegalArgumentException("Invalid parameter.")
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}
