# Iterable and Collections

We have previously learned about Range, Array, and ArrayList, all of which can be traversed using the for-in operation. Developers can also implement similar traversal operations for custom types.

Range, Array, and ArrayList all support the for-in syntax through Iterable.

Iterable is a built-in interface with the following form (only core code is shown):

```cangjie
interface Iterable<T> {
    func iterator(): Iterator<T>
    ...
}
```

The iterator function requires the returned Iterator type to be another built-in abstract class with the following form (only core code is shown):

```cangjie
abstract class Iterator<T> <: Iterable<T> {
    mut func next(): Option<T>
    ...
}
```

You can use the for-in syntax to traverse any instance of a type that implements the Iterable interface.

Consider the following for-in code example:

<!-- run -->

```cangjie
let list = [1, 2, 3]
for (i in list) {
    println(i)
}
```

This is equivalent to the following while loop code:

<!-- run -->

```cangjie
let list = [1, 2, 3]
var it = list.iterator()
while (true) {
    match (it.next()) {
        case Some(i) => println(i)
        case None => break
    }
}
```

Another common method for traversing Iterable types is to use pattern matching in the while expression's condition. For example, an alternative equivalent to the above while loop code is:

<!-- run -->

```cangjie
let list = [1, 2, 3]
var it = list.iterator()
while (let Some(i) <- it.next()) {
    println(i)
}
```

Array, ArrayList, HashSet, and HashMap types all implement Iterable, so they can be used in for-in or while loops.