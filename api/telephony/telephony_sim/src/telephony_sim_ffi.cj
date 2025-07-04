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

package ohos.telephony_sim

import ohos.ffi.*
import std.collection.*
import ohos.base.*

foreign {
    func FfiTelephonySimIsSimActive(slotId: Int32, errCode: CPointer<Int32>): Bool

    func FfiTelephonySimGetDefaultVoiceSlotId(): Int32

    func FfiTelephonySimHasOperatorPrivileges(slotId: Int32, errCode: CPointer<Int32>): Bool

    func FfiTelephonySimGetISOCountryCodeForSim(slotId: Int32, errCode: CPointer<Int32>): CString

    func FfiTelephonySimGetSimOperatorNumeric(slotId: Int32, errCode: CPointer<Int32>): CString

    func FfiTelephonySimGetSimSpn(slotId: Int32, errCode: CPointer<Int32>): CString

    func FfiTelephonySimGetSimState(slotId: Int32, errCode: CPointer<Int32>): Int32

    func FfiTelephonySimGetCardType(slotId: Int32, errCode: CPointer<Int32>): Int32

    func FfiTelephonySimHasSimCard(slotId: Int32, errCode: CPointer<Int32>): Bool

    func FfiTelephonySimGetSimAccountInfo(slotId: Int32, errCode: CPointer<Int32>): CIccAccountInfo

    func FfiTelephonySimGetActiveSimAccountInfoList(errCode: CPointer<Int32>): CArryIccAccountInfo

    func FfiTelephonySimGetMaxSimCount(): Int32

    func FfiTelephonySimGetOpKey(slotId: Int32, errCode: CPointer<Int32>): CString

    func FfiTelephonySimGetOpName(slotId: Int32, errCode: CPointer<Int32>): CString

    func FfiTelephonySimGetDefaultVoiceSimId(errCode: CPointer<Int32>): Int32
}

@C
struct CIccAccountInfo {
    CIccAccountInfo(
        let simId: Int32,
        let slotIndex: Int32,
        let isEsim: Bool,
        let isActive: Bool,
        let iccId: CString,
        let showName: CString,
        let showNumber: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(iccId)
            LibC.free(showName)
            LibC.free(showNumber)
        }
    }

    func toIccAccountInfo(): IccAccountInfo {
        IccAccountInfo(
            simId,
            slotIndex,
            isEsim,
            isActive,
            iccId.toString(),
            showName.toString(),
            showNumber.toString()
        )
    }
}

@C
struct CArryIccAccountInfo {
    CArryIccAccountInfo(
        let head: CPointer<CIccAccountInfo>,
        let size: Int64
    ) {}

    func free() {
        if (head.isNotNull()) {
            unsafe {
                for (i in 0..size) {
                    head.read(i).free()
                }
                LibC.free<CIccAccountInfo>(head)
            }
        }
    }

    func toArrayIccAccountInfo(): Array<IccAccountInfo> {
        unsafe {
            let result = Array<IccAccountInfo>(size, {i => head.read(i).toIccAccountInfo()})
            return result
        }
    }
}
