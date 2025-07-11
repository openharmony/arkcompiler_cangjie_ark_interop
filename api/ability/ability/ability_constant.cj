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

/**
 * Type of launch reason.
 *
 * @stagemodelonly
 * @since 9
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum LaunchReason {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Unknown
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StartAbility
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Call
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Continuation
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    AppRecovery
    | ...

    static func parse(value: Int32): LaunchReason {
        match (value) {
            case 0 => Unknown
            case 1 => StartAbility
            case 2 => Call
            case 3 => Continuation
            case 4 => AppRecovery
            case _ => throw Exception("No corresponding LaunchReason: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case Unknown => 0
            case StartAbility => 1
            case Call => 2
            case Continuation => 3
            case AppRecovery => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Type of last exit reason.
 *
 * @stagemodelonly
 * @since 9
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum LastExitReason {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Unknown
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Normal
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CppCrash
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    AppFreeze
    | ...

    static func parse(value: Int32): LastExitReason {
        match (value) {
            case 0 => Unknown
            case 2 => Normal
            case 3 => CppCrash
            case 5 => AppFreeze
            case _ =>
                ABILITY_LOG.info("No corresponding LastExitReason: ${value}")
                Unknown
        }
    }

    func getValue(): Int32 {
        match (this) {
            case Unknown => 0
            case Normal => 2
            case CppCrash => 3
            case AppFreeze => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Type of onContinue result.
 * @stagemodelonly
 * @since 9
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum OnContinueResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Agree
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Reject
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Mismatch
    | ...

    func getValue(): Int32 {
        match (this) {
            case Agree => 0
            case Reject => 1
            case Mismatch => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Type of window mode.
 * @stagemodelonly
 * @since 9
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum WindowMode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WindowModeUndefined
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WindowModeFullscreen
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WindowModeSplitPrimary
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WindowModeSplitSecondary
    | ...

    static func parse(value: Int32): WindowMode {
        match (value) {
            case 0 => WindowModeUndefined
            case 1 => WindowModeFullscreen
            case 100 => WindowModeSplitPrimary
            case 101 => WindowModeSplitSecondary
            case _ => throw Exception("Unknown windowMode type of value: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case WindowModeUndefined => 0
            case WindowModeFullscreen => 1
            case WindowModeSplitPrimary => 100
            case WindowModeSplitSecondary => 101
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Type of memory level.
 * @stagemodelonly
 * @since 9
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum MemoryLevel {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MemoryLevelModerate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MemoryLevelLow
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MemoryLevelCritical
    | ...

    static func parse(value: Int32): MemoryLevel {
        match (value) {
            case 0 => MemoryLevelModerate
            case 1 => MemoryLevelLow
            case 2 => MemoryLevelCritical
            case _ => throw Exception("No corresponding MemoryLevel: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case MemoryLevelModerate => 0
            case MemoryLevelLow => 1
            case MemoryLevelCritical => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
enum StateType {
    Continuation
    | AppRecovery
    | ...

    func getValue(): Int32 {
        match (this) {
            case Continuation => 0
            case AppRecovery => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): StateType {
        match (value) {
            case 0 => Continuation
            case 1 => AppRecovery
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
enum OnSaveResult {
    AllAgree
    | ContinuationReject
    | ContinuationMismatch
    | RecoveryAgree
    | RecoveryReject
    | AllReject
    | ...

    func getValue(): Int32 {
        match (this) {
            case AllAgree => 0
            case ContinuationReject => 1
            case ContinuationMismatch => 2
            case RecoveryAgree => 3
            case RecoveryReject => 4
            case AllReject => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
