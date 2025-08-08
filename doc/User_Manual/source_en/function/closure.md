# Closures

A function or lambda that captures variables from its static scope is called a closure. The combination of the function/lambda and the captured variables forms a closure, enabling it to operate correctly even when outside the scope where it was defined.

Variable capture occurs in a function or lambda definition when accessing the following types of variables:

- Accessing non-local variables in the default parameter values of a function;
- Accessing non-local variables within a function or lambda;
- Accessing instance member variables or `this` in functions or lambdas defined within a `class`/`struct` that are not member functions.

The following scenarios do not constitute variable capture:

- Accessing local variables defined within the current function or lambda;
- Accessing formal parameters of the current function or lambda;
- Accessing global variables and static member variables;
- Accessing instance member variables within instance member functions or properties. Since instance member functions or properties receive `this` as a parameter, all instance member variables are accessed via `this` within them.

Variable capture occurs at the time of closure definition, thus adhering to the following rules:

- Captured variables must be visible at the time of closure definition, otherwise a compilation error occurs;
- Captured variables must be initialized at the time of closure definition, otherwise a compilation error occurs.

Example 1: The closure `add` captures the local variable `num` declared with `let`. Even after being returned outside the scope where `num` was defined, `add` can still access `num` normally when called.

<!-- verify -->

```cangjie
func returnAddNum(): (Int64) -> Int64 {
    let num: Int64 = 10

    func add(a: Int64) {
        return a + num
    }
    add
}

main() {
    let f = returnAddNum()
    println(f(10))
}
```

Program output:

```text
20
```

Example 2: Captured variables must be visible at the time of closure definition.

<!-- compile.error -->

```cangjie
func f() {
    let x = 99
    func f1() {
        println(x)
    }
    let f2 = { =>
        println(y)  // Error, cannot capture 'y' which is not defined yet
    }
    let y = 88
    f1()            // Print 99
    f2()
}
```

Example 3: Captured variables must be initialized before closure definition.

<!-- compile.error -error-->

```cangjie
func f() {
    let x: Int64
    func f1() {
        println(x) // Error, x is not initialized yet
    }
    x = 99
    f1()
}
```

Example 4: If the captured variable is a reference type, its mutable instance member variables can be modified.

<!-- run -->

```cangjie
class C {
    public var num: Int64 = 0
}

func returnIncrementer(): () -> Unit {
    let c: C = C()

    func incrementer() {
        c.num++
    }

    incrementer
}

main() {
    let f = returnIncrementer()
    f() // c.num increases by 1
}
```

Example 5: To prevent closures capturing variables declared with `var` from escaping, such closures can only be invoked but not used as first-class citizens. This includes not being assignable to variables, not usable as arguments or return values, and not directly usable as expressions. A closure is said to escape when it can be invoked outside the function after the function has completed execution.

<!-- compile.error -->

```cangjie
func f() {
    var x = 1
    let y = 2

    func g() {
        println(x)  // OK, captured a mutable variable.
    }
    let b = g       // Error, g cannot be assigned to a variable

    g               // Error, g cannot be used as an expression
    g()             // OK, g can be invoked

    g               // Error, g cannot be used as a return value
}
```

Example 6: Note that capture is transitive. If a function `f` calls a function `g` that captures a `var` variable, and the `var` variable captured by `g` is not defined within `f`, then `f` also captures the `var` variable. Consequently, `f` cannot be used as a first-class citizen either.

Example 6.1: `g` captures the `var` variable `x`, `f` calls `g`, and `x` captured by `g` is not defined within `f`. Thus, `f` cannot be used as a first-class citizen:

<!-- compile.error -error-->

```cangjie
func h(){
    var x = 1

    func g() { x }  // captured a mutable variable

    func f() {
        g()         // invoked g
    }
    return f        // Error
}
```

Example 6.2: `g` captures the `var` variable `x`, `f` calls `g`. However, `x` captured by `g` is defined within `f`, and `f` does not capture any other `var` variables. Therefore, `f` can still be used as a first-class citizen:

<!-- compile -->

```cangjie
func h(){
    func f() {
        var x = 1
        func g() { x } // captured a mutable variable

        g()
    }
    return f // OK
}
```

Example 7: Accessing static member variables and global variables does not constitute variable capture. Therefore, functions or lambdas accessing `var`-declared global variables or static member variables can still be used as first-class citizens.

<!-- compile -->

```cangjie
class C {
    static public var a: Int32 = 0
    static public func foo() {
        a++ // OK
        return a
    }
}

var globalV1 = 0

func countGlobalV1() {
    globalV1++
    C.a = 99
    let g = C.foo // OK
}

func g(){
    let f = countGlobalV1 // OK
    f()
}
```