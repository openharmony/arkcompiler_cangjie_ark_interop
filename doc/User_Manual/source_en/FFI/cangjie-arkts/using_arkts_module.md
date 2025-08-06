# Using ArkTS Modules in Cangjie Applications

ArkTS modules are primarily divided into NAPI (Node.js API) modules and regular ArkTS modules. Cangjie only supports invoking NAPI modules.

Before introducing the specific loading process, let's first explain the mapping conventions between Cangjie import names and ArkTS module names, as shown below:

| ArkTS Module Name            | Cangjie Import Name                      | Description                                                  |
| :--------------------------- | :--------------------------------------- | :----------------------------------------------------------- |
| @ohos.file.photoAccessHelper | ("file.photoAccessHelper")               | If the ArkTS module name starts with @ohos, the Cangjie import name simply removes the "@ohos." prefix. |
| @hms.core.push.pushService   | ("core.push.pushService", prefix: "hms") | If the ArkTS module name starts with @xxx (where xxx is not ohos), there are two import names. The first name is the remaining part after removing "@xxx." from the module name, and the second parameter is `prefix: "xxx"`. In this example, the Cangjie import name is `"core.push.pushService", prefix: "hms"`. |

The project configuration for using ArkTS modules in Cangjie applications is no different from that of general Cangjie projects. You can refer to [Creating a New Project](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/quick-start/start-with-ets-stage.md). The only additional requirement is to load the NAPI module in the code. Taking the OpenHarmony [Photo Album Management](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/reference/apis-media-library-kit/js-apis-photoAccessHelper.md) module as an example: After checking the ArkTS documentation, the module name is "@ohos.file.photoAccessHelper". Here is a code example and explanation for using this module:

```cangjie
// Import the interoperability library
import ohos.ark_interop.*
func tryLoadArkTSSo() {
    // Create a new ArkTS runtime
    let runtime = JSRuntime()
    // Get the interoperability context
    let context = runtime.mainContext
    // Import the corresponding module based on the ArkTS module name. The imported module is a JSValue.
    let module = context.requireSystemNativeModule("file.photoAccessHelper")
    // Use the module according to the methods for operating JSValue
    let obj = module.asObject(context)
    // Call the photoAccessHelper methods via callMethod
    // obj.callMethod(...)
}
```

For methods to operate ArkTS data, please refer to [Using ArkTS Data in Cangjie](./operating_ArkTS_data.md).