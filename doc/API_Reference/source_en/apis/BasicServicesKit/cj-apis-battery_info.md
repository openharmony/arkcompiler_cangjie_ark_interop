# ohos.battery_info

This module primarily provides interfaces for querying battery status and charging/discharging states.

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

**Description:** A class that describes battery information.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop batteryCapacityLevel

```cangjie
public static prop batteryCapacityLevel: BatteryCapacityLevel
```

**Description:** Indicates the current battery level of the device.

**Type:** [BatteryCapacityLevel](#enum-batterycapacitylevel)

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop batterySOC

```cangjie
public static prop batterySOC: Int32
```

**Description:** Indicates the current remaining battery percentage of the device.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop batteryTemperature

```cangjie
public static prop batteryTemperature: Int32
```

**Description:** Indicates the current battery temperature of the device.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop chargingStatus

```cangjie
public static prop chargingStatus: BatteryChargeState
```

**Description:** Indicates the current charging state of the device's battery.

**Type:** [BatteryChargeState](#enum-batterychargestate)

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop healthStatus

```cangjie
public static prop healthStatus: BatteryHealthState
```

**Description:** Indicates the current health state of the device's battery.

**Type:** [BatteryHealthState](#enum-batteryhealthstate)

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop isBatteryPresent

```cangjie
public static prop isBatteryPresent: Bool
```

**Description:** Indicates whether the device supports a battery or if the battery is present.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop nowCurrent

```cangjie
public static prop nowCurrent: Int32
```

**Description:** Indicates the current battery current of the device.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop pluggedType

```cangjie
public static prop pluggedType: BatteryPluggedType
```

**Description:** Indicates the type of charger currently connected to the device.

**Type:** [BatteryPluggedType](#enum-batterypluggedtype)

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop technology

```cangjie
public static prop technology: String
```

**Description:** Indicates the technology model of the current device's battery.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### static prop voltage

```cangjie
public static prop voltage: Int32
```

**Description:** Indicates the current battery voltage of the device.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

## enum BatteryCapacityLevel

```cangjie
public enum BatteryCapacityLevel <: Equatable<BatteryCapacityLevel> & ToString {
    | LevelFull
    | LevelHigh
    | LevelNormal
    | LevelLow
    | LevelWarning
    | LevelCritical
    | LevelShutdown
    | ...
}
```

**Description:** Represents battery level states.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<BatteryCapacityLevel>
- ToString

### LevelCritical

```cangjie
LevelCritical
```

**Description:** Indicates the battery level is critically low.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LevelFull

```cangjie
LevelFull
```

**Description:** Indicates the battery level is full.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LevelHigh

```cangjie
LevelHigh
```

**Description:** Indicates the battery level is high.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LevelLow

```cangjie
LevelLow
```

**Description:** Indicates the battery level is low.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LevelNormal

```cangjie
LevelNormal
```

**Description:** Indicates the battery level is normal.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LevelShutdown

```cangjie
LevelShutdown
```

**Description:** Indicates the battery level is at shutdown threshold.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### LevelWarning

```cangjie
LevelWarning
```

**Description:** Indicates the battery level is at warning threshold.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(BatteryCapacityLevel)

```cangjie
public operator func !=(other: BatteryCapacityLevel): Bool
```

**Description:** Performs inequality comparison on battery levels.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryCapacityLevel](#enum-batterycapacitylevel) | Yes | - | Battery level to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if battery levels differ, otherwise false. |

### func ==(BatteryCapacityLevel)

```cangjie
public operator func ==(other: BatteryCapacityLevel): Bool
```

**Description:** Performs equality comparison on battery levels.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryCapacityLevel](#enum-batterycapacitylevel) | Yes | - | Battery level to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if battery levels are equal, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Returns the string representation of the battery level.

**Return Value:**

| Type | Description |
|:----|:----|
| String | String corresponding to the battery level value. |

## enum BatteryChargeState

```cangjie
public enum BatteryChargeState <: Equatable<BatteryChargeState> & ToString {
    | None
    | Enable
    | Disable
    | Full
    | ...
}
```

**Description:** Represents battery charging states.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<BatteryChargeState>
- ToString

### Disable

```cangjie
Disable
```

**Description:** Indicates the battery charging state is disabled.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Enable

```cangjie
Enable
```

**Description:** Indicates the battery charging state is enabled.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Full

```cangjie
Full
```

**Description:** Indicates the battery is fully charged.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### None

```cangjie
None
```

**Description:** Indicates the battery charging state is unknown.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(BatteryChargeState)

```cangjie
public operator func !=(other: BatteryChargeState): Bool
```

**Description:** Performs inequality comparison on battery charging states.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryChargeState](#enum-batterychargestate) | Yes | - | Battery charging state to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if charging states differ, otherwise false. |

### func ==(BatteryChargeState)

```cangjie
public operator func ==(other: BatteryChargeState): Bool
```

**Description:** Performs equality comparison on battery charging states.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BatteryChargeState](#enum-batterychargestate) | Yes | - | Battery charging state to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if charging states are equal, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Returns the string representation of the battery charging state.

**Return Value:**

| Type | Description |
|:----|:----|
| String | String corresponding to the battery charging state value. |## enum BatteryHealthState

```cangjie
public enum BatteryHealthState <: Equatable<BatteryHealthState> & ToString {
    | Unknown
    | Good
    | Overheat
    | Overvoltage
    | Cold
    | Dead
    | ...
}
```

**Function:** Represents battery health status.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<BatteryHealthState>
- ToString

### Cold

```cangjie
Cold
```

**Function:** Indicates the battery health status is cold.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Dead

```cangjie
Dead
```

**Function:** Indicates the battery health status is dead.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Good

```cangjie
Good
```

**Function:** Indicates the battery health status is normal.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Overheat

```cangjie
Overheat
```

**Function:** Indicates the battery health status is overheating.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Overvoltage

```cangjie
Overvoltage
```

**Function:** Indicates the battery health status is overvoltage.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Function:** Indicates the battery health status is unknown.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(BatteryHealthState)

```cangjie
public operator func !=(other: BatteryHealthState): Bool
```

**Function:** Checks inequality of battery health states.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[BatteryHealthState](#enum-batteryhealthstate)|Yes|-|Battery health state.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool| Returns true if battery health states are different, otherwise returns false.|

### func ==(BatteryHealthState)

```cangjie
public operator func ==(other: BatteryHealthState): Bool
```

**Function:** Checks equality of battery health states.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[BatteryHealthState](#enum-batteryhealthstate)|Yes|-|Battery health state.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool| Returns true if battery health states are identical, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Returns the string representation of battery health status.

**Return Value:**

|Type|Description|
|:----|:----|
|String| String corresponding to the battery health status value. |

## enum BatteryPluggedType

```cangjie
public enum BatteryPluggedType <: Equatable<BatteryPluggedType> & ToString {
    | None
    | Ac
    | Usb
    | Wireless
    | ...
}
```

**Function:** Represents the type of connected charger.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

**Parent Types:**

- Equatable\<BatteryPluggedType>
- ToString

### Ac

```cangjie
Ac
```

**Function:** Indicates the connected charger type is AC charger.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### None

```cangjie
None
```

**Function:** Indicates no connected charger type was detected.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Usb

```cangjie
Usb
```

**Function:** Indicates the connected charger type is USB.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### Wireless

```cangjie
Wireless
```

**Function:** Indicates the connected charger type is wireless charger.

**System Capability:** SystemCapability.PowerManager.BatteryManager.Core

**Since:** 21

### func !=(BatteryPluggedType)

```cangjie
public operator func !=(other: BatteryPluggedType): Bool
```

**Function:** Checks inequality of charger types.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[BatteryPluggedType](#enum-batterypluggedtype)|Yes|-|Charger type.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool| Returns true if charger types are different, otherwise returns false.|

### func ==(BatteryPluggedType)

```cangjie
public operator func ==(other: BatteryPluggedType): Bool
```

**Function:** Checks equality of charger types.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[BatteryPluggedType](#enum-batterypluggedtype)|Yes|-|Charger type.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool| Returns true if charger types are identical, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Returns the string representation of charger type information.

**Return Value:**

|Type|Description|
|:----|:----|
|String| String corresponding to the charger type value. |