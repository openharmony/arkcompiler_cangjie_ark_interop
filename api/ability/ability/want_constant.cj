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
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Params {
    /**
     * Indicates the ability in this want can back to the current top ability even though they are not in the same
     * mission stack
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ABILITY_BACK_TO_OTHER_MISSION_STACK
    |

        /**
         * Indicates the param of ability failure restart recovery identification
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ABILITY_RECOVERY_RESTART
    |

        /**
         * Indicates the param of extra content title
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    CONTENT_TITLE_KEY
    |

        /**
         * Indicates the param of extra shared abstract
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SHARE_ABSTRACT_KEY
    |

        /**
         * Indicates the param of extra shareURL
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SHARE_URL_KEY
    |

        /**
         * Indicates the param of extra support continue page stack.
         * The default value of the param is true,
         * and the system will automatically flow the page stack information by default.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SUPPORT_CONTINUE_PAGE_STACK_KEY
    |

        /**
         * Indicates the param of extra stop source ability on continue.
         * The default value of the param is true,
         * and the system will exit the source application by default.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SUPPORT_CONTINUE_SOURCE_EXIT_KEY
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func getValue(): String {
        match (this) {
            case ABILITY_BACK_TO_OTHER_MISSION_STACK => "ability.params.backToOtherMissionStack"
            case ABILITY_RECOVERY_RESTART => "ohos.ability.params.abilityRecoveryRestart"
            case CONTENT_TITLE_KEY => "ohos.extra.param.key.contentTitle"
            case SHARE_ABSTRACT_KEY => "ohos.extra.param.key.shareAbstract"
            case SHARE_URL_KEY => "ohos.extra.param.key.shareUrl"
            case SUPPORT_CONTINUE_PAGE_STACK_KEY => "ohos.extra.param.key.supportContinuePageStack"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Flags {
    /**
     * Indicates the grant to perform read operations on the URI.
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FLAG_AUTH_READ_URI_PERMISSION
    |

        /**
         * Indicates the grant to perform write operations on the URI.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FLAG_AUTH_WRITE_URI_PERMISSION
    |

        /**
         * Indicates the grant for possible persisting on the URI.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FLAG_AUTH_PERSISTABLE_URI_PERMISSION
    |

        /**
         * Install the specified ability if it's not installed.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FLAG_INSTALL_ON_DEMAND
    |

        /**
         * Indicates that if implicit start ability couldn't match any application, no tip dialog will be pulled up.
         */
        @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FLAG_START_WITHOUT_TIPS
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case FLAG_AUTH_READ_URI_PERMISSION => 0x00000001
            case FLAG_AUTH_WRITE_URI_PERMISSION => 0x00000002
            case FLAG_AUTH_PERSISTABLE_URI_PERMISSION => 0x00000040
            case FLAG_INSTALL_ON_DEMAND => 0x00000800
            case FLAG_START_WITHOUT_TIPS => 0x40000000
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
