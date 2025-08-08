# ohos.battery_info (Battery Information)

This module primarily provides query interfaces for battery status and charging/discharging states.

## Importing the Module

```cangjie
import kit.BasicServicesKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## class BatteryInfo

```cangjie
public class BatteryInfo {}
```

**Function:** Class describing battery information.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.BatteryInfo
import kit.PerformanceAnalysisKit.*

let batterySOCInfo = BatteryInfo.batterySOC
Hilog.info(0, "batteryInfo", "The batterySOCInfo is: {batterySOCInfo}")
let chargingStatusInfo = BatteryInfo.chargingStatus
Hilog.info(0, "batteryInfo", "The chargingStatusInfo is: {chargingStatusInfo}")
let healthStatusInfo = BatteryInfo.healthStatus
Hilog.info(0, "batteryInfo", "The healthStatusInfo is: {healthStatusInfo}")
let pluggedTypeInfo = BatteryInfo.pluggedType
Hilog.info(0, "batteryInfo", "The pluggedTypeInfo is: {pluggedTypeInfo}")
let voltageInfo = BatteryInfo.voltage
Hilog.info(0, "batteryInfo", "The voltageInfo is: {voltageInfo}")
let technologyInfo = BatteryInfo.technology
Hilog.info(0, "batteryInfo", "The technologyInfo is: {technologyInfo}")
let batteryTemperatureInfo = BatteryInfo.batteryTemperature
Hilog.info(0, "batteryInfo", "The batteryTemperatureInfois: ${batteryTemperatureInfo}")
let isBatteryPresentInfo = BatteryInfo.isBatteryPresent
Hilog.info(0, "batteryInfo", "The isBatteryPresentInfo is: {isBatteryPresentInfo}")
let batteryCapacityLevelInfo = BatteryInfo.batteryCapacityLevel
Hilog.info(0, "batteryInfo", "The batteryCapacityLevelInfois: ${batteryCapacityLevelInfo}")
let nowCurrentInfo = BatteryInfo.nowCurrent
Hilog.info(0, "batteryInfo", "The nowCurrentInfo is: ${nowCurrentInfo}")
```

### static prop batteryCapacityLevel

```cangjie
public static prop batteryCapacityLevel: BatteryCapacityLevel
```

**Function:** Indicates the current battery capacity level of the device.

**Type:** [BatteryCapacityLevel](#enum-batterycapacitylevel)

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop batterySOC

```cangjie
public static prop batterySOC: Int32
```

**Function:** Indicates the current remaining battery percentage of the device.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop batteryTemperature

```cangjie
public static prop batteryTemperature: Int32
```

**Function:** Indicates the current battery temperature of the device.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop chargingStatus

```cangjie
public static prop chargingStatus: BatteryChargeState
```

**Function:** Indicates the current charging status of the device's battery.

**Type:** [BatteryChargeState](#enum-batterychargestate)

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop healthStatus

```cangjie
public static prop healthStatus: BatteryHealthState
```

**Function:** Indicates the current health status of the device's battery.

**Type:** [BatteryHealthState](#enum-batteryhealthstate)

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop isBatteryPresent

```cangjie
public static prop isBatteryPresent: Bool
```

**Function:** Indicates whether the device supports a battery or if the battery is present.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop nowCurrent

```cangjie
public static prop nowCurrent: Int32
```

**Function:** Indicates the current battery current of the device.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop pluggedType

```cangjie
public static prop pluggedType: BatteryPluggedType
```

**Function:** Indicates the type of charger currently connected to the device.

**Type:** [BatteryPluggedType](#enum-batterypluggedtype)

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop technology

```cangjie
public static prop technology: String
```

**Function:** Indicates the technology model of the device's current battery.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop voltage

```cangjie
public static prop voltage: Int32
```

**Function:** Indicates the current battery voltage of the device.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

## enum BatteryCapacityLevel

```cangjie
public enum BatteryCapacityLevel <: Equatable<BatteryCapacityLevel> & ToString {
    | LEVEL_FULL
    | LEVEL_HIGH
    | LEVEL_NORMAL
    | LEVEL_LOW
    | LEVEL_WARNING
    | LEVEL_CRITICAL
    | LEVEL_SHUTDOWN
    | ...
}
```

**Function:** Indicates battery capacity levels.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<BatteryCapacityLevel>
- ToString

### LEVEL_CRITICAL

```cangjie
LEVEL_CRITICAL
```

**Function:** Indicates the battery capacity level is critically low.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LEVEL_FULL

```cangjie
LEVEL_FULL
```

**Function:** Indicates the battery capacity level is full.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LEVEL_HIGH

```cangjie
LEVEL_HIGH
```

**Function:** Indicates the battery capacity level is high.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LEVEL_LOW

```cangjie
LEVEL_LOW
```

**Function:** Indicates the battery capacity level is low.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LEVEL_NORMAL

```cangjie
LEVEL_NORMAL
```

**Function:** Indicates the battery level is normal.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LEVEL_SHUTDOWN

```cangjie
LEVEL_SHUTDOWN
```

**Function:** Indicates the battery level is at shutdown threshold.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LEVEL_WARNING

```cangjie
LEVEL_WARNING
```

**Function:** Indicates the battery level is at warning threshold.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(BatteryCapacityLevel)

```cangjie
public operator func !=(other: BatteryCapacityLevel): Bool
```

**Function:** Checks inequality between battery capacity levels.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryCapacityLevel](#enum-batterycapacitylevel) | Yes | - | Battery capacity level. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if battery capacity levels differ, otherwise false. |

### func ==(BatteryCapacityLevel)

```cangjie
public operator func ==(other: BatteryCapacityLevel): Bool
```

**Function:** Checks equality between battery capacity levels.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryCapacityLevel](#enum-batterycapacitylevel) | Yes | - | Battery capacity level. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if battery capacity levels are identical, otherwise false. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Returns the string representation of battery capacity level.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | String corresponding to the battery capacity level value. |

## enum BatteryChargeState

```cangjie
public enum BatteryChargeState <: Equatable<BatteryChargeState> & ToString {
    | NONE
    | ENABLE
    | DISABLE
    | FULL
    | ...
}
```

**Function:** Represents battery charging states.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<BatteryChargeState>
- ToString

### DISABLE

```cangjie
DISABLE
```

**Function:** Indicates the battery charging state is disabled.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### ENABLE

```cangjie
ENABLE
```

**Function:** Indicates the battery charging state is enabled.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### FULL

```cangjie
FULL
```

**Function:** Indicates the battery is fully charged.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### NONE

```cangjie
NONE
```

**Function:** Indicates unknown battery charging state.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(BatteryChargeState)

```cangjie
public operator func !=(other: BatteryChargeState): Bool
```

**Function:** Checks inequality between battery charging states.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryChargeState](#enum-batterychargestate) | Yes | - | Battery charging state. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if charging states differ, otherwise false. |

### func ==(BatteryChargeState)

```cangjie
public operator func ==(other: BatteryChargeState): Bool
```

**Function:** Checks equality between battery charging states.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryChargeState](#enum-batterychargestate) | Yes | - | Battery charging state. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if charging states are identical, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Returns the string representation of battery charging state.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | String corresponding to the battery charging state value. |

## enum BatteryHealthState

```cangjie
public enum BatteryHealthState <: Equatable<BatteryHealthState> & ToString {
    | UNKNOWN
    | GOOD
    | OVERHEAT
    | OVERVOLTAGE
    | COLD
    | DEAD
    | ...
}
```

**Function:** Represents battery health states.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<BatteryHealthState>
- ToString

### COLD

```cangjie
COLD
```

**Function:** Indicates the battery health state is frozen.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### DEAD

```cangjie
DEAD
```

**Function:** Indicates the battery health state is normal.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### GOOD

```cangjie
GOOD
```

**Function:** Indicates the battery health state is overheating.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### OVERHEAT

```cangjie
OVERHEAT
```

**Function:** Indicates the battery health status is overheating.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### OVERVOLTAGE

```cangjie
OVERVOLTAGE
```

**Function:** Indicates the battery health status is overvoltage.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**Function:** Indicates the battery health status is unknown.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(BatteryHealthState)

```cangjie
public operator func !=(other: BatteryHealthState): Bool
```

**Function:** Determines inequality of battery health states.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryHealthState](#enum-batteryhealthstate) | Yes | - | Battery health state. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if battery health states differ, otherwise false. |

### func ==(BatteryHealthState)

```cangjie
public operator func ==(other: BatteryHealthState): Bool
```

**Function:** Determines equality of battery health states.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryHealthState](#enum-batteryhealthstate) | Yes | - | Battery health state. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if battery health states are identical, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Returns the string representation of the battery health state.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | String corresponding to the battery health state value. |

## enum BatteryPluggedType

```cangjie
public enum BatteryPluggedType <: Equatable<BatteryPluggedType> & ToString {
    | NONE
    | AC
    | USB
    | WIRELESS
    | ...
}
```

**Function:** Represents the type of connected charger.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<BatteryPluggedType>
- ToString

### AC

```cangjie
AC
```

**Function:** Indicates the connected charger type is AC charger.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### NONE

```cangjie
NONE
```

**Function:** Indicates no connected charger type was detected.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### USB

```cangjie
USB
```

**Function:** Indicates the connected charger type is USB.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### WIRELESS

```cangjie
WIRELESS
```

**Function:** Indicates the connected charger type is wireless charger.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(BatteryPluggedType)

```cangjie
public operator func !=(other: BatteryPluggedType): Bool
```

**Function:** Determines inequality of charger types.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryPluggedType](#enum-batterypluggedtype) | Yes | - | Charger type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if charger types differ, otherwise false. |

### func ==(BatteryPluggedType)

```cangjie
public operator func ==(other: BatteryPluggedType): Bool
```

**Function:** Determines equality of charger types.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryPluggedType](#enum-batterypluggedtype) | Yes | - | Charger type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if charger types are identical, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Returns the string representation of the charger type information.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | String corresponding to the charger type value. |

## enum CommonEventBatteryChangedKey

```cangjie
public enum CommonEventBatteryChangedKey <: Equatable<CommonEventBatteryChangedKey> & ToString {
    | EXTRA_SOC
    | EXTRA_CHARGE_STATE
    | EXTRA_HEALTH_STATE
    | EXTRA_PLUGGED_TYPE
    | EXTRA_VOLTAGE
    | EXTRA_TECHNOLOGY
    | EXTRA_TEMPERATURE
    | EXTRA_PRESENT
    | EXTRA_CAPACITY_LEVEL
    | ...
}
```

**Function:** Represents query keys for additional information in COMMON_EVENT_BATTERY_CHANGED common event.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<CommonEventBatteryChangedKey>
- ToString

### EXTRA_CAPACITY_LEVEL

```cangjie
EXTRA_CAPACITY_LEVEL
```

**Function:** Query key for current device battery capacity level.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### EXTRA_CHARGE_STATE

```cangjie
EXTRA_CHARGE_STATE
```

**Function:** Query key for current device battery charging state.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### EXTRA_HEALTH_STATE

```cangjie
EXTRA_HEALTH_STATE
```

**Function:** Query key for current device battery health state.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21
### EXTRA_PLUGGED_TYPE

```cangjie
EXTRA_PLUGGED_TYPE
```

**Function:** Query key indicating the type of charger currently connected to the device.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### EXTRA_PRESENT

```cangjie
EXTRA_PRESENT
```

**Function:** Query key indicating whether the device supports a battery or if the battery is currently present.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### EXTRA_SOC

```cangjie
EXTRA_SOC
```

**Function:** Query key indicating the remaining battery charge percentage.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### EXTRA_TECHNOLOGY

```cangjie
EXTRA_TECHNOLOGY
```

**Function:** Query key indicating the battery technology model of the current device.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### EXTRA_TEMPERATURE

```cangjie
EXTRA_TEMPERATURE
```

**Function:** Query key indicating the current battery temperature of the device.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### EXTRA_VOLTAGE

```cangjie
EXTRA_VOLTAGE
```

**Function:** Query key indicating the current battery voltage of the device.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(CommonEventBatteryChangedKey)

```cangjie
public operator func !=(other: CommonEventBatteryChangedKey): Bool 
```

**Function:** Performs inequality comparison on query keys for common event additional information.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CommonEventBatteryChangedKey](#enum-commoneventbatterychangedkey) | Yes | - | Query key for common event additional information. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the query keys are the same, otherwise returns false. |

### func ==(CommonEventBatteryChangedKey)

```cangjie
public operator func ==(other: CommonEventBatteryChangedKey): Bool
```

**Function:** Performs equality comparison on query keys for common event additional information.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CommonEventBatteryChangedKey](#enum-commoneventbatterychangedkey) | Yes | - | Query key for common event additional information. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the query keys are the same, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Returns the string representation of the query key for COMMON_EVENT_BATTERY_CHANGED common event additional information.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string corresponding to the query key for COMMON_EVENT_BATTERY_CHANGED common event additional information. |