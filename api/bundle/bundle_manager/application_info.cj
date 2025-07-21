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
import ohos.resource.*
import ohos.metadata.*

/**
* Obtains configuration information about an application
*
* @relation export interface ApplicationInfo
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ApplicationInfo {
    /**
    * Indicates the application name, which is the same as bundleName
    *
    * @relation readonly name: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    /**
    * Description of application
    *
    * @relation readonly description: strin
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let description: String
    /**
    * Indicates the description id of the application
    *
    * @relation readonly descriptionId: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    /**
    * Indicates whether or not this application may be instantiated
    *
    * @relation readonly enabled: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let enabled: Bool
    /**
    * Indicates the label of the application
    *
    * @relation readonly label: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let label: String
    /**
    * Indicates the label id of the application
    *
    * @relation readonly labelId: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    /**
    * Indicates the icon of the application
    *
    * @relation readonly icon: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let icon: String
    /**
    * Indicates the icon id of the application
    *
    * @relation readonly iconId: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    /**
    * Process of application, if user do not set it ,the value equal bundleName
   *
    * @relation readonly process: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let process: String
    /**
    * Indicates the permissions required for accessing the application.
    *
    * @relation readonly permissions: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissions: Array<String>
    /**
    * Indicates the application source code path
    *
    * @relation readonly codePath: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let codePath: String
    /**
    * Indicates the metadata of the application
    *
    * @relation readonly metadataArray: Array<ModuleMetadata>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadataArray: Array<ModuleMetadata>
    /**
    * Indicates whether or not this application may be removable
    *
    * @relation readonly removable: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let removable: Bool
    /**
    * Indicates the access token of the application
    *
    * @relation readonly accessTokenId: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let accessTokenId: UInt32
    /**
    * Indicates the uid of the application
    *
    * @relation readonly uid: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uid: Int32
    /**
    * Indicates icon resource of the application
    *
    * @relation readonly iconResource: Resource
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconResource: AppResource
    /**
    * Indicates label resource of the application
    *
    * @relation readonly labelResource: Resource
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelResource: AppResource
    /**
    * Indicates description resource of the application
    *
    * @relation readonly descriptionResource: Resource
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionResource: AppResource
    /**
    * Indicates the appDistributionType of the application
    *
    * @relation readonly appDistributionType: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appDistributionType: String
    /**
    * Indicates the appProvisionType of the application
    *
    * @relation readonly appProvisionType: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appProvisionType: String
    /**
    * Indicates whether the application is a system application
    *
    * @relation readonly systemApp: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let systemApp: Bool
    /**
    * Indicates the type of application is APP or atomicService.
    *
    * @relation readonly bundleType: bundleManager.BundleType
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleType: BundleType
    /**
    * Indicates whether the application is in debug mode.
    *
    * @relation readonly debug: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let debug: Bool
    /**
    * Indicates whether the application data is unclearable, that is, whether the application data cannot be cleared.
    *
    * @relation readonly dataUnclearable: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let dataUnclearable: Bool
    /**
    * Indicates whether the application enables cloud file sync.
    *
    * @relation readonly cloudFileSyncEnabled: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let cloudFileSyncEnabled: Bool
    /**
    * Indicates native library path.
    *
    * @relation readonly nativeLibraryPath: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let nativeLibraryPath: String
    /**
    * Indicates the MultiAppMode object of the bundle
    *
    * @relation readonly multiAppMode: MultiAppMode
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let multiAppMode: MultiAppMode
    /**
    * Indicates the index of the bundle
    *
    * @relation readonly appIndex: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32
    /**
    * Indicates sources to install the app
    *
    * @relation readonly installSource: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let installSource: String
    /**
    * Indicates the release type of the app
    *
    * @relation readonly releaseType: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let releaseType: String

    protected init(ret: RetApplicationInfoV2) {
        this.name = ret.name.toString()
        this.description = ret.description.toString()
        this.descriptionId = ret.descriptionId
        this.enabled = ret.enabled
        this.label = ret.label.toString()
        this.labelId = ret.labelId
        this.icon = ret.icon.toString()
        this.iconId = ret.iconId
        this.process = ret.process.toString()
        this.permissions = readArrStr(ret.permissions)
        this.codePath = ret.codePath.toString()
        this.metadataArray = readArrModuleMetadata(ret.metadataArray)
        this.removable = ret.removable
        this.accessTokenId = ret.accessTokenId
        this.uid = ret.uid
        this.iconResource = AppResource(ret.iconResource)
        this.labelResource = AppResource(ret.labelResource)
        this.descriptionResource = AppResource(ret.descriptionResource)
        this.appDistributionType = ret.appDistributionType.toString()
        this.appProvisionType = ret.appProvisionType.toString()
        this.systemApp = ret.systemApp
        this.bundleType = BundleType.parse(ret.bundleType)
        this.debug = ret.debug
        this.dataUnclearable = ret.dataUnclearable
        this.cloudFileSyncEnabled = ret.cloudFileSyncEnabled
        this.nativeLibraryPath = ret.nativeLibraryPath.toString()
        this.multiAppMode = MultiAppMode(ret.multiAppMode)
        this.appIndex = ret.appIndex
        this.installSource = ret.installSource.toString()
        this.releaseType = ret.releaseType.toString()
    }
}

/**
* Indicates the ModuleMetadata
*
* @relation export interface ModuleMetadata
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ModuleMetadata {
    /**
     * Indicates the name of this hap module
     *
     * @relation readonly moduleName: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    /**
     * Indicates the metadata of this hap module
     *
     * @relation readonly metadata: Array<Metadata>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>

    init(ret: RetModuleMetadata) {
        this.moduleName = ret.moduleName.toString()
        let ptr = ret.metadata.head
        let size = ret.metadata.size
        if (ptr.isNotNull()) {
            this.metadata = unsafe { Array<Metadata>(size, {i => Metadata(ptr.read(i))}) }
        } else {
            throw IllegalMemoryException("Out of Memory!")
        }
    }
}

/**
* Indicates MultiAppMode
*
* @relation export interface MultiAppMode
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class MultiAppMode {
    /**
     * Indicates the multiAppModeType of the bundle
     *
     * @relation readonly multiAppModeType: bundleManager.MultiAppModeType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let multiAppModeType: MultiAppModeType
    /**
     * Indicates the max count of the bundle
     *
     * @relation readonly maxCount: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxCount: Int32

    init(ret: RetMultiAppMode) {
        this.multiAppModeType = MultiAppModeType.parse(ret.multiAppModeType)
        this.maxCount = ret.count
    }
}