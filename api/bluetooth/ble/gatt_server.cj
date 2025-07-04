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

import std.sync.AtomicBool
import ohos.labels.*
import ohos.base.*
import std.collection.{ArrayList, HashMap}
import ohos.ffi.*
import ohos.bluetooth.*

/**
 * Manages GATT server. Before calling an Gatt server method, you must use {@link createGattServer} to create an GattServer instance.
 *
 * @typedef GattServer
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class GattServer <: RemoteDataLite {
    private let callbackMap = HashMap<BluetoothBleGattServerCallbackType, ArrayList<CallbackObject>>()
    private let registerMap = HashMap<BluetoothBleGattServerCallbackType, Bool>(
        [
            (CHARACTERISTIC_READ, false),
            (CHARACTERISTIC_WRITE, false),
            (DESCRIPTOR_READ, false),
            (DESCRIPTOR_WRITE, false),
            (CONNECTION_STATE_CHANGE, false),
            (BLE_MTU_CHANGE, false)
        ]
    )

    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Adds a specified service to be hosted.
     * <p>The added service and its characteristics are provided by the local device.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { GattService } service - Indicates the service to add.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func addService(service: GattService): Unit {
        var errorCode: Int32 = 0
        unsafe {
            let cGattService: NativeGattService = service.toNative()
            FfiBluetoothBleGattServerAddService(getID(), cGattService, inout errorCode)
            cGattService.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Removes a specified service from the list of GATT services provided by this device.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { String } serviceUuid - Indicates the UUID of the service to remove.
     * @throws { BusinessException} 201 - Permission denied.
     * @throws { BusinessException} 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException} 801 - Capability not supported.
     * @throws { BusinessException} 2900001 - Service stopped.
     * @throws { BusinessException} 2900003 - Bluetooth disabled.
     * @throws { BusinessException} 2900004 - Profile not supported.
     * @throws { BusinessException} 2900099 - Operation failed.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func removeService(serviceUuid: String): Unit {
        var errorCode: Int32 = 0
        unsafe {
            try (serviceUuidCString = LibC.mallocCString(serviceUuid).asResource()) {
                FfiBluetoothBleGattServerRemoveService(getID(), serviceUuidCString.value, inout errorCode)
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Closes this {@code GattServer} object and unregisters its callbacks.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func close(): Unit {
        var errorCode: Int32 = 0
        unsafe {
            FfiBluetoothBleGattServerClose(getID(), inout errorCode)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Sends a notification of a change in a specified local characteristic with a asynchronous callback.
     * <p>This method should be called for every BLE peripheral device that has requested notifications.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
     * @param { NotifyCharacteristic } notifyCharacteristic - Indicates the local characteristic that has changed.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func notifyCharacteristicChanged(deviceId: String, notifyCharacteristic: NotifyCharacteristic): Unit {
        var errorCode: Int32 = 0
        unsafe {
            try (deviceIdCString = LibC.mallocCString(deviceId).asResource()) {
                let cNotifyCharacteristic = notifyCharacteristic.toNative()
                FfiBluetoothBleGattServerNotifyCharacteristicChanged(getID(), deviceIdCString.value,
                    cNotifyCharacteristic, inout errorCode)
                cNotifyCharacteristic.free()
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Sends a response to a specified read or write request to a given BLE peripheral device.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { ServerResponse } serverResponse - Indicates the response parameters {@link ServerResponse}.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func sendResponse(serverResponse: ServerResponse): Unit {
        var errorCode: Int32 = 0
        unsafe {
            let cServerResponse: NativeServerResponse = serverResponse.toNative()
            FfiBluetoothBleGattServerSendResponse(getID(), cServerResponse, inout errorCode)
            cServerResponse.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    /**
     * Subscribe characteristic read event.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { BluetoothBleGattServerCallbackType } type - Type of the characteristic read event to listen for.
     * @param { Callback1Argument<CharacteristicReadRequest> } callback - Callback used to listen for the characteristic read event.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<CharacteristicReadRequest>): Unit {
        if (`type` != CHARACTERISTIC_READ) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is CHARACTERISTIC_READ")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        commonSubscribe1Arg(`type`, callback) {
            request: NativeCharacteristicReadRequest => request.toObject()
        }
        return
    }

    /**
     * Subscribe characteristic write event.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { BluetoothBleGattServerCallbackType } type - Type of the characteristic write event to listen for.
     * @param { Callback1Argument<CharacteristicWriteRequest> } callback - Callback used to listen for the characteristic write event.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<CharacteristicWriteRequest>): Unit {
        if (`type` != CHARACTERISTIC_WRITE) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is CHARACTERISTIC_WRITE")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        commonSubscribe1Arg(`type`, callback) {
            request: NativeCharacteristicWriteRequest => request.toObject()
        }
        return
    }

    /**
     * Subscribe descriptor read event.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { BluetoothBleGattServerCallbackType } type - Type of the descriptor read event to listen for.
     * @param { Callback1Argument<DescriptorReadRequest> } callback - Callback used to listen for the descriptor read event.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<DescriptorReadRequest>): Unit {
        if (`type` != DESCRIPTOR_READ) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is DESCRIPTOR_READ")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        commonSubscribe1Arg(`type`, callback) {
            request: NativeDescriptorReadRequest => request.toObject()
        }
        return
    }

    /**
     * Subscribe descriptor write event.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { BluetoothBleGattServerCallbackType } type - Type of the descriptor write event to listen for.
     * @param { Callback1Argument<DescriptorWriteRequest> } callback - Callback used to listen for the descriptor write event.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<DescriptorWriteRequest>): Unit {
        if (`type` != DESCRIPTOR_WRITE) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is DESCRIPTOR_WRITE")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        commonSubscribe1Arg(`type`, callback) {
            request: NativeDescriptorWriteRequest => request.toObject()
        }
        return
    }

    /**
     * Subscribe server connection state changed event.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { BluetoothBleGattServerCallbackType } type - Type of the connection state changed event to listen for.
     * @param { Callback1Argument<BLEConnectionChangeState> } callback - Callback used to listen for the connection state changed event.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<BLEConnectionChangeState>): Unit {
        if (`type` != CONNECTION_STATE_CHANGE) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is CONNECTION_STATE_CHANGE")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        commonSubscribe1Arg(`type`, callback) {
            request: NativeBLEConnectionChangeState => request.toObject()
        }
        return
    }

    /**
     * Subscribe mtu changed event.
     *
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { BluetoothBleGattServerCallbackType } type - Type of the mtu changed event to listen for.
     * @param { Callback1Argument<Int32> } callback - Callback used to listen for the mtu changed event.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<Int32>): Unit {
        if (`type` != BluetoothBleGattServerCallbackType.BLE_MTU_CHANGE) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is BLE_MTU_CHANGE")
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
     * @permission ohos.permission.ACCESS_BLUETOOTH
     * @param { BluetoothBleGattServerCallbackType } type - Type of the mtu changed event to listen for.
     * @param { ?CallbackObject } callback - Callback  event.
     * @throws { BusinessException} 201 - Permission denied.
     * @throws { BusinessException} 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException} 801 - Capability not supported.
     * @syscap SystemCapability.Communication.Bluetooth.Core
     */
    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func off(`type`: BluetoothBleGattServerCallbackType, callback!: ?CallbackObject = None): Unit {
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

    private func findCallbackObject(callbackType: BluetoothBleGattServerCallbackType, callback: CallbackObject,
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

    private func argWrapper1<CT, T>(callbackType: BluetoothBleGattServerCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
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

    private func register(callbackType: BluetoothBleGattServerCallbackType, id: Int64) {
        var errorCode: Int32 = 0
        unsafe {
            FfiBluetoothBleGattServerOn(getID(), callbackType.getValue(), id, inout errorCode)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    private func commonSubscribe1Arg<CT, T>(callbackType: BluetoothBleGattServerCallbackType, callback: CallbackObject,
        ctor: (CT) -> T) where CT <: CType {
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
