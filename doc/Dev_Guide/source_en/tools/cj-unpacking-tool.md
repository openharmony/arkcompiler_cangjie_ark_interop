# Unpacking Tool  

The unpacking tool is a debugging utility provided by OpenHarmony that supports decompressing HAP, HSP, and App files into folders via command-line operations. It also offers Java interfaces for parsing HAP, HSP, and App files.  

The `app_unpacking_tool.jar` used for unpacking can be found in the locally downloaded OpenHarmony SDK library.  

> **Note:**  
>  
> Currently, the Cangjie tool only supports developing HAR and HAP packages and does not support HSP packages. Therefore, HSP-related functionalities in this tool are unavailable in Cangjie programs.  

## Constraints and Limitations  

The unpacking tool requires Java 8 or higher to run.  

## Unpacking Command Instructions  

### HAP Package Mode Unpacking Command  

Developers can use the unpacking tool's JAR package to unpack applications by specifying unpacking options and file paths to extract HAP packages.  

#### Example  

```bash  
java -jar app_unpacking_tool.jar --mode hap --hap-path <path> --out-path <path> [--force true]  
```  

#### Parameter Descriptions and Specifications  

| Command      | Required | Options       | Description                                                                 |  
|-------------|----------|--------------|-----------------------------------------------------------------------------|  
| --mode      | Yes      | hap          | Unpacking type.                                                             |  
| --hap-path  | Yes      | NA           | Path to the HAP package.                                                    |  
| --rpcid     | No       | true or false | Whether to extract only the rpcid file from the HAP package to the specified directory. If true, only the rpcid file is extracted without unpacking the HAP package. |  
| --out-path  | Yes      | NA           | Target directory for unpacked files.                                        |  
| --force     | No       | true or false | Default: false. If true, forces deletion if the target file already exists. |  

### App Package Mode Unpacking Command  

Developers can use the unpacking tool's JAR package to unpack applications by specifying unpacking options and file paths to extract App packages.  

#### Example  

```bash  
java -jar app_unpacking_tool.jar --mode app --app-path <path> --out-path <path> [--force true]  
```  

#### Parameter Descriptions and Specifications  

| Command      | Required | Options       | Description                                                                 |  
|-------------|----------|--------------|-----------------------------------------------------------------------------|  
| --mode      | Yes      | app          | Unpacking type.                                                             |  
| --app-path  | Yes      | NA           | Path to the App package.                                                    |  
| --out-path  | Yes      | NA           | Target directory for unpacked files.                                        |  
| --force     | No       | true or false | Default: false. If true, forces deletion if the target file already exists. |  

### Extracting rpcid File from HAP Package  

Developers can use the unpacking tool's JAR package to extract the rpcid file from an application by specifying unpacking options and file paths.  

#### Example  

```bash  
java -jar app_unpacking_tool.jar --mode hap --rpcid true --hap-path <path> --out-path <path> [--force true]  
```  

#### Parameter Descriptions and Specifications  

| Command      | Required | Options       | Description                                                                 |  
|-------------|----------|--------------|-----------------------------------------------------------------------------|  
| --mode      | Yes      | hap          | Unpacking type.                                                             |  
| --rpcid     | No       | true or false | Whether to extract only the rpcid file from the HAP package to the specified directory. If true, only the rpcid file is extracted without unpacking the HAP package. |  
| --hap-path  | Yes      | NA           | Path to the HAP package.                                                    |  
| --out-path  | Yes      | NA           | Target directory for the extracted rpcid file.                              |  
| --force     | No       | true or false | Default: false. If true, forces deletion if the target file already exists. |  

### HSP Package Mode Unpacking Command  

Developers can use the unpacking tool's JAR package to unpack applications by specifying unpacking options and file paths to extract HSP packages.  

#### Example  

```bash  
java -jar app_unpacking_tool.jar --mode hsp --hsp-path <path> --out-path <path> [--force true]  
```  

#### Parameter Descriptions and Specifications  

| Command      | Required | Options       | Description                                                                 |  
|-------------|----------|--------------|-----------------------------------------------------------------------------|  
| --mode      | Yes      | hsp          | Unpacking type.                                                             |  
| --hsp-path  | Yes      | NA           | Path to the HSP package.                                                    |  
| --out-path  | Yes      | NA           | Target directory for unpacked files.                                        |  
| --force     | No       | true or false | Default: false. If true, forces deletion if the target file already exists. |  

### APPQF Mode Unpacking Command  

Developers can use the unpacking tool's JAR package to unpack applications by specifying unpacking options and file paths to extract APPQF packages.  

#### Example  

```bash  
java -jar app_unpacking_tool.jar --mode appqf --appqf-path <path> --out-path <path> [--force true]  
```  

#### Parameter Descriptions and Specifications  

| Command      | Required | Options       | Description                                                                 |  
|-------------|----------|--------------|-----------------------------------------------------------------------------|  
| --mode      | Yes      | appqf        | Unpacking type.                                                             |  
| --appqf-path| Yes      | NA           | Path to the APPQF package.                                                  |  
| --out-path  | Yes      | NA           | Target directory for unpacked files.                                        |  
| --force     | No       | true or false | Default: false. If true, forces deletion if the target file already exists. |  

## Package Parsing Interfaces  

The package parsing interfaces are exclusively used by app stores to parse built HAP, HSP, and App packages to retrieve configuration file information.  

### Interface Directory  

| Class Name          | Interface Prototype                                                                 | Type      | Detailed Description                                                                 |  
|---------------------|------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------|  
| UncompressEntrance  | UncompressResult parseApp(String appPath, ParseAppMode parseMode, String hapName)  | Java API  | Function: Parses the pack.info of an App package based on parameters.<br/>Input: `appPath` (App package path), `parseMode` (parsing mode enum: ALL/HAP_LIST/HAP_INFO), `hapName` (HAP package name, required when `parseMode` is HAP_INFO).<br/>Return: `UncompressResult`. |  
| UncompressEntrance  | UncompressResult parseApp(InputStream input, ParseAppMode parseMode, String hapName)| Java API  | Function: Parses the pack.info of an App package based on parameters.<br/>Input: `input` (App file stream), `parseMode` (parsing mode enum: ALL/HAP_LIST/HAP_INFO), `hapName` (HAP package name, required when `parseMode` is HAP_INFO).<br/>Return: `UncompressResult`. |  
| UncompressEntrance  | UncompressResult parseHap(String hapPath)                                          | Java API  | Function: Parses the JSON configuration file of an App package.<br/>Input: `hapPath` (HAP package path).<br/>Return: `UncompressResult`. |  
| UncompressEntrance  | UncompressResult parseHap(InputStream input)                                       | Java API  | Function: Parses the JSON configuration file of an App package.<br/>Input: `input` (HAP package file stream).<br/>Return: `UncompressResult`. |  

## Unpacking Tool Information Fields  

### UncompressResult (Bundle Information) Structure  

| Field            | Type               | Description                                                                 | Remarks |  
|------------------|--------------------|-----------------------------------------------------------------------------|---------|  
| result           | boolean            | Indicates whether parsing was successful. `true` for success, `false` for failure. | NA      |  
| message          | String             | Failure reason if parsing fails.                                            | NA      |  
| packInfos        | List\<PackInfo>    | `packages` information from the bundle's `pack.info` file.                  | NA      |  
| profileInfos     | List\<ProfileInfo> | Application configuration information.                                      | NA      |  
| profileInfosStr  | List\<String>      | Application configuration information.                                      | NA      |  
| icon             | String             | Path to the entry component's icon. If no entry component exists, returns the first component's icon. | NA      |  
| label            | String             | Label of the entry component. If no entry component exists, returns the first component's label. | NA      |  
| packageSize      | long               | Size of the App package in bytes.                                           | NA      |  

### PackInfo Structure  

| Field                | Type          | Description                                                                 | Remarks |  
|----------------------|---------------|-----------------------------------------------------------------------------|---------|  
| name                 | String        | Package name.                                                               | NA      |  
| moduleName           | String        | HAP name.                                                                   | NA      |  
| moduleType           | String        | Module type.                                                                | NA      |  
| deviceType           | List\<String> | Device types supported by the current HAP package.                           | NA      |  
| deliveryWithInstall  | boolean       | Indicates whether the HAP is installed when the user actively installs it. `true` for installation, `false` otherwise. | NA      |  

### ProfileInfo Structure  

| Field          | Type                           | Description                                                                 | Remarks                                                                 |  
|----------------|--------------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------|  
| hapName        | String                         | Name of the current HAP package being parsed.                               | NA                                                                      |  
| appInfo        | AppInfo structure (see below)  | Structure containing App information (see AppInfo below).                   | NA                                                                      |  
| deviceConfig   | Map\<String, DeviceConfig>     | Device information.                                                         | Stored as `Map<String, String>`, containing device type names and corresponding information. In the Stage model, this field is stored in the App structure. |  
| hapInfo        | HapInfo structure (see below)  | Module information in the HAP package (see HapInfo below).                 | NA                                                                      |  

### AppInfo Structure  

| Field                           | Type                     | Description                                                                 | Remarks                                                                 |  
|---------------------------------|--------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------|  
| bundleName                      | String                   | App package name.                                                          | NA                                                                      |  
| vendor                          | String                   | App vendor information.                                                    | NA                                                                      |  
| relatedBundleName               | String                   | Related bundle package name.                                               | NA                                                                      |  
| versionName                     | String                   | `versionName` information in the App.                                      | NA                                                                      |  
| versionCode                     | String                   | `versionCode` information in the App.                                       | NA                                                                      |  
| targetApiVersion                | int                      | Target API version required for the App to run.                            | NA                                                                      |  
| compatibleApiVersion            | int                      | API version compatible with the App.                                       | NA                                                                      |  
| appName                         | String                   | Label displayed on the desktop for the ability.                            | NA                                                                      |  
| appNameEN                       | String                   | Label displayed on the desktop for the ability.                            | NA                                                                      |  
| releaseType                     | String                   | Type of the target API version required for the App.                       | NA                                                                      |  
| shellVersionCode                | String                   | API version number of the App.                                             | NA                                                                      |  
| shellVersionName                | String                   | API version name of the App.                                               | NA                                                                      |  
| multiFrameworkBundle            | boolean                  | Indicates the App framework. `true` for hybrid packaging, `false` otherwise. | NA                                                                      |  
| debug                           | boolean                  | Indicates whether the App is debuggable. `true` for debuggable, `false` otherwise. | NA                                                                      |  
| icon                            | String                   | Path to the App icon.                                                      | NA                                                                      |  
| label                           | String                   | Label of the App.                                                          | NA                                                                      |  
| description                     | String                   | Description of the App.                                                    | Added in the Stage model.                                               |  
| minCompatibleVersionCode        | int                      | Minimum compatible version number of the App.                              | NA                                                                      |  
| distributedNotificationEnabled  | boolean                  | Indicates whether distributed notifications are enabled for the App. `true` for enabled, `false` otherwise. | Added in the Stage model.                                               |  
| bundleType                      | String                   | Bundle type. Values:<br/>- `app`: Application.<br/>- `atomicService`: Atomic service.<br/>- `shared`: Inter-app shared library. | NA                                                                      |  
| compileSdkVersion               | String                   | SDK version used to compile the App.                                       | Only for Apps targeting API 21 and above.                               |  
| compileSdkType                  | String                   | SDK type used to compile the App.                                          | Only for Apps targeting API 21 and above.                               |  
| labels                          | HashMap\<String, String> | Multi-language labels in the App's JSON.                                   | NA                                                                      |  
| descriptions                    | HashMap\<String, String> | Multi-language descriptions in the App's JSON.                             | NA                                                                      |  

### HapInfo Structure  

| Field                 | Type                        | Description                                                                 | Remarks                                                                 |  
|-----------------------|----------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------|  
| appModel              | AppModel enum              | App framework model. Values:<br/>- `FA`: FA model.<br/>- `STAGE`: Stage model. | NA                                                                      |  
| packageStr            | String                     | Package information of the App.                                            | FA model only.                                                          |  
| name                  | String                     | Name of the current module.                                                 | NA                                                                      |  
| description           | String                     | Description of the HAP package.                                             | FA model only.                                                          |  
| supportedModes        | List\<String>              | Modes supported by the HAP package.                                        | NA                                                                      |  
| abilities             | List\<AbilityInfo>         | Ability information in the HAP package.                                     | NA                                                                      |  
| defPermissions        | List\<DefPermission>       | `DefPermission` information in the HAP package.                             | NA                                                                      |  
| definePermissions     | List\<DefinePermission>    | `DefinePermission` information in the HAP package.                          | NA                                                                      |  
| defPermissionsGroups  | List\<DefPermissionsGroups>| `DefPermissionsGroups` information in the HAP package.                      | NA                                                                      |  
| distro                | Distro structure           | `distro` information of the HAP package.                                   | NA                                                                      |  
| reqCapabilities       | List\<String>              | `reqCapabilities` information in the HAP package.                          | NA                                                                      |  
| deviceType            | List\<String>              | Device types on which the HAP can run. Corresponds to `deviceTypes` in the Stage model. | NA                                                                      |  
| metaData              | MetaData structure (see below)| Custom metadata of the HAP.                                               | NA                                                                      |  
| dependencies          | List\<DependencyItem>      | `DependencyItem` information in the HAP package.                           | NA                                                                      |  
| isJs                  | boolean                    | Indicates whether the App is a JS App. `true` for JS, `false` otherwise.   | FA model only.                                                          |  
| reqPermissions        | List\<ReqPermission>       | Collection of permissions requested by the App. Corresponds to `requestPermissions` in the Stage model. | NA                                                                      |  
| commonEvents          | CommonEvent structure      | Static events.                                                             | NA                                                                      |  
| shortcuts             | List\<Shortcut>            | Shortcut information of the App.                                           | NA                                                                      |  
| distroFilter          | DistroFilter structure     | Information for app stores to distribute by device type.                  | NA                                                                      |  
| srcEntrance           | String                     | Entry code path of the App.                                               | Added in the Stage model.                                               |  
| process               | String                     | Process name of the HAP.                                                  | Added in the Stage model.                                               |  
| mainElement           | String                     | Name of the entry ability or extension. In the FA model, `mainAbility` is assigned to `mainElement`. | Added in the Stage model.                                               |  
| uiSyntax              | String                     | Syntax type of the JS Component.                                           | Added in the Stage model.                                               |  
| pages                 | List\<String>              | Page information of the JS Component.                                      | Added in the Stage model.                                               |  
| extensionAbilityInfos | List\<ExtensionAbilityInfo>| Configuration information of `extensionAbility`.                          | Added in the Stage model.                                               |  
| moduleAtomicService   | ModuleAtomicService structure | Atomic service information of the HAP.                                    | NA                                                                      |  
| formInfos             | List\<AbilityFormInfo>     | Card information.                                                          | NA                                                                      |  
| descriptions          | HashMap\<String, String>   | Description information of the HAP.                                       | NA                                                                      |  
| compressedSize        | long                       | Compressed size of the HAP package in bytes.                               | NA                                                                      |  
| originalSize          | long                       | Original size of the HAP package in bytes.                                | NA                                                                      |  

### AbilityInfo Structure Information

| Field               | Type                       | Description                                                  | Remarks                                                                 |
|---------------------|----------------------------|--------------------------------------------------------------|-------------------------------------------------------------------------|
| name                | String                     | Identifies the logical name of the current ability.          | NA                                                                     |
| description         | String                     | Describes the ability.                                        | NA                                                                     |
| descriptionRes      | String                     | Identifies the resource description of the ability.           | NA                                                                     |
| icon                | String                     | Identifies the icon of the ability.                          | NA                                                                     |
| iconPath            | String                     | Identifies the path of the ability icon.                     | NA                                                                     |
| label               | String                     | Identifies the display name of the ability for users.        | NA                                                                     |
| labelRes            | String                     | Identifies the resource for the display name of the ability. | NA                                                                     |
| type                | String                     | Identifies the type of the ability.                          | In the Stage model, this value is directly assigned as the page type.  |
| formsEnabled        | boolean                    | Indicates whether the ability card is enabled. `true` means enabled, `false` means disabled. | NA                                                                     |
| formInfo            | FormInfo structure          | Describes the card information.                             | NA                                                                     |
| uri                 | String                     | Identifies the URI information of the ability.               | Supported in the FA model.                                              |
| launchType          | String                     | Identifies the launcherType information of the ability.      | NA                                                                     |
| orientation         | String                     | Identifies the orientation information of the ability.       | NA                                                                     |
| visible             | boolean                    | Identifies the visibility of the ability. `true` means visible, `false` means invisible. | NA                                                                     |
| grantPermission     | boolean                    | Identifies the grantPermission information of the ability.    | NA                                                                     |
| readPermission      | String                     | Identifies the readPermission information of the ability.    | NA                                                                     |
| writePermission     | String                     | Identifies the writePermission information of the ability.   | NA                                                                     |
| uriPermissionMode   | String                     | Identifies the uriPermissionMode information of the ability. | NA                                                                     |
| uriPermissionPath   | String                     | Identifies the uriPermissionPath information of the ability. | NA                                                                     |
| directLaunch        | boolean                    | Identifies the directLaunch information of the ability.      | NA                                                                     |
| mission            | String                     | Identifies the mission information of the ability.           | NA                                                                     |
| targetAbility      | String                     | Identifies the targetAbility information of the ability.     | NA                                                                     |
| multiUserShared    | boolean                    | Indicates whether the ability supports multi-user sharing. `true` means supported, `false` means not supported. | NA                                                                     |
| supportPipMode     | boolean                    | Indicates whether the ability supports PIP mode. `true` means supported, `false` means not supported. | NA                                                                     |
| srcLanguage        | String                     | Identifies the srcLanguage information of the ability.       | NA                                                                     |
| srcPath            | String                     | Identifies the srcPath information of the ability.           | NA                                                                     |
| srcEntrance        | String                     | Identifies the srcEntrance information of the ability.       | NA                                                                     |
| continuable        | boolean                    | Indicates whether the ability can be migrated. `true` means migratable, `false` means not migratable. | NA                                                                     |
| metaData           | MetaData structure (see MetaData below) | Identifies custom metadata of the ability.                  | NA                                                                     |
| configChanges      | List\<String>              | Identifies the configChanges information of the ability.     | NA                                                                     |
| formInfos          | List\<AbilityFormInfo>     | Identifies the forms information of the ability.             | NA                                                                     |
| permissions        | List\<String>              | Identifies the permissions information of the ability.       | NA                                                                     |
| skills             | List\<SkillInfo>           | Identifies the skills information of the ability.            | NA                                                                     |
| backgroundModes    | List\<String>              | Identifies the backgroundModes information of the ability.   | NA                                                                     |
| labels             | HashMap\<String, String>   | Identifies the display name of the ability in multiple languages. | NA                                                                     |
| descriptions       | HashMap\<String, String>   | Identifies the description of the ability in multiple languages. | NA                                                                     |

### Distro Structure Information

| Field                | Type    | Description                                                  | Remarks                                                                 |
|----------------------|---------|--------------------------------------------------------------|-------------------------------------------------------------------------|
| moduleName           | String  | Identifies the name of the current module.                   | Corresponds to the `moduleName` field in the Stage model's module structure. |
| moduleType           | String  | Identifies the type of the current HAP.                     | Corresponds to the `moduleType` field in the Stage model's module structure. |
| deliveryWithInstall  | boolean | Indicates whether the current HAP is installed when the user actively installs it. `true` means installed, `false` means not installed. | Corresponds to the `deliveryWithInstall` field in the Stage model's module structure. |
| installationFree     | int     | Indicates whether the current HAP supports the installation-free feature. | Corresponds to the `installationFree` field in the Stage model's module structure. If configured as `true` in the JSON file, returns `1`; if `false`, returns `0`; if not configured, returns `2`. |
| virtualMachine       | String  | Identifies the target virtual machine type for the current HAP, used for cloud distribution (e.g., app markets and distribution centers). | Corresponds to the `virtualMachine` field in the Stage model's module structure. |

### MetaData Structure Information

| Field           | Type                 | Description                                  | Remarks                                      |
|-----------------|----------------------|----------------------------------------------|----------------------------------------------|
| parameters      | List\<MetaDataInfo>  | Identifies the parameter information of Metadata. | Specific to the FA model; deprecated in the Stage model. |
| results         | List\<MetaDataInfo>  | Identifies the results information of Metadata. | Specific to the FA model; deprecated in the Stage model. |
| customizeDatas  | List\<CustomizeData> | Identifies the customizeDatas information of Metadata. | NA                                           |

### MetaDataInfo Structure Information

| Field        | Type   | Description                                  | Remarks                                      |
|--------------|--------|----------------------------------------------|----------------------------------------------|
| name         | String | Identifies the name information of MetaDataInfo. | Specific to the FA model; deprecated in the Stage model. |
| description  | String | Identifies the description information of MetaDataInfo. | Specific to the FA model; deprecated in the Stage model. |
| type         | String | Identifies the type information of MetaDataInfo. | Specific to the FA model; deprecated in the Stage model. |

### CustomizeData Structure Information

| Field  | Type   | Description                                  | Remarks                                      |
|--------|--------|----------------------------------------------|----------------------------------------------|
| name   | String | Identifies the name information of CustomizeData. | Corresponds to the metadata in the Stage model. |
| value  | String | Identifies the value information of CustomizeData. | Corresponds to the metadata in the Stage model. |
| extra  | String | Identifies the extra information of CustomizeData. | Corresponds to the metadata in the Stage model. |

### ReqPermission Structure Information

| Field      | Type                               | Description                                                                 | Remarks |
|------------|------------------------------------|-----------------------------------------------------------------------------|---------|
| name       | String                             | Identifies the name of the ReqPermission.                                   | NA      |
| reason     | String                             | Required when the requested permission is `user_grant`, describing the reason for the permission request. | NA      |
| usedScene  | UsedScene structure (see UsedScene below) | Describes the scenarios and timing for using the permission. Scenario types include: ability, call timing (when), and multiple abilities can be configured. | NA      |
| reasons    | HashMap\<String, String>           | Required when the requested permission is `user_grant`, describing the reason for the permission request. | NA      |

### UsedScene Struct Information

| Field   | Type           | Description                                                                 | Remarks |
|---------|----------------|-----------------------------------------------------------------------------|---------|
| ability | List\<String>  | Identifies the abilities (meta-abilities) that require this permission, in array format. | NA      |
| when    | String         | Identifies the timing of permission usage, values: inuse/always, representing foreground-only or both foreground/background usage. | NA      |

### Shortcut Struct Information

| Field      | Type                   | Description                                                                 | Remarks |
|------------|------------------------|-----------------------------------------------------------------------------|---------|
| shortcutId | String                 | Identifies the ID of the ShortCut.                                          | NA      |
| label      | String                 | Identifies the label information of the ShortCut.                          | NA      |
| icon       | String                 | Identifies the icon information of the ShortCut.                           | NA      |
| intents    | List\<IntentInfo>      | Identifies the collection of target intent information defined within the shortcut, each intent can configure two sub-tags: targetClass, targetBundle. | NA      |
| labels     | HashMap\<String, String> | Identifies the display name of the ShortCut in multiple languages.         | NA      |

### IntentInfo Struct Information

| Field         | Type   | Description             | Remarks |
|---------------|--------|-------------------------|---------|
| targetClass   | String | Target type of the shortcut. | NA      |
| targetBundle  | String | Target package name of the shortcut. | NA      |

### DistroFilter Struct Information

| Field          | Type                | Description                                  | Remarks |
|----------------|---------------------|----------------------------------------------|---------|
| apiVersion    | ApiVersion struct    | Identifies apiVersion information in DistroFilter. | NA      |
| screenShape   | ScreenShape struct   | Identifies screenShape information in DistroFilter. | NA      |
| screenDensity | ScreenDensity struct | Identifies screenDensity information in DistroFilter. | NA      |
| screenWindow  | ScreenWindow struct  | Identifies screenWindow information in DistroFilter. | NA      |
| countryCode   | CountryCode struct   | Identifies countryCode information in DistroFilter. | NA      |

### ApiVersion Struct Information

| Field  | Type          | Description                     | Remarks |
|--------|---------------|---------------------------------|---------|
| policy | String        | Identifies policy information in the struct. | NA      |
| value  | List\<String> | Identifies value information in the struct.  | NA      |

### ScreenShape Struct Information

| Field  | Type          | Description                     | Remarks |
|--------|---------------|---------------------------------|---------|
| policy | String        | Identifies policy information in the struct. | NA      |
| value  | List\<String> | Identifies value information in the struct.  | NA      |

### ScreenDensity Struct Information

| Field  | Type          | Description                     | Remarks |
|--------|---------------|---------------------------------|---------|
| policy | String        | Identifies policy information in the struct. | NA      |
| value  | List\<String> | Identifies value information in the struct.  | NA      |

### ScreenWindow Struct Information

| Field  | Type          | Description                     | Remarks |
|--------|---------------|---------------------------------|---------|
| policy | String        | Identifies policy information in the struct. | NA      |
| value  | List\<String> | Identifies value information in the struct.  | NA      |

### CountryCode Struct Information

| Field  | Type          | Description                     | Remarks |
|--------|---------------|---------------------------------|---------|
| policy | String        | Identifies policy information in the struct. | NA      |
| value  | List\<String> | Identifies value information in the struct.  | NA      |

### ExtensionAbilityInfo Struct Information

| Field            | Type                     | Description                                                  | Remarks                                |
|------------------|--------------------------|--------------------------------------------------------------|----------------------------------------|
| name             | String                   | Identifies the logical name of the current extensionAbility. | Supported in stage model.              |
| srcEntrance      | String                   | Identifies the JS code path corresponding to the extensionAbility. | Supported in stage model.              |
| icon             | String                   | Identifies the icon of the extensionAbility.                 | Supported in stage model.              |
| label            | String                   | Identifies the display name of the extensionAbility.         | Supported in stage model.              |
| description      | String                   | Identifies the description of the extensionAbility.          | Supported in stage model.              |
| type             | String                   | Identifies the type of extensionAbility: form, workScheduler, inputMethod, service, accessibility, dataShare, fileShare, wallpaper, backup. | Supported in stage model; currently only parses form and staticSubscriber information; other types (e.g., workScheduler, inputMethod, service, accessibility, dataShare, fileShare, wallpaper, backup) are not yet parsed. |
| permissions      | List\<String>            | Identifies the set of permissions required when called by other applications' abilities. | Supported in stage model.              |
| readPermission   | String                   | Identifies the permission required to read ability data.     | Supported in stage model.              |
| writePermission  | String                   | Identifies the permission required to write data to the ability. | Supported in stage model.              |
| visible          | boolean                  | Identifies whether the extensionAbility can be called by other applications. | Supported in stage model.              |
| skills           | List\<SkillInfo>         | Identifies the set of intent features the extensionAbility can receive. | Supported in stage model.              |
| metadataInfos    | List\<ModuleMetadataInfo> | Identifies the metadata information the extensionAbility can receive. | Supported in stage model.              |
| metadata         | MetaData struct          | Identifies the meta-information of the extensionAbility.     | Assigns metadata information to CustomizeData. |
| uri              | String                   | Identifies the data URI provided by the extensionAbility.   | Supported in stage model.              |
| descriptions     | HashMap\<String, String> | Identifies the description of the extensionAbility in multiple languages. | NA                              |
| labels           | HashMap\<String, String> | Identifies the display name of the extensionAbility in multiple languages. | NA                             |

### SkillInfo Struct Information

| Field         | Type                | Description                   | Remarks |
|---------------|---------------------|-------------------------------|---------|
| actions       | List\<String>       | Identifies the set of action values for intents that can be received. | NA      |
| entities      | List\<String>       | Identifies the set of meta-ability categories for intents that can be received. | NA      |
| domainVerify  | boolean             | Indicates whether the ability supports domain verification. true: supported; false: not supported. | NA      |

### UriInfo Struct Information

| Field          | Type   | Description                     | Remarks |
|----------------|--------|---------------------------------|---------|
| schema         | String | Identifies the schema information of ModuleUriInfo. | NA      |
| host           | String | Identifies the host information of ModuleUriInfo. | NA      |
| port           | String | Identifies the port information of ModuleUriInfo. | NA      |
| pathStartWith  | String | Identifies the path prefix of ModuleUriInfo. | NA      |
| pathRegex      | String | Identifies the path regex information of ModuleUriInfo. | NA      |
| path           | String | Identifies the path information of ModuleUriInfo. | NA      |
| type           | String | Identifies the type of ModuleUriInfo. | NA      |

### AbilityFormInfo Struct Information

| Field                | Type                     | Description                                                         | Remarks        |
|----------------------|--------------------------|---------------------------------------------------------------------|----------------|
| name                 | String                   | Identifies the name of the forms.                                   | NA             |
| type                 | String                   | Identifies the type of the card.                                   | NA             |
| updateEnabled        | boolean                  | Indicates whether the card supports scheduled refresh. true: supported; false: not supported. | NA             |
| scheduledUpdateTime  | String                   | Identifies the peak refresh time of the card, using 24-hour format, precise to minutes. | NA             |
| updateDuration       | int                      | Identifies the refresh frequency of the card, in 30-minute increments. | NA             |
| supportDimensions    | List\<String>            | Identifies the card appearance specifications: "1 * 2", "2 * 2", "2 * 4", "4 * 4". | NA             |
| defaultDimension     | String                   | Identifies the default appearance specification of the card, must be one of the values in supportDimensions. | NA             |
| MetaData             | MetaData                 | Identifies custom information of the card.                          | NA             |
| description          | String                   | Identifies the description of the forms.                           | Added in stage model. |
| src                  | String                   | Identifies the UI code corresponding to the JS card.               | NA             |
| windowInfo           | ModuleWindowInfo struct  | Identifies the window of the ability form.                          | NA             |
| isDefault            | boolean                  | Indicates whether the card is the default card. Each HAP can have only one default card. true: default card; false: non-default card. | NA             |
| colorMode            | String                   | Identifies the color mode of the card: auto, dark, or light.        | NA             |
| formConfigAbility    | String                   | Identifies the name of the ability for card adjustment.             | NA             |
| formVisibleNotify    | String                   | Indicates whether the card is allowed to use visibility notifications. | NA             |
| providerAbility      | String                   | Identifies the ability or extension name where the card provider resides.<br/>1. FA model: If the card is configured in a service-type ability, providerAbility is set to mainAbility.<br/>2. FA model: If the card is configured in a Page-type Ability, providerAbility is set to the current Ability.<br/>3. FA model: If mainAbility is not configured, providerAbility is set to the first page Ability in the HAP package, prioritizing system.home.<br/>4. Stage model (following the above rules), providerAbility is set to mainElement. | NA |
| descriptions         | HashMap\<String, String> | Identifies the description of the ability in multiple languages.    | NA             |

### CommonEvent Struct Information

| Field      | Type          | Description                                                                 | Remarks |
|------------|---------------|-----------------------------------------------------------------------------|---------|
| name       | String        | Identifies the class name corresponding to the current static common event. | Retrieved from staticSubscriber-type Extension in Stage model. |
| permission | String        | Identifies the permission required to implement this static common event.   | Retrieved from staticSubscriber-type Extension in Stage model. |
| data       | List\<String> | Identifies the additional data array required for the current static common event. | Retrieved from staticSubscriber-type Extension in Stage model. |
| type       | List\<String> | Identifies the category array for the current static common event.         | Retrieved from staticSubscriber-type Extension in Stage model. |
| events     | List\<String> | Identifies the set of event values for intents that can be received.       | Retrieved from staticSubscriber-type Extension in Stage model. |

### DependencyItem Struct Information

| Field        | Type   | Description           | Remarks |
|--------------|--------|-----------------------|---------|
| bundleName   | String | The bundleName of the shared package. | NA      |
| moduleName   | String | The moduleName of the shared package. | NA      |
| versionCode  | String | The version number of the shared package. | NA      |

### ModuleAtomicService Struct Information

| Field         | Type               | Description           | Remarks |
|---------------|--------------------|-----------------------|---------|
| preloadItems  | list\<PreloadItem> | Preload objects.      | NA      |

### PreloadItem Struct Information

| Field        | Type   | Description           | Remarks |
|--------------|--------|-----------------------|---------|
| moduleName   | String | The module name to preload. | NA      |

### DeviceConfig Struct Information

| Field                           | Type    | Description                                                                 | Remarks |
|---------------------------------|---------|-----------------------------------------------------------------------------|---------|
| targetReqSdk                   | String  | Identifies the target requested SDK version of the application's DeviceConfig. | NA      |
| compatibleReqSdk               | String  | Identifies the compatible requested SDK version of the application's DeviceConfig. | NA      |
| jointUserid                    | String  | Identifies the jointUserid of the application's DeviceConfig.               | NA      |
| process                        | String  | Identifies the process of the application's DeviceConfig.                  | NA      |
| arkFlag                        | String  | Identifies the arkFlag of the application's DeviceConfig.                  | NA      |
| targetArkVersion               | String  | Identifies the targetArkVersion of the application's DeviceConfig.         | NA      |
| compatibleArkVersion           | String  | Identifies the compatible ArkVersion of the application's DeviceConfig.    | NA      |
| directLaunch                   | boolean | Identifies the direct launch of the application's DeviceConfig.            | NA      |
| distributedNotificationEnabled | boolean | Identifies the distributedNotificationEnabled of the application's AppJson. true: enables distributed notifications; false: disables distributed notifications. | NA      |

### DefPermission Struct Information

| Field           | Type                     | Description                                      | Remarks |
|-----------------|--------------------------|--------------------------------------------------|---------|
| name            | String                   | Identifies the name of the DefPermission.        | NA      |
| grantMode       | String                   | Identifies the grantMode of the DefPermission.   | NA      |
| group           | String                   | Identifies the group of the DefPermission.       | NA      |
| label           | String                   | Identifies the label of the DefPermission.       | NA      |
| description     | String                   | Identifies the description of the DefPermission. | NA      |
| availableScope  | List\<String>            | Identifies the available scope of the DefPermission. | NA      |
| labels          | HashMap\<String, String> | Identifies the labels of the DefPermission in multiple languages. | NA      |
| descriptions    | HashMap\<String, String> | Identifies the descriptions of the DefPermission in multiple languages. | NA      |

### DefinePermission Struct Information

| Field                   | Type                     | Description                                                                 | Remarks |
|-------------------------|--------------------------|-----------------------------------------------------------------------------|---------|
| name                    | String                   | Identifies the name of the DefinePermission.                                | NA      |
| grantMode               | String                   | Identifies the grantMode of the DefinePermission.                           | NA      |
| availableLevel          | String                   | Identifies the group of the DefinePermission.                               | NA      |
| provisionEnable         | boolean                  | Identifies whether the module-defined permission supports certificate-based permission requests. true: supported; false: not supported. | NA      |
| distributedSceneEnable  | boolean                  | Identifies the distributedSceneEnable of ModuleDefinePermissions. true: supports distributed scenarios; false: does not support distributed scenarios. | NA      |
| label                   | String                   | Identifies the label of the DefinePermission.                               | NA      |
| description             | String                   | Identifies the description of the DefinePermission.                         | NA      |
| descriptions            | HashMap\<String, String> | Identifies the descriptions of the DefinePermission in multiple languages. | NA      |
| labels                  | HashMap\<String, String> | Identifies the labels of the DefinePermission in multiple languages.       | NA      |

### DefPermissionsGroups Struct Information

| Field        | Type    | Description                         | Remarks |
|--------------|---------|-------------------------------------|---------|
| name         | String  | Identifies the name of the DefPermissionGroup. | NA      |
| order        | String  | Identifies the order of the DefPermissionGroup. | NA      |
| icon         | String  | Identifies the icon of the DefPermissionGroup. | NA      |
| label        | String  | Identifies the label of the DefPermissionGroup. | NA      |
| description  | String  | Identifies the description of the DefPermissionGroup. | NA      |
| request      | boolean | Identifies the request of the DefPermissionGroup. | NA      |

### FormInfo Struct Information

| Field          | Type          | Description                     | Remarks |
|---------------|---------------|---------------------------------|---------|
| formEntity    | List\<String> | Identifies the formEntity of formInfo. | NA      |
| minHeight     | String        | Identifies the minimum height of formInfo. | NA      |
| defaultHeight | String        | Identifies the default height of formInfo. | NA      |
| minWidth      | String        | Identifies the minimum width of formInfo. | NA      |
| defaultWidth  | String        | Identifies the default width of formInfo. | NA      |

### ModuleMetadataInfo Struct Information

| Field     | Type    | Description                         | Remarks |
|-----------|---------|-------------------------------------|---------|
| name      | String  | Identifies the name of ModuleMetadataInfo. | NA      |
| value     | String  | Identifies the value of ModuleMetadataInfo. | NA      |
| resource  | String  | Identifies the resource of ModuleMetadataInfo. | NA      |

### ModuleWindowInfo Struct Information

| Field            | Type    | Description                                | Remarks |
|------------------|---------|--------------------------------------------|---------|
| designWidth      | int     | Identifies the design width of the module's used scene. | NA      |
| autoDesignWidth  | boolean | Identifies the autoDesignWidth of ModuleUsedScene. | NA      |
