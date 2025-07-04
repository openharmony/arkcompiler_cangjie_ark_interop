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

package ohos.file_grant_permission

import ohos.ffi.*
import ohos.base.*
import ohos.labels.APILevel

/**
 * Set persistence permissions for the URI
 *
 * @throws { IllegalArgumentException } The length of the array is extra-long
 * @returns { Option<ErrorResult> } return errorcode and message.
 * @relation persistPermission(policies: Array<PolicyInfo>): Promise<void>;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public func persistPermission(policies: Array<PolicyInfo>): Option<ErrorResult> {
    if (policies.size > MAX_ARRAY_SIZE) {
        throw IllegalArgumentException("The length of the array is extra-long")
    }
    var code = 0i32
    let constructor = {p: PolicyInfo => CPolicyInfo(p)}
    let cPolocyInfos = unsafe {
        CArrCPolicyInfo(cjArr2CArr<PolicyInfo, CPolicyInfo>(policies, constructor) {p: CPolicyInfo => p.free()},
            policies.size)
    }
    var res = unsafe { FfiOHOSFileGPPersistPermission(cPolocyInfos, inout code) }
    unsafe { cPolocyInfos.free() }
    match {
        case code == SUCCESS_CODE => return None
        case _ =>
            let errorInfo = unsafe { res.toArrPolicyErrorResult() }
            unsafe { FfiOHOSFreeArrPolicyErrorResult(inout res) }
            let errResult = ErrorResult(code, getErrorInfo(code), errorInfo)
            return Some(errResult)
    }
}

/**
 * Revoke persistence permissions for the URI
 *
 * @throws { IllegalArgumentException } The length of the array is extra-long
 * @returns { Option<ErrorResult> } return errorcode and message.
 * @relation revokePermission(policies: Array<PolicyInfo>): Promise<void>;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public func revokePermission(policies: Array<PolicyInfo>): Option<ErrorResult> {
    if (policies.size > MAX_ARRAY_SIZE) {
        throw IllegalArgumentException("The length of the array is extra-long")
    }
    var code = 0i32
    let constructor = {p: PolicyInfo => CPolicyInfo(p)}
    let cPolocyInfos = unsafe {
        CArrCPolicyInfo(cjArr2CArr<PolicyInfo, CPolicyInfo>(policies, constructor) {p: CPolicyInfo => p.free()},
            policies.size)
    }
    var res = unsafe { FfiOHOSFileGPRevokePermission(cPolocyInfos, inout code) }
    unsafe { cPolocyInfos.free() }
    match {
        case code == SUCCESS_CODE => return None
        case _ =>
            let errorInfo = unsafe { res.toArrPolicyErrorResult() }
            unsafe { FfiOHOSFreeArrPolicyErrorResult(inout res) }
            let errResult = ErrorResult(code, getErrorInfo(code), errorInfo)
            return Some(errResult)
    }
}

/**
 * Enable the URI that have been permanently authorized
 *
 * @throws { IllegalArgumentException } The length of the array is extra-long
 * @returns { Option<ErrorResult> } return errorcode and message.
 * @relation activatePermission(policies: Array<PolicyInfo>): Promise<void>;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public func activatePermission(policies: Array<PolicyInfo>): Option<ErrorResult> {
    if (policies.size > MAX_ARRAY_SIZE) {
        throw IllegalArgumentException("The length of the array is extra-long")
    }
    var code = 0i32
    let constructor = {p: PolicyInfo => CPolicyInfo(p)}
    let cPolocyInfos = unsafe {
        CArrCPolicyInfo(cjArr2CArr<PolicyInfo, CPolicyInfo>(policies, constructor) {p: CPolicyInfo => p.free()},
            policies.size)
    }
    var res = unsafe { FfiOHOSFileGPActivatePermission(cPolocyInfos, inout code) }
    unsafe { cPolocyInfos.free() }
    match {
        case code == SUCCESS_CODE => return None
        case _ =>
            let errorInfo = unsafe { res.toArrPolicyErrorResult() }
            unsafe { FfiOHOSFreeArrPolicyErrorResult(inout res) }
            let errResult = ErrorResult(code, getErrorInfo(code), errorInfo)
            return Some(errResult)
    }
}

/**
 * Stop the authorized URI that has been enabled
 *
 * @throws { IllegalArgumentException } The length of the array is extra-long
 * @returns { Option<ErrorResult> } return errorcode and message.
 * @relation deactivatePermission(policies: Array<PolicyInfo>): Promise<void>;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public func deactivatePermission(policies: Array<PolicyInfo>): Option<ErrorResult> {
    if (policies.size > MAX_ARRAY_SIZE) {
        throw IllegalArgumentException("The length of the array is extra-long")
    }
    var code = 0i32
    let constructor = {p: PolicyInfo => CPolicyInfo(p)}
    let cPolocyInfos = unsafe {
        CArrCPolicyInfo(cjArr2CArr<PolicyInfo, CPolicyInfo>(policies, constructor) {p: CPolicyInfo => p.free()},
            policies.size)
    }
    var res = unsafe { FfiOHOSFileGPDeactivatePermission(cPolocyInfos, inout code) }
    unsafe { cPolocyInfos.free() }
    match {
        case code == SUCCESS_CODE => return None
        case _ =>
            let errorInfo = unsafe { res.toArrPolicyErrorResult() }
            unsafe { FfiOHOSFreeArrPolicyErrorResult(inout res) }
            let errResult = ErrorResult(code, getErrorInfo(code), errorInfo)
            return Some(errResult)
    }
}

/**
 * Check persistent permissions for the URI.
 *
 * @throws { IllegalArgumentException } The length of the array is extra-long
 * @returns { Option<ErrorResult> } return errorcode and message.
 * @relation checkPersistentPermission(policies: Array<PolicyInfo>): Promise<Array<boolean>>;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public func checkPersistentPermission(policies: Array<PolicyInfo>): Array<Bool> {
    if (policies.size > MAX_ARRAY_SIZE) {
        throw IllegalArgumentException("The length of the array is extra-long")
    }
    var code = 0i32
    let constructor = {p: PolicyInfo => CPolicyInfo(p)}
    let cPolocyInfos = unsafe {
        CArrCPolicyInfo(cjArr2CArr<PolicyInfo, CPolicyInfo>(policies, constructor) {p: CPolicyInfo => p.free()},
            policies.size)
    }
    var ret = unsafe { FfiOHOSFileGPCheckPersistentPermission(cPolocyInfos, inout code) }
    unsafe { cPolocyInfos.free() }
    if (code != SUCCESS_CODE) {
        throw BusinessException(code, getErrorInfo(code))
    }
    let size = ret.size
    let ptr = ret.head
    if (ptr.isNull()) {
        return []
    }
    var arr = unsafe {
        Array<Bool>(
            size,
            {
                i => ptr.read(i)
            }
        )
    }
    unsafe { FfiOHOSFreeArrBool(inout ret) }
    return arr
}
