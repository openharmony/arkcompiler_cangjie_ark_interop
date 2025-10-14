# Function Invocation

The syntax for function invocation is `f(arg1, arg2, ..., argn)`. Here, `f` represents the name of the function to be called, while `arg1` through `argn` denote the `n` arguments passed during invocation (referred to as actual parameters). Each actual parameter must be of a type that is a subtype of the corresponding parameter type. The number of actual parameters can range from zero to multiple. When no arguments are provided, the invocation takes the form `f()`.

Depending on whether parameters are defined as positional or named parameters, the method of passing arguments during function invocation differs:
- For positional parameters, the corresponding argument is an expression.
- For named parameters, the argument must be provided in the form `p: e`, where `p` is the name of the named parameter and `e` is the expression (i.e., the value passed to parameter `p`).

Example of positional parameter invocation:

<!-- verify -->

```cangjie
func add(a: Int64, b: Int64) {
    return a + b
}

main() {
    let x = 1
    let y = 2
    let r = add(x, y)
    println("The sum of x and y is ${r}")
}
```

Execution result:

```text
The sum of x and y is 3
```

Example of named parameter invocation:

<!-- verify -->

```cangjie
func add(a: Int64, b!: Int64) {
    return a + b
}

main() {
    let x = 1
    let y = 2
    let r = add(x, b: y)
    println("The sum of x and y is ${r}")
}
```

Execution result:

```text
The sum of x and y is 3
```

For functions with multiple named parameters, the order of argument passing during invocation can differ from the parameter order in the definition. For instance, in the following example, parameter `b` can precede parameter `a` when invoking the `add` function:

<!-- verify -->

```cangjie
func add(a!: Int64, b!: Int64) {
    return a + b
}

main() {
    let x = 1
    let y = 2
    let r = add(b: y, a: x)
    println("The sum of x and y is ${r}")
}
```

Execution result:

```text
The sum of x and y is 3
```

For named parameters with default values, if no argument is provided during invocation, the parameter will use its default value. For example, in the following invocation of the `add` function, no argument is passed for parameter `b`, so its value defaults to `2` as defined:

<!-- verify -->

```cangjie
func add(a: Int64, b!: Int64 = 2) {
    return a + b
}

main() {
    let x = 1
    let r = add(x)
    println("The sum of x and y is ${r}")
}
```

Execution result:

```text
The sum of x and y is 3
```

For named parameters with default values, new arguments can still be passed during invocation. In such cases, the parameter's value equals the new argument value, overriding the defined default. For instance, in the following example, a new argument value `20` is passed for parameter `b` during the `add` function invocation, making the parameter's value equal to `20`:

<!-- verify -->

```cangjie
func add(a: Int64, b!: Int64 = 2) {
    return a + b
}

main() {
    let x = 1
    let r = add(x, b: 20)
    println("The sum of x and y is ${r}")
}
```

Execution result:

```text
The sum of x and y is 21
```