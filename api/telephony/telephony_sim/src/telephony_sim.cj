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
public class TelephonySim {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func isSimActive(slotId: Int32): Bool {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimIsSimActive(slotId, inout errCode)
            throwIfNotSuccess(errCode, "isSimActive")
            return ret
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getDefaultVoiceSlotId(): Int32 {
        unsafe { FfiTelephonySimGetDefaultVoiceSlotId() }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func hasOperatorPrivileges(slotId: Int32): Bool {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimHasOperatorPrivileges(slotId, inout errCode)
            throwIfNotSuccess(errCode, "hasOperatorPrivileges")
            return ret
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getISOCountryCodeForSim(slotId: Int32): String {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetISOCountryCodeForSim(slotId, inout errCode)
            let result = ret.toString()
            LibC.free(ret)
            throwIfNotSuccess(errCode, "getISOCountryCodeForSim")
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getSimOperatorNumeric(slotId: Int32): String {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetSimOperatorNumeric(slotId, inout errCode)
            let result = ret.toString()
            LibC.free(ret)
            throwIfNotSuccess(errCode, "getSimOperatorNumeric")
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getSimSpn(slotId: Int32): String {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetSimSpn(slotId, inout errCode)
            let result = ret.toString()
            LibC.free(ret)
            throwIfNotSuccess(errCode, "getSimSpn")
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getSimState(slotId: Int32): SimState {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetSimState(slotId, inout errCode)
            throwIfNotSuccess(errCode, "getSimState")
            SimState.parse(ret)
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getCardType(slotId: Int32): CardType {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetCardType(slotId, inout errCode)
            throwIfNotSuccess(errCode, "getCardType")
            CardType.parse(ret)
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func hasSimCard(slotId: Int32): Bool {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimHasSimCard(slotId, inout errCode)
            throwIfNotSuccess(errCode, "hasSimCard")
            return ret
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getSimAccountInfo(slotId: Int32): IccAccountInfo {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetSimAccountInfo(slotId, inout errCode)
            let accountInfo = ret.toIccAccountInfo()
            ret.free()
            throwIfNotSuccess(errCode, "getSimAccountInfo")
            return accountInfo
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getActiveSimAccountInfoList(): Array<IccAccountInfo> {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetActiveSimAccountInfoList(inout errCode)
            let accountInfoList = ret.toArrayIccAccountInfo()
            ret.free()
            throwIfNotSuccess(errCode, "getActiveSimAccountInfoList")
            return accountInfoList
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getMaxSimCount(): Int32 {
        unsafe { FfiTelephonySimGetMaxSimCount() }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getOpKey(slotId: Int32): String {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetOpKey(slotId, inout errCode)
            let result = ret.toString()
            LibC.free(ret)
            throwIfNotSuccess(errCode, "getOpKey")
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getOpName(slotId: Int32): String {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetOpName(slotId, inout errCode)
            let result = ret.toString()
            LibC.free(ret)
            throwIfNotSuccess(errCode, "getOpName")
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public static func getDefaultVoiceSimId(): Int32 {
        unsafe {
            var errCode = 0i32
            let ret = FfiTelephonySimGetDefaultVoiceSimId(inout errCode)
            throwIfNotSuccess(errCode, "getDefaultVoiceSimId")
            return ret
        }
    }
}
