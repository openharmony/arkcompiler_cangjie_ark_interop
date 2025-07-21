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

import ohos.base.CStringExtend
import ohos.bluetooth.constant.ProfileConnectionState
import ohos.ffi.{ CArrUI8, cArr2cjArr, cjArr2CArr}
import ohos.labels.APILevel

import std.deriving.Derive

@C
struct NativeGattService {
    NativeGattService(
        let serviceUuid: CString,
        let isPrimary: Bool,
        let characteristics: CArrBLECharacteristic,
        let includeServices: CArrGattService
    ) {}

    func toObject(): GattService {
        GattService(
            // Universally Unique Identifier translation does not throw exception.
            serviceUuid.toString(),
            isPrimary,
            unsafe {
                cArr2cjArr<NativeBLECharacteristic, BLECharacteristic>(characteristics.size, characteristics.head) {
                    v: NativeBLECharacteristic => v.toObject()
                }
            },
            unsafe {
                cArr2cjArr<NativeGattService, GattService>(includeServices.size, includeServices.head) {
                    v: NativeGattService => v.toObject()
                }
            }
        )
    }

    unsafe func free(): Unit {
        serviceUuid.free()
        characteristics.free()
        includeServices.free()
    }
}

@C
struct CArrBLECharacteristic {
    CArrBLECharacteristic(
        let head: CPointer<NativeBLECharacteristic>,
        let size: Int64
    ) {}

    unsafe func free() {
        if (head.isNull()) {
            return
        }
        for (i in 0..this.size) {
            head.read(i).free()
        }
        LibC.free<NativeBLECharacteristic>(head)
    }
}

@C
struct CArrGattService {
    CArrGattService(
        let head: CPointer<NativeGattService>,
        let size: Int64
    ) {}

    unsafe func free() {
        if (head.isNull()) {
            return
        }
        for (i in 0..this.size) {
            head.read(i).free()
        }
        LibC.free<NativeGattService>(head)
    }
}

/**
 * Describes the Gatt service.
 *
 * @relation interface GattService
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class GattService {
    /**
     * The UUID of a GattService instance.
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
     * Indicates whether the GattService instance is primary or secondary.
     *
     * @relation isPrimary: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var isPrimary: Bool
    /**
     * The BLECharacteristic list belongs to this GattService instance.
     *
     * @relation characteristics: Array<BLECharacteristic>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristics: Array<BLECharacteristic>
    /**
     * The list of GATT services contained in the service.
     *
     * @relation includeServices?: Array<GattService>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var includeServices: Array<GattService>

    /**
     * GattService constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        serviceUuid: String,
        isPrimary: Bool,
        characteristics: Array<BLECharacteristic>,
        includeServices: Array<GattService>
    ) {
        this.serviceUuid = serviceUuid
        this.isPrimary = isPrimary
        this.characteristics = characteristics
        this.includeServices = includeServices
    }

    unsafe func toNative(): NativeGattService {
        var cServiceUuid: CString = CString(CPointer())
        var cCharacteristics: CArrBLECharacteristic = CArrBLECharacteristic(CPointer(), 0)
        var cIncludeServices: CArrGattService = CArrGattService(CPointer(), 0)
        try {
            cServiceUuid = LibC.mallocCString(serviceUuid)
            cCharacteristics = CArrBLECharacteristic(
                cjArr2CArr<BLECharacteristic, NativeBLECharacteristic>(characteristics,
                    {v: BLECharacteristic => v.toNative()}), characteristics.size)
            cIncludeServices = CArrGattService(
                cjArr2CArr<GattService, NativeGattService>(includeServices, {v: GattService => v.toNative()}),
                includeServices.size)
            NativeGattService(
                cServiceUuid,
                isPrimary,
                cCharacteristics,
                cIncludeServices
            )
        } catch (e: Exception) {
            cServiceUuid.free()
            cCharacteristics.free()
            cIncludeServices.free()
            throw e
        }
    }
}

@C
struct RetNativeBLECharacteristic {
    RetNativeBLECharacteristic(
        let code: Int32,
        let data: NativeBLECharacteristic
    ) {}
}

@C
struct NativeBLECharacteristic {
    let serviceUuid: CString
    let characteristicUuid: CString
    let characteristicValue: CArrUI8
    let descriptors: CArrBLEDescriptor
    let properties: NativeGattProperties
    NativeBLECharacteristic(
        serviceUuid: CString,
        characteristicUuid: CString,
        characteristicValue: CArrUI8,
        descriptors: CArrBLEDescriptor,
        properties: NativeGattProperties
    ) {
        this.serviceUuid = serviceUuid
        this.characteristicUuid = characteristicUuid
        this.characteristicValue = characteristicValue
        this.descriptors = descriptors
        this.properties = properties
    }

    init() {
        this.serviceUuid = CString(CPointer())
        this.characteristicUuid = CString(CPointer())
        this.characteristicValue = CArrUI8(CPointer(), 0)
        this.descriptors = CArrBLEDescriptor(CPointer(), 0)
        this.properties = NativeGattProperties()
    }

    func toObject(): BLECharacteristic {
        BLECharacteristic(
            // Universally Unique Identifier translation does not throw exception.
            serviceUuid.toString(),
            characteristicUuid.toString(),
            unsafe { cArr2cjArr<UInt8, Byte>(characteristicValue.size, characteristicValue.head) {i => i} },
            unsafe {
                cArr2cjArr<NativeBLEDescriptor, BLEDescriptor>(descriptors.size, descriptors.head) {
                    v: NativeBLEDescriptor => v.toObject()
                }
            },
            properties.toObject()
        )
    }

    unsafe func free(): Unit {
        serviceUuid.free()
        characteristicUuid.free()
        LibC.free<UInt8>(characteristicValue.head)
        descriptors.free()
        // Members of NativeGattProperties do not need to be released.
    }
}

@C
struct CArrBLEDescriptor {
    CArrBLEDescriptor(
        let head: CPointer<NativeBLEDescriptor>,
        let size: Int64
    ) {}

    unsafe func free() {
        if (head.isNull()) {
            return
        }
        for (i in 0..this.size) {
            head.read(i).free()
        }
        LibC.free<NativeBLEDescriptor>(head)
    }
}

/**
 * Describes the Gatt characteristic.
 *
 * @relation interface BLECharacteristic
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLECharacteristic {
    /**
     * The UUID of the GattService instance to which the characteristic belongs
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
     * The UUID of a BLECharacteristic instance
     *
     * @relation characteristicUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    /**
     * The value of a BLECharacteristic instance
     *
     * @relation characteristicValue: ArrayBuffer
     */    
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicValue: Array<Byte>
    /**
     * The list of BLEDescriptor contained in the characteristic
     *
     * @relation descriptors: Array<BLEDescriptor>
     */    
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptors: Array<BLEDescriptor>
    /**
     * The properties of a BLECharacteristic instance
     *
     * @relation properties?: GattProperties
     */    
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var properties: GattProperties

    /**
     * BLECharacteristic constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        serviceUuid: String,
        characteristicUuid: String,
        characteristicValue: Array<Byte>,
        descriptors: Array<BLEDescriptor>,
        properties: GattProperties
    ) {
        this.serviceUuid = serviceUuid
        this.characteristicUuid = characteristicUuid
        this.characteristicValue = characteristicValue
        this.descriptors = descriptors
        this.properties = properties
    }

    unsafe func toNative(): NativeBLECharacteristic {
        var cServiceUuid: CString = CString(CPointer())
        var cCharacteristicUuid: CString = CString(CPointer())
        var cCharacteristicValue: CArrUI8 = CArrUI8(CPointer(), 0)
        var cDescriptors: CArrBLEDescriptor = CArrBLEDescriptor(CPointer(), 0)
        var cProperties: NativeGattProperties = NativeGattProperties()
        try {
            cServiceUuid = LibC.mallocCString(serviceUuid)
            cCharacteristicUuid = LibC.mallocCString(characteristicUuid)
            cCharacteristicValue = CArrUI8(cjArr2CArr<Byte, UInt8>(characteristicValue, {i => i}),
                characteristicValue.size)
            cDescriptors = CArrBLEDescriptor(
                cjArr2CArr<BLEDescriptor, NativeBLEDescriptor>(descriptors, {v: BLEDescriptor => v.toNative()}),
                descriptors.size)
            cProperties = properties.toNative()
            NativeBLECharacteristic(
                cServiceUuid,
                cCharacteristicUuid,
                cCharacteristicValue,
                cDescriptors,
                cProperties
            )
        } catch (e: Exception) {
            cServiceUuid.free()
            cCharacteristicUuid.free()
            cCharacteristicValue.free()
            cDescriptors.free()
            throw e
        }
    }
}

@C
struct RetNativeBLEDescriptor {
    RetNativeBLEDescriptor(
        let code: Int32,
        let data: NativeBLEDescriptor
    ) {}
}

@C
struct NativeBLEDescriptor {
    NativeBLEDescriptor(
        let serviceUuid: CString,
        let characteristicUuid: CString,
        let descriptorUuid: CString,
        let descriptorValue: CArrUI8
    ) {}

    func toObject(): BLEDescriptor {
        BLEDescriptor(
            // Universally Unique Identifier translation does not throw exception.
            serviceUuid.toString(),
            characteristicUuid.toString(),
            descriptorUuid.toString(),
            unsafe { cArr2cjArr<UInt8, Byte>(descriptorValue.size, descriptorValue.head) {i => i} }
        )
    }

    unsafe func free(): Unit {
        serviceUuid.free()
        characteristicUuid.free()
        descriptorUuid.free()
        LibC.free<UInt8>(descriptorValue.head)
    }
}

/**
 * Describes the Gatt descriptor.
 *
 * @relation interface BLEDescriptor
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLEDescriptor {
    /**
     * The UUID of the GattService instance to which the descriptor belongs
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
     * The UUID of the BLECharacteristic instance to which the descriptor belongs
     *
     * @relation characteristicUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    /**
     * The UUID of the BLEDescriptor instance
     *
     * @relation descriptorUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorUuid: String
    /**
     * The value of the BLEDescriptor instance
     *
     * @relation descriptorValue: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorValue: Array<Byte>

    /**
     * BLEDescriptor constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        serviceUuid: String,
        characteristicUuid: String,
        descriptorUuid: String,
        descriptorValue: Array<Byte>
    ) {
        this.serviceUuid = serviceUuid
        this.characteristicUuid = characteristicUuid
        this.descriptorUuid = descriptorUuid
        this.descriptorValue = descriptorValue
    }

    unsafe func toNative(): NativeBLEDescriptor {
        var nativeServiceUuid: CString = CString(CPointer())
        var nativeCharacteristicUuid: CString = CString(CPointer())
        var nativeDescriptorUuid: CString = CString(CPointer())

        try {
            nativeServiceUuid = LibC.mallocCString(serviceUuid)
            nativeCharacteristicUuid = LibC.mallocCString(characteristicUuid)
            nativeDescriptorUuid = LibC.mallocCString(descriptorUuid)
        } catch (e: Exception) {
            nativeServiceUuid.free()
            nativeCharacteristicUuid.free()
            throw e
        }
        NativeBLEDescriptor(
            nativeServiceUuid,
            nativeCharacteristicUuid,
            nativeDescriptorUuid,
            CArrUI8(cjArr2CArr<Byte, UInt8>(descriptorValue, {i => i}), descriptorValue.size)
        )
    }
}

@C
struct NativeGattProperties {
    let write: Bool
    let writeNoResponse: Bool
    let read: Bool
    let notify: Bool
    let indicate: Bool

    NativeGattProperties(
        write: Bool,
        writeNoResponse: Bool,
        read: Bool,
        notify: Bool,
        indicate: Bool
    ) {
        this.write = write
        this.writeNoResponse = writeNoResponse
        this.read = read
        this.notify = notify
        this.indicate = indicate
    }

    init() {
        this.write = true
        this.writeNoResponse = true
        this.read = true
        this.notify = false
        this.indicate = false
    }

    func toObject(): GattProperties {
        GattProperties(
            write: this.write,
            writeNoResponse: this.writeNoResponse,
            read: this.read,
            notify: this.notify,
            indicate: this.indicate
        )
    }
}

/**
 * Describes the properties of a gatt characteristic.
 *
 * @relation interface GattProperties
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class GattProperties {
    /**
     * Support write property of the characteristic.
     *
     * @relation write?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var write: Bool
    /**
     * Support write no response property of the characteristic.
     *
     * @relation writeNoResponse?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var writeNoResponse: Bool
    /**
     * Support read property of the characteristic.
     *
     * @relation read?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var read: Bool
    /**
     * Support notify property of the characteristic.
     *
     * @relation notify?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var notify: Bool
    /**
     * Support indicate property of the characteristic.
     *
     * @relation indicate?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var indicate: Bool

    /**
     * GattProperties constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        write!: Bool = true,
        writeNoResponse!: Bool = true,
        read!: Bool = true,
        notify!: Bool = false,
        indicate!: Bool = false
    ) {
        this.write = write
        this.writeNoResponse = writeNoResponse
        this.read = read
        this.notify = notify
        this.indicate = indicate
    }

    unsafe func toNative(): NativeGattProperties {
        NativeGattProperties(
            write,
            writeNoResponse,
            read,
            notify,
            indicate
        )
    }
}

@C
struct NativeNotifyCharacteristic {
    NativeNotifyCharacteristic(
        let serviceUuid: CString,
        let characteristicUuid: CString,
        let characteristicValue: CArrUI8,
        let confirm: Bool
    ) {}

    unsafe func free(): Unit {
        serviceUuid.free()
        characteristicUuid.free()
        LibC.free<UInt8>(characteristicValue.head)
    }
}

/**
 * Describes the value of the indication or notification sent by the Gatt server.
 *
 * @relation interface NotifyCharacteristic
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class NotifyCharacteristic {
    /**
     * The UUID of the GattService instance to which the characteristic belongs
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
     * The UUID of a NotifyCharacteristic instance
     *
     * @relation characteristicUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    /**
     * The value of a NotifyCharacteristic instance
     *
     * @relation characteristicValue: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicValue: Array<Byte>
    /**
     * Specifies whether to request confirmation from the BLE peripheral device (indication) or
     * send a notification. Value true indicates the former and false indicates the latter.
     *
     * @relation confirm: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var confirm: Bool

    /**
     * NotifyCharacteristic constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        serviceUuid: String,
        characteristicUuid: String,
        characteristicValue: Array<Byte>,
        confirm: Bool
    ) {
        this.serviceUuid = serviceUuid
        this.characteristicUuid = characteristicUuid
        this.characteristicValue = characteristicValue
        this.confirm = confirm
    }

    unsafe func toNative(): NativeNotifyCharacteristic {
        var cServiceUuid: CString = CString(CPointer())
        var cCharacteristicUuid: CString = CString(CPointer())
        var cCharacteristicValue: CArrUI8 = CArrUI8(CPointer(), 0)
        try {
            cServiceUuid = LibC.mallocCString(serviceUuid)
            cCharacteristicUuid = LibC.mallocCString(characteristicUuid)
            cCharacteristicValue = CArrUI8(cjArr2CArr<Byte, UInt8>(characteristicValue, {i => i}),
                characteristicValue.size)
            NativeNotifyCharacteristic(
                cServiceUuid,
                cCharacteristicUuid,
                cCharacteristicValue,
                confirm
            )
        } catch (e: Exception) {
            cServiceUuid.free()
            cCharacteristicUuid.free()
            cCharacteristicValue.free()
            throw e
        }
    }
}

@C
struct NativeServerResponse {
    NativeServerResponse(
        let deviceId: CString,
        let transId: Int32,
        let status: Int32,
        let offset: Int32,
        let value: CArrUI8
    ) {}

    unsafe func free(): Unit {
        deviceId.free()
        LibC.free<UInt8>(value.head)
    }
}

/**
 * Describes the parameters of a response send by the server to a specified read or write request.
 *
 * @relation interface ServerResponse
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ServerResponse {
    /**
     * Indicates the address of the client to which to send the response
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
     * The Id of the write request
     *
     * @relation transId: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    /**
     * Indicates the status of the read or write request, set this parameter to '0' in normal cases
     *
     * @relation status: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var status: Int32
    /**
     * Indicates the byte offset of the start position for reading or writing operation
     *
     * @relation offset: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    /**
     * Indicates the value to be sent
     *
     * @relation value: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var value: Array<Byte>

    /**
     * ServerResponse constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        deviceId: String,
        transId: Int32,
        status: Int32,
        offset: Int32,
        value: Array<Byte>
    ) {
        this.deviceId = deviceId
        this.transId = transId
        this.status = status
        this.offset = offset
        this.value = value
    }

    unsafe func toNative(): NativeServerResponse {
        var cDeviceId = CString(CPointer())
        var cValue = CArrUI8(CPointer(), 0)
        try {
            cDeviceId = LibC.mallocCString(deviceId)
            cValue = CArrUI8(cjArr2CArr<Byte, UInt8>(value, {i => i}), value.size)
            NativeServerResponse(
                cDeviceId,
                transId,
                status,
                offset,
                cValue
            )
        } catch (e: Exception) {
            cDeviceId.free()
            cValue.free()
            throw e
        }
    }
}

/**
 * The enum of gatt characteristic write type
 *
 * @relation enum GattWriteType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum GattWriteType {
    /**
     * Write characteristic with response.
     *
     * @relation WRITE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    Write
    | 
    /**
     * Write characteristic without response.
     *
     * @relation WRITE_NO_RESPONSE = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WriteNoResponse
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case Write => 0
            case WriteNoResponse => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct NativeCharacteristicReadRequest {
    NativeCharacteristicReadRequest(
        let deviceId: CString,
        let transId: Int32,
        let offset: Int32,
        let characteristicUuid: CString,
        let serviceUuid: CString
    ) {}

    func toObject(): CharacteristicReadRequest {
        CharacteristicReadRequest(
            // MAC address translation does not throw exception.
            deviceId.toString(),
            transId,
            offset,
            // Universally Unique Identifier translation does not throw exception.
            characteristicUuid.toString(),
            serviceUuid.toString()
        )
    }
}

/**
 * Describes the parameters of the Gatt client's characteristic read request.
 *
 * @relation interface CharacteristicReadRequest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class CharacteristicReadRequest {
    /**
     * Indicates the address of the client that initiates the read request
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
     * The Id of the read request
     *
     * @relation transId: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    /**
     * Indicates the byte offset of the start position for reading characteristic value
     *
     * @relation offset: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    /**
     * The UUID of a CharacteristicReadRequest instance
     *
     * @relation characteristicUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    /**
     * The UUID of the service to which the characteristic belongs
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
     * CharacteristicReadRequest constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        deviceId: String,
        transId: Int32,
        offset: Int32,
        characteristicUuid: String,
        serviceUuid: String
    ) {
        this.deviceId = deviceId
        this.transId = transId
        this.offset = offset
        this.characteristicUuid = characteristicUuid
        this.serviceUuid = serviceUuid
    }
}

@C
struct NativeCharacteristicWriteRequest {
    NativeCharacteristicWriteRequest(
        let deviceId: CString,
        let transId: Int32,
        let offset: Int32,
        let isPrepared: Bool,
        let needRsp: Bool,
        let value: CArrUI8,
        let characteristicUuid: CString,
        let serviceUuid: CString
    ) {}

    func toObject(): CharacteristicWriteRequest {
        CharacteristicWriteRequest(
            // MAC address translation does not throw exception.
            deviceId.toString(),
            transId,
            offset,
            isPrepared,
            needRsp,
            unsafe { cArr2cjArr<UInt8, Byte>(value.size, value.head) {i => i} },
            // Universally Unique Identifier translation does not throw exception.
            characteristicUuid.toString(),
            serviceUuid.toString()
        )
    }
}

/**
 * Describes the parameters of the of the Gatt client's characteristic write request.
 *
 * @relation interface CharacteristicWriteRequest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class CharacteristicWriteRequest {
    /**
     * Indicates the address of the client that initiates the write request
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
     * The Id of the write request
     *
     * @relation transId: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    /**
     * Indicates the byte offset of the start position for writing characteristic value
     *
     * @relation offset: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    /**
     * Whether this request should be pending for later operation
     *
     * @relation isPrepared: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var isPrepared: Bool
    /**
     * Whether the remote client need a response
     *
     * @relation needRsp: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var needRsp: Bool
    /**
     * Indicates the value to be written
     *
     * @relation value: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var value: Array<Byte>
    /**
     * The UUID of a CharacteristicWriteRequest instance
     *
     * @relation characteristicUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    /**
     * The UUID of the service to which the characteristic belongs
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
     * CharacteristicWriteRequest constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        deviceId: String,
        transId: Int32,
        offset: Int32,
        isPrepared: Bool,
        needRsp: Bool,
        value: Array<Byte>,
        characteristicUuid: String,
        serviceUuid: String
    ) {
        this.deviceId = deviceId
        this.transId = transId
        this.offset = offset
        this.isPrepared = isPrepared
        this.needRsp = needRsp
        this.value = value
        this.characteristicUuid = characteristicUuid
        this.serviceUuid = serviceUuid
    }
}

@C
struct NativeDescriptorReadRequest {
    NativeDescriptorReadRequest(
        let deviceId: CString,
        let transId: Int32,
        let offset: Int32,
        let descriptorUuid: CString,
        let characteristicUuid: CString,
        let serviceUuid: CString
    ) {}

    func toObject(): DescriptorReadRequest {
        DescriptorReadRequest(
            // MAC address translation does not throw exception.
            deviceId.toString(),
            transId,
            offset,
            // Universally Unique Identifier translation does not throw exception.
            descriptorUuid.toString(),
            characteristicUuid.toString(),
            serviceUuid.toString()
        )
    }
}

/**
 * Describes the parameters of the Gatt client's descriptor read request.
 *
 * @relation interface DescriptorReadRequest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class DescriptorReadRequest {
    /**
     * Indicates the address of the client that initiates the read request
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
     * The Id of the read request
     *
     * @relation transId: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    /**
     * Indicates the byte offset of the start position for reading characteristic value
     *
     * @relation offset: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    /**
     * The UUID of a DescriptorReadRequest instance
     *
     * @relation descriptorUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorUuid: String
    /**
     * The UUID of the characteristic to which the descriptor belongs
     *
     * @relation characteristicUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    /**
     * The UUID of the service to which the descriptor belongs
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
     * DescriptorReadRequest constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        deviceId: String,
        transId: Int32,
        offset: Int32,
        descriptorUuid: String,
        characteristicUuid: String,
        serviceUuid: String
    ) {
        this.deviceId = deviceId
        this.transId = transId
        this.offset = offset
        this.descriptorUuid = descriptorUuid
        this.characteristicUuid = characteristicUuid
        this.serviceUuid = serviceUuid
    }
}

@C
struct NativeDescriptorWriteRequest {
    NativeDescriptorWriteRequest(
        let deviceId: CString,
        let transId: Int32,
        let offset: Int32,
        let isPrepared: Bool,
        let needRsp: Bool,
        let value: CArrUI8,
        let descriptorUuid: CString,
        let characteristicUuid: CString,
        let serviceUuid: CString
    ) {}

    func toObject(): DescriptorWriteRequest {
        DescriptorWriteRequest(
            // MAC address translation does not throw exception.
            deviceId.toString(),
            transId,
            offset,
            isPrepared,
            needRsp,
            unsafe { cArr2cjArr<UInt8, Byte>(value.size, value.head) {i => i} },
            // Universally Unique Identifier translation does not throw exception.
            descriptorUuid.toString(),
            characteristicUuid.toString(),
            serviceUuid.toString()
        )
    }
}

/**
 * Describes the parameters of the Gatt client's characteristic write request.
 *
 * @relation interface DescriptorWriteRequest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class DescriptorWriteRequest {
    /**
     * Indicates the address of the client that initiates the write request
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
     * The Id of the write request
     *
     * @relation transId: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    /**
     * Indicates the byte offset of the start position for writing characteristic value
     *
     * @relation offset: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    /**
     * Whether this request should be pending for later operation
     *
     * @relation isPrepared: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var isPrepared: Bool
    /**
     * Whether the remote client need a response
     *
     * @relation needRsp: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var needRsp: Bool
    /**
     * Indicates the value to be written
     *
     * @relation value: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var value: Array<Byte>
    /**
     * The UUID of a DescriptorWriteRequest instance
     *
     * @relation descriptorUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorUuid: String
    /**
     * The UUID of the characteristic to which the descriptor belongs
     *
     * @relation characteristicUuid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    /**
     * The UUID of the service to which the descriptor belongs
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
     * DescriptorWriteRequest constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        deviceId: String,
        transId: Int32,
        offset: Int32,
        isPrepared: Bool,
        needRsp: Bool,
        value: Array<Byte>,
        descriptorUuid: String,
        characteristicUuid: String,
        serviceUuid: String
    ) {
        this.deviceId = deviceId
        this.transId = transId
        this.offset = offset
        this.isPrepared = isPrepared
        this.needRsp = needRsp
        this.value = value
        this.descriptorUuid = descriptorUuid
        this.characteristicUuid = characteristicUuid
        this.serviceUuid = serviceUuid
    }
}

@C
struct NativeBLEConnectionChangeState {
    NativeBLEConnectionChangeState(
        let deviceId: CString,
        let state: Int32
    ) {}

    func toObject(): BLEConnectionChangeState {
        BLEConnectionChangeState(
            // MAC address translation does not throw exception.
            deviceId.toString(),
            ProfileConnectionState.parse(state)
        )
    }
}

/**
 * Describes the Gatt profile connection state.
 *
 * @relation interface BLEConnectionChangeState
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLEConnectionChangeState {
    /**
     * Indicates the peer device address
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
     * Connection state of the Gatt profile
     *
     * @relation state: ProfileConnectionState
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var state: ProfileConnectionState

    /**
     * BLEConnectionChangeState constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public init(
        deviceId: String,
        state: ProfileConnectionState
    ) {
        this.deviceId = deviceId
        this.state = state
    }
}

/**
 * Bluetooth Ble GattServer CallbackType.
 */
@Derive[ToString, Hashable, Equatable]
@!APILevel[
    21,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothBleGattServerCallbackType {
    /**
     * Characteristic Read
     */
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CharacteristicRead
    | 
    /**
     * Characteristic Write
     */
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CharacteristicWrite
    | 
    /**
     * Descriptor Read
     */
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DescriptorRead
    | 
    /**
     * Descriptor Write
     */    
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DescriptorWrite
    | 
    /**
     * Connection State Change
     */    
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectionStateChange
    | 
    /**
     * Ble Mtu Change
     */
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleMtuChange
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case CharacteristicRead => 0
            case CharacteristicWrite => 1
            case DescriptorRead => 2
            case DescriptorWrite => 3
            case ConnectionStateChange => 4
            case BleMtuChange => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Bluetooth Ble GattClientDevice CallbackType.
 */
@Derive[ToString, Hashable, Equatable]
@!APILevel[
    21,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothBleGattClientDeviceCallbackType {
    /**
     * Ble Characteristic Change
     */
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleCharacteristicChange
    | 
    /**
     * BleConnection State Change
     */
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleConnectionStateChange
    | 
    /**
     * Ble Mtu Change
     */
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleMtuChange
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case BleCharacteristicChange => 0
            case BleConnectionStateChange => 1
            case BleMtuChange => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
