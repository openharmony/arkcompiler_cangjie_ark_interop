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

package ohos.user_auth

foreign {
    func FfiUserAuthGetAvailableStatus(authType: UInt32, authTrustLevel: UInt32): Int32

    func FfiUserAuthGetEnrolledState(authType: UInt32, enrolledState: CPointer<CEnrolledState>): Int32

    func FfiUserAuthNewCb(callback: Int64): CPointer<Unit>

    func FfiUserAuthDeleteCb(callbackRef: CPointer<Unit>): Int32

    func FfiUserAuthStart(authParam: CPointer<CAuthParam>, widgetParam: CPointer<CWidgetParam>,
        callbackRef: CPointer<Unit>): UInt64

    func FfiUserAuthCancel(contextId: UInt64): Int32
}

@C
struct CEnrolledState {
    CEnrolledState(
        let credentialDigest: UInt64,
        let credentialCount: UInt16
    ) {}

    func toEnrolledState(): EnrolledState {
        EnrolledState(credentialDigest, credentialCount)
    }
}
