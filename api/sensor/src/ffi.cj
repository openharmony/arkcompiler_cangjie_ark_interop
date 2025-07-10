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
struct CRotationVectorResponse {
    CRotationVectorResponse(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let w: Float32
    ) {}
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
                case 259 => RotationVectorResponse(this)
                case _ => None
            }
        } catch (e: Exception) {
            SENSOR_LOG.error("Fail to convert callback data, ${e}")
            None
        }
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
    func FfiSensorUnSubscribeSensor(sensorId: Int32): Int32
    func FfiSensorGetAllSensors(sensors: CPointer<CSensorArray>): Int32
}
