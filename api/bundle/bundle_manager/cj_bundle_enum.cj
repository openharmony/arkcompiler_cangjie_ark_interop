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

/**
* Used to query the enumeration value of bundleInfo. Multiple values can be passed in the form.
* Multiple value input, such as GET_BUNDLE_INFO_DEFAULT | GET_BUNDLE_INFO_WITH_APPLICATION.
*
* @relation enum BundleFlag
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum BundleFlag {
    /**
     * Used to obtain the default bundleInfo. The obtained bundleInfo does not contain information of
     * signatureInfo, applicationInfo, hapModuleInfo, ability, extensionAbility and permission.
     *
     * @relation GET_BUNDLE_INFO_DEFAULT = 0x00000000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoDefault
    /**
     * Used to obtain the bundleInfo containing applicationInfo. The obtained bundleInfo does not
     * contain the information of signatureInfo, hapModuleInfo, ability, extensionAbility and permission.
     *
     * @relation GET_BUNDLE_INFO_WITH_APPLICATION = 0x00000001
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithApplication
    /**
     * Used to obtain the bundleInfo containing hapModuleInfo. The obtained bundleInfo does not
     * contain the information of signatureInfo, applicationInfo, ability, extensionAbility and permission.
     *
     * @relation GET_BUNDLE_INFO_WITH_HAP_MODULE = 0x00000002
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithHapModule
    /**
     * Used to obtain the bundleInfo containing ability. The obtained bundleInfo does not
     * contain the information of signatureInfo, applicationInfo, extensionAbility and permission.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE.
     * such as GET_BUNDLE_INFO_WITH_ABILITY | GET_BUNDLE_INFO_WITH_HAP_MODULE.
     *
     * @relation GET_BUNDLE_INFO_WITH_ABILITY = 0x00000004
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithAbility
    /**
     * Used to obtain the bundleInfo containing extensionAbility. The obtained bundleInfo does not
     * contain the information of signatureInfo, applicationInfo, ability and permission.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE,
     * such as GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | GET_BUNDLE_INFO_WITH_HAP_MODULE.
     *
     * @relation GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY = 0x00000008
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithExtensionAbility
    /**
     * Used to obtain the bundleInfo containing permission. The obtained bundleInfo does not
     * contain the information of signatureInfo, applicationInfo, hapModuleInfo, extensionAbility and ability.
     *
     * @relation GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION = 0x00000010
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithRequestedPermission
    /**
     * Used to obtain the metadata contained in applicationInfo, moduleInfo and abilityInfo.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_APPLICATION,
     * GET_BUNDLE_INFO_WITH_HAP_MODULE, GET_BUNDLE_INFO_WITH_ABILITY, GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY,
     * such as GET_BUNDLE_INFO_WITH_APPLICATION | GET_BUNDLE_INFO_WITH_METADATA
     * or GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_ABILITY | GET_BUNDLE_INFO_WITH_METADATA
     * or GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | GET_BUNDLE_INFO_WITH_METADATA.
     *
     * @relation GET_BUNDLE_INFO_WITH_METADATA = 0x00000020
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithMetadata
    /**
     * Used to obtain the default bundleInfo containing disabled application and ability.
     * The obtained bundleInfo does not contain information of signatureInfo, applicationInfo,
     * hapModuleInfo, ability, extensionAbility and permission.
     *
     * @relation GET_BUNDLE_INFO_WITH_DISABLE = 0x00000040
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithDisable
    /**
     * Used to obtain the bundleInfo containing signatureInfo. The obtained bundleInfo does not
     * contain the information of applicationInfo, hapModuleInfo, extensionAbility, ability and permission.
     *
     * @relation GET_BUNDLE_INFO_WITH_SIGNATURE_INFO = 0x00000080
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithSignatureInfo
    /**
     * Used to obtain the bundleInfo containing menu configuration in hapModuleInfo.
     * The obtained bundleInfo does not contain the information of applicationInfo, extensionAbility, ability and permission.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE,
     * such as GET_BUNDLE_INFO_WITH_MENU | GET_BUNDLE_INFO_WITH_HAP_MODULE
     *
     * @relation GET_BUNDLE_INFO_WITH_MENU = 0x00000100
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithMenu
    /**
     * Used to obtain the bundleInfo containing router map configuration in hapModuleInfo.
     * The obtained bundleInfo does not contain the information of applicationInfo, extensionAbility, ability and permission.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE,
     * such as GET_BUNDLE_INFO_WITH_ROUTER_MAP | GET_BUNDLE_INFO_WITH_HAP_MODULE
     *
     * @relation GET_BUNDLE_INFO_WITH_ROUTER_MAP = 0x00000200
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithRouterMap
    /**
     * Used to obtain the skillInfo contained in abilityInfo and extensionInfo.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE,
     * GET_BUNDLE_INFO_WITH_ABILITY, GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY,
     * such as GET_BUNDLE_INFO_WITH_SKILL | GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_ABILITY
     * or GET_BUNDLE_INFO_WITH_SKILL | GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
     *
     * @relation GET_BUNDLE_INFO_WITH_SKILL = 0x00000800
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithSkill
    | ...

    /**
     * get the corresponding mapping value.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case GetBundleInfoDefault => 0x00000000
            case GetBundleInfoWithApplication => 0x00000001
            case GetBundleInfoWithHapModule => 0x00000002
            case GetBundleInfoWithAbility => 0x00000004
            case GetBundleInfoWithExtensionAbility => 0x00000008
            case GetBundleInfoWithRequestedPermission => 0x00000010
            case GetBundleInfoWithMetadata => 0x00000020
            case GetBundleInfoWithDisable => 0x00000040
            case GetBundleInfoWithSignatureInfo => 0x00000080
            case GetBundleInfoWithMenu => 0x00000100
            case GetBundleInfoWithRouterMap => 0x00000200
            case GetBundleInfoWithSkill => 0x00000800
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
* Used to query the enumeration value of abilityInfo. Multiple values can be passed in the form.
*
* @relation enum AbilityFlag
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum AbilityFlag {
    /**
     * Used to obtain the default abilityInfo. The obtained abilityInfo does not contain the information of
     * permission, metadata and disabled abilityInfo.
     *
     * @relation GET_ABILITY_INFO_DEFAULT = 0x00000000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoDefault
    /**
     * Used to obtain the abilityInfo containing permission.
     *
     * @relation GET_ABILITY_INFO_WITH_PERMISSION = 0x00000001
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoWithPermission
    /**
     * Used to obtain the abilityInfo containing applicationInfo.
     *
     * @relation GET_ABILITY_INFO_WITH_APPLICATION = 0x00000002
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoWithApplication
    /**
     * Used to obtain the abilityInfo containing metadata.
     *
     * @relation GET_ABILITY_INFO_WITH_METADATA = 0x00000004
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoWithMetadata
    /**
     * Used to obtain the abilityInfo containing disabled abilityInfo.
     *
     * @relation GET_ABILITY_INFO_WITH_DISABLE = 0x00000008
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoWithDisable
    /**
     * Used to obtain the abilityInfo only for system app.
     *
     * @relation GET_ABILITY_INFO_ONLY_SYSTEM_APP = 0x00000010
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoOnlySystemApp
    | ...
}

/**
* Indicates bundle type
*
* @relation export enum BundleType
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum BundleType {
    /**
     * Indicates app
     *
     * @relation APP = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    App
    /**
     * Indicates atomic service
     *
     * @relation ATOMIC_SERVICE = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AtomicService
    | ...

    protected static func parse(val: Int32): BundleType {
        match (val) {
            case 0 => App
            case 1 => AtomicService
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
* PermissionGrantState
*
* @relation export enum PermissionGrantState
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum PermissionGrantState {
    /**
     * PERMISSION_DENIED
     *
     * @relation PERMISSION_DENIED = -1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PermissionDenied
    /**
     * PERMISSION_GRANTED
     *
     * @relation PERMISSION_GRANTED = 0
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PermissionGranted
    | ...

    static func parse(val: Int32): PermissionGrantState {
        match (val) {
            case -1 => PermissionDenied
            case 0 => PermissionGranted
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
* Display orientation
*
* @relation export enum DisplayOrientation
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum DisplayOrientation {
    /**
     * Indicates that the system automatically determines the display orientation
     *
     * @relation UNSPECIFIED = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    /**
     * Indicates the landscape orientation
     *
     * @relation LANDSCAPE = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Landscape
    /**
     * Indicates the portrait orientation
     *
     * @relation PORTRAIT = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Portrait
    /**
     * Indicates the page ability orientation is the same as that of the nearest ability in the stack
     *
     * @relation FOLLOW_RECENT = 3
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FollowRecent
    /**
     * Indicates the inverted landscape orientation
     *
     * @relation LANDSCAPE_INVERTED = 4
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    LandscapeInverted
    /**
     * Indicates the inverted portrait orientation
     *
     * @relation PORTRAIT_INVERTED = 5
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PortraitInverted
    /**
     * Indicates the orientation can be auto-rotated
     *
     * @relation AUTO_ROTATION = 6
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotation
    /**
     * Indicates the landscape orientation rotated with sensor
     *
     * @relation  = 7
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationLandscape
    /**
     * Indicates the portrait orientation rotated with sensor
     *
     * @relation AUTO_ROTATION_PORTRAIT = 8
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationPortrait
    /**
     * Indicates the sensor restricted mode
     *
     * @relation AUTO_ROTATION_RESTRICTED = 9
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationRestricted
    /**
     * Indicates the sensor landscape restricted mode
     *
     * @relation AUTO_ROTATION_LANDSCAPE_RESTRICTED = 10
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationLandscapeRestricted
    /**
     * Indicates the sensor portrait restricted mode
     *
     * @relation AUTO_ROTATION_PORTRAIT_RESTRICTED = 11
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationPortraitRestricted
    /**
     * Indicates the locked orientation mode
     *
     * @relation LOCKED = 12
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Locked
    /**
     * Indicates the system automatically determines the sensor restricted mode
     *
     * @relation AUTO_ROTATION_UNSPECIFIED = 13
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationUnspecified
    /**
     * Indicates the orientation follow the desktop rotate mode
     *
     * @relation FOLLOW_DESKTOP = 14
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FollowDesktop
    | ...

    static func parse(val: Int32): DisplayOrientation {
        match (val) {
            case 0 => Unspecified
            case 1 => Landscape
            case 2 => Portrait
            case 3 => FollowRecent
            case 4 => LandscapeInverted
            case 5 => PortraitInverted
            case 6 => AutoRotation
            case 7 => AutoRotationLandscape
            case 8 => AutoRotationPortrait
            case 9 => AutoRotationRestricted
            case 10 => AutoRotationLandscapeRestricted
            case 11 => AutoRotationPortraitRestricted
            case 12 => Locked
            case 13 => AutoRotationUnspecified
            case 14 => FollowDesktop
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
* Support window mode
*
* @relation export enum SupportWindowMode
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum SupportWindowMode {
    /**
     * Indicates supported window mode of full screen mode
     *
     * @relation FULL_SCREEN = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FullScreen
    /**
     * Indicates supported window mode of split mode
     *
     * @relation SPLIT = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Split
    /**
     * Indicates supported window mode of floating mode
     *
     * @relation FLOATING = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Floating
    | ...

    static func parse(val: Int32): SupportWindowMode {
        match (val) {
            case 0 => FullScreen
            case 1 => Split
            case 2 => Floating
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
* Launch type
*
* @relation export enum LaunchType
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum LaunchType {
    /**
     * Indicates that the ability has only one instance
     *
     * @relation SINGLETON = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Singleton
    /**
     * Indicates that the ability can have multiple instances
     *
     * @relation MULTITON = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Multiton
    /**
     * Indicates that the ability can have specified instances
     *
     * @relation SPECIFIED = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Specified
    | ...

    static func parse(val: Int32): LaunchType {
        match (val) {
            case 0 => Singleton
            case 1 => Multiton
            case 2 => Specified
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
* This enumeration value is used to identify various types of extension ability
*
* @relation export enum ExtensionAbilityType
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ExtensionAbilityType {
    /**
     * Indicates extension info with type of form
     *
     * @relation FORM = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Form
    /**
     * Indicates extension info with type of work schedule
     *
     * @relation WORK_SCHEDULER = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    WorkScheduler
    /**
     * Indicates extension info with type of input method
     *
     * @relation INPUT_METHOD = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    InputMethod
    /**
     * Indicates extension info with type of service
     *
     * @relation SERVICE = 3
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Service
    /**
     * Indicates extension info with type of accessibility
     *
     * @relation ACCESSIBILITY = 4
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Accessibility
    /**
     * Indicates extension info with type of dataShare
     *
     * @relation DATA_SHARE = 5
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    DataShare
    /**
     * Indicates extension info with type of filesShare
     *
     * @relation FILE_SHARE = 6
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FileShare
    /**
     * Indicates extension info with type of staticSubscriber
     *
     * @relation STATIC_SUBSCRIBER = 7
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    StaticSubscriber
    /**
     * Indicates extension info with type of wallpaper
     *
     * @relation WALLPAPER = 8
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Wallpaper
    /**
     * Indicates extension info with type of backup
     *
     * @relation BACKUP = 9
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Backup
    /**
     * Indicates extension info with type of window
     *
     * @relation WINDOW = 10
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Window
    /**
     * Indicates extension info with type of enterprise admin
     *
     * @relation ENTERPRISE_ADMIN = 11
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    EnterpriseAdmin
    /**
     * Indicates extension info with type of thumbnail
     *
     * @relation THUMBNAIL = 13
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Thumbnail
    /**
     * Indicates extension info with type of preview
     *
     * @relation PREVIEW = 14
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Preview
    /**
     * Indicates extension info with type of print
     *
     * @relation PRINT = 15
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Print
    /**
     * Indicates extension info with type of share
     *
     * @relation SHARE = 16
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Share
    /**
     * Indicates extension info with type of push
     *
     * @relation PUSH = 17
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Push
    /**
     * Indicates extension info with type of driver
     *
     * @relation DRIVER = 18
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Driver
    /**
     * Indicates extension info with type of action
     *
     * @relation ACTION = 19
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Action
    /**
     * Indicates extension info with type of ads service
     *
     * @relation ADS_SERVICE = 20
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AdsService
    /**
     * Indicates extension info with type of embedded UI
     *
     * @relation EMBEDDED_UI = 21
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    EmbeddedUI
    /**
     * Indicates extension info with type of insight intent UI
     *
     * @relation INSIGHT_INTENT_UI = 22
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    InsightIntentUI
    /**
     * Indicates extension info with type of unspecified
     *
     * @relation UNSPECIFIED = 255
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    | ...

    static func parse(val: Int32): ExtensionAbilityType {
        match (val) {
            case 0 => Form
            case 1 => WorkScheduler
            case 2 => InputMethod
            case 3 => Service
            case 4 => Accessibility
            case 5 => DataShare
            case 6 => FileShare
            case 7 => StaticSubscriber
            case 8 => Wallpaper
            case 9 => Backup
            case 10 => Window
            case 11 => EnterpriseAdmin
            case 13 => Thumbnail
            case 14 => Preview
            case 15 => Print
            case 16 => Share
            case 17 => Push
            case 18 => Driver
            case 19 => Action
            case 20 => AdsService
            case 21 => EmbeddedUI
            case 22 => InsightIntentUI
            case 255 => Unspecified
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
* Indicates module type
*
* @relation export enum ModuleType
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ModuleType {
    /**
     * Indicates entry type
     *
     * @relation ENTRY = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Entry
    /**
     * Indicates feature type
     *
     * @relation FEATURE = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Feature
    /**
     * Indicates shared type
     *
     * @relation SHARED = 3
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Shared
    | ...

    static func parse(val: Int32): ModuleType {
        match (val) {
            case 1 => Entry
            case 2 => Feature
            case 3 => Shared
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
* This enumeration value is used to identify various types of extension ability
*
* @relation export enum MultiAppModeType
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum MultiAppModeType {
    /**
     * Indicates multi app mode with type of unspecified
     *
     * @relation UNSPECIFIED = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    /**
     * Indicates multi app mode with type of multiInstance
     *
     * @relation MULTI_INSTANCE = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    MultiInstance
    /**
     * Indicates multi app mode with type of appClone
     *
     * @relation APP_CLONE = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AppClone
    | ...

    static func parse(val: UInt8): MultiAppModeType {
        match (val) {
            case 0 => Unspecified
            case 1 => MultiInstance
            case 2 => AppClone
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}
