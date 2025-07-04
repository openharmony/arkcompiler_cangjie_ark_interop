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

package ohos.file_picker

import ohos.ffi.*
import ohos.hilog.*
import std.collection.*
import ohos.base.*

const FILEIO_DOMAIN_ID = 0xD004388u32
let PICKER_LOG = HilogChannel(0, FILEIO_DOMAIN_ID, "CJ-picker")

struct ErrCode {
    static const INVALID_ARGS: Int32 = 13900020
    static const RESULT_ERROR: Int32 = 13900042
    static const NAME_TOO_LONG: Int32 = 13900030
    static const CONTEXT_NO_EXIST: Int32 = 16000011
}

let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    [
        (ErrCode.INVALID_ARGS, "Invalid argument."),
        (ErrCode.RESULT_ERROR, "Unknown error."),
        (ErrCode.NAME_TOO_LONG, "File name too long."),
        (ErrCode.CONTEXT_NO_EXIST, "Current ability failed to obtain context.")
    ]
)
