# ohos.bundle_manager (BundleManager Management)

This package provides capabilities for querying and updating application bundle information. Bundle information includes application details, capability information, extended capabilities, permissions, etc.

## Import Module

```cangjie
import kit.AbilityKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](cj-apis-ability.md#class-context) application context, configuration needs to be done in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template, refer to [Cangjie Example Code Description](../../cj-development-intro.md#cangjie-example-code-description).

## class AbilityInfo

```cangjie
public class AbilityInfo {
    public let bundleName: String
    public let moduleName: String
    public let name: String
    public let label: String
    public let labelId: Int32
    public let description: String
    public let descriptionId: Int32
    public let icon: String
    public let iconId: Int32
    public let process: String
    public let exported: Bool
    public let orientation: DisplayOrientation
    public let launchType: LaunchType
    public let permissions: Array<String>
    public let deviceTypes: Array<String>
    public let applicationInfo: ApplicationInfo
    public let metadata: Array<Metadata>
    public let enabled: Bool
    public let supportWindowModes: Array<SupportWindowMode>
    public let windowSize: WindowSize
    public let excludeFromDock: Bool
    public let skills: Array<Skill>
    public let appIndex: Int32
}
```

**Function:** Ability information. Third-party applications can obtain Ability information through [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32), where the input parameter [bundleFlags](#enum-bundleflag) must include at least GET_BUNDLE_INFO_WITH_HAP_MODULE and GET_BUNDLE_INFO_WITH_ABILITY.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let appIndex

```cangjie
public let appIndex: Int32
```

**Function:** The clone index identifier of the application bundle, effective only in clone applications.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let applicationInfo

```cangjie
public let applicationInfo: ApplicationInfo
```

**Function:** Configuration information of the application. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the [bundleFlags](#enum-bundleflag) parameter set to GET_BUNDLE_INFO_WITH_HAP_MODULE, GET_BUNDLE_INFO_WITH_ABILITY, and GET_BUNDLE_INFO_WITH_APPLICATION.

**Type:** [ApplicationInfo](#struct-applicationinfo)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let bundleName

```cangjie
public let bundleName: String
```

**Function:** The bundle name of the application.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let description

```cangjie
public let description: String
```

**Function:** Description of the Ability.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let descriptionId

```cangjie
public let descriptionId: Int32
```

**Function:** Resource ID of the Ability's description.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let deviceTypes

```cangjie
public let deviceTypes: Array<String>
```

**Function:** Device types supported by the Ability.

**Type:** Array\<String>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let enabled

```cangjie
public let enabled: Bool
```

**Function:** Whether the Ability is enabled.

**Type:** Bool

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let excludeFromDock

```cangjie
public let excludeFromDock: Bool
```

**Function:** Determines whether the Ability can hide its icon in the dock area.

**Type:** Bool

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let exported

```cangjie
public let exported: Bool
```

**Function:** Determines whether the Ability can be called by other applications.

**Type:** Bool

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let icon

```cangjie
public let icon: String
```

**Function:** Icon resource descriptor of the Ability, e.g., "icon": "$media: icon".

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let iconId

```cangjie
public let iconId: Int32
```

**Function:** Resource ID of the Ability's icon.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let label

```cangjie
public let label: String
```

**Function:** Resource descriptor of the name displayed to users for the Ability, e.g., "label": "$string: mainability_description".

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let labelId

```cangjie
public let labelId: Int32
```

**Function:** Resource ID of the Ability's label.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let launchType

```cangjie
public let launchType: LaunchType
```

**Function:** Launch mode of the Ability.

**Type:** [LaunchType](#enum-launchtype)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let metadata

```cangjie
public let metadata: Array<Metadata>
```

**Function:** Metadata of the Ability. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the [bundleFlags](#enum-bundleflag) parameter set to GET_BUNDLE_INFO_WITH_HAP_MODULE, GET_BUNDLE_INFO_WITH_ABILITY, and GET_BUNDLE_INFO_WITH_METADATA.

**Type:** Array\<[Metadata](#class-metadata)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let moduleName

```cangjie
public let moduleName: String
```
**Function:** The name of the HAP to which the Ability belongs.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let name

```cangjie
public let name: String
```

**Function:** The name of the Ability.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let orientation

```cangjie
public let orientation: DisplayOrientation
```

**Function:** The display mode of the Ability.

**Type:** [DisplayOrientation](#enum-displayorientation)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let permissions

```cangjie
public let permissions: Array<String>
```

**Function:** The set of permissions required when the Ability is called by other applications. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the [bundleFlags](#enum-bundleflag) parameter passed as the combination of GET_BUNDLE_INFO_WITH_HAP_MODULE, GET_BUNDLE_INFO_WITH_ABILITY, and GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION.

**Type:** Array\<String>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let process

```cangjie
public let process: String
```

**Function:** The process of the Ability. If not set, it defaults to the package name.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let skills

```cangjie
public let skills: Array<Skill>
```

**Function:** The Skills information of the Ability.

**Type:** Array\<[Skill](#struct-skill)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let supportWindowModes

```cangjie
public let supportWindowModes: Array<SupportWindowMode>
```

**Function:** The supported window modes of the Ability.

**Type:** Array\<[SupportWindowMode](#enum-supportwindowmode)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let windowSize

```cangjie
public let windowSize: WindowSize
```

**Function:** The window size of the Ability.

**Type:** [WindowSize](#struct-windowsize)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## class BundleInfo

```cangjie
public class BundleInfo {
    public let name: String
    public let vendor: String
    public let versionCode: UInt32
    public let versionName: String
    public let minCompatibleVersionCode: UInt32
    public let targetVersion: UInt32
    public let appInfo: ApplicationInfo
    public let hapModulesInfo: Array<HapModuleInfo>
    public let reqPermissionDetails: Array<ReqPermissionDetail>
    public let permissionGrantStates: Array<PermissionGrantState>
    public let signatureInfo: SignatureInfo
    public let installTime: Int64
    public let updateTime: Int64
    public let uid: Int32
    public let routerMap: Array<RouterItem>
    public let appIndex: Int32
}
```

**Function:** Package information. Third-party applications can obtain their own package information via [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32), where the bundleFlags parameter specifies the information to be included in the returned BundleInfo.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let appIndex

```cangjie
public let appIndex: Int32
```

**Function:** The clone index identifier of the application package, effective only in clone applications.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let appInfo

```cangjie
public let appInfo: ApplicationInfo
```

**Function:** The configuration information of the application. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the [bundleFlags](#enum-bundleflag) parameter passed as GET_BUNDLE_INFO_WITH_APPLICATION.

**Type:** [ApplicationInfo](#struct-applicationinfo)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let hapModulesInfo

```cangjie
public let hapModulesInfo: Array<HapModuleInfo>
```

**Function:** The configuration information of the module. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the [bundleFlags](#enum-bundleflag) parameter passed as GET_BUNDLE_INFO_WITH_HAP_MODULE.

**Type:** Array\<[HapModuleInfo](#struct-hapmoduleinfo)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let installTime

```cangjie
public let installTime: Int64
```

**Function:** The installation time of the application package.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let minCompatibleVersionCode

```cangjie
public let minCompatibleVersionCode: UInt32
```

**Function:** The minimum compatible version of the application package in distributed scenarios.

**Type:** UInt32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let name

```cangjie
public let name: String
```

**Function:** The name of the application package.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let permissionGrantStates

```cangjie
public let permissionGrantStates: Array<PermissionGrantState>
```

**Function:** The grant states of requested permissions. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the [bundleFlags](#enum-bundleflag) parameter passed as GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION.

**Type:** Array\<[PermissionGrantState](#enum-permissiongrantstate)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let reqPermissionDetails

```cangjie
public let reqPermissionDetails: Array<ReqPermissionDetail>
```

**Function:** Detailed information about the set of permissions required by the application at runtime. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the [bundleFlags](#enum-bundleflag) parameter passed as GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION.

**Type:** Array\<[ReqPermissionDetail](#struct-reqpermissiondetail)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let routerMap

```cangjie
public let routerMap: Array<RouterItem>
```

**Function:** The routing table configuration of the application, obtained by merging the routerMap information from hapModulesInfo after deduplication based on the name field in RouterItem. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the [bundleFlags](#enum-bundleflag) parameter passed as the combination of GET_BUNDLE_INFO_WITH_HAP_MODULE and GET_BUNDLE_INFO_WITH_ROUTER_MAP.

**Type:** Array\<[RouterItem](#struct-routeritem)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let signatureInfo

```cangjie
public let signatureInfo: SignatureInfo
```

**Function:** Signature information of the application package. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface with the [bundleFlags](#enum-bundleflag) parameter set to GET_BUNDLE_INFO_WITH_SIGNATURE_INFO.

**Type:** [SignatureInfo](#class-signatureinfo)

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

### let targetVersion

```cangjie
public let targetVersion: UInt32
```

**Function:** This label identifies the target version for the application to run.

**Type:** UInt32

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

### let uid

```cangjie
public let uid: Int32
```

**Function:** The UID of the application.

**Type:** Int32

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

### let updateTime

```cangjie
public let updateTime: Int64
```

**Function:** The update time of the application package.

**Type:** Int64

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

### let vendor

```cangjie
public let vendor: String
```

**Function:** The vendor of the application package.

**Type:** String

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

### let versionCode

```cangjie
public let versionCode: UInt32
```

**Function:** The version code of the application package.

**Type:** UInt32

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

### let versionName

```cangjie
public let versionName: String
```

**Function:** The version description text of the application package.

**Type:** String

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

## class BundleManager

```cangjie
public class BundleManager {}
```

**Function:** A class that provides methods for querying Bundle information.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

### static func canOpenLink(String)

```cangjie
public static func canOpenLink(link: String): Bool
```

**Function:** Queries whether a given link can be opened. The scheme of the specified link must be configured in the querySchemes field of the module.json file.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| link | String | Yes | - | The link to be queried. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Returns true if the given link can be opened; returns false otherwise. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bundle Management Subsystem Universal Error Codes](../../errorcodes/cj-errorcode-bundle.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
| 17700055 | The specified link is invalid. |
| 17700056 | The scheme of the specified link is not in the querySchemes. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*
import ohos.hilog.Hilog

let link = "app1Scheme://test.example.com/home"
let canOpen = BundleManager.canOpenLink(link)
```

### static func getBundleInfo(String, Int32, ?Int32)

```cangjie
public static func getBundleInfo(bundleName: String, bundleFlags: Int32, userId!: ?Int32 = None): BundleInfo
```

**Function:** Retrieves BundleInfo based on the given bundleName, bundleFlags, and userId.

**Required Permission:** ohos.permission.GET_BUNDLE_INFO_PRIVILEGED or ohos.permission.GET_BUNDLE_INFO

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| bundleName | String | Yes | - | The name of the application Bundle to be queried. |
| bundleFlags | Int32 | Yes | - | Specifies the information to be included in the returned BundleInfo. For details, refer to [BundleFlag](#enum-bundleflag). |
| userId | ?Int32 | No | None | The user ID. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [BundleInfo](#class-bundleinfo) | The BundleInfo object, returning the BundleInfo of the current application. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bundle Management Subsystem Universal Error Codes](../../errorcodes/cj-errorcode-bundle.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 17700001 | The specified bundleName is not found. |
| 17700004 | The specified user ID is not found. |
| 17700026 | The specified bundle is disabled. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*

let bundleFlags = GET_BUNDLE_INFO_DEFAULT.getValue()
try {
    let res = BundleManager.getBundleInfo("com.example.myapplication", bundleFlags)
} catch (e: BusinessException) {
    AppLog.error("getBundleInfo failed, errcode is ${e.code}")
}
```

### static func getBundleInfoForSelf(Int32)

```cangjie
public static func getBundleInfoForSelf(bundleFlags: Int32): BundleInfo
```

**Function:** Retrieves the BundleInfo of the current application based on the given bundleFlags.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| bundleFlags | Int32 | Yes | - | Specifies the information to be included in the returned BundleInfo. For details, refer to [BundleFlag](#enum-bundleflag). |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [BundleInfo](#class-bundleinfo) | The BundleInfo object, returning the BundleInfo of the current application. |

**Example 1:**

```cangjie
// index.cj

import kit.AbilityKit.*

let bundleFlags = GET_BUNDLE_INFO_DEFAULT.getValue()
let res = BundleManager.getBundleInfoForSelf(bundleFlags)
```

**Example 2:**

```cangjie
// index.cj

import kit.AbilityKit.*

let bundleFlags = GET_BUNDLE_INFO_DEFAULT.getValue() | GET_BUNDLE_INFO_WITH_APPLICATION.getValue() | GET_BUNDLE_INFO_WITH_HAP_MODULE.getValue() | GET_BUNDLE_INFO_WITH_ABILITY.getValue()
let res = BundleManager.getBundleInfoForSelf(bundleFlags)
```

### static func getBundleNameByUid(Int32)

```cangjie
public static func getBundleNameByUid(uid: Int32): String
```

**Function:** Retrieves the bundleName of the corresponding application based on the given UID.

**Required Permission:** ohos.permission.GET_BUNDLE_INFO_PRIVILEGED or ohos.permission.GET_BUNDLE_INFO

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| uid | Int32 | Yes | - | The UID of the application. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| String | The retrieved bundleName. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bundle Management Subsystem Universal Error Codes](../../errorcodes/cj-errorcode-bundle.md).| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 17700021 | The uid is not found. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*

let bundleFlags = GET_BUNDLE_INFO_DEFAULT.getValue()
try {
    let bundleinfo = BundleManager.getBundleInfo("com.example.myapplication",
            (GET_BUNDLE_INFO_DEFAULT.getValue() | GET_BUNDLE_INFO_WITH_APPLICATION.getValue()))
    let name = BundleManager.getBundleNameByUid(bundleinfo
            .appInfo
            .uid)
} catch (e: BusinessException) {
    AppLog.error("getBundleNameByUid failed, errcode is ${e.code}")
}
```

### static func getProfileByAbility(String, String, String)

```cangjie
public static func getProfileByAbility(moduleName: String, abilityName: String, metadataName!: String = ""): Array<String>
```

**Function:** Obtains the JSON-formatted string of the corresponding configuration file based on the given moduleName, abilityName, and metadataName (name under the metadata tag in module.json), and returns a String array.

For resource files of configuration information resources that use reference-defined resources, the returned JSON string will maintain the resource reference string format, such as `$string: myResourceID`, where `myResourceID` is the resource ID automatically assigned to the resource during the project build process. Developers can use the relevant interfaces in the `ohos/resource_manager` package to obtain such referenced resources.

If the configuration file information adopts the resource reference format, the return value will maintain the resource reference format (e.g., $string: res_id). Developers can use the relevant interfaces of the resource management module to obtain the referenced resources.

> **Note:**
>
> - The configuration information resources of the ability are defined under the `module.abilities[].metadata` tag in the corresponding module.json5 file.
> - The data content of the configuration information resources is returned in a compact JSON string format.
> - An ability can have zero to several configuration information resources.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| moduleName | String | Yes | - | Name of the target module. |
| abilityName | String | Yes | - | Name of the target ability. |
| metadataName | String | No | "" | **Named parameter.** Name of the target configuration information resource. The metadata name of the component, i.e., the name under the metadata tag in the abilities section of the module.json5 configuration file.<br>- When `metadataName` is the name of a configuration information resource of the target ability, only the data content of that configuration information will be returned, and the returned array will contain only one element.<br>- When `metadataName` is omitted or is an empty string, the data content of all configuration information of the ability determined by the module name and ability name will be returned, and the returned array will contain zero to several elements. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| Array\<String> | JSON-formatted string of the configuration file. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bundle Management Subsystem Universal Error Codes](../../errorcodes/cj-errorcode-bundle.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Input parameters check failed. |
| 17700002 | The specified moduleName does not exist. |
| 17700003 | The specified abilityName does not exist. |
| 17700024 | Failed to get the profile because there is no profile in the HAP. |
| 17700026 | The specified bundle is disabled. |
| 17700029 | The specified ability is disabled. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

let moduleName = "entry"
let abilityName = "EntryAbility"
let metadataName = "ohos.extension.form"
let info = BundleManager.getProfileByAbility(moduleName, abilityName, metadataName: metadataName)
```

### static func getProfileByExtensionAbility(String, String, String)

```cangjie
public static func getProfileByExtensionAbility(moduleName: String, extensionAbilityName: String,
    metadataName!: String = ""): Array<String>
```

**Function:** Obtains the JSON-formatted string of the corresponding configuration file based on the given moduleName, extensionAbilityName, and metadataName (name under the metadata tag in module.json), and returns a String array.

For resource files of configuration information resources that use reference-defined resources, the returned JSON string will maintain the resource reference string format, such as `$string: myResourceID`, where `myResourceID` is the resource ID automatically assigned to the resource during the project build process. Developers can use the relevant interfaces in the `ohos/resource_manager` package to obtain such referenced resources.

If the configuration file information adopts the resource reference format, the return value will maintain the resource reference format (e.g., $string: res_id). Developers can use the relevant interfaces of the resource management module to obtain the referenced resources.

> **Note:**
>
> - The configuration information resources of the extension ability are defined under the `module.extensionAbilities[].metadata` tag in the corresponding module.json5 file.
> - The data content of the configuration information resources is returned in a compact JSON string format.
> - An extension ability can have zero to several configuration information resources.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| moduleName | String | Yes | - | Name of the target module. |
| extensionAbilityName | String | Yes | - | Name of the target extension ability. |
| metadataName | String | No | "" | **Named parameter.** Name of the target configuration information resource. The metadata name of the component, i.e., the name under the metadata tag in the extensionAbilities section of the module.json5 configuration file. The default value is an empty string.<br>- When `metadataName` is the name of a configuration information resource of the target extension ability, only the data content of that configuration information will be returned, and the returned array will contain only one element.<br>- When `metadataName` is omitted or is an empty string, the data content of all configuration information of the extension ability determined by the module name and extension ability name will be returned, and the returned array will contain zero to several elements. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| Array\<String> | Data content of the configuration information resources of the target extension ability. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bundle Management Subsystem Universal Error Codes](../../errorcodes/cj-errorcode-bundle.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Input parameters check failed. |
| 17700002 | The specified moduleName does not exist. |
| 17700003 | The specified extensionAbilityName does not exist. |
| 17700024 | Failed to get the profile because there is no profile in the HAP. |
| 17700026 | The specified bundle is disabled. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

let moduleName = "entry"
let extensionAbilityName = "EntryFormAbility"
let metadataName = "ohos.extension.form"
let info = BundleManager.getProfileByExtensionAbility(moduleName, extensionAbilityName, metadataName: metadataName)
```

## class DefaultAppManager

```cangjie
public class DefaultAppManager {}
```

**Function:** This class provides the capability to query default applications, supporting queries to determine whether the current application is the default application.

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp

**Initial Version:** 21

### static func isDefaultApplication(String)

```cangjie
public static func isDefaultApplication(appType: String): Bool
```

**Function:** Determines whether the current application is the default application of the specified type based on the system-defined application types.

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| appType | String | Yes | - | Application type to query, taken from the values in [ApplicationType](#enum-applicationtype). |

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Returns whether the current application is the default application. true indicates it is the default application, and false indicates it is not. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801 | Capability not supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

let tag = DefaultAppManager.isDefaultApplication(ApplicationType.IMAGE.getValue())
```

## class ExtensionAbilityInfo

```cangjie
public class ExtensionAbilityInfo {
    public let bundleName: String
    public let moduleName: String
    public let name: String
    public let labelId: Int32
    public let descriptionId: Int32
    public let iconId: Int32
    public let exported: Bool
    public let extensionAbilityType: ExtensionAbilityType
    public let permissions: Array<String>
    public let applicationInfo: ApplicationInfo
    public let metadata: Array<Metadata>
    public let enabled: Bool
    public let readPermission: String
    public let writePermission: String
    public let extensionAbilityTypeName: String
    public let skills: Array<Skill>
    public let appIndex: Int32
}
```

**Function:** ExtensionAbilityInfo information. Third-party applications can obtain their own ExtensionAbility information via [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32), where the input parameter [bundleFlags](#enum-bundleflag) must at least include GET_BUNDLE_INFO_WITH_HAP_MODULE and GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let appIndex

```cangjie
public let appIndex: Int32
```

**Function:** The clone index identifier of the application package, effective only in clone applications.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let applicationInfo

```cangjie
public let applicationInfo: ApplicationInfo
```

**Function:** Configuration information of the application.

**Type:** [ApplicationInfo](#struct-applicationinfo)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let bundleName

```cangjie
public let bundleName: String
```

**Function:** Name of the application bundle.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let descriptionId

```cangjie
public let descriptionId: Int32
```

**Function:** Resource ID of the description of the ExtensionAbility.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let enabled

```cangjie
public let enabled: Bool
```

**Description:** Whether the ExtensionAbility is enabled.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let exported

```cangjie
public let exported: Bool
```

**Description:** Determines whether the ExtensionAbility can be invoked by other applications.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let extensionAbilityType

```cangjie
public let extensionAbilityType: ExtensionAbilityType
```

**Description:** The type of the ExtensionAbility.

**Type:** [ExtensionAbilityType](#enum-extensionabilitytype)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let extensionAbilityTypeName

```cangjie
public let extensionAbilityTypeName: String
```

**Description:** The type name of the ExtensionAbility.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let iconId

```cangjie
public let iconId: Int32
```

**Description:** The resource ID of the ExtensionAbility's icon.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let labelId

```cangjie
public let labelId: Int32
```

**Description:** The resource ID of the ExtensionAbility's label.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let metadata

```cangjie
public let metadata: Array<Metadata>
```

**Description:** The metadata of the ExtensionAbility.

**Type:** Array\<[Metadata](#class-metadata)>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let moduleName

```cangjie
public let moduleName: String
```

**Description:** The name of the HAP to which the ExtensionAbility belongs.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let name

```cangjie
public let name: String
```

**Description:** The name of the ExtensionAbility.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let permissions

```cangjie
public let permissions: Array<String>
```

**Description:** The set of permissions required to be requested when invoking the ExtensionAbility by other applications.

**Type:** Array\<String>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let readPermission

```cangjie
public let readPermission: String
```

**Description:** The permission required to read data from the ExtensionAbility.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let skills

```cangjie
public let skills: Array<Skill>
```

**Description:** The Skills information of the ExtensionAbility.

**Type:** Array\<[Skill](#struct-skill)>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let writePermission

```cangjie
public let writePermission: String
```

**Description:** The permission required to write data to the ExtensionAbility.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## class Metadata

```cangjie
public class Metadata {
    public var name: String
    public var value: String
    public var resource: String
    public init(name: String, value: String, resource: String)
}
```

**Description:** Metadata information. Third-party applications can obtain this via [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32), where the input parameter bundleFlags must include GET_BUNDLE_INFO_WITH_METADATA. This object is included in [AbilityInfo](#class-abilityinfo), [ApplicationInfo](#struct-applicationinfo), [ExtensionAbilityInfo](#class-extensionabilityinfo), [HapModuleInfo](#struct-hapmoduleinfo), and [ModuleMetadata](#struct-modulemetadata).

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### var name

```cangjie
public var name: String
```

**Description:** The name of the metadata.

**Type:** String

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### var resource

```cangjie
public var resource: String
```

**Description:** The resource of the metadata.

**Type:** String

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### var value

```cangjie
public var value: String
```

**Description:** The value of the metadata.

**Type:** String

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### init(String, String, String)

```cangjie
public init(name: String, value: String, resource: String)
```

**Description:** Creates a metadata information object.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description          |
|:----------|:-------|:---------|:--------|:---------------------|
| name      | String | Yes      | -       | The metadata name.   |
| value     | String | Yes      | -       | The metadata value.  |
| resource  | String | Yes      | -       | The metadata resource.|## class SignatureInfo

```cangjie
public class SignatureInfo {
    public let appId: String
    public let fingerprint: String
    public let appIdentifier: String
}
```

**Function:** Describes the signature information of an application package.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let appId

```cangjie
public let appId: String
```

**Function:** The appId of the application.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let appIdentifier

```cangjie
public let appIdentifier: String
```

**Function:** The unique identifier of the application, uniformly assigned by the cloud. This ID remains unchanged throughout the entire lifecycle of the application, including version upgrades, certificate changes, developer key pair changes, and application transfers.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let fingerprint

```cangjie
public let fingerprint: String
```

**Function:** The fingerprint information of the application package.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## struct ApplicationInfo

```cangjie
public struct ApplicationInfo {
    public let name: String
    public let description: String
    public let descriptionId: Int32
    public let enabled: Bool
    public let label: String
    public let labelId: Int32
    public let icon: String
    public let iconId: Int32
    public let process: String
    public let permissions: Array<String>
    public let codePath: String
    public let metadataArray: Array<ModuleMetadata>
    public let removable: Bool
    public let accessTokenId: UInt32
    public let uid: Int32
    public let iconResource: AppResource
    public let labelResource: AppResource
    public let descriptionResource: AppResource
    public let appDistributionType: String
    public let appProvisionType: String
    public let systemApp: Bool
    public let bundleType: BundleType
    public let debug: Bool
    public let dataUnclearable: Bool
    public let cloudFileSyncEnabled: Bool
    public let nativeLibraryPath: String
    public let multiAppMode: MultiAppMode
    public let appIndex: Int32
    public let installSource: String
    public let releaseType: String
}
```

**Function:** The configuration information of an application. Third-party applications can obtain their own application information via [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32), where the input parameter bundleFlags must include at least GET_BUNDLE_INFO_WITH_APPLICATION.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let accessTokenId

```cangjie
public let accessTokenId: UInt32
```

**Function:** The accessTokenId of the application.

**Type:** UInt32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let appDistributionType

```cangjie
public let appDistributionType: String
```

**Function:** The distribution type of the application's signing certificate, which can be: app_gallery, enterprise, os_integration, or crowdtesting.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let appIndex

```cangjie
public let appIndex: Int32
```

**Function:** The clone index identifier of the application package, effective only in clone applications.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let appProvisionType

```cangjie
public let appProvisionType: String
```

**Function:** The type of the application's signing certificate file, which can be either debug or release.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let bundleType

```cangjie
public let bundleType: BundleType
```

**Function:** Identifies the type of the package, which can be either APP (application) or ATOMIC_SERVICE (atomic service).

**Type:** [BundleType](#enum-bundletype)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let cloudFileSyncEnabled

```cangjie
public let cloudFileSyncEnabled: Bool
```

**Function:** Indicates whether the current application has enabled cloud file synchronization capability. true means the current application has enabled cloud file synchronization capability, false means it has not.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let codePath

```cangjie
public let codePath: String
```

**Function:** The installation directory of the application.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let dataUnclearable

```cangjie
public let dataUnclearable: Bool
```

**Function:** Indicates whether the application data can be deleted. true means the data cannot be deleted, false means it can. The default value is false.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let debug

```cangjie
public let debug: Bool
```

**Function:** Indicates whether the application is in debug mode. The default value is false.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let description

```cangjie
public let description: String
```

**Function:** The description information of the application, using the example: "description": $string: mainability_description". For detailed information about description, refer to the descriptionResource field.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let descriptionId

```cangjie
public let descriptionId: Int32
```

**Function:** The resource ID of the application's description information.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let descriptionResource

```cangjie
public let descriptionResource: AppResource
```

**Function:** The description resource information of the application, which includes bundleName, moduleName, and resource ID. You can call the globalization interface [getMediaContent](../LocalizationKit/cj-apis-resource_manager.md#func-getmediacontentappresource-uint32) to obtain detailed resource data.

**Type:** [AppResource](../LocalizationKit/cj-apis-resource_manager.md#class-appresource)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let enabled
```cangjie
public let enabled: Bool
```

**Function:** Determines whether the application is available. Defaults to true.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let icon

```cangjie
public let icon: String
```

**Function:** The icon of the application. Example usage: `"icon": "$media: icon"`. For detailed information about icons, refer to the `iconResource` field description.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let iconId

```cangjie
public let iconId: Int32
```

**Function:** The resource ID of the application icon.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let iconResource

```cangjie
public let iconResource: AppResource
```

**Function:** The icon resource information of the application, including `bundleName`, `moduleName`, and resource ID. The globalized interface [`getMediaContent`](../LocalizationKit/cj-apis-resource_manager.md#func-getmediacontentappresource-uint32) can be called to obtain detailed resource data.

**Type:** [AppResource](../LocalizationKit/cj-apis-resource_manager.md#class-appresource)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let installSource

```cangjie
public let installSource: String
```

**Function:** The installation source of the application. `pre-installed` indicates the app is preloaded, a package name indicates the app was installed by the corresponding app, and `unknown` indicates the installation source is unknown.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let label

```cangjie
public let label: String
```

**Function:** The name of the application. Example usage: `"label": "$string: mainability_description"`. For detailed information about labels, refer to the `labelResource` field description.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let labelId

```cangjie
public let labelId: Int32
```

**Function:** The resource ID of the application name.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let labelResource

```cangjie
public let labelResource: AppResource
```

**Function:** The label resource information of the application, including `bundleName`, `moduleName`, and resource ID. The globalized interface [`getMediaContent`](../LocalizationKit/cj-apis-resource_manager.md#func-getmediacontentappresource-uint32) can be called to obtain detailed resource data.

**Type:** [AppResource](../LocalizationKit/cj-apis-resource_manager.md#class-appresource)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let metadataArray

```cangjie
public let metadataArray: Array<ModuleMetadata>
```

**Function:** The metadata of the application. Obtained by calling the [`getBundleInfoForSelf`](#static-func-getbundleinfoforselfint32) interface with the `bundleFlags` parameter set to `GET_BUNDLE_INFO_WITH_APPLICATION` and `GET_BUNDLE_INFO_WITH_METADATA`.

**Type:** Array\<[ModuleMetadata](#struct-modulemetadata)>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let multiAppMode

```cangjie
public let multiAppMode: MultiAppMode
```

**Function:** The multi-instance mode of the application.

**Type:** [MultiAppMode](#struct-multiappmode)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let name

```cangjie
public let name: String
```

**Function:** The name of the application.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let nativeLibraryPath

```cangjie
public let nativeLibraryPath: String
```

**Function:** The path to the native library files of the application.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let permissions

```cangjie
public let permissions: Array<String>
```

**Function:** The permissions required to access the application. Obtained by calling the [`getBundleInfoForSelf`](#static-func-getbundleinfoforselfint32) interface with the `bundleFlags` parameter set to `GET_BUNDLE_INFO_WITH_APPLICATION` and `GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION`.

**Type:** Array\<String>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let process

```cangjie
public let process: String
```

**Function:** The process of the application. If not set, defaults to the package name.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let releaseType

```cangjie
public let releaseType: String
```

**Function:** Indicates the release type of the SDK used when packaging the application. Current SDK release types may include `Canary`, `Beta`, or `Release`, with `Canary` and `Beta` further subdivided by sequence numbers (e.g., `Canary1`, `Canary2`, `Beta1`, `Beta2`). Developers can compare the SDK release type used for packaging with the OS release type ([`deviceInfo.distributionOSReleaseType`](../BasicServicesKit/cj-apis-device_info.md)) to determine compatibility.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let removable

```cangjie
public let removable: Bool
```

**Function:** Indicates whether the application can be uninstalled.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let systemApp

```cangjie
public let systemApp: Bool
```

**Function:** Indicates whether the application is a system app.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let uid

```cangjie
public let uid: Int32
```

**Function:** The UID of the application.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## struct DataItem

```cangjie
public struct DataItem {
    public let key: String
    public let value: String
}
```

**Function:** Describes custom data in the module configuration routing table.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core**Initial Version:** 21  

### let key  

```cangjie  
public let key: String  
```  

**Function:** Identifies the key for custom data in the routing table.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let value  

```cangjie  
public let value: String  
```  

**Function:** Identifies the value for custom data in the routing table.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

## struct Dependency  

```cangjie  
public struct Dependency {  
    public let bundleName: String  
    public let moduleName: String  
    public let versionCode: UInt32  
}  
```  

**Function:** Describes the dynamic shared library information that a module depends on.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let bundleName  

```cangjie  
public let bundleName: String  
```  

**Function:** Identifies the bundle name of the shared library that the current module depends on.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let moduleName  

```cangjie  
public let moduleName: String  
```  

**Function:** Identifies the module name of the shared library that the current module depends on.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let versionCode  

```cangjie  
public let versionCode: UInt32  
```  

**Function:** Identifies the version number of the current shared library.  

**Type:** UInt32  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

## struct HapModuleInfo  

```cangjie  
public struct HapModuleInfo {  
    public let name: String  
    public let icon: String  
    public let iconId: Int32  
    public let label: String  
    public let labelId: Int32  
    public let description: String  
    public let descriptionId: Int32  
    public let mainElementName: String  
    public let abilitiesInfo: Array<AbilityInfo>  
    public let extensionAbilitiesInfo: Array<ExtensionAbilityInfo>  
    public let metadata: Array<Metadata>  
    public let deviceTypes: Array<String>  
    public let installationFree: Bool  
    public let hashValue: String  
    public let moduleType: ModuleType  
    public let preloads: Array<PreloadItem>  
    public let dependencies: Array<Dependency>  
    public let fileContextMenuConfig: String  
    public let routerMap: Array<RouterItem>  
    public let codePath: String  
    public let nativeLibraryPath: String  
}  
```  

**Function:** HAP information. Third-party applications can obtain their own HAP information via [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32), where the input parameter `bundleFlags` must at least include `GET_BUNDLE_INFO_WITH_HAP_MODULE`.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let abilitiesInfo  

```cangjie  
public let abilitiesInfo: Array<AbilityInfo>  
```  

**Function:** Ability information.  

**Type:** Array\<[AbilityInfo](#class-abilityinfo)>  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let codePath  

```cangjie  
public let codePath: String  
```  

**Function:** Installation path of the module.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let dependencies  

```cangjie  
public let dependencies: Array<Dependency>  
```  

**Function:** List of dynamic shared libraries that the module depends on for operation.  

**Type:** Array\<[Dependency](#struct-dependency)>  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let description  

```cangjie  
public let description: String  
```  

**Function:** Module description information.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let descriptionId  

```cangjie  
public let descriptionId: Int32  
```  

**Function:** Resource ID value of the description information.  

**Type:** Int32  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let deviceTypes  

```cangjie  
public let deviceTypes: Array<String>  
```  

**Function:** Device types capable of running the module.  

**Type:** Array\<String>  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let extensionAbilitiesInfo  

```cangjie  
public let extensionAbilitiesInfo: Array<ExtensionAbilityInfo>  
```  

**Function:** ExtensionAbility information.  

**Type:** Array\<[ExtensionAbilityInfo](#class-extensionabilityinfo)>  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let fileContextMenuConfig  

```cangjie  
public let fileContextMenuConfig: String  
```  

**Function:** File menu configuration of the module.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let hashValue  

```cangjie  
public let hashValue: String  
```  

**Function:** Hash value of the module.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let icon  

```cangjie  
public let icon: String  
```  

**Function:** Module icon.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let iconId  

```cangjie  
public let iconId: Int32  
```  

**Function:** Resource ID value of the module icon.**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let installationFree

```cangjie
public let installationFree: Bool
```

**Function:** Indicates whether the module supports installation-free.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let label

```cangjie
public let label: String
```

**Function:** Module label.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let labelId

```cangjie
public let labelId: Int32
```

**Function:** Resource ID value of the module label.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let mainElementName

```cangjie
public let mainElementName: String
```

**Function:** Entry ability information.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let metadata

```cangjie
public let metadata: Array<Metadata>
```

**Function:** Metadata of the Ability.

**Type:** Array\<[Metadata](#class-metadata)>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let moduleType

```cangjie
public let moduleType: ModuleType
```

**Function:** Identifies the type of the current module.

**Type:** [ModuleType](#enum-moduletype)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let name

```cangjie
public let name: String
```

**Function:** Module name.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let nativeLibraryPath

```cangjie
public let nativeLibraryPath: String
```

**Function:** Path to the native library file of a hapModule within the application.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let preloads

```cangjie
public let preloads: Array<PreloadItem>
```

**Function:** Preload list of modules in the meta service.

**Type:** Array\<[PreloadItem](#struct-preloaditem)>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let routerMap

```cangjie
public let routerMap: Array<RouterItem>
```

**Function:** Router table configuration of the module. Obtained by calling the [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32) interface, with the bundleFlags parameter passed as the values of GET_BUNDLE_INFO_WITH_HAP_MODULE and GET_BUNDLE_INFO_WITH_ROUTER_MAP.

**Type:** Array\<[RouterItem](#struct-routeritem)>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## struct ModuleMetadata

```cangjie
public struct ModuleMetadata {
    public let moduleName: String
    public let metadata: Array<Metadata>
}
```

**Function:** Describes the metadata information of a module.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let metadata

```cangjie
public let metadata: Array<Metadata>
```

**Function:** List of metadata information under this module.

**Type:** Array\<[Metadata](#class-metadata)>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let moduleName

```cangjie
public let moduleName: String
```

**Function:** Module name.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## struct MultiAppMode

```cangjie
public struct MultiAppMode {
    public let multiAppModeType: MultiAppModeType
    public let count: Int32
}
```

**Function:** Represents the multi-instance mode of an application.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let count

```cangjie
public let count: Int32
```

**Function:** Maximum number of application instances.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let multiAppModeType

```cangjie
public let multiAppModeType: MultiAppModeType
```

**Function:** Type of the multi-instance mode.

**Type:** [MultiAppModeType](#enum-multiappmodetype)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## struct PreloadItem

```cangjie
public struct PreloadItem {
    public let moduleName: String
}
```

**Function:** Describes the preload module information in the meta service.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### let moduleName

```cangjie
public let moduleName: String
```

**Function:** Module name that is automatically preloaded by the system during runtime.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## struct ReqPermissionDetail

```cangjie
public struct ReqPermissionDetail {
    public var name: String
    public var moduleName: String
    public var reason: String
    public var reasonId: Int32
    public var usedScene: UsedScene
    public init(name: String, moduleName: String, reason: String, reasonId: Int32, usedScene: UsedScene)
}
```

**Function:** Detailed information about the set of permissions an application needs to request from the system during runtime.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### var moduleName

```cangjie
public var moduleName: String
```

**Function:** The name of the module requesting this permission.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### var name

```cangjie
public var name: String
```

**Function:** The name of the permission required.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### var reason

```cangjie
public var reason: String
```

**Function:** Describes the reason for requesting the permission.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### var reasonId

```cangjie
public var reasonId: Int32
```

**Function:** Describes the reason ID for requesting the permission.

**Type:** Int32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### var usedScene

```cangjie
public var usedScene: UsedScene
```

**Function:** The scenario and timing for using the permission.

**Type:** [UsedScene](#struct-usedscene)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### init(String, String, String, Int32, UsedScene)

```cangjie
public init(name: String, moduleName: String, reason: String, reasonId: Int32, usedScene: UsedScene)
```

**Function:** Creates a detailed information object for the set of permissions an application needs to request from the system during runtime.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The name of the permission required. |
| moduleName | String | Yes | - | The name of the module requesting this permission. |
| reason | String | Yes | - | Describes the reason for requesting the permission. |
| reasonId | Int32 | Yes | - | Describes the reason ID for requesting the permission. |
| usedScene | [UsedScene](#struct-usedscene) | Yes | - | The scenario and timing for using the permission. |

## struct RouterItem

```cangjie
public struct RouterItem {
    public let name: String
    public let pageSourceFile: String
    public let buildFunction: String
    public let data: Array<DataItem>
    public let customData: String
}
```

**Function:** Describes the routing table information configured for a module.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let buildFunction

```cangjie
public let buildFunction: String
```

**Function:** Identifies the function decorated with @Builder, which describes the UI of the page.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let customData

```cangjie
public let customData: String
```

**Function:** Identifies custom data of any type in the routing table configuration file.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let data

```cangjie
public let data: Array<DataItem>
```

**Function:** Identifies the string custom data in the routing table configuration file, i.e., the information in the data field, which has been parsed by the system and does not require manual parsing by developers.

**Type:** Array\<[DataItem](#struct-dataitem)>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let name

```cangjie
public let name: String
```

**Function:** Identifies the name of the page to navigate to.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let pageSourceFile

```cangjie
public let pageSourceFile: String
```

**Function:** Identifies the path of the page within the module.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## struct Skill

```cangjie
public struct Skill {
    public let actions: Array<String>
    public let entities: Array<String>
    public let uris: Array<SkillUri>
    public let domainVerify: Bool
}
```

**Function:** The skill tag object. Third-party applications can obtain skill information via [getBundleInfoForSelf](#static-func-getbundleinfoforselfint32), where the input parameter bundleFlags must include at least GET_BUNDLE_INFO_WITH_HAP_MODULE, GET_BUNDLE_INFO_WITH_ABILITY, and GET_BUNDLE_INFO_WITH_SKILL.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let actions

```cangjie
public let actions: Array<String>
```

**Function:** The set of Actions received by the Skill.

**Type:** Array\<String>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let domainVerify

```cangjie
public let domainVerify: Bool
```

**Function:** The DomainVerify value received by the Skill, only present in AbilityInfo.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let entities

```cangjie
public let entities: Array<String>
```

**Function:** The set of Entities received by the Skill.

**Type:** Array\<String>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let uris

```cangjie
public let uris: Array<SkillUri>
```

**Function:** The set of Uris matched by the Want.

**Type:** Array\<[SkillUri](#struct-skilluri)>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## struct SkillUri

```cangjie
public struct SkillUri {
    public let scheme: String
    public let host: String
    public let port: String
    public let path: String
    public let pathStartWith: String
    public let pathRegex: String
    public let uriType: String
    public let utd: String
    public let maxFileSupported: Int32
    public let linkFeature: String
}
```

**Function:** Describes URI identification information.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let host

```cangjie
public let host: String
```

**Function:** Identifies the host address portion of a URI, meaningful only when scheme exists.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let linkFeature

```cangjie
public let linkFeature: String
```

**Function:** Identifies the feature type provided by the URI for implementing inter-application navigation, existing only in AbilityInfo.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let maxFileSupported

```cangjie
public let maxFileSupported: Int32
```

**Function:** For specified file types, indicates the maximum number that can be received or opened at once.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let path

```cangjie
public let path: String
```

**Function:** Identifies the path portion of a URI, meaningful only when both scheme and host exist.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let pathRegex

```cangjie
public let pathRegex: String
```

**Function:** Identifies the path portion of a URI for regular expression matching, meaningful only when both scheme and host exist.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let pathStartWith

```cangjie
public let pathStartWith: String
```

**Function:** Identifies the path portion of a URI for prefix matching, meaningful only when both scheme and host exist.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let port

```cangjie
public let port: String
```

**Function:** Identifies the port portion of a URI, meaningful only when both scheme and host exist.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let scheme

```cangjie
public let scheme: String
```

**Function:** Identifies the protocol name of a URI, commonly including http, https, file, ftp, etc.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let uriType

```cangjie
public let uriType: String
```

**Function:** Identifies the data type matching the Want, using MIME (Multipurpose Internet Mail Extensions) type specifications.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let utd

```cangjie
public let utd: String
```

**Function:** Identifies the standardized data type of the URI matching the Want, applicable to scenarios such as sharing.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## struct UsedScene

```cangjie
public struct UsedScene {
    public var abilities: Array<String>
    public var when: String
    public init(abilities: Array<String>, when: String)
}
```

**Function:** Describes the usage scenarios and timing of permissions.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### var abilities

```cangjie
public var abilities: Array<String>
```

**Function:** Collection of Abilities that use this permission.

**Type:** Array\<String>

**Access:** Read-write

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### var when

```cangjie
public var when: String
```

**Function:** Timing for using this permission.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### init(Array\<String>, String)

```cangjie
public init(abilities: Array<String>, when: String)
```

**Function:** Creates an object describing the usage scenarios and timing of permissions.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| abilities | Array\<String> | Yes | - | Collection of Abilities that use this permission. |
| when | String | Yes | - | Timing for using this permission. |

## struct WindowSize

```cangjie
public struct WindowSize {
    public let maxWindowRatio: Float64
    public let minWindowRatio: Float64
    public let maxWindowWidth: UInt32
    public let minWindowWidth: UInt32
    public let maxWindowHeight: UInt32
    public let minWindowHeight: UInt32
}
```

**Function:** Describes window dimensions.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let maxWindowHeight

```cangjie
public let maxWindowHeight: UInt32
```

**Function:** Indicates the maximum height of a window in free-window state, with width unit in vp.

**Type:** UInt32

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let maxWindowRatio

```cangjie
public let maxWindowRatio: Float64
```

**Function:** Indicates the maximum aspect ratio of a window in free-window state, with value range 0-1.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### let maxWindowWidth

```cangjie
public let maxWindowWidth: UInt32
```

**Function:** Indicates the maximum width of a window in free-window state, with width unit in vp.
**Type:** UInt32  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let minWindowHeight  

```cangjie  
public let minWindowHeight: UInt32  
```  

**Description:** Represents the minimum height of a window in free-window state, with the unit in vp.  

**Type:** UInt32  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let minWindowRatio  

```cangjie  
public let minWindowRatio: Float64  
```  

**Description:** Represents the minimum aspect ratio (width/height) of a window in free-window state, with a valid range of 0-1.  

**Type:** Float64  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### let minWindowWidth  

```cangjie  
public let minWindowWidth: UInt32  
```  

**Description:** Represents the minimum width of a window in free-window state, with the unit in vp.  

**Type:** UInt32  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

## enum AbilityFlag  

```cangjie  
public enum AbilityFlag {  
    | GET_ABILITY_INFO_DEFAULT  
    | GET_ABILITY_INFO_WITH_PERMISSION  
    | GET_ABILITY_INFO_WITH_APPLICATION  
    | GET_ABILITY_INFO_WITH_METADATA  
    | GET_ABILITY_INFO_WITH_DISABLE  
    | GET_ABILITY_INFO_ONLY_SYSTEM_APP  
    | ...  
}  
```  

**Description:** UIAbility component information flags, indicating the content of UIAbility component information to be retrieved.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_ABILITY_INFO_DEFAULT  

```cangjie  
GET_ABILITY_INFO_DEFAULT  
```  

**Description:** Used to retrieve default abilityInfo, which excludes permission, metadata, and disabled abilityInfo.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_ABILITY_INFO_ONLY_SYSTEM_APP  

```cangjie  
GET_ABILITY_INFO_ONLY_SYSTEM_APP  
```  

**Description:** Used to retrieve abilityInfo exclusively for system applications.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_ABILITY_INFO_WITH_APPLICATION  

```cangjie  
GET_ABILITY_INFO_WITH_APPLICATION  
```  

**Description:** Used to retrieve abilityInfo that includes applicationInfo.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_ABILITY_INFO_WITH_DISABLE  

```cangjie  
GET_ABILITY_INFO_WITH_DISABLE  
```  

**Description:** Used to retrieve abilityInfo that includes disabled abilityInfo.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_ABILITY_INFO_WITH_METADATA  

```cangjie  
GET_ABILITY_INFO_WITH_METADATA  
```  

**Description:** Used to retrieve abilityInfo that includes metadata.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_ABILITY_INFO_WITH_PERMISSION  

```cangjie  
GET_ABILITY_INFO_WITH_PERMISSION  
```  

**Description:** Used to retrieve abilityInfo that includes permission.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

## enum AbilityType  

```cangjie  
public enum AbilityType {  
    | PAGE  
    | SERVICE  
    | DATA  
    | ...  
}  
```  

**Description:** Indicates the type of Ability component.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### DATA  

```cangjie  
DATA  
```  

**Description:** Represents a PA developed based on the Data template, providing a unified data access object for external use.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### PAGE  

```cangjie  
PAGE  
```  

**Description:** UI-based Ability type. Represents an FA developed based on the Page template, providing user interaction capabilities.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### SERVICE  

```cangjie  
SERVICE  
```  

**Description:** Background service-type Ability with no UI. Represents a PA developed based on the Service template, providing background task execution capabilities.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

## enum ApplicationFlag  

```cangjie  
public enum ApplicationFlag {  
    | GET_APPLICATION_INFO_DEFAULT  
    | GET_APPLICATION_INFO_WITH_PERMISSION  
    | GET_APPLICATION_INFO_WITH_METADATA  
    | GET_APPLICATION_INFO_WITH_DISABLE  
    | ...  
}  
```  

**Description:** Application information flags, indicating the content of application information to be retrieved.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_APPLICATION_INFO_DEFAULT  

```cangjie  
GET_APPLICATION_INFO_DEFAULT  
```  

**Description:** Used to retrieve default applicationInfo, which excludes permission and metadata information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_APPLICATION_INFO_WITH_DISABLE  

```cangjie  
GET_APPLICATION_INFO_WITH_DISABLE  
```  

**Description:** Used to retrieve applicationInfo that includes disabled applications.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_APPLICATION_INFO_WITH_METADATA  

```cangjie  
GET_APPLICATION_INFO_WITH_METADATA  
```  

**Description:** Used to retrieve applicationInfo that includes metadata.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_APPLICATION_INFO_WITH_PERMISSION  

```cangjie  
GET_APPLICATION_INFO_WITH_PERMISSION  
```  

**Description:** Used to retrieve applicationInfo that includes permission.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

## enum ApplicationType  

```cangjie  
public enum ApplicationType {  
    | BROWSER  
    | IMAGE  
    | AUDIO  
    | VIDEO  
    | PDF  
    | WORD  
    | EXCEL  
    | PPT  
    | EMAIL  
    | ...  
}  
```  

**Description:** Application types for default applications.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### AUDIO  

```cangjie  
AUDIO  
```  

**Description:** Default audio player.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp**Initial Version:** 21  

### BROWSER  

```cangjie  
BROWSER  
```  

**Function:** Default browser.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### EMAIL  

```cangjie  
EMAIL  
```  

**Function:** Default email client.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### EXCEL  

```cangjie  
EXCEL  
```  

**Function:** Default EXCEL document viewer.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### IMAGE  

```cangjie  
IMAGE  
```  

**Function:** Default image viewer.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### PDF  

```cangjie  
PDF  
```  

**Function:** Default PDF document viewer.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### PPT  

```cangjie  
PPT  
```  

**Function:** Default PPT document viewer.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### VIDEO  

```cangjie  
VIDEO  
```  

**Function:** Default video player.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### WORD  

```cangjie  
WORD  
```  

**Function:** Default WORD document viewer.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): String  
```  

**Function:** Gets the enumeration value.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.DefaultApp  

**Initial Version:** 21  

**Return Value:**  

| Type   | Description          |  
|:-------|:---------------------|  
| String | The enumeration value. |  

## enum BundleFlag  

```cangjie  
public enum BundleFlag {  
    | GET_BUNDLE_INFO_DEFAULT  
    | GET_BUNDLE_INFO_WITH_APPLICATION  
    | GET_BUNDLE_INFO_WITH_HAP_MODULE  
    | GET_BUNDLE_INFO_WITH_ABILITY  
    | GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY  
    | GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION  
    | GET_BUNDLE_INFO_WITH_METADATA  
    | GET_BUNDLE_INFO_WITH_DISABLE  
    | GET_BUNDLE_INFO_WITH_SIGNATURE  
    | GET_BUNDLE_INFO_WITH_MENU  
    | GET_BUNDLE_INFO_WITH_ROUTER_MAP  
    | GET_BUNDLE_INFO_WITH_SKILL  
    | ...  
}  
```  

**Function:** Bundle information flags indicating the content of bundle information to be retrieved.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_DEFAULT  

```cangjie  
GET_BUNDLE_INFO_DEFAULT  
```  

**Function:** Retrieves only the most basic bundle information. The retrieved bundle information does not include HAP module information, application information, signature information, or permission request information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_ABILITY  

```cangjie  
GET_BUNDLE_INFO_WITH_ABILITY  
```  

**Function:** Must be specified together with `GET_BUNDLE_INFO_WITH_HAP_MODULE` to include ability information in the retrieved HAP module information, excluding metadata in the ability information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_APPLICATION  

```cangjie  
GET_BUNDLE_INFO_WITH_APPLICATION  
```  

**Function:** On top of the most basic bundle information, includes application information, excluding metadata in the application information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_DISABLE  

```cangjie  
GET_BUNDLE_INFO_WITH_DISABLE  
```  

**Function:** Used to retrieve BundleInfo with disabled applications and disabled Ability information. The retrieved bundleInfo does not include signatureInfo, applicationInfo, hapModuleInfo, ability, extensionAbility, or permission information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY  

```cangjie  
GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY  
```  

**Function:** Must be specified together with `GET_BUNDLE_INFO_WITH_HAP_MODULE` to include extension ability information in the retrieved HAP module information, excluding metadata in the extension ability information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_HAP_MODULE  

```cangjie  
GET_BUNDLE_INFO_WITH_HAP_MODULE  
```  

**Function:** On top of the most basic bundle information, includes HAP module information, excluding ability information, extension ability information, and metadata in the HAP module information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_MENU  

```cangjie  
GET_BUNDLE_INFO_WITH_MENU  
```  

**Function:** Used to retrieve bundleInfo containing fileContextMenuConfig. It cannot be used alone and must be used with GET_BUNDLE_INFO_WITH_HAP_MODULE.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_METADATA  

```cangjie  
GET_BUNDLE_INFO_WITH_METADATA  
```  

**Function:** Retrieves all metadata, including metadata in HAP module information, ability information, extension ability information, and application information. Therefore, it must be specified together with `GET_BUNDLE_INFO_WITH_HAP_MODULE`, `GET_BUNDLE_INFO_WITH_ABILITY`, `GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY`, and `GET_BUNDLE_INFO_WITH_APPLICATION`.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION  

```cangjie  
GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION  
```  

**Function:** On top of the most basic bundle information, includes permission request information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_ROUTER_MAP  

```cangjie  
GET_BUNDLE_INFO_WITH_ROUTER_MAP  
```  

**Function:** Used to retrieve bundleInfo containing routerMap. It cannot be used alone and must be used with GET_BUNDLE_INFO_WITH_HAP_MODULE.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_SIGNATURE  

```cangjie  
GET_BUNDLE_INFO_WITH_SIGNATURE  
```  

**Function:** On top of the most basic bundle information, includes signature information.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### GET_BUNDLE_INFO_WITH_SKILL  

```cangjie  
GET_BUNDLE_INFO_WITH_SKILL  
```  

**Function:** Used to retrieve bundleInfo containing skills. It cannot be used alone and must be used with GET_BUNDLE_INFO_WITH_HAP_MODULE, GET_BUNDLE_INFO_WITH_ABILITY, and GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Function:** Gets the enumeration value.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

**Return Value:**| Type | Description |
|:----|:----|
| Int32 | Enumeration value. |

## enum BundleType

```cangjie
public enum BundleType {
    | APP
    | ATOMIC_SERVICE
    | ...
}
```

**Function:** Identifies the type of application.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### APP

```cangjie
APP
```

**Function:** The Bundle is an application.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### ATOMIC_SERVICE

```cangjie
ATOMIC_SERVICE
```

**Function:** The Bundle is an atomic service.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## enum CompatiblePolicy

```cangjie
public enum CompatiblePolicy {
    | BACKWARD_COMPATIBILITY
    | ...
}
```

**Function:** Identifies the version compatibility type of shared libraries.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### BACKWARD_COMPATIBILITY

```cangjie
BACKWARD_COMPATIBILITY
```

**Function:** This field indicates that the shared library is backward compatible.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## enum DisplayOrientation

```cangjie
public enum DisplayOrientation {
    | UNSPECIFIED
    | LANDSCAPE
    | PORTRAIT
    | FOLLOW_RECENT
    | LANDSCAPE_INVERTED
    | PORTRAIT_INVERTED
    | AUTO_ROTATION
    | AUTO_ROTATION_LANDSCAPE
    | AUTO_ROTATION_PORTRAIT
    | AUTO_ROTATION_RESTRICTED
    | AUTO_ROTATION_LANDSCAPE_RESTRICTED
    | AUTO_ROTATION_PORTRAIT_RESTRICTED
    | LOCKED
    | AUTO_ROTATION_UNSPECIFIED
    | FOLLOW_DESKTOP
    | ...
}
```

**Function:** Identifies the display mode of the Ability. This tag is only applicable to page-type Abilities.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### AUTO_ROTATION

```cangjie
AUTO_ROTATION
```

**Function:** Indicates sensor-based auto-rotation mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### AUTO_ROTATION_LANDSCAPE

```cangjie
AUTO_ROTATION_LANDSCAPE
```

**Function:** Indicates sensor-based auto-landscape rotation mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### AUTO_ROTATION_LANDSCAPE_RESTRICTED

```cangjie
AUTO_ROTATION_LANDSCAPE_RESTRICTED
```

**Function:** Indicates switch-controlled auto-landscape rotation mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### AUTO_ROTATION_PORTRAIT

```cangjie
AUTO_ROTATION_PORTRAIT
```

**Function:** Indicates sensor-based auto-portrait rotation mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### AUTO_ROTATION_PORTRAIT_RESTRICTED

```cangjie
AUTO_ROTATION_PORTRAIT_RESTRICTED
```

**Function:** Indicates switch-controlled auto-portrait rotation mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### AUTO_ROTATION_RESTRICTED

```cangjie
AUTO_ROTATION_RESTRICTED
```

**Function:** Indicates switch-controlled auto-rotation mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### AUTO_ROTATION_UNSPECIFIED

```cangjie
AUTO_ROTATION_UNSPECIFIED
```

**Function:** Indicates switch-controlled and system-determined auto-rotation mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### FOLLOW_DESKTOP

```cangjie
FOLLOW_DESKTOP
```

**Function:** Follows the desktop rotation mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### FOLLOW_RECENT

```cangjie
FOLLOW_RECENT
```

**Function:** Indicates following the previous display mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### LANDSCAPE

```cangjie
LANDSCAPE
```

**Function:** Indicates landscape display mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### LANDSCAPE_INVERTED

```cangjie
LANDSCAPE_INVERTED
```

**Function:** Indicates inverted landscape display mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### LOCKED

```cangjie
LOCKED
```

**Function:** Indicates locked mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### PORTRAIT

```cangjie
PORTRAIT
```

**Function:** Indicates portrait display mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### PORTRAIT_INVERTED

```cangjie
PORTRAIT_INVERTED
```

**Function:** Indicates inverted portrait display mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### UNSPECIFIED

```cangjie
UNSPECIFIED
```

**Function:** Indicates undefined orientation mode, determined by the system.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## enum ExtensionAbilityFlag

```cangjie
public enum ExtensionAbilityFlag {
    | GET_EXTENSION_ABILITY_INFO_DEFAULT
    | GET_EXTENSION_ABILITY_INFO_WITH_PERMISSION
    | GET_EXTENSION_ABILITY_INFO_WITH_APPLICATION
    | GET_EXTENSION_ABILITY_INFO_WITH_METADATA
    | ...
}
```

**Function:** Extension component information flag, indicating the content of extension component information to be obtained.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### GET_EXTENSION_ABILITY_INFO_DEFAULT
```cangjie
GET_EXTENSION_ABILITY_INFO_DEFAULT
```

**Function:** Used to obtain default extensionAbilityInfo. The retrieved extensionAbilityInfo does not include permission, metadata, or disabled abilityInfo.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### GET_EXTENSION_ABILITY_INFO_WITH_APPLICATION

```cangjie
GET_EXTENSION_ABILITY_INFO_WITH_APPLICATION
```

**Function:** Used to obtain extensionAbilityInfo that includes applicationInfo.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### GET_EXTENSION_ABILITY_INFO_WITH_METADATA

```cangjie
GET_EXTENSION_ABILITY_INFO_WITH_METADATA
```

**Function:** Used to obtain extensionAbilityInfo that includes metadata.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### GET_EXTENSION_ABILITY_INFO_WITH_PERMISSION

```cangjie
GET_EXTENSION_ABILITY_INFO_WITH_PERMISSION
```

**Function:** Used to obtain extensionAbilityInfo that includes permission.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

## enum ExtensionAbilityType

```cangjie
public enum ExtensionAbilityType {
    | FORM
    | WORK_SCHEDULER
    | INPUT_METHOD
    | SERVICE
    | ACCESSIBILITY
    | DATA_SHARE
    | FILE_SHARE
    | STATIC_SUBSCRIBER
    | WALLPAPER
    | BACKUP
    | WINDOW
    | ENTERPRISE_ADMIN
    | THUMBNAIL
    | PREVIEW
    | PRINT
    | SHARE
    | PUSH
    | DRIVER
    | ACTION
    | ADS_SERVICE
    | EMBEDDED_UI
    | INSIGHT_INTENT_UI
    | UNSPECIFIED
    | ...
}
```

**Function:** Indicates the type of extension component.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### ACCESSIBILITY

```cangjie
ACCESSIBILITY
```

**Function:** Accessibility service extension capability, supporting access to and operation of foreground interfaces.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### ACTION

```cangjie
ACTION
```

**Function:** Custom service extension capability, providing developers with a custom operation business template based on UIExtension.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### ADS_SERVICE

```cangjie
ADS_SERVICE
```

**Function:** Advertising service extension capability, offering external background custom advertising services (currently not supported).

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### BACKUP

```cangjie
BACKUP
```

**Function:** Data backup extension capability, providing application data backup and recovery functionality.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### DATA_SHARE

```cangjie
DATA_SHARE
```

**Function:** Data sharing extension capability, used to provide external data read/write services.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### DRIVER

```cangjie
DRIVER
```

**Function:** Driver extension capability, providing peripheral driver extension functionality (currently not supported).

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### EMBEDDED_UI

```cangjie
EMBEDDED_UI
```

**Function:** Embedded UI extension capability, enabling cross-process interface embedding.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### ENTERPRISE_ADMIN

```cangjie
ENTERPRISE_ADMIN
```

**Function:** Enterprise device management extension capability, providing the ability to handle management events such as application installation events or excessive incorrect lock screen password attempts.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### FILE_SHARE

```cangjie
FILE_SHARE
```

**Function:** File sharing extension capability, used for file sharing between applications (reserved capability, currently not supported).

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### FORM

```cangjie
FORM
```

**Function:** Card extension capability, providing card development functionality.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### INPUT_METHOD

```cangjie
INPUT_METHOD
```

**Function:** Input method extension capability, used for developing input method applications.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### INSIGHT_INTENT_UI

```cangjie
INSIGHT_INTENT_UI
```

**Function:** Provides developers with the ability to be invoked by Xiaoyi's intent to present content in window form.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### PREVIEW

```cangjie
PREVIEW
```

**Function:** File preview extension capability, providing the ability to preview files that can be embedded and displayed in other applications (reserved capability, currently not supported).

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### PRINT

```cangjie
PRINT
```

**Function:** File printing extension capability, supporting photo and document printing in office scenarios (currently supports image printing; document types are not yet supported).

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### PUSH

```cangjie
PUSH
```

**Function:** Push extension capability, providing scenario-based message push functionality (reserved capability, currently not supported).

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### SERVICE

```cangjie
SERVICE
```

**Function:** Background service extension capability, providing background operation and corresponding external services.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### SHARE

```cangjie
SHARE
```

**Function:** Provides sharing business capability, offering developers a sharing business template based on UIExtension.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### STATIC_SUBSCRIBER

```cangjie
STATIC_SUBSCRIBER
```

**Function:** Static broadcast extension capability, used to handle static events such as boot events.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21### THUMBNAIL

```cangjie
THUMBNAIL
```

**Function:** File thumbnail extension capability, providing the ability to generate icon thumbnails for files. Reserved capability, currently not supported.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### UNSPECIFIED

```cangjie
UNSPECIFIED
```

**Function:** Unspecified type, used in conjunction with the queryExtensionAbilityInfo interface to query all types of ExtensionAbility.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### WALLPAPER

```cangjie
WALLPAPER
```

**Function:** Wallpaper extension capability, used to implement desktop wallpapers. Reserved capability, currently not supported.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### WINDOW

```cangjie
WINDOW
```

**Function:** Window composition extension capability, allowing system applications to launch and embed cross-application interfaces.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### WORK_SCHEDULER

```cangjie
WORK_SCHEDULER
```

**Function:** Deferred task extension capability, allowing applications to execute non-time-sensitive tasks during system idle periods.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## enum LaunchType

```cangjie
public enum LaunchType {
    | SINGLETON
    | MULTITON
    | SPECIFIED
    | ...
}
```

**Function:** An ability has a specific launch type. This enumeration is used to indicate the launch type of the ability.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### MULTITON

```cangjie
MULTITON
```

**Function:** The ability is launched in standard multi-instance mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### SINGLETON

```cangjie
SINGLETON
```

**Function:** The ability is launched in singleton mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### SPECIFIED

```cangjie
SPECIFIED
```

**Function:** The ability is launched in custom multi-instance mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## enum ModuleType

```cangjie
public enum ModuleType {
    | ENTRY
    | FEATURE
    | SHARED
    | ...
}
```

**Function:** Identifies the module type.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### ENTRY

```cangjie
ENTRY
```

**Function:** The main module of the application.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### FEATURE

```cangjie
FEATURE
```

**Function:** Dynamic feature module of the application.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### SHARED

```cangjie
SHARED
```

**Function:** Dynamic shared library module of the application.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## enum MultiAppModeType

```cangjie
public enum MultiAppModeType {
    | UNSPECIFIED
    | MULTI_INSTANCE
    | APP_CLONE
    | ...
}
```

**Function:** Identifies the multi-instance mode type of the application.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### APP_CLONE

```cangjie
APP_CLONE
```

**Function:** Clone mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### MULTI_INSTANCE

```cangjie
MULTI_INSTANCE
```

**Function:** Multi-instance mode.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### UNSPECIFIED

```cangjie
UNSPECIFIED
```

**Function:** Unspecified type.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## enum PermissionGrantState

```cangjie
public enum PermissionGrantState {
    | PERMISSION_DENIED
    | PERMISSION_GRANTED
    | ...
}
```

**Function:** Indicates the permission grant state.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### PERMISSION_DENIED

```cangjie
PERMISSION_DENIED
```

**Function:** Permission denied.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### PERMISSION_GRANTED

```cangjie
PERMISSION_GRANTED
```

**Function:** Permission granted.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## enum ProfileType

```cangjie
public enum ProfileType {
    | INTENT_PROFILE
    | ...
}
```

**Function:** Identifies the profile type.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

### INTENT_PROFILE

```cangjie
INTENT_PROFILE
```

**Function:** Intent framework profile.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21

## enum SupportWindowMode

```cangjie
public enum SupportWindowMode {
    | FULL_SCREEN
    | SPLIT
    | FLOATING
    | ...
}
```

**Function:** An ability can support multiple window modes. This enumeration is used to indicate the supported window modes of an ability.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Initial Version:** 21**Initial Version:** 21  

### FLOATING  

```cangjie  
FLOATING  
```  

**Function:** Supports windowed display.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### FULL_SCREEN  

```cangjie  
FULL_SCREEN  
```  

**Function:** The window supports full-screen display.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21  

### SPLIT  

```cangjie  
SPLIT  
```  

**Function:** The window supports split-screen display.  

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core  

**Initial Version:** 21