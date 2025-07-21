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

package ohos.hi_trace_meter

import ohos.labels.*

foreign {
    func FfiOHOSHiTraceStartAsyncTrace(name: CString, taskId: Int32): Unit

    func FfiOHOSHiTraceFinishAsyncTrace(name: CString, taskId: Int32): Unit
}

/**
 * Provides interfaces to trace a task for performance measure, the logs can be capture by the
 * bytrace cmdline available on the device.
 *
 * This interfaces trace the start, end, and value changes of key processes that last for at least 3 ms.
 *
 * @relation declare namespace hiTraceMeter
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiTrace"
]
public class HiTraceMeter {
    /**
     * Records a trace marking it as the start of a task, can with the expected completion time between
     * startTrace and finishTrace.
     *
     * This method is invoked at the start of a transaction to indicate that a task has started, whose name
     * is specified by name, and the taskId is used to distinguish the tasks. It must be followed by
     * finishTrace, the name and taskId need to be the same.
     *
     * @relation function startTrace(name: string, taskId: number): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func startTrace(name: String, taskId: Int32): Unit {
        unsafe {
            try (cName = LibC.mallocCString(name).asResource()) {
                FfiOHOSHiTraceStartAsyncTrace(cName.value, taskId)
            }
        }
    }

    /**
     * Records a trace and marks it as the end of a task.
     *
     * This method is invoked at the end of a transaction to indicate that a task has ended, whose name
     * is specified by name. This method must be invoked after startTrace.
     *
     * @relation function finishTrace(name: string, taskId: number): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func finishTrace(name: String, taskId: Int32): Unit {
        unsafe {
            try (cName = LibC.mallocCString(name).asResource()) {
                FfiOHOSHiTraceFinishAsyncTrace(cName.value, taskId)
            }
        }
    }
}
