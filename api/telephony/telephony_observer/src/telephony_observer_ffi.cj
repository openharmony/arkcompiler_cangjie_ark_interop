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

package ohos.telephony_observer

import ohos.ffi.*
import ohos.base.*
import ohos.hilog.*
import ohos.telephony_call.*
import ohos.telephony_data.*
import ohos.telephony_radio.*
import ohos.telephony_sim.*

foreign {
    func FfiTelephonyObserverOnNetworkStateChange(options: CObserverOptions, funcId: Int64): Int32

    func FfiTelephonyObserverOffNetworkStateChange(funcId: Int64): Int32

    func FfiTelephonyObserverOffAllNetworkStateChange(): Int32

    func FfiTelephonyObserverOnSignalInfoChange(options: CObserverOptions, funcId: Int64): Int32

    func FfiTelephonyObserverOffSignalInfoChange(funcId: Int64): Int32

    func FfiTelephonyObserverOffAllSignalInfoChange(): Int32

    func FfiTelephonyObserverOnCallStateChange(options: CObserverOptions, funcId: Int64): Int32

    func FfiTelephonyObserverOffCallStateChange(funcId: Int64): Int32

    func FfiTelephonyObserverOffAllCallStateChange(): Int32

    func FfiTelephonyObserverOnCellularDataConnectionStateChange(options: CObserverOptions, funcId: Int64): Int32

    func FfiTelephonyObserverOffCellularDataConnectionStateChange(funcId: Int64): Int32

    func FfiTelephonyObserverOffAllCellularDataConnectionStateChange(): Int32

    func FfiTelephonyObserverOnCellularDataFlowChange(options: CObserverOptions, funcId: Int64): Int32

    func FfiTelephonyObserverOffCellularDataFlowChange(funcId: Int64): Int32

    func FfiTelephonyObserverOffAllCellularDataFlowChange(): Int32

    func FfiTelephonyObserverOnSimStateChange(options: CObserverOptions, funcId: Int64): Int32

    func FfiTelephonyObserverOffSimStateChange(funcId: Int64): Int32

    func FfiTelephonyObserverOffAllSimStateChange(): Int32

    func FfiTelephonyObserverOnIccAccountInfoChange(funcId: Int64): Int32

    func FfiTelephonyObserverOffIccAccountInfoChange(funcId: Int64): Int32

    func FfiTelephonyObserverOffAllIccAccountInfoChange(): Int32
}

@C
struct CObserverOptions {
    CObserverOptions(var slotId: Int32) {}
}

@C
struct CCallStateInfo {
    CCallStateInfo(
        let state: Int32,
        let number: CString
    ) {}

    func toCallStateInfo(): CallStateInfo {
        CallStateInfo(CallState.parse(state), number.toString())
    }

    func free() {
        unsafe {
            LibC.free(number)
        }
    }
}

@C
struct CDataConnectionStateInfo {
    CDataConnectionStateInfo(
        let state: Int32,
        let network: Int32
    ) {}

    func toDataConnectionStateInfo(): DataConnectionStateInfo {
        DataConnectionStateInfo(DataConnectState.parse(state), RadioTechnology.parse(network))
    }
}

@C
struct CSimStateData {
    CSimStateData(
        let cardType: Int32,
        let state: Int32,
        let reason: Int32
    ) {}

    func toSimStateData(): SimStateData {
        SimStateData(CardType.parse(cardType), SimState.parse(state), LockReason.parse(reason))
    }
}
