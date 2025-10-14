# Function Overloading

## Definition of Function Overloading

In the Cangjie programming language, when multiple function definitions share the same name within a single scope, this phenomenon is referred to as function overloading.

- Two functions constitute an overload if they share the same name but differ in their parameters (either in the number of parameters or in the types of parameters when the count is the same). Example:

  <!-- compile -->

  ```cangjie
  // Scenario 1

  func f(a: Int64): Unit {}
  func f(a: Float64): Unit {}
  func f(a: Int64, b: Float64): Unit {}
  ```

- For two generic functions with the same name (see the [Generic Functions](../generic/generic_function.md#generic-functions) section), if renaming the generic type parameters of one function (to align the generic parameter order) results in non-generic parts that differ in function parameters from the other function, they constitute an overload. Otherwise, these two generic functions result in a duplicate definition error (type argument constraints are not considered in this judgment). Example:

  <!-- compile.error -->

  ```cangjie
  // Scenario 2

  interface I1{}
  interface I2{}

  func f1<X, Y>(a: X, b: Y) {}
  func f1<Y, X>(a: X, b: Y) {} // OK: after rename generic type parameter, it will be 'func f1<X, Y>(a: Y, b: X)'

  func f2<T>(a: T) where T <: I1 {} // Error, not overloading
  func f2<T>(a: T) where T <: I2 {} // Error, not overloading
  ```

- Two constructors within the same class with different parameters constitute an overload. Example:

  <!-- compile -->

  ```cangjie
  // Scenario 3

  class C {
      var a: Int64
      var b: Float64

      public init(a: Int64, b: Float64) {
          this.a = a
          this.b = b
      }

      public init(a: Int64) {
          b = 0.0
          this.a = a
      }
  }
  ```

- The primary constructor and an `init` constructor within the same class with different parameters constitute an overload (the primary constructor and `init` function are considered to share the same name). Example:

  <!-- compile -->

  ```cangjie
  // Scenario 4

  class C {
      C(var a!: Int64, var b!: Float64) {
          this.a = a
          this.b = b
      }

      public init(a: Int64) {
          b = 0.0
          this.a = a
      }
  }
  ```

- Two functions with the same name but different parameters defined in different scopes constitute an overload in any scope where both functions are visible. Example:

  <!-- compile -->

  ```cangjie
  // Scenario 5

  func f(a: Int64): Unit {}

  func g() {
      func f(a: Float64): Unit {}
  }
  ```

- If a subclass contains a function with the same name as a function in its parent class but with different parameter types, this constitutes function overloading. Example:

  <!-- compile -->

  ```cangjie
  // Scenario 6
  open class Base {
      public func f(a: Int64): Unit {}
  }

  class Sub <: Base {
      public func f(a: Float64): Unit {}
  }
  ```

Only function declarations can introduce function overloading. The following scenarios do not constitute overloading, and two names that do not constitute an overload cannot be defined or declared in the same scope:

- Static member functions and instance member functions of class, interface, or struct types cannot overload each other.
- Constructors, static member functions, and instance member functions of enum types cannot overload each other.

In the following example, both variables are of function type with different parameter types, but since they are not function declarations, they cannot overload each other, resulting in a compilation error (redefinition error):

<!-- compile.error -->

```cangjie
main() {
    var f: (Int64) -> Unit
    var f: (Float64) -> Unit
}
```

In the following example, although variable `f` is of function type, variables and functions cannot share the same name, resulting in a compilation error (redefinition error):

<!-- compile.error -->

```cangjie
main() {
    var f: (Int64) -> Unit
    func f(a: Float64): Unit {} // Error, functions and variables cannot have the same name
}
```

In the following example, static member function `f` and instance member function `f` have different parameter types, but since static and instance member functions within a class cannot overload each other, this results in a compilation error:

<!-- compile.error -->

```cangjie
class C {
    public static func f(a: Int64): Unit {}
    public func f(a: Float64): Unit {}
}
```

## Function Overload Resolution

When a function is called, all callable functions (those visible in the current scope and passing type checks) form a candidate set. If the candidate set contains multiple functions, function overload resolution determines which function to select, following these rules:

- Prefer functions in higher-level scopes. Within nested expressions or functions, inner scopes have higher levels than outer scopes.

  In the following example, when calling `g(Sub())` within the `inner` function body, the candidate set includes both the function `g` defined inside `inner` and the function `g` defined outside `inner`. The resolution selects the function `g` defined inside `inner`, which has a higher scope level.

    <!-- compile -->

    ```cangjie
    open class Base {}
    class Sub <: Base {}

    func outer() {
        func g(a: Sub) {
            print("1")
        }

        func inner() {
            func g(a: Base) {
                print("2")
            }

            g(Sub())   // Output: 2
        }
    }
    ```

- If multiple functions remain at the highest relative scope level, select the best-matching function (for functions f and g and given arguments, if f can always be called whenever g can, but not vice versa, then f is considered a better match than g). If no single best-matching function exists, an error is reported.

  In the following example, both functions `g` are defined in the same scope, and the better-matching function `g(a: Sub): Unit` is selected.

    <!-- compile -->

    ```cangjie
    open class Base {}
    class Sub <: Base {}

    func outer() {
        func g(a: Sub) {
            print("1")
        }
        func g(a: Base) {
            print("2")
        }

        g(Sub())   // Output: 1

    }
    ```

- Subclasses and parent classes are considered to be in the same scope. In the following example, one function `g` is defined in the parent class, and another function `g` is defined in the subclass. When calling `s.g(Sub())`, both functions `g` are treated as being at the same scope level for resolution, and the better-matching function `g(a: Sub): Unit` defined in the parent class is selected.

    <!-- compile -->

    ```cangjie
    open class Base {
        public func g(a: Sub) {
            print("1")
        }
    }

    class Sub <: Base {
        public func g(a: Base) {
            print("2")
        }
    }

    func outer() {
        let s: Sub = Sub()
        s.g(Sub()) // Output: 1
    }
    ```