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

package ohos.telephony_radio

import ohos.ffi.*
import ohos.base.*
import ohos.hilog.*
import std.collection.*

foreign {
    func FfiTelephonyRadioGetRadioTech(slotId: Int32, errCode: CPointer<Int32>): CNetworkRadioTech

    func FfiTelephonyRadioGetNetworkState(slotId: Int32, errCode: CPointer<Int32>): CNetworkState

    func FfiTelephonyRadioGetNetworkSelectionMode(slotId: Int32, errCode: CPointer<Int32>): Int32

    func FfiTelephonyRadioGetISOCountryCodeForNetwork(slotId: Int32, errCode: CPointer<Int32>): CString

    func FfiTelephonyRadioGetPrimarySlotId(errCode: CPointer<Int32>): Int32

    func FfiTelephonyRadioGetSignalInfoList(slotId: Int32, errCode: CPointer<Int32>): CArraySignalInformation

    func FfiTelephonyRadioIsNRSupported(): Bool

    func FfiTelephonyRadioIsRadioOn(slotId: Int32, errCode: CPointer<Int32>): Bool

    func FfiTelephonyRadioGetOperatorName(slotId: Int32, errCode: CPointer<Int32>): CString
}

@C
struct CNetworkRadioTech {
    CNetworkRadioTech(
        let psRadioTech: Int32,
        let csRadioTech: Int32
    ) {}

    func toNetworkRadioTech(): NetworkRadioTech {
        NetworkRadioTech(
            RadioTechnology.parse(psRadioTech),
            RadioTechnology.parse(csRadioTech)
        )
    }
}

@C
protected struct CNetworkState {
    protected CNetworkState(
        protected let longOperatorName: CString,
        protected let shortOperatorName: CString,
        protected let plmnNumeric: CString,
        protected let isRoaming: Bool,
        protected let regState: Int32,
        protected let cfgTech: Int32,
        protected let nsaState: Int32,
        protected let isCaActive: Bool,
        protected let isEmergency: Bool
    ) {}

    protected func free() {
        unsafe {
            LibC.free(longOperatorName)
            LibC.free(shortOperatorName)
            LibC.free(plmnNumeric)
        }
    }

    protected func toNetworkState(): NetworkState {
        NetworkState(
            longOperatorName.toString(),
            shortOperatorName.toString(),
            plmnNumeric.toString(),
            isRoaming,
            RegState.parse(regState),
            RadioTechnology.parse(cfgTech),
            NsaState.parse(nsaState),
            isCaActive,
            isEmergency
        )
    }
}

@C
protected struct CSignalInformation {
    protected CSignalInformation(
        protected let signalType: Int32,
        protected let signalLevel: Int32,
        protected let dBm: Int32
    ) {}

    protected func toSignalInformation(): SignalInformation {
        SignalInformation(NetworkType.parse(signalType), signalLevel, dBm)
    }
}

@C
protected struct CArraySignalInformation {
    protected CArraySignalInformation(
        protected let head: CPointer<CSignalInformation>,
        protected let size: Int64
    ) {}

    protected func free() {
        unsafe {
            LibC.free<CSignalInformation>(head)
        }
    }

    protected func toArraySignalInformation(): Array<SignalInformation> {
        unsafe {
            let result = Array<SignalInformation>(size, {i => head.read(i).toSignalInformation()})
            return result
        }
    }
}
