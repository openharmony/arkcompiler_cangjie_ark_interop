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

import ohos.base.*
import ohos.hilog.*
import ohos.ffi.*
import ohos.i18n.*
import std.collection.*
import std.sync.*
import ohos.labels.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class GeoLocationManager {
    /**
     * @brief getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
     */
    @!APILevel[
        21,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func getCurrentLocation(): Location {
        var errCode: Int32 = 0
        let cLocation = unsafe { FfiOHOSGeoLocationManagerGetCurrentLocation(inout errCode) }
        try {
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
            }
            return cLocation.toLocation()
        } finally {
            cLocation.free()
        }
    }

    /**
     * @brief getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
     */
    @!APILevel[
        21,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func getCurrentLocation(request: CurrentLocationRequest): Location {
        var errCode: Int32 = 0
        let cLocation = unsafe {
            FfiOHOSGeoLocationManagerGetCurrentLocationCurrent(CJCurrentLocationRequest(request), inout errCode)
        }
        try {
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
            }
            return cLocation.toLocation()
        } finally {
            cLocation.free()
        }
    }

    /**
     * @brief getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
     */
    @!APILevel[
        21,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func getCurrentLocation(request: SingleLocationRequest): Location {
        var errCode: Int32 = 0
        let cLocation = unsafe {
            FfiOHOSGeoLocationManagerGetCurrentLocationSingle(CJSingleLocationRequest(request), inout errCode)
        }
        try {
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
            }
            return cLocation.toLocation()
        } finally {
            cLocation.free()
        }
    }

    /**
     * @brief isLocationEnabled(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func isLocationEnabled(): Bool {
        var errCode: Int32 = 0
        let res = unsafe { FfiOHOSGeoLocationManagerIsLocationEnabled(inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
        }
        return res
    }
}