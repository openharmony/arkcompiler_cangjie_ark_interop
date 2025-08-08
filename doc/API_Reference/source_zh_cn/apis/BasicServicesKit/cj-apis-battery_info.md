# ohos.battery_info（电量信息）

该模块主要提供电池状态和充放电状态的查询接口。

## 导入模块

```cangjie
import kit.BasicServicesKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## class BatteryInfo

```cangjie
public class BatteryInfo {}
```

**功能：** 描述电池信息的类。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**示例：**

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

**功能：** 表示当前设备电池电量的等级。

**类型：** [BatteryCapacityLevel](#enum-batterycapacitylevel)

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop batterySOC

```cangjie
public static prop batterySOC: Int32
```

**功能：** 表示当前设备剩余电池电量百分比。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop batteryTemperature

```cangjie
public static prop batteryTemperature: Int32
```

**功能：** 表示当前设备电池的温度。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop chargingStatus

```cangjie
public static prop chargingStatus: BatteryChargeState
```

**功能：** 表示当前设备电池的充电状态。

**类型：** [BatteryChargeState](#enum-batterychargestate)

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop healthStatus

```cangjie
public static prop healthStatus: BatteryHealthState
```

**功能：** 表示当前设备电池的健康状态。

**类型：** [BatteryHealthState](#enum-batteryhealthstate)

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop isBatteryPresent

```cangjie
public static prop isBatteryPresent: Bool
```

**功能：** 表示当前设备是否支持电池或者电池是否在位。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop nowCurrent

```cangjie
public static prop nowCurrent: Int32
```

**功能：** 表示当前设备电池的电流。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop pluggedType

```cangjie
public static prop pluggedType: BatteryPluggedType
```

**功能：** 表示当前设备连接的充电器类型。

**类型：** [BatteryPluggedType](#enum-batterypluggedtype)

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop technology

```cangjie
public static prop technology: String
```

**功能：** 表示当前设备电池的技术型号。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### static prop voltage

```cangjie
public static prop voltage: Int32
```

**功能：** 表示当前设备电池的电压。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

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

**功能：** 表示电池电量等级。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<BatteryCapacityLevel>
- ToString

### LEVEL_CRITICAL

```cangjie
LEVEL_CRITICAL
```

**功能：** 表示电池电量等级为极低电量。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### LEVEL_FULL

```cangjie
LEVEL_FULL
```

**功能：** 表示电池电量等级为满电量。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### LEVEL_HIGH

```cangjie
LEVEL_HIGH
```

**功能：** 表示电池电量等级为高电量。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### LEVEL_LOW

```cangjie
LEVEL_LOW
```

**功能：** 表示电池电量等级为低电量。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### LEVEL_NORMAL

```cangjie
LEVEL_NORMAL
```

**功能：** 表示电池电量等级为正常电量。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### LEVEL_SHUTDOWN

```cangjie
LEVEL_SHUTDOWN
```

**功能：** 表示电池电量等级为关机电量。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### LEVEL_WARNING

```cangjie
LEVEL_WARNING
```

**功能：** 表示电池电量等级为告警电量。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### func !=(BatteryCapacityLevel)

```cangjie
public operator func !=(other: BatteryCapacityLevel): Bool
```

**功能：** 对电池电量等级进行判不等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BatteryCapacityLevel](#enum-batterycapacitylevel)|是|-|电池电量等级。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果电池电量等级不同返回true，否则返回false。|

### func ==(BatteryCapacityLevel)

```cangjie
public operator func ==(other: BatteryCapacityLevel): Bool
```

**功能：** 对电池电量等级进行判等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BatteryCapacityLevel](#enum-batterycapacitylevel)|是|-|电池电量等级。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果电池电量等级相同返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 返回电池电量等级的字符串表示。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|电池电量等级值对应的字符串。|

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

**功能：** 表示电池充电状态。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<BatteryChargeState>
- ToString

### DISABLE

```cangjie
DISABLE
```

**功能：** 表示电池充电状态为停止状态。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### ENABLE

```cangjie
ENABLE
```

**功能：** 表示电池充电状态为使能状态。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### FULL

```cangjie
FULL
```

**功能：** 表示电池充电状态为已充满状态。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### NONE

```cangjie
NONE
```

**功能：** 表示电池充电状态未知。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### func !=(BatteryChargeState)

```cangjie
public operator func !=(other: BatteryChargeState): Bool
```

**功能：** 对电池充电状态进行判不等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BatteryChargeState](#enum-batterychargestate)|是|-|电池充电状态。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果电池充电状态不同返回true，否则返回false。|

### func ==(BatteryChargeState)

```cangjie
public operator func ==(other: BatteryChargeState): Bool
```

**功能：** 对电池充电状态进行判等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BatteryChargeState](#enum-batterychargestate)|是|-|电池充电状态。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果电池充电状态相同返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回电池充电状态的字符串表示。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|电池充电状态值对应的字符串。|

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

**功能：** 表示电池健康状态。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<BatteryHealthState>
- ToString

### COLD

```cangjie
COLD
```

**功能：** 表示电池健康状态为僵死状态。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### DEAD

```cangjie
DEAD
```

**功能：** 表示电池健康状态为正常。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### GOOD

```cangjie
GOOD
```

**功能：** 表示电池健康状态为过热。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### OVERHEAT

```cangjie
OVERHEAT
```

**功能：** 表示电池健康状态为过压。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### OVERVOLTAGE

```cangjie
OVERVOLTAGE
```

**功能：** 表示电池健康状态未知。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**功能：** 表示电池健康状态为低温。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### func !=(BatteryHealthState)

```cangjie
public operator func !=(other: BatteryHealthState): Bool
```

**功能：** 对电池健康状态进行判不等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BatteryHealthState](#enum-batteryhealthstate)|是|-|电池健康状态。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果电池健康状态不同返回true，否则返回false。|

### func ==(BatteryHealthState)

```cangjie
public operator func ==(other: BatteryHealthState): Bool
```

**功能：** 对电池健康状态进行判等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BatteryHealthState](#enum-batteryhealthstate)|是|-|电池健康状态。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果电池健康状态相同返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回电池健康状态的字符串表示。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|电池健康状态值对应的字符串。|

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

**功能：** 表示连接的充电器类型。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<BatteryPluggedType>
- ToString

### AC

```cangjie
AC
```

**功能：** 表示连接的充电器类型为交流充电器。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### NONE

```cangjie
NONE
```

**功能：** 表示未获取到连接充电器类型。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### USB

```cangjie
USB
```

**功能：** 表示连接的充电器类型为USB。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### WIRELESS

```cangjie
WIRELESS
```

**功能：** 表示连接的充电器类型为无线充电器。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### func !=(BatteryPluggedType)

```cangjie
public operator func !=(other: BatteryPluggedType): Bool
```

**功能：** 对充电器类型进行判不等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BatteryPluggedType](#enum-batterypluggedtype)|是|-|充电器类型。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果充电器类型不同返回true，否则返回false。|

### func ==(BatteryPluggedType)

```cangjie
public operator func ==(other: BatteryPluggedType): Bool
```

**功能：** 对充电器类型进行判等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BatteryPluggedType](#enum-batterypluggedtype)|是|-|充电器类型。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果充电器类型相同返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回充电器类型信息的字符串表示。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|充电器类型值对应的字符串。|

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

**功能：** 表示COMMON_EVENT_BATTERY_CHANGED通用事件附加信息的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<CommonEventBatteryChangedKey>
- ToString

### EXTRA_CAPACITY_LEVEL

```cangjie
EXTRA_CAPACITY_LEVEL
```

**功能：** 表示当前设备电池电量等级的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### EXTRA_CHARGE_STATE

```cangjie
EXTRA_CHARGE_STATE
```

**功能：** 表示当前设备电池充电状态的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### EXTRA_HEALTH_STATE

```cangjie
EXTRA_HEALTH_STATE
```

**功能：** 表示当前设备电池健康状态的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### EXTRA_PLUGGED_TYPE

```cangjie
EXTRA_PLUGGED_TYPE
```

**功能：** 表示当前设备连接的充电器类型的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### EXTRA_PRESENT

```cangjie
EXTRA_PRESENT
```

**功能：** 表示当前设备是否支持电池或者电池是否在位的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### EXTRA_SOC

```cangjie
EXTRA_SOC
```

**功能：** 表示剩余电池电量百分比的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### EXTRA_TECHNOLOGY

```cangjie
EXTRA_TECHNOLOGY
```

**功能：** 表示当前设备电池技术型号的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### EXTRA_TEMPERATURE

```cangjie
EXTRA_TEMPERATURE
```

**功能：** 表示当前设备电池温度的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### EXTRA_VOLTAGE

```cangjie
EXTRA_VOLTAGE
```

**功能：** 表示当前设备电池电压的查询键。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

### func !=(CommonEventBatteryChangedKey)

```cangjie
public operator func !=(other: CommonEventBatteryChangedKey): Bool 
```

**功能：** 对通用事件附加信息的查询键进行判不等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CommonEventBatteryChangedKey](#enum-commoneventbatterychangedkey)|是|-|通用事件附加信息的查询键。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果查询键相同返回true，否则返回false。|

### func ==(CommonEventBatteryChangedKey)

```cangjie
public operator func ==(other: CommonEventBatteryChangedKey): Bool
```

**功能：** 对通用事件附加信息的查询键进行判等。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CommonEventBatteryChangedKey](#enum-commoneventbatterychangedkey)|是|-|通用事件附加信息的查询键。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果查询键相同返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回COMMON_EVENT_BATTERY_CHANGED通用事件附加信息的查询键的字符串表示。

**系统能力：** SystemCapability.PowerManager.BatteryManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|COMMON_EVENT_BATTERY_CHANGED通用事件附加信息的查询键对应的字符串。|
