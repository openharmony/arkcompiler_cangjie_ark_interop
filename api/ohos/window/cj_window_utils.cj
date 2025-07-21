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

package ohos.window

internal import std.collection.HashMap
internal import ohos.base.*

let ErrCodeMap = HashMap<Int32, String>(
    [
        (1300001, "Repeated operation."),
        (1300002, "This window state is abnormal."),
        (1300003, "This window manager service works abnormally."),
        (1300004, "Unauthorized operation."),
        (1300005, "This window stage is abnormal."),
        (1300006, "This window context is abnormal."),
        (1300007, "Start ability failed."),
        (1300008, "The operation is on invalid display."),
        (1300009, "The parent window is invalid."),
        (1300010, "This operation is not support in fullscreen."),
        (201, "Permission verification failed, usually the result returned by VerifyAccessToken."),
        (202, "Permission verification failed, application which is not a system application uses system API."),
        (401, "Parameter error."),
        (801, "Capability not supported.")
    ]
)

func toWindowType(value: UInt32): WindowType {
    return match (value) {
        case 0 => TYPE_APP
        case 1 => TYPE_SYSTEM_ALERT
        case 8 => TYPE_FLOAT
        case 16 => TYPE_DIALOG
        case 32 => TYPE_APP
        case _ => throw Exception("Unrecognizable WindowType: ${value}!")
    }
}

func checkRet(errCode: Int32, message: String) {
    if (errCode != 0) {
        if (let Some(errMsg) <- ErrCodeMap.get(errCode)) {
            let msg = message + errMsg
            throw BusinessException(errCode, msg)
        }
        let msg = message + "Unrecognized error code: ${errCode}"
        throw BusinessException(errCode, msg)
    }
}
