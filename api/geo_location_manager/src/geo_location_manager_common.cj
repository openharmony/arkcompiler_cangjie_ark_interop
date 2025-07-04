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

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Geocoder"
]
public class ReverseGeoCodeRequest {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var locale: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var country: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var latitude: Float64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var longitude: Float64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var maxItems: Int32

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public init(latitude: Float64, longitude: Float64, locale!: String = System.getSystemLanguage(),
        country!: String = System.getSystemRegion(), maxItems!: Int32 = 1) {
        this.latitude = latitude
        this.longitude = longitude
        this.locale = locale
        this.country = country
        this.maxItems = maxItems
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Geocoder"
]
public class GeoCodeRequest {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var locale: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var country: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var description: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var maxItems: Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var minLatitude: Float64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var minLongitude: Float64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var maxLatitude: Float64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public var maxLongitude: Float64

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public init(description: String, locale!: String = System.getSystemLanguage(),
        country!: String = System.getSystemRegion(), maxItems!: Int32 = 1, minLatitude!: Float64 = -90.0,
        minLongitude!: Float64 = -180.0, maxLatitude!: Float64 = 90.0, maxLongitude!: Float64 = 180.0) {
        this.locale = locale
        this.country = country
        this.description = description
        this.maxItems = maxItems
        this.minLatitude = minLatitude
        this.minLongitude = minLongitude
        this.maxLatitude = maxLatitude
        this.maxLongitude = maxLongitude
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Geocoder"
]
public class GeoAddress {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public GeoAddress(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var latitude: Float64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var longitude: Float64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var locale: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var placeName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var countryCode: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var countryName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var administrativeArea: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var subAdministrativeArea: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var locality: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var subLocality: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var roadName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var subRoadName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var premises: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var postalCode: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var phoneNumber: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var addressUrl: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var descriptions: Array<String>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Location.Location.Geocoder"
        ]
        public var descriptionsSize: Int32
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class LocationCommand {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var scenario: LocationRequestScenario
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var command: String

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public init(scenario: LocationRequestScenario, command: String) {
        this.scenario = scenario
        this.command = command
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum CountryCodeType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    COUNTRY_CODE_FROM_LOCALE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    COUNTRY_CODE_FROM_SIM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    COUNTRY_CODE_FROM_LOCATION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    COUNTRY_CODE_FROM_NETWORK
    | ...

    static func parse(value: Int32): CountryCodeType {
        match (value) {
            case 1 => COUNTRY_CODE_FROM_LOCALE
            case 2 => COUNTRY_CODE_FROM_SIM
            case 3 => COUNTRY_CODE_FROM_LOCATION
            case 4 => COUNTRY_CODE_FROM_NETWORK
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case COUNTRY_CODE_FROM_LOCALE => 1
            case COUNTRY_CODE_FROM_SIM => 2
            case COUNTRY_CODE_FROM_LOCATION => 3
            case COUNTRY_CODE_FROM_NETWORK => 4
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class CountryCode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var country: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var `type`: CountryCodeType

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public init(country: String, `type`: CountryCodeType) {
        this.country = country
        this.`type` = `type`
    }
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.APPROXIMATELY_LOCATION",
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum CallbackType {
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LocationChange
    | @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LocationErr
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LocationEnabledChange
    | @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CachedGnssLocationsChange
    | @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    SatelliteStatusChange
    | @!APILevel[
        19,
        permission: "ohos.LOCATION" & "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    NmeaMessage
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    CountryCodeChange
    | ...
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class LocationRequest {
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
    public var timeInterval: Int32
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var distanceInterval: Float64
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
    public init(priority!: LocationRequestPriority = FIRST_FIX, scenario!: LocationRequestScenario = UNSET,
        timeInterval!: Int32 = 1, distanceInterval!: Float64 = 0.0, maxAccuracy!: Float32 = 0.0) {
        this.priority = priority
        this.scenario = scenario
        this.timeInterval = timeInterval
        this.distanceInterval = distanceInterval
        this.maxAccuracy = maxAccuracy
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum UserActivityScenario {
    @!APILevel[
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
    SPORT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    TRANSPORT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    DAILY_LIFE_SERVICE
    | ...

    func getValue(): Int32 {
        match (this) {
            case NAVIGATION => 0x401
            case SPORT => 0x402
            case TRANSPORT => 0x403
            case DAILY_LIFE_SERVICE => 0x404
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
public enum PowerConsumptionScenario {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    HIGH_POWER_CONSUMPTION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LOW_POWER_CONSUMPTION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    NO_POWER_CONSUMPTION
    | ...

    func getValue(): Int32 {
        match (this) {
            case HIGH_POWER_CONSUMPTION => 0x601
            case LOW_POWER_CONSUMPTION => 0x602
            case NO_POWER_CONSUMPTION => 0x603
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
public class ContinuousLocationRequest {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public var interval: Int32
    var _locationScenario: Int32

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public mut prop locationScenario: Int32 {
        get() {
            return _locationScenario
        }
        set(v) {
            if (v == 0x401 || v == 0x402 || v == 0x403 || v == 0x404 || v == 0x601 || v == 0x602 || v == 0x603) {
                this._locationScenario = v
            } else {
                throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public init(interval: Int32, locationScenario: UserActivityScenario) {
        this.interval = interval
        this._locationScenario = locationScenario.getValue()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public init(interval: Int32, locationScenario: PowerConsumptionScenario) {
        this.interval = interval
        this._locationScenario = locationScenario.getValue()
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public enum LocationError {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LOCATING_FAILED_DEFAULT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LOCATING_FAILED_LOCATION_PERMISSION_DENIED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LOCATING_FAILED_LOCATION_SWITCH_OFF
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    LOCATING_FAILED_INTERNET_ACCESS_FAILURE
    | ...

    static func parse(value: Int32): LocationError {
        match (value) {
            case -1 => LOCATING_FAILED_DEFAULT
            case -2 => LOCATING_FAILED_LOCATION_PERMISSION_DENIED
            case -3 => LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED
            case -4 => LOCATING_FAILED_LOCATION_SWITCH_OFF
            case -5 => LOCATING_FAILED_INTERNET_ACCESS_FAILURE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case LOCATING_FAILED_DEFAULT => -1
            case LOCATING_FAILED_LOCATION_PERMISSION_DENIED => -2
            case LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED => -3
            case LOCATING_FAILED_LOCATION_SWITCH_OFF => -4
            case LOCATING_FAILED_INTERNET_ACCESS_FAILURE => -5
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
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

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Gnss"
]
public class CachedGnssLocationsRequest {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var reportingPeriodSec: Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var wakeUpCacheQueueFull: Bool

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public init(reportingPeriodSec: Int32, wakeUpCacheQueueFull: Bool) {
        this.reportingPeriodSec = reportingPeriodSec
        this.wakeUpCacheQueueFull = wakeUpCacheQueueFull
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Gnss"
]
public enum SatelliteConstellationCategory {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CONSTELLATION_CATEGORY_UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CONSTELLATION_CATEGORY_GPS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CONSTELLATION_CATEGORY_SBAS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CONSTELLATION_CATEGORY_GLONASS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CONSTELLATION_CATEGORY_QZSS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CONSTELLATION_CATEGORY_BEIDOU
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CONSTELLATION_CATEGORY_GALILEO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    CONSTELLATION_CATEGORY_IRNSS
    | ...

    static func parse(value: Int32): SatelliteConstellationCategory {
        match (value) {
            case 0 => CONSTELLATION_CATEGORY_UNKNOWN
            case 1 => CONSTELLATION_CATEGORY_GPS
            case 2 => CONSTELLATION_CATEGORY_SBAS
            case 3 => CONSTELLATION_CATEGORY_GLONASS
            case 4 => CONSTELLATION_CATEGORY_QZSS
            case 5 => CONSTELLATION_CATEGORY_BEIDOU
            case 6 => CONSTELLATION_CATEGORY_GALILEO
            case 7 => CONSTELLATION_CATEGORY_IRNSS
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case CONSTELLATION_CATEGORY_UNKNOWN => 0
            case CONSTELLATION_CATEGORY_GPS => 1
            case CONSTELLATION_CATEGORY_SBAS => 2
            case CONSTELLATION_CATEGORY_GLONASS => 3
            case CONSTELLATION_CATEGORY_QZSS => 4
            case CONSTELLATION_CATEGORY_BEIDOU => 5
            case CONSTELLATION_CATEGORY_GALILEO => 6
            case CONSTELLATION_CATEGORY_IRNSS => 7
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Gnss"
]
public class SatelliteStatusInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var satellitesNumber: Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var satelliteIds: Array<Int32>
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var carrierToNoiseDensitys: Array<Float64>
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var altitudes: Array<Float64>
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var azimuths: Array<Float64>
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var carrierFrequencies: Array<Float64>
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var satelliteConstellation: Array<SatelliteConstellationCategory>
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public var satelliteAdditionalInfo: Array<Int32>

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public init(satellitesNumber: Int32, satelliteIds: Array<Int32>, carrierToNoiseDensitys: Array<Float64>,
        altitudes: Array<Float64>, azimuths: Array<Float64>, carrierFrequencies: Array<Float64>,
        satelliteConstellation!: Array<SatelliteConstellationCategory> = Array<SatelliteConstellationCategory>(),
        satelliteAdditionalInfo!: Array<Int32> = Array<Int32>()) {
        this.satellitesNumber = satellitesNumber
        this.satelliteIds = satelliteIds
        this.carrierToNoiseDensitys = carrierToNoiseDensitys
        this.altitudes = altitudes
        this.azimuths = azimuths
        this.carrierFrequencies = carrierFrequencies
        this.satelliteConstellation = satelliteConstellation
        this.satelliteAdditionalInfo = satelliteAdditionalInfo
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Geofence"
]
public enum CoordinateSystemType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geofence"
    ]
    WGS84
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geofence"
    ]
    GCJ02
    | ...

    static func parse(value: Int32): CoordinateSystemType {
        match (value) {
            case 1 => WGS84
            case 2 => GCJ02
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case WGS84 => 1
            case GCJ02 => 2
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Gnss"
]
public enum SatelliteAdditionalInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    SATELLITES_ADDITIONAL_INFO_NULL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    SATELLITES_ADDITIONAL_INFO_EPHEMERIS_DATA_EXIST
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    SATELLITES_ADDITIONAL_INFO_ALMANAC_DATA_EXIST
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    SATELLITES_ADDITIONAL_INFO_USED_IN_FIX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    SATELLITES_ADDITIONAL_INFO_CARRIER_FREQUENCY_EXIST
    | ...

    static func parse(value: Int32): SatelliteAdditionalInfo {
        match (value) {
            case 0 => SATELLITES_ADDITIONAL_INFO_NULL
            case 1 => SATELLITES_ADDITIONAL_INFO_EPHEMERIS_DATA_EXIST
            case 2 => SATELLITES_ADDITIONAL_INFO_ALMANAC_DATA_EXIST
            case 4 => SATELLITES_ADDITIONAL_INFO_USED_IN_FIX
            case 8 => SATELLITES_ADDITIONAL_INFO_CARRIER_FREQUENCY_EXIST
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case SATELLITES_ADDITIONAL_INFO_NULL => 0
            case SATELLITES_ADDITIONAL_INFO_EPHEMERIS_DATA_EXIST => 1
            case SATELLITES_ADDITIONAL_INFO_ALMANAC_DATA_EXIST => 2
            case SATELLITES_ADDITIONAL_INFO_USED_IN_FIX => 4
            case SATELLITES_ADDITIONAL_INFO_CARRIER_FREQUENCY_EXIST => 8
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}
