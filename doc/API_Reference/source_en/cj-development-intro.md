# Development Instructions

The API reference is primarily intended for developers to consult various API descriptions related to application development. To facilitate the use of API documentation, common fields in the documentation are explained below.

## Version Description

The version number from which a component or interface begins to be supported is indicated in the corresponding description, e.g., **Initial Version:** 19.

## System Capability Description

System Capability (SysCap) refers to each relatively independent feature of the operating system. Different devices correspond to different sets of system capabilities, and each system capability corresponds to multiple interfaces. Developers can determine whether an interface is available based on system capabilities. For details, refer to the [SystemCapability Usage Guide](cj-syscap.md).

The documentation specifies the system capability for each interface, e.g., **System Capability:** SystemCapability.xxx.xxx.

- The SystemCapability list allows quick lookup of the devices supported by specific capability sets, such as [phones](./cj-phone-syscap-list.md).
- On specific device models, capabilities may exceed the default capability set defined for the project. To use these additional capabilities, custom syscap configurations are required. Refer to [Adding Custom Syscap](./cj-syscap.md#加入自定义syscap).
- The same system capability may vary across different devices. Developers can perform [differences checks for the same capability across devices](./cj-syscap.md#不同设备相同能力的差异检查).

## Interface Usage Instructions

The open capabilities (interfaces) provided by the OpenHarmony-Cangjie SDK must be imported before use. The SDK encapsulates interface modules under the same Kit, allowing developers to use the capabilities of a Kit by importing it in sample code. The encapsulated interface modules for each Kit can be viewed in the Kit subdirectories under the SDK directory.

## Cangjie Sample Code Description

The Cangjie samples in each Kit are not complete programs but rather key code snippets corresponding to APIs, provided for reference only. To compile and run the code, developers should copy the samples into a Cangjie project template. The steps are as follows:

1. Create a Cangjie template project.

    ![image-Create-CJ-Application](./figures/image-Create-CJ-Application.png)

2. After creation, template files will be generated: "index.cj", "main_ability.cj", and "ability_stage.cj".

    ![image-CJ-Demo](./figures/image-CJ-Demo.png)

3. Add the sample code to the corresponding location in "index.cj".

    ```cangjie
    // index.cj

    // Import relevant packages here
    import kit.UIKit.*

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
                            AppLog.info(e.toString())
                        }
                    }
                }.width(100.percent)
            }.height(100.percent)
        }
    }
    ```

4. If the sample code involves the [Context](./apis/AbilityKit/cj-apis-ability.md#class-context) object, define a Global class and assign values in the "main_ability.cj" file of the Cangjie template project. The content of "main_ability.cj" is as follows:

    ```cangjie
    import kit.AbilityKit.*
    internal import ohos.base.AppLog
    internal import ohos.ability.UIAbilityContext
    internal import ohos.ability.AbilityStage

    // Define the Global class
    public class Global {
        public static var _abilityContext: Option<UIAbilityContext> = None
        public static var windowStage: Option<WindowStage> = None
        public static prop abilityContext: UIAbilityContext {
            get() {
                Global._abilityContext.getOrThrow()
            }
        }

        public static func getAbilityContext() {
            _abilityContext.getOrThrow()
        }

        public static func getStageContext() {
            getStageContext(getAbilityContext())
        }

        public static func getWindowStage() {
            windowStage.getOrThrow()
        }
    }

    class MainAbility <: UIAbility {
        public init() {
            super()
            registerSelf()
        }

        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            AppLog.info("MainAbility OnCreated.${want.abilityName}")
            match (launchParam.launchReason) {
                case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
                case _ => ()
            }
        }

        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            AppLog.info("MainAbility onWindowStageCreate.")
            Global._abilityContext = this.context // Obtain application context
            windowStage.loadContent("EntryView")
        }
    }
    ```

## Permission Description

By default, applications can only access limited system resources. However, in certain cases, applications may need to access additional system or other applications' data (including user personal data) or functionalities to extend their capabilities. For details, refer to [Application Permission Management Overview](../../Dev_Guide/source_en/security/AccessToken/cj-app-permission-mgmt-overview.md).

When calling interfaces to access these resources, corresponding permissions must be requested. The method for requesting permissions can be found in the [Access Control Development Guide](../../Dev_Guide/source_en/security/AccessToken/cj-determine-application-mode.md).

- If an application requires a specific permission to call an interface, it will be indicated in the interface description: **Required Permission:** ohos.permission.xxxx.
- If no permissions are required to call the interface, no special note will be provided.

## Application Model Description

As the system evolves, two application models have been introduced: the FA model and the Stage model.

Currently, Cangjie APIs are only available under the Stage model.

## Deprecated Interface Description

Deprecated interfaces are marked with the superscript "<sup>deprecated</sup>", indicating that the interface is no longer recommended for use.

Deprecated interfaces remain compatible for up to 5 API levels from the deprecated version, but this behavior is not recommended.

- For interfaces with alternative options, developers are advised to review the documentation of the new interfaces and adapt as soon as possible.
- If no alternative interfaces are available, developers should refer to the deprecation notes and change logs (changelog) to modify their implementation.