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

package ohos.bundle_manager

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
]
public enum ApplicationType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Browser
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Image
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Audio
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Video
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    PDF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Word
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Excel
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    PPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Email
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    public func getValue(): String {
        match (this) {
            case Browser => "Web Browser"
            case Image => "Image Gallery"
            case Audio => "Audio Player"
            case Video => "Video Player"
            case PDF => "PDF Viewer"
            case Word => "Word Viewer"
            case Excel => "Excel Viewer"
            case PPT => "PPT Viewer"
            case Email => "Email"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

foreign func FfiBundleManagerIsDefaultApplication(appType: CString): RetDataBool

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
]
public class DefaultAppManager {
    /**
     * Query whether the caller is default application based on type.
     *
     * @param { string } type - Application type or a file type that conforms to media type format.
     * @returns { boolean } Return true if caller is default application; return false otherwise.
     * @throws { BusinessError } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.
     * @throws { BusinessError } 801 - Capability not supported.
     * @syscap SystemCapability.BundleManager.BundleFramework.DefaultApp
     * @since 10
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    public static func isDefaultApplication(appType: String): Bool {
        let cAppType = unsafe { LibC.mallocCString(appType) }
        let cValue = unsafe { FfiBundleManagerIsDefaultApplication(cAppType) }
        unsafe { LibC.free(cAppType) }
        if (cValue.code != 0) {
            throw BusinessException(cValue.code, getErrorMsg(cValue.code))
        }
        return cValue.data
    }
}
