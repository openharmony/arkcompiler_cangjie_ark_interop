# Built-in Compilation Tags  

The Cangjie language provides several predefined compilation tags that allow developers to control the compilation behavior of the Cangjie compiler.  

## Source Code Location  

Cangjie offers several built-in compilation tags for obtaining source code locations during compilation.  

- `@sourcePackage()` expands to a `String` literal containing the package name of the source file where the tag is located.  
- `@sourceFile()` expands to a `String` literal containing the filename of the source file where the tag is located.  
- `@sourceLine()` expands to an `Int64` literal containing the line number of the source code where the tag is located.  

These compilation tags can be used within any expression, provided they comply with type-checking rules. Examples:  

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

Conditional compilation uses the `@When` tag, a technique for selectively compiling different code segments based on specific conditions. The primary purposes of conditional compilation include:  

- **Platform Adaptation**: Supports selective code compilation based on the current compilation environment to achieve cross-platform compatibility.  
- **Feature Selection**: Enables flexible configuration by selectively compiling code based on different requirements.  
- **Debugging Support**: Facilitates the compilation of debugging-related code in debug mode to enhance performance and security. For example, debug information or logging code can be included in debug builds but excluded in release builds.  
- **Performance Optimization**: Allows selective compilation of code based on predefined conditions to improve performance.  

For detailed information on conditional compilation, refer to the [Conditional Compilation](../compile_and_build/conditional_compilation.md) chapter. This section will not elaborate further.  

## @FastNative  

To enhance interoperability performance with `C` language, Cangjie provides the `@FastNative` tag to optimize calls to `C` functions. Note that `@FastNative` can only be applied to functions declared with `foreign`.  

First, compile the following C program to generate the dynamic library file `libcProg.so`:  

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

For compilation instructions, refer to the [Appendix](../Appendix/compile_options_OHOS.md#cjc-compilation-options). Below is the compilation command for this example:  

```shell  
cjc -L . -lcProg ./main.cj  
```  

After compiling `main.cj`, an executable file `main` is generated. The execution result is as follows:  

```text  
this is an example  
```  

When using `@FastNative` to modify `foreign` functions, developers must ensure the corresponding `C` functions meet the following requirements:  

1. The function execution time should not be excessively long. For example:  
   - Avoid large loops inside the function.  
   - Avoid blocking behaviors such as calling `sleep`, `wait`, etc.  
2. The function must not call Cangjie methods internally.  

## @Frozen  

The `@Frozen` tag can be applied to functions and properties. If a function or property is guaranteed not to undergo internal implementation changes in future updates, it can be marked with `@Frozen`. This tag represents the developer's commitment to the stability of the function/property across version updates. Functions and properties marked with `@Frozen` must not undergo any changes to their signatures or bodies in subsequent versions. This ensures that, under the same compiler and compilation options, the generated output remains identical between versions.  

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

The Cangjie language provides the built-in `@Attribute` tag, allowing developers to assign attribute values to declarations for marking purposes. Attribute values can be either `identifier` or `string`. Below is a simple example where the variable `cnt` is assigned an `identifier`-type attribute `State`, and the variable `bcnt` is assigned a `string`-type attribute `"Binding"`.  

<!-- compile -->  

```cangjie  
@Attribute[State] var cnt = 0       // identifier  
@Attribute["Binding"] var bcnt = 0  // string  
```  

Additionally, the standard library `std.ast` package provides the `getAttrs()` method to retrieve node attributes and the `hasAttr(attrs: String)` method to check if a node has a specific attribute. Below is a concrete example.  

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

`@Deprecated` indicates that an API is deprecated. Although it remains temporarily usable, it will be removed or modified in the future, and developers are advised not to use it. Example:  

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
- `since!: ?String` - The version in which the deprecation was introduced.  
- `strict!: Bool` - Defaults to `false`. Calls to the deprecated API trigger a warning. If set to `true`, a compilation error is triggered.  

<!-- compile.error -->  

```cangjie  
@Deprecated["Use Macro2", since: "1990", strict: true]  
public macro Macro(input: Tokens): Tokens {  
    return input  
}  
```