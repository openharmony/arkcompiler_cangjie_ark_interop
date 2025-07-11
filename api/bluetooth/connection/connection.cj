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

package ohos.bluetooth.connection

import ohos.base.*
import ohos.bluetooth.*
import ohos.ffi.*
import ohos.labels.*

/**
 * Sets the Bluetooth friendly name of a device. It is used only by system applications for security.
 * If a non-system application invokes the interface, exception 801 is thrown.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } name - Indicates a valid Bluetooth name.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    21,
    deprecated: 19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func setLocalName(name: String): Unit {
    var errorCode: Int32 = 0
    unsafe {
        try (cName = LibC.mallocCString(name).asResource()) {
            FfiBluetoothConSetLocalName(cName.value, inout errorCode)
        }
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}
