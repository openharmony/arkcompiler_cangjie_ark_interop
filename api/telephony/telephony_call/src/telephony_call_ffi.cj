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

package ohos.telephony_call

import ohos.ffi.*
import ohos.base.*

foreign {
    func FfiOHOSTelephonyCallFormatPhoneNumberToE164(phoneNumber: CString, countryCode: CString,
        errCode: CPointer<Int32>): CString

    func FfiOHOSTelephonyCallInit(): Unit

    func FfiOHOSTelephonyCallHasVoiceCapability(): Bool

    func FfiOHOSTelephonyCallFormatPhoneNumber(phoneNumber: CString, countryCode: CString, errCode: CPointer<Int32>): CString

    func FfiOHOSTelephonyCallGetCallState(): Int32

    func FfiOHOSTelephonyCallHasCall(): Bool

    func FfiOHOSTelephonyCallIsEmergencyPhoneNumber(phoneNumber: CString, slotId: Int32, errCode: CPointer<Int32>): Bool

    func FfiOHOSTelephonyCallMakeCall(phoneNumber: CString): Int32
}
