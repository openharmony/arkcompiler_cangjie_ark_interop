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

import std.deriving.*
import ohos.labels.*
import std.collection.HashMap
import ohos.base.*
import ohos.ffi.*

const THRESHOLD: Int32 = 1000
const OFFSET: Int32 = 100
const INT_TYPE: Int8 = 0
const F64_TYPE: Int8 = 1
const STRING_TYPE: Int8 = 2
const BOOL_TYPE: Int8 = 3

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public enum WorkSchedulerValueType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    INT(Int32)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    FLOAT64(Float64)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    BOOL(Bool)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    STRING(String)
    | ...
}

struct Parameters {
    Parameters(
        let _key: String,
        let _value: WorkSchedulerValueType
    ) {}

    init(c: CParameters) {
        this._key = c.key.toString()
        this._value = unsafe {
            match {
                case c.valueType == INT_TYPE => INT(CPointer<Int32>(c.value).read())
                case c.valueType == F64_TYPE => FLOAT64(CPointer<Float64>(c.value).read())
                case c.valueType == STRING_TYPE => STRING(CString(CPointer<UInt8>(c.value)).toString())
                case c.valueType == BOOL_TYPE => BOOL(CPointer<Bool>(c.value).read())
                case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                    "CParameters type is wrong which need to be Int32/Float64/CString/Bool.")
            }
        }
    }

    prop key: String {
        get() {
            return _key
        }
    }

    prop value: WorkSchedulerValueType {
        get() {
            return _value
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public enum NetworkType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    NETWORK_TYPE_ANY
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    NETWORK_TYPE_MOBILE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    NETWORK_TYPE_WIFI
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    NETWORK_TYPE_BLUETOOTH
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    NETWORK_TYPE_WIFI_P2P
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    NETWORK_TYPE_ETHERNET
    | ...

    func getValue(): Int32 {
        match (this) {
            case NETWORK_TYPE_ANY => 0
            case NETWORK_TYPE_MOBILE => 1
            case NETWORK_TYPE_WIFI => 2
            case NETWORK_TYPE_BLUETOOTH => 3
            case NETWORK_TYPE_WIFI_P2P => 4
            case NETWORK_TYPE_ETHERNET => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func tryParse(val: Int32): ?NetworkType {
        match (val) {
            case 0 => NETWORK_TYPE_ANY
            case 1 => NETWORK_TYPE_MOBILE
            case 2 => NETWORK_TYPE_WIFI
            case 3 => NETWORK_TYPE_BLUETOOTH
            case 4 => NETWORK_TYPE_WIFI_P2P
            case 5 => NETWORK_TYPE_ETHERNET
            case _ => None
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public enum ChargingType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    CHARGING_PLUGGED_ANY
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    CHARGING_PLUGGED_AC
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    CHARGING_PLUGGED_USB
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    CHARGING_PLUGGED_WIRELESS
    | ...

    func getValue(): Int32 {
        match (this) {
            case CHARGING_PLUGGED_ANY => 0
            case CHARGING_PLUGGED_AC => 1
            case CHARGING_PLUGGED_USB => 2
            case CHARGING_PLUGGED_WIRELESS => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func tryParse(val: Int32): ?ChargingType {
        match (val) {
            case 0 => CHARGING_PLUGGED_ANY
            case 1 => CHARGING_PLUGGED_AC
            case 2 => CHARGING_PLUGGED_USB
            case 3 => CHARGING_PLUGGED_WIRELESS
            case _ => None
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public enum BatteryStatus {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    BATTERY_STATUS_LOW
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    BATTERY_STATUS_OKAY
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    BATTERY_STATUS_LOW_OR_OKAY
    | ...

    func getValue(): Int32 {
        match (this) {
            case BATTERY_STATUS_LOW => 0
            case BATTERY_STATUS_OKAY => 1
            case BATTERY_STATUS_LOW_OR_OKAY => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func tryParse(val: Int32): ?BatteryStatus {
        match (val) {
            case 0 => BATTERY_STATUS_LOW
            case 1 => BATTERY_STATUS_OKAY
            case 2 => BATTERY_STATUS_LOW_OR_OKAY
            case _ => None
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public enum StorageRequest {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    STORAGE_LEVEL_LOW
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    STORAGE_LEVEL_OKAY
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    STORAGE_LEVEL_LOW_OR_OKAY
    | ...

    func getValue(): Int32 {
        match (this) {
            case STORAGE_LEVEL_LOW => 0
            case STORAGE_LEVEL_OKAY => 1
            case STORAGE_LEVEL_LOW_OR_OKAY => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func tryParse(val: Int32): ?StorageRequest {
        match (val) {
            case 0 => STORAGE_LEVEL_LOW
            case 1 => STORAGE_LEVEL_OKAY
            case 2 => STORAGE_LEVEL_LOW_OR_OKAY
            case _ => None
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
]
public class WorkInfo {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var workId: Int32
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var bundleName: String
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var abilityName: String
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var netWorkType: ?NetworkType = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var isCharging: ?Bool = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var chargerType: ?ChargingType = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var batteryLevel: ?Int32 = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var batteryStatus: ?BatteryStatus = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var storageRequest: ?StorageRequest = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var isRepeat: ?Bool = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var repeatCycleTime: ?Int32 = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var repeatCount: ?Int32 = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var isPersisted: ?Bool = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var isDeepIdle: ?Bool = None
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var idleWaitTime: ?Int32 = None
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public var parameters: HashMap<String, WorkSchedulerValueType> = HashMap<String, WorkSchedulerValueType>()

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public init(
        workId: Int32,
        bundleName: String,
        abilityName: String,
        netWorkType!: ?NetworkType = None,
        isCharging!: ?Bool = None,
        chargerType!: ?ChargingType = None,
        batteryLevel!: ?Int32 = None,
        batteryStatus!: ?BatteryStatus = None,
        storageRequest!: ?StorageRequest = None,
        isRepeat!: ?Bool = None,
        repeatCycleTime!: ?Int32 = None,
        repeatCount!: ?Int32 = None,
        isPersisted!: ?Bool = None,
        isDeepIdle!: ?Bool = None,
        idleWaitTime!: ?Int32 = None
    ) {
        if (workId < 0) {
            throw BusinessException(ERR_PARAMETER_ERROR, "The workId must be number greater than or equal to 0.")
        }
        if (bundleName.isEmpty() || abilityName.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "The bundleName and abilityName cannot be empty and must be string.")
        }
        this.workId = workId
        this.bundleName = bundleName
        this.abilityName = abilityName
        this.netWorkType = netWorkType
        this.isCharging = isCharging
        this.chargerType = chargerType
        this.batteryLevel = batteryLevel
        this.batteryStatus = batteryStatus
        this.storageRequest = storageRequest
        this.isRepeat = isRepeat
        this.repeatCycleTime = repeatCycleTime
        this.repeatCount = repeatCount
        this.isPersisted = isPersisted
        this.isDeepIdle = isDeepIdle
        this.idleWaitTime = idleWaitTime
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ResourceSchedule.WorkScheduler"
    ]
    public init(
        workId: Int32,
        bundleName: String,
        abilityName: String,
        parameters: HashMap<String, WorkSchedulerValueType>,
        netWorkType!: ?NetworkType = None,
        isCharging!: ?Bool = None,
        chargerType!: ?ChargingType = None,
        batteryLevel!: ?Int32 = None,
        batteryStatus!: ?BatteryStatus = None,
        storageRequest!: ?StorageRequest = None,
        isRepeat!: ?Bool = None,
        repeatCycleTime!: ?Int32 = None,
        repeatCount!: ?Int32 = None,
        isPersisted!: ?Bool = None,
        isDeepIdle!: ?Bool = None,
        idleWaitTime!: ?Int32 = None
    ) {
        if (workId < 0) {
            throw BusinessException(ERR_PARAMETER_ERROR, "The workId must be number greater than or equal to 0.")
        }
        if (bundleName.isEmpty() || abilityName.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "The bundleName and abilityName cannot be empty and must be string.")
        }
        this.workId = workId
        this.bundleName = bundleName
        this.abilityName = abilityName
        this.parameters = parameters
        this.netWorkType = netWorkType
        this.isCharging = isCharging
        this.chargerType = chargerType
        this.batteryLevel = batteryLevel
        this.batteryStatus = batteryStatus
        this.storageRequest = storageRequest
        this.isRepeat = isRepeat
        this.repeatCycleTime = repeatCycleTime
        this.repeatCount = repeatCount
        this.isPersisted = isPersisted
        this.isDeepIdle = isDeepIdle
        this.idleWaitTime = idleWaitTime
    }

    init(cwork: RetWorkInfoV2) {
        this.workId = cwork.workId
        this.bundleName = cwork.bundleName.toString()
        this.abilityName = cwork.abilityName.toString()
        this.isPersisted = cwork.isPersisted
        this.netWorkType = NetworkType.tryParse(cwork.netWorkType)
        this.isCharging = num2Bool(cwork.isCharging)
        this.chargerType = ChargingType.tryParse(cwork.chargerType)
        this.batteryLevel = num2Option(cwork.batteryLevel)
        this.batteryStatus = BatteryStatus.tryParse(cwork.batteryStatus)
        this.storageRequest = StorageRequest.tryParse(cwork.storageRequest)
        this.isRepeat = num2Bool(cwork.isRepeat)
        this.repeatCycleTime = num2Option(cwork.repeatCycleTime)
        this.repeatCount = num2Option(cwork.repeatCount)
        this.isDeepIdle = num2Bool(cwork.isDeepIdle)
        this.idleWaitTime = num2Option(cwork.idleWaitTime)
        unsafe {
            var param: Parameters
            var map: HashMap<String, WorkSchedulerValueType> = HashMap<String, WorkSchedulerValueType>()
            WORK_LOG.info("!!size: ${cwork.cParam.size}")
            for (i in 0..cwork.cParam.size) {
                if (cwork.cParam.head.isNotNull()) {
                    param = Parameters(cwork.cParam.head.read(i))
                    map.add(param.key, param.value)
                }
            }
            this.parameters = map
        }
        cwork.free()
    }
}

func num2Option(num: Int32): Option<Int32> {
    if (num < 0) {
        None
    } else {
        num
    }
}

func num2Bool(num: Int32): Option<Bool> {
    if (num < 0) {
        None
    } else {
        if (num == 0) {
            false
        } else {
            true
        }
    }
}

class WorkInfoArray {
    let code: Int32
    let size: Int64
    let data: CPointer<RetWorkInfoV2>

    init(ret: RetArrRetWorkInfoV2) {
        this.code = ret.code
        this.size = ret.size
        this.data = ret.data
    }
}

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (970000101, "Memory operation failed. Failed to allocate the memory."),
        (970000201, "Parcel operation failed. Failed to read or write the parcel."),
        (970000301, "System service operation failed. Failed to connect the system service."),
        (970000302, "System service operation failed. The service is not ready."),
        (970000401, "Checking workInfo failed. Current bundleUid and input uid do not match."),
        (970000402, "The workId do not exist."),
        (970000501, "StartWork failed. The work has been already added."),
        (970000502, "StartWork failed. Each uid can add up to 10 works."),
        (970000503, "StartWork failed. The repeatTime must be greater than or equal to 20 minutes."),
        (970000504, "Inner error."),
        (970000505, "Group change not match hap."),

        //401
        (9700401, "The number of arguments is wrong."),
        (9700402, "The type of workInfo must be {key: value} object."),
        (9700403, "The bundleName and abilityName cannot be empty and must be string."),
        (9700404, "The workId must be number greater than or equal to 0."),
        (9700405, "The callback should be function."),
        (9700406, "The workinfo condition cannot be empty."),
        (9700407, "The value of networkType ranges from NETWORK_TYPE_ANY to NETWORK_TYPE_ETHERNET."),
        (9700408, "The value of chargerType ranges from CHARGING_PLUGGED_ANY to CHARGING_UNPLUGGED."),
        (9700409, "The type of isCharging must be boolean."),
        (9700410, "The value of batteryLevel ranges from 0 to 100."),
        (9700411, "The value of batteryStatus ranges from BATTERY_STATUS_LOW to BATTERY_STATUS_LOW_OR_OKAY."),
        (9700412, "The value of storageRequest ranges from STORAGE_LEVEL_LOW to STORAGE_LEVEL_LOW_OR_OKAY."),
        (9700413, "The repeatCount must be number greater than or equal to 0."),
        (9700414, "The type of repeatCycleTime must be number."),
        (9700415, "The type of isRepeat must be boolean."),
        (9700416, "The type of isPersisted must be boolean."),
        (9700417, "The type of parameters must be string, boolean or number."),
        (9700418, "The type of needCancle must be boolean.")
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
    var result = code
    if (result > THRESHOLD) {
        result /= OFFSET
    }

    if (result == 97004) {
        result = 401
    }
    result
}

func throwIfNotSuccess(code: Int32, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        throw BusinessException(handleErrorCode(code), "Work Scheduler: ${funcName} failed: ${getErrorMsg(code)}")
    }
}

unsafe func createPtr<T>(value: T): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>()
    ptr.write(value)
    return CPointer<Unit>(ptr)
}

unsafe func freeCArrParam(cp: CPointer<CParameters>, index: Int64): Unit {
    for (i in 0..index) {
        cp.read(i).free()
    }
}

func getValue(value: WorkSchedulerValueType): (Int8, CPointer<Unit>, Int64) {
    unsafe {
        match (value) {
            case INT(v) => return (INT_TYPE, createPtr<Int32>(v), 1)
            case FLOAT64(v) => return (F64_TYPE, createPtr<Float64>(v), 1)
            case STRING(v) =>
                let ptr = LibC.mallocCString(v).getChars()
                return (STRING_TYPE, CPointer<Unit>(ptr), 1)
            case BOOL(v) => return (BOOL_TYPE, createPtr<Bool>(v), 1)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
