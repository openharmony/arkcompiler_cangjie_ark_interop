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
import ohos.ffi.*
import ohos.labels.*

/**
 * Provides interfaces for acquiring location information, managing location switches,
 * geocoding, reverse geocoding, country code, fencing and other functions.
 *
 * @relation declare namespace geoLocationManager
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class GeoLocationManager {
     /**
      * Subscribe location changed.
      *
      * @throws { BusinessException } 201 - Permission verification failed. The   application does not have the permission required to call the API.
      * @throws { BusinessException } 401 - Parameter error. Possible causes:   1. Mandatory parameters are left unspecified; 2. Incorrect parameter   types; 3. Parameter verification failed.
      * @throws { BusinessException } 801 - Capability not supported. Failed to   call ${geoLocationManager.getCurrentLocation} due to limited device   capabilities.
      * @throws { BusinessException } 3301000 - The location service is   unavailable.
      * @throws { BusinessException } 3301100 - The location switch is off.
      * @throws { BusinessException } 3301200 - Failed to obtain the   geographical location.
      * @relation function getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
      */
    @!APILevel[
        21,
        permission: "ohos.permission.APPROXIMATELY_LOCATION",
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
      * Obtain current location.
      *
      * @throws { BusinessException } 201 - Permission verification failed. The   application does not have the permission required to call the API.
      * @throws { BusinessException } 401 - Parameter error. Possible causes:   1. Mandatory parameters are left unspecified; 2. Incorrect parameter   types; 3. Parameter verification failed.
      * @throws { BusinessException } 801 - Capability not supported. Failed to   call ${geoLocationManager.getCurrentLocation} due to limited device   capabilities.
      * @throws { BusinessException } 3301000 - The location service is   unavailable.
      * @throws { BusinessException } 3301100 - The location switch is off.
      * @throws { BusinessException } 3301200 - Failed to obtain the   geographical location.
      * @relation function getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
      */
    @!APILevel[
        21,
        permission: "ohos.permission.APPROXIMATELY_LOCATION",
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
      * Obtain current location.
      *
      * @throws { BusinessException } 201 - Permission verification failed. The   application does not have the permission required to call the API.
      * @throws { BusinessException } 401 - Parameter error. Possible causes:   1. Mandatory parameters are left unspecified; 2. Incorrect parameter   types; 3. Parameter verification failed.
      * @throws { BusinessException } 801 - Capability not supported. Failed to   call ${geoLocationManager.getCurrentLocation} due to limited device   capabilities.
      * @throws { BusinessException } 3301000 - The location service is   unavailable.
      * @throws { BusinessException } 3301100 - The location switch is off.
      * @throws { BusinessException } 3301200 - Failed to obtain the   geographical location.
      * @relation function getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
      */
    @!APILevel[
        21,
        permission: "ohos.permission.APPROXIMATELY_LOCATION",
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
      * Obtain current location switch status.
      *
      * @throws { BusinessException } 801 - Capability not supported. Failed to call ${geoLocationManager.isLocationEnabled} due to limited device capabilities.
      * @throws { BusinessException } 3301000 - The location service is unavailable.
      * @relation function isLocationEnabled(): boolean
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