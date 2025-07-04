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

package ohos.hi_tracechain

import ohos.ffi.*
import ohos.labels.*
import ohos.hilog.*
import ohos.base.*

foreign {
    func FfiOHOSHiTraceChainBegin(name: CString, flag: Int32): CHiTraceId

    func FfiOHOSHiTraceChainEnd(id: CHiTraceId): Unit

    func FfiOHOSHiTraceChainGetId(): CHiTraceId

    func FfiOHOSHiTraceChainSetId(id: CHiTraceId): Unit

    func FfiOHOSHiTraceChainClearId(): Unit

    func FfiOHOSHiTraceChainCreateSpan(): CHiTraceId

    func FfiOHOSHiTraceChainTracepoint(mode: UInt64, traceType: UInt64, id: CHiTraceId, str: CString): Unit

    func FfiOHOSHiTraceChainIsValid(id: CHiTraceId): Bool

    func FfiOHOSHiTraceChainIsFlagEnabled(id: CHiTraceId, flag: Int32): Bool

    func FfiOHOSHiTraceChainEnableFlag(id: CHiTraceId, flag: Int32): Unit
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiTrace"
]
public class HiTraceChain {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func begin(name: String, flag!: Int32 = HiTraceFlag.DEFAULT.value): HiTraceId {
        var id = HiTraceId(0, 0, 0, 0)
        unsafe {
            try (cName = LibC.mallocCString(name).asResource()) {
                let value = FfiOHOSHiTraceChainBegin(cName.value, flag)
                id = HiTraceId(value)
            }
        }
        return id
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func end(id: HiTraceId): Unit {
        unsafe { FfiOHOSHiTraceChainEnd(CHiTraceId(id)) }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func getId(): HiTraceId {
        let value = unsafe { FfiOHOSHiTraceChainGetId() }
        return HiTraceId(value)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func setId(id: HiTraceId): Unit {
        unsafe { FfiOHOSHiTraceChainSetId(CHiTraceId(id)) }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func clearId(): Unit {
        unsafe { FfiOHOSHiTraceChainClearId() }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func createSpan(): HiTraceId {
        let value = unsafe { FfiOHOSHiTraceChainCreateSpan() }
        return HiTraceId(value)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func tracepoint(mode: HiTraceCommunicationMode, traceType: HiTraceTracepointType, id: HiTraceId,
        msg!: String = ""): Unit {
        unsafe {
            try (cStr = LibC.mallocCString(msg).asResource()) {
                FfiOHOSHiTraceChainTracepoint(mode.value, traceType.value, CHiTraceId(id), cStr.value)
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func isValid(id: HiTraceId): Bool {
        let value = unsafe { FfiOHOSHiTraceChainIsValid(CHiTraceId(id)) }
        return value
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func isFlagEnabled(id: HiTraceId, flag: Int32): Bool {
        let value = unsafe { FfiOHOSHiTraceChainIsFlagEnabled(CHiTraceId(id), flag) }
        return value
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public static func enableFlag(id: HiTraceId, flag: Int32): Unit {
        unsafe { FfiOHOSHiTraceChainEnableFlag(CHiTraceId(id), flag) }
        id.flags = flag
    }
}
