# `cjc` Compilation Options

This chapter introduces commonly used `cjc` compilation options. If an option is also applicable to `cjc-frontend`, it will be marked with a <sup>[frontend]</sup> superscript; if the behavior differs between `cjc-frontend` and `cjc`, additional explanations will be provided.

- Options starting with two hyphens are long options, such as `--xxxx`.
  If a long option has an optional parameter, the option and parameter must be connected with an equals sign, e.g., `--xxxx=<value>`.
  If a long option has a required parameter, the option and parameter can be separated by either a space or an equals sign, e.g., `--xxxx <value>` is equivalent to `--xxxx=<value>`.

- Options starting with a single hyphen are short options, such as `-x`.
  For short options, if they are followed by a parameter, the option and parameter can be separated by a space or not, e.g., `-x <value>` is equivalent to `-x<value>`.

## Basic Options

### `--output-type=[exe|staticlib|dylib]` <sup>[frontend]</sup>

Specifies the type of output file. In `exe` mode, an executable file is generated; in `staticlib` mode, a static library file (`.a` file) is generated; in `dylib` mode, a dynamic library file is generated (`.so` on Linux, `.dll` on Windows, and `.dylib` on macOS). `cjc` defaults to `exe` mode.

In addition to compiling `.cj` files into executable files, they can also be compiled into static or dynamic link libraries. For example:

```shell
$ cjc tool.cj --output-type=dylib
```

This compiles `tool.cj` into a dynamic link library. On Linux, `cjc` generates a dynamic link library file named `libtool.so`.

**Note:** If a dynamic library file from Cangjie is linked when compiling an executable program, both `--dy-std` and `--dy-libs` options must be specified. For details, refer to the [`--dy-std` option description](#--dy-std).

<sup>[frontend]</sup> In `cjc-frontend`, the compilation process only proceeds to `LLVM IR`, so the output is always a `.bc` file. However, different `--output-type` values still affect the frontend compilation strategy.

### `--package`, `-p` <sup>[frontend]</sup>

Compiles a package. When using this option, a directory must be specified as input, and the source files in the directory must belong to the same package.

For example, given the file `log/printer.cj`:

<!-- compile -p -->
<!-- cfg="-p log --output-type=staticlib" -->

```cangjie
package log

public func printLog(message: String) {
    println("[Log]: ${message}")
}
```

And the file `main.cj`:

<!-- compile -p -->
<!-- cfg="liblog.a" -->

```cangjie
import log.*

main() {
    printLog("Everything is great")
}
```

You can use:

```shell
$ cjc -p log --output-type=staticlib
```

to compile the `log` package. `cjc` will generate a `liblog.a` file in the current directory.

Then, you can use the `liblog.a` file to compile `main.cj` with the following command:

```shell
$ cjc main.cj liblog.a
```

`cjc` will compile `main.cj` and `liblog.a` together into an executable file named `main`.

### `--module-name <value>` <sup>[frontend]</sup>

Specifies the name of the module to be compiled.

For example, given the file `MyModule/src/log/printer.cj`:

```cangjie
package log

public func printLog(message: String) {
    println("[Log]: ${message}")
}
```

And the file `main.cj`:

```cangjie
import MyModule.log.*

main() {
    printLog("Everything is great")
}
```

You can use:

```shell
$ cjc -p MyModule/src/log --module-name MyModule --output-type=staticlib -o MyModule/liblog.a
```

to compile the `log` package and specify its module name as `MyModule`. `cjc` will generate a `MyModule/liblog.a` file in the `MyModule` directory.

Then, you can use the `liblog.a` file to compile `main.cj`, which imports the `log` package, with the following command:

```shell
$ cjc main.cj MyModule/liblog.a
```

`cjc` will compile `main.cj` and `liblog.a` together into an executable file named `main`.

### `--output <value>`, `-o <value>`, `-o<value>` <sup>[frontend]</sup>

Specifies the path of the output file. The compiler's output will be written to the specified file.

For example, the following command specifies the output executable file name as `a.out`:

```shell
cjc main.cj -o a.out
```

### `--library <value>`, `-l <value>`, `-l<value>`

Specifies the library file to link.

The given library file will be directly passed to the linker. This compilation option is typically used in conjunction with `--library-path <value>`.

The filename format should be `lib[arg].[extension]`. When linking library `a`, you can use the option `-l a`. The linker will search for files like `liba.a`, `liba.so` (or `liba.dll` when targeting Windows) in the library search directories and link them as needed.

### `--library-path <value>`, `-L <value>`, `-L<value>`

Specifies the directory where the library files to be linked are located.

When using the `--library <value>` option, this option is generally needed to specify the directory containing the library files.

The path specified by `--library-path <value>` will be added to the linker's library search path. Additionally, paths specified in the `LIBRARY_PATH` environment variable will also be added to the linker's library search path. Paths specified via `--library-path` take precedence over those in `LIBRARY_PATH`.

For example, given a dynamic library file `libcProg.so` compiled from the following C source file:

```c
#include <stdio.h>

void printHello() {
    printf("Hello World\n");
}
```

And the Cangjie file `main.cj`:

```cangjie
foreign func printHello(): Unit

main(): Int64 {
  unsafe {
    printHello()
  }
  return 0
}
```

You can use:

```shell
cjc main.cj -L . -l cProg
```

to compile `main.cj` and specify the `cProg` library to link. `cjc` will output an executable file named `main`.
Running `main` will produce the following output:

```shell
$ LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./main
Hello World
```

**Note:** Since a dynamic library file is used, the library directory must be added to `$LD_LIBRARY_PATH` to ensure `main` can perform dynamic linking at runtime.

### `-g` <sup>[frontend]</sup>

Generates an executable or library file with debugging information.

> **Note:**
>
> `-g` can only be used with `-O0`. Using higher optimization levels may cause debugging features to malfunction.

### `--trimpath <value>` <sup>[frontend]</sup>

Removes the prefix from the source file path information in debugging information.

When compiling Cangjie code, `cjc` saves the absolute path information of source files (`.cj` files) to provide debugging and exception information at runtime.

This option removes the specified path prefix from the source file path information. The output file's source file path information will not include the user-specified prefix.

Multiple `--trimpath` options can be used to specify different path prefixes. For each source file path, the compiler removes the first matching prefix from the path.

### `--coverage` <sup>[frontend]</sup>

Generates an executable program that supports code coverage statistics. The compiler generates a code information file with the suffix `.gcno` for each compilation unit. After executing the program, each compilation unit will produce an execution statistics file with the suffix `.gcda`. Using these two files with the `cjcov` tool can generate a code coverage report for the execution.

> **Note:**
>
> `--coverage` can only be used with `-O0`. If a higher optimization level is used, the compiler will issue a warning and force `-O0`. `--coverage` is used to compile executable programs. If used to generate static or dynamic libraries, linking errors may occur when the library is finally used.

### `--int-overflow=[throwing|wrapping|saturating]` <sup>[frontend]</sup>

Specifies the overflow strategy for fixed-precision integer operations. The default is `throwing`.

- In `throwing` mode, integer overflow throws an exception.
- In `wrapping` mode, integer overflow wraps around to the other end of the fixed-precision integer range.
- In `saturating` mode, integer overflow results in the extreme value of the fixed-precision integer.

### `--diagnostic-format=[default|noColor|json]` <sup>[frontend]</sup>

> **Note:**
>
> The Windows version currently does not support color-rendered error messages.

Specifies the output format of error messages. The default is `default`.

- `default`: Error messages are output in the default format (with color).
- `noColor`: Error messages are output in the default format (without color).
- `json`: Error messages are output in JSON format.

### `--verbose`, `-V` <sup>[frontend]</sup>

`cjc` prints the compiler version information, toolchain dependency details, and the commands executed during compilation.

### `--help`, `-h` <sup>[frontend]</sup>

Prints available compilation options.

When this option is used, the compiler only prints compilation option information and does not compile any input files.

### `--version`, `-v` <sup>[frontend]</sup>

Prints the compiler version information.

When this option is used, the compiler only prints version information and does not compile any input files.

### `--save-temps <value>`

Retains intermediate files generated during compilation and saves them to the specified `<value>` path.

The compiler retains intermediate files like `.bc` and `.o` generated during compilation.

### `--import-path <value>` <sup>[frontend]</sup>

Specifies the search path for the AST files of imported modules.

For example, given the following directory structure, where the `libs/myModule` directory contains the library files of the `myModule` module and the AST export files of the `log` package:

```text
.
├── libs
|   └── myModule
|       ├── myModule.log.cjo
|       └── libmyModule.log.a
└── main.cj
```

And the `main.cj` file with the following code:

```cangjie
import myModule.log.printLog

main() {
    printLog("Everything is great")
}
```

You can use `--import-path ./libs` to add `./libs` to the AST file search path for imported modules. `cjc` will use the `./libs/myModule/myModule.log.cjo` file for semantic checking and compilation of `main.cj`.

`--import-path` provides the same functionality as the `CANGJIE_PATH` environment variable, but paths specified via `--import-path` take precedence.

### `--scan-dependency` <sup>[frontend]</sup>

The `--scan-dependency` directive retrieves direct dependencies and other information of a specified package source or a package's `cjo` file in JSON format.

```cangjie
// this file is placed under directory pkgA
macro package pkgA
import pkgB.*
import std.io.*
import pkgB.subB.*
```

```shell
cjc --scan-dependency --package pkgA
```

or

```shell
cjc --scan-dependency pkgA.cjo
```

```json
{
  "package": "pkgA",
  "isMacro": true,
  "dependencies": [
    {
      "package": "pkgB",
      "isStd": false,
      "imports": [
        {
          "file": "pkgA/pkgA.cj",
          "begin": {
            "line": 2,
            "column": 1
          },
          "end": {
            "line": 2,
            "column": 14
          }
        }
      ]
    },
    {
      "package": "pkgB.subB",
      "isStd": false,
      "imports": [
        {
          "file": "pkgA/pkgA.cj",
          "begin": {
            "line": 4,
            "column": 1
          },
          "end": {
            "line": 4,
            "column": 19
          }
        }
      ]
    },
    {
      "package": "std.io",
      "isStd": true,
      "imports": [
        {
          "file": "pkgA/pkgA.cj",
          "begin": {
            "line": 3,
            "column": 1
          },
          "end": {
            "line": 3,
            "column": 16
          }
        }
      ]
    }
  ]
}
```

### `--no-sub-pkg` <sup>[frontend]</sup>

Indicates that the current compilation package has no sub-packages.

When this option is enabled, the compiler can further reduce the code size.

### `--warn-off`, `-Woff <value>` <sup>[frontend]</sup>

Disables all or specific categories of compilation warnings.

`<value>` can be `all` or a predefined warning group. When the parameter is `all`, the compiler will suppress all warnings generated during compilation; when the parameter is another predefined group, the compiler will suppress warnings belonging to that group.

Each warning message includes a `#note` line indicating its group and how to disable it. Use `--help` to print all available compilation options and view specific group names.

### `--warn-on`, `-Won <value>` <sup>[frontend]</sup>

Enables all or specific categories of compilation warnings.

The `<value>` for `--warn-on` has the same valid range as `--warn-off`. `--warn-on` is typically used in combination with `--warn-off`; for example, `-Woff all -Won <value>` can be used to allow only warnings from the `<value>` group to be printed.

**Important Note:** The order of `--warn-on` and `--warn-off` matters. For the same group, the latter option overrides the former. For example, reversing the order in the above example to `-Won <value> -Woff all` will result in all warnings being suppressed.

### `--error-count-limit <value>` <sup>[frontend]</sup>

Limits the maximum number of errors the compiler will print.

The `<value>` parameter can be `all` or a non-negative integer. When set to `all`, the compiler prints all errors generated during compilation; when set to a non-negative integer `N`, the compiler prints at most `N` errors. The default value for this option is 8.

### `--output-dir <value>` <sup>[frontend]</sup>

Controls the directory where the compiler saves intermediate and final output files.

Controls the directory for saving intermediate files, such as `.cjo` files. If both `--output-dir <path1>` and `--output <path2>` are specified, intermediate files will be saved to `<path1>`, and the final output will be saved to `<path1>/<path2>`.

> **Note:**
>
> When this option is used with `--output`, the `--output` parameter must be a relative path.

### `--static-std`

Statically links the std module of the Cangjie library.

This option only takes effect when compiling dynamic libraries or executables.

When compiling executables (i.e., when `--output-type=exe` is specified), `cjc` defaults to statically linking the std module of the Cangjie library.

### <span id="--dy-std">`--dy-std`

Dynamically links the std module of the Cangjie library.

This option only takes effect when compiling dynamic libraries or executables.

When compiling dynamic libraries (i.e., when `--output-type=dylib` is specified), `cjc` defaults to dynamically linking the std module of the Cangjie library.

**Important Notes:**

1. When `--static-std` and `--dy-std` are used together, only the last specified option takes effect.
2. `--dy-std` cannot be used with `--static-libs`; doing so will result in an error.
3. When compiling an executable that links to a Cangjie dynamic library (i.e., a product compiled with `--output-type=dylib`), you must explicitly specify `--dy-std` to dynamically link the standard library. Otherwise, multiple copies of the standard library may appear in the program, potentially causing runtime issues.

### `--static-libs`

Statically links non-std modules of the Cangjie library.

This option only takes effect when compiling dynamic libraries or executables. By default, `cjc` statically links all non-std and non-runtime modules of the Cangjie library.

### `--dy-libs`

Dynamically links non-std modules of the Cangjie library.

This option only takes effect when compiling dynamic libraries or executables.

**Important Notes:**

1. When `--static-libs` and `--dy-libs` are used together, only the last specified option takes effect.
2. `--static-std` cannot be used with `--dy-libs`; doing so will result in an error.
3. When `--dy-std` is used alone, `--dy-libs` is automatically enabled, and a warning message will be displayed.
4. When `--dy-libs` is used alone, `--dy-std` is automatically enabled, and a warning message will be displayed.

### `--stack-trace-format=[default|simple|all]`

Specifies the format for printing exception call stacks, controlling the display of stack frame information when exceptions are thrown. The default format is `default`.

The stack trace formats are described as follows:

- `default` format: `Function name with generic parameters omitted (filename:line number)`
- `simple` format: `filename:line number`
- `all` format: `Full function name (filename:line number)`

### `--lto=[full|thin]`

Enables and specifies the `LTO` (`Link Time Optimization`) compilation mode.

**Important Notes:**

1. This feature is not supported on `Windows` and `macOS` platforms.
2. When `LTO` is enabled, the following optimization options cannot be used simultaneously: `-Os`, `-Oz`.

`LTO` supports two compilation modes:

- `--lto=full`: `full LTO` merges all compilation modules and performs global optimization. This mode offers the highest optimization potential but requires longer compilation times.
- `--lto=thin`: Compared to `full LTO`, `thin LTO` uses parallel optimization across multiple modules and supports incremental linking by default. It has shorter compilation times than `full LTO` but may yield less optimal results due to reduced global information.

    - Typical optimization effectiveness: `full LTO` **>** `thin LTO` **>** conventional static linking.
    - Typical compilation time: `full LTO` **>** `thin LTO` **>** conventional static linking.

`LTO` usage scenarios:

1. Compiling executables:

    ```shell
    $ cjc test.cj --lto=full
    or
    $ cjc test.cj --lto=thin
    ```

2. Compiling static libraries (`.bc` files) for `LTO` mode and using them in executable compilation:

    ```shell
    # Generate a static library (.bc file)
    $ cjc pkg.cj --lto=full --output-type=staticlib -o libpkg.bc
    # Compile the executable with the .bc file and source file
    $ cjc test.cj libpkg.bc --lto=full
    ```

    > **Note:**
    >
    > In `LTO` mode, the path to the static library (`.bc` file) must be provided to the Cangjie compiler.

3. In `LTO` mode:
    - When statically linking the standard library (`--static-std` & `--static-libs`), the standard library code participates in `LTO` optimization and is statically linked into the executable.
    - When dynamically linking the standard library (`--dy-std` & `--dy-libs`), the dynamic library is used for linking even in `LTO` mode.

    ```shell
    # Static linking: standard library code participates in LTO optimization
    $ cjc test.cj --lto=full --static-std
    # Dynamic linking: standard library code does not participate in LTO optimization
    $ cjc test.cj --lto=full --dy-std
    ```

### `--pgo-instr-gen`

Enables instrumentation compilation, generating an executable with profiling information.

This feature is not supported for macOS and Windows targets.

`PGO` (Profile-Guided Optimization) is a common compilation optimization technique that uses runtime profiling information to improve program performance. `Instrumentation-based PGO` is a `PGO` approach that uses instrumentation information and typically involves three steps:

1. The compiler performs instrumentation compilation, generating an instrumented executable.
2. The instrumented executable is run to generate a profile.
3. The compiler uses the profile to recompile the source code.

```shell
# Generate an instrumented executable `test`
$ cjc test.cj --pgo-instr-gen -o test
# Run the executable `test` to generate a profile `test.profraw`
$ LLVM_PROFILE_FILE="test.profraw" ./test
```

> **Note:**
>
> Using the environment variable `LLVM_PROFILE_FILE="test%c.profraw"` enables continuous mode, allowing profile generation even if the program crashes or is killed by a signal. The `llvm-profdata` tool can be used to analyze such profiles. However, `PGO` currently does not support optimization steps in continuous mode.

### `--pgo-instr-use=<.profdata>`

Uses the specified `.profdata` profile to guide compilation and generate an optimized executable.

This feature is not supported for macOS targets.

> **Note:**
>
> The `--pgo-instr-use` option only supports `.profdata` format profiles. Use the `llvm-profdata` tool to convert `.profraw` files to `.profdata`.

```shell
# Convert `.profraw` to `.profdata`
$ LD_LIBRARY_PATH=$CANGJIE_HOME/third_party/llvm/lib:$LD_LIBRARY_PATH $CANGJIE_HOME/third_party/llvm/bin/llvm-profdata merge test.profraw -o test.profdata
# Use the `test.profdata` profile to generate an optimized executable `testOptimized`
$ cjc test.cj --pgo-instr-use=test.profdata -o testOptimized
```

### `--target <value>` <sup>[frontend]</sup>

Specifies the target platform triple for compilation.

The `<value>` parameter is typically a string in the format: `<arch>(-<vendor>)-<os>(-<env>)`, where:

- `<arch>` represents the target platform's architecture, e.g., `aarch64`, `x86_64`, etc.
- `<vendor>` represents the platform vendor, e.g., `apple`. If the vendor is unspecified or irrelevant, it may be written as `unknown` or omitted.
- `<os>` represents the target platform's operating system, e.g., `Linux`, `Win32`.
- `<env>` represents the target platform's ABI or standard, used to distinguish between different runtime environments for the same OS, e.g., `gnu`, `musl`. If the OS does not require such distinction, this field may be omitted.

Currently, `cjc` supports the following host and target platforms for cross-compilation:

| Host Platform       | Target Platform         |
| ------------------- | ----------------------- |
| x86_64-windows-gnu  | aarch64-linux-ohos      |
| x86_64-windows-gnu  | x86_64-linux-ohos       |
| x86_64-apple-darwin | aarch64-linux-ohos      |
| x86_64-apple-darwin | x86_64-linux-ohos       |
| aarch64-apple-darwin | aarch64-linux-ohos      |

Before using `--target` for cross-compilation, ensure you have the appropriate cross-compilation toolchain for the target platform and a Cangjie SDK version that can compile for the target platform on the host platform.

### `--target-cpu <value>`

> **Note:**
>
> This is an experimental feature. Binaries generated with this option may have potential runtime issues. Use at your own risk. This option must be used with `--experimental`.

Specifies the target CPU type for compilation.

When specifying a CPU type, the compiler attempts to use instruction sets specific to that CPU and applies optimizations tailored for it. Binaries generated for a specific CPU type may lose portability and might not run on other CPUs (even with the same architecture).

The following CPU types are tested and supported:

**x86-64 Architecture:**

- generic

**aarch64 Architecture:**

- generic
- tsv110

`generic` is the default CPU type, producing binaries with generic instructions for the architecture. These binaries can run on any CPU of the same architecture, provided the OS and dynamic dependencies are consistent. The default value for `--target-cpu` is `generic`.

The following CPU types are also supported but untested. Binaries generated for these CPUs may have runtime issues:

**x86-64 Architecture:**

- alderlake
- amdfam10
- athlon
- athlon-4
- athlon-fx
- athlon-mp
- athlon-tbird
- athlon-xp
- athlon64
- athlon64-sse3
- atom
- barcelona
- bdver1
- bdver2
- bdver3
- bdver4
- bonnell
- broadwell
- btver1
- btver2
- c3
- c3-2
- cannonlake
- cascadelake
- cooperlake
- core-avx-i
- core-avx2
- core2
- corei7
- corei7-avx
- geode
- goldmont
- goldmont-plus
- haswell
- i386
- i486
- i586
- i686
- icelake-client
- icelake-server
- ivybridge
- k6
- k6-2
- k6-3
- k8
- k8-sse3
- knl
- knm
- lakemont
- nehalem
- nocona
- opteron
- opteron-sse3
- penryn
- pentium
- pentium-m
- pentium-mmx
- pentium2
- pentium3
- pentium3m
- pentium4
- pentium4m
- pentiumpro
- prescott
- rocketlake
- sandybridge
- sapphirerapids
- silvermont
- skx
- skylake
- skylake-avx512
- slm
- tigerlake
- tremont
- westmere
- winchip-c6
- winchip2
- x86-64
- x86-64-v2
- x86-64-v3
- x86-64-v4
- yonah
- znver1
- znver2
- znver3

**aarch64 Architecture:**

- a64fx
- ampere1
- apple-a10
- apple-a11
- apple-a12
- apple-a13
- apple-a14
- apple-a7
- apple-a8
- apple-a9
- apple-latest
- apple-m1
- apple-s4
- apple-s5
- carmel
- cortex-a34
- cortex-a35
- cortex-a510
- cortex-a53
- cortex-a55
- cortex-a57
- cortex-a65
- cortex-a65ae
- cortex-a710
- cortex-a72
- cortex-a73
- cortex-a75
- cortex-a76
- cortex-a76ae
- cortex-a77
- cortex-a78
- cortex-a78c
- cortex-r82
- cortex-x1
- cortex-x1c
- cortex-x2
- cyclone
- exynos-m3
- exynos-m4
- exynos-m5
- falkor
- kryo
- neoverse-512tvb
- neoverse-e1
- neoverse-n1
- neoverse-n2
- neoverse-v1
- saphira
- thunderx
- thunderx2t99
- thunderx3t110
- thunderxt81
- thunderxt83
- thunderxt88

In addition to the above optional CPU types, the `native` value can be used to specify the current CPU type. The compiler will attempt to identify the host machine's CPU type and use it as the target type for binary generation.

### `--toolchain <value>`, `-B <value>`, `-B<value>`

Specifies the path where binary files are stored in the compilation toolchain.

Binary files include: compilers, linkers, and target files provided by the toolchain's C runtime (e.g., `crt0.o`, `crti.o`, etc.).

After preparing the compilation toolchain, you can store it in a custom path and then pass this path to the compiler using `--toolchain <value>`. This enables the compiler to invoke the binary files in that path for cross-compilation.

### `--sysroot <value>`

Specifies the root directory path of the compilation toolchain.

For cross-compilation toolchains with fixed directory structures, if there's no need to specify paths for binaries and dynamic/static library files outside this directory, you can directly use `--sysroot <value>` to pass the toolchain's root directory path to the compiler. The compiler will analyze the corresponding directory structure based on the target platform and automatically search for required binary files, dynamic libraries, and static library files. When using this option, there's no need to specify the `--toolchain` or `--library-path` parameters.

For example, when cross-compiling for a platform with `triple` as `arch-os-env`, and the cross-compilation toolchain has the following directory structure:

```text
/usr/sdk/arch-os-env
├── bin
|   ├── arch-os-env-gcc (cross-compiler)
|   ├── arch-os-env-ld  (linker)
|   └── ...
├── lib
|   ├── crt1.o          (C runtime object file)
|   ├── crti.o
|   ├── crtn.o
|   ├── libc.so         (dynamic library)
|   ├── libm.so
|   └── ...
└── ...
```

Given a Cangjie source file `hello.cj`, you can use the following command to cross-compile `hello.cj` to the `arch-os-env` platform:

```shell
cjc --target=arch-os-env --toolchain /usr/sdk/arch-os-env/bin --toolchain /usr/sdk/arch-os-env/lib --library-path /usr/sdk/arch-os-env/lib hello.cj -o hello
```

Alternatively, you can use the abbreviated parameters:

```shell
cjc --target=arch-os-env -B/usr/sdk/arch-os-env/bin -B/usr/sdk/arch-os-env/lib -L/usr/sdk/arch-os-env/lib hello.cj -o hello
```

If the toolchain's directory follows conventional structures, you can omit the `--toolchain` and `--library-path` parameters and use the following command instead:

```shell
cjc --target=arch-os-env --sysroot /usr/sdk/arch-os-env hello.cj -o hello
```

### `--strip-all`, `-s`

When compiling executable files or dynamic libraries, specifying this option will remove the symbol table from the output file.

### `--discard-eh-frame`

When compiling executable files or dynamic libraries, specifying this option will remove the eh_frame section and partial information from the eh_frame_hdr section (information related to crt remains unprocessed), reducing the size of the executable or dynamic library but potentially affecting debugging information.

This feature is currently unsupported when compiling for macOS targets.

### `--set-runtime-rpath`

Writes the absolute path of the Cangjie runtime library directory into the binary's RPATH/RUNPATH section. Using this option eliminates the need to set the Cangjie runtime library directory via LD_LIBRARY_PATH (for Linux platforms) or DYLD_LIBRARY_PATH (for macOS platforms) when running the Cangjie program in the build environment.

This feature is unsupported when compiling for Windows targets.

### `--link-options <value>`<sup>1</sup>

Specifies linker options.

`cjc` will transparently pass the parameters of this option to the linker. Available parameters may vary depending on the (system or specified) linker. Multiple linker options can be specified by using `--link-options` multiple times.

<sup>1</sup> Superscript indicates that linker passthrough options may vary depending on the linker. Refer to the linker documentation for specific supported options.

### `--profile-compile-time` <sup>[frontend]</sup>

Prints time consumption data for each compilation phase.

### `--profile-compile-memory` <sup>[frontend]</sup>

Prints memory consumption data for each compilation phase.

## Unit Test Options

### `--test` <sup>[frontend]</sup>

The entry point provided by the `unittest` testing framework, automatically generated by macros. When compiling with the `cjc --test` option, the program entry is not `main` but `test_entry`. For usage of the `unittest` testing framework, refer to the "Cangjie Programming Language Library API" documentation.

For the Cangjie file `a.cj` in the `pkgc` directory:
<!-- run -->

```cangjie
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    @TestCase
    public func case1(): Unit {
        print("case1\n")
    }
}
```

You can compile `a.cj` in the `pkgc` directory using:

```shell
cjc a.cj --test
```

Executing `main` will produce the following output:

> **Note:**
>
> Execution time for test cases is not guaranteed to be consistent across runs.

```text
case1
--------------------------------------------------------------------------------------------------
TP: default, time elapsed: 29710 ns, Result:
    TCS: TestA, time elapsed: 26881 ns, RESULT:
    [ PASSED ] CASE: case1 (16747 ns)
Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
```

For the following directory structure:

```text
application
├── src
├── pkgc
|   ├── a1.cj
|   └── a2.cj
└── a3.cj
```

You can compile all test cases (`a1.cj` and `a2.cj`) in the `pkgc` package using the `-p` compilation option in the `application` directory:

```shell
cjc pkgc --test -p
```

```cangjie
/*a1.cj*/
package a

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    @TestCase
    public func caseA(): Unit {
        print("case1\n")
    }
}
```

```cangjie
/*a2.cj*/
package a

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestB {
    @TestCase
    public func caseB(): Unit {
        throw IndexOutOfBoundsException()
    }
}
```

Executing `main` will produce the following output (**output information is for reference only**):

```text
case1
--------------------------------------------------------------------------------------------------
TP: a, time elapsed: 367800 ns, Result:
    TCS: TestA, time elapsed: 16802 ns, RESULT:
    [ PASSED ] CASE: caseA (14490 ns)
    TCS: TestB, time elapsed: 347754 ns, RESULT:
    [ ERROR  ] CASE: caseB (345453 ns)
    REASON: An exception has occurred:IndexOutOfBoundsException
        at std/core.Exception::init()(std/core/exception.cj:23)
        at std/core.IndexOutOfBoundsException::init()(std/core/index_out_of_bounds_exception.cj:9)
        at a.TestB::caseB()(/home/houle/cjtest/application/pkgc/a2.cj:7)
        at a.lambda.1()(/home/houle/cjtest/application/pkgc/a2.cj:7)
        at std/unittest.TestCases::execute()(std/unittest/test_case.cj:92)
        at std/unittest.UT::run(std/unittest::UTestRunner)(std/unittest/test_runner.cj:194)
        at std/unittest.UTestRunner::doRun()(std/unittest/test_runner.cj:78)
        at std/unittest.UT::run(std/unittest::UTestRunner)(std/unittest/test_runner.cj:200)
        at std/unittest.UTestRunner::doRun()(std/unittest/test_runner.cj:78)
        at std/unittest.UT::run(std/unittest::UTestRunner)(std/unittest/test_runner.cj:200)
        at std/unittest.UTestRunner::doRun()(std/unittest/test_runner.cj:75)
        at std/unittest.entryMain(std/unittest::TestPackage)(std/unittest/entry_main.cj:11)
Summary: TOTAL: 2
    PASSED: 1, SKIPPED: 0, ERROR: 1
    FAILED: 0
--------------------------------------------------------------------------------------------------
```

### `--test-only` <sup>[frontend]</sup>

The `--test-only` option is used to compile only the test portion of a package.

When this option is enabled, the compiler will only compile test files (those ending with `_test.cj`) within the package.

> **Note:**
>
> When using this option, the same package should be compiled separately in regular mode first, then dependencies should be added via the `-L`/`-l` linking options, or by including dependent `.bc` files when using the `LTO` option. Otherwise, the compiler will report errors about missing dependency symbols.

Example:

```cangjie
/*main.cj*/
package my_pkg

func concatM(s1: String, s2: String): String {
    return s1 + s2
}

main() {
    println(concatM("a", "b"))
    0
}
```

```cangjie
/*main_test.cj*/
package my_pkg

@Test
class Tests {
    @TestCase
    public func case1(): Unit {
        @Expect("ac", concatM("a", "c"))
    }
}
```

The compilation commands using the compiler are as follows:

```shell
# Compile the production part of the package first, only `main.cj` file would be compiled here
cjc -p my_pkg --output-type=staticlib -o=output/libmain.a
# Compile the test part of the package, Only `main_test.cj` file would be compiled here
cjc -p my_pkg --test-only -L output -lmain --import-path output
```

### `--mock <on|off|runtime-error>` <sup>[frontend]</sup>

If `on` is passed, the package will enable mock compilation, allowing classes in this package to be mocked in test cases. `off` is an explicit way to disable mocking.

**Notably**, mock support for this package is automatically enabled in test mode (when `--test` is enabled), without needing to explicitly pass the `--mock` option.

`runtime-error` is only available in test mode (when `--test` is enabled). It allows compiling packages with mock code but does not perform any mock-related processing in the compiler (which may introduce overhead and affect test runtime performance). This can be useful for benchmarking test cases with mock code. When using this compilation option, avoid compiling and running tests with mock code, otherwise a runtime exception will be thrown.

## Macro Options

`cjc` supports the following macro options. For more details about macros, refer to the [Macros](../Macro/macro_introduction.md) chapter.

### `--compile-macro` <sup>[frontend]</sup>

Compile macro definition files to generate default macro definition dynamic library files.

### `--debug-macro` <sup>[frontend]</sup>

Generate Cangjie code files after macro expansion. This option can be used to debug macro expansion functionality.

### `--parallel-macro-expansion` <sup>[frontend]</sup>

Enable parallel macro expansion. This option can be used to reduce macro expansion compilation time.

## Conditional Compilation Options

`cjc` supports the following conditional compilation options. For more details about conditional compilation, refer to the ["Conditional Compilation"](../compile_and_build/conditional_compilation.md) chapter.

### `--cfg <value>` <sup>[frontend]</sup>

Specify custom compilation conditions.

## Parallel Compilation Options

`cjc` supports the following parallel compilation options for higher compilation efficiency.

### `--jobs <value>`, `-j <value>` <sup>[frontend]</sup>

Set the maximum allowed parallelism during parallel compilation. Here, `value` must be a reasonable non-negative integer. If `value` exceeds the hardware's maximum parallel capability, the compiler will use the hardware's maximum parallel capability.

If this compilation option is not set, the compiler will automatically calculate the maximum parallelism based on hardware capabilities.

> **Note:**
>
> `--jobs 1` means compiling strictly in serial mode.

### `--aggressive-parallel-compile`, `--apc`, `--aggressive-parallel-compile=<value>`, `--apc=<value>` <sup>[frontend]</sup>

When this option is enabled, the compiler will adopt a more aggressive strategy (which may impact optimizations and reduce program runtime performance) to achieve higher compilation efficiency. Here, `value` is an optional parameter indicating the maximum allowed parallelism for the aggressive parallel compilation portion:

- If `value` is used, it must be a reasonable non-negative integer. If `value` exceeds the hardware's parallel capability, the compiler will automatically calculate the maximum parallelism based on hardware capabilities. It is recommended to set `value` to a non-negative integer smaller than the number of physical CPU cores.
- If `value` is not used, aggressive parallel compilation is enabled by default, and the parallelism for the aggressive portion will match `--jobs`.

Additionally, if the same code is compiled twice with different `value` settings or different switch states for this option, the compiler does not guarantee binary consistency between the two compilation outputs.

Rules for enabling/disabling aggressive parallel compilation:

- In the following scenarios, aggressive parallel compilation will be forcibly disabled by the compiler and cannot be enabled:

    - `--fobf-string`
    - `--fobf-const`
    - `--fobf-layout`
    - `--fobf-cf-flatten`
    - `--fobf-cf-bogus`
    - `--lto`
    - `--coverage`
    - Compiling for Windows targets
    - Compiling for macOS targets

- If `--aggressive-parallel-compile=<value>` or `--apc=<value>` is used, the switch for aggressive parallel compilation is controlled by `value`:

    - `value <= 1`: Disable aggressive parallel compilation.
    - `value > 1`: Enable aggressive parallel compilation, with parallelism determined by `value`.

- If `--aggressive-parallel-compile` or `--apc` is used, aggressive parallel compilation is enabled by default, with parallelism matching `--jobs`.

- If this compilation option is not set, the compiler will enable or disable aggressive parallel compilation by default based on the scenario:

    - `-O0` or `-g`: Aggressive parallel compilation is enabled by default, with parallelism matching `--jobs`. It can be disabled by using `--aggressive-parallel-compile=<value>` or `--apc=<value>` with `value <= 1`.
    - Non-`-O0` and non-`-g`: Aggressive parallel compilation is disabled by default. It can be enabled by using `--aggressive-parallel-compile=<value>` or `--apc=<value>` with `value > 1`.

## Optimization Options

### `--fchir-constant-propagation` <sup>[frontend]</sup>

Enable CHIR constant propagation optimization.

### `--fno-chir-constant-propagation` <sup>[frontend]</sup>

Disable CHIR constant propagation optimization.

### `--fchir-function-inlining` <sup>[frontend]</sup>

Enable CHIR function inlining optimization.

### `--fno-chir-function-inlining` <sup>[frontend]</sup>

Disable CHIR function inlining optimization.

### `--fchir-devirtualization` <sup>[frontend]</sup>

Enable CHIR devirtualization optimization.

### `--fno-chir-devirtualization` <sup>[frontend]</sup>

Disable CHIR devirtualization optimization.

### `--fast-math` <sup>[frontend]</sup>

When this option is enabled, the compiler will make aggressive (and potentially precision-losing) assumptions about floating-point operations to optimize floating-point calculations.

### `-O<N>` <sup>[frontend]</sup>

Use the specified code optimization level.

Higher optimization levels result in more aggressive code optimizations by the compiler to generate more efficient programs, though compilation time may increase.

`cjc` uses O0-level optimization by default. Currently, `cjc` supports the following optimization levels: O0, O1, O2, Os, Oz.

When the optimization level is 2, `cjc` performs corresponding optimizations and also enables the following options:

- `--fchir-constant-propagation`
- `--fchir-function-inlining`
- `--fchir-devirtualization`

When the optimization level is s, `cjc` performs O2-level optimizations and additionally optimizes for code size.

When the optimization level is z, `cjc` performs Os-level optimizations and further reduces code size.

> **Note:**
>
> When the optimization level is s or z, the link-time optimization option `--lto=[full|thin]` cannot be used simultaneously.

### `-O` <sup>[frontend]</sup>

Use O1-level code optimization, equivalent to `-O1`.

## Code Obfuscation Options

`cjc` supports code obfuscation to provide additional security protection. Code obfuscation is disabled by default.

`cjc` supports the following code obfuscation options:

### `--fobf-string`

Enable string obfuscation.

Obfuscates string constants in the code, preventing attackers from statically reading string data directly from the binary.

### `--fno-obf-string`

Disable string obfuscation.

### `--fobf-const`

Enable constant obfuscation.

Obfuscates numeric constants used in the code, replacing numeric operation instructions with equivalent but more complex instruction sequences.

### `--fno-obf-const`

Disable constant obfuscation.

### `--fobf-layout`

Enable layout obfuscation.

Layout obfuscation obfuscates symbols (including function names and global variable names), path names, line numbers, and function layout order in the code. When this compilation option is used, `cjc` generates a symbol mapping output file `*.obf.map` in the current directory. If the `--obf-sym-output-mapping` option is configured, its parameter value will be used as the filename for the symbol mapping output file. The symbol mapping output file contains the mapping relationships between original and obfuscated symbols, which can be used to deobfuscate obfuscated symbols.

> **Note:**
>
> Layout obfuscation conflicts with parallel compilation. Do not enable both simultaneously. If both are enabled, parallel compilation will be disabled.

### `--fno-obf-layout`

Disable layout obfuscation.

### `--obf-sym-prefix <string>`

Specify the prefix string added to symbols during layout obfuscation.

When this option is set, all obfuscated symbols will include this prefix. When obfuscating multiple Cangjie packages, symbol conflicts may occur. This option can be used to assign different prefixes to different packages to avoid conflicts.

### `--obf-sym-output-mapping <file>`

Specify the symbol mapping output file for layout obfuscation.

The symbol mapping output file records original symbol names, obfuscated names, and file paths. It can be used to deobfuscate obfuscated symbols.

### `--obf-sym-input-mapping <file,...>`

Specify the symbol mapping input file for layout obfuscation.

Layout obfuscation will use the mapping relationships in these files to obfuscate symbols. Therefore, when compiling Cangjie packages with dependencies, use the symbol mapping output file of the dependent package as the parameter for `--obf-sym-input-mapping` in the calling package to ensure consistent obfuscation results for the same symbol across packages.

### `--obf-apply-mapping-file <file>`

Provide a custom symbol mapping file for layout obfuscation. The obfuscation will follow the mapping relationships specified in the file.

The file format is as follows:

```text
<original_symbol_name> <new_symbol_name>
```

Here, `original_symbol_name` is the pre-obfuscation name, and `new_symbol_name` is the post-obfuscation name. `original_symbol_name` consists of multiple `field`s. A `field` represents a field name, which can be a module name, package name, class name, struct name, enum name, function name, or variable name. `field`s are separated by the delimiter `'.'`. If a `field` is a function name, the function's parameter types must be enclosed in parentheses `'()'` and appended to the function name. For parameterless functions, the parentheses will be empty. If a `field` has generic parameters, they must also be enclosed in angle brackets `'<>'` and appended to the `field`.

Layout obfuscation will replace `original_symbol_name` in the Cangjie application with `new_symbol_name`. For symbols not in this file, the obfuscation will proceed normally with random names. If the mapping relationships in this file conflict with those in `--obf-sym-input-mapping`, the compiler will throw an exception and halt compilation.

### `--fobf-export-symbols`

Allow layout obfuscation to obfuscate exported symbols. This option is enabled by default when layout obfuscation is enabled.
When this option is enabled, the obfuscation feature will obfuscate exported symbols.

### `--fno-obf-export-symbols`

Disables the obfuscation of exported symbols by the obfuscation feature.

### `--fobf-source-path`

Allows the obfuscation feature to obfuscate path information in symbols. This option is enabled by default when the obfuscation feature is turned on.

When enabled, the obfuscation feature will obfuscate path information in exception stack traces, replacing path names with the string `"SOURCE"`.

### `--fno-obf-source-path`

Disables the obfuscation of path information in stack traces by the obfuscation feature.

### `--fobf-line-number`

Allows the obfuscation feature to obfuscate line number information in stack traces.

When enabled, the obfuscation feature will obfuscate line number information in exception stack traces, replacing line numbers with `0`.

### `--fno-obf-line-number`

Disables the obfuscation of line number information in stack traces by the obfuscation feature.

### `--fobf-cf-flatten`

Enables control flow flattening obfuscation.

Obfuscates existing control flow in the code, making its transfer logic more complex.

### `--fno-obf-cf-flatten`

Disables control flow flattening obfuscation.

### `--fobf-cf-bogus`

Enables bogus control flow obfuscation.

Inserts bogus control flow into the code, making the logic more complex.

### `--fno-obf-cf-bogus`

Disables bogus control flow obfuscation.

### `--fobf-all`

Enables all obfuscation features.

Specifying this option is equivalent to specifying the following options simultaneously:

- `--fobf-string`
- `--fobf-const`
- `--fobf-layout`
- `--fobf-cf-flatten`
- `--fobf-cf-bogus`

### `--obf-config <file>`

Specifies the path to the code obfuscation configuration file.

The configuration file can be used to prevent the obfuscation tool from obfuscating certain functions or symbols.

The format of the configuration file is as follows:

```text
obf_func1 name1
obf_func2 name2
...
```

The first parameter `obf_func` specifies the obfuscation feature:

- `obf-cf-bogus`: Bogus control flow obfuscation
- `obf-cf-flatten`: Control flow flattening obfuscation
- `obf-const`: Constant obfuscation
- `obf-layout`: Layout obfuscation

The second parameter `name` specifies the object to be preserved, composed of multiple `field`s. A `field` represents a field name, which can be a package name, class name, struct name, enum name, function name, or variable name.

`field`s are separated by the delimiter `'.'`. If a `field` is a function name, the function's parameter types must be enclosed in parentheses `'()'` and appended to the function name. For parameterless functions, the parentheses remain empty.

For example, suppose the following code exists in package `packA`:

```cangjie
package packA
class MyClassA {
    func funcA(a: String, b: Int64): String {
        return a
    }
}
```

To prevent the control flow flattening feature from obfuscating `funcA`, the user can write the following rule:

```text
obf-cf-flatten packA.MyClassA.funcA(std.core.String, Int64)
```

Users can also use wildcards to write more flexible rules, allowing a single rule to preserve multiple objects. Currently, the following three types of wildcards are supported:

Obfuscation feature wildcards:

| Obfuscation Feature Wildcard | Description                     |
| :---------------------------- | :------------------------------- |
| `?`                          | Matches a single character in the name     |
| `*`                          | Matches any number of characters in the name |

Field name wildcards:

| Field Name Wildcard | Description                                                         |
| :------------------- | :------------------------------------------------------------------ |
| `?`                 | Matches a single non-delimiter `'.'` character in the field name    |
| `*`                 | Matches any number of characters in the field name, excluding the delimiter `'.'` and parameters |
| `**`                | Matches any number of characters in the field name, including delimiters `'.'` and parameters. `'**'` only takes effect when used as a standalone `field`; otherwise, it is treated as `'*'` |

Function parameter type wildcards:

| Parameter Type Wildcard | Description                   |
| :----------------------- | :---------------------------- |
| `...`                   | Matches any number of parameters     |
| `***`                   | Matches a parameter of any type     |

> **Note:**
>
> Parameter types are also composed of field names, so field name wildcards can be used to match individual parameter types.

Below are examples of wildcard usage:

Example 1:

```text
obf-cf-flatten pro?.myfunc()
```

This rule prevents the `obf-cf-flatten` feature from obfuscating the function `pro?.myfunc()`. `pro?.myfunc()` can match `pro0.myfunc()` but not `pro00.myfunc()`.

Example 2:

```text
* pro0.**
```

This rule prevents any obfuscation feature from obfuscating any function or variable under the package `pro0`.

Example 3:

```text
* pro*.myfunc(...)
```

This rule prevents any obfuscation feature from obfuscating the function `pro*.myfunc(...)`. `pro*.myfunc(...)` can match any `myfunc` function in a single-level package starting with `pro`, with any parameters.

To match multi-level package names, such as `pro0.mypack.myfunc()`, use `pro*.**.myfunc(...)`. Note that `'**'` only takes effect when used as a standalone field name, so `pro**.myfunc(...)` and `pro*.myfunc(...)` are equivalent and cannot match multi-level package names. To match all `myfunc` functions in any package starting with `pro` (including functions named `myfunc` in classes), use `pro*.**.myfunc(...)`.

Example 4:

```text
obf-cf-* pro0.MyClassA.myfunc(**.MyClassB, ***, ...)
```

This rule prevents the `obf-cf-*` feature from obfuscating the function `pro0.MyClassA.myfunc(**.MyClassB, ***, ...)`. Here, `obf-cf-*` matches both `obf-cf-bogus` and `obf-cf-flatten` obfuscation features. `pro0.MyClassA.myfunc(**.MyClassB, ***, ...)` matches the function `pro0.MyClassA.myfunc`, where the first parameter can be of type `MyClassB` from any package, the second parameter can be of any type, and the function can accept zero or more additional parameters of any type.

### `--obf-level <value>`

Specifies the strength level of the obfuscation feature.

The level can be set from 1 to 9. The default level is 5. Higher levels increase the strength of obfuscation but may also increase the output file size and execution overhead.

### `--obf-seed <value>`

Specifies the random seed for the obfuscation algorithm.

By specifying a random seed, the same Cangjie code can produce different obfuscation results across builds. By default, the same Cangjie code will produce identical obfuscation results each time.

## Secure Compilation Options

`cjc` generates position-independent code by default and produces position-independent executables when compiling executable files.

For Release builds, it is recommended to enable/disable compilation options according to the following rules to enhance security.

### Enable `--trimpath <value>` <sup>[frontend]</sup>

Removes the specified absolute path prefix from debugging and exception information. This option prevents build path information from being written into the binary.

After enabling this option, source path information in the binary is usually no longer complete, which may affect debugging. It is recommended to disable this option for debug builds.

### Enable `--strip-all`, `-s`

Removes the symbol table from the binary. This option deletes symbol-related information that is not required at runtime.

After enabling this option, the binary cannot be debugged. Disable this option for debug builds.

### Disable `--set-runtime-rpath`

If the executable will be distributed to different environments or if other users have write permissions to the Cangjie runtime library directory currently in use, enabling this option may pose security risks. Therefore, disable this option.

This option is not applicable when compiling for Windows targets.

### Enable `--link-options "-z noexecstack"`<sup>1</sup>

Makes the thread stack non-executable.

Only available when compiling for Linux targets.

### Enable `--link-options "-z relro"`<sup>1</sup>

Makes the GOT table relocation read-only.

Only available when compiling for Linux targets.

### Enable `--link-options "-z now"`<sup>1</sup>

Enables immediate binding.

Only available when compiling for Linux targets.

## Code Coverage Instrumentation Options

> **Note:**
>
> Windows and macOS versions currently do not support code coverage instrumentation options.

Cangjie supports code coverage instrumentation (SanitizerCoverage, hereafter referred to as SanCov), providing interfaces consistent with LLVM's SanitizerCoverage. The compiler inserts coverage feedback functions at the function or BasicBlock level, allowing users to monitor program execution by implementing the specified callback functions.

Cangjie's SanCov feature operates at the package level, meaning an entire package is either fully instrumented or not instrumented at all.

### `--sanitizer-coverage-level=0/1/2`

Instrumentation level: 0 means no instrumentation; 1 means function-level instrumentation, inserting callback functions only at function entries; 2 means BasicBlock-level instrumentation, inserting callback functions at various BasicBlocks.

If not specified, the default value is 2.

This compilation option only affects the instrumentation level of `--sanitizer-coverage-trace-pc-guard`, `--sanitizer-coverage-inline-8bit-counters`, and `--sanitizer-coverage-inline-bool-flag`.

### `--sanitizer-coverage-trace-pc-guard`

Enabling this option inserts a function call `__sanitizer_cov_trace_pc_guard(uint32_t *guard_variable)` at each Edge, affected by `sanitizer-coverage-level`.

**Note:** This feature differs from the gcc/llvm implementation in that it does not insert `void __sanitizer_cov_trace_pc_guard_init(uint32_t *start, uint32_t *stop)` in the constructor. Instead, it inserts a function call `uint32_t *__cj_sancov_pc_guard_ctor(uint64_t edgeCount)` during package initialization.

The `__cj_sancov_pc_guard_ctor` callback function must be implemented by the developer. Packages with SanCov enabled will call this callback as early as possible. The input parameter is the number of Edges in the Package, and the return value is typically a memory region allocated by calloc.

If `__sanitizer_cov_trace_pc_guard_init` needs to be called, it is recommended to call it within `__cj_sancov_pc_guard_ctor`, using dynamically allocated buffers to compute the function's input parameters and return value.

A standard implementation of `__cj_sancov_pc_guard_ctor` is as follows:

```cpp
uint32_t *__cj_sancov_pc_guard_ctor(uint64_t edgeCount) {
    uint32_t *p = (uint32_t *) calloc(edgeCount, sizeof(uint32_t));
    __sanitizer_cov_trace_pc_guard_init(p, p + edgeCount);
    return p;
}
```

### `--sanitizer-coverage-inline-8bit-counters`

Enabling this option inserts an 8-bit counter at each Edge. Each time the Edge is traversed, the counter increments by 1, affected by `sanitizer-coverage-level`.

**Note:** This feature differs from the gcc/llvm implementation in that it does not insert `void __sanitizer_cov_8bit_counters_init(char *start, char *stop)` in the constructor. Instead, it inserts a function call `uint8_t *__cj_sancov_8bit_counters_ctor(uint64_t edgeCount)` during package initialization.

The `__cj_sancov_pc_guard_ctor` callback function must be implemented by the developer. Packages with SanCov enabled will call this callback as early as possible. The input parameter is the number of Edges in the Package, and the return value is typically a memory region allocated by calloc.

If `__sanitizer_cov_8bit_counters_init` needs to be called, it is recommended to call it within `__cj_sancov_8bit_counters_ctor`, using dynamically allocated buffers to compute the function's input parameters and return value.

A standard implementation of `__cj_sancov_8bit_counters_ctor` is as follows:

```cpp
uint8_t *__cj_sancov_8bit_counters_ctor(uint64_t edgeCount) {
    uint8_t *p = (uint8_t *) calloc(edgeCount, sizeof(uint8_t));
    __sanitizer_cov_8bit_counters_init(p, p + edgeCount);
    return p;
}
```

### `--sanitizer-coverage-inline-bool-flag`

Enabling this option inserts a boolean flag at each Edge. The boolean flag corresponding to a traversed Edge is set to True, affected by `sanitizer-coverage-level`.

**Note:** This feature differs from the gcc/llvm implementation in that it does not insert `void __sanitizer_cov_bool_flag_init(bool *start, bool *stop)` in the constructor. Instead, it inserts a function call `bool *__cj_sancov_bool_flag_ctor(uint64_t edgeCount)` during package initialization.

The `__cj_sancov_bool_flag_ctor` callback function must be implemented by the developer. Packages with SanCov enabled will call this callback as early as possible. The input parameter is the number of Edges in the Package, and the return value is typically a memory region allocated by calloc.

If `__sanitizer_cov_bool_flag_init` needs to be called, it is recommended to call it within `__cj_sancov_bool_flag_ctor`, using dynamically allocated buffers to compute the function's input parameters and return value.

A standard implementation of `__cj_sancov_bool_flag_ctor` is as follows:

```cpp
bool *__cj_sancov_bool_flag_ctor(uint64_t edgeCount) {
    bool *p = (bool *) calloc(edgeCount, sizeof(bool));
    __sanitizer_cov_bool_flag_init(p, p + edgeCount);
    return p;
}
```

### `--sanitizer-coverage-pc-table`

This compilation option provides a mapping between instrumentation points and source code, currently only at the function level. It must be used in conjunction with `--sanitizer-coverage-trace-pc-guard`, `--sanitizer-coverage-inline-8bit-counters`, or `--sanitizer-coverage-inline-bool-flag`. At least one of these options must be enabled, and multiple options can be enabled simultaneously.**It is worth noting** that this feature has inconsistencies with gcc/llvm implementations: it does not insert `void __sanitizer_cov_pcs_init(const uintptr_t *pcs_beg, const uintptr_t *pcs_end);` in the constructor. Instead, it inserts the function call `void __cj_sancov_pcs_init(int8_t *packageName, uint64_t n, int8_t **funcNameTable, int8_t **fileNameTable, uint64_t *lineNumberTable)` during the package initialization phase. The parameters are defined as follows:

- `int8_t *packageName`: A string representing the package name (instrumentation uses C-style int8 arrays as parameters to represent strings, same below).
- `uint64_t n`: A total of n functions are instrumented.
- `int8_t **funcNameTable`: A string array of length n, where the i-th instrumentation point corresponds to the function name funcNameTable\[i\].
- `int8_t **fileNameTable`: A string array of length n, where the i-th instrumentation point corresponds to the file name fileNameTable\[i\].
- `uint64_t *lineNumberTable`: A uint64 array of length n, where the i-th instrumentation point corresponds to the line number lineNumberTable\[i\].

If `__sanitizer_cov_pcs_init` needs to be called, manual conversion from Cangjie pc-table to C-language pc-table is required.

### `--sanitizer-coverage-stack-depth`

When this compilation option is enabled, since Cangjie cannot obtain the value of the SP pointer, it can only insert a call to `__updateSancovStackDepth` at the entry of each function. Implementing this function on the C side will provide access to the SP pointer.

A standard implementation of `updateSancovStackDepth` is as follows:

```cpp
thread_local void* __sancov_lowest_stack;

void __updateSancovStackDepth()
{
    register void* sp = __builtin_frame_address(0);
    if (sp < __sancov_lowest_stack) {
        __sancov_lowest_stack = sp;
    }
}
```

### `--sanitizer-coverage-trace-compares`

When this option is enabled, callback functions are inserted before all compare and match instructions. The specific list is as follows, consistent with the API functionality of the LLVM family. Refer to Tracing data flow.

```cpp
void __sanitizer_cov_trace_cmp1(uint8_t Arg1, uint8_t Arg2);
void __sanitizer_cov_trace_const_cmp1(uint8_t Arg1, uint8_t Arg2);
void __sanitizer_cov_trace_cmp2(uint16_t Arg1, uint16_t Arg2);
void __sanitizer_cov_trace_const_cmp2(uint16_t Arg1, uint16_t Arg2);
void __sanitizer_cov_trace_cmp4(uint32_t Arg1, uint32_t Arg2);
void __sanitizer_cov_trace_const_cmp4(uint32_t Arg1, uint32_t Arg2);
void __sanitizer_cov_trace_cmp8(uint64_t Arg1, uint64_t Arg2);
void __sanitizer_cov_trace_const_cmp8(uint64_t Arg1, uint64_t Arg2);
void __sanitizer_cov_trace_switch(uint64_t Val, uint64_t *Cases);
```

### `--sanitizer-coverage-trace-memcmp`

This compilation option is used to provide prefix comparison feedback for String, Array, and other comparisons. When enabled, callback functions are inserted before comparison functions for String and Array. Specifically, the following APIs for String and Array will insert corresponding stub functions:

- String==: __sanitizer_weak_hook_memcmp
- String.startsWith: __sanitizer_weak_hook_memcmp
- String.endsWith: __sanitizer_weak_hook_memcmp
- String.indexOf: __sanitizer_weak_hook_strstr
- String.replace: __sanitizer_weak_hook_strstr
- String.contains: __sanitizer_weak_hook_strstr
- CString==: __sanitizer_weak_hook_strcmp
- CString.startswith: __sanitizer_weak_hook_memcmp
- CString.endswith: __sanitizer_weak_hook_strncmp
- CString.compare: __sanitizer_weak_hook_strcmp
- CString.equalsLower: __sanitizer_weak_hook_strcasecmp
- Array==: __sanitizer_weak_hook_memcmp
- ArrayList==: __sanitizer_weak_hook_memcmp

## Experimental Feature Options

### `--experimental` <sup>[frontend]</sup>

Enables experimental features, allowing the use of other experimental feature options on the command line.

> **Note:**
>
> Binaries generated using experimental features may have potential runtime issues. Please be aware of the risks when using this option.

## Other Features

### Compiler Error Message Colors

For the Windows version of the Cangjie compiler, error messages will only display colors when running on Windows 10 version 1511 (Build 10586) or later systems. Otherwise, colors will not be displayed.

### Setting build-id

Use `--link-options "--build-id=<arg>"`<sup>1</sup> to pass linker options for setting the build-id.

This feature is not supported when compiling for Windows targets.

### Setting rpath

Use `--link-options "-rpath=<arg>"`<sup>1</sup> to pass linker options for setting the rpath.

This feature is not supported when compiling for Windows targets.

### Incremental Compilation

Enable incremental compilation with `--incremental-compile`<sup>[frontend]</sup>. When enabled, `cjc` will use cache files from previous compilations to speed up the current compilation.

> **Note:**
>
> When this option is specified, incremental compilation caches and logs will be saved to the `.cached` directory under the output file path.

## Environment Variables Used by `cjc`

Here are some environment variables that the Cangjie compiler may use during the code compilation process.

### `TMPDIR` or `TMP`

The Cangjie compiler places temporary files generated during compilation in a temporary directory. By default, Linux and macOS systems use `/tmp`, while Windows systems use `C:\Windows\Temp`. The Cangjie compiler also supports custom temporary file directories. On Linux and macOS, set the `TMPDIR` environment variable to change the directory. On Windows, set the `TMP` environment variable.

For example:
In Linux shell:

```shell
export TMPDIR=/home/xxxx
```

In Windows cmd:

```shell
set TMP=D:\\xxxx
```