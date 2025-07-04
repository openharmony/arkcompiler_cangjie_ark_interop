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

package ohos.accessibility

import ohos.ffi.*
import ohos.base.*

protected func checkRet(errorCode: Int32, message: String): Unit {
    if (errorCode == SUCCESS_CODE) {
        return
    }
    if (let Some(errMsg) <- getUniversalErrorMsg(errorCode)) {
        let msg = message + ": " + errMsg
        throw BusinessException(errorCode, msg)
    }
    let msg = message + " Unknown error code ${errorCode}"
    throw BusinessException(errorCode, msg)
}
