# Formatting Tool

## Feature Overview

`CJFMT (Cangjie Formatter)` is an automatic code formatting tool developed based on the Cangjie language programming specifications.

## Usage Instructions

Use the command line operation `cjfmt [option] file [option] file`

`cjfmt -h` displays help information and option descriptions.

```text
Usage:
     cjfmt -f fileName [-o fileName] [-l start:end]
     cjfmt -d fileDir [-o fileDir]
Options:
   -h            Show usage
                     eg: cjfmt -h
   -f            Specifies the file in the required format. The value can be a relative path or an absolute path.
                     eg: cjfmt -f test.cj
   -d            Specifies the file directory in the required format. The value can be a relative path or an absolute path.
                     eg: cjfmt -d test/
   -o <value>    Output. If a single file is formatted, '-o' is followed by the file name. Relative and absolute paths are supported;
                 If a file in the file directory is formatted, a path must be added after -o. The path can be a relative path or an absolute path.
                     eg: cjfmt -f a.cj -o ./fmta.cj
                     eg: cjfmt -d ~/testsrc -o ./testout
   -c <value>    Specify the format configuration file, relative and absolute paths are supported.
                 If the specified configuration file fails to be read, cjfmt will try to read the default configuration file in CANGJIE_HOME.
                 If the default configuration file also fails to be read, will use the built-in configuration.
                     eg: cjfmt -f a.cj -c ./config/cangjie-format.toml
                     eg: cjfmt -d ~/testsrc -c ~/home/project/config/cangjie-format.toml
   -l <region>   Only format lines in the specified region for the provided file. Only valid if a single file was specified.
                 Region has a format of [start:end] where 'start' and 'end' are integer numbers representing first and last lines to be formated in the specified file.
                 Line count starts with 1.
                     eg: cjfmt -f a.cj -o ./fmta.cj -l 1:25
```

### File Formatting

`cjfmt -f`

- Format and overwrite the source file. Supports relative and absolute paths.

```shell
cjfmt -f ../../../test/uilang/Thread.cj
```

- Option `-o` creates a new `.cj` file to export the formatted code. Both source and output files support relative and absolute paths.

```shell
cjfmt -f ../../../test/uilang/Thread.cj -o ../../../test/formated/Thread.cj
```

### Directory Formatting

`cjfmt -d`

- Option `-d` allows developers to specify a Cangjie source code directory for formatting. Supports relative and absolute paths.

```shell
cjfmt -d test/              // Source directory is a relative path

cjfmt -d /home/xxx/test     // Source directory is an absolute path
```

- Option `-o` specifies the output directory, which can be an existing path. If it doesn't exist, the relevant directory structure will be created. Supports relative and absolute paths. The maximum path length (MAX_PATH) varies across systems. For example, on Windows, this value generally cannot exceed 260, while on Linux, it is recommended not to exceed 4096.

```shell
cjfmt -d test/ -o /home/xxx/testout

cjfmt -d /home/xxx/test -o ../testout/

cjfmt -d testsrc/ -o /home/../testout   // Error if source directory doesn't exist: "error: Source file path not exist!"
```

### Formatting Configuration File

`cjfmt -c`

- Option `-c` allows developers to specify a custom formatting configuration file.

```shell
cjfmt -f a.cj -c ./cangjie-format.toml
```

The default `cangjie-format.toml` configuration file contains the following settings, which are also the built-in configuration values for the `cjfmt` tool:

```toml
# indent width
indentWidth = 4 # Range of indentWidth: [0, 8]

# limit length
linelimitLength = 120 # Range of indentWidth: [1, 120]

# line break type
lineBreakType = "LF" # "LF" or "CRLF"

# allow Multi-line Method Chain when it's level equal or greater than multipleLineMethodChainLevel
allowMultiLineMethodChain = false

# if allowMultiLineMethodChain's value is true,
# and method chain's level is equal or greater than multipleLineMethodChainLevel,
# method chain will be formatted to multi-line method chain.
# e.g. A.b().c() level is 2, A.b().c().d() level is 3
# ObjectA.b().c().d().e().f() =>
# ObjectA
#     .b()
#     .c()
#     .d()
#     .e()
#     .f()
multipleLineMethodChainLevel = 5 # Range of multipleLineMethodChainLevel: [2, 10]

# allow Multi-line Method Chain when it's length greater than linelimitLength
multipleLineMethodChainOverLineLength = true
```

> **Note:**
>
> If the custom formatting configuration file fails to load, the tool will attempt to read the default configuration file `cangjie-format.toml` from the CANGJIE_HOME environment.
> If the default configuration file also fails to load, the built-in formatting configuration options of `cjfmt` will be used.
> If a specific configuration option in the formatting configuration file fails to load, the built-in formatting configuration option for that setting will be used.

### Partial Formatting

`cjfmt -l`

- Option `-l` allows developers to specify a portion of the file to be formatted. The formatter will only apply rules to the source code within the specified line range.
- The `-l` option is only valid when formatting a single file (option `-f`). If a directory is specified (option `-d`), the `-l` option will be ignored.

```shell
cjfmt -f a.cj -o b.cj -l 10:25 // Only formats lines 10 to 25
```

## Formatting Rules

- A source file sequentially includes copyright, package, import, and top-level elements, separated by blank lines.

[Correct Example]

<!-- only-format -->

```cangjie
// Part 1: Copyright information
/*
 * Copyright (c) [Year of First Pubication]-[Year of Latest Update]. [Company Name]. All rights reserved.
 */

// Part 2: Package declaration
package com.myproduct.mymodule

// Part 3: Import declarations
import std.collection.HashMap   // Standard library

// Part 4: Public element definitions
public class ListItem <: Component {
    // CODE
}

// Part 5: Internal element definitions
class Helper {
    // CODE
}
```

> **Note:**
>
> The Cangjie formatter does not enforce blank lines between the copyright section and other sections. If the developer leaves one or more blank lines below the copyright information, the formatter will retain one blank line.

- Use consistent indentation with 4 spaces per level.

[Correct Example]

<!-- compile -->

```cangjie
class ListItem {
    var content: Array<Int64> // Correct: Indented 4 spaces relative to class declaration
    init(
        content: Array<Int64>, // Correct: Function parameters indented 4 spaces relative to function declaration
        isShow!: Bool = true,
        id!: String = ""
    ) {
        this.content = content
    }
}
```

- Use a unified brace style. For non-empty blocks, adopt the K&R style.

[Correct Example]

<!-- compile -->

```cangjie
enum TimeUnit { // Correct: Placed at the end of the declaration line, preceded by 1 space
    Year | Month | Day | Hour
} // Correct: Closing brace on its own line

class A { // Correct: Placed at the end of the declaration line, preceded by 1 space
    var count = 1
}

func fn(a: Int64): Unit { // Correct: Placed at the end of the declaration line, preceded by 1 space
    if (a > 0) { // Correct: Placed at the end of the declaration line, preceded by 1 space
    // CODE
    } else { // Correct: Closing brace and 'else' on the same line
        // CODE
    } // Correct: Closing brace on its own line
}

// Lambda function
let add = {
    base: Int64, bonus: Int64 => // Correct: Non-empty blocks in lambda expressions follow K&R style
    print("Correct news")
    base + bonus
}
```

- Follow rule G.FMT.10 from the Cangjie Language Programming Specifications to use spaces to highlight keywords and important information.

[Correct Example]

<!-- only-format -->

```cangjie
var isPresent: Bool = false  // Correct: One space after the colon in variable declarations
func method(isEmpty!: Bool): RetType { ... } // Correct: One space after colons in function definitions (named parameters / return types)

method(isEmpty: isPresent) // Correct: One space after the colon in named parameter assignments

0..MAX_COUNT : -1 // Correct: No spaces around the range operator, one space before and after the step colon

var hundred = 0
do { // Correct: One space between the 'do' keyword and the following brace
    hundred++
} while (hundred < 100) // Correct: One space between the 'while' keyword and the preceding brace

func fn(paramName1: ArgType, paramName2: ArgType): ReturnType { // Correct: No spaces inside parentheses adjacent to characters
    ...
    for (i in 1..4) { // Correct: No spaces around the range operator
        ...
    }
}

let listOne: Array<Int64> = [1, 2, 3, 4] // Correct: No spaces inside square brackets or parentheses

let salary = base + bonus // Correct: Spaces around binary operators

x++ // Correct: No spaces between unary operators and operands
```

- Minimize unnecessary blank lines to keep the code compact.

[Incorrect Example]

<!-- only-foramt -->

```cangjie
class MyApp <: App {
    let album = albumCreate()
    let page: Router
    // Blank line
    // Blank line
    // Blank line
    init() {           // Incorrect: Multiple consecutive blank lines inside type definitions
        this.page = Router("album", album)
    }

    override func onCreate(): Unit {

        println( "album Init." )  // Incorrect: Blank lines inside braces

    }
}
```

- Minimize unnecessary semicolons, prioritizing code conciseness.

[Before Formatting]

<!-- only-format -->

```cangjie
package demo.analyzer.filter.impl; // Redundant semicolon

internal import demo.analyzer.filter.StmtFilter; // Redundant semicolon
internal import demo.analyzer.CJStatment; // Redundant semicolon

func fn(a: Int64): Unit {
    println( "album Init." );
}
```

[After Formatting]

<!-- only-format -->

```cangjie
package demo.analyzer.filter.impl // Redundant semicolon

internal import demo.analyzer.filter.StmtFilter // Redundant semicolon
internal import demo.analyzer.CJStatment // Redundant semicolon

func fn(a: Int64): Unit {
    println("album Init.");
}
```

- Arrange modifier keywords according to the priority rules specified in Guideline G.FMT.12 of the Cangjie Language Coding Standards.

Below is the recommended modifier ordering priority for top-level elements:

```text
public
open/abstract
```

Below is the recommended modifier ordering priority for instance member functions or instance member properties:

```text
public/protected/private
open
override
```

Below is the recommended modifier ordering priority for static member functions:

```text
public/protected/private
static
redef
```

Below is the recommended modifier ordering priority for member variables:

```text
public/protected/private
static
```

- Formatting behavior for multi-line comments

For comments starting with `*`, the `*` symbols will be aligned with each other. For comments not starting with `*`, the original comment format will be preserved.

<!-- only-cjfmt -->

```cangjie
// Before formatting
/*
      * comment
      */

/*
        comment
        */

// After formatting
/*
 * comment
 */

/*
        comment
 */
```

## Notes

- The Cangjie formatting tool currently does not support formatting of syntactically incorrect code.

- The Cangjie formatting tool currently does not support formatting of metaprogramming constructs.