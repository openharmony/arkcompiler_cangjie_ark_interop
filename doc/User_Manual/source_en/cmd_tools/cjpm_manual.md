# Package Management Tool

## Overview

`CJPM (Cangjie Package Manager)` is the official package management tool for the Cangjie language, designed for comprehensive management and maintenance of Cangjie project module systems. It covers operations such as module initialization, dependency checking, and updates. It provides a unified compilation entry point, supporting incremental compilation, parallel compilation, and custom compilation commands.

## Usage Instructions

Execute the `cjpm -h` command to view the usage instructions for the package management tool, as shown below.

```text
Cangjie Package Manager

Usage:
  cjpm [subcommand] [option]

Available subcommands:
  init             Init a new cangjie module
  check            Check the dependencies
  update           Update cjpm.lock
  tree             Display the package dependencies in the source code
  build            Compile the current module
  run              Compile and run an executable product
  test             Unittest a local package or module
  bench            Run benchmarks in a local package or module
  clean            Clean up the target directory
  install          Install a cangjie binary
  uninstall        Uninstall a cangjie binary

Available options:
  -h, --help       help for cjpm
  -v, --version    version for cjpm

Use "cjpm [subcommand] --help" for more information about a command.
```

Basic usage commands are as follows:

```shell
cjpm build --help
```

`cjpm` is the name of the main program, `build` is the currently executed available command, and `--help` is the configurable option for the current command (options typically have both long and short forms with the same effect).

Upon successful execution, the following result will be displayed:

```text
Compile a local module and all of its dependencies.

Usage:
  cjpm build [option]

Available options:
  -h, --help                    help for build
  -i, --incremental             enable incremental compilation
  -j, --jobs <N>                the number of jobs to spawn in parallel during the build process
  -V, --verbose                 enable verbose
  -g                            enable compile debug version target
  --cfg                         enable the customized option 'cfg'
  -m, --member <value>          specify a member module of the workspace
  --target <value>              generate code for the given target platform
  --target-dir <value>          specify target directory
  -o, --output <value>          specify product name when compiling an executable file
  --mock                        enable support of mocking classes in tests
  --skip-script                 disable script 'build.cj'.
```

## Command Descriptions

### init

`init` is used to initialize a new Cangjie module or workspace. When initializing a module, it creates a configuration file `cjpm.toml` in the current folder by default and creates a `src` source code folder. If the module's output is of an executable type, a default `main.cj` file will be generated under `src`, which prints `hello world` after compilation. When initializing a workspace, only the `cjpm.toml` file will be created, and existing Cangjie modules under the path will be scanned and added to the `members` field by default. If `cjpm.toml` already exists or `main.cj` is present in the source folder, the corresponding file creation steps will be skipped.

`init` has several configurable options:

- `--name <value>` specifies the `root` package name of the new module. If not specified, it defaults to the name of the parent subfolder.
- `--path <value>` specifies the path for the new module. If not specified, it defaults to the current folder.
- `--type=<executable|static|dynamic>` specifies the output type of the new module. If omitted, it defaults to `executable`.
- `--workspace` creates a workspace configuration file. When this option is specified, all other options above are ignored.

Examples:

```text
Input: cjpm init
Output: cjpm init success
```

```text
Input: cjpm init --name demo --path project
Output: cjpm init success
```

```text
Input: cjpm init --type=static
Output: cjpm init success
```

### check

The `check` command is used to check the dependencies required by the project. Upon successful execution, it will print the valid package compilation order.

`check` has several configurable options:

- `-m, --member <value>` can only be used in a workspace to specify a single module as the entry point for checking.
- `--no-tests` when configured, test-related dependencies will not be printed.
- `--skip-script` when configured, the build script compilation and execution will be skipped.

Examples:

```text
Input: cjpm check
Output:
The valid serial compilation order is:
    b.pkgA -> b
cjpm check success
```

```text
Input: cjpm check
Output:
Error: cyclic dependency
b.B -> c.C
c.C -> d.D
d.D -> b.B
Note: In the above output, b.B represents a subpackage named b.B in the module with b as the root package.
```

```text
Input: cjpm check
Output:
Error: can not find the following dependencies
    pro1.xoo
    pro1.yoo
    pro2.zoo
```

### update

`update` is used to update the contents of `cjpm.toml` to `cjpm.lock`. If `cjpm.lock` does not exist, it will be generated. The `cjpm.lock` file records metadata such as version numbers for `git` dependencies, which are used for the next build.

`update` has the following configurable option:

- `--skip-script` when configured, the build script compilation and execution will be skipped.

```text
Input: cjpm update
Output: cjpm update success
```

### tree

The `tree` command is used to visually display the package dependency relationships in Cangjie source code.

`tree` has several configurable options:

- `-p, --package <value>` specifies a package as the root node to display its sub-dependencies. The required value is the package name.
- `--invert <value>` specifies a package as the root node and inverts the dependency tree to show which packages depend on it. The required value is the package name.
- `--depth <N>` specifies the maximum depth of the dependency tree. The optional value is a non-negative integer. When this option is specified, all packages are used as root nodes by default. The value of N represents the maximum depth of child nodes for each dependency tree.
- `--target <value>` includes dependencies for the specified target platform in the analysis and displays the dependency relationships.
- `--no-tests` excludes dependencies from the `test-dependencies` field.
- `-V, --verbose` adds detailed information for package nodes, including package name, version number, and package path.
- `--skip-script` when configured, the build script compilation and execution will be skipped.

For example, the source code directory structure of module `a` is as follows:

```text
src
├── main.cj
├── aoo
│   └── a.cj
├── boo
│   └── b.cj
├── coo
│   └── c.cj
├── doo
│   └── d.cj
├── eoo
│   └── e.cj
└── cjpm.toml
```

The dependency relationships are: package `a` imports packages `a.aoo` and `a.boo`; subpackage `aoo` imports package `a.coo`; subpackage `boo` imports package `coo`; subpackage `doo` imports package `coo`.

```text
Input: cjpm tree
Output:
|-- a
    └── a.aoo
        └── a.coo
    └── a.boo
        └── a.coo
|-- a.doo
    └── a.coo
|-- a.eoo
cjpm tree success
```

```text
Input: cjpm tree --depth 2 -p a
Output:
|-- a
    └── a.aoo
        └── a.coo
    └── a.boo
        └── a.coo
cjpm tree success
```

```text
Input: cjpm tree --depth 0
Output:
|-- a
|-- a.eoo
|-- a.aoo
|-- a.boo
|-- a.doo
|-- a.coo
cjpm tree success
```

```text
Input: cjpm tree --invert a.coo --verbose
Output:
|-- a.coo 1.2.0 （.../src/coo）
    └── a.aoo 1.1.0 （.../src/aoo）
            └── a 1.0.0 （.../src）
    └── a.boo 1.1.0 （.../src/boo）
            └── a 1.0.0 （.../src）
    └── a.doo 1.3.0 （.../src/doo）
cjpm tree success
```

### build

`build` is used to build the current Cangjie project. Before executing this command, it checks dependencies. If the check passes, it calls `cjc` for compilation.

`build` has several configurable options:

- `-i, --incremental` specifies incremental compilation. By default, full compilation is performed.
- `-j, --jobs <N>` specifies the maximum number of parallel compilation jobs. The final maximum concurrency is the minimum of `N` and `2 times the number of CPU cores`.
- `-V, --verbose` displays compilation logs.
- `-g` generates `debug` version output products.
- `--mock` enables support for mocking classes in tests for builds with this option.
- `--cfg` when specified, custom `cfg` options in `cjpm.toml` can be passed through. For `cjpm.toml` configurations, refer to the [profile.customized-option](#profile.customized-option) section.
- `-m, --member <value>` can only be used in a workspace to specify a single module as the compilation entry point.
- `--target-dir <value>` specifies the output directory for products.
- `-o, --output <value>` specifies the name of the output executable file. The default name is `main` (`main.exe` on Windows).
- `--target <value>` when specified, enables cross-compilation to the target platform. For `cjpm.toml` configurations, refer to the [target](#target) section.
- `--skip-script` when configured, the build script compilation and execution will be skipped.

> **Note:**
>
> - The `-i, --incremental` option only enables package-level incremental compilation in `cjpm`. Developers can manually pass the `--incremental-compile` compilation option in the `compile-option` field of the configuration file to enable function-level incremental compilation provided by the `cjc` compiler.
> - The `-i, --incremental` option currently only supports incremental analysis based on source code. If imported library contents change, developers need to rebuild using full compilation.

By default, intermediate files generated during compilation are stored in the `target` folder, while executable files are stored in `target/release/bin` or `target/debug/bin` folders depending on the compilation mode. For running executable files, refer to `run`.
To ensure reproducible builds, this command creates a `cjpm.lock` file containing the exact versions of all transitive dependencies used in the build. To update this file, use the `update` command. If reproducible builds are required for all project participants, this file should be committed to version control.

Examples:

```text
Input: cjpm build -V
Output:
compile package module1.package1: cjc --import-path "target/release" --output-dir "target/release/module1" -p "src/package1" --output-type=staticlib -o libmodule1.package1.a
compile package module1: cjc --import-path "target/release" --output-dir "target/release/bin" -p "src" --output-type=exe -o main
cjpm build success
```

```text
Input: cjpm build
Output: cjpm build success
```

> **Note:**
>
> According to Cangjie package management specifications, only valid source code packages that meet the requirements can be correctly included in the compilation scope. If warnings like `no '.cj' file` appear during compilation, it is likely because the corresponding package does not comply with the specifications, causing the source files to be excluded. In such cases, refer to the [Cangjie Package Management Specifications](#cangjie-package-management-specifications) to modify the code directory structure.

### run

`run` is used to execute the binary output of the current project. The `run` command defaults to executing the `build` command process to generate the final binary file for execution.

`run` has several configurable options:

- `--name <value>` specifies the name of the binary to run. If not specified, it defaults to `main`. In a workspace, binary outputs are stored in `target/release/bin` by default.
- `--build-args <value>` controls the parameters for the `build` compilation process.
- `--skip-build` skips the compilation process and directly runs the binary.
- `--run-args <value>` passes arguments to the binary being executed.
- `--target-dir <value>` specifies the output directory for the executable.
- `-g` runs the `debug` version of the binary.
- `-V, --verbose` displays execution logs.
- `--skip-script` when configured, the build script compilation and execution will be skipped.

Examples:

```text
Input: cjpm run
Output: cjpm run success
```

```text
Input: cjpm run -g // This will default to executing cjpm build -i -g
Output: cjpm run success
```

```text
Input: cjpm run --build-args="-s -j16" --run-args="a b c"
Output: cjpm run success
```

### test

`test` is used to compile and run unit test cases for Cangjie files, printing the test results upon completion. The compiled outputs are stored in `target/release/unittest_bin` by default. For details on writing unit test code, refer to the `std.unittest` library documentation in the *Cangjie Programming Language Standard Library API*.

This command can specify single package paths for testing (multiple packages can be specified, e.g., `cjpm test path1 path2`). If no path is specified, module-level unit tests are executed by default. When executing module-level unit tests, only the current module's tests are run by default; tests in directly or indirectly dependent modules are not executed. The `test` command requires the current project to compile successfully with `build`.

The unit test code structure for a module is as follows, where `xxx.cj` contains the package source code and `xxx_test.cj` contains the unit test code:

```text
└── src
│    ├── koo
│    │    ├── koo.cj
│    │    └── koo_test.cj
│    ├── zoo
│    │    ├── zoo.cj
│    │    └── zoo_test.cj
│    ├── main.cj
│    └── main_test.cj
└── cjpm.toml
```

1. Single-module test scenario:

    ```text
    Input: cjpm test
    Progress report:
    group test.koo                                    100% [||||||||||||||||||||||||||||] ✓    (00:00:01)
    group test.zoo                                      0% [----------------------------]      (00:00:00)
    test TestZ.sayhi                                                                           (00:00:00)

    passed: 1, failed: 0                                  33% [|||||||||-------------------]  1/3 (00:00:01)

    Output:
    --------------------------------------------------------------------------------------------------
    TP: test, time elapsed: 177921 ns, RESULT:
        TCS: TestM, time elapsed: 177921 ns, RESULT:
        [ PASSED ] CASE: sayhi (177921 ns)
        Summary: TOTAL: 1
        PASSED: 1, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    TP: test.koo, time elapsed: 134904 ns, RESULT:
        TCS: TestK, time elapsed: 134904 ns, RESULT:
        [ PASSED ] CASE: sayhi (134904 ns)
        Summary: TOTAL: 1
        PASSED: 1, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    TP: test.zoo, time elapsed: 132013 ns, RESULT:
        TCS: TestZ, time elapsed: 132013 ns, RESULT:
        [ PASSED ] CASE: sayhi (132013 ns)
        Summary: TOTAL: 1
        PASSED: 1, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    Project tests finished, time elapsed: 444838 ns, RESULT:
    TP: test.*, time elapsed: 312825 ns, RESULT:
        PASSED:
        TP: test.zoo, time elapsed: 132013 ns
        TP: test.koo, time elapsed: 312825 ns
        TP: test, time elapsed: 312825 ns
    Summary: TOTAL: 3
        PASSED: 3, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    cjpm test success
    ```

2. Single-package test scenario:

    ```text
    Input: cjpm test src/koo
    Output:
    --------------------------------------------------------------------------------------------------
    TP: test.koo, time elapsed: 160133 ns, RESULT:
        TCS: TestK, time elapsed: 160133 ns, RESULT:
        [ PASSED ] CASE: sayhi (160133 ns)
        Summary: TOTAL: 1
        PASSED: 1, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    Project tests finished## Module Configuration File Description

The module configuration file `cjpm.toml` is used to configure basic information, dependencies, compilation options, etc. `cjpm` primarily parses and executes based on this file. The module name can be renamed in `cjpm.toml`, but the package name cannot be renamed in `cjpm.toml`.

The configuration file code is as follows:

```text
[package] # Single-module configuration field, cannot coexist with the workspace field
  cjc-version = "1.0.0" # Minimum required version of `cjc`, mandatory
  name = "demo" # Module name and module root package name, mandatory
  description = "nothing here" # Description, optional
  version = "1.0.0" # Module version information, mandatory
  compile-option = "" # Additional compilation command options, optional
  override-compile-option = "" # Additional global compilation command options, optional
  link-option = "" # Linker passthrough options, can pass security compilation commands, optional
  output-type = "executable" # Compilation output type, mandatory
  src-dir = "" # Specifies the source code directory path, optional
  target-dir = "" # Specifies the output directory path, optional
  package-configuration = {} # Single-package configuration options, optional

[workspace] # Workspace management field, cannot coexist with the package field
  members = [] # List of workspace member modules, mandatory
  build-members = [] # List of workspace compilation modules, must be a subset of member modules, optional
  test-members = [] # List of workspace test modules, must be a subset of build modules, optional
  compile-option = "" # Additional compilation command options applied to all workspace member modules, optional
  override-compile-option = "" # Additional global compilation command options applied to all workspace member modules, optional
  link-option = "" # Linker passthrough options applied to all workspace member modules, optional
  target-dir = "" # Specifies the output directory path, optional

[dependencies] # Source code dependency configuration, optional
  coo = { git = "xxx", branch = "dev" } # Import `git` dependency
  doo = { path = "./pro1" } # Import source code dependency

[test-dependencies] # Test-phase dependency configuration, same format as dependencies, optional

[script-dependencies] # Build script dependency configuration, same format as dependencies, optional

[replace] # Dependency replacement configuration, same format as dependencies, optional

[ffi.c] # Import C language library dependencies, optional
  clib1.path = "xxx"

[profile] # Command profile configuration, optional
  build = {} # Build command configuration
  test = {} # Test command configuration
  bench = {} # Bench command configuration
  customized-option = {} # Custom passthrough options

[target.x86_64-unknown-linux-gnu] # Backend and platform isolation configuration, optional
  compile-option = "value1" # Additional compilation command options, applicable to specific target compilation processes and cross-compilation target platforms, optional
  override-compile-option = "value2" # Additional global compilation command options, applicable to specific target compilation processes and cross-compilation target platforms, optional
  link-option = "value3" # Linker passthrough options, applicable to specific target compilation processes and cross-compilation target platforms, optional

[target.x86_64-w64-mingw32.dependencies] # Source code dependency configuration for the corresponding target, optional

[target.x86_64-w64-mingw32.test-dependencies] # Test-phase dependency configuration for the corresponding target, optional

[target.x86_64-unknown-linux-gnu.bin-dependencies] # Cangjie binary library dependencies, applicable to specific target compilation processes and cross-compilation target platforms, optional
  path-option = ["./test/pro0", "./test/pro1"] # Configure binary library dependencies in directory form
[target.x86_64-unknown-linux-gnu.bin-dependencies.package-option] # Configure binary library dependencies in single-file form
  "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
  "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
  "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"
```

When the above fields are not used in `cjpm.toml`, they default to empty (for paths, the default is the directory where the configuration file is located).

### "cjc-version"

The minimum required version of the Cangjie compiler, which must be compatible with the current environment version to execute. A valid Cangjie version number consists of three segments of numbers separated by `.`, each being a natural number without redundant prefix `0`. For example:

- `1.0.0` is a valid version number;
- `1.00.0` is not a valid version number because `00` contains a redundant prefix `0`;
- `1.2e.0` is not a valid version number because `2e` is not a natural number.

### "name"

The current Cangjie module name, which is also the module `root` package name.

A valid Cangjie module name must be a valid identifier. Identifiers can consist of letters, numbers, and underscores, and must start with a letter, e.g., `cjDemo` or `cj_demo_1`.

> **Note:**
>
> Currently, Cangjie module names do not support Unicode characters. A Cangjie module name must be a valid identifier containing only ASCII characters.

### "description"

Description of the current Cangjie module, for informational purposes only, with no format restrictions.

### "version"

The version number of the current Cangjie module, managed by the module owner, primarily used for module validation. The format of the module version number is the same as `cjc-version`.

### "compile-option"

Additional compilation options passed to `cjc`. During multi-module compilation, the `compile-option` set for each module applies to all packages within that module.

For example:

```text
compile-option = "-O1 -V"
```

The commands entered here will be inserted into the compilation command during `build` execution, with multiple commands separated by spaces. Refer to the [Compilation Options](../Appendix/compile_options_OHOS.md) chapter in the *Cangjie Programming Language Development Guide* for available commands.

### "override-compile-option"

Additional global compilation options passed to `cjc`. During multi-module compilation, the `override-compile-option` set for the entry module applies to all packages within that module and its dependent modules.

For example:

```text
override-compile-option = "-O1 -V"
```

The commands entered here will be inserted into the compilation command during `build` execution and concatenated after the module's `compile-option` content, with higher priority than `compile-option`. Refer to the [Compilation Options](../Appendix/compile_options_OHOS.md) chapter in the *Cangjie Programming Language Development Guide* for available commands.

> **Note:**
>
> - `override-compile-option` applies to packages within dependent modules. Developers must ensure that the configured `cjc` compilation options do not conflict with the `compile-option` in dependent modules. Otherwise, errors will occur during `cjc` execution. For non-conflicting compilation options of the same type, options in `override-compile-option` have higher priority than those in `compile-option`.
> - In workspace compilation scenarios, only the `override-compile-option` configured in `workspace` will apply to all packages in all modules within the workspace. Even if `-m` is used to specify a single module as the entry module, the entry module's `override-compile-option` will not be used.

### "link-option"

Compilation options passed to the linker, which can be used to pass security compilation commands, as shown below:

```text
link-option = "-z noexecstack -z relro -z now --strip-all"
```

> **Note:**
>
> Commands configured in `link-option` will only be automatically passed to packages corresponding to dynamic libraries and executable outputs during compilation.

### "output-type"

The type of compilation output, including executable programs and libraries. The related inputs are shown in the table below. To automatically fill this field as `static` when generating `cjpm.toml`, use the command `cjpm init --type=static --name=modName`. If no type is specified, it defaults to `executable`. Only the main module can have this field set to `executable`.

| Input | Description |
| :----------: | :------------------: |
| "executable" | Executable program |
| "static" | Static library |
| "dynamic" | Dynamic library |
| Others | Error |

### "src-dir"

This field can specify the source code directory path. If not specified, it defaults to the `src` directory.

### "target-dir"

This field can specify the compilation output directory path. If not specified, it defaults to the `target` directory. If this field is not empty, executing `cjpm clean` will delete the directory specified by this field. Developers must ensure the safety of cleaning this directory.

> **Note:**
>
> If `--target-dir` is specified during compilation, this option will have higher priority.

```text
target-dir = "temp"
```

### "package-configuration"

Single-package configuration options for each module. This option is a `map` structure, with the package name to be configured as the `key` and the single-package configuration information as the `value`. Currently configurable information includes output type and conditional options (`output-type`, `compile-option`), which can be configured as needed. For example, the output type of the `demo.aoo` package in the `demo` module will be specified as a dynamic library type, and the `-g` command will be passed to the `demo.aoo` package during compilation.

```text
[package.package-configuration."demo.aoo"]
  output-type = "dynamic"
  compile-option = "-g"
```

If mutually compatible compilation options are configured in different fields, the priority of the generated commands is as follows:

```text
[package]
  compile-option = "-O1"
[package.package-configuration.demo]
  compile-option = "-O2"

# The profile field will be introduced later
[profile.customized-option]
  cfg1 = "-O0"

Input: cjpm build --cfg1 -V
Output: cjc --import-path build -O0 -O1 -O2 ...
```

By configuring this field, multiple binary outputs can be generated simultaneously (when generating multiple binary outputs, the `-o, --output <value>` option will be invalid). Example:

Example of source code structure, with the module name `demo`:

```text
src
├── aoo
│    └── aoo.cj
├── boo
│    └── boo.cj
├── coo
│    └── coo.cj
└── main.cj
```

Example of configuration:

```text
[package.package-configuration."demo.aoo"]
  output-type = "executable"
[package.package-configuration."demo.boo"]
  output-type = "executable"
```

Example of multiple binary outputs:

```text
Input: cjpm build
Output: cjpm build success

Input: tree target/release/bin
Output: target/release/bin
|-- demo.aoo
|-- demo.boo
`-- demo
```

### "workspace"

This field manages multiple modules as a workspace and supports the following configuration items:

- `members = ["aoo", "path/to/boo"]`: Lists local source code modules included in this workspace, supporting absolute and relative paths. Members of this field must be modules, not another workspace.
- `build-members = []`: Modules to be compiled this time. If not specified, all modules in the workspace are compiled by default. Members of this field must be included in the `members` field.
- `test-members = []`: Modules to be tested this time. If not specified, all modules in the workspace are unit-tested by default. Members of this field must be included in the `build-members` field.
- `compile-option = ""`: Common compilation options for the workspace, optional.
- `override-compile-option = ""`: Common global compilation options for the workspace, optional.
- `link-option = ""`: Common linker options for the workspace, optional.
- `target-dir = ""`: Output directory path for the workspace, optional, defaults to `target`.

Common configuration items in the workspace apply to all member modules. For example, if `[dependencies] xoo = { path = "path_xoo" }` is configured as a source code dependency, all member modules can directly use the `xoo` module without configuring it in each submodule's `cjpm.toml`.

> **Note:**
>
> The `package` field is used to configure general module information and cannot coexist with the `workspace` field in the same `cjpm.toml`. All other fields except `package` can be used in the workspace.

Example of workspace directory structure:

```text
root_path
├── aoo
│    ├── src
│    └── cjpm.toml
├── boo
│    ├── src
│    └── cjpm.toml
├── coo
│    ├── src
│    └── cjpm.toml
└── cjpm.toml
```

Example of workspace configuration file usage:

```text
[workspace]
members = ["aoo", "boo", "coo"]
build-members = ["aoo", "boo"]
test-members = ["aoo"]
compile-option = "-Woff all"
override-compile-option = "-O2"

[dependencies]
xoo = { path = "path_xoo" }

[ffi.c]
abc = { path = "libs" }
```

### "dependencies"

This field imports dependencies on other Cangjie modules via source code, configuring information about other modules required for the current build. Currently, this field supports local path dependencies and remote `git` dependencies.

To specify a local dependency, use the `path` field, which must contain a valid local path. For example, the code structure of the two submodules `pro0` and `pro1` and the main module is as follows:

```text
├── pro0
│    ├── cjpm.toml
│    └── src
│         └── zoo
│              └── zoo.cj
├── pro1
│    ├── cjpm.toml
│    └── src
│         ├── xoo
│         │    └── xoo.cj
│         └── yoo
│              └── yoo.cj
├── cjpm.toml
└── src
     ├── aoo
     │    └── aoo.cj
     ├── boo
     │    └── boo.cj
     └── main.cj
```

After configuring the main module's `cjpm.toml` as follows, the `pro0` and `pro1` modules can be used in the source code:

```text
[dependencies]
  pro0 = { path = "./pro0" }
  pro1 = { path = "./pro1" }
```

To specify a remote `git` dependency, use the `git` field, which must contain a valid `url` in any format supported by `git`. To configure a `git` dependency, at most one `branch`, `tag`, or `commitId` field can be used to select a specific branch, tag, or commit hash, respectively. If multiple such fields are configured, only the highest-priority configuration will take effect, with the priority order being `commitId` > `branch` > `tag`. For example, after configuring as follows, the `pro0` and `pro1` modules from the specified `git` repository can be used in the source code:

```text
[dependencies]
  pro0 = { git = "git://github.com/org/pro0.git", tag = "v1.0.0"}
  pro1 = { git = "https://gitee.com/anotherorg/pro1", branch = "dev"}
```

In this case, `cjpm` will download the latest version of the corresponding repository and save the current `commit-hash` in the `cjpm.lock` file. All subsequent `cjpm` calls will use the saved version until `cjpm update` is used.

Authentication is usually required to access `git` repositories. `cjpm` does not require credentials, so existing `git` authentication support should be used. If the protocol for `git` is `https`, an existing git credential helper should be used. On `Windows`, the credential helper can be installed with `git` and is used by default. On `Linux/macOS`, refer to the `git-config` configuration instructions in the official `git` documentation for details on setting up credential helpers. If the protocol is `ssh` or `git`, key-based authentication should be used. If the key is protected by a passphrase, ensure that `ssh-agent` is running and the key is added via `ssh-add` before using `cjpm`.

The `dependencies` field can specify the compilation output type via the `output-type` attribute. The specified type can differ from the compilation output type of the source code dependency itself and can only be `static` or `dynamic`, as shown below:

```text
[dependencies]
  pro0 = { path = "./pro0", output-type = "static" }
  pro1 = { git = "https://gitee.com/anotherorg/pro1", output-type = "dynamic" }
```

After configuring as above, the `output-type` configuration in `pro0` and `pro1`'s `cjpm.toml` will be ignored, and these modules' outputs will be compiled as `static` and `dynamic` types, respectively.

### "test-dependencies"

Has the same format as the `dependencies` field. It is used to specify dependencies used only during testing, not those required for building the main project. Module developers should use this field for dependencies that downstream users of this module do not need to be aware of.

Dependencies in `test-dependencies` can only be used in test files named `xxx_test.cj` and will not be compiled during compilation. The configuration format of `test-dependencies` in `cjpm.toml` is the same as `dependencies`.

### "script-dependencies"

Has the same format as the `dependencies` field. It is used to specify dependencies used only in build scripts, not those required for### "target"

Multi-backend, multi-platform isolation options used to configure a series of different settings for different backends and platforms. Taking the `Linux` system as an example, the `target` configuration is as follows:

```text
[target.x86_64-unknown-linux-gnu] # Configuration items for Linux systems
  compile-option = "value1" # Additional compilation command options
  override-compile-option = "value2" # Additional global compilation command options
  link-option = "value3" # Linker passthrough options
  [target.x86_64-unknown-linux-gnu.dependencies] # Source code dependency configuration
  [target.x86_64-unknown-linux-gnu.test-dependencies] # Test phase dependency configuration
  [target.x86_64-unknown-linux-gnu.bin-dependencies] # Cangjie binary library dependencies
    path-option = ["./test/pro0", "./test/pro1"]
  [target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
    "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
    "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
    "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"

[target.x86_64-unknown-linux-gnu.debug] # Debug configuration for Linux systems
  [target.x86_64-unknown-linux-gnu.debug.test-dependencies]

[target.x86_64-unknown-linux-gnu.release] # Release configuration for Linux systems
  [target.x86_64-unknown-linux-gnu.release.bin-dependencies]
```

Developers can add a series of configurations for a specific `target` by configuring the `target.target-name` field. The name of the `target` can be obtained in the corresponding Cangjie environment using the command `cjc -v`. The `Target` item in the command output is the name of the `target` for that environment. The above example applies to the `Linux` system, but other platforms are also supported. The `target` name can similarly be obtained using the command `cjc -v`.

Dedicated configuration items for a specific `target` will apply to the compilation process under that `target` and also to cross-compilation processes where other `targets` specify this `target` as the target platform. The list of configuration items is as follows:

- `compile-option`: Additional compilation command options
- `override-compile-option`: Additional global compilation command options
- `link-option`: Linker passthrough options
- `dependencies`: Source code dependency configuration, with the same structure as the `dependencies` field
- `test-dependencies`: Test phase dependency configuration, with the same structure as the `test-dependencies` field
- `bin-dependencies`: Cangjie binary library dependencies, described in detail below
- `compile-macros-for-target`: Macro package control items for cross-compilation. This option does not support distinguishing between `debug` and `release` compilation modes.

Developers can configure the `target.target-name.debug` and `target.target-name.release` fields to add specific configurations for the `debug` and `release` compilation modes under that `target`. The configurable items are the same as above. Configurations under these fields will only apply to the corresponding compilation mode of the `target`.

#### "target.target-name[.debug/release].bin-dependencies"

This field is used to import pre-compiled Cangjie library files suitable for the specified `target`. The following example demonstrates importing three packages from the `pro0` and `pro1` modules.

> **Note:**
>
> Unless there is a special requirement, it is not recommended to use this field. Instead, use the `dependencies` field described earlier to import module source code.

```text
├── test
│    ├── pro0
│    │    ├── libpro0.xoo.so
│    │    ├── pro0.xoo.cjo
│    │    ├── libpro0.yoo.so
│    │    └── pro0.yoo.cjo
│    └── pro1
│         ├── libpro1.zoo.so
│         └── pro1.zoo.cjo
├── src
│    └── main.cj
└── cjpm.toml
```

Method 1: Import via `path-option`:

```text
[target.x86_64-unknown-linux-gnu.bin-dependencies]
  path-option = ["./test/pro0", "./test/pro1"]
```

The `path-option` is a string array structure, where each element represents the name of the path to be imported. `cjpm` will automatically import all Cangjie library packages under this path that comply with the rules. Compliance here refers to the format of the library name being `full package name`. For example, in the above example, `pro0.xoo.cjo` corresponds to the library name `libpro0.xoo.so` or `libpro0.xoo.a`. Packages whose library names do not meet this rule can only be imported via the `package-option`.

Method 2: Import via `package-option`:

```text
[target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
  "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
  "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
  "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"
```

The `package-option` is a `map` structure, where `pro0.xoo` is the `key` (in TOML configuration files, strings containing `.` must be enclosed in `""`). The `key` value is `libpro0.xoo.so`. The path to the frontend file `cjo` is the `value`, and the corresponding `.a` or `.so` file for this `cjo` must be placed in the same path.

> **Note:**
>
> If the same package is imported via both `package-option` and `path-option`, the `package-option` field takes precedence.

The following example shows how the source code `main.cj` calls the `pro0.xoo`, `pro0.yoo`, and `pro1.zoo` packages:

<!-- only-cjpm -->

```cangjie
import pro0.xoo.*
import pro0.yoo.*
import pro1.zoo.*

main(): Int64 {
    var res = x + y + z // x, y, z are values defined in pro0.xoo, pro0.yoo, and pro1.zoo, respectively
    println(res)
    return 0
}
```

> **Note:**
>
> The dependent Cangjie dynamic library files may be compilation products of the `root` package generated by other modules through the `profile.build.combined` configuration, containing symbols for all its sub-packages. Therefore, during dependency checking, if a package's corresponding Cangjie library is not found, the `root` package corresponding to that package will be used as a dependency, and a warning will be printed. Developers must ensure that the `root` package imported in this way is generated via the corresponding method. Otherwise, the library file may not contain the symbols of the sub-packages, leading to compilation errors.
> For example, if the source code imports the `demo.aoo` package via `import demo.aoo`, and the binary dependency does not find the corresponding Cangjie library for this package, `cjpm` will attempt to find the dynamic library of the `root` package corresponding to this package, i.e., `libdemo.so`. If found, it will use this library as the dependency.

#### "target.target-name.compile-macros-for-target"

This field is used to configure the cross-compilation method for macro packages. There are three scenarios:

Method 1: By default, macro packages only compile products for the local platform during cross-compilation, not for the target platform. This applies to all macro packages in the module.

```text
[target.target-platform]
  compile-macros-for-target = ""
```

Method 2: During cross-compilation, compile products for both the local and target platforms. This applies to all macro packages in the module.

```text
[target.target-platform]
  compile-macros-for-target = "all" # The configuration item is a string, and the optional value must be "all"
```

Method 3: Specify that certain macro packages in the module should compile products for both the local and target platforms during cross-compilation. Other unspecified macro packages will follow Method 1 by default.

```text
[target.target-platform]
  compile-macros-for-target = ["pkg1", "pkg2"] # The configuration item is a string array, and the optional values are macro package names.
```

#### "target" Field Merging Rules

The content in the `target` configuration may coexist with other options in `cjpm.toml`. For example, the `compile-option` field can also exist in the `package` field, with the difference that the `package` field applies to all `targets`. `cjpm` merges all applicable configurations for these duplicate fields in a specific way. Taking the `debug` compilation mode of `x86_64-unknown-linux-gnu` as an example, the `target` configuration is as follows:

```text
[package]
  compile-option = "compile-0"
  override-compile-option = "override-compile-0"
  link-option = "link-0"

[dependencies]
  dep0 = { path = "./dep0" }

[test-dependencies]
  devDep0 = { path = "./devDep0" }

[target.x86_64-unknown-linux-gnu]
  compile-option = "compile-1"
  override-compile-option = "override-compile-1"
  link-option = "link-1"
  [target.x86_64-unknown-linux-gnu.dependencies]
    dep1 = { path = "./dep1" }
  [target.x86_64-unknown-linux-gnu.test-dependencies]
    devDep1 = { path = "./devDep1" }
  [target.x86_64-unknown-linux-gnu.bin-dependencies]
    path-option = ["./test/pro1"]
  [target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
    "pro1.xoo" = "./test/pro1/pro1.xoo.cjo"

[target.x86_64-unknown-linux-gnu.debug]
  compile-option = "compile-2"
  override-compile-option = "override-compile-2"
  link-option = "link-2"
  [target.x86_64-unknown-linux-gnu.debug.dependencies]
    dep2 = { path = "./dep2" }
  [target.x86_64-unknown-linux-gnu.debug.test-dependencies]
    devDep2 = { path = "./devDep2" }
  [target.x86_64-unknown-linux-gnu.debug.bin-dependencies]
    path-option = ["./test/pro2"]
  [target.x86_64-unknown-linux-gnu.debug.bin-dependencies.package-option]
    "pro2.xoo" = "./test/pro2/pro2.xoo.cjo"
```

When `target` configuration items coexist with public configuration items in `cjpm.toml` or other levels of configuration items under the same `target`, they are merged according to the following priorities:

1. Configuration for the corresponding `target` in `debug/release` mode
2. Configuration for the corresponding `target` regardless of `debug/release` mode
3. Public configuration items

Taking the above `target` configuration as an example, the `target` configuration items are merged according to the following rules:

- `compile-option`: Concatenate all applicable configuration items of the same name according to priority, with higher-priority configurations appended later. In this example, in the `debug` compilation mode of `x86_64-unknown-linux-gnu`, the final `compile-option` value is `compile-0 compile-1 compile-2`. In `release` mode, it is `compile-0 compile-1`. For other `targets`, it is `compile-0`.
- `override-compile-option`: Same as above. Since `override-compile-option` has higher priority than `compile-option`, in the final compilation command, the concatenated `override-compile-option` will be placed after the concatenated `compile-option`.
- `link-option`: Same as above.
- `dependencies`: Source code dependencies are merged directly. If there are dependency conflicts, an error will be reported. In this example, in the `debug` compilation mode of `x86_64-unknown-linux-gnu`, the final `dependencies` are `dep0`, `dep1`, and `dep2`. In `release` mode, only `dep0` and `dep1` are effective. For other `targets`, only `dep0` is effective.
- `test-dependencies`: Same as above.
- `bin-dependencies`: Binary dependencies are merged according to priority. If there are conflicts, only the higher-priority dependencies will be added. For configurations of the same priority, `package-option` configurations are added first. In this example, in the `debug` compilation mode of `x86_64-unknown-linux-gnu`, binary dependencies under `./test/pro1` and `./test/pro2` will be added. In `release` mode, only `./test/pro1` will be added. Since there are no public configurations for `bin-dependencies`, no binary dependencies will be effective for other `targets`.

In the cross-compilation scenario of this example, if `x86_64-unknown-linux-gnu` is specified as the target `target` on other platforms, the configuration of `target.x86_64-unknown-linux-gnu` will also be merged with public configuration items according to the above rules and applied. If in `debug` compilation mode, the configuration of `target.x86_64-unknown-linux-gnu.debug` will also be applied.

### Environment Variable Configuration

In `cjpm.toml`, environment variables can be used to configure field values. `cjpm` will obtain the corresponding environment variable values from the current runtime environment and replace them in the actual configuration values. For example, the following `dependencies` field uses environment variables for path configuration:

```text
[dependencies]
aoo = { path = "${DEPENDENCY_PATH}/aoo" }
```

When reading the module `aoo`, `cjpm` will obtain the `DEPENDENCY_PATH` variable value and perform the replacement to get the final path of the module `aoo`.

The list of fields that support environment variable configuration is as follows:

- The following fields in the single-module configuration field `package`:
    - Single-package compilation option `compile-option` in the single-package configuration item `package-configuration`
- The following fields in the workspace management field `workspace`:
    - Member module list `members`
    - Compilation module list `build-members`
    - Test module list `test-members`
- The following fields that exist in both `package` and `workspace`:
    - Compilation option `compile-option`
    - Global compilation option `override-compile-option`
    - Link option `link-option`
    - Compilation product storage path `target-dir`
- The `path` field of local dependencies in the build dependency list `dependencies`
- The `path` field of local dependencies in the test dependency list `test-dependencies`
- The `path` field of local dependencies in the build script dependency list `script-dependencies`
- Custom passthrough option `customized-option` in the command profile configuration item `profile`
- The `path` field in the external `c` library configuration item `ffi.c`
- The following fields in the platform isolation option `target`:
    - Compilation option `compile-option`
    - Global compilation option `override-compile-option`
    - Link option `link-option`
    - The `path` field of local dependencies in the build dependency list `dependencies`
    - The `path` field of local dependencies in the test dependency list `test-dependencies`
    - The `path` field of local dependencies in the build script dependency list `script-dependencies`
    - The `path-option` and `package-option` fields in the binary dependency field `bin-dependencies`

## Configuration and Cache Directories

The storage path for files downloaded by `cjpm` via `git` can be specified using the `CJPM_CONFIG` environment variable. If not specified, the default location on `Linux/macOS` is `$HOME/.cjpm`, and on `Windows`, it is `%USERPROFILE%/.cjpm`.

## Cangjie Package Management Specifications

In the Cangjie package management specifications, for a file directory to be recognized as a valid source code package, the following requirements must be met:

1. It must directly contain at least one Cangjie code file.
2. Its parent package (including the parent package's parent package, up to the `root` package) must also be a valid source code package. The module `root` package has no parent package, so it only needs to meet condition 1.

For example, consider the following `cjpm` project named `demo`:

```text
demo
├──src
│   ├── main.cj
│   └── pkg0
│        ├── aoo
│        │    └── aoo.cj
│        └── boo
│             └── boo.cj
└── cjpm.toml
```

Here, the `demo.pkg0` directory does not directly contain Cangjie code, so `demo.pkg0` is not a valid source code package. The `demo.pkg0.aoo` and `demo.pkg0.boo` packages directly contain Cangjie code files `aoo.cj` and `boo.cj`, but since their upstream package `demo.pkg0` is not a valid source code package, these two packages are also not valid source code packages.

When `cjpm` identifies a package like `demo.pkg0` that does not directly contain Cangjie files, it will treat it as a non-source code package, ignore all its sub-packages, and print the following warning:

```text
Warning: there is no '.cj' file in directory 'demo/src/pkg0', and its subdirectories will not be scanned as source code
```

Therefore, if developers need to configure a valid source code package, the package must directly contain at least one Cangjie code file, and all its upstream packages must also be valid source code packages. Taking## Usage Examples

Taking the directory structure of the Cangjie project below as an example, this section demonstrates how to use `cjpm`. The corresponding source code files for this example can be found in the [Source Code](#example-source-code) section. The module name for this Cangjie project is `test`.

```text
cj_project
├── pro0
│    ├── cjpm.toml
│    └── src
│         ├── zoo
│         │    ├── zoo.cj
│         │    └── zoo_test.cj
│         └── pro0.cj
├── src
│    ├── koo
│    │    ├── koo.cj
│    │    └── koo_test.cj
│    ├── main.cj
│    └── main_test.cj
└── cjpm.toml
```

### Using init and build

- Create a new Cangjie project and write source code in `xxx.cj` files, such as the `koo` package and `main.cj` file shown in the example structure.

    ```shell
    cjpm init --name test --path .../cj_project
    mkdir koo
    ```

    This will automatically generate the `src` folder and a default `cjpm.toml` configuration file.

- When the current module requires an external dependency on the `pro0` module, create the `pro0` module and its configuration file. Then, write the source code for this module. You need to manually create the `src` folder under `pro0`, and within `src`, create the root package `pro0.cj` for the `pro0` module. Place the written Cangjie packages under `src`, such as the `zoo` package shown in the example structure.

    ```shell
    mkdir pro0 && cd pro0
    cjpm init --name pro0 --type=static
    mkdir src/zoo
    ```

- When the main module depends on `pro0`, configure the `dependencies` field in the main module's configuration file as described in the manual. After ensuring the configuration is correct, execute `cjpm build`. The generated executable will be located in the `target/release/bin/` directory.

    ```shell
    cd cj_project
    vim cjpm.toml
    cjpm build
    cjpm run
    ```

### Using test and clean

- After writing the corresponding `xxx_test.cj` unit test files for each file as shown in the example structure, execute the following commands to run unit tests. The generated files will be in the `target/release/unittest_bin` directory.

    ```shell
    cjpm test
    ```

    Alternatively:

    ```shell
    cjpm test src src/koo pro0/src/zoo
    ```

- To manually delete intermediate files like `target`, execute the following command:

    ```shell
    cjpm clean
    ```

### Example Source Code

<!-- compile -pkg0 -->
<!-- cfg="libpro0.zoo.a libtest.koo.a" -->

```cangjie
// cj_project/src/main.cj
package test

import pro0.zoo.*
import test.koo.*

main(): Int64 {
    let res = z + k
    println(res)
    let res2 = concatM("a", "b")
    println(res2)
    return 0
}

func concatM(s1: String, s2: String): String {
    return s1 + s2
}
```

<!-- only-cjpm -->

```cangjie
// cj_project/src/main_test.cj
package test

import std.unittest.* // testfame
import std.unittest.testmacro.* // macro_Defintion

@Test
public class TestM{
    @TestCase
    func sayhi(): Unit {
        @Assert(concatM("1", "2"), "12")
        @Assert(concatM("1", "3"), "13")
    }
}
```

<!-- compile -pkg0 -->
<!-- cfg="-p test.koo --output-type=staticlib" -->

```cangjie
// cj_project/src/koo/koo.cj
package test.koo

public let k: Int32 = 12

func concatk(s1: String, s2: String): String {
    return s1 + s2
}
```

<!-- only-cjpm -->

```cangjie
// cj_project/src/koo/koo_test.cj
package test.koo

import std.unittest.* // testfame
import std.unittest.testmacro.* // macro_Defintion

@Test
public class TestK{
    @TestCase
    func sayhi(): Unit {
        @Assert(concatk("1", "2"), "12")
        @Assert(concatk("1", "3"), "13")
    }
}
```

<!-- compile -pkg0 -->
<!-- cfg="-p pro0 --output-type=staticlib" -->

```cangjie
// cj_project/pro0/src/pro0.cj
package pro0
```

<!-- compile -pkg0 -->
<!-- cfg="-p pro0.zoo --output-type=staticlib" -->

```cangjie
// cj_project/pro0/src/zoo/zoo.cj
package pro0.zoo

public let z: Int32 = 26

func concatZ(s1: String, s2: String): String {
    return s1 + s2
}
```

<!-- only-cjpm -->

```cangjie
// cj_project/pro0/src/zoo/zoo_test.cj
package pro0.zoo

import std.unittest.* // testfame
import std.unittest.testmacro.* // macro_Defintion

@Test
public class TestZ{
    @TestCase
    func sayhi(): Unit {
        @Assert(concatZ("1", "2"), "12")
        @Assert(concatZ("1", "3"), "13")
    }
}
```

```toml
# cj_project/cjpm.toml
[package]
cjc-version = "1.0.0"
description = "nothing here"
version = "1.0.0"
name = "test"
output-type = "executable"

[dependencies]
pro0 = { path = "pro0" }
```

```toml
# cj_project/pro0/cjpm.toml
[package]
cjc-version = "1.0.0"
description = "nothing here"
version = "1.0.0"
name = "pro0"
output-type = "static"
```