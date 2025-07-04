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

package ohos.i18n

import ohos.base.*
import ohos.ffi.*
import std.collection.HashMap
import ohos.labels.*

foreign {
    func FfiI18nTimezoneConstructor(id: CString, isZoneId: Bool): Int64

    func FfiI18nTimezoneGetTimezonesByLocation(longitude: Float64, latitude: Float64): CArrString

    func FfiI18nTimezoneGetCityDisplayName(cityID: CString, locale: CString): CString

    func FfiI18nTimezoneGetAvailableZoneCityIDs(): CArrString

    func FfiI18nTimezoneGetAvailableIDs(): CArrString

    func FfiI18nTimezoneGetDisplayName(remoteDataId: Int64, locale: CString, isDST: Bool, parameterStatus: Int32): CString

    func FfiI18nTimezoneGetOffset(remoteDataId: Int64, date: Float64, parameterStatus: Int32): Int32

    func FfiI18nTimezoneGetRawOffset(remoteDataId: Int64): Int32

    func FfiI18nTimezoneGetID(remoteDataId: Int64): CString
}

class RemoteTimezone <: RemoteDataLite {
    RemoteTimezone(cityID: String, isZoneId: Bool) {
        super(
            unsafe {
                let cCityID = LibC.mallocCString(cityID)
                let instanceId = FfiI18nTimezoneConstructor(cCityID, isZoneId)
                LibC.free(cCityID)
                instanceId
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    func getDisplayName(locale!: ?String = None, isDST!: ?Bool = None): String {
        unsafe {
            var cLocale = CString(CPointer<UInt8>())
            var cIsDST = false
            // 0: locale and isDST are null
            // 1: only locale has value
            // 2: only isDST has value
            // 3: both locale and isDST have value
            var parameterStatus: Int32 = 0
            if (let Some(v) <- locale) {
                cLocale = LibC.mallocCString(v)
                parameterStatus += 1
            }
            if (let Some(v) <- isDST) {
                cIsDST = v
                parameterStatus += 2
            }
            let cStr = FfiI18nTimezoneGetDisplayName(super.getID(), cLocale, cIsDST, parameterStatus)
            let str = cStr.toString()
            LibC.free(cStr)
            LibC.free(cLocale)
            return str
        }
    }

    func getOffset(date!: ?Float64 = None): Int32 {
        unsafe {
            var cDate: Float64 = 0.0
            var parameterStatus: Int32 = 0 // 0 represents date is null, use system time instead
            if (let Some(v) <- date) {
                cDate = v
                parameterStatus = 1
            }
            return FfiI18nTimezoneGetOffset(super.getID(), cDate, parameterStatus)
        }
    }

    func getRawOffset(): Int32 {
        return unsafe { FfiI18nTimezoneGetRawOffset(super.getID()) }
    }

    func getTimeZoneID(): String {
        unsafe {
            let cStr = FfiI18nTimezoneGetID(super.getID())
            let str = cStr.toString()
            LibC.free(cStr)
            return str
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class TimeZone {
    private static let CITY_TIME_ZONE_MAP = HashMap<String, TimeZone>()

    private static let ZONE_TIME_ZONE_MAP = HashMap<String, TimeZone>()

    private let remoteTimezone: RemoteTimezone

    private init(cityID: String, isZoneId: Bool) {
        remoteTimezone = RemoteTimezone(cityID, isZoneId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getTimezoneFromCity(cityID: String): TimeZone {
        if (CITY_TIME_ZONE_MAP.contains(cityID)) {
            return CITY_TIME_ZONE_MAP[cityID]
        }
        let newInstance = TimeZone(cityID, false)
        CITY_TIME_ZONE_MAP[cityID] = newInstance
        return newInstance
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getTimezonesByLocation(longitude: Float64, latitude: Float64): Array<TimeZone> {
        unsafe {
            if (longitude < -180.0 || longitude > 179.9 || latitude < -90.0 || latitude > 89.9) {
                throw BusinessException(INVALID_PARAMETER, getErrorMsg(INVALID_PARAMETER))
            }
            var result = Array<TimeZone>()
            let cArrString = FfiI18nTimezoneGetTimezonesByLocation(longitude, latitude)
            result = cArr2cjArr<CString, TimeZone>(cArrString.size, cArrString.head,
                {i => getTimeZoneFromeZoneId(i.toString())})
            cArrString.free()
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getCityDisplayName(cityID: String, locale: String): String {
        unsafe {
            var result = ""
            try (
                cCityID = LibC.mallocCString(cityID).asResource(),
                cLocale = LibC.mallocCString(locale).asResource()
            ) {
                let cStr = FfiI18nTimezoneGetCityDisplayName(cCityID.value, cLocale.value)
                result = cStr.toString()
                LibC.free(cStr)
            }
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getAvailableZoneCityIDs(): Array<String> {
        unsafe {
            var result = Array<String>()
            let cArrString = FfiI18nTimezoneGetAvailableZoneCityIDs()
            result = cArrString.toStringArray()
            cArrString.free()
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getAvailableIDs(): Array<String> {
        unsafe {
            var result = Array<String>()
            let cArrString = FfiI18nTimezoneGetAvailableIDs()
            result = cArrString.toStringArray()
            cArrString.free()
            return result
        }
    }

    internal static func getTimeZoneFromeZoneId(zoneID: String) {
        if (ZONE_TIME_ZONE_MAP.contains(zoneID)) {
            return ZONE_TIME_ZONE_MAP[zoneID]
        }
        let newInstance = TimeZone(zoneID, true)
        ZONE_TIME_ZONE_MAP[zoneID] = newInstance
        return newInstance
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getDisplayName(locale!: ?String = None, isDST!: ?Bool = None): String {
        return remoteTimezone.getDisplayName(locale: locale, isDST: isDST)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getOffset(date!: ?Float64 = None): Int32 {
        return remoteTimezone.getOffset(date: date)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getRawOffset(): Int32 {
        return remoteTimezone.getRawOffset()
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getID(): String {
        return remoteTimezone.getTimeZoneID()
    }
}
