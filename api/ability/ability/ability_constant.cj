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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum LaunchReason {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UNKNOWN
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    START_ABILITY
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CALL
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CONTINUATION
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    APP_RECOVERY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    SHARE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    AUTO_STARTUP
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    INSIGHT_INTENT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    PREPARE_CONTINUATION
    | ...

    static func parse(value: Int32): LaunchReason {
        match (value) {
            case 0 => UNKNOWN
            case 1 => START_ABILITY
            case 2 => CALL
            case 3 => CONTINUATION
            case 4 => APP_RECOVERY
            case 5 => SHARE
            case 8 => AUTO_STARTUP
            case 9 => INSIGHT_INTENT
            case 10 => PREPARE_CONTINUATION
            case _ => throw Exception("No corresponding LaunchReason: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case UNKNOWN => 0
            case START_ABILITY => 1
            case CALL => 2
            case CONTINUATION => 3
            case APP_RECOVERY => 4
            case SHARE => 5
            case AUTO_STARTUP => 8
            case INSIGHT_INTENT => 9
            case PREPARE_CONTINUATION => 10
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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum LastExitReason {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UNKNOWN
    | @!APILevel[
        12,
        deprecated: 10,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ABILITY_NOT_RESPONDING
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    NORMAL
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CPP_CRASH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CJ_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    APP_FREEZE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    PERFORMANCE_CONTROL
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    RESOURCE_CONTROL
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UPGRADE
    | ...

    static func parse(value: Int32): LastExitReason {
        match (value) {
            case 0 => UNKNOWN
            case 1 => ABILITY_NOT_RESPONDING
            case 2 => NORMAL
            case 3 => CPP_CRASH
            case 4 => CJ_ERROR
            case 5 => APP_FREEZE
            case 6 => PERFORMANCE_CONTROL
            case 7 => RESOURCE_CONTROL
            case 8 => UPGRADE
            case _ =>
                ABILITY_LOG.info("No corresponding LastExitReason: ${value}")
                UNKNOWN
        }
    }

    func getValue(): Int32 {
        match (this) {
            case UNKNOWN => 0
            case ABILITY_NOT_RESPONDING => 1
            case NORMAL => 2
            case CPP_CRASH => 3
            case CJ_ERROR => 4
            case APP_FREEZE => 5
            case PERFORMANCE_CONTROL => 6
            case RESOURCE_CONTROL => 7
            case UPGRADE => 8
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
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum OnContinueResult {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    AGREE
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    REJECT
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MISMATCH
    | ...

    func getValue(): Int32 {
        match (this) {
            case AGREE => 0
            case REJECT => 1
            case MISMATCH => 2
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
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum WindowMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WINDOW_MODE_UNDEFINED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WINDOW_MODE_FULLSCREEN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WINDOW_MODE_SPLIT_PRIMARY
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WINDOW_MODE_SPLIT_SECONDARY
    | ...

    static func parse(value: Int32): WindowMode {
        match (value) {
            case 0 => WINDOW_MODE_UNDEFINED
            case 1 => WINDOW_MODE_FULLSCREEN
            case 100 => WINDOW_MODE_SPLIT_PRIMARY
            case 101 => WINDOW_MODE_SPLIT_SECONDARY
            case _ => throw Exception("Unknown windowMode type of value: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case WINDOW_MODE_UNDEFINED => 0
            case WINDOW_MODE_FULLSCREEN => 1
            case WINDOW_MODE_SPLIT_PRIMARY => 100
            case WINDOW_MODE_SPLIT_SECONDARY => 101
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
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum MemoryLevel {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MEMORY_LEVEL_MODERATE
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MEMORY_LEVEL_LOW
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MEMORY_LEVEL_CRITICAL
    | ...

    static func parse(value: Int32): MemoryLevel {
        match (value) {
            case 0 => MEMORY_LEVEL_MODERATE
            case 1 => MEMORY_LEVEL_LOW
            case 2 => MEMORY_LEVEL_CRITICAL
            case _ => throw Exception("No corresponding MemoryLevel: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case MEMORY_LEVEL_MODERATE => 0
            case MEMORY_LEVEL_LOW => 1
            case MEMORY_LEVEL_CRITICAL => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
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
public enum ContinueState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ACTIVE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    INACTIVE
    | ...

    func getValue(): Int32 {
        match (this) {
            case ACTIVE => 0
            case INACTIVE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
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
public enum StateType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CONTINUATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    APP_RECOVERY
    | ...

    func getValue(): Int32 {
        match (this) {
            case CONTINUATION => 0
            case APP_RECOVERY => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): StateType {
        match (value) {
            case 0 => CONTINUATION
            case 1 => APP_RECOVERY
            case _ => throw IllegalArgumentException("The type is not supported.")
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
public enum OnSaveResult {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ALL_AGREE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CONTINUATION_REJECT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CONTINUATION_MISMATCH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    RECOVERY_AGREE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    RECOVERY_REJECT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ALL_REJECT
    | ...

    func getValue(): Int32 {
        match (this) {
            case ALL_AGREE => 0
            case CONTINUATION_REJECT => 1
            case CONTINUATION_MISMATCH => 2
            case RECOVERY_AGREE => 3
            case RECOVERY_REJECT => 4
            case ALL_REJECT => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
