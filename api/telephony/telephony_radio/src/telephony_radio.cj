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

import ohos.base.*
import ohos.telephony_call.*
import ohos.ffi.*
import std.collection.*
import ohos.labels.*

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.TelephonyCoreService"
]
public class TelephonyRadio {
    @!APILevel[
        19,
        permission: "ohos.permission.GET_NETWORK_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getRadioTech(slotId: Int32): NetworkRadioTech {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonyRadioGetRadioTech(slotId, inout errCode)
            throwIfNotSuccess(errCode, "getRadioTech")
            return ret.toNetworkRadioTech()
        }
    }

    @!APILevel[
        19,
        permission: "ohos.permission.GET_NETWORK_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getNetworkState(slotId!: Int32 = 0): NetworkState {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonyRadioGetNetworkState(slotId, inout errCode)
            let result = ret.toNetworkState()
            ret.free()
            throwIfNotSuccess(errCode, "getNetworkState")
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getNetworkSelectionMode(slotId: Int32): NetworkSelectionMode {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonyRadioGetNetworkSelectionMode(slotId, inout errCode)
            throwIfNotSuccess(errCode, "getNetworkSelectionMode")
            return NetworkSelectionMode.parse(ret)
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getISOCountryCodeForNetwork(slotId: Int32): String {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonyRadioGetISOCountryCodeForNetwork(slotId, inout errCode)
            let result = ret.toString()
            LibC.free(ret)
            throwIfNotSuccess(errCode, "getISOCountryCodeForNetwork")
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getPrimarySlotId(): Int32 {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonyRadioGetPrimarySlotId(inout errCode)
            throwIfNotSuccess(errCode, "getPrimarySlotId")
            return ret
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getSignalInformation(slotId: Int32): Array<SignalInformation> {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonyRadioGetSignalInfoList(slotId, inout errCode)
            let signalInformations = ret.toArraySignalInformation()
            ret.free()
            throwIfNotSuccess(errCode, "getSignalInformation")
            return signalInformations
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func isNRSupported(): Bool {
        unsafe { FfiTelephonyRadioIsNRSupported() }
    }

    @!APILevel[
        19,
        permission: "ohos.permission.GET_NETWORK_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func isRadioOn(slotId!: Int32 = 0): Bool {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonyRadioIsRadioOn(slotId, inout errCode)
            throwIfNotSuccess(errCode, "isRadioOn")
            return ret
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getOperatorName(slotId: Int32): String {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonyRadioGetOperatorName(slotId, inout errCode)
            let result = ret.toString()
            LibC.free(ret)
            throwIfNotSuccess(errCode, "getOperatorName")
            return result
        }
    }
}
