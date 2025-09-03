# Practical Examples

## Fast Exponentiation Calculation

Demonstrates the use of macros for compile-time evaluation and optimized code generation through a simple example. When calculating the power `n ^ e`, if `e` is a (relatively large) integer, the computation can be accelerated by repeated squaring (rather than iterative multiplication). This algorithm can be directly implemented using a while loop, for example:

<!-- run -->

```cangjie
func power(n: Int64, e: Int64) {
    var result = 1
    var vn = n
    var ve = e
    while (ve > 0) {
        if (ve % 2 == 1) {
            result *= vn
        }
        ve /= 2
        if (ve > 0) {
            vn *= vn
        }
    }
    result
}
```

However, this implementation requires analyzing the value of `e` each time, with multiple checks and updates to `ve` within the loop and conditional statements. Additionally, the implementation only supports cases where `n` is of type `Int64`. To support other types for `n`, the issue of expressing `result = 1` must also be addressed. If the specific value of `e` is known in advance, the code can be simplified. For instance, if `e` is known to be 10, the entire loop can be unrolled as follows:

<!-- run -->

```cangjie
func power_10(n: Int64) {
    var vn = n
    vn *= vn         // vn = n ^ 2
    var result = vn  // result = n ^ 2
    vn *= vn         // vn = n ^ 4
    vn *= vn         // vn = n ^ 8
    result *= vn     // result = n ^ 10
    result
}
```

Of course, manually writing such code is tedious. The goal is to automatically generate this code given the value of `e`. Macros can achieve this. Usage example:

```cangjie
public func power_10(n: Int64) {
    @power[10](n)
}
```

The macro-expanded code is (from the `.macrocall` file):

```cangjie
public func power_10(n: Int64) {
    /* ===== Emitted by MacroCall @power in main.cj:20:5 ===== */
    /* 20.1 */var _power_vn = n
    /* 20.2 */_power_vn *= _power_vn
    /* 20.3 */var _power_result = _power_vn
    /* 20.4 */_power_vn *= _power_vn
    /* 20.5 */_power_vn *= _power_vn
    /* 20.6 */_power_result *= _power_vn
    /* 20.7 */_power_result
/* ===== End of the Emit ===== */
}
```

Below is the implementation of the `@power` macro.

<!-- verify -macro13 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

import std.ast.*
import std.convert.*

public macro power(attrib: Tokens, input: Tokens) {
    let attribExpr = parseExpr(attrib)
    if (let Some(litExpr) <- (attribExpr as LitConstExpr)) {
        let lit = litExpr.literal
        if (lit.kind != TokenKind.INTEGER_LITERAL) {
            diagReport(DiagReportLevel.ERROR, attrib,
                       "Attribute must be integer literal",
                       "Expected integer literal")
        }
        var n = Int64.parse(lit.value)
        var result = quote(var _power_vn = $(input)
        )
        var flag = false
        while (n > 0) {
            if (n % 2 == 1) {
                if (!flag) {
                    result += quote(var _power_result = _power_vn
                    )
                    flag = true
                } else {
                    result += quote(_power_result *= _power_vn
                    )
                }
            }
            n /= 2
            if (n > 0) {
                result += quote(_power_vn *= _power_vn
                )
            }
        }
        result += quote(_power_result)
        return result
    } else {
        diagReport(DiagReportLevel.ERROR, attrib,
                   "Attribute must be integer literal",
                   "Expected integer literal")
    }
    return input
}
```

Explanation of this code:

- First, verify that the input attribute `attrib` is an integer literal; otherwise, report an error via `diagReport`. Parse this literal into an integer `n`.
- Let `result` be the accumulated output code, starting with the declaration of `var _power_vn`. To avoid variable name conflicts, use a non-conflicting name `_power_vn`.
- Enter a while loop, where the boolean variable `flag` indicates whether `var _power_result` has been initialized. The remaining code structure is similar to the implementation of the `power` function shown earlier, but the difference is that while loops and if conditions are used at compile time to determine the generated code, rather than making these decisions at runtime. Then generate code composed of appropriate combinations of `_power_result *= _power_vn` and `_power_vn *= _power_vn`.
- Finally, add the code to return `_power_result` and return this code as the macro's output.

Place this code in the `macros/power.cj` file and add the following test in `main.cj`:

<!-- verify -macro13 -->
<!-- cfg="--debug-macro" -->

```cangjie
import define.*

public func power_10(n: Int64) {
    @power[10](n)
}

main() {
    let a = 3
    println(power_10(a))
}
```

Output result:

<!-- verify -macro13 -->

```text
59049
```

## Memoize Macro

Memoization is a common technique in dynamic programming algorithms. It stores the results of previously computed subproblems so that when the same subproblem arises again, the result can be directly retrieved from the table, avoiding redundant computations and improving algorithm efficiency.

Typically, memoization requires developers to manually implement storage and retrieval functionality. Macros can automate this process. The effect of the macro is as follows:

```cangjie
@Memoize[true]
func fib(n: Int64): Int64 {
    if (n == 0 || n == 1) {
        return n
    }
    return fib(n - 1) + fib(n - 2)
}

main() {
    let start = DateTime.now()
    let f35 = fib(35)
    let end = DateTime.now()
    println("fib(35): ${f35}")
    println("execution time: ${(end - start).toMicroseconds()} us")
}
```

In the above code, the `fib` function is implemented using simple recursion. Without the `@Memoize[true]` annotation, the runtime of this function would grow exponentially with `n`. For example, if the `@Memoize[true]` line is removed or `true` is changed to `false` in the above code, the output of the `main` function would be:

```text
fib(35): 9227465
execution time: 199500 us
```

Restoring `@Memoize[true]`, the output becomes:

```text
fib(35): 9227465
execution time: 78 us
```

The same result with significantly reduced computation time demonstrates that `@Memoize` indeed implements memoization.

To understand the principle of `@Memoize`, the macro-expanded result for the `fib` function is shown below (from the `.macrocall` file, formatted for readability).

<!-- run -->

```cangjie
import std.collection.*

var memoizeFibMap = HashMap<Int64, Int64>()

func fib(n: Int64): Int64 {
    if (memoizeFibMap.contains(n)) {
        return memoizeFibMap.get(n).getOrThrow()
    }

    let memoizeEvalResult = { =>
        if (n == 0 || n == 1) {
            return n
        }

        return fib(n - 1) + fib(n - 2)
    }()
    memoizeFibMap.add(n, memoizeEvalResult)
    return memoizeEvalResult
}
```

The execution flow of the above code is as follows:

- First, define `memoizeFibMap` as a hash table from `Int64` to `Int64`, where the first `Int64` corresponds to the type of `fib`'s single parameter, and the second `Int64` corresponds to `fib`'s return type.
- Next, in the function body, check if the input parameter exists in `memoizeFibMap`. If it does, immediately return the stored value. Otherwise, use the original function body of `fib` to compute the result. Here, a parameterless anonymous function is used to ensure the function body remains unchanged and can handle any exit from the `fib` function (including intermediate returns, returning the last expression, etc.).
- Finally, store the computed result in `memoizeFibMap` and return the result.

With this "template" in place, the implementation of the macro becomes straightforward. The complete code is as follows.

<!-- compile -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

import std.ast.*

public macro Memoize(attrib: Tokens, input: Tokens) {
    if (attrib.size != 1 || attrib[0].kind != TokenKind.BOOL_LITERAL) {
        diagReport(DiagReportLevel.ERROR, attrib,
                   "Attribute must be a boolean literal (true or false)",
                   "Expected boolean literal (true or false) here")
    }

    let memoized = (attrib[0].value == "true")
    if (!memoized) {
        return input
    }

    let fd = FuncDecl(input)
    if (fd.funcParams.size != 1) {
        diagReport(DiagReportLevel.ERROR, fd.lParen + fd.funcParams.toTokens() + fd.rParen,
                   "Input function to memoize should take exactly one argument",
                   "Expect only one argument here")
    }

    let memoMap = Token(TokenKind.IDENTIFIER, "_memoize_" + fd.identifier.value + "_map")
    let arg1 = fd.funcParams[0]

    return quote(
        var $(memoMap) = HashMap<$(arg1.paramType), $(fd.declType)>()

        func $(fd.identifier)($(arg1)): $(fd.declType) {
            if ($(memoMap).contains($(arg1.identifier))) {
                return $(memoMap).get($(arg1.identifier)).getOrThrow()
            }

            let memoizeEvalResult = { => $(fd.block.nodes) }()
            $(memoMap).add($(arg1.identifier), memoizeEvalResult)
            return memoizeEvalResult
        }
    )
}
```

First, perform validity checks on the attribute and input. The attribute must be a boolean literal; if `false`, return the input directly. Otherwise, verify that the input can be parsed as a function declaration (`FuncDecl`) and must contain exactly one parameter. Then, generate the hash table variable using a non-conflicting name. Finally, use the `quote` template to generate the returned code, incorporating the hash table variable name, the single parameter's name and type, and the input function's return type.

## An Extended dprint Macro

This section begins with a macro example for printing expressions, but that macro could only accept one expression at a time. The goal is to extend this macro to accept multiple expressions separated by commas. Below demonstrates how to use `parseExprFragment` to achieve this functionality.

The macro implementation is as follows:

<!-- verify -macro15 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

import std.ast.*

public macro dprint2(input: Tokens) {
    let exprs = ArrayList<Expr>()
    var index: Int64 = 0
    while (true) {
        let (expr, nextIndex) = parseExprFragment(input, startFrom: index)
        exprs.add(expr)
        if (nextIndex == input.size) {
            break
        }
        if (input[nextIndex].kind != TokenKind.COMMA) {
            diagReport(DiagReportLevel.ERROR, input[nextIndex..nextIndex+1],
                       "Input must be a comma-separated list of expressions",
                       "Expected comma")
        }
        index = nextIndex + 1  // Skip comma
    }
    let result = quote()
    for (expr in exprs) {
        result.append(quote(
            print($(expr.toTokens().toString()) + " = ")
            println($(expr))
        ))
    }
    return result
}
```

Usage example:

<!-- verify -macro15 -->
<!-- cfg="--debug-macro" -->

```cangjie
import define.*

main() {
    let x = 3
    let y = 2
    @dprint2(x, y, x + y)
}
```

Output result:

<!-- verify -macro15 -->

```text
x = 3
y = 2
x + y = 5
```

In the macro implementation, a while loop is used to parse each expression sequentially starting from index 0. The variable `index` tracks the current parsing position. Each call to `parseExprFragment` starts from the current position and returns the parsed position (and the parsed expression). If the parsed position reaches the end of the input, the loop exits. Otherwise, check if the reached position is a comma; if not, report an error and exit. If it is a comma, skip it and proceed to the next parsing round. After obtaining the list of expressions, each expression is output sequentially.

## A Simple DSL

This example demonstrates how to use macros to implement a simple DSL (Domain-Specific Language). LINQ (Language Integrated Query) is a component of Microsoft's .NET framework that provides a unified data query syntax, allowing developers to use SQL-like query statements to manipulate various data sources. Here, only the simplest LINQ syntax support is demonstrated.

The desired syntax is:

```text
from <variable> in <list> where <condition> select <expression>
```

Here, `variable` is an identifier, and `list`, `condition`, and `expression` are all expressions. The strategy for implementing the macro is to sequentially extract the identifier and expressions while verifying that the intermediate keywords are correct. Finally, generate the query result composed of the extracted parts.

The macro implementation is as follows:

<!-- verify -macro16 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

import std.ast.*

public macro linq(input: Tokens) {
    let syntaxMsg = "Syntax is \"from <attrib> in <table> where <cond> select <expr>\""
    if (input.size == 0 || input[0].value != "from") {
        diagReport(DiagReportLevel.ERROR, input[0..1], syntaxMsg,
                   "Expected keyword \"from\" here.")
    }
    if (input.size <= 1 || input[1].kind != TokenKind.IDENTIFIER) {
        diagReport(DiagReportLevel.ERROR, input[1..2], syntaxMsg,
                   "Expected identifier here.")
    }
    let attribute = input[1]
    if (input.size <= 2 || input[2].value != "in") {
        diagReport(DiagReportLevel.ERROR, input[2..3], syntaxMsg,
                   "Expected keyword \"in\" here.")
    }
    var index: Int64 = 3
    let (table, nextIndex) = parseExprFragment(input, startFrom: index)
    if (nextIndex == input.size || input[nextIndex].value != "where") {
        diagReport(DiagReportLevel.ERROR, input[nextIndex..nextIndex+1], syntaxMsg,
                   "Expected keyword \"where\" here.")
    }
    index = nextIndex + 1  // Skip where
    let (cond, nextIndex2) = parseExprFragment(input, startFrom: index)
    if (nextIndex2 == input.size || input[nextIndex2].value != "select") {
        diagReport(DiagReportLevel.ERROR, input[nextIndex2..nextIndex2+1], syntaxMsg,
                   "Expected keyword \"select\" here.")
    }
    index = nextIndex2 + 1  // Skip select
    let (expr, nextIndex3) = parseExprFragment(input, startFrom: index)

    return quote(
        for ($(attribute) in $(table)) {
            if ($(cond)) {
                println($(expr))
            }
        }
    )
}
``````
Usage Example:

<!-- verify -macro16 -->
<!-- cfg="--debug-macro" -->

```cangjie
import define.*

main() {
    @linq(from x in 1..=10 where x % 2 == 1 select x * x)
}
```

This example filters odd numbers from the list 1, 2, ... 10, then returns the squares of all odd numbers. The output is:

<!-- verify -macro16 -->

```text
1
9
25
49
81
```

As we can see, a significant portion of the macro implementation is dedicated to parsing and validating input Tokens, which is crucial for the macro's usability. Actual LINQ languages (and most DSLs) have more complex syntax that requires a complete parsing mechanism to determine the next parsing step by identifying different keywords or connectors.