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

package ohos.hitrace

import ohos.labels.*

foreign func ARKTS_HiTraceStartTrace(name: CString, taskId: Int32): Unit

foreign func ARKTS_HiTraceFinishTrace(name: CString, taskId: Int32): Unit

foreign func ARKTS_HiTraceCountTrace(name: CString, count: Int64): Unit

@!APILevel[
    12,
    stagemodelonly: true,
    deprecated: 19,
    syscap: "SystemCapability.HiviewDFX.HiTrace"
]
public class Hitrace {
    @!APILevel[
        12,
        stagemodelonly: true,
        deprecated: 19,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func startTrace(name: String, taskId: Int32): Unit {
        unsafe {
            var ffiName = LibC.mallocCString(name)
            ARKTS_HiTraceStartTrace(ffiName, taskId)
            LibC.free(ffiName)
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        deprecated: 19,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func finishTrace(name: String, taskId: Int32): Unit {
        unsafe {
            var ffiName = LibC.mallocCString(name)
            ARKTS_HiTraceFinishTrace(ffiName, taskId)
            LibC.free(ffiName)
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        deprecated: 19,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func traceByValue(name: String, count: Int64): Unit {
        unsafe {
            var ffiName = LibC.mallocCString(name)
            ARKTS_HiTraceCountTrace(ffiName, count)
            LibC.free(ffiName)
        }
    }
}
