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

package ohos.ability

import std.deriving.*
import ohos.labels.*

const PROCESS_MODE_UNSPECIFIED: Int32 = 0
const STARTUP_VISIBILITY_UNSPECIFIED: Int32 = 0

@Derive[ToString, Equatable]
enum AreaMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    EL1
    | EL2
    | EL3
    | EL4
    | EL5
    | ...

    static func parse(value: Int32): AreaMode {
        match (value) {
            case 0 => EL1
            case 1 => EL2
            case 2 => EL3
            case 3 => EL4
            case 4 => EL5
            case _ => throw IllegalArgumentException("No corresponding AreaMode: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case EL1 => 0
            case EL2 => 1
            case EL3 => 2
            case EL4 => 3
            case EL5 => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
enum ProcessMode {
    
    NEW_PROCESS_ATTACH_TO_PARENT
    | NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM
    | ATTACH_TO_STATUS_BAR_ITEM
    | ...

    func getValue(): Int32 {
        match (this) {
            case NEW_PROCESS_ATTACH_TO_PARENT => 1
            case NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM => 2
            case ATTACH_TO_STATUS_BAR_ITEM => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
enum StartupVisibility {
    STARTUP_HIDE
    | STARTUP_SHOW
    | ...

    func getValue(): Int32 {
        match (this) {
            case STARTUP_HIDE => 0
            case STARTUP_SHOW => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
