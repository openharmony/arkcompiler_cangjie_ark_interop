# ohos.geo_location_manager (Location Services)

Location services provide basic functionalities including GNSS positioning, network positioning (cellular base station, WLAN, Bluetooth positioning technologies), geocoding, reverse geocoding, country codes, and geofencing.

> **Note:**
>
> This module's capabilities only support the WGS-84 coordinate system.

## Import Module

```cangjie
import kit.LocationKit.*
```

## Permission List

Before using the Location Kit system capabilities, applications must verify whether they have obtained user authorization to access device location information. If authorization has not been granted, applications can request the necessary location permissions from the user.

The system provides the following location permissions:

ohos.permission.APPROXIMATELY_LOCATION: Used to obtain approximate location with an accuracy of 5 kilometers.

ohos.permission.LOCATION: Used to obtain precise location with meter-level accuracy.

ohos.permission.LOCATION_IN_BACKGROUND: Used for scenarios where the application needs to continue obtaining location information after switching to the background.

## Usage Instructions

API example code usage instructions:

- If the first line of the example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details on the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## class CurrentLocationRequest

```cangjie
public class CurrentLocationRequest {
    public var priority: LocationRequestPriority
    public var scenario: LocationRequestScenario
    public var maxAccuracy: Float32
    public var timeoutMs: Int32
    public init(priority!: LocationRequestPriority = LocationRequestPriority.FIRST_FIX,
        scenario!: LocationRequestScenario = LocationRequestScenario.UNSET, maxAccuracy!: Float32 = 0.0,
        timeoutMs!: Int32 = 5000)
}
```

**Functionality:** Parameters for current location information requests.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var maxAccuracy

```cangjie
public var maxAccuracy: Float32
```

**Functionality:** Represents accuracy information in meters.

Only effective in precise location scenarios (where both ohos.permission.APPROXIMATELY_LOCATION and ohos.permission.LOCATION permissions are granted). This field is meaningless in approximate location scenarios (where only ohos.permission.APPROXIMATELY_LOCATION is granted).

Default value is 0, with a valid range of values greater than or equal to 0.

When scenario is NAVIGATION/TRAJECTORY_TRACKING/CAR_HAILING or priority is ACCURACY, it is recommended to set maxAccuracy to a value greater than 10.

When scenario is DAILY_LIFE_SERVICE/NO_POWER or priority is LOW_POWER/FIRST_FIX, it is recommended to set maxAccuracy to a value greater than 100.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var priority

```cangjie
public var priority: LocationRequestPriority
```

**Functionality:** Represents priority information. When scenario is set to UNSET, the priority parameter takes effect; otherwise, it does not. If both scenario and priority are set to UNSET, the location request cannot be initiated. For valid values, see [LocationRequestPriority](#enum-locationrequestpriority).

**Type:** [LocationRequestPriority](#enum-locationrequestpriority)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var scenario

```cangjie
public var scenario: LocationRequestScenario
```

**Functionality:** Represents scenario information. When scenario is set to UNSET, the priority parameter takes effect; otherwise, it does not. If both scenario and priority are set to UNSET, the location request cannot be initiated. For valid values, see [LocationRequestScenario](#enum-locationrequestscenario).

**Type:** [LocationRequestScenario](#enum-locationrequestscenario)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var timeoutMs

```cangjie
public var timeoutMs: Int32
```

**Functionality:** Represents the timeout duration in milliseconds, with a minimum of 1000 milliseconds. Valid range is greater than or equal to 1000.

**Type:** Int32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### init(LocationRequestPriority, LocationRequestScenario, Float32, Int32)

```cangjie
public init(priority!: LocationRequestPriority = LocationRequestPriority.FIRST_FIX,
    scenario!: LocationRequestScenario = LocationRequestScenario.UNSET, maxAccuracy!: Float32 = 0.0,
    timeoutMs!: Int32 = 5000)
```

**Functionality:** Constructs a CurrentLocationRequest object.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| priority | [LocationRequestPriority](#enum-locationrequestpriority) | No | LocationRequestPriority.FIRST_FIX | **Named parameter.** Represents priority information. When scenario is set to UNSET, the priority parameter takes effect; otherwise, it does not. If both scenario and priority are set to UNSET, the location request cannot be initiated. For valid values, see [LocationRequestPriority](#enum-locationrequestpriority). |
| scenario | [LocationRequestScenario](#enum-locationrequestscenario) | No | LocationRequestScenario.UNSET | **Named parameter.** Represents scenario information. When scenario is set to UNSET, the priority parameter takes effect; otherwise, it does not. If both scenario and priority are set to UNSET, the location request cannot be initiated. For valid values, see [LocationRequestScenario](#enum-locationrequestscenario). |
| maxAccuracy | Float32 | No | 0.0 | **Named parameter.** Represents accuracy information in meters.<br/>Only effective in precise location scenarios (where both ohos.permission.APPROXIMATELY_LOCATION and ohos.permission.LOCATION permissions are granted). This field is meaningless in approximate location scenarios (where only ohos.permission.APPROXIMATELY_LOCATION is granted).<br/>Default value is 0, with a valid range of values greater than or equal to 0.<br/>When scenario is NAVIGATION/TRAJECTORY_TRACKING/CAR_HAILING or priority is ACCURACY, it is recommended to set maxAccuracy to a value greater than 10.<br/>When scenario is DAILY_LIFE_SERVICE/NO_POWER or priority is LOW_POWER/FIRST_FIX, it is recommended to set maxAccuracy to a value greater than 100. |
| timeoutMs | Int32 | No | 5000 | **Named parameter.** Represents the timeout duration in milliseconds, with a minimum of 1000 milliseconds. Valid range is greater than or equal to 1000. |

## class GeoLocationManager

```cangjie
public class GeoLocationManager {}
```

**Functionality:** Class for providing location services.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### static func getCurrentLocation()

```cangjie
public static func getCurrentLocation(): Location
```

**Functionality:** Obtains the current location.

**Required Permission:** ohos.permission.APPROXIMATELY_LOCATION

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Location](#class-location) | Returns the current location information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Location Services Subsystem Error Codes](../../errorcodes/cj-errorcode-geo_location_manager.md).

  | Error Code ID | Error Message |
  |:-------- |:---------------------------------------- |
  | 201 | Permission verification failed. The application does not have the permission required to call the API. |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 801 | Capability not supported. Failed to call ${GeoLocationManager.getCurrentLocation} due to limited device capabilities. |
  | 3301000 | The location service is unavailable. |
  | 3301100 | The location switch is off. |
  | 3301200 | Failed to obtain the geographical location. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocationKit.*

let location = GeoLocationManager.getCurrentLocation()
```

### static func getCurrentLocation(CurrentLocationRequest)

```cangjie
public static func getCurrentLocation(request: CurrentLocationRequest): Location
```

**Functionality:** Obtains the current location.

**Required Permission:** ohos.permission.APPROXIMATELY_LOCATION

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| request | [CurrentLocationRequest](#class-currentlocationrequest) | Yes | - | Sets the location request parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Location](#class-location) | Returns the current location information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Location Services Subsystem Error Codes](../../errorcodes/cj-errorcode-geo_location_manager.md).

  | Error Code ID | Error Message |
  |:-------- |:---------------------------------------- |
  | 201 | Permission verification failed. The application does not have the permission required to call the API. |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 801 | Capability not supported. Failed to call ${GeoLocationManager.getCurrentLocation} due to limited device capabilities. |
  | 3301000 | The location service is unavailable. |
  | 3301100 | The location switch is off. |
  | 3301200 | Failed to obtain the geographical location. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocationKit.*

let location = GeoLocationManager.getCurrentLocation(CurrentLocationRequest())
```

### static func getCurrentLocation(SingleLocationRequest)

```cangjie
public static func getCurrentLocation(request: SingleLocationRequest): Location
```

**Functionality:** Obtains the current location.

**Required Permission:** ohos.permission.APPROXIMATELY_LOCATION

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| request | [SingleLocationRequest](#class-singlelocationrequest) | Yes | - | Sets the location request parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Location](#class-location) | Returns the current location information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Location Services Subsystem Error Codes](../../errorcodes/cj-errorcode-geo_location_manager.md).

  | Error Code ID | Error Message |
  |:-------- |:---------------------------------------- |
  | 201 | Permission verification failed. The application does not have the permission required to call the API. |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 801 | Capability not supported. Failed to call ${GeoLocationManager.getCurrentLocation} due to limited device capabilities. |
  | 3301000 | The location service is unavailable. |
  | 3301100 | The location switch is off. |
  | 3301200 | Failed to obtain the geographical location. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocationKit.*

let location = GeoLocationManager.getCurrentLocation(SingleLocationRequest(LocatingPriority.PRIORITY_LOCATING_SPEED, 1000))
```

### static func isLocationEnabled()

```cangjie
public static func isLocationEnabled(): Bool
```

**Function:** Checks whether the location service is enabled.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: The location service switch is turned on;<br/>false: The location service switch is turned off. |

**Exceptions:**

- BusinessException: For details about the error codes, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Location Service Subsystem Error Codes](../../errorcodes/cj-errorcode-geo_location_manager.md).

  | Error Code ID | Error Message |
  |:-------- |:---------------------------------------- |
  | 801 | Capability not supported. Failed to call ${GeoLocationManager.isLocationEnabled} due to limited device capabilities.          |
  | 3301000 | The location service is unavailable. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocationKit.*

let res = GeoLocationManager.isLocationEnabled()
```

## class Location

```cangjie
public class Location {
    public var latitude: Float64
    public var longitude: Float64
    public var altitude: Float64
    public var accuracy: Float64
    public var speed: Float64
    public var timeStamp: Int64
    public var direction: Float64
    public var timeSinceBoot: Int64
    public var additions: Array<String>
    public var additionSize: Int64
    public var additionsMap: Map<String, String>
    public var altitudeAccuracy: Float64
    public var speedAccuracy: Float64
    public var directionAccuracy: Float64
    public var uncertaintyOfTimeSinceBoot: Int64
    public var sourceType: LocationSourceType
}
```

**Function:** Location information.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var accuracy

```cangjie
public var accuracy: Float64
```

**Function:** Represents the accuracy, in meters.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var additionSize

```cangjie
public var additionSize: Int64
```

**Function:** Number of additional information items. The value must be greater than or equal to 0.

**Type:** Int64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var additions

```cangjie
public var additions: Array<String>
```

**Function:** Additional information.

**Type:** Array\<String>

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var additionsMap

```cangjie
public var additionsMap: Map<String, String>
```

**Function:** Additional information. The content and order are the same as those of **additions**.

**Type:** Map\<String, String>

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var altitude

```cangjie
public var altitude: Float64
```

**Function:** Represents the altitude, in meters.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var altitudeAccuracy

```cangjie
public var altitudeAccuracy: Float64
```

**Function:** Represents the accuracy of the altitude, in meters.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var direction

```cangjie
public var direction: Float64
```

**Function:** Represents the direction, in degrees. The value ranges from 0 to 360.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var directionAccuracy

```cangjie
public var directionAccuracy: Float64
```

**Function:** Represents the accuracy of the direction, in degrees. The value ranges from 0 to 360.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var latitude

```cangjie
public var latitude: Float64
```

**Function:** Represents the latitude. A positive value indicates north latitude, and a negative value indicates south latitude. The value ranges from -90 to 90. Only the WGS84 coordinate system is supported.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var longitude

```cangjie
public var longitude: Float64
```

**Function:** Represents the longitude. A positive value indicates east longitude, and a negative value indicates west longitude. The value ranges from -180 to 180. Only the WGS84 coordinate system is supported.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var sourceType

```cangjie
public var sourceType: LocationSourceType
```

**Function:** Represents the source of the location result.

**Type:** [LocationSourceType](#enum-locationsourcetype)

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var speed

```cangjie
public var speed: Float64
```

**Function:** Represents the speed, in meters per second.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var speedAccuracy

```cangjie
public var speedAccuracy: Float64
```

**Function:** Represents the accuracy of the speed, in meters per second.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var timeSinceBoot

```cangjie
public var timeSinceBoot: Int64
```

**Function:** Represents the location timestamp in boot time format.

**Type:** Int64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21### var timeStamp

```cangjie
public var timeStamp: Int64
```

**Function:** Represents the location timestamp in UTC format.

**Type:** Int64

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var uncertaintyOfTimeSinceBoot

```cangjie
public var uncertaintyOfTimeSinceBoot: Int64
```

**Function:** Represents the uncertainty of the location timestamp.

**Type:** Int64

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

## class SingleLocationRequest

```cangjie
public class SingleLocationRequest {
    public var locatingPriority: LocatingPriority
    public var locatingTimeoutMs: Int32
    public init(locatingPriority: LocatingPriority, locatingTimeoutMs: Int32)
}
```

**Function:** Request parameters for single location acquisition.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var locatingPriority

```cangjie
public var locatingPriority: LocatingPriority
```

**Function:** Indicates priority information. For valid values, see the definition of [LocatingPriority](#enum-locatingpriority).

**Type:** [LocatingPriority](#enum-locatingpriority)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var locatingTimeoutMs

```cangjie
public var locatingTimeoutMs: Int32
```

**Function:** Indicates the timeout duration in milliseconds. The minimum value is 1000 ms. Valid values are greater than or equal to 1000.

**Type:** Int32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### init(LocatingPriority, Int32)

```cangjie
public init(locatingPriority: LocatingPriority, locatingTimeoutMs: Int32)
```

**Function:** Constructs a SingleLocationRequest object.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| locatingPriority | [LocatingPriority](#enum-locatingpriority) | Yes | - | Indicates priority information. For valid values, see the definition of [LocatingPriority](#enum-locatingpriority). |
| locatingTimeoutMs | Int32 | Yes | - | Indicates the timeout duration in milliseconds. The minimum value is 1000 ms. Valid values are greater than or equal to 1000. |

## enum LocatingPriority

```cangjie
public enum LocatingPriority {
    | PRIORITY_ACCURACY
    | PRIORITY_LOCATING_SPEED
    | ...
}
```

**Function:** Priority types in single location requests.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### PRIORITY_ACCURACY

```cangjie
PRIORITY_ACCURACY
```

**Function:** Indicates accuracy priority.

The accuracy-first strategy uses both GNSS and network positioning technologies and returns the most accurate result within a certain period (the shorter of [SingleLocationRequest](#class-singlelocationrequest).locatingTimeoutMs and 30 seconds). This strategy consumes more hardware resources and power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### PRIORITY_LOCATING_SPEED

```cangjie
PRIORITY_LOCATING_SPEED
```

**Function:** Indicates fast location acquisition priority. If an application requires quick location results, this priority type can be set.

The speed-first strategy uses both GNSS and network positioning technologies to quickly obtain location results in both indoor and outdoor scenarios. The first acquired location result is returned to the application. This strategy consumes more hardware resources and power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

## enum LocationRequestPriority

```cangjie
public enum LocationRequestPriority {
    | UNSET
    | ACCURACY
    | LOW_POWER
    | FIRST_FIX
    | ...
}
```

**Function:** Priority types for location information in location requests.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### ACCURACY

```cangjie
ACCURACY
```

**Function:** Indicates accuracy priority.

The accuracy-first strategy primarily uses GNSS positioning technology. Network positioning technology is used before GNSS provides stable location results. During continuous positioning, network positioning is used if GNSS results cannot be obtained for more than 30 seconds. This strategy consumes more hardware resources and power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### FIRST_FIX

```cangjie
FIRST_FIX
```

**Function:** Indicates fast location acquisition priority. If an application requires quick location results, this priority type can be set.

The speed-first strategy uses both GNSS and network positioning technologies to quickly obtain location results in both indoor and outdoor scenarios. When multiple positioning technologies provide results, the system selects the most accurate one to return to the application. This strategy consumes more hardware resources and power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### LOW_POWER

```cangjie
LOW_POWER
```

**Function:** Indicates low power priority.

The low-power strategy uses only network positioning technology, which works in both indoor and outdoor scenarios. Since it relies on the distribution of nearby base stations, visible WLANs, and Bluetooth devices, the accuracy of location results may vary significantly. This strategy is recommended for scenarios where high accuracy is not required, as it effectively reduces power consumption.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### UNSET

```cangjie
UNSET
```

**Function:** Indicates that the priority is not set, meaning [LocationRequestPriority](#enum-locationrequestpriority) is invalid.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

## enum LocationRequestScenario

```cangjie
public enum LocationRequestScenario {
    | UNSET
    | NAVIGATION
    | TRAJECTORY_TRACKING
    | CAR_HAILING
    | DAILY_LIFE_SERVICE
    | NO_POWER
    | ...
}
```

**Function:** Positioning scenario types in location requests.

> **Note:**
>
> When using NAVIGATION/TRAJECTORY_TRACKING/CAR_HAILING scenarios for single or continuous positioning, network positioning technology is used before GNSS provides stable location results. During continuous positioning, if GNSS results cannot be obtained for more than 30 seconds, network positioning is used to acquire the location.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### CAR_HAILING

```cangjie
CAR_HAILING
```

**Function:** Indicates ride-hailing scenarios.

Suitable for scenarios where users need to locate their current position for ride-hailing services, such as ride-sharing applications.

Primarily uses GNSS positioning technology, which consumes more power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### DAILY_LIFE_SERVICE

```cangjie
DAILY_LIFE_SERVICE
```

**Function:** Indicates daily service scenarios.

Suitable for scenarios where precise user location is not required, such as news, online shopping, and food delivery applications.

This scenario uses only network positioning technology, which consumes less power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### NAVIGATION

```cangjie
NAVIGATION
```

**Function:** Indicates navigation scenarios.

Suitable for outdoor scenarios where real-time device location is required, such as vehicle or pedestrian navigation.

Primarily uses GNSS positioning technology, which consumes more power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### NO_POWER

```cangjie
NO_POWER
```

**Function:** Indicates no-power scenarios. In this scenario, positioning is not actively triggered. Location results are returned to the current application only when other applications perform positioning.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21### TRAJECTORY_TRACKING

```cangjie
TRAJECTORY_TRACKING
```

**Function:** Indicates a motion trajectory recording scenario.

Applicable for scenarios that record user location trajectories, such as the trajectory recording feature in sports applications.

Primarily uses GNSS positioning technology to provide location services, with relatively high power consumption.

**System Capability:** SystemCapability.Location.Location.Core

**Initial Version:** 21

### UNSET

```cangjie
UNSET
```

**Function:** Indicates that scenario information is not configured.

Indicates the [LocationRequestScenario](#enum-locationrequestscenario) field is invalid.

**System Capability:** SystemCapability.Location.Location.Core

**Initial Version:** 21

## enum LocationSourceType

```cangjie
public enum LocationSourceType {
    | GNSS
    | NETWORK
    | INDOOR
    | RTK
    | ...
}
```

**Function:** Source of the positioning result.

**System Capability:** SystemCapability.Location.Location.Core

**Initial Version:** 21

### GNSS

```cangjie
GNSS
```

**Function:** Indicates the positioning result is obtained through GNSS positioning technology.

**System Capability:** SystemCapability.Location.Location.Core

**Initial Version:** 21

### INDOOR

```cangjie
INDOOR
```

**Function:** Indicates the positioning result is obtained through indoor high-precision positioning technology.

**System Capability:** SystemCapability.Location.Location.Core

**Initial Version:** 21

### NETWORK

```cangjie
NETWORK
```

**Function:** Indicates the positioning result is obtained through network positioning technology.

**System Capability:** SystemCapability.Location.Location.Core

**Initial Version:** 21

### RTK

```cangjie
RTK
```

**Function:** Indicates the positioning result is obtained through outdoor high-precision positioning technology.

**System Capability:** SystemCapability.Location.Location.Core

**Initial Version:** 21