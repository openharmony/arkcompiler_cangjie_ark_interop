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

import ohos.account_distributedAccount.DistributedInfo
import ohos.labels.*

/**
 * Provides information about domain accounts.
 *
 * @interface DomainAccountInfo
 * @syscap SystemCapability.Account.OsAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public class DomainAccountInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public DomainAccountInfo(
        /**
         * The domain name
         *
         * @type { String }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let domain: String,

        /**
         * The account name in the domain
         *
         * @type { String }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let accountName: String
    ) {}
}

@C
struct CDomainAccountInfo {
    CDomainAccountInfo(
        let domain: CString,
        let accountName: CString
    ) {}

    init(domainInfo: DomainAccountInfo) {
        this.domain = unsafe { LibC.mallocCString(domainInfo.domain) }
        this.accountName = unsafe { LibC.mallocCString(domainInfo.accountName) }
    }

    func toDomainAccountInfo(): DomainAccountInfo {
        return DomainAccountInfo(domain.toString(), accountName.toString())
    }

    func free() {
        unsafe {
            LibC.free(domain)
            LibC.free(accountName)
        }
    }
}

/**
 * Provides information about OS accounts, including the local ID, local name, and type of an OS account.
 *
 * @interface OsAccountInfo
 * @syscap SystemCapability.Account.OsAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public class OsAccountInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public OsAccountInfo(
        /**
         * The local ID of an OS account.
         *
         * @type { Int32 }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let localId: Int32,

        /**
         * The local name of an OS account.
         *
         * @type { String }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let localName: String,

        /**
         * Include: ADMIN, Normal, GUEST.
         *
         * @type { OsAccountType }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let `type`: OsAccountType,

        /**
         * The account is verified or not.
         *
         * @type { Bool }
         * @syscap SystemCapability.Account.OsAccount
         * @useinstead osAccount.OsAccountInfo#isUnlocked
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let isVerified: Bool,

        /**
         * The OS account is unlocked or not.
         *
         * @type { Bool }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let isUnlocked: Bool,

        /**
         * Os account create time.
         *
         * @type { Int64 }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let createTime: Int64,

        /**
         * Os account serial number.
         *
         * @type { Int64 }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let serialNumber: Int64,

        /**
         * Os account is activated or not.
         *
         * @type { Bool }
         * @syscap SystemCapability.Account.OsAccount
         * @useinstead osAccount.OsAccountInfo#isActivated
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let isActived: Bool,

        /**
         * The OS account is activated or not.
         *
         * @type { Bool }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let isActivated: Bool,

        /**
         * Os account create completed or not.
         *
         * @type { Bool }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public let isCreateCompleted: Bool,

        /**
         * Account constraints information.
         *
         * @type { Array<String> }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public var constraints!: Array<String> = Array<String>(),

        /**
         * OS account photo.
         *
         * @type { String }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public var photo!: String = "",

        /**
         * The last time to log in.
         *
         * @type { Int64 }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public var lastLoginTime!: Int64 = 0,

        /**
         * Distributed account info.
         *
         * @type { ohos.account_distributedAccount.DistributedInfo }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public var distributedInfo!: DistributedInfo,

        /**
         * Domain account info.
         *
         * @type { DomainAccountInfo }
         * @syscap SystemCapability.Account.OsAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.OsAccount"
        ]
        public var domainInfo!: DomainAccountInfo
    ) {}
}
