# Overview of Want

## Definition and Usage of Want

[Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) is an object used for transferring information between application components.

One common usage scenario is as a parameter for the [startAbility()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) method. For example, when UIAbilityA needs to launch UIAbilityB and pass some data to UIAbilityB, Want can serve as a carrier to transfer the data to UIAbilityB.

**Figure 1** Illustration of Want Usage

![usage-of-want](figures/usage-of-want.png)<!-- ToBeReviewd -->

## Types of Want

- **Explicit Want**: When launching a target application component, if the caller specifies both abilityName and bundleName in the [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) parameter, it is called an Explicit Want.

    Explicit Want is typically used for launching components within the same application. It starts the target component by specifying the application's Bundle name (bundleName) and abilityName in the Want object. When there is a clear target object to handle the request, Explicit Want provides a simple and effective way to launch the target application component.

  <!-- compile -->

  ```cangjie
  import kit.AbilityKit.Want

  let wantInfo = Want(deviceId: "", bundleName: "com.example.myapplication", abilityName: "FuncAbility")
  ```

- **Implicit Want**: When launching a target application component, if the caller does not specify abilityName in the [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) parameter, it is called an Implicit Want.

    When the target object is unclear, Implicit Want can be used to leverage capabilities provided by other applications without needing to know which specific application provides that capability. Implicit Want uses the [skills tag](../cj-start/basic-knowledge/module-configuration-file.md#skills标签) to define the required capability, and the system matches all applications that declare support for that request. For example, when opening a link, the system will match all applications that declare support for this action and let the user choose which application to use.

  <!-- compile -->

  ```cangjie
  import kit.AbilityKit.Want
  
  // uncomment line below if wish to implicitly query only in the specific bundle.
  // bundleName: 'com.example.myapplication'
  let wantInfo = Want(action: "ohos.want.action.search",
      // entities can be omitted
      entities: ["entity.system.browsable"],
      uri: "https://www.test.com:8080/query/student",
      wantType: "text/plain")
  ```

    > **Note:**
    >
    > Depending on the matching results of target application components in the system, launching an application component with Implicit Want may result in one of the following three scenarios:
    >
    > - No matching application component is found: The launch fails.
    > - One matching application component is found: The component is launched directly.
    > - Multiple matching application components are found ([UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability)): A selection dialog pops up for the user to choose.