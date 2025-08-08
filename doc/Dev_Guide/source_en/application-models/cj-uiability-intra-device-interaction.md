# Launching UIAbility Components Within an Application

[UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) is the smallest unit scheduled by the system. When navigating between functional modules within a device, it involves launching specific Abilities, including other Abilities within the same application or Abilities from other applications (e.g., launching a third-party payment Ability).

This chapter primarily describes how to launch Ability components within an application.

- [Launching UIAbility Within an Application](#launching-uiability-within-an-application)
- [Launching UIAbility Within an Application and Obtaining Return Results](#launching-uiability-within-an-application-and-obtaining-return-results)
- [Launching a Specified Page of UIAbility](#launching-a-specified-page-of-uiability)

## Launching UIAbility Within an Application

When an application contains multiple [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) components, there are scenarios where one Ability needs to launch another within the same application. For example, in a payment application, the entry Ability might launch the payment/receipt Ability.

Assume the application has two Abilities: EntryAbility and FuncAbility (which can be in the same Module or different Modules), and you need to launch FuncAbility from a page in EntryAbility.

> This code depends on the [stdx package](https://gitcode.com/Cangjie/cangjie_stdx)

1. In EntryAbility, launch the Ability by calling the [startAbility()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) method. [Want](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-want) is the entry parameter for launching the Ability instance, where `bundleName` is the Bundle name of the target application, `abilityName` is the name of the target Ability, `moduleName` is added when the target Ability belongs to a different Module, and `parameters` are custom information parameters. For how to obtain the `context` in the example, refer to [Obtaining UIAbility Context Information](cj-uiability-usage.md#obtaining-context-information-of-uiability).

    <!-- compile -->

    ```cangjie
    import kit.UIKit.Button
    import ohos.base.{BusinessException, AppLog}
    import kit.AbilityKit.{Want, UIAbilityContext}
    import std.collection.HashMap
    import stdx.encoding.json.{JsonValue, JsonObject, JsonString}  // Import stdx reference: http://gitcode.com/Cangjie/cangjie_stdx

    // Refer to the Obtaining UIAbility Context Information section
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
                        let parametersMap = HashMap<String, JsonValue>()
                        parametersMap.add("info", JsonString("From EntryAbility PageAbilityComponentsInteractive page"))
                        let want = Want(
                            deviceId: "", // Empty deviceId indicates the current device
                            bundleName: "com.samples.stagemodelabilitydevelop",
                            abilityName: "FuncAbilityA",
                            moduleName: "entry", // moduleName is optional
                            // Custom information
                            parameters: JsonObject(parametersMap).toString()
                        )
                        try {
                            context
                                .startAbility(want)
                                .get()
                        } catch (e: BusinessException) {
                            AppLog.error("Failed to start FuncAbility. Code is ${e.code}, message is ${e.message}")
                        }
                    }
                }.width(100.percent)
            }.height(100.percent)
        }
    }
    ```

2. In FuncAbility, receive the parameters passed from EntryAbility in the [onCreate()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) or [onNewWant()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-onnewwantwant-launchparam) lifecycle callback file.

    <!-- compile -->

    ```cangjie
    import ohos.base.AppLog
    import kit.AbilityKit.{UIAbility, UIAbilityContext, LaunchParam, Want}

    var globalFuncAbilityAContext: ?UIAbilityContext = None
    class FuncAbilityA <: UIAbility {
        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            globalFuncAbilityAContext = this.context
            // Receive parameters passed from the caller Ability
            let funcAbilityWant = want
            // want.parameters is a JSON-formatted string; users can parse the 'info' field using a third-party JSON library
        }
        // ...
    }
    ```

    > **Note:**
    >
    > In the launched FuncAbility, you can obtain the PID, Bundle Name, and other information of the calling [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) by accessing the `parameters` of the passed [Want](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-want) parameter.

3. After completing the business logic in FuncAbility, if you need to terminate the current [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) instance, call the [terminateSelf()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-terminateself) method in FuncAbility. For how to obtain the `context` in the example, refer to [Obtaining UIAbility Context Information](cj-uiability-usage.md#obtaining-context-information-of-uiability).

    <!-- compile -->

    ```cangjie
    import ohos.base.{BusinessException, AppLog}
    import kit.AbilityKit.UIAbilityContext

    // globalFuncAbilityAContext is defined above
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
                            AppLog.error("Failed to start terminate self. Code is ${e.code}, message is ${e.message}")
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
    > When calling the terminateSelf() method to terminate the current Ability instance, a snapshot of the instance is retained by default (i.e., the task corresponding to the instance can still be viewed in the recent tasks list). If you do not want to retain the snapshot, set the `removeMissionAfterTerminate` field to `true` in the [abilities tag](../cj-start/basic-knowledge/module-configuration-file.md#abilities-tag) of the [module.json5 configuration file](../cj-start/basic-knowledge/module-configuration-file.md) for the corresponding Ability.

## Launching UIAbility Within an Application and Obtaining Return Results

When EntryAbility launches FuncAbility, you may want FuncAbility to return results to the caller after completing its business logic. For example, in an application where the entry functionality and account login functionality are designed as separate [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) components, after completing the login operation in the login Ability, the login results need to be returned to the entry Ability.

> This code depends on the [stdx package](https://gitcode.com/Cangjie/cangjie_stdx)

1. In EntryAbility, call the [startAbilityForResult()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-startabilityforresultwant-asynccallbackabilityresult) interface to launch FuncAbility. The `data` in the asynchronous callback is used to receive the information returned to EntryAbility after FuncAbility terminates itself. For how to obtain the `context` in the example, refer to [Obtaining UIAbility Context Information](cj-uiability-usage.md#obtaining-context-information-of-uiability).

    <!-- compile -->

    ```cangjie
    import kit.UIKit.Button
    import ohos.base.{BusinessException, AppLog, AsyncError}
    import kit.AbilityKit.{Want, UIAbilityContext, AbilityResult}
    import std.collection.HashMap
    import stdx.encoding.json.{JsonValue, JsonObject, JsonString}  // Import stdx reference: http://gitcode.com/Cangjie/cangjie_stdx

    const RESULT_CODE: Int32 = 1001
    // Refer to the Obtaining UIAbility Context Information section
    func getContext(): UIAbilityContext {
        return globalContext.getOrThrow()
    }

    var resultCallback = {
        errorCode: Option<AsyncError>, data: Option<AbilityResult> => match (errorCode) {
            case Some(e) => AppLog.info("callback error: errcode is ${e.code}")
            case _ => match (data) {
                case Some(value) =>
                    if (value.resultCode == RESULT_CODE) {
                        let infoJSobj = JsonValue
                            .fromStr(value
                                .want
                                .parameters)
                            .asObject()
                        let map = infoJSobj.getFields()
                        let info = ((map.get("info") ?? JsonString("")) as JsonString ?? JsonString("")).getValue()
                        AppLog.info("startAbilityForResult get info: ${info}")
                    }
                case _ => AppLog.info("callback data is null")
            }
        }
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
                        let parametersMap = HashMap<String, JsonValue>()
                        parametersMap.add("info", JsonString("From EntryAbility PageAbilityComponentsInteractive page"))
                        let want = Want(
                            deviceId: "", // Empty deviceId indicates the current device
                            bundleName: "com.samples.stagemodelabilitydevelop",
                            abilityName: "FuncAbilityA",
                            moduleName: "entry", // moduleName is optional
                            // Custom information
                            parameters: JsonObject(parametersMap).toString()
                        )
                        try {
                            context.startAbilityForResult(want,resultCallback)
                        } catch (e: BusinessException) {
                            AppLog.error("Failed to start FuncAbility. Code is ${e.code}, message is ${e.message}")
                        }
                    }
                }.width(100.percent)
            }.height(100.percent)
        }
    }
    ```

2. When FuncAbility terminates itself, it needs to call the [terminateSelfWithResult()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-terminateselfwithresultabilityresult) method. The [abilityResult](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#struct-abilityresult) parameter contains the information FuncAbility needs to return to EntryAbility.

    <!-- compile -->

    ```cangjie
    import kit.UIKit.Button
    import ohos.base.{BusinessException, AppLog}
    import kit.AbilityKit.{UIAbilityContext, AbilityResult}
    import std.collection.HashMap
    import stdx.encoding.json.{JsonValue, JsonObject, JsonString}  // Import stdx reference: http://gitcode.com/Cangjie/cangjie_stdx

    const RESULT_CODE_A: Int32 = 1001

    // globalFuncAbilityAContext is defined above
    func getFuncAbilityAContext(): UIAbilityContext {
        return globalFuncAbilityAContext.getOrThrow()
    }

    @Entry
    @Component
    class PageFuncAbilityA {
        func build() {
            Row {
                Column {
                    Button("FuncAbility").onClick {
                        evt =>
                        let context = getFuncAbilityAContext()
                        let parametersMap = HashMap<String, JsonValue>()
                        parametersMap.add("info", JsonString("From FuncAbility Index page"))
                        let abilityResult = AbilityResult(RESULT_CODE_A, Want(
                            deviceId: "", // Empty deviceId indicates the current device
                            bundleName: "com.samples.stagemodelabilitydevelop",
                            abilityName: "FuncAbilityB",
                            moduleName: "entry", // moduleName is optional
                            // Custom information
                            parameters: JsonObject(parametersMap).toString()
                        ))
                        try {
                            context
                                .terminateSelfWithResult(abilityResult)
                                .get()
                        } catch (e: BusinessException) {
                            AppLog.error("Failed to start terminate self. Code is ${e.code}, message is ${e.message}")
                        }
                    }
                    // ...
                }.width(100.percent)
            }.height(100.percent)
        }
    }
    ```

3. After FuncAbility terminates itself, EntryAbility receives the information returned by FuncAbility through the [startAbilityForResult()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-startabilityforresultwant-asynccallbackabilityresult) method callback. Ensure `RESULT_CODE` matches the previous value.

    <!-- compile -->

    ```cangjie
    import kit.UIKit.Button
    import ohos.base.{BusinessException, AppLog, AsyncError}
    import kit.AbilityKit.{Want, UIAbilityContext, AbilityResult}
    import std.collection.HashMap
    import stdx.encoding.json.{JsonValue, JsonObject, JsonString}  // Import stdx reference: http://gitcode.com/Cangjie/cangjie_stdx

    const RESULT_CODE: Int32 = 1001
    // Refer to the Obtaining UIAbility Context Information section
    func getContext(): UIAbilityContext {
        return globalContext.getOrThrow()
    }

    var resultCallback = {
        errorCode: Option<AsyncError>, data: Option<AbilityResult> => match (errorCode) {
            case Some(e) => AppLog.info("callback error: errcode is ${e.code}")
            case _ => match (data) {
                case Some(value) =>
                    if (value.resultCode == RESULT_CODE) {
                        let infoJSobj = JsonValue
                            .fromStr(value
                                .want
                                .parameters)
                            .asObject()
                        let map = infoJSobj.getFields()
                        let info = ((map.get("info") ?? JsonString("")) as JsonString ?? JsonString("")).getValue()
                        AppLog.info("startAbilityForResult get info: ${info}")
                    }
                case _ => AppLog.info("callback data is null")
            }
        }
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
                        let parametersMap = HashMap<String, JsonValue>()
                        parametersMap.add("info", JsonString("From EntryAbility PageAbilityComponentsInteractive page"))
                        let want = Want(
                            deviceId: "", // Empty deviceId indicates local device
                            bundleName: "com.samples.stagemodelabilitydevelop",
                            abilityName: "FuncAbilityA",
                            moduleName: "entry", // moduleName is optional
                            // Custom information
                            parameters: JsonObject(parametersMap).toString()
                        )
                        try {
                            context.startAbilityForResult(want,resultCallback)
                        } catch (e: BusinessException) {
                            AppLog.error("Failed to start FuncAbility. Code is ${e.code}, message is ${e.message}")
                        }
                    }
                }.width(100.percent)
            }.height(100.percent)
        }
    }
    ```

## Launching a Specified Page of UIAbility

### Overview

A [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) can correspond to multiple pages. Different scenarios may require launching different pages of the UIAbility. For example, when navigating from one UIAbility's page to another, you might want to launch a specific page of the target UIAbility.

UIAbility startup can be categorized into two scenarios: cold start and warm start.

- **UIAbility Cold Start**: Refers to launching a UIAbility instance when it is completely closed, requiring full loading and initialization of the UIAbility instance's code, resources, etc.
- **UIAbility Warm Start**: Refers to launching a UIAbility instance that has already been started and run in the foreground but was moved to the background for some reason. In this case, the UIAbility instance's state can be quickly restored.

This chapter focuses on two scenarios for launching a specified page: [Target UIAbility Cold Start](#target-uiability-cold-start) and [Target UIAbility Warm Start](#target-uiability-warm-start), as well as how the caller can specify the target page.

### Caller UIAbility Specifies the Target Page

When a caller [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) launches another UIAbility, it often needs to navigate to a specific page. For example, FuncAbility contains two pages (Index for the home page and FuncA for the functionality A page). In this case, you need to configure the target page information in the [Want](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-want) parameter passed to the target UIAbility. You can add a custom parameter to the `parameters` field of `want` to pass the page navigation information. For how to obtain the `context` in the example, refer to [Obtaining UIAbility Context Information](cj-uiability-usage.md#obtaining-context-information-of-uiability).

> This code depends on the [stdx package](https://gitcode.com/Cangjie/cangjie_stdx)

<!-- compile -->

```cangjie
import kit.UIKit.Button
import ohos.base.{BusinessException, AppLog}
import kit.AbilityKit.{Want, UIAbilityContext, AbilityResult}
import std.collection.HashMap
import stdx.encoding.json.{JsonValue, JsonObject, JsonString}  // For importing stdx, refer to http://gitcode.com/Cangjie/cangjie_stdx

// Refer to the "Obtaining UIAbility Context Information" chapter
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
                    let parametersMap = HashMap<String, JsonValue>()
                    parametersMap.add("router", JsonString("FuncA"))
                    let want = Want(
                        deviceId: "", // Empty deviceId indicates local device
                        bundleName: "com.samples.stagemodelabilitydevelop",
                        abilityName: "FuncAbilityA",
                        moduleName: "entry", // moduleName is optional
                        // Custom information
                        parameters: JsonObject(parametersMap).toString()
                    )
                    try {
                        context.startAbility(want)
                    } catch (e: BusinessException) {
                        AppLog.error("Failed to start FuncAbility. Code is ${e.code}, message is ${e.message}")
                    }
                }
            }.width(100.percent)
        }.height(100.percent)
    }
}
```

### Target UIAbility Cold Start

When the target [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) is cold-started, the parameters passed by the caller are received in the target Ability's [onCreate()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) lifecycle callback. Then, in the target Ability's [onWindowStageCreate()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-onwindowstagecreatewindowstage) lifecycle callback, parse the [Want](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-want) parameter passed by the caller to obtain the URL of the page to load, and pass it to the [windowStage.loadContent()](../../../API_Reference/source_en/arkui-cj/cj-apis-window.md#class-windowstage) method.

<!-- compile -->

```cangjie
import ohos.base.AppLog
import std.collection.HashMap
import kit.AbilityKit.{UIAbility, LaunchParam, Want}

class FuncAbilityA <: UIAbility {
    var router = "Index"
    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        // Receive parameters passed by the caller UIAbility
        let funcAbilityWant = want
        // want.parameters is a JSON-formatted string. Users can parse the router field using a third-party JSON library.
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        AppLog.info("FuncAbilityA onWindowStageCreate.")
        windowStage.loadContent(router)
    }
}
```

### Target UIAbility Warm Start

In application development, there are scenarios where the target [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) instance has already been started. In such cases, when the target Ability is launched again, the initialization logic is not rerun; instead, only the [onNewWant()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-onnewwantwant-launchparam) lifecycle method is triggered. To navigate to a specified page, parse and process the parameters in `onNewWant()`.

For example, consider a scenario involving the messaging and contacts applications:

1. The user opens the messaging application first. The UIAbility instance of the messaging application starts, displaying the home page.
2. The user returns to the home screen, moving the messaging application to the background.
3. The user opens the contacts application and finds contact "Zhang San."
4. The user clicks the message button for "Zhang San," which relaunches the UIAbility instance of the messaging application.
5. Since the UIAbility instance of the messaging application has already been started, the `onNewWant()` callback of this UIAbility is triggered, and the [onCreate()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) and [onWindowStageCreate()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-onwindowstagecreatewindowstage) initialization logic is not executed again.

**Figure 1** Target UIAbility Warm Start

![Target UIAbility Warm Start](figures/uiability-hot-start.png)

The development steps are as follows:

1. Cold start the UIAbility instance of the messaging application.

    <!-- compile -->

    ```cangjie
    import std.collection.HashMap
    import ohos.base.{AppLog, BusinessException}
    import kit.AbilityKit.{UIAbility, LaunchParam, Want}
    import kit.AbilityKit.UIAbilityContext

    var globalFuncAbilityAContext: ?UIAbilityContext = None

    class FuncAbilityA <: UIAbility {
        var url = "Index"
        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            // Receive parameters passed by the caller Ability
            let funcAbilityWant = want
            let info = "XXX"
            // want.parameters is a JSON-formatted string. Users can parse the router field using a third-party JSON library and assign it to info.
            if (info == "FuncA") {
                url = "PageColdStartUp"
            }
        }

        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            AppLog.info("FuncAbilityA onWindowStageCreate.")
            globalFuncAbilityAContext = this.context
            windowStage.loadContent(url)
        }
    }
    ```

2. In the [onNewWant()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-onnewwantwant-launchparam) callback of the messaging application's UIAbility, parse the [Want](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-want) parameter passed by the caller, use the Router object, and navigate to the specified page. When the messaging application's UIAbility instance is launched again, it will navigate to the specified page.

    <!-- compile -->

    ```cangjie
    import std.collection.HashMap
    import ohos.base.{AppLog, BusinessException}
    import kit.AbilityKit.{UIAbility, LaunchParam, Want}
    import kit.UIKit.{launch, Router}

    class FuncAbilityA <: UIAbility {
        //...
        public override func onNewWant(want: Want, launchParam: LaunchParam): Unit {
            // Receive parameters passed by the caller Ability
            let funcAbilityWant = want
            let info = "XXX"
            // want.parameters is a JSON-formatted string. Users can parse the router field using a third-party JSON library and assign it to info.
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
> When the called [UIAbility component launch mode](cj-uiability-launch-type.md) is set to `multiton`, a new instance is created each time it is launched, so the `onNewWant()` callback will not be used.
