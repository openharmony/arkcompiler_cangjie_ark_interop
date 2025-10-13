# Defining Functions

In Cangjie, the keyword `func` is used to denote the start of a function definition. Following `func` are the function name, parameter list, optional return type, and function body in sequence. The function name can be any valid identifier. The parameter list is enclosed in parentheses (with multiple parameters separated by commas), a colon separates the parameter list from the return type (if present), and the function body is enclosed in curly braces.

Example of a function definition:

<!-- compile -->

```cangjie
func add(a: Int64, b: Int64): Int64 {
    return a + b
}
```

The above example defines a function named `add` with a parameter list consisting of two `Int64` parameters `a` and `b`, a return type of `Int64`, and a function body that returns the sum of `a` and `b`.

The following sections provide further details on the parameter list, return type, and function body in function definitions.

## Parameter List

A function can have zero or more parameters, all defined in the parameter list. Based on whether parameter names are required during function calls, parameters can be categorized into two types: non-named parameters and named parameters.

Non-named parameters are defined as `p: T`, where `p` is the parameter name and `T` is the type of `p`, connected by a colon. For example, the parameters `a` and `b` in the `add` function above are non-named parameters.

Named parameters are defined as `p!: T`, differing from non-named parameters by the addition of `!` after the parameter name `p`. The `add` function's two non-named parameters can be modified to named parameters as shown below:

<!-- compile -->

```cangjie
func add(a!: Int64, b!: Int64): Int64 {
    return a + b
}
```

Named parameters can also have default values, specified via `p!: T = e`, where `e` is an expression whose value becomes the default for parameter `p`. For example, the default values for both parameters in the `add` function can be set to `1`:

<!-- compile -->

```cangjie
func add(a!: Int64 = 1, b!: Int64 = 1): Int64 {
    return a + b
}
```

> **Note:**
>
> Only named parameters can have default values; non-named parameters cannot.

A parameter list can include both non-named and named parameters, but non-named parameters must precede named parameters. This means named parameters cannot be followed by non-named parameters. For example, the following definition of the `add` function's parameter list is invalid:

<!-- compile.error -->

```cangjie
func add(a!: Int64, b: Int64): Int64 { // Error, named parameter 'a' must be defined after non-named parameter 'b'
    return a + b
}
```

The primary difference between non-named and named parameters lies in how they are called, as detailed in the [Calling Functions](./call_functions.md) section.

Function parameters are immutable variables and cannot be assigned new values within the function definition.

<!-- compile.error -->

```cangjie
func add(a: Int64, b: Int64): Int64 {
    a = a + b // Error
    return a
}
```

The scope of function parameters extends from their definition point to the end of the function body:

<!-- compile.error -->

```cangjie
func add(a: Int64, b: Int64): Int64 {
    var a_ = a // OK
    var b = b  // Error, redefinition of declaration 'b'
    return a
}
```

## Return Type

The return type of a function is the type of value obtained when the function is called. In function definitions, the return type is optional: it can be explicitly defined (placed between the parameter list and function body) or omitted, leaving the compiler to infer it.

When the return type is explicitly defined, the type of the function body (see [Function Body](./define_functions.md#function-body) for determining the function body's type) and the types of all `return e` expressions (`e` being an expression) must be subtypes of the return type. For example, the `add` function explicitly defines its return type as `Int64`. If the function body is changed to `return (a, b)`, a type mismatch error will occur:

<!-- compile.error -->

```cangjie
// Error, the type of the expression after return does not match the return type of the function
func add(a: Int64, b: Int64): Int64 {
    return (a, b)
}
```

If the return type is not explicitly defined, the compiler infers it based on the function body's type and all `return` expressions. For example, in the following `add` function, the return type is omitted, but the compiler infers it as `Int64` from `return a + b`:

<!-- compile -->

```cangjie
func add(a: Int64, b: Int64) {
    return a + b
}
```

> **Note:**
>
> The return type cannot always be inferred. If inference fails, the compiler will report an error.
>
> When the return type is specified as `Unit`, the compiler automatically inserts `return ()` at all possible return points in the function body, ensuring the return type is always `Unit`.

## Function Body

The function body defines the operations executed when the function is called. It typically includes a series of variable definitions and expressions and may also contain nested function definitions. For example, the `add` function's body first defines an `Int64` variable `r` (initialized to `0`), assigns `a + b` to `r`, and finally returns `r`:

<!-- compile -->

```cangjie
func add(a: Int64, b: Int64) {
    var r = 0
    r = a + b
    return r
}
```

A `return` expression can be used anywhere in the function body to terminate execution and return a value. There are two forms of `return`: `return` and `return expr` (where `expr` is an expression).

For `return expr`, the type of `expr` must match the function's return type. For example, the following will error because `100` (type `Int64`) does not match the return type of `foo` (`String`):

<!-- compile.error -->

```cangjie
// Error, cannot convert an integer literal to type 'Struct-String'
func foo(): String {
    return 100
}
```

For `return`, it is equivalent to `return ()`, so the function's return type must be `Unit`.

<!-- compile -->

```cangjie
func add(a: Int64, b: Int64) {
    var r = 0
    r = a + b
    return r
}

func foo(): Unit {
    add(1, 2)
    return
}
```

> **Note:**
>
> The `return` expression as a whole has the type `Nothing`, regardless of the following expression.

Variables defined within the function body are local variables (e.g., `r` in the example above). Their scope extends from their definition point to the end of the function body.

A local variable can share its name with a variable in an outer scope. Within the local variable's scope, it "shadows" the outer variable. For example:

<!-- compile -->

```cangjie
let r = 0
func add(a: Int64, b: Int64) {
    var r = 0
    r = a + b
    return r
}
```

In the above example, a global variable `r` of type `Int64` is defined before the `add` function, and a local variable `r` is defined within the function body. Inside the function body, all references to `r` (e.g., `r = a + b`) refer to the local variable `r`, which shadows the global variable `r`.

As mentioned in [Return Type](./define_functions.md#return-type), the function body itself has a type. The type of the function body is the type of its last "item": if the last item is an expression, the function body's type is that expression's type; if the last item is a variable definition, function declaration, or the body is empty, the type is `Unit`. For example:

<!-- compile -->

```cangjie
func add(a: Int64, b: Int64): Int64 {
    a + b
}
```

In the above example, the last "item" in the function body is the `Int64` expression `a + b`, so the function body's type is `Int64`, matching the function's return type. Similarly, in the following example, the last item is a call to `print`, so the function body's type is `Unit`, matching the return type:

<!-- compile -->

```cangjie
func foo(): Unit {
    let s = "Hello"
    print(s)
}
```