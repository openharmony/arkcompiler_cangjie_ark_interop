# Cangjie-C Interoperability

To ensure compatibility with existing ecosystems, Cangjie supports calling C functions and allows C to call Cangjie functions.

## Calling C Functions from Cangjie

To call a C function in Cangjie, the function must be declared using the `@C` and `foreign` keywords in Cangjie. Note that `@C` can be omitted when modifying a `foreign` declaration.

For example, to call C's `rand` and `printf` functions with the following signatures:

```c
// stdlib.h
int rand();

// stdio.h
int printf (const char *fmt, ...);
```

The corresponding Cangjie code would be:

<!-- run -->

```cangjie
// declare the function by `foreign` keyword, and omit `@C`
foreign func rand(): Int32
foreign func printf(fmt: CString, ...): Int32

main() {
    // call this function by `unsafe` block
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

1. The `foreign` modifier indicates an external function declaration. Functions marked with `foreign` can only be declared, not implemented.
2. Parameters and return types in `foreign` declarations must conform to the type mapping rules between C and Cangjie. See [Type Mapping](./cangjie-c.md#type-mapping) for details.
3. Since C functions may perform unsafe operations, calls to `foreign` functions must be wrapped in an `unsafe` block; otherwise, a compilation error will occur.
4. The `@C` modifier can only be used with `foreign` function declarations, not other declarations.
5. `@C` supports only `foreign` functions, non-generic functions in the top-level scope, and `struct` types.
6. `foreign` functions do not support named parameters or default values. Variadic parameters are allowed using `...` at the end of the parameter list. Variadic parameters must satisfy the `CType` constraint but need not be of the same type.
7. Although Cangjie (CJNative backend) provides stack expansion capabilities, Cangjie cannot perceive the actual stack usage of C functions. Therefore, FFI calls into C functions still carry the risk of stack overflow (potentially causing runtime crashes or undefined behavior). Developers should adjust `cjStackSize` configuration as needed.

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

`CFunc` in Cangjie refers to functions callable from C code, which come in three forms:

1. `foreign` functions marked with `@C`
2. Cangjie functions marked with `@C`
3. `CFunc` lambda expressions, which differ from regular lambdas in that they cannot capture variables.

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

All three forms above have the type `CFunc<(CPointer<Int8>) -> Unit>`. `CFunc` corresponds to C's function pointer type. This is a generic type where the type parameter specifies the `CFunc`'s parameter and return types. Example usage:

<!-- run -->

```cangjie
foreign func atexit(cb: CFunc<() -> Unit>): Int32
```

Like `foreign` functions, other forms of `CFunc` must satisfy the `CType` constraint for parameters and return types, and do not support named parameters or default values.

When calling a `CFunc` in Cangjie code, it must be within an `unsafe` context.

Cangjie supports converting a `CPointer<T>` variable into a specific `CFunc`, where `T` can be any type satisfying the `CType` constraint. Example:

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
> Converting a pointer to a `CFunc` and calling it is dangerous. Users must ensure the pointer points to a valid function address; otherwise, runtime errors may occur.

## inout Parameters

When calling a `CFunc` in Cangjie, arguments can be modified with the `inout` keyword to pass by reference. The type of a reference-passed expression is `CPointer<T>`, where `T` is the type of the `inout`-modified expression.

Reference-passed expressions have the following constraints:

- Can only be used in `CFunc` calls.
- The modified object's type must satisfy the `CType` constraint but cannot be `CString`.
- The modified object cannot be defined with `let`, nor can it be a literal, parameter, or temporary value from other expressions.
- Pointers passed to C via reference-passed expressions are only valid during the function call. C code should not store these pointers for later use.

`inout` variables can be top-level variables, local variables, or `struct` member variables, but cannot be derived directly or indirectly from `class` instance members.

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
> The `inout` parameter feature cannot be used in macro definitions when using macro expansion.

## unsafe

Interoperability with C introduces many unsafe operations, so Cangjie uses the `unsafe` keyword to mark such behaviors.

Key points about `unsafe`:

- Can modify functions, expressions, or scopes.
- Functions marked with `@C` must be called in an `unsafe` context.
- `CFunc` calls must occur in an `unsafe` context.
- `foreign` function calls must occur in an `unsafe` context.
- Functions marked with `unsafe` must be called in an `unsafe` context.

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

Note that regular `lambda` functions cannot propagate `unsafe` attributes. If an `unsafe` lambda escapes, it can be called outside an `unsafe` context without compilation errors. To call `unsafe` functions within a lambda, wrap the call in an `unsafe` block:

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

Calling conventions define how functions are called (e.g., parameter passing, stack cleanup). Both caller and callee must use the same convention. Cangjie uses `@CallingConv` to specify calling conventions, supporting:

- **CDECL**: Default for clang's C compiler across platforms.
- **STDCALL**: Used by Win32 APIs.

C functions called via FFI default to `CDECL` if unspecified. Example calling C's `rand`:

<!-- run -->

```cangjie
@CallingConv[CDECL]   // Can be omitted in default.
foreign func rand(): Int32

main() {
    println(unsafe { rand() })
}
```

`@CallingConv` can only modify `foreign` blocks, individual `foreign` functions, or top-level `CFunc` functions. When applied to a `foreign` block, it applies to all functions within.

## Type Mapping

### Basic Types

Cangjie and C support basic type mapping with these principles:

1. Cangjie types do not include references to managed memory.
2. Cangjie and C types share the same memory layout.

Basic type mappings:

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
> Due to platform variability, `int` and `long` types require explicit Cangjie equivalents. In C interop, `Unit` can only be used as a return type in `CFunc` or as a generic parameter in `CPointer`.

Cangjie also supports struct and pointer type mappings.

### Structs

For struct types, Cangjie uses `@C`-modified `struct`s. For example, this C struct:

```c
typedef struct {
    long long x;
    long long y;
    long long z;
} Point3D;
```

Corresponds to this Cangjie definition:

<!-- run -example00-->

```cangjie
@C
struct Point3D {
    var x: Int64 = 0
    var y: Int64 = 0
    var z: Int64 = 0
}
```

For this C function:

```c
Point3D addPoint(Point3D p1, Point3D p2);
```

The Cangjie declaration would be:

<!-- run -example00-->

```cangjie
foreign func addPoint(p1: Point3D, p2: Point3D): Point3D
```

`@C`-modified `struct`s have these restrictions:

- Member types must satisfy `CType`.
- Cannot implement or extend `interfaces`.
- Cannot be `enum` associated values.
- Cannot be captured by closures.
- Cannot have generic parameters.

`@C` `struct`s automatically satisfy `CType`.

### Pointers

For pointers, Cangjie provides `CPointer<T>`, where `T` must satisfy `CType`. For example, C's `malloc`:

```c
void* malloc(size_t size);
```

In Cangjie:

<!-- run -->

```cangjie
foreign func malloc(size: UIntNative): CPointer<Unit>
```

`CPointer` supports read/write, offset calculation, null checks, and integer conversion. See the Cangjie Library API for details. Read/write and offsets are unsafe and require `unsafe` blocks.

Example usage:

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

Cangjie supports pointer type conversion between `CPointer`s with `CType`-satisfying generic parameters:

<!-- run -->

```cangjie
main() {
    var pInt8 = CPointer<Int8>()
    var pUInt8 = CPointer<UInt8>(pInt8) // CPointer<Int8> convert to CPointer<UInt8>
}
```

Cangjie also supports converting `CFunc` to `CPointer`:

<!-- run -->

```cangjie
foreign func rand(): Int32
main() {
    var ptr = CPointer<Int8>(rand)
}
```

> **Note:**
>
> Converting `CFunc` to a pointer is generally safe, but avoid `read`/`write` operations on the result to prevent runtime errors.

### Arrays

Cangjie uses `VArray` to map C arrays. `VArray` can be function parameters or `@C struct` members. When `VArray<T, $N>`'s element type `T` satisfies `CType`, `VArray<T, $N>` also satisfies `CType`.

**As Function Parameters:**

When `VArray` is a `CFunc` parameter, the signature can only be `CPointer<T>` or `VArray<T, $N>`. For `VArray<T, $N>` parameters, arguments are passed as `CPointer<T>`.

Example:

```cangjie
foreign func cfoo1(a: CPointer<Int32>): Unit
foreign func cfoo2(a: VArray<Int32, $3>): Unit
```

Corresponding C definitions:

```c
void cfoo1(int *a) {}
void cfoo2(int a[3]) {}
```

Calling requires `inout`:

```cangjie
var a: VArray<Int32, $3> = [1, 2, 3]
unsafe {
    cfoo1(inout a)
    cfoo2(inout a)
}
```

`VArray` cannot be a `CFunc` return type.

**As @C Struct Members:**

When `VArray` is an `@C struct` member, its memory layout matches C structs. Ensure Cangjie declarations match C exactly:

```c
struct S {
    int a[2];
    int b[0];
}
```

Cangjie equivalent:

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
> C's flexible array members (unsized arrays at struct ends) are not supported in Cangjie.

### Strings

For C strings, Cangjie provides `CString` with these methods:

- `init(p: CPointer<UInt8>)`   Construct from `CPointer`
- `func getChars()`  Get string address as `CPointer<UInt8>`
- `func size(): Int64`   Get length
- `func isEmpty(): Bool`   Check if empty (returns true for null pointers)
- `func isNotEmpty(): Bool`   Check if not empty (returns false for null pointers)
- `func isNull(): Bool`   Check if pointer is null
- `func startsWith(str: CString): Bool`   Check prefix
- `func endsWith(str: CString): Bool`   Check suffix
- `func equals(rhs: CString): Bool`   Equality check
- `func equalsLower(rhs: CString): Bool`   Case-insensitive equality
- `func subCString(start: UInt64): CString`   Substring from `start` (new allocation)
- `func subCString(start: UInt64, len: UInt64): CString`   Substring from `start` with `len` (new allocation)
- `func compare(str: CString): Int32`   Like C's `strcmp(this, str)`
- `func toString(): String`   Convert to `String`
- `func asResource(): CStringResource`  Get## CType

In addition to the types provided in the type mapping section for interfacing with C-side types, Cangjie also offers a `CType` interface. This interface itself contains no methods and serves as the parent type for all C-interoperable types, facilitating use in generic constraints.

Important notes:

1. The `CType` interface is an interface type in Cangjie and does not itself satisfy the `CType` constraint;
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

Execution output:

```text
1
true
Hello
match failed
```

## Calling Cangjie Functions from C

Cangjie provides the `CFunc` type to correspond with C-side function pointer types. C-side function pointers can be passed to Cangjie, and Cangjie can also construct variables corresponding to C function pointers to pass to the C side.

Assume a C library API as follows:

```c
typedef void (*callback)(int);
void set_callback(callback cb);
```

Correspondingly, in Cangjie this function can be declared as:

```cangjie
foreign func set_callback(cb: CFunc<(Int32) -> Unit>): Unit
```

CFunc-type variables can either be passed from the C side or constructed on the Cangjie side. There are two ways to construct CFunc types in Cangjie: using functions decorated with `@C`, or closures marked as CFunc types.

Functions decorated with `@C` indicate that their function signatures comply with C calling conventions, while their definitions remain in Cangjie. Functions decorated with `foreign` have their definitions on the C side.

> **Note:**
>
> For both `foreign`-decorated functions and `@C`-decorated functions, it is not recommended to use `CJ_` (case-insensitive) as a prefix for CFunc names, as this may conflict with standard library and runtime symbols internal to the compiler, leading to undefined behavior.

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

Assuming the C function is compiled into a library named "libmyfunc.so", use the compilation command `cjc -L. -lmyfunc test.cj -o test.out` to make the Cangjie compiler link this library. This will ultimately produce the desired executable.

Additionally, when compiling C code, enable the `-fstack-protector-all/-fstack-protector-strong` stack protection options. Cangjie-side code inherently includes overflow checks and stack protection. When incorporating C code, ensure that safety against overflow is maintained within unsafe blocks.

## Compilation Options

C interoperation typically requires manual linking of C libraries, for which the Cangjie compiler provides corresponding compilation options.

- `--library-path <value>`, `-L <value>`, `-L<value>`: Specifies the directory containing the library files to be linked.

  The path specified by `--library-path <value>` will be added to the linker's library search path. Additionally, paths specified in the `LIBRARY_PATH` environment variable will also be included, with `--library-path` taking precedence over `LIBRARY_PATH`.

- `--library <value>`, `-l <value>`, `-l<value>`: Specifies the library file to be linked.

  The given library file will be passed directly to the linker. The library filename should follow the format `lib[arg].[extension]`.

For all compilation options supported by the Cangjie compiler, refer to "Appendix > cjc Compilation Options".

## Example

This demonstrates how to use C interoperation along with the `write/read` interfaces to assign and read values from a structure.

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

Compilation command for Cangjie code (using CJNative backend as an example):

```shell
cjc -L . -l draw ./main.cj
```

Here, `-L .` indicates that the linker should search the current directory for libraries (assuming `libdraw.so` is present in the current directory), and `-l draw` specifies the library name. Upon successful compilation, the default output is a binary file named `main`. Execute it with:

```shell
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./main
```

Execution output:

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