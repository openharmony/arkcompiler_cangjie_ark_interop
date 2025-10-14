# Adding Cangjie Pages

In ArkTS using Cangjie, adding Cangjie Pages (Page) is supported. In OpenHarmony, a page is part of the application interface responsible for displaying user interface elements such as text, buttons, images, etc., as well as handling user interactions.

> **Note:**
>
> In hybrid development scenarios combining Cangjie and ArkTS, a Cangjie Page is not a true page with a complete lifecycle. It can only be embedded into ArkTS pages as a component. Therefore, an @Entry page must be provided on the ArkTS side as a container to load the Cangjie Page. Hereafter, such Cangjie Pages will be referred to as Cangjie Page Components.

The steps to add a Cangjie Page in DevEco Studio are as follows:

1. In the **Project** window, navigate to **entry > src > main**, right-click the **cangjie** folder, and select **New > Cangjie HybridComponent File**. Name it **Second**, as shown below:

   ![image-20250415101819817](../../figures/add_cangjie_page_1.png)

2. The Cangjie Page Component files will be generated in the Cangjie directory:

   ![image-20250415102758546](../../figures/add_cangjie_page_2.png)

   The content of the generated second.cj file is as follows:

   ```cangjie
   package ohos_app_cangjie_entry   // Package name

   import ohos.component.*
   import ohos.state_manage.*
   import ohos.state_macro_manage.*
   import ohos.hybrid_base.*

   // This page component must be decorated with HybridComponentEntry
   @HybridComponentEntry
   @Component
   class Second {
       @State
       var msg: String = "Hello"
       // Cangjie component construction
       public func build() {
           Column {
               Text(msg)
               Button("click to change Text").onClick {
                   => msg = "world"
               }
           }
       }
   }
   ```

   The relevant dependencies for the page component will be generated in **entry->oh-package.json5**:

   ![image-20250415105651058](../../figures/add_cangjie_page_3.png)

3. Create an ArkTS file in **entry->src->main->ets->pages** to serve as the container for loading the Cangjie Page Component (as explained at the beginning of this section). Name it second.ets, with the following content:

   ```ts
   // Embedding a Cangjie Page Component in an ArkTS Page
   // Import interface functions
   import { CJHybridComponentV2 } from '@cangjie/cjhybridview';

   @Entry
   @Component
   struct Second {
     build() {
       Row() {
         // Embed the Cangjie Page via the CJHybridComponentV2 interface
         CJHybridComponentV2({
           library: "ohos_app_cangjie_entry", // The package name where the Cangjie Page resides
           component: "Second"                // The class name corresponding to the Cangjie Page
         })
       }
       .height('100%')
       .width('100%')
     }
   }
   ```