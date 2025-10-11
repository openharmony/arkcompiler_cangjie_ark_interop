# Subtyping Relationships of Generic Types

Instantiated generic types also have subtyping relationships. For example:

<!-- compile -->

```cangjie
interface I<X, Y> { }

class C<Z> <: I<Z, Z> { }
```

Based on `class C<Z> <: I<Z, Z> { }`, we know that `C<Bool> <: I<Bool, Bool>` and `C<D> <: I<D, D>` hold true. This can be interpreted as "For all types `Z` without type variables, `C<Z> <: I<Z, Z>` holds."

However, for the following code:

<!-- compile -->

```cangjie
open class C { }
class D <: C { }

interface I<X> { }
```

`I<D> <: I<C>` does not hold (even though `D <: C` holds), because in the Cangjie language, user-defined type constructors are **invariant** at their type parameters.

The formal definition of variance is: If `A` and `B` are (instantiated) types, and `T` is a type constructor with one type parameter `X` (e.g., `interface T<X>`), then:

- If `T(A) <: T(B)` holds if and only if `A = B`, then `T` is **invariant**.
- If `T(A) <: T(B)` holds if and only if `A <: B`, then `T` is **covariant** at `X`.
- If `T(A) <: T(B)` holds if and only if `B <: A`, then `T` is **contravariant** at `X`.

In the current version of Cangjie, all user-defined generic types are invariant at all their type parameters. Therefore, given `interface I<X>` and types `A`, `B`, only when `A = B` can we obtain `I<A> <: I<B>`. Conversely, if we know `I<A> <: I<B>`, we can deduce `A = B` (built-in types are exceptions: built-in tuple types are covariant at each element type; built-in function types are contravariant at their parameter types and covariant at their return types.)

> **Note:**
>
> For types other than `class` implementing interfaces, the subtyping relationship between the type and the interface cannot serve as a basis for covariance or contravariance.

Invariance limits some expressive power of the language but also avoids certain safety issues, such as the "covariant array runtime exception" problem.