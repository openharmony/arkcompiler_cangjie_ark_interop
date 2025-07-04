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
import std.collection.{ArrayList, HashMap}
import std.sync.Mutex

let ON_SENSOR_MANAGER = SensorManager()
let ONCE_SENSOR_MANAGER = SensorManager()

class CallbackList {
    private let callbackList: ArrayList<CallbackObject>
    private let callBackMutex: Mutex

    init() {
        callbackList = ArrayList<CallbackObject>()
        callBackMutex = Mutex()
    }

    func off(target: CallbackObject): Unit {
        synchronized(callBackMutex) {
            callbackList.removeIf({callback => refEq(callback, target)})
        }
    }

    func on(target: CallbackObject): Unit {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback, target)) {
                    SENSOR_LOG.info("The callback has been subscribed.")
                    return
                }
            }
            callbackList.add(target)
        }
    }

    func clear(): Unit {
        synchronized(callBackMutex) {
            callbackList.clear()
        }
    }

    func contains(target: Callback1Argument<Response>): Bool {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback, target)) {
                    return true
                }
            }
        }
        false
    }

    func isEmpty(): Bool {
        synchronized(callBackMutex) {
            callbackList.isEmpty()
        }
    }

    func size(): Int64 {
        synchronized(callBackMutex) {
            callbackList.size
        }
    }

    func getAllCallbacks(): Array<CallbackObject> {
        synchronized(callBackMutex) {
            return callbackList.toArray()
        }
    }
}

class SensorManager {
    private let sensorMap: HashMap<Int32, CallbackList>
    private let mutex: Mutex

    init() {
        sensorMap = HashMap<Int32, CallbackList>()
        mutex = Mutex()
    }

    func get(sensorId: Int32): ?CallbackList {
        synchronized(mutex) {
            sensorMap.get(sensorId)
        }
    }

    func consume(sensorId: Int32): ?CallbackList {
        synchronized(mutex) {
            sensorMap.remove(sensorId)
        }
    }

    func getOrCreate(sensorType: SensorId): CallbackList {
        synchronized(mutex) {
            if (let Some(v) <- sensorMap.get(sensorType.value)) {
                return v
            }
            let list = CallbackList()
            sensorMap.add(sensorType.value, list)
            list
        }
    }

    static func isMatchType(`type`: SensorId, callback: CallbackObject): Bool {
        match (`type`) {
            case ACCELEROMETER => callback is Callback1Argument<AccelerometerResponse>
            case ACCELEROMETER_UNCALIBRATED => callback is Callback1Argument<AccelerometerUncalibratedResponse>
            case AMBIENT_LIGHT => callback is Callback1Argument<LightResponse>
            case AMBIENT_TEMPERATURE => callback is Callback1Argument<AmbientTemperatureResponse>
            case BAROMETER => callback is Callback1Argument<BarometerResponse>
            case GRAVITY => callback is Callback1Argument<GravityResponse>
            case GYROSCOPE => callback is Callback1Argument<GyroscopeResponse>
            case GYROSCOPE_UNCALIBRATED => callback is Callback1Argument<GyroscopeUncalibratedResponse>
            case HALL => callback is Callback1Argument<HallResponse>
            case HEART_RATE => callback is Callback1Argument<HeartRateResponse>
            case HUMIDITY => callback is Callback1Argument<HumidityResponse>
            case LINEAR_ACCELEROMETER => callback is Callback1Argument<LinearAccelerometerResponse>
            case MAGNETIC_FIELD => callback is Callback1Argument<MagneticFieldResponse>
            case MAGNETIC_FIELD_UNCALIBRATED => callback is Callback1Argument<MagneticFieldUncalibratedResponse>
            case ORIENTATION => callback is Callback1Argument<OrientationResponse>
            case PEDOMETER => callback is Callback1Argument<PedometerResponse>
            case PEDOMETER_DETECTION => callback is Callback1Argument<PedometerDetectionResponse>
            case PROXIMITY => callback is Callback1Argument<ProximityResponse>
            case ROTATION_VECTOR => callback is Callback1Argument<RotationVectorResponse>
            case SIGNIFICANT_MOTION => callback is Callback1Argument<SignificantMotionResponse>
            case WEAR_DETECTION => callback is Callback1Argument<WearDetectionResponse>
            case _ => false
        }
    }

    func isSensorSubscribed(`type`: SensorId): Bool {
        isSensorSubscribed(`type`.value)
    }

    func isSensorSubscribed(`type`: Int32): Bool {
        synchronized(mutex) {
            !(sensorMap.get(`type`)?.isEmpty() ?? true)
        }
    }

    func remove(sensorType: SensorId) {
        synchronized(mutex) {
            sensorMap.remove(sensorType.value)
        }
    }
}

func dataCallbackImpl(data: CPointer<CSensorCallbackData>): Unit {
    if (data.isNull()) {
        SENSOR_LOG.error("CSensorCallbackData is nullptr.")
        return
    }

    let callbackData = unsafe { data.read() }
    let responseData = match (callbackData.convertToResponseOption()) {
        case None =>
            SENSOR_LOG.error("convertToResponse error")
            return
        case Some(v) => v
    }

    let onCallbackListOpt = ON_SENSOR_MANAGER.get(callbackData.sensorTypeId)?.getAllCallbacks()
    emitSensorCallback(callbackData.sensorTypeId, onCallbackListOpt, responseData)

    let onceCallbackListOpt = ONCE_SENSOR_MANAGER.consume(callbackData.sensorTypeId)?.getAllCallbacks()
    emitSensorCallback(callbackData.sensorTypeId, onceCallbackListOpt, responseData)
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(callbackData.sensorTypeId)) {
        let ret = unsafe { FfiSensorUnSubscribeSensor(callbackData.sensorTypeId) }
        if (ret != 0) {
            SENSOR_LOG.error("dataCallbackImpl Unsubscribe failed, ret=${ret}.")
        }
    }
}

func emitSensorCallback(sensorTypeId: Int32, callbackListOpt: ?Array<CallbackObject>, responseData: Response): Unit {
    if (let Some(callbackList) <- callbackListOpt) {
        try {
            emitOneSensorTypeCallbacks(sensorTypeId, callbackList, responseData)
        } catch (e: Exception) {
            SENSOR_LOG.error("convertToResponse error, callbackList sensorid:${sensorTypeId}")
            return
        }
    } else {
        SENSOR_LOG.debug("Fail to find sensor onceCallback id:${sensorTypeId} or callbackList is empty.")
    }
}

func emitOneSensorTypeCallbacks(sensorTypeId: Int32, callbackList: Array<CallbackObject>, responseData: Response): Unit {
    for (callback in callbackList) {
        match (sensorTypeId) {
            case 1 => emitCallbackFunc<AccelerometerResponse>(callback, responseData)
            case 2 => emitCallbackFunc<GyroscopeResponse>(callback, responseData)
            case 5 => emitCallbackFunc<LightResponse>(callback, responseData)
            case 6 => emitCallbackFunc<MagneticFieldResponse>(callback, responseData)
            case 8 => emitCallbackFunc<BarometerResponse>(callback, responseData)
            case 10 => emitCallbackFunc<HallResponse>(callback, responseData)
            case 12 => emitCallbackFunc<ProximityResponse>(callback, responseData)
            case 13 => emitCallbackFunc<HumidityResponse>(callback, responseData)
            case 256 => emitCallbackFunc<OrientationResponse>(callback, responseData)
            case 257 => emitCallbackFunc<GravityResponse>(callback, responseData)
            case 258 => emitCallbackFunc<LinearAccelerometerResponse>(callback, responseData)
            case 259 => emitCallbackFunc<RotationVectorResponse>(callback, responseData)
            case 260 => emitCallbackFunc<AmbientTemperatureResponse>(callback, responseData)
            case 261 => emitCallbackFunc<MagneticFieldUncalibratedResponse>(callback, responseData)
            case 263 => emitCallbackFunc<GyroscopeUncalibratedResponse>(callback, responseData)
            case 264 => emitCallbackFunc<SignificantMotionResponse>(callback, responseData)
            case 265 => emitCallbackFunc<PedometerDetectionResponse>(callback, responseData)
            case 266 => emitCallbackFunc<PedometerResponse>(callback, responseData)
            case 278 => emitCallbackFunc<HeartRateResponse>(callback, responseData)
            case 280 => emitCallbackFunc<WearDetectionResponse>(callback, responseData)
            case 281 => emitCallbackFunc<AccelerometerUncalibratedResponse>(callback, responseData)
            case _ => return
        }
    }
}

func emitCallbackFunc<T>(callback: CallbackObject, responseData: Response): Unit {
    let callbackInstOpt = (callback as Callback1Argument<T>)
    if (let Some(callbackInst) <- callbackInstOpt) {
        callbackInst.invoke((responseData as T).getOrThrow())
    }
}
