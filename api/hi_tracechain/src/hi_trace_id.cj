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
import ohos.base.*

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiTrace"
]
public enum HiTraceFlag {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    DEFAULT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    INCLUDE_ASYNC
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    DONOT_CREATE_SPAN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    TP_INFO
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    NO_BE_INFO
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    DISABLE_LOG
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    FAILURE_TRIGGER
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    D2D_TP_INFO
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public prop value: Int32 {
        get() {
            match (this) {
                case DEFAULT => 0
                case INCLUDE_ASYNC => 1
                case DONOT_CREATE_SPAN => 1 << 1
                case TP_INFO => 1 << 2
                case NO_BE_INFO => 1 << 3
                case DISABLE_LOG => 1 << 4
                case FAILURE_TRIGGER => 1 << 5
                case D2D_TP_INFO => 1 << 6
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiTrace"
]
public enum HiTraceTracepointType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    CS
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    CR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    SS
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    SR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    GENERAL
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public prop value: UInt64 {
        get() {
            match (this) {
                case CS => 0
                case CR => 1
                case SS => 2
                case SR => 3
                case GENERAL => 4
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiTrace"
]
public enum HiTraceCommunicationMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    DEFAULT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    THREAD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    PROCESS
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    DEVICE
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public prop value: UInt64 {
        get() {
            match (this) {
                case DEFAULT => 0
                case THREAD => 1
                case PROCESS => 2
                case DEVICE => 3
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@C
struct CHiTraceId {
    let chainId: UInt64
    let spanId: UInt64
    let parentSpanId: UInt64
    let flags: Int32

    init(id: HiTraceId) {
        this.chainId = id.chainId
        this.spanId = id.spanId
        this.parentSpanId = id.parentSpanId
        this.flags = id.flags
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiTrace"
]
public class HiTraceId {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public var chainId: UInt64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public var spanId: UInt64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public var parentSpanId: UInt64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public var flags: Int32

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiTrace"
    ]
    public init(chainId: UInt64, spanId: UInt64, parentSpanId: UInt64, flags: Int32) {
        this.chainId = chainId
        this.spanId = spanId
        this.parentSpanId = parentSpanId
        this.flags = flags
    }

    init(id: CHiTraceId) {
        this.chainId = id.chainId
        this.spanId = id.spanId
        this.parentSpanId = id.parentSpanId
        this.flags = id.flags
    }
}
