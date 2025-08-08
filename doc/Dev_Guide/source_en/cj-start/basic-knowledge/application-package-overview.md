# Application Package Overview

Before developing applications based on the [Stage Model](application-configuration-file-overview-stage.md), developers need to understand fundamental concepts such as application design mechanisms and application package structures.

## Applications and Application Packages

A user application refers to a program that runs on a device's operating system and provides specific services to users, commonly referred to as an "app." The software package file corresponding to an application is called an "application package."

The system provides mechanisms for managing the development, installation, querying, updating, and uninstallation of application packages, facilitating developers in building and maintaining applications. Additionally, the system abstracts differences across chip platforms (including x86/ARM, 32-bit/64-bit, etc.), ensuring that application packages can be installed and run on various chip platforms. This allows developers to focus on implementing application functionality.

## Multi-Module Design Mechanism for Applications

- **Support for Modular Development:** An application typically comprises multiple features. Dividing and managing different functionalities as modules is a sound design approach. During development, each functional module can be developed as an independent Module, containing source code, resource files, third-party libraries, configuration files, etc. Each Module can be compiled independently to achieve specific functionalities. This modular, loosely coupled approach to application management benefits development, maintenance, and scalability.

- **Support for Multi-Device Adaptation:** An application often needs to adapt to various device types. In a multi-Module design, each Module is labeled with the device types it supports. Some Modules support all device types, while others are tailored for specific types (e.g., tablets). When distributing application packages in the app market, precise filtering and matching based on device types enable optimal bundling and deployment of packages to target devices.

## Module Types

Modules can be categorized into two types based on usage scenarios:

- **Ability-type Modules:** Used to implement application functionalities and features. Each Ability-type Module, after compilation, generates a file with the `.hap` suffix, called a HAP (Harmony Ability Package). A HAP can be installed and run independently and serves as the basic unit of application installation. An application may contain one or more HAPs, which fall into the following two types:
  - **Entry-type Module:** The main module of the application, containing the entry interface, entry icon, and core functionalities. It compiles into an entry-type HAP. Each application distributed to the same type of device can include at most one entry-type HAP or none at all.
  - **Feature-type Module:** Dynamic feature modules of the application, compiling into feature-type HAPs. An application may contain one or more feature-type HAPs or none.

- **Library-type Modules:** Used for sharing code and resources. The same Library-type Module can be referenced by other Modules multiple times. Proper use of this type reduces development and maintenance costs. Library-type Modules are static and compile into shared packages.
  - **Static Library:** A static shared library that compiles into a file with the `.har` suffix, known as a HAR (Harmony Archive).

  **Characteristics of HAR Shared Packages:**
  | Shared Package Type | Compilation and Runtime Behavior | Distribution and Reference Methods |
  | ------------------ | ------------------------------- | ---------------------------------- |
  | HAR                | Code and resources in HAR are compiled with the referencing module. If multiple modules reference the same HAR, their compiled outputs will contain duplicate copies.<br/>Note: When [compiling HAR](har-package.md#compilation), enabling obfuscation is recommended to protect code assets. | HARs can be referenced within an application or packaged and distributed independently for use by other applications. |

## Choosing the Appropriate Package Type

The functionalities and usage scenarios of HAP and HAR are compared below:

| Module Type | Package Type | Description |
| ---------- | ------------ | ----------- |
| Ability    | [HAP](hap-package.md) | Functional module of an application, capable of independent installation and execution. |
| Static Library | [HAR](har-package.md) | Static shared package, reusable at compile time.<br/> - Supports intra-application sharing and can be published as a second-party (SDK) or third-party (SDK) library for use by other applications.<br/> &ensp; - As a second-party SDK, publish to [OHPM Private Repository](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo) for internal use within the company.<br/> &ensp; - As a third-party SDK, publish to [OHPM Central Repository](https://ohpm.openharmony.cn/) for use by other applications.<br/> - When multiple HAPs reference the same HAR, duplicate copies of code and resources may increase the application package size.<br/> - Note: When [compiling HAR](har-package.md#compilation), enabling obfuscation is recommended to protect code assets. |

The following table compares the specifications supported by HAP and HAR, where "√" indicates support and "×" indicates no support.

Developers can choose the appropriate package type based on specific application requirements. Subsequent chapters will provide detailed explanations on using [HAP](hap-package.md) and [HAR](har-package.md).

| Specification | HAP | HAR |
| ------------- | --- | --- |
| Supports declaring [UIAbility](../../application-models/cj-uiability-overview.md) components in the configuration file | √ | √ |
| Supports declaring ExtensionAbility components in the configuration file | √ | × |
| Supports including resource files and `.so` files | √ | √ |
| Supports dependency on other HAR files | √ | √ |
| Supports independent installation and execution on devices | √ | × |

> **Note:**
>
> - HAR does not support circular dependencies or transitive dependencies. For details, refer to the constraints section in [HAR](har-package.md#constraints).