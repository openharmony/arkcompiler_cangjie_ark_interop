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
import ohos.i18n.*
import std.collection.*

foreign {
    func FfiOHOSGeoLocationManagerGetCurrentLocation(errCode: CPointer<Int32>): CJLocation

    func FfiOHOSGeoLocationManagerGetCurrentLocationCurrent(request: CJCurrentLocationRequest, errCode: CPointer<Int32>): CJLocation

    func FfiOHOSGeoLocationManagerGetCurrentLocationSingle(request: CJSingleLocationRequest, errCode: CPointer<Int32>): CJLocation

    func FfiOHOSGeoLocationManagerGetLastLocation(errCode: CPointer<Int32>): CJLocation

    func FfiOHOSGeoLocationManagerIsLocationEnabled(errCode: CPointer<Int32>): Bool

    func FfiOHOSGeoLocationManagerIsGeocoderAvailable(errCode: CPointer<Int32>): Bool

    func FfiOHOSGeoLocationManagerGetCachedGnssLocationsSize(errCode: CPointer<Int32>): Int32

    func FfiOHOSGeoLocationManagerFlushCachedGnssLocations(errCode: CPointer<Int32>): Unit

    func FfiOHOSGeoLocationManagerSendCommand(command: CJLocationCommand, errCode: CPointer<Int32>): Unit

    func FfiOHOSGeoLocationManagerGetCountryCode(errCode: CPointer<Int32>): CJCountryCode

    func FfiOHOSGeoLocationManagerGetAddressesFromLocation(request: CJReverseGeoCodeRequest, errCode: CPointer<Int32>): CJGeoAddressArr

    func FfiOHOSGeoLocationManagerGetAddressesFromLocationName(request: CJGeoCodeRequest, errCode: CPointer<Int32>): CJGeoAddressArr

    func FfiGeoLocationManagerOnLocationChange(request: CJLocationRequest, callbackId: Int64): Int32

    func FfiGeoLocationManagerOnContinuousLocationRequest(request: CJContinuousLocationRequest, callbackId: Int64): Int32

    func FfiGeoLocationManagerOffLocationChange(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffLocationChangeAll(): Int32

    func FfiGeoLocationManagerOnLocationError(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffLocationError(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffLocationErrorAll(): Int32

    func FfiGeoLocationManagerOnLocationEnabledChange(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffLocationEnabledChange(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffLocationEnabledChangeAll(): Int32

    func FfiGeoLocationManagerOnCachedGnssLocationsChange(
        request: CJCachedGnssLocationsRequest,
        callbackId: Int64
    ): Int32

    func FfiGeoLocationManagerOffCachedGnssLocationsChange(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffCachedGnssLocationsChangeAll(): Int32

    func FfiGeoLocationManagerOnSatelliteStatusChange(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffSatelliteStatusChange(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffSatelliteStatusChangeAll(): Int32

    func FfiGeoLocationManagerOnNmeaMessage(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffNmeaMessage(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffNmeaMessageAll(): Int32

    func FfiGeoLocationManagerOnCountryCodeChange(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffCountryCodeChange(callbackId: Int64): Int32

    func FfiGeoLocationManagerOffCountryCodeChangeAll(): Int32

    func FfiGeoLocationManagerGetGeofenceSupportedCoordTypes(errCode: CPointer<Int32>): CArrI32
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

@C
struct CJLocationCommand {
    var scenario: Int32
    var command: CString

    init(command: LocationCommand) {
        this.scenario = command.scenario.getValue()
        this.command = unsafe { LibC.mallocCString(command.command) }
    }

    func free() {
        unsafe { LibC.free(command) }
    }
}

@C
struct CJCountryCode {
    var country: CString = CString(CPointer<UInt8>())
    var `type`: Int32 = 0

    func toCountryCode(): CountryCode {
        return CountryCode(country.toString(), CountryCodeType.parse(`type`))
    }

    func toCountryCodeAndFree(): CountryCode {
        try {
            let res = this.toCountryCode()
            return res
        } finally {
            this.free()
        }
    }

    func free() {
        unsafe { LibC.free(country) }
    }
}

@C
struct CJReverseGeoCodeRequest {
    var locale: CString = CString(CPointer<UInt8>())
    var country: CString = CString(CPointer<UInt8>())
    var latitude: Float64
    var longitude: Float64
    var maxItems: Int32

    init(request: ReverseGeoCodeRequest) {
        try {
            locale = unsafe { LibC.mallocCString(request.locale) }
            country = unsafe { LibC.mallocCString(request.country) }
        } catch (e: Exception) {
            unsafe { LibC.free(locale) }
            unsafe { LibC.free(country) }
            throw e
        }
        latitude = request.latitude
        longitude = request.longitude
        maxItems = request.maxItems
    }

    func free() {
        unsafe { LibC.free(locale) }
        unsafe { LibC.free(country) }
    }
}

@C
struct CJGeoCodeRequest {
    var locale: CString = CString(CPointer<UInt8>())
    var country: CString = CString(CPointer<UInt8>())
    var description: CString = CString(CPointer<UInt8>())
    var maxItems: Int32
    var minLatitude: Float64
    var minLongitude: Float64
    var maxLatitude: Float64
    var maxLongitude: Float64

    init(request: GeoCodeRequest) {
        try {
            locale = unsafe { LibC.mallocCString(request.locale) }
            country = unsafe { LibC.mallocCString(request.country) }
            description = unsafe { LibC.mallocCString(request.description) }
        } catch (e: Exception) {
            unsafe { LibC.free(locale) }
            unsafe { LibC.free(country) }
            unsafe { LibC.free(description) }
            throw e
        }
        maxItems = request.maxItems
        minLatitude = request.minLatitude
        minLongitude = request.minLongitude
        maxLatitude = request.maxLatitude
        maxLongitude = request.maxLongitude
    }

    func free() {
        unsafe { LibC.free(locale) }
        unsafe { LibC.free(country) }
        unsafe { LibC.free(description) }
    }
}

@C
struct CJGeoAddress {
    var latitude: Float64 = 0.0
    var longitude: Float64 = 0.0
    var locale: CString = CString(CPointer<UInt8>())
    var placeName: CString = CString(CPointer<UInt8>())
    var countryCode: CString = CString(CPointer<UInt8>())
    var countryName: CString = CString(CPointer<UInt8>())
    var administrativeArea: CString = CString(CPointer<UInt8>())
    var subAdministrativeArea: CString = CString(CPointer<UInt8>())
    var locality: CString = CString(CPointer<UInt8>())
    var subLocality: CString = CString(CPointer<UInt8>())
    var roadName: CString = CString(CPointer<UInt8>())
    var subRoadName: CString = CString(CPointer<UInt8>())
    var premises: CString = CString(CPointer<UInt8>())
    var postalCode: CString = CString(CPointer<UInt8>())
    var phoneNumber: CString = CString(CPointer<UInt8>())
    var addressUrl: CString = CString(CPointer<UInt8>())
    var descriptions: CPointer<CString> = CPointer<CString>()
    var descriptionsSize: Int32 = 0

    func toGeoAddress(): GeoAddress {
        var descriptionsArr = Array<String>()
        if (descriptions.isNotNull()) {
            descriptionsArr = unsafe { Array<String>(Int64(descriptionsSize), {i => descriptions.read(i).toString()}) }
        }
        return GeoAddress(latitude, longitude, locale.toString(), placeName.toString(), countryCode.toString(),
            countryName.toString(), administrativeArea.toString(), subAdministrativeArea.toString(), locality.toString(),
            subLocality.toString(), roadName.toString(), subRoadName.toString(), premises.toString(),
            postalCode.toString(), phoneNumber.toString(), addressUrl.toString(), descriptionsArr, descriptionsSize)
    }

    func free() {
        unsafe {
            LibC.free(locale)
            LibC.free(placeName)
            LibC.free(countryCode)
            LibC.free(countryName)
            LibC.free(administrativeArea)
            LibC.free(subAdministrativeArea)
            LibC.free(locality)
            LibC.free(subLocality)
            LibC.free(roadName)
            LibC.free(subRoadName)
            LibC.free(premises)
            LibC.free(postalCode)
            LibC.free(phoneNumber)
            LibC.free(addressUrl)
            if (descriptions.isNotNull()) {
                for (i in 0..descriptionsSize) {
                    LibC.free(descriptions.read(Int64(i)))
                }
            }
        }
    }
}

@C
struct CJGeoAddressArr {
    var head: CPointer<CJGeoAddress> = CPointer<CJGeoAddress>()
    var size: Int64 = 0

    func toArray(): Array<GeoAddress> {
        if (head.isNull()) {
            return Array<GeoAddress>()
        }
        return unsafe { Array<GeoAddress>(size, {i => head.read(i).toGeoAddress()}) }
    }

    func free() {
        if (head.isNotNull()) {
            for (i in 0..size) {
                unsafe { head.read(i).free() }
            }
            unsafe { LibC.free(head) }
        }
    }
}

@C
struct CJLocationRequest {
    var priority: Int32
    var scenario: Int32
    var timeInterval: Int32
    var distanceInterval: Float64
    var maxAccuracy: Float32

    init(request: LocationRequest) {
        this.priority = request.priority.getValue()
        this.scenario = request.scenario.getValue()
        this.timeInterval = request.timeInterval
        this.distanceInterval = request.distanceInterval
        this.maxAccuracy = request.maxAccuracy
    }
}

@C
struct CJContinuousLocationRequest {
    var interval: Int32
    var locationScenario: Int32

    init(request: ContinuousLocationRequest) {
        this.interval = request.interval
        this.locationScenario = request.locationScenario
    }
}

@C
struct CJCachedGnssLocationsRequest {
    var reportingPeriodSec: Int32
    var wakeUpCacheQueueFull: Bool

    init(request: CachedGnssLocationsRequest) {
        this.reportingPeriodSec = request.reportingPeriodSec
        this.wakeUpCacheQueueFull = request.wakeUpCacheQueueFull
    }
}

@C
struct CJLocationArr {
    var head: CPointer<CJLocation> = CPointer<CJLocation>()
    var size: Int64 = 0

    func toArray(): Array<Location> {
        if (head.isNull()) {
            return Array<Location>()
        }
        return unsafe { Array<Location>(size, {i => head.read(i).toLocation()}) }
    }

    func toArrayAndFree(): Array<Location> {
        let res = this.toArray()
        this.free()
        return res
    }

    func free() {
        if (head.isNotNull()) {
            for (i in 0..size) {
                unsafe { head.read(i).free() }
            }
            unsafe { LibC.free(head) }
        }
    }
}

@C
struct CArrF64 {
    var head: CPointer<Float64> = CPointer<Float64>()
    var size: Int64 = 0
}

@C
struct CJSatelliteStatusInfo {
    var satellitesNumber: Int32 = 0
    var satelliteIds: CArrI32 = CArrI32(CPointer<Int32>(), 0)
    var carrierToNoiseDensitys: CArrF64 = CArrF64()
    var altitudes: CArrF64 = CArrF64()
    var azimuths: CArrF64 = CArrF64()
    var carrierFrequencies: CArrF64 = CArrF64()
    var satelliteConstellation: CArrI32 = CArrI32(CPointer<Int32>(), 0)
    var satelliteAdditionalInfo: CArrI32 = CArrI32(CPointer<Int32>(), 0)

    func toSatelliteStatusInfo(): SatelliteStatusInfo {
        let cjSatelliteIds = if (satelliteIds.head.isNotNull()) {
            unsafe { Array<Int32>(satelliteIds.size, {i => satelliteIds.head.read(i)}) }
        } else {
            Array<Int32>()
        }
        let cjCarrierToNoiseDensitys = if (carrierToNoiseDensitys.head.isNotNull()) {
            unsafe { Array<Float64>(carrierToNoiseDensitys.size, {i => carrierToNoiseDensitys.head.read(i)}) }
        } else {
            Array<Float64>()
        }
        let cjAltitudes = if (altitudes.head.isNotNull()) {
            unsafe { Array<Float64>(altitudes.size, {i => altitudes.head.read(i)}) }
        } else {
            Array<Float64>()
        }
        let cjAzimuths = if (azimuths.head.isNotNull()) {
            unsafe { Array<Float64>(azimuths.size, {i => azimuths.head.read(i)}) }
        } else {
            Array<Float64>()
        }
        let cjCarrierFrequencies = if (carrierFrequencies.head.isNotNull()) {
            unsafe { Array<Float64>(carrierFrequencies.size, {i => carrierFrequencies.head.read(i)}) }
        } else {
            Array<Float64>()
        }
        let cjSatelliteConstellation = if (satelliteConstellation.head.isNotNull()) {
            unsafe {
                Array<SatelliteConstellationCategory>(satelliteConstellation.size,
                    {i => SatelliteConstellationCategory.parse(satelliteConstellation.head.read(i))})
            }
        } else {
            Array<SatelliteConstellationCategory>()
        }
        let cjSatelliteAdditionalInfo = if (satelliteAdditionalInfo.head.isNotNull()) {
            unsafe { Array<Int32>(satelliteAdditionalInfo.size, {i => satelliteAdditionalInfo.head.read(i)}) }
        } else {
            Array<Int32>()
        }
        return SatelliteStatusInfo(satellitesNumber, cjSatelliteIds, cjCarrierToNoiseDensitys, cjAltitudes, cjAzimuths,
            cjCarrierFrequencies, satelliteConstellation: cjSatelliteConstellation,
            satelliteAdditionalInfo: cjSatelliteAdditionalInfo)
    }

    func toSatelliteStatusInfoAndFree(): SatelliteStatusInfo {
        try {
            let res = this.toSatelliteStatusInfo()
            return res
        } finally {
            this.free()
        }
    }

    func free() {
        unsafe {
            LibC.free<Int32>(satelliteIds.head)
            LibC.free<Float64>(carrierToNoiseDensitys.head)
            LibC.free<Float64>(altitudes.head)
            LibC.free<Float64>(azimuths.head)
            LibC.free<Float64>(carrierFrequencies.head)
            LibC.free<Int32>(satelliteConstellation.head)
            LibC.free<Int32>(satelliteAdditionalInfo.head)
        }
    }
}
