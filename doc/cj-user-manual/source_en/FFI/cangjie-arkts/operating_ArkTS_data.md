# Using ArkTS Data in Cangjie

This chapter details how to work with ArkTS data through the JSValue type.

## Usage Methods

1. Obtain the ArkTS type corresponding to JSValue

   Parameters passed from ArkTS are of the anonymous type `JSValue`. To determine their actual type, you can:

   - Use `JSValue.typeof()` to get the type enumeration `JSType`.
   - Verify the type through validation interfaces (e.g., `JSValue.isNumber()`) if the type is known via other means (source code review, documentation, etc.).

2. Working with JSValue

   After determining the JSValue type, you can convert it to either a Cangjie type or an ArkTS reference:

   - **Convert to Cangjie type**: Creates a copy of ArkTS data in Cangjie. The original ArkTS data may be released during the Cangjie variable's lifecycle. Example: Converting ArkTS string to Cangjie String: `var a:String = JSValue.toString(JSContext)`.
   - **Convert to ArkTS reference**: Creates a reference to ArkTS data. The original data must not be released during the Cangjie variable's lifecycle. Example: Converting ArkTS string to JSString: `var b:JSString = JSValue.asString(JSContext)`.

3. Constructing ArkTS Data from Cangjie Types

   Use JSContext methods to construct ArkTS data from Cangjie types. For example, creating a `number`: `var a : Float64 = JSContext.number(Float64)`.

   The mapping between major ArkTS types and Cangjie types is as follows:

| ArkTS Type | Reference Type | typeof Type       |
| ---------- | -------------- | ----------------- |
| undefined  | JSUndefined    | JSType.UNDEFINED  |
| null       | JSNull         | JSType.NULL       |
| boolean    | JSBoolean      | JSType.BOOL       |
| number     | JSNumber       | JSType.NUMBER     |
| string     | JSString       | JSType.STRING     |
| object     | JSObject       | JSType.OBJECT     |
| Array      | JSArray        | JSType.OBJECT     |
| bigint     | JSBigInt       | JSType.BIGINT     |
| function   | JSFunction     | JSType.FUNCTION   |
| symbol     | JSSymbol       | JSType.SYMBOL     |

## Usage Examples

### Working with ArkTS Plain Objects

Example implementation of an interop function:

1. Cangjie function implementation:

    ```cangjie
    // Package name must match package name in cjpm.toml
    package ohos_app_cangjie_entry

    // Import interop libraries and macros
    import ohos.ark_interop.*

    // Interop function signature: parameters must be (JSContext, JSCallInfo), return type must be JSValue
    func addByObject(context: JSContext, callInfo: JSCallInfo): JSValue {
        // Get first argument from callInfo
        let arg0 = callInfo[0]
        // Verify arg0 is an object, otherwise return undefined
        if (!arg0.isObject()) {
            return context.undefined().toJSValue()
        }
        // Convert JSValue to Float64
        let a = arg0.asObject()["a"].toNumber()
        let b = arg0.asObject()["b"].toNumber()

        let result = a + b
        return context.number(result).toJSValue()
    }

    // Must register function with JSModule
    let EXPORT_MODULE = JSModule.registerModule {
        runtime, exports =>
            exports["addByObject"] = runtime.function(addByObject).toJSValue()
    }
    ```

2. Interop interface declaration:

    ```typescript
    // Index.d.ts for libohos_app_cangjie_entry.so
    export declare interface CustomObject {
        a: number;
        b: number;
    }
    // Cangjie interop function name must match registration name
    export declare function addByObject(args: CustomObject): number;
    ```

3. ArkTS function call:

    ```typescript
    // Import Cangjie dynamic library (name must match package name)
    import { addByObject } from "libohos_app_cangjie_entry.so";

    // Call Cangjie interface
    let result = addByObject({a: 1, b: 2});
    console.log("result = " + result);
    ```

You can also assign values to object properties or create new properties using `JSObject[key] = value`, where key can be Cangjie String, JSString, or JSSymbol types, and value is JSValue type.

> **Note:**
>
> Properties defined via `JSObject[key] = value` are writable, enumerable, and configurable.
> See [JavaScript Standard Built-in Objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) for more details.

**Important Considerations:**

1. Property assignment may fail silently in these scenarios:
   1. Target object is sealed (created via `Object.seal()`), preventing property modification.
   2. Target property has `writable: false` (set via `Object.defineProperty(object, key, {writable: false, value: xxx})`).

2. Enumerate enumerable properties of unknown objects:

   ```cangjie
   func handleUnknownObject(context: JSContext, target: JSObject): Unit {
       // Enumerate object's enumerable properties
       let keys = target.keys()
       println("target keys: ${keys}")
   }
   ```

3. Create new ArkTS objects using `JSContext.object()`.

4. Access the special ArkTS global object (available in all ArkTS code) via `JSContext.global`.

### Working with ArkTS Sendable Objects

ArkTS provides sendable objects for reference passing during concurrent communication.

Cangjie handles sendable objects the same way as regular ArkTS objects.

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

Operating on sendable objects in Cangjie:

```cangjie
// Package name must match package name in cjpm.toml
package ohos_app_cangjie_entry

// Import interop libraries and macros
import ohos.ark_interop.*

// Interop function signature
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

// Register function with JSModule
let EXPORT_MODULE = JSModule.registerModule {
    runtime, exports =>
        exports["readNumber"] = runtime.function(readNumber).toJSValue()
}
```

Interop interface declaration in Index.d.ts:

```typescript
// Index.d.ts for libohos_app_cangjie_entry.so
export declare function readNumber(data: SendableTestClass): number;

interface SendableTestClass {}
```

Creating sendable objects in ArkTS:

```typescript
// Import Cangjie dynamic library
import { readNumber } from "libohos_app_cangjie_entry.so"

// Create sendable object
let a = new SendableTestClass();
// Call Cangjie interface
let result = readNumber(a);
console.log("result = " + result);
```

### ArkTS Async Lock

To address data races between concurrent instances, ArkTS introduces async lock capabilities. AsyncLock objects support cross-instance reference passing. See [Async Lock](https://docs.openharmony.cn/pages/v5.1/en/application-dev/arkts-utils/arkts-async-lock-introduction.md) for details. This section focuses on async lock with sendable objects.

Cangjie implementation:

```cangjie
// Package name must match package name in cjpm.toml
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
        // Execute compute-intensive task in new thread
        // Return to ArkTS thread
        context.postJSTask {
            // Return result to ArkTS
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

Interop interface declaration in Index.d.ts:

```typescript
// Index.d.ts for libohos_app_cangjie_entry.so
export declare function testAsync(): Promise<boolean>;
export declare function readName(data: Some): Promise<string>;

interface Some {}
```

Main thread code in workerTest.ets:

```typescript
// workerTest.ets
import hilog from '@ohos.hilog';
import worker, {MessageEvents} from '@ohos.worker';
import {ArkTSUtils} from "@kit.ArkTS";

// Import Cangjie dynamic library
import { readName } from "libohos_app_cangjie_entry.so";

// Define Sendable class
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
  // Initialize event handler map
  const eventHandlers = new Map<string, (msg: MessageEvents) => void>();
  eventHandlers.set("close", (evt) => {
    thread.terminate();
  });
  eventHandlers.set("result", async (evt) => {
    let result = evt.data.value as boolean;
    const name = await a.getName();
    hilog.info(0, "worker", `result is ${result}, name is ${name}`);
  });
  // Listen for worker messages
  thread.onmessage = (evt) => {
    let type = evt.data.type as string;
    if (eventHandlers.has(type)) {
      eventHandlers.get(type)!(evt);
    } else {
      hilog.error(0, "worker", "unknown message type: %{public}s", type);
    }
  };
  // Create Sendable object
  let a = new Some();
  // Call Cangjie interface
  hilog.info(0, "test", `name: ${await readName(a)}`);
  // Send "begin" message to worker
  a.type = "begin";
  thread.postMessageWithSharedSendable(a);
}
```

Worker implementation in Worker.ets:

```typescript
// Worker.ets
import {ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker} from '@kit.ArkTS';
import hilog from '@ohos.hilog';

// Import Cangjie dynamic library
import { readName, testAsync } from "libohos_app_cangjie_entry.so";

import {Some} from "../workerTest";

// Get worker thread environment
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
// Listen for main thread messages
workerPort.onmessage = (evt) => {
  let some = evt.data as Some;
  if (some.type == "begin") {
    beginTask(some);
  }
}

async function beginTask(some: Some) {
  // Modify object property in worker thread
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

Starting the Worker in ArkTS:

```typescript
// Import Cangjie dynamic library
import { startTestWorker } from "../workerTest"

// Start Worker
startTestWorker();
```

### Calling ArkTS Functions

#### Regular Function Calls

After obtaining an ArkTS function (via parameter passing, global variables, or collection access), you can call it directly from Cangjie. This example shows ArkTS calling a Cangjie function, which then calls back to an ArkTS function.

1. ArkTS calling Cangjie:

    ```typescript
    // Index.d.ts for libohos_app_cangjie_entry.so
    export declare function addByCallback(a: number, b: number, callback: (result: number) => void): void;
    ```

    ```typescript
    // 1. Import Cangjie dynamic library
    import { addByCallback } from "libohos_app_cangjie_entry.so";

    // 2. Call Cangjie interface
    addByCallback(1, 2, (result) => {
        console.log(`1 + 2 = ${result}`);
    });
    ```2. Calling Back ArkTS Functions in Cangjie Code:

    ```cangjie
    package ohos_app_cangjie_entry

    internal import ohos.ark_interop.JSModule
    internal import ohos.ark_interop.JSContext
    internal import ohos.ark_interop.JSCallInfo
    internal import ohos.ark_interop.JSValue

    func addByCallback(context: JSContext, callInfo: JSCallInfo): JSValue {
        // Get the 1st and 2nd parameters and convert them to Float64
        let a = callInfo[0].toNumber()
        let b = callInfo[1].toNumber()
        // Convert the 3rd parameter to JSFunction
        let callback = callInfo[2].asFunction(context)
        // Calculate the result
        let result = a + b
        // Create ArkTS number from Cangjie Float64
        let retJSValue = context.number(result).toJSValue()
        // Call the callback function
        callback.call(retJSValue)
    }

    let EXPORT_MODULE = JSModule.registerModule {
        runtime, exports =>
            exports["addByCallback"] = runtime.function(addByCallback).toJSValue()
    }
    ```

#### Function Calls with `this` Pointer

The function in this example doesn't have a `this` pointer. For method calls that require a `this` pointer, you can specify it through the named parameter `thisArg`.

```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let callback = callInfo[0].asFunction(context)
    let thisArg = callInfo[1]

    callback.call(thisArg: thisArg)
}
```

In ArkTS code, you can call it through `object.method(...)`, which implicitly passes the `this` pointer.

```typescript
class Someone {
    id: number = 0;
    doSth(): void {
        console.log(`someone ${this.id} have done something`);
    }
}

let target = new Someone();

// Here the `this` pointer is implicitly passed, and the call works normally
target.doSth();

let doSth = target.doSth;
// Here the `this` pointer is not passed, causing an exception `can't read property of undefined`
doSth.call();
```

In Cangjie, the corresponding implementation is as follows:

```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let object = callInfo[0].asObject(context)
    // The `this` pointer is implicitly passed, and the call works normally
    object.callMethod("doSth")

    let doSth = object["doSth"].asFunction(context)
    // The `this` pointer is not passed, causing an exception `can't read property of undefined`
    doSth.call()
    // Explicitly passing the `this` pointer makes the call work normally
    doSth.call(thisArg: object.toJSValue())
}
```