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
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SupportContinueSourceExitKey
    | ...

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

@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Flags {
    /**
     * Indicates the grant to perform read operations on the URI.
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
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagStartWithoutTips
    | ...

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
