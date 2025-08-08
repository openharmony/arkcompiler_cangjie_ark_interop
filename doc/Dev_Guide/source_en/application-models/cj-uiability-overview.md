# Overview of UIAbility Component

## Overview

[UIAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-uiability) is a UI-containing application component primarily designed for user interaction.

UIAbility design philosophy:

1. Supports cross-device migration and multi-device collaboration at the application component level.

2. Supports multiple devices and window forms.

UIAbility division principles and recommendations:

The UIAbility component serves as the basic unit of system scheduling, providing applications with windows for interface rendering. An application may contain one or multiple UIAbility components. For example, in a payment application, the entry function and payment/receipt functions can be configured as separate UIAbility components.

Each UIAbility component instance will display a corresponding task in the recent tasks list.

For developers, the choice between single or multiple UIAbility components depends on specific scenarios. The recommendations are as follows:

- If developers wish to see a single task in the task view, it is recommended to adopt the "one UIAbility + multiple pages" approach, which avoids unnecessary resource loading.
- If developers wish to see multiple tasks in the task view or need to open multiple windows simultaneously, it is recommended to implement different functionalities using multiple UIAbility components.

    For instance, in instant messaging applications, the message list and audio/video calls can be developed using different UIAbility components. This not only facilitates task window switching but also enables split-screen display of two task windows from the same application.

> **Note:**
>
> The task view is used for quickly viewing and managing all currently running tasks or applications on the device.

## Declaration Configuration

For an application to properly utilize UIAbility, it is necessary to declare the UIAbility's name, entry point, label, and other relevant information in the [abilities tag](../cj-start/basic-knowledge/module-configuration-file.md#abilities-tag) of the [module.json5 configuration file](../cj-start/basic-knowledge/module-configuration-file.md).

```json
{
  "module": {
    // ...
    "abilities": [
      {
        "name": "EntryAbility", // Name of the UIAbility component
        "srcEntry": "ohos_app_cangjie_entry.MainAbility", // Code path of the UIAbility component
        "description": "$string:EntryAbility_desc", // Description of the UIAbility component
        "icon": "$media:icon", // Icon of the UIAbility component
        "label": "$string:EntryAbility_label", // Label of the UIAbility component
        "startWindowIcon": "$media:icon", // Resource index for the start page icon of the UIAbility component
        "startWindowBackground": "$color:start_window_background", // Resource index for the start page background color of the UIAbility component
        // ...
      }
    ]
  }
}
```

Additionally, registration is required. (The DevEco project template includes this registration.)

<!-- compile -->

```cangjie
import ohos.ability.UIAbility

let ENTRYABILITY_REGISTER_RESULT = UIAbility.registerCreator("EntryAbility", {=> MainAbility()})
```