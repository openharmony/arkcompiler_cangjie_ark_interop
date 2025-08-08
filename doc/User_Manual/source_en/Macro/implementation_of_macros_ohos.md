# Implementation of Macros

This chapter introduces the definition and usage of Cangjie macros, which can be categorized into [Non-attribute Macros](./implementation_of_macros_ohos.md#non-attribute-macros) and [Attribute Macros](./implementation_of_macros_ohos.md#attribute-macros). Additionally, this chapter will discuss the behavior when macros are nested.

## Non-attribute Macros

Non-attribute macros only accept the code to be transformed and do not take other parameters (attributes). Their definition format is as follows:

```cangjie
import std.ast.*

public macro MacroName(args: Tokens): Tokens {
    ... // Macro body
}
```

The macro invocation format is as follows:

```cangjie
@MacroName(...)
```

Macro calls are enclosed in `()`. The content inside the parentheses can be any valid `Tokens` or empty.

When a macro is applied to a declaration, the parentheses can generally be omitted. Refer to the following examples:

```cangjie
@MacroName func name1() {}       // Before a FuncDecl
@MacroName struct name2 {}       // Before a StructDecl
@MacroName class name3 {}        // Before a ClassDecl
@MacroName var a = 1             // Before a VarDecl
@MacroName enum e {}             // Before a Enum
@MacroName interface i {}        // Before a InterfaceDecl
@MacroName extend e <: i {}      // Before a ExtendDecl
class C {
    @MacroName prop i: Int64 {   // Before a PropDecl
        get() { 0 }
    }
} 
@MacroName @AnotherMacro(input)  // Before a macro call
```

Special notes on the legality of `Tokens` within parentheses:

- The input must be a sequence composed of valid `Token`s. Symbols like "#", "`", "\\", etc., when used alone, are not valid Cangjie `Token`s and are not supported as input values.

- If the input contains unmatched parentheses, they must be escaped using the escape symbol "\\".

- If the input contains "@" as a `Token`, it must be escaped using the escape symbol "\\".

For special cases of input, refer to the following examples:

```cangjie
// Illegal input Tokens
@MacroName(#)    // Not a whole Token
@MacroName(`)    // Not a whole Token
@MacroName(()    // ( and ) not match
@MacroName(\[)   // Escape for unsupported symbol

// Legal input Tokens
@MacroName(#"abc"#)
@MacroName(`class`)
@MacroName([)
@MacroName([])
@MacroName(\()
@MacroName(\@)
```

The macro expansion process operates on the Cangjie syntax tree. After expansion, the compiler continues with subsequent compilation steps. Therefore, the following rules must be observed:

- The expanded code must still be valid Cangjie code, and it must not contain package declarations or import statements, as this may cause compilation issues.
- When a macro is applied to a declaration, if parentheses are omitted, the input must be a syntactically valid declaration.

Below are several typical examples of macro applications.

- Example 1

  Macro definition file `macro_definition.cj`

  <!-- verify -macro6 -->
  <!-- cfg="--compile-macro" -->

  ```cangjie
  macro package macro_definition

  import std.ast.*

  public macro testDef(input: Tokens): Tokens {
      println("I'm in macro body")
      return input
  }
  ```

  Macro invocation file `macro_call.cj`

  <!-- verify -macro6 -->
  <!-- cfg="--debug-macro" -->

  ```cangjie
  package macro_calling

  import macro_definition.*

  main(): Int64 {
      println("I'm in function body")
      let a: Int64 = @testDef(1 + 2)
      println("a = ${a}")
      return 0
  }
  ```

  The compilation process for the above code can be referred to in [Compilation and Usage of Macros](./compiling_error_reporting_and_debugging_ohos.md#compilation-and-usage-of-macros).

  Print statements are added in the example, where `I'm in macro body` in the macro definition will be output during the compilation of `macro_call.cj`. Meanwhile, the macro invocation point is expanded. For example, compiling the following code:

  ```cangjie
  let a: Int64 = @testDef(1 + 2)
  ```

  The compiler updates the `Tokens` returned by the macro to the syntax tree at the invocation point, resulting in the following code:

  ```cangjie
  let a: Int64 = 1 + 2
  ```

  In other words, the actual code in the executable becomes:

  ```cangjie
  main(): Int64 {
      println("I'm in function body")
      let a: Int64 = 1 + 2
      println("a = ${a}")
      return 0
  }
  ```

  The value of `a` is calculated as 3, and when printing the value of `a`, it is interpolated as 3. Thus, the output of the above program is:

  <!-- verify -macro6 -->

  ```text
  I'm in function body
  a = 3
  ```

Below is a more meaningful example of using a macro to process a function. The `ModifyFunc` macro adds an `id` parameter to `myFunc` and inserts code before and after `counter++`.

- Example 2

  Macro definition file `macro_definition.cj`

  <!-- verify -macro7 -->
  <!-- cfg="--compile-macro" -->

  ```cangjie
  // file macro_definition.cj
  macro package macro_definition

  import std.ast.*

  public macro ModifyFunc(input: Tokens): Tokens {
      println("I'm in macro body")
      let funcDecl = FuncDecl(input)
      return quote(
          func $(funcDecl.identifier)(id: Int64) {
              println("start ${id}")
              $(funcDecl.block.nodes)
              println("end")
          })
  }
  ```

  Macro invocation file `macro_call.cj`

  <!-- verify -macro7 -->
  <!-- cfg="--debug-macro" -->

  ```cangjie
  package macro_calling

  import macro_definition.*

  var counter = 0

  @ModifyFunc
  func myFunc() {
      counter++
  }

  func exModifyFunc() {
      println("I'm in function body")
      myFunc(123)
      println("myFunc called: ${counter} times")
      return 0
  }

  main(): Int64 {
      exModifyFunc()
  }
  ```

  Similarly, the above two code segments are located in different files. First, compile the macro definition file `macro_definition.cj`, then compile the macro invocation file `macro_call.cj` to generate the executable.

  In this example, the input to the `ModifyFunc` macro is a function declaration, so the parentheses can be omitted:

  ```cangjie
  @ModifyFunc
  func myFunc() {
      counter++
  }
  ```

  After macro expansion, the following code is obtained:

  ```cangjie
  func myFunc(id: Int64) {
      println("start ${id}")
      counter++
      println("end")
  }
  ```

  `myFunc` is called in `main`, and the actual parameter it receives is also defined in `main`, forming a valid Cangjie program. The runtime output is as follows:

  <!-- verify -macro7 -->

  ```text
  I'm in function body
  start 123
  end
  myFunc called: 1 times
  ```

## Attribute Macros

Compared to non-attribute macros, attribute macros include an additional `Tokens` type input parameter. This additional parameter allows developers to input extra information. For example, developers might want to use different macro expansion strategies in different invocation scenarios, which can be indicated via this attribute parameter. Additionally, this attribute parameter can accept any `Tokens`, which can be combined or concatenated with the code modified by the macro. Below is a simple example:

<!-- run -macro72 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

// Macro definition with attribute
public macro Foo(attrTokens: Tokens, inputTokens: Tokens): Tokens {
    return attrTokens + inputTokens  // Concatenate attrTokens and inputTokens.
}
```

As shown in the macro definition above, attribute macros have two parameters of type `Tokens`. Within the macro definition, `attrTokens` and `inputTokens` can undergo various transformations such as combination or concatenation, and the new `Tokens` are returned.

The invocation of attribute macros is similar to that of non-attribute macros. The additional `attrTokens` parameter is passed via `[]`, and the invocation form is as follows:

<!-- run -macro72 -->
<!-- cfg="--debug-macro" -->

```cangjie
import define.Foo

// attribute macro with parentheses
var a: Int64 = @Foo[1+](2+3)

// attribute macro without parentheses
@Foo[public]
struct Data {
    var count: Int64 = 100
}

main() {}
```

- For the macro `Foo` invocation, when the parameter is `2+3`, it is concatenated with the attribute `1+` inside `[]`. After macro expansion, the result is `var a: Int64 = 1+2+3`.
- For the macro `Foo` invocation, when the parameter is `struct Data`, it is concatenated with the attribute `public` inside `[]`. After macro expansion, the result is:

  ```cangjie
  public struct Data {
      var count: Int64 = 100
  }
  ```

Regarding attribute macros, the following points should be noted:

- Attribute macros, compared to non-attribute macros, can modify the same AST nodes. They can be understood as an enhancement to the input parameters of non-attribute macros.

- The legality rules for parameters inside parentheses in attribute macros are consistent with those in non-attribute macros.

- The legality rules for attribute parameters inside square brackets have the following special notes:

    - The input must be a sequence composed of valid `Token`s. Symbols like "#", "`", "\\", etc., when used alone, are not valid Cangjie `Token`s and are not supported as input values.

    - If the input contains unmatched square brackets, they must be escaped using the escape symbol "\\".

    - If the input contains "@" as a `Token`, it must be escaped using the escape symbol "\\".

    ```cangjie
    // Illegal attribute Tokens
    @MacroName[#]()    // Not a whole Token
    @MacroName[`]()    // Not a whole Token
    @MacroName[@]()    // Not escape for @
    @MacroName[[]()    // [ and ] not match
    @MacroName[\(]()   // Escape for unsupported symbol

    // Legal attribute Tokens
    @MacroName[#"abc"#]()
    @MacroName[`class`]()
    @MacroName[(]()
    @MacroName[()]()
    @MacroName[\[]()
    @MacroName[\@]()
    ```

- Macro definitions and invocations must maintain type consistency: If a macro is defined with two parameters (i.e., an attribute macro definition), it must be invoked with `[]` (which can be empty). If a macro is defined with one parameter (i.e., a non-attribute macro definition), it cannot be invoked using `[]`.

## Nested Macros

The Cangjie language does not support nested macro definitions but conditionally supports nested macro invocations within macro definitions and macro calls.

### Nested Macro Invocations in Macro Definitions

Below is an example of a macro definition containing other macro invocations.

Macro package `pkg1` defines the `getIdent` macro:

<!-- compile -macro8 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package pkg1

import std.ast.*

public macro getIdent(attr:Tokens, input:Tokens):Tokens {
    return quote(
        let decl = (parseDecl(input) as VarDecl).getOrThrow()
        let name = decl.identifier.value
        let size = name.size - 1
        let $(attr) = Token(TokenKind.IDENTIFIER, name[0..size])
    )
}
```

Macro package `pkg2` defines the `Prop` macro, which nests an invocation of the `getIdent` macro:

<!-- compile -macro8 -->
<!-- cfg="--debug-macro --compile-macro" -->

```cangjie
macro package pkg2

import std.ast.*
import pkg1.*

public macro Prop(input:Tokens):Tokens {
    let v = parseDecl(input)
    @getIdent[ident](input)
    return quote(
        $(input)
        public prop $(ident): $(decl.declType) {
            get() {
                this.$(v.identifier)
            }
        }
    )
}
```

Macro invocation package `pkg3` calls the `Prop` macro:

<!-- compile -macro8 -->
<!-- cfg="--debug-macro" -->

```cangjie
package pkg3

import pkg2.*
class A {
    @Prop
    private let a_: Int64 = 1
}

main() {
    let b = A()
    println("${b.a}")
}
```

Note: Due to the constraint that macro definitions must be compiled before their invocation points, the compilation order of the above three files must be: pkg1 -> pkg2 -> pkg3. The `Prop` macro definition in pkg2:

```cangjie
public macro Prop(input:Tokens):Tokens {
    let v = parseDecl(input)
    @getIdent[ident](input)
    return quote(
        $(input)
        public prop $(ident): $(decl.declType) {
            get() {
                this.$(v.identifier)
            }
        }
    )
}
```

will first be expanded into the following code before compilation:

```cangjie
public macro Prop(input: Tokens): Tokens {
    let v = parseDecl(input)

    let decl = (parseDecl(input) as VarDecl).getOrThrow()
    let name = decl.identifier.value
    let size = name.size - 1
    let ident = Token(TokenKind.IDENTIFIER, name[0 .. size])

    return quote(
        $(input)
        public prop $(ident): $(decl.declType) {
            get() {
                this.$(v.identifier)
            }
        }
    )
}
```

### Nested Macro Invocations in Macro Calls

A common scenario for nested macros is when macro-decorated code blocks contain macro invocations. A concrete example follows:

Package `pkg1` defines the `Foo` and `Bar` macros:

<!-- run -macro9 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package pkg1

import std.ast.*

public macro Foo(input: Tokens): Tokens {
    return input
}

public macro Bar(input: Tokens): Tokens {
    return input
}
```

Package `pkg2` defines the `addToMul` macro:

<!-- run -macro9 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package pkg2

import std.ast.*

public macro addToMul(inputTokens: Tokens): Tokens {
    var expr: BinaryExpr = match (parseExpr(inputTokens) as BinaryExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    var op0: Expr = expr.leftExpr
    var op1: Expr = expr.rightExpr
    return quote(($(op0)) * ($(op1)))
}
```

Package `pkg3` uses the three macros defined above:

<!-- run -macro9 -->
<!-- cfg="--debug-macro" -->

```cangjie
package pkg3

import pkg1.*
import pkg2.*
@Foo
struct Data {
    let a = 2
    let b = @addToMul(2+3)

    @Bar
    public func getA() {
        return a
    }

    public func getB() {
        return b
    }
}

main(): Int64 {
    let data = Data()
    var a = data.getA() // a = 2
    var b = data.getB() // b = 6
    println("a: ${a}, b: ${b}")
    return 0
}
```

As shown in the code above, the `Foo` macro decorates `struct Data`, while within `struct Data`, macro invocations `addToMul` and `Bar` appear. In such nested scenarios, the code transformation rule is: first expand the innermost macros (`addToMul` and `Bar`), then expand the outer macros (`Foo`). Multi-level macro nesting is allowed, and the transformation rule always expands macros from the innermost to the outermost.

Nested macros can appear in both parenthesized and non-parenthesized macro calls, and these can be combined. However, developers must ensure there is no ambiguity and clearly define the macro expansion order:

```cangjie
var a = @foo(@foo1(2 * 3)+@foo2(1 + 3))  // foo1, foo2 have to be defined.

@Foo1 // Foo2 expands first, then Foo1 expands.
@Foo2[attr: struct] // Attribute macro can be used in nested macro.
struct Data{
    @Foo3 @Foo4[123] var a = @bar1(@bar2(2 + 3) + 3)  // bar2, bar1, Foo4, Foo3 expands in order.
    public func getA() {
        return @foo(a + 2)
    }
}
```

### Message Passing Between Nested Macros

This refers to nested macro invocations.

Inner macros can call the library function `assertParentContext` to ensure they are nested within a specific outer macro invocation. If an inner macro calls this function without being nested within the given outer macro, the function will throw an error. The library function `InsideParentContext` similarly checks whether an inner macro invocation is nested within a specific outer macro, returning a boolean value. Below is a simple example.

Macro definitions:

<!-- compile.error -macro92 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

public macro Outer(input: Tokens): Tokens {
    return input
}

public macro Inner(input: Tokens): Tokens {
    assertParentContext("Outer")
    return input
}
```

Macro invocations:

<!-- compile.error -macro92 -->
<!-- cfg="--debug-macro" -->

```cangjie
@Outer var a = 0
@Inner var b = 0 // Error, The macro call 'Inner' should with the surround code contains a call 'Outer'.
```

As shown above, the `Inner` macro uses `assertParentContext` during definition to check whether it is nested within the `Outer` macro during invocation. In the example, since `Outer` and `Inner` lack such a nesting relationship during invocation, the compiler reports an error.

Inner macros can also communicate with outer macros by sending key/value pairs. When an inner macro executes, it sends information to the outer macro via the standard library function `setItem`. Later, when the outer macro executes, it receives the information (a set of key/value mappings) from each inner macro via the standard library function `getChildMessages`. Below is a simple example.

Macro definitions:

<!-- run -macro10 -->
<!-- cfg="--compile-macro" -->

```cangjie
macro package define

import std.ast.*

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner")

    let getTotalFunc = quote(public func getCnt() {
                       )
    for (m in messages) {
        let identName = m.getString("identifierName")
        // let value = m.getString("key")            // Receive multiple messages
        getTotalFunc.append(Token(TokenKind.IDENTIFIER, identName))
        getTotalFunc.append(quote(+))
    }
    getTotalFunc.append(quote(0))
    getTotalFunc.append(quote(}))
    let funcDecl = parseDecl(getTotalFunc)

    let decl = (parseDecl(input) as ClassDecl).getOrThrow()
    decl.body.decls.add(funcDecl)
    return decl.toTokens()

}

public macro Inner(input: Tokens): Tokens {
    assertParentContext("Outer")
    let decl = parseDecl(input)
    setItem("identifierName", decl.identifier.value)
    // setItem("key", "value")                      // Multiple messages can be sent via different keys
    return input
}
```

Macro invocations:

<!-- run -macro10 -->
<!-- cfg="--debug-macro" -->

```cangjie
import define.*

@Outer
class Demo {
    @Inner var state = 1
    @Inner var cnt = 42
}

main(): Int64 {
    let d = Demo()
    println("${d.getCnt()}")
    return 0
}
```

In the above code, the `Outer` macro receives variable names sent by two `Inner` macros and automatically adds the following content to the class:

```cangjie
public func getCnt() {
    state + cnt + 0
}
```

The specific workflow is: The inner macro `Inner` sends messages to the outer macro via `setItem`; the `Outer` macro receives a set of message objects sent by `Inner` through the `getChildMessages` function (`Outer` can invoke `Inner` multiple times); finally, the corresponding values are retrieved via the `getString` function of these message objects.