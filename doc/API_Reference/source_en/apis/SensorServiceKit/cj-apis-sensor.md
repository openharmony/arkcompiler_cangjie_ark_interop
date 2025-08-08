# ohos.sensor (Sensors)

The sensor module provides capabilities for obtaining sensor data, including retrieving sensor attribute lists, subscribing to sensor data, and some common sensor algorithms.

## Import Module

```cangjie
import kit.SensorServiceKit.*
```

## Permission List

ohos.permission.ACCELEROMETER

ohos.permission.GYROSCOPE

ohos.permission.READ_HEALTH_DATA

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the above sample projects and configuration templates, refer to [Cangjie Sample Code Description](../../cj-development-intro.md#仓颉示例代码说明).

## func getSensorList()

```cangjie
public func getSensorList(): Array<Sensor>
```

**Function:** Obtains all sensor information on the device.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Array\<[Sensor](#class-sensor)> | Returns the sensor attribute list. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Sensor Error Codes](../../errorcodes/cj-errorcode-sensor.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 14500101 | Service exception. |

**Example:**

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

**Function:** Obtains information about a specified type of sensor.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| \`type\` | [SensorId](#enum-sensorid) | Yes | - | Sensor type. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [Sensor](#class-sensor) | Returns the sensor information. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Sensor Error Codes](../../errorcodes/cj-errorcode-sensor.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 14500101 | Service exception. |
| 14500102 | The sensor is not supported by the device. |

**Example:**

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

**Function:** Timestamp of sensor data.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

### var accuracy

```cangjie
public var accuracy: SensorAccuracy
```

**Function:** Accuracy level value reported by the sensor data.

**Type:** [SensorAccuracy](#enum-sensoraccuracy)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

### var timestamp

```cangjie
public var timestamp: Int64
```

**Function:** Timestamp reported by the sensor data.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

### Response(Int64, SensorAccuracy)

```cangjie
public Response(
    public var timestamp: Int64,
    public var accuracy: SensorAccuracy
)
```

**Function:** Constructs acceleration sensor data.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| timestamp | Int64 | No | - | Timestamp reported by the sensor data. |
| accuracy | [SensorAccuracy](#enum-sensoraccuracy) | No | - | Accuracy level value reported by the sensor data. |

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

**Function:** Rotation vector sensor data, inherits from [Response](#class-response).

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

**Parent Type:**

- [Response](#class-response)

### var w

```cangjie
public var w: Float32
```

**Function:** Scalar.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

### var x

```cangjie
public var x: Float32
```

**Function:** X-axis component of the rotation vector.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

### var y

```cangjie
public var y: Float32
```

**Function:** Y-axis component of the rotation vector.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

### var z

```cangjie
public var z: Float32
```

**Function:** Z-axis component of the rotation vector.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21

### RotationVectorResponse(Float32, Float32, Float32, Float32)

```cangjie
public RotationVectorResponse(
    public var x: Float32,
    public var y: Float32,
    public var z: Float32,
    public var w: Float32
)
```

**Function:** Constructs rotation vector sensor data.

**System Capability:** SystemCapability.Sensors.Sensor

**Initial Release Version:** 21**Parameters:**

| Parameter Name | Type    | Required | Default Value | Description                     |
|:---------------|:--------|:---------|:--------------|:--------------------------------|
| x              | Float32 | No       | -             | X-axis component of rotation vector. |
| y              | Float32 | No       | -             | Y-axis component of rotation vector. |
| z              | Float32 | No       | -             | Z-axis component of rotation vector. |
| w              | Float32 | No       | -             | Scalar value.                   |

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

**Function:** Indicates sensor information.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var firmwareVersion

```cangjie
public var firmwareVersion: String
```

**Function:** Firmware version of the sensor.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var hardwareVersion

```cangjie
public var hardwareVersion: String
```

**Function:** Hardware version of the sensor.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var maxRange

```cangjie
public var maxRange: Float32
```

**Function:** Maximum measurement range of the sensor.

**Type:** Float32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var maxSamplePeriod

```cangjie
public var maxSamplePeriod: Int64
```

**Function:** Maximum allowed sampling period.

**Type:** Int64

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var minSamplePeriod

```cangjie
public var minSamplePeriod: Int64
```

**Function:** Minimum allowed sampling period.

**Type:** Int64

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var power

```cangjie
public var power: Float32
```

**Function:** Estimated power consumption of the sensor, in mA.

**Type:** Float32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var precision

```cangjie
public var precision: Float32
```

**Function:** Precision of the sensor.

**Type:** Float32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var sensorId

```cangjie
public var sensorId: SensorId
```

**Function:** Type ID of the sensor.

**Type:** [SensorId](#enum-sensorid)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var sensorName

```cangjie
public var sensorName: String
```

**Function:** Name of the sensor.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

### var vendorName

```cangjie
public var vendorName: String
```

**Function:** Vendor of the sensor.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

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

**Function:** Indicates sensor information.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

**Parameters:**

| Parameter Name    | Type                  | Required | Default Value | Description                     |
|:------------------|:----------------------|:---------|:--------------|:--------------------------------|
| sensorName        | String                | No       | -             | Name of the sensor.             |
| vendorName        | String                | No       | -             | Vendor of the sensor.           |
| firmwareVersion   | String                | No       | -             | Firmware version of the sensor. |
| hardwareVersion   | String                | No       | -             | Hardware version of the sensor. |
| sensorId          | [SensorId](#enum-sensorid) | No       | -             | Type ID of the sensor.          |
| maxRange          | Float32               | No       | -             | Maximum measurement range of the sensor. |
| minSamplePeriod   | Int64                 | No       | -             | Minimum allowed sampling period. |
| maxSamplePeriod   | Int64                 | No       | -             | Maximum allowed sampling period. |
| precision         | Float32               | No       | -             | Precision of the sensor.        |
| power             | Float32               | No       | -             | Estimated power consumption of the sensor, in mA. |

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

**Function:** Accuracy of sensor data.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

**Parent Types:**

- Equatable\<SensorAccuracy>
- ToString

### ACCURACY_HIGH

```cangjie
ACCURACY_HIGH
```

**Function:** High-level accuracy of the sensor.

**Since:** 21

### ACCURACY_LOW

```cangjie
ACCURACY_LOW
```

**Function:** Low-level accuracy of the sensor.

**Since:** 21

### ACCURACY_MEDIUM

```cangjie
ACCURACY_MEDIUM
```

**Function:** Medium-level accuracy of the sensor.

**Since:** 21

### ACCURACY_UNRELIABLE

```cangjie
ACCURACY_UNRELIABLE
```

**Function:** Sensor data is unreliable.

**Since:** 21

### func !=(SensorAccuracy)

```cangjie
public operator func !=(other: SensorAccuracy): Bool
```

**Function:** Determines whether two [SensorAccuracy](#enum-sensoraccuracy) values are not equal.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [SensorAccuracy](#enum-sensoraccuracy) | Yes | - | The input [SensorAccuracy](#enum-sensoraccuracy). |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if not equal; otherwise, returns `false`. |

### func ==(SensorAccuracy)

```cangjie
public operator func ==(other: SensorAccuracy): Bool
```

**Function:** Determines whether two [SensorAccuracy](#enum-sensoraccuracy) values are equal.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [SensorAccuracy](#enum-sensoraccuracy) | Yes | - | The input [SensorAccuracy](#enum-sensoraccuracy). |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Converts the enum value to a string.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The converted string. |

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

**Function:** Represents the currently supported sensor types for subscription or unsubscription.

**System Capability:** SystemCapability.Sensors.Sensor

**Since:** 21

**Parent Types:**

- Equatable\<SensorId>
- ToString

### ACCELEROMETER

```cangjie
ACCELEROMETER
```

**Function:** Accelerometer sensor.

**Since:** 21

### ACCELEROMETER_UNCALIBRATED

```cangjie
ACCELEROMETER_UNCALIBRATED
```

**Function:** Uncalibrated accelerometer sensor.

**Since:** 21

### AMBIENT_LIGHT

```cangjie
AMBIENT_LIGHT
```

**Function:** Ambient light sensor.

**Since:** 21

### AMBIENT_TEMPERATURE

```cangjie
AMBIENT_TEMPERATURE
```

**Function:** Ambient temperature sensor.

**Since:** 21

### BAROMETER

```cangjie
BAROMETER
```

**Function:** Barometer sensor.

**Since:** 21

### GRAVITY

```cangjie
GRAVITY
```

**Function:** Gravity sensor.

**Since:** 21

### GYROSCOPE

```cangjie
GYROSCOPE
```

**Function:** Gyroscope sensor.

**Since:** 21

### GYROSCOPE_UNCALIBRATED

```cangjie
GYROSCOPE_UNCALIBRATED
```

**Function:** Uncalibrated gyroscope sensor.

**Since:** 21

### HALL

```cangjie
HALL
```

**Function:** Hall effect sensor.

**Since:** 21

### HEART_RATE

```cangjie
HEART_RATE
```

**Function:** Heart rate sensor.

**Since:** 21

### HUMIDITY

```cangjie
HUMIDITY
```

**Function:** Humidity sensor.

**Since:** 21

### LINEAR_ACCELEROMETER

```cangjie
LINEAR_ACCELEROMETER
```

**Function:** Linear accelerometer sensor.

**Since:** 21

### MAGNETIC_FIELD

```cangjie
MAGNETIC_FIELD
```

**Function:** Magnetic field sensor.

**Since:** 21

### MAGNETIC_FIELD_UNCALIBRATED

```cangjie
MAGNETIC_FIELD_UNCALIBRATED
```

**Function:** Uncalibrated magnetic field sensor.

**Since:** 21

### ORIENTATION

```cangjie
ORIENTATION
```

**Function:** Orientation sensor.

**Since:** 21

### PEDOMETER

```cangjie
PEDOMETER
```

**Function:** Pedometer sensor.

**Since:** 21

### PEDOMETER_DETECTION

```cangjie
PEDOMETER_DETECTION
```

**Function:** Pedometer detection sensor.

**Since:** 21

### PROXIMITY

```cangjie
PROXIMITY
```

**Function:** Proximity sensor.

**Since:** 21

### ROTATION_VECTOR

```cangjie
ROTATION_VECTOR
```

**Function:** Rotation vector sensor.

**Since:** 21

### SIGNIFICANT_MOTION

```cangjie
SIGNIFICANT_MOTION
```

**Function:** Significant motion sensor.**Initial Version:** 21  

### UNSUPPORTED  

```cangjie  
UNSUPPORTED  
```  

**Function:** Unsupported sensor type.  

**Initial Version:** 21  

### WEAR_DETECTION  

```cangjie  
WEAR_DETECTION  
```  

**Function:** Wear detection sensor.  

**Initial Version:** 21  

### func !=(SensorId)  

```cangjie  
public operator func !=(other: SensorId): Bool  
```  

**Function:** Determines whether two [SensorId](#enum-sensorid) values are not equal.  

**System Capability:** SystemCapability.Sensors.Sensor  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
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

**System Capability:** SystemCapability.Sensors.Sensor  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
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

**System Capability:** SystemCapability.Sensors.Sensor  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The converted string. |