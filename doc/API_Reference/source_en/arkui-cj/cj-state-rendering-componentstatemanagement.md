```markdown
# ohos.arkui.state_management

Provides `ObservedArray` and `ObservedArrayList` as array types for state management. When changes occur in these arrays, such as modifying an item's value, deleting or adding an item, UI updates will be triggered.

## Import Module

```cangjie
import kit.ArkUI.*
```

## class ObservedArrayList

```cangjie
public class ObservedArrayList<T> <: ObservedComplexAbstract {


    public init(initValue: ArrayList<T>)


    public init(initValue: Array<T>)
}
```

**Function:** Provides functionality for mutable-length arrays that support state management and can detect internal changes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Types:**

- [ObservedComplexAbstract](./cj-state-rendering-appstatemanagement.md#class-observedcomplexabstract)
- [CollectionEx](please add link)\<T>

### prop size

```cangjie
public prop size: Int64
```

**Function:** The number of elements in this `ObservedArrayList`.

**Type:** Int64

**Read-Write Permission:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(ArrayList\<T>)

```cangjie
public init(initValue: ArrayList<T>)
```

**Function:** Constructs an `ObservedArrayList` containing all elements from the specified `ArrayList`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| initValue | ArrayList\<T> | Yes | - | The `ArrayList` used to initialize the `ObservedArrayList`. |

### init(Array\<T>)

```cangjie
public init(initValue: Array<T>)
```

**Function:** Constructs an `ObservedArrayList` containing all elements from the specified `Array`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| initValue | Array\<T> | Yes | - | The `Array` used to initialize the `ObservedArrayList`. |

### func append(T)

```cangjie
public func append(element: T): Unit
```

**Function:** Appends the specified element to the end of this `ObservedArrayList`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| element | T | Yes | - | The element to append. |

### func appendAll(Collection\<T>)

```cangjie
public func appendAll(elements: Collection<T>): Unit
```

**Function:** Appends all elements from the specified collection to the end of this `ObservedArrayList`. The function traverses the input collection in iterator order and inserts all elements to the tail of this `ObservedArrayList`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| elements | [Collection](<font color="red" face="bold">please add link</font>)\<T> | Yes | - | The collection of elements to append. |

### func clear()

```cangjie
public func clear(): Unit
```

**Function:** Removes all elements from this `ObservedArrayList`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func clone()

```cangjie
public func clone(): ObservedArrayList<T>
```

**Function:** Returns a shallow copy of this `ObservedArrayList` instance.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ObservedArrayList](#class-observedarraylist)\<T> | A shallow copy of this `ObservedArrayList` instance. |

### func get()

```cangjie
public func get(): ArrayList<T>
```

**Function:** Returns an `ArrayList` containing all elements of this `ObservedArrayList` in proper sequence.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| ArrayList\<T> | The returned `ArrayList`. |

### func insert(Int64, T)

```cangjie
public func insert(index: Int64, element: T): Unit
```

**Function:** Inserts the specified element at the specified position in this `ObservedArrayList`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The target index for insertion. |
| element | T | Yes | - | The element of type `T` to insert. |

### func insertAll(Int64, Collection\<T>)

```cangjie
public func insertAll(index: Int64, elements: Collection<T>): Unit
```

**Function:** Inserts all elements from the specified collection into this `ObservedArrayList` starting at the specified position. The function traverses the input collection in iterator order and inserts all elements at the specified position.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The target index for insertion. |
| elements | [Collection](<font color="red" face="bold">please add link</font>)\<T> | Yes | - | The collection of elements to insert. |

### func isEmpty()

```cangjie
public func isEmpty(): Bool
```

**Function:** Checks if this `ObservedArrayList` is empty.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the `ObservedArrayList` is empty; otherwise, returns `false`. |

### func prepend(T)

```cangjie
public func prepend(element: T): Unit
```

**Function:** Prepends the specified element to the beginning of this `ObservedArrayList`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| element | T | Yes | - | The element to prepend. |

### func prependAll(Collection\<T>)

```cangjie
public func prependAll(elements: Collection<T>): Unit
```

**Function:** Prepends all elements from the specified collection to the beginning of this `ObservedArrayList`. The function traverses the input collection in iterator order and inserts all elements at the start.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| elements | [Collection](<font color="red" face="bold">please add link</font>)\<T> | Yes | - | The collection of elements to prepend. |

### func remove(Int64)

```cangjie
public func remove(index: Int64): T
```

**Function:** Removes the element at the specified position in this `ObservedArrayList` and returns the removed element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The index of the element to remove. |

**Return Value:**

| Type | Description |
|:----|:----|
| T | The removed element. |

### func remove(Range\<Int64>)

```cangjie
public func remove(range: Range<Int64>): Unit
```

**Function:** Removes all elements within the specified range from this `ObservedArrayList`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| range | [Range](<font color="red" face="bold">please add link</font>)\<Int64> | Yes | - | The range of elements to remove. |

### func removeIf((T) -> Bool)

```cangjie
public func removeIf(predicate: (T) -> Bool): Unit
```

**Function:** Removes all elements from this `ObservedArrayList` that satisfy the given predicate function.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| predicate | (T)->Bool | Yes | - | The condition for removal. |

### func set(ArrayList\<T>)

```cangjie
public func set(newValue: ArrayList<T>): Unit
```

**Function:** Resets the value of this `ObservedArrayList` using an `ArrayList`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| newValue | ArrayList\<T> | Yes | - | The `ArrayList` used to set the value of this `ObservedArrayList`. |

### func set(Array\<T>)

```cangjie
public func set(newValue: Array<T>): Unit
```

**Function:** Resets the value of this `ObservedArrayList` using an `Array`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| newValue | Array\<T> | Yes | - | The `Array` used to set the value of this `ObservedArrayList`. |

### func set(ObservedComplexAbstract)

```cangjie
public func set(newValue: ObservedComplexAbstract): Unit
```

**Function:** Resets the value of this `ObservedArrayList` using an `ObservedComplexAbstract`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| newValue | [ObservedComplexAbstract](<font color="red" face="bold">please add link</font>) | Yes | - | The `ObservedComplexAbstract` used to set the value of this `ObservedArrayList`. |

### func subscribeInner(Observer)

```cangjie
public func subscribeInner(observer: Observer): Unit
```

**Function:** Recursively binds observation to each item in the state-managed array.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| observer | [Observer](<font color="red" face="bold">please add link</font>) | Yes | - | The observer class to bind. |

### func unsubscribeInner(Observer)

```cangjie
public func unsubscribeInner(observer: Observer): Unit
```

**Function:** Recursively unbinds observation from each item in the state-managed array.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| observer | [Observer](<font color="red" face="bold">please add link</font>) | Yes | - | The observer class to unbind. |

### func \[](int64)

```cangjie
public operator func [](index: Int64): T
```

**Function:** Operator overload - get. Returns the value of the element at the specified index.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The index for the get operation. |

**Return Value:**

| Type | Description |
|:----|:----|
| T | The value of the element at the specified index. |

### func [](Int64, T)

```cangjie
public operator func [](index: Int64, value!: T): Unit
```

**Function:** Operator overload - set. Replaces the element at the specified position in this list with the specified element using the subscript operator.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The index to set. |
| value | T | Yes | - | **Named parameter.** The value of type `T` to set. |

### Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var arr: ObservedArray<Int64> = ObservedArray<Int64>([1, 2])

    func build() {
        Column {
            Text("arr[0] is ${arr[0]}")
            Button("click").onClick {
                arr[0] = 0
            }
        }
    }
}
```

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var arr: ObservedArrayList<Int64> = ObservedArrayList<Int64>([1, 2])

    func build() {
        Column {
            Text("arr[0] is ${arr[0]}")
            Button("click").onClick {
                arr[0] = 0
            }
            Button("append").onClick {
                arr.append(0)
            }
        }
    }
}
```## class ObservedProperty

```cangjie
public open class ObservedProperty<T> <: ObservedPropertyAbstract {
    public init(info: String, initValue: T)
}
```

**Function:** Observable property class for components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [ObservedPropertyAbstract](<font color="red" face="bold">please add link</font>)

### init(String, T)

```cangjie
public init(info: String, initValue: T)
```

**Function:** Constructor for the ObservedProperty class.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| info | String | Yes | - | Initialization information for construction. |
| initValue | T | Yes | - | Initial value for construction. |

### func createProp(String)

```cangjie
public func createProp(info: String): ObservedProperty<T>
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| info | String | Yes | - | <font color="red" face="bold">please add description</font> |

**Return Value:**

| Type | Description |
|:----|:----|
| [ObservedProperty](#class-observedproperty)\<T> | <font color="red" face="bold">please add description</font> |

### func get()

```cangjie
public func get(): T
```

**Function:** Reads the data of a synchronous property.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| T | Data of the synchronous property. |

### func getInner()

```cangjie
public func getInner(): T
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| T | <font color="red" face="bold">please add description</font> |

### func set(T)

```cangjie
public open func set(newValue: T): Unit
```

**Function:** Sets the data of a synchronous property.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| newValue | T | Yes | - | Data to be set. |

### func subscribeEx(Observer)

```cangjie
public func subscribeEx(observer: Observer)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| observer | [Observer](<font color="red" face="bold">please add link</font>) | Yes | - | <font color="red" face="bold">please add description</font> |

### func unsubscribeEx(Observer)

```cangjie
public func unsubscribeEx(observer: Observer)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| observer | [Observer](<font color="red" face="bold">please add link</font>) | Yes | - | <font color="red" face="bold">please add description</font> |

## Example Code

**Notes on State Updates:** Concurrent modification of state variables within `spawn` expressions is not allowed, as it may lead to concurrency safety issues. When modifying state variables, it is recommended to use the `launch` method provided by the `concurrency` package to ensure state updates are executed on the main thread for concurrency safety. The following example demonstrates how to update state variables within a `spawn` expression:

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var text: String = "begin"

    func build() {
        Column(30) {
            Button(text).onClick { evt =>
                changeText({ p: String =>
                    // Use the launch expression to update state variables on the main thread
                    launch {
                        text = p
                    }
                })
            }
        }.width(100.percent)
    }

    private func changeText(callback: (String) -> Unit): Unit {
        spawn {
            while (true) {
                callback("blink 0")
                sleep(Duration.millisecond * 100)
                callback("blink 1")
                sleep(Duration.millisecond * 100)
            }
        }
    }
}
```