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

package ohos.background_task_mgr

import ohos.ffi.*
import ohos.hilog.*
import std.collection.HashMap
import ohos.base.*
import ohos.labels.*

let TASK_MGR_LOG = HilogChannel(0, 0xD001711, "CJ-BackgroundTaskManager")

type StageContext = CPointer<Unit>

/**
 * Requests delayed transition to the suspended state.
 *
 * @param { String } reason - Indicates the reason for delayed transition to the suspended state.
 * @param { ()->Unit } callback - The callback delay time expired.
 * @returns { DelaySuspendInfo } Info of delay request.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9800001 - Memory operation failed.
 * @throws { BusinessException } 9800002 - Parcel operation failed.
 * @throws { BusinessException } 9800003 - Inner transact failed.
 * @throws { BusinessException } 9800004 - System service operation failed.
 * @throws { BusinessException } 9900001 - Caller information verification failed.
 * @throws { BusinessException } 9900002 - Background task verification failed.
 * @syscap SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask
 * @brief requestSuspendDelay(reason: string, callback: Callback<void>): DelaySuspendInfo;
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask"
]
public func requestSuspendDelay(reason: String, callback: () -> Unit): DelaySuspendInfo {
    TASK_MGR_LOG.debug("Background Task Manager: requestSuspendDelay start")
    unsafe {
        try (creason = LibC.mallocCString(reason).asResource()) {
            var ret = RetDelaySuspendInfo(0, 0)
            let callback0 = Callback0Param<Unit>(callback)
            let retCode = CJ_RequestSuspendDelay(callback0.getID(), creason.value, inout ret)
            if (retCode != SUCCESS_CODE) {
                throw BusinessException(handleErrorCode(retCode),
                    "Background Task Manager: requestSuspendDelay failed: ${getErrorMsg(retCode)}")
            }
            TASK_MGR_LOG.debug("Background Task Manager: requestSuspendDelay end")
            return DelaySuspendInfo(ret)
        }
        throw Exception("requestSuspendDelay get DelaySuspendInfo failed")
    }
}

/**
 * Obtains the remaining time before an application enters the suspended state.
 *
 * @param { Int32 } requestId - The identifier of the delay request.
 * @returns { Int32 } The promise returns the remaining delay time.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9800001 - Memory operation failed.
 * @throws { BusinessException } 9800002 - Parcel operation failed.
 * @throws { BusinessException } 9800003 - Inner transact failed.
 * @throws { BusinessException } 9800004 - System service operation failed.
 * @throws { BusinessException } 9900001 - Caller information verification failed.
 * @throws { BusinessException } 9900002 - Background task verification failed.
 * @syscap SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask
 * @brief getRemainingDelayTime(requestId: number): Promise<number>;
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask"
]
public func getRemainingDelayTime(requestId: Int32): Int32 {
    TASK_MGR_LOG.debug("Background Task Manager: getRemainingDelayTime start")
    var delay = 0i32
    let retCode = unsafe { CJ_GetRemainingDelayTime(requestId, inout delay) }
    if (retCode != SUCCESS_CODE) {
        throw BusinessException(handleErrorCode(retCode),
            "Background Task Manager: getRemainingDelayTime failed: ${getErrorMsg(retCode)}")
    }
    TASK_MGR_LOG.debug("Background Task Manager: getRemainingDelayTime end")
    delay
}

/**
 * Cancels delayed transition to the suspended state.
 *
 * @param { Int32 } requestId - The identifier of the delay request.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9800001 - Memory operation failed.
 * @throws { BusinessException } 9800002 - Parcel operation failed.
 * @throws { BusinessException } 9800003 - Inner transact failed.
 * @throws { BusinessException } 9800004 - System service operation failed.
 * @throws { BusinessException } 9900001 - Caller information verification failed.
 * @throws { BusinessException } 9900002 - Background task verification failed.
 * @syscap SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask
 * @brief cancelSuspendDelay(requestId: number): void;
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask"
]
public func cancelSuspendDelay(requestId: Int32): Unit {
    TASK_MGR_LOG.debug("Background Task Manager: cancelSuspendDelay start")
    let retCode = unsafe { CJ_CancelSuspendDelay(requestId) }
    if (retCode != SUCCESS_CODE) {
        throw BusinessException(handleErrorCode(retCode),
            "Background Task Manager: cancelSuspendDelay failed: ${getErrorMsg(retCode)}")
    }
    TASK_MGR_LOG.debug("Background Task Manager: cancelSuspendDelay end")
}

/**
 * Service ability uses this method to request stop running in background.
 *
 * @param { StageContext } context - App running context.
 * @returns { Unit } The promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9800001 - Memory operation failed.
 * @throws { BusinessException } 9800002 - Parcel operation failed.
 * @throws { BusinessException } 9800003 - Inner transact failed.
 * @throws { BusinessException } 9800004 - System service operation failed.
 * @throws { BusinessException } 9800005 - Background task verification failed.
 * @throws { BusinessException } 9800006 - Notification verification failed.
 * @throws { BusinessException } 9800007 - Task storage failed.
 * @syscap SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask
 * @brief stopBackgroundRunning(context: Context): Promise<void>;
 */
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask"
]
public func stopBackgroundRunning(context: StageContext): Unit {
    TASK_MGR_LOG.debug("Background Task Manager: stopBackgroundRunning start")
    let retCode = unsafe { CJ_StopBackgroundRunning(context) }
    if (retCode != SUCCESS_CODE) {
        throw BusinessException(handleErrorCode(retCode),
            "Background Task Manager: stopBackgroundRunning failed: ${getErrorMsg(retCode)}")
    }
    TASK_MGR_LOG.debug("Background Task Manager: stopBackgroundRunning end")
}
