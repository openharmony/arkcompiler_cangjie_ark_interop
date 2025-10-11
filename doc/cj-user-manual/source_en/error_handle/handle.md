# throw and Exception Handling

The previous section discussed how to define custom exceptions. Now let's learn how to throw and handle exceptions.

- Since exceptions are of `class` type, you only need to create them as you would any class object. For example, the expression `FatherException()` creates an exception of type `FatherException`.
- The Cangjie language provides the `throw` keyword for throwing exceptions. When using `throw`, the expression following it must be a subtype of `Exception` (the `Error` type, which is also an exception, cannot be manually thrown). For example, `throw ArithmeticException("I am an Exception!")` will throw an arithmetic exception when executed.
- Exceptions thrown with the `throw` keyword must be caught and handled. If an exception is not caught, the system will invoke the default exception handler.

Exception handling is performed using the `try` expression, which can be divided into:
- Regular try expressions without automatic resource management.
- Try-with-resources expressions that perform automatic resource management.

## Regular try Expressions

A regular try expression consists of three parts: the try block, catch block(s), and finally block.

- **Try block**: Begins with the `try` keyword followed by a block of expressions and declarations (enclosed in curly braces, defining a new local scope that can contain any expressions and declarations, hereafter referred to as a "block"). The block following `try` can throw exceptions, which are caught and handled by the subsequent catch block(s) (if no catch block exists or the exception is not caught, the exception continues to be thrown after the finally block executes).

- **Catch block(s)**: A regular try expression can contain zero or more catch blocks (when there are no catch blocks, a finally block must be present). Each catch block starts with the `catch` keyword, followed by a `catchPattern` and a block. The `catchPattern` matches the exception to be caught via pattern matching. Once a match is successful, the exception is handled by the subsequent block, and any following catch blocks are ignored. If a catch block can only catch exception types that are already caught by a preceding catch block, a "catch block unreachable" warning will be issued for that catch block.

- **Finally block**: Begins with the `finally` keyword followed by a block. The finally block is primarily used for "cleanup" tasks, such as releasing resources, and should avoid throwing exceptions. The contents of the finally block are executed regardless of whether an exception occurs (i.e., whether an exception is thrown in the try block). If the exception is unhandled, it continues to be thrown after the finally block executes. A try expression can omit the finally block if it contains catch blocks; otherwise, it must include a finally block.

The block following `try` and each `catch` block have independent scopes.

Here is a simple example with only a try block and a catch block:

<!-- verify -->

```cangjie
main() {
    try {
        throw NegativeArraySizeException("I am an Exception!")
    } catch (e: NegativeArraySizeException) {
        println(e)
        println("NegativeArraySizeException is caught!")
    }
    println("This will also be printed!")
}
```

Execution result:

```text
NegativeArraySizeException: I am an Exception!
NegativeArraySizeException is caught!
This will also be printed!
```

Variables introduced in the `catchPattern` have the same scope level as variables in the block following `catch`. Redefining the same name in the catch block will trigger a redefinition error. For example:

<!-- compile.error -->

```cangjie
main() {
    try {
        throw NegativeArraySizeException("I am an Exception!")
    } catch (e: NegativeArraySizeException) {
        println(e)
        let e = 0 // Error, redefinition
        println(e)
        println("NegativeArraySizeException is caught!")
    }
    println("This will also be printed!")
}
```

Below is a simple example of a try expression with a finally block:

<!-- verify -->

```cangjie
main() {
    try {
        throw NegativeArraySizeException("NegativeArraySizeException")
    } catch (e: NegativeArraySizeException) {
        println("Exception info: ${e}.")
    } finally {
        println("The finally block is executed.")
    }
}
```

Execution result:

```text
Exception info: NegativeArraySizeException: NegativeArraySizeException.
The finally block is executed.
```

Try expressions can appear anywhere expressions are allowed. The type of a try expression is determined similarly to multi-branch syntax structures like `if` and `match` expressions: it is the least common supertype of all branch types (excluding the finally branch). For example, in the code below, the try expression and variable `x` both have type `D`, the least common supertype of `E` and `D`. The `C()` in the finally branch does not participate in the least common supertype calculation (if it did, the least common supertype would become `C`).

Additionally, when the value of a `try` expression is unused, its type is `Unit`, and the branches are not required to have a least common supertype.

<!-- compile -->

```cangjie
open class C { }
open class D <: C { }
class E <: D { }
main () {
    let x = try {
        E()
    } catch (e: Exception) {
        D()
    } finally {
        C()
    }
    0
}
```

## Try-with-resources Expressions

Try-with-resources expressions are primarily used to automatically release non-memory resources. Unlike regular try expressions, try-with-resources expressions have optional catch and finally blocks. Additionally, between the `try` keyword and the `{}` block, one or more `ResourceSpecification` clauses can be inserted to request resources (the `ResourceSpecification` does not affect the type of the try expression). In the context of the language, resources correspond to objects, so `ResourceSpecification` essentially instantiates a series of objects (multiple instantiations are separated by ","). An example of a try-with-resources expression is shown below:

<!-- compile -->

```cangjie
class Worker <: Resource {
    var hasTools: Bool = false
    let name: String

    public init(name: String) {
        this.name = name
    }
    public func getTools() {
        println("${name} picks up tools from the warehouse.")
        hasTools = true
    }

    public func work() {
        if (hasTools) {
            println("${name} does some work with tools.")
        } else {
            println("${name} doesn't have tools, does nothing.")
        }
    }

    public func isClosed(): Bool {
        if (hasTools) {
            println("${name} hasn't returned the tool.")
            false
        } else {
            println("${name} has no tools")
            true
        }
    }
    public func close(): Unit {
        println("${name} returns the tools to the warehouse.")
        hasTools = false
    }
}

main() {
    try (r = Worker("Tom")) {
        r.getTools()
        r.work()
    }
    try (r = Worker("Bob")) {
        r.work()
    }
    try (r = Worker("Jack")) {
        r.getTools()
        throw Exception("Jack left, because of an emergency.")
    }
}
```

Program output:

```text
Tom picks up tools from the warehouse.
Tom does some work with tools.
Tom hasn't returned the tool.
Tom returns the tools to the warehouse.
Bob doesn't have tools, does nothing.
Bob has no tools
Jack picks up tools from the warehouse.
Jack hasn't returned the tool.
Jack returns the tools to the warehouse.
An exception has occurred:
Exception: Jack left, because of an emergency.
         at test.main()(xxx/xx.cj:xx)
```

Variables introduced between the `try` keyword and `{}` have the same scope level as variables introduced in the `{}` block. Redefining the same name in the `{}` block will trigger a redefinition error.

<!-- compile.error -->

```cangjie
class R <: Resource {
    public func isClosed(): Bool {
        true
    }
    public func close(): Unit {
        print("R is closed")
    }
}

main() {
    try (r = R()) {
        println("Get the resource")
        let r = 0 // Error, redefinition
        println(r)
    }
}
```

The types in the `ResourceSpecification` of a try-with-resources expression must implement the `Resource` interface:

<!-- run -->

```cangjie
interface Resource {
    func isClosed(): Bool  // Determines whether the `close` function should be called to release resources when leaving the try-with-resources scope.
    func close(): Unit  // Releases resources when `isClosed` returns false.
}
```

It is worth noting that try-with-resources expressions generally do not need to include catch or finally blocks, nor is it recommended for developers to manually release resources (redundant logic). However, if you need to explicitly catch and handle exceptions that may be thrown during the try block or resource acquisition/release, you can still include catch and finally blocks in the try-with-resources expression:

<!-- verify -->

```cangjie
class R <: Resource {
    public func isClosed(): Bool {
        true
    }
    public func close(): Unit {
        print("R is closed")
    }
}

main() {
    try (r = R()) {
        println("Get the resource")
    } catch (e: Exception) {
        println("Exception happened when executing the try-with-resources expression")
    } finally {
        println("End of the try-with-resources expression")
    }
}
```

Program output:

```text
Get the resource
End of the try-with-resources expression
```

The type of a try-with-resources expression is `Unit`.

## Advanced Introduction to CatchPattern

Most of the time, you only want to catch exceptions of a specific type and its subtypes. In such cases, use the **type pattern** of `CatchPattern`. However, sometimes you may want to handle all exceptions uniformly (e.g., when no exceptions should occur, and any exception should trigger a uniform error). In such cases, use the **wildcard pattern** of `CatchPattern`.

The type pattern has two syntactic formats:

1. `Identifier: ExceptionClass`: This format catches exceptions of type `ExceptionClass` and its subclasses. The caught exception instance is converted to `ExceptionClass` and bound to the variable defined by `Identifier`. You can then access the caught exception instance via this variable in the catch block.
2. `Identifier: ExceptionClass_1 | ExceptionClass_2 | ... | ExceptionClass_n`: This format concatenates multiple exception classes with the `|` operator, which represents an "or" relationship. It catches exceptions of type `ExceptionClass_1` and its subclasses, or `ExceptionClass_2` and its subclasses, and so on (assuming n > 1). When the type of the exception to be caught matches any of these types or their subtypes, the exception is caught. However, since the exact type of the caught exception cannot be determined statically, the exception type is converted to the least common superclass of all types connected by `|`, and the exception instance is bound to the variable defined by `Identifier`. In this mode, the catch block can only access member variables and functions of the least common superclass of `ExceptionClass_i (1 <= i <= n)` via the variable defined by `Identifier`. Alternatively, you can use a wildcard instead of `Identifier` in the type pattern, with the only difference being that the wildcard does not perform binding.

Example:

<!-- verify -->

```cangjie
main(): Int64 {
    try {
        throw IllegalArgumentException("This is an Exception!")
    } catch (e: OverflowException) {
        println(e.message)
        println("OverflowException is caught!")
    } catch (e: IllegalArgumentException | NegativeArraySizeException) {
        println(e.message)
        println("IllegalArgumentException or NegativeArraySizeException is caught!")
    } finally {
        println("finally is executed!")
    }
    return 0
}
```

Execution result:

```text
This is an Exception!
IllegalArgumentException or NegativeArraySizeException is caught!
finally is executed!
```

Example of "the caught exception type being the least common superclass of all types connected by `|`":

<!-- verify -->

```cangjie
open class Father <: Exception {
    var father: Int32 = 0
}

class ChildOne <: Father {
    var childOne: Int32 = 1
}

class ChildTwo <: Father {
    var childTwo: Int32 = 2
}

main() {
    try {
        throw ChildOne()
    } catch (e: ChildTwo | ChildOne) {
        println("${e is Father}")
    }
}
```

Execution result:

```text
true
```

The syntax for **wildcard pattern** is `_`, which can catch exceptions of any type thrown within the same-level try block. It is equivalent to the type pattern `e: Exception`, meaning it catches exceptions defined by subclasses of Exception. Example:

<!-- compile -->

```cangjie
// Catch with wildcardPattern.
try {
    throw OverflowException()
} catch (_) {
    println("catch an exception!")
}
```