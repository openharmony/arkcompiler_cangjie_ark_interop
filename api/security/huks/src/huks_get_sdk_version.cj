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

package ohos.security.huks

import ohos.labels.*

const HKS_MAX_VERSION_SIZE: UInt32 = 64

/**
 * Obtains the SDK version of the current system.
 *
 * @relation getSdkVersion(options: HuksOptions): string
 */
@!APILevel[
    21,
    deprecated: 11,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func getSdkVersion(): String {
    var sdkVersion = unsafe { OhosHksBlob.malloc(HKS_MAX_VERSION_SIZE) }

    let retCode = unsafe { FfiOHOSGetSdkVersion(inout sdkVersion) }

    let sdkVersionString: String = sdkVersion.toString()

    try {
        if (retCode != HKS_SUCCESS) {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            sdkVersion.free()
        }
    }

    return sdkVersionString
}