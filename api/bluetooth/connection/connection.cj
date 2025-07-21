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

import ohos.base.BusinessException
import ohos.bluetooth.checkRet
import ohos.ffi.SUCCESS_CODE
import ohos.labels.APILevel

/**
 * Sets the Bluetooth friendly name of a device. It is used only by system applications for security.
 * If a non-system application invokes the interface, exception 801 is thrown.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } name - Indicates a valid Bluetooth name.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 2900001 - Service stopped.
 * @throws { BusinessException } 2900003 - Bluetooth disabled.
 * @throws { BusinessException } 2900099 - Operation failed.
 * @relation function setLocalName(name: string): void
 */
@!APILevel[
    21,
    deprecated: 19,
    permission: "ohos.permission.ACCESS_BLUETOOTH",
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
    checkRet(errorCode)
}
