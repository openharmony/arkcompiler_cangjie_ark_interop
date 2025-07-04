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

foreign {
    func FFIAppRecoveryEnable(restartFlag: Int32, saveOccasionFlag: Int32, saveModeFlag: Int32): Unit

    func FFIAppRecoveryRestartApp(): Unit

    func FFIAppRecoverySaveAppState(ctxId: Int64): Bool

    func FFIAppRecoverySetRestartWant(want: WantHandle): Bool
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum RestartFlag {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ALWAYS_RESTART
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    RESTART_WHEN_JS_CRASH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    RESTART_WHEN_APP_FREEZE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    NO_RESTART
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ALWAYS_RESTART => 0
                case RESTART_WHEN_JS_CRASH => 1
                case RESTART_WHEN_APP_FREEZE => 2
                case NO_RESTART => 0xFFFF
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum SaveOccasionFlag {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    SAVE_WHEN_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    SAVE_WHEN_BACKGROUND
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case SAVE_WHEN_ERROR => 1
                case SAVE_WHEN_BACKGROUND => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum SaveModeFlag {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    SAVE_WITH_FILE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    SAVE_WITH_SHARED_MEMORY
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case SAVE_WITH_FILE => 1
                case SAVE_WITH_SHARED_MEMORY => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func enableAppRecovery(restart!: RestartFlag = ALWAYS_RESTART, saveOccasion!: SaveOccasionFlag = SAVE_WHEN_ERROR,
    saveMode!: SaveModeFlag = SAVE_WITH_FILE): Unit {
    unsafe {
        FFIAppRecoveryEnable(restart.value, saveOccasion.value, saveMode.value)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func restartApp(): Unit {
    unsafe {
        FFIAppRecoveryRestartApp()
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func saveAppState(context!: ?UIAbilityContext = None): Bool {
    match (context) {
        case None => return unsafe { FFIAppRecoverySaveAppState(0) }
        case Some(ctx) => return unsafe { FFIAppRecoverySaveAppState(ctx.getID()) }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func setRestartWant(want: Want): Unit {
    let wantHandle = want.createWantHandle()
    unsafe {
        FFIAppRecoverySetRestartWant(wantHandle)
        Want.releaseWantHandle(wantHandle)
    }
}
