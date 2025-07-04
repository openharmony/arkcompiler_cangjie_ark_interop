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

package ohos.multimedia_avsession

import std.deriving.*
import ohos.labels.*

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum CallState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    CALL_STATE_IDLE
    | CALL_STATE_INCOMING
    | CALL_STATE_ACTIVE
    | CALL_STATE_DIALING
    | CALL_STATE_WAITING
    | CALL_STATE_HOLDING
    | CALL_STATE_DISCONNECTING
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case CALL_STATE_IDLE => 0
                case CALL_STATE_INCOMING => 1
                case CALL_STATE_ACTIVE => 2
                case CALL_STATE_DIALING => 3
                case CALL_STATE_WAITING => 4
                case CALL_STATE_HOLDING => 5
                case CALL_STATE_DISCONNECTING => 6
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): CallState {
        match (value) {
            case 0 => CALL_STATE_IDLE
            case 1 => CALL_STATE_INCOMING
            case 2 => CALL_STATE_ACTIVE
            case 3 => CALL_STATE_DIALING
            case 4 => CALL_STATE_WAITING
            case 5 => CALL_STATE_HOLDING
            case 6 => CALL_STATE_DISCONNECTING
            case _ => throw IllegalArgumentException("Unsupported CallState")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class AVCallState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public AVCallState(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var state: CallState,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var muted: Bool
    ) {}
}

@C
protected struct CAVCallState {
    CAVCallState(
        let state: Int32,
        let muted: Bool
    ) {}

    protected init(avCallState: AVCallState) {
        state = avCallState.state.value
        muted = avCallState.muted
    }

    protected func toCJObject(): AVCallState {
        AVCallState(CallState.parse(state), muted)
    }
}
