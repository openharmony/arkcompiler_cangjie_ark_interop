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

package ohos.bluetooth.baseProfile

import std.deriving.*
import ohos.base.*
import ohos.bluetooth.constant.ProfileConnectionState
import ohos.labels.*

/**
 * Enum for cause of disconnect.
 *
 * @releation enum DisconnectCause
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum DisconnectCause {
    /**
     * User disconnect device.
     *
     * @releation USER_DISCONNECT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    UserDisconnect
    | 
    /**
     * The connection needs to be initiated from the keyboard side.
     *
     * @releation CONNECT_FROM_KEYBOARD
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectFromKeyboard
    | 
    /**
     * The connection needs to be initiated from the mouse side.
     *
     * @releation CONNECT_FROM_MOUSE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectFromMouse
    | 
    /**
     * The connection needs to be initiated from the car side.
     *
     * @releation CONNECT_FROM_CAR
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectFromCar
    | 
    /**
     * Too many devices are currently connected.
     *
     * @releation TOO_MANY_CONNECTED_DEVICES
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TooManyConnectedDevices
    | 
    /**
     * Connection failed due to an internal error.
     *
     * @releation CONNECT_FAIL_INTERNAL
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectFailInternal
    | ...

    static func parse(cause: Int32) {
        match (cause) {
            case 0 => UserDisconnect
            case 1 => ConnectFromKeyboard
            case 2 => ConnectFromMouse
            case 3 => ConnectFromCar
            case 4 => TooManyConnectedDevices
            case 5 => ConnectFailInternal
            case _ => throw NoneValueException("Value does not exist!")
        }
    }
}

@C
protected struct NativeStateChangeParam {
    NativeStateChangeParam(
        let deviceId: CString,
        let state: Int32,
        let cause: Int32
    ) {}

    protected func toObject(): StateChangeParam {
        return StateChangeParam(
            deviceId.toString(),
            ProfileConnectionState.parse(state),
            DisconnectCause.parse(cause)
        )
    }
}

/**
 * Profile state change parameters.
 *
 * @relation interface StateChangeParam
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class StateChangeParam {
    /**
     * The address of device.
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
     * Profile state value.
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
     * Cause of disconnect.
     *
     * @relation cause: DisconnectCause
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var cause: DisconnectCause

    init(
        deviceId: String,
        state: ProfileConnectionState,
        cause: DisconnectCause
    ) {
        this.deviceId = deviceId
        this.state = state
        this.cause = cause
    }
}

/**
 * Base interface of profile.
 *
 * @relation interface BaseProfile
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public interface BaseProfile {
    /**
     * Get connection strategy of this profile.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900004 - Profile not supported.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation getConnectedDevices(): Array<string>
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func getConnectedDevices(): Array<String>

    /**
     * Obtains the profile connection state.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 2900001 - Service stopped.
     * @throws { BusinessException } 2900003 - Bluetooth disabled.
     * @throws { BusinessException } 2900004 - Profile not supported.
     * @throws { BusinessException } 2900099 - Operation failed.
     * @relation getConnectionState(deviceId: string): ProfileConnectionState
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func getConnectionState(deviceId: String): ProfileConnectionState

    /**
     * Subscribe the event reported when the profile connection state changes.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @relation on(type: 'connectionStateChange', callback: Callback<StateChangeParam>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func on(`type`: ProfileCallbackType, callback: Callback1Argument<StateChangeParam>): Unit

    /**
     * Unsubscribe the event reported when the profile connection state changes.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @relation off(type: 'connectionStateChange', callback?: Callback<StateChangeParam>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func off(`type`: ProfileCallbackType, callback: CallbackObject): Unit

    /**
     * Unsubscribe the event reported when the profile connection state changes.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
     * 2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @relation off(type: 'connectionStateChange', callback?: Callback<StateChangeParam>): void
     */
    @!APILevel[
        21,
        permission: "ohos.permission.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func off(`type`: ProfileCallbackType): Unit
}

/**
 * Type of the profile connection state changes event to listen for.
 */
@Derive[ToString, Hashable, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ProfileCallbackType {
    /**
     * Connection State Change.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectionStateChange | ...

    protected func getValue(): Int32 {
        match (this) {
            case ConnectionStateChange => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
