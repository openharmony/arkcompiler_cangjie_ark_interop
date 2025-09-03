# Starting UIAbility Components Within an Application  

[UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) is the smallest unit scheduled by the system. When navigating between functional modules within a device, it involves launching specific Abilities, including other Abilities within the same application or Abilities from other applications (e.g., launching a third-party payment Ability).  

This chapter primarily introduces methods for launching Ability components within an application.  

- [Starting UIAbility Components Within an Application](#starting-uiability-components-within-an-application)
  - [Starting UIAbility Within an Application](#starting-uiability-within-an-application)
  - [Launching a Specified Page of UIAbility](#launching-a-specified-page-of-uiability)
    - [Overview](#overview)
    - [Caller UIAbility Specifies the Target Page](#caller-uiability-specifies-the-target-page)
    - [Cold Start of Target UIAbility](#cold-start-of-target-uiability)
    - [Hot Start of Target UIAbility](#hot-start-of-target-uiability)

## Starting UIAbility Within an Application  

When an application contains multiple [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) components, scenarios arise where one Ability launches another within the same application. For example, in a payment application, the entry Ability may launch the payment/receipt Ability.  

Assume the application has two Abilities: EntryAbility and FuncAbility (which can reside in the same Module or different Modules). The goal is to launch FuncAbility from a page in EntryAbility.  

1. In EntryAbility, use the [startAbility()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) method to launch the Ability. The [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) object serves as the entry parameter for launching the Ability instance. Here, `bundleName` is the Bundle name of the target application, `abilityName` is the name of the target Ability, `moduleName` is added if the target Ability belongs to a different Module, and `parameters` contains custom information parameters. For details on obtaining the `context` in the example, refer to [Obtaining UIAbility Context Information](cj-uiability-usage.md#获取uiability的上下文信息).  

    <!-- compile -->  

    ```cangjie  
    import kit.ArkUI.Button  
    import ohos.business_exception.*  
    import kit.AbilityKit.{Want, UIAbilityContext}  
    import std.collection.HashMap  

    var globalContext:?UIAbilityContext = None  

    // Refer to the "Obtaining UIAbility Context Information" section  
    func getContext(): UIAbilityContext {  
        return globalContext.getOrThrow()  
    }  

    @Entry  
    @Component  
    class PageAbilityComponentsInteractive {  
        func build() {  
            Row {  
                Column {  
                    Button().onClick {  
                        evt =>  
                        // context is the AbilityContext of the caller Ability  
                        let context = getContext()  
                        let parametersMap = HashMap<String, WantValueType>()  
                        parametersMap.add("info", StringValue("From EntryAbility PageAbilityComponentsInteractive page"))  
                        let want = Want(  
                            deviceId: "", // Empty deviceId indicates the current device  
                            bundleName: "com.samples.stagemodelabilitydevelop",  
                            abilityName: "FuncAbilityA",  
                            moduleName: "entry", // moduleName is optional  
                            // Custom information  
                            parameters: parametersMap  
                        )  
                        try {  
                            context  
                                .startAbility(want)  
                                .get()  
                        } catch (e: BusinessException) {  
                            HILog.info(0, "device_interaction", "Failed to start FuncAbility. Code is ${e.code}, message is ${e.message}")  
                        }  
                    }  
                }.width(100.percent)  
            }.height(100.percent)  
        }  
    }  
    ```  

2. In FuncAbility, receive the parameters passed from EntryAbility in the [onCreate()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) or [onNewWant()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-onnewwantwant-launchparam) lifecycle callback.  

    <!-- compile -->  

    ```cangjie  
    import kit.AbilityKit.{UIAbility, UIAbilityContext, LaunchParam, Want}  

    var globalFuncAbilityAContext: ?UIAbilityContext = None  
    class FuncAbilityA <: UIAbility {  
        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {  
            globalFuncAbilityAContext = this.context  
            // Receive parameters from the caller Ability  
            let funcAbilityWant = want  
            // want.parameters is a JSON-formatted string. Users can parse the value of the info field using a third-party JSON library.  
        }  
        // ...  
    }  
    ```  

    > **Note:**  
    >  
    > In the launched FuncAbility, you can obtain the PID, Bundle Name, and other information of the caller [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) by accessing the `parameters` of the passed [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) parameter.  

3. After completing the business logic in FuncAbility, if you need to terminate the current [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) instance, call the [terminateSelf()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-terminateself) method in FuncAbility. For details on obtaining the `context` in the example, refer to [Obtaining UIAbility Context Information](cj-uiability-usage.md#获取uiability的上下文信息).  

    <!-- compile -->  

    ```cangjie  
    import ohos.business_exception.*  
    import kit.AbilityKit.UIAbilityContext  

    var globalFuncAbilityAContext: ?UIAbilityContext = None  
    // Refer to the "Obtaining UIAbility Context Information" section  
    func getFuncAbilityAContext(): UIAbilityContext {  
        return globalFuncAbilityAContext.getOrThrow()  
    }  

    @Entry  
    @Component  
    class PageFromStageModel {  
        func build() {  
            Row {  
                Column {  
                    Button("FuncAbility").onClick {  
                        evt =>  
                        let context = getFuncAbilityAContext()  
                        try {  
                            context.terminateSelf().get()  
                        } catch (e: BusinessException) {  
                            HiLog.Info(0, "device_interaction", "Failed to start terminate self. Code is ${e.code}, message is ${e.message}")  
                        }  
                    }  
                    // ...  
                }.width(100.percent)  
            }.height(100.percent)  
        }  
    }  
    ```  

    > **Note:**  
    >  
    > When terminating the current Ability instance using the `terminateSelf()` method, a snapshot of the instance is retained by default, meaning the task corresponding to this instance remains visible in the recent tasks list. If you do not want to retain the snapshot, set the `removeMissionAfterTerminate` field to `true` in the [abilities tag](../cj-start/basic-knowledge/module-configuration-file.md#abilities标签) of the [module.json5 configuration file](../cj-start/basic-knowledge/module-configuration-file.md).  

## Launching a Specified Page of UIAbility  

### Overview  

A single [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) can correspond to multiple pages. In different scenarios, launching this UIAbility may require displaying different pages. For example, when navigating from one UIAbility's page to another, you may want to launch a specific page of the target UIAbility.  

UIAbility startup is divided into two scenarios: cold start and hot start.  

- **UIAbility Cold Start**: The UIAbility instance is launched from a completely closed state, requiring full loading and initialization of the UIAbility instance's code, resources, etc.  
- **UIAbility Hot Start**: The UIAbility instance has already been launched and run in the foreground but was moved to the background for some reason. Relaunching the UIAbility instance in this scenario allows for quick restoration of its state.  

This chapter focuses on two scenarios for launching a specified page: [Cold Start of Target UIAbility](#cold-start-of-target-uiability) and [Hot Start of Target UIAbility](#hot-start-of-target-uiability), as well as how the caller specifies the target page.  

### Caller UIAbility Specifies the Target Page  

When a caller [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) launches another UIAbility, it often needs to navigate to a specified page. For example, FuncAbility contains two pages (Index for the home page and FuncA for the functional page A). In this case, the [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) parameter must include the target page information. You can add a custom parameter in the `parameters` field of `want` to pass the page navigation information. For details on obtaining the `context` in the example, refer to [Obtaining UIAbility Context Information](cj-uiability-usage.md#获取uiability的上下文信息).  

<!-- compile -->  

```cangjie  
import kit.ArkUI.Button  
import ohos.business_exception.*  
import kit.AbilityKit.{Want, UIAbilityContext, AbilityResult}  
import std.collection.HashMap  

// Refer to the "Obtaining UIAbility Context Information" section  
func getContext(): UIAbilityContext {  
    return globalContext.getOrThrow()  
}  

@Entry  
@Component  
class PageAbilityComponentsInteractive {  
    func build() {  
        Row {  
            Column {  
                Button().onClick {  
                    evt =>  
                    // context is the AbilityContext of the caller Ability  
                    let context = getContext()  
                    let parametersMap = HashMap<String, WantValueType>()  
                    parametersMap.add("router", StringValue("FuncA"))  
                    let want = Want(  
                        deviceId: "", // Empty deviceId indicates the current device  
                        bundleName: "com.samples.stagemodelabilitydevelop",  
                        abilityName: "FuncAbilityA",  
                        moduleName: "entry", // moduleName is optional  
                        // Custom information  
                        parameters: parametersMap  
                    )  
                    try {  
                        context.startAbility(want)  
                    } catch (e: BusinessException) {  
                        Hilog.info(0, "device_interaction", "Failed to start FuncAbility. Code is ${e.code}, message is ${e.message}")  
                    }  
                }  
            }.width(100.percent)  
        }.height(100.percent)  
    }  
}  
```  

### Cold Start of Target UIAbility  

During a cold start of the target [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability), the parameters passed by the caller are received in the [onCreate()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) lifecycle callback of the target Ability. Then, in the [onWindowStageCreate()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-onwindowstagecreatewindowstage) lifecycle callback, parse the [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) parameter passed by the caller to obtain the target page URL, and pass it to the [windowStage.loadContent()](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-window.md#class-windowstage) method.  

<!-- compile -->  

```cangjie  
import std.collection.HashMap  
import kit.AbilityKit.{UIAbility, LaunchParam, Want}  

class FuncAbilityA <: UIAbility {  
    var router = "Index"  
    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {  
        // Receive parameters from the caller UIAbility  
        let funcAbilityWant = want  
        // want.parameters is a JSON-formatted string. Users can parse the value of the router field using a third-party JSON library.  
    }  

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {  
        Hilog.info(0, "device_interaction", "FuncAbilityA onWindowStageCreate.")  
        windowStage.loadContent(router)  
    }  
}  
```  

### Hot Start of Target UIAbility  

In application development, scenarios arise where the target [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) instance has already been launched. In such cases, relaunching the target Ability does not re-execute the initialization logic but directly triggers the [onNewWant()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-onnewwantwant-launchparam) lifecycle method. To navigate to a specified page, parse and process the parameters in `onNewWant()`.  

For example, consider a scenario involving a messaging application and a contacts application:  

1. The user opens the messaging application, launching its UIAbility instance and displaying the home page.  
2. The user returns to the home screen, putting the messaging application in the background.  
3. The user opens the contacts application and finds contact "Zhang San."  
4. The user clicks the message button for "Zhang San," relaunching the messaging application's UIAbility instance.  
5. Since the messaging application's UIAbility instance is already running, this triggers its `onNewWant()` callback without executing [onCreate()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) or [onWindowStageCreate()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-onwindowstagecreatewindowstage) initialization logic.  

**Figure 1** Hot Start of Target UIAbility  

![Hot Start of Target UIAbility](figures/uiability-hot-start.png)  

The development steps are as follows:  

1. Cold start the messaging application's UIAbility instance.  

    <!-- compile -->  

    ```cangjie  
    import std.collection.HashMap  
    import ohos.base.{AppLog, BusinessException}  
    import kit.AbilityKit.{UIAbility, LaunchParam, Want}  

    var globalFuncAbilityAContext:?UIAbilityContext = None  
    class FuncAbilityA <: UIAbility {  
        var url = "Index"  
        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {  
            // Receive parameters from the caller Ability  
            let funcAbilityWant = want  
            let info = "XXX"  
            // want.parameters is a JSON-formatted string. Users can parse the value of the router field and assign it to info.  
            if (info == "FuncA") {  
                url = "PageColdStartUp"  
            }  
        }  

        public override func onWindowStageCreate(windowStage: WindowStage): Unit {  
            HiLog.info(0, "device_interaction", "FuncAbilityA onWindowStageCreate.")  
            globalFuncAbilityAContext = this.context  
            windowStage.loadContent(url)  
        }  
    }  
    ```  

2. In the messaging application's UIAbility [onNewWant()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-onnewwantwant-launchparam) callback, parse the [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) parameter passed by the caller. Use the [Router](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#class-router) object to navigate to the specified page. This ensures that when the messaging application's UIAbility instance is relaunched, it directly navigates to the specified page.  

    <!-- compile -->  

    ```cangjie  
    import std.collection.HashMap  
    import ohos.base.{AppLog, BusinessException}  
    import kit.AbilityKit.{UIAbility, LaunchParam, Want}  
    import kit.ArkUI.{launch, Router}  

    class FuncAbilityA <: UIAbility {  
        //...  
        public override func onNewWant(want: Want, launchParam: LaunchParam): Unit {  
            // Receive parameters from the caller Ability  
            let funcAbilityWant = want  
            let info = "XXX"  
            // want.parameters is a JSON-formatted string. Users can parse the value of the router field and assign it to info.  
            if (info == "FuncA") {  
                url = "PageHotStartUp"  
            }  
            launch {  
                Router.pushUrl(url: "PageHotStartUp", callback: {code => AppLog.error("Failed to push url. Code is ${code}")})  
            }  
        }  
    }  
    ```  

> **Note:**  
>  
> When the called [UIAbility launch mode](cj-uiability-launch-type.md) is set to `multiton`, a new instance is created each time it is launched, so the `onNewWant()` callback will not be triggered.