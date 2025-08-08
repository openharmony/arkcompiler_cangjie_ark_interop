# Introduction to Ability Kit  

Ability Kit (Program Framework Service) provides the application model for application development and operation, abstracting and refining the essential capabilities required by applications for developers. It offers the necessary components and operational mechanisms for applications. With this application model, developers can build applications based on a unified framework, making development simpler and more efficient.  

## Usage Scenarios  

- **Multi-Module Development**: Applications can implement functionalities through different types of modules (HAP, HAR). Among them, HAP is used to realize application features, while HAR enables code and resource sharing.  
- **Intra-Application Interaction**: Different components within an application can navigate to each other. For example, in a payment app, the entry UIAbility component can launch the payment UIAbility component.  
- **Inter-Application Interaction**: The current application can start other applications to complete specific tasks or operations. For instance, launching a browser to open a website or starting a file manager to browse or edit files.  
- **Cross-Device Application Migration**: Through cross-device migration and multi-device collaboration, users gain a better experience. For example, a video playing on a tablet can be seamlessly transferred to a smart screen for continued playback.  

## Capabilities  

- Provides capabilities for application process creation/destruction and lifecycle scheduling.  
- Offers application component runtime entry points, lifecycle scheduling, and inter-component interaction.  
- Supplies application context environments and system environment change monitoring.  
- Enables application migration capabilities.  
- Supports multi-package mechanisms, shared packages, and application configuration. For details, refer to [Application Package Overview](../cj-start/basic-knowledge/application-package-overview.md).  
- Provides program access control capabilities. For details, refer to [Access Control Overview](../security/AccessToken/cj-access-token-overview.md).  

<!--RP1-->  
<!--RP1End-->  

## Highlights/Features  

1. **Designed for Complex Applications**  
   - Adopts an object-oriented development approach, ensuring high readability, maintainability, and scalability for complex applications.  
   - Supports modular capability development.  

2. **Supports Cross-Device Migration and Multi-Device Collaboration at the Component Level**  
   The Stage model decouples application components from the UI.  
   - In cross-device migration scenarios, after the system migrates data/state between application components across devices, the UI leverages ArkUI's declarative features to restore the interface using the preserved data/state, enabling seamless migration.  
   - In multi-device collaboration scenarios, application components support RPC-based inter-component communication, naturally facilitating cross-device interactions.  

3. **Supports Multiple Devices and Window Forms**  
   Application component management and window management are architecturally decoupled.  
   - Facilitates system-level component tailoring (e.g., windowless devices can omit window-related components).  
   - Simplifies window form extensions.  
   - Enables consistent lifecycle usage for application components across devices (e.g., desktops and mobile devices).  

4. **Balances Application Capabilities and System Management Costs**  
   The Stage model redefines the boundaries of application capabilities, balancing functionality and system control overhead.  
   - Introduces specialized application components for specific scenarios (e.g., service widgets, input methods) to address diverse use cases.  
   - Standardizes background process management: To ensure user experience, the Stage model enforces orderly governance of background processes. Applications cannot remain in the background arbitrarily, and their background behavior is strictly regulated to prevent malicious activities.  

## Relationship with Related Kits  

**ArkUI**: Within the UIAbility components of Ability Kit, developers can utilize ArkUI's capabilities, including components, events, animations, and state management.