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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum EventType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    Fault
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    Statistic
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    Security
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    Behavior
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: UInt32 {
        get() {
            match (this) {
                case Fault => 1
                case Statistic => 2
                case Security => 3
                case Behavior => 4
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(val: UInt32): EventType {
        match (val) {
            case 1 => Fault
            case 2 => Statistic
            case 3 => Security
            case 4 => Behavior
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum ValueType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    IntVaule(Int32)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    FloatValue(Float64)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    StringValue(String)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    BoolValue(Bool)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ArrString(Array<String>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ArrI32(Array<Int32>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ArrBool(Array<Bool>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ArrF64(Array<Float64>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    Int64Value(Int64)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    ArrInt64(Array<Int64>)
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case IntVaule(v) => v.toString()
                case FloatValue(v) => v.toString()
                case StringValue(v) => v.toString()
                case BoolValue(v) => v.toString()
                case ArrString(v) => v.toString()
                case ArrI32(v) => v.toString()
                case ArrBool(v) => v.toString()
                case ArrF64(v) => v.toString()
                case Int64Value(v) => v.toString()
                case ArrInt64(v) => v.toString()
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum Domain {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    Os | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case Os => "OS"
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum Event {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    UserLogin
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    UserLogout
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    DistributedServiceStart
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    AppCrash
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    AppFreeze
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case UserLogin => "hiappevent.user_login"
                case UserLogout => "hiappevent.user_logout"
                case DistributedServiceStart => "hiappevent.distributed_service_start"
                case AppCrash => "APP_CRASH"
                case AppFreeze => "APP_FREEZE"
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public enum Param {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    UserId
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    DistributedServiceName
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    DistributedServiceInstanceId
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case UserId => "user_id"
                case DistributedServiceName => "ds_name"
                case DistributedServiceInstanceId => "ds_instance_id"
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class Parameters {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public Parameters(
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiAppEvent"
        ]
        public let key: String,
        @!APILevel[
            21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class AppEventInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var domain: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var event: EventType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var params: Array<Parameters>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(domain: String, name: String, event: EventType, params: Array<Parameters>) {
        this.domain = domain
        this.name = name
        this.event = event
        this.params = params
    }

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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class ConfigOption {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var disable: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var maxStorage: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public init(disable!: Bool = false, maxStorage!: String = "10M") {
        this.disable = disable
        this.maxStorage = maxStorage
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class AppEventReportConfig {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var domain: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var isRealTime: Bool

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class Processor {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var debugMode: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var routeInfo: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var appId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var onStartReport: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var onBackgroundReport: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var periodReport: Int64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var batchReport: Int64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var userIds: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var userProperties: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var eventConfigs: Array<AppEventReportConfig>

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class AppEventPackage {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var packageId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var row: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var size: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var data: Array<String>

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class TriggerCondition {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var row: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var size: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var timeOut: Int32

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class AppEventFilter {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var domain: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var eventTypes: Array<EventType>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var names: Array<String>

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class AppEventGroup {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var appEventInfos: Array<AppEventInfo>

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class Watcher {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var triggerCondition: TriggerCondition
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var appEventFilters: Array<AppEventFilter>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var onTrigger: Option<(Int32, Int32, AppEventPackageHolder) -> Unit>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public var onReceive: Option<(String, Array<AppEventGroup>) -> Unit>

    @!APILevel[
        21,
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
                return IntVaule(res)
            case 1 =>
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                var res = CPointer<Float64>(value).read()
                return FloatValue(res)
            case 2 =>
                if (value.isNull()) {
                    return StringValue("")
                }
                var res = CString(CPointer<UInt8>(value))
                return StringValue(res.toString())
            case 3 =>
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                var res = CPointer<Bool>(value).read()
                return BoolValue(res)
            case 4 =>
                var res = ArrayList<Int32>()
                if (value.isNull()) {
                    return ArrI32(res.toArray())
                }
                for (i in 0..size) {
                    res.add(CPointer<Int32>(value).read(i))
                }
                return ArrI32(res.toArray())
            case 5 =>
                var res = ArrayList<Float64>()
                if (value.isNull()) {
                    return ArrF64(res.toArray())
                }
                for (i in 0..size) {
                    res.add(CPointer<Float64>(value).read(i))
                }
                return ArrF64(res.toArray())
            case 6 =>
                var res = ArrayList<String>()
                if (value.isNull()) {
                    return ArrString(res.toArray())
                }
                let data = (CPointer<CString>(value))
                for (i in 0..size) {
                    res.add(data.read(i).toString())
                }
                return ArrString(res.toArray())
            case 7 =>
                var res = ArrayList<Bool>()
                if (value.isNull()) {
                    return ArrBool(res.toArray())
                }
                for (i in 0..size) {
                    res.add(CPointer<Bool>(value).read(i))
                }
                return ArrBool(res.toArray())
            case 8 =>
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                var res = CPointer<Int64>(value).read()
                return Int64Value(res)
            case 9 =>
                var res = ArrayList<Int64>()
                if (value.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                for (i in 0..size) {
                    res.add(CPointer<Int64>(value).read(i))
                }
                return ArrInt64(res.toArray())
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}