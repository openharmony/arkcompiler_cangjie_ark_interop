# ohos.sensor（传感器）

sensor模块提供了获取传感器数据的能力，包括获取传感器属性列表，订阅传感器数据，以及一些通用的传感器算法。

## 导入模块

```cangjie
import kit.SensorServiceKit.*
```

## 权限列表

ohos.permission.ACCELEROMETER

ohos.permission.GYROSCOPE

ohos.permission.READ_HEALTH_DATA

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func getSensorList()

```cangjie
public func getSensorList(): Array<Sensor>
```

**功能：** 获取设备上的所有传感器信息。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[Sensor](#class-sensor)>|返回传感器属性列表。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[传感器错误码](../../errorcodes/cj-errorcode-sensor.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 14500101 | Service exception. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.SensorServiceKit.*
import ohos.base.*

try {
    let sensors = getSensorList()
    for (index in 0..sensors.size) {
        AppLog.info("Succeeded in getting sensor${index}: ${sensors[index].sensorId} ")
    }
} catch (e: BusinessException) {
    AppLog.error("Failed to get sensor list. Code: ${e.code}, message: ${e.message}")
}
```

## func getSingleSensor(SensorId)

```cangjie
public func getSingleSensor(`type`: SensorId): Sensor
```

**功能：** 获取指定类型的传感器信息。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[SensorId](#enum-sensorid)|是|-|传感器类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[Sensor](#class-sensor)|返回传感器信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[传感器错误码](../../errorcodes/cj-errorcode-sensor.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 14500101 | Service exception. |
| 14500102 | The sensor is not supported by the device. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.SensorServiceKit.*
import ohos.base.*

try {
    let sensors = getSingleSensor(SensorId.ACCELEROMETER)
    AppLog.info("Succeeded in getting sensor: ${sensors.sensorName} ")
} catch (e: BusinessException) {
    AppLog.error("Failed to get sensor. Code: ${e.code}, message: ${e.message}")
}
```

## class Response

```cangjie
public abstract class Response {
    public Response(
        public var timestamp: Int64,
        public var accuracy: SensorAccuracy
    )
}
```

**功能：** 传感器数据的时间戳。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var accuracy

```cangjie
public var accuracy: SensorAccuracy
```

**功能：** 传感器数据上报的精度档位值。

**类型：** [SensorAccuracy](#enum-sensoraccuracy)

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var timestamp

```cangjie
public var timestamp: Int64
```

**功能：** 传感器数据上报的时间戳。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Response(Int64, SensorAccuracy)

```cangjie
public Response(
    public var timestamp: Int64,
    public var accuracy: SensorAccuracy
)
```

**功能：** 构造加速度传感器数据。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|timestamp|Int64|否|-|传感器数据上报的时间戳。|
|accuracy|[SensorAccuracy](#enum-sensoraccuracy)|否|-|传感器数据上报的精度档位值。|

## class RotationVectorResponse

```cangjie
public class RotationVectorResponse <: Response {
    public RotationVectorResponse(
        public var x: Float32,
        public var y: Float32,
        public var z: Float32,
        public var w: Float32
    )
}
```

**功能：** 旋转矢量传感器数据，继承自[Response](#class-response)。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**父类型：**

- [Response](#class-response)

### var w

```cangjie
public var w: Float32
```

**功能：** 标量。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var x

```cangjie
public var x: Float32
```

**功能：** 旋转矢量x轴分量。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var y

```cangjie
public var y: Float32
```

**功能：** 旋转矢量y轴分量。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var z

```cangjie
public var z: Float32
```

**功能：** 旋转矢量z轴分量。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### RotationVectorResponse(Float32, Float32, Float32, Float32)

```cangjie
public RotationVectorResponse(
    public var x: Float32,
    public var y: Float32,
    public var z: Float32,
    public var w: Float32
)
```

**功能：** 构造旋转矢量传感器数据。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|否|-|旋转矢量x轴分量。|
|y|Float32|否|-|旋转矢量y轴分量。|
|z|Float32|否|-|旋转矢量z轴分量。|
|w|Float32|否|-|标量。|

## class Sensor

```cangjie
public class Sensor {
    public Sensor(
        public var sensorName: String,
        public var vendorName: String,
        public var firmwareVersion: String,
        public var hardwareVersion: String,
        public var sensorId: SensorId,
        public var maxRange: Float32,
        public var minSamplePeriod: Int64,
        public var maxSamplePeriod: Int64,
        public var precision: Float32,
        public var power: Float32
    )
}
```

**功能：** 指示传感器信息。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var firmwareVersion

```cangjie
public var firmwareVersion: String
```

**功能：** 传感器固件版本。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var hardwareVersion

```cangjie
public var hardwareVersion: String
```

**功能：** 传感器硬件版本。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var maxRange

```cangjie
public var maxRange: Float32
```

**功能：** 传感器测量范围的最大值。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var maxSamplePeriod

```cangjie
public var maxSamplePeriod: Int64
```

**功能：** 允许的最大采样周期。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var minSamplePeriod

```cangjie
public var minSamplePeriod: Int64
```

**功能：** 允许的最小采样周期。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var power

```cangjie
public var power: Float32
```

**功能：** 传感器功率的估计值，单位：mA。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var precision

```cangjie
public var precision: Float32
```

**功能：** 传感器精度。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var sensorId

```cangjie
public var sensorId: SensorId
```

**功能：** 传感器类型id。

**类型：** [SensorId](#enum-sensorid)

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var sensorName

```cangjie
public var sensorName: String
```

**功能：** 传感器名称。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### var vendorName

```cangjie
public var vendorName: String
```

**功能：** 传感器供应商。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Sensor(String, String, String, String, SensorId, Float32, Int64, Int64, Float32, Float32)

```cangjie
public Sensor(
    public var sensorName: String,
    public var vendorName: String,
    public var firmwareVersion: String,
    public var hardwareVersion: String,
    public var sensorId: SensorId,
    public var maxRange: Float32,
    public var minSamplePeriod: Int64,
    public var maxSamplePeriod: Int64,
    public var precision: Float32,
    public var power: Float32
)
```

**功能：** 指示传感器信息。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sensorName|String|否|-|传感器名称。|
|vendorName|String|否|-|传感器供应商。|
|firmwareVersion|String|否|-|传感器固件版本。|
|hardwareVersion|String|否|-|传感器硬件版本。|
|sensorId|[SensorId](#enum-sensorid)|否|-|传感器类型id。|
|maxRange|Float32|否|-|传感器测量范围的最大值。|
|minSamplePeriod|Int64|否|-|允许的最小采样周期。|
|maxSamplePeriod|Int64|否|-|允许的最大采样周期。|
|precision|Float32|否|-|传感器精度。|
|power|Float32|否|-|传感器功率的估计值，单位：mA。|

## enum SensorAccuracy

```cangjie
public enum SensorAccuracy <: Equatable<SensorAccuracy> & ToString {
    | ACCURACY_UNRELIABLE
    | ACCURACY_LOW
    | ACCURACY_MEDIUM
    | ACCURACY_HIGH
    | ...
}
```

**功能：** 传感器数据的精度。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**父类型：**

- Equatable\<SensorAccuracy>
- ToString

### ACCURACY_HIGH

```cangjie
ACCURACY_HIGH
```

**功能：** 传感器高档位精度。

**起始版本：** 21

### ACCURACY_LOW

```cangjie
ACCURACY_LOW
```

**功能：** 传感器低档位精度。

**起始版本：** 21

### ACCURACY_MEDIUM

```cangjie
ACCURACY_MEDIUM
```

**功能：** 传感器中档位精度。

**起始版本：** 21

### ACCURACY_UNRELIABLE

```cangjie
ACCURACY_UNRELIABLE
```

**功能：** 传感器数据不可信。

**起始版本：** 21

### func !=(SensorAccuracy)

```cangjie
public operator func !=(other: SensorAccuracy): Bool
```

**功能：** 判断两个[SensorAccuracy](#enum-sensoraccuracy) 是否不相等。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SensorAccuracy](#enum-sensoraccuracy)|是|-|传入的[SensorAccuracy](#enum-sensoraccuracy)。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果不相等，则返回true；否则，返回false。|

### func ==(SensorAccuracy)

```cangjie
public operator func ==(other: SensorAccuracy): Bool
```

**功能：** 判断两个[SensorAccuracy](#enum-sensoraccuracy) 是否相等。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SensorAccuracy](#enum-sensoraccuracy)|是|-|传入的[SensorAccuracy](#enum-sensoraccuracy)。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果相等，则返回true；否则，返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 将枚举值转换为字符串。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|转换后的字符串。|

## enum SensorId

```cangjie
public enum SensorId <: Equatable<SensorId> & ToString {
    | ACCELEROMETER
    | GYROSCOPE
    | AMBIENT_LIGHT
    | MAGNETIC_FIELD
    | BAROMETER
    | HALL
    | PROXIMITY
    | HUMIDITY
    | ORIENTATION
    | GRAVITY
    | LINEAR_ACCELEROMETER
    | ROTATION_VECTOR
    | AMBIENT_TEMPERATURE
    | MAGNETIC_FIELD_UNCALIBRATED
    | GYROSCOPE_UNCALIBRATED
    | SIGNIFICANT_MOTION
    | PEDOMETER_DETECTION
    | PEDOMETER
    | HEART_RATE
    | WEAR_DETECTION
    | ACCELEROMETER_UNCALIBRATED
    | UNSUPPORTED
    | ...
}
```

**功能：** 表示当前支持订阅或取消订阅的传感器类型。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**父类型：**

- Equatable\<SensorId>
- ToString

### ACCELEROMETER

```cangjie
ACCELEROMETER
```

**功能：** 加速度传感器。

**起始版本：** 21

### ACCELEROMETER_UNCALIBRATED

```cangjie
ACCELEROMETER_UNCALIBRATED
```

**功能：** 未校准加速度计传感器。

**起始版本：** 21

### AMBIENT_LIGHT

```cangjie
AMBIENT_LIGHT
```

**功能：** 环境光传感器。

**起始版本：** 21

### AMBIENT_TEMPERATURE

```cangjie
AMBIENT_TEMPERATURE
```

**功能：** 环境温度传感器。

**起始版本：** 21

### BAROMETER

```cangjie
BAROMETER
```

**功能：** 气压计传感器。

**起始版本：** 21

### GRAVITY

```cangjie
GRAVITY
```

**功能：** 重力传感器。

**起始版本：** 21

### GYROSCOPE

```cangjie
GYROSCOPE
```

**功能：** 陀螺仪传感器。

**起始版本：** 21

### GYROSCOPE_UNCALIBRATED

```cangjie
GYROSCOPE_UNCALIBRATED
```

**功能：** 未校准陀螺仪传感器。

**起始版本：** 21

### HALL

```cangjie
HALL
```

**功能：** 霍尔传感器。

**起始版本：** 21

### HEART_RATE

```cangjie
HEART_RATE
```

**功能：** 心率传感器。

**起始版本：** 21

### HUMIDITY

```cangjie
HUMIDITY
```

**功能：** 湿度传感器。

**起始版本：** 21

### LINEAR_ACCELEROMETER

```cangjie
LINEAR_ACCELEROMETER
```

**功能：** 线性加速度传感器。

**起始版本：** 21

### MAGNETIC_FIELD

```cangjie
MAGNETIC_FIELD
```

**功能：** 磁场传感器。

**起始版本：** 21

### MAGNETIC_FIELD_UNCALIBRATED

```cangjie
MAGNETIC_FIELD_UNCALIBRATED
```

**功能：** 未校准磁场传感器。

**起始版本：** 21

### ORIENTATION

```cangjie
ORIENTATION
```

**功能：** 方向传感器。

**起始版本：** 21

### PEDOMETER

```cangjie
PEDOMETER
```

**功能：** 计步传感器。

**起始版本：** 21

### PEDOMETER_DETECTION

```cangjie
PEDOMETER_DETECTION
```

**功能：** 计步检测传感器。

**起始版本：** 21

### PROXIMITY

```cangjie
PROXIMITY
```

**功能：** 接近光传感器。

**起始版本：** 21

### ROTATION_VECTOR

```cangjie
ROTATION_VECTOR
```

**功能：** 旋转矢量传感器。

**起始版本：** 21

### SIGNIFICANT_MOTION

```cangjie
SIGNIFICANT_MOTION
```

**功能：** 有效运动传感器。

**起始版本：** 21

### UNSUPPORTED

```cangjie
UNSUPPORTED
```

**功能：** 未支持的传感器类型。

**起始版本：** 21

### WEAR_DETECTION

```cangjie
WEAR_DETECTION
```

**功能：** 佩戴检测传感器。

**起始版本：** 21

### func !=(SensorId)

```cangjie
public operator func !=(other: SensorId): Bool
```

**功能：** 判断两个[SensorId](#enum-sensorid) 是否不相等。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SensorId](#enum-sensorid)|是|-|传入的[SensorId](#enum-sensorid)。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果不相等，则返回true；否则，返回false。|

### func ==(SensorId)

```cangjie
public operator func ==(other: SensorId): Bool
```

**功能：** 判断两个[SensorId](#enum-sensorid) 是否相等。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SensorId](#enum-sensorid)|是|-|传入的[SensorId](#enum-sensorid)。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果相等，则返回true；否则，返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 将枚举值转换为字符串。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|转换后的字符串。|