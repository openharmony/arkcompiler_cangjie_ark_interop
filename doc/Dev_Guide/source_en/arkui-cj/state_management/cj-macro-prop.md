# @Prop Macro: Unidirectional Synchronization Between Parent and Child Components

The variable decorated by \@Prop can establish a unidirectional synchronization relationship with the parent component. The variable decorated by \@Prop is mutable, but changes will not be synchronized back to its parent component.

Before reading the \@Prop documentation, developers are advised to first understand the basic usage of [\@State](./cj-macro-state.md).

## Overview

The variable decorated by \@Prop establishes a unidirectional synchronization relationship with the parent component:

- The \@Prop variable allows local modifications, but the changes will not be synchronized back to the parent component.
- When the data source changes, the \@Prop-decorated variable will be updated and will override all local changes. Therefore, the synchronization of values is from the parent component to the child component (the owning component), and changes in the child component's values will not be synchronized to the parent component.

## Constraints

- \@Prop modifies the state owned by the current component and can only be defined in child components. It cannot be used in custom components decorated with [\@Entry](../paradigm/cj-create-custom-components.md#basic-structure-of-custom-components).
- The variable decorated by \@Prop is mutable and must be declared with `var`, and its type must be specified.
- Local initialization of \@Prop is prohibited; it must be initialized from the parent component.
- The type of the \@Prop-decorated variable must match the data source type, and the data source must be a state variable decorated with a macro (e.g., \@State).

## Macro Usage Rules Explanation

|\@Prop|Description|
|:---|:---|
|Non-attribute macro|None.|
|Synchronization type|Unidirectional synchronization: Modifications to the parent component's state variable value will be synchronized to the child component's \@Prop-decorated variable. Modifications to the child component's \@Prop variable will not be synchronized back to the parent component's state variable. For nested scenarios, see [Observing Changes](#observing-changes).|
|Allowed variable types|Supports basic data types. For String, Int64, Float64, and Bool types, the type can be omitted. Other types must be explicitly specified.<br/>Supports enum, struct, and Option types. Internal modifications of struct types are not allowed.<br/>Supports class types. To observe internal changes, the class must be decorated with [\@Observed](./cj-macro-observed-and-publish.md) at definition time. Class properties and nested properties must be decorated with [\@Publish](./cj-macro-observed-and-publish.md) to observe changes. Nested classes follow the same rule. Since classes are reference types, modifying internal variables in the child component when decorated with \@Observed will affect the parent component.<br/>Supports array types. To observe internal changes, use [ObservedArray\<T\>](../../../../API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-componentstatemanagement.md#class-observedarray) and [ObservedArrayList\<T\>](../../../../API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-componentstatemanagement.md#class-observedarraylist). For custom array item types, use [\@Observed](./cj-macro-observed-and-publish.md) and [\@Publish](./cj-macro-observed-and-publish.md) to observe property assignments within array items. Other array and Collection types, such as Array, Varray, ArrayList, HashMap, and HashSet, support assigning new arrays but cannot observe changes to internal elements.<br/>Supports [Color](../../../../API_Reference//source_zh_cn/arkui-cj/cj-common-types.md#class-color) type.<br/>\@Prop and the [data source](./cj-state-management-overview.md#basic-concepts) types must match. There are three scenarios:<br/>- The types of \@Prop-decorated variables and \@State or other macros must be identical when synchronizing. See [Parent Component @State to Child Component @Prop Simple Data Type Synchronization](#parent-component-state-to-child-component-prop-simple-data-type-synchronization).<br/>- When synchronizing \@Prop-decorated variables with array items decorated by \@State or other macros, the \@Prop type must match the array item type. For example, \@Prop : T and \@State : Array\<T\>. See [Parent Component @State Array Item to Child Component @Prop Simple Data Type Synchronization](#parent-component-state-array-item-to-child-component-prop-simple-data-type-synchronization).<br/>- When the parent component's state variable is a struct or class, the \@Prop-decorated variable must match the property type of the parent component's state variable. See [Synchronization from Parent Component's @State Class Object Property to @Prop Simple Type](#synchronization-from-parent-components-state-class-object-property-to-prop-simple-type).<br/>For supported scenarios, see [Observing Changes](#observing-changes).|
|Nested passing depth|In component reuse scenarios, it is recommended that \@Prop-decorated deeply nested data does not exceed 5 levels. Excessive nesting may lead to excessive space usage due to deep copying and Garbage Collection, causing performance issues.|
|Initial value of decorated variable|The \@Prop-decorated variable must be initialized using variables provided by the parent component. Initialization within the child component is not allowed.|

## Variable Passing/Access Rules Explanation

|Passing/Access|Description|
|:---|:---|
|Initialization from parent component|When creating a new instance of a component, all \@Prop variables must be initialized. Initialization within the component is not supported. Supports initialization of child component \@Prop variables using regular variables in the parent component (assigning regular variables to \@Prop only initializes the value; changes to regular variables do not trigger UI updates. Only state variables can trigger UI updates), [\@State](./cj-macro-state.md), [\@Link](./cj-macro-link.md), \@Prop, [\@Provide](./cj-macro-provide-and-consume.md), [\@Consume](./cj-macro-provide-and-consume.md), [Publish](./cj-macro-observed-and-publish.md), [\@StorageLink](./cj-appstorage.md#storragelink), [\@StorageProp](./cj-appstorage.md#storrageprop), [\@LocalStorageLink](./cj-localstorage.md#localstoragelink), and [\@LocalStorageProp](./cj-localstorage.md#localstorageprop).|
|Initialization of child components|\@Prop supports initializing regular variables, \@State, \@Link, \@Prop, and \@Provide in child components.|
|External component access|The \@Prop-decorated variable is private and can only be accessed within the component. It cannot be modified by access modifiers.|

## Observing Changes and Behavior

### Observing Changes

The data decorated by \@Prop can observe the following changes.

- When the decorated data type is a basic data type, numerical changes can be observed.

    ```cangjie
    // Simple type
    @Prop var count: Int
    // Value assignment changes can be observed
    this.count = 1
    ```

- When the decorated data type is a struct, internal modifications are not allowed.

    Declare Person.

    ```cangjie
    struct Person {
        var id: Int64
        var name: String
        public init(id: Int64, name: String) {
            this.id = id
            this.name = name
        }
    }
    ```

    \@Prop decorates struct Person.

    ```cangjie
    // Struct type
    @Prop var person: Person
    ```

    Overall assignment to the \@Prop-decorated variable is allowed.

    ```cangjie
    // Struct type assignment
    this.person = Person(2, "muller")
    ```

    Assignment to the \@Prop-decorated variable's properties is not allowed, as indicated by the compiler.

    ```cangjie
    // Struct property assignment
    this.person.id = 3
    ```

- When the decorated data type is a class, it must be decorated with [@Observed](./cj-macro-observed-and-publish.md), and properties that need to observe changes internally must be decorated with [@Publish](./cj-macro-observed-and-publish.md). Without [@Observed](./cj-macro-observed-and-publish.md), internal changes such as member variables cannot be observed. For details, see [@Prop Nested Scenarios](#prop-nested-scenarios).

    Declare Person and Model classes.

    ```cangjie
    @Observed
    class Person {
        @Publish var value: String
    }

    @Observed
    class Model {
        @Publish var value: String = ""
        @Publish var name: Person = Person(value: " ")
    }
    ```

    \@Prop decorates type Model.

    ```cangjie
    @Prop var title: Model
    ```

    Assignment to the \@Prop-decorated variable.

    ```cangjie
    // Class property assignment
    this.title = Model(value: 'Hi', name: Person(value: 'ArkUI'))
    ```

    Assignments to both the \@Prop-decorated variable's properties and nested properties can be observed.

    ```cangjie
    // Class property assignment
    this.title.value = 'Hi'
    // Nested property
    this.title.name.value = 'ArkUI'
    ```

- When the decorated object is an array, individual array item changes cannot be observed, but overall changes can. To observe internal changes, use [ObservedArray\<T\>](../../../../API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-componentstatemanagement.md#class-observedarray) and [ObservedArrayList\<T\>](../../../../API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-componentstatemanagement.md#class-observedarraylist).

    When the \@Prop-decorated object is an ArrayList type array.

    ```cangjie
    @Prop var arrlist: ArrayList<Int16>
    ```

    Overall array changes can be observed.

    ```cangjie
    this.arrlist = ArrayList<Int16>([10,9,8])
    ```

    Array item assignments cannot be observed.

    ```cangjie
    this.arrlist[0] = 10
    ```

    Declare Model class.

    ```cangjie
    @Observed
    class Model {
        @Publish public var value: Int
    }
    ```

    When the \@Prop-decorated object is an ObservedArray\<Model\> type array.

    ```cangjie
    // ObservedArray array type
    @Prop var title: ObservedArray<Model>
    ```

    Array self-assignments can be observed.

    ```cangjie
    // Array assignment
    this.title = ObservedArray<Model>([Model(value: 2)])
    ```

    Array item assignments can be observed.

    ```cangjie
    // Array item assignment
    this.title[0] = Model(value: 2)
    ```

    Property assignments within array items can be observed.

    ```cangjie
    // Nested property assignments can be observed
    this.title[0].value = 6
    ```

    When the \@Prop-decorated object is an ObservedArrayList\<Model\> type array, adding and removing array items can be observed.

    Removing array items can be observed.

    ```cangjie
    // Array item change
    this.title.remove(0)
    ```

    Adding array items can be observed.

    ```cangjie
    // Array item change
    this.title.append(Model(value: 12))
    ```

For \@State and \@Prop synchronization scenarios:

- Use the value of the parent component's \@State variable to initialize the child component's \@Prop variable. When the \@State variable changes, its value will also be synchronized to the \@Prop variable.
- Modifications to the \@Prop-decorated variable will not affect the value of its data source \@State-decorated variable.
- Besides \@State, the data source can also be decorated with \@Link or \@Prop, and the synchronization mechanism for \@Prop is the same.
- The data source and \@Prop variable types must match. \@Prop allows simple types and class types.

- When the decorated variable is another array type or Collection type, such as Array, Varray, ArrayList, HashMap, and HashSet, assigning new arrays is supported, but changes to internal elements cannot be observed.
    Using HashSet as an example.

    ```cangjie
    // When the \@Prop-decorated object is a HashSet
    @Prop var message: HashSet<Int64>
    ```

    Overall HashSet changes can be observed.

    ```cangjie
    this.message = HashSet<Int64>(1,2,3)
    ```

    Internal HashSet changes cannot be observed.

    ```cangjie
    this.message.add(5)
    ```

### Framework Behavior

To understand the initialization and update mechanism of \@Prop variable values, it is necessary to understand the initial rendering and update process of the parent component and the child component with \@Prop variables.

1. Initial rendering:
   a. Execute the parent component's build() function to create a new instance of the child component and pass the data source to the child component;
   b. Initialize the child component's \@Prop-decorated variables.

2. Update:
   a. When the child component's \@Prop is updated, the update remains in the current child component and will not be synchronized back to the parent component;
   b. When the parent component's data source is updated, the child component's \@Prop-decorated variables will be reset by the parent component's data source, and all local modifications to \@Prop will be overwritten by the parent component's update.

> **Note:**
>
> Data updates decorated by \@Prop depend on the re-rendering of their owning custom component. Therefore, \@Prop cannot refresh when the application enters the background. It is recommended to use \@Link instead.

## Usage Scenarios

### Parent Component @State to Child Component @Prop Simple Data Type Synchronization

The following example demonstrates \@State to child component \@Prop simple data synchronization. The parent component EntryView's state variable countDownStartValue initializes the child component CountDownComponent's \@Prop-decorated count. Clicking "Try again" will modify count only within CountDownComponent and not synchronize it back to the parent component EntryView.

Changes to the parent component EntryView's state variable countDownStartValue will reset the child component CountDownComponent's count.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
class CountDownComponent {
    @Prop var count: Int64
    var costOfOneAttempt: Int64 = 1
    func build() {
        Column() {
            if (this.count > 0) {
                Text("You have ${this.count} Nuggets left")
            } else {
                Text('Game over!')
            }
            // @Prop-decorated variables will not be synchronized to the parent component
            Button("Try again")
                .margin(10)
                .onClick {
                    evt => this.count -= this.costOfOneAttempt
                }
        }
    }
}
@Entry
@Component
class EntryView {
    @State var countDownStartValue: Int64 = 10
    func build() {
        Column {
            Text("Grant ${this.countDownStartValue} nuggets to play.")
            // Modifications to the parent component's data source will be synchronized to child components
            Button("+1 - Nuggets in New Game")
                .margin(10)
                .onClick {
                    evt => this.countDownStartValue += 1
                }
            // Parent component modifications will be synchronized to child components
            Button("-1  - Nuggets in New Game")
                .margin(10)
                .onClick {
                    evt => this.countDownStartValue -= 1
                }
            CountDownComponent(count: this.countDownStartValue, costOfOneAttempt: 2)
        }
    }
}
```

![Video-Prop-CountDown](figures/Video-Prop-CountDown.gif)

In the above example:

1. When the CountDownComponent child component is first created, its `@Prop` decorated `count` variable will be initialized from the parent component's `@State` decorated `countDownStartValue` variable.

2. When clicking the "+1" or "-1" buttons, the parent component's `@State` decorated `countDownStartValue` value changes, triggering the parent component to re-render. During this process, UI components using the `countDownStartValue` state variable will be refreshed, and the `count` value in the CountDownComponent child component will be updated unidirectionally.

3. Updating the `count` state variable also triggers the re-rendering of CountDownComponent. During re-rendering, the `if` statement condition (`this.count > 0`) using the `count` state variable is evaluated, and the UI components in the `true` branch are executed to update the Text component's display.

4. When clicking the "Try again" button in the child component CountDownComponent, its `@Prop` variable `count` will be modified, but this change will not affect the parent component's `countDownStartValue` value.

5. When the parent component's `countDownStartValue` value changes, the parent component's modifications will override any local changes made to the `count` variable in the child component CountDownComponent.

### Synchronization from Parent Component's `@State` Array Items to Child Component's `@Prop` Simple Data Type

If the parent component's `@State` decorates an array, its array items can also initialize `@Prop`. In the following example, the parent component Index's `@State` decorated array `arr` initializes the child component Child's `@Prop` decorated `value` with its array items.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
class Child {
    @Prop var value: Int64
    func build() {
        Text("${this.value}")
            .fontSize(50.vp)
            .onClick {
                evt => this.value++
            }
    }
}

@Entry
@Component
class EntryView {
    @State var arr: Array<Int64> = [1, 2, 3]
    func build() {
        Row {
            Column {
                Child(value: this.arr[0])
                Child(value: this.arr[1])
                Child(value: this.arr[2])
                Divider().height(5)
                ForEach(
                    this.arr,
                    itemGeneratorFunc: {
                        item: Int64, _: Int64 => Child(value: item)
                    },
                    keyGeneratorFunc: {
                        item: Int64, _: Int64 => item.toString()
                    }
                )
                Text('replace entire arr')
                    .fontSize(50)
                    .onClick {
                        evt => if (this.arr[0] == 1) {
                            this.arr = [3, 4, 5]
                        } else {
                            this.arr = [1, 2, 3]
                        }
                    }
            }
        }
    }
}
```

Initial rendering creates 6 child component instances, each with a local copy of the array item for the `@Prop` decorated variable. The child component's `onClick` event handler modifies the local variable value.

If you click "1" six times, "2" five times, and "3" four times, all local variable values will become "7".

```text
7
7
7
----
7
7
7
```

After clicking "replace entire arr", the screen will display the following:

```text
7
7
7
----
7
4
5
```

- All modifications made in the child component Child will not be synchronized back to the parent component Index. Therefore, even though all 6 components display "7", the parent component Index's `this.arr` still holds the original value `[1, 2, 3]`.

- Clicking "replace entire arr" checks if `this.arr[0] == 1` is true, then assigns `this.arr` to `[3, 4, 5]`.

- Although `this.arr[0]` has changed, modifying the `@State` array in this scenario does not trigger updates to the child component's UI, meaning the changes are not synchronized to the `@Prop` variable. Thus, the value of `Child({value: this.arr[0]})` remains "7".

- The change to `this.arr` triggers a ForEach update. Both the old and new arrays contain the value "3": `[3, 4, 5]` and `[1, 2, 3]`. According to the diff algorithm, the array item "3" will be retained, while items "1" and "2" will be deleted, and items "4" and "5" will be added. This means the component corresponding to "3" will not be regenerated but moved to the first position. Thus, the component for "3" remains unchanged with a value of "7", and the final rendering result of ForEach is "7", "4", "5".

### Synchronization from Parent Component's `@State` Class Object Property to `@Prop` Simple Type

In this example, the Book class uses the `@Observed` macro. Since `class` is a reference type, decorating it with `@Observed` means modifications to the class's internal variables in the child component will affect the parent component. Thus, any property change in a ReaderComp will cause the `book` object to change.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Observed
class Book {
     public var title: String
     public var pages: Int64
     @Publish public var readIt: Bool = false
}

@Component
class ReaderComp {
    @Prop var book: Book
    func build() {
        Row() {
            Text(this.book.title)
            Text("...has${this.book.pages} pages!")
            Text("${this.book.readIt}")
                .fontSize(50.vp)
                .onClick {
                    evt =>
                        this.book.readIt = true
                }
        }
    }
}

@Entry
@Component
class EntryView {
    @State var book: Book = Book(title:'100 secrets of C++',pages: 765)
    func build() {
        Column {
            ReaderComp(book: this.book)
            ReaderComp(book: this.book)
        }
    }
}
```

![Video-Prop-Book](figures/Video-Prop-Book.gif)

### Synchronization from Parent Component's `@State` Array Items to `@Prop` Class Type

In the following example, modifying properties of Book objects in the `@State` decorated `allBooks` array requires decorating the `class Book` with `@Observed`. The properties of Book will be observed, and `ObservedArrayList` will be used to monitor additions, deletions, and modifications of Book objects.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Observed
class Book {
    public var title: String
    public var pages: Int64
    @Publish public var readIt: Bool = false
}

@Component
class ReaderComp {
    @Prop var book: Book
    func build() {
        Row() {
            Text(this.book.title)
            Text("...has${this.book.pages} pages!")
            Text("${this.book.readIt}").onClick {
                evt => this.book.readIt = true
            }
        }
        .backgroundColor(0x00ff00)
        .width(312)
        .height(40)
        .padding(left: 20, top: 10)
        .borderRadius(20)
        .margin(10)
    }
}

@Entry
@Component
class EntryView {
    @State var allBooks: ObservedArrayList<Book> = ObservedArrayList<Book>(
        [Book(title: "JS", pages: 765), Book(title: "Cangjie", pages: 652), Book(title: "ArkUI", pages: 765)])

    func build() {
        Column {
            Text('library`s all time favorite')
                .width(312)
                .height(40)
                .backgroundColor(0x00ff00)
                .borderRadius(20)
                .margin(12)
                .padding(left: 20)
            ReaderComp(book: this.allBooks[2])
            Divider()
            Text('Books on loan to a reader')
                .width(312)
                .height(40)
                .backgroundColor(0x00ff00)
                .borderRadius(20)
                .margin(12)
                .padding(left: 20)
            ForEach(
                this.allBooks,
                itemGeneratorFunc: {
                    item: Book, _: Int64 => ReaderComp(book: item)
                },
                keyGeneratorFunc: {
                    item: Book, _: Int64 => item.title
                }
            )
            Button("Add new")
                .width(312)
                .height(40)
                .margin(12)
                .onClick({
                    evt => this.allBooks.append(Book(title: "JA", pages: 512))
                })
            Button("Remove first book")
                .width(312)
                .height(40)
                .margin(12)
                .onClick(
                    {
                        evt => if (this.allBooks.size > 0) {
                            this.allBooks.remove(0)
                        } else {
                            AppLog.info("length <= 0")
                        }
                    })
        }
    }
}
```

Instances of classes decorated with `@Observed` are wrapped in opaque proxy objects that detect all property changes within the wrapped object. If such changes occur, the proxy notifies `@Prop`, and the `@Prop` object's value is updated.

![Video-prop-UsageScenario-one](figures/Video-prop-UsageScenario-one.gif)

### `@Prop` Nested Scenario

In nested scenarios, each layer must be decorated with `@Observed` and received by `@Prop` to ensure changes are detected.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

// The following is the data structure for nested class objects.
@Observed
class Son {
    @Publish var title: String
}

@Observed
class Father {
    @Publish var name: String
    @Publish var son: Son
}
// The following component hierarchy demonstrates the data structure of an @Prop nesting scenario.
@Entry
@Component
class EntryView {
    @State var person: Father = Father(name: 'Hello', son: Son(title: 'world'));
    func build() {
        Column {
            Flex(
                FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.SpaceBetween)) {
                Button('Change Father Name')
                    .width(312)
                    .height(40)
                    .margin(12)
                    .onClick({
                        evt => this.person.name = 'Hi'
                    })
                Button('Change Son Title')
                    .width(312)
                    .height(40)
                    .margin(12)
                    .onClick({
                        evt => this.person.son.title = 'ArkUI'
                    })
                Text(this.person.name)
                    .fontSize(16)
                    .margin(12)
                    .width(312)
                    .height(40)
                    .borderRadius(20)
                    .textAlign(TextAlign.Center)
                    .onClick({
                        evt => this.person.name = 'Bye'
                    })
                Text(this.person.son.title)
                    .fontSize(16)
                    .margin(12)
                    .width(312)
                    .height(40)
                    .borderRadius(20)
                    .textAlign(TextAlign.Center)
                    .onClick({
                        evt => this.person.son.title = "JS"
                    })
                Child(child: this.person.son)
            }
        }
    }
}

@Component
class Child {
    @Prop var child: Son
    func build() {
        Column() {
            Text(this.child.title)
                .fontSize(16)
                .margin(12)
                .width(312)
                .height(40)
                .borderRadius(20)
                .textAlign(TextAlign.Center)
                .onClick({
                    evt => this.child.title = "Bye Bye"
                })
        }
    }
}
```

![Video-prop-UsageScenario-three](figures/Video-prop-UsageScenario-three.gif)
