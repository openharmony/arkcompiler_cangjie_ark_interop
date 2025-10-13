# Program Structure

Typically, developers write Cangjie programs in text files with the `.cj` extension, which are also referred to as source code and source files. In the final stage of program development, this source code will be compiled into binary files of a specific format.

At the top-level scope of a Cangjie program, a series of variables, functions, and custom types (such as `struct`, `class`, `enum`, and `interface`) can be defined. Among these, variables and functions are called **global variables** and **global functions**, respectively. To compile a Cangjie program into an executable file, a `main` function must be defined at the top-level scope as the **program entry point**. This function can either take a parameter of type `Array<String>` or no parameters at all, and its return type can be an integer type or the `Unit` type.

> **Note:**
>
> When defining the `main` function, the `func` modifier is not required. Additionally, if command-line arguments are needed during program startup, a parameter of type `Array<String>` can be declared and used.

For example, in the following program, the global variable `a`, the global function `b`, the custom types `C`, `D`, and `E`, and the `main` function serving as the program entry point are all defined at the top-level scope.

<!-- compile -->

```cangjie
// example.cj
let a = 2023
func b() {}
struct C {}
class D {}
enum E { F | G }

main() {
    println(a)
}
```

In non-top-level scopes, the aforementioned custom types cannot be defined, but variables and functions can be defined, referred to as **local variables** and **local functions**. Specifically, variables and functions defined within custom types are called **member variables** and **member functions**.

> **Note:**
>
> `enum` and `interface` only support defining member functions and do not support defining member variables.

For example, in the following program, the global function `a` and the custom type `A` are defined at the top-level scope. Within the function `a`, the local variable `b` and the local function `c` are defined, and within the custom type `A`, the member variable `b` and the member function `c` are defined.

<!-- verify -->

```cangjie
// example.cj
func a() {
    let b = 2023
    func c() {
        println(b)
    }
    c()
}

class A {
    let b = 2024
    public func c() {
        println(b)
    }
}

main() {
    a()
    A().c()
}
```

Running the above program will output:

```text
2023
2024
```

## Variables

In the Cangjie programming language, a variable consists of a corresponding variable name, data (value), and several attributes. Developers access the data associated with a variable through its name, but such access operations must comply with the constraints of the relevant attributes (such as data type, mutability, and visibility).

The specific form of variable definition is:

```text
modifier variable_name: variable_type = initial_value
```

Here, the **modifier** is used to set various attributes of the variable and can consist of one or more modifiers. Commonly used modifiers include:

- Mutability modifiers: `let` and `var`, corresponding to immutable and mutable attributes, respectively. Mutability determines whether a variable's value can be changed after initialization, thus classifying Cangjie variables into immutable and mutable types.
- `const` modifier: `const` is a special variable modifier used to declare constants. It requires initialization at declaration and prohibits any changes to its value thereafter. Similar to the `let` modifier, it has immutable characteristics but imposes stricter usage restrictions.
- Visibility modifiers: `private` and `public`, among others, which affect the reference scope of global variables and member variables. For details, refer to the relevant sections in subsequent chapters.
- Static modifiers: `static`, which affect the storage and reference methods of member variables. For details, refer to the relevant sections in subsequent chapters.

Variables support the assignment operator (`=`), regardless of type. Variables modified by `let` can only be assigned once (i.e., initialized), while variables modified by `var` can be assigned multiple times.

When defining Cangjie variables, a mutability modifier is mandatory. Additional modifiers can be added as needed.

- **Variable name** should be a valid Cangjie identifier.
- **Variable type** specifies the type of data held by the variable. When the initial value has a clear type, the variable type annotation can be omitted, allowing the compiler to automatically infer the variable type.
- **Initial value** is a Cangjie expression used to initialize the variable. If a variable type is specified, the initial value type must match the variable type. When defining global variables or static member variables, an initial value must be specified. When defining local variables or instance member variables, the initial value can be omitted, but the variable type must be annotated. Additionally, the variable must be initialized before it is referenced; otherwise, a compilation error will occur.

For example, the following program defines three `Int64` variables (an immutable variable `a`, a mutable variable `b`, and a const variable `c`). Subsequently, the value of variable `b` is modified, the value of `b` is assigned to `a`, and the `println` function is called to print the values of `a`, `b`, and `c`.

<!-- verify -->

```cangjie
main() {
    let a: Int64
    var b: Int64 = 14
    const c: Int64 = 13
    b = 12
    a = b // A variable modified by let can only be assigned once, that is, initialized
    println("${a}, ${b}, ${c}")
}
```

Compiling and running this program will output:

```text
12, 12, 13
```

Attempting to modify an immutable variable will result in a compilation error, for example:

<!-- compile.error -->

```cangjie
main() {
    let pi: Float64 = 3.14159
    pi = 2.71828 // Error, cannot assign to immutable value
}
```

When the initial value has a clear type, the variable type annotation can be omitted, for example:

<!-- verify -->

```cangjie
main() {
    let a: Int64 = 2023
    let b = a
    println("a - b = ${a - b}")
}
```

Here, the type of variable `b` can be automatically inferred as `Int64` from the type of its initial value `a`. Thus, this program can be compiled and run normally, outputting:

```text
a - b = 0
```

When defining local variables, initialization can be omitted, but the variable must be assigned a value before it is referenced, for example:

<!-- verify -->

```cangjie
main() {
    let text: String
    text = "Cangjie Creates Characters"
    println(text)
}
```

Compiling and running this program will output:

```text
Cangjie Creates Characters
```

When defining global variables and static member variables, initialization is mandatory; otherwise, a compilation error will occur, for example:

<!-- compile.error -->

```cangjie
let global: Int64 // Error, variable in top-level scope must be initialized

main(): Unit{

}
```

<!-- compile.error -->

```cangjie
class Player {
    static let score: Int32 // Error, static variable 'score' needs to be initialized when declaring
}
```

It is important to note that when the compiler cannot determine whether certain scenarios will definitely be initialized or whether an immutable variable has been initialized multiple times, it will adopt a conservative strategy and report a compilation error, as shown in the following example:

<!-- compile.error -->

```cangjie
func calc(a: Int32){
    println(a)
    return a * a
}
main() {
    let a: String
    if(calc(32) == 0){
      a = "1"
    }
    a = "2" // Error, cannot assign to immutable value
}
```

Additionally, for [try-catch](../error_handle/handle.md#regular-try-expressions) scenarios, the compiler will assume that the try block is always fully executed and always throws an exception, leading to related errors, as shown in the following example:
<!-- compile.error -->

```cangjie
main() {
    let a: String
    try {
        a = "1"
    } catch (_) {
        a = "2" // Error, cannot assign to immutable value
    }
}
```

## `const` Variables

`const` variables are a special type of variable modified by the keyword `const`. They are evaluated at compile time and cannot be changed during runtime. For example, the following code defines the gravitational constant `G`:

<!-- verify -const -->

```cangjie
const G = 6.674e-11
```

`const` variables can omit type annotations but cannot omit initialization expressions. `const` variables can be global variables, local variables, or static member variables. However, `const` variables cannot be defined in extensions. `const` variables can access all instance members of their corresponding types and can call all non-`mut` instance member functions of their corresponding types.

The following example defines a `struct` to record the mass and radius of a planet, along with a `const` member function `gravity` to calculate the gravitational force exerted by the planet on an object of mass `m` at a distance `r`:

<!-- verify -const -->

```cangjie
struct Planet {
    const Planet(let mass: Float64, let radius: Float64) {}

    const func gravity(m: Float64, r: Float64) {
        G * mass * m / r**2
    }
}

main() {
    const myMass = 71.0
    const earth = Planet(5.972e24, 6.378e6)
    println(earth.gravity(myMass, earth.radius))
}
```

Compiling and executing this code yields the gravitational force exerted by Earth on an adult with a mass of 71 kg on the ground:

<!-- verify -const -->

```text
695.657257
```

After initialization, all members of a `const` variable's type instance are `const` (deep `const`, including members of members) and thus cannot be used as lvalues.

<!-- compile.error -->

```cangjie
main() {
    const myMass = 71.0
    myMass = 70.0 // Error, cannot assign to immutable value
}
```

### Value Types and Reference Type Variables

From the compiler's implementation perspective, any variable is always associated with a value (typically via a memory address/register). However, in usage, some variables directly use the value itself, which are called **value type variables**, while others use the value as an index to access the data it points to, which are called **reference type variables**. Value type variables are usually allocated on the thread stack, with each variable having its own data copy. Reference type variables are usually allocated in the process heap, with multiple variables potentially referencing the same data object. Operations on one variable may affect others.

From the language perspective, value type variables exclusively bind to their data/storage space, while reference type variables can share their data/storage space with other reference type variables.

Based on these principles, there are behavioral differences between value type and reference type variables. The following points are noteworthy:

1. When assigning to a value type variable, a copy operation generally occurs, and the originally bound data/storage space is overwritten. When assigning to a reference type variable, only the reference relationship changes, and the originally bound data/storage space is not overwritten.
2. Variables defined with `let` cannot be reassigned after initialization. For reference types, this only restricts the reference relationship from changing, but the referenced data can still be modified.

In the Cangjie programming language, types like `class` and `Array` are reference types, while other basic data types and `struct` are value types.

For example, the following program demonstrates the behavioral differences between `struct` and `class` type variables:

<!-- verify -->

```cangjie
struct Copy {
    var data = 2012
}

class Share {
    var data = 2012
}

main() {
    let c1 = Copy()
    var c2 = c1
    c2.data = 2023
    println("${c1.data}, ${c2.data}")

    let s1 = Share()
    let s2 = s1
    s2.data = 2023
    println("${s1.data}, ${s2.data}")
}
```

Running the above program will output:

```text
2012, 2023
2023, 2023
```

From this, we can observe that for value-type `Copy` variables, assignment always creates a copy of the `Copy` instance, such as `c2 = c1`. Subsequent modifications to `c2` members do not affect `c1`. For reference-type `Share` variables, assignment establishes a reference relationship between the variable and the instance, such as `s2 = s1`. Subsequent modifications to `s2` members will affect `s1`.

If we change `var c2 = c1` to `let c2 = c1` in the above program, a compilation error will occur, for example:

<!-- compile.error -->

```cangjie
struct Copy {
    var data = 2012
}

main() {
    let c1 = Copy()
    let c2 = c1
    c2.data = 2023 // Error, cannot assign to immutable value
}
```

## Scope

Earlier, we briefly introduced how to name elements in Cangjie programs. In practice, besides variables, names can also be assigned to functions and custom types, which are used to access corresponding program elements.

However, in real-world applications, certain special cases need to be considered:

- When the program scale is large, short names are prone to duplication, leading to naming conflicts.
- Considering runtime behavior, some program elements become invalid in certain code segments, and referencing them may cause runtime errors. For example, some variables become inaccessible after their scope ends.
- In some logical constructs, to express containment relationships between elements, sub-elements should not be accessed directly by name but indirectly through their parent element names.

To address these issues, modern programming languages introduce the concept and design of "scope," limiting the binding relationship between names and program elements to specific ranges. Scopes can be parallel, unrelated, nested, or hierarchical. A scope clearly defines which program elements can be accessed by which names, with the following rules:

1. The binding relationship between program elements and names defined in the current scope is valid within the current scope and its inner scopes. The corresponding program elements can be accessed directly by these names.
2. The binding relationship between program elements and names defined in inner scopes is invalid in outer scopes.
3. Inner scopes can redefine binding relationships using names from outer scopes. According to rule 1, the naming in the inner scope effectively shadows the same-name definition in the outer scope. This is referred to as the inner scope having a higher level than the outer scope.

In the Cangjie programming language, a pair of curly braces `{}` enclosing a segment of Cangjie code creates a new scope. Nested scopes can be formed by further enclosing code in curly braces `{}`, and these scopes all adhere to the above rules. Specifically, in a Cangjie source file, code not enclosed by any curly braces `{}` belongs to the "top-level scope," the "outermost" scope in the current file, which has the lowest scope level according to the above rules.

> **Note:**
>
> Cangjie does not allow standalone curly braces `{}`. Curly braces must be associated with other syntactic structures such as `if`, `match`, function bodies, class bodies, or struct bodies.

For example, in the following Cangjie source file named `test.cj`, the name `element` is defined in the top-level scope, bound to the string "Cangjie." The `main` and `if` blocks also define the name `element`, bound to the integer 9 and integer 2023, respectively. According to the scope rules, on line 4, `element` has the value "Cangjie"; on line 8, `element` has the value 2023; and on line 10, `element` has the value 9.

<!-- verify -->

```cangjie
// test.cj
let element = "Cangjie"
main() {
    println(element)
    let element = 9
    if (element > 0) {
        let element = 2023
        println(element)
    }
    println(element)
}
```

Running the above program will output:

```text
Cangjie
2023
9
```