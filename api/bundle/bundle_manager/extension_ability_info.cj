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
import ohos.skill.*
import ohos.metadata.*

/**
* Extension information about a bundle
*
* @relation export interface ExtensionAbilityInfo
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ExtensionAbilityInfo {
    /**
    * Indicates the name of the bundle
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
    * Indicates the name of the module
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
    * Indicates the name of the extension ability info
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
    * Indicates the label id of the extension ability info
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
    * Indicates the description id of the extension ability info
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
    * Indicates the icon id of the extension ability info
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
    * Indicates whether this ability can be called by other abilities
    *
    * @relation readonly exported: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let exported: Bool
    /**
    * Enumerates types of the extension ability info
    *
    * @relation readonly extensionAbilityType: bundleManager.ExtensionAbilityType
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let extensionAbilityType: ExtensionAbilityType
    /**
    * The permissions that others need to use this extension ability info
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
    * Obtains configuration information about an application
    *
    * @relation readonly applicationInfo: ApplicationInfo
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let applicationInfo: ApplicationInfo
    /**
    * Indicates the metadata of bundle
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
    * Indicates the src language to express extension ability info
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
    * Indicates the read permission extension ability info
    *
    * @relation readonly readPermission: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let readPermission: String
    /**
    * Indicates the write permission of extension ability info
    *
    * @relation readonly writePermission: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let writePermission: String
    /**
    * Indicates type name of the extension ability.
    *
    * @relation readonly extensionAbilityTypeName: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let extensionAbilityTypeName: String
    /**
    * Indicates skills of the extension ability
    *
    * @relation readonly skills: Array<Skill>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let skills: Array<Skill>
    /**
    * Indicates the appIndex of extension ability, only work in clone app mode
    *
    * @relation readonly appIndex: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32

    protected init(ret: RetExtensionAbilityInfoV2) {
        this.bundleName = ret.bundleName.toString()
        this.moduleName = ret.moduleName.toString()
        this.name = ret.name.toString()
        this.labelId = ret.labelId
        this.descriptionId = ret.descriptionId
        this.iconId = ret.iconId
        this.exported = ret.exported
        this.extensionAbilityType = try {
            ExtensionAbilityType.parse(ret.extensionAbilityType)
        } catch (_: IllegalArgumentException) {
            Unspecified
        }
        this.permissions = readArrStr(ret.permissions)
        this.applicationInfo = ApplicationInfo(ret.applicationInfo)
        this.metadata = readArrMetadata(ret.metadata)
        this.enabled = ret.enabled
        this.readPermission = ret.readPermission.toString()
        this.writePermission = ret.writePermission.toString()
        this.extensionAbilityTypeName = ret.extensionAbilityTypeName.toString()
        this.skills = readArrSkill(ret.skills)
        this.appIndex = ret.appIndex
    }
}
