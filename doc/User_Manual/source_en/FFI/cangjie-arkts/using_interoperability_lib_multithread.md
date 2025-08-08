# Using Interoperability Libraries in Cangjie Multithreading

ArkTS is a single-threaded execution virtual machine that does not provide any concurrency fault tolerance at runtime, whereas Cangjie syntactically supports memory-sharing multithreading.

If multithreading is used without restrictions in interoperability scenarios, unexpected errors may occur. Therefore, certain specifications and guidelines are required to ensure proper program execution:

1. ArkTS code and most interoperability interfaces can only be executed on the ArkTS thread; otherwise, a Cangjie exception will be thrown.
2. Before entering other threads, all dependent ArkTS data must be converted to Cangjie data.
3. If ArkTS interfaces need to be used in other threads, the execution must be switched to the ArkTS thread via `context.postJSTask`.

The following example demonstrates specific practices. This case involves an interoperability function that adds two numbers and invokes a callback function to return the sum.

1. Define the Cangjie function:

    ```cangjie
    package ohos_app_cangjie_entry

    import ohos.ark_interop.*

    // Class name has no impact
    class Main {
        // Define static constructor
        static init() {
            // Register key-value pairs
            JSModule.registerFunc("addNumberAsync", addNumberAsync)
        }
    }

    func addNumberAsync(context: JSContext, callInfo: JSCallInfo): JSValue {
        // Get parameter list from JSCallInfo
        let arg0: JSValue = callInfo[0]
        let arg1: JSValue = callInfo[1]
        let arg2: JSValue = callInfo[2]
        // Convert JSValue to Cangjie types
        let a: Float64 = arg0.toNumber()
        let b: Float64 = arg1.toNumber()
        let callback = arg2.asFunction(context)
        // Create new Cangjie thread
        spawn {
            // Actual Cangjie function behavior
            let value = a + b
            // Initiate asynchronous callback
            context.postJSTask {
                // Create result
                let result = context.number(value).toJSValue()
                // Invoke JS callback
                callback.call(result)
            }
        }

        // Return void
        return context.undefined().toJSValue()
    }
    ```

2. Provide interface declarations for interoperability in the Index.d.ts file:

    ```typescript
    // Index.d.ts corresponding to libohos_app_cangjie_entry.so
    export declare function addNumberAsync(a: number, b: number, callback: (result: number)=>void): void;
    ```

3. ArkTS calls the Cangjie function:

    ```typescript
    // Import Cangjie dynamic library, whose name matches the Cangjie package name and must be consistent with the package name containing the interoperability interfaces
    import { addNumberAsync } from "libohos_app_cangjie_entry.so";

    // Call Cangjie function
    addNumberAsync(1, 2, (result)=> {
        console.log("1 + 2 = " + result);
    });
    ```

ArkTS supports Promise, which encapsulates callback mechanisms. When combined with async/await syntax, it transforms callback mechanisms into synchronous invocation forms. For the previous example, here's how to define and access interfaces using Promise:

1. Define the Cangjie function:

    ```cangjie
    package ohos_app_cangjie_entry

    import ohos.ark_interop.*

    // Interface definition
    func addNumberAsync(context: JSContext, callInfo: JSCallInfo): JSValue {
        // Convert parameters to Cangjie types
        let a = callInfo[0].toNumber()
        let b = callInfo[1].toNumber()
        // Create PromiseCapability object
        let promise = context.promiseCapability()
        // Create new thread
        spawn {
            // Execute Cangjie logic in new thread
            let result = a + b
            // Switch to ArkTS thread
            context.postJSTask {
                // Execute resolve in ArkTS thread
                promise.resolve(context.number(result).toJSValue())
            }
        }
        // Return Promise
        promise.toJSValue()
    }
    ```

2. Provide interface declarations for interoperability in the Index.d.ts file:

    ```typescript
    // Index.d.ts corresponding to libohos_app_cangjie_entry.so
    export declare function addNumberAsync(a: number, b: number): Promise<number>;
    ```

3. ArkTS calls the Cangjie function:

    ```typescript
    // Import Cangjie dynamic library, whose name matches the Cangjie package name and must be consistent with the package name containing the interoperability interfaces
    import { addNumberAsync } from "libohos_app_cangjie_entry.so";

    async function call() {
        // Call Cangjie function
        let result = await addNumberAsync(1, 2);
        console.log("1 + 2 = " + result);
    }

    call();
    ```