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

package ohos.security_element

import ohos.hilog.*
import std.collection.*
import ohos.base.*
import ohos.ffi.*

let SE_LOG = HilogChannel(0, 0x0, "CJ_security_element")
protected const ILLEGAL_STATE_ERR: Int32 = 3300101i32
protected const ILLEGAL_ELEMENT_ERR: Int32 = 3300102i32
protected const SECURITY_ERR: Int32 = 3300103i32
protected const IO_ERR: Int32 = 3300104i32
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (ILLEGAL_STATE_ERR, "IllegalStateError, an attempt is made to use an SE session that has been closed."),
        (ILLEGAL_ELEMENT_ERR, "NoSuchElementError, the AID on the SE is not available or cannot be selected."),
        (SECURITY_ERR,
            "SecurityError, the calling application cannot be granted access to this AID or the default applet on this session."),
        (IO_ERR, "IOError, there is a communication problem to the reader or the SE.")
    ]
)

protected func checkRet(errCode: Int32, message: String): Unit {
    if (errCode != SUCCESS_CODE) {
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
