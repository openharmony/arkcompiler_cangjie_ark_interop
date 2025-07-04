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

package ohos.account_distributedAccount

import ohos.ffi.*
import ohos.labels.*
import ohos.base.*

const EVENT_LOGIN: String = "Ohos.account.event.LOGIN"
const EVENT_LOGOUT: String = "Ohos.account.event.LOGOUT"
const EVENT_TOKEN_INVALID: String = "Ohos.account.event.TOKEN_INVALID"
const EVENT_LOGOFF: String = "Ohos.account.event.LOGOFF"

/**
 * Enum for distributed account status.
 *
 * @enum { number }
 * @syscap SystemCapability.Account.OsAccount
 * @since 10
 */
//  @Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public enum DistributedAccountStatus {
    /**
     * Indicates that the account is not logged in.
     *
     * @syscap SystemCapability.Account.OsAccount
     * @since 10
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    NOT_LOGGED_IN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    LOGGED_IN
    | ...

    func getValue(): Int32 {
        match (this) {
            case NOT_LOGGED_IN => 0
            case LOGGED_IN => 1
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func parse(val: Int32): DistributedAccountStatus {
        match (val) {
            case 0 => NOT_LOGGED_IN
            case 1 => LOGGED_IN
            case _ => NOT_LOGGED_IN
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public enum OhosAccountEvent {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    LOGIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    LOGOUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    TOKEN_INVALID
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    LOGOFF
    | ...

    func getValue() {
        match (this) {
            case LOGIN => EVENT_LOGIN
            case LOGOUT => EVENT_LOGOUT
            case TOKEN_INVALID => EVENT_TOKEN_INVALID
            case LOGOFF => EVENT_LOGOFF
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
    static func parse(val: String): OhosAccountEvent {
        match (val) {
            case "Ohos.account.event.LOGIN" => LOGIN
            case "Ohos.account.event.LOGOUT" => LOGOUT
            case "Ohos.account.event.TOKEN_INVALID" => TOKEN_INVALID
            case "Ohos.account.event.LOGOFF" => LOGOFF
            case _ => TOKEN_INVALID
        }
    }
}

var distributedAccountAbility: Option<DistributedAccountAbility> = Option.None;

/**
 * Gets the ability of the distributed account.
 *
 * @returns { DistributedAccountAbility } Ability to manage operations of distributed account.
 * @syscap SystemCapability.Account.OsAccount
 * @since 7
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public func getDistributedAccountAbility(): DistributedAccountAbility {
    match (distributedAccountAbility) {
        case None => distributedAccountAbility = DistributedAccountAbility()
        case Some(value) => ()
    }
    return distributedAccountAbility.getOrThrow();
}

/**
 * Defines distributed account functions and interfaces.
 *
 * @interface DistributedAccountAbility
 * @syscap SystemCapability.Account.OsAccount
 * @since 7
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public class DistributedAccountAbility {
    @!APILevel[
        19,
        permission: PermissionOr("ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS",
            "ohos.permission.GET_DISTRIBUTED_ACCOUNTS") | "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getOsAccountDistributedInfo(): DistributedInfo {
        unsafe {
            var errCode: Int32 = 0
            let retAccountInfo = FfiOHOSDistributedAccountDistributedInfoGetOsAccountDistributedInfo(inout errCode);
            if (errCode != 0) {
                ACCOUNT_DISTRIBUTED_ACCOUNT_LOG.error("getOsAccountDistributedInfo failed: ${getErrorMsg(errCode)}")
                throw BusinessException(errCode, "getOsAccountDistributedInfo failed: ${getErrorMsg(errCode)}")
            }
            let res = convert(retAccountInfo)
            retAccountInfo.free()
            return res
        }
    }

    @!APILevel[
        19,
        permission: "ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS",
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func setOsAccountDistributedInfo(accountInfo: DistributedInfo): Unit {
        unsafe {
            var errCode: Int32 = 0
            let retAccountInfo = CJDistributedInfo.create(accountInfo)
            if (retAccountInfo.isNone()) {
                ACCOUNT_DISTRIBUTED_ACCOUNT_LOG.error(
                    "setOsAccountDistributedInfo failed: ${getErrorMsg(MEMORY_ERRCODE)}")
                throw BusinessException(MEMORY_ERRCODE,
                    "setOsAccountDistributedInfo failed: ${getErrorMsg(MEMORY_ERRCODE)}")
            }
            FfiOHOSDistributedAccountUnitSetOsAccountDistributedInfo(retAccountInfo.getOrThrow(), inout errCode);
            retAccountInfo.getOrThrow().free()
            if (errCode != 0) {
                ACCOUNT_DISTRIBUTED_ACCOUNT_LOG.error("setOsAccountDistributedInfo failed: ${getErrorMsg(errCode)}")
                throw BusinessException(errCode, "setOsAccountDistributedInfo failed: ${getErrorMsg(errCode)}")
            }
        }
    }
}

/**
 * Provides the distributed information of the OS account.
 *
 * @interface DistributedInfo
 * @syscap SystemCapability.Account.OsAccount
 * @since 7
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public class DistributedInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public let name: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public let id: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public let event: OhosAccountEvent
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public let nickname: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public let avatar: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public let status: DistributedAccountStatus
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public let scalableData: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public init(name: String, id: String, event: OhosAccountEvent, nickname!: String = "", avatar!: String = "",
        status!: DistributedAccountStatus = NOT_LOGGED_IN, scalableData!: String = "") {
        this.name = name
        this.id = id
        this.event = event
        this.nickname = nickname
        this.avatar = avatar
        this.status = status
        this.scalableData = scalableData
    }
}

func convert(cjDistributedInfo: CJDistributedInfo): DistributedInfo {
    let name = cjDistributedInfo.name.toString()
    let id = cjDistributedInfo.id.toString()
    let event = OhosAccountEvent.parse(cjDistributedInfo.event.toString())
    let nickname = cjDistributedInfo.nickname.toString()
    let avatar = cjDistributedInfo.avatar.toString()
    let status = DistributedAccountStatus.parse(cjDistributedInfo.status)
    let scalableData = cjDistributedInfo.scalableData.toString()
    return DistributedInfo(name, id, event, nickname: nickname, avatar: avatar, status: status,
        scalableData: scalableData)
}
