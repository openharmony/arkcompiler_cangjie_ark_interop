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

package ohos.hiappevent

import ohos.labels.*
import ohos.hilog.*
import ohos.ffi.*
import std.collection.*
import ohos.base.*

const SUCCESS_CODE: Int32 = 0

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum EventType {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    FAULT
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    STATISTIC
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    SECURITY
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    BEHAVIOR
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: UInt32 {
        get() {
            match (this) {
                case FAULT => 1
                case STATISTIC => 2
                case SECURITY => 3
                case BEHAVIOR => 4
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(val: UInt32): EventType {
        match (val) {
            case 1 => FAULT
            case 2 => STATISTIC
            case 3 => SECURITY
            case 4 => BEHAVIOR
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum ValueType {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    INT(Int32)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    FLOAT(Float64)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    STRING(String)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    BOOL(Bool)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ARRSTRING(Array<String>)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ARRAYI32(Array<Int32>)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ARRAYBOOL(Array<Bool>)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ARRAYF64(Array<Float64>)
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    INT64(Int64)
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ARRAYINT64(Array<Int64>)
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case INT(v) => v.toString()
                case FLOAT(v) => v.toString()
                case STRING(v) => v.toString()
                case BOOL(v) => v.toString()
                case ARRSTRING(v) => v.toString()
                case ARRAYI32(v) => v.toString()
                case ARRAYBOOL(v) => v.toString()
                case ARRAYF64(v) => v.toString()
                case INT64(v) => v.toString()
                case ARRAYINT64(v) => v.toString()
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum Domain {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    OS | ...

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case OS => "OS"
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum Event {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    USER_LOGIN
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    USER_LOGOUT
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    DISTRIBUTED_SERVICE_START
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    APP_CRASH
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    APP_FREEZE
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case USER_LOGIN => "hiappevent.user_login"
                case USER_LOGOUT => "hiappevent.user_logout"
                case DISTRIBUTED_SERVICE_START => "hiappevent.distributed_service_start"
                case APP_CRASH => "APP_CRASH"
                case APP_FREEZE => "APP_FREEZE"
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum Param {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    USER_ID
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    DISTRIBUTED_SERVICE_NAME
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    DISTRIBUTED_SERVICE_INSTANCE_ID
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case USER_ID => "user_id"
                case DISTRIBUTED_SERVICE_NAME => "ds_name"
                case DISTRIBUTED_SERVICE_INSTANCE_ID => "ds_instance_id"
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public struct Parameters {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public Parameters(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiAppEvent"
        ]
        public let key: String,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiAppEvent"
        ]
        public let value: ValueType
    ) {}

    init(ret: CParameters) {
        this.key = ret.keyName.toString()
        this.value = readValueType(ret.valueType, ret.value, ret.size)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public struct AppEventInfo {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public AppEventInfo(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiAppEvent"
        ]
        public let domain: String,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiAppEvent"
        ]
        public let name: String,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiAppEvent"
        ]
        public let event: EventType,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiAppEvent"
        ]
        public let params: Array<Parameters>
    ) {}

    init(ret: CAppEventInfo) {
        this.domain = ret.domain.toString()
        this.name = ret.name.toString()
        this.event = EventType.parse(ret.event)
        this.params = readCArrParams(ret.params)
    }

    func toCAppEventInfo(): CAppEventInfo {
        var info = CAppEventInfo(
            CString(CPointer<UInt8>()),
            CString(CPointer<UInt8>()),
            event.value,
            CArrParameters(CPointer<CParameters>(), 0)
        )
        try {
            unsafe {
                info.domain = LibC.mallocCString(domain)
                info.name = LibC.mallocCString(name)
                let constructor = {p: Parameters => CParameters(p)}
                let ptr = cjArr2CArr<Parameters, CParameters>(params, constructor)
                info.params = CArrParameters(ptr, params.size)
            }
        } catch (e: Exception) {
            info.free()
            throw e
        }
        return info
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public struct ConfigOption {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let disable: Bool
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let maxStorage: String

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public ConfigOption(maxStorage: String, disable!: Bool = false) {
        this.disable = disable
        this.maxStorage = maxStorage
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public struct AppEventReportConfig {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let domain: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let name: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let isRealTime: Bool

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(domain!: String = "", name!: String = "", isRealTime!: Bool = false) {
        this.domain = domain
        this.name = name
        this.isRealTime = isRealTime
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class Processor {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let name: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let debugMode: Bool
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let routeInfo: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let appId: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let onStartReport: Bool
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let onBackgroundReport: Bool
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let periodReport: Int64
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let batchReport: Int64
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let userIds: Array<String>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let userProperties: Array<String>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let eventConfigs: Array<AppEventReportConfig>

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(name: String, debugMode!: Bool = false, routeInfo!: String = "", appId!: String = "",
        onStartReport!: Bool = false, onBackgroundReport!: Bool = false, periodReport!: Int64 = 0,
        batchReport!: Int64 = 0, userIds!: Array<String> = [], userProperties!: Array<String> = [],
        eventConfigs!: Array<AppEventReportConfig> = []) {
        this.name = name
        this.debugMode = debugMode
        this.routeInfo = routeInfo
        this.appId = appId
        this.onStartReport = onStartReport
        this.onBackgroundReport = onBackgroundReport
        this.periodReport = periodReport
        this.batchReport = batchReport
        this.userIds = userIds
        this.userProperties = userProperties
        this.eventConfigs = eventConfigs
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class AppEventPackage {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let packageId: Int32
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let row: Int32
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let size: Int32
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let data: Array<String>

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(packageId: Int32, row: Int32, size: Int32, data: Array<String>) {
        this.packageId = packageId
        this.row = row
        this.size = size
        this.data = data
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public struct TriggerCondition {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let row: Int32
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let size: Int32
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let timeOut: Int32

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(row!: Int32 = 0, size!: Int32 = 0, timeOut!: Int32 = 0) {
        this.row = row
        this.size = size
        this.timeOut = timeOut
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public struct AppEventFilter {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let domain: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let eventTypes: Array<EventType>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let names: Array<String>

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(domain: String, eventTypes!: Array<EventType> = [], names!: Array<String> = []) {
        this.domain = domain
        this.eventTypes = eventTypes
        this.names = names
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public struct AppEventGroup {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let name: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let appEventInfos: Array<AppEventInfo>

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(name: String, appEventInfos: Array<AppEventInfo>) {
        this.name = name
        this.appEventInfos = appEventInfos
    }

    init(ret: CAppEventGroup) {
        this.name = ret.name.toString()
        this.appEventInfos = readCArrAppEventInfos(ret.appEventInfos)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public struct Watcher {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let name: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let triggerCondition: TriggerCondition
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let appEventFilters: Array<AppEventFilter>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let onTrigger: Option<(Int32, Int32, AppEventPackageHolder) -> Unit>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public let onReceive: Option<(String, Array<AppEventGroup>) -> Unit>

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(name: String, triggerCondition!: TriggerCondition = TriggerCondition(),
        appEventFilters!: Array<AppEventFilter> = [],
        onTrigger!: Option<(Int32, Int32, AppEventPackageHolder) -> Unit> = None,
        onReceive!: Option<(String, Array<AppEventGroup>) -> Unit> = None) {
        this.name = name
        this.triggerCondition = triggerCondition
        this.appEventFilters = appEventFilters
        this.onTrigger = onTrigger
        this.onReceive = onReceive
    }
}

func readCArrCAppEventGroup(appEventGroups: CArrCAppEventGroup): Array<AppEventGroup> {
    let result = ArrayList<AppEventGroup>()
    if (appEventGroups.head.isNotNull()) {
        for (i in 0..appEventGroups.size) {
            unsafe { result.add(AppEventGroup(appEventGroups.head.read(i))) }
        }
    }
    return result.toArray()
}

func readCArrAppEventInfos(ret: CArrAppEventInfo): Array<AppEventInfo> {
    let result = ArrayList<AppEventInfo>()
    if (ret.head.isNotNull()) {
        for (i in 0..ret.size) {
            unsafe { result.add(AppEventInfo(ret.head.read(i))) }
        }
    }
    return result.toArray()
}

func readCArrParams(ret: CArrParameters): Array<Parameters> {
    let result = ArrayList<Parameters>()
    if (ret.head.isNotNull()) {
        for (i in 0..ret.size) {
            unsafe { result.add(Parameters(ret.head.read(i))) }
        }
    }
    return result.toArray()
}

func readValueType(valueType: UInt8, value: CPointer<Unit>, size: Int64): ValueType {
    unsafe {
        match (valueType) {
            case 0 =>
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                var res = CPointer<Int32>(value).read()
                return INT(res)
            case 1 =>
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                var res = CPointer<Float64>(value).read()
                return FLOAT(res)
            case 2 =>
                if (value.isNull()) {
                    return STRING("")
                }
                var res = CString(CPointer<UInt8>(value))
                return STRING(res.toString())
            case 3 =>
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                var res = CPointer<Bool>(value).read()
                return BOOL(res)
            case 4 =>
                var res = ArrayList<Int32>()
                if (value.isNull()) {
                    return ARRAYI32(res.toArray())
                }
                for (i in 0..size) {
                    res.add(CPointer<Int32>(value).read(i))
                }
                return ARRAYI32(res.toArray())
            case 5 =>
                var res = ArrayList<Float64>()
                if (value.isNull()) {
                    return ARRAYF64(res.toArray())
                }
                for (i in 0..size) {
                    res.add(CPointer<Float64>(value).read(i))
                }
                return ARRAYF64(res.toArray())
            case 6 =>
                var res = ArrayList<String>()
                if (value.isNull()) {
                    return ARRSTRING(res.toArray())
                }
                let data = (CPointer<CString>(value))
                for (i in 0..size) {
                    res.add(data.read(i).toString())
                }
                return ARRSTRING(res.toArray())
            case 7 =>
                var res = ArrayList<Bool>()
                if (value.isNull()) {
                    return ARRAYBOOL(res.toArray())
                }
                for (i in 0..size) {
                    res.add(CPointer<Bool>(value).read(i))
                }
                return ARRAYBOOL(res.toArray())
            case 8 =>
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                var res = CPointer<Int64>(value).read()
                return INT64(res)
            case 9 =>
                var res = ArrayList<Int64>()
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                for (i in 0..size) {
                    res.add(CPointer<Int64>(value).read(i))
                }
                return ARRAYINT64(res.toArray())
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}