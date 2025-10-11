# Annotations

Cangjie provides several attribute macros to support special case handling.

## Annotations for Ensuring Correct Integer Operation Overflow Strategies

Cangjie offers three attribute macros to control integer overflow handling strategies: `@OverflowThrowing`, `@OverflowWrapping`, and `@OverflowSaturating`. Currently, these macros can only be applied to function declarations and affect integer operations and type conversions within the function. They correspond to the following three overflow handling strategies:

1. **Throw Exception (throwing)**: Throws an exception when integer overflow occurs.

    <!-- compile -->

    ```cangjie
    @OverflowThrowing
    func add(a: Int8, b: Int8){
        return a + b
    }
    main() {
        add(100,29)
        /* Mathematically, 100 + 29 equals 129,
        * which causes an upper overflow in Int8's range,
        * triggering an exception
        */
    }
    ```

    Note: For scenarios where integer overflow behavior is set to throwing, if overflow can be detected at compile time, the compiler will directly report an error.

    <!-- compile.error -->

    ```cangjie
    @OverflowThrowing
    main() {
        let res: Int8 = Int8(100) + Int8(29) // Error, arithmetic operation '+' overflow
        // Mathematically, 100 + 29 equals 129, causing an upper overflow in Int8's range; the compiler detects and reports this
        let con: UInt8 = UInt8(-132) // Error, integer type conversion overflow
        /* -132 causes a lower overflow in UInt8's range,
        * triggering an exception
        */
    }
    ```

2. **Wrap Around (wrapping)**: When the result of an integer operation exceeds the representable range of the receiving memory space, the overflowed portion is truncated.

    <!-- compile -->

    ```cangjie
    @OverflowWrapping
    main() {
        let res: Int8 = Int8(105) * Int8(4)
        /* Mathematically, 105 * 4 equals 420,
        * whose binary representation is 1 1010 0100,
        * exceeding the 8-bit memory space for the result.
        * The truncated result is 1010 0100 in binary,
        * corresponding to the signed integer -92
        */
        let temp: Int16 = Int16(-132)
        let con: UInt8 = UInt8(temp)
        /* -132's binary representation is 1111 1111 0111 1100,
        * exceeding the 8-bit memory space for the result.
        * The truncated result is 0111 1100 in binary,
        * corresponding to the signed integer 124
        */
    }
    ```

3. **Saturate (saturating)**: When integer overflow occurs, the result is clamped to the extreme value of the fixed precision.

    <!-- compile -->

    ```cangjie
    @OverflowSaturating
    main() {
        let res: Int8 = Int8(-100) - Int8(45)
        /* Mathematically, -100 - 45 equals -145,
        * causing a lower overflow in Int8's range.
        * The result is clamped to Int8's minimum value, -128
        */
        let con: Int8 = Int8(1024)
        /* 1024 causes an upper overflow in Int8's range,
        * so the result is clamped to Int8's maximum value, 127
        */
    }
    ```

By default (when no attribute macro is specified), the throwing strategy (`@OverflowThrowing`) is applied.

In practice, the appropriate overflow strategy should be chosen based on business requirements. For example, to implement a safe arithmetic operation on `Int32` where the result must mathematically equal the computation, the throwing strategy should be used.

**Counterexample:**

<!-- compile -->

```cangjie
// Result is truncated due to overflow
@OverflowWrapping
func operation(a: Int32, b: Int32): Int32 {
    a + b // No exception will be thrown when overflow occurs
}
```

This incorrect example uses the wrapping strategy. If the parameters `a` and `b` are large enough to cause overflow, the result will be truncated, breaking the mathematical equivalence between the function's return value and the expression `a + b`.

**Correct Example:**

<!-- run -->

```cangjie
// Safe
@OverflowThrowing
func operation(a: Int32, b: Int32): Int32 {
    a + b
}

main(): Int64 {
    try {
        operation(Int32.Max, 1)
    } catch (e: ArithmeticException) {
        println(e.message)
        //Handle error
    }
    0
}
```

This correct example uses the throwing strategy. If the parameters `a` and `b` cause integer overflow, the `operation` function will throw an exception.

The following table summarizes mathematical operators that may cause integer overflow.

| Operator | Overflow |          Operator          | Overflow |          Operator         | Overflow | Operator | Overflow |
|:----:|:--:|:--------------------:|:--:|:-------------------:|:--:|:----:|:--:|
| `+`  | Y  |         `-=`         | Y  |        `<<`         | N  | `<`  | N  |
| `-`  | Y  |         `*=`         | Y  |        `>>`         | N  | `>`  | N  |
| `*`  | Y  |         `/=`         | Y  |         `&`         | N  | `>=` | N  |
| `/`  | Y  |         `%=`         | N  | <code>&vert;</code> | N  | `<=` | N  |
| `%`  | N  |        `<<=`         | N  |         `^`         | N  | `==` | N  |
| `++` | Y  |        `>>=`         | N  |        `**=`        | Y  |      |    |
| `--` | Y  |         `&=`         | N  |         `!`         | N  |      |    |
| `=`  | N  | <code>&vert;=</code> | N  |        `!=`         | N  |      |    |
| `+=` | Y  |         `^=`         | N  |        `**`         | Y  |      |    |

## Testing Framework Annotations

When using mocks in tests, if the mocked object involves static or top-level declarations, test framework annotations are required to instruct the compiler to prepare for mocking.

The `@EnsurePreparedToMock` annotation can only be applied to lambda expressions. The lambda must call a static or top-level declaration as its last expression, prompting the compiler to prepare the declaration for mocking.

Example:

<!-- run -pkg1 -->
<!-- cfg="-p prod --mock=on --output-type=dylib" -->

```cangjie
package prod

public func test(a: String, b: String): String {
    a + b
}
```

<!-- run -pkg1 -->
<!-- cfg="-lprod -L . --test" -->

```cangjie
package test

import prod.*
import std.unittest.mock.*

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        { =>
            let matcher0 = Matchers.eq("z")
            let matcher1 = Matchers.eq("y")
            let stubCall = @EnsurePreparedToMock { => return(test(matcher0.value(), matcher1.value())) }
            ConfigureMock.stubFunction(stubCall,[matcher0.withDescription(#"eq("z")"#), matcher1.withDescription(#"eq("y")"#)], Option<String>.None, "test", #"test("z", "y")"#, 15)
        }().returns("mocked value")
        println(test("z", "y")) // prints "mocked value"
    }
}
```

In this example, `ConfigureMock.stubFunction` registers a stub for the `test` function, and `returns` sets the stub's return value.

> **Note:**
>
> Typically, the standard library's mock interfaces should be used to define mock declarations. Direct use of this built-in annotation is discouraged unless necessary. Standard library functions internally utilize `@EnsurePreparedToMock`.

Constraints for using `@EnsurePreparedToMock`:

- Only allowed when compiling with test and mock-related options (`--test`/`--test-only` and `--mock=on`/`--mock=runtime-error`).
- Can only be applied to lambdas with a valid last expression.
- The lambda's last expression must be a call, member access, or reference expression, specifically:
    - Top-level functions or variables;
    - Static functions, properties, or fields;
    - Foreign declarations;
    - Not local functions or variables;
    - Non-private declarations;
    - Not const expressions or declarations;
    - Must originate from a package built with mock mode enabled.

## Custom Annotations

Custom annotations allow reflection (see [Reflection Chapter](dynamic_feature.md)) to retrieve additional metadata beyond type information, supporting more complex logic.

Developers can create custom annotations by marking a `class` with `@Annotation`. The `@Annotation` can only be applied to `class`es that are not `abstract`, `open`, or `sealed`. An `@Annotation`-marked `class` must provide at least one `const init` function; otherwise, the compiler will report an error.

The following example defines a custom annotation `@Version` and applies it to classes `A`, `B`, and `C`. In `main`, reflection is used to retrieve and print the `@Version` annotation information.

<!-- verify -->

```cangjie
package pkg

import std.reflect.TypeInfo

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

@Version["1.0"]
class A {}

@Version["1.1"]
class B {}

main() {
    let objects = [A(), B()]
    for (obj in objects) {
        let annOpt = TypeInfo.of(obj).findAnnotation<Version>()
        if (let Some(ann) <- annOpt) {
            println(ann.code)
        }
    }
}
```

Compiling and running this code outputs:

```text
1.0
1.1
```

Annotation information must be generated at compile time and bound to the type. Custom annotations must be instantiated using `const init` with valid arguments. The annotation declaration syntax aligns with macro declaration syntax, where the `[]` brackets must contain const expressions (see [Constant Evaluation Chapter](../function/const_func_and_eval.md)). For annotations with parameterless constructors, the brackets may be omitted.

The following example defines a custom annotation `@Marked` with a parameterless `const init`. Both `@Marked` and `@Marked[]` are valid usages.

<!-- verify -->

```cangjie
package pkg

import std.reflect.TypeInfo

@Annotation
public class Marked {
    const init() {}
}

@Marked
class A {}

@Marked[]
class B {}

main() {
    if (TypeInfo.of(A()).findAnnotation<Marked>().isSome()) {
        println("A is Marked")
    }
    if (TypeInfo.of(B()).findAnnotation<Marked>().isSome()) {
        println("B is Marked")
    }
}
```

Compiling and running this code outputs:

```text
A is Marked
B is Marked
```

Annotations are not inherited. A type's annotation metadata only includes annotations declared on itself. To access parent type annotations, developers must explicitly query them via reflection.

In the following example, `A` is annotated with `@Marked`, and `B` inherits from `A`. However, `B` does not inherit `A`'s annotations.

<!-- verify -->

```cangjie
package pkg

import std.reflect.TypeInfo

@Annotation
public class Marked {
    const init() {}
}

@Marked
open class A {}

class B <: A {}

main() {
    if (TypeInfo.of(A()).findAnnotation<Marked>().isSome()) {
        println("A is Marked")
    }
    if (TypeInfo.of(B()).findAnnotation<Marked>().isSome()) {
        println("B is Marked")
    }
}
```

Compiling and running this code outputs:

```text
A is Marked
```

Custom annotations can be applied to type declarations (`class`, `struct`, `enum`, `interface`), member/constructor parameters, constructor declarations, member function declarations, member variable declarations, and member property declarations. To restrict usage locations, the `@Annotation` declaration can include a `target` parameter of type `Array<AnnotationKind>`, where `AnnotationKind` is a standard library `enum`. Without `target` restrictions, the annotation can be used in all aforementioned locations.

<!-- compile -->

```cangjie
public enum AnnotationKind {
    | Type
    | Parameter
    | Init
    | MemberProperty
    | MemberFunction
    | MemberVariable
}
```

The following example restricts the custom annotation `@Marked` to member functions only. Using it elsewhere will cause a compilation error.

<!--compile.error -->

```cangjie
@Annotation[target: [MemberFunction]]
public class Marked {
    const init() {}
}

class A {
    @Marked // OK, member funciton
    func marked() {}
}

@Marked // Error, type
class B {}
```