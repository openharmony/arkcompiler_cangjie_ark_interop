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

package ohos.ability_access_ctrl

import std.collection.ArrayList
import std.deriving.Derive
import std.sync.Mutex
import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.ability.*
import ohos.labels.*

const INVALID_PARA: Int32 = 12100001
const OUT_MEMORY_ERR: Int32 = 12100008

public type Permissions = String

type StageContext = CPointer<Unit>

foreign {
    func FfiOHOSAbilityAccessCtrlCheckAccessTokenSync(tokenID: UInt32, cPermissionName: CString): Int32

    func FfiOHOSAbilityAccessCtrlGrantUserGrantedPermission(tokenID: UInt32, cPermissionName: CString,
        permissionFlags: UInt32): Int32

    func FfiOHOSAbilityAccessCtrlRevokeUserGrantedPermission(tokenID: UInt32, cPermissionName: CString,
        permissionFlags: UInt32): Int32

    func FfiOHOSAbilityAccessCtrlOn(cType: CString, cTokenIDList: CArrUI32, cPermissionList: CArrString, funcId: Int64): Int32

    func FfiOHOSAbilityAccessCtrlOff(cType: CString, cTokenIDList: CArrUI32, cPermissionList: CArrString, funcId: Int64): Int32

    func FfiOHOSAbilityAccessCtrlRequestPermissionsFromUser(context: StageContext, cPermissionList: CArrString,
        id: Int64): Unit

    func FfiOHOSAbilityAccessCtrlRequestPermissionsFromUserByStdFunc(context: StageContext, cPermissionList: CArrString,
        callbackPtr: CPointer<Unit>): Unit

    func FfiOHOSAbilityAccessCtrlRequestPermissionOnSetting(context: StageContext, cPermissionList: CArrString,
        id: Int64): Unit

    func FfiOHOSAbilityAccessCtrlRequestGlobalSwitch(context: StageContext, switchType: Int32, id: Int64): Unit

    func memcpy_s(dest: CPointer<UInt32>, destMax: UIntNative, src: CPointer<UInt32>, count: UIntNative): Int32
}

const SECURITY_DOMAIN_ACCESSTOKEN: UInt32 = 0xD005A01
let ACCESS_LOG = HilogChannel(0, SECURITY_DOMAIN_ACCESSTOKEN, "CJ-AbilityAccessCtrl")

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.AccessToken"
]
public enum GrantStatus {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    PERMISSION_DENIED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    PERMISSION_GRANTED
    | ...

    static func toGrantStatus(code: Int32): GrantStatus {
        if (code == -1) {
            return PERMISSION_DENIED
        } else {
            return PERMISSION_GRANTED
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.AccessToken"
]
public class PermissionRequestResult {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public var permissions: Array<String>

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public var authResults: Array<Int32>

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public var dialogShownResults: ?Array<Bool> = None

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public init(
        permissions: Array<String>,
        authResults: Array<Int32>
    ) {
        this.permissions = permissions
        this.authResults = authResults
    }

    static func fromCPermissionRequestResult(cRet: CPermissionRequestResult): PermissionRequestResult {
        let pSize = cRet.permissions.size
        let pPtr = cRet.permissions.head
        if (pPtr.isNull()) {
            throw BusinessException(OUT_MEMORY_ERR, "malloc failed!")
        }
        let permissionsArr = unsafe {
            Array<String>(
                pSize,
                {
                    i =>
                    let cString = pPtr.read(i)
                    let permission = cString.toString()
                    LibC.free(cString)
                    permission
                }
            )
        }
        unsafe { LibC.free<CString>(pPtr) }

        let cSize = cRet.authResults.size
        let cPtr = cRet.authResults.head
        if (cPtr.isNull()) {
            throw BusinessException(OUT_MEMORY_ERR, "malloc failed!")
        }
        let autuResultsArr = unsafe { Array<Int32>(cSize, {i => cPtr.read(i)}) }
        unsafe { LibC.free<Int32>(cPtr) }

        let dSize = cRet.dialogShownResults.size
        let dPtr = cRet.dialogShownResults.head
        if (dPtr.isNull()) {
            return PermissionRequestResult(permissionsArr, autuResultsArr)
        }
        let dialogShownResultsArr = unsafe { Array<Bool>(dSize, {i => dPtr.read(i)}) }
        unsafe { LibC.free<Bool>(dPtr) }
        let result = PermissionRequestResult(permissionsArr, autuResultsArr)
        result.dialogShownResults = dialogShownResultsArr
        return result
    }
}

@C
struct CPermissionRequestResult {
    CPermissionRequestResult(
        let permissions: CArrString,
        let authResults: CArrI32,
        let dialogShownResults: CArrBool
    ) {}
}

@C
struct RetDataCPermissionRequestResult {
    RetDataCPermissionRequestResult(
        let code: Int32,
        let data: CPermissionRequestResult
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.AccessToken"
]
public class AbilityAccessCtrl {

    /**
     * Obtains the AtManager instance.
     *
     * @returns { AtManager } returns the instance of the AtManager.
     * @syscap SystemCapability.Security.AccessToken
     * @bref createAtManager(): AtManager
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public static func createAtManager(): AtManager {
        return AtManager()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.AccessToken"
]
public class AtManager {

    /**
     * Requests certain permissions from the user.
     *
     * @param { Context } context - The context that initiates the permission request.
     * @param { Array<Permissions> } permissionList - Indicates the list of permissions to be requested. This parameter
     *                                                cannot be null or empty.
     * @param { PermissionRequestResult } requestCallback Callback for the result from requesting permissions.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 12100001 - The parameter is invalid. The context is invalid when it does not
     *                                          belong to the application itself.
     *
     * @bref requestPermissionsFromUser(context: Context,
     *       permissionList: Array<Permissions>) : Promise<PermissionRequestResult>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public func requestPermissionsFromUser(context: StageContext, permissionList: Array<Permissions>,
        callback: AsyncCallback<PermissionRequestResult>): Unit {
        if (context.isNull()) {
            throw BusinessException(INVALID_PARA, getErrorInfo(INVALID_PARA))
        }
        unsafe {
            let cPermissionList = toArrayCString(permissionList)
            let wrapper = {
                value: RetDataCPermissionRequestResult => if (value.code == 0) {
                    try {
                        let data = PermissionRequestResult.fromCPermissionRequestResult(value.data)
                        callback(None, data)
                    } catch (e: BusinessException) {
                        callback(AsyncError(OUT_MEMORY_ERR), None)
                    }
                } else {
                    try {
                        // free memory
                        PermissionRequestResult.fromCPermissionRequestResult(value.data)
                        callback(AsyncError(value.code), None)
                    } catch (e: BusinessException) {
                        callback(AsyncError(OUT_MEMORY_ERR), None)
                    }
                }
            }
            let lambdaData = Callback1Param<RetDataCPermissionRequestResult, Unit>(wrapper)
            FfiOHOSAbilityAccessCtrlRequestPermissionsFromUser(context, cPermissionList, lambdaData.getID())
            freeArrCString(cPermissionList)
        }
    }

    /**
     * Checks whether a specified application has been granted the given permission.
     * On the cross-platform,
     * this function can be used to check the permission grant status for the current application only.
     *
     * @param { UInt32 } tokenID - Token ID of the application.
     * @param { Permissions } permissionName - Name of the permission to be verified.
     * @returns { GrantStatus } Returns permission verify result.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 12100001 - The parameter is invalid. The tokenID is 0,
     *                                          or the string size of permissionName is larger than 256.
     *
     * @bref checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public func checkAccessToken(tokenID: UInt32, permissionName: Permissions): GrantStatus {
        if (tokenID == 0) {
            ACCESS_LOG.error(getErrorInfo(INVALID_PARA)) // The parameter is invalid.
            throw BusinessException(INVALID_PARA, getErrorInfo(INVALID_PARA))
        }
        unsafe {
            let cPermissionName = LibC.mallocCString(permissionName)
            let ret = FfiOHOSAbilityAccessCtrlCheckAccessTokenSync(tokenID, cPermissionName)
            LibC.free(cPermissionName)
            return GrantStatus.toGrantStatus(ret)
        }
    }
}
