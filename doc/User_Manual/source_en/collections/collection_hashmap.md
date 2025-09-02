# HashMap

To use the HashMap type, you need to import the collection package:

<!-- run -->

```cangjie
import std.collection.*
```

You can use the HashMap type to construct a Collection of key-value pairs.

HashMap is a hash table that provides fast access to its contained elements. Each element in the table is identified by its key, and the corresponding value can be accessed using the key.

Cangjie uses `HashMap<K, V>` to represent the HashMap type, where K denotes the key type of the HashMap. K must be a type that implements both the Hashable and `Equatable<K>` interfaces, such as numeric types or String. V denotes the value type of the HashMap, which can be any type.

```cangjie
var a: HashMap<Int64, Int64> = ... // HashMap whose key type is Int64 and value type is Int64
var b: HashMap<String, Int64> = ... // HashMap whose key type is String and value type is Int64
```

HashMaps with different element types are considered distinct types and therefore cannot be assigned to each other.

Thus, the following example is invalid:

```cangjie
b = a // Type mismatch
```

In Cangjie, you can construct a specific HashMap using constructor methods.

<!-- run -->

```cangjie
let a = HashMap<String, Int64>() // Created an empty HashMap whose key type is String and value type is Int64
let b = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)]) // whose key type is String and value type is Int64, containing elements ("a", 0), ("b", 1), ("c", 2)
let c = HashMap<String, Int64>(b) // Use another Collection to initialize a HashMap
let d = HashMap<String, Int64>(10) // Created a HashMap whose key type is String and value type is Int64 and capacity is 10
let e = HashMap<Int64, Int64>(10, {x: Int64 => (x, x * x)}) // Created a HashMap whose key and value type is Int64 and size is 10. All elements are initialized by specified rule function
```

## Accessing HashMap Members

When you need to access all elements of a HashMap, you can use a for-in loop to iterate through them.

Note that HashMap does not guarantee element ordering based on insertion sequence, so traversal order may differ from insertion order.

<!-- verify -->

```cangjie
import std.collection.HashMap

main() {
    let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    for ((k, v) in map) {
        println("The key is ${k}, the value is ${v}")
    }
}
```

Compiling and executing the above code might output:

```text
The key is a, the value is 0
The key is b, the value is 1
The key is c, the value is 2
```

To determine the number of elements in a HashMap, use the size property.

<!-- verify -->

```cangjie
import std.collection.HashMap

main() {
    let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    if (map.size == 0) {
        println("This is an empty hashmap")
    } else {
        println("The size of hashmap is ${map.size}")
    }
}
```

Compiling and executing the above code will output:

```text
The size of hashmap is 3
```

To check if a HashMap contains a specific key, use the contains function. It returns true if the key exists, otherwise false.

<!-- run -->

```cangjie
let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
let a = map.contains("a") // a == true
let b = map.contains("d") // b == false
```

To access the value associated with a specific key, use subscript syntax (the subscript type must match the key type). Using a non-existent key will trigger a runtime exception.

<!-- run.error -->

```cangjie
let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
let a = map["a"] // a == 0
let b = map["b"] // b == 1
let c = map["d"] // Runtime exceptions
```

## Modifying HashMap

HashMap is a mutable reference type that provides functionality for modifying, adding, and removing elements.

The mutability of HashMap is a particularly useful feature, allowing all references to the same HashMap instance to share the same elements and apply modifications uniformly.

You can use subscript syntax to modify the value associated with a key.

<!-- run -->

```cangjie
let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
map["a"] = 3
```

HashMap is a reference type. When used as an expression, HashMap does not create copies. All references to the same HashMap instance share the same data.

Therefore, modifications to HashMap elements will affect all references to that instance.

<!-- run -->

```cangjie
let map1 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
let map2 = map1
map2["a"] = 3
// map1 contains the elements ("a", 3), ("b", 1), ("c", 2)
// map2 contains the elements ("a", 3), ("b", 1), ("c", 2)
```

To add a single key-value pair to a HashMap, use the add function. To add multiple key-value pairs simultaneously, use the `add(all!: Collection<(K, V)>)` function. When the key doesn't exist, add performs an insertion; when the key exists, it overwrites the old value with the new one.

<!-- run -->

```cangjie
let map = HashMap<String, Int64>()
map.add("a", 0) // map contains the element ("a", 0)
map.add("b", 1) // map contains the elements ("a", 0), ("b", 1)
let map2 = HashMap<String, Int64>([("c", 2), ("d", 3)])
map.add(all: map2) // map contains the elements ("a", 0), ("b", 1), ("c", 2), ("d", 3)
```

Alternatively, you can use assignment syntax to directly add new key-value pairs to a HashMap.

<!-- run -->

```cangjie
let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
map["d"] = 3 // map contains the elements ("a", 0), ("b", 1), ("c", 2), ("d", 3)
```

To remove elements from a HashMap, use the remove function by specifying the key to delete.

<!-- run -->

```cangjie
let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2), ("d", 3)])
map.remove("d") // map contains the elements ("a", 0), ("b", 1), ("c", 2)
```