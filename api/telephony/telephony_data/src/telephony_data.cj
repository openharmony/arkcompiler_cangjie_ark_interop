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

package ohos.telephony_data

import ohos.base.*
import ohos.telephony_call.*
import ohos.ffi.*
import ohos.labels.*

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CellularData"
]
public class TelephonyData {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    public static func getDefaultCellularDataSlotId(): Int32 {
        let result = unsafe { FfiCellularDataGetDefaultCellularDataSlotId() }
        result
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    public static func getCellularDataFlowType(): DataFlowType {
        var errCode = 0i32
        let result = unsafe { FfiCellularDataGetCellularDataFlowType(inout errCode) }
        throwIfNotSuccess(errCode, "TelephonyData", "getCellularDataFlowType")
        DataFlowType.parse(result)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    public static func getCellularDataState(): DataConnectState {
        var errCode = 0i32
        let result = unsafe { FfiCellularDataGetCellularDataState(inout errCode) }
        throwIfNotSuccess(errCode, "TelephonyData", "getCellularDataState")
        DataConnectState.parse(result)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    public static func isCellularDataEnabled(): Bool {
        var errCode = 0i32
        let result = unsafe { FfiCellularDataIsCellularDataEnabled(inout errCode) }
        throwIfNotSuccess(errCode, "TelephonyData", "isCellularDataEnabled")
        result
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    public static func isCellularDataRoamingEnabled(slotId: Int32): Bool {
        var errCode = 0i32
        let result = unsafe { FfiCellularDataIsCellularDataRoamingEnabled(slotId, inout errCode) }
        throwIfNotSuccess(errCode, "TelephonyData", "isCellularDataRoamingEnabled")
        result
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    public static func getDefaultCellularDataSimId(): Int32 {
        let result = unsafe { FfiCellularDataGetDefaultCellularDataSimId() }
        result
    }
}
