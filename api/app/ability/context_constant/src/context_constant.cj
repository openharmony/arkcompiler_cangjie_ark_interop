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

package ohos.app.ability.context_constant

import std.deriving.Derive
import ohos.labels.*

protected const PROCESS_MODE_UNSPECIFIED: Int32 = 0
protected const STARTUP_VISIBILITY_UNSPECIFIED: Int32 = 0

/**
* File area mode
*
* @relation export enum AreaMode
*/
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum AreaMode {
    /**
     * System level device encryption area
     *
     * @relation EL1 = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    El1
    | 
    /**
     * User credential encryption area
     *
     * @relation EL2 = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    El2
    | 
    /**
     * User credential encryption area
     * when screen locked, can read/write, and create file
     *
     * @relation EL3 = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    El3
    | 
    /**
     * User credential encryption area
     * when screen locked, FEB2.0 can read/write, FEB3.0 can't
     * read/write, and all can't create file
     *
     * @relation EL4 = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    El4
    | 
    /**
     * User privacy sensitive encryption area
     * when the screen locked, a closed file cannot be opened, read, or written,
     * a file can be created and then opened, read, or written.
     *
     * @relation EL5 = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    El5
    | ...

    protected static func parse(value: Int32): AreaMode {
        match (value) {
            case 0 => El1
            case 1 => El2
            case 2 => El3
            case 3 => El4
            case 4 => El5
            case _ => throw IllegalArgumentException("No corresponding AreaMode: ${value}")
        }
    }

    protected func getValue(): Int32 {
        match (this) {
            case El1 => 0
            case El2 => 1
            case El3 => 2
            case El4 => 3
            case El5 => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
protected enum ProcessMode {
    NewProcessAttachToParent
    | NewProcessAttachToStatusBarItem
    | AttachToStatusBarItem
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case NewProcessAttachToParent => 1
            case NewProcessAttachToStatusBarItem => 2
            case AttachToStatusBarItem => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
protected enum StartupVisibility {
    StartupHide
    | StartupShow
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case StartupHide => 0
            case StartupShow => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
