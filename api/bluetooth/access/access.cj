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

import ohos.base.*
import ohos.bluetooth.*
import ohos.ffi.*
import ohos.labels.*

/**
 * Enables Bluetooth on a device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
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
public func enableBluetooth(): Unit {
    var errorCode: Int32 = 0
    unsafe {
        FfiBluetoothAccEnableBluetooth(inout errorCode)
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Disables Bluetooth on a device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
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
public func disableBluetooth(): Unit {
    var errorCode: Int32 = 0
    unsafe {
        FfiBluetoothAccDisableBluetooth(inout errorCode)
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Obtains the Bluetooth status of a device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @returns { BluetoothState } Returns the Bluetooth status.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getState(): BluetoothState {
    var errorCode: Int32 = 0
    let state: Int32
    unsafe {
        state = FfiBluetoothAccGetState(inout errorCode)
    }

    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
    return BluetoothState.parse(state)
}
