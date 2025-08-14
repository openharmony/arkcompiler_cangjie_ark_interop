# Using ArkTS Data in Cangjie

This chapter details how to use ArkTS data through the JSValue type.

## Usage Methods

1. Obtain the ArkTS type corresponding to JSValue

   Parameters passed from ArkTS are of the anonymous type `JSValue`. To work with them, you first need to determine their type. There are two ways to obtain the type:

   - Use `JSValue.typeof()` to get the type enumeration `JSType`.
   - Know the type through other means (including but not limited to reading ArkTS source code, referencing documentation, etc.) and then verify it using type-checking interfaces, such as `JSValue.isNumber()` to check if it's a number type.

2. Using JSValue

   After determining the JSValue type, you can convert `JSValue` to the corresponding Cangjie type or ArkTS reference.

   - Convert to a Cangjie type. In this case, the Cangjie data is a copy of the ArkTS data, and the ArkTS data may be released during the Cangjie variable's lifecycle. For example, converting an ArkTS string to a Cangjie String: `var a:String = JSValue.toString(JSContext)`.
   - Convert to an ArkTS reference. Here, the Cangjie data is a reference to the ArkTS data, and the ArkTS data must not be released during the Cangjie variable's lifecycle. For example, converting an ArkTS string to JSString: `var b:JSString = JSValue.asString(JSContext)`.

3. Constructing ArkTS Data from Cangjie Types

   ArkTS data can be constructed from Cangjie types using methods from JSContext. For example, to create a `number`: `var a : Float64 = JSContext.number(Float64)`.

   The mapping of main ArkTS data types to Cangjie types is as follows:

| ArkTS Type | Reference Type | typeof Type      |
| ---------- | -------------- | ---------------- |
| undefined  | JSUndefined    | JSType.UNDEFINED |
| null       | JSNull         | JSType.NULL      |
| boolean    | JSBoolean      | JSType.BOOL      |
| number     | JSNumber       | JSType.NUMBER    |
| string     | JSString       | JSType.STRING    |
| object     | JSObject       | JSType.OBJECT    |
| Array      | JSArray        | JSType.OBJECT    |
| bigint     | JSBigInt       | JSType.BIGINT    |
| function   | JSFunction     | JSType.FUNCTION  |
| symbol     | JSSymbol       | JSType.SYMBOL    |

## Usage Examples

### Manipulating Ordinary ArkTS Objects

Example from an interoperability function implementation:

1. Cangjie function implementation:

    ```cangjie
    // Define the package name, which must match the package name in cjpm.toml
    package ohos_app_cangjie_entry

    // Import the interoperability library ark_interop and interoperability macros
    import ohos.ark_interop.*

    // Define the interoperability function. The parameter types must be (JSContext, JSCallInfo), and the return type must be JSValue.
    func addByObject(context: JSContext, callInfo: JSCallInfo): JSValue {
        // callInfo records the function call parameters. Below is how to get the first parameter:
        let arg0 = callInfo[0]
        // Check if parameter 0 is an object; otherwise, return undefined
        if (!arg0.isObject()) {
          return context.undefined().toJSValue()
        }
        // Convert JSValue to Float64
        let a = arg0.asObject()["a"].toNumber()
        let b = arg0.asObject()["b"].toNumber()

        let result = a + b
        return context.number(result).toJSValue()
    }

    // This function must be registered in JSModule
    let EXPORT_MODULE = JSModule.registerModule {
        runtime, exports =>
            exports["addByObject"] = runtime.function(addByObject).toJSValue()
    }
    ```

2. Interoperability interface declaration:

    ```typescript
    // Index.d.ts corresponding to libohos_app_cangjie_entry.so
    export declare interface CustomObject {
        a: number;
        b: number;
    }
    // Define the Cangjie interoperability function, with the name matching the registered name on the Cangjie side.
    export declare function addByObject(args: CustomObject): number;
    ```

3. ArkTS function call:

    ```typescript
    // Import the Cangjie dynamic library. The library name is the Cangjie package name, which must match the package name of the interoperability interface.
    import { addByObject } from "libohos_app_cangjie_entry.so";

    // Call the Cangjie interface
    let result = addByObject({a: 1, b: 2});
    console.log("result = " + result);
    ```

In addition to reading properties from objects, you can also assign values to properties or create new properties using `JSObject[key] = value`, where `key` can be a Cangjie String, JSString, or JSSymbol type, and `value` is of type JSValue.

> **Note:**
>
> When defining properties via `JSObject[key] = value`, the properties are writable, enumerable, and configurable.
> For more details, see [JavaScript Standard Built-in Objects](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object).

**Important Notes:**

1. Property assignment may fail in the following scenarios without throwing exceptions or logging:

   1. The target object is a sealed object. Objects created with `Object.seal()` cannot have new properties added or existing properties modified.
   2. The target property's `writable` is false. Properties defined with `Object.defineProperty(object, key, {writable: false, value: xxx})` cannot be modified.

2. For an unknown object, you can enumerate its enumerable properties:

   ```cangjie
   func handleUnknownObject(context: JSContext, target: JSObject): Unit {
       // Use the keys interface to enumerate the object's enumerable properties
       let keys = target.keys()
       println("target keys: ${keys}")
   }
   ```

3. To create a new ArkTS object, use `JSContext.object()`.

4. The ArkTS runtime has a special global object accessible from any ArkTS code. On the Cangjie side, it can be accessed via `JSContext.global`.

### Manipulating ArkTS Sendable Objects

ArkTS provides the sendable object type to support reference passing during concurrent communication, addressing the need for large object transfers.

On the Cangjie side, sendable objects are manipulated the same way as ordinary ArkTS objects.

Defining a sendable object in ArkTS:

```typescript
// Function definition
@Sendable
class SendableTestClass {
  desc: string = "sendable: this is SendableTestClass ";
  num1: number = 5;
  num2: number = 5;
  printName() {
    console.info("sendable: SendableTestClass desc is: " + this.desc);
  }
  get getNum(): number {
    return this.num1;
  }
}
```

Manipulating sendable objects in Cangjie:

```cangjie
// Define the package name, which must match the package name in cjpm.toml
package ohos_app_cangjie_entry

// Import the interoperability library ark_interop and interoperability macros
import ohos.ark_interop.*

// Define the interoperability function. The parameter types must be (JSContext, JSCallInfo), and the return type must be JSValue.
func readNumber(context: JSContext, callInfo: JSCallInfo): JSValue {
    let obj = callInfo[0].asObject()
    // Get properties from JSObject
    let argA = obj["num1"]
    let argB = obj["num2"]
    // Convert JSValue to Float64
    let a = argA.toNumber()
    let b = argB.toNumber()

    let result = a + b
    return context.number(result).toJSValue()
}

// This function must be registered in JSModule
let EXPORT_MODULE = JSModule.registerModule {
    runtime, exports =>
        exports["addByObject"] = runtime.function(addByObject).toJSValue()
}
```

Interoperability interface declaration in Index.d.ts:

```typescript
// Index.d.ts corresponding to libohos_app_cangjie_entry.so
export declare function readNumber(data: SendableTestClass): number;

interface SendableTestClass {}
```

Constructing sendable objects in ArkTS:

```typescript
// Import the Cangjie dynamic library. The library name is the Cangjie package name, which must match the package name of the interoperability interface.
import { readNumber } from "libohos_app_cangjie_entry.so"

// Construct a sendable object
let a = new SendableTestClass();
// Call the Cangjie interface
let result = readNumber(a);
console.log("result = " + result);
```

### ArkTS Async Lock

To address data race issues between concurrent instances, ArkTS introduces asynchronous lock capabilities. For developer efficiency, AsyncLock objects support cross-concurrent instance reference passing. For details, refer to [Async Lock](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/arkts-utils/arkts-async-lock-introduction.md). This section focuses on scenarios combining async locks with sendable objects.

Cangjie implementation:

```cangjie
// Define the package name, which must match the package name in cjpm.toml
package ohos_app_cangjie_entry

internal import ohos.ark_interop.JSModule
internal import ohos.ark_interop.JSContext
internal import ohos.ark_interop.JSCallInfo
internal import ohos.ark_interop.JSValue

import ohos.hilog.HilogChannel
let logger = HilogChannel(0, 0, "WBT")

func testAsync(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Create PromiseCapability
    let promise = context.promiseCapability()
    spawn {
        // Use a new thread to execute compute-intensive tasks
        // Return to the ArkTS thread
        context.postJSTask {
            // Return the result to ArkTS
            promise.resolve(context.string("abcdedf").toJSValue())
        }
    }
    // Return Promise
    promise.toJSValue()
}

func readName(context: JSContext, callInfo: JSCallInfo): JSValue {
    let some = callInfo[0].asObject()
    some["lock"].asObject().callMethod("lockAsync", context.function { context, callInfo =>
        return some["name"]
    }.toJSValue())
}

let EXPORT_MODULE = JSModule.registerModule {
    runtime, exports =>
        exports["testAsync"] = runtime.function(testAsync).toJSValue()
        exports["readName"] = runtime.function(readName).toJSValue()
}
```

Interoperability interface declaration in Index.d.ts:

```typescript
// Index.d.ts corresponding to libohos_app_cangjie_entry.so
export declare function testAsync(): Promise<boolean>;
export declare function readName(data: Some): Promise<string>;

interface Some {}
```

In entry->src->main->ets, create a file named workerTest.ets. The main thread code is as follows:
```typescript
// workerTest.ets
import hilog from '@ohos.hilog';
import worker, {MessageEvents} from '@ohos.worker';
import {ArkTSUtils} from "@kit.ArkTS";

// Import the Cangjie dynamic library. The library name is the Cangjie package name, which must match the package name of the interoperability interface.
import { readName } from "libohos_app_cangjie_entry.so";

// Define the Sendable class
@Sendable
export class Some {
  name: string = "safd";
  type: string = "";
  result: boolean = false;
  lock: ArkTSUtils.locks.AsyncLock;

  constructor() {
    this.lock = new ArkTSUtils.locks.AsyncLock();
  }

  getName(): Promise<string> {
    return this.lock.lockAsync(() => {
      return this.name;
    });
  }

  setName(value: string): Promise<void> {
    return this.lock.lockAsync(() => {
      this.name = value;
    });
  }
}
// Program entry
export async function startTestWorker() {
  hilog.info(0, "test", "worker test begin");
  // Create worker
  const thread = new worker.ThreadWorker("entry/ets/workers/Worker.ets");
  // Create and initialize the event callback table
  const eventHandlers = new Map<string, (msg: MessageEvents) => void>();
  eventHandlers.set("close", (evt) => {
    thread.terminate();
  });
  eventHandlers.set("result", async (evt) => {
    let result = evt.data.value as boolean;
    const name = await a.getName();
    hilog.info(0, "worker", `result is ${result}, name is ${name}`);
  });
  // Listen to worker messages
  thread.onmessage = (evt) => {
    let type = evt.data.type as string;
    if (eventHandlers.has(type)) {
      eventHandlers.get(type)!(evt);
    } else {
      hilog.error(0, "worker", "unknown message type: %{public}s", type);
    }
  };
  // Create a Sendable object
  let a = new Some();
  // Invoke Cangjie interface
  hilog.info(0, "test", `name: ${await readName(a)}`);
  // Send message "begin" to worker
  a.type = "begin";
  thread.postMessageWithSharedSendable(a);
}
```

In entry->src->main->ets, create a workers folder. Inside the workers folder, create a Workers.ets file with the following code:

```typescript
// Workers.ets
import {ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker} from '@kit.ArkTS';
import hilog from '@ohos.hilog';

// Import Cangjie dynamic library, whose name must match the package name containing the interoperability interfaces
import { readName, testAsync } from "libohos_app_cangjie_entry.so";

import {Some} from "../workerTest";

// Get worker thread environment
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
// Listen to main thread messages
workerPort.onmessage = (evt) => {
  let some = evt.data as Some;
  if (some.type == "begin") {
    beginTask(some);
  }
}

async function beginTask(some: Some) {
  // Modify object properties in worker thread
  await some.setName("modified");
  some.type = "modify";
  hilog.info(0, "worker", `worker name: ${await readName(some)}`);
  // Call Cangjie function
  testAsync().then(data => {
    hilog.info(0, "worker", `resolved: ${data}`);
    workerPort.postMessage({"type": "result", value: data});
  }).catch((err: Error) => {
    hilog.error(0, "worker", `caught error: ${err.message}`);
    workerPort.postMessage({"type": "result", value: false});
  });
}
```

Start the Worker in ArkTS:

```typescript
// Import the Cangjie dynamic library. The library name must be the same as the Cangjie package name, and this name must match the package name where the interoperability interface is located.
import { startTestWorker } from "../workerTest"

// Start the Worker
startTestWorker();
```

### Invoking ArkTS Functions

#### Regular Function Calls

After obtaining an ArkTS function (via parameter passing, global variable transfer, or retrieval from ArkTS data collections like array indexing), it can be directly invoked in Cangjie.
This example first calls a Cangjie function from ArkTS, then implements a callback to an ArkTS function within the Cangjie function.

1. ArkTS calls Cangjie:

    ```typescript
    // Index.d.ts corresponding to libohos_app_cangjie_entry.so
    export declare function addByCallback(a: number, b: number, callback: (result: number) => void): void;
    ```

    ```typescript
    // 1. Import Cangjie dynamic library, whose name must match the package name containing the interoperability interfaces
    import { addByCallback } from "libohos_app_cangjie_entry.so";

    // 2. Call Cangjie interface
    addByCallback(1, 2, (result) => {
        console.log(`1 + 2 = ${result}`);
    });
    ```

2. Cangjie code calls back ArkTS function:

    ```cangjie
    package ohos_app_cangjie_entry

    internal import ohos.ark_interop.JSModule
    internal import ohos.ark_interop.JSContext
    internal import ohos.ark_interop.JSCallInfo
    internal import ohos.ark_interop.JSValue

    func addByCallback(context: JSContext, callInfo: JSCallInfo): JSValue {
        // Get 1st and 2nd parameters and convert to Float64
        let a = callInfo[0].toNumber()
        let b = callInfo[1].toNumber()
        // Convert 3rd parameter to JSFunction
        let callback = callInfo[2].asFunction(context)
        // Calculate result
        let result = a + b
        // Create ArkTS number from Cangjie Float64
        let retJSValue = context.number(result).toJSValue()
        // Invoke callback function
        callback.call(retJSValue)
    }

    let EXPORT_MODULE = JSModule.registerModule {
        runtime, exports =>
            exports["addByCallback"] = runtime.function(addByCallback).toJSValue()
    }
    ```

#### Function Calls with this Pointer

This use case demonstrates functions without this pointers. For method calls requiring this pointers, specify them via the named parameter `thisArg`.

```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let callback = callInfo[0].asFunction(context)
    let thisArg = callInfo[1]

    callback.call(thisArg: thisArg)
}
```

In ArkTS code, you can invoke via `object.method(...)`, which implicitly passes the this pointer.

```typescript
class Someone {
    id: number = 0;
    doSth(): void {
        console.log(`someone ${this.id} have done something`);
    }
}

let target = new Someone();

// Implicit this pointer passing - works normally
target.doSth();

let doSth = target.doSth;
// No this pointer passed - throws `can't read property of undefined` error
doSth.call();
```

The equivalent Cangjie implementation:

```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let object = callInfo[0].asObject(context)
    // Implicit this pointer passing - works normally
    object.callMethod("doSth")

    let doSth = object["doSth"].asFunction(context)
    // No this pointer passed - throws `can't read property of undefined` error
    doSth.call()
    // Explicit this pointer passing - works normally
    doSth.call(thisArg: object.toJSValue())
}
```