# Loading Cangjie Modules in ArkTS

This chapter introduces how to load Cangjie modules in ArkTS. There are three ways to load Cangjie modules in ArkTS:

- Using the `import` syntax to load Cangjie modules: Supported from API version 18.
- Using the `loadNativeModule` interface to load Cangjie modules: Supported from API version 18.

## Method 1: Loading Cangjie Modules Using the `import` Syntax

> **Note:**
>
> - This loading method is supported from API version 18. Minimum compatible version: OpenHarmony 5.1.0(18). If the code for loading Cangjie modules needs to run on OpenHarmony 12 Release or later, please use [Loading Cangjie Modules Using the `requireCJLib` Interface](#method-3-loading-cangjie-modules-using-the-requirecjlib-interface).
> - The method of loading Cangjie modules using the `import` syntax is consistent with loading native modules using the `import` syntax. For detailed information, refer to: [Loading Native Modules Statically](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/arkts-utils/arkts-import-native-module.md).

Below is an example of loading the Cangjie module `ohos_app_cangjie_entry` using the `import` syntax and calling the `addNumber` interface:

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
        // The function must be registered to JSModule
        let EXPORT_MODULE = JSModule.registerModule {
            runtime, exports =>
                exports["addNumber"] = runtime.function(addNumber).toJSValue()
        }
        ```

    - Provide the ArkTS-side interface declaration in the `Index.d.ts` file under the `types->libohos_app_cangjie_entry` folder:

        ```typescript
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/Index.d.ts
        export declare function addNumber(a: number, b: number): number;
        ```

    - Associate `Index.d.ts` with the corresponding `.so` library of the Cangjie module in the `oh-package.json5` file under the `types->libohos_app_cangjie_entry` folder:

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

4. Use the `import` syntax to directly import the Cangjie module on the ArkTS side and call the Cangjie `addNumber` interface:

    ```typescript
    // Import the Cangjie dynamic library. The library name is the Cangjie package name, which must match the package name of the interoperation interface
    import { addNumber } from "libohos_app_cangjie_entry.so";
    
    // Call the Cangjie interface
    let result = addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

## Method 2: Loading Cangjie Modules Using the `loadNativeModule` Interface

> **Note:**
>
> - This loading method is supported from API version 18. Minimum compatible version: OpenHarmony 5.1.0(18). If the code for loading Cangjie modules needs to run on OpenHarmony 12 Release or later, please use [Loading Cangjie Modules Using the `requireCJLib` Interface](#method-3-loading-cangjie-modules-using-the-requirecjlib-interface).
> - For detailed information about the `loadNativeModule` interface, refer to: [Loading Native Modules Dynamically in Synchronous Mode](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/arkts-utils/js-apis-load-native-module.md)

Below is an example of loading the Cangjie module `ohos_app_cangjie_entry` using the `loadNativeModule` interface and calling the `addNumber` function:

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
        // The function must be registered to JSModule
        let EXPORT_MODULE = JSModule.registerModule {
            runtime, exports =>
                exports["addNumber"] = runtime.function(addNumber).toJSValue()
        }
        ```

    - Provide the ArkTS-side interface declaration in the `Index.d.ts` file under the `types->libohos_app_cangjie_entry` folder:

        ```typescript
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/Index.d.ts
        export declare function addNumber(a: number, b: number): number;
        ```

    - Associate `Index.d.ts` with the corresponding `.so` library of the Cangjie module in the `oh-package.json5` file under the `types->libohos_app_cangjie_entry` folder:

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

4. Use `loadNativeModule` to load `libohos_app_cangjie_entry.so` on the ArkTS side and call the Cangjie `addNumber` interface:

    ```typescript
    // Use the loadNativeModule interface to load the Cangjie dynamic library
    let module: ESObject = loadNativeModule("libohos_app_cangjie_entry.so");
    
    // Call the Cangjie interface
    let result: number = module.addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```
