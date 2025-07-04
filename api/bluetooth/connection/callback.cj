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

package ohos.bluetooth.connection

import std.collection.{ArrayList, HashMap}
import std.deriving.*
import ohos.base.*
import ohos.labels.*
import ohos.bluetooth.*
import ohos.ffi.*
import ohos.bluetooth.common_util.*
import ohos.bluetooth.constant.*

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothConnectionCallbackType {
    @!APILevel[
        19,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BATTERY_CHANGE
    | @!APILevel[
        19,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BLUETOOTH_DEVICE_FIND
    | @!APILevel[
        19,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BOND_STATE_CHANGE
    | @!APILevel[
        19,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PIN_REQUIRED

    func getValue(): Int32 {
        match (this) {
            case BATTERY_CHANGE => 0i32
            case BLUETOOTH_DEVICE_FIND => 1i32
            case BOND_STATE_CHANGE => 2i32
            case PIN_REQUIRED => 3i32
        }
    }
}

private let CALLBACK_MAP = HashMap<BluetoothConnectionCallbackType, ArrayList<CallbackObject>>()
private let REGISTER_MAP = HashMap<BluetoothConnectionCallbackType, Bool>(
    [
        (BATTERY_CHANGE, false),
        (BLUETOOTH_DEVICE_FIND, false),
        (BOND_STATE_CHANGE, false),
        (PIN_REQUIRED, false)
    ]
)

private func register(callbackType: BluetoothConnectionCallbackType, id: Int64) {
    var errorCode: Int32 = 0
    unsafe {
        FfiBluetoothConOn(callbackType.getValue(), id, inout errorCode)
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

private func argWrapper1<CT, T>(callbackType: BluetoothConnectionCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
    let wrapper = {
        ctype: CT =>
        let cjType = ctor(ctype)
        let callbackList = CALLBACK_MAP.get(callbackType) ?? ArrayList<CallbackObject>()
        for (caller in callbackList) {
            (caller as Callback1Argument<T>)?.invoke(cjType)
        }
    }
    let registerCall = Callback1Param<CT, Unit>(wrapper)
    registerCall.getID()
}

private func findCallbackObject(callbackType: BluetoothConnectionCallbackType, callback: CallbackObject,
    remove!: Bool = false): Int64 {
    let callbackList = CALLBACK_MAP.get(callbackType) ?? return -1
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

private func commonSubscribe1Arg<CT, T>(callbackType: BluetoothConnectionCallbackType, callback: CallbackObject,
    ctor: (CT) -> T) where CT <: CType {
    BLUETOOTH_LOG.debug("subscribe ${callbackType}")
    if (!REGISTER_MAP[callbackType]) {
        register(callbackType, argWrapper1<CT, T>(callbackType, ctor))
        REGISTER_MAP[callbackType] = true
    } else {
        if (findCallbackObject(callbackType, callback) >= 0) {
            BLUETOOTH_LOG.info("The ${callbackType} callback is registered, no need to re-registered")
            return
        }
    }
    CALLBACK_MAP.addIfAbsent(callbackType, ArrayList<CallbackObject>())
    CALLBACK_MAP[callbackType].add(callback)
}

/**
 * Subscribe the event of battery state changed from a remote device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { BATTERY_CHANGE } type - Type of the battery event to listen for.
 * @param { Callback1Argument<BatteryInfo> } callback - Callback used to listen.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func on(`type`: BluetoothConnectionCallbackType, callback: Callback1Argument<BatteryInfo>): Unit {
    if (`type` != BATTERY_CHANGE) {
        BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is BATTERY_CHANGE")
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }
    commonSubscribe1Arg(`type`, callback) {
        batteryInfo: CBatteryInfo => batteryInfo.toObject()
    }
    return
}

/**
 * Subscribe the event reported when a remote Bluetooth device is discovered.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { BLUETOOTH_DEVICE_FIND } type - Type of the discovering event to listen for.
 * @param { Callback1Argument<Array<String>> } callback - Callback used to listen for the discovering event.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900099 - Operation failed.
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
public func on(`type`: BluetoothConnectionCallbackType, callback: Callback1Argument<Array<String>>): Unit {
    if (`type` != BLUETOOTH_DEVICE_FIND) {
        BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is BLUETOOTH_DEVICE_FIND")
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }
    unsafe {
        commonSubscribe1Arg(`type`, callback) {
            devices: CArrString => cArrString2ArrString(devices)
        }
    }
    return
}

/**
 * Subscribe the event reported when a remote Bluetooth device is bonded.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { BOND_STATE_CHANGE } type - Type of the bond state event to listen for.
 * @param { Callback1Argument<BondStateParam> } callback - Callback used to listen for the bond state event.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func on(`type`: BluetoothConnectionCallbackType, callback: Callback1Argument<BondStateParam>): Unit {
    if (`type` != BOND_STATE_CHANGE) {
        BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is BOND_STATE_CHANGE")
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }
    commonSubscribe1Arg(`type`, callback) {
        param: CBondStateParam => param.toObject()
    }
    return
}

/**
 * Subscribe the event of a pairing request from a remote Bluetooth device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { PIN_REQUIRED } type - Type of the pairing request event to listen for.
 * @param { Callback1Argument<PinRequiredParam> } callback - Callback used to listen for the pairing request event.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func on(`type`: BluetoothConnectionCallbackType, callback: Callback1Argument<PinRequiredParam>): Unit {
    if (`type` != PIN_REQUIRED) {
        BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is PIN_REQUIRED")
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    commonSubscribe1Arg(`type`, callback) {
        param: CPinRequiredParam => param.toObject()
    }
    return
}

/**
 * Unsubscribe the event of a pairing request from a remote Bluetooth device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { PIN_REQUIRED } type - Type of the pairing request event to listen for.
 * @param { ?CallbackObject } callback - Callback used to listen for the pairing request event.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func off(`type`: BluetoothConnectionCallbackType, callback!: ?CallbackObject = None): Unit {
    BLUETOOTH_LOG.debug("unsubscribe ${`type`}")
    if (!CALLBACK_MAP.contains(`type`)) {
        return
    }
    if (let Some(v) <- callback) {
        findCallbackObject(`type`, v, remove: true)
        return
    }
    CALLBACK_MAP[`type`].clear()
    return
}
