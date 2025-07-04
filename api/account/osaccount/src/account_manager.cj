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

import ohos.ffi.*
import ohos.labels.*
import ohos.base.*

var accoutManager: Option<AccountManager> = Option.None

/**
 * Obtains the AccountManager instance.
 *
 * @returns { AccountManager } Returns the instance of the AccountManager.
 * @syscap SystemCapability.Account.OsAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public func getAccountManager(): AccountManager {
    match (accoutManager) {
        case None => accoutManager = AccountManager()
        case Some(value) => ()
    }
    return accoutManager.getOrThrow();
}

/**
 * Provides abilities for you to manage and perform operations on your OS accounts.
 *
 * @class AccountManager
 * @syscap SystemCapability.Account.OsAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.OsAccount"
]
public class AccountManager {

    /**
     * Checks whether the given constraint is enabled for the current OS account.
     *
     * @param { String } constraint - Indicates the constraint to check. For example: the value can be:
     * <br> {@code constraint.wifi.set} - Indicates the constraint on configuring the Wi-Fi access point.
     * <br> {@code constraint.sms.use} - Indicates the constraint on sending and receiving short messages.
     * <br> {@code constraint.calls.outgoing} - Indicates the constraint on making calls.
     * <br> {@code constraint.unknown.sources.install} - Indicates the constraint on installing applications
     * <br> from unknown sources.
     * @returns { Bool } Returns whether the given constraint is enabled for the current OS account.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func isOsAccountConstraintEnabled(constraint: String): Bool {
        if (constraint.isEmpty()) {
            checkRet(ERR_PARAMETER_ERROR, "[AccountManager] isOsAccountConstraintEnabled: ");
        }
        var ret = false;
        var errCode: Int32 = 0
        unsafe {
            try (cconstraint = LibC.mallocCString(constraint).asResource()) {
                ret = FfiOHOSOsAccountIsOsAccountConstraintEnabled(cconstraint.value, inout errCode)
                checkRet(errCode, "[AccountManager] isOsAccountConstraintEnabled: ");
            }
        }
        return ret;
    }

    /**
     * Obtains the type of this OS account from the current process.
     *
     * @returns { OsAccountType } Returns the OS account type. The value can be {@link OsAccountType#ADMIN},
     *         {@link OsAccountType#NORMAL}, and {@link OsAccountType#GUEST}.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getOsAccountType(): OsAccountType {
        var errCode: Int32 = 0;
        let ret: Int32 = unsafe { FfiOHOSOsAccountGetOsAccountType(inout errCode) }
        checkRet(errCode, "[AccountManager] getOsAccountType: ");
        return OsAccountType.parse(ret);
    }

    /**
     * Checks whether current OS account is testable.
     *
     * @returns { Bool } Returns {@code true} if this account is testable; returns {@code false} otherwise.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func checkOsAccountTestable(): Bool {
        var errCode: Int32 = 0;
        let ret: Bool = unsafe { FfiOHOSOsAccountCheckOsAccountTestable(inout errCode) }
        checkRet(errCode, "[AccountManager] checkOsAccountTestable: ");
        return ret;
    }

    /**
     * Checks whether the function of supporting multiple OS accounts is enabled.
     *
     * @returns { Bool } Returns {@code true} if this function is enabled; returns {@code false} otherwise.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func checkMultiOsAccountEnabled(): Bool {
        var errCode: Int32 = 0;
        let ret: Bool = unsafe { FfiOHOSOsAccountCheckMultiOsAccountEnabled(inout errCode) }
        checkRet(errCode, "[AccountManager] checkMultiOsAccountEnabled: ");
        return ret;
    }

    /**
     * Get the local ID of the current OS account.
     *
     * @returns { Int32 } Returns the local ID of the current account.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getOsAccountLocalId(): Int32 {
        var errCode: Int32 = 0;
        let ret: Int32 = unsafe { FfiOHOSOsAccountGetOsAccountLocalId(inout errCode) }
        checkRet(errCode, "[AccountManager] getOsAccountLocalId: ");
        return ret;
    }

    /**
     * Gets the local IDs of all activated OS accounts.
     *
     * @returns { Array<Int32> } Returns all activated accounts.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getActivatedOsAccountLocalIds(): Array<Int32> {
        let ret: RetDataCArrI32 = unsafe { FfiOHOSOsAccountGetActivatedOsAccountLocalIds() }
        let errCode = ret.code
        if (errCode != SUCCESS_CODE) {
            unsafe { LibC.free<Int32>(ret.data.head) }
        }
        checkRet(errCode, "[AccountManager] getActivatedOsAccountLocalIds: ");

        let arr = unsafe { cArr2cjArr<Int32, Int32>(ret.data.size, ret.data.head, {i => i}) }
        unsafe { LibC.free<Int32>(ret.data.head) }
        return arr;
    }

    /**
     * Obtains the number of all OS accounts created on a device.
     *
     * @permission ohos.permission.MANAGE_LOCAL_ACCOUNTS
     * @returns { UInt32 } Returns the number of created OS accounts.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     * This API can be called only by system applications.
     */
    @!APILevel[
        19,
        permission: "ohos.permission.MANAGE_LOCAL_ACCOUNTS",
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getOsAccountCount(): UInt32 {
        var errCode: Int32 = 0;
        let ret: UInt32 = unsafe { FfiOHOSOsAccountGetOsAccountCount(inout errCode) }
        checkRet(errCode, "[AccountManager] getOsAccountCount: ");
        return ret;
    }

    /**
     * Queries the distributed virtual device ID (DVID).
     * <p>
     * If the same OHOS account has logged in to multiple devices, these devices constitute a super device
     * through the distributed networking. On the connected devices, you can call this method to obtain the DVIDs.
     * The same application running on different devices obtains the same DVID, whereas different applications
     * obtain different DVIDs.
     * <p>
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC or ohos.permission.MANAGE_LOCAL_ACCOUNTS
     * @returns { String } Returns the DVID if obtained; returns an empty string if no OHOS account has logged in.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC" | "ohos.permission.MANAGE_LOCAL_ACCOUNTS",
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func queryDistributedVirtualDeviceId(): String {
        var errCode: Int32 = 0;
        let ret: CString = unsafe { FfiOHOSOsAccountQueryDistributedVirtualDeviceId(inout errCode) }
        checkRet(errCode, "[AccountManager] queryDistributedVirtualDeviceId: ");
        let distributedVirtualDeviceId = ret.toString();
        unsafe { LibC.free(ret) }
        return distributedVirtualDeviceId;
    }

    /**
     * Gets the serial number for the specified os account local id.
     *
     * @param { Int32 } localId - Indicates the local ID of the OS account.
     * @returns { Int64 } Returns the serial number according to local ID.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @throws { BusinessException } 12300002 - Invalid localId.
     * @throws { BusinessException } 12300003 - Account not found.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getSerialNumberForOsAccountLocalId(localId: Int32): Int64 {
        var errCode: Int32 = 0;
        let ret: Int64 = unsafe { FfiOHOSOsAccountGetSerialNumberForOsAccountLocalId(localId, inout errCode) }
        checkRet(errCode, "[AccountManager] getSerialNumberForOsAccountLocalId: ");
        return ret;
    }

    /**
     * Gets the local ID of the OS account associated with the serial number.
     *
     * @param { Int32 } serialNumber - Indicates serial number.
     * @returns { Int64 } Returns the local ID of the OS account associated with the serial number.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @throws { BusinessException } 12300002 - Invalid serialNumber.
     * @throws { BusinessException } 12300003 - The account indicated by serialNumber dose not exist.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getOsAccountLocalIdForSerialNumber(serialNumber: Int64): Int32 {
        var errCode: Int32 = 0;
        let ret: Int32 = unsafe { FfiOHOSOsAccountGetOsAccountLocalIdForSerialNumber(serialNumber, inout errCode) }
        checkRet(errCode, "[AccountManager] getOsAccountLocalIdForSerialNumber: ");
        return ret;
    }

    /**
     * Gets the local ID of the OS account associated with the specified domain account.
     *
     * @permission ohos.permission.MANAGE_LOCAL_ACCOUNTS
     * @param { DomainAccountInfo } domainInfo - Indicates the domain account info.
     * @returns { Int32 } Returns the local ID of the OS account associated with the specified domain account.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @throws { BusinessException } 12300002 - Invalid domainInfo.
     * @syscap SystemCapability.Account.OsAccount
     * This API can be called only by system applications.
     */
    @!APILevel[
        19,
        permission: "ohos.permission.MANAGE_LOCAL_ACCOUNTS",
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getOsAccountLocalIdForDomain(domainInfo: DomainAccountInfo): Int32 {
        var errCode: Int32 = 0;
        let cdomainInfo: CDomainAccountInfo = CDomainAccountInfo(domainInfo)
        let ret: Int32 = unsafe { FfiOHOSOsAccountGetOsAccountLocalIdForDomain(cdomainInfo, inout errCode) }
        cdomainInfo.free();
        checkRet(errCode, "[AccountManager] getOsAccountLocalIdForDomain: ");
        return ret;
    }

    /**
     * Get the local ID of the OS account associated with the specified UID.
     *
     * @param { Int32 } uid - Indicates the process UID.
     * @returns { Int32 } - Returns the local ID of the OS account associated with the specified UID.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @throws { BusinessException } 12300002 - Invalid uid.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getOsAccountLocalIdForUid(uid: Int32): Int32 {
        var errCode: Int32 = 0;
        let ret: Int32 = unsafe { FfiOHOSOsAccountGetOsAccountLocalIdForUid(uid, inout errCode) }
        checkRet(errCode, "[AccountManager] getOsAccountLocalIdForUid: ");
        return ret;
    }

    /**
     * Gets the name of the OS account to which the caller belongs.
     *
     * @returns { String } The promise returned by the function.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func getOsAccountName(): String {
        var errCode: Int32 = 0;
        let ret: CString = unsafe { FfiOHOSOsAccountGetOsAccountName(inout errCode) }
        checkRet(errCode, "[AccountManager] getOsAccountName: ");
        let accountName = ret.toString();
        unsafe { LibC.free(ret) }
        return accountName;
    }

    /**
     * Checks whether the current OS account is unlocked.
     *
     * @returns { Bool } Returns whether the current OS account is unlocked.
     * @throws { BusinessException } 12300001 - The system service works abnormally.
     * @syscap SystemCapability.Account.OsAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.OsAccount"
    ]
    public func isOsAccountUnlocked(): Bool {
        var errCode: Int32 = 0;
        let ret: Bool = unsafe { FfiOHOSOsAccountIsOsAccountUnlocked(inout errCode) }
        checkRet(errCode, "[AccountManager] isOsAccountUnlocked: ");
        return ret;
    }
}
