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

@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum DisconnectCause {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    UserDisconnect
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectFromKeyboard
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectFromMouse
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    ConnectFromCar
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TooManyConnectedDevices
    | @!APILevel[
        19,
        crossplatform: true,
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

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class StateChangeParam {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var deviceId: String
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var state: ProfileConnectionState
    @!APILevel[
        19,
        crossplatform: true,
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

@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public interface BaseProfile {
    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func getConnectedDevices(): Array<String>

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func getConnectionState(deviceId: String): ProfileConnectionState

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func on(`type`: ProfileCallbackType, callback: Callback1Argument<StateChangeParam>): Unit

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func off(`type`: ProfileCallbackType, callback: CallbackObject): Unit

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    func off(`type`: ProfileCallbackType): Unit
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ProfileCallbackType {
    @!APILevel[
        19,
        crossplatform: true,
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
