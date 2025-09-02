# Built-in Compilation Attributes

The Cangjie language provides several predefined compilation attributes that allow developers to control the compilation behavior of the Cangjie compiler.

## Source Location

Cangjie offers several built-in compilation attributes for obtaining source code locations during compilation.

- `@sourcePackage()` expands to a `String` literal containing the package name of the source file where this attribute is located.
- `@sourceFile()` expands to a `String` literal containing the filename of the source file where this attribute is located.
- `@sourceLine()` expands to an `Int64` literal containing the line number in the source file where this attribute is located.

These compilation attributes can be used within any expression as long as they comply with type-checking rules. Examples:

<!-- run -->

```cangjie
func test1() {
    let s: String = @sourceFile()  // The value of `s` is the current source file name
}

func test2(n!: Int64 = @sourceLine()) { /* at line 5 */
    // The default value of `n` is the source file line number of the definition of `test2`
    println(n) // print 5
}
```

## Conditional Compilation

Conditional compilation uses the `@When` attribute, which is a technique for selectively compiling different code segments based on specific conditions. The primary purposes of conditional compilation include:

- Platform adaptation: Supports selective code compilation based on the current compilation environment for cross-platform compatibility.
- Feature selection: Enables flexible configuration by selectively compiling code according to different requirements.
- Debugging support: Compiles debugging-related code in debug mode to enhance program performance and security. For example, compiling debug information or logging code in debug mode while excluding it from release builds.
- Performance optimization: Selectively compiles code based on predefined conditions to improve program performance.

For detailed information about conditional compilation, please refer to the [Conditional Compilation](../compile_and_build/conditional_compilation.md) chapter, which will not be further elaborated here.

## @FastNative

To enhance performance in interoperability with C, Cangjie provides the `@FastNative` attribute to optimize calls to C functions. Note that `@FastNative` can only be used with `foreign` declared functions.

First, compile the following C program to generate the shared library `libcProg.so`:

```c
#include <stdio.h>

char* foo()
{
    static char str[] = "this is an example";
    return str;
}
```

Cangjie file `main.cj`:

```cangjie
@FastNative
foreign func foo(): CPointer<Int32>

@FastNative
foreign func printf(fmt: CPointer<Int32>, ...): Int32

main(): Int32 {
    unsafe{
        let str = foo()
        printf(str)
    }
}
```

For specific compilation instructions, see [Appendix](../Appendix/compile_options_OHOS.md#cjc-编译选项). Below is the corresponding compilation command for this example:

```shell
cjc -L . -lcProg ./main.cj
```

After compiling `main.cj` with the above command, an executable `main` is generated, producing the following output:

```text
this is an example
```

When using `@FastNative` to modify `foreign` functions, developers must ensure the corresponding C functions meet the following requirements:

1. The function's execution time should not be excessively long. For example: large loops inside the function are prohibited; blocking behaviors such as calling `sleep` or `wait` are not allowed.
2. The function must not call Cangjie methods internally.

## @Frozen

The `@Frozen` attribute can be used to modify functions and properties. If a function or property's internal implementation is guaranteed not to change in future versions, it can be marked with `@Frozen`, representing the developer's commitment to its stability. Functions and properties marked with `@Frozen` cannot undergo any changes to their signatures or bodies in subsequent versions. This ensures that, under the same compiler and compilation options, the generated artifacts remain identical across versions.

`@Frozen` can be applied to:
- Global functions
- Functions in classes, structs, interfaces, extensions, and enums
- Properties in classes, interfaces, and extensions

`@Frozen` cannot be applied to:
- Declarations other than functions and properties
- Nested functions
- Expressions

Usage example:

<!-- run -->

```cangjie
@Frozen
public func test(): Unit {}

public class testClass {
    @Frozen
    public func testFunc(): Unit {}

    @Frozen
    public prop testProp: Unit {
        get() {}
    }
}
```

## @Attribute

Cangjie provides the built-in `@Attribute` attribute, allowing developers to set attribute values on declarations for marking purposes. Attribute values can be either `identifier` or `string`. Below is a simple example where the variable `cnt` is given an `identifier` attribute `State`, and `bcnt` is given a `string` attribute `"Binding"`.

<!-- compile -->

```cangjie
@Attribute[State] var cnt = 0       // identifier
@Attribute["Binding"] var bcnt = 0  // string
```

Additionally, the standard library `std.ast` provides the `getAttrs()` method to retrieve a node's attributes and `hasAttr(attrs: String)` to check if a node has a specific attribute. Here's a concrete example:

Macro definition:

<!-- run -macro0 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

public macro Component(input: Tokens): Tokens {
    var varDecl = parseDecl(input)
    if (varDecl.hasAttr("State")) { // Returns true if the node is marked with the "State" attribute, otherwise false
        var attrs = varDecl.getAttrs() // Returns a set of Tokens
        println(attrs[0].value)
    }
    return input
}
```

Macro invocation:

<!-- run -macro0 -->
<!-- cfg="--debug-macro" -->

```cangjie
import define.Component

@Component(
    @Attribute[State] var cnt = 0
)

main() {}
```

## @Deprecated

`@Deprecated` indicates that an API is obsolete. While still usable, it will be removed or changed in the future, and developers are advised not to use it. Example:

<!-- compile -->

```cangjie
@Deprecated["Use boo instead", since: "1.3.4"]
func foo() {}

main() {
    foo()
}
```

The compiler will issue a warning during compilation:

```text
warning: function 'foo' is deprecated since 1.3.4. Use boo instead
 ==> file.cj:5:5:
  |
5 |     foo()
  |     ^^^ deprecated
  |
  # note: this warning can be suppressed by setting the compiler option `-Woff deprecated`

1 warning generated, 1 warning printed.
```

The `@Deprecated` custom macro can be applied to the following declarations:
- Classes, interfaces, structs, enums, enum constructors
- Top-level (global) functions or variables
- Static or non-static member functions, member variables, properties, property setters
- Operator functions
- Extension member functions, static functions, properties, or property setters
- `foreign` functions or functions declared within `foreign` blocks
- Constructors and primary constructors
- Abstract functions and properties
- Type aliases (including associated types)
- Named parameters in functions with default arguments
- `const` variables and functions
- Macro definitions
- Annotation classes

### @Deprecated Parameters

- `message: String` - Describes why the declaration is deprecated and how to migrate.
- `since!: ?String` - The version in which the deprecation occurred.
- `strict!: Bool` - Defaults to `false`, triggering a warning at call sites of the deprecated API. If set to `true`, it triggers a compilation error.

<!-- compile.error -->

```cangjie
@Deprecated["Use Macro2", since: "1990", strict: true]
public macro Macro(input: Tokens): Tokens {
    return input
}
```