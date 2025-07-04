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

package ohos.user_auth

import std.overflow.CheckedOp

func codeConvert(code: Int32): Int32 {
    if (code == ResultCode.CHECK_PERMISSION_FAILED) {
        return UserAuthResultCode.OHOS_CHECK_PERMISSION_FAILED
    }
    if (code == ResultCode.CHECK_SYSTEM_APP_FAILED) {
        return UserAuthResultCode.OHOS_CHECK_SYSTEM_APP_FAILED
    }
    if (code == ResultCode.INVALID_PARAMETERS) {
        return UserAuthResultCode.OHOS_INVALID_PARAM
    }
    let ret = UserAuthResultCode.MIN.checkedAdd(code)
    match (ret) {
        case Some(v) =>
            if (v <= UserAuthResultCode.MAX) {
                return v
            } else {
                return UserAuthResultCode.GENERAL_ERROR
            }
        case _ => return UserAuthResultCode.GENERAL_ERROR
    }
}
