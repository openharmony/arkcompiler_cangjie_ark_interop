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

package ohos.nfc.cardEmulation

import ohos.base.*
import ohos.ffi.*

foreign {
    func FfiNfcCardEmulationisDefaultService(cBundleName: CString, cAbilityName: CString, cModuleName: CString,
        cardTypeName: CString, ret: CPointer<Bool>): Int32

    func FfiNfcCardEmulationstart(cBundleName: CString, cAbilityName: CString, cModuleName: CString,
        cAidList: CArrString): Int32

    func FfiNfcCardEmulationstop(cBundleName: CString, cAbilityName: CString, cModuleName: CString): Int32

    func FfiNfcCardEmulationTransmit(cResponseApdu: CArrUI8): Int32

    func FfiNfcCardEmulationOn(eventType: Int8, id: Int64): Int32
}
