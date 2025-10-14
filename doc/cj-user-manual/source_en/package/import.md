# Package Import

## Using `import` Statements to Import Declarations or Definitions from Other Packages

In the Cangjie programming language, you can import a top-level declaration or definition from another package using the syntax `import fullPackageName.itemName`, where `fullPackageName` is the complete package path and `itemName` is the name of the declaration. The import statement must appear after the package declaration and before any other declarations or definitions in the source file. For example:

```cangjie
package a
import std.math.*
import package1.foo
import {package1.foo, package2.bar}
```

If multiple `itemName`s belong to the same `fullPackageName`, you can use the syntax `import fullPackageName.{itemName[, itemName]*}`. For example:

```cangjie
import package1.{foo, bar, fuzz}
```

This is equivalent to:

```cangjie
import package1.foo
import package1.bar
import package1.fuzz
```

In addition to importing a specific top-level declaration or definition using `import fullPackagename.itemName`, you can also use `import packageName.*` to import all visible top-level declarations or definitions from the `packageName` package. For example:

```cangjie
import package1.*
import {package1.*, package2.*}
```

Important notes:

- The scope level of imported members is lower than that of members declared in the current package.
- If the module name or package name of an exported package is tampered with, making it inconsistent with the name specified during export, an error will occur during import.
- Only top-level declarations or definitions visible to the current file can be imported. Attempting to import invisible declarations or definitions will result in an error at the import location.
- It is prohibited to import declarations or definitions from the package where the current source file resides using `import`.
- Circular dependency imports between packages are prohibited. If circular dependencies exist between packages, the compiler will report an error.

Example:

```cangjie
// pkga/a.cj
package pkga    // Error, packages pkga pkgb are in circular dependencies.
import pkgb.*

class C {}
public struct R {}

// pkgb/b.cj
package pkgb

import pkga.*

// pkgc/c1.cj
package pkgc

import pkga.C // Error, 'C' is not accessible in package 'pkga'.
import pkgc.f1 // Error, package 'pkgc' should not import itself.

public func f1() {}

// pkgc/c2.cj
package pkgc

import pkga.R // OK, R is an external top-level declaration of package pkga.
import pkga

func f2() {
    /* OK, the imported declaration is visible to all source files of the same package
     * and accessing import declaration by its name is supported.
     */
    R()

    // OK, accessing imported declaration by fully qualified name is supported.
    pkga.R()

    // OK, the declaration of current package can be accessed directly.
    f1()
}
```

In the Cangjie programming language, if an imported declaration or definition has the same name as a top-level declaration or definition in the current package and does not constitute function overloading, the imported declaration or definition will be shadowed. If they do constitute function overloading, function resolution will follow the rules of function overloading during function calls.

```cangjie
// pkga/a.cj
package pkga

public struct R {}            // R1
public func f(a: Int32) {}    // f1
public func f(a: Bool) {} // f2

// pkgb/b.cj
package pkgb
import pkga.*

func f(a: Int32) {}         // f3
struct R {}                 // R2

func bar() {
    R()     // OK, R2 shadows R1.
    f(1)    // OK, invoke f3 in current package.
    f(true) // OK, invoke f2 in the imported package
}
```

## Implicit Import of the `core` Package

Types such as `String` and `Range` can be used directly not because they are built-in types, but because the compiler implicitly imports all `public` declarations from the `core` package for the source code.

## Renaming Imported Names Using `import as`

Different packages have separate namespaces, so top-level declarations with the same name may exist in different packages. When importing top-level declarations with the same name from different packages, you can use `import packageName.name as newName` to rename them and avoid conflicts. Even without naming conflicts, you can still use `import as` to rename imported content. The rules for `import as` are as follows:

- After renaming an imported declaration using `import as`, the current package can only use the new name; the original name becomes unavailable.
- If the renamed name conflicts with other names in the top-level scope of the current package and the corresponding declarations are all function types, they participate in function overloading; otherwise, a redefinition error is reported.
- The syntax `import pkg as newPkgName` is supported to rename package names, resolving naming conflicts for packages with the same name in different modules.
    <!-- compile.error -import3-->
    <!-- cfg="-p p1 --output-type=staticlib" -->

    ```cangjie
    // a.cj
    package p1
    public func f1() {}
    ```

    <!-- compile.error -import3-->
    <!-- cfg="-p p2 --output-type=staticlib" -->

    ```cangjie
    // d.cj
    package p2
    public func f3() {}
    ```

    <!-- compile.error -import3-->
    <!-- cfg="-p p1 --output-type=staticlib" -->

    ```cangjie
    // b.cj
    package p1
    public func f2() {}
    ```

    <!-- compile.error -import3-->
    <!-- cfg="-p pkgc --output-type=staticlib" -->

    ```cangjie
    // c.cj
    package pkgc
    public func f1() {}
    ```

    <!-- compile.error -import3-->
    <!-- cfg="libp1.a libpkgc.a libp1.a" -->

    ```cangjie
    // main.cj
    import p1 as A
    import p1 as B
    import p2.f3 as f  // OK
    import pkgc.f1 as a
    import pkgc.f1 as b // OK

    func f(a: Int32) {}

    main() {
        A.f1()  // OK, package name conflict is resolved by renaming package name.
        B.f2()  // OK, package name conflict is resolved by renaming package name.
        p1.f1() // Error, the original package name cannot be used.
        a()     // OK.
        b()     // OK.
        pkgc.f1()    // Error, the original name cannot be used.
    }
    ```

- If conflicting imported names are not renamed, no error is reported at the `import` statement. However, an error will occur at the usage site due to the inability to import a unique name. This situation can be resolved by defining an alias with `import as` or importing the package as a namespace using `import fullPackageName`.

    <!-- compile -import1 -->
    <!-- cfg="-p p1 --output-type=staticlib" -->

    ```cangjie
    // a.cj
    package p1
    public class C {}
    ```

    <!-- compile -import1 -->
    <!-- cfg="-p p2 --output-type=staticlib" -->

    ```cangjie
    // b.cj
    package p2
    public class C {}
    ```

    ```cangjie
    // main1.cj
    package pkga
    import p1.C
    import p2.C

    main() {
        let _ = C() // Error
    }
    ```

    <!-- compile -import1 -->
    <!-- cfg="-p pkgb libp1.a libp2.a" -->
    ```cangjie
    // main2.cj
    package pkgb
    import p1.C as C1
    import p2.C as C2

    main() {
        let _ = C1() // OK
        let _ = C2() // OK
    }
    ```

    <!-- compile -import1 -->
    <!-- cfg="-p pkgc libp1.a libp2.a" -->

    ```cangjie
    // main3.cj
    package pkgc
    import p1
    import p2

    main() {
        let _ = p1.C() // OK
        let _ = p2.C() // OK
    }
    ```

## Re-exporting an Imported Name

In the development of large-scale projects with extensive functionality, the following scenario is very common: package `p2` heavily uses declarations imported from package `p1`. When package `p3` imports `p2` and uses its functionality, the declarations from `p1` also need to be visible to `p3`. Requiring `p3` to manually import the declarations from `p1` used in `p2` would be overly cumbersome. Therefore, it is desirable to import the declarations from `p1` used in `p2` when `p2` is imported.

In the Cangjie programming language, `import` can be modified by the access modifiers `private`, `internal`, `protected`, and `public`. Among these, `import` statements modified by `public`, `protected`, or `internal` can re-export the imported members (provided these imported members are not rendered unavailable in the current package due to name conflicts or shadowing). Other packages can directly import and use the re-exported content from this package based on visibility, without needing to import these contents from the original package.

- `private import` means the imported content is only accessible within the current file. `private` is the default modifier for `import`. An `import` without an access modifier is equivalent to `private import`.
- `internal import` means the imported content is accessible within the current package and its subpackages (including subpackages of subpackages). Access from non-current packages requires explicit `import`.
- `protected import` means the imported content is accessible within the current module. Access from non-current packages requires explicit `import`.
- `public import` means the imported content is accessible externally. Access from non-current packages requires explicit `import`.

In the following example, `b` is a subpackage of `a`. In `a`, the function `f` defined in `b` is re-exported using `public import`.

<!-- compile -reimport1 -->
<!-- cfg="-p a/b --output-type=staticlib" -->

```cangjie
internal package a.b

public func f() { 0 }
```

<!-- compile -reimport1 -->
<!-- cfg="-p a --output-type=staticlib" -->

```cangjie
package a
public import a.b.f

public let x = 0
```

<!-- compile -reimport1 -->
<!-- cfg="liba.a liba.b.a" -->

```cangjie
import a.f  // OK
let _ = f() // OK
```

Note that packages cannot be re-exported: if the `import` imports a package, the `import` cannot be modified by `public`, `protected`, or `internal`.

<!-- compile.error -->

```cangjie
public import a.b // Error, cannot re-export package
```