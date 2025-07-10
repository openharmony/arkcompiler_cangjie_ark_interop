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

package ohos.geo_location_manager

import ohos.base.*
import ohos.hilog.*
import ohos.ffi.*
import std.collection.*
import ohos.labels.*
import ohos.i18n.*

const LOG_CORE: UInt32 = 3
const LOCATION_LOG_DOMAIN: UInt32 = 0xD002300
let GEO_LOCATION_MANAGER_LOG = HilogChannel(LOG_CORE, LOCATION_LOG_DOMAIN, "CJ-GeoLocationManager")

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocationSourceType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    GNSS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    NETWORK
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    INDOOR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    RTK
    | ...

    static func parse(value: Int32): LocationSourceType {
        match (value) {
            case 1 => GNSS
            case 2 => NETWORK
            case 3 => INDOOR
            case 4 => RTK
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case GNSS => 1
            case NETWORK => 2
            case INDOOR => 3
            case RTK => 4
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class Location {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var latitude: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var longitude: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var altitude: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var accuracy: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var speed: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var timeStamp: Int64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var direction: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var timeSinceBoot: Int64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var additions: Array<String>
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var additionSize: Int64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var additionsMap: Map<String, String>
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var altitudeAccuracy: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var speedAccuracy: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var directionAccuracy: Float64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var uncertaintyOfTimeSinceBoot: Int64
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var sourceType: LocationSourceType

    init(cjLocation: CJLocation, additions!: Array<String> = Array<String>(),
        additionsMap!: Map<String, String> = HashMap<String, String>(),
        sourceType!: LocationSourceType = LocationSourceType.GNSS) {
        this.latitude = cjLocation.latitude
        this.longitude = cjLocation.longitude
        this.altitude = cjLocation.altitude
        this.accuracy = cjLocation.accuracy
        this.speed = cjLocation.speed
        this.timeStamp = cjLocation.timeStamp
        this.direction = cjLocation.direction
        this.timeSinceBoot = cjLocation.timeSinceBoot
        this.additions = additions
        this.additionSize = cjLocation.additionSize
        this.additionsMap = additionsMap
        this.altitudeAccuracy = cjLocation.altitudeAccuracy
        this.speedAccuracy = cjLocation.speedAccuracy
        this.directionAccuracy = cjLocation.directionAccuracy
        this.uncertaintyOfTimeSinceBoot = cjLocation.uncertaintyOfTimeSinceBoot
        this.sourceType = sourceType
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocationRequestPriority {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    UNSET
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    ACCURACY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LOW_POWER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    FIRST_FIX
    | ...

    func getValue(): Int32 {
        match (this) {
            case UNSET => 0x200
            case ACCURACY => 0x201
            case LOW_POWER => 0x202
            case FIRST_FIX => 0x203
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocationRequestScenario {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    UNSET
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    NAVIGATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    TRAJECTORY_TRACKING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    CAR_HAILING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    DAILY_LIFE_SERVICE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    NO_POWER
    | ...

    func getValue(): Int32 {
        match (this) {
            case UNSET => 0x300
            case NAVIGATION => 0x301
            case TRAJECTORY_TRACKING => 0x302
            case CAR_HAILING => 0x303
            case DAILY_LIFE_SERVICE => 0x304
            case NO_POWER => 0x305
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class CurrentLocationRequest {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var priority: LocationRequestPriority
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var scenario: LocationRequestScenario
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var maxAccuracy: Float32
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var timeoutMs: Int32

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public init(priority!: LocationRequestPriority = LocationRequestPriority.FIRST_FIX,
        scenario!: LocationRequestScenario = LocationRequestScenario.UNSET, maxAccuracy!: Float32 = 0.0,
        timeoutMs!: Int32 = 5000) {
        this.priority = priority
        this.scenario = scenario
        this.maxAccuracy = maxAccuracy
        this.timeoutMs = timeoutMs
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocatingPriority {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    PRIORITY_ACCURACY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    PRIORITY_LOCATING_SPEED
    | ...

    func getValue(): Int32 {
        match (this) {
            case PRIORITY_ACCURACY => 0x501
            case PRIORITY_LOCATING_SPEED => 0x502
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class SingleLocationRequest {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var locatingPriority: LocatingPriority
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var locatingTimeoutMs: Int32

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public init(locatingPriority: LocatingPriority, locatingTimeoutMs: Int32) {
        this.locatingPriority = locatingPriority
        this.locatingTimeoutMs = locatingTimeoutMs
    }
}

const MEMORY_ERROR: Int32 = -1
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (3301000, "The location service is unavailable."),
        (3301100, "The location switch is off."),
        (3301200, "Failed to obtain the geographical location."),
        (3301300, "Reverse geocoding query failed."),
        (3301400, "Geocoding query failed."),
        (3301500, "Failed to query the area information."),
        (3301600, "Failed to operate the geofence."),
        (3301601, "The number of geofences exceeds the maximum."),
        (3301602, "Failed to delete a geofence due to an incorrect ID."),
        (3301700, "No response to the request."),
        (3301800, "Failed to start WiFi or Bluetooth scanning.")
    ]
)

func getErrorCode(code: Int32): Int32 {
    if (code == MEMORY_ERROR) {
        3301000
    } else {
        code
    }
}

func getErrorMsg(code: Int32): String {
    let errorCode = getErrorCode(code)
    if (let Some(v) <- getUniversalErrorMsg(errorCode)) {
        return v
    } else if (ERROR_CODE_MAP.contains(errorCode)) {
        return ERROR_CODE_MAP[errorCode]
    } else {
        return "Unknown error code ${errorCode}"
    }
}
