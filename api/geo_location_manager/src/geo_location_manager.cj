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

let LOCATION_CALLBACKS = ArrayList<(CallbackObject, Int64)>()
let LOCATION_ERROR_CALLBACK_HOSTS = ArrayList<(CallbackObject, Int64)>()
let SWITCH_CALLBACKS = ArrayList<(CallbackObject, Int64)>()
let CACHED_LOCATION_CALLBACKS = ArrayList<(CallbackObject, Int64)>()
let GNSS_STATUS_INFO_CALLBACKS = ArrayList<(CallbackObject, Int64)>()
let NMEA_CALLBACKS = ArrayList<(CallbackObject, Int64)>()
let COUNTRY_CODE_CALLBACKS = ArrayList<(CallbackObject, Int64)>()
let ON_OFF_MUTEX = Mutex()

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Location.Location.Core"
]
public class GeoLocationManager {
    /**
     * @brief getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
     */
    @!APILevel[
        19,
        atomicservice: true,
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
        19,
        atomicservice: true,
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
        19,
        atomicservice: true,
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
     * @brief getLastLocation(): Location
     */
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func getLastLocation(): Location {
        var errCode: Int32 = 0
        let cLocation = unsafe { FfiOHOSGeoLocationManagerGetLastLocation(inout errCode) }
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
        19,
        atomicservice: true,
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

    /**
     * @brief isGeocoderAvailable(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public static func isGeocoderAvailable(): Bool {
        var errCode: Int32 = 0
        let res = unsafe { FfiOHOSGeoLocationManagerIsGeocoderAvailable(inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
        }
        return res
    }

    /**
     * @brief getCachedGnssLocationsSize(): Promise<number>
     */
    @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public static func getCachedGnssLocationsSize(): Int32 {
        var errCode: Int32 = 0
        let res = unsafe { FfiOHOSGeoLocationManagerGetCachedGnssLocationsSize(inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
        }
        return res
    }

    /**
     * @brief flushCachedGnssLocations(): Promise<void>
     */
    @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public static func flushCachedGnssLocations(): Unit {
        var errCode: Int32 = 0
        unsafe { FfiOHOSGeoLocationManagerFlushCachedGnssLocations(inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
        }
    }

    /**
     * @brief sendCommand(command: LocationCommand): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func sendCommand(command: LocationCommand): Unit {
        var errCode: Int32 = 0
        var ccommand = CJLocationCommand(command)
        unsafe { FfiOHOSGeoLocationManagerSendCommand(ccommand, inout errCode) }
        ccommand.free()
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
        }
    }

    /**
     * @brief getCountryCode(): Promise<CountryCode>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func getCountryCode(): CountryCode {
        var errCode: Int32 = 0
        let cCountryCode = unsafe { FfiOHOSGeoLocationManagerGetCountryCode(inout errCode) }
        try {
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
            }
            return cCountryCode.toCountryCode()
        } finally {
            cCountryCode.free()
        }
    }

    /**
     * @brief getAddressesFromLocation(request: ReverseGeoCodeRequest): Promise<Array<GeoAddress>>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public static func getAddressesFromLocation(request: ReverseGeoCodeRequest): Array<GeoAddress> {
        var errCode: Int32 = 0
        let cRequest = CJReverseGeoCodeRequest(request)
        let cGeoAddressArr = unsafe { FfiOHOSGeoLocationManagerGetAddressesFromLocation(cRequest, inout errCode) }
        cRequest.free()
        try {
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
            }
            return cGeoAddressArr.toArray()
        } finally {
            cGeoAddressArr.free()
        }
    }

    /**
     * @brief getAddressesFromLocationName(request: GeoCodeRequest): Promise<Array<GeoAddress>>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geocoder"
    ]
    public static func getAddressesFromLocationName(request: GeoCodeRequest): Array<GeoAddress> {
        if (request.description == "") {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        var errCode: Int32 = 0
        let cRequest = CJGeoCodeRequest(request)
        let cGeoAddressArr = unsafe { FfiOHOSGeoLocationManagerGetAddressesFromLocationName(cRequest, inout errCode) }
        cRequest.free()
        try {
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
            }
            return cGeoAddressArr.toArray()
        } finally {
            cGeoAddressArr.free()
        }
    }

    static func findCallbackObject(list: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject): Bool {
        for (item in list) {
            if (refEq(callback, item[0])) {
                return true
            }
        }
        return false
    }

    /**
     * @brief on(type: 'locationChange', request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func on(`type`: CallbackType, request: LocationRequest, callback: Callback1Argument<Location>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.LocationChange =>
                    let callbackList = LOCATION_CALLBACKS
                    if (findCallbackObject(callbackList, callback)) {
                        GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager On failed: This request already exists")
                        return
                    }
                    unsafe {
                        let wrapper = {value: CJLocation => callback.invoke(value.toLocationAndFree())}
                        let lambdaData = Callback1Param<CJLocation, Unit>(wrapper)
                        let errCode = FfiGeoLocationManagerOnLocationChange(CJLocationRequest(request),
                            lambdaData.getID())
                        checkRet(errCode)
                        callbackList.add((callback, lambdaData.getID()))
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief on(type: 'locationChange', request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func on(`type`: CallbackType, request: ContinuousLocationRequest,
        callback: Callback1Argument<Location>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.LocationChange =>
                    let callbackList = LOCATION_CALLBACKS
                    if (findCallbackObject(callbackList, callback)) {
                        GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager On failed: This request already exists")
                        return
                    }
                    unsafe {
                        let wrapper = {value: CJLocation => callback.invoke(value.toLocationAndFree())}
                        let lambdaData = Callback1Param<CJLocation, Unit>(wrapper)
                        let errCode = FfiGeoLocationManagerOnContinuousLocationRequest(
                            CJContinuousLocationRequest(request), lambdaData.getID())
                        checkRet(errCode)
                        callbackList.add((callback, lambdaData.getID()))
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    static func off(callbackList: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject,
        offFunc: CFunc<(Int64) -> Int32>): Unit {
        synchronized(ON_OFF_MUTEX) {
            if (callbackList.size == 0) {
                GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager Off failed: The event is not registered")
                return
            }
            unsafe {
                callbackList.removeIf(
                    {
                        item => if (refEq(item[0], callback)) {
                            let errCode = offFunc(item[1])
                            if (errCode != SUCCESS_CODE) {
                                throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
                            }
                            true
                        } else {
                            GEO_LOCATION_MANAGER_LOG.error(
                                "GeoLocationManager Off failed: The callback is not registered")
                            false
                        }
                    })
            }
        }
    }

    /**
     * @brief off(type: 'locationChange', callback?: Callback<Location>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func off(`type`: CallbackType, callback: Callback1Argument<Location>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.LocationChange => off(LOCATION_CALLBACKS, callback,
                    FfiGeoLocationManagerOffLocationChange)
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief on(type: 'locationError', callback: Callback<LocationError>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func on(`type`: CallbackType, callback: Callback1Argument<LocationError>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.LocationErr =>
                    let callbackList = LOCATION_ERROR_CALLBACK_HOSTS
                    if (findCallbackObject(callbackList, callback)) {
                        GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager On failed: This request already exists")
                        return
                    }
                    unsafe {
                        let wrapper = {value: Int32 => callback.invoke(LocationError.parse(value))}
                        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                        let errCode = FfiGeoLocationManagerOnLocationError(lambdaData.getID())
                        checkRet(errCode)
                        callbackList.add((callback, lambdaData.getID()))
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief off(type: 'locationError', callback?: Callback<LocationError>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func off(`type`: CallbackType, callback: Callback1Argument<LocationError>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.LocationErr => off(LOCATION_ERROR_CALLBACK_HOSTS, callback,
                    FfiGeoLocationManagerOffLocationError)
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief on(type: 'locationEnabledChange', callback: Callback<boolean>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func on(`type`: CallbackType, callback: Callback1Argument<Bool>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.LocationEnabledChange =>
                    let callbackList = SWITCH_CALLBACKS
                    if (findCallbackObject(callbackList, callback)) {
                        GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager On failed: This request already exists")
                        return
                    }
                    unsafe {
                        let wrapper = {value: Bool => callback.invoke(value)}
                        let lambdaData = Callback1Param<Bool, Unit>(wrapper)
                        let errCode = FfiGeoLocationManagerOnLocationEnabledChange(lambdaData.getID())
                        checkRet(errCode)
                        callbackList.add((callback, lambdaData.getID()))
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief off(type: 'locationEnabledChange', callback?: Callback<boolean>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func off(`type`: CallbackType, callback: Callback1Argument<Bool>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.LocationEnabledChange => off(SWITCH_CALLBACKS, callback,
                    FfiGeoLocationManagerOffLocationEnabledChange)
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief on(type: 'cachedGnssLocationsChange', request: CachedGnssLocationsRequest, callback: Callback<Array<Location>>): void
     */
    @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public static func on(`type`: CallbackType, request: CachedGnssLocationsRequest,
        callback: Callback1Argument<Array<Location>>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.CachedGnssLocationsChange =>
                    let callbackList = CACHED_LOCATION_CALLBACKS
                    if (findCallbackObject(callbackList, callback)) {
                        GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager On failed: This request already exists")
                        return
                    }
                    unsafe {
                        let wrapper = {value: CJLocationArr => callback.invoke(value.toArrayAndFree())}
                        let lambdaData = Callback1Param<CJLocationArr, Unit>(wrapper)
                        let errCode = FfiGeoLocationManagerOnCachedGnssLocationsChange(
                            CJCachedGnssLocationsRequest(request), lambdaData.getID())
                        checkRet(errCode)
                        callbackList.add((callback, lambdaData.getID()))
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief off(type: 'cachedGnssLocationsChange', callback?: Callback<Array<Location>>): void
     */
    @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public static func off(`type`: CallbackType, callback: Callback1Argument<Array<Location>>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.CachedGnssLocationsChange => off(CACHED_LOCATION_CALLBACKS, callback,
                    FfiGeoLocationManagerOffCachedGnssLocationsChange)
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief on(type: 'satelliteStatusChange', callback: Callback<SatelliteStatusInfo>): void
     */
    @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public static func on(`type`: CallbackType, callback: Callback1Argument<SatelliteStatusInfo>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.SatelliteStatusChange =>
                    let callbackList = GNSS_STATUS_INFO_CALLBACKS
                    if (findCallbackObject(callbackList, callback)) {
                        GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager On failed: This request already exists")
                        return
                    }
                    unsafe {
                        let wrapper = {
                            value: CJSatelliteStatusInfo => callback.invoke(value.toSatelliteStatusInfoAndFree())
                        }
                        let lambdaData = Callback1Param<CJSatelliteStatusInfo, Unit>(wrapper)
                        let errCode = FfiGeoLocationManagerOnSatelliteStatusChange(lambdaData.getID())
                        checkRet(errCode)
                        callbackList.add((callback, lambdaData.getID()))
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief off(type: 'satelliteStatusChange', callback?: Callback<SatelliteStatusInfo>): void
     */
    @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public static func off(`type`: CallbackType, callback: Callback1Argument<SatelliteStatusInfo>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.SatelliteStatusChange => off(GNSS_STATUS_INFO_CALLBACKS, callback,
                    FfiGeoLocationManagerOffSatelliteStatusChange)
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief on(type: 'nmeaMessage', callback: Callback<string>): void
     */
    @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION" & "ohos.LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public static func on(`type`: CallbackType, callback: Callback1Argument<String>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.NmeaMessage =>
                    let callbackList = NMEA_CALLBACKS
                    if (findCallbackObject(callbackList, callback)) {
                        GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager On failed: This request already exists")
                        return
                    }
                    unsafe {
                        let wrapper = {
                            value: CString => callback.invoke(try {
                                value.toString()
                            } finally {
                                LibC.free(value)
                            })
                        }
                        let lambdaData = Callback1Param<CString, Unit>(wrapper)
                        let errCode = FfiGeoLocationManagerOnNmeaMessage(lambdaData.getID())
                        if (errCode != SUCCESS_CODE) {
                            throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
                        }
                        callbackList.add((callback, lambdaData.getID()))
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief off(type: 'nmeaMessage', callback?: Callback<string>): void
     */
    @!APILevel[
        19,
        permission: "ohos.APPROXIMATELY_LOCATION" & "ohos.LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Gnss"
    ]
    public static func off(`type`: CallbackType, callback: Callback1Argument<String>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.NmeaMessage => off(NMEA_CALLBACKS, callback, FfiGeoLocationManagerOffNmeaMessage)
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief on(type: 'countryCodeChange', callback: Callback<CountryCode>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func on(`type`: CallbackType, callback: Callback1Argument<CountryCode>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.CountryCodeChange =>
                    let callbackList = COUNTRY_CODE_CALLBACKS
                    if (findCallbackObject(callbackList, callback)) {
                        GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager On failed: This request already exists")
                        return
                    }
                    unsafe {
                        let wrapper = {value: CJCountryCode => callback.invoke(value.toCountryCodeAndFree())}
                        let lambdaData = Callback1Param<CJCountryCode, Unit>(wrapper)
                        let errCode = FfiGeoLocationManagerOnCountryCodeChange(lambdaData.getID())
                        checkRet(errCode)
                        callbackList.add((callback, lambdaData.getID()))
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    /**
     * @brief off(type: 'countryCodeChange', callback?: Callback<CountryCode>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func off(`type`: CallbackType, callback: Callback1Argument<CountryCode>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (`type`) {
                case CallbackType.CountryCodeChange => off(COUNTRY_CODE_CALLBACKS, callback,
                    FfiGeoLocationManagerOffCountryCodeChange)
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    static func offAll(callbackList: ArrayList<(CallbackObject, Int64)>, offAllFunc: CFunc<() -> Int32>): Unit {
        synchronized(ON_OFF_MUTEX) {
            if (callbackList.size == 0) {
                GEO_LOCATION_MANAGER_LOG.error("GeoLocationManager off failed: The event is not registered")
                return
            }
            unsafe {
                let errCode = offAllFunc()
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
                }
                callbackList.clear()
            }
        }
    }

    /**
     * @brief off(type: 'locationChange', callback?: Callback<Location>): void
     * @brief off(type: 'locationError', callback?: Callback<LocationError>): void
     * @brief off(type: 'locationEnabledChange', callback?: Callback<boolean>): void
     * @brief off(type: 'cachedGnssLocationsChange', callback?: Callback<Array<Location>>): void
     * @brief off(type: 'satelliteStatusChange', callback?: Callback<SatelliteStatusInfo>): void
     * @brief off(type: 'nmeaMessage', callback?: Callback<string>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.APPROXIMATELY_LOCATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Core"
    ]
    public static func off(`type`: CallbackType): Unit {
        match (`type`) {
            case CallbackType.LocationChange => offAll(LOCATION_CALLBACKS, FfiGeoLocationManagerOffLocationChangeAll)
            case CallbackType.LocationErr => offAll(
                LOCATION_ERROR_CALLBACK_HOSTS,
                FfiGeoLocationManagerOffLocationErrorAll
            )
            case CallbackType.LocationEnabledChange => offAll(SWITCH_CALLBACKS,
                FfiGeoLocationManagerOffLocationEnabledChangeAll)
            case CallbackType.CachedGnssLocationsChange => offAll(CACHED_LOCATION_CALLBACKS,
                FfiGeoLocationManagerOffCachedGnssLocationsChangeAll)
            case CallbackType.SatelliteStatusChange => offAll(GNSS_STATUS_INFO_CALLBACKS,
                FfiGeoLocationManagerOffSatelliteStatusChangeAll)
            case CallbackType.NmeaMessage => offAll(NMEA_CALLBACKS, FfiGeoLocationManagerOffNmeaMessageAll)
            case CallbackType.CountryCodeChange => offAll(COUNTRY_CODE_CALLBACKS,
                FfiGeoLocationManagerOffCountryCodeChangeAll)
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    /**
     * @brief getGeofenceSupportedCoordTypes(): Array<CoordinateSystemType>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Location.Location.Geofence"
    ]
    public static func getGeofenceSupportedCoordTypes(): Array<CoordinateSystemType> {
        var errCode: Int32 = 0
        let carr = unsafe { FfiGeoLocationManagerGetGeofenceSupportedCoordTypes(inout errCode) }
        if (errCode != SUCCESS_CODE) {
            unsafe { LibC.free<Int32>(carr.head) }
            throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
        }
        let head = carr.head
        if (head.isNull()) {
            return Array<CoordinateSystemType>()
        }
        let res = unsafe { Array<CoordinateSystemType>(carr.size, {i => CoordinateSystemType.parse(head.read(i))}) }
        unsafe { LibC.free<Int32>(head) }
        return res
    }
}

func checkRet(errCode: Int32): Unit {
    if (errCode != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
    }
}
