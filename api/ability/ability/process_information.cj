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
import ohos.bundle_manager.BundleType
import ohos.ffi.*
import ohos.labels.*

@C
struct CArrProcessInformation {
    CArrProcessInformation(
        let head: CPointer<CProcessInformation>,
        let size: Int64
    ) {}

    unsafe func toArrProcessInformation(): Array<ProcessInformation> {
        Array<ProcessInformation>(size) {
            i => head.read(i).toProcessInformation()
        }
    }

    unsafe func free() {
        for (i in 0..size) {
            head.read(i).free()
        }
        LibC.free<CProcessInformation>(head)
    }
}

@C
struct CProcessInformation {
    CProcessInformation(
        let pid: Int32,
        let uid: Int32,
        let processName: CString,
        let bundleNames: CArrString,
        let state: Int32,
        let bundleType: Int32,
        let appCloneIndex: Int32
    ) {}

    unsafe func toProcessInformation(): ProcessInformation {
        return ProcessInformation(
            pid,
            uid,
            processName.toString(),
            bundleNames.toStringArray(),
            ProcessState.parse(state),
            BundleType.parse(bundleType),
            appCloneIndex
        )
    }

    unsafe func free() {
        LibC.free(processName)
        bundleNames.free()
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ProcessInformation {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public ProcessInformation(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let pid: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let uid: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let processName: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let bundleNames: Array<String>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let state: ProcessState,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let bundleType: BundleType,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let appCloneIndex: Int32
    ) {}
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum ProcessState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    STATE_CREATE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    STATE_FOREGROUND
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    STATE_ACTIVE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    STATE_BACKGROUND
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    STATE_DESTROY
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case STATE_CREATE => 0
                case STATE_FOREGROUND => 1
                case STATE_ACTIVE => 2
                case STATE_BACKGROUND => 3
                case STATE_DESTROY => 4
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): ProcessState {
        match (value) {
            case 0 => STATE_CREATE
            case 1 => STATE_FOREGROUND
            case 2 => STATE_ACTIVE
            case 3 => STATE_BACKGROUND
            case 4 => STATE_DESTROY
            case _ => throw IllegalArgumentException("No corresponding ProcessState: ${value}")
        }
    }
}
