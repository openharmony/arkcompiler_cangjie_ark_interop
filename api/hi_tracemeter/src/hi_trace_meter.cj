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

package ohos.hi_tracemeter

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.labels.*

foreign {
    func FfiOHOSHiTraceStartAsyncTrace(name: CString, taskId: Int32): Unit

    func FfiOHOSHiTraceFinishAsyncTrace(name: CString, taskId: Int32): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiTrace"
]
public class HiTraceMeter {
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
