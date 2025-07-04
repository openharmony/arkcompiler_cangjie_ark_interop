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

type StageContext = CPointer<Unit>

foreign {
    func FfiOHOSOsAccountIsOsAccountConstraintEnabled(constraint: CString, errCode: CPointer<Int32>): Bool

    func FfiOHOSOsAccountGetOsAccountType(errCode: CPointer<Int32>): Int32

    func FfiOHOSOsAccountCheckOsAccountTestable(errCode: CPointer<Int32>): Bool

    func FfiOHOSOsAccountCheckMultiOsAccountEnabled(errCode: CPointer<Int32>): Bool

    func FfiOHOSOsAccountGetOsAccountLocalId(errCode: CPointer<Int32>): Int32

    func FfiOHOSOsAccountGetActivatedOsAccountLocalIds(): RetDataCArrI32

    func FfiOHOSOsAccountGetOsAccountCount(errCode: CPointer<Int32>): UInt32

    func FfiOHOSOsAccountQueryDistributedVirtualDeviceId(errCode: CPointer<Int32>): CString

    func FfiOHOSOsAccountGetSerialNumberForOsAccountLocalId(localId: Int32, errCode: CPointer<Int32>): Int64

    func FfiOHOSOsAccountGetOsAccountLocalIdForSerialNumber(serialNumber: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSOsAccountGetOsAccountLocalIdForDomain(domainInfo: CDomainAccountInfo, errCode: CPointer<Int32>): Int32

    func FfiOHOSOsAccountGetOsAccountLocalIdForUid(uid: Int32, errCode: CPointer<Int32>): Int32

    func FfiOHOSOsAccountGetOsAccountName(errCode: CPointer<Int32>): CString

    func FfiOHOSOsAccountIsOsAccountUnlocked(errCode: CPointer<Int32>): Bool
}
