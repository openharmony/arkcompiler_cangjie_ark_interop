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
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorId {
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.permission.[ACCELEROMETER]",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    ACCELEROMETER
    | @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.permission.GYROSCOPE",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GYROSCOPE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AMBIENT_LIGHT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MAGNETIC_FIELD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    BAROMETER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    HALL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    PROXIMITY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    HUMIDITY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    ORIENTATION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GRAVITY
    | @!APILevel[
        19,
        permission: "ohos.permission.ACCELEROMETER",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    LINEAR_ACCELEROMETER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    ROTATION_VECTOR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AMBIENT_TEMPERATURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MAGNETIC_FIELD_UNCALIBRATED
    | @!APILevel[
        19,
        permission: "ohos.permission.GYROSCOPE",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GYROSCOPE_UNCALIBRATED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SIGNIFICANT_MOTION
    | @!APILevel[
        19,
        permission: "ohos.permission.ACTIVITY_MOTION",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    PEDOMETER_DETECTION
    | @!APILevel[
        19,
        permission: "ohos.permission.ACTIVITY_MOTION",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    PEDOMETER
    | @!APILevel[
        19,
        permission: "ohos.permission.READ_HEALTH_DATA",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    HEART_RATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    WEAR_DETECTION
    | @!APILevel[
        19,
        permission: "ohos.permission.ACCELEROMETER",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    ACCELEROMETER_UNCALIBRATED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    UNSUPPORTED
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ACCELEROMETER => 1
                case GYROSCOPE => 2
                case AMBIENT_LIGHT => 5
                case MAGNETIC_FIELD => 6
                case BAROMETER => 8
                case HALL => 10
                case PROXIMITY => 12
                case HUMIDITY => 13
                case ORIENTATION => 256
                case GRAVITY => 257
                case LINEAR_ACCELEROMETER => 258
                case ROTATION_VECTOR => 259
                case AMBIENT_TEMPERATURE => 260
                case MAGNETIC_FIELD_UNCALIBRATED => 261
                case GYROSCOPE_UNCALIBRATED => 263
                case SIGNIFICANT_MOTION => 264
                case PEDOMETER_DETECTION => 265
                case PEDOMETER => 266
                case HEART_RATE => 278
                case WEAR_DETECTION => 280
                case ACCELEROMETER_UNCALIBRATED => 281
                case UNSUPPORTED => -1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: Int32): SensorId {
        match (v) {
            case 1 => ACCELEROMETER
            case 2 => GYROSCOPE
            case 5 => AMBIENT_LIGHT
            case 6 => MAGNETIC_FIELD
            case 8 => BAROMETER
            case 10 => HALL
            case 12 => PROXIMITY
            case 13 => HUMIDITY
            case 256 => ORIENTATION
            case 257 => GRAVITY
            case 258 => LINEAR_ACCELEROMETER
            case 259 => ROTATION_VECTOR
            case 260 => AMBIENT_TEMPERATURE
            case 261 => MAGNETIC_FIELD_UNCALIBRATED
            case 263 => GYROSCOPE_UNCALIBRATED
            case 264 => SIGNIFICANT_MOTION
            case 265 => PEDOMETER_DETECTION
            case 266 => PEDOMETER
            case 278 => HEART_RATE
            case 280 => WEAR_DETECTION
            case 281 => ACCELEROMETER_UNCALIBRATED
            case _ => UNSUPPORTED
        }
    }
}

/**
 * Enumerates the accuracy levels of data reported by a sensor.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorAccuracy {
    /**
     * The sensor data is unreliable. It is possible that the sensor does not contact with the device to measure.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    ACCURACY_UNRELIABLE
    |

        /**
         * The sensor data is at a low accuracy level. The data must be calibrated based on the environment before being used.
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    ACCURACY_LOW
    |

        /**
         * The sensor data is at a medium accuracy level. You are advised to calibrate the data based on the environment before using it.
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    ACCURACY_MEDIUM
    |

        /**
         * The sensor data is at a high accuracy level. The data can be used directly.
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    ACCURACY_HIGH
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ACCURACY_UNRELIABLE => 0
                case ACCURACY_LOW => 1
                case ACCURACY_MEDIUM => 2
                case ACCURACY_HIGH => 3
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: Int32): SensorAccuracy {
        match (v) {
            case 0 => ACCURACY_UNRELIABLE
            case 1 => ACCURACY_LOW
            case 2 => ACCURACY_MEDIUM
            case 3 => ACCURACY_HIGH
            case _ => ACCURACY_UNRELIABLE
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public abstract class Response {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public Response(
        /**
         * The timestamp of the reported sensor data.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var timestamp: Int64,
        /**
         * The accuracy levels of data reported by a sensor.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var accuracy: SensorAccuracy
    ) {}

    init() {
        this(0, SensorAccuracy.ACCURACY_UNRELIABLE)
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
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class RotationVectorResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public RotationVectorResponse(
        /**
         * Rotation vector x-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,

        /**
         * Rotation vector y-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Rotation vector z-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32,

        /**
         * Scalar quantity.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var w: Float32
    ) {}

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
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getSingleSensor(`type`: SensorId): Sensor {
    if (`type` == SensorId.UNSUPPORTED) {
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
