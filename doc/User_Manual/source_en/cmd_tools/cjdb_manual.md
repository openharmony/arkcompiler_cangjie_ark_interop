# Debugging Tool

CJDB is a command-line debugging tool for Cangjie programs, developed based on `lldb`. The current `cjdb` tool is adapted and evolved from the [llvm15.0.4](https://github.com/llvm/llvm-project/releases/tag/llvmorg-15.0.4) foundation, providing Cangjie developers with program debugging capabilities.

## Obtaining the `cjdb` Tool

### Acquisition Method

Obtain it through the `Cangjie` `SDK` at the daily build path.

The path of the `cjdb` tool in the `SDK`: `cangjie\tools\bin`.

### Usage Example

The following demonstrates usage on the `Windows` platform:

   Extract and directly run `cjdb.exe` in the tool's path `cangjie\tools\bin`.

> **Note:**
>
> Description of `system` parameter values:
>
> | system parameter value | Description                    |
> | ---------------------- | ----------------------------- |
> | windows                | Tool for Windows platform     |
> | linux                  | Tool for Linux platform       |
> | darwin                 | Tool for macOS platform       |
>
> **Attention**
>
> Ensure that the compiler used to build the ELF file or application to be debugged is from the same toolchain version as the `cjdb` debugger tool.

## `cjdb` Commands

> **Note:**
>
> For more commands, execute `help` in the command-line window:
>
> ```text
> (cjdb) help
> Debugger commands:
>   apropos           -- List debugger commands related to a word or subject.
>   breakpoint        -- Commands for operating on breakpoints (see 'help b' for shorthand.)
>   cjthread          -- Commands for operating on one or more cjthread in the current process.
>   command           -- Commands for managing custom LLDB commands.
>   disassemble       -- Disassemble specified instructions in the current target.  Defaults to the current function for the current thread and stack frame.
>   expression        -- Evaluate an expression on the current thread.  Displays any returned value with LLDB's default formatting.
>   frame             -- Commands for selecting and examing the current thread's stack frames.
> ...
> ```
>

### Logging

To facilitate issue localization, use the `log <subcommand> [<command-options>]` command to record `cjdb` logs.

- `help log` to view `log` command help

  ```text
  (cjdb) help log
  Commands controlling LLDB internal logging.
  Syntax: log <subcommand> [<command-options>]
  The following subcommands are supported:
        disable -- Disable one or more log channel categories.
        enable  -- Enable logging for a single log channel.
        list    -- List the log categories for one or more log channels.  If none specified, lists them all.
        timers  -- Enable, disable, dump, and reset LLDB internal performance timers.
  For more help on any particular subcommand, type 'help <command> <subcommand>'.
  ```

- `log list` to view supported log list

  ```text
  (cjdb) log list
  ```

  Other commands can be explored using the `help` command.

### Platform

Commands in `cjdb` for managing and creating platforms include `platform [connect|disconnect|info|list|status|select] ...`

- View `platform` help information on `windows` platform.

  ```text
  (cjdb) help platform
  Commands to manage and create platforms.
  Syntax: platform [connect|disconnect|info|list|status|select] ...
  The following subcommands are supported:
        connect        -- Select the current platform by providing a connection URL.
        disconnect     -- Disconnect from the current platform.
        file           -- Commands to access files on the current platform.
        get-file       -- Transfer a file from the remote end to the local host.
        get-size       -- Get the file size from the remote end.
        list           -- List all platforms that are available.
        mkdir          -- Make a new directory on the remote end.
        process        -- Commands to query, launch and attach to processes on the current platform.
        put-file       -- Transfer a file from this system to the remote end.
        select         -- Create a platform if needed and select it as the current platform.
        settings       -- Set settings for the current target's platform, or for a platform by name.
        shell          -- Run a shell command on the current platform.  Expects 'raw' input (see 'help raw-input'.)
        status         -- Display status for the current platform.
        target-install -- Install a target (bundle or executable file) to the remote end.
  For more help on any particular subcommand, type 'help <command> <subcommand>'.
  (cjdb)
  ```

### Functions

#### Stepping Over or Into Functions with Debug Information

Use `thread step-over <cmd-options> [<thread-id>]` (`thread step-over` can be abbreviated as `next` or `n`) to step over functions, executing the next line of code directly.

```text
(cjdb) n
Process 2884 stopped
* thread #1, name = 'test', stop reason = step over
    frame #0: 0x0000000000401498 test`default.main() at test.cj:5:7
   2    main(): Int64 {
   3
   4       var a : Int32 = 12
-> 5       a = a + 23
   6       a = test(10, 34)
   7       return 1
   8    }
(cjdb)
```

When debugging with `cjdb`, use `thread step-in <cmd-options> [<thread-id>]` (`thread step-in` can be abbreviated as `step` or `s`) to step into functions (functions must have debug information).

```text
(cjdb) n
Process 5240 stopped
* thread #1, name = 'test', stop reason = step over
    frame #0: 0x00000000004014d8 test`default.main() at test.cj:6:7
   3
   4      var a : Int32 = 12
   5      a = a + 23
-> 6      a = test(10, 34)
   7      return 1
   8    }
   9
(cjdb) s
Process 5240 stopped
* thread #1, name = 'test', stop reason = step in
    frame #0: 0x0000000000401547 test`default.test(a=10, b=34) at test.cj:12:10
   9
   10   func test(a : Int32, b : Int32) : Int32 {
   11
-> 12     return a + b
   13   }
   14
(cjdb)
```

#### Exiting the Current Function

Execute the `finish` command to exit the current function and return to the previous call stack function.

```text
(cjdb) s
Process 5240 stopped
* thread #1, name = 'test', stop reason = step in
    frame #0: 0x0000000000401547 test`default.test(a=10, b=34) at test.cj:12:10
   9
   10   func test(a : Int32, b : Int32) : Int32 {
   11
-> 12     return a + b
   13   }
   14
(cjdb) finish
Process 5240 stopped
* thread #1, name = 'test', stop reason = step out

Return value: (int) $0 = 44

    frame #0: 0x00000000004014dd test`default.main() at test.cj:6:7
   3
   4      var a : Int32 = 12
   5      a = a + 23
-> 6      a = test(10, 34)
   7      return 1
   8    }
   9
(cjdb)
```

### Breakpoints

#### Setting Source Code Breakpoints

```text
breakpoint set --file test.cj --line line_number
```

`--line` specifies the line number.

`--file` specifies the file.

For single files, only the line number is needed. For multiple files, the filename must be included.

`b test.cj:4` is shorthand for `breakpoint set --file test.cj --line 4`.

Example: **breakpoint set --line 2**

```text
(cjdb) b 2
Breakpoint 1: where = test`default.main() + 13 at test.cj:4:3, address = 0x0000000000401491
(cjdb) b test.cj : 4
Breakpoint 2: where = test`default.main() + 13 at test.cj:4:3, address = 0x0000000000401491
(cjdb)
```

#### Setting Function Breakpoints

```text
breakpoint set --name function_name
```

`--name` specifies the function name for the breakpoint.

`b test` is shorthand for `breakpoint set --name test`.

Example: **breakpoint set --name test**

```text
(cjdb) b test
Breakpoint 3: where = test`default.test(int, int) + 19 at test.cj:12:10, address = 0x0000000000401547
(cjdb)
```

#### Setting Conditional Breakpoints

```text
breakpoint set --file xx.cj --line line_number --condition expression
```

`--file` specifies the file.

`--line` specifies the line number.

`--condition` specifies the condition.

Example: **breakpoint set --file test.cj --line 4 --condition a==12**

```text
(cjdb) breakpoint set --file test.cj --line 4 --condition a==12
Breakpoint 2: where = main`default::main() + 60 at test.cj:4:9, address = 0x00005555555b62d0
(cjdb) c
Process 3128551 resuming
Process 3128551 stopped
* thread #1, name = 'schmon', stop reason = breakpoint 2.1
    frame #0: 0x00005555555b62d0 main`default::main() at test.cj:4:9
   1    main(): Int64 {
   2
   3        var a : Int32 = 12
-> 4        a = a + 23
   5        return 1
   6    }
```

#### Continuing Execution Until Next Breakpoint

```text
(cjdb) c
Process 2884 resuming
Process 2884 stopped
* thread #1, name = 'test', stop reason = breakpoint 3.1
    frame #0: 0x0000000000401547 test`default.test(a=10, b=34) at test.cj:12:10
   9
   10   func test(a : Int32, b : Int32) : Int32 {
   11
-> 12     return a + b
   13   }
   14
(cjdb)
```

### Watchpoints

```text
watchpoint set variable -w read variable_name
```

`-w` specifies the watchpoint type: `read`, `write`, or `read_write`.

`wa s v` is shorthand for `watchpoint set variable`.

Example: **watchpoint set variable -w read a**

```text
(cjdb) wa s v -w read a
Watchpoint created: Watchpoint 1: addr = 0x7fffddffed70 size = 8 state = enabled type = r
    declare @ 'test.cj:27'
    watchpoint spec = 'a'
    new value: 10
(cjdb)
```

Watchpoints can only be set on basic types. On `Windows`, programs with watchpoint conditions will pause at most once.

### Expression Evaluation

In `cjdb`, use `expression <cmd-options> -- <expr>` (`expression` can be abbreviated as `expr`) for expression evaluation.

- View literals

Example: **expr 3**

```text
(cjdb) expr 3
(Int64) $0 = 3
(cjdb)
```

- View variable names

Example: **expr a**

```text
(cjdb) expr a
(Int64) $0 = 3
(cjdb)
```

- View arithmetic expressions

Example: **expr a + b**

```text
(cjdb) expr a + b
(Int64) $0 = 3
(cjdb)
```

- View relational expressions

Example: **expr a > b**

```text
(cjdb) expr a > b
(Bool) $0 = false
(cjdb)
```

- View logical expressions

Example: **expr a && b**

```text
(cjdb) expr true && false
(Bool) $0 = false
(cjdb)
```

- View postfix expressions

Example: **expr a.b**

```text
(cjdb) expr value.member
(Int64) $0 = 1
(cjdb)
```

Example: **expr a[b]**

```text
(cjdb) expr array[2]
(Int64) $0 = 3
(cjdb)
```

- View generic instantiation variables

Example: **expr a**

```text
(cjdb) expr a
(default.A<Int32>) $0 = {
  member = 1
}
(cjdb)
```

Supported expression evaluations include but are not limited to: literals, variable names, parenthesized expressions, arithmetic expressions, relational expressions, conditional expressions, loop expressions, member access expressions, index access expressions, range expressions, bitwise expressions, generic instantiation variables, etc.

> **Note:**
>
> Unsupported expression evaluations: function calls with named parameters, interoperability, extensions, properties, aliases, interpolated strings, function names. The `Windows` platform does not support the Float16 type and does not support exception throwing.

### Variable Inspection

- View local variables: `locals`

```text
(cjdb) locals
(Int32) a = 12
(Int64) b = 68
(Int32) c = 13
(Array<Int64>) array = {
  [0] = 2
  [1] = 4
  [2] = 6
}
(pkgs.Rec) newR2 = {
  age = 5
  name = "string"
}
(cjdb)
```

When the debugger stops at a certain point in the program, `locals` displays all local variables within the current function's lifecycle scope. Only correctly initialized variables at the current position can be viewed; uninitialized variables cannot be correctly displayed.

- View a single variable: `print variable_name`

Example: **print b**

```text
(cjdb) print b
(Int64) $0 = 110
(cjdb)
```

Use the `print` command (abbreviated `p`) followed by the variable name to view specific variables.

- View String type variables

```text
(cjdb) print newR2.name
(String) $0 = "string"
(cjdb)
```

- View struct and class type variables

```text
(cjdb) print newR2
(pkgs.Rec) $0 = {
  age = 5
  name = "string"
}
(cjdb)
```

- View arrays

```text
(cjdb) print array
(Array<Int64>) $0 = {
  [0] = 2
  [1] = 4
  [2] = 6
  [3] = 8
}
(cjdb) print array[1..3]
(Array<Int64>) $1 = {
  [1] = 4
  [2] = 6
}
(cjdb)
```

Supports viewing basic types (Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64, Float16, Float32, Float64, Bool, Unit, Rune).

Supports range viewing. The interval `[start..end)` is a left-closed, right-open interval. Reverse order is not currently supported.

For illegal intervals or non-array types, an error message will be displayed.

```text
(cjdb) print array
(Array<Int64>) $0 = {
  [0] = 0
  [1] = 1
}
(cjdb) print array[1..3]
error: unsupported expression
(cjdb) print array[0][0]
error: unsupported expression
```

- View CString type variables

```text
(cjdb) p cstr
(cro.CString) $0 = "abc"
(cjdb) p cstr
(cro.CString) $1 = null
```

- View global variables: `globals`

```text
(cjdb) globals
(Int64) pkgs.Rec.g_age = 100
(Int64) pkgs.g_var = 123
(cjdb)
```

When using the `print` command to view a single global variable, `print` + package name + variable name is not supported. Only `print` + variable name is supported. For example, to view the global variable `g_age`, use the following command:

```text
(cjdb) p g_age
(Int64) $0 = 100
(cjdb)
```

- Variable modification

```text
(cjdb) set a=30
(Int32) $4 = 30
(cjdb)
```

Use `set` to modify the value of a local variable. Only basic numeric types are supported (Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64, Float32, Float64).

For `Bool` type variables, use 0 (false) and non-zero (true) values for modification. For `Rune` type variables, use the corresponding `ASCII` code for modification.

```text
(cjdb) set b = 0
(Bool) $0 = false
(cjdb) set b = 1
(Bool) $1 = true
(cjdb) set c = 0x41
(Rune) $2 = 'A'
(cjdb)
```

If the modified value is non-numeric or exceeds the variable's range, an error message will be displayed.

```text
(cjdb) p c
(Rune) $0 = 'A'
(cjdb) set c = 'B'
error: unsupported expression
(cjdb## Executable File Debugging

### Launch Method

There are two loading methods for the launch approach, as follows:

1. Load the debuggee program while starting the debugger.

    ```text
    ~/0901/cangjie_test$ cjdb test
    (cjdb) target create "test"
    Current executable set to '/0901/cangjie-linux-x86_64-release/bin/test' (x86_64).
    (cjdb)
    ```

2. Start the debugger first, then load the debuggee program using the `file` command.

    ```text
    ~/0901/cangjie_test$ cjdb
    (cjdb) file test
    Current executable set to '/0901/cangjie/test' (x86_64).
    (cjdb)
    ```

### Attach Method

Debugging the debuggee program via attach method

For running programs, the attach method is supported for debugging, as shown below:

```text
~/0901/cangjie-linux-x86_64-release/bin$ cjdb
(cjdb) attach 15325
Process 15325 stopped
* thread #1, name = 'test', stop reason = signal SIGSTOP
    frame #0: 0x00000000004014cd test`default.main() at test.cj:7:9
   4      var a : Int32 = 12
   5      a = a + 23
   6      while (true) {
-> 7        a = 1
   8      }
   9      a = test(10, 34)
   10     return 1
  thread #2, name = 'FinalProcessor', stop reason = signal SIGSTOP
    frame #0: 0x00007f48c12fc065 libpthread.so.0`__pthread_cond_timedwait at futex-internal.h:205
  thread #3, name = 'PoolGC_1', stop reason = signal SIGSTOP
    frame #0: 0x00007f48c12fbad3 libpthread.so.0`__pthread_cond_wait at futex-internal.h:88
  thread #4, name = 'MainGC', stop reason = signal SIGSTOP
    frame #0: 0x00007f48c12fc065 libpthread.so.0`__pthread_cond_timedwait at futex-internal.h:205
  thread #5, name = 'schmon', stop reason = signal SIGSTOP
    frame #0: 0x00007f48c0fe17a0 libc.so.6`__GI___nanosleep(requested_time=0x00007f48a8ffcb70, remaining=0x0000000000000000) at nanosleep.c:28

Executable module set to "/0901/cangjie-linux-x86_64-release/bin/test".
Architecture set to: x86_64-unknown-linux-gnu.
```

## Notes

1. The program being debugged must be a compiled `debug` version, such as a program file compiled using the following command:

    ```shell
    cjc -g test.cj -o test
    ```

2. When a developer defines a generic object and steps into its `init` function during debugging, the stack information will display the function name containing two package names: one for the package where the generic object is instantiated, and another for the package where the generic is defined.

    ```text
    * thread #1, name = 'main', stop reason = step in
        frame #0: 0x0000000000404057 main`default.p1.Pair<String, Int64>.init(a="hello", b=0) at a.cj:21:9
       18       let x: T
       19       let y: U
       20       public init(a: T, b: U) {
    -> 21           x = a
       22           y = b
       23       }
    ```

3. For displaying `Enum` types, if the constructor of the `Enum` has parameters, it will be displayed as follows:

    <!-- only-cjdb -->

    ```cangjie
    enum E {
        Ctor(Int64, String) | Ctor
    }

    main() {
        var temp = E.Ctor(10, "String")
        0
    }

    ========================================
    (cjdb) p temp
    (E) $0 = Ctor {
      arg_1 = 10
      arg_2 = "String"
    }
    ```

    Here, `arg_x` is not a printable member variable; the `Enum` does not actually have member variables named `arg_x`.

4. The Cangjie `cjdb` is built on `lldb` and thus supports native `lldb` basic functionalities. For details, refer to the [lldb official documentation](https://lldb.llvm.org).

5. If developers run the program in a system environment higher than the specified version, compatibility issues and risks may arise, such as in C language interoperability scenarios where cjdb cannot properly parse C code file and line number information.

    ```cffi.c
    int32_t cfoo()
    {
        printf("cfoo\n");
        return 0;
    }
    ```

    ```test.cj
    foreign func cfoo(): Int32
    unsafe main() {
        cfoo()
    }
    ```

    ```shell
    // step 1: Compile the C file using the system's native clang version to generate a dylib
    clang -g -shared cffi.c -o libcffi.dylib
    // step 2: Compile the cj file using cjc and link the C language dynamic library
    cjc -g test.cj -L. -lcffi -o test
    // step 3: Debug the test file using cjdb; debugging C code fails due to incompatible debugging information
    cjdb test
    ```

    ```text
    (cjdb) target create "test"
    Current executable set to 'test' (x86_64).
    (cjdb) b cfoo
    Breakpoint 1: where = libcffi.dylib`cfoo + 4, address = 0x0000000000000f84
    (cjdb) r
    Process 3133 launched: 'test' (x86_64)
    Process 3133 stopped
    * thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
        frame #0: 0x00000001000a6f84 libcffi.dylib`cfoo
      1    foreign func cfoo(): Int32
      2    unsafe main() {
      3        cfoo()
    -> 4    }
    ```

## FAQ

1. `docker` environment reports `error: process launch failed: 'A' packet returned an error: 8` when using cjdb.

    ```text
    root@xxx:/home/cj/cangjie-example#cjdb ./hello
    (cjdb) target create "./hello"
    Current executable set to '/home/cj/cangjie-example/hello' (x86_64).
    (cjdb) b main
    Breakpoint 1: 2 locations.
    (cjdb) r
    error: process launch failed: 'A' packet returned an error: 8
    (cjdb)
    ```

    Cause: The `docker` container was created without enabling SYS_PTRACE permissions.

    Solution: Add the following options when creating a new container and delete any existing containers.

    ```shell
    docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined
    ```

2. cjdb reports `stop reason = signal XXX`.

    ```text
    Process 32491 stopped
    * thread #2, name = 'PoolGC_1', stop reason = signal SIGABRT
        frame #0: 0x00007ffff450bfb7 lib.so.6`__GI_raise(sig=2) at raise.c:51
    ```

    Cause: The program continuously generates `SIGABRT` signals, triggering the debugger to pause.

    Solution: Execute the following command to mask such signals.

    ```text
    (cjdb) process handle --pass true --stop false --notify true SIGBUS
    NAME         PASS   STOP   NOTIFY
    ===========  =====  =====  ======
    SIGBUS       true   false  true
    (cjdb)
    ```

3. cjdb does not capture `SIGSEGV` signals.

    Cause: cjdb is configured by default not to capture `SIGSEGV` signals upon startup.

    Solution: If developers need to capture this signal during debugging, they can reset it using the following command.

    ```text
    (cjdb)process handle -p true -s true -n true SIGSEGV
    NAME         PASS   STOP   NOTIFY
    ===========  =====  =====  ======
    SIGSEGV      true   true   true
    (cjdb)
    ```

4. cjdb cannot enter `catch` blocks via `next/s` debugging commands.

    Cause: Cangjie uses the `LandingPad` mechanism for exception handling, which cannot explicitly determine which `catch` block will capture an exception thrown in a `try` block via control flow, thus making the executed code unclear. A similar issue exists in `clang++`.

    Solution: Developers can set breakpoints in `catch` blocks if they need to debug the code within them.

    ```text
    (cjdb) b 31
    Breakpoint 2: where = main`default::test(Int64) + 299 at a.cj:31:18, address = 0x000055555557caff
    (cjdb) n
    Process 1761640 stopped
    * thread #1, name = 'schmon', stop reason = breakpoint 2.1
        frame #0: 0x000055555557caff main`default::test(a=0) at a.cj:31:18
      28      s = 12/a
      29    } catch (e:Exception) {
      30
    ->31     error_result = e.toString()
      32     println(error_result)
      33    }
      34    s
    (cjdb)
    ```

5. Expression evaluation on `macOS` platform reports `Expression can't be run, because there is no JIT compiled function`.

    Cause: Expressions are not supported on the `macOS` platform.

6. Expression evaluation on `macOS` platform for `aarch64` architecture reports `Connection shut down by remote side while waiting for reply to initial handshake packet` in some environments.

    Cause: Some systems cause the debugging service to exit abnormally.

    Solution: Delete the `third_party/llvm/bin/debugserver` file and restart debugging.

7. When setting breakpoints during debugging, if the breakpoint involves generic type parameters, the parameter names will be displayed as T0, T1, ... Tn. Example:

    <!-- only-cjdb -->

    ```cangjie
    func global_func_02<K, G>() { 0 }
    public struct Pair<T, U> {
        let x: T
        let y: U
        public init(a: T, b: U) {
            x = a
            y = b
        }
    }
    main() {
        var a: Pair<String, Int64> = Pair<String, Int64>("hello", 0)
        global_func_02<Int64, String>()
        0
    }

    ========================================
    (cjdb) b 1
    Breakpoint 1: where = main`default::global_func_02<T0,T1>() + 9 at test.cj:1:33, address = 0x0000000000019989
    (cjdb) b 6
    Breakpoint 2: where = main`default::Pair<T0,T1>::init(T0, T1) + 150 at test.cj:6:9, address = 0x000000000001982a
    ```

   Cause: Cangjie ensures ABI compatibility for generic type parameters, meaning that the symbol names in the binary symbol table remain unchanged even if the developer-side generic type parameters change.

   Solution: Modify the generic type parameter names written by developers to T0, T1, ... Tn.