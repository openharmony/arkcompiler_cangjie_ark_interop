# Cangjie-ArkTS Declarative Interop Macro

The Cangjie-ArkTS Declarative Interop Macro automatically generates ArkTS declaration files and interop layer code by parsing annotated Cangjie code, providing developers with a near-native calling experience.

## Usage Guide

For DevEco Studio configuration, refer to [Adding Cangjie Module in ArkTS Project](./add_cangjie_module.md). After configuration, the interop module can be implemented.

Currently, for functions (asynchronous functions), interfaces, and classes that need to be called by ArkTS, the interop declaration macro `@Interop` can be used for annotation. The following demonstrates the specific usage of the declarative interop macro using a regular function scenario as an example. For examples of asynchronous functions, interfaces, classes, etc., refer to [Detailed Scenario Descriptions](#detailed-scenario-descriptions).

### Implementing the Cangjie Interop Module

After successfully inserting the Cangjie interop module into an ArkTS project, custom methods can be implemented in the generated index.cj file. Here is an example:

1. The user implements a Cangjie function named `addF64` and annotates it with `@Interop[ArkTS]` to mark it as a function for interop use. Assume the file is named demo.cj, with the following content:

   ```cangjie
   // Define the package name, which must match the package name in cjpm.toml
   package ohos_app_cangjie_entry
   // Import the interop library ark_interop and the interop macro
   import ohos.ark_interop.*
   import ohos.ark_interop_macro.*
   // Implement the custom function addF64, which takes two numbers as input and returns their sum
   @Interop[ArkTS]
   public func addF64(a: Float64, b!: Float64): Float64 {
       a + b
   }
   ```

2. In DevEco Studio, select the Cangjie file demo.cj mentioned above. Right-click in the file editor and choose **Generate... > Cangjie-ArkTS Interop API**. This will generate the Index.d.ts declaration file and oh_package.json5 configuration file in the **cangjie->types->libohos_app_cangjie_entry** directory, as well as the ark_interop_api.d.ts declaration file and oh_package.json5 configuration file in the **cangjie -> ark_interop_api** directory.

    > **Note:**
    >
    > The .d.ts file generated in the ark_interop_api directory is for compatibility with applications running on OpenHarmony 12 Release or later. If there are no compatibility requirements, this folder can be ignored.

   The content of Index.d.ts in the types->libohos_app_cangjie_entry directory is as follows:

   ```cangjie
   export declare function addF64(a: number, b: number): number
   ```

   The oh_package.json5 in the types->libohos_app_cangjie_entry directory is as follows:

   ```cangjie
   {
     "name": "libohos_app_cangjie_entry.so",
     "types": "./Index.d.ts",
     "version": "1.0.0",
     "description": ""
   }
   ```

   The content of ark_interop_api.d.ts in the ark_interop directory is as follows:

   ```cangjie
   export declare interface CustomLib {
       addF64(a: number, b: number): number
   }
   ```

   The oh_package.json5 in the ark_interop directory is as follows:

   ```cangjie
   {
     "name": "libark_interop_api.so",
     "types": "./ark_interop_api.d.ts",
     "version": "1.0.0",
     "description": ""
   }
   ```

   Dependencies are automatically added to the oh-package.json5 file in the entry:

   ```cangjie
   "dependencies": {
     // ...
     "libohos_app_cangjie_entry.so": "file:./src/main/cangjie/types/libohos_app_cangjie_entry",
     "libark_interop_api.so": "file:./src/main/cangjie/ark_interop_api",
     // ...
   }
   ```

> **Important:**
>
> In the same Cangjie module (the same package and its sub-packages), the following rules must be followed; otherwise, compilation errors or symbol conflicts may occur:
>
> - Functions, interfaces, and classes annotated with `@Interop` must not have the same name.
>
>   Incorrect example:
>
>   ```cangjie
>   @Interop[ArkTS]
>   public func addNumber() : Unit {}
>
>   @Interop[ArkTS]
>   public func addNumber(a: Float64) : Unit {} // Compilation error in the same package; symbol conflicts may occur in parent-child packages
>   ```
>
> - Functions, interfaces, and classes annotated with `@Interop` must not have the same name as those registered with JSModule.registerModule, JSModule.registerClass, or JSModule.registerFunc.
>
>   Incorrect example:
>
>   ```cangjie
>   @Interop[ArkTS]
>   public func addNumber() : Unit {}
>
>   func addFloat() {}
>   let EXPORT_MODULE = JSModule.registerModule {
>       runtime, exports => exports["addNumber"] = runtime.function(addFloat).toJSValue() // This will override the function addNumber annotated with @Interop
>   }
>   ```

### Using the Cangjie Module in ArkTS Code

After implementing the Cangjie interop module, import the Cangjie ohos_app_cangjie_entry module in ArkTS code to load the custom Cangjie interop module and call its interfaces.

Example of using the `addF64` function provided by the Cangjie interop module in an ArkTS application:

```typescript
// Import the Cangjie dynamic library. The library name must match the package name of the interop interface.
import { addF64 } from "libohos_app_cangjie_entry.so"

// Call the Cangjie interface
console.log("result " + addF64(1, 2))
```

## Detailed Scenario Descriptions

The declarative interop macro can annotate functions (asynchronous functions), interfaces, and classes. The recommended usage for different scenarios is as follows:

| Scenario | Type | Annotation |
| :--- | :--- | :--- |
| ArkTS calling Cangjie functions | Function | @Interop[ArkTS] |
| ArkTS calling time-consuming Cangjie functions | Asynchronous function | @Interop[ArkTS, Async] |
| Passing objects created on the ArkTS side to Cangjie | Interface | @Interop[ArkTS] |
| Returning objects created on the Cangjie side to ArkTS | Class | @Interop[ArkTS] for the entire class<br>@Interop[ArkTS, Invisible] for members not intended to be exposed |

### Functions

For functions annotated with the declarative interop macro, the following conditions must be met; otherwise, compilation errors will occur:

- Must be annotated with `public`
- Type parameters are not supported
- Named parameters are supported, but the ArkTS calling method is the same as for non-named parameters
- Default values are not supported

For an example of function interop usage, refer to [Usage Guide](#usage-guide).

### Asynchronous Functions

For asynchronous functions annotated with the declarative interop macro, the following conditions must be met; otherwise, compilation errors will occur:

- Must be annotated with `public`
- Type parameters are not supported
- Named parameters are supported, but the ArkTS calling method is the same as for non-named parameters
- Default values are not supported
- The types `JSStringEx`, `JSArrayEx<T>`, and `JSHashMapEx<K, V>` cannot be used in asynchronous functions

Example of asynchronous function interop usage:

```cangjie
// Create an interop function on the Cangjie side
package ohos_app_cangjie_entry

import ohos.ark_interop.*
import ohos.ark_interop_macro.*

@Interop[ArkTS, Async]
public func doAsync(a: Float64, b: Float64): Float64 {
    a + b
}
```

Automatically generated ArkTS interface:

```typescript
// Generated .d.ts after selecting Generate... > Cangjie-ArkTS Interop API
export declare function doAsync(a: number, b: number): Promise<number>
```

Calling the Cangjie module from the ArkTS side:

```typescript
// Import the Cangjie dynamic library. The library name must match the package name of the interop interface.
import { doAsync } from "libohos_app_cangjie_entry.so";

doAsync(1, 2).then(result => {
    console.log("result " + result);
});
```

### Interfaces

For interfaces annotated with the declarative interop macro, the following conditions must be met; otherwise, compilation errors will occur:

- Must be annotated with `public`
- Type parameters are not supported
- Inheriting other interfaces is not supported
- Member functions without modifiers are supported, with the same restrictions as functions
- Operator overloading is not supported
- Member properties are supported, including the `mut` modifier

Example of interface interop usage:

```cangjie
// Create an interop function on the Cangjie side
package ohos_app_cangjie_entry

import ohos.ark_interop.*
import ohos.ark_interop_macro.*

@Interop[ArkTS]
public interface InterfaceDemo {
    mut prop id: Float64
    func foo(a!: Float64): Float64
}

@Interop[ArkTS]
public func doInterface(a: InterfaceDemo): Float64  {
    return a.foo(a: a.id)
}
```

Automatically generated ArkTS interface:

```typescript
// Generated .d.ts after selecting Generate... > Cangjie-ArkTS Interop API
export declare interface InterfaceDemo {
    id: number;
    foo: (a: number) => number;
}

export declare function doInterface(a: InterfaceDemo): number;
```

Calling the Cangjie module from the ArkTS side:

```typescript
// Import the Cangjie dynamic library. The library name must match the package name of the interop interface.
import { InterfaceDemo, doInterface } from "libohos_app_cangjie_entry.so";

let callbackInterface = (a: number): number => {
  return a + 1;
}
let inter: InterfaceDemo = {foo: callbackInterface, id: 6};
console.log("result " + doInterface(inter));
```

### Classes

For classes annotated with the declarative interop macro, the following conditions must be met; otherwise, compilation errors will occur:

- Must be annotated with `public`
- Type parameters are not supported
- Inheriting other classes is supported but will not be expanded
- Inheriting interfaces is supported but will not be expanded
- Static initializers are not supported
- If there is only one regular constructor or primary constructor, it must be annotated with `public`; other modifiers are not supported, and member variable parameters and default values are not supported
- Member variables can have default values, must be annotated with `public`, other modifiers are not supported, and variable type annotations cannot be omitted
- Operator overloading is not supported
- Member properties must be annotated with `public`

> **Note:**
>
> The constraints on class features apply only to members intended to be exposed to ArkTS. Members not intended to be exposed can be marked by omitting the `public` modifier or using `@Interop[ArkTS, Invisible]`.

Example of class interop usage:

```cangjie
// Create an interop function on the Cangjie side
package ohos_app_cangjie_entry

import ohos.ark_interop.*
import ohos.ark_interop_macro.*

@Interop[ArkTS]
public class ClassDemo {
    public var value2: Float64 = 1.0
    public let value3: Float64 = 1.0
    @Interop[ArkTS, Invisible]
    public var value4: Float64 = 1.0

    public init(a: Float64) {
        value2 = a
    }

    public func foo(a: Float64 ): Float64 {
        a
    }

    @Interop[ArkTS, Invisible]
    public func foo2(): Float64 {
        1.0
    }

    public mut prop id: Float64 {
        get() {
            value2
        }
        set(value) {
            this.value2 = value
        }
    }

    public prop id2: Float64 {
        get() {
            value3
        }
    }

    @Interop[ArkTS, Invisible]
    public prop id3: Float64 {
        get() {
            value4
        }
    }
}
```

Automatically generated ArkTS interface:

```typescript
// Generated after selecting "Generate... > Cangjie-ArkTS Interop API" in the .d.ts file
export declare class ClassDemo {
    value2: number
    value3: number
    foo(number): number
    id: number
    id2: number
    constructor (a: number)
}
```

ArkTS-side invocation of the Cangjie module:

```typescript
// Import the Cangjie dynamic library, whose name should match the package name of the interop interface
import { ClassDemo } from "libohos_app_cangjie_entry.so";

let class1: ClassDemo = new ClassDemo(3);

console.log("result " + class1.foo(5));
console.log("result " + class1.value2);
```

## Type Mapping

The declarative interop macros support the following data type conversions:

| Cangjie Type                                               | ArkTS Equivalent | Notes                                                        |
| :--------------------------------------------------------- | :--------------- | :----------------------------------------------------------- |
| Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64, Float16, Float32, Float64 | number           | -                                                            |
| Bool                                                       | boolean          | -                                                            |
| String, JSStringEx                                         | string           | -                                                            |
| Unit                                                       | undefined        | -                                                            |
| Option\<T>                                                 | T \| undefined   | T cannot be Option\<T> or function type. If T is a custom type (class or interface), it must be decorated with Interop macro |
| func                                                       | function         | -                                                            |
| JSArrayEx\<T>                                              | Array\<T>        | T cannot be function type. If T is a custom type (class or interface), it must be decorated with Interop macro |
| JSHashMapEx\<K, V>                                         | Map\<K, V>       | V cannot be function type. If V is a custom type (class or interface), it must be decorated with Interop macro |
| Array\<Byte>                                               | ArrayBuffer      | -                                                            |
| class                                                      | class            | -                                                            |
| interface                                                  | interface        | -                                                            |

> **Note:**
>
> - In function signatures decorated with `Interop` macros, and in type annotations for member variables and properties, syntax sugar like `?T` for `Option<T>` is not supported.
>
> - The three types `JSStringEx`, `JSArrayEx<T>`, and `JSHashMapEx<K, V>` can only be used in functions, classes, and interfaces decorated with `Interop` macros.
