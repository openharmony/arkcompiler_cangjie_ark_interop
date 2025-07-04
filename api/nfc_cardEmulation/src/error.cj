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

package ohos.nfc.cardEmulation

import std.collection.HashMap
import ohos.base.*
import ohos.ffi.*

const SUCCESS_CODE: Int32 = 0
const BUSI_ERR_NFC_STATE_INVALID: Int32 = 3100101
const BUSI_ERR_TAG_STATE_INVALID: Int32 = 3100201
const BUSI_ERR_ELEMENT_STATE_INVALID: Int32 = 3100202
const BUSI_ERR_REGISTER_STATE_INVALID: Int32 = 3100203
const BUSI_ERR_IO_OPERATION_INVALID: Int32 = 3100204
const BUSI_ERR_HCE_STATE_INVALID: Int32 = 3100301
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (BUSI_ERR_NFC_STATE_INVALID, "NFC state is abnormal in service."),
        (BUSI_ERR_TAG_STATE_INVALID, "Tag running state is abnormal in service."),
        (BUSI_ERR_ELEMENT_STATE_INVALID, "The element state is invalid."),
        (BUSI_ERR_REGISTER_STATE_INVALID, "The off() can be called only when the on() has been called."),
        (BUSI_ERR_IO_OPERATION_INVALID, "Tag I/O operation failed."),
        (BUSI_ERR_HCE_STATE_INVALID, "Card emulation running state is abnormal in service.")
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}
