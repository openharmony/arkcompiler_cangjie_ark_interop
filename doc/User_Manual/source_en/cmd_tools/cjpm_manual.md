# Package Management Tool

## Overview

`CJPM (Cangjie Package Manager)` is the official package management tool for the Cangjie language, designed to comprehensively manage and maintain the module system of Cangjie projects, including module initialization, dependency checking and updating, and other operations. It provides a unified compilation entry point, supports incremental compilation, parallel compilation, and allows for custom compilation commands.

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

`cjpm` is the name of the main program, `build` is the currently executed available command, and `--help` is the available configuration option for the current command (configuration options typically have both long and short forms with the same effect).

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

`init` is used to initialize a new Cangjie module or workspace. When initializing a module, it creates the configuration file `cjpm.toml` in the current folder by default and creates a `src` source code folder. If the module's output is of an executable type, it generates a default `main.cj` file under `src`, which prints `hello world` after compilation. When initializing a workspace, only the `cjpm.toml` file is created, and existing Cangjie modules under the path are scanned and added to the `members` field by default. If `cjpm.toml` already exists or `main.cj` is already present in the source code folder, the corresponding file creation steps are skipped.

`init` has several configurable options:

- `--name <value>` specifies the `root` package name of the new module. If not specified, it defaults to the name of the parent folder.
- `--path <value>` specifies the path for the new module. If not specified, it defaults to the current folder.
- `--type=<executable|static|dynamic>` specifies the output type of the new module. If omitted, it defaults to `executable`.
- `--workspace` creates a new workspace configuration file. When this option is specified, all other options above are automatically ignored.

Example:

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

The `check` command is used to inspect the dependencies required by the project. Upon successful execution, it prints the valid package compilation order.

`check` has several configurable options:

- `-m, --member <value>` can only be used within a workspace to specify a single module as the inspection entry point.
- `--no-tests` when configured, test-related dependencies will not be printed.
- `--skip-script` when configured, the build script compilation and execution will be skipped.

Example:

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
Note: In the above output, b.B represents a subpackage named b.B within the module with b as the root package.
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

`update` is used to update the contents of `cjpm.toml` into `cjpm.lock`. When `cjpm.lock` does not exist, it will be generated. The `cjpm.lock` file records metadata such as version numbers of `git` dependencies for use in subsequent builds.

`update` has the following configurable option:

- `--skip-script` when configured, the build script compilation and execution will be skipped.

```text
Input: cjpm update
Output: cjpm update success
```

### tree

The `tree` command is used to visually display the package dependency relationships in Cangjie source code.

`tree` has several configurable options:

- `-p, --package <value>` specifies a package as the root node to display its sub-dependencies. The value to be configured is the package name.
- `--invert <value>` specifies a package as the root node and inverts the dependency tree to show which packages depend on it. The value to be configured is the package name.
- `--depth <N>` specifies the maximum depth of the dependency tree. The optional value is a non-negative integer. When this option is specified, all packages are used as root nodes by default. Here, N represents the maximum depth of child nodes for each dependency tree.
- `--target <value>` includes dependencies for the specified target platform in the analysis and displays the dependency relationships.
- `--no-tests` excludes dependencies listed in the `test-dependencies` field.
- `-V, --verbose` adds detailed information to package nodes, including package name, version number, and package path.
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

`build` is used to build the current Cangjie project. Before executing this command, dependencies are checked. Upon successful verification, `cjc` is invoked for the build.

`build` has several configurable options:

- `-i, --incremental` specifies incremental compilation. By default, full compilation is performed.
- `-j, --jobs <N>` specifies the maximum number of parallel compilation jobs. The final maximum concurrency is the minimum of `N` and `2 times the number of CPU cores`.
- `-V, --verbose` displays compilation logs.
- `-g` generates `debug` version output.
- `--mock` enables classes in builds with this option to be used for `mock` testing.
- `--cfg` when specified, custom `cfg` options in `cjpm.toml` are passed through. For configuration in `cjpm.toml`, refer to the [profile.customized-option](#profile.customized-option) section.
- `-m, --member <value>` can only be used within a workspace to specify a single module as the compilation entry point.
- `--target-dir <value>` specifies the output path for the build products.
- `-o, --output <value>` specifies the name of the output executable file. The default name is `main` (`main.exe` on Windows systems).
- `--target <value>` when specified, enables cross-compilation to the target platform. For configuration in `cjpm.toml`, refer to the [target](#target) section.
- `--skip-script` when configured, the build script compilation and execution will be skipped.

> **Note:**
>
> - The `-i, --incremental` option only enables package-level incremental compilation in `cjpm`. Developers can manually pass the `--incremental-compile` compilation option in the configuration file's `compile-option` field to enable function-level incremental features provided by the `cjc` compiler.
> - Currently, the `-i, --incremental` option only supports incremental analysis based on source code. If imported library contents change, developers need to rebuild using the full compilation method.

By default, intermediate files generated during compilation are stored in the `target` folder, while executable files are stored in `target/release/bin` or `target/debug/bin` folders based on the compilation mode. For running executable files, refer to the `run` command.
To ensure reproducible builds, this command creates a `cjpm.lock` file containing the exact versions of all transitive dependencies, which will be used for all subsequent builds. Use the `update` command to update this file when necessary. To ensure reproducible builds for all project participants, this file should be committed to the version control system.

Example:

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
> According to the Cangjie package management specifications, only valid source code packages that meet the requirements can be correctly included in the compilation scope. If warnings such as `no '.cj' file` appear during compilation, it is likely due to non-compliant packages causing source files to be excluded from compilation. In such cases, refer to the [Cangjie Package Management Specifications](#Cangjie-Package-Management-Specifications) to modify the code directory structure.

### run

`run` is used to execute the binary output generated by the current project. The `run` command by default executes the `build` command process to generate the final binary file for execution.

`run` has several configurable options:

- `--name <value>` specifies the name of the binary to run. If not specified, it defaults to `main`. Binary outputs in a workspace are stored in the `target/release/bin` path by default.
- `--build-args <value>` controls the parameters for the `build` compilation process.
- `--skip-build` skips the compilation process and runs directly.
- `--run-args <value>` passes arguments to the binary output for this run.
- `--target-dir <value>` specifies the output path for the run products.
- `-g` runs the `debug` version output.
- `-V, --verbose` displays run logs.
- `--skip-script` when configured, the build script compilation and execution will be skipped.

Example:

```text
Input: cjpm run
Output: cjpm run success
Input: cjpm run -g // This will execute the cjpm build -i -g command by default
Output: cjpm run success
```

```text
Input: cjpm run --build-args="-s -j16" --run-args="a b c"
Output: cjpm run success
```

### test

The `test` command is used to compile and run unit test cases for Cangjie files. After execution, it prints the test results. The compiled artifacts are stored by default in the `target/release/unittest_bin` directory. For guidelines on writing unit test code, refer to the "Cangjie Programming Language Standard Library API" documentation under the `std.unittest` library section.

This command can specify the path of the package to be tested (supports multiple packages, e.g., `cjpm test path1 path2`). If no path is specified, it defaults to executing module-level unit tests. When performing module-level unit tests, only the current module's tests are executed by default; tests in all directly or indirectly dependent modules are not run. The `test` command requires that the current project can be successfully compiled with `build`.

The structure of module unit test code is as follows, where `xxx.cj` contains the package's source code and `xxx_test.cj` contains the unit test code:

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

1. Single Module Test Scenario

    ```text
    Input: cjpm test
    Progress Report:
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

2. Single Package Test Scenario

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
    Project tests finished, time elapsed: 160133 ns, RESULT:
    TP: test.*, time elapsed: 160133 ns, RESULT:
        PASSED:
        TP: test.koo, time elapsed: 160133 ns
    Summary: TOTAL: 1
        PASSED: 1, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    cjpm test success
    ```

3. Multiple Package Test Scenario

    ```text
    Input: cjpm test src/koo src
    Output:
    --------------------------------------------------------------------------------------------------
    TP: test.koo, time elapsed: 168204 ns, RESULT:
        TCS: TestK, time elapsed: 168204 ns, RESULT:
        [ PASSED ] CASE: sayhi (168204 ns)
        Summary: TOTAL: 1
        PASSED: 1, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    TP: test, time elapsed: 171541 ns, RESULT:
        TCS: TestM, time elapsed: 171541 ns, RESULT:
        [ PASSED ] CASE: sayhi (171541 ns)
        Summary: TOTAL: 1
        PASSED: 1, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    Project tests finished, time elapsed: 339745 ns, RESULT:
    TP: test.*, time elapsed: 339745 ns, RESULT:
        PASSED:
        TP: test.koo, time elapsed: 339745 ns
        TP: test, time elapsed: 339745 ns
    Summary: TOTAL: 2
        PASSED: 2, SKIPPED: 0, ERROR: 0
        FAILED: 0
    --------------------------------------------------------------------------------------------------
    cjpm test success
    ```

`test` has several configurable options:

- `--no-run` is used to only compile unit test artifacts.
- `--skip-build` is used to only execute unit test artifacts.
- `-i, --incremental` specifies incremental compilation for test code; full compilation is performed by default.
- `-j, --jobs <N>` specifies the maximum number of concurrent parallel compilations. The final maximum concurrency is the minimum of `N` and `2 times the number of CPU cores`.
- `-V, --verbose` enables logging output for unit tests.
- `-g` generates `debug` version unit test artifacts, which are stored in the `target/debug/unittest_bin` directory.
- `--module <value>` specifies the target test module. The specified module must be directly or indirectly dependent on the current module (or be the module itself). Multiple modules can be specified using `--module "module1 module2"`. If not specified, only the current module is tested.
- `--target-dir <value>` specifies the directory for storing unit test artifacts.
- `--cfg` forwards custom `cfg` options from `cjpm.toml`.
- `-m, --member <value>` can only be used in a workspace to specify testing a single module.
- `--target <value>` enables cross-compilation to generate unit test results for the target platform. Refer to the `target` section in `cjpm.toml` for configuration details.
- `--dry-run` prints test cases without executing them.
- `--filter <value>` filters a subset of tests. The `value` format is as follows:
    - `--filter=*` matches all test classes.
    - `--filter=*.*` matches all test cases in all test classes (same result as `*`).
    - `--filter=*.*Test,*.*case*` matches all test cases ending with `Test` in any test class or test cases containing `case` in their names.
    - `--filter=MyTest*.*Test,*.*case*,-*.*myTest` matches all test cases ending with `Test` in test classes starting with `MyTest`, or test cases containing `case` in their names, or test cases not containing `myTest` in their names.
- `--include-tags <value>` selects a subset of test categories marked with the `@Tag` macro. The `value` format is as follows:
    - `--include-tags=Unittest` runs all tests marked with `@Tag[Unittest]`.
    - `--include-tags=Unittest,Smoke` runs all tests marked with either `@Tag[Unittest]` or `@Tag[Smoke]` or both.
    - `--include-tags=Unittest+Smoke` runs all tests marked with both `@Tag[Unittest]` and `@Tag[Smoke]`.
    - `--include-tags=Unittest+Smoke+JiraTask3271,Backend` runs all tests marked with `@Tag[Backend]` or `@Tag[Unittest, Smoke, JiraTask3271]`.
- `--exclude-tags <value>` excludes a subset of test categories marked with the `@Tag` macro. The `value` format is as follows:
    - `--exclude-tags=Unittest` runs all tests **not** marked with `@Tag[Unittest]`.
    - `--exclude-tags=Unittest,Smoke` runs all tests **not** marked with either `@Tag[Unittest]` or `@Tag[Smoke]` or both.
    - `--exclude-tags=Unittest+Smoke+JiraTask3271` runs all tests **not** marked with all of `@Tag[Unittest, Smoke, JiraTask3271]`.
    - `--include-tags=Unittest --exclude-tags=Smoke` runs all tests marked with `@Tag[Unittest]` but not `@Tag[Smoke]`.
- `--random-seed <N>` specifies the value of the random seed.
- `--no-color` disables console color display.
- `--timeout-each <value>` specifies the default timeout for each test case. The format is `%d[millis|s|m|h]`.
- `--parallel` specifies the parallel execution scheme for test cases. The `value` format is as follows:
    - `<BOOL>` can be `true` or `false`. If `true`, test classes can be run in parallel, with the number of parallel processes controlled by the available CPU cores.
    - `nCores` specifies that the number of parallel test processes should equal the number of available CPU cores.
    - `NUMBER` specifies the number of parallel test processes. The value should be a positive integer.
    - `NUMBERnCores` specifies that the number of parallel test processes should be a multiple of the available CPU cores. The value should be positive (supports floating-point or integer values).
- `--show-all-output` enables output printing for all test cases, including passed ones.
- `--no-capture-output` disables test output capture; output is printed immediately during test execution.
- `--report-path <value>` specifies the path for generating test execution reports.
- `--report-format <value>` specifies the report output format. Currently, unit test reports only support the `xml` format (case-insensitive). Other values will throw an exception.
- `--skip-script` skips the compilation and execution of build scripts.
- `--no-progress` disables progress reporting. If `--dry-run` is specified, `--no-progress` is implied.
- `--progress-brief` displays a brief (single-line) progress report instead of a detailed one.
- `--progress-entries-limit <value>` limits the number of entries displayed in the progress report. Default: `0`. Allowed values:
    - `0` no limit on the number of entries.
    - `n` where `n` is a positive integer, specifying the maximum number of entries that can be displayed simultaneously on the terminal.

Example usage of `cjpm test` options:

```text
Input: cjpm test --filter=*
Output: cjpm test success
```

```text
Input: cjpm test src --report-path=reports --report-format=xml
Output: cjpm test success
```

> **Note:**
>
> `cjpm test` automatically builds all packages with `mock` support, allowing developers to perform `mock` tests on custom classes or dependent source modules. To `mock` classes from binary dependencies, use `cjpm build --mock` to build classes with `mock` support.

### bench

The `bench` command is used to execute performance test cases for test files and directly print the results. The compiled artifacts are stored by default in the `target/release/unittest_bin` directory. Performance test cases are marked with the `@Bench` macro. For more details on writing performance test code, refer to the "Cangjie Programming Language Standard Library API" documentation under the `std.unittest` library section.

This command can specify the path of the package to be tested (supports multiple packages, e.g., `cjpm bench path1 path2`). If no path is specified, it defaults to executing module-level unit tests. Like `test`, when performing module-level unit tests, only the current module's tests are executed by default. The `bench` command requires that the current project can be successfully compiled with `build`.

Similar to the `test` subcommand, if you have an `xxx.cj` file, `xxx_test.cj` can also contain performance test cases.

```text
Input: cjpm bench
Output:
TP: bench, time elapsed: 8107939844 ns, RESULT:
    TCS: Test_UT, time elapsed: 8107939844 ns, RESULT:
    | Case       |   Median |         Err |   Err% |     Mean |
    |:-----------|---------:|------------:|-------:|---------:|
    | Benchmark1 | 5.438 ns | ±0.00439 ns |  ±0.1% | 5.420 ns |
Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
Project tests finished, time elapsed: 8107939844 ns, RESULT:
TP: bench.*, time elapsed: 8107939844 ns, RESULT:
    PASSED:
    TP: bench, time elapsed: 8107939844 ns, RESULT:
Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
```

`bench` supports these options:

- `--no-run`: Only compiles artifacts.
- `--skip-build`: Only executes precompiled artifacts.
- `-i, --incremental`: Incremental compilation (full by default).
- `-j, --jobs <N>`: Maximum parallel compilation jobs (min of `N` and `2 × CPU cores`).
- `-V, --verbose`: Enables verbose logging.
- `-g`: Generates `debug` artifacts in `target/debug/unittest_bin`.
- `--module <value>`: Specifies target module(s) (must be dependencies).
- `--target-dir <value>`: Output directory for artifacts.
- `--cfg`: Passes `cjpm.toml` `cfg` options.
- `-m, --member <value>`: Tests a single workspace module.
- `--target <value>`: Cross-compiles for target platforms (see `cross-compile-configuration`).
- `--dry-run`: Prints without execution.
- `--filter <value>`: Filters test subsets (same formats as `test`).
- `--include-tags <value>`: Runs tests with specified `@Tag` annotations (same formats as `test`).
- `--exclude-tags <value>`: Excludes tests with specified `@Tag` annotations (same formats as `test`).
- `--random-seed <N>`: Specifies a random seed.
- `--no-color`: Disables colored output.
- `--report-path <value>`: Report output path (default: `bench_report`).
- `--baseline-path <value>`: Path for baseline comparison (defaults to `--report-path`).
- `--compile-option <string>`: Additional compiler options for benchmarks.
- `--report-format <value>`: Supports `csv` and `csv-raw` formats.
- `--skip-script`: Skips build script compilation.

`cjpm bench` usage examples:

```text
Input: cjpm bench
Output: cjpm bench success

Input: cjpm bench src
Output: cjpm bench success

Input: cjpm bench src --filter=*
Output: cjpm bench success

Input: cjpm bench src --report-format=csv
Output: cjpm bench success
```

> **Note:**
>
> `cjpm bench` does not fully support `mock` to avoid overhead. Using `mock` in benchmarks will compile but throw runtime errors.

### clean

The `clean` command removes build artifacts (`target` directory). Use `-g` to clean only `debug` artifacts. `--target-dir <value>` specifies a custom directory (ensure safety). `--skip-script` skips build script execution.

Examples:

```text
Input: cjpm clean
Output: cjpm clean success
```

```text
Input: cjpm clean --target-dir temp
Output: cjpm clean success
```

### install

The `install` command is used to install the Cangjie project. Before execution, it will first compile the project and then install the compiled artifacts to the specified path. The installed artifacts are named after the Cangjie project (with a `.exe` suffix on `Windows` systems). The project artifact type for `install` must be `executable`.

`install` has several configurable options:

- `-V, --verbose`: Displays installation logs.
- `-g`: Generates a `debug` version of the installation artifacts.
- `--path <value>`: Specifies the local installation path for the project. Defaults to the current directory.
- `--root <value>`: Specifies the installation path for the executable file. If not configured, the default path is `$HOME/.cjpm` on `Linux`/`macOS` and `%USERPROFILE%/.cjpm` on `Windows`. If configured, the artifacts will be installed under `value`.
- `-m, --member <value>`: Only usable in a workspace. Specifies a single module as the compilation entry point to install a single module.
- `--target-dir <value>`: Specifies the path for storing compiled artifacts.
- `--name <value>`: Specifies the name of the final installed artifact.
- `--git <value>`: Specifies the `git` URL for the project to be installed.
- `--branch <value>`: Specifies the `git` branch for the project to be installed.
- `--tag <value>`: Specifies the `git` tag for the project to be installed.
- `--commit <value>`: Specifies the `git` commit ID for the project to be installed.
- `--list`: Prints the list of installed artifacts.
- `--skip-build`: Skips the compilation phase and directly installs the artifacts. Requires the project to be in a compiled state and only works for local installations.
- `-j, --jobs <N>`: Specifies the maximum number of parallel compilation jobs. The final maximum concurrency is the minimum of `N` and `2 times the CPU core count`.
- `--cfg`: When specified, custom `cfg` options from `cjpm.toml` can be passed through.
- `--skip-script`: When configured, skips the compilation and execution of the build script for the module to be installed.

Notes for the `install` functionality:

- `install` supports two installation methods: installing a local project (via `--path`) and installing a `git` project (via `--git`). Only one of these methods can be configured at a time; otherwise, `install` will report an error. If neither is configured, the default is to install the local project in the current directory.
- By default, `install` enables incremental compilation.
- `git`-related configurations (`--branch`, `--tag`, `--commit`) only take effect when `--git` is configured. If multiple `git` configurations are provided, only the one with the highest priority will take effect. The priority order is `--commit` > `--branch` > `--tag`.
- If an executable file with the same name already exists, it will be replaced.
- Assuming the installation path is `root` (configured or default), the executable file will be installed under `root/bin`.
- If the project has dynamic library dependencies, the required dynamic libraries for the executable will be installed under `root/libs`, separated into directories by program name. Developers must add these directories to the appropriate paths (`LD_LIBRARY_PATH` on `Linux`, `PATH` on `Windows`, `DYLD_LIBRARY_PATH` on `macOS`) for the program to function.
- The default installation path (`$HOME/.cjpm` on `Linux`/`macOS`, `%USERPROFILE%/.cjpm` on `Windows`) is added to `PATH` during `envsetup`.
- After installing a `git` project, the corresponding compilation artifact directory will be cleared.
- If the project to be installed has only one executable artifact, specifying `--name` will rename it during installation. If there are multiple executable artifacts, specifying `--name` will only install the artifact with the corresponding name.
- When `--list` is configured, `install` will print the list of installed artifacts, and all other configuration options except `--root` will be ignored. If `--root` is configured, `--list` will print the list of installed artifacts under the specified path; otherwise, it will print the list under the default path.

Examples:

```text
cjpm install --path path/to/project # Installs from the local path path/to/project
cjpm install --git url             # Installs from the git URL
```

### uninstall

`uninstall` is used to uninstall Cangjie projects, removing the corresponding executable files and dependency files.

`uninstall` requires the `name` parameter to specify the artifact to be uninstalled. Multiple `name` parameters can be provided for sequential deletion. `uninstall` can specify the executable file path via `--root <value>`. If not configured, the default path is `$HOME/.cjpm` on `Linux`/`macOS` and `%USERPROFILE%/.cjpm` on `Windows`. If configured, it will uninstall artifacts under `value/bin` and dependencies under `value/libs`.

> **Note:**
>
> On `Windows` platforms, immediately cleaning up the executable file or parent directory of a child process after its execution may fail. If this issue occurs, retry the `clean` command after a short delay.

## Module Configuration File Description

The module configuration file `cjpm.toml` is used to configure basic information, dependencies, compilation options, etc. `cjpm` primarily parses and executes based on this file. The module name can be renamed in `cjpm.toml`, but the package name cannot be renamed.

The configuration file code is as follows:

```text
[package] # Single-module configuration fields; cannot coexist with the workspace field
  cjc-version = "1.0.0" # Minimum required version of `cjc`, mandatory
  name = "demo" # Module name and module root package name, mandatory
  description = "nothing here" # Description, optional
  version = "1.0.0" # Module version information, mandatory
  compile-option = "" # Additional compilation command options, optional
  override-compile-option = "" # Additional global compilation command options, optional
  link-option = "" # Linker passthrough options, can pass security compilation commands, optional
  output-type = "executable" # Compilation output artifact type, mandatory
  src-dir = "" # Specifies the source code directory path, optional
  target-dir = "" # Specifies the artifact directory path, optional
  package-configuration = {} # Single-package configuration options, optional

[workspace] # Workspace management fields; cannot coexist with the package field
  members = [] # List of workspace member modules, mandatory
  build-members = [] # List of workspace compilation modules, must be a subset of members, optional
  test-members = [] # List of workspace test modules, must be a subset of build-members, optional
  compile-option = "" # Additional compilation command options applied to all workspace member modules, optional
  override-compile-option = "" # Additional global compilation command options applied to all workspace member modules, optional
  link-option = "" # Linker passthrough options applied to all workspace member modules, optional
  target-dir = "" # Specifies the artifact directory path, optional

[dependencies] # Source code dependency configuration, optional
  coo = { git = "xxx", branch = "dev" } # Imports a `git` dependency
  doo = { path = "./pro1" } # Imports a source code dependency

[test-dependencies] # Test-phase dependency configuration, same format as dependencies, optional

[script-dependencies] # Build script dependency configuration, same format as dependencies, optional

[replace] # Dependency replacement configuration, same format as dependencies, optional

[ffi.c] # Imports C language library dependencies, optional
  clib1.path = "xxx"

[profile] # Command profile configuration, optional
  build = {} # Build command configuration
  test = {} # Test command configuration
  bench = {} # Benchmark command configuration
  customized-option = {} # Custom passthrough options

[target.x86_64-unknown-linux-gnu] # Backend and platform isolation configuration, optional
  compile-option = "value1" # Additional compilation command options for specific target compilation and cross-compilation, optional
  override-compile-option = "value2" # Additional global compilation command options for specific target compilation and cross-compilation, optional
  link-option = "value3" # Linker passthrough options for specific target compilation and cross-compilation, optional

[target.x86_64-w64-mingw32.dependencies] # Source code dependency configuration for the corresponding target, optional

[target.x86_64-w64-mingw32.test-dependencies] # Test-phase dependency configuration for the corresponding target, optional

[target.x86_64-unknown-linux-gnu.bin-dependencies] # Cangjie binary library dependencies for specific target compilation and cross-compilation, optional
  path-option = ["./test/pro0", "./test/pro1"] # Configures binary library dependencies as file directories
[target.x86_64-unknown-linux-gnu.bin-dependencies.package-option] # Configures binary library dependencies as single files
  "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
  "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
  "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"
```

If the above fields are not used in `cjpm.toml`, they default to empty (for paths, the default is the directory where the configuration file is located).

### "cjc-version"

The minimum required version of the Cangjie compiler. It must be compatible with the current environment version to execute. A valid Cangjie version number consists of three segments of numbers separated by `.`, with each segment being a natural number without leading zeros. For example:

- `1.0.0` is a valid version number.
- `1.00.0` is invalid because `00` has leading zeros.
- `1.2e.0` is invalid because `2e` is not a natural number.

### "name"

The current Cangjie module name, which is also the module `root` package name.

A valid Cangjie module name must be a valid identifier. Identifiers can consist of letters, numbers, and underscores, and must start with a letter (e.g., `cjDemo` or `cj_demo_1`).

> **Note:**
>
> Currently, Cangjie module names do not support Unicode characters. The name must be a valid ASCII identifier.

### "description"

Description of the current Cangjie module, for informational purposes only. No format restrictions.

### "version"

The version number of the current Cangjie module, managed by the module owner and primarily used for module validation. The format is the same as `cjc-version`.

### "compile-option"

Additional compilation options passed to `cjc`. In multi-module compilation, the `compile-option` set for each module applies to all packages within that module.

Example:

```text
compile-option = "-O1 -V"
```

Commands entered here will be inserted into the compilation command during `build`, separated by spaces. Refer to the [Compilation Options](../Appendix/compile_options_OHOS.md) chapter in the *Cangjie Programming Language Development Guide* for available commands.

### "override-compile-option"

Additional global compilation options passed to `cjc`. In multi-module compilation, the `override-compile-option` set for the entry module applies to all packages in that module and its dependencies.

Example:

```text
override-compile-option = "-O1 -V"
```

Commands entered here will be inserted into the compilation command during `build`, appended after the module's `compile-option`, and take precedence over `compile-option`. Refer to the [Compilation Options](../Appendix/compile_options_OHOS.md) chapter for available commands.

> **Note:**
>
> - `override-compile-option` applies to packages in dependency modules. Developers must ensure that the configured `cjc` compilation options do not conflict with the `compile-option` in dependency modules. For non-conflicting options of the same type, `override-compile-option` takes precedence.
> - In workspace compilation scenarios, only the `override-compile-option` configured in `workspace` applies to all packages in all modules. Even if `-m` specifies a single module as the entry module, the entry module's `override-compile-option` will not be used.

### "link-option"

Compilation options passed to the linker, which can be used to pass security compilation commands, as shown below:

```text
link-option = "-z noexecstack -z relro -z now --strip-all"
```

> **Note:**
>
> Commands configured in `link-option` are only automatically passed to packages corresponding to dynamic libraries and executable artifacts during compilation.

### "output-type"

The type of compilation output artifact, which can be an executable program or a library. The inputs are shown in the table below. To automatically fill this field as `static` when generating `cjpm.toml`, use the command `cjpm init --type=static --name=modName`. If no type is specified, it defaults to `executable`. Only the main module can have this field set to `executable`.

|     Input     |               Description |
| :-----------: | :------------------------: |
| "executable"  |         Executable program |
|   "static"    | Static library |
|  "dynamic"   | Dynamic library |
|     Other     |               Error |

### "src-dir"

This field specifies the source code directory path. If not specified, it defaults to the `src` folder.

### "target-dir"

This field specifies the compilation artifact directory path. If not specified, it defaults to the `target` folder. If this field is not empty, executing `cjpm clean` will delete the directory it points to. Developers must ensure the safety of this cleanup operation.

> **Note:**
>
> If `--target-dir` is specified during compilation, that option takes precedence.

```text
target-dir = "temp"
```

### "package-configuration"

Per-package configuration options for each module. This option is a `map` structure, where the package name to be configured is the `key`, and the per-package configuration information is the `value`. Currently configurable options include output type and conditional options (`output-type`, `compile-option`), which can be configured as needed. For example, the output type of the `demo.aoo` package in the `demo` module will be set to dynamic library, and the `-g` command will be passed to the `demo.aoo` package during compilation.

```text
[package.package-configuration."demo.aoo"]
  output-type = "dynamic"
  compile-option = "-g"
```

If compatible compilation options are configured in different fields, the command generation priority is as follows:

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

By configuring this field, multiple binary artifacts can be generated simultaneously (when generating multiple binary artifacts, the `-o, --output <value>` option will be invalid). Example:

Source code structure example (module name: `demo`):

```text
src
├── aoo
│    └── aoo.cj
├── boo
│    └── boo.cj
├── coo
│    └── coo.cj
└──  main.cj
```

Configuration example:

```text
[package.package-configuration."demo.aoo"]
  output-type = "executable"
[package.package-configuration."demo.boo"]
  output-type = "executable"
```

Multiple binary artifacts example:

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

This field manages multiple modules as a workspace and supports the following configurations:

- `members = ["aoo", "path/to/boo"]`: Lists local source code modules included in this workspace, supporting absolute and relative paths. Members must be modules, not other workspaces.
- `build-members = []`: Modules to be compiled. If not specified, all modules in the workspace are compiled by default. Members must be included in the `members` field.
- `test-members = []`: Modules to be tested. If not specified, all modules in the workspace are unit-tested by default. Members must be included in the `build-members` field.
- `compile-option = ""`: Workspace-wide compilation options, optional.
- `override-compile-option = ""`: Workspace-wide global compilation options, optional.
- `link-option = ""`: Workspace-wide linker options, optional.
- `target-dir = ""`: Workspace artifact directory path, optional, defaults to `target`.

Workspace-wide configurations apply to all member modules. For example, configuring `[dependencies] xoo = { path = "path_xoo" }` allows all member modules to use the `xoo` module without reconfiguring in each submodule's `cjpm.toml`.

> **Note:**
>
> The `package` field is for module general information and cannot coexist with the `workspace` field. All other fields can be used in the workspace.

Workspace directory example:

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

Example workspace configuration file usage:

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

This field imports dependent Cangjie modules via source code, configuring information about other modules required for the current build. Currently, it supports local path dependencies and remote `git` dependencies.

To specify a local dependency, use the `path` field, which must contain a valid local path. For example, the code structure of two submodules `pro0` and `pro1` along with the main module is as follows:

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

After configuring the main module's `cjpm.toml` as shown below, the `pro0` and `pro1` modules can be used in the source code:

```text
[dependencies]
  pro0 = { path = "./pro0" }
  pro1 = { path = "./pro1" }
```

To specify a remote `git` dependency, use the `git` field, which must contain a valid `url` in any format supported by `git`. To configure a `git` dependency, you can include at most one `branch`, `tag`, or `commitId` field to select a specific branch, tag, or commit hash, respectively. If multiple such fields are configured, only the highest-priority configuration will take effect, with the priority order being `commitId` > `branch` > `tag`. For example, with the following configuration, the `pro0` and `pro1` modules from specific `git` repository URLs can be used in the source code:

```text
[dependencies]
  pro0 = { git = "git://github.com/org/pro0.git", tag = "v1.0.0"}
  pro1 = { git = "https://gitee.com/anotherorg/pro1", branch = "dev"}
```

In this case, `cjpm` will download the latest version of the corresponding repository and save the current `commit-hash` in the `cjpm.lock` file. All subsequent `cjpm` commands will use the saved version until `cjpm update` is executed.

Authentication is often required to access `git` repositories. `cjpm` does not request credentials, so existing `git` authentication support should be used. If the protocol for `git` is `https`, an existing git credential helper must be used. On `Windows`, the credential helper can be installed alongside `git` and is used by default. On `Linux/macOS`, refer to the `git-config` documentation in the official `git` documentation for details on setting up a credential helper. If the protocol is `ssh` or `git`, key-based authentication should be used. If the key is passphrase-protected, developers should ensure that `ssh-agent` is running and the key is added via `ssh-add` before using `cjpm`.

The `dependencies` field can specify the compilation output type via the `output-type` attribute. The specified type can differ from the compilation output type of the source dependency itself and can only be `static` or `dynamic`, as shown below:

```text
[dependencies]
  pro0 = { path = "./pro0", output-type = "static" }
  pro1 = { git = "https://gitee.com/anotherorg/pro1", output-type = "dynamic" }
```

With the above configuration, the `output-type` settings in the `cjpm.toml` files of `pro0` and `pro1` will be ignored, and these modules' outputs will be compiled as `static` and `dynamic` types, respectively.

### "test-dependencies"

This field has the same format as the `dependencies` field. It is used to specify dependencies that are only used during testing, not for building the main project. Module developers should use this field for dependencies that downstream users of this module do not need to be aware of.

Dependencies within `test-dependencies` can only be used in test files named like `xxx_test.cj`. During compilation, these dependencies will not be compiled. The configuration format of `test-dependencies` in `cjpm.toml` is the same as that of `dependencies`.

### "script-dependencies"

This field has the same format as the `dependencies` field. It is used to specify dependencies that are only used in build scripts, not for building the main project. Build script-related features will be detailed in the [Other-Build Scripts](#build-scripts) section.

### "replace"

This field has the same format as the `dependencies` field. It is used to specify replacements for indirect dependencies with the same name. The configured dependencies will be used as the final version when compiling the module.

For example, the module `aaa` depends on a local module `bbb`:

```text
[package]
  name = "aaa"

[dependencies]
  bbb = { path = "path/to/bbb" }
```

When the main module `demo` depends on `aaa`, `bbb` becomes an indirect dependency of `demo`. In this case, if the main module `demo` wants to replace `bbb` with another module of the same name (e.g., the `bbb` module at another path `new/path/to/bbb`), it can be configured as follows:

```text
[package]
  name = "demo"

[dependencies]
  aaa = { path = "path/to/aaa" }

[replace]
  bbb = { path = "new/path/to/bbb" }
```

After configuration, the actual indirect dependency `bbb` used when compiling the `demo` module will be the `bbb` module at `new/path/to/bbb`, and the `bbb` module at `path/to/bbb` configured in `aaa` will not be compiled.

> **Note:**
>
> Only the `replace` field of the entry module takes effect during compilation.

### "ffi.c"

Configuration for external `C` library dependencies of the current Cangjie module. This field configures the information required to depend on the library, including the library name and path.

Developers need to compile the dynamic or static library themselves and place it in the specified `path`. Refer to the example below.

Instructions for calling external `C` dynamic libraries in Cangjie:

- Compile the corresponding `hello.c` file into a `.so` library (execute `clang -shared -fPIC hello.c -o libhello.so` in the file path).
- Modify the project's `cjpm.toml` file to configure the `ffi.c` field, as shown in the example below. Here, `./src/` is the relative path of the compiled `libhello.so` to the current directory, and `hello` is the library name.
- Execute `cjpm build` to compile successfully.

```text
[ffi.c]
hello = { path = "./src/" }
```

### "profile"

`profile` is a command profile configuration item used to control default settings when executing a command. Currently, the following scenarios are supported: `build`, `test`, `bench`, `run`, and `customized-option`.

#### "profile.build"

```text
[profile.build]
lto = "full"  # Whether to enable `LTO` (Link Time Optimization) compilation mode. This feature is only supported on `Linux` platforms.
incremental = true # Whether to enable incremental compilation by default
```

Control items for the compilation process. All fields are optional and will not take effect if not configured. Only the `profile.build` settings of the top-level module take effect.

The `lto` configuration item can be `full` or `thin`, corresponding to two compilation modes supported by `LTO` optimization: `full LTO` merges all compilation modules together for global optimization, offering the greatest optimization potential but requiring longer compilation time; `thin LTO` uses parallel optimization across multiple modules and supports incremental compilation by default, with shorter compilation time than `full LTO` but less optimization potential due to the loss of global information.

#### "profile.test"

```text
[profile.test] # Example usage
parallel=true
filter=*.*
no-color = true
timeout-each = "4m"
random-seed = 10
bench = false
report-path = "reports"
report-format = "xml"
verbose = true
[profile.test.build]
  compile-option = ""
  lto = "thin"
  mock = "on"
[profile.test.env]
MY_ENV = { value = "abc" }
cjHeapSize = { value = "32GB", splice-type = "replace" }
PATH = { value = "/usr/bin", splice-type = "prepend" }
```

Test configuration supports specifying options for compiling and running test cases. All fields are optional and will not take effect if not configured. Only the `profile.test` settings of the top-level module take effect. The option list is consistent with the console execution options provided by `cjpm test`. If an option is configured in both the configuration file and the console, the console option takes precedence over the configuration file option. Runtime options supported by `profile.test`:

- `filter`: Specifies the test case filter. The parameter value type is a string, with the same format as the `--filter` value in the [test command description](#test).
- `timeout-each <value>`: The format of `value` is `%d[millis|s|m|h]`, specifying the default timeout for each test case.
- `parallel`: Specifies the parallel execution scheme for test cases. The `value` can be:
    - `<BOOL>`: `true` or `false`. When set to `true`, test classes can be run in parallel, with the number of parallel processes controlled by the CPU cores on the system.
    - `nCores`: Specifies that the number of parallel test processes should equal the available CPU cores.
    - `NUMBER`: Specifies the number of parallel test processes. The value should be a positive integer.
    - `NUMBERnCores`: Specifies that the number of parallel test processes is a multiple of the available CPU cores. The value should be positive (supports floating-point or integer values).
- `option:<value>`: Works with `@Configure` to define runtime options. For example:
    - `random-seed`: Specifies the value of the random seed. The parameter value type is a positive integer.
    - `no-color`: Specifies whether the execution results should be displayed without color in the console. The value can be `true` or `false`.
    - `report-path`: Specifies the path for generating test execution reports (cannot be configured via `@Configure`).
    - `report-format`: Specifies the report output format. Currently, unit test reports only support `xml` format (case-insensitive). Using other values will throw an exception (cannot be configured via `@Configure`). Performance test reports only support `csv` and `csv-raw` formats.
    - `verbose`: Specifies whether to display detailed compilation process information. The parameter value type is `BOOL` (i.e., `true` or `false`).

#### "profile.test.build"

Used to specify supported compilation options. The list includes:

- `compile-option`: A string containing additional `cjc` compilation options. It supplements the top-level `compile-option` field.
- `lto`: Specifies whether to enable `LTO` optimization compilation mode. The value can be `thin` or `full`. This feature is only supported on `Linux` platforms.
- `mock`: Explicitly sets the `mock` mode. Possible options: `on`, `off`, `runtime-error`. The default value for `test`/`build` subcommands is `on`, and for `bench` subcommands, it is `runtime-error`.

#### "profile.test.env"

Used to configure temporary environment variables when running executable files during the `test` command. The `key` is the name of the environment variable to be configured, with the following configuration items:

- `value`: Specifies the value of the environment variable.
- `splice-type`: Specifies how the environment variable is spliced. This is optional and defaults to `absent` if not configured. Possible values:
    - `absent`: The configuration only takes effect if no environment variable with the same name exists. If a variable with the same name exists, the configuration is ignored.
    - `replace`: The configuration replaces any existing environment variable with the same name.
    - `prepend`: The configuration is prepended to any existing environment variable with the same name.
    - `append`: The configuration is appended to any existing environment variable with the same name.

#### "profile.bench"

```text
[profile.bench] # Example usage
no-color = true
random-seed = 10
report-path = "bench_report"
baseline-path = ""
report-format = "csv"
verbose = true
```

Test configuration supports specifying options for compiling and running test cases. All fields are optional and will not take effect if not configured. Only the `profile.bench` settings of the top-level module take effect. The option list is consistent with the console execution options provided by `cjpm bench`. If an option is configured in both the configuration file and the console, the console option takes precedence over the configuration file option. Runtime options supported by `profile.bench`:

- `filter`: Specifies the test case filter. The parameter value type is a string, with the same format as the `--filter` value in the [bench command description](#bench).
- `option:<value>`: Works with `@Configure` to define runtime options. For example:
    - `random-seed`: Specifies the value of the random seed. The parameter value type is a positive integer.
    - `no-color`: Specifies whether the execution results should be displayed without color in the console. The value can be `true` or `false`.
    - `report-path`: Specifies the path for generating test execution reports (cannot be configured via `@Configure`).
    - `report-format`: Specifies the report output format. Currently, unit test reports only support `xml` format (case-insensitive). Using other values will throw an exception (cannot be configured via `@Configure`). Performance test reports only support `csv` and `csv-raw` formats.
    - `verbose`: Specifies whether to display detailed compilation process information. The parameter value type is `BOOL` (i.e., `true` or `false`).
    - `baseline-path`: The path of an existing report to compare with the current performance results. By default, it uses the `--report-path` value.

#### "profile.bench.build"

Used to specify additional compilation options for building executable files with `cjpm bench`. The configuration is the same as `profile.test.build`.

#### "profile.bench.env"

Supports configuring environment variables when running executable files during the `bench` command. The configuration method is the same as `profile.test.env`.

#### "profile.run"

Options for running executable files. Supports configuring environment variables when running executable files during the `run` command. The configuration method is the same as `profile.test.env`.

#### "profile.customized-option"

```text
[profile.customized-option]
cfg1 = "--cfg=\"feature1=lion, feature2=cat\""
cfg2 = "--cfg=\"feature1=tiger, feature2=dog\""
cfg3 = "-O2"
```

Custom options passed through to `cjc`. Enabled via `--cfg1 --cfg3`. Each module's `customized-option` settings apply to all packages within that module. For example, when executing the command `cjpm build --cfg1 --cfg3`, the options passed to `cjc` will be `--cfg="feature1=lion, feature2=cat" -O2`.

> **Note:**
>
> The conditional value here must be a valid identifier.

### "target"

Multi-backend, multi-platform isolation options used to configure different settings for different backends and platforms. For a `Linux` system, the `target` configuration is as follows:

```text
[target.x86_64-unknown-linux-gnu] # Configuration items for Linux systems
  compile-option = "value1" # Additional compilation command options
  override-compile-option = "value2" # Additional global compilation command options
  link-option = "value3" # Linker passthrough options
  [target.x86_64-unknown-linux-gnu.dependencies] # Source code dependency configuration items
  [target.x86_64-unknown-linux-gnu.test-dependencies] # Test phase dependency configuration items
  [target.x86_64-unknown-linux-gnu.bin-dependencies] # Cangjie binary library dependencies
    path-option = ["./test/pro0", "./test/pro1"]
  [target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
    "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
    "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
    "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"

[target.x86_64-unknown-linux-gnu.debug] # Debug configuration items for Linux systems
  [target.x86_64-unknown-linux-gnu.debug.test-dependencies]

[target.x86_64-unknown-linux-gnu.release] # Release configuration items for Linux systems
  [target.x86_64-unknown-linux-gnu.release.bin-dependencies]
```

Developers can add a series of configuration items for a specific `target` by configuring the `target.target-name` field. The `target` name can be obtained in the corresponding Cangjie environment via the command `cjc -v`. The `Target` item in the- `override-compile-option`: Additional global compilation command options  
- `link-option`: Linker passthrough options  
- `dependencies`: Source code dependency configuration items, with the same structure as the `dependencies` field  
- `test-dependencies`: Test phase dependency configuration items, with the same structure as the `test-dependencies` field  
- `bin-dependencies`: Cangjie binary library dependencies, whose structure is introduced below  
- `compile-macros-for-target`: Macro package control items during cross-compilation. This option does not support distinguishing between `debug` and `release` compilation modes mentioned below.  

Developers can configure the `target.target-name.debug` and `target.target-name.release` fields to specify additional configurations unique to the `debug` and `release` compilation modes for this `target`. The configurable items are the same as above. Items configured in these fields will only apply to the corresponding compilation mode of this `target`.

#### "target.target-name[.debug/release].bin-dependencies"

This field is used to import precompiled Cangjie library output files suitable for the specified `target`. The following example demonstrates importing three packages from the `pro0` and `pro1` modules.

> **Note:**  
>  
> Unless there are special requirements, it is not recommended to use this field. Please use the `dependencies` field introduced above to import module source code.

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

The `path-option` is a string array structure, where each element represents the name of the path to be imported. `cjpm` will automatically import all Cangjie library packages under this path that comply with the rules. Compliance here refers to the format of the library name being the `full package name`. For example, in the above example, `pro0.xoo.cjo` corresponds to a library name that should be `libpro0.xoo.so` or `libpro0.xoo.a`. Packages whose library names do not meet this rule can only be imported via the `package-option`.

Method 2: Import via `package-option`:

```text
[target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
  "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
  "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
  "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"
```

The `package-option` is a `map` structure, where `pro0.xoo` serves as the `key` (in the `toml` configuration file, strings containing `.` must be enclosed in `""` when treated as a whole). The `key` value corresponds to `libpro0.xoo.so`. The path to the frontend file `cjo` serves as the `value`, and the corresponding `.a` or `.so` file for this `cjo` must be placed in the same path.  

> **Note:**  
>  
> If the same package is imported via both `package-option` and `path-option`, the `package-option` field takes higher priority.

The following code example in `main.cj` demonstrates calling the `pro0.xoo`, `pro0.yoo`, and `pro1.zoo` packages.

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
> The dependent Cangjie dynamic library files may be compilation outputs of the `root` package generated by other modules through the `profile.build.combined` configuration, containing symbols for all its sub-packages. Therefore, during dependency checking, if the Cangjie library corresponding to a package cannot be found, the `root` package corresponding to that package will be used as a dependency, and a warning will be printed. Developers must ensure that the `root` package imported in this way is generated via the corresponding method; otherwise, the library file may not contain the symbols of the sub-packages, leading to compilation errors.  
> For example, if the source code imports the `demo.aoo` package via `import demo.aoo`, and the corresponding Cangjie library for this package is not found in the binary dependencies, `cjpm` will attempt to find the dynamic library of the `root` package corresponding to this package, i.e., `libdemo.so`. If found, this library will be used as the dependency.  

#### "target.target-name.compile-macros-for-target"

This field is used to configure the cross-compilation method for macro packages. There are three scenarios:

Method 1: By default, macro packages are only compiled for the local platform during cross-compilation, not for the target platform. This applies to all macro packages in the module.

```text
[target.target-platform]
  compile-macros-for-target = ""
```

Method 2: During cross-compilation, compile for both the local platform and the target platform. This applies to all macro packages in the module.

```text
[target.target-platform]
  compile-macros-for-target = "all" // The configuration item is in string form, and the optional value must be "all".
```

Method 3: Specify that certain macro packages in the module should be compiled for both the local platform and the target platform during cross-compilation. Other unspecified macro packages will follow the default mode of Method 1.

```text
[target.target-platform]
  compile-macros-for-target = ["pkg1", "pkg2"] // The configuration item is in string array form, and the optional values are macro package names.
```

#### "target" Field Merging Rules

Configuration items in `target` may coexist with other options in `cjpm.toml`. For example, the `compile-option` field can also exist in the `package` field, with the difference that the field in `package` applies to all `target`s. `cjpm` merges these duplicate fields in a specific way to combine all applicable configurations. Taking the `debug` compilation mode for `x86_64-unknown-linux-gnu` as an example, the `target` configuration is as follows:

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

When `target` configuration items coexist with public configuration items in `cjpm.toml` or other levels of configuration items for the same `target`, they are merged according to the following priorities:  

1. Configuration for the corresponding `target` in `debug/release` mode  
2. Configuration for the corresponding `target` unrelated to `debug/release`  
3. Public configuration items  

Taking the above `target` configuration as an example, the `target` configuration items are merged according to the following rules:

- `compile-option`: Concatenates all applicable configuration items of the same name according to priority, with higher-priority configurations appended later. In this example, in the `debug` compilation mode for `x86_64-unknown-linux-gnu`, the final effective `compile-option` value is `compile-0 compile-1 compile-2`. In the `release` compilation mode, it is `compile-0 compile-1`, and in other `target`s, it is `compile-0`.  
- `override-compile-option`: Same as above. Since `override-compile-option` has higher priority than `compile-option`, in the final compilation command, the concatenated `override-compile-option` will be placed after the concatenated `compile-option`.  
- `link-option`: Same as above.  
- `dependencies`: Source code dependencies are merged directly. If there are dependency conflicts, an error will be reported. In this example, in the `debug` compilation mode for `x86_64-unknown-linux-gnu`, the final effective `dependencies` are `dep0`, `dep1`, and `dep2`. In the `release` compilation mode, only `dep0` and `dep1` are effective. In other `target`s, only `dep0` is effective.  
- `test-dependencies`: Same as above.  
- `bin-dependencies`: Binary dependencies are merged according to priority. If there are conflicts, only the higher-priority dependencies will be added. For configurations of the same priority, `package-option` configurations are added first. In this example, in the `debug` compilation mode for `x86_64-unknown-linux-gnu`, binary dependencies in `./test/pro1` and `./test/pro2` will be added. In the `release` mode, only `./test/pro1` will be added. Since there are no public configurations for `bin-dependencies`, no binary dependencies will take effect in other `target`s.  

In this example's cross-compilation scenario, if `x86_64-unknown-linux-gnu` is specified as the target `target` on other platforms, the configuration for `target.x86_64-unknown-linux-gnu` will also be merged with public configuration items according to the above rules and applied. If in `debug` compilation mode, the configuration items for `target.x86_64-unknown-linux-gnu.debug` will also be applied.  

### Environment Variable Configuration

In `cjpm.toml`, environment variables can be used to configure field values. `cjpm` will retrieve the corresponding environment variable values from the current runtime environment and substitute them into the actual configuration values. For example, the following `dependencies` field uses an environment variable for path configuration:

```text
[dependencies]
aoo = { path = "${DEPENDENCY_PATH}/aoo" }
```

When reading the module `aoo`, `cjpm` will retrieve the `DEPENDENCY_PATH` variable value and substitute it to obtain the final path for the module `aoo`.

The list of fields that support environment variable configuration is as follows:  

- The following fields in the single-module configuration field `package`:  
    - Single-package compilation option `compile-option` in the single-package configuration item `package-configuration`  
- The following fields in the workspace management field `workspace`:  
    - Member module list `members`  
    - Compilation module list `build-members`  
    - Test module list `test-members`  
- The following fields common to both `package` and `workspace`:  
    - Compilation option `compile-option`  
    - Global compilation option `override-compile-option`  
    - Link option `link-option`  
    - Compilation output storage path `target-dir`  
- The `path` field for local dependencies in the build dependency list `dependencies`  
- The `path` field for local dependencies in the test dependency list `test-dependencies`  
- The `path` field for local dependencies in the build script dependency list `script-dependencies`  
- Custom passthrough option `customized-option` in the command profile configuration item `profile`  
- The `path` field in the external `c` library configuration item `ffi.c`  
- The following fields in the platform isolation option `target`:  
    - Compilation option `compile-option`  
    - Global compilation option `override-compile-option`  
    - Link option `link-option`  
    - The `path` field for local dependencies in the build dependency list `dependencies`  
    - The `path` field for local dependencies in the test dependency list `test-dependencies`  
    - The `path` field for local dependencies in the build script dependency list `script-dependencies`  
    - The `path-option` and `package-option` fields in the binary dependency field `bin-dependencies`  

## Configuration and Cache Folders

The storage path for files downloaded by `cjpm` via `git` can be specified using the `CJPM_CONFIG` environment variable. If not specified, the default location on `Linux/macOS` is `$HOME/.cjpm`, and on `Windows`, it is `%USERPROFILE%/.cjpm`.

## Cangjie Package Management Specification

In the Cangjie package management specification, for a file directory to be recognized as a valid source code package, the following requirements must be met:

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

Here, the `demo.pkg0` directory does not directly contain any Cangjie code, so `demo.pkg0` is not a valid source code package. Although the `demo.pkg0.aoo` and `demo.pkg0.boo` packages directly contain the Cangjie code files `aoo.cj` and `boo.cj`, their upstream package `demo.pkg0` is not a valid source code package, so these two packages are also not valid source code packages.  

When `cjpm` identifies a package like `demo.pkg0` that does not directly contain Cangjie files, it will treat it as a non-source package, ignore all its sub-packages, and print the following warning:

```text
Warning: there is no '.cj' file in directory 'demo/src/pkg0', and its subdirectories will not be scanned as source code
```

Therefore, if developers need to configure a valid source code package, the package must directly contain at least one Cangjie code file, and all its upstream packages must also be valid source code packages. Taking the `demo` project as an example, if `demo.pkg0`, `demo.pkg0.aoo`, and `demo.pkg0.boo` are all to be recognized as valid source code packages, a Cangjie code file can be added to `demo/src/pkg0`, as shown below:  

```text
demo
├── src
│    ├── main.cj
│    └── pkg0
│         ├── pkg0.cj
│         ├── aoo
│         │    └── aoo.cj
│         └── boo
│              └── boo.cj
└── cjpm.toml
```

`demo/src/pkg0/pkg0.cj` must be a Cangjie code file that complies with the package management specification. It may not contain functional code, such as the following form:  

<!-- compile -->  

```cangjie
package demo.pkg0
```

## Command Extension

`cjpm` provides a command extension mechanism. Developers can extend `cjpm` commands through executable files named in the form `cjpm-xxx(.exe)`.

For the executable file `cjpm-xxx` (`cjpm-xxx.exe` on `Windows` systems), if the directory containing this file is configured in the system environment variable `PATH`, the following command can be used to run this executable file:  

```shell
cjpm xxx [args]
```

Here, `args` represents the list of arguments that may need to be passed to `cjpm-xxx(.exe)`. The above command is equivalent to:

```shell
cjpm-xxx(.exe) [args]
```

Running `cjpm-xxx(.exe)` may depend on certain dynamic libraries. In such cases, developers must manually add the directories containing these dynamic libraries to the environment variables.

The following example uses `cjpm-demo`, an executable compiled from the following Cangjie code:

```cangjie
import std.process.*
import std.collection.*

main(): Int64 {
    var args = ArrayList<String>(Process.current.arguments)

    if (args.size < 1) {
        eprintln("Error: failed to get parameters")
        return 1
    }

    println("Output: ${args[0]}")

    return 0
}
```

After adding its directory to `PATH`, running the corresponding command will execute the file and produce the expected output.

```text
Input: cjpm demo hello,world
Output: Output: hello,world
```

The built-in commands of `cjpm` have higher priority, thus they cannot be extended this way. For example, even if an executable named `cjpm-build` exists in the system environment variables, `cjpm build` will not execute that file but instead run `cjpm` with `build` as an argument.

## Build Scripts

`cjpm` provides a build script mechanism that allows developers to define behaviors for `cjpm` before or after executing specific commands.

The build script source file must be named `build.cj` and placed in the root directory of the Cangjie project, at the same level as `cjpm.toml`. When creating a new Cangjie project with the `init` command, `cjpm` does not create `build.cj` by default. Developers who need this functionality can manually create and edit `build.cj` in the specified location using the following template format.

<!-- compile -->

```cangjie
// build.cj

import std.process.*

// Case of pre/post codes for 'cjpm build'.
/* called before `cjpm build`
 * Success: return 0
 * Error: return any number except 0
 */
// func stagePreBuild(): Int64 {
//     // process before "cjpm build"
//     0
// }

/*
 * called after `cjpm build`
 */
// func stagePostBuild(): Int64 {
//     // process after "cjpm build"
//     0
// }

// Case of pre codes for 'cjpm clean'.
/* called before `cjpm clean`
 * Success: return 0
 * Error: return any number except 0
 */
// func stagePreClean(): Int64 {
//     // process before "cjpm clean"
//     0
// }

// For other options, define stagePreXXX and stagePostXXX in the same way.

/*
 * Error code:
 * 0: success.
 * other: cjpm will finish running command. Check target-dir/build-script-cache/module-name/script-log for error outputs defind by user in functions.
 */

main(): Int64 {
    match (Process.current.arguments[0]) {
        // Add operation here with format: "pre-"/"post-" + optionName
        // case "pre-build" => stagePreBuild()
        // case "post-build" => stagePostBuild()
        // case "pre-clean" => stagePreClean()
        case _ => 0
    }
}
```

`cjpm` supports defining pre- and post-command behaviors for a series of commands using build scripts. For example, for the `build` command, you can define `pre-build` in the `match` block within the `main` function to execute the desired functionality before the `build` command (the function name is arbitrary). Post-command behaviors can be similarly defined by adding a `post-build` case. Other commands follow the same pattern by adding corresponding `pre/post` options and their associated functions.

After defining pre- and post-command behaviors, `cjpm` will first compile `build.cj` when executing the command and then execute the corresponding behaviors. For example, with `pre-build` and `post-build` defined, running `cjpm build` follows these steps:

1. Compile `build.cj` before the build process.
2. Execute the `pre-build` function.
3. Run the `cjpm build` compilation process.
4. After successful compilation, `cjpm` executes the `post-build` function.

The following commands support build scripts:

- `build`, `test`, `bench`: Support both `pre` and `post` processes defined in dependent modules' build scripts.
- `run`, `install`: Only support running the current module's `pre` and `post` build script processes or executing dependent modules' `pre-build` and `post-build` processes during compilation.
- `check`, `tree`, `update`: Only support running the current module's `pre` and `post` build script processes.
- `clean`: Only supports running the current module's `pre` build script process.

When executing these commands with the `--skip-script` option, all build script compilation and execution (including dependent modules' build scripts) will be skipped.

Usage notes for build scripts:

- Function return values must meet specific requirements: return `0` on success and any other `Int64` value on failure.
- All outputs from `build.cj` are redirected to the project directory at `build-script-cache/[target|release]/[module-name]/bin/script-log`. Developers can check outputs added in functions here.
- If `build.cj` does not exist in the root directory, `cjpm` executes normally. If `build.cj` exists and defines pre/post behaviors for a command, the command will abort if `build.cj` compilation fails or the function returns a non-zero value, even if the command itself would succeed.
- In multi-module scenarios, dependent modules' `build.cj` scripts take effect during compilation and unit testing. Outputs from dependent modules' build scripts are also redirected to log files under `build-script-cache/[target|release]` in the corresponding module directory.

For example, the following `build.cj` script defines pre- and post-build behaviors:

<!-- compile -->

```cangjie
import std.process.*

func stagePreBuild(): Int64 {
    println("PRE-BUILD")
    0
}

func stagePostBuild(): Int64 {
    println("POST-BUILD")
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case "post-build" => stagePostBuild()
        case _ => 0
    }
}
```

When executing `cjpm build`, `cjpm` will run `stagePreBuild` and `stagePostBuild`. After completion, the `script-log` file will contain:

```text
PRE-BUILD
POST-BUILD
```

Build scripts can import dependency modules via the `script-dependencies` field in `cjpm.toml`, formatted the same as `dependencies`. For example, with the following `cjpm.toml` configuration importing module `aoo`, which contains a method `aaa()`:

```text
[script-dependencies]
aoo = { path = "./aoo" }
```

You can import this dependency in the build script and use the `aaa()` method:

<!-- only-cjpm -->

```cangjie
import std.process.*
import aoo.*

func stagePreBuild(): Int64 {
    aaa()
    0
}

func stagePostBuild(): Int64 {
    println("POST-BUILD")
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case "post-build" => stagePostBuild()
        case _ => 0
    }
}
```

Build script dependencies (`script-dependencies`) are independent of source code dependencies (`dependencies` and `test-dependencies`). Source and test code cannot use modules from `script-dependencies`, and build scripts cannot use modules from `dependencies` or `test-dependencies`. To use the same module in both build scripts and source/test code, configure it in both `script-dependencies` and `dependencies/test-dependencies`.

## Usage Examples

The following example demonstrates `cjpm` usage with a Cangjie project directory structure. The corresponding source code files can be found in [Source Code](#example-source-code). The module name is `test`.

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

### init and build Usage

- Create a new Cangjie project and write source code files (e.g., `koo` package and `main.cj` as shown in the structure).

    ```shell
    cjpm init --name test --path .../cj_project
    mkdir koo
    ```

    This automatically generates the `src` folder and a default `cjpm.toml` configuration file.

- When the current module depends on an external `pro0` module, create the `pro0` module and its configuration file, then write its source files. Manually create the `src` folder under `pro0`, and place the root package `pro0.cj` and other packages (e.g., `zoo`) under `src`.

    ```shell
    mkdir pro0 && cd pro0
    cjpm init --name pro0 --type=static
    mkdir src/zoo
    ```

- When the main module depends on `pro0`, configure the `dependencies` field in the main module's `cjpm.toml`. After correct configuration, run `cjpm build`. The executable is generated under `target/release/bin/`.

    ```shell
    cd cj_project
    vim cjpm.toml
    cjpm build
    cjpm run
    ```

### test and clean Usage

- After writing unit test files (e.g., `xxx_test.cj` as shown in the structure), run unit tests with the following command. Outputs are generated under `target/release/unittest_bin`.

    ```shell
    cjpm test
    ```

    Or:

    ```shell
    cjpm test src src/koo pro0/src/zoo
    ```

- To manually remove intermediate files like `target`, run:

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
<!-- cfg="-p pro0 --output-type=staticlib" -->

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

import std.unittest.* // test framework
import std.unittest.testmacro.* // macro definition

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