# ohos.sensor

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

- BusinessException：对应错误码如下表，详见[传感器错误码](../../errorcodes/cj-errorcode-sensor.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 14500101 | Service exception. Possible causes: 1. Sensor hdf service exception;
2. Sensor service ipc exception;3. Sensor data channel exception.
 |

## func getSingleSensor(SensorId)

```cangjie

public func getSingleSensor(sensorType: SensorId): Sensor
```

**功能：** 获取指定类型的传感器信息。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sensorType|[SensorId](#enum-sensorid)|是|-|传感器类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[Sensor](#class-sensor)|返回传感器信息。|

**异常：**

- BusinessException：对应错误码如下表，详见[传感器错误码](../../errorcodes/cj-errorcode-sensor.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 14500101 | Service exception. Possible causes: 1. Sensor hdf service exception;
 2. Sensor service ipc exception;3. Sensor data channel exception.
 |
  | 14500102 | The sensor is not supported by the device.
 |

## class Response

```cangjie
public open class Response {
    public var timestamp: Int64
    public var accuracy: SensorAccuracy
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

## class RotationVectorResponse

```cangjie
public class RotationVectorResponse <: Response {
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public var w: Float32
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

## class Sensor

```cangjie
public class Sensor {
    public var sensorName: String
    public var vendorName: String
    public var firmwareVersion: String
    public var hardwareVersion: String
    public var sensorId: SensorId
    public var maxRange: Float32
    public var minSamplePeriod: Int64
    public var maxSamplePeriod: Int64
    public var precision: Float32
    public var power: Float32
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

## enum SensorAccuracy

```cangjie
public enum SensorAccuracy <: Equatable<SensorAccuracy> & ToString {
    | AccuracyUnreliable
    | AccuracyLow
    | AccuracyMedium
    | AccuracyHigh
    | ...
}
```

**功能：** 传感器数据的精度。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**父类型：**

- Equatable\<SensorAccuracy>
- ToString

### AccuracyHigh

```cangjie
AccuracyHigh
```

**功能：** 传感器高档位精度。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### AccuracyLow

```cangjie
AccuracyLow
```

**功能：** 传感器低档位精度。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### AccuracyMedium

```cangjie
AccuracyMedium
```

**功能：** 传感器中档位精度。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### AccuracyUnreliable

```cangjie
AccuracyUnreliable
```

**功能：** 传感器数据不可信。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### func !=(SensorAccuracy)

```cangjie
public operator func !=(other: SensorAccuracy): Bool
```

**功能：** 判断两个[SensorAccuracy](#enum-sensoraccuracy) 是否不相等。

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

**返回值：**

|类型|说明|
|:----|:----|
|String|转换后的字符串。|

## enum SensorId

```cangjie
public enum SensorId <: Equatable<SensorId> & ToString {
    | Accelerometer
    | Gyroscope
    | AmbientLight
    | MagneticField
    | Barometer
    | Hall
    | Proximity
    | Humidity
    | Orientation
    | Gravity
    | LinearAccelerometer
    | RotationVector
    | AmbientTemperature
    | MagneticFieldUncalibrated
    | GyroscopeUncalibrated
    | SignificantMotion
    | PedometerDetection
    | Pedometer
    | HeartRate
    | WearDetection
    | AccelerometerUncalibrated
    | ...
}
```

**功能：** 表示当前支持订阅或取消订阅的传感器类型。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

**父类型：**

- Equatable\<SensorId>
- ToString

### Accelerometer

```cangjie
Accelerometer
```

**功能：** 加速度传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### AccelerometerUncalibrated

```cangjie
AccelerometerUncalibrated
```

**功能：** 未校准加速度计传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### AmbientLight

```cangjie
AmbientLight
```

**功能：** 环境光传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### AmbientTemperature

```cangjie
AmbientTemperature
```

**功能：** 环境温度传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Barometer

```cangjie
Barometer
```

**功能：** 气压计传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Gravity

```cangjie
Gravity
```

**功能：** 重力传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Gyroscope

```cangjie
Gyroscope
```

**功能：** 陀螺仪传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### GyroscopeUncalibrated

```cangjie
GyroscopeUncalibrated
```

**功能：** 未校准陀螺仪传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Hall

```cangjie
Hall
```

**功能：** 霍尔传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### HeartRate

```cangjie
HeartRate
```

**功能：** 心率传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Humidity

```cangjie
Humidity
```

**功能：** 湿度传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### LinearAccelerometer

```cangjie
LinearAccelerometer
```

**功能：** 线性加速度传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### MagneticField

```cangjie
MagneticField
```

**功能：** 磁场传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### MagneticFieldUncalibrated

```cangjie
MagneticFieldUncalibrated
```

**功能：** 未校准磁场传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Orientation

```cangjie
Orientation
```

**功能：** 方向传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Pedometer

```cangjie
Pedometer
```

**功能：** 计步传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### PedometerDetection

```cangjie
PedometerDetection
```

**功能：** 计步检测传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### Proximity

```cangjie
Proximity
```

**功能：** 接近光传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### RotationVector

```cangjie
RotationVector
```

**功能：** 旋转矢量传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### SignificantMotion

```cangjie
SignificantMotion
```

**功能：** 有效运动传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### WearDetection

```cangjie
WearDetection
```

**功能：** 佩戴检测传感器。

**系统能力：** SystemCapability.Sensors.Sensor

**起始版本：** 21

### func !=(SensorId)

```cangjie
public operator func !=(other: SensorId): Bool
```

**功能：** 判断两个[SensorId](#enum-sensorid) 是否不相等。

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

**返回值：**

|类型|说明|
|:----|:----|
|String|转换后的字符串。|
