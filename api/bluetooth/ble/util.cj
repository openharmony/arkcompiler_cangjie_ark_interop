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

import std.deriving.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.{ArrayList, HashMap}

const BLE_ADV_DEFAULT_INTERVAL: UInt16 = 1600
const BLE_ADV_TX_POWER_MEDIUM_VALUE: Int8 = -7

/**
 * Describes the criteria for filtering scanning results can be set.
 *
 * @typedef ScanFilter
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ScanFilter {
    /**
     * The address of a BLE peripheral device
     *
     * @type { ?String }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: ?String = None
    /**
     * The name of a BLE peripheral device
     *
     * @type { ?String }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var name: ?String = None
    /**
     * The service UUID of a BLE peripheral device
     *
     * @type { ?String }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: ?String = None

    /**
     * Service UUID mask.
     *
     * @type { ?String }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuidMask: ?String = None

    /**
     * Service solicitation UUID.
     *
     * @type { ?String }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceSolicitationUuid: ?String = None

    /**
     * Service solicitation UUID mask.
     *
     * @type { ?String }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceSolicitationUuidMask: ?String = None

    /**
     * Service data.
     *
     * @type { ?Array<Byte> }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceData: ?Array<Byte> = None

    /**
     * Service data mask.
     *
     * @type { ?Array<Byte> }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceDataMask: ?Array<Byte> = None

    /**
     * Manufacture id.
     *
     * @type { UInt16 }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureId: UInt16 = 0

    /**
     * Manufacture data.
     *
     * @type { ?Array<Byte> }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureData: ?Array<Byte> = None

    /**
     * Manufacture data mask.
     *
     * @type { ?Array<Byte> }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureDataMask: ?Array<Byte> = None

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
 * @typedef ScanOptions
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ScanOptions {
    /**
     * Time of delay for reporting the scan result
     *
     * @type { Int32 }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var interval: Int32 = 0

    /**
     * Bluetooth LE scan mode
     *
     * @type { ScanDuty }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var dutyMode: ScanDuty = SCAN_MODE_LOW_POWER

    /**
     * Match mode for Bluetooth LE scan filters hardware match
     *
     * @type { MatchMode }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var matchMode: MatchMode = MATCH_MODE_AGGRESSIVE

    /**
     * Physical Layer used during scan.
     *
     * @type { PhyType }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var phyType: PhyType = PHY_LE_1M
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
 * @typedef AdvertiseSetting
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertiseSetting {
    /**
     * Minimum slot value for the advertising interval, which is {@code 32} (20 ms)
     * Maximum slot value for the advertising interval, which is {@code 16777215} (10485.759375s)
     * Default slot value for the advertising interval, which is {@code 1600} (1s)
     *
     * @type { UInt16 }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var interval: UInt16 = BLE_ADV_DEFAULT_INTERVAL

    /**
     * Minimum transmission power level for advertising, which is {@code -127}
     * Maximum transmission power level for advertising, which is {@code 1}
     * Default transmission power level for advertising, which is {@code -7}
     *
     * @type { Int8 }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var txPower: Int8 = BLE_ADV_TX_POWER_MEDIUM_VALUE

    /**
     * Indicates whether the BLE is connectable, default is {@code true}
     *
     * @type { Bool }
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var connectable: Bool = true
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
 * @typedef AdvertiseData
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertiseData {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public AdvertiseData(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var serviceUuids: Array<String>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var manufactureData: Array<ManufactureData>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var serviceData: Array<ServiceData>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var includeDeviceName!: Bool = false
    ) {}

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
 * @typedef ManufactureData
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ManufactureData {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public ManufactureData(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var manufactureId: UInt16,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var manufactureValue: Array<Byte>
    ) {}

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
 * @typedef ServiceData
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ServiceData {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public ServiceData(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var serviceUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var serviceValue: Array<Byte>
    ) {}

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

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertisingParams {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public AdvertisingParams(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingSettings: AdvertiseSetting,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingData: AdvertiseData,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingResponse: AdvertiseData,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var duration!: UInt16 = 0
    ) {}

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
 * @typedef AdvertisingStateChangeInfo
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertisingStateChangeInfo {
    AdvertisingStateChangeInfo(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingId: Int32,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var state: AdvertisingState
    ) {}
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
 * @typedef ScanResult
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ScanResult {
    ScanResult(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceId: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let rssi: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let data: Array<Byte>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceName: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let connectable: Bool
    ) {}
}

@C
struct NativeAdvertisingEnableParams {
    NativeAdvertisingEnableParams(
        let advertisingId: UInt32,
        let duration: UInt16
    ) {}
}

/**
 * Parameter for dynamically enable advertising.
 *
 * @typedef AdvertisingEnableParams
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertisingEnableParams {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public AdvertisingEnableParams(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingId: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var duration!: UInt16 = 0
    ) {}

    func toNative(): NativeAdvertisingEnableParams {
        NativeAdvertisingEnableParams(
            advertisingId,
            duration
        )
    }
}

@C
struct NativeAdvertisingDisableParams {
    NativeAdvertisingDisableParams(let advertisingId: UInt32) {}
}

/**
 * Parameter for dynamically disable advertising.
 *
 * @typedef AdvertisingDisableParams
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class AdvertisingDisableParams {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public AdvertisingDisableParams(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingId: UInt32
    ) {}

    func toNative(): NativeAdvertisingDisableParams {
        NativeAdvertisingDisableParams(advertisingId)
    }
}

/**
 * The enum of scan duty.
 *
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ScanDuty {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_LOW_POWER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_BALANCED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_LOW_LATENCY
    | ...

    func getValue(): Int32 {
        match (this) {
            case SCAN_MODE_LOW_POWER => 0
            case SCAN_MODE_BALANCED => 1
            case SCAN_MODE_LOW_LATENCY => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * The enum of BLE match mode.
 *
 * @syscap SystemCapability.Communication.Bluetooth.Core
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum MatchMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MATCH_MODE_AGGRESSIVE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MATCH_MODE_STICKY
    | ...

    func getValue(): Int32 {
        match (this) {
            case MATCH_MODE_AGGRESSIVE => 1
            case MATCH_MODE_STICKY => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

let ADVERTISING_STATE_MAP = HashMap<Int32, AdvertisingState>(
    [
        (1, STARTED),
        (2, ENABLED),
        (3, DISABLED),
        (4, STOPPED)
    ]
)

/**
 * The enum of BLE advertising state.
 *
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum AdvertisingState {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STARTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ENABLED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DISABLED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STOPPED
    | ...

    static func parse(state: Int32) {
        ADVERTISING_STATE_MAP.get(state) ?? throw NoneValueException("Unknown state value")
    }
}

/**
 * Phy type used during scan.
 *
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum PhyType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PHY_LE_1M
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PHY_LE_ALL_SUPPORTED
    | ...

    func getValue(): Int32 {
        match (this) {
            case PHY_LE_1M => 1
            case PHY_LE_ALL_SUPPORTED => 255
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothBleCallbackType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ADVERTISING_STATE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BLE_DEVICE_FIND
    | ...

    func getValue(): Int32 {
        match (this) {
            case ADVERTISING_STATE_CHANGE => 0
            case BLE_DEVICE_FIND => 1
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
