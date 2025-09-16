# Generic Interfaces

Generics can be used to define generic interfaces. Taking `Iterable` from the standard library as an example, its member function `iterator` needs to return an `Iterator` type, which serves as a container's traverser. `Iterator` is a generic interface that contains a `next` member function for returning the next element from the container. Since the return type of the `next` function needs to be specified during usage, `Iterator` requires the declaration of generic parameters.

<!-- compile -->

```cangjie
public interface Iterable<E> {
    func iterator(): Iterator<E>
}

public interface Iterator<E> <: Iterable<E> {
    func next(): Option<E>
}

public interface Collection<T> <: Iterable<T> {
     prop size: Int64
     func isEmpty(): Bool
}
```