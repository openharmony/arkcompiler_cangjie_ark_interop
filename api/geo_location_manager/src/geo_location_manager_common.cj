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

/**
 * Enum for the source of the location.
 *
 * @relation export enum LocationSourceType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocationSourceType {
    /**
     * The location is obtained from the GNSS.
     *
     * @relation GNSS = 1,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    Gnss
    /**
     * The location comes from the network positioning technology.
     *
     * @relation NETWORK = 2,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    Network
    /**
     * The location comes from the indoor positioning technology.
     *
     * @relation INDOOR = 3,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    Indoor
    /**
     * The location comes from the GNSS RTK technology.
     *
     * @relation RTK = 4
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    Rtk
    | ...

    static func parse(value: Int32): LocationSourceType {
        match (value) {
            case 1 => Gnss
            case 2 => Network
            case 3 => Indoor
            case 4 => Rtk
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case Gnss => 1
            case Network => 2
            case Indoor => 3
            case Rtk => 4
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Provides information about geographic locations.
 *
 * @relation export interface Location
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class Location {
    /**
     * Indicates latitude information.
     * A positive value indicates north latitude,
     * and a negative value indicates south latitude.
     *
     * @relation latitude: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var latitude: Float64
    /**
     * Indicates Longitude information.
     * A positive value indicates east longitude ,
     * and a negative value indicates west longitude.
     *
     * @relation longitude: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var longitude: Float64
    /**
     * Indicates location altitude, in meters.
     *
     * @relation altitude: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var altitude: Float64
    /**
     * Indicates location accuracy, in meters.
     *
     * @relation accuracy: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var accuracy: Float64
    /**
     * Indicates speed, in m/s.
     *
     * @relation speed: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var speed: Float64
    /**
     * Indicates location timestamp in the UTC format.
     *
     * @relation timeStamp: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var timeStamp: Int64
    /**
     * Indicates direction information.
     *
     * @relation direction: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var direction: Float64
    /**
     * Indicates location timestamp since boot.
     *
     * @relation timeSinceBoot: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var timeSinceBoot: Int64
    /**
     * Indicates additional information.
     *
     * @relation additions?: Array<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var additions: Array<String>
    /**
     * Indicates the amount of additional descriptive information.
     *
     * @relation additionSize?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var additionSize: Int64
    /**
     * Indicates additional information map.
     *
     * @relation additionsMap?: Map<string, string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var additionsMap: Map<String, String>
    /**
     * Indicates vertical position accuracy in meters.
     *
     * @relation altitudeAccuracy?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var altitudeAccuracy: Float64
    /**
     * Indicates speed accuracy in meter per seconds.
     *
     * @relation speedAccuracy?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var speedAccuracy: Float64
    /**
     * Indicates direction accuracy in degrees.
     *
     * @relation directionAccuracy?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var directionAccuracy: Float64
    /**
     * Time uncertainty Of timeSinceBoot in nanosecond.
     *
     * @relation uncertaintyOfTimeSinceBoot?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var uncertaintyOfTimeSinceBoot: Int64
    /**
     * Indicates the source of the location.
     *
     * @relation sourceType?: LocationSourceType;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var sourceType: LocationSourceType

    init(cjLocation: CJLocation, additions!: Array<String> = Array<String>(),
        additionsMap!: Map<String, String> = HashMap<String, String>(),
        sourceType!: LocationSourceType = LocationSourceType.Gnss) {
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

/**
 * Enum for location priority.
 *
 * @relation export enum LocationRequestPriority
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocationRequestPriority {
    /**
     * Default priority.
     *
     * @relation UNSET = 0x200,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    Unset
    /**
     * Preferentially ensure the locating accuracy.
     *
     * @relation ACCURACY,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    Accuracy
    /**
     * Preferentially ensure low power consumption for locating.
     *
     * @relation LOW_POWER,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LowPower
    /**
     * Preferentially ensure that the first location is time-consuming.
     *
     * @relation FIRST_FIX
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    FirstFix
    | ...

    func getValue(): Int32 {
        match (this) {
            case Unset => 0x200
            case Accuracy => 0x201
            case LowPower => 0x202
            case FirstFix => 0x203
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enum for location scenario.
 *
 * @relation export enum LocationRequestScenario
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocationRequestScenario {
    /**
     * Default scenario.
     *
     * @relation UNSET = 0x300,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    Unset
    /**
     * Navigation scenario. High positioning precision and real-time performance are required.
     *
     * @relation NAVIGATION,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    Navigation
    /**
     * Trajectory tracking scenario. High positioning precision is required.
     *
     * @relation TRAJECTORY_TRACKING,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    TrajectoryTracking
    /**
     * Car hailing scenario. High positioning precision and real-time performance are required.
     *
     * @relation CAR_HAILING,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    CarHailing
    /**
     * Daily life scenarios. Low requirements on positioning precision and real-time performance.
     *
     * @relation DAILY_LIFE_SERVICE,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    DailyLifeService
    /**
     * Power saving scenarios.
     *
     * @relation NO_POWER
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    NoPower
    | ...

    func getValue(): Int32 {
        match (this) {
            case Unset => 0x300
            case Navigation => 0x301
            case TrajectoryTracking => 0x302
            case CarHailing => 0x303
            case DailyLifeService => 0x304
            case NoPower => 0x305
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Configuring parameters in current location requests.
 *
 * @relation export interface CurrentLocationRequest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class CurrentLocationRequest {
    /**
     * Priority of the location request.
     *
     * @relation priority?: LocationRequestPriority;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var priority: LocationRequestPriority
    /**
     * User scenario of the location request.
     *
     * @relation scenario?: LocationRequestScenario;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var scenario: LocationRequestScenario
    /**
     * Accuracy requirements for reporting locations.
     *
     * @relation maxAccuracy?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var maxAccuracy: Float32
    /**
     * Timeout interval of a single location request.
     *
     * @relation timeoutMs?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var timeoutMs: Int32

    /**
     * CurrentLocationRequest Constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public init(priority!: LocationRequestPriority = LocationRequestPriority.FirstFix,
        scenario!: LocationRequestScenario = LocationRequestScenario.Unset, maxAccuracy!: Float32 = 0.0,
        timeoutMs!: Int32 = 5000) {
        this.priority = priority
        this.scenario = scenario
        this.maxAccuracy = maxAccuracy
        this.timeoutMs = timeoutMs
    }
}

/**
 * Enum for locating priority.
 *
 * @relation export enum LocatingPriority
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocatingPriority {
    /**
     * Preferentially ensure the highest locating accuracy.
     *
     * @relation PRIORITY_ACCURACY = 0x501,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    PriorityAccuracy
    /**
     * Preferentially ensure the fastest locating speed.
     *
     * @relation PRIORITY_LOCATING_SPEED = 0x502
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    PriorityLocatingSpeed
    | ...

    func getValue(): Int32 {
        match (this) {
            case PriorityAccuracy => 0x501
            case PriorityLocatingSpeed => 0x502
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Configuring parameters in single location requests.
 *
 * @relation export interface SingleLocationRequest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class SingleLocationRequest {
    /**
     * Priority of the location request.
     *
     * @relation locatingPriority: LocatingPriority;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var locatingPriority: LocatingPriority
    /**
     * Timeout of a single location request, in milliseconds.
     *
     * @relation locatingTimeoutMs: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var locatingTimeoutMs: Int32

    /**
     * SingleLocationRequest Constructor.
     */
    @!APILevel[
        21,
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
