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

foreign func FfiOHOSErrorManagerLoopObserverOn(timeout: Int64, observer: CLoopObserver): Int32

foreign func FfiOHOSErrorManagerLoopObserverOff(): Int32

const EXCEPTION_PARAMCHECK: Int32 = 401
const CALLER_ERROR: Int32 = 16200001
const PARAM_INVALID_ERR_MSG: String = "Parameter error: The timeout cannot be less than 0."
const CALLER_ERROR_ERR_MSG: String = "Caller error. Caller from non-main thread."

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class LoopObserver {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public LoopObserver(let onLoopTimeOut!: ?(Int64) -> Unit = None) {}
}

@!APILevel[
    12,
    atomicservice: true,
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
        12,
        atomicservice: true,
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
        12,
        atomicservice: true,
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

    /**
     * Register loop observer. This function can only by called from main thread,
     * and if call this function multiple times, the last
     * modification will overwrite the previous one.
     *
     * @param { 'loopObserver' } type - loopObserver.
     * @param { Int64 } timeout - Indicates timeout(ms) value of loop observer. It cannot less than 0.
     * @param { LoopObserver } observer - The loop observer.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 16200001 - Caller error. Caller from non-main thread.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func on(`type`: String, timeout: Int64, observer: LoopObserver): Unit {
        if (`type` != "loopObserver") {
            throw BusinessException(EXCEPTION_PARAMCHECK, getErrorInfo(EXCEPTION_PARAMCHECK))
        }

        let cObserver = unsafe { CLoopObserver(observer) }
        let ret = unsafe { FfiOHOSErrorManagerLoopObserverOn(timeout, cObserver) }
        if (ret != SUCCESS_CODE) {
            if (ret == CALLER_ERROR) {
                throw BusinessException(CALLER_ERROR, CALLER_ERROR_ERR_MSG)
            } else {
                throw BusinessException(EXCEPTION_PARAMCHECK, PARAM_INVALID_ERR_MSG)
            }
        }
    }

    /**
     * Unregister loop observer. This function can only by called from main thread.
     *
     * @param { 'loopObserver' } type - loopObserver.
     * @param { LoopObserver } observer - The loop observer.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 16200001 - Caller error. Caller from non-main thread.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func off(`type`: String, observer!: ?LoopObserver = None): Unit {
        if (`type` != "loopObserver") {
            throw BusinessException(EXCEPTION_PARAMCHECK, getErrorInfo(EXCEPTION_PARAMCHECK))
        }
        let ret = unsafe { FfiOHOSErrorManagerLoopObserverOff() }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(CALLER_ERROR, CALLER_ERROR_ERR_MSG)
        }
    }
}
