# Operator Overloading

To support operators that are not natively supported by a type, operator overloading can be implemented.

To overload an operator for a type, define a function with the operator's name for that type. When an instance of this type uses the operator, the corresponding operator function will be automatically invoked.

Operator function definitions are similar to regular function definitions, with the following differences:

- The `operator` modifier must be added before the `func` keyword when defining an operator function.
- The number of parameters in the operator function must match the requirements of the corresponding operator (see Appendix [Operators](../Appendix/operator.md)).
- Operator functions can only be defined within `class`, `interface`, `struct`, `enum`, and `extend`.
- Operator functions have the semantics of instance member functions, so the `static` modifier is prohibited.
- Operator functions cannot be generic functions.

Additionally, it's important to note that overloaded operators do not change their inherent precedence and associativity (see Appendix [Operators](../Appendix/operator.md)).

## Operator Overloading Function Definition and Usage

There are two ways to define operator functions:

1. For types that can directly contain function definitions (including `struct`, `enum`, `class`, and `interface`), operator functions can be defined directly within them to overload operators.
2. Use the `extend` approach to add operator functions, thereby overloading operators for these types. For types that cannot directly contain function definitions (i.e., types other than `struct`, `class`, `enum`, and `interface`) or types whose implementations cannot be modified (e.g., third-party defined `struct`, `class`, `enum`, and `interface`), this is the only available method (see [Extensions](../extension/extend_overview.md)).

The parameter type conventions for operator functions are as follows:

1. For unary operators, the operator function has no parameters, and there are no requirements on the return type.

2. For binary operators, the operator function has exactly one parameter, and there are no requirements on the return type.

   The following example demonstrates the definition and usage of unary and binary operators:

   `-` negates the `x` and `y` member variables of a `Point` instance and returns a new `Point` object. `+` sums the `x` and `y` member variables of two `Point` instances and returns a new `Point` object.

    <!-- run -overloadOperater -->

    ```cangjie
    open class Point {
        var x: Int64 = 0
        var y: Int64 = 0
        public init (a: Int64, b: Int64) {
            x = a
            y = b
        }

        public operator func -(): Point {
            Point(-x, -y)
        }
        public operator func +(right: Point): Point {
            Point(this.x + right.x, this.y + right.y)
        }
    }
    ```

   Subsequently, the unary `-` operator and binary `+` operator can be directly used on instances of `Point`:

    <!-- run -overloadOperater -->

    ```cangjie
    main() {
        let p1 = Point(8, 24)
        let p2 = -p1      // p2 = Point(-8, -24)
        let p3 = p1 + p2  // p3 = Point(0, 0)
    }
    ```

3. The index operator (`[]`) has two forms: value retrieval (`let a = arr[i]`) and value assignment (`arr[i] = a`). These are distinguished by the presence or absence of a special named parameter `value`. Index operator overloading does not require both forms to be overloaded simultaneously; you can overload only the assignment form or only the retrieval form.

   For the value retrieval form of the index operator, the parameter sequence inside `[]` corresponds to the non-named parameters of the operator function. There can be one or more parameters of any type. No other named parameters are allowed. The return type can be any type.

    <!-- compile -->

    ```cangjie
    class A {
        operator func [](arg1: Int64, arg2: String): Int64 {
            return 0
        }
    }

    func f() {
        let a = A()
        let b: Int64 = a[1, "2"]
        // b == 0
    }
    ```

   For the value assignment form of the index operator, the parameter sequence inside `[]` corresponds to the non-named parameters of the operator function. There can be one or more parameters of any type. The expression on the right side of `=` corresponds to the named parameter of the operator function. There must be exactly one named parameter named `value`, which cannot have a default value. The `value` parameter can be of any type. The return type must be `Unit`.

   Note that `value` is a special marker and does not need to be called using named parameter syntax during index operator assignment.

    <!-- compile -->

    ```cangjie
    class A {
        operator func [](arg1: Int64, arg2: String, value!: Int64): Unit {
            return
        }
    }

    func f() {
        let a = A()
        a[1, "2"] = 0
    }
    ```

   Notably, immutable types (except `enum`) do not support overloading the assignment form of the index operator.

4. The function call operator (`()`) overloading function can have input parameters and return values of any type. Example:

    <!-- compile -->

    ```cangjie
    open class A {
        public init() {}

        public operator func ()(): Unit {}
    }

    func test1() {
        let a = A() // OK, A() calls the constructor of A
        a()         // OK, a() calls the operator () overloading function
    }
    ```

   The `()` operator overloading function cannot be called using `this` or `super`. Example:

    <!-- compile.error -->

    ```cangjie
    open class A {
        public init() {}
        public init(x: Int64) {
            this() // OK, this() calls the constructor of A
        }

        public operator func ()(): Unit {}

        public func foo() {
            this()  // Error, this() calls the constructor of A.
            super() // Error
        }
    }

    class B <: A {
        public init() {
            super() // OK, super() calls the constructor of the super class
        }

        public func goo() {
            super() // Error
        }
    }
    ```

   For enumeration types, when both constructor form and `()` operator overloading function form are applicable, the constructor form takes precedence. Example:

    <!-- compile -->

    ```cangjie
    enum E {
        Y | X | X(Int64)

        public operator func ()(p: Int64) {}
        public operator func ()(p: Float64) {}
    }

    main() {
        let e = X(1)    // OK, X(1) calls the constructor X(Int64)
        X(1.0)          // OK, X(1.0) calls the operator () overloading function
        let e1 = X
        e1(1)           // OK, e1(1) calls the operator () overloading function
        Y(1)            // OK, Y(1) calls the operator () overloading function
    }
    ```

## Overloadable Operators

The following table lists all operators that can be overloaded (ordered by precedence from highest to lowest):

| Operator            | Description           |
|:--------------------|:----------------------|
| `()`                | Function call         |
| `[]`                | Indexing              |
| `!`                 | NOT                   |
| `-`                 | Negative              |
| `**`                | Power                 |
| `*`                 | Multiply              |
| `/`                 | Divide                |
| `%`                 | Remainder             |
| `+`                 | Add                   |
| `-`                 | Subtract              |
| `<<`                | Bitwise left shift    |
| `>>`                | Bitwise right shift   |
| `<`                 | Less than             |
| `<=`                | Less than or equal    |
| `>`                 | Greater than          |
| `>=`                | Greater than or equal |
| `==`                | Equal                 |
| `!=`                | Not equal             |
| `&`                 | Bitwise AND           |
| `^`                 | Bitwise XOR           |
| <code>&vert;</code> | Bitwise OR            |

Important notes:

> **Note:**
>
> - If any type overloads a binary operator other than relational operators (`<`, `<=`, `>`, `>=`, `==`, and `!=`), and the return type of the operator function matches or is a subtype of the left operand's type, then the type supports the corresponding compound assignment operator. If the return type does not match or is not a subtype of the left operand's type, a type mismatch error will occur when using the corresponding compound assignment operator.
>   <!-- compile.error -->
>
>   ```cangjie
>   open class MyClass {
>       var x: Int64 = 0
>       public init (a: Int64) {
>           x = a
>       }
>
>       public operator func +(right: MyClass): Int64 { // The above rules are not met
>           this.x + right.x
>       }
>   }
>
>   main() {
>       var a = MyClass(5)
>       var b = MyClass(3)
>       a += b; // Error, type incompatible in this compound assignment expression
>   }
>   ```
>
> - The Cangjie programming language does not support custom operators. Defining operator functions other than those listed in the above table is prohibited.
> - For a type `T`, if `T` already natively supports certain overloadable operators, attempting to redefine operator functions with the same signature via extension will result in a redefinition error. For example, overloading arithmetic operators, bitwise operators, or relational operators with the same signature for numeric types; overloading relational operators with the same signature for `Rune`; overloading logical operators, equality, or inequality operators with the same signature for `Bool` type; etc., will all result in redefinition errors.
>   <!-- compile.error -->
>
>   ```cangjie
>   extend Int64 {
>       public operator func +(x: Int64, y: Int64): Int64 { // Error, invalid number of parameters for operator '+'
>           x + y
>       }
>   }
>   ```