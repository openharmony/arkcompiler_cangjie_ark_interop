# Generic Enums

In the design of generic enum types in the Cangjie programming language, the `Option` type serves as a classic example. For a detailed description of `Option`, please refer to the [Option Type](../enum_and_pattern_match/option_type.md) chapter. The `Option` type is used to represent a value that may be empty for a certain type. Thus, `Option` can indicate computational failure on that type. The specific type of failure is indeterminate, making it clear that `Option` is a generic type requiring the declaration of type parameters.

```cangjie
package std.core // `Option` is defined in std.core.

public enum Option<T> {
      Some(T)
    | None

    public func getOrThrow(): T {
        match (this) {
            case Some(v) => v
            case None => throw NoneValueException()
        }
    }
    // ...
}
```

As shown, `Option<T>` has two variants: `Some(T)`, which represents a successful return result with a value, and `None`, which represents an empty result. The `getOrThrow` function extracts the inner value from `Some(T)`, returning a result of type `T`. If the parameter is `None`, it directly throws an exception.

For example, to define a safe division operation—since division computations may fail—return `None` if the divisor is 0; otherwise, return a result wrapped in `Some`:

<!-- compile -->

```cangjie
func safeDiv(a: Int64, b: Int64): Option<Int64> {
    var res: Option<Int64> = match (b) {
                case 0 => None
                case _ => Some(a/b)
            }
    return res
}
```

This way, when the divisor is 0, the program will not throw an arithmetic exception during runtime due to division by zero.