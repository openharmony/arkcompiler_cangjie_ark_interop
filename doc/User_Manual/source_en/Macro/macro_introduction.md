# Introduction to Macros

Macros can be understood as a special type of function. While regular functions perform computations on input values and output a new value, macros take program code as input and output new program code. After processing an input program segment, a macro outputs a new program segment, which is then used for compilation and execution. To distinguish macro calls from function calls, macros are invoked using `@` followed by the macro name.

The following example demonstrates printing both the value and the expression itself during debugging:

```cangjie
let x = 3
let y = 2
@dprint(x)        // Prints "x = 3"
@dprint(x + y)    // Prints "x + y = 5"
```

Clearly, `dprint` cannot be implemented as a regular function because functions only receive the evaluated result of input expressions, not the expressions themselves. However, `dprint` can be implemented as a macro to capture the program fragment of input expressions. A basic implementation is shown below:

<!-- verify -macro12 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

import std.ast.*

public macro dprint(input: Tokens): Tokens {
    let inputStr = input.toString()
    let result = quote(
        print($(inputStr) + " = ")
        println($(input)))
    return result
}
```

Before explaining each line, let's verify this macro achieves the desired effect. First, create a `define` directory in the current folder, then create a `dprint.cj` file inside it containing the above code. Additionally, create a `main.cj` in the current directory with the following test code:

<!-- verify -macro12 -->
<!-- cfg="--debug-macro" -->

```cangjie
import define.*

main() {
    let x = 3
    let y = 2
    @dprint(x)
    @dprint(x + y)
}
```

Note the resulting directory structure:

```text
// Directory layout.
src
|-- define
|     `-- dprint.cj
`-- main.cj
```

In the current directory (`src`), run the compilation commands:

```bash
cjc define/*.cj --compile-macro
cjc main.cj -o main
```

Then execute `./main` to see the following output:

<!-- verify -macro12 -->

```text
x = 3
x + y = 5
```

Now let's examine each part of the code:

- Line 1: `macro package define`

  Macros must be declared in separate packages (cannot coexist with other public functions). Packages containing macros are declared using `macro package`. Here we declare a macro package named `define`.

- Line 2: `import std.ast.*`

  Data types needed for macro implementation, such as `Tokens` and syntax node types (to be discussed later), are located in the `ast` package of the Cangjie standard library. Therefore, any macro implementation must first import the `ast` package.

- Line 3: `public macro dprint(input: Tokens): Tokens`

  This declares a macro named `dprint`. As this is a non-attribute macro (this concept will be explained later), it accepts one parameter of type `Tokens`, representing the program fragment passed to the macro. The return value is also a program fragment.

- Line 4: `let inputStr = input.toString()`

  In the macro implementation, we first convert the input program fragment to a string. In our test cases, `inputStr` becomes `"x"` or `"x + y"`.

- Lines 5-7: `let result = quote(...)`

  The [`quote` expression](./Tokens_types_and_quote_expressions.md#quote-expressions-and-interpolation) is used to construct [`Tokens`](./Tokens_types_and_quote_expressions.md#tokens-type). It converts the program fragment within parentheses into `Tokens`. Inside `quote`, interpolation `$(...)` can be used to convert expressions into `Tokens` and insert them into the constructed `Tokens`. In this code, `$(inputStr)` inserts the string value of `inputStr` (including quotation marks), while `$(input)` inserts the input program fragment. Thus, for input `x + y`, the resulting `Tokens` would be:

  ```cangjie
  print("x + y" + " = ")
  println(x + y)
  ```

- Line 8: `return result`

  Finally, the constructed code fragment is returned. These two lines of code will be compiled and, when executed, will output `x + y = 5`.

Reviewing the `dprint` macro definition, we see it takes `Tokens` as input and uses `quote` with interpolation to construct another `Tokens` as output. To work with macros effectively, we need to thoroughly understand the concepts of `Tokens`, `quote`, and interpolation, which will be explained in detail next.