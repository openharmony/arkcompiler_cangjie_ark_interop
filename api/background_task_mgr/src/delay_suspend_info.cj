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

import ohos.labels.*
import std.collection.HashMap
import ohos.base.*

const THRESHOLD: Int32 = 1000
const OFFSET: Int32 = 100

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
]
public enum BackgroundMode {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
    ]
    DATA_TRANSFER
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
    ]
    AUDIO_PLAYBACK
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
    ]
    AUDIO_RECORDING
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
    ]
    LOCATION
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
    ]
    BLUETOOTH_INTERACTION
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
    ]
    MULTI_DEVICE_CONNECTION
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
    ]
    VOIP
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.ContinuousTask"
    ]
    TASK_KEEPING
    | ...
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask"
]
public class DelaySuspendInfo {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask"
    ]
    public DelaySuspendInfo(
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask"
        ]
        public let requestId: Int32,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.ResourceSchedule.BackgroundTaskManager.TransientTask"
        ]
        public let actualDelayTime: Int32
    ) {}

    init(cInfo: RetDelaySuspendInfo) {
        this.requestId = cInfo.requestId
        this.actualDelayTime = cInfo.actualDelayTime
    }
}

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (980000101, "Memory operation failed. Failed to allocate the memory."),
        (980000201, "Parcel operation failed."),
        (980000301, "IPC failed."),
        (980000401, "System service operation failed. The system service is not ready."),
        (980000402, "System service operation failed. The system service is not connected."),
        (980000501, "Continuous Task verification failed. The application has applied for a continuous task."),
        (980000502, "Continuous Task verification failed. The application has not applied for a continuous task."),
        (980000503,
            "Continuous Task verification failed. TASK_KEEPING background mode only supported in particular device."),
        (980000504, "Continuous Task verification failed. The bgMode is invalid."),
        (980000601, "Notification verification failed. The title or text of the notification cannot be empty."),
        (980000602, "Notification verification failed. Failed to send or cancel the notification."),
        (980000603, ""),
        (980000701, "Task storage failed. Failed to create the storage task file."),
        (980000702, "Task storage failed. Failed to get the actual storage task file."),
        (980000703, "Task storage failed. Failed to open the file."),
        (990000101, "Caller information verification failed for a transient task. Invalid pid or uid."),
        (990000102, "Caller information verification failed for a transient task. The bundleName cannot be found."),
        (990000103, "Caller information verification failed for a transient task. Invalid requestId."),
        (990000201, "Transient task verification failed. The callback cannot be empty."),
        (990000202, "Transient task verification failed. The callback already exists."),
        (990000203, "Transient task verification failed. The callback does not exist."),
        (990000204,
            "Transient task verification failed. Request is not allow after the preset time of entering background."),
        (990000205, "Transient task verification failed. The number of request exceeds the threshold."),
        (990000206, "Transient task verification failed. The remaining time to run transient task is insufficient."),
        (1870000101,
            "Caller information verification failed when applying for efficiency resources. The number of resources applied exceeds maximun."),
        (1870000105, "Service inner error.")
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}

func handleErrorCode(code: Int32): Int32 {
    if (code > THRESHOLD) {
        code / OFFSET
    } else {
        code
    }
}
