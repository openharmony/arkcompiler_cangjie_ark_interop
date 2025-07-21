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

package ohos.bluetooth.constant

import std.deriving.Derive
import ohos.labels.APILevel

/**
 * The enum of profile connection state.
 * @relation export enum ProfileConnectionState
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ProfileConnectionState {
    /**
     * the current profile is disconnected
     * @relation STATE_DISCONNECTED = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    StateDisconnected
    /**
     * the current profile is being connected
     * @relation STATE_CONNECTING = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    StateConnecting
    /**
     * the current profile is connected
     * @relation STATE_CONNECTED = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    StateConnected
    /**
     * the current profile is being disconnected
     * @relation STATE_DISCONNECTING = 3
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    StateDisconnecting
    | ...

    /**
     * @throws NoneValueException - Value conversion failed.
     */
    protected static func parse(state: Int32): ProfileConnectionState {
        match (state) {
            case 0i32 => StateDisconnected
            case 1i32 => StateConnecting
            case 2i32 => StateConnected
            case 3i32 => StateDisconnecting
            case _ => throw NoneValueException("Value does not exist!")
        }
    }
}
