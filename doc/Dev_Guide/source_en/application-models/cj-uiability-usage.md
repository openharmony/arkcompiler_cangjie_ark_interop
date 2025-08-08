# Basic Usage of UIAbility Component

The basic usage of the [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) component includes: specifying the startup page for UIAbility and obtaining the context information of UIAbility [UIAbilityContext](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiabilitycontext).

## Specifying the Startup Page for UIAbility

When launching a [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) in an application, it is necessary to specify the startup page. Otherwise, the application may display a blank screen due to the absence of a default loaded page. The startup page can be set in the [onWindowStageCreate()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-onwindowstagecreatewindowstage) lifecycle callback of UIAbility by using the [loadContent()](../../../API_Reference/source_en/arkui-cj/cj-apis-window.md#class-windowstage) method of the [WindowStage](../../../API_Reference/source_en/arkui-cj/cj-apis-window.md#class-windowstage) object.

<!-- compile -->

```cangjie
import kit.AbilityKit.UIAbility
import kit.ArkUI.WindowStage

class MainAbility <: UIAbility {
    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        // Main window is created, set main page for this ability
        windowStage.loadContent("EntryView")
    }
    // ...
}
```

> **Note:**
>
> In DevEco Studio, the UIAbility instance created by default will load the Index page. You can replace the Index page class name with the desired page class name as needed.

## Obtaining Context Information of UIAbility

The [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) class has its own context information, which is an instance of the [UIAbilityContext](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiabilitycontext) class. The [UIAbilityContext](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiabilitycontext) class includes properties such as abilityInfo and currentHapModuleInfo. Through AbilityContext, you can obtain relevant configuration information of the Ability, such as the package code path, Bundle name, Ability name, and environmental state required by the application. It also provides methods to operate the Ability instance (e.g., [startAbility()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant), [terminateSelf()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-terminateself)). If you need to obtain the Context of the current UIAbility in a page, you can follow the examples below to get the UIAbilityContext associated with the current page.

- In UIAbility, you can obtain the context information of the UIAbility instance via `this.context`.

  <!-- compile -->

  ```cangjie
  import kit.AbilityKit.{UIAbility, UIAbilityContext, Want, LaunchParam}
  import kit.ArkUI.WindowStage

  var globalContext : ?UIAbilityContext = None

  class MainAbility <: UIAbility {
      public override func onWindowStageCreate(windowStage: WindowStage): Unit {
          // Obtain the context of the Ability instance
          globalContext = this.context
          windowStage.loadContent("EntryView")
    }
  }
  ```

- To obtain the context information of the UIAbility instance in a page, you need to perform two steps: import the dependency resource context module and define a context variable in the component.

  <!-- compile -->

  ```cangjie
  import kit.AbilityKit.{UIAbilityContext, Want}

  func getContext(): UIAbilityContext {
      return globalContext.getOrThrow()
  }

  @Entry
  @Component
  class EntryView {
      @State
      var context: UIAbilityContext = getContext()

      func startAbilityTest(): Unit {
          let want = Want(
              // Want parameter information
          )
          context.startAbility(want)
      }

      // Page display
      func build() {
          // ...
      }
  }
  ```

  Alternatively, after importing the dependency resource context module, you can define the variable before using [UIAbilityContext](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiabilitycontext).

  <!-- compile -->

  ```cangjie
  import kit.AbilityKit.{UIAbilityContext, Want}

  func getContext(): UIAbilityContext {
      return globalContext.getOrThrow()
  }

  @Entry
  @Component
  class EntryView {
      func startAbilityTest(): Unit {
          let context = getContext()
          let want = Want(
              // Want parameter information
          )
          context.startAbility(want)
      }

      // Page display
      func build() {
          // ...
      }
  }
  ```

- When the business logic is completed, if developers want to terminate the current [UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) instance, they can call the [terminateSelf()](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-terminateself) method.

  <!-- compile -->

  ```cangjie
  import kit.AbilityKit.{UIAbilityContext, Want}
  import ohos.base.{AppLog, BusinessException}

  func getContext(): UIAbilityContext {
      return globalContext.getOrThrow()
  }

  @Entry
  @Component
  class EntryView {
      func build() {
          Row {
              Column {
                  Text("")
                      .fontSize(50)
                      .fontWeight(FontWeight.Bold)
                      .onClick {
                          evt =>
                          let context = getContext()
                          try {
                              // Execute normal business logic
                              context
                                  .terminateSelf()
                                  .get()
                          } catch (e: BusinessException) {
                              // Handle business logic errors
                              AppLog.error("terminateSelf failed, code is ${e.code}, message is ${e.message}")
                          }
                      }
              }.width(100.percent)
          }.height(100.percent)
      }
  }
  ```