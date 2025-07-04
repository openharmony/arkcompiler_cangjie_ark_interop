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

foreign {
    func FfiOHOSFileGPPersistPermission(policies: CArrCPolicyInfo, code: CPointer<Int32>): CArrCPolicyErrorResult

    func FfiOHOSFileGPRevokePermission(policies: CArrCPolicyInfo, code: CPointer<Int32>): CArrCPolicyErrorResult

    func FfiOHOSFileGPActivatePermission(policies: CArrCPolicyInfo, code: CPointer<Int32>): CArrCPolicyErrorResult

    func FfiOHOSFileGPDeactivatePermission(policies: CArrCPolicyInfo, code: CPointer<Int32>): CArrCPolicyErrorResult

    func FfiOHOSFileGPCheckPersistentPermission(policies: CArrCPolicyInfo, code: CPointer<Int32>): CArrBool

    func FfiOHOSFreeArrPolicyErrorResult(policies: CPointer<CArrCPolicyErrorResult>): Unit

    func FfiOHOSFreeArrBool(tags: CPointer<CArrBool>): Unit
}

@C
struct CArrCPolicyErrorResult {
    CArrCPolicyErrorResult(
        let head: CPointer<CPolicyErrorResult>,
        let size: Int64
    ) {}

    func toArrPolicyErrorResult(): Array<PolicyErrorResult> {
        unsafe {
            if (head.isNull()) {
                return []
            }
            Array<PolicyErrorResult>(size) {
                i => head.read(i).toPolicyErrorResult()
            }
        }
    }
}

@C
struct CPolicyErrorResult {
    CPolicyErrorResult(
        let uri: CString,
        let code: Int32,
        let message: CString
    ) {}

    func toPolicyErrorResult(): PolicyErrorResult {
        PolicyErrorResult(uri.toString(), PolicyErrorCode.parse(code), message.toString())
    }
}

@C
struct CPolicyInfo {
    let uri: CString
    let operationMode: UInt8

    init(uri: CString, operationMode: UInt8) {
        this.uri = uri
        this.operationMode = operationMode
    }

    init(p: PolicyInfo) {
        this.uri = unsafe { LibC.mallocCString(p.uri) }
        this.operationMode = p.operationMode.value
    }

    func free() {
        unsafe { LibC.free(this.uri) }
    }
}

@C
struct CArrCPolicyInfo {
    CArrCPolicyInfo(
        let head: CPointer<CPolicyInfo>,
        let size: Int64
    ) {}

    func free() {
        unsafe {
            if (!head.isNull()) {
                for (i in 0..size) {
                    head.read(i).free()
                }
                LibC.free<CPolicyInfo>(head)
            }
        }
    }
}
