# Cangjie-C Interoperability

To maintain compatibility with existing ecosystems, Cangjie supports calling C functions and also allows C to call Cangjie functions.

## Calling C Functions from Cangjie

To call a C function in Cangjie, the function must be declared in Cangjie using the `@C` and `foreign` keywords. However, the `@C` modifier can be omitted when used with `foreign` declarations.

For example, to call the C functions `rand` and `printf`, whose signatures are as follows:

```c
// stdlib.h
int rand();

// stdio.h
int printf(const char *fmt, ...);
```

The corresponding declarations and usage in Cangjie would be:

<!-- run -->

```cangjie
// Declare the function using the `foreign` keyword, omitting `@C`
foreign func rand(): Int32
foreign func printf(fmt: CString, ...): Int32

main() {
    // Call the function within an `unsafe` block
    let r = unsafe { rand() }
    println("random number ${r}")
    unsafe {
        var fmt = LibC.mallocCString("Hello, No.%d\n")
        printf(fmt, 1)
        LibC.free(fmt)
    }
}
```

Key points to note:

1. The `foreign` modifier indicates an external function. Functions marked with `foreign` can only be declared, not implemented.
2. Parameters and return types in `foreign` declarations must conform to the type mapping between C and Cangjie. For details, see [Type Mapping](./cangjie-c.md#type-mapping).
3. Since C functions may involve unsafe operations, calls to `foreign` functions must be wrapped in an `unsafe` block; otherwise, a compilation error will occur.
4. The `@C` modifier can only be used with `foreign` function declarations. Using it with other declarations will cause a compilation error.
5. `@C` can only modify `foreign` functions, non-generic functions in the top-level scope, and `struct` types.
6. `foreign` functions do not support named parameters or default values. Variadic parameters are allowed using `...` and must be the last in the parameter list. Variadic parameters must satisfy the `CType` constraint but need not be of the same type.
7. Although Cangjie (CJNative backend) provides stack expansion capabilities, Cangjie cannot perceive the actual stack usage of C functions. Therefore, FFI calls into C functions still carry the risk of stack overflow (which may cause runtime crashes or unexpected behavior). Developers should adjust the `cjStackSize` configuration based on actual needs.

Examples of invalid `foreign` declarations:

<!-- compile.error -->

```cangjie
foreign func rand(): Int32 { // compiler error
    return 0
}
@C
foreign var a: Int32 = 0 // compiler error
@C
foreign class A{} // compiler error
@C
foreign interface B{} // compiler error
```

## CFunc

In Cangjie, `CFunc` refers to functions that can be called by C code. There are three forms:

1. `foreign` functions modified with `@C`
2. Cangjie functions modified with `@C`
3. `lambda` expressions of type `CFunc`. Unlike regular lambda expressions, `CFunc lambda` cannot capture variables.

<!-- run -->

```cangjie
// Case 1
foreign func free(ptr: CPointer<Int8>): Unit

// Case 2
@C
func callableInC(ptr: CPointer<Int8>) {
    print("This function is defined in Cangjie.")
}

// Case 3
let f1: CFunc<(CPointer<Int8>) -> Unit> = { ptr =>
    print("This function is defined with CFunc lambda.")
}
```

All three forms declare/define functions of type `CFunc<(CPointer<Int8>) -> Unit>`. `CFunc` corresponds to C's function pointer type. This is a generic type where the generic parameter represents the `CFunc`'s parameter and return types. Example usage:

<!-- run -->

```cangjie
foreign func atexit(cb: CFunc<() -> Unit>): Int32
```

Like `foreign` functions, other forms of `CFunc` must satisfy the `CType` constraint for parameters and return types and do not support named parameters or default values.

When calling a `CFunc` in Cangjie code, it must be within an `unsafe` context.

Cangjie allows converting a `CPointer<T>` variable to a specific `CFunc`, where the generic parameter `T` of `CPointer` can be any type satisfying the `CType` constraint. Example:

<!-- compile -->

```cangjie
main() {
    var ptr = CPointer<Int8>()
    var f = CFunc<() -> Unit>(ptr)
    unsafe { f() } // core dumped when running, because the pointer is nullptr.
}
```

> **Note:**
>
> Converting a pointer to a `CFunc` and calling it is dangerous. Users must ensure the pointer points to a valid function address; otherwise, a runtime error will occur.

## inout Parameters

When calling a `CFunc` in Cangjie, arguments can be modified with the `inout` keyword to form a pass-by-reference expression. The type of such an expression is `CPointer<T>`, where `T` is the type of the `inout`-modified expression.

Pass-by-reference expressions have the following constraints:

- Can only be used in calls to `CFunc`.
- The modified object's type must satisfy the `CType` constraint but cannot be `CString`.
- The modified object cannot be defined with `let`, nor can it be a literal, input parameter, or other temporary variable.
- Pointers passed to C via pass-by-reference expressions are only guaranteed to be valid during the function call. C code should not save such pointers for later use.

Variables modified with `inout` can be top-level variables, local variables, or `struct` member variables but cannot be derived directly or indirectly from `class` instance member variables.

Example:

<!-- compile.error -->

```cangjie
foreign func foo1(ptr: CPointer<Int32>): Unit

@C
func foo2(ptr: CPointer<Int32>): Unit {
    let n = unsafe { ptr.read() }
    println("*ptr = ${n}")
}

let foo3: CFunc<(CPointer<Int32>) -> Unit> = { ptr =>
    let n = unsafe { ptr.read() }
    println("*ptr = ${n}")
}

struct Data {
    var n: Int32 = 0
}

class A {
    var data = Data()
}

main() {
    var n: Int32 = 0
    unsafe {
        foo1(inout n)  // OK
        foo2(inout n)  // OK
        foo3(inout n)  // OK
    }
    var data = Data()
    var a = A()
    unsafe {
        foo1(inout data.n)   // OK
        foo1(inout a.data.n) // Error, n is derived indirectly from instance member variables of class A
    }
}
```

> **Note:**
>
> When using macro expansion features, the `inout` parameter feature cannot be used in macro definitions for now.

## unsafe

Interoperability with C introduces many unsafe factors. The `unsafe` keyword in Cangjie is used to mark unsafe behaviors in cross-C calls.

Key points about the `unsafe` keyword:

- `unsafe` can modify functions, expressions, or a scope.
- Functions modified with `@C` must be called within an `unsafe` context.
- Calls to `CFunc` must occur within an `unsafe` context.
- Calls to `foreign` functions in Cangjie must be within an `unsafe` context.
- When a called function is modified with `unsafe`, the call site must be within an `unsafe` context.

Example usage:

<!-- run -->

```cangjie
foreign func rand(): Int32

@C
func foo(): Unit {
    println("foo")
}

var foo1: CFunc<() -> Unit> = { =>
    println("foo1")
}

main(): Int64 {
    unsafe {
        rand()           // Call foreign func.
        foo()            // Call @C func.
        foo1()           // Call CFunc var.
    }
    0
}
```

Note that regular `lambda` expressions cannot propagate the `unsafe` attribute. If an `unsafe` `lambda` escapes, it can be called outside an `unsafe` context without causing a compilation error. When calling `unsafe` functions within a `lambda`, it is recommended to do so within an `unsafe` block:

<!-- run -->

```cangjie
unsafe func A(){}
unsafe func B(){
    var f = { =>
        unsafe { A() } // Avoid calling A() directly without unsafe in a normal lambda.
    }
    return f
}
main() {
    var f = unsafe{ B() }
    f()
    println("Hello World")
}
```

## Calling Conventions

Calling conventions describe how callers and callees interact during function calls (e.g., parameter passing, stack cleanup). Both sides must use the same calling convention for correct operation. Cangjie uses `@CallingConv` to represent various calling conventions. Supported conventions include:

- **CDECL**: The default calling convention used by clang's C compiler across platforms.
- **STDCALL**: The calling convention used by Win32 APIs.

C functions called via C interoperability use the default `CDECL` calling convention if not specified. Example calling the C standard library function `rand`:

<!-- run -->

```cangjie
@CallingConv[CDECL]   // Can be omitted in default.
foreign func rand(): Int32

main() {
    println(unsafe { rand() })
}
```

`@CallingConv` can only modify `foreign` blocks, individual `foreign` functions, and top-level `CFunc` functions. When modifying a `foreign` block, each function within the block is implicitly given the same `@CallingConv` modifier.

## Type Mapping

### Basic Types

Cangjie and C support mappings for basic data types. The general principles are:

1. Cangjie types do not include reference types pointing to managed memory.
2. Cangjie types and C types have the same memory layout.

For example, some basic type mappings are:

| Cangjie Type |   C Type   |    Size (byte)     |
|:------------:|:----------:|:------------------:|
|    `Unit`    |   `void`   |         0          |
|    `Bool`    |   `bool`   |         1          |
|   `UInt8`    |   `char`   |         1          |
|    `Int8`    |  `int8_t`  |         1          |
|   `UInt8`    | `uint8_t`  |         1          |
|   `Int16`    | `int16_t`  |         2          |
|   `UInt16`   | `uint16_t` |         2          |
|   `Int32`    | `int32_t`  |         4          |
|   `UInt32`   | `uint32_t` |         4          |
|   `Int64`    | `int64_t`  |         8          |
|   `UInt64`   | `uint64_t` |         8          |
| `IntNative`  | `ssize_t`  | platform dependent |
| `UIntNative` |  `size_t`  | platform dependent |
|  `Float32`   |  `float`   |         4          |
|  `Float64`   |  `double`  |         8          |

> **Note:**
>
> Due to platform-dependent sizes, programmers must explicitly specify corresponding Cangjie types for C's `int` and `long` types. In C interoperability scenarios, the `Unit` type can only be used as a return type in `CFunc` or as a generic parameter in `CPointer`.

Cangjie also supports mappings for C struct and pointer types.

### Structs

For struct types, Cangjie uses `@C`-modified `struct` to correspond. For example, a C struct like:

```c
typedef struct {
    long long x;
    long long y;
    long long z;
} Point3D;
```

The corresponding Cangjie type can be defined as follows:

<!-- run -example00-->

```cangjie
@C
struct Point3D {
    var x: Int64 = 0
    var y: Int64 = 0
    var z: Int64 = 0
}
```

If there is a function in C like this:

```c
Point3D addPoint(Point3D p1, Point3D p2);
```

The corresponding declaration in Cangjie would be:

<!-- run -example00-->

```cangjie
foreign func addPoint(p1: Point3D, p2: Point3D): Point3D
```

A `struct` decorated with `@C` must satisfy the following restrictions:

- Member variable types must satisfy the `CType` constraint
- Cannot implement or extend `interfaces`
- Cannot be used as an associated value type for `enum`
- Cannot be captured by closures
- Cannot have generic parameters

A `struct` decorated with `@C` automatically satisfies the `CType` constraint.

### Pointers

For pointer types, Cangjie provides the `CPointer<T>` type to correspond to C-side pointer types, where the generic parameter `T` must satisfy the `CType` constraint. For example, the `malloc` function in C has the following signature:

```c
void* malloc(size_t size);
```

In Cangjie, it can be declared as:

<!-- run -->

```cangjie
foreign func malloc(size: UIntNative): CPointer<Unit>
```

`CPointer` supports read/write operations, pointer arithmetic, null checks, and conversion to integer form. Detailed APIs can be found in the *Cangjie Programming Language Library API*. Read/write and pointer arithmetic are unsafe operations; calling these functions with invalid pointers may result in undefined behavior. These unsafe functions must be called within an `unsafe` block.

Example usage of `CPointer`:

<!-- run -->

```cangjie
foreign func malloc(size: UIntNative): CPointer<Unit>
foreign func free(ptr: CPointer<Unit>): Unit

@C
struct Point3D {
    var x: Int64
    var y: Int64
    var z: Int64

    init(x: Int64, y: Int64, z: Int64) {
        this.x = x
        this.y = y
        this.z = z
    }
}

main() {
    let p1 = CPointer<Point3D>() // create a CPointer with null value
    if (p1.isNull()) {  // check if the pointer is null
        print("p1 is a null pointer")
    }

    let sizeofPoint3D: UIntNative = 24
    var p2 = unsafe { malloc(sizeofPoint3D) }    // malloc a Point3D in heap
    var p3 = unsafe { CPointer<Point3D>(p2) }    // pointer type cast

    unsafe { p3.write(Point3D(1, 2, 3)) } // write data through pointer

    let p4: Point3D = unsafe { p3.read() } // read data through pointer

    let p5: CPointer<Point3D> = unsafe { p3 + 1 } // offset of pointer

    unsafe { free(p2) }
}
```

Cangjie supports type casting between `CPointer` types. Both the source and target `CPointer` generic parameters `T` must satisfy the `CType` constraint. Usage example:

<!-- run -->

```cangjie
main() {
    var pInt8 = CPointer<Int8>()
    var pUInt8 = CPointer<UInt8>(pInt8) // CPointer<Int8> convert to CPointer<UInt8>
}
```

Cangjie supports converting a `CFunc` type variable to a specific `CPointer`, where the `CPointer`'s generic parameter `T` can be any type satisfying the `CType` constraint. Usage example:

<!-- run -->

```cangjie
foreign func rand(): Int32
main() {
    var ptr = CPointer<Int8>(rand)
}
```

> **Note:**
>
> Converting a `CFunc` to a pointer is generally safe, but the converted pointer should not be used for any `read` or `write` operations, as this may cause runtime errors.

### Arrays

Cangjie uses the `VArray` type to map to C array types. `VArray` can be used as function parameters and `@C struct` members. When the element type `T` of `VArray<T, $N>` satisfies the `CType` constraint, `VArray<T, $N>` also satisfies the `CType` constraint.

**As Function Parameter Types:**

When `VArray` is used as a `CFunc` parameter, the function signature can only be `CPointer<T>` or `VArray<T, $N>`. When the parameter type in the function signature is `VArray<T, $N>`, the argument is still passed as `CPointer<T>`.

Example usage of `VArray` as a parameter:

```cangjie
foreign func cfoo1(a: CPointer<Int32>): Unit
foreign func cfoo2(a: VArray<Int32, $3>): Unit
```

The corresponding C function definitions could be:

```c
void cfoo1(int *a) {}
void cfoo2(int a[3]) {}
```

When calling `CFunc`, the `VArray` type variable must be marked with `inout`:

```cangjie
var a: VArray<Int32, $3> = [1, 2, 3]
unsafe {
    cfoo1(inout a)
    cfoo2(inout a)
}
```

`VArray` cannot be used as a return type for `CFunc`.

**As @C Struct Members:**

When `VArray` is used as an `@C struct` member, its memory layout matches the C-side struct arrangement. Ensure the declared length and type in Cangjie exactly match those in C:

```c
struct S {
    int a[2];
    int b[0];
}
```

In Cangjie, this can be declared as follows to correspond with the C code:

<!-- run -->

```cangjie
@C
struct S {
    var a = VArray<Int32, $2>(repeat: 0)
    var b = VArray<Int32, $0>(repeat: 0)
}
```

> **Note:**
>
> C allows the last field of a struct to be an array of unspecified length, known as a flexible array. Cangjie does not support mapping structs containing flexible arrays.

### Strings

Specifically, for C-style strings, Cangjie provides the `CString` type. To simplify operations with C strings, `CString` offers the following member functions:

- `init(p: CPointer<UInt8>)`   Constructs a `CString` from a `CPointer`
- `func getChars()`  Gets the string address as `CPointer<UInt8>`
- `func size(): Int64`   Calculates the string length
- `func isEmpty(): Bool`   Checks if the string length is 0 (returns `true` if the pointer is null)
- `func isNotEmpty(): Bool`   Checks if the string length is not 0 (returns `false` if the pointer is null)
- `func isNull(): Bool`   Checks if the string pointer is null
- `func startsWith(str: CString): Bool`   Checks if the string starts with `str`
- `func endsWith(str: CString): Bool`   Checks if the string ends with `str`
- `func equals(rhs: CString): Bool`   Checks if the string equals `rhs`
- `func equalsLower(rhs: CString): Bool`   Case-insensitive equality check
- `func subCString(start: UInt64): CString`   Extracts a substring from `start` (allocates new memory)
- `func subCString(start: UInt64, len: UInt64): CString`   Extracts a substring of length `len` from `start` (allocates new memory)
- `func compare(str: CString): Int32`   Compares strings (same as C's `strcmp(this, str)`)
- `func toString(): String`   Constructs a new `String` object
- `func asResource(): CStringResource`  Gets the `Resource` type of `CString`

To convert a `String` to `CString`, use the `mallocCString` interface from LibC. Remember to free the `CString` after use.

Example usage of `CString`:

<!-- run -->

```cangjie
foreign func strlen(s: CString): UIntNative

main() {
    var s1 = unsafe { LibC.mallocCString("hello") }
    var s2 = unsafe { LibC.mallocCString("world") }

    let t1: Int64 = s1.size()
    let t2: Bool = s2.isEmpty()
    let t3: Bool = s1.equals(s2)
    let t4: Bool = s1.startsWith(s2)
    let t5: Int32 = s1.compare(s2)

    let length = unsafe { strlen(s1) }

    unsafe {
        LibC.free(s1)
        LibC.free(s2)
    }
}
```

### sizeOf/alignOf

Cangjie also provides `sizeOf` and `alignOf` functions to get the memory size and alignment (in bytes) of C-interoperable types:

```cangjie
public func sizeOf<T>(): UIntNative where T <: CType
public func alignOf<T>(): UIntNative where T <: CType
```

Usage example:

<!-- verify -->

```cangjie
@C
struct Data {
    var a: Int64 = 0
    var b: Float32 = 0.0
}

main() {
    println(sizeOf<Data>())
    println(alignOf<Data>())
}
```

On a 64-bit machine, this outputs:

```text
16
8
```

## CType

Beyond the type mappings provided in the previous section, Cangjie offers a `CType` interface that serves as a parent type for all C-interoperable types, facilitating use in generic constraints.

Important notes:

1. The `CType` interface is itself an interface type in Cangjie and does not satisfy the `CType` constraint;
2. The `CType` interface cannot be inherited or extended;
3. The `CType` interface does not bypass subtype usage restrictions.

Example usage of `CType`:

<!-- verify -->

```cangjie
func foo<T>(x: T): Unit where T <: CType {
    match (x) {
        case i32: Int32 => println(i32)
        case ptr: CPointer<Int8> => println(ptr.isNull())
        case f: CFunc<() -> Unit> => unsafe { f() }
        case _ => println("match failed")
    }
}

main() {
    var i32: Int32 = 1
    var ptr = CPointer<Int8>()
    var f: CFunc<() -> Unit> = { => println("Hello") }
    var f64 = 1.0
    foo(i32)
    foo(ptr)
    foo(f)
    foo(f64)
}
```

Execution results are as follows:

```text
1
true
Hello
match failed
```

## Calling Cangjie Functions from C

Cangjie provides the `CFunc` type to correspond to C-side function pointer types. Function pointers from C can be passed to Cangjie, and Cangjie can also construct variables corresponding to C function pointers to pass to the C side.

Assuming a C library API is as follows:

```c
typedef void (*callback)(int);
void set_callback(callback cb);
```

The corresponding declaration in Cangjie would be:

```cangjie
foreign func set_callback(cb: CFunc<(Int32) -> Unit>): Unit
```

Variables of type `CFunc` can be passed from the C side or constructed on the Cangjie side. There are two methods to construct `CFunc` types in Cangjie: one is using functions decorated with `@C`, and the other is closures marked as `CFunc` types.

Functions decorated with `@C` indicate that their function signatures comply with C calling conventions, while their definitions are written in Cangjie. Functions decorated with `foreign` have their definitions on the C side.

> **Note:**
>
> For functions decorated with `foreign` or `@C`, it is not recommended to use `CJ_` (case-insensitive) as a prefix for `CFunc` names, as this may conflict with standard library and runtime symbols used internally by the compiler, leading to undefined behavior.

Example:

```cangjie
@C
func myCallback(s: Int32): Unit {
    println("handle ${s} in callback")
}

main() {
    // the argument is a function qualified by `@C`
    unsafe { set_callback(myCallback) }

    // the argument is a lambda with `CFunc` type
    let f: CFunc<(Int32) -> Unit> = { i => println("handle ${i} in callback") }
    unsafe { set_callback(f) }
}
```

Assuming the C function is compiled into a library named "libmyfunc.so", the compilation command `cjc -L. -lmyfunc test.cj -o test.out` should be used to link this library with the Cangjie compiler. This will generate the desired executable.

Additionally, when compiling C code, enable the `-fstack-protector-all/-fstack-protector-strong` stack protection options. Cangjie code inherently includes overflow checks and stack protection. When incorporating C code, ensure that safety against overflow is maintained within `unsafe` blocks.

## Compilation Options

C interoperation typically requires manual linking of C libraries. The Cangjie compiler provides relevant compilation options.

- `--library-path <value>`, `-L <value>`, `-L<value>`: Specifies the directory containing the library files to be linked.

  The path specified by `--library-path <value>` is added to the linker's library search path. Additionally, paths specified in the `LIBRARY_PATH` environment variable are also included, with `--library-path` taking precedence over `LIBRARY_PATH`.

- `--library <value>`, `-l <value>`, `-l<value>`: Specifies the library file to be linked.

  The given library file is passed directly to the linker. The library filename should follow the format `lib[arg].[extension]`.

For all compilation options supported by the Cangjie compiler, refer to "Appendix > cjc Compilation Options".

## Example

This demonstrates how to use C interoperation and the `write/read` interfaces to assign and read values for a structure.

C code:

```c
// draw.c
#include<stdio.h>
#include<stdint.h>

typedef struct {
    int64_t x;
    int64_t y;
} Point;

typedef struct {
    float x;
    float y;
    float z;
} Cube;

void drawPicture(Point* point, Cube* cube) {
    point->x = 1;
    point->y = 2;
    printf("Draw Point finished.\n");

    printf("Before draw cube\n");
    printf("%f\n", cube->x);
    printf("%f\n", cube->y);
    printf("%f\n", cube->z);
    cube->x = 4.4;
    cube->y = 5.5;
    cube->z = 6.6;
    printf("Draw Cube finished.\n");
}
```

Cangjie code:

```cangjie
// main.cj
@C
struct Point {
    var x: Int64 = 0
    var y: Int64 = 0
}

@C
struct Cube {
    var x: Float32 = 0.0
    var y: Float32 = 0.0
    var z: Float32 = 0.0

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }
}

foreign func drawPicture(point: CPointer<Point>, cube: CPointer<Cube>): Int32

main() {
    let pPoint = unsafe { LibC.malloc<Point>() }
    let pCube = unsafe { LibC.malloc<Cube>() }

    var cube = Cube(1.1, 2.2, 3.3)
    unsafe {
        pCube.write(cube)
        drawPicture(pPoint, pCube)   // in which x, y will be changed

        println(pPoint.read().x)
        println(pPoint.read().y)
        println(pCube.read().x)
        println(pCube.read().y)
        println(pCube.read().z)

        LibC.free(pPoint)
        LibC.free(pCube)
    }
}
```

Compilation command for Cangjie code (using the CJNative backend as an example):

```shell
cjc -L . -l draw ./main.cj
```

Here, `-L .` indicates that the linker should search the current directory for libraries (assuming `libdraw.so` is present), and `-l draw` specifies the library name. By default, this generates an executable named `main`. To run the executable:

```shell
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./main
```

Execution results:

```shell
Draw Point finished.
Before draw cube
1.100000
2.200000
3.300000
Draw Cube finished.
1
2
4.400000
5.500000
6.600000
```