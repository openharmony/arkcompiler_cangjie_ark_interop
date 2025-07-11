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

package ohos.ability

import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

foreign func FfiOHOSErrorManagerOn(onType: CString, observer: CErrorObserver): RetDataI32

foreign func FfiOHOSErrorManagerOff(offType: CString, observerId: Int32): Int32

foreign func FfiOHOSErrorManagerLoopObserverOff(): Int32

const EXCEPTION_PARAMCHECK: Int32 = 401
const CALLER_ERROR: Int32 = 16200001
const PARAM_INVALID_ERR_MSG: String = "Parameter error: The timeout cannot be less than 0."
const CALLER_ERROR_ERR_MSG: String = "Caller error. Caller from non-main thread."

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ErrorManager {
    /**
     * Register error observer.
     *
     * @param { onType } String - "error"
     * @param { ErrorObserver } observer - The error observer.
     * @returns {Int32 } Returns the number code of the observer.
     * @throws { BusinessError } 401 - If the input parameter is not valid parameter.
     * @brief on(type: 'error', observer: ErrorObserver): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func on(onType: String, observer: ErrorObserver): Int32 {
        if (onType != "error") {
            throw BusinessException(EXCEPTION_PARAMCHECK, getErrorInfo(EXCEPTION_PARAMCHECK))
        }
        let cOnType = unsafe { LibC.mallocCString(onType) }
        try {
            let cObserver = unsafe { CErrorObserver(observer) }
            let res = unsafe { FfiOHOSErrorManagerOn(cOnType, cObserver) }
            match {
                case res.code == SUCCESS_CODE => return res.data
                case _ =>
                    ABILITY_LOG.error(getErrorInfo(res.code))
                    throw BusinessException(res.code, getErrorInfo(res.code))
            }
        } finally {
            unsafe { LibC.free(cOnType) }
        }
    }

    /**
     * Unregister error observer.
     *
     * @param { offType } String - "error".
     * @param { Int32 } observerId - Indicates the number code of the observer.
     * @throws { BusinessError } 401 - If the input parameter is not valid parameter.
     * @throws { BusinessError } 16000003 - Id does not exist.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @brief off(type: 'error', observerId: number): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func off(offType: String, observerId: Int32): Unit {
        let cOffType = unsafe { LibC.mallocCString(offType) }
        let res = unsafe { FfiOHOSErrorManagerOff(cOffType, observerId) }
        unsafe { LibC.free(cOffType) }
        match {
            case res == SUCCESS_CODE => return
            case _ =>
                ABILITY_LOG.error(getErrorInfo(res))
                throw BusinessException(res, getErrorInfo(res))
        }
    }
}
