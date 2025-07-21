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

package ohos.bluetooth.ble

import std.deriving.Derive
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.HashMap

const BLE_ADV_DEFAULT_INTERVAL: UInt16 = 1600
const BLE_ADV_TX_POWER_MEDIUM_VALUE: Int8 = -7

/**
 * Describes the criteria for filtering scanning results can be set.
 *
 * @relation interface ScanFilter
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ScanFilter {
    /**
     * The address of a BLE peripheral device
     *
     * @relation deviceId?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: ?String = None
    /**
     * The name of a BLE peripheral device
     *
     * @relation name?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var name: ?String = None
    /**
     * The service UUID of a BLE peripheral device
     *
     * @relation serviceUuid?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: ?String = None

    /**
     * Service UUID mask.
     *
     * @relation serviceUuidMask?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuidMask: ?String = None

    /**
     * Service solicitation UUID.
     *
     * @relation serviceSolicitationUuid?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceSolicitationUuid: ?String = None

    /**
     * Service solicitation UUID mask.
     *
     * @relation serviceSolicitationUuidMask?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceSolicitationUuidMask: ?String = None

    /**
     * Service data.
     *
     * @relation serviceData?: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceData: ?Array<Byte> = None

    /**
     * Service data mask.
     *
     * @relation serviceDataMask?: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceDataMask: ?Array<Byte> = None

    /**
     * Manufacture id.
     *
     * @relation manufactureId?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureId: UInt16 = 0

    /**
     * Manufacture data.
     *
     * @relation manufactureData?: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureData: ?Array<Byte> = None

    /**
     * Manufacture data mask.
     *
     * @relation manufactureDataMask?: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureDataMask: ?Array<Byte> = None

    /**
     * ScanFilter constructor.
     */    
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init() {}

    func toNative(): NativeScanFilter {
        unsafe {
            var cDeviceId = CString(CPointer<UInt8>())
            var cName = CString(CPointer<UInt8>())
            var cServiceUuid = CString(CPointer<UInt8>())
            var cServiceUuidMask = CString(CPointer<UInt8>())
            var cServiceSolicitationUuid = CString(CPointer<UInt8>())
            var cServiceSolicitationUuidMask = CString(CPointer<UInt8>())
            var cServiceData = CArrUI8(CPointer<UInt8>(), 0)
            var cServiceDataMask = CArrUI8(CPointer<UInt8>(), 0)
            var cManufactureData = CArrUI8(CPointer<UInt8>(), 0)
            var cManufactureDataMask = CArrUI8(CPointer<UInt8>(), 0)
            try {
                if (let Some(v) <- deviceId) {
                    cDeviceId = LibC.mallocCString(v)
                }

                if (let Some(v) <- name) {
                    cName = LibC.mallocCString(v)
                }

                if (let Some(v) <- serviceUuid) {
                    cServiceUuid = LibC.mallocCString(v)
                }

                if (let Some(v) <- serviceUuidMask) {
                    cServiceUuidMask = LibC.mallocCString(v)
                }

                if (let Some(v) <- serviceSolicitationUuid) {
                    cServiceSolicitationUuid = LibC.mallocCString(v)
                }

                if (let Some(v) <- serviceSolicitationUuidMask) {
                    cServiceSolicitationUuidMask = LibC.mallocCString(v)
                }

                if (let Some(v) <- serviceData) {
                    cServiceData = CArrUI8(cjArr2CArr<UInt8, UInt8>(v, {i => i}), v.size)
                }

                if (let Some(v) <- serviceDataMask) {
                    cServiceDataMask = CArrUI8(cjArr2CArr<UInt8, UInt8>(v, {i => i}), v.size)
                }

                if (let Some(v) <- manufactureData) {
                    cManufactureData = CArrUI8(cjArr2CArr<UInt8, UInt8>(v, {i => i}), v.size)
                }

                if (let Some(v) <- manufactureDataMask) {
                    cManufactureDataMask = CArrUI8(cjArr2CArr<UInt8, UInt8>(v, {i => i}), v.size)
                }

                return NativeScanFilter(
                    cDeviceId,
                    cName,
                    cServiceUuid,
                    cServiceUuidMask,
                    cServiceSolicitationUuid,
                    cServiceSolicitationUuidMask,
                    cServiceData,
                    cServiceDataMask,
                    manufactureId,
                    cManufactureData,
                    cManufactureDataMask
                )
            } catch (e: Exception) {
                LibC.free(cDeviceId)
                LibC.free(cName)
                LibC.free(cServiceUuid)
                LibC.free(cServiceUuidMask)
                LibC.free(cServiceSolicitationUuid)
                LibC.free(cServiceSolicitationUuidMask)
                LibC.free<UInt8>(cServiceData.head)
                LibC.free<UInt8>(cServiceDataMask.head)
                LibC.free<UInt8>(cManufactureData.head)
                throw e
            }
        }
    }
}

@C
struct NativeScanFilter {
    NativeScanFilter(
        let deviceId: CString,
        let name: CString,
        let serviceUuid: CString,
        let serviceUuidMask: CString,
        let serviceSolicitationUuid: CString,
        let serviceSolicitationUuidMask: CString,
        let serviceData: CArrUI8,
        let serviceDataMask: CArrUI8,
        let manufactureId: UInt16,
        let manufactureData: CArrUI8,
        let manufactureDataMask: CArrUI8
    ) {}

    unsafe func free() {
        LibC.free(deviceId)
        LibC.free(name)
        LibC.free(serviceUuid)
        LibC.free(serviceUuidMask)
        LibC.free(serviceSolicitationUuid)
        LibC.free(serviceSolicitationUuidMask)
        LibC.free<UInt8>(serviceData.head)
        LibC.free<UInt8>(serviceDataMask.head)
        LibC.free<UInt8>(manufactureData.head)
        LibC.free<UInt8>(manufactureDataMask.head)
    }
}

@C
struct CArrNativeScanFilter {
    CArrNativeScanFilter(
        let head: CPointer<NativeScanFilter>,
        let size: Int64
    ) {}

    unsafe func free() {
        if (head.isNull()) {
            return
        }
        for (i in 0..this.size) {
            head.read(i).free()
        }
        LibC.free<NativeScanFilter>(head)
    }
}

@C
struct NativeScanOptions {
    NativeScanOptions(
        let interval: Int32,
        let dutyMode: Int32,
        let matchMode: Int32,
        let phyType: Int32
    ) {}
}

/**
 * Describes the parameters for scan.
 *
 * @relation interface ScanOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ScanOptions {
    /**
     * Time of delay for reporting the scan result
     *
     * @relation interval?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var interval: Int32 = 0

    /**
     * Bluetooth LE scan mode
     *
     * @relation dutyMode?: ScanDuty
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var dutyMode: ScanDuty = ScanModeLowPower

    /**
     * Match mode for Bluetooth LE scan filters hardware match
     *
     * @relation matchMode?: MatchMode
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var matchMode: MatchMode = MatchModeAggressive

    /**
     * Physical Layer used during scan.
     *
     * @relation phyType?: PhyType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var phyType: PhyType = PhyLe1M

    /**
     * ScanOptions constructor.
     */    
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(interval: Int32, dutyMode: ScanDuty, matchMode: MatchMode, phyType: PhyType) {
        this.interval = interval
        this.dutyMode = dutyMode
        this.matchMode = matchMode
        this.phyType = phyType
    }

    func toNative(): NativeScanOptions {
        NativeScanOptions(
            interval,
            dutyMode.getValue(),
            matchMode.getValue(),
            phyType.getValue()
        )
    }
}

@C
struct NativeAdvertiseSetting {
    NativeAdvertiseSetting(
        let interval: UInt16,
        let txPower: Int8,
        let connectable: Bool
    ) {}
}

/**
 * Describes the settings for BLE advertising.
 *
 * @relation interface AdvertiseSetting
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertiseSetting {
    /**
     * Minimum slot value for the advertising interval, which is 32 (20 ms)
     * Maximum slot value for the advertising interval, which is 16777215} (10485.759375s)
     * Default slot value for the advertising interval, which is 1600 (1s)
     *
     * @relation interval?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var interval: UInt16 = BLE_ADV_DEFAULT_INTERVAL

    /**
     * Minimum transmission power level for advertising, which is -127
     * Maximum transmission power level for advertising, which is 1
     * Default transmission power level for advertising, which is -7
     *
     * @relation txPower?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var txPower: Int8 = BLE_ADV_TX_POWER_MEDIUM_VALUE

    /**
     * Indicates whether the BLE is connectable, default is true
     *
     * @relation connectable?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var connectable: Bool = true
    
    /**
     * AdvertiseSetting constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(interval: UInt16, txPower: Int8, connectable: Bool) {
        this.interval = interval
        this.txPower = txPower
        this.connectable = connectable
    }

    func toNative(): NativeAdvertiseSetting {
        NativeAdvertiseSetting(
            interval,
            txPower,
            connectable
        )
    }
}

@C
struct CArrNativeManufactureData {
    CArrNativeManufactureData(
        let head: CPointer<NativeManufactureData>,
        let size: Int64
    ) {}

    unsafe func free() {
        for (i in 0..size) {
            head.read(i).free()
        }
        LibC.free<NativeManufactureData>(head)
    }
}

@C
struct CArrNativeServiceData {
    CArrNativeServiceData(
        let head: CPointer<NativeServiceData>,
        let size: Int64
    ) {}

    unsafe func free() {
        for (i in 0..size) {
            head.read(i).free()
        }
        LibC.free<NativeServiceData>(head)
    }
}

@C
struct NativeAdvertiseData {
    let serviceUuids: CArrString
    let manufactureData: CArrNativeManufactureData
    let serviceData: CArrNativeServiceData
    let includeDeviceName: Bool
    NativeAdvertiseData(
        serviceUuids: CArrString,
        manufactureData: CArrNativeManufactureData,
        serviceData: CArrNativeServiceData,
        includeDeviceName: Bool
    ) {
        this.serviceUuids = serviceUuids
        this.manufactureData = manufactureData
        this.serviceData = serviceData
        this.includeDeviceName = includeDeviceName
    }

    init() {
        this.serviceUuids = CArrString(CPointer(), 0)
        this.manufactureData = CArrNativeManufactureData(CPointer(), 0)
        this.serviceData = CArrNativeServiceData(CPointer(), 0)
        this.includeDeviceName = false
    }

    unsafe func free() {
        serviceUuids.free()
        manufactureData.free()
        serviceData.free()
    }
}

/**
 * Describes the advertising data.
 *
 * @relation interface AdvertiseData
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertiseData {
    /**
     * The specified service UUID list to this advertisement
     *
     * @relation serviceUuids: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuids: Array<String>
    /**
     * The specified manufacturer data list to this advertisement
     *
     * @relation manufactureData: Array<ManufactureData>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureData: Array<ManufactureData>
    /**
     * The specified service data list to this advertisement
     *
     * @relation serviceData: Array<ServiceData>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceData: Array<ServiceData>
    /**
     * Indicates whether the device name will be included in the advertisement packet.
     *
     * @relation includeDeviceName?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var includeDeviceName: Bool

    /**
     * AdvertiseData constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        serviceUuids: Array<String>,
        manufactureData: Array<ManufactureData>,
        serviceData: Array<ServiceData>,
        includeDeviceName!: Bool = false
    ) {
        this.serviceUuids = serviceUuids
        this.manufactureData = manufactureData
        this.serviceData = serviceData
        this.includeDeviceName = includeDeviceName
    }

    func toNative(): NativeAdvertiseData {
        var cServiceUuids: CArrString = CArrString(CPointer(), 0)
        var cManufactureData: CArrNativeManufactureData = CArrNativeManufactureData(CPointer(), 0)
        var cServiceData: CArrNativeServiceData = CArrNativeServiceData(CPointer(), 0)
        unsafe {
            try {
                cServiceUuids = CArrString(cjArr2CArr<String, CString>(serviceUuids, {i => LibC.mallocCString(i)}),
                    serviceUuids.size)
                cManufactureData = CArrNativeManufactureData(
                    cjArr2CArr<ManufactureData, NativeManufactureData>(manufactureData, {i => i.toNative()}),
                    manufactureData.size)
                cServiceData = CArrNativeServiceData(
                    cjArr2CArr<ServiceData, NativeServiceData>(serviceData, {i => i.toNative()}), serviceData.size)
                return NativeAdvertiseData(
                    cServiceUuids,
                    cManufactureData,
                    cServiceData,
                    includeDeviceName
                )
            } catch (e: Exception) {
                cServiceUuids.free()
                cManufactureData.free()
                cServiceData.free()
                throw e
            }
        }
    }
}

@C
struct NativeManufactureData {
    NativeManufactureData(
        let manufactureId: UInt16,
        let manufactureValue: CArrUI8
    ) {}

    unsafe func free() {
        LibC.free<UInt8>(manufactureValue.head)
    }
}

/**
 * Describes the manufacturer data.
 *
 * @relation interface ManufactureData
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ManufactureData {
    /**
     * Indicates the manufacturer ID assigned by Bluetooth SIG
     *
     * @relation manufactureId: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureId: UInt16
    /**
     * Indicates the manufacturer data to add
     *
     * @relation manufactureValue: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureValue: Array<Byte>

    /**
     * ManufactureData constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        manufactureId: UInt16,
        manufactureValue: Array<Byte>
    ) {
        this.manufactureId = manufactureId
        this.manufactureValue = manufactureValue
    }

    func toNative(): NativeManufactureData {
        unsafe {
            NativeManufactureData(
                manufactureId,
                CArrUI8(cjArr2CArr<UInt8, UInt8>(manufactureValue, {i => i}), manufactureValue.size)
            )
        }
    }
}

@C
struct NativeServiceData {
    NativeServiceData(
        let serviceUuid: CString,
        let serviceValue: CArrUI8
    ) {}

    unsafe func free() {
        LibC.free(serviceUuid)
        LibC.free<UInt8>(serviceValue.head)
    }
}

/**
 * Describes the service data.
 *
 * @relation interface ServiceData
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ServiceData {
    /**
     * Indicates the UUID of the service data to add
     *
     * @relation serviceUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String
    /**
     * Indicates the service data to add
     *
     * @relation serviceValue: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceValue: Array<Byte>

    /**
     * ServiceData constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        serviceUuid: String,
        serviceValue: Array<Byte>
    ) {
        this.serviceUuid = serviceUuid
        this.serviceValue = serviceValue
    }

    func toNative(): NativeServiceData {
        var cUuid: CString = CString(CPointer())
        var cValue: CArrUI8 = CArrUI8(CPointer(), 0)
        unsafe {
            try {
                cUuid = LibC.mallocCString(serviceUuid)
                cValue = CArrUI8(cjArr2CArr<UInt8, UInt8>(serviceValue, {i => i}), serviceValue.size)
                return NativeServiceData(cUuid, cValue)
            } catch (e: Exception) {
                cUuid.free()
                cValue.free()
                throw e
            }
        }
    }
}

@C
struct NativeAdvertisingParams {
    NativeAdvertisingParams(
        let advertisingSettings: NativeAdvertiseSetting,
        let advertisingData: NativeAdvertiseData,
        let advertisingResponse: NativeAdvertiseData,
        let duration: UInt16
    ) {}

    unsafe func free() {
        advertisingData.free()
        advertisingResponse.free()
    }
}

/**
 * Describes the advertising parameters.
 *
 * @relation interface AdvertisingParams
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertisingParams {
    /**
     * Indicates the advertising settings.
     *
     * @relation advertisingSettings: AdvertiseSetting
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var advertisingSettings: AdvertiseSetting
    /**
     * Indicates the advertising data.
     *
     * @relation advertisingData: AdvertiseData
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var advertisingData: AdvertiseData
    /**
     * Indicates the advertising response.
     *
     * @relation advertisingResponse?: AdvertiseData
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var advertisingResponse: AdvertiseData
    /**
     * Indicates the duration for advertising continuously.
     * The duration, in 10ms unit. Valid range is from 1 (10ms) to 65535 (655,350 ms).
     * If this parameter is not specified or is set to 0, advertisement is continuously sent.
     *
     * @relation duration?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var duration: UInt16 = 0

    /**
     * AdvertisingParams constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        advertisingSettings: AdvertiseSetting,
        advertisingData: AdvertiseData,
        advertisingResponse: AdvertiseData,
        duration!: UInt16 = 0
    ) {
        this.advertisingSettings = advertisingSettings
        this.advertisingData = advertisingData
        this.advertisingResponse = advertisingResponse
        this.duration = duration
    }

    func toNative(): NativeAdvertisingParams {
        var cAdvertisingData: NativeAdvertiseData = advertisingData.toNative()
        var cAdvertisingResponse: NativeAdvertiseData = advertisingResponse.toNative()
        unsafe {
            try {
                cAdvertisingData = advertisingData.toNative()
                cAdvertisingResponse = advertisingResponse.toNative()
                NativeAdvertisingParams(
                    advertisingSettings.toNative(),
                    cAdvertisingData,
                    cAdvertisingResponse,
                    duration
                )
            } catch (e: Exception) {
                cAdvertisingData.free()
                cAdvertisingResponse.free()
                throw e
            }
        }
    }
}

@C
struct CAdvertisingStateChangeInfo {
    CAdvertisingStateChangeInfo(
        let advertisingId: Int32,
        let state: Int32
    ) {}

    func toObject() {
        AdvertisingStateChangeInfo(advertisingId, AdvertisingState.parse(state))
    }
}

/**
 * Advertising state change information.
 *
 * @relation interface AdvertisingStateChangeInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertisingStateChangeInfo {
    /**
     * Indicates the ID of current advertising.
     *
     * @relation advertisingId: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var advertisingId: Int32
    /**
     * Indicates the advertising state.
     *
     * @relation state: AdvertisingState
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var state: AdvertisingState

    init(advertisingId: Int32, state: AdvertisingState) {
        this.advertisingId = advertisingId
        this.state = state
    }
}

@C
struct NativeScanResult {
    NativeScanResult(
        var deviceId: CString,
        var rssi: Int32,
        var data: CArrUI8,
        var deviceName: CString,
        var connectable: Bool
    ) {}

    func toObject(): ScanResult {
        unsafe {
            ScanResult(
                deviceId.toString(),
                rssi,
                cArr2cjArr<UInt8, Byte>(data.size, data.head, {i => i}),
                deviceName.toString(),
                connectable
            )
        }
    }
}

/**
 * Describes the contents of the scan results.
 *
 * @relation interface ScanResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ScanResult {
    /**
     * Address of the scanned device
     *
     * @relation deviceId: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: String
    /**
     * RSSI of the remote device
     *
     * @relation rssi: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var rssi: Int32
    /**
     * The raw data of broadcast packet
     *
     * @relation data: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var data: Array<Byte>
    /**
     * The local name of the BLE device
     *
     * @relation deviceName: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceName: String
    /**
     * Connectable of the remote device
     *
     * @relation connectable: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var connectable: Bool

    init(
        deviceId: String,
        rssi: Int32,
        data: Array<Byte>,
        deviceName: String,
        connectable: Bool
    ) {
        this.deviceId = deviceId
        this.rssi = rssi
        this.data = data
        this.deviceName = deviceName
        this.connectable = connectable
    }
}

/**
 * The enum of scan duty.
 *
 * @relation enum ScanDuty
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ScanDuty {
    /**
     * low power mode
     *
     * @relation SCAN_MODE_LOW_POWER = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ScanModeLowPower
    | 
    /**
     * balanced power mode
     *
     * @relation SCAN_MODE_BALANCED = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ScanModeBalanced
    | 
    /**
     * Scan using highest duty cycle
     *
     * @relation SCAN_MODE_LOW_LATENCY = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ScanModeLowLatency
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case ScanModeLowPower => 0
            case ScanModeBalanced => 1
            case ScanModeLowLatency => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * The enum of BLE match mode.
 *
 * @relation enum MatchMode
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum MatchMode {
    /**
     * aggressive mode
     *
     * @relation MATCH_MODE_AGGRESSIVE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MatchModeAggressive
    | 
    /**
     * sticky mode
     *
     * @relation MATCH_MODE_STICKY = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MatchModeSticky
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case MatchModeAggressive => 1
            case MatchModeSticky => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

let ADVERTISING_STATE_MAP = HashMap<Int32, AdvertisingState>(
    [
        (1, Started),
        (2, Enabled),
        (3, Disabled),
        (4, Stopped)
    ]
)

/**
 * The enum of BLE advertising state.
 *
 * @relation enum AdvertisingState
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum AdvertisingState {
    /**
     * advertising started.
     *
     * @relation STARTED = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    Started
    | 
    /**
     * advertising temporarily enabled.
     *
     * @relation ENABLED = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    Enabled
    | 
    /**
     * advertising temporarily disabled.
     *
     * @relation DISABLED = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    Disabled
    | 
    /**
     * advertising stopped.
     *
     * @relation STOPPED = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    Stopped
    | ...


    /**
     * @throws NoneValueException - Value conversion failed.
     */
    static func parse(state: Int32) {
        ADVERTISING_STATE_MAP.get(state) ?? throw NoneValueException("Unknown state value")
    }
}

/**
 * Phy type used during scan.
 *
 * @relation enum PhyType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum PhyType {
    /**
     * Use 1M phy for scanning.
     *
     * @relation PHY_LE_1M = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PhyLe1M
    | 
    /**
     * Use all supported Phys for scanning.
     *
     * @relation PHY_LE_ALL_SUPPORTED = 255
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PhyLeAllSupported
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case PhyLe1M => 1
            case PhyLeAllSupported => 255
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Bluetooth Ble CallbackType
 */
@Derive[ToString, Hashable, Equatable]
@!APILevel[
    21,
    permission: "ohos.permission.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothBleCallbackType {
    /**
     * Advertising State Change
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AdvertisingStateChange
    | 
    /**
     * Ble Device Find
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleDeviceFind
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case AdvertisingStateChange => 0
            case BleDeviceFind => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct CArrScanResult {
    CArrScanResult(
        let head: CPointer<NativeScanResult>,
        let size: Int64
    ) {}
}
