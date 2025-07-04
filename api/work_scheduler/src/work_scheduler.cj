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

package ohos.work_scheduler

import ohos.ffi.*
import ohos.hilog.*
import std.collection.{ArrayList, HashMap}
import ohos.base.*
import ohos.labels.*

let WORK_LOG = HilogChannel(0, 0xD001712, "CJ-WorkScheduler")

/**
 * Add a work to the queue. A work can be executed only when it meets the preset triggering condition
 * <p> and complies with the rules of work scheduler manager. </p>
 *
 * @param { WorkInfo } work - The info of work.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9700001 - Memory operation failed.
 * @throws { BusinessException } 9700002 - Parcel operation failed.
 * @throws { BusinessException } 9700003 - System service operation failed.
 * @throws { BusinessException } 9700004 - Check workInfo failed.
 * @throws { BusinessException } 9700005 - StartWork failed.
 * @syscap SystemCapability.ResourceSchedule.WorkScheduler
 * @StageModelOnly
 * @brief startWork(work: WorkInfo): void
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public func startWork(work: WorkInfo): Unit {
    WORK_LOG.debug("Work Scheduler: startwork start")
    let cwork = RetWorkInfoV2(work)
    let retCode = unsafe { CJ_StartWorkV2(cwork) }
    unsafe { cwork.free() }
    throwIfNotSuccess(retCode, "startWork")
    WORK_LOG.debug("Work Scheduler: startwork end")
}

/**
 * Stop a work.
 *
 * @param { WorkInfo } work - The info of work.
 * @param { Bool } needCancel - True if need to be canceled after being stopped, otherwise false.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9700001 - Memory operation failed.
 * @throws { BusinessException } 9700002 - Parcel operation failed.
 * @throws { BusinessException } 9700003 - System service operation failed.
 * @throws { BusinessException } 9700004 - Check workInfo failed.
 * @syscap SystemCapability.ResourceSchedule.WorkScheduler
 * @StageModelOnly
 * @brief stopWork(work: WorkInfo, needCancel?: boolean): void
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public func stopWork(work: WorkInfo, needCancel!: Bool = false): Unit {
    WORK_LOG.debug("Work Scheduler: stopWork start")
    let cwork = RetWorkInfoV2(work)
    let retCode = unsafe { CJ_StopWorkV2(cwork, needCancel) }
    unsafe { cwork.free() }
    throwIfNotSuccess(retCode, "stopWork")
    WORK_LOG.debug("Work Scheduler: stopWork end")
}

/**
 * Obtains the work info of the wordId.
 *
 * @param { Int32 } workId - The id of work.
 * @param { WorkInfo } callback - The callback of the function.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9700001 - Memory operation failed.
 * @throws { BusinessException } 9700002 - Parcel operation failed.
 * @throws { BusinessException } 9700003 - System service operation failed.
 * @throws { BusinessException } 9700004 - Check workInfo failed.
 * @syscap SystemCapability.ResourceSchedule.WorkScheduler
 * @StageModelOnly
 * @brief getWorkStatus(workId: number): Promise<WorkInfo>
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public func getWorkStatus(workId: Int32): WorkInfo {
    WORK_LOG.debug("Work Scheduler: getWorkStatus start")
    unsafe {
        try (result = safeMalloc<RetWorkInfoV2>().asResource()) {
            let retCode = CJ_GetWorkStatusV2(workId, result.value)
            throwIfNotSuccess(retCode, "getWorkStatus")
            let ret = result.value.read()
            WORK_LOG.debug("Work Scheduler: getWorkStatus end")
            return WorkInfo(ret)
        }
        throw Exception("getWorkStatus get WorkInfo failed")
    }
}

/**
 * Get all works of the calling application.
 *
 * @returns { Array<WorkInfo> } the work info list.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9700001 - Memory operation failed.
 * @throws { BusinessException } 9700002 - Parcel operation failed.
 * @throws { BusinessException } 9700003 - System service operation failed.
 * @syscap SystemCapability.ResourceSchedule.WorkScheduler
 * @StageModelOnly
 * @brief obtainAllWorks(): Promise<Array<WorkInfo>>
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public func obtainAllWorks(): Array<WorkInfo> {
    WORK_LOG.debug("Work Scheduler: obtainAllWorks start")
    let ret = WorkInfoArray(unsafe { CJ_ObtainAllWorksV2() })
    let retCode = ret.code
    throwIfNotSuccess(retCode, "obtainAllWorks")
    if (ret.data.isNull()) {
        throw BusinessException(handleErrorCode(retCode),
            "Work Scheduler: obtainAllWorks failed: ${getErrorMsg(retCode)}")
    }
    let arr = Array<WorkInfo>(ret.size, {
        i => WorkInfo(unsafe { ret.data.read(i) })
    })
    unsafe { LibC.free<RetWorkInfoV2>(ret.data) }
    WORK_LOG.debug("Work Scheduler: obtainAllWorks end")
    arr
}

/**
 * Check whether last work running is timeout. The interface is for repeating work.
 *
 * @param { Int32 } workId - The id of work.
 * @returns { Bool } True if last work running is timeout, otherwise false.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 9700001 - Memory operation failed.
 * @throws { BusinessException } 9700002 - Parcel operation failed.
 * @throws { BusinessException } 9700003 - System service operation failed.
 * @throws { BusinessException } 9700004 - Check workInfo failed.
 * @syscap SystemCapability.ResourceSchedule.WorkScheduler
 * @StageModelOnly
 * @brief isLastWorkTimeOut(workId: number): Promise<boolean>
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public func isLastWorkTimeOut(workId: Int32): Bool {
    WORK_LOG.debug("Work Scheduler: isLastWorkTimeOut start")
    var ret = false
    let retCode = unsafe { CJ_IsLastWorkTimeOut(workId, inout ret) }
    throwIfNotSuccess(retCode, "isLastWorkTimeOut")
    WORK_LOG.debug("Work Scheduler: isLastWorkTimeOut end")
    ret
}

/**
 * Stop all and clear all works of the calling application.
 *
 * @throws { BusinessError } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameters types.
 * @throws { BusinessError } 9700001 - Memory operation failed.
 * @throws { BusinessError } 9700002 - Parcel operation failed.
 * @throws { BusinessError } 9700003 - System service operation failed.
 * @syscap SystemCapability.ResourceSchedule.WorkScheduler
 * @StageModelOnly
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public func stopAndClearWorks(): Unit {
    WORK_LOG.debug("Work Scheduler: stopAndClearWorks start")
    let retCode = unsafe { CJ_StopAndClearWorks() }
    throwIfNotSuccess(retCode, "stopAndClearWorks")
    WORK_LOG.debug("Work Scheduler: stopAndClearWorks end")
}
