# Overview of UI Development (Cangjie Declarative Development Paradigm)

The ArkUI framework based on the Cangjie declarative development paradigm is a minimalistic, high-performance, cross-device UI development framework that provides essential capabilities for building application UIs, including:

- **Cangjie**

  The Cangjie language is the primary application development language, covering declarative UI description, custom components, dynamic UI element extension, state management, and rendering control in application development. As a distinctive feature of Cangjie's development paradigm, state management follows declarative programming concepts, offering developers clear page update rendering processes and pipelines through versatile decorators. State management encompasses both UI component states and application states, enabling comprehensive data updates and UI rendering. For foundational knowledge about Cangjie, refer to [Introduction to Cangjie Language](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/basic-V5) for more information.

- **Layout**

  Layout is a fundamental UI element that defines component positioning. The ArkUI framework provides various layout methods, including basic linear, stack, flex, relative, and grid layouts, as well as more complex options like lists, grids, and carousels.

- **Components**

  Components are essential UI elements that form the visual interface. Framework-provided components are called **system components**, while developer-defined ones are **custom components**. Built-in system components include buttons, radio buttons, progress bars, text fields, etc. Developers can chain method calls to configure rendering effects. System components can be combined into custom components, modularizing pages into independent UI units for separate creation, development, and reuse, enhancing engineering efficiency.

- **Page Routing and Component Navigation**

  Applications may contain multiple pages, with page routing enabling navigation between them. Within a page, component navigation (e.g., tabs) can be implemented using navigation components.

- **Graphics**

  The ArkUI framework supports displaying various image types and offers extensive custom drawing capabilities, including shape drawing, color filling, text rendering, transformations, clipping, and image embedding.

- **Animation**

  Animation is a key UI element. Well-designed animations significantly enhance user experience. The framework provides rich animation capabilities, including built-in component animations, property animations, explicit animations, custom transition animations, and animation APIs. Developers can use encapsulated physics models or animation APIs to create custom animation trajectories.

- **Interaction Events**

  Interaction events are essential for UI-user engagement. The ArkUI framework supports various events, including touch, mouse, keyboard, and focus events, as well as gesture events derived from these (e.g., tap, long press, drag, pinch, rotate, swipe) and composite gesture events combining multiple gestures.

- **Customization Capabilities**

  The UI development framework enables developers to customize interfaces through capabilities like custom composition, extension, nodes, and rendering.

## Features

- **High Development Efficiency and Excellent Experience**

  - Concise Code: UI is described using near-natural semantics, abstracting away framework implementation details.
  
  - Data-Driven UI Changes: Developers focus on business logic. UI updates are handled by the framework based on data changes, eliminating manual UI transition code.
  
  - Enhanced Programming Experience: UIs are code, improving developer workflow.

- **Superior Performance**

  - Layered Declarative UI Frontend and Backend: The C++-based UI backend provides foundational components, layouts, animations, events, state management, and rendering pipelines.
  
  - Compiler and Runtime Optimizations: Unified bytecode, efficient FFI (Foreign Function Interface), AOT (Ahead Of Time) compilation, minimized engine footprint, and type optimizations.

- **Rapid Ecosystem Advancement**
  Leverages mainstream language ecosystems for quick adoption. The language is neutral and friendly, with standards organizations enabling gradual evolution.

## General Rules

- **Default Units**

  Length parameters default to `vp` (virtual pixels). This applies to `Int32` inputs and `Int64`/`Float64` values in the [`Length`](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#interface-length) type.

- **Invalid Value Handling**

  Rules for invalid input parameters:
  
  - If a parameter has a default value, the default is used.
  
  - If no default exists, the affected property or interface is ignored.