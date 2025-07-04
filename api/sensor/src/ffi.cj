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

@C
struct CAccelerometerResponse {
    CAccelerometerResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32
    ) {}
}

@C
struct CAccelerometerUncalibratedResponse {
    CAccelerometerUncalibratedResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let biasX: Float32,
        let biasY: Float32,
        let biasZ: Float32
    ) {}
}

@C
struct CLightResponse {
    CLightResponse(
        let intensity: Float32,
        let colorTemperature: Float32,
        let infraredLuminance: Float32
    ) {}
}

@C
struct CAmbientTemperatureResponse {
    CAmbientTemperatureResponse(let temperature: Float32) {}
}

@C
struct CBarometerResponse {
    CBarometerResponse(let pressure: Float32) {}
}

@C
struct CGravityResponse {
    CGravityResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32
    ) {}
}

@C
struct CGyroscopeResponse {
    CGyroscopeResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32
    ) {}
}

@C
struct CGyroscopeUncalibratedResponse {
    CGyroscopeUncalibratedResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let biasX: Float32,
        let biasY: Float32,
        let biasZ: Float32
    ) {}
}

@C
struct CHallResponse {
    CHallResponse(let status: Float32) {}
}

@C
struct CHeartRateResponse {
    CHeartRateResponse(let heartRate: Float32) {}
}

@C
struct CHumidityResponse {
    CHumidityResponse(let humidity: Float32) {}
}

@C
struct CLinearAccelerometerResponse {
    CLinearAccelerometerResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32
    ) {}
}

@C
struct CMagneticFieldResponse {
    CMagneticFieldResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32
    ) {}
}

@C
struct CMagneticFieldUncalibratedResponse {
    CMagneticFieldUncalibratedResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let biasX: Float32,
        let biasY: Float32,
        let biasZ: Float32
    ) {}
}

@C
struct COrientationResponse {
    COrientationResponse(
        let alpha: Float32,
        let beta: Float32,
        let gamma: Float32
    ) {}
}

@C
struct CPedometerResponse {
    CPedometerResponse(let steps: Float32) {}
}

@C
struct CPedometerDetectionResponse {
    CPedometerDetectionResponse(let scalar: Float32) {}
}

@C
struct CProximityResponse {
    CProximityResponse(let distance: Float32) {}
}

@C
struct CRotationVectorResponse {
    CRotationVectorResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let w: Float32
    ) {}
}

@C
struct CSignificantMotionResponse {
    CSignificantMotionResponse(let scalar: Float32) {}
}

@C
struct CWearDetectionResponse {
    CWearDetectionResponse(let value: Float32) {}
}

@C
struct CSensorCallbackData {
    CSensorCallbackData(
        let sensorTypeId: Int32,
        let version: Int32,
        let timestamp: Int64,
        let option: Int32,
        let mode: Int32,
        let data: CPointer<UInt8>,
        let dataLen: Int32
    ) {}

    func convertToResponseOption(): ?Response {
        try {
            match (sensorTypeId) {
                case 1 => AccelerometerResponse(this)
                case 2 => GyroscopeResponse(this)
                case 5 => LightResponse(this)
                case 6 => MagneticFieldResponse(this)
                case 8 => BarometerResponse(this)
                case 10 => HallResponse(this)
                case 12 => ProximityResponse(this)
                case 13 => HumidityResponse(this)
                case 256 => OrientationResponse(this)
                case 257 => GravityResponse(this)
                case 258 => LinearAccelerometerResponse(this)
                case 259 => RotationVectorResponse(this)
                case 260 => AmbientTemperatureResponse(this)
                case 261 => MagneticFieldUncalibratedResponse(this)
                case 263 => GyroscopeUncalibratedResponse(this)
                case 264 => SignificantMotionResponse(this)
                case 265 => PedometerDetectionResponse(this)
                case 266 => PedometerResponse(this)
                case 278 => HeartRateResponse(this)
                case 280 => WearDetectionResponse(this)
                case 281 => AccelerometerUncalibratedResponse(this)
                case _ => None
            }
        } catch (e: Exception) {
            SENSOR_LOG.error("Fail to convert callback data, ${e}")
            None
        }
    }
}

@C
struct CLocationOptions {
    CLocationOptions(
        let latitude: Float32,
        let longitude: Float32,
        let altitude: Float32
    ) {}

    init(data: LocationOptions) {
        this.latitude = data.latitude
        this.longitude = data.longitude
        this.altitude = data.altitude
    }
}

@C
struct CGeomagneticResponse {
    CGeomagneticResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let geomagneticDip: Float32,
        let deflectionAngle: Float32,
        let levelIntensity: Float32,
        let totalIntensity: Float32
    ) {}
}

@C
struct CCoordinatesOptions {
    CCoordinatesOptions(
        let x: Int32,
        let y: Int32
    ) {}

    init(data: CoordinatesOptions) {
        this.x = data.x
        this.y = data.y
    }
}

@C
struct CRotationMatrixResponse {
    CRotationMatrixResponse(
        let rotation: CArrFloat32,
        let inclination: CArrFloat32
    ) {}

    func free() {
        rotation.free()
        inclination.free()
    }
}

func toCArrayFloat32(arr: Array<Float32>): CArrFloat32 {
    if (arr.isEmpty()) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    unsafe {
        let p = LibC.malloc<Float32>(count: arr.size)
        if (p.isNull()) {
            throw BusinessException(SERVICE_EXCEPTION, getErrorMsg(SERVICE_EXCEPTION))
        }
        for (i in 0..arr.size) {
            p.write(i, arr[i])
        }
        return CArrFloat32(p, arr.size)
    }
}

@C
struct CSensor {
    var sensorName: CString = CString(CPointer())
    var vendorName: CString = CString(CPointer())
    var firmwareVersion: CString = CString(CPointer())
    var hardwareVersion: CString = CString(CPointer())
    var sensorId: Int32 = -1
    var maxRange: Float32 = 0.0
    var minSamplePeriod: Int64 = -1
    var maxSamplePeriod: Int64 = -1
    var precision: Float32 = 0.0
    var power: Float32 = 0.0

    func free() {
        unsafe {
            LibC.free(sensorName)
            LibC.free(vendorName)
            LibC.free(firmwareVersion)
            LibC.free(hardwareVersion)
        }
    }
}

@C
struct CSensorArray {
    var head: CPointer<CSensor> = CPointer()
    var size: Int64 = 0

    init() {}

    func asArray(): Array<Sensor> {
        if (head.isNull() || size <= 0) {
            return Array<Sensor>()
        }
        Array<Sensor>(size) {
            i =>
            let data = unsafe { head.read(i) }
            Sensor(data)
        }
    }

    func free(): Unit {
        if (head.isNull()) {
            return
        }

        for (i in 0..size) {
            unsafe { head.read(i).free() }
        }
        unsafe { LibC.free(head) }
    }
}

foreign {
    func FfiSensorSubscribeSensor(sensorId: Int32, interval: Int64, callback: Int64): Int32

    func FfiSensorUnSubscribeSensor(sensorId: Int32): Int32

    func FfiSensorGetGeomagneticInfo(location: CLocationOptions, timeMillis: Int64): CGeomagneticResponse

    func FfiSensorGetDeviceAltitude(seaPressure: Float32, currentPressure: Float32, altitude: CPointer<Float32>): Int32

    func FFiOHOSSensorGetInclination(seaPressure: Float32, currentPressure: Float32, altitude: CPointer<Float32>): Int32

    func FfiSensorGetInclination(inclinationMatrix: CArrFloat32, inclination: CPointer<Float32>): Int32

    func FfiSensorGetAngleVariation(currentRotationMatrix: CArrFloat32, preRotationMatrix: CArrFloat32,
        angleChange: CPointer<CArrFloat32>): Int32

    func FfiSensorGetRotationMatrix(rotationVector: CArrFloat32, rotationMatrix: CPointer<CArrFloat32>): Int32

    func FfiSensorTransformRotationMatrix(inRotationVector: CArrFloat32, coordinates: CCoordinatesOptions,
        rotationMatrix: CPointer<CArrFloat32>): Int32

    func FfiSensorGetQuaternion(rotationVector: CArrFloat32, quaternion: CPointer<CArrFloat32>): Int32

    func FfiSensorGetOrientation(rotationMatrix: CArrFloat32, rotationAngle: CPointer<CArrFloat32>): Int32

    func FfiSensorGetRotationMatrixByGravityAndGeomagnetic(gravity: CArrFloat32, geomagnetic: CArrFloat32,
        matrix: CPointer<CRotationMatrixResponse>): Int32

    func FfiSensorGetAllSensors(sensors: CPointer<CSensorArray>): Int32
}
