# UIAbility Component Launch Mode

The launch mode of [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) refers to the different presentation states when a UIAbility instance is launched. For different business scenarios, the system provides two launch modes:

- [UIAbility Component Launch Mode](#uiability-component-launch-mode)
  - [singleton Launch Mode](#singleton-launch-mode)
  - [multiton Launch Mode](#multiton-launch-mode)

> **Note:**
>
> `standard` was the former name of `multiton`, with the same effect as the multi-instance mode.

## singleton Launch Mode

The singleton launch mode is the single-instance mode, which is also the default launch mode.

Each time the [startAbility()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) method is called, if an instance of this [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) type already exists in the application process, the system will reuse the existing UIAbility instance. Only one instance of this UIAbility type exists in the system, meaning only one instance of this type appears in the recent tasks list.

**Figure 1** Demonstration of Singleton Mode  

<img src="./figures/uiability-launch-type1.gif" style="zoom:90%">

> **Note:**
>
> If the application's UIAbility instance has already been created and is configured in singleton mode, calling [startAbility()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) again to launch this UIAbility instance will reuse the existing instance rather than creating a new one. In this case, only the [onNewWant()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-onnewwantwant-launchparam) callback will be triggered, while the [onCreate()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) and [onWindowStageCreate()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-onwindowstagecreatewindowstage) lifecycle callbacks will not be invoked. If the existing instance is still in the process of being launched when startAbility is called, error code 16000082 will be returned.

To use the singleton launch mode, configure the `launchType` field as `singleton` in the [module.json5 configuration file](../cj-start/basic-knowledge/module-configuration-file.md).

```json
{
  "module": {
    // ...
    "abilities": [
      {
        "launchType": "singleton",
        // ...
      }
    ]
  }
}
```

## multiton Launch Mode

The multiton launch mode is the multi-instance mode. Each time the [startAbility()](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) method is called, a new instance of this [UIAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-uiability) type will be created in the application process. This means multiple instances of this UIAbility type can appear in the recent tasks list. In such cases, the UIAbility can be configured as multiton (multi-instance mode).

**Figure 2** Demonstration of Multiton Mode  

<img src="./figures/uiability-launch-type2.gif" style="zoom:90%">

To use the multiton launch mode, configure the `launchType` field as `multiton` in the [module.json5 configuration file](../cj-start/basic-knowledge/module-configuration-file.md).

```json
{
  "module": {
    // ...
    "abilities": [
      {
        "launchType": "multiton",
        // ...
      }
    ]
  }
}
```