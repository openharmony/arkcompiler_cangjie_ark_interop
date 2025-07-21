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

package ohos.app.ability.ability_constant

import std.deriving.Derive
import ohos.labels.*

/**
* Defines the parameters for starting an ability.
* The parameter values are automatically passed in by the system when the ability is started. You do not need to
* change the values.
*
* @relation export interface LaunchParam
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class LaunchParam {
    /**
     * Ability launch reason, which is an enumerated type.
     *
     * @relation launchReason: LaunchReason
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var launchReason: LaunchReason
    /**
     * Reason for the last exit, which is an enumerated type.
     *
     * @relation lastExitReason: LastExitReason
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var lastExitReason: LastExitReason

    var lastExitMessage: String = ""

    protected init(
        launchReason!: LaunchReason = LaunchReason.Unknown,
        lastExitReason!: LastExitReason = LastExitReason.Normal
    ) {
        this.launchReason = launchReason
        this.lastExitReason = lastExitReason
    }

    protected init(lastExitMessage: String, launchReason!: LaunchReason = LaunchReason.Unknown,
        lastExitReason!: LastExitReason = LastExitReason.Normal) {
        this.lastExitMessage = lastExitMessage
        this.launchReason = launchReason
        this.lastExitReason = lastExitReason
    }
}

/**
* Enumerates the initial ability launch reasons.
* You can use it together with the value of launchReason in
* onCreate(want, launchParam) of the UIAbility to complete different operations.
*
* @relation export enum LaunchReason
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum LaunchReason {
    /**
     * Unknown reason.
     * 
     * @relation UNKNOWN = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Unknown
    |
    /**
     * The ability is started by calling startAbility.
     *
     * @relation START_ABILITY = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StartAbility
    |
    /**
     * The ability is started by calling startAbilityByCall.
     *
     * @relation CALL = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Call
    |
    /**
     * The ability is started by means of cross-device migration.
     *
     * @relation CONTINUATION = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Continuation
    |
    /**
     * The ability is automatically started when the application is restored from a fault.
     *
     * @relation APP_RECOVERY = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    AppRecovery
    | ...

    protected static func parse(value: Int32): LaunchReason {
        match (value) {
            case 0 => Unknown
            case 1 => StartAbility
            case 2 => Call
            case 3 => Continuation
            case 4 => AppRecovery
            case _ => throw Exception("No corresponding LaunchReason: ${value}")
        }
    }

    protected func getValue(): Int32 {
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
* Enumerates the reasons for the last exit.
* You can use it together with the value of lastExitReason in
* onCreate(want, launchParam) of the UIAbility to complete different operations.
*
* @relation export enum LastExitReason
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum LastExitReason {
    /**
     * Unknown reason.
     *
     * @relation UNKNOWN = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Unknown
    |
    /**
     * The ability exits normally because the user closes the application.
     *
     * @relation NORMAL = 2
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Normal
    | 
    /**
     * The ability exits due to abnormal signals on the local host.
     *
     * @relation CPP_CRASH = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CppCrash
    | 
    /**
     * The ability exits because watchdog detects that the application is frozen.
     *
     * @relation APP_FREEZE = 5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    AppFreeze
    | ...

    protected static func parse(value: Int32): LastExitReason {
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

    protected func getValue(): Int32 {
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
* Enumerates the ability continuation results.
* You can use it together with <code>onContinue(wantParam)</code> of the UIAbility to complete different
* operations.
*
* @relation export enum OnContinueResult
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum OnContinueResult {
    /**
     * The ability continuation is accepted.
     *
     * @relation AGREE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Agree
    | 
    /**
     * The ability continuation is rejected.
     * If the application is abnormal in onContinue, which results in abnormal display during data restoration, this
     * error code is returned.
     *
     * @relation REJECT = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Reject
    | 
    /**
     * The version does not match.
     * The application on the initiator can obtain the version of the target application from onContinue. If the
     * ability continuation cannot be performed due to version mismatch, this error code is returned.
     *
     * @relation MISMATCH = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Mismatch
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Agree => 0
            case Reject => 1
            case Mismatch => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

protected const WINDOW_MODE_UNDEFINED: Int32 = 0

/**
* Enumerates the window mode when the ability is started.
* It can be used together with startAbility to specify the window mode for starting the ability.
*
* @relation export enum WindowMode
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum WindowMode {
    /**
     * Full screen mode. It takes effect only on 2-in-1 devices and tablets.
     *
     * @relation WINDOW_MODE_FULLSCREEN = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WindowModeFullscreen
    | 
    /**
     * Primary screen (left screen in the case of horizontal orientation) in split-screen mode. It is valid only in
     * intra-app redirection scenarios.
     * It takes effect only on foldable devices and tablets.
     *
     * @relation WINDOW_MODE_SPLIT_PRIMARY = 100
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WindowModeSplitPrimary
    | 
    
    /**
     * Secondary screen (right screen in the case of horizontal orientation) in split-screen mode. It is valid only in
     * intra-app redirection scenarios.
     * It takes effect only on foldable devices and tablets.
     *
     * @relation WINDOW_MODE_SPLIT_SECONDARY = 101
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    WindowModeSplitSecondary
    | ...

    protected static func parse(value: Int32): WindowMode {
        match (value) {
            case 1 => WindowModeFullscreen
            case 100 => WindowModeSplitPrimary
            case 101 => WindowModeSplitSecondary
            case _ => throw Exception("Unknown windowMode type of value: ${value}")
        }
    }

    protected func getValue(): Int32 {
        match (this) {
            case WindowModeFullscreen => 1
            case WindowModeSplitPrimary => 100
            case WindowModeSplitSecondary => 101
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
* Enumerates the memory levels. You can use it in onMemoryLevel(level) of the UIAbility to complete
* different operations.
*
* @relation export enum MemoryLevel
*/
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum MemoryLevel {
    /**
     * Moderate memory usage.
     *
     * @relation MEMORY_LEVEL_MODERATE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MemoryLevelModerate
    | 
    /**
     * Low memory usage.
     *
     * @relation MEMORY_LEVEL_LOW = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MemoryLevelLow
    | 
    /**
     * High memory usage.
     *
     * @relation MEMORY_LEVEL_CRITICAL = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    MemoryLevelCritical
    | ...

    protected static func parse(value: Int32): MemoryLevel {
        match (value) {
            case 0 => MemoryLevelModerate
            case 1 => MemoryLevelLow
            case 2 => MemoryLevelCritical
            case _ => throw Exception("No corresponding MemoryLevel: ${value}")
        }
    }

    protected func getValue(): Int32 {
        match (this) {
            case MemoryLevelModerate => 0
            case MemoryLevelLow => 1
            case MemoryLevelCritical => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
protected enum StateType {
    Continuation
    | AppRecovery
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Continuation => 0
            case AppRecovery => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(value: Int32): StateType {
        match (value) {
            case 0 => Continuation
            case 1 => AppRecovery
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
protected enum OnSaveResult {
    AllAgree
    | ContinuationReject
    | ContinuationMismatch
    | RecoveryAgree
    | RecoveryReject
    | AllReject
    | ...

    protected func getValue(): Int32 {
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
