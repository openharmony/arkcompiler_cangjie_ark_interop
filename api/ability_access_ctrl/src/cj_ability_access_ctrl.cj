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

import ohos.app.ability.ui_ability.{UIAbilityContext, getStageContext}
import ohos.base.{ AsyncCallback, AsyncError, BusinessException }
import ohos.ffi.{ CArrString, CArrUI32, Callback1Param, freeArrCString, toArrayCString}
import std.deriving.Derive
import ohos.ffi.*
import ohos.hilog.HilogChannel
public import ohos.security.permission_request_result.*
import ohos.security.permission_request_result.*

import ohos.labels.APILevel

const INVALID_PARA: Int32 = 12100001
const OUT_MEMORY_ERR: Int32 = 12100008

/**
 * Indicates permissions.
 *
 * @syscap SystemCapability.Security.AccessToken
 */
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

/**
* GrantStatus.
*
* @relation export enum GrantStatus
*/
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.AccessToken"
]
public enum GrantStatus {
    /**
     * access_token permission check fail
     *
     * @relation PERMISSION_DENIED = -1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    PermissionDenied
    | 
    /**
     * access_token permission check success
     *
     * @relation PERMISSION_GRANTED = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    PermissionGranted
    | ...

    static func toGrantStatus(code: Int32): GrantStatus {
        if (code == -1) {
            return PermissionDenied
        } else {
            return PermissionGranted
        }
    }
}

/**
 * abilityAccessCtrl
 *
 * @relation declare namespace abilityAccessCtrl
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.AccessToken"
]
public class AbilityAccessCtrl {

    /**
     * Obtains the AtManager instance.
     *
     * @relation function createAtManager(): AtManager
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public static func createAtManager(): AtManager {
        return AtManager()
    }
}

/**
* Provides methods for managing access_token.
*
* @relation interface AtManager
*/
@!APILevel[
    21,
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
     * @relation requestPermissionsFromUser(
     *             context: Context,
     *             permissionList: Array<Permissions>,
     *             requestCallback: AsyncCallback<PermissionRequestResult>
     *           ): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public func requestPermissionsFromUser(context: UIAbilityContext, permissionList: Array<Permissions>,
        requestCallback: AsyncCallback<PermissionRequestResult>): Unit {
        let stageContext = getStageContext(context)
        if (stageContext.isNull()) {
            throw BusinessException(INVALID_PARA, getErrorInfo(INVALID_PARA))
        }
        unsafe {
            let cPermissionList = toArrayCString(permissionList)
            let wrapper = {
                value: RetDataCPermissionRequestResult => if (value.code == 0) {
                    try {
                        let data = PermissionRequestResult.fromCPermissionRequestResult(value.data)
                        requestCallback(None, data)
                    } catch (e: BusinessException) {
                        requestCallback(AsyncError(OUT_MEMORY_ERR), None)
                    }
                } else {
                    try {
                        // free memory
                        PermissionRequestResult.fromCPermissionRequestResult(value.data)
                        requestCallback(AsyncError(value.code), None)
                    } catch (e: BusinessException) {
                        requestCallback(AsyncError(OUT_MEMORY_ERR), None)
                    }
                }
            }
            let lambdaData = Callback1Param<RetDataCPermissionRequestResult, Unit>(wrapper)
            FfiOHOSAbilityAccessCtrlRequestPermissionsFromUser(stageContext, cPermissionList, lambdaData.getID())
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
     * @relation checkAccessTokenSync(tokenID: int, permissionName: Permissions): GrantStatus
     */
    @!APILevel[
        21,
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
