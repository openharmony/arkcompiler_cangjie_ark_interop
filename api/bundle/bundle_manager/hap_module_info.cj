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
import ohos.metadata.*

/**
* Obtains configuration information about a hap module.
*
* @relation export interface HapModuleInfo
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class HapModuleInfo {
    /**
    * Indicates the name of this hap module
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
    * Indicates the icon of this hap module
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
    * Indicates the icon id of this hap module
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
    * Indicates the label of this hap module
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
    * Indicates the label id of this hap module
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
    * Describes the hap module
    *
    * @relation readonly description: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let description: String
    /**
    * Indicates the description of this hap module
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
    * Indicates main elementName of the hap module
    *
    * @relation readonly mainElementName: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let mainElementName: String
    /**
    * Obtains configuration information about abilities
    *
    * @relation readonly abilitiesInfo: Array<AbilityInfo>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let abilitiesInfo: Array<AbilityInfo>
    /**
    * Obtains configuration information about extension abilities
    *
    * @relation readonly extensionAbilitiesInfo: Array<ExtensionAbilityInfo>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let extensionAbilitiesInfo: Array<ExtensionAbilityInfo>
    /**
    * Indicates the metadata of ability
    *
    * @relation readonly metadata: Array<Metadata>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>
    /**
    * The device types that this hap module can run on
    *
    * @relation readonly deviceTypes: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let deviceTypes: Array<String>
    /**
    * Indicates whether free installation of the hap module is supported
    *
    * @relation readonly installationFree: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let installationFree: Bool
    /**
    * Indicates the hash value of the hap module
    *
    * @relation readonly hashValue: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let hashValue: String
    /**
    * Indicates the type of the module
    *
    * @relation readonly type: bundleManager.ModuleType
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleType: ModuleType
    /**
    * Indicates the preload module
    *
    * @relation readonly preloads: Array<PreloadItem>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let preloads: Array<PreloadItem>
    /**
    * Indicates the dependency module that this module depends on
    *
    * @relation readonly dependencies: Array<Dependency>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let dependencies: Array<Dependency>
    /**
    * Indicates the menu configuration
    *
    * @relation readonly fileContextMenuConfig: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let fileContextMenuConfig: String
    /**
    * Indicates the router information of the module
    *
    * @relation readonly routerMap: Array<RouterItem>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let routerMap: Array<RouterItem>
    /**
    * Indicates the code path
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

    protected init(ret: RetHapModuleInfoV2) {
        this.name = ret.name.toString()
        this.icon = ret.icon.toString()
        this.iconId = ret.iconId
        this.label = ret.label.toString()
        this.labelId = ret.labelId
        this.description = ret.description.toString()
        this.descriptionId = ret.descriptionId
        this.mainElementName = ret.mainElementName.toString()
        this.abilitiesInfo = readArrAbilityInfo(ret.abilitiesInfo)
        this.extensionAbilitiesInfo = readArrExtensionAbilityInfo(ret.extensionAbilitiesInfo)
        this.metadata = readArrMetadata(ret.metadata)
        this.deviceTypes = readArrStr(ret.deviceTypes)
        this.installationFree = ret.installationFree
        this.hashValue = ret.hashValue.toString()
        this.moduleType = ModuleType.parse(ret.moduleType)
        this.preloads = readArrPreloadItem(ret.preloads)
        this.dependencies = readArrDependency(ret.dependencies)
        this.fileContextMenuConfig = ret.fileContextMenuConfig.toString()
        this.routerMap = readArrRouterItem(ret.routerMap)
        this.codePath = ret.codePath.toString()
        this.nativeLibraryPath = ret.nativeLibraryPath.toString()
    }
}

/**
* Indicates the data item defined in router item
*
* @relation export interface DataItem
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class DataItem {
    /**
    * Indicates the key of the custom data item
    *
    * @relation readonly key: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let key: String
    /**
    * Indicates the value of the custom data item
    *
    * @relation readonly value: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let value: String

    init(ret: RetDataItem) {
        this.key = ret.key.toString()
        this.value = ret.value.toString()
    }
}

/**
* Indicates the dependency
*
* @relation export interface Dependency
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class Dependency {
    /**
    * Indicates the bundle name of the dependency
    *
    * @relation readonly bundleName: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleName: String
    /**
    * Indicates the module name
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
    * Indicates the version code of the dependency
    *
    * @relation readonly versionCode: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let versionCode: UInt32

    init(ret: RetDependency) {
        this.bundleName = ret.bundleName.toString()
        this.moduleName = ret.moduleName.toString()
        this.versionCode = ret.versionCode
    }
}

/**
* Indicates the preloadItem
*
* @relation export interface PreloadItem
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class PreloadItem {
    /**
    * Indicates the module name need preload
    *
    * @relation readonly moduleName: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String

    init(ret: RetPreloadItem) {
        this.moduleName = ret.moduleName.toString()
    }
}

/**
* Indicates the router item
*
* @relation export interface RouterItem
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class RouterItem {
    /**
    * Indicates the name of the module to which the current page belongs
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
    * Indicates the file path of the current page within the module
    *
    * @relation readonly pageSourceFile: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pageSourceFile: String
    /**
    * Indicates the name of the function @Builder decorated
    *
    * @relation readonly buildFunction: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let buildFunction: String
    /**
    * Indicates the data
    *
    * @relation readonly data: Array<DataItem>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let data: Array<DataItem>
    /**
    * Indicates the json string of custom data
    *
    * @relation readonly customData: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let customData: String

    init(ret: RetRouterItem) {
        this.name = ret.name.toString()
        this.pageSourceFile = ret.pageSourceFile.toString()
        this.buildFunction = ret.buildFunction.toString()
        this.data = readArrDataItem(ret.data)
        this.customData = ret.customData.toString()
    }
}
