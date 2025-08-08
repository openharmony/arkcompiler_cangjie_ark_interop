# Macro Package Definition and Import

In the Cangjie language, macro definitions must be placed within a package declared with `macro package`. Only macro definitions within a `macro package` are visible externally, while other declarations remain package-private.

> **Note:**
>
> Re-exported declarations are also allowed to be visible externally. For concepts related to package management and re-exporting, please refer to the [Package Import](../package/import.md) chapter.

<!-- compile.error -macro4 -->
<!-- cfg="--compile-macro" -->

```cangjie
// file define.cj
macro package define         // Compiling define.cjo with macro attribute
import std.ast.*

public func A() {}          // Error: Macro packages prohibit non-macro definitions from being visible externally. This will raise an error.

public macro M(input: Tokens): Tokens { // Macro M is visible externally
    return input
}
```

It's important to note that within macro packages, declarations from other macro packages and non-macro packages can be re-exported. In non-macro packages, only declarations from non-macro packages can be re-exported.

Refer to the following examples:

- Define macro `M1` in macro package A

  <!-- compile -macro5 -->
  <!-- cfg="--compile-macro" -->

  ```cangjie
  macro package A
  import std.ast.*

  public macro M1(input: Tokens): Tokens {
      return input
  }
  ```

  Compilation command:

  ```shell
  cjc A.cj --compile-macro
  ```

- Define a public function `f1` in non-macro package B. Note that symbols from `macro package` cannot be re-exported in non-`macro package` contexts.

  <!-- compile -macro5 -->
  <!-- cfg="--output-type=dylib -o libB.so" -->

  ```cangjie
  package B
  // public import A.* // Error: Re-exporting a macro package in a regular package is not allowed.

  public func f1(input: Int64): Int64 {
      return input
  }
  ```

  Compilation command (here we use the `--output-type` option to compile package B into a dynamic library. For details about cjc compilation options, refer to the "Appendix > cjc Compilation Options" chapter):

  ```shell
  cjc B.cj --output-type=dylib -o libB.so
  ```

- Define macro `M2` in macro package C, which depends on content from packages A and B. Note that `macro package` can re-export symbols from both `macro package` and non-`macro package`.

  <!-- compile -macro5 -->
  <!-- cfg="--compile-macro -L. -lB" -->

  ```cangjie
  macro package C
  public import A.* // Correct: Macro packages allow re-exporting within macro packages.
  public import B.* // Correct: Non-macro packages are also allowed to be re-exported within macro packages.
  import std.ast.*

  public macro M2(input: Tokens): Tokens {
      return @M1(input) + Token(TokenKind.NL) + quote(f1(1))
  }
  ```

  Compilation command (note explicit linking of package B's dynamic library is required):

  ```bash
  cjc C.cj --compile-macro -L. -lB
  ```

- Using `M2` macro in `main.cj`

  <!-- compile -macro5 -->
  <!-- cfg="--debug-macro -L. -lB" -->

  ```cangjie
  import C.*

  main() {
      @M2(let a = 1)
  }
  ```

  Compilation command:

  ```cangjie
  cjc main.cj -o main -L. -lB
  ```

  The expanded result of `M2` macro in `main.cj`:

  ```bash
  import C.*

  main() {
      let a = 1
      f1(1)
  }
  ```

We can observe that `main.cj` contains the symbol `f1` from package B. Macro authors can re-export symbols from package B within package C, allowing macro users to simply import the macro package to correctly compile the expanded code. If `main.cj` only imports the macro symbol with `import C.M2`, it will raise an `undeclared identifier 'f1'` error.