# ohos.geo_location_manager (Location Services)

Location services provide basic functionalities including GNSS positioning, network positioning (cellular base station, WLAN, Bluetooth positioning technologies), geocoding, reverse geocoding, country codes, and geo-fencing.

> **Note:**
>
> This module's capabilities only support the WGS-84 coordinate system.

## Importing the Module

```cangjie
import kit.LocationKit.*
```

## Permission List

Before using the Location Kit system capabilities, applications must check whether they have obtained user authorization to access device location information. If authorization has not been granted, applications can request the necessary location permissions from the user.

The system provides the following location permissions:

ohos.permission.APPROXIMATELY_LOCATION: Used to obtain approximate location with an accuracy of 5 kilometers.

ohos.permission.LOCATION: Used to obtain precise location with meter-level accuracy.

ohos.permission.LOCATION_IN_BACKGROUND: Used for scenarios where the application needs to continue obtaining location information after switching to the background.

## Usage Instructions

API sample code usage instructions:

- If the sample code has a "// index.cj" comment on the first line, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above sample projects and configuration templates, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## class CurrentLocationRequest

```cangjie
public class CurrentLocationRequest {
    public var priority: LocationRequestPriority
    public var scenario: LocationRequestScenario
    public var maxAccuracy: Float32
    public var timeoutMs: Int32
    public init(priority!: LocationRequestPriority = LocationRequestPriority.FirstFix,
        scenario!: LocationRequestScenario = LocationRequestScenario.Unset, maxAccuracy!: Float32 = 0.0,
        timeoutMs!: Int32 = 5000)
}
```

**Function:** Parameters for current location information request.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var maxAccuracy

```cangjie
public var maxAccuracy: Float32
```

**Function:** Represents accuracy information in meters.

Only effective in precise location scenarios (when both ohos.permission.APPROXIMATELY_LOCATION and ohos.permission.LOCATION permissions are granted). This field is meaningless in approximate location scenarios (only ohos.permission.APPROXIMATELY_LOCATION permission is granted).

Default value is 0, valid range is greater than or equal to 0.

When scenario is Navigation/TrajectoryTracking/CarHailing or priority is Accuracy, it is recommended to set maxAccuracy to a value greater than 10.

When scenario is DailyLifeService/NoPower or priority is LowPower/FirstFix, it is recommended to set maxAccuracy to a value greater than 100.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var priority

```cangjie
public var priority: LocationRequestPriority
```

**Function:** Represents priority information. When scenario is set to Unset, the priority parameter takes effect; otherwise, it does not. If both scenario and priority are set to Unset, the location request cannot be initiated. Valid values are defined in [LocationRequestPriority](#enum-locationrequestpriority).

**Type:** [LocationRequestPriority](#enum-locationrequestpriority)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var scenario

```cangjie
public var scenario: LocationRequestScenario
```

**Function:** Represents scenario information. When scenario is set to Unset, the priority parameter takes effect; otherwise, it does not. If both scenario and priority are set to Unset, the location request cannot be initiated. Valid values are defined in [LocationRequestScenario](#enum-locationrequestscenario).

**Type:** [LocationRequestScenario](#enum-locationrequestscenario)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var timeoutMs

```cangjie
public var timeoutMs: Int32
```

**Function:** Represents timeout duration in milliseconds, with a minimum of 1000 milliseconds. Valid range is greater than or equal to 1000.

**Type:** Int32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### init(LocationRequestPriority, LocationRequestScenario, Float32, Int32)

```cangjie
public init(priority!: LocationRequestPriority = LocationRequestPriority.FirstFix,
    scenario!: LocationRequestScenario = LocationRequestScenario.Unset, maxAccuracy!: Float32 = 0.0,
    timeoutMs!: Int32 = 5000)
```

**Function:** Constructs a CurrentLocationRequest object.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| priority | [LocationRequestPriority](#enum-locationrequestpriority) | No | LocationRequestPriority.FirstFix | **Named parameter.** Represents priority information. When scenario is set to Unset, the priority parameter takes effect; otherwise, it does not. If both scenario and priority are set to Unset, the location request cannot be initiated. Valid values are defined in [LocationRequestPriority](#enum-locationrequestpriority). |
| scenario | [LocationRequestScenario](#enum-locationrequestscenario) | No | LocationRequestScenario.Unset | **Named parameter.** Represents scenario information. When scenario is set to Unset, the priority parameter takes effect; otherwise, it does not. If both scenario and priority are set to Unset, the location request cannot be initiated. Valid values are defined in [LocationRequestScenario](#enum-locationrequestscenario). |
| maxAccuracy | Float32 | No | 0.0 | **Named parameter.** Represents accuracy information in meters.<br/>Only effective in precise location scenarios (when both ohos.permission.APPROXIMATELY_LOCATION and ohos.permission.LOCATION permissions are granted). This field is meaningless in approximate location scenarios (only ohos.permission.APPROXIMATELY_LOCATION permission is granted).<br/>Default value is 0, valid range is greater than or equal to 0.<br/>When scenario is Navigation/TrajectoryTracking/CarHailing or priority is Accuracy, it is recommended to set maxAccuracy to a value greater than 10.<br/>When scenario is DailyLifeService/NoPower or priority is LowPower/FirstFix, it is recommended to set maxAccuracy to a value greater than 100. |
| timeoutMs | Int32 | No | 5000 | **Named parameter.** Represents timeout duration in milliseconds, with a minimum of 1000 milliseconds. Valid range is greater than or equal to 1000. |

## class GeoLocationManager

```cangjie
public class GeoLocationManager {}
```

**Function:** Class for providing location services.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### static func getCurrentLocation()

```cangjie
public static func getCurrentLocation(): Location
```

**Function:** Obtains the current location.

**Required Permission:** ohos.APPROXIMATELY_LOCATION

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Location](#class-location) | Returns the current location information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocationKit.*

let location = GeoLocationManager.getCurrentLocation(SingleLocationRequest(LocatingPriority.PriorityLocatingSpeed, 1000))
```

### static func getCurrentLocation(CurrentLocationRequest)

```cangjie
public static func getCurrentLocation(request: CurrentLocationRequest): Location
```

**Function:** Obtains the current location.

**Required Permission:** ohos.APPROXIMATELY_LOCATION

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

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocationKit.*

let location = GeoLocationManager.getCurrentLocation(SingleLocationRequest(LocatingPriority.PriorityLocatingSpeed, 1000))
```

### static func getCurrentLocation(SingleLocationRequest)

```cangjie
public static func getCurrentLocation(request: SingleLocationRequest): Location
```

**Function:** Obtains the current location.

**Required Permission:** ohos.APPROXIMATELY_LOCATION

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

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocationKit.*

let location = GeoLocationManager.getCurrentLocation(SingleLocationRequest(LocatingPriority.PriorityLocatingSpeed, 1000))
```

### static func isLocationEnabled()

```cangjie
public static func isLocationEnabled(): Bool
```

**Function:** Checks whether location services are enabled.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: Location service switch is enabled;<br/>false: Location service switch is disabled. |

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

**Function:** Represents accuracy information in meters.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var additionSize

```cangjie
public var additionSize: Int64
```

**Function:** Number of additional information items. Valid range is greater than or equal to 0.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var additions

```cangjie
public var additions: Array<String>
```

**Function:** Additional information.

**Type:** Array\<String>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var additionsMap

```cangjie
public var additionsMap: Map<String, String>
```

**Function:** Additional information. The specific content and order are consistent with additions.

**Type:** [Map](../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var altitude

```cangjie
public var altitude: Float64
```

**Function:** Represents altitude information in meters.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var altitudeAccuracy

```cangjie
public var altitudeAccuracy: Float64
```

**Function:** Represents the accuracy of altitude information in meters.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var direction

```cangjie
public var direction: Float64
```

**Function:** Represents heading information in degrees, with a valid range of 0 to 360.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var directionAccuracy

```cangjie
public var directionAccuracy: Float64
```

**Function:** Represents the accuracy of heading information in degrees, with a valid range of 0 to 360.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var latitude

```cangjie
public var latitude: Float64
```

**Function:** Represents latitude information. Positive values indicate north latitude, and negative values indicate south latitude. Valid range is -90 to 90. Only supports the WGS84 coordinate system.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var longitude

```cangjie
public var longitude: Float64
```

**Function:** Represents longitude information. Positive values indicate east longitude, and negative values indicate west longitude. Valid range is -180 to 180. Only supports the WGS84 coordinate system.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var sourceType

```cangjie
public var sourceType: LocationSourceType
```

**Function:** Represents the source of the location result.

**Type:** [LocationSourceType](#enum-locationsourcetype)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var speed

```cangjie
public var speed: Float64
```

**Function:** Represents speed information in meters per second.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var speedAccuracy

```cangjie
public var speedAccuracy: Float64
```

**Function:** Represents the accuracy of speed information in meters per second.

**Type:** Float64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var timeSinceBoot

```cangjie
public var timeSinceBoot: Int64
```

**Function:** Represents the location timestamp in boot time format.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var timeStamp

```cangjie
public var timeStamp: Int64
```

**Function:** Represents the location timestamp in UTC format.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var uncertaintyOfTimeSinceBoot

```cangjie
public var uncertaintyOfTimeSinceBoot: Int64
```

**Function:** Represents the uncertainty of the location timestamp.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21## class SingleLocationRequest

```cangjie
public class SingleLocationRequest {
    public var locatingPriority: LocatingPriority
    public var locatingTimeoutMs: Int32
    public init(locatingPriority: LocatingPriority, locatingTimeoutMs: Int32)
}
```

**Description:** Request parameters for single-shot location.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var locatingPriority

```cangjie
public var locatingPriority: LocatingPriority
```

**Description:** Indicates priority information. For valid values, see definition of [LocatingPriority](#enum-locatingpriority).

**Type:** [LocatingPriority](#enum-locatingpriority)

**Access:** Read-write

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### var locatingTimeoutMs

```cangjie
public var locatingTimeoutMs: Int32
```

**Description:** Indicates timeout duration in milliseconds, with a minimum of 1000 ms. Valid value range: ≥1000.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### init(LocatingPriority, Int32)

```cangjie
public init(locatingPriority: LocatingPriority, locatingTimeoutMs: Int32)
```

**Description:** Constructs a SingleLocationRequest object.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

**Parameters:**

|Name|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|locatingPriority|[LocatingPriority](#enum-locatingpriority)|Yes|-|Indicates priority information. For valid values, see definition of [LocatingPriority](#enum-locatingpriority).|
|locatingTimeoutMs|Int32|Yes|-|Indicates timeout duration in milliseconds, with a minimum of 1000 ms. Valid value range: ≥1000.|

## enum LocatingPriority

```cangjie
public enum LocatingPriority {
    | PriorityAccuracy
    | PriorityLocatingSpeed
    | ...
}
```

**Description:** Priority types in single-shot location requests.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### PriorityAccuracy

```cangjie
PriorityAccuracy
```

**Description:** Indicates accuracy priority.

The accuracy-first strategy uses both GNSS and network positioning technologies, returning the best accuracy result within a period (determined by the smaller value between [SingleLocationRequest](#class-singlelocationrequest).locatingTimeoutMs and 30 seconds). This consumes more hardware resources and power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### PriorityLocatingSpeed

```cangjie
PriorityLocatingSpeed
```

**Description:** Indicates fast location acquisition priority. Applications requiring quick positioning can set this priority type.

The speed-first strategy uses both GNSS and network positioning technologies to quickly obtain location results in both indoor and outdoor scenarios, returning the first acquired result. This consumes more hardware resources and power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

## enum LocationRequestPriority

```cangjie
public enum LocationRequestPriority {
    | Unset
    | Accuracy
    | LowPower
    | FirstFix
    | ...
}
```

**Description:** Priority types for location information in location requests.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### Accuracy

```cangjie
Accuracy
```

**Description:** Indicates accuracy priority.

The accuracy-first strategy primarily uses GNSS positioning, with network positioning as fallback before stable GNSS results are available. During continuous positioning, network positioning is used if no GNSS result is obtained within 30 seconds. This consumes more hardware resources and power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### FirstFix

```cangjie
FirstFix
```

**Description:** Indicates fast location acquisition priority. Applications requiring quick positioning can set this field.

The speed-first strategy uses both GNSS and network positioning technologies to quickly obtain location results in both indoor and outdoor scenarios. When multiple positioning technologies provide results, the system selects the one with better accuracy. This consumes more hardware resources and power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### LowPower

```cangjie
LowPower
```

**Description:** Indicates low power priority.

The low-power strategy uses only network positioning technology, providing location services in both indoor and outdoor scenarios. Since it relies on nearby base stations, visible WLANs, and Bluetooth devices, accuracy may vary significantly. Recommended for scenarios with low accuracy requirements to effectively conserve power.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### Unset

```cangjie
Unset
```

**Description:** Indicates unset priority, meaning [LocationRequestPriority](#enum-locationrequestpriority) is invalid.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

## enum LocationRequestScenario

```cangjie
public enum LocationRequestScenario {
    | Unset
    | Navigation
    | TrajectoryTracking
    | CarHailing
    | DailyLifeService
    | NoPower
    | ...
}
```

**Description:** Positioning scenario types in location requests.

> **Note:**
>
> When using Navigation/TrajectoryTracking/CarHailing scenarios for single-shot or continuous positioning, network positioning will be used as fallback before stable GNSS results are available. During continuous positioning, network positioning will be used if no GNSS result is obtained within 30 seconds.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### CarHailing

```cangjie
CarHailing
```

**Description:** Indicates ride-hailing scenario.

Applicable for locating current position during ride-hailing, such as in ride-sharing apps.

Primarily uses GNSS positioning, with higher power consumption.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### DailyLifeService

```cangjie
DailyLifeService
```

**Description:** Indicates daily service usage scenario.

Applicable for scenarios not requiring precise user location, such as news, e-commerce, or food delivery apps.

Uses only network positioning technology with lower power consumption.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### Navigation

```cangjie
Navigation
```

**Description:** Indicates navigation scenario.

Applicable for obtaining real-time device location outdoors, such as in vehicle or pedestrian navigation.

Primarily uses GNSS positioning with higher power consumption.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### NoPower

```cangjie
NoPower
```

**Description:** Indicates no-power scenario. In this scenario, positioning is not actively triggered; location results are returned only when other applications perform positioning.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### TrajectoryTracking

```cangjie
TrajectoryTracking
```

**Description:** Indicates trajectory tracking scenario.

Applicable for recording user movement trajectories, such as in fitness apps.

Primarily uses GNSS positioning with higher power consumption.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### Unset

```cangjie
Unset
```

**Description:** Indicates unset scenario.

Indicates that the [LocationRequestScenario](#enum-locationrequestscenario) field is invalid.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

## enum LocationSourceType

```cangjie
public enum LocationSourceType {
    | Gnss
    | Network
    | Indoor
    | Rtk
    | ...
}
```

**Description:** Source types of positioning results.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### Gnss

```cangjie
Gnss
```

**Description:** Indicates positioning result comes from GNSS technology.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### Indoor

```cangjie
Indoor
```

**Description:** Indicates positioning result comes from indoor high-precision positioning technology.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### Network

```cangjie
Network
```

**Description:** Indicates positioning result comes from network positioning technology.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21

### Rtk

```cangjie
Rtk
```

**Description:** Indicates positioning result comes from outdoor high-precision positioning technology.

**System Capability:** SystemCapability.Location.Location.Core

**Since:** 21