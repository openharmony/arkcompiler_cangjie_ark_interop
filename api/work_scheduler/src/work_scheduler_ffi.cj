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
import std.collection.HashMap
import ohos.base.*

foreign {
    func CJ_StartWorkV2(work: RetWorkInfoV2): Int32

    func CJ_StopWorkV2(work: RetWorkInfoV2, needCancel: Bool): Int32

    func CJ_GetWorkStatusV2(workId: Int32, result: CPointer<RetWorkInfoV2>): Int32

    func CJ_ObtainAllWorksV2(): RetArrRetWorkInfoV2

    func CJ_IsLastWorkTimeOut(workId: Int32, result: CPointer<Bool>): Int32

    func CJ_StopAndClearWorks(): Int32
}

@C
protected struct RetArrRetWorkInfoV2 {
    private RetArrRetWorkInfoV2(
        protected let code: Int32,
        protected let size: Int64,
        protected let data: CPointer<RetWorkInfoV2>
    ) {}
}

@C
struct CParameters {
    let valueType: Int8
    let key: CString
    let value: CPointer<Unit>
    let size: Int64

    init(p: Parameters) {
        this.key = unsafe { LibC.mallocCString(p.key) }
        (valueType, this.value, this.size) = try {
            getValue(p.value)
        } catch (e: Exception) {
            unsafe { LibC.free(this.key) }
            throw e
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free<Unit>(value)
            LibC.free(key)
        }
    }
}

@C
struct CArrParameters {
    CArrParameters(
        let head: CPointer<CParameters>,
        let size: Int64
    ) {}

    func free() {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

@C
protected struct RetWorkInfoV2 {
    // if optional value is -1, represent not set
    let workId: Int32
    let bundleName: CString
    let abilityName: CString
    let netWorkType: Int32
    let isCharging: Int32
    let chargerType: Int32
    let batteryLevel: Int32
    let batteryStatus: Int32
    let storageRequest: Int32
    let isRepeat: Int32
    let repeatCycleTime: Int32
    let repeatCount: Int32
    let isPersisted: Bool
    let isDeepIdle: Int32
    let idleWaitTime: Int32
    var cParam: CArrParameters = CArrParameters(CPointer<CParameters>(), 0)

    init(work: WorkInfo) {
        this.workId = work.workId
        this.bundleName = unsafe { LibC.mallocCString(work.bundleName) }
        try {
            this.abilityName = unsafe { LibC.mallocCString(work.abilityName) }
        } catch (e: Exception) {
            unsafe { LibC.free(this.bundleName) }
            throw e
        }
        this.isPersisted = work.isPersisted ?? false
        this.netWorkType = work.netWorkType?.getValue() ?? -1
        this.isCharging = matchBool(work.isCharging)
        this.chargerType = work.chargerType?.getValue() ?? -1
        this.batteryLevel = work.batteryLevel ?? -1
        this.batteryStatus = work.batteryStatus?.getValue() ?? -1
        this.storageRequest = work.storageRequest?.getValue() ?? -1
        this.isRepeat = matchBool(work.isRepeat)
        this.repeatCycleTime = work.repeatCycleTime ?? -1
        this.repeatCount = work.repeatCount ?? -1
        this.isDeepIdle = matchBool(work.isDeepIdle)
        this.idleWaitTime = work.idleWaitTime ?? -1
        if (work.parameters.size > 0) {
            this.cParam = unsafe { createCArrParam(work.parameters) }
        }
    }

    func free() {
        unsafe {
            LibC.free(bundleName)
            LibC.free(abilityName)
            this.cParam.free()
        }
    }
}

unsafe func createCArrParam(parameters: HashMap<String, WorkSchedulerValueType>): CArrParameters {
    let cp = safeMalloc<CParameters>(count: parameters.size)
    let ptr = CArrParameters(cp, parameters.size)
    var count = 0
    for ((k, v) in parameters) {
        let value = try {
            CParameters(Parameters(k, v))
        } catch (e: Exception) {
            freeCArrParam(ptr.head, count)
            LibC.free(cp)
            throw e
        }
        ptr.head.write(count, value)
        count++
    }
    return ptr
}

func matchBool(bool: Option<Bool>): Int32 {
    match (bool) {
        case Some(v) =>
            if (v) {
                1
            } else {
                0
            }
        case None => -1
    }
}
