# The Option Type

The `Option` type is defined using `enum` and contains two constructors: `Some` and `None`. Here, `Some` carries a parameter indicating the presence of a value, while `None` carries no parameter, representing the absence of a value. The `Option` type is used when a value of a certain type may or may not exist.

The `Option` type is defined as a generic `enum` type as follows (for now, it's sufficient to understand that `T` within angle brackets is a type parameter, and different `Option` types are obtained when `T` is instantiated with different types. For detailed information on generics, refer to [Generics](../generic/generic_overview.md)):

<!-- compile -->

```cangjie
enum Option<T> {
    | Some(T)
    | None
}
```

Here, the parameter type of the `Some` constructor is the type parameter `T`. When `T` is instantiated with different types, different `Option` types are obtained, such as `Option<Int64>`, `Option<String>`, etc.

There is also a shorthand notation for the `Option` type: prefixing the type name with `?`. That is, for any type `Ty`, `?Ty` is equivalent to `Option<Ty>`. For example, `?Int64` is equivalent to `Option<Int64>`, `?String` is equivalent to `Option<String>`, and so on.

The following examples demonstrate how to define variables of the `Option` type:

<!-- compile -->

```cangjie
let a: Option<Int64> = Some(100)
let b: ?Int64 = Some(100)
let c: Option<String> = Some("Hello")
let d: ?String = None
```

Additionally, although `T` and `Option<T>` are different types, when it is explicitly known that an `Option<T>` value is required in a certain context, a value of type `T` can be directly passed. The compiler will then encapsulate the `T` value into an `Option<T>` value using the `Some` constructor of `Option<T>` (note: this is not a type conversion). For example, the following definitions are valid (equivalent to the definitions of variables `a`, `b`, and `c` in the previous example):

<!-- compile -->

```cangjie
let a: Option<Int64> = 100
let b: ?Int64 = 100
let c: Option<String> = "100"
```

When there is no explicit type requirement in the context, `None` cannot be used directly to construct the desired type. In such cases, the `None<T>` syntax should be used to construct data of type `Option<T>`, for example:

<!-- compile -->

```cangjie
let a = None<Int64> // a: Option<Int64>
let b = None<Bool> // b: Option<Bool>
```

Finally, for the usage of `Option`, refer to [Using Option](../error_handle/use_option.md).