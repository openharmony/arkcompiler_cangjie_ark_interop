# String Type

The string type is denoted by `String` and is used to represent textual data, consisting of a sequence of Unicode characters.

## String Literals

String literals are categorized into three types: single-line string literals, multi-line string literals, and multi-line raw string literals.

**Single-line string literals** are defined within a pair of single or double quotes. The content between the quotes can be any number of arbitrary characters (except for unescaped quotes used to define the string literal and standalone `\` characters). Single-line string literals must be written on the same line and cannot span multiple lines. Examples:

<!-- compile -->

```cangjie
let s1: String = ""
let s2 = 'Hello Cangjie Lang'
let s3 = "\"Hello Cangjie Lang\""
let s4 = 'Hello Cangjie Lang\n'
```

**Multi-line string literals** must begin and end with three double quotes (`"""`) or three single quotes (`'''`). The content starts from the first line after the opening three quotes and continues until the first unescaped occurrence of three matching quotes. The content can include any number of arbitrary characters (except for standalone `\` characters). Unlike single-line string literals, multi-line string literals can span multiple lines. Examples:

<!-- compile -->

```cangjie
let s1: String = """
    """
let s2 = '''
    Hello,
    Cangjie Lang'''
```

**Multi-line raw string literals** begin with one or more hash symbols (`#`) followed by a single or double quote (`'` or `"`), then any number of valid characters, until the matching quote and the same number of hash symbols as the opening sequence are encountered. If the matching quote and hash sequence is not found before the end of the file, a compilation error occurs. Like multi-line string literals, raw multi-line string literals can span multiple lines. The difference is that escape rules do not apply to raw multi-line string literals—the content remains exactly as written (escape characters are not interpreted, e.g., `\n` in `s2` below is not a newline character but the literal string `\n`). Examples:

<!-- compile -->

```cangjie
let s1: String = #""#
let s2 = ##'#'\n'## // Output: #'\n
let s3 = ###"
    Hello,
    Cangjie
    Lang"### // Line breaks and indentation in this variable are preserved
```

For assignment operations of the form `left = right`, if the left operand is of type `Byte` (an alias for the built-in type `UInt8`) and the right operand is a string literal representing an ASCII character, the string will be coerced to `Byte` type before assignment. Similarly, if the left operand is of type `Rune` and the right operand is a single-character string literal, the string will be coerced to `Rune` type before assignment.

<!-- verify -->

```cangjie
main() {
    var b: Byte = "0"
    print(b)
    b = "1"
    print(b)
    var r: Rune = "0"
    print(r)
    r = "1"
    print(r)
}
```

Compiling and executing the above code yields the following output:

```text
484901
```

## Interpolated Strings

An interpolated string is a string literal (not applicable to multi-line raw string literals) containing one or more interpolated expressions. By embedding expressions within the string, it effectively avoids string concatenation issues. Interpolated strings are commonly used in `println` functions to output non-string variable values, e.g., `println("${x}")`.

Interpolated expressions must be enclosed in curly braces `{}` and prefixed with `$`. The `{}` can contain one or more declarations or expressions.

When an interpolated string is evaluated, each interpolated expression is replaced by the value of the last item within `{}`, and the entire interpolated string remains a string.

Below is a simple example of interpolated strings:

<!-- verify -->

```cangjie
main() {
    let fruit = "apples"
    let count = 10
    let s = "There are ${count * count} ${fruit}"
    println(s)

    let r = 2.4
    let area = "The area of a circle with radius ${r} is ${let PI = 3.141592; PI * r * r}"
    println(area)
}
```

Compiling and executing the above code yields the following output:

```text
There are 100 apples
The area of a circle with radius 2.400000 is 18.095570
```

## Operations Supported by String Type

The string type supports comparison using relational operators and concatenation using `+`. The following example demonstrates string equality checks and concatenation:

<!-- verify -->

```cangjie
main() {
    let s1 = "abc"
    var s2 = "ABC"
    let r1 = s1 == s2
    println("The result of 'abc' == 'ABC' is: ${r1}")
    let r2 = s1 + s2
    println("The result of 'abc' + 'ABC' is: ${r2}")
}
```

Compiling and executing the above code yields the following output:

```text
The result of 'abc' == 'ABC' is: false
The result of 'abc' + 'ABC' is: abcABC
```

Strings also support other common operations such as splitting and replacing. Below are some examples:

<!-- run -->

```cangjie
main() {
    var s1 = "abc"
    var s2 = "ABCabc"
    var s3 = "abcyyabcqqabcbc"
    let r1 = s2.contains(s1)    // Checks if s2 contains the string s1
    println(r1)                 // true
    let r2 = s3.split(s1)       // Splits the original string s3 using s1 as a delimiter
    println(r2[1])              // yy
    s1 = s2
    println(s1)                 // ABCabc
}
```