# Loading Cangjie Modules in ArkTS

This chapter introduces how to load Cangjie modules in ArkTS. There are three ways to load Cangjie modules in ArkTS:

- Using the `import` syntax to load Cangjie modules: Supported from API version 18.
- Using the `loadNativeModule` interface to load Cangjie modules: Supported from API version 18.
- Using the `requireCJLib` interface to load Cangjie modules: Supported from API version 12.

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

## Method 3: Loading Cangjie Modules Using the `requireCJLib` Interface

> **Note:**
>
> This loading method is supported from API version 12. Minimum compatible version: OpenHarmony 12 Release.

The `requireCJLib` interface is similar in functionality to `loadNativeModule`, providing synchronous dynamic loading of Cangjie modules. The `requireCJLib` interface is provided by the Cangjie module loader `ark_interop_loader`.

**Interface Description**

```typescript
export declare function requireCJLib(moduleName: string): Object
```

**Parameters:**

| Parameter Name | Type   | Required | Description          |
| :------------ | :------ | :-------- | :------------------- |
| moduleName    | string | Yes      | Name of the Cangjie dynamic library to load |

Below is an example of loading the Cangjie module `ohos_app_cangjie_entry` using the `requireCJLib` interface and calling the `addNumber` function:

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
            "version": "1.0.0",
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

4. Use `requireCJLib` to load `libohos_app_cangjie_entry.so` on the ArkTS side and call the Cangjie `addNumber` interface:

    ```typescript
    // Import the Cangjie loader module. The dynamic library name is fixed as the default loader library
    import {requireCJLib} from "libark_interop_loader.so";

    // Define the Cangjie interoperation function interface. The function name must match the function declaration mapped from the Cangjie side to the ArkTS side
    interface CustomLib {
        addNumber(a: number, b: number): number;
    }

    // Import the Cangjie dynamic library. The library name is the Cangjie package name, which must match the package name of the interoperation interface
    const cjLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;

    // Call the Cangjie interface
    let result = cjLib.addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

## Frequently Asked Questions

### How to Make Cangjie Module Loading Code in ArkTS Compatible with OpenHarmony 12 Release and Later

**Issue Description**

Suppose you are using DevEco Studio 5.1.x IDE to write application code and loading Cangjie modules on the ArkTS side using the `import` syntax or the `loadNativeModule` interface. If you want the application to run on OpenHarmony 12 Release or later, how should you modify the code?

**Solution**

1. Create a `loader` folder under the `cangjie` folder in the ArkTS module. In the `loader` folder, create two files: the Cangjie module loader declaration file `libark_interop_loader.d.ts` and the configuration file `oh-package.json5`. Below is an example with the ArkTS module as `entry`:

    - Provide the `requireCJLib` interface declaration in the `libark_interop_loader.d.ts` file in the `loader` folder:

        ```typescript
        // entry/src/main/cangjie/loader/libark_interop_loader.d.ts
        export declare function requireCJLib(s: string): Object
        ```

    - Associate `libark_interop_loader.d.ts` with the module loader in the `oh-package.json5` file in the `loader` folder:

        ```json
        // entry/src/main/cangjie/loader/oh-package.json5
        {
            "name": "libark_interop_loader.so",
            "types": "./libark_interop_loader.d.ts",
            "version": "",
            "description": "Please describe the basic information."
        }
        ```

2. Configure the dependency on the module loader's `.so` library in the `dependencies` field of the `oh-package.json5` file in the ArkTS module:

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

3. Modify the ArkTS-side code for loading Cangjie modules to use [Loading Cangjie Modules Using the `requireCJLib` Interface](#method-3-loading-cangjie-modules-using-the-requirecjlib-interface). Here is an example using the `import` syntax to load Cangjie modules:

    Before modification:

    ```typescript
    // Import the Cangjie dynamic library. The library name is the Cangjie package name, which must match the package name of the interoperation interface
    import { addNumber } from "libohos_app_cangjie_entry.so";

    // Call the Cangjie interface
    let result = addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

    After modification:

    ```typescript
    // Import the Cangjie loader module. The dynamic library name is fixed as the default loader library
    import {requireCJLib} from "libark_interop_loader.so";

    // Define the Cangjie interoperation function interface. The function name must match the function declaration mapped from the Cangjie side to the ArkTS side
    interface CustomLib {
        addNumber(a: number, b: number): number;
    }

    // Import the Cangjie dynamic library. The library name is the Cangjie package name, which must match the package```
(Note: The provided input is an empty code block delimiter with no content inside. Since there's nothing to translate within the code block, I'm returning the exact same structure as received, maintaining the Markdown syntax integrity as per your instructions.)