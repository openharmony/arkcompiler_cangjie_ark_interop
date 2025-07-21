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

package ohos.bundle.bundle_manager

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

/**
 * The constant for application type.
 *
 * @relation export enum ApplicationType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
]
public enum ApplicationType {
    /**
     * Default browser identifier.
     *
     * @relation BROWSER = 'Web Browser'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Browser
    /**
     * Default image identifier.
     *
     * @relation IMAGE = 'Image Gallery'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Image
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    /**
     * Default audio identifier.
     *
     * @relation AUDIO = 'Audio Player'
     */
    Audio
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    /**
     * Default video identifier.
     *
     * @relation VIDEO = 'Video Player'
     */
    Video
    /**
     * Default PDF identifier.
     *
     * @relation PDF = 'PDF Viewer'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    PDF
    /**
     * Default Default word identifier.
     *
     * @relation WORD = 'Word Viewer'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Word
    /**
     * Default excel identifier.
     *
     * @relation EXCEL = 'Excel Viewer'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Excel
    /**
     * Default PPT identifier.
     *
     * @relation PPT = 'PPT Viewer'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    PPT
    /**
     * Default email identifier.
     *
     * @relation EMAIL = 'Email'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Email
    | ...

    /**
     * Default email identifier.
     *
     * @relation get the corresponding mapping value
     */
    @!APILevel[
        21,
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

/**
 * Default application manager.
 *
 * @relation declare namespace defaultAppManager
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
]
public class DefaultAppManager {
    /**
     * Query whether the caller is default application based on type.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.
     * @throws { BusinessException } 801 - Capability not supported.
     *
     * @relation function isDefaultApplicationSync(type: string): boolean
     */
    @!APILevel[
        21,
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
