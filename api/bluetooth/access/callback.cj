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

package ohos.bluetooth.access

import std.collection.{ArrayList, HashMap}
import std.deriving.*
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import ohos.bluetooth.*

const REGISTER_STATE_CHANGE_TYPE = 0i32
let BLUETOOTH_STATE_MAP = HashMap<Int32, BluetoothState>(
    [
        (0, STATE_OFF),
        (1, STATE_TURNING_ON),
        (2, STATE_ON),
        (3, STATE_TURNING_OFF),
        (4, STATE_BLE_TURNING_ON),
        (5, STATE_BLE_ON),
        (6, STATE_BLE_TURNING_OFF)
    ]
)

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_OFF
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_TURNING_ON
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_ON
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_TURNING_OFF
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_BLE_TURNING_ON
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_BLE_ON
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_BLE_TURNING_OFF
    | ...

    static func parse(state: Int32): BluetoothState {
        BLUETOOTH_STATE_MAP.get(state) ?? throw NoneValueException("Unknown value")
    }
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothAccessCallbackType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_CHANGE | ...

    func getValue(): Int32 {
        match (this) {
            case STATE_CHANGE => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

private var registerState = false
private let CALLBACK_LIST = ArrayList<CallbackObject>()

private func argWrapper1<CT, T>(ctor: (CT) -> T): Int64 where CT <: CType {
    let wrapper = {
        ctype: CT =>
        let cjType = ctor(ctype)
        for (caller in CALLBACK_LIST) {
            (caller as Callback1Argument<T>)?.invoke(cjType)
        }
    }
    let registerCall = Callback1Param<CT, Unit>(wrapper)
    registerCall.getID()
}

/**
 * Subscribe the event reported when the Bluetooth state changes.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { BluetoothAccessCallbackType } type - Type of the Bluetooth state changes event to listen for.
 * @param { Callback1Argument<BluetoothState> } callback - Callback used to listen for the Bluetooth state event.
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
public func on(`type`: BluetoothAccessCallbackType, callback: Callback1Argument<BluetoothState>): Unit {
    BLUETOOTH_LOG.debug("subscribe ${`type`} callback")
    if (!registerState) {
        var errorCode: Int32 = 0
        let id = argWrapper1({state: Int32 => BluetoothState.parse(state)})
        unsafe {
            FfiBluetoothAccOn(REGISTER_STATE_CHANGE_TYPE, id, inout errorCode)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        registerState = true
    } else {
        for (idx in 0..CALLBACK_LIST.size) {
            if (refEq(callback, CALLBACK_LIST[idx])) {
                BLUETOOTH_LOG.info("The stateChange callback is registered, no need to re-registered")
                return
            }
        }
    }
    CALLBACK_LIST.add(callback)
    return
}

/**
 * Unsubscribe the event reported when the Bluetooth state changes.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { BluetoothAccessCallbackType } type - Type of the Bluetooth state changes event to listen for.
 * @param { ?Callback1Argument<BluetoothState> } callback - Callback used to listen for the Bluetooth state event.
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
public func off(`type`: BluetoothAccessCallbackType, callback!: ?CallbackObject = None): Unit {
    BLUETOOTH_LOG.debug("unsubscribe ${`type`} stateChange")
    if (let Some(v) <- callback) {
        for (idx in 0..CALLBACK_LIST.size) {
            if (refEq(v, CALLBACK_LIST[idx])) {
                CALLBACK_LIST.remove(at: idx)
            }
        }
    }
    CALLBACK_LIST.clear()
    return
}
