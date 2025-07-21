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

package ohos.app.ability.want_constant

import std.deriving.Derive
import ohos.labels.*

/**
* The constant for params of the want
*
* @relation export enum Params
*/
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Params {
    /**
     * Indicates the ability in this want can back to the current top ability even though they are not in the same
     * mission stack
     *
     * @relation ABILITY_BACK_TO_OTHER_MISSION_STACK = 'ability.params.backToOtherMissionStack'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    AbilityBackToOtherMissionStack
    |
    /**
     * Indicates the param of ability failure restart recovery identification
     *
     * @relation ABILITY_RECOVERY_RESTART = 'ohos.ability.params.abilityRecoveryRestart'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    AbilityRecoveryRestart
    |
    /**
     * Indicates the param of extra content title
     *
     * @relation CONTENT_TITLE_KEY = 'ohos.extra.param.key.contentTitle'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ContentTitleKey
    |
    /**
     * Indicates the param of extra shared abstract
     *
     * @relation SHARE_ABSTRACT_KEY = 'ohos.extra.param.key.shareAbstract'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ShareAbstractKey
    |
    /**
     * Indicates the param of extra shareURL
     *
     * @relation SHARE_URL_KEY = 'ohos.extra.param.key.shareUrl'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ShareUrlKey
    |
    /**
     * Indicates the param of extra support continue page stack.
     * The default value of the param is true,
     * and the system will automatically flow the page stack information by default.
     *
     * @relation SUPPORT_CONTINUE_PAGE_STACK_KEY = 'ohos.extra.param.key.supportContinuePageStack'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SupportContinuePageStackKey
    |
    /**
     * Indicates the param of extra stop source ability on continue.
     * The default value of the param is true,
     * and the system will exit the source application by default.
     *
     * SUPPORT_CONTINUE_SOURCE_EXIT_KEY = 'ohos.extra.param.key.supportContinueSourceExit'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SupportContinueSourceExitKey
    | ...

    /**
     * get the corresponding mapping value.
     *
     * @throws { IllegalArgumentException } - The type is not supported.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func getValue(): String {
        match (this) {
            case AbilityBackToOtherMissionStack => "ability.params.backToOtherMissionStack"
            case AbilityRecoveryRestart => "ohos.ability.params.abilityRecoveryRestart"
            case ContentTitleKey => "ohos.extra.param.key.contentTitle"
            case ShareAbstractKey => "ohos.extra.param.key.shareAbstract"
            case ShareUrlKey => "ohos.extra.param.key.shareUrl"
            case SupportContinuePageStackKey => "ohos.extra.param.key.supportContinuePageStack"
            case SupportContinueSourceExitKey => "ohos.extra.param.key.supportContinueSourceExit"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
* Used to indicate how Want is handled.
*
* @relation export enum Flags
*/
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Flags {
    /**
     * Indicates the grant to perform read operations on the URI.
     *
     * @relation FLAG_AUTH_READ_URI_PERMISSION = 0x00000001
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagAuthReadUriPermission
    |
    /**
     * Indicates the grant to perform write operations on the URI.
     *
     * @relation FLAG_AUTH_WRITE_URI_PERMISSION = 0x00000002
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagAuthWriteUriPermission
    |
    /**
     * Indicates the grant for possible persisting on the URI.
     *
     * @relation FLAG_AUTH_PERSISTABLE_URI_PERMISSION = 0x00000040
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagAuthPersistableUriPermission
    |
    /**
     * Install the specified ability if it's not installed.
     *
     * @relation FLAG_INSTALL_ON_DEMAND = 0x00000800
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagInstallOnDemand
    |
    /**
     * Indicates that if implicit start ability couldn't match any application, no tip dialog will be pulled up.
     *
     * @relation FLAG_START_WITHOUT_TIPS = 0x40000000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagStartWithoutTips
    | ...

    /**
     * get the corresponding mapping value.
     *
     * @throws { IllegalArgumentException } - The type is not supported.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case FlagAuthReadUriPermission => 0x00000001
            case FlagAuthWriteUriPermission => 0x00000002
            case FlagAuthPersistableUriPermission => 0x00000040
            case FlagInstallOnDemand => 0x00000800
            case FlagStartWithoutTips => 0x40000000
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
