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

package ohos.sensor

import ohos.base.*
import ohos.ffi.*
import std.deriving.*
import ohos.labels.*

// Enum for obtain the type of sensor.
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorId {
    @!APILevel[
        21,
        permission: "ohos.permission.[ACCELEROMETER]",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Accelerometer
    | @!APILevel[
        21,
        permission: "ohos.permission.GYROSCOPE",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Gyroscope
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AmbientLight
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MagneticField
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Barometer
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Hall
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Proximity
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Humidity
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Orientation
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Gravity
    | @!APILevel[
        21,
        permission: "ohos.permission.ACCELEROMETER",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    LinearAccelerometer
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    RotationVector
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AmbientTemperature
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MagneticFieldUncalibrated
    | @!APILevel[
        21,
        permission: "ohos.permission.GYROSCOPE",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GyroscopeUncalibrated
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SignificantMotion
    | @!APILevel[
        21,
        permission: "ohos.permission.ACTIVITY_MOTION",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    PedometerDetection
    | @!APILevel[
        21,
        permission: "ohos.permission.ACTIVITY_MOTION",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Pedometer
    | @!APILevel[
        21,
        permission: "ohos.permission.READ_HEALTH_DATA",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    HeartRate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    WearDetection
    | @!APILevel[
        21,
        permission: "ohos.permission.ACCELEROMETER",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccelerometerUncalibrated
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Unsupported
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case Accelerometer => 1
                case Gyroscope => 2
                case AmbientLight => 5
                case MagneticField => 6
                case Barometer => 8
                case Hall => 10
                case Proximity => 12
                case Humidity => 13
                case Orientation => 256
                case Gravity => 257
                case LinearAccelerometer => 258
                case RotationVector => 259
                case AmbientTemperature => 260
                case MagneticFieldUncalibrated => 261
                case GyroscopeUncalibrated => 263
                case SignificantMotion => 264
                case PedometerDetection => 265
                case Pedometer => 266
                case HeartRate => 278
                case WearDetection => 280
                case AccelerometerUncalibrated => 281
                case Unsupported => -1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: Int32): SensorId {
        match (v) {
            case 1 => Accelerometer
            case 2 => Gyroscope
            case 5 => AmbientLight
            case 6 => MagneticField
            case 8 => Barometer
            case 10 => Hall
            case 12 => Proximity
            case 13 => Humidity
            case 256 => Orientation
            case 257 => Gravity
            case 258 => LinearAccelerometer
            case 259 => RotationVector
            case 260 => AmbientTemperature
            case 261 => MagneticFieldUncalibrated
            case 263 => GyroscopeUncalibrated
            case 264 => SignificantMotion
            case 265 => PedometerDetection
            case 266 => Pedometer
            case 278 => HeartRate
            case 280 => WearDetection
            case 281 => AccelerometerUncalibrated
            case _ => Unsupported
        }
    }
}

/**
 * Enumerates the accuracy levels of data reported by a sensor.
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorAccuracy {
    /**
     * The sensor data is unreliable. It is possible that the sensor does not contact with the device to measure.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyUnreliable
    |

        /**
         * The sensor data is at a low accuracy level. The data must be calibrated based on the environment before being used.
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyLow
    |

        /**
         * The sensor data is at a medium accuracy level. You are advised to calibrate the data based on the environment before using it.
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyMedium
    |

        /**
         * The sensor data is at a high accuracy level. The data can be used directly.
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyHigh
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case AccuracyUnreliable => 0
                case AccuracyLow => 1
                case AccuracyMedium => 2
                case AccuracyHigh => 3
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: Int32): SensorAccuracy {
        match (v) {
            case 0 => AccuracyUnreliable
            case 1 => AccuracyLow
            case 2 => AccuracyMedium
            case 3 => AccuracyHigh
            case _ => AccuracyUnreliable
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public abstract class Response {
    /**
        * The timestamp of the reported sensor data.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var timestamp: Int64
    /**
        * The accuracy levels of data reported by a sensor.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var accuracy: SensorAccuracy

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public init(timestamp: Int64, accuracy: SensorAccuracy) {
        this.timestamp = timestamp
        this.accuracy = accuracy
    }

    init() {
        this(0, SensorAccuracy.AccuracyUnreliable)
    }

    static func parseCResponseData<T>(data: CPointer<UInt8>, dataLen: Int32): T where T <: CType {
        let size = Int32(unsafe { sizeOf<T>() })
        if (size < dataLen) {
            throw IllegalArgumentException("Data length mismatch, ${size}:${dataLen}.")
        }
        unsafe { CPointer<T>(data).read() }
    }
}

/**
 * Rotation vector sensor event data.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class RotationVectorResponse <: Response {

    /**
        * Rotation vector x-axis component.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
        * Rotation vector y-axis component.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
        * Rotation vector z-axis component.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
        * Scalar quantity.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var w: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public init(x: Float32, y: Float32, z: Float32, w: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.w = w
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CRotationVectorResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        w = data.w
    }
}

const DEFAULT_REPORTING_INTERVAL = 200_000_000

func removeCallback(`type`: SensorId, callback: CallbackObject): Int64 {
    if (!SensorManager.isMatchType(`type`, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    let list = ON_SENSOR_MANAGER.getOrCreate(`type`)
    list.off(callback)
    if (list.isEmpty()) {
        ON_SENSOR_MANAGER.remove(`type`)
        return 0
    }

    return list.size()
}

func removeAllCallback(`type`: SensorId): Int64 {
    ON_SENSOR_MANAGER.remove(`type`)
    0
}

/**
 * Indicates sensor information.
 * @typedef Sensor
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class Sensor {
    /**
        * Sensor name.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorName: String

    /**
        * Sensor vendor.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var vendorName: String

    /**
        * Sensor firmware version.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var firmwareVersion: String

    /**
        * Sensor hardware version.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var hardwareVersion: String

    /**
        * Sensor type ID, {@code SensorType}.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorId: SensorId

    /**
        * Maximum measurement range of the sensor.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var maxRange: Float32

    /**
        * Minimum sample period allowed, in ns.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var minSamplePeriod: Int64

    /**
        * Maximum sample period allowed, in ns.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var maxSamplePeriod: Int64

    /**
        * Sensor accuracy.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var precision: Float32

    /**
        * Sensor power.
        */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var power: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public init(sensorName: String, vendorName: String, firmwareVersion: String,
        hardwareVersion: String, sensorId: SensorId, maxRange: Float32, minSamplePeriod: Int64,
        maxSamplePeriod: Int64, precision: Float32, power: Float32) {
        this.sensorName = sensorName
        this.vendorName = vendorName
        this.firmwareVersion = firmwareVersion
        this.hardwareVersion = hardwareVersion
        this.sensorId = sensorId
        this.maxRange = maxRange
        this.minSamplePeriod = minSamplePeriod
        this.maxSamplePeriod = maxSamplePeriod
        this.precision = precision
        this.power = power
    }

    init(data: CSensor) {
        sensorName = data.sensorName.toString()
        vendorName = data.vendorName.toString()
        firmwareVersion = data.firmwareVersion.toString()
        hardwareVersion = data.hardwareVersion.toString()
        sensorId = SensorId.parse(data.sensorId)
        maxRange = data.maxRange
        minSamplePeriod = data.minSamplePeriod
        maxSamplePeriod = data.maxSamplePeriod
        precision = data.precision
        power = data.power
    }
}

/**
 * Obtains all sensor information on the device.
 * @returns { Array<Sensor> } used to return the result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getSensorList(): Array<Sensor> {
    var result = CSensorArray()
    let ret = unsafe { FfiSensorGetAllSensors(inout result) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    try {
        result.asArray()
    } finally {
        result.free()
    }
}

/**
 * Synchronously obtains the sensor information of a specified type.
 * @param { SensorId } type - Indicate the sensor type, {@code SensorId}.
 * @returns { Sensor } Returns sensor information.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 * @throws { BusinessException } 14500102 - The sensor is not supported by the device.
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getSingleSensor(`type`: SensorId): Sensor {
    if (`type` == SensorId.Unsupported) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    let sensorList = getSensorList()
    for (sensor in sensorList) {
        if (sensor.sensorId.value == `type`.value) {
            return sensor
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, getErrorMsg(SENSOR_NO_SUPPORT))
}
