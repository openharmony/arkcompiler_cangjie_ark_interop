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

package ohos.data_share_predicates

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import std.collection.HashMap

const SUCCESS_CODE: Int32 = 0
const MEMORY_ERROR: Int32 = -1
let LOG = HilogChannel(0, 0xD001651, "CJ-dataSharePredicates")

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else {
        return "Unknown error code: ${code}"
    }
}

func throwIfNotSuccess(code: Int32): Unit {
    if (code != SUCCESS_CODE) {
        if (code == MEMORY_ERROR) {
            throw IllegalMemoryException("Out of memory.")
        }
        throw BusinessException(code, getErrorMsg(code))
    }
}
