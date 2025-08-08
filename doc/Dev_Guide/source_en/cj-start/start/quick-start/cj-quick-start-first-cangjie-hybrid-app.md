# Building Your First Cangjie and ArkTS Hybrid Application

> **Note:**
>
> To ensure optimal performance, this document uses **DevEco Studio 5.0.2 Release** and **DevEco Studio-Cangjie Plugin 5.0.7.100 Beta1** as examples. Click [here](https://developer.huawei.com/consumer/cn/download/) to download the latest versions.

This documentation is intended for OpenHarmony application developers with basic knowledge of Cangjie language, ArkTS language, and UI frameworks. By building a simple hybrid application with page navigation/return functionality (as shown below), you can quickly understand the main files in the project directory and familiarize yourself with the hybrid application development process.

![hybridExampleRunning](../../figures/hybridExampleRunning.png)

## Creating a Cangjie and ArkTS Hybrid Project

1. If you are opening **DevEco Studio** for the first time, click **Create Project** to create a new project. If a project is already open, select **File** > **New** > **Create Project** from the menu bar to create a new project.
2. Select **Application** development, choose the **[Cangjie] Hybrid Ability** template, and click **Next** to proceed to the configuration step.

   > **Note:**
   >
   > If you need to develop a pure Cangjie project, select the **[Cangjie] Empty Ability** template.

   ![buildChooseCangjieHybridTemplate](../../figures/buildChooseCangjieHybridTemplate.png)

3. On the project configuration page, keep the default settings.

   ![buildConfigCangjieHybridTyplate](../../figures/buildConfigCangjieHybridTemplate.png)

4. Click **Finish**. DevEco Studio will automatically generate sample code and related resources. Wait for the project creation to complete.

## Directory Structure of a Cangjie and ArkTS Hybrid Project

The directory structure of a Cangjie and ArkTS hybrid project is as follows:

```text
Project_name
├── .hvigor
├── .idea
├── AppScope
│    ├── resources
│    └── app.json5
├── entry
│    ├── build
│    ├── har
│    │    └── CJHyAPIRegister-v1.0.1.har
│    ├── libs
│    ├── oh_modules
│    ├── src
│    │    ├── main
│    │    │    ├── cangjie
│    │    │    │    ├── types
│    │    │    │    │    └── libohos_app_cangjie_entry
│    │    │    │    │          ├── Index.d.ts
│    │    │    │    │          └── oh-package.json5
│    │    │    │    └── index.cj
│    │    │    ├── ets
│    │    │    │    ├── entryability
│    │    │    │    ├── entrybackupability
│    │    │    │    └── pages
│    │    │    ├── resources
│    │    │    └── module.json5
│    │    ├── mock
│    │    ├── ohosTest
│    │    └── test
│    ├── build-profile.json5
│    ├── cjpm.toml
│    ├── hvigorfile.ts
│    ├── obfuscation-rules.txt
│    ├── oh-package.json5
│    └── oh-package-lock.json5
├── hvigor
│    ├── cangjie-build-support-x.y.z.tgz
│    └── hvigor-config.json5
├── oh_modules
├── build-profile.json5
├── code-linter.json5
├── hvigorfile.ts
├── local.properties
├── oh-package.json5
└── oh-package-lock.json5
```

Key file information includes:

- **AppScope > app.json5**: Global configuration information for the application.
- **entry**: OpenHarmony project module, compiled and built into a HAP package.
    - **src > har**: Stores the HAR module for Cangjie and ArkTS interoperability.
    - **src > main > cangjie**: Stores Cangjie source code.
    - **src > main > cangjie > types**: Dependency libraries for Cangjie and ArkTS interoperability.
    - **src > main > ets**: Stores ArkTS source code.
    - **src > main > ets > entryability**: Entry point for the application/service.
    - **src > main > ets > entrybackupability**: Provides extended backup and recovery capabilities for the application.
    - **src > main > ets > pages**: Pages included in the application/service.
    - **src > main > resources**: Stores resource files used by the application/service, such as graphics, multimedia, strings, and layout files. For more information, see [Resource Classification and Access](../ide-resource-categories-and-access.md).
    - **src > main > module.json5**: Module configuration file, including HAP configuration, device-specific settings, and global configuration.
    - **build-profile.json5**: Current module information and compilation configuration, including buildOption and targets.
    - **cjpm.toml**: Cangjie package management configuration file, including compilation options and dependency management.
    - **hvigorfile.ts**: Module-level compilation and build task script.
    - **oh-package.json5**: Describes package name, version, entry file (type declaration file), and dependencies.
- **hvigor**: Stores the hvigor used by the current project.
    - **cangjie-build-support-x.y.z.tgz**: Cangjie-specific hvigor task package.
    - **hvigor-config.json5**: Specifies the global hvigor and its parameter configuration.
- **oh_modules**: Stores third-party library dependency information.
- **build-profile.json5**: Application-level configuration, including signing and product settings.
- **hvigorfile.ts**: Application-level compilation and build task script.
- **oh-package.json5**: Describes global configurations such as dependency overrides and parameterized settings.

## Building the First Page (Pure ArkTS Page)

1. Using Text Components

   After project synchronization, open **entry > src > main > ets > pages** in **Project** and edit the **Index.ets** file.

   For this example, which uses text/buttons for page navigation/return, the layout is built using Row and Column components. For more complex alignment scenarios, consider using the RelativeContainer component.

   Example of **Index.ets**:

   ```typescript
   @Entry
   @Component
   struct Index {
     @State message: string = 'Hello World';

     build() {
       RelativeContainer() {
         Text(this.message)
           .fontSize(40)
           .fontWeight(FontWeight.Bold)
           .alignRules({
             center: { anchor: '__container__', align: VerticalAlign.Center },
             middle: { anchor: '__container__', align: HorizontalAlign.Center }
           })
       }
       .height('100%')
       .width('100%')
     }
   }
   ```

2. Adding a Button

   Add a Button component to the default page to respond to user clicks and navigate to another page. Example of the updated **Index.ets**:

   ```typescript
   // Index.ets
   @Entry
   @Component
   struct Index {
     @State message: string = 'Hello World'

     build() {
       Row() {
         Column() {
           Text(this.message)
             .fontSize(50)
             .fontWeight(FontWeight.Bold)
           // Add a button to respond to user clicks
           Button() {
             Text('Next')
               .fontSize(30)
               .fontWeight(FontWeight.Bold)
           }
           .type(ButtonType.Capsule)
           .margin({
             top: 20
           })
           .backgroundColor('#0D9FFB')
           .width('40%')
           .height('5%')
         }
         .width('100%')
       }
       .height('100%')
     }
   }
   ```

## Building the Second Page (ArkTS and Cangjie Hybrid Page)

> **Note:**
>
> In Cangjie and ArkTS hybrid development, a Cangjie page is not a full lifecycle page but a component embedded in an ArkTS page. Therefore, an ArkTS page with @Entry must serve as a container to load the Cangjie page component.
>
> For detailed information on hybrid UI development, see [Hybrid Development V2](https://developer.huawei.com/consumer/cn/doc/cangjie-references-V5/cj_appendix-hybrid-v2-V5).

1. Creating a Cangjie Page

    - In the **Project** window, open **entry > src > main**, right-click the **cangjie** folder, and select **New -> Cangjie HybridComponent File**. Name the **Component name** as **Second**, select **Cangjie** in **Component name**, and choose **With ArkTS Wrapper** in **Type**, as shown below:

       ![inputPageName](../../figures/inputPageName.png)

    - Click **OK**. The directory structure will be as follows:

       ```text
        entry
        ├── .preview
        ├── build
        ├── libs
        ├── oh_modules
        └── src
             └── main
                  ├── cangjie
                  │    ├── types
                  │    ├── index.cj
                  │    └── second.cj
                  ├── ets
                  │    ├── entryability
                  │    ├── entrybackupability
                  │    └── pages
                  │         ├── Index.ets
                  │         └── second.ets
                  ├── resources
                  └── module.json5
       ```

       A **second.cj** Cangjie source file is created in **src > main > cangjie**, and an ArkTS container file **second.ets** is automatically generated in **src > main > ets > pages**.

    - Add Text and Button components to the Cangjie page and style them. Example of **second.cj**:

       ```cangjie
       // second.cj
       package ohos_app_cangjie_entry

       import ohos.base.*
       import ohos.component.*
       import ohos.hybrid_base.*
       import ohos.state_macro_manage.*
       import ohos.state_manage.*

       @HybridComponentEntry
       @Component
       class Second {
           @State var msg: String = "Hello Cangjie"

           public func build() {
               Row() {
                   Column() {
                       Text(this.msg)
                           .fontSize(50)
                           .fontWeight(FontWeight.Bold)

                       Button() {
                           Text("Back")
                               .fontSize(30)
                               .fontWeight(FontWeight.Bold)
                       }
                       .shape(ShapeType.Capsule)
                       .margin(top: 20)
                       .backgroundColor(Color(0x0D9FFB))
                       .width(40.percent)
                       .height(5.percent)
                   }
                   .width(100.percent)
               }
               .height(100.percent)
           }
       }
       ```

2. Creating the ArkTS Container for the Cangjie Page

    - Embed the Cangjie page in the ArkTS page. Example of **src > main > ets > pages > second.ets**:

       ```typescript
       // second.ets
       // Embed the Cangjie page in the ArkTS page
       import { CJHybridComponentV2 } from '@cangjie/cjhybridview';

       @Entry
       @Component
       struct Second {
         build() {
           Row() {
             // Embed the Cangjie page using CJHybridComponentV2
             CJHybridComponentV2({
               library: "ohos_app_cangjie_entry", // Package name of the Cangjie page
               component: "Second"                // Class name of the Cangjie page
             })
           }
           .height('100%')
           .width('100%')
         }
       }
       ```

    > **Note:**
    >
    > Developers must write ArkTS code to serve as the container for embedding the Cangjie page.

3. Configuring the Second Page's Route

- In the **Project** window, open **entry > src > main > resources > base > profile**. The **main_pages.json** file will automatically include the route for the second page, "pages/second". Example:

   ```json
   {
     "src": [
       "pages/Index",
       "pages/second"
     ]
   }
   ```

## Implementing Page NavigationNavigation between pages can be achieved through the page router. The page router locates the target page based on the page URL, enabling page jumps. To use the page router, import the router module.

1. **Navigating from the First ArkTS Page to the Second ArkTS-Cangjie Hybrid Page**

   In the first ArkTS page, bind the `onClick` event to the navigation button. When the button is clicked, it navigates to the second page. Below is an example of the **Index.ets** file:

   ```typescript
   // Index.ets
   // Import the page router module
   import { router } from '@kit.ArkUI';
   import { BusinessError } from '@kit.BasicServicesKit';

   @Entry
   @Component
   struct Index {
     @State message: string = 'Hello World'

     build() {
       Row() {
         Column() {
           Text(this.message)
             .fontSize(50)
             .fontWeight(FontWeight.Bold)
           // Add a button to respond to user clicks
           Button() {
             Text('Next')
               .fontSize(30)
               .fontWeight(FontWeight.Bold)
           }
           .type(ButtonType.Capsule)
           .margin({
             top: 20
           })
           .backgroundColor('#0D9FFB')
           .width('40%')
           .height('5%')
           // Bind the onClick event to the navigation button to jump to the second page
           .onClick(() => {
             console.info(`Succeeded in clicking the 'Next' button.`)
             // Navigate to the second page
             router.pushUrl({ url: 'pages/second' }).then(() => {
               console.info('Succeeded in jumping to the second page.')
             }).catch((err: BusinessError) => {
               console.error(`Failed to jump to the second page. Code is ${err.code}, message is $   {err.message}`)
             })
           })
         }
         .width('100%')
       }
       .height('100%')
     }
   }
   ```

2. **Returning from the Second Page to the First Page**

   In the second ArkTS-Cangjie hybrid page, bind the `onClick` event to the Cangjie Button component to return to the first ArkTS page when clicked. However, since **the page routers for Cangjie and ArkTS are not interoperable**, in a hybrid page, if you want to route from the Cangjie side to an ArkTS page, you need to **register the ArkTS-side routing function** with Cangjie using interoperability capabilities.

   > **Note:**
   >
   > Cangjie-ArkTS interoperability supports the following two development paradigms:
   >
   > - **Using Cangjie-ArkTS Declarative Interop Macros**: Automatically generates interop glue code. **Simpler to use and recommended.** The example below uses this approach.
   >
   > - **Using Cangjie-ArkTS Interop Libraries**: Provides lower-level dynamic type interfaces.

- **Cangjie provides interfaces for registering and unregistering ArkTS functions.** In the **Project** window, navigate to **entry > src > main > cangjie**, open the **index.cj** file, and write the Cangjie-ArkTS interop code. The example is as follows:

   ```cangjie
   // index.cj
   package ohos_app_cangjie_entry

   import ohos.base.*
   import ohos.ark_interop.*
   import ohos.ark_interop_macro.*
   import std.collection.*

   // Define a global HashMap to store ArkTS-registered functions
   // For simplicity, assume all ArkTS callback functions are parameterless and return void
   public let globalJSFunction = HashMap<String, ()->Unit>()

   @Interop[ArkTS]
   public func registerJSFunc(name: String, fn: ()->Unit): Unit {
       // If already registered, log an error and return
       if (globalJSFunction.contains(name)) {
           AppLog.error("registerJSFunc failed(err: func ${name} already exists)")
           return
       }
       // Save to the HashMap
       globalJSFunction.add(name, fn)
   }

   @Interop[ArkTS]
   public func unregisterJSFunc(name: String): Unit {
       globalJSFunction.remove(name)
   }
   ```

- **Automatically generate Cangjie-ArkTS interop interface files (.d.ts).** Open the **index.cj** file, right-click in the editor, and select **Generate... > Cangjie-ArkTS Interop API**. This will automatically generate the .d.ts interface declarations exposed by Cangjie to ArkTS in the **entry > src > main > cangjie > types > libohos_app_cangjie_entry** directory under **Index.d.ts**. The directory structure is as follows:

    ```text
    entry
    ├── .preview
    ├── build
    ├── har
    ├── libs
    ├── oh_modules
    └── src
         └── main
              ├── cangjie
              │    ├── ark_interop_api
              │    ├── types
              │    │    └── libohos_app_cangjie_entry
              │    │         │── Index.d.ts
              │    │         └── oh-package.json5
              │    ├── index.cj
              │    └── second.cj
              ├── ets
              │    ├── entryability
              │    ├── entrybackupability
              │    └── pages
              │         ├── Index.ets
              │         └── second.ets
              ├── resources
              └── module.json5
    ```

   The interface declarations are as follows:

   ```typescript
   // Index.d.ts
   export declare function registerJSFunc(name: string, fn: () => void): void
   export declare function unregisterJSFunc(name: string): void
   ```

   > **Note:**
   >
   > After creating a Cangjie Hybrid Ability project, the **entry > oh-package.json5** file automatically adds the **libohos_app_cangjie_entry** library to the **dependencies** field.
   >
   > **entry > oh-package.json5** file:
   >
   > ```json
   > "dependencies": {
   >    "libohos_app_cangjie_entry.so": "file:src/main/cangjie/types/libohos_app_cangjie_entry",
   >    "@cangjie/cjhybridview": "1.0.4",
   >    "libark_interop_api.so": "file:src/main/cangjie/ark_interop_api"
   > }
   >    ```

- **After generating the .d.ts interface declarations, you can directly import the dependencies in ArkTS files.** Register the ArkTS page routing function with the Cangjie side. The **second.ets** file example is as follows:

   ```typescript
   // second.ets
   import { CJHybridComponentV2 } from '@cangjie/cjhybridview';

   // Import the ArkTS page router module
   import { router } from '@kit.ArkUI';
   import { BusinessError } from '@kit.BasicServicesKit';

   // Import registerJSFunc and unregisterJSFunc interfaces from libohos_app_cangjie_entry.so
   import cjlib from 'libohos_app_cangjie_entry.so'

   @Entry
   @Component
   struct Second {
     aboutToAppear(): void {
       // Register the callback function with the Cangjie side before the page appears
       cjlib.registerJSFunc('SecondPageRouterBack', () => {
         try {
           // Return to the first page
           router.back()
           console.info('Succeeded in returning to the first page.')
         } catch (err) {
           let code = (err as BusinessError).code;
           let message = (err as BusinessError).message;
           console.error(`Failed to return to the first page. Code is ${code}, message is $   {message}`)
         }
       })
     }

     aboutToDisappear(): void {
       // Unregister the callback function before the page is destroyed
       cjlib.unregisterJSFunc('SecondPageRouterBack')
     }

     build() {
       Row() {
         // Embed the Cangjie page component using CJHybridComponentV2
         CJHybridComponentV2({
           library: "ohos_app_cangjie_entry", // The package name of the Cangjie page component
           component: "Second"      // The class name of the Cangjie page component
         })
       }
       .height('100%')
       .width('100%')
     }
   }
   ```

- **In the Cangjie page component, bind the `onClick` event to the Cangjie Button. When clicked, call the ArkTS-registered callback function to return to the first page.** The **second.cj** file example is as follows:

   ```cangjie
   // second.cj
   package ohos_app_cangjie_entry

   import ohos.base.*
   import ohos.component.*
   import ohos.hybrid_base.*
   import ohos.state_macro_manage.*
   import ohos.state_manage.*

   @HybridComponentEntry
   @Component
   class Second {
       @State var msg: String = "Hello Cangjie"

       public func build() {
           Row() {
               Column() {
                   Text(this.msg)
                       .fontSize(50)
                       .fontWeight(FontWeight.Bold)

                   Button() {
                       Text("Back")
                           .fontSize(30)
                           .fontWeight(FontWeight.Bold)
                   }
                   .shape(ShapeType.Capsule)
                   .margin(top: 20)
                   .backgroundColor(Color(0x0D9FFB))
                   .width(40.percent)
                   .height(5.percent)
                   // Bind the onClick event to the Back button to return to the first page
                   .onClick {
                       AppLog.info("Succeeded in clicking the 'Back' button.")
                       let optFn = globalJSFunction.get("SecondPageRouterBack")
                       if (let Some(fn) <- optFn) {
                           fn() // Call the ArkTS callback function
                       } else {
                           AppLog.error("Failed to return to the first page. callback not exists")
                       }
                   }
               }
               .width(100.percent)
           }
               .height(100.percent)
       }
   }
   ```

## Running the Application on a Real Device or Emulator

### Using a Local Real Device

1. Connect a real device running OpenHarmony to the development environment.
2. After successful connection, go to **File > Project Structure > Project > Signing Configs**, check **Support OpenHarmony** and **Automatically generate signature**, click **Sign In**, wait for automatic signing to complete, and click **OK**. The interface is as follows:

    ![buildSign](../../figures/buildSign.png)

3. Click the ![runButton](../../figures/runButton.png) button in the upper-right toolbar to run. The effect is as follows:

    ![hybridExampleRunning](../../figures/hybridExampleRunning.png)

### Using an Emulator

OpenHarmony applications/services written in Cangjie can run on the emulator (Emulator) provided by DevEco Studio.

1. Create a Phone-type emulator device and select it from the device list in the upper-right corner of DevEco Studio.

2. By default, Cangjie projects are compiled for the **arm64-v8a** architecture. When using an **x86 emulator** (current development environment is **Windows/x86_64** or **MacOS/x86_64**), the Cangjie project and third-party libraries need to compile the x86_64 version of the .so. Add **x86_64** to the **cangjieOptions/abiFilters** value in the **build-profile.json5** configuration file of the Cangjie module. The compilation configuration is as follows:

    ```json
    "buildOption": { // Configuration for the build process
      "cangjieOptions": { // Cangjie-related configurations
        "path": "./cjpm.toml", // Path to the cjpm configuration file, providing Cangjie build settings
        "abiFilters": ["arm64-v8a", "x86_64"] // Custom Cangjie compilation architectures; default is arm64-v8a
      }
    }
    ```

3. Click the ![runButton](../../figures/runButton.png) button in the upper-right toolbar to run. The effect is the same as running on a real device.

Congratulations! You have successfully built your first Cangjie-ArkTS hybrid application.