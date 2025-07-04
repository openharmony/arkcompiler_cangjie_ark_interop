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

package ohos.account.osAccount

import ohos.labels.*

/**
 * Enumerates OS account types.
 *
 * @enum { Int32 } OsAccountType
 * @syscap SystemCapability.Account.OsAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public enum OsAccountType {
    /**
     * Indicates the administrator account, which has the permission to manage other OS accounts.
     *
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    ADMIN
    |

        /**
         * Indicates a normal account, which has access to common functions of OS accounts.
         *
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    NORMAL
    |

        /**
         * Indicates a guest account, which is used to temporarily access the device and may be deleted at any time.
         *
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    GUEST
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    func getValue(): UInt32 {
        return match (this) {
            case ADMIN => 0
            case NORMAL => 1
            case GUEST => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(val: Int32) {
        match (val) {
            case 0 => ADMIN
            case 1 => NORMAL
            case 2 => GUEST
            case _ => throw IllegalArgumentException("OsAccountType: unknown value ${val}")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func toString(): String {
        return match (this) {
            case ADMIN => "ADMIN"
            case NORMAL => "NORMAL"
            case GUEST => "GUEST"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
