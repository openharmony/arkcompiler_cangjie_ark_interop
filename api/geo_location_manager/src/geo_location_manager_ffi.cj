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

package ohos.geo_location_manager

import std.collection.*

foreign {
    func FfiOHOSGeoLocationManagerGetCurrentLocation(errCode: CPointer<Int32>): CJLocation

    func FfiOHOSGeoLocationManagerGetCurrentLocationCurrent(request: CJCurrentLocationRequest, errCode: CPointer<Int32>): CJLocation

    func FfiOHOSGeoLocationManagerGetCurrentLocationSingle(request: CJSingleLocationRequest, errCode: CPointer<Int32>): CJLocation

    func FfiOHOSGeoLocationManagerIsLocationEnabled(errCode: CPointer<Int32>): Bool
}

@C
struct CJMapStringString {
    CJMapStringString(
        let keys: CPointer<CString>,
        let values: CPointer<CString>
    ) {}
}

@C
struct CJLocation {
    var latitude: Float64 = 0.0
    var longitude: Float64 = 0.0
    var altitude: Float64 = 0.0
    var accuracy: Float64 = 0.0
    var speed: Float64 = 0.0
    var direction: Float64 = 0.0
    var timeStamp: Int64 = 0
    var timeSinceBoot: Int64 = 0
    var additions: CPointer<CString> = CPointer<CString>()
    var additionSize: Int64 = 0
    var additionsMap: CJMapStringString = CJMapStringString(CPointer<CString>(), CPointer<CString>())
    var altitudeAccuracy: Float64 = 0.0
    var speedAccuracy: Float64 = 0.0
    var directionAccuracy: Float64 = 0.0
    var uncertaintyOfTimeSinceBoot: Int64 = 0
    var sourceType: Int32 = 0

    func toLocation(): Location {
        let cjAdditions = if (additions.isNotNull()) {
            unsafe { Array<String>(additionSize, {i => additions.read(i).toString()}) }
        } else {
            Array<String>()
        }
        let cjAdditionsMap = if (additionsMap.keys.isNotNull() && additionsMap.values.isNotNull()) {
            unsafe {
                HashMap<String, String>(additionSize,
                    {i => (additionsMap.keys.read(i).toString(), additionsMap.values.read(i).toString())})
            }
        } else {
            HashMap<String, String>()
        }
        return Location(this, additions: cjAdditions, additionsMap: cjAdditionsMap,
            sourceType: LocationSourceType.parse(sourceType))
    }

    func toLocationAndFree(): Location {
        let location = this.toLocation()
        this.free()
        return location
    }

    func free(): Unit {
        unsafe {
            if (additions.isNotNull()) {
                for (i in 0..additionSize) {
                    LibC.free(additions.read(i))
                }
                LibC.free(additions)
            }
            if (additionsMap.keys.isNotNull()) {
                for (i in 0..additionSize) {
                    LibC.free(additionsMap.keys.read(i))
                }
                LibC.free(additionsMap.keys)
            }
            if (additionsMap.values.isNotNull()) {
                for (i in 0..additionSize) {
                    LibC.free(additionsMap.values.read(i))
                }
                LibC.free(additionsMap.values)
            }
        }
    }
}

@C
struct CJCurrentLocationRequest {
    var priority: Int32
    var scenario: Int32
    var maxAccuracy: Float32
    var timeoutMs: Int32

    init(request: CurrentLocationRequest) {
        this.priority = request.priority.getValue()
        this.scenario = request.scenario.getValue()
        this.maxAccuracy = request.maxAccuracy
        this.timeoutMs = request.timeoutMs
    }
}

@C
struct CJSingleLocationRequest {
    var locatingPriority: Int32
    var locatingTimeoutMs: Int32

    init(request: SingleLocationRequest) {
        this.locatingPriority = request.locatingPriority.getValue()
        this.locatingTimeoutMs = request.locatingTimeoutMs
    }
}