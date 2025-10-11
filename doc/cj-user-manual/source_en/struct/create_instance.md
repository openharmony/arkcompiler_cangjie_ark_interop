# Creating struct Instances

After defining a `struct` type, you can create instances of the `struct` by calling its constructor. Outside the `struct` definition, you invoke the constructor using the `struct` type name to create an instance of that type, and you can access instance member variables and instance member functions that satisfy visibility modifiers (such as `public`). For example, in the following code, a variable `r` of type `Rectangle` is defined. The values of `width` and `height` in `r` can be accessed via `r.width` and `r.height`, respectively, and the member function `area` of `r` can be called via `r.area()`.

<!-- compile -->

```cangjie
struct Rectangle {
    public var width: Int64
    public var height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    public func area() {
        width * height
    }
}
let r = Rectangle(10, 20)
let width = r.width   // width = 10
let height = r.height // height = 20
let a = r.area()      // a = 200
```

If you want to modify the values of member variables through a `struct` instance, you need to define the `struct` variable as mutable, and the member variable being modified must also be mutable (defined with `var`). Here's an example:

<!-- run -->

```cangjie
struct Rectangle {
    public var width: Int64
    public var height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    public func area() {
        width * height
    }
}

main() {
    var r = Rectangle(10, 20) // r.width = 10, r.height = 20
    r.width = 8               // r.width = 8
    r.height = 24             // r.height = 24
    let a = r.area()          // a = 192
}
```

During assignment or parameter passing, a `struct` instance is copied (when member variables are reference types, only the reference is copied, not the referenced object), generating a new instance. Modifying one instance does not affect the other. For example, in the following code, after assigning `r1` to `r2`, changing the `width` and `height` values of `r1` does not affect the `width` and `height` values of `r2`.

<!-- run -->

```cangjie
struct Rectangle {
    public var width: Int64
    public var height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    public func area() {
        width * height
    }
}

main() {
    var r1 = Rectangle(10, 20) // r1.width = 10, r1.height = 20
    var r2 = r1                // r2.width = 10, r2.height = 20
    r1.width = 8               // r1.width = 8
    r1.height = 24             // r1.height = 24
    let a1 = r1.area()         // a1 = 192
    let a2 = r2.area()         // a2 = 200
}
```