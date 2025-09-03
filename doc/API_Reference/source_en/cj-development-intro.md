# Development Instructions

The API reference is primarily intended for developers to consult various API descriptions related to application development. To facilitate the use of API documentation, common fields in the documentation are explained below.

## Version Description

The version number from which a component or interface begins to be supported will be indicated in the corresponding description, e.g., **Initial Version:** 19.

## System Capability Description

System Capability (SystemCapability, abbreviated as SysCap) refers to each relatively independent feature in the operating system. Different devices correspond to different sets of system capabilities, and each system capability corresponds to multiple interfaces. Developers can determine whether an interface is available based on system capabilities. For details, refer to the [SystemCapability Usage Guide](cj-syscap.md).

The documentation specifies the system capability for each interface, e.g., **System Capability:** SystemCapability.xxx.xxx.

- The SystemCapability list allows quick lookup of the devices supported by specific capability sets, such as [phones](./cj-phone-syscap-list.md).
- Additionally, the system provides the `canIUse` interface, which can be used to [determine whether an API is available](cj-syscap.md#判断api是否可以使用).
- On specific device models, capabilities may exceed the default capability set defined for the project. To use such capabilities, additional configuration of custom syscap is required. Refer to [Adding Custom Syscap](./cj-syscap.md#加入自定义syscap).
- The same system capability may vary across different devices. Developers can perform [differences checks for the same capability across devices](./cj-syscap.md#不同设备相同能力的差异检查).

## Interface Usage Instructions

The open capabilities (interfaces) provided by the OpenHarmony-Cangjie SDK must be imported before use. The SDK encapsulates interface modules under the same Kit, allowing developers to use the capabilities included in a Kit by importing it in sample code. The interface modules encapsulated by each Kit can be viewed in the Kit subdirectory under the SDK directory.

## Cangjie Sample Code Instructions

The Cangjie samples in each Kit are not complete programs but rather key code snippets corresponding to APIs, provided for reference only. To compile and run the code, developers should copy the samples into a Cangjie project template. The steps are as follows:

1. Create a Cangjie template project.

    ![image-Create-CJ-Application](./figures/image-Create-CJ-Application.png)

2. After creation, template files will be generated: "index.cj", "main_ability.cj", and "ability_stage.cj".

    ![image-CJ-Demo](./figures/image-CJ-Demo.png)

3. Add the sample code to the corresponding location in "index.cj".

    ```cangjie
    // index.cj

    // Import the required packages here
    import kit.ArkUI.*
    import kit.PerformanceAnalysisKit.Hilog

    // Define required dependencies such as classes and functions here

    @Entry
    @Component
    class EntryView {
        func build() {
            Row {
                Column {
                    Text("Hello Cangjie").onClick {
                        evt =>
                        try {
                            // Add API sample code here
                        } (e: Exception) {
                            Hilog.info(0, "AppLogCj", e.toString())
                        }
                    }
                }.width(100.percent)
            }.height(100.percent)
        }
    }
    ```

4. If the sample code involves the [Context](./apis/AbilityKit/cj-apis-ability.md#class-context) object, the Ability context must be saved in the global AppStorage in the "main_ability.cj" file of the Cangjie template project. The content of "main_ability.cj" is as follows:

    ```cangjie
    import kit.AbilityKit.*
    internal import kit.AbilityKit.UIAbilityContext
    internal import kit.AbilityKit.AbilityStage
    internal import kit.ArkUI.WindowStage
    import kit.PerformanceAnalysisKit.Hilog
    import ohos.arkui.state_management.AppStorage

    class MainAbility <: UIAbility {
        public init() {
            super()
            registerSelf()
        }

        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            HiLog.info(0, "system", "MainAbility OnCreated.${want.abilityName}")
            match (launchParam.launchReason) {
                case LaunchReason.START_ABILITY => Hilog.info(0, "AppLogCj", "START_ABILITY")
                case _ => ()
            }
        }

        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            Hilog.info(0, "system", "MainAbility onWindowStageCreate.")
            AppStorage.setOrCreate<UIAbilityContext>("abilityContext", this.context)
            AppStorage.setOrCreate<WindowStage>("windowStage", windowStage)
            windowStage.loadContent("EntryView")
        }
    }
    ```

## Permission Description

By default, applications can only access limited system resources. However, in some cases, applications may need to access additional system or other applications' data (including user personal data) or functionalities to extend their capabilities. For details, refer to the [Application Permission Management Overview](../../Dev_Guide/source_zh_cn/security/AccessToken/cj-app-permission-mgmt-overview.md).

When calling interfaces to access these resources, corresponding permissions must be requested. The request method can be found in the [Access Control Development Guide](../../Dev_Guide/source_zh_cn/security/AccessToken/cj-determine-application-mode.md).

- If an application requires a specific permission to call an interface, it will be indicated in the interface description: **Required Permission:** ohos.permission.xxxx.
- If no permissions are required to call the interface, no special note will be provided.

## Application Model Description

As the system evolves, two application models have been introduced: the FA model and the Stage model.

Currently, Cangjie APIs can only be used under the Stage model.

## Deprecated Interface Description

Deprecated interfaces are marked with the superscript "<sup>deprecated</sup>", indicating that the interface is no longer recommended for use.

Deprecated interfaces remain compatible for up to 5 API levels from the deprecated version, but this behavior is not recommended.

- For interfaces with alternative interfaces indicated, developers are advised to review the documentation of the new interface and adapt as soon as possible.
- If no alternative interface is provided, developers should refer to the deprecation notice and changelog to adjust their implementation.