# Interface

An interface is used to define an abstract type that contains no data but can specify the behavior of types. A type is said to implement an interface if it declares to do so and provides implementations for all members defined in that interface.

Interface members may include:

- Member functions
- Operator overload functions
- Member properties

All these members are abstract, requiring implementing types to provide corresponding implementations.

## Interface Definition

A simple interface definition is as follows:

<!-- verify -interface -->

```cangjie
interface I { // 'open' modifier is optional.
    func f(): Unit
}
```

Interfaces are declared using the `interface` keyword, followed by the interface identifier `I` and its members. Interface members can be modified with the `open` modifier, which is optional.

When interface `I` declares a member function `f`, any type implementing `I` must provide a corresponding implementation of `f`.

Since `interface` inherently has `open` semantics, the `open` modifier in interface definitions is optional.

As shown in the following code, a `class Foo` is defined, using the syntax `Foo <: I` to declare that `Foo` implements interface `I`.

`Foo` must contain implementations for all members declared in `I`, meaning it needs to define an `f` of the same type. Otherwise, compilation will fail due to unimplemented interface requirements.

<!-- verify -interface -->

```cangjie
class Foo <: I {
    public func f(): Unit {
        println("Foo")
    }
}

main() {
    let a = Foo()
    let b: I = a
    b.f() // "Foo"
}
```

When a type implements an interface, it becomes a subtype of that interface.

In the example above, `Foo` is a subtype of `I`. Therefore, any instance of `Foo` can be used as an instance of `I`.

In `main`, a `Foo`-type variable `a` is assigned to an `I`-type variable `b`. When calling function `f` on `b`, the `f` implementation from `Foo` is executed, printing:

<!-- verify -interface -->

```text
Foo
```

An `interface` can also be modified with `sealed`, indicating that it can only be inherited, implemented, or extended within the package where the interface is defined. The `sealed` modifier inherently implies `public`/`open` semantics. Thus, if `public`/`open` modifiers are provided when defining a `sealed interface`, the compiler will issue a warning. Child interfaces inheriting from a `sealed` interface or abstract classes implementing it may still be marked with `sealed` or left unmodified. If a child interface of a `sealed` interface is marked `public` but not `sealed`, it can be inherited, implemented, or extended outside the package. Types inheriting or implementing a `sealed` interface need not be marked `public`.

<!-- compile -->

```cangjie
package A
public interface I1 {}
sealed interface I2 {}         // OK
public sealed interface I3 {}  // Warning, redundant modifier, 'sealed' implies 'public'
sealed open interface I4 {}    // Warning, redundant modifier, 'sealed' implies 'open'

class C1 <: I1 {}
public open class C2 <: I1 {}
sealed abstract class C3 <: I2 {}
extend Int64 <: I2 {}
```

<!-- compile.error -error-->

```cangjie
package B
import A.*

class S1 <: I1 {}  // OK
class S2 <: I2 {}  // Error, I2 is sealed interface, cannot be inherited here.
```

Through this constraint mechanism, interfaces can define common functionalities for a set of types, achieving the purpose of functional abstraction.

For example, the following code defines a `Flyable` interface and has other classes with flying capabilities implement it.

<!-- verify -->

```cangjie
interface Flyable {
    func fly(): Unit
}

class Bird <: Flyable {
    public func fly(): Unit {
        println("Bird flying")
    }
}

class Bat <: Flyable {
    public func fly(): Unit {
        println("Bat flying")
    }
}

class Airplane <: Flyable {
    public func fly(): Unit {
        println("Airplane flying")
    }
}

func fly(item: Flyable): Unit {
    item.fly()
}

main() {
    let bird = Bird()
    let bat = Bat()
    let airplane = Airplane()
    fly(bird)
    fly(bat)
    fly(airplane)
}
```

Compiling and executing the above code produces the following output:

```text
Bird flying
Bat flying
Airplane flying
```

Interface members can be either instance or static. The previous examples demonstrated instance member functions; next, we examine static member functions.

Static member functions, like instance member functions, require implementing types to provide their implementations.

For example, the following code defines a `NamedType` interface containing a static member function `typename` to retrieve the string name of each type.

When other types implement `NamedType`, they must provide an implementation for `typename`, allowing safe retrieval of type names from `NamedType` subtypes.

<!-- verify -->

```cangjie
interface NamedType {
    static func typename(): String
}

class A <: NamedType {
    public static func typename(): String {
        "A"
    }
}

class B <: NamedType {
    public static func typename(): String {
        "B"
    }
}

main() {
    println("the type is ${ A.typename() }")
    println("the type is ${ B.typename() }")
}
```

The program output is:

```text
the type is A
the type is B
```

Static member functions (or properties) in interfaces may either have no default implementation or provide one.

When no default implementation exists, the function cannot be accessed via the interface type name. For example, the following code results in a compilation error when attempting to access `NamedType`'s `typename` function, as `NamedType` lacks an implementation.

<!-- compile.error -->

```cangjie
interface NamedType {
    static func typename(): String
}
main() {
    NamedType.typename() // Error
}
```

Static member functions (or properties) in interfaces can also have default implementations. When a type inherits an interface with default static function implementations, it may omit reimplementing those members. The function (or property) can then be accessed directly via either the interface name or the type name. In the following example, `NamedType`'s `typename` has a default implementation, and `A` does not need to reimplement it. The function can be accessed through both the interface and type names.

<!-- verify -->

```cangjie
interface NamedType {
    static func typename(): String {
        "interface NamedType"
    }
}

class A <: NamedType {}

main() {
    println(NamedType.typename())
    println(A.typename())
}
```

The program output is:

```text
interface NamedType
interface NamedType
```

Such static members are typically used in generic functions through generic constraints.

For example, the `printTypeName` function below constrains the generic parameter `T` to be a subtype of `NamedType`. This ensures that all static member functions (or properties) in the instantiated type `T` have implementations, enabling access via `T.typename`. This achieves abstraction of static members. For details, see [Generics](../generic/generic_overview.md).

<!-- compile.error -->

```cangjie
interface NamedType {
    static func typename(): String
}

interface I <: NamedType {
    static func typename(): String {
        f()
    }
    static func f(): String
}

class A <: NamedType {
    public static func typename(): String {
        "A"
    }
}

class B <: NamedType {
    public static func typename(): String {
        "B"
    }
}

func printTypeName<T>() where T <: NamedType {
    println("the type is ${ T.typename() }")
}

main() {
    printTypeName<A>() // OK
    printTypeName<B>() // OK
    printTypeName<I>() // Error, 'I' must implement all static function. Otherwise, an unimplemented 'f' is called, causing problems.
}
```

Interfaces can define generic instance member functions or generic static member functions, which, like non-generic functions, have `open` semantics.

<!-- compile -->

```cangjie
import std.collection.ArrayList
interface M {
    func foo<T>(a: T): T
    static func toString<T>(b: ArrayList<T>): String where T <: ToString
}
class C <: M {
    public func foo<S>(a: S): S { // implements M::foo, names of generic parameters do not matter
        a
    }
    public static func toString<T>(b: ArrayList<T>) where T <: ToString {
        var res = ""
        for (s in b) {
            res += s.toString()
        }
        res
    }
}
```

Note that interface members are inherently `public` and cannot be declared with additional access control modifiers. Implementing types must also use `public` for these members.

<!-- compile.error -->

```cangjie
interface I {
    func f(): Unit
}

open class C <: I {
    protected func f() {} // Compiler Error, f needs to be public semantics
}
```

## Interface Inheritance and Interface Implementation

When a type needs to implement multiple interfaces, you can use `&` to separate multiple interfaces in the declaration. The order of the interfaces does not matter.

For example, the following code allows `MyInt` to implement both the `Addable` and `Subtractable` interfaces.

<!-- compile -->

```cangjie
interface Addable {
    func add(other: Int64): Int64
}

interface Subtractable {
    func sub(other: Int64): Int64
}

class MyInt <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }
}
```

An interface can inherit one or more interfaces but cannot inherit a class. Additionally, new interface members can be added during interface inheritance.

For example, the `Calculable` interface in the following code inherits both the `Addable` and `Subtractable` interfaces and adds overloads for multiplication and division operators.

<!-- compile -myInt -->

```cangjie
interface Addable {
    func add(other: Int64): Int64
}

interface Subtractable {
    func sub(other: Int64): Int64
}

interface Calculable <: Addable & Subtractable {
    func mul(other: Int64): Int64
    func div(other: Int64): Int64
}
```

When a type implements the `Calculable` interface, it must implement all four operator overloads (addition, subtraction, multiplication, and division). No member can be omitted.

<!-- compile -myInt -->

```cangjie
class MyInt <: Calculable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }
    public func mul(other: Int64): Int64 {
        value * other
    }
    public func div(other: Int64): Int64 {
        value / other
    }
}
```

By implementing `Calculable`, `MyInt` also implements all interfaces inherited by `Calculable`. Thus, `MyInt` is also a subtype of `Addable` and `Subtractable`.

<!-- compile -myInt -->

```cangjie
main() {
    let myInt = MyInt()
    let add: Addable = myInt
    let sub: Subtractable = myInt
    let calc: Calculable = myInt
}
```

For interface inheritance, if a child interface inherits a function or property with a default implementation from its parent interface, the child interface cannot merely declare that function or property (i.e., without a default implementation). It must provide a new default implementation. The `override` or `redef` modifier before the function definition is optional. If the child interface inherits a function or property without a default implementation from its parent interface, the child interface may choose to only declare the function or property or provide a default implementation. The `override` or `redef` modifier is also optional in this case. The `redef` modifier is specifically for redefining static functions with the same name in child classes.

<!-- compile.error -->

```cangjie
interface I1 {
   func f(a: Int64) {
        a
   }
   static func g(a: Int64) {
        a
   }
   func f1(a: Int64): Unit
   static func g1(a: Int64): Unit
}

interface I2 <: I1 {
    /*'override' is optional*/ func f(a: Int64) {
       a + 1
    }
    override func f(a: Int32) {} // Error, override function 'f' does not have an overridden function from its supertypes
    static /*'redef' is optional*/ func g(a: Int64) {
       a + 1
    }
    /*'override' is optional*/ func f1(a: Int64): Unit {}
    static /*'redef' is optional*/ func g1(a: Int64): Unit {}
}
```

### Requirements for Interface Implementation

In Cangjie, all types except `Tuple`, `VArray`, and functions can implement interfaces.

There are three ways for a type to implement an interface:

1. Declare the interface implementation when defining the type (examples have been shown above).
2. Implement the interface via extension (details can be found in [Extensions](../extension/interface_extension.md)).
3. Built-in implementation by the language (details can be found in the *Cangjie Programming Language Library API* documentation).

When a type declares the implementation of an interface, it must implement all members required by the interface. The following rules must be satisfied:

1. For member functions and operator overload functions, the implementing type must provide functions with the same name, parameter list, and return type as those in the interface.
2. For member properties, the `mut` modifier must be consistent, and the property types must match.

In most cases, as shown in the examples above, the implementing type must contain implementations of members that match the interface requirements.

However, there is one exception: if the return type of a member function or operator overload function in the interface is a `class` type, the implementing function's return type can be a subtype of that `class` type.

For example, in the following code, the return type of `f` in `I` is the `class` type `Base`. Therefore, the return type of `f` in `C` can be `Sub`, a subtype of `Base`.

<!-- compile -->

```cangjie
open class Base {}
class Sub <: Base {}

interface I {
    func f(): Base
}

class C <: I {
    public func f(): Sub {
        Sub()
    }
}
```

Additionally, interface members can provide default implementations. For example, in the following code, `say` in `SayHi` has a default implementation. Thus, `A` can inherit the default implementation of `say` when implementing `SayHi`, while `B` can choose to provide its own implementation of `say`.

<!-- compile -->

```cangjie
interface SayHi {
    func say() {
        "hi"
    }
}

class A <: SayHi {}

class B <: SayHi {
    public func say() {
        "hi, B"
    }
}
```

Notably, if a type implements multiple interfaces that contain default implementations for the same member, a multiple inheritance conflict occurs. The language cannot determine the most suitable implementation, so the default implementations become invalid, and the implementing type must provide its own implementation.

For example, in the following code, both `SayHi` and `SayHello` contain implementations of `say`. When `Foo` implements these two interfaces, it must provide its own implementation of `say`; otherwise, a compilation error will occur.

<!-- compile -->

```cangjie
interface SayHi {
    func say() {
        "hi"
    }
}

interface SayHello {
    func say() {
        "hello"
    }
}

class Foo <: SayHi & SayHello {
    public func say() {
        "Foo"
    }
}
```

For `struct`, `enum`, and `class`, the `override` modifier (or `redef` modifier) before function or property definitions is optional when implementing interfaces, regardless of whether the interface's function or property has a default implementation.

<!-- compile -->

```cangjie
interface I {
    func foo(): Int64 {
        return 0
    }
}
enum E <: I{
    elem
    public override func foo(): Int64 {
        return 1
    }
}
struct S <: I {
    public override func foo(): Int64 {
        return 1
    }
}
```

## The `Any` Type

`Any` is a built-in interface defined as follows:

<!-- compile -->

```cangjie
interface Any {}
```

In Cangjie, all interfaces implicitly inherit from `Any`, and all non-interface types implicitly implement it. Therefore, all types can be used as subtypes of `Any`.

For example, the following code assigns variables of different types to an `Any` variable.

<!-- compile -->

```cangjie
main() {
    var any: Any = 1
    any = 2.0
    any = "hello, world!"
}
```