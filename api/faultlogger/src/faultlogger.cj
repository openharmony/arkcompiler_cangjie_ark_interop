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

package ohos.faultlogger

import std.collection.HashMap
import ohos.base.*
import ohos.ffi.*
import ohos.hilog.*
import ohos.labels.*

const SERVICE_STATUS_ERROR = 10600001i32
let ERROR_CODE_MAP = HashMap<Int32, String>([(SERVICE_STATUS_ERROR, "The service is not started or is faulty.")])

func getErrMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Operation failed."
    }
}

@!APILevel[
    19,
    deprecated: 16,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
]
public enum FaultType {
    @!APILevel[
        19,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    NO_SPECIFIC
    | @!APILevel[
        19,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    CPP_CRASH
    | @!APILevel[
        19,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    JS_CRASH
    | @!APILevel[
        19,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    APP_FREEZE
    | ...

    @!APILevel[
        19,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
    ]
    public func getValue(): Int32 {
        match (this) {
            case NO_SPECIFIC => 0
            case CPP_CRASH => 2
            case JS_CRASH => 3
            case APP_FREEZE => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): FaultType {
        match (val) {
            case 0 => NO_SPECIFIC
            case 2 => CPP_CRASH
            case 3 => JS_CRASH
            case 4 => APP_FREEZE
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    19,
    deprecated: 16,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
]
public class FaultLogInfo {
    @!APILevel[
        19,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
    ]
    public FaultLogInfo(
        @!APILevel[
            19,
            deprecated: 16,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
        ]
        public let pid: Int32,
        @!APILevel[
            19,
            deprecated: 16,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
        ]
        public let uid: Int32,
        @!APILevel[
            19,
            deprecated: 16,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
        ]
        public let faultType: FaultType,
        @!APILevel[
            19,
            deprecated: 16,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
        ]
        public let timestamp: Int64,
        @!APILevel[
            19,
            deprecated: 16,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
        ]
        public let reason: String,
        @!APILevel[
            19,
            deprecated: 16,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
        ]
        public let module: String,
        @!APILevel[
            19,
            deprecated: 16,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
        ]
        public let summary: String,
        @!APILevel[
            19,
            deprecated: 16,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
        ]
        public let fullLog: String
    ) {}

    init(ret: CFaultLogInfo) {
        this.pid = ret.pid
        this.uid = ret.uid
        this.faultType = FaultType.parse(ret.faultType)
        this.timestamp = ret.timestamp
        this.reason = ret.reason.toString()
        this.module = ret.module.toString()
        this.summary = ret.summary.toString()
        this.fullLog = ret.fullLog.toString()
    }
}

@C
struct CFaultLogInfo {
    CFaultLogInfo(
        let pid: Int32,
        let uid: Int32,
        let faultType: Int32,
        let timestamp: Int64,
        let reason: CString,
        let module: CString,
        let summary: CString,
        let fullLog: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(this.reason)
            LibC.free(this.module)
            LibC.free(this.summary)
            LibC.free(this.fullLog)
        }
    }
}

@C
struct CArrFaultLogInfo {
    CArrFaultLogInfo(
        let head: CPointer<CFaultLogInfo>,
        let size: Int64
    ) {}
}

unsafe func freeArrFaultLogInfo(cArr: CArrFaultLogInfo) {
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            cArr.head.read(i).free()
        }
        LibC.free<CFaultLogInfo>(cArr.head)
    }
}

foreign func FfiFaultLoggerQuery(faultType: Int32, code: CPointer<Int32>): CArrFaultLogInfo

@!APILevel[
    19,
    deprecated: 16,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
]
public class FaultLogger {
    @!APILevel[
        19,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.Hiview.FaultLogger"
    ]
    public static func query(faultType: FaultType): Array<FaultLogInfo> {
        var code = 0i32
        let fType = faultType.getValue()
        let ret = unsafe { FfiFaultLoggerQuery(fType, inout code) }
        if (code != SUCCESS_CODE) {
            unsafe { freeArrFaultLogInfo(ret) }
            throw BusinessException(code, getErrMsg(code))
        }
        let size = ret.size
        let ptr = ret.head
        var arr = unsafe {
            Array<FaultLogInfo>(
                size,
                {
                    i => FaultLogInfo(ptr.read(i))
                }
            )
        }
        unsafe { freeArrFaultLogInfo(ret) }
        return arr
    }
}
