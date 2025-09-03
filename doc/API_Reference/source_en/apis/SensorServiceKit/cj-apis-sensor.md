# ohos.sensor

The sensor module provides capabilities for obtaining sensor data, including retrieving sensor attribute lists, subscribing to sensor data, and some common sensor algorithms.

## Importing the Module

```cangjie
import kit.SensorServiceKit.*
```

## Permission List

ohos.permission.ACCELEROMETER

ohos.permission.GYROSCOPE

ohos.permission.READ_HEALTH_DATA

## Usage Instructions

API sample code usage instructions:

- If the sample code has a "// index.cj" comment in the first line, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above sample projects and configuration templates, please refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## func getSensorList()

```cangjie
public func getSensorList(): Array<Sensor>
```

**Function:** Retrieves all sensor information on the device.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Array\<[Sensor](#class-sensor)> | Returns the list of sensor attributes. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Sensor Error Codes](../../errorcodes/cj-errorcode-sensor.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 14500101 | Service exception. Possible causes: 1. Sensor hdf service exception;
2. Sensor service ipc exception;3. Sensor data channel exception.
 |

## func getSingleSensor(SensorId)

```cangjie
public func getSingleSensor(sensorType: SensorId): Sensor
```

**Function:** Retrieves information about a specified type of sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| sensorType | [SensorId](#enum-sensorid) | Yes | - | The type of sensor. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [Sensor](#class-sensor) | Returns the sensor information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Sensor Error Codes](../../errorcodes/cj-errorcode-sensor.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
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

**Function:** The timestamp of sensor data.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var accuracy

```cangjie
public var accuracy: SensorAccuracy
```

**Function:** The accuracy level value reported by the sensor data.

**Type:** [SensorAccuracy](#enum-sensoraccuracy)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var timestamp

```cangjie
public var timestamp: Int64
```

**Function:** The timestamp when the sensor data is reported.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

## class RotationVectorResponse

```cangjie
public class RotationVectorResponse <: Response {
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public var w: Float32
}
```

**Function:** Rotation vector sensor data, inherits from [Response](#class-response).

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

**Parent Type:**

- [Response](#class-response)

### var w

```cangjie
public var w: Float32
```

**Function:** The scalar component.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var x

```cangjie
public var x: Float32
```

**Function:** The x-axis component of the rotation vector.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var y

```cangjie
public var y: Float32
```

**Function:** The y-axis component of the rotation vector.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var z

```cangjie
public var z: Float32
```

**Function:** The z-axis component of the rotation vector.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

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

**Function:** Indicates sensor information.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var firmwareVersion

```cangjie
public var firmwareVersion: String
```

**Function:** The firmware version of the sensor.

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var hardwareVersion

```cangjie
public var hardwareVersion: String
```

**Function:** The hardware version of the sensor.

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var maxRange

```cangjie
public var maxRange: Float32
```

**Function:** The maximum value of the sensor's measurement range.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var maxSamplePeriod

```cangjie
public var maxSamplePeriod: Int64
```

**Function:** The maximum allowed sampling period.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var minSamplePeriod

```cangjie
public var minSamplePeriod: Int64
```

**Function:** The minimum allowed sampling period.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var power

```cangjie
public var power: Float32
```

**Function:** The estimated power consumption of the sensor, in mA.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var precision

```cangjie
public var precision: Float32
```

**Function:** The precision of the sensor.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var sensorId

```cangjie
public var sensorId: SensorId
```

**Function:** The type ID of the sensor.

**Type:** [SensorId](#enum-sensorid)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var sensorName

```cangjie
public var sensorName: String
```

**Function:** The name of the sensor.

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21

### var vendorName

```cangjie
public var vendorName: String
```

**Function:** The vendor of the sensor.

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Version:** 21## enum SensorAccuracy

```cangjie
public enum SensorAccuracy <: Equatable<SensorAccuracy> & ToString {
    | AccuracyUnreliable
    | AccuracyLow
    | AccuracyMedium
    | AccuracyHigh
    | ...
}
```

**Function:** Accuracy level of sensor data.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

**Parent Types:**

- Equatable\<SensorAccuracy>
- ToString

### AccuracyHigh

```cangjie
AccuracyHigh
```

**Function:** High-grade sensor accuracy.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### AccuracyLow

```cangjie
AccuracyLow
```

**Function:** Low-grade sensor accuracy.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### AccuracyMedium

```cangjie
AccuracyMedium
```

**Function:** Medium-grade sensor accuracy.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### AccuracyUnreliable

```cangjie
AccuracyUnreliable
```

**Function:** Unreliable sensor data.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### func !=(SensorAccuracy)

```cangjie
public operator func !=(other: SensorAccuracy): Bool
```

**Function:** Determines whether two [SensorAccuracy](#enum-sensoraccuracy) values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [SensorAccuracy](#enum-sensoraccuracy) | Yes | - | Input [SensorAccuracy](#enum-sensoraccuracy). |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if unequal; otherwise, returns false. |

### func ==(SensorAccuracy)

```cangjie
public operator func ==(other: SensorAccuracy): Bool
```

**Function:** Determines whether two [SensorAccuracy](#enum-sensoraccuracy) values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [SensorAccuracy](#enum-sensoraccuracy) | Yes | - | Input [SensorAccuracy](#enum-sensoraccuracy). |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if equal; otherwise, returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Converts the enum value to a string.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The converted string. |

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

**Function:** Represents the currently supported sensor types for subscription or unsubscription.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

**Parent Types:**

- Equatable\<SensorId>
- ToString

### Accelerometer

```cangjie
Accelerometer
```

**Function:** Accelerometer sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### AccelerometerUncalibrated

```cangjie
AccelerometerUncalibrated
```

**Function:** Uncalibrated accelerometer sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### AmbientLight

```cangjie
AmbientLight
```

**Function:** Ambient light sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### AmbientTemperature

```cangjie
AmbientTemperature
```

**Function:** Ambient temperature sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### Barometer

```cangjie
Barometer
```

**Function:** Barometer sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### Gravity

```cangjie
Gravity
```

**Function:** Gravity sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### Gyroscope

```cangjie
Gyroscope
```

**Function:** Gyroscope sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### GyroscopeUncalibrated

```cangjie
GyroscopeUncalibrated
```

**Function:** Uncalibrated gyroscope sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### Hall

```cangjie
Hall
```

**Function:** Hall sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### HeartRate

```cangjie
HeartRate
```

**Function:** Heart rate sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### Humidity

```cangjie
Humidity
```

**Function:** Humidity sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### LinearAccelerometer

```cangjie
LinearAccelerometer
```

**Function:** Linear accelerometer sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### MagneticField

```cangjie
MagneticField
```

**Function:** Magnetic field sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### MagneticFieldUncalibrated

```cangjie
MagneticFieldUncalibrated
```

**Function:** Uncalibrated magnetic field sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### Orientation

```cangjie
Orientation
```

**Function:** Orientation sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### Pedometer

```cangjie
Pedometer
```

**Function:** Pedometer sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### PedometerDetection

```cangjie
PedometerDetection
```

**Function:** Pedometer detection sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### Proximity

```cangjie
Proximity
```

**Function:** Proximity light sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### RotationVector

```cangjie
RotationVector
```

**Function:** Rotation vector sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### SignificantMotion

```cangjie
SignificantMotion
```

**Function:** Significant motion sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21### WearDetection

```cangjie
WearDetection
```

**Function:** Wear detection sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### func !=(SensorId)

```cangjie
public operator func !=(other: SensorId): Bool
```

**Function:** Determines whether two [SensorId](#enum-sensorid) values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [SensorId](#enum-sensorid) | Yes | - | The input [SensorId](#enum-sensorid). |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if not equal; otherwise, returns `false`. |

### func ==(SensorId)

```cangjie
public operator func ==(other: SensorId): Bool
```

**Function:** Determines whether two [SensorId](#enum-sensorid) values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [SensorId](#enum-sensorid) | Yes | - | The input [SensorId](#enum-sensorid). |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Converts the enum value to a string.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The converted string. |