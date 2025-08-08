# Loading Cangjie Modules in ArkTS

This chapter introduces how to load Cangjie modules in ArkTS. There are three methods to load Cangjie modules in ArkTS:

- Using the `import` syntax to load Cangjie modules: Supported from API version 18.
- Using the `loadNativeModule` interface to load Cangjie modules: Supported from API version 18.
- Using the `requireCJLib` interface to load Cangjie modules: Supported from API version 12.

## Method 1: Using the `import` Syntax to Load Cangjie Modules

> **Note:**
>
> - This loading method is supported from API version 18. Minimum compatible version: OpenHarmony 5.1.0(18). If the code loading the Cangjie module needs to run on OpenHarmony 12 Release or later, please use [the `requireCJLib` interface to load Cangjie modules](#method-3-using-the-requirecjlib-interface-to-load-cangjie-modules).
> - The method of using the `import` syntax to load Cangjie modules is consistent with using the `import` syntax to load native modules. For detailed information, refer to: [Static Loading of Native Modules](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/arkts-utils/arkts-import-native-module.md).

Below is an example of using the `import` syntax to load the Cangjie module `ohos_app_cangjie_entry` and call the `addNumber` interface:

1. Create a Cangjie module in the ArkTS project. For details, refer to [Adding a Cangjie Module to an ArkTS Project](./add_cangjie_module.md).

2. Implementation of the interoperation interface on the Cangjie side:

    - Implement the interoperation interface `addNumber`:

        ```cangjie
        // entry/src/main/cangjie/index.cj

        // Define the package name, which must match the package name in cjpm.toml
        package ohos_app_cangjie_entry

        // Import the interoperation library
        import ohos.ark_interop.*

        // Define the interoperation function. The parameter type must be (JSContext, JSCallInfo), and the return type must be JSValue
        func addNumber(context: JSContext, callInfo: JSCallInfo): JSValue {
            // Get the parameter list from JSCallInfo
            let arg0: JSValue = callInfo[0]
            let arg1: JSValue = callInfo[1]

            // Convert JSValue to Cangjie type
            let a: Float64 = arg0.toNumber()
            let b: Float64 = arg1.toNumber()

            // Actual Cangjie function behavior
            let value = a + b

            // Convert the result to JSValue
            let result: JSValue = context.number(value).toJSValue()

            // Return JSValue
            return result
        }
        // The function must be registered in JSModule
        let EXPORT_MODULE = JSModule.registerModule {
            runtime, exports =>
                exports["addNumber"] = runtime.function(addNumber).toJSValue()
        }
        ```

    - In the `Index.d.ts` file under the `types->libohos_app_cangjie_entry` folder, provide the interface declaration for the ArkTS side:

        ```typescript
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/Index.d.ts
        export declare function addNumber(a: number, b: number): number;
        ```

    - In the `oh-package.json5` file under the `types->libohos_app_cangjie_entry` folder, associate `Index.d.ts` with the corresponding `.so` library of the Cangjie module:

        > **Note:**
        >
        > The following code does not need to be copied; it is already configured in the project after creating the Cangjie module.

        ```json
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/oh-package.json5
        {
            "name": "libohos_app_cangjie_entry.so",
            "types": "./Index.d.ts",
            "version": "1.0.0",
            "description": ""
        }
        ```

3. Configure the dependency on the corresponding `.so` library of the Cangjie module in the `dependencies` field of the `oh-package.json5` file in the ArkTS module:

    > **Note:**
    >
    > The following code does not need to be copied; it is already configured in the project after creating the Cangjie module.

    ```json
    // entry/oh-package.json5
    {
        "dependencies": {
            // ...
            "libohos_app_cangjie_entry.so": "file:./src/main/cangjie/types/libohos_app_cangjie_entry"
            // ...
        }
    }
    ```

4. On the ArkTS side, use the `import` syntax to directly import the Cangjie module and call the `addNumber` interface:

    ```typescript
    // Import the Cangjie dynamic library. The library name is the package name of the Cangjie module, which must match the package name of the interoperation interface.
    import { addNumber } from "libohos_app_cangjie_entry.so";

    // Call the Cangjie interface
    let result = addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

## Method 2: Using the `loadNativeModule` Interface to Load Cangjie Modules

> **Note:**
>
> - This loading method is supported from API version 18. Minimum compatible version: OpenHarmony 5.1.0(18). If the code loading the Cangjie module needs to run on OpenHarmony 12 Release or later, please use [the `requireCJLib` interface to load Cangjie modules](#method-3-using-the-requirecjlib-interface-to-load-cangjie-modules).
> - For detailed information on the `loadNativeModule` interface, refer to: [Dynamic Loading of Native Modules in Synchronous Mode](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/arkts-utils/js-apis-load-native-module.md).

Below is an example of using the `loadNativeModule` interface to load the Cangjie module `ohos_app_cangjie_entry` and call the `addNumber` function:

1. Create a Cangjie module in the ArkTS project. For details, refer to [Adding a Cangjie Module to an ArkTS Project](./add_cangjie_module.md).

2. Implementation of the interoperation interface on the Cangjie side:

    - Implement the interoperation interface `addNumber`:

        ```cangjie
        // entry/src/main/cangjie/index.cj

        // Define the package name, which must match the package name in cjpm.toml
        package ohos_app_cangjie_entry

        // Import the interoperation library
        import ohos.ark_interop.*

        // Define the interoperation function. The parameter type must be (JSContext, JSCallInfo), and the return type must be JSValue
        func addNumber(context: JSContext, callInfo: JSCallInfo): JSValue {
            // Get the parameter list from JSCallInfo
            let arg0: JSValue = callInfo[0]
            let arg1: JSValue = callInfo[1]

            // Convert JSValue to Cangjie type
            let a: Float64 = arg0.toNumber()
            let b: Float64 = arg1.toNumber()

            // Actual Cangjie function behavior
            let value = a + b

            // Convert the result to JSValue
            let result: JSValue = context.number(value).toJSValue()

            // Return JSValue
            return result
        }
        // The function must be registered in JSModule
        let EXPORT_MODULE = JSModule.registerModule {
            runtime, exports =>
                exports["addNumber"] = runtime.function(addNumber).toJSValue()
        }
        ```

    - In the `Index.d.ts` file under the `types->libohos_app_cangjie_entry` folder, provide the interface declaration for the ArkTS side:

        ```typescript
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/Index.d.ts
        export declare function addNumber(a: number, b: number): number;
        ```

    - In the `oh-package.json5` file under the `types->libohos_app_cangjie_entry` folder, associate `Index.d.ts` with the corresponding `.so` library of the Cangjie module:

        > **Note:**
        >
        > The following code does not need to be copied; it is already configured in the project after creating the Cangjie module.

        ```json
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/oh-package.json5
        {
            "name": "libohos_app_cangjie_entry.so",
            "types": "./Index.d.ts",
            "version": "1.0.0",
            "description": ""
        }
        ```

3. Configure the dependency on the corresponding `.so` library of the Cangjie module in the `dependencies` field of the `oh-package.json5` file in the ArkTS module:

    > **Note:**
    >
    > The following code does not need to be copied; it is already configured in the project after creating the Cangjie module.

    ```json
    // entry/oh-package.json5
    {
        "dependencies": {
            // ...
            "libohos_app_cangjie_entry.so": "file:./src/main/cangjie/types/libohos_app_cangjie_entry"
            // ...
        }
    }
    ```

4. On the ArkTS side, use `loadNativeModule` to load `libohos_app_cangjie_entry.so` and call the `addNumber` interface:

    ```typescript
    // Use the loadNativeModule interface to load the Cangjie dynamic library
    let module: ESObject = loadNativeModule("libohos_app_cangjie_entry.so");

    // Call the Cangjie interface
    let result = module.addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

## Method 3: Using the `requireCJLib` Interface to Load Cangjie Modules

> **Note:**
>
> This loading method is supported from API version 12. Minimum compatible version: OpenHarmony 12 Release.

The `requireCJLib` interface is similar in functionality to `loadNativeModule`, providing synchronous dynamic loading of Cangjie modules. The `requireCJLib` interface is provided by the Cangjie module loader `ark_interop_loader`.

**Interface Description**

```typescript
export declare function requireCJLib(moduleName: string): Object
```

**Parameters:**

| Parameter Name | Type   | Required | Description                  |
| :------------ | :------ | :-------- | :--------------------------- |
| moduleName    | string  | Yes       | Name of the Cangjie dynamic library to load |

Below is an example of using the `requireCJLib` interface to load the Cangjie module `ohos_app_cangjie_entry` and call the `addNumber` function:

1. Create a Cangjie module in the ArkTS project. For details, refer to [Adding a Cangjie Module to an ArkTS Project](./add_cangjie_module.md).

2. Implementation of the interoperation interface on the Cangjie side:

    - Implement the interoperation interface `addNumber`:

        ```cangjie
        // entry/src/main/cangjie/index.cj

        // Define the package name, which must match the package name in cjpm.toml
        package ohos_app_cangjie_entry

        // Import the interoperation library
        import ohos.ark_interop.*

        // Define the interoperation function. The parameter type must be (JSContext, JSCallInfo), and the return type must be JSValue
        func addNumber(context: JSContext, callInfo: JSCallInfo): JSValue {
            // Get the parameter list from JSCallInfo
            let arg0: JSValue = callInfo[0]
            let arg1: JSValue = callInfo[1]

            // Convert JSValue to Cangjie type
            let a: Float64 = arg0.toNumber()
            let b: Float64 = arg1.toNumber()

            // Actual Cangjie function behavior
            let value = a + b

            // Convert the result to JSValue
            let result: JSValue = context.number(value).toJSValue()

            // Return JSValue
            return result
        }
        // The function must be registered in JSModule
        let EXPORT_MODULE = JSModule.registerModule {
            runtime, exports =>
                exports["addNumber"] = runtime.function(addNumber).toJSValue()
        }
        ```

    - Create a `loader` folder under the `cangjie` folder.

    - Create a `libark_interop_loader.d.ts` file in the `loader` folder and provide the `requireCJLib` interface declaration:

        ```typescript
        // entry/src/main/cangjie/loader/libark_interop_loader.d.ts
        export declare function requireCJLib(s: string): Object
        ```

    - Create an `oh-package.json5` file in the `loader` folder and associate `libark_interop_loader.d.ts` with the module loader's `.so` library:

        ```json
        // entry/src/main/cangjie/loader/oh-package.json5
        {
            "name": "libark_interop_loader.so",
            "types": "./libark_interop_loader.d.ts",
            "version": "",
            "description": "Please describe the basic information."
        }
        ```

3. Configure the dependency on the module loader's `.so` library in the `dependencies` field of the `oh-package.json5` file in the ArkTS module:

    ```json
    // entry/oh-package.json5
    {
        "dependencies": {
            // ...
            "libark_interop_loader.so": "file:src/main/cangjie/loader"
            // ...
        }
    }
    ```

4. On the ArkTS side, use requireCJLib to load libohos_app_cangjie_entry.so and call the Cangjie addNumber interface:

    ```typescript
    // Import the Cangjie loader module. The dynamic library name is fixed as the default loader library
    import {requireCJLib} from "libark_interop_loader.so";

    // Define the Cangjie interop function interface. The addNumber function name must match the function declaration mapped from Cangjie to ArkTS
    interface CustomLib {
        addNumber(a: number, b: number): number;
    }

    // Import the Cangjie dynamic library. The library name should match the package name containing the interop interface
    const cjLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;

    // Call the Cangjie interface
    let result = cjLib.addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

## Frequently Asked Questions

### How to Make Cangjie Module Loading Code in ArkTS Compatible with OpenHarmony 12 Release and Later Versions

**Issue Description**

Assuming you're using DevEco Studio 5.1.x IDE to write application code and employing either import syntax or loadNativeModule interface to load Cangjie modules on the ArkTS side, how should the code be modified to ensure compatibility with OpenHarmony 12 Release and later versions?

**Solution**

1. Create a loader folder under the cangjie directory in the ArkTS module, then create two files within it: the Cangjie module loader declaration file libark_interop_loader.d.ts and configuration file oh-package.json5. Using an entry ArkTS module as an example:

    - In libark_interop_loader.d.ts under the loader folder, provide the requireCJLib interface declaration:

        ```typescript
        // entry/src/main/cangjie/loader/libark_interop_loader.d.ts
        export declare function requireCJLib(s: string): Object
        ```

    - Associate libark_interop_loader.d.ts with the module loader in oh-package.json5 under the loader folder:

        ```json
        // entry/src/main/cangjie/loader/oh-package.json5
        {
            "name": "libark_interop_loader.so",
            "types": "./libark_interop_loader.d.ts",
            "version": "",
            "description": "Please describe the basic information."
        }
        ```

2. Configure dependency on the loader's so library in the dependencies field of the oh-package.json5 file within the ArkTS module:

    ```json
    // entry/oh-package.json5
    {
        "dependencies": {
            // ...
            "libark_interop_loader.so": "file:src/main/cangjie/loader"
            // ...
        }
    }
    ```

3. Modify the Cangjie module loading code on the ArkTS side to use [requireCJLib interface for loading](#method-3-using-requirecjlib-interface-to-load-cangjie-modules). Example modification for import syntax:

    Before modification:

    ```typescript
    // Import the Cangjie dynamic library. The library name should match the package name containing the interop interface
    import { addNumber } from "libohos_app_cangjie_entry.so";

    // Call the Cangjie interface
    let result = addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

    After modification:

    ```typescript
    // Import the Cangjie loader module. The dynamic library name is fixed as the default loader library
    import {requireCJLib} from "libark_interop_loader.so";

    // Define the Cangjie interop function interface. The addNumber function name must match the function declaration mapped from Cangjie to ArkTS
    interface CustomLib {
        addNumber(a: number, b: number): number;
    }

    // Import the Cangjie dynamic library. The library name should match the package name containing the interop interface
    const cjLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;

    // Call the Cangjie interface
    let result = cjLib.addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```
