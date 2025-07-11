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
import ohos.bluetooth.constant.*
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*

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
 * @typedef GattService
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class GattService {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var isPrimary: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristics: Array<BLECharacteristic>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var includeServices: Array<GattService>

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
 * @typedef BLECharacteristic
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLECharacteristic {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicValue: Array<Byte>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptors: Array<BLEDescriptor>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var properties: GattProperties

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
 * @typedef BLEDescriptor
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLEDescriptor {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorValue: Array<Byte>

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
 * @typedef GattProperties
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class GattProperties {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var write: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var writeNoResponse: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var read: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var notify: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var indicate: Bool

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
 * @typedef NotifyCharacteristic
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class NotifyCharacteristic {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicValue: Array<Byte>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var confirm: Bool

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
 * @typedef ServerResponse
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ServerResponse {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var status: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var value: Array<Byte>

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
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum GattWriteType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    Write
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WriteNoResponse
    | ...

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
 * @typedef CharacteristicReadRequest
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class CharacteristicReadRequest {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String

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
 * @typedef CharacteristicWriteRequest
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class CharacteristicWriteRequest {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var isPrepared: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var needRsp: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var value: Array<Byte>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String

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
 * @typedef DescriptorReadRequest
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class DescriptorReadRequest {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String

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
 * @typedef DescriptorWriteRequest
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class DescriptorWriteRequest {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var transId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var offset: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var isPrepared: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var needRsp: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var value: Array<Byte>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String

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
 * @typedef BLEConnectionChangeState
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLEConnectionChangeState {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var state: ProfileConnectionState

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

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    21,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothBleGattServerCallbackType {
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CharacteristicRead
    | @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CharacteristicWrite
    | @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DescriptorRead
    | @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DescriptorWrite
    | @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectionStateChange
    | @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleMtuChange
    | ...

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

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    21,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothBleGattClientDeviceCallbackType {
    @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleCharacteristicChange
    | @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleConnectionStateChange
    | @!APILevel[
        21,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BleMtuChange
    | ...

    func getValue(): Int32 {
        match (this) {
            case BleCharacteristicChange => 0
            case BleConnectionStateChange => 1
            case BleMtuChange => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
