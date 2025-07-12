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

import ohos.labels.*
import ohos.base.*
import std.collection.{ArrayList, HashMap}
import ohos.ffi.*
import ohos.bluetooth.*

/**
 * Manages GATT client. Before calling an Gatt client method, you must use createGattClientDevice to create an GattClientDevice instance.
 *
 * @relation interface GattClientDevice
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class GattClientDevice <: RemoteDataLite {
    private let callbackMap = HashMap<BluetoothBleGattClientDeviceCallbackType, ArrayList<CallbackObject>>()
    private let registerMap = HashMap<BluetoothBleGattClientDeviceCallbackType, Bool>(
        [
            (BleCharacteristicChange, false),
            (BleConnectionStateChange, false),
            (BleMtuChange, false)
        ]
    )

    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Connects to a BLE peripheral device.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation connect(): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func connect(): Unit {
        var errorCode: Int32 = 0
        unsafe {
            FfiBluetoothBleGattClientDeviceConnect(getID(), inout errorCode)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Disconnects from or stops an ongoing connection to a BLE peripheral device.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation disconnect(): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func disconnect(): Unit {
        var errorCode: Int32 = 0
        unsafe {
            FfiBluetoothBleGattClientDeviceDisconnect(getID(), inout errorCode)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Disables a BLE peripheral device.
     * This method unregisters the device and clears the registered callbacks and handles.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation close(): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func close(): Unit {
        var errorCode: Int32 = 0
        unsafe {
            FfiBluetoothBleGattClientDeviceClose(getID(), inout errorCode)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Obtains the name of BLE peripheral device.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter.Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation getDeviceName(): Promise<string>
     * @relation getDeviceName(callback: AsyncCallback<string>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func getDeviceName(): String {
        var errorCode: Int32 = 0
        var outName: String = ""
        unsafe {
            let name = FfiBluetoothBleGattClientDeviceGetDeviceName(getID(), inout errorCode)
            // may be invalid UTF8 and may be parsed abnormally.
            try {
                outName = name.toString()
            } finally {
                name.free()
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        return outName
    }

    /**
     * Starts discovering services.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation getServices(): Promise<Array<GattService>>
     * @relation getServices(callback: AsyncCallback<Array<GattService>>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func getServices(): Array<GattService> {
        var errorCode: Int32 = 0
        let outServices: Array<GattService>
        unsafe {
            let nativeServices: CArrGattService = FfiBluetoothBleGattClientDeviceGetServices(getID(), inout errorCode)
            outServices = cArr2cjArr<NativeGattService, GattService>(nativeServices.size, nativeServices.head) {
                v: NativeGattService => v.toObject()
            }
            nativeServices.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        return outServices
    }

    /**
     * Reads the characteristic of a BLE peripheral device.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2901000 - Read forbidden.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation readCharacteristicValue(characteristic: BLECharacteristic): Promise<BLECharacteristic>
     * @relation readCharacteristicValue(characteristic: BLECharacteristic, callback: AsyncCallback<BLECharacteristic>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func readCharacteristicValue(
        characteristic: BLECharacteristic,
        callback: (?BusinessException, ?BLECharacteristic) -> Unit
    ): Unit {
        var errorCode: Int32 = 0
        let wrapper = {
            ret: RetNativeBLECharacteristic =>
            let regiestError = ret.code
            if (regiestError != SUCCESS_CODE) {
                let error = BusinessException(regiestError, getErrorMsg(regiestError))
                callback(error, None<BLECharacteristic>)
            } else {
                callback(None<BusinessException>, ret.data.toObject())
            }
        }
        let registerCall = Callback1Param<RetNativeBLECharacteristic, Unit>(wrapper)
        unsafe {
            let inputCharacteristic = characteristic.toNative()
            FfiBluetoothBleGattClientDeviceReadCharacteristicValue(getID(), inputCharacteristic, registerCall.getID(),
                inout errorCode)
            inputCharacteristic.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Reads the descriptor of a BLE peripheral device.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2901000 - Read forbidden.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation readCharacteristicValue(characteristic: BLECharacteristic): Promise<BLECharacteristic>
     * @relation readCharacteristicValue(characteristic: BLECharacteristic, callback: AsyncCallback<BLECharacteristic>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func readDescriptorValue(descriptor: BLEDescriptor, callback: (?BusinessException, ?BLEDescriptor) -> Unit): Unit {
        var errorCode: Int32 = 0
        let wrapper = {
            ret: RetNativeBLEDescriptor =>
            let regiestError = ret.code
            if (regiestError != SUCCESS_CODE) {
                let error = BusinessException(regiestError, getErrorMsg(regiestError))
                callback(error, None<BLEDescriptor>)
            } else {
                callback(None<BusinessException>, ret.data.toObject())
            }
        }
        let registerCall = Callback1Param<RetNativeBLEDescriptor, Unit>(wrapper)
        unsafe {
            let inputDescriptor = descriptor.toNative()
            FfiBluetoothBleGattClientDeviceReadDescriptorValue(getID(), inputDescriptor, registerCall.getID(),
                inout errorCode)
            inputDescriptor.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Writes the characteristic of a BLE peripheral device.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2901001 - Write forbidden.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation writeCharacteristicValue(characteristic: BLECharacteristic, writeType: GattWriteType): Promise<void>
     * @relation writeCharacteristicValue(characteristic: BLECharacteristic, writeType: GattWriteType, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func writeCharacteristicValue(characteristic: BLECharacteristic, writeType: GattWriteType,
        callback: (?BusinessException) -> Unit): Unit {
        var errorCode: Int32 = 0
        let wrapper = {
            regiestError: Int32 => if (regiestError != SUCCESS_CODE) {
                let error = BusinessException(regiestError, getErrorMsg(regiestError))
                callback(error)
            }
        }
        let registerCall = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            let inputCharacteristic: NativeBLECharacteristic = characteristic.toNative()
            FfiBluetoothBleGattClientDeviceWriteCharacteristicValue(getID(), inputCharacteristic, writeType.getValue(),
                registerCall.getID(), inout errorCode)
            inputCharacteristic.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Writes the descriptor of a BLE peripheral device.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2901001 - Write forbidden.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation writeDescriptorValue(descriptor: BLEDescriptor): Promise<void>
     * @relation writeDescriptorValue(descriptor: BLEDescriptor, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func writeDescriptorValue(descriptor: BLEDescriptor, callback: (?BusinessException) -> Unit): Unit {
        var errorCode: Int32 = 0
        let wrapper = {
            regiestError: Int32 => if (regiestError != SUCCESS_CODE) {
                let error = BusinessException(regiestError, getErrorMsg(regiestError))
                callback(error)
            }
        }
        let registerCall = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            let inputDescriptor: NativeBLEDescriptor = descriptor.toNative()
            FfiBluetoothBleGattClientDeviceWriteDescriptorValue(getID(), inputDescriptor, registerCall.getID(),
                inout errorCode)
            inputDescriptor.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Get the RSSI value of this BLE peripheral device.
     *
     * @param { (?BusinessException, ?Int32) -> Unit } callback - Callback invoked to return the RSSI, in dBm.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation getRssiValue(): Promise<number>
     * @relation getRssiValue(callback: AsyncCallback<number>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func getRssiValue(callback: (?BusinessException, ?Int32) -> Unit): Unit {
        var errorCode: Int32 = 0
        let wrapper = {
            retRssi: RetDataI32 => if (retRssi.code != SUCCESS_CODE) {
                let error = BusinessException(retRssi.code, getErrorMsg(retRssi.code))
                callback(error, None<Int32>)
            } else {
                callback(None<BusinessException>, retRssi.data)
            }
        }
        let registerCall = Callback1Param<RetDataI32, Unit>(wrapper)
        unsafe { FfiBluetoothBleGattClientDeviceGetRssiValue(getID(), registerCall.getID(), inout errorCode) }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Set the mtu size of a BLE peripheral device.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation setBLEMtuSize(mtu: number): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func setBLEMtuSize(mtu: Int32): Unit {
        var errorCode: Int32 = 0
        unsafe {
            FfiBluetoothBleGattClientDeviceSetBLEMtuSize(getID(), mtu, inout errorCode)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Enables or disables indication of a characteristic when value changed.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation setCharacteristicChangeNotification(characteristic: BLECharacteristic, enable: boolean): Promise<void>
     * @relation setCharacteristicChangeNotification(characteristic: BLECharacteristic, enable: boolean, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func setCharacteristicChangeNotification(characteristic: BLECharacteristic, enable: Bool): Unit {
        var errorCode: Int32 = 0
        unsafe {
            let inputCharacteristic: NativeBLECharacteristic = characteristic.toNative()
            FfiBluetoothBleGattClientDeviceSetCharacteristicChangeNotification(getID(), inputCharacteristic, enable,
                inout errorCode)
            inputCharacteristic.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Enables or disables indication of a characteristic when value changed.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation setCharacteristicChangeIndication(characteristic: BLECharacteristic, enable: boolean): Promise<void>
     * @relation setCharacteristicChangeIndication(characteristic: BLECharacteristic, enable: boolean, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func setCharacteristicChangeIndication(characteristic: BLECharacteristic, enable: Bool): Unit {
        var errorCode: Int32 = 0
        unsafe {
            let inputCharacteristic: NativeBLECharacteristic = characteristic.toNative()
            FfiBluetoothBleGattClientDeviceSetCharacteristicChangeIndication(getID(), inputCharacteristic, enable,
                inout errorCode)
            inputCharacteristic.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Subscribe characteristic value changed event.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @relation on(type: 'BLECharacteristicChange', callback: Callback<BLECharacteristic>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: BluetoothBleGattClientDeviceCallbackType, callback: Callback1Argument<BLECharacteristic>): Unit {
        if (`type` != BleCharacteristicChange) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is BleCharacteristicChange")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        commonSubscribe1Arg(`type`, callback) {
            characteristic: NativeBLECharacteristic => characteristic.toObject()
        }
        return
    }

    /**
     * Subscribe client connection state changed event.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @relation on(type: 'BLEConnectionStateChange', callback: Callback<BLEConnectionChangeState>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(
        `type`: BluetoothBleGattClientDeviceCallbackType,
        callback: Callback1Argument<BLEConnectionChangeState>
    ): Unit {
        if (`type` != BleConnectionStateChange) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is BleConnectionStateChange")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        commonSubscribe1Arg(`type`, callback) {
            state: NativeBLEConnectionChangeState => state.toObject()
        }
        return
    }

    /**
     * Subscribe mtu changed event.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @relation on(type: 'BLEMtuChange', callback: Callback<number>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: BluetoothBleGattClientDeviceCallbackType, callback: Callback1Argument<Int32>): Unit {
        if (`type` != BluetoothBleGattClientDeviceCallbackType.BleMtuChange) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is BleMtuChange")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        commonSubscribe1Arg(`type`, callback) {
            i: Int32 => i
        }
        return
    }

    /**
     * Unsubscribe mtu changed event.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @relation off(type: 'BLECharacteristicChange', callback?: Callback<BLECharacteristic>): void
     * @relation off(type: 'BLEConnectionStateChange', callback?: Callback<BLEConnectionChangeState>): void
     * @relation off(type: 'BLEMtuChange', callback?: Callback<number>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func off(`type`: BluetoothBleGattClientDeviceCallbackType, callback!: ?CallbackObject = None): Unit {
        BLUETOOTH_LOG.debug("unsubscribe ${`type`}")
        if (!callbackMap.contains(`type`)) {
            return
        }
        if (let Some(v) <- callback) {
            findCallbackObject(`type`, v, remove: true)
            return
        }
        callbackMap[`type`].clear()
        return
    }

    private func findCallbackObject(callbackType: BluetoothBleGattClientDeviceCallbackType, callback: CallbackObject,
        remove!: Bool = false): Int64 {
        let callbackList = callbackMap.get(callbackType) ?? return -1
        for (idx in 0..callbackList.size) {
            if (refEq(callback, callbackList[idx])) {
                if (remove) {
                    callbackList.remove(at: idx)
                }
                return idx
            }
        }
        return -1
    }

    private func argWrapper1<CT, T>(callbackType: BluetoothBleGattClientDeviceCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper = {
            ctype: CT =>
            let cjType = ctor(ctype)
            let callbackList = callbackMap.get(callbackType) ?? ArrayList<CallbackObject>()
            for (caller in callbackList) {
                (caller as Callback1Argument<T>)?.invoke(cjType)
            }
        }
        let registerCall = Callback1Param<CT, Unit>(wrapper)
        registerCall.getID()
    }

    private func register(callbackType: BluetoothBleGattClientDeviceCallbackType, id: Int64) {
        var errorCode: Int32 = 0
        unsafe {
            FfiBluetoothBleGattClientDeviceOn(getID(), callbackType.getValue(), id, inout errorCode)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    private func commonSubscribe1Arg<CT, T>(callbackType: BluetoothBleGattClientDeviceCallbackType,
        callback: CallbackObject, ctor: (CT) -> T) where CT <: CType {
        BLUETOOTH_LOG.debug("subscribe ${callbackType}")
        if (!registerMap[callbackType]) {
            register(callbackType, argWrapper1<CT, T>(callbackType, ctor))
            registerMap[callbackType] = true
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                BLUETOOTH_LOG.info("The ${callbackType} callback is registered, no need to re-registered")
                return
            }
        }
        callbackMap.addIfAbsent(callbackType, ArrayList<CallbackObject>())
        callbackMap[callbackType].add(callback)
    }
}
