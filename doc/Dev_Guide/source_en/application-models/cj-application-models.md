# Application Model  

## Components of the Application Model  

The application model is an abstract refinement of the capabilities required by applications, provided by the system for developers. It offers essential components and runtime mechanisms for applications. With the application model, developers can build applications based on a unified framework, making development simpler and more efficient.  

The components of the application model include:  

1. **Application Components**  

   Application components are the fundamental building blocks of an application and serve as its runtime entry points. During the process of launching, using, and exiting an application, components transition between different states, known as the application component lifecycle. Application components provide lifecycle callback functions, allowing developers to perceive [state changes](cj-uiability-lifecycle.md) in the application. When writing an application, developers must first implement these components and their lifecycle callbacks, then configure relevant information in the application configuration file. This enables the operating system to create instances of the components during runtime and invoke their lifecycle callbacks, thereby executing the developer's code.  

2. **Application Process Model**  

   The application process model defines how processes are created and destroyed, as well as inter-process communication mechanisms.  

3. **Application Thread Model**  

   The application thread model defines thread creation and destruction within a process, the setup of the main thread and UI thread, and inter-thread communication methods.  

4. **Application Task Management Model** (Only available to system applications)  

   The application task management model defines how tasks (Missions) are created and destroyed, as well as the relationship between tasks and components. A task represents a user's interaction with an instance of an application component. Each time a user launches a new instance of an application component, a new task is generated. For example, when a user opens a video application, a corresponding task appears in the "Recent Tasks" interface. Clicking this task brings it to the foreground. If the video editing feature within the app is also implemented as an application component, launching it creates another task, displaying both the video app and the video editor in the "Recent Tasks" interface.  

5. **Application Configuration File**  

   The application configuration file contains information such as app configurations, component details, permissions, and developer-defined settings. This information is used by compilation tools, app markets, and the operating system during the build, distribution, and runtime phases.  

## Overview of Application Models  

As the system evolves, the following application models are provided:  

- **Stage Model**: Currently the primary and long-term supported model. In this model, classes like `AbilityStage` and `WindowStage` serve as "stages" for application components and windows, hence the name "Stage Model."  

## Understanding the Stage Model  

The following table provides an overview of the Stage Model.  

**Table 1** Overview of the Stage Model  

| Item | Stage Model |  
|------|------------|  
| **Application Components** | 1. **Component Classification**<br/>![stage-model-component](figures/stage-model-component.png)<!-- ToBeReviewd -->&nbsp;&nbsp;&nbsp;- **UIAbility Component**: Contains UI elements and provides display capabilities, primarily for user interaction. For details, see [UIAbility Component Overview](cj-uiability-overview.md).<br/>2. **Development Approach**<br/>&nbsp;&nbsp;&nbsp;Adopts an object-oriented approach, exposing application components as class interfaces for developers to extend and customize. |  
| **Task Management Model** | - Each UIAbility component instance creates a task.<br/>- Tasks persist in storage until the maximum number (configurable per product) is exceeded or the user manually deletes them.<br/>- UIAbility components do not form a stack structure. |  
| **Application Configuration File** | Uses `app.json5` for application-level configurations and `module.json5` for HAP (Harmony Ability Package) and component details. |