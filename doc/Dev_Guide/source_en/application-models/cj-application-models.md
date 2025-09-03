# Application Model

## Components of the Application Model

The application model is an abstract refinement of the capabilities required by applications, provided by the system for developers. It offers essential components and operational mechanisms for applications. With the application model, developers can build applications based on a unified framework, making development simpler and more efficient.

The components of the application model include:

1. **Application Components**

   Application components are the fundamental building blocks of an application and serve as its entry points for execution. During user interactions—such as launching, using, and exiting an application—application components transition between different states, collectively referred to as the component lifecycle. Application components provide lifecycle callback functions, allowing developers to monitor [state changes](cj-uiability-lifecycle.md) in the application. When developing an application, the first step is to implement these components and their lifecycle callbacks, followed by configuring relevant information in the application configuration file. This enables the operating system to instantiate application components during runtime via the configuration file, schedule their lifecycle callbacks, and execute the developer's code.

2. **Application Process Model**

   The application process model defines how processes are created and destroyed, as well as inter-process communication mechanisms.

3. **Application Thread Model**

   The application thread model specifies thread creation and destruction within a process, the setup of main and UI threads, and inter-thread communication methods.

4. **Application Task Management Model (Exclusive to System Applications)**

   The application task management model governs the creation and destruction of tasks (Missions) and their relationships with components. A task represents a user's interaction record with an application component instance. Each time a user launches a new instance of an application component, a new task is generated. For example, when a user opens a video application, a corresponding task appears in the "Recent Tasks" interface. Clicking this task brings it to the foreground. If the video editing feature within the app is also implemented as an application component, launching it creates a new instance, resulting in two tasks (video app and video editor) displayed in the "Recent Tasks" interface.

5. **Application Configuration File**

   The application configuration file contains details such as application settings, component information, permissions, and developer-defined metadata. This information is utilized during compilation, distribution, and runtime by tools like compilers, app markets, and the operating system.

## Overview of Application Models

As the system evolves, the following application models are provided:

- **Stage Model**: Currently the primary and long-term supported model. Named for its use of classes like `AbilityStage` and `WindowStage` as "stages" for application components and windows.

## Understanding the Stage Model

The table below provides a high-level overview of the Stage Model.

  **Table 1** Stage Model Overview  

| Category       | Stage Model |  
|----------------|-------------|  
| **Application Components** | 1. Component Types<br/>![stage-model-component](figures/stage-model-component.png)<!-- ToBeReviewd -->&nbsp;&nbsp;&nbsp;- **UIAbility Component**: Contains UI elements for user interaction. For details, see [UIAbility Component Overview](cj-uiability-overview.md).<br/>&nbsp;&nbsp;&nbsp;- **ExtensionAbility Component**: Extends capabilities for specific scenarios (e.g., widgets, input methods).<br/>2. Development Approach<br/>&nbsp;&nbsp;&nbsp;Uses an object-oriented paradigm, exposing components as class interfaces for derivation and extensibility. |  
| **Process Model** | Two process types:<br/>1. Main process<br/>2. ExtensionAbility process |  
| **Task Management Model** | - Each UIAbility instance creates a task.<br/>- Tasks persist until exceeding the maximum limit (configurable) or manual deletion.<br/>- UIAbility components do not form a stack structure. |  
| **Application Configuration File** | Uses `app.json5` for application metadata and `module.json5` for HAP and component information. |