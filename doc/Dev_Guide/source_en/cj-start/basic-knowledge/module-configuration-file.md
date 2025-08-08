# module.json5 Configuration File

## Configuration File Example

Understand the module.json5 configuration file through an example.

<!--RP1-->

```json
{
  "module": {
    "name": "entry",
    "type": "entry",
    "description": "$string:module_desc",
    "srcEntry": "ohos_app_cangjie_entry.MyAbilityStage",
    "mainElement": "EntryAbility",
    "deviceTypes": [
      "default",
      "tablet"
    ],
    "deliveryWithInstall": true,
    "installationFree": false,
    "pages": "$profile:main_pages",
    "virtualMachine": "ark",
    "appStartup": "$profile:app_startup_config",
    "metadata": [
      {
        "name": "string",
        "value": "string",
        "resource": "$profile:distributionFilter_config"
      }
    ],
    "abilities": [
      {
        "name": "EntryAbility",
        "srcEntry": "ohos_app_cangjie_entry.MainAbility",
        "description": "$string:EntryAbility_desc",
        "icon": "$media:layered_image",
        "label": "$string:EntryAbility_label",
        "startWindow": "$profile:start_window",
        "startWindowIcon": "$media:icon",
        "startWindowBackground": "$color:start_window_background",
        "exported": true,
        "skills": [
          {
            "entities": [
              "entity.system.home"
            ],
            "actions": [
              "ohos.want.action.home"
            ]
          }
        ],
        "continueType": [
          "continueType1"
        ],
        "continueBundleName": [
          "com.example.myapplication1",
          "com.example.myapplication2"
        ]
      }
    ],
    "definePermissions": [
      {
        "name": "ohos.abilitydemo.permission.PROVIDER",
        "grantMode": "system_grant",
        "availableLevel": "system_core",
        "provisionEnable": true,
        "distributedSceneEnable": false,
        "label": "$string:EntryAbility_label"
      }
    ],
    "requestPermissions": [
      {
        "name": "ohos.abilitydemo.permission.PROVIDER",
        "reason": "$string:reason",
        "usedScene": {
          "abilities": [
            "FormAbility"
          ],
          "when": "inuse"
        }
      }
    ],
    "targetModuleName": "feature",
    "targetPriority": 50,
    "querySchemes": [
      "app1Scheme",
      "app2Scheme"
    ],
    "appEnvironments": [
      {
        "name": "name1",
        "value": "value1"
      }
    ],
    "hnpPackages": [
      {
        "package": "hnpsample.hnp",
        "type": "public"
      }
    ],
    "fileContextMenu": "$profile:menu"
  }
}
```

<!--RP1End-->

## Configuration File Tags

The module.json5 configuration file contains the following tags.

**Table 1** module.json5 Configuration File Tag Descriptions

| Attribute Name | Meaning | Data Type | Optional |
| -------- |-------------------| -------- | -------- |
| name | Identifies the name of the current Module, ensuring uniqueness across the application. Naming rules:<br/>- Composed of letters, numbers, and underscores, starting with a letter.<br/>- Maximum length of 31 bytes. | String | This tag is mandatory. |
| type | Identifies the type of the current Module. Supported values:<br/>- entry: The main module of the application.<br/>- feature: Dynamic feature module of the application.<br/>- har: Static shared package module.<br/>- shared: Dynamic shared package module. | String | This tag is mandatory. |
| srcEntry | Identifies the class path of the entry UIAbility or ExtensionAbility corresponding to the current Module. Must point to the same UIAbility or ExtensionAbility as the mainElement field. Value is a string not exceeding 127 bytes. | String | This tag is optional, default is empty. |
| description | Describes the current Module's functionality and purpose. Value is a string not exceeding 255 bytes, can use string resource indexing format. | String | This tag is optional, default is empty. |
| <!--DelRow-->process | Identifies the process name of the current Module. Value is a string not exceeding 31 bytes. If process is configured under the HAP tag, all UIAbility, DataShareExtensionAbility, and ServiceExtensionAbility of this Module run in this process.<br/>**Note:**<br/>Effective when [multi-instance privilege](https://docs.openharmony.cn/pages/v5.1/zh-cn/device-dev/subsystems/subsys-app-privilege-config-guide.md) is enabled, third-party app configurations are not effective. | String | This tag is optional, default is the bundleName under the app tag in app.json5. |
| mainElement | Identifies the name of the entry UIAbility or ExtensionAbility of the current Module. Must point to the same UIAbility or ExtensionAbility as the srcEntry field. Value is a string not exceeding 255 bytes. | String | This tag is optional, default is empty. |
| [deviceTypes](#devicetypes-tag) | Identifies the types of devices the current Module can run on.<br/>**Note:**<br/>When multiple modules exist, configurations can differ but must include the device type to be installed for proper operation. | String Array | This tag is mandatory. |
| deliveryWithInstall | Indicates whether the current Module is installed when the user actively installs, i.e., whether the HAP corresponding to this Module is installed with the application.<br/>- true: Installed with the application.<br/>- false: Not installed with the application. | Boolean | This tag is mandatory. |
| installationFree | Indicates whether the current Module supports installation-free features.<br/>- true: Supports installation-free features and meets constraints.<br/>- false: Does not support installation-free features.<br/>**Note:**<br/>When [bundleType](./app-configuration-file.md#configuration-file-tags) is atomic service, this field must be true. Otherwise, it must be false. | Boolean | This tag is mandatory. |
| [pages](#pages-tag) | Identifies the profile resource of the current Module, used to list page information. Value is a string not exceeding 255 bytes. | String | In scenarios with UIAbility, this tag is mandatory. |
| [metadata](#metadata-tag) | Identifies custom metadata of the current Module, configurable via resource references for [distributionFilter](#distributionfilter-tag), [shortcuts](#shortcuts-tag), etc. Only effective for the current Module, UIAbility, and ExtensionAbility. | Object Array | This tag is optional, default is empty. |
| [abilities](#abilities-tag) | Identifies the configuration information of UIAbility in the current Module, only effective for the current UIAbility. | Object Array | This tag is optional, default is empty. |
| [extensionAbilities](#extensionabilities-tag) | Identifies the configuration information of ExtensionAbility in the current Module, only effective for the current ExtensionAbility. | Object Array | This tag is optional, default is empty. |
| <!--DelRow-->[definePermissions](#definepermissions-tag) | Identifies permissions defined by system resource hap, does not support custom app permissions. | Object Array | This tag is optional, default is empty. |
| [requestPermissions](../../security/AccessToken/cj-declare-permissions.md#declare-permissions-in-configuration-file)| Identifies the set of permissions the current app needs to request from the system at runtime. | Object Array | This tag is optional, default is empty. |
| [testRunner](#testrunner-tag) | Identifies the configuration of the test framework for testing the current Module. | Object | This tag is optional, default is empty. |
| [dependencies](#dependencies-tag)| Identifies the list of shared libraries the current module depends on at runtime. | Object Array | This tag is optional, default is empty. | | Integer | This tag is optional, default is 1. |
| [proxyData](#proxydata-tag) | Identifies the list of data proxies provided by the current Module. | Object Array | This tag is optional, default is empty. |
| isolationMode | Identifies the multi-process configuration of the current Module. Supported values:<br/>- nonisolationFirst: Prefer running in non-independent processes.<br/>- isolationFirst: Prefer running in independent processes.<br/>- isolationOnly: Only run in independent processes.<br/>- nonisolationOnly: Only run in non-independent processes.<br/>**Note:**<br/>1. Only 2in1 and tablet devices support setting the current Module to independent processes.<br/>2. This field only applies to HAP. | String | This tag is optional, default is nonisolationFirst. |
| generateBuildHash | Indicates whether the current HAP generates a hash value via the packaging tool. When true, if the app's versionCode remains unchanged during system OTA upgrades, the hash value can determine if the app needs an upgrade.<br/>This field is only enabled when the generateBuildHash field in [app.json5 file](./app-configuration-file.md) is false.<br/>**Note:**<br/>This field only applies to pre-installed apps. | Boolean | This tag is optional, default is false. |
| compressNativeLibs | During HAP packaging, this field indicates whether libs libraries are packaged into HAP in compressed storage.<br/>- true: libs libraries are stored compressed.<br/>- false: libs libraries are stored uncompressed. | Boolean | This tag is optional, default is false during HAP packaging. |
| libIsolation | Whether to generate a module-named directory under libs to store .so files, distinguishing .so files of different HAPs in the same app to prevent conflicts.<br/>- true: .so files of the current HAP are stored in a module-named path under libs.<br/>- false: .so files of the current HAP are stored directly in libs. | Boolean | This tag is optional, default is false. |
| fileContextMenu | Identifies the right-click menu configuration of the current HAP. Value is a string not exceeding 255 bytes.<br/>**Note:**<br/>Only effective on 2in1 devices. | String | This tag is optional, default is empty. |
| querySchemes | Identifies the URL schemes allowed for the current app to perform jump queries. Only entry-type modules can configure, up to 50, each string not exceeding 128 bytes. | String Array | This tag is optional, default is empty. | | String | This tag is optional, default is empty. |
| [appEnvironments](#appenvironments-tag) | Identifies the app environment variables configured for the current module. Only entry and feature modules can configure. | Object Array | This tag is optional, default is empty. |
| appStartup | Identifies the startup framework configuration path of the current Module, effective in Entry-type HAP and HAR. | String | This tag is optional, default is empty. |
| [hnpPackages](#hnppackages-tag) | Identifies the Native package information included in the current app. Only entry-type modules can configure. | Object Array | This tag is optional, default is empty. |
| abilitySrcEntryDelegator | Identifies the name of the UIAbility the current Module needs to redirect to, used with abilityStageSrcEntryDelegator to specify the target object.<br/>**Note:**<br/>1. Supported from API version 17.<br/>2. Not effective when UIAbility is started via [startAbilityByCall](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant).<br/>3. Not supported in HAR configuration files or redirecting to HAR UIAbility. | String | This tag is optional, default is empty. |
| abilityStageSrcEntryDelegator | Identifies the Module name (cannot be the current Module name) of the UIAbility the current Module needs to redirect to, used with abilitySrcEntryDelegator to specify the target object.<br/>**Note:**<br/>1. Supported from API version 17.<br/>2. Not effective when UIAbility is started via [startAbilityByCall](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant).<br/>3. Not supported in HAR configuration files or redirecting to HAR UIAbility. | String | This tag is optional, default is empty. |

## deviceTypes Tag

**Table 2** deviceTypes Tag Description
<!--RP2-->
| Device Type | Enum Value | Description |
| -------- | -------- | -------- |
| Tablet | tablet | - |
| 2in1 | 2in1 | 2in1 devices, primarily interacted with via multi-window, multi-task, and keyboard/mouse operations, maximizing productivity. |
| Default Device | default | Devices supporting all system capabilities. |
<!--RP2End-->

deviceTypes Example:

```json
{
  "module": {
    "name": "myHapName",
    "type": "feature",
    "deviceTypes" : [
       "tablet"
    ]
  }
}
```

## pages Tag

This tag is a profile file resource used to specify the configuration file describing page information.

```json
{
  "module": {
    // ...
    "pages": "$profile:main_pages", // Configured via resource file under profile
  }
}
```

Define the configuration file main_pages.json under resources/base/profile in the development view, where "main_pages" can be customized but must match the pages tag specification. The file lists page information in the current app component, including routing and window display configurations.

**Table 3** pages Tag Description

| Attribute Name | Meaning | Data Type | Optional |
| -------- |-----------| -------- | -------- |
| src | Identifies routing information for all pages in the current Module, including page paths and names. Page paths are relative to src/main/cangjie of the current Module. Value is a string array, each element representing a page. | String Array | This tag is mandatory. |
| window | Identifies configurations related to display windows. | Object | This tag is optional, default is empty. |

**Table 4** window Tag Description

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- |-----------------|
| designWidth | Identifies the baseline width for page design. Elements are scaled based on actual device width. | Numeric | Optional, default is 720.px. |
| autoDesignWidth | Indicates whether the baseline width is auto-calculated. When true, designWidth is ignored, and baseline width is calculated from device width and screen density. When false, baseline width is designWidth. | Boolean | Optional, default is false. |

```json
{
  "src": [
    "pages/index/mainPage",
    "pages/second/payment",
    "pages/third/shopping_cart",
    "pages/four/owner"
  ],
  "window": {
    "designWidth": 720,
    "autoDesignWidth": false
  }
}
```

## metadata Tag

This tag identifies custom metadata of the HAP, with an array value containing name, value, and resource sub-tags.

**Table 5** metadata Tag Description

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| name | Identifies the name of the data item. Value is a string not exceeding 255 bytes. | String | This tag is optional, default is empty. |
| value | Identifies the value of the data item. Value is a string not exceeding 255 bytes. | String | This tag is optional, default is empty. |
| resource | Identifies custom user data. Value is a string not exceeding 255 bytes, referencing a resource index, e.g., $profile:shortcuts_config points to /resources/base/profile/shortcuts_config.json. | String | This tag is optional, default is empty. |

Below are two usage scenarios and examples for the metadata tag. Developers can also customize settings as needed.

1. Use metadata to configure default size and position of the main window (in vp). name values and meanings:
    - ohos.ability.window.height: Default height of the main window, value is height.
    - ohos.ability.window.width: Default width of the main window, value is width.
    - ohos.ability.window.left: Default left position of the main window. Value format: alignment +/- offset. Alignment options: center, left, right (default left); offset 0 can be omitted.
    - ohos.ability.window.top: Default top position of the main window. Value format: alignment +/- offset. Alignment options: center, top, bottom (default top). If both alignment and offset are omitted, default stacking rules apply.

2. Use metadata to configure whether to remove the splash screen. Configuration: name is enable.remove.starting.window, value is true or false. true removes the splash screen, false does not (default false).

```json
{
  "module": {
    "metadata": [{
      "name": "module_metadata",
      "value": "a test demo for module metadata",
      "resource": "$profile:shortcuts_config"
    }],

    "abilities": [{
      "metadata": [{
        "name": "ability_metadata",
        "value": "a test demo for ability",
        "resource": "$profile:config_file"
      },
      {
        "name": "ability_metadata_2",
        "value": "a string test",
        "resource": "$profile:config_file"
      },
      {
        "name": "ohos.ability.window.height",
        "value": "987"
      },
      {
        "name": "ohos.ability.window.width",
        "value": "1300"
      },
      {
        "name": "ohos.ability.window.left",
        "value": "right-50"
      },
      {
        "name": "ohos.ability.window.top",
        "value": "center+50"
      },
      {
        "name": "enable.remove.starting.window",
        "value": "true"
      }],
    }],

    "extensionAbilities": [{
      "metadata": [{
        "name": "extensionAbility_metadata",
        "value": "a test for extensionAbility",
        "resource": "$profile:config_file"
      },
      {
        "name": "extensionAbility_metadata_2",
        "value": "a string test",
        "resource": "$profile:config_file"
      }],
    }]
  }
}
```

## abilities Tag

The abilities tag describes the configuration information of UIAbility components, with an array value.**Table 6** Description of the abilities Tag  

| Attribute Name | Meaning | Data Type | Optional |  
|----------|---------------| -------- | -------- |  
| srcEntry  | Identifies the class path of the entry UIAbility, with a value being a string not exceeding 127 bytes. | String | This tag cannot be omitted. |  
| [launchType](../../application-models/cj-uiability-launch-type.md) | Identifies the launch mode of the current UIAbility component. Supported values are as follows:<br/>-&nbsp;multiton: Multi-instance mode, where a new instance is created each time it is launched.<br/>-&nbsp;singleton: Single-instance mode, where a new instance is created only on the first launch.<br/>-&nbsp;specified: Specified-instance mode, where the developer decides at runtime whether to create a new instance.<br/>-&nbsp;standard: Former name for multiton, with the same effect as multi-instance mode. | String | This tag is optional, defaulting to "singleton". |  
| description | Identifies the description of the current UIAbility component. Developers can use this field to describe the component's functionality and purpose, with a value being a string not exceeding 255 bytes. A resource index for the description is recommended to support multilingualism. | String | This tag is optional, defaulting to empty. |  
| icon  | Identifies the [icon](../../application-models/cj-application-component-configuration-stage.md#generation-mechanism) of the current UIAbility component, with a value being the index of the icon resource file. | String | This tag is optional, defaulting to empty. |  
| label | Identifies the [name](../../application-models/cj-application-component-configuration-stage.md#generation-mechanism) displayed to users for the current UIAbility component. A resource index for the name is recommended to support multilingualism, with a value being a string not exceeding 255 bytes. | String | This tag is optional, defaulting to empty. |  
| permissions | Identifies the custom permissions of the current UIAbility component. Other applications accessing this UIAbility must request the corresponding permissions.<br/>Each array element is a permission name, formatted in reverse domain notation (not exceeding 255 bytes), with values being system-predefined permissions. | String Array | This tag is optional, defaulting to empty. |  
| [metadata](#metadata标签) | Identifies the metadata of the current UIAbility component. | Object Array | This tag is optional, defaulting to empty. |  
| exported  | Identifies whether the current UIAbility component can be launched by other applications.<br/>-&nbsp;true: Can be launched by other applications.<br/>-&nbsp;false: Cannot be launched by other applications, only by the same application or applications with the ohos.permission.START_INVISIBLE_ABILITY permission (this permission is only available to system applications).<br/>For example, when set to false, the desktop has this permission and can launch the current UIAbility component by clicking the app icon, shortcut, or push notification, but the aa command-line tool lacks this permission and cannot launch it. | Boolean | This tag is optional, defaulting to false. |  
| continuable | Identifies whether the current UIAbility component supports cross-device migration.<br/>-&nbsp;true: Supports migration.<br/>-&nbsp;false: Does not support migration. | Boolean | This tag is optional, defaulting to false. |  
| [skills](#skills标签)   | Identifies the set of [Want](../../application-models/cj-want-overview.md) features that the current UIAbility component can receive, in array format.<br/>Configuration rules:<br/>-&nbsp;For Entry-type HAPs, the application can configure multiple skills tags with entry capabilities (i.e., configured with ohos.want.action.home and entity.system.home).<br/>-&nbsp;For Feature-type HAPs, only applications can configure skills tags with entry capabilities; services are not allowed to do so. | Object Array | This tag is optional, defaulting to empty. |  
| backgroundModes    | Identifies the collection of long-running tasks for the current UIAbility component, specifying long-running tasks for specific types.<br/>Long-running task types include:<br/>-&nbsp;dataTransfer: Data download, backup, sharing, or transfer over a network/peer device.<br/>-&nbsp;audioPlayback: Audio playback.<br/>-&nbsp;audioRecording: Audio recording.<br/>-&nbsp;location: Positioning, navigation.<br/>-&nbsp;bluetoothInteraction: Bluetooth scanning, connection, transfer (wearables).<br/>-&nbsp;multiDeviceConnection: Multi-device interconnection.<br/>-&nbsp;taskKeeping: Computation. | String Array | This tag is optional, defaulting to empty. |  
| [startWindow](#startwindow标签)  | Identifies the profile resource for the launch page of the current UIAbility component, with a value being a string not exceeding 255 bytes. If this field is configured, the startWindowIcon and startWindowBackground fields will not take effect.<br/>**Note:** <br/>Supported starting from API version 18. | String | This tag is optional, defaulting to empty. |  
| startWindowIcon    | Identifies the index of the icon resource file for the launch page of the current UIAbility component, with a value being a string not exceeding 255 bytes. | String | This tag cannot be omitted. |  
| startWindowBackground | Identifies the index of the background color resource file for the launch page of the current UIAbility component, with a value being a string not exceeding 255 bytes.<br/>Example value: $color:red. | String | This tag cannot be omitted. |  
| removeMissionAfterTerminate    | Identifies whether the task is removed from the task list after the current UIAbility component is destroyed.<br/>-&nbsp;true: Removes the task after destruction.<br/>-&nbsp;false: Does not remove the task after destruction. | Boolean | This tag is optional, defaulting to false. |  
| orientation | Identifies the orientation when the current UIAbility component is launched, supporting enumerated values or orientation resource indices.<br/>**Supported orientation enumeration values:**<br/>-&nbsp;unspecified: Unspecified direction, determined automatically by the system.<br/>-&nbsp;landscape: Landscape.<br/>-&nbsp;portrait: Portrait.<br/>-&nbsp;follow_recent: Follows the rotation mode of the background window.<br/>-&nbsp;landscape_inverted: Inverted landscape.<br/>-&nbsp;portrait_inverted: Inverted portrait.<br/>-&nbsp;auto_rotation: Rotates with the sensor.<br/>-&nbsp;auto_rotation_landscape: Rotates to landscape with the sensor, including landscape and inverted landscape.<br/>-&nbsp;auto_rotation_portrait: Rotates to portrait with the sensor, including portrait and inverted portrait.<br/>-&nbsp;auto_rotation_restricted: Sensor switch is on, and orientation can rotate with the sensor.<br/>-&nbsp;auto_rotation_landscape_restricted: Sensor switch is on, and orientation can rotate to landscape with the sensor, including landscape and inverted landscape.<br/>-&nbsp;auto_rotation_portrait_restricted: Sensor switch is on, and orientation can rotate to portrait with the sensor, including portrait and inverted portrait.<br/>-&nbsp;locked: Sensor switch is off, and orientation is locked.<br/>-&nbsp;auto_rotation_unspecified: Auto-rotation mode controlled by the switch and determined by the system.<br/>-&nbsp;follow_desktop: Follows the rotation mode of the desktop.<br/>&nbsp;**When configuring an orientation resource index**, the value is a string not exceeding 255 bytes. Example configuration: $string:orientation.<br/>&nbsp;**Note:**<br/>&nbsp;-&nbsp;Support for configuring orientation resource indices starts from API version 14. | String | This tag is optional, defaulting to unspecified. |  
| supportWindowMode  | Identifies the window modes supported by the current UIAbility component. Supported values are as follows:<br/>-&nbsp;fullscreen: Full-screen mode.<br/>-&nbsp;split: Split-screen mode.<br/>-&nbsp;floating: Floating window mode. | String Array | This tag is optional, defaulting to ["fullscreen",&nbsp;"split",&nbsp;"floating"]. |  
| <!--DelRow-->priority | Identifies the priority of the current UIAbility component. During [implicit queries](../../application-models/cj-explicit-implicit-want-mappings.md), higher priority places the UIAbility higher in the returned list. The value ranges from 0 to 10, with higher numbers indicating higher priority.<br/>**Note:**<br/>Configuration by third-party applications is ineffective; this configuration is only valid for system applications. | Integer | This tag is optional, defaulting to 0. |  
| maxWindowRatio | Identifies the maximum aspect ratio supported by the current UIAbility component. The minimum value for this tag is 0. | Number | This tag is optional, defaulting to the maximum aspect ratio supported by the platform. |  
| minWindowRatio | Identifies the minimum aspect ratio supported by the current UIAbility component. The minimum value for this tag is 0. | Number | This tag is optional, defaulting to the minimum aspect ratio supported by the platform. |  
| maxWindowWidth | Identifies the maximum window width supported by the current UIAbility component, in vp units.<br/>The minimum value is minWindowWidth, and the maximum value is the maximum window width supported by the platform. | Number | This tag is optional, defaulting to the maximum window width supported by the platform. |  
| minWindowWidth | Identifies the minimum window width supported by the current UIAbility component, in vp units.<br/>The minimum value is the minimum window width supported by the platform, and the maximum value is maxWindowWidth. | Number | This tag is optional, defaulting to the minimum window width supported by the platform. |  
| maxWindowHeight    | Identifies the maximum window height supported by the current UIAbility component, in vp units.<br/>The minimum value is minWindowHeight, and the maximum value is the maximum window height supported by the platform. | Number | This tag is optional, defaulting to the maximum window height supported by the platform. |  
| minWindowHeight    | Identifies the minimum window height supported by the current UIAbility component, in vp units.<br/>The minimum value is the minimum window height supported by the platform, and the maximum value is maxWindowHeight. | Number | This tag is optional, defaulting to the minimum window height supported by the platform. |  
| <!--DelRow-->excludeFromMissions | Identifies whether the current UIAbility component appears in the recent tasks list.<br/>-&nbsp;true: Does not appear in the task list.<br/>-&nbsp;false: Appears in the task list.<br/>**Note:**<br/>Configuration by third-party applications is ineffective; this configuration is only valid for system applications. To make it effective for system applications, the application privilege AllowAbilityExcludeFromMissions must be requested. For details, see [Application Privilege Configuration Guide](https://docs.openharmony.cn/pages/v5.1/zh-cn/device-dev/subsystems/subsys-app-privilege-config-guide.md). | Boolean | This tag is optional, defaulting to false. |  
| recoverable | Identifies whether the current UIAbility component supports recovery to the original interface after detecting an application fault.<br/>-&nbsp;true: Supports recovery to the original interface after a fault is detected.<br/>-&nbsp;false: Does not support recovery to the original interface after a fault is detected. | Boolean | This tag is optional, defaulting to false. |  
| <!--DelRow-->unclearableMission  | Identifies whether the current UIAbility component can be removed from the recent tasks list.<br/>-&nbsp;true: Cannot be removed from the task list.<br/>-&nbsp;false: Can be removed from the task list.<br/>**Note:**<br/>Configuration by third-party applications is ineffective; this configuration is only valid for system applications. To make it effective for system applications, the application privilege AllowMissionNotCleared must be requested. For details, see [Application Privilege Configuration Guide](https://docs.openharmony.cn/pages/v5.1/zh-cn/device-dev/subsystems/subsys-app-privilege-config-guide.md). | Boolean | This tag is optional, defaulting to false. |  
| isolationProcess   | Identifies whether the component can run in an independent process.<br/>-&nbsp;true: Can run in an independent process.<br/>-&nbsp;false: Cannot run in an independent process.<br/>**Note:**<br/>Only 2-in-1 and tablet devices support setting UIAbility to run in an independent process. | Boolean | This tag is optional, defaulting to false. |  
| excludeFromDock    | Identifies whether the current UIAbility component supports hiding its icon from the dock area.<br/>-&nbsp;true: Hides the icon in the dock area.<br/>-&nbsp;false: Does not hide the icon in the dock area. | Boolean | This tag is optional, defaulting to false. |  
| preferMultiWindowOrientation   | Identifies the multi-window layout orientation of the current UIAbility component:<br/>-&nbsp;default: Default value, no parameter configuration by default, recommended for other application types.<br/>-&nbsp;portrait: Multi-window layout orientation is vertical, recommended for vertical game applications.<br/>-&nbsp;landscape: Multi-window layout orientation is horizontal, supporting horizontal floating windows and split-screen modes, recommended for horizontal game applications.<br/>-&nbsp;landscape_auto: Multi-window layout can dynamically change to horizontal, requiring use with the APIs enableLandScapeMultiWindow/disableLandScapeMultiWindow, recommended for video applications. | String | This tag is optional, defaulting to default. |  
| continueType   | Identifies the cross-device migration type of the current UIAbility component. | String Array | This tag is optional, defaulting to the current component's name. |  
| continueBundleName | Identifies the list of other application names supported for cross-device migration by the current application.<br/>**Note:**<br/>Cannot be configured as the current application's package name; used only for cross-package migration.<br/>Supported starting from API version 13. | String Array | This tag is optional, defaulting to empty. |  
| process   | Identifies the process tag of the component.<br/>**Note:**<br/>Only effective on [2-in-1](./module-configuration-file.md#devicetypes-tag) devices. UIAbility components and ExtensionAbility components with type embeddedUI run in the same process when their tags match. Supported starting from API version 14. | String | This tag is optional, defaulting to empty. |  

Example of abilities:  

<!--RP3-->

```json
{
  "abilities": [{
    "name": "EntryAbility",
    "srcEntry": "ohos_app_cangjie_entry.MainAbility",
    "launchType":"singleton",
    "description": "$string:description_main_ability",
    "icon": "$media:layered_image",
    "label": "Login",
    "permissions": [],
    "metadata": [],
    "exported": true,
    "continuable": true,
    "skills": [{
      "actions": ["ohos.want.action.home"],
      "entities": ["entity.system.home"],
      "uris": []
    }],
    "backgroundModes": [
      "dataTransfer",
      "audioPlayback",
      "audioRecording",
      "location",
      "bluetoothInteraction",
      "multiDeviceConnection",
      "wifiInteraction",
      "voip",
      "taskKeeping"
    ],
    "startWindow": "$profile:start_window",
    "startWindowIcon": "$media:icon",
    "startWindowBackground": "$color:red",
    "removeMissionAfterTerminate": true,
    "orientation": "$string:orientation",
    "supportWindowMode": ["fullscreen", "split", "floating"],
    "maxWindowRatio": 3.5,
    "minWindowRatio": 0.5,
    "maxWindowWidth": 2560,
    "minWindowWidth": 1400,
    "maxWindowHeight": 300,
    "minWindowHeight": 200,
    "excludeFromMissions": false,
    "unclearableMission": false,
    "excludeFromDock": false,
    "preferMultiWindowOrientation": "default",
    "isolationProcess": false,
    "continueType": [
      "continueType1",
      "continueType2"
    ],
    "continueBundleName": [
      "com.example.myapplication1",
      "com.example.myapplication2"
    ],
    "process": ":processTag"
  }]
}
```

<!--RP3End-->

## skills Tag  

This tag identifies the [Want](../../application-models/cj-want-overview.md) features that a UIAbility or ExtensionAbility component can receive.  

**Table 7** Description of the skills Tag  

| Attribute Name | Meaning | Data Type | Optional |  
| -------- | -------- | -------- | -------- |  
| actions | Identifies the set of Action values that can be received, typically system-predefined action values, but custom actions are also allowed.<br>It is not recommended to configure multiple actions in a single skill, as this may prevent matching the expected scenario. | String Array | This tag is optional, defaulting to empty. |  
| entities | Identifies the set of Entity values that can be received.<br>It is not recommended to configure multiple entities in a single skill, as this may prevent matching the expected scenario. | String Array | This tag is optional, defaulting to empty. |  
| uris | Identifies the set of URIs (Uniform Resource Identifier) that match the Want's URI. The maximum number of array elements is 512. | Object Array | This tag is optional, defaulting to empty. |  
| permissions | Identifies the custom permissions of the current UIAbility component. Other applications accessing this UIAbility must request the corresponding permissions.<br/>Each array element is a permission name, formatted in reverse domain notation (not exceeding 255 bytes), with values being system-predefined permissions. | String Array | This tag is optional, defaulting to empty. |  
| domainVerify | Identifies whether domain verification is enabled.<br/>-&nbsp;true: Domain verification is enabled.<br/>-&nbsp;false: Domain verification is not enabled. | Boolean | This tag is optional, defaulting to false. |  

**Table 8** Description of uris Tags

> **Note:**
>
> The following string-type fields do not support configuration via resource indexing (`$string`).

| Attribute Name | Description | Data Type | Optional |
| -------- |-----------------| -------- | -------- |
| scheme | Identifies the protocol name part of the URI. Common values include http, https, file, ftp, etc.<br/>**Note:**<br/>Starting from API 18, this field is case-insensitive when participating in implicit Want matching. | String | Can be omitted if only `type` is configured in uris; otherwise, it cannot be omitted. The default value is empty. |
| host | Identifies the host address part of the URI. This field takes effect only when `scheme` is configured. Common formats:<br/>- Domain name format, e.g., example.com.<br/>- IP address format, e.g., 10.10.10.1.<br/>**Note:**<br/>Starting from API 18, this field is case-insensitive when participating in implicit Want matching. | String | This tag can be omitted. The default value is empty. |
| port | Identifies the port part of the URI. For example, the default port for http is 80, https is 443, and ftp is 21. This field takes effect only when both `scheme` and `host` are configured. | String | This tag can be omitted. The default value is empty. |
| path \| pathStartWith \| pathRegex | Identifies the path part of the URI. Only one of `path`, `pathStartWith`, or `pathRegex` can be configured. `path` indicates exact matching of the URI path with the Want path, `pathStartWith` indicates prefix matching, and `pathRegex` indicates regular expression matching. This field takes effect only when both `scheme` and `host` are configured. | String | This tag can be omitted. The default value is empty. |
| type | Identifies the data type to match with the Want, using MIME (Multipurpose Internet Mail Extensions) type specifications and UniformDataType type specifications. Can be configured alongside `scheme` or separately. | String | This tag can be omitted. The default value is empty. |
| utd | Identifies the standardized data type to match with the Want, suitable for scenarios like sharing. | String | This tag can be omitted. The default value is empty. |
| maxFileSupported | For specified file types, indicates the maximum number of files that can be received or opened at once, suitable for scenarios like sharing. Must be used in conjunction with `utd`. | Integer | This tag can be omitted. The default value is 0. |
| linkFeature | Identifies the type of functionality provided by the URI (e.g., file opening, sharing, navigation), used for inter-application jumps. The value is a string not exceeding 127 bytes, and Chinese characters are not supported. The number of `linkFeature` declarations in the same Bundle cannot exceed 150. For details, see the `linkFeature` tag description. | String | This tag can be omitted. The default value is empty. |

Example of skills:

```json
{
  "abilities": [
    {
      "skills": [
        {
          "actions": [
            "ohos.want.action.home"
          ],
          "entities": [
            "entity.system.home"
          ],
          "uris": [
            {
              "scheme":"http",
              "host":"example.com",
              "port":"80",
              "path":"path",
              "type": "text/*",
              "linkFeature": "Login"
            }
          ],
          "permissions": [],
          "domainVerify": false
        }
      ]
    }
  ]
}
```

## extensionAbilities Tag

Describes the configuration information of extensionAbilities. The tag value is an array, and the configurations under this tag apply only to the current extensionAbilities.

**Table 9** Description of extensionAbilities Tags

| Attribute Name | Description | Data Type | Optional |
| -------- |------------------| -------- | -------- |
| name | Identifies the name of the current ExtensionAbility component, ensuring uniqueness within the application. The value is a string not exceeding 127 bytes. | String | This tag cannot be omitted. |
| srcEntry | Identifies the class path corresponding to the current ExtensionAbility component. The value is a string not exceeding 127 bytes. | String | This tag cannot be omitted. |
| description | Describes the current ExtensionAbility component. Developers can use this field to describe the component's functionality and purpose. The value is a string not exceeding 255 bytes, which can be a resource index for multilingual support. | String | This tag can be omitted. The default value is empty. |
| icon | Identifies the icon of the current ExtensionAbility component. The value is a resource file index. If the ExtensionAbility component is configured as `mainElement`, this tag must be configured. | String | This tag can be omitted. The default value is empty. |
| label | Identifies the display name of the current ExtensionAbility component for users. The value is a resource index for multilingual support, with a string length not exceeding 255 bytes. If the ExtensionAbility is configured as the `mainElement` of the current Module, this tag must be configured and must be unique within the application. | String | This tag can be omitted. The default value is empty. |
| type | Identifies the type of the current ExtensionAbility component. Supported values include:<br/>- `form`: Card ExtensionAbility.<br/>- `workScheduler`: Delayed task ExtensionAbility.<br/>- `inputMethod`: Input method ExtensionAbility.<br/>- `accessibility`: Accessibility ExtensionAbility.<br/>- `staticSubscriber`: Static broadcast ExtensionAbility.<br/>- `wallpaper`: Wallpaper ExtensionAbility.<br/>- `backup`: Data backup ExtensionAbility.<br/>- `window`: This ExtensionAbility creates a window during startup, providing interface development capabilities for developers. The developed interface can be integrated into other applications' windows via the `UIExtensionComponent` control.<br/>- `thumbnail`: File thumbnail ExtensionAbility, allowing developers to provide thumbnails for custom file types.<br/>- `preview`: This ExtensionAbility displays parsed files in a window, which can be integrated into other applications' windows.<br/>- `print`: Printing framework ExtensionAbility.<br/>- `push`: Push ExtensionAbility.<br/>- `driver`: Driver framework ExtensionAbility. Applications configured with this type are considered driver applications, which are installed/uninstalled/restored without distinguishing users. For example, creating a sub-user will automatically install existing driver applications from the main user, and uninstalling a driver application on a sub-user will also uninstall it on the main user.<br/>- `remoteNotification`: Remote notification ExtensionAbility.<br/>- `remoteLocation`: Remote location ExtensionAbility.<br/>- `voip`: VoIP ExtensionAbility.<br/>- `action`: Custom operation template ExtensionAbility, providing developers with UIExtension-based custom operation templates.<br/>- `embeddedUI`: Embedded UI ExtensionAbility, providing cross-process UI embedding capabilities.<br/>- `insightIntentUI`: Provides developers with the ability to be invoked by Xiaoyi's intent to display content in a window.<br/>- `ads`: Ad ExtensionAbility, used with the `AdComponent` control to display ad pages in other applications. Only for device manufacturers.<br/>- `photoEditor`: Photo editing ExtensionAbility, providing developers with UIExtension-based photo editing templates.<br/>- `appAccountAuthorization`: App account authorization ExtensionAbility, handling account authorization requests such as login authorization.<br/>- `autoFill/password`: Account and password auto-fill ExtensionAbility, supporting data saving and filling.<br/>- `hms/account`: App account management ExtensionAbility.<br/>- `autoFill/smart`: Context-aware auto-fill ExtensionAbility, supporting data saving and filling.<br/>- `uiService`: Popup service component, creating a window during startup and supporting bidirectional communication.<br/>- `statusBarView`: One-step access ExtensionAbility.<br/>- `recentPhoto`: Recent photo recommendation ExtensionAbility.<br/>**Note:**<br/>Types like `service`, `adsService`, `sys/commonUI`, `fileAccess`, `sysDialog`, `sysPicker`, `dataShare`, and `uiService` are only effective for system applications, not third-party applications. | String | This tag cannot be omitted. |
| permissions | Identifies custom permissions for the current ExtensionAbility component. Other applications must request these permissions to access the component.<br/>Each array element is a permission name, typically in reverse domain name format (max 255 bytes). Values can be [system predefined permissions](../../security/AccessToken/cj-app-permissions.md). | String Array | This tag can be omitted. The default value is empty. |
| readPermission | Identifies the permission required to read data from the current ExtensionAbility component. The value is a string not exceeding 255 bytes. Only applicable when the ExtensionAbility type is `dataShare`. | String | This tag can be omitted. The default value is empty. |
| writePermission | Identifies the permission required to write data to the current ExtensionAbility component. The value is a string not exceeding 255 bytes. Only applicable when the ExtensionAbility type is `dataShare`. | String | This tag can be omitted. The default value is empty. |
| uri | Identifies the data URI provided by the current ExtensionAbility component. The value is a string not exceeding 255 bytes, in reverse domain name format.<br/>**Note:**<br/>This tag cannot be omitted when the ExtensionAbility type is `dataShare`. | String | This tag can be omitted. The default value is empty. |
| skills | Identifies the [Want](../../application-models/cj-want-overview.md) feature set that the current ExtensionAbility component can receive.<br/>Configuration rules: The entry package can configure multiple ExtensionAbilities with entry capabilities (configured with `ohos.want.action.home` and `entity.system.home`). The first ExtensionAbility with a `skills` tag will use its `label` and `icon` as the service or application's `label` and `icon`.<br/>**Note:**<br/>Feature packages for services do not support configuring `skills` tags with entry capabilities.<br/>Feature packages for applications support configuring `skills` tags with entry capabilities. | Array | This tag can be omitted. The default value is empty. |
| [metadata](#metadata-tag) | Identifies metadata for the current ExtensionAbility component.<br/>**Note:**<br/>This tag cannot be omitted when the type is `form`, and must include an object value with `name` as `ohos.extension.form`, whose corresponding `resource` value cannot be omitted and must reference a secondary resource for service cards. | Object Array | This tag can be omitted. The default value is empty. |
| exported | Indicates whether the current ExtensionAbility component can be called by other applications.<br/>- `true`: Can be called by other applications.<br/>- `false`: Cannot be called by other applications, including being unable to be launched via the `aa` tool command. | Boolean | This tag can be omitted. The default value is `false`. |
| extensionProcessMode | Identifies the multi-process instance model of the current ExtensionAbility component. Currently only applies to `UIExtensionAbility` and ExtensionAbilities extended from `UIExtensionAbility`.<br/>- `instance`: Each instance of this ExtensionAbility runs in a separate process.<br/>- `type`: All instances of this ExtensionAbility run in the same process, separate from other ExtensionAbilities.<br/>- `bundle`: All instances of this ExtensionAbility run in the application's unified process, sharing the process with other ExtensionAbilities configured with the `bundle` model.<br/>- `runWithMainProcess`: This ExtensionAbility runs in the application's main process. Only one-step access ExtensionAbilities can be configured with `runWithMainProcess`. | String | This tag can be omitted. The default value is empty. |
| dataGroupIds | Identifies the `dataGroupId` collection of the current ExtensionAbility component. If the application's certificate in the app market includes a `groupIds` field with a `dataGroupId`, the ExtensionAbility component can share directories generated with this `dataGroupId`. The `dataGroupId` must be one configured in the application's signing certificate to take effect. This field is only effective when the ExtensionAbility component has an independent sandbox directory. For details, see [dataGroupId Application Process](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ime-kit-security#section4219152220459). | String Array | This tag can be omitted. The default value is empty. |
| process | Identifies the process tag of the component. Only applicable when the type is `embeddedUI`.<br/>**Note:**<br/>Only effective on [2in1](./module-configuration-file.md#devicetypes-tag) devices. `UIAbility` and `ExtensionAbility` components with the same tag run in the same process. Supported from API version 14. | String | This tag can be omitted. The default value is empty. |

Example of extensionAbilities:

```json
{
  "extensionAbilities": [
    {
      "name": "FormName",
      "srcEntry": "ohos_app_cangjie_entry.MainAbility",
      "icon": "$media:icon",
      "label" : "$string:extension_name",
      "description": "$string:form_description",
      "type": "form",
      "permissions": ["ohos.abilitydemo.permission.PROVIDER"],
      "readPermission": "",
      "writePermission": "",
      "exported": true,
      "uri":"scheme://authority/path/query",
      "skills": [{
        "actions": [],
        "entities": [],
        "uris": [],
        "permissions": []
      }],
      "metadata": [
        {
          "name": "ohos.extension.form",
          "resource": "$profile:form_config",
        }
      ],
      "extensionProcessMode": "instance",
      "dataGroupIds": [
        "testGroupId1"
      ]
    }
  ]
}
```

## shortcuts Tag

The `shortcuts` tag identifies the shortcut information of the application. The tag value is an array containing four sub-tags: `shortcutId`, `label`, `icon`, and `wants`.

Metadata specifies shortcut information, where:
- `name`: Specifies the name of the shortcut, using `ohos.ability.shortcuts` as the identifier.
- `resource`: Specifies the resource location of the shortcut information.

**Table 10** Description of shortcuts Tags

| Attribute Name | Description | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| shortcutId | Identifies the ID of the shortcut. The value is a string not exceeding 63 bytes. **Does not support configuration via resource indexing (`$string`).** | String | This tag cannot be omitted. |
| label | Identifies the label information of the shortcut, i.e., the text description displayed externally. The value is a string not exceeding 255 bytes, which can be descriptive content or a resource index for the label. | String | This tag can be omitted. The default value is empty. |
| icon | Identifies the icon of the shortcut. The value is a resource file index. | String | This tag can be omitted. The default value is empty. |
| [wants](#wants-tag) | Identifies the target `wants` information collection defined within the shortcut. When calling the `startShortcut` interface of `launcherBundleManager`, the first target component in the `wants` tag will be launched. It is recommended to configure only one `wants` element. | Object | This tag can be omitted. The default value is empty. |

1. Configure the `shortcuts_config.json` file in the `/resources/base/profile/` directory.

   ```json
   {
     "shortcuts": [
       {
         "shortcutId": "id_test1",
         "label": "$string:shortcut",
         "icon": "$media:aa_icon",
         "wants": [
           {
             "bundleName": "com.ohos.hello",
             "moduleName": "entry",
             "abilityName": "EntryAbility",
             "parameters": {
               "testKey": "testValue"
             }
           }
         ]
       }
     ]
   }
   ```

2. In the `abilities` tag of the `module.json5` configuration file, configure the `metadata` tag for the UIAbility that requires shortcuts to make the shortcut configuration effective.

   ```json
   {
     "module": {
       // ...
       "abilities": [
         {
           "name": "EntryAbility",
           "srcEntry": "ohos_app_cangjie_entry.MainAbility",
           // ...
           "skills": [
             {
               "entities": [
                 "entity.system.home"
               ],
               "actions": [
                 "ohos.want.action.home"
               ]
             }
           ],
           "metadata": [
             {
               "name": "ohos.ability.shortcuts",
               "resource": "$profile:shortcuts_config"
             }
           ]
         }
       ]
     }
   }
   ```

### wants Tag

This tag identifies the target `wants` information collection defined within the shortcut.

**Table 11** Description of wants Tags

| Attribute Name | Description | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| bundleName | Identifies the target package name of the shortcut. | String | This tag cannot be omitted. |
| moduleName | Identifies the target module name of the shortcut. | String | This tag can be omitted. |
| abilityName | Identifies the target component name of the shortcut. | String | This tag cannot be omitted. |
| parameters | Identifies custom data when launching the shortcut. Only string-type data is supported. Both keys and values support a maximum length of 1024 bytes. | Object | This tag can be omitted. |

Example of data tag:

```json
{
  "wants": [
    {
      "bundleName": "com.ohos.hello",
      "moduleName": "entry",
      "abilityName": "EntryAbility",
      "parameters": {
        "testKey": "testValue"
      }
    }
  ]
}
```

## distributionFilter Tag

This tag defines the distribution strategy for HAPs corresponding to specific device specifications, enabling precise matching during cloud distribution in the app market.

- **Applicable Scenarios:** When a project contains multiple Entries, and the `deviceTypes` configurations of these Entries overlap, this tag is needed for differentiation. For example, if two Entries both support the `tablet` type, this tag is required for differentiation.

   ```json
   // Device types supported by entry1
   {
     "module": {
       "name": "entry1",
       "type": "entry",
       "deviceTypes" : [
         "2in1",
         "table**Table 16** countryCode Tag Description  

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| policy | Identifies the filtering rule for conditional attributes.<br/>-&nbsp;exclude: Indicates the value attributes to be excluded.<br/>-&nbsp;include: Indicates the value attributes to be included. | String | This tag is mandatory. |
| value | Identifies the country/region codes where the application needs to be distributed. | String Array | This tag is mandatory. |

Example:  

1. Define a configuration file under `resources/base/profile` in the development view, named `distributionFilter_config.json` (the filename can be customized).  

   ```json
   {
     "distributionFilter": {
       "screenShape": {
         "policy": "include",
         "value": [
           "circle",
           "rect"
         ]
       },
       "screenWindow": {
         "policy": "include",
         "value": [
           "454*454",
           "466*466"
         ]
       },
       "screenDensity": {
         "policy": "exclude",
         "value": [
           "ldpi",
           "xldpi"
         ]
       },
       "countryCode": { // Supports distribution in China
         "policy": "include",
         "value": [
           "CN"
         ]
       }
     }
   }
   ```

2. Define metadata information in the `module` tag of the `module.json5` configuration file.  

   ```json
   {
     "module": {
       // ...
       "metadata": [
         {
           "name": "ohos.module.distribution",
           "resource": "$profile:distributionFilter_config",
         }
       ]
     }
   }
   ```

## testRunner Tag  

This tag is used to configure the testing framework.  

**Table 17** testRunner Tag Description  

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| name | Identifies the name of the testing framework object. The value is a string with a maximum length of 255 bytes. | String | Mandatory. |
| srcPath | Identifies the code path of the testing framework. The value is a string with a maximum length of 255 bytes. | String | Mandatory. |

Example of the testRunner tag:  

```json
{
  "module": {
    // ...
    "testRunner": {
      "name": "myTestRunnerName",
      "srcPath": "etc/test/TestRunner.ts"
    }
  }
}
```

## dependencies Tag  

This tag identifies the list of shared libraries that the module depends on during runtime.  

**Table 18** dependencies Tag Description  

| Attribute Name | Meaning | Data Type | Optional |
| ----------- | ------------------------------ | -------- | ---------- |
| bundleName | Identifies the bundle name of the shared library that the current module depends on. The value is a string with a length of 7–128 bytes. | String | Optional. Default is empty. |
| moduleName | Identifies the module name of the shared library that the current module depends on. The value is a string with a maximum length of 31 bytes. | String | Mandatory. |
| versionCode | Identifies the version number of the shared library that the current module depends on. The value ranges from 0 to 2147483647. | Number | Optional. Default is empty. |

Example of the dependencies tag:  

```json
{
  "module": {
    "dependencies": [
      {
        "bundleName":"com.share.library",
        "moduleName": "library",
        "versionCode": 10001
      }
    ]
  }
}
```

## proxyData Tag  

This tag identifies the list of data proxies provided by the module. Only applicable to `entry` and `feature` configurations.  

**Table 19** proxyData Tag Description  

| Attribute Name | Meaning | Data Type | Optional |
| ----------- | ------------------------------ | -------- | ---------- |
| uri | Identifies the URI used to access the data proxy. The URIs of different data proxies must be unique and must follow the format `datashareproxy://<current_package_name>/xxx`. The value is a string with a maximum length of 255 bytes. | String | Mandatory. |
| requiredReadPermission | Identifies the permission required to read data from this data proxy. If not configured, other applications cannot use this proxy. For non-system applications, the permission level must be `system_basic` or `system_core`. For system applications, there are no restrictions. Permission levels can be referenced in the [Permission List](../../security/AccessToken/cj-app-permissions.md). The value is a string with a maximum length of 255 bytes. | String | Optional. Default is empty. |
| requiredWritePermission | Identifies the permission required to write data to this data proxy. If not configured, other applications cannot use this proxy. For non-system applications, the permission level must be `system_basic` or `system_core`. For system applications, there are no restrictions. Permission levels can be referenced in the [Permission List](../../security/AccessToken/cj-app-permissions.md). The value is a string with a maximum length of 255 bytes. | String | Optional. Default is empty. |
| [metadata](#metadata-tag) | Identifies the metadata of this data proxy. Only the `name` and `resource` fields are supported. | Object | Optional. Default is empty. |

Example of the proxyData tag:  

```json
{
  "module": {
    "proxyData": [
      {
        "uri":"datashareproxy://com.ohos.datashare/event/Meeting",
        "requiredReadPermission": "ohos.permission.GET_BUNDLE_INFO",
        "requiredWritePermission": "ohos.permission.GET_BUNDLE_INFO",
        "metadata": {
          "name": "datashare_metadata",
          "resource": "$profile:datashare"
        }
      }
    ]
  }
}
```

## appEnvironments Tag  

This tag identifies the application environment variables configured for the module.  

**Table 20** appEnvironments Tag Description  

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| name | Identifies the name of the environment variable. The value is a string with a maximum length of 4096 bytes. | String | Optional. Default is empty. |
| value | Identifies the value of the environment variable. The value is a string with a maximum length of 4096 bytes. | String | Optional. Default is empty. |

Example of the appEnvironments tag:  

```json
{
  "module": {
    "appEnvironments": [
      {
        "name":"name1",
        "value": "value1"
      }
    ]
  }
}
```

## hnpPackages Tag  

This tag identifies the Native software package information included in the application.  

**Table 21** hnpPackages Tag Description  

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| package | Identifies the name of the Native software package. | String | Mandatory. |
| type | Identifies the type of the Native software package. Supported values:<br/>-&nbsp;public: Public type.<br/>-&nbsp;private: Private type. | String | Mandatory. |

Example of hnpPackages:  

```json
{
  "module" : {
    "hnpPackages": [
      {
        "package": "hnpsample.hnp",
        "type": "public"
      }
    ]
  }
}
```

## fileContextMenu Tag  

This tag identifies the right-click menu configuration items for the current HAP. It is a profile file resource used to specify the configuration file describing the right-click menu registered by the application. Only effective on 2-in-1 devices.  

Example of the fileContextMenu tag:  

```json
{
  "module": {
    // ...
    "fileContextMenu": "$profile:menu" // Configured via the resource file under profile
  }
}
```

Define the configuration file `menu.json` under `resources/base/profile` (the filename "menu.json" can be customized and must correspond to the information specified in the `fileContextMenu` tag). The configuration file describes the right-click menu items and response behaviors registered by the current application.  
The root node of the configuration file is named `fileContextMenu`, which is an array of objects, indicating the number of right-click menus registered by the current module. (A single module or application cannot register more than 5 items. If exceeded, only 5 random items will be parsed.)  

**Table 22** fileContextMenu Tag Configuration Description  

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| abilityName | Indicates the name of the ability to be launched for the current right-click menu. | String | Mandatory. |
| menuItem | The information displayed in the right-click menu. Naming suggestions:<br/>Principle 1: [Action] + [App Name], e.g., "Open with {App}" or "Open with {App} ({Plugin} Plugin)" in Chinese; "Open with {App}" or "Open with {App} ({Plugin})" in English.<br/>Principle 2: [Action] + [Purpose], e.g., "Compress to {filename}" or "Convert to {format} with {App}". | Resource ID | Mandatory. |
| menuHandler | An ability can create multiple right-click menus. This field is used to distinguish different right-click menu items triggered by the user. When the user clicks a right-click menu item, this field is passed as a parameter to the right-click menu application. | String | Mandatory. |
| menuContext | Defines the context required to display this menu item, supporting multiple scenarios. The type is an array of objects. | Object Array | Mandatory. |

**Table 23** menuContext Tag Configuration Description  

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| menuKind | Indicates the type of click that triggers the right-click menu. Valid values:<br/>-&nbsp;0: Blank area<br/>-&nbsp;1: File<br/>-&nbsp;2: Folder<br/>-&nbsp;3: File and folder | Number | Mandatory. |
| menuRule | Indicates the method of selecting files or folders that triggers the right-click menu. Valid values:<br/>-&nbsp;single: Single selection<br/>-&nbsp;multi: Multiple selection<br/>-&nbsp;both: Single or multiple selection | String | Only read when `menuKind` is 1 or 2. In this case, it is mandatory. |
| fileSupportType | Indicates that the right-click menu is displayed when the selected file list includes the specified file types.<br/>When this field is set to `["*"]`, the `fileNotSupportType` field will be read.<br/>When this field is set to `[]`, no action is taken. | String Array | Only read when `menuKind` is 1. In this case, it is mandatory. |
| fileNotSupportType | Indicates that the right-click menu is not displayed when the selected file list includes these file types.<br/>Only read when `menuKind` is 1 and `fileSupportType` is `["*"]`. | String Array | Optional. Default is empty. |

Example of the `menu.json` resource file under `resources/base/profile`:  

```json
{
  "fileContextMenu": [
    {
      "abilityName": "EntryAbility",
      "menuItem": "$string:module_desc",
      "menuHandler": "openCompress",
      "menuContext": [
        {
          "menuKind": 0
        },
        {
          "menuKind": 1,
          "menuRule": "both",
          "fileSupportType": [
            ".rar",
            ".zip"
          ],
          "fileNotSupportType": [
            ""
          ]
        },
        {
          "menuKind": 2,
          "menuRule": "single"
        },
        {
          "menuKind": 3
        }
      ]
    }
  ]
}
```

**Response Behavior**  

After an application registers a right-click extension menu, the "More" option appears in the right-click menu in the file manager. Clicking "More" displays the registered `menuItem` list. Clicking any option triggers the file manager to launch the third-party application via `startAbility`. In addition to specifying the package name and ability name of the third-party application, the following fields are passed in the `parameter` of the `want`:  

**Table 24** Description of `parameter` Fields in `want`  

| Parameter Name | Value | Type |
| -------- | -------- | -------- |
| menuHandler | Corresponds to the `menuHandler` value in the registration configuration file. | String |
| uriList | The URI value triggered by the user's right-click on a specific file. If triggered on a blank area, this value is empty. For a single file, the array length is 1. For multiple files, the URIs of all files are passed. | String Array |

## startWindow Tag  

This tag points to a profile file resource used to specify the configuration file for the start page of a UIAbility component. Define the configuration file `start_window.json` under `resources/base/profile`. If this field is configured, the `startWindowIcon` and `startWindowBackground` fields will not take effect. Supported from API version 18.  

**Table 25** startWindow Tag Configuration Description  

| Attribute Name | Meaning | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| startWindowAppIcon | Identifies the resource file index of the start page icon for the current UIAbility component. The value is a string with a maximum length of 255 bytes. | String | Optional. Default is empty. |
| startWindowIllustration | Identifies the resource file index of the start page illustration for the current UIAbility component. The value is a string with a maximum length of 255 bytes. | String | Optional. Default is empty. |
| startWindowBrandingImage | Identifies the resource file index of the start page branding image for the current UIAbility component. The value is a string with a maximum length of 255 bytes. | String | Optional. Default is empty. |
| startWindowBackgroundColor | Identifies the resource file index of the start page background color for the current UIAbility component. The value is a string with a maximum length of 255 bytes. | String | Mandatory. |
| startWindowBackgroundImage | Identifies the resource file index of the start page background image for the current UIAbility component. The value is a string with a maximum length of 255 bytes. | String | Optional. Default is empty. |
| startWindowBackgroundImageFit | Identifies the adaptation method of the start page background image for the current UIAbility component. Supported values:<br/>-&nbsp;Contain: Scale or enlarge while maintaining the aspect ratio, ensuring the image is fully displayed within the boundaries.<br/>-&nbsp;Cover: Scale or enlarge while maintaining the aspect ratio, ensuring the image covers the boundaries.<br/>-&nbsp;Auto: Adaptive display.<br/>-&nbsp;Fill: Scale or enlarge without maintaining the aspect ratio, filling the boundaries.<br/>-&nbsp;ScaleDown: Display while maintaining the aspect ratio, scaling down or remaining unchanged.<br/>-&nbsp;None: Display at original size. | String | Optional. Default is `Cover`. |

Example of the `start_window.json` resource file under `resources/base/profile`:  

```json
{
  "startWindowAppIcon": "$media:icon",
  "startWindowIllustration": "$media:illustration",
  "startWindowBrandingImage": "$media:branding",
  "startWindowBackgroundColor": "$color:background",
  "startWindowBackgroundImage": "$media:background",
  "startWindowBackgroundImageFit": "Cover"
}
``````json
{
  "startWindowAppIcon": "$media:start_window_app_icon",
  "startWindowIllustration": "$media:start_window_illustration",
  "startWindowBrandingImage": "$media:start_window_branding_image",
  "startWindowBackgroundColor": "$color:start_window_back_ground_color",
  "startWindowBackgroundImage": "$media:start_window_back_ground_image",
  "startWindowBackgroundImageFit": "Cover"
}
```

## definePermissions Tag

This tag only supports defining permissions for system resource HAPs and does not support application-defined permissions. For permission definition methods, refer to [System Resource Permission Definition](https://gitee.com/openharmony/utils_system_resources/blob/master/systemres/main/config.json).

**Table 26** definePermissions Tag Description

| Attribute Name | Description | Data Type | Optional |
| -------- | -------- | -------- | -------- |
| name | Identifies the name of the permission. The maximum length of this tag is 255 bytes. | String | Mandatory. |
| grantMode | Specifies the permission granting method, supporting the following two modes:<br/>-&nbsp;system_grant: The permission is automatically granted by the system after installation.<br/>-&nbsp;user_grant: Dynamically requested during use, and the permission can only be used after user authorization. | String | Optional. Default value is system_grant. |
| availableLevel | Specifies the permission restriction category. Possible values include:<br/>-&nbsp;system_core: System core permission.<br/>-&nbsp;system_basic: System basic permission.<br/>-&nbsp;normal: Normal permission. Permissions that all applications are allowed to request. | String | Optional. Default value is normal. |
| provisionEnable | Indicates whether the permission can be requested via certificate, including high-level permissions. Set to true to allow developers to request permissions via certificate. Set to false to disallow developers from requesting permissions via certificate. | Boolean | Optional. Default value is true. |
| distributedSceneEnabled | Indicates whether the permission can be used in distributed scenarios. Set to true to allow developers to use the permission in distributed scenarios. Set to false to disallow developers from using the permission in distributed scenarios. | Boolean | Optional. Default value is false. |
| label | Provides a brief description of the permission, configured as a resource index for the description content. | String | Optional. Default value is empty. |
| description | Provides a detailed description of the permission, which can be a string or a resource index for the description content. | String | Optional. Default value is empty. |

Example of definePermissions tag:

```json
{
  "module" : {
    "definePermissions": [
      {
        "name": "ohos.abilitydemo.permission.PROVIDER",
        "grantMode": "system_grant",
        "availableLevel": "system_core",
        "provisionEnable": true,
        "distributedSceneEnable": false,
        "label": "$string:EntryAbility_label"
      }
    ]
  }
}
```

<!--DelEnd-->