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

package ohos.color_manager

import std.collection.HashMap
import ohos.base.*

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [(18600001, "Parameter value is abnormal. Cannot create color manager object using ApiColorSpaceType 5")])

func checkRet(errCode: Int32, message: String) {
    if (errCode != 0) {
        var msg: String
        if (let Some(v) <- getUniversalErrorMsg(errCode)) {
            msg = message + v
            throw BusinessException(errCode, msg)
        } else if (ERROR_CODE_MAP.contains(errCode)) {
            msg = message + ERROR_CODE_MAP[errCode]
            throw BusinessException(errCode, msg)
        } else {
            msg = message + "Unrecognized error code: ${errCode}"
            throw BusinessException(errCode, msg)
        }
    }
}
