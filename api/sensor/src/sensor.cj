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

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum IntervalOption {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SensorNumber(Int64)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GameMode
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    UIMode
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    NormalMode
    | ...

    prop value: Int64 {
        get() {
            match (this) {
                case SensorNumber(v) => v
                case GameMode => 20_000_000
                case UIMode => 60_000_000
                case NormalMode => 200_000_000
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * Subscribe to the sensor's optional parameters.
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class SensorOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public SensorOptions(
        /**
         * Sensor event reporting event interval.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var interval: IntervalOption
    ) {}
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

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AccelerometerResponse <: Response {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public AccelerometerResponse(
        /**
         * Acceleration x-axis component.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,

        /**
         * Acceleration y-axis component.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,
        /**
         * Acceleration z-axis component.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAccelerometerResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Acceleration uncalibrated sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AccelerometerUncalibratedResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public AccelerometerUncalibratedResponse(
        /**
         * Acceleration uncalibrated x-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,

        /**
         * Acceleration uncalibrated y-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Acceleration uncalibrated z-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32,

        /**
         * Acceleration uncalibrated x-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasX: Float32,

        /**
         * Acceleration uncalibrated y-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasY: Float32,
        /**
         * Acceleration uncalibrated z-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasZ: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAccelerometerUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Light sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LightResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public LightResponse(
        /**
         * Indicates light intensity, in lux.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var intensity: Float32,

        /**
         * Indicates color temperature, in kelvin.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var colorTemperature!: ?Float32 = None,

        /**
         * Indicates infrared luminance, in cd/m2.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var infraredLuminance!: ?Float32 = None
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CLightResponse>(v.data, v.dataLen)
        intensity = data.intensity
        colorTemperature = data.colorTemperature
        infraredLuminance = data.infraredLuminance
    }
}

/**
 * Ambient temperature sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AmbientTemperatureResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public AmbientTemperatureResponse(
        /**
         * Indicates ambient temperature, in celsius.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var temperature: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAmbientTemperatureResponse>(v.data, v.dataLen)
        temperature = data.temperature
    }
}

/**
 * Barometer sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class BarometerResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public BarometerResponse(
        /**
         * Indicates the number of barometer, in hpa.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var pressure: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CBarometerResponse>(v.data, v.dataLen)
        pressure = data.pressure
    }
}

/**
 * Gravity sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GravityResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public GravityResponse(
        /**
         * Gravity x-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,
        /**
         * Gravity y-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Gravity z-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGravityResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Gyroscope sensor event data.
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GyroscopeResponse <: Response {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public GyroscopeResponse(
        /**
         * Gyroscope x-axis component.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,

        /**
         * Gyroscope y-axis component.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Gyroscope z-axis component.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGyroscopeResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Gyroscope uncalibrated sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GyroscopeUncalibratedResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public GyroscopeUncalibratedResponse(
        /**
         * Gyroscope uncalibrated x-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,

        /**
         * Gyroscope uncalibrated y-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Gyroscope uncalibrated z-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32,

        /**
         * Gyroscope uncalibrated x-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasX: Float32,

        /**
         * Gyroscope uncalibrated y-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasY: Float32,

        /**
         * Gyroscope uncalibrated z-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasZ: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGyroscopeUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Hall sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HallResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public HallResponse(
        /**
         * Indicates hall status, 0 indicates open, and greater than 0 indicates suction.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var status: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHallResponse>(v.data, v.dataLen)
        status = data.status
    }
}

/**
 * Heart rate sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HeartRateResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public HeartRateResponse(
        /**
         * Indicates the number of heart rate.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var heartRate: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHeartRateResponse>(v.data, v.dataLen)
        heartRate = data.heartRate
    }
}

/**
 * Humidity sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HumidityResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public HumidityResponse(
        /**
         * Indicates the number of humidity.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var humidity: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHumidityResponse>(v.data, v.dataLen)
        humidity = data.humidity
    }
}

/**
 * Linear acceleration sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LinearAccelerometerResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public LinearAccelerometerResponse(
        /**
         * Linear acceleration x-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,

        /**
         * Linear acceleration y-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Linear acceleration z-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CLinearAccelerometerResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Magnetic field sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class MagneticFieldResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public MagneticFieldResponse(
        /**
         * Magnetic field x-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,

        /**
         * Magnetic field y-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Magnetic field z-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CMagneticFieldResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Magnetic field sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class MagneticFieldUncalibratedResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public MagneticFieldUncalibratedResponse(
        /**
         * Magnetic field uncalibrated x-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,

        /**
         * Magnetic field uncalibrated y-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Magnetic field uncalibrated z-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32,

        /**
         * Magnetic field uncalibrated x-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasX: Float32,

        /**
         * Magnetic field uncalibrated y-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasY: Float32,

        /**
         * Magnetic field uncalibrated z-axis offset.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var biasZ: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CMagneticFieldUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Orientation sensor event data.
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class OrientationResponse <: Response {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public OrientationResponse(
        /**
         * The device rotates at an angle around the Z axis.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var alpha: Float32,

        /**
         * The device rotates at an angle around the X axis.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var beta: Float32,

        /**
         * The device rotates at an angle around the Y axis.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var gamma: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<COrientationResponse>(v.data, v.dataLen)
        (alpha, beta, gamma) = (data.alpha, data.beta, data.gamma)
    }
}

/**
 * Pedometer sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class PedometerResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public PedometerResponse(
        /**
         * Indicates the number of steps.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var steps: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CPedometerResponse>(v.data, v.dataLen)
        steps = data.steps
    }
}

/**
 * Pedometer detection sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class PedometerDetectionResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public PedometerDetectionResponse(
        /**
         * Indicates the pedometer detection status, 1 indicates that a walking action has occurred,
         * and 0 indicates that no movement has occurred.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var scalar: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CPedometerDetectionResponse>(v.data, v.dataLen)
        scalar = data.scalar
    }
}

/**
 * Proximity sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class ProximityResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public ProximityResponse(
        /**
         * Indicates the degree of proximity, event 0 indicates proximity, and greater than 0 indicates distance.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var distance: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CProximityResponse>(v.data, v.dataLen)
        distance = data.distance
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

/**
 * Significant motion sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class SignificantMotionResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public SignificantMotionResponse(
        /**
         * Indicates the degree of proximity, event 0 indicates proximity, and greater than 0 indicates distance.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var scalar: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CSignificantMotionResponse>(v.data, v.dataLen)
        scalar = data.scalar
    }
}

/**
 * Wear detection sensor event data.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class WearDetectionResponse <: Response {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public WearDetectionResponse(
        /**
         * Indicates the status of wear detection, 1 for wearing, 0 for wearing not.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var value: Float32
    ) {}

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CWearDetectionResponse>(v.data, v.dataLen)
        value = data.value
    }
}

const DEFAULT_REPORTING_INTERVAL = 200_000_000

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func on<T>(`type`: SensorId, callback: Callback1Argument<T>, option!: ?SensorOptions = None): Unit where T <: Response {
    if (!SensorManager.isMatchType(`type`, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(`type`.value, interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(`type`).on(callback)
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func once<T>(`type`: SensorId, callback: Callback1Argument<T>): Unit where T <: Response {
    if (!SensorManager.isMatchType(`type`, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    if (ON_SENSOR_MANAGER.isSensorSubscribed(`type`)) {
        ONCE_SENSOR_MANAGER.getOrCreate(`type`).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(`type`.value, DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(`type`).on(callback)
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func off(`type`: SensorId, callback!: ?CallbackObject = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(`type`)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(`type`, v)
        case None => removeAllCallback(`type`)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(`type`.value) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

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
 * Indicates geographic location.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LocationOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public LocationOptions(
        /**
         * Specifies the latitude of the point.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var latitude: Float32,
        /**
         * Specifies the longitude of the point.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var longitude: Float32,

        /**
         * Specifies the altitude of the point.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var altitude: Float32
    ) {}
}

/**
 * Indicates geomagnetic field data.
 * @typedef GeomagneticResponse
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GeomagneticResponse {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public GeomagneticResponse(
        /**
         * Geomagnetic x-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Float32,
        /**
         * Geomagnetic y-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Float32,

        /**
         * Geomagnetic z-axis component.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var z: Float32,
        /**
         * The Angle between the earth's magnetic field lines and the horizontal plane.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var geomagneticDip: Float32,

        /**
         * The Angle of magnetic north and true north on a horizontal plane.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var deflectionAngle: Float32,

        /**
         * The horizontal strength of the geomagnetic field.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var levelIntensity: Float32,

        /**
         * The total strength of the geomagnetic field.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var totalIntensity: Float32
    ) {}

    init(data: CGeomagneticResponse) {
        (x, y, z) = (data.x, data.y, data.z)
        (geomagneticDip, deflectionAngle, levelIntensity, totalIntensity) = (data.geomagneticDip, data.deflectionAngle, data
                .levelIntensity, data.totalIntensity)
    }
}

/**
 * Obtains the geomagnetic field at a specific location on the Earth.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getGeomagneticInfo(locationOptions: LocationOptions, timeMillis: Int64): GeomagneticResponse {
    let res = unsafe { FfiSensorGetGeomagneticInfo(CLocationOptions(locationOptions), timeMillis) }
    GeomagneticResponse(res)
}

/**
 * Obtains the altitude at which the device is located based on the current atmospheric pressure.
 * @param { Float32 } seaPressure - seaPressure Indicates the sea level pressure, in hPa.
 * @param { Float32 } currentPressure - currentPressure Indicates the atmospheric pressure measured by the barometer, in hPa.
 * @returns { Float32 } used to return the result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getDeviceAltitude(seaPressure: Float32, currentPressure: Float32): Float32 {
    var altitude: Float32 = 0.0
    let ret = unsafe { FfiSensorGetDeviceAltitude(seaPressure, currentPressure, inout altitude) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    altitude
}

/**
 * Computes the geomagnetic inclination in radians from the inclination matrix.
 * @param { Array<Float32> } inclinationMatrix - Indicates the inclination matrix.
 * @returns { Float32 } used to return the result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getInclination(inclinationMatrix: Array<Float32>): Float32 {
    var inclination: Float32 = 0.0
    try (rInclinationMatrix = toCArrayFloat32(inclinationMatrix).asResource()) {
        let ret = unsafe { FfiSensorGetInclination(rInclinationMatrix.value, inout inclination) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
    }
    inclination
}

/**
 * Get the angle variation between two rotation matrices.
 * @param { Array<Float32> } currentRotationMatrix -  Indicates the current rotation matrix.
 * @param { Array<Float32> } preRotationMatrix - preRotationMatrix Indicates the current rotation matrix.
 * @returns { Array<Float32> } used to return the result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getAngleVariation(currentRotationMatrix: Array<Float32>, preRotationMatrix: Array<Float32>): Array<Float32> {
    var result: CArrFloat32 = CArrFloat32(CPointer(), 0)
    try (
        rCurrentRotationMatrix = toCArrayFloat32(currentRotationMatrix).asResource(),
        rPreRotationMatrix = toCArrayFloat32(preRotationMatrix).asResource()
    ) {
        let ret = unsafe {
            FfiSensorGetAngleVariation(rCurrentRotationMatrix.value, rPreRotationMatrix.value, inout result)
        }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return try {
            result.asArray()
        } finally {
            result.free()
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, "Never reach here!")
}

/**
 * Convert rotation vector to rotation matrix.
 * @param { Array<Float32> } rotationVector - rotationVector Indicates the rotation vector.
 * @returns { Array<Float32> } used to return the result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getRotationMatrix(rotationVector: Array<Float32>): Array<Float32> {
    var result: CArrFloat32 = CArrFloat32(CPointer(), 0)
    try (rRotationVector = toCArrayFloat32(rotationVector).asResource()) {
        let ret = unsafe { FfiSensorGetRotationMatrix(rRotationVector.value, inout result) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return try {
            result.asArray()
        } finally {
            result.free()
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, "Never reach here!")
}

/**
 * Indicates the axis of the new coordinate system that coincides with the XY axis of the original coordinate system.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class CoordinatesOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public CoordinatesOptions(
        /**
         * Indicates the axis of the new coordinate system that coincides with the X axis of the original coordinate system.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var x: Int32,

        /**
         * Indicates the axis of the new coordinate system that coincides with the Y axis of the original coordinate system.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var y: Int32
    ) {}
}

/**
 * Rotate the provided rotation matrix so that it can be represented in a different way coordinate System.
 * @param { Array<Floa32> } inRotationVector - inRotationVector Indicates the rotation matrix to be transformed.
 * @param { CoordinatesOptions } coordinates - coordinates Indicates coordinate system guidance, {@code CoordinatesOptions}.
 * @returns { Array<Floa32 } rotation matrix.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func transformRotationMatrix(inRotationVector: Array<Float32>, coordinates: CoordinatesOptions): Array<Float32> {
    var result: CArrFloat32 = CArrFloat32(CPointer(), 0)
    try (rInRotationVector = toCArrayFloat32(inRotationVector).asResource()) {
        let ret = unsafe {
            FfiSensorTransformRotationMatrix(rInRotationVector.value, CCoordinatesOptions(coordinates), inout result)
        }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return try {
            result.asArray()
        } finally {
            result.free()
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, "Never reach here!")
}

/**
 * convert a rotation vector to a normalized quaternion.
 * @param { Array<number> } rotationVector - rotationVector Indicates the rotation vector.
 * @returns { Array<number> } used to return the result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getQuaternion(rotationVector: Array<Float32>): Array<Float32> {
    var result: CArrFloat32 = CArrFloat32(CPointer(), 0)
    try (rRotationVector = toCArrayFloat32(rotationVector).asResource()) {
        let ret = unsafe { FfiSensorGetQuaternion(rRotationVector.value, inout result) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return try {
            result.asArray()
        } finally {
            result.free()
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, "Never reach here!")
}

/**
 * Computes the device's orientation based on the rotation matrix.
 * @param { Array<Float32> } rotationMatrix - rotationMatrix Indicates the rotation matrix.
 * @returns { Array<Float32> } used to return the result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getOrientation(rotationMatrix: Array<Float32>): Array<Float32> {
    var result: CArrFloat32 = CArrFloat32(CPointer(), 0)
    try (rRotationMatrix = toCArrayFloat32(rotationMatrix).asResource()) {
        let ret = unsafe { FfiSensorGetOrientation(rRotationMatrix.value, inout result) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return try {
            result.asArray()
        } finally {
            result.free()
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, "Never reach here!")
}

/**
 * Indicates the response of rotation matrix.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class RotationMatrixResponse {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public RotationMatrixResponse(
        /**
         * rotation matrix.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var rotation: Array<Float32>,

        /**
         * inclination matrix.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var inclination: Array<Float32>
    ) {}

    init(data: CRotationMatrixResponse) {
        (rotation, inclination) = (data.rotation.asArray(), data.inclination.asArray())
    }
}

/**
 * Calculate rotation matrix based on gravity vector and geomagnetic vector.
 * @param { Array<Float32> } gravity - gravity Indicates the gravity vector.
 * @param { Array<Float32> } geomagnetic - geomagnetic Indicates the geomagnetic vector.
 * @returns { RotationMatrixResponse } used to return the result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getRotationMatrix(gravity: Array<Float32>, geomagnetic: Array<Float32>): RotationMatrixResponse {
    var result: CRotationMatrixResponse = CRotationMatrixResponse(
        CArrFloat32(CPointer(), 0),
        CArrFloat32(CPointer(), 0)
    )
    try (
        rGravity = toCArrayFloat32(gravity).asResource(),
        rGeomagnetic = toCArrayFloat32(geomagnetic).asResource()
    ) {
        let ret = unsafe {
            FfiSensorGetRotationMatrixByGravityAndGeomagnetic(rGravity.value, rGeomagnetic.value, inout result)
        }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }

        return try {
            RotationMatrixResponse(result)
        } finally {
            result.free()
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, "Never reach here!")
}

/**
 * Indicates sensor information.
 * @typedef Sensor
 * @syscap SystemCapability.Sensors.Sensor
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class Sensor {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public Sensor(
        /**
         * Sensor name.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var sensorName: String,

        /**
         * Sensor vendor.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var vendorName: String,

        /**
         * Sensor firmware version.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var firmwareVersion: String,

        /**
         * Sensor hardware version.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var hardwareVersion: String,

        /**
         * Sensor type ID, {@code SensorType}.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var sensorId: SensorId,

        /**
         * Maximum measurement range of the sensor.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var maxRange: Float32,

        /**
         * Minimum sample period allowed, in ns.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var minSamplePeriod: Int64,

        /**
         * Maximum sample period allowed, in ns.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var maxSamplePeriod: Int64,

        /**
         * Sensor accuracy.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var precision: Float32,

        /**
         * Sensor power.
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Sensors.Sensor"
        ]
        public var power: Float32
    ) {}

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
    19,
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
