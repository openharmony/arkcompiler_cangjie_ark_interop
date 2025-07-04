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
import ohos.bluetooth.common_util.*
import ohos.labels.*
import ohos.bluetooth.*
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class GattService {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public GattService(
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
        public var isPrimary: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristics: Array<BLECharacteristic>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var includeServices: Array<GattService>
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLECharacteristic {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public BLECharacteristic(
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
        public var characteristicUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristicValue: Array<Byte>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var descriptors: Array<BLEDescriptor>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var properties: GattProperties
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLEDescriptor {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public BLEDescriptor(
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
        public var characteristicUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var descriptorUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var descriptorValue: Array<Byte>
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class GattProperties {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public GattProperties(
        let write!: Bool = true,
        let writeNoResponse!: Bool = true,
        let read!: Bool = true,
        let notify!: Bool = false,
        let indicate!: Bool = false
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class NotifyCharacteristic {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public NotifyCharacteristic(
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
        public var characteristicUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristicValue: Array<Byte>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var confirm: Bool
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class ServerResponse {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public ServerResponse(
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
        public let transId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let status: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let value: Array<Byte>
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum GattWriteType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WRITE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WRITE_NO_RESPONSE
    | ...

    func getValue(): Int32 {
        match (this) {
            case WRITE => 0
            case WRITE_NO_RESPONSE => 1
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class CharacteristicReadRequest {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public CharacteristicReadRequest(
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
        public let transId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let characteristicUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let serviceUuid: String
    ) {}
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class CharacteristicWriteRequest {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public CharacteristicWriteRequest(
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
        public let transId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let isPrepared: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let needRsp: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let value: Array<Byte>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let characteristicUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let serviceUuid: String
    ) {}
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class DescriptorReadRequest {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public DescriptorReadRequest(
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
        public let transId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let descriptorUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let characteristicUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let serviceUuid: String
    ) {}
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class DescriptorWriteRequest {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public DescriptorWriteRequest(
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
        public let transId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let isPrepared: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let needRsp: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let value: Array<Byte>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let descriptorUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let characteristicUuid: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let serviceUuid: String
    ) {}
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BLEConnectionChangeState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public BLEConnectionChangeState(
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
        public var state: ProfileConnectionState
    ) {}
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothBleGattServerCallbackType {
    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CHARACTERISTIC_READ
    | @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CHARACTERISTIC_WRITE
    | @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DESCRIPTOR_READ
    | @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DESCRIPTOR_WRITE
    | @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CONNECTION_STATE_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BLE_MTU_CHANGE
    | ...

    func getValue(): Int32 {
        match (this) {
            case CHARACTERISTIC_READ => 0
            case CHARACTERISTIC_WRITE => 1
            case DESCRIPTOR_READ => 2
            case DESCRIPTOR_WRITE => 3
            case CONNECTION_STATE_CHANGE => 4
            case BLE_MTU_CHANGE => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothBleGattClientDeviceCallbackType {
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BLE_CHARACTERISTIC_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BLE_CONNECTION_STATE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BLE_MTU_CHANGE
    | ...

    func getValue(): Int32 {
        match (this) {
            case BLE_CHARACTERISTIC_CHANGE => 0
            case BLE_CONNECTION_STATE_CHANGE => 1
            case BLE_MTU_CHANGE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
