# LazyForEach: Lazy Data Loading

For API parameter descriptions, refer to: [LazyForEach API Parameters](../../../../API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-lazyforeach.md).

LazyForEach iterates through the provided data source on demand and creates corresponding components during each iteration. When used within a scrollable container, the framework creates components based on the visible area of the container. When components scroll out of the visible area, the framework destroys and recycles them to reduce memory usage.

## Usage Restrictions

- LazyForEach must be used within container components. Only [List](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-list.md), [Grid](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-grid.md), and [Swiper](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-swiper.md) components support lazy data loading (configurable via the `cachedCount` property, which loads only the visible portion and a small buffer of adjacent data). Other components still load all data at once.
- LazyForEach relies on generated key values to determine whether to refresh child components. If the key values do not change, LazyForEach cannot trigger the refresh of corresponding child components.
- When using LazyForEach within a container component, only one LazyForEach is allowed. For example, in a List, it is not recommended to include ListItem, ForEach, and LazyForEach simultaneously, nor is it recommended to include multiple LazyForEach instances.
- In each iteration, LazyForEach must create exactly one child component; that is, the child component generator function must have exactly one root component.
- The generated child components must be allowed within the parent container component of LazyForEach.
- LazyForEach can be included in `if/else` conditional rendering statements, and `if/else` conditional rendering statements can also appear within LazyForEach.
- The key generator must produce unique values for each data item. If key values are identical, rendering issues may occur for UI components with the same keys.
- LazyForEach must be updated using a DataChangeListener object. Reassigning the first parameter `dataSource` will cause exceptions. When `dataSource` uses state variables, changes to the state variables will not trigger UI refreshes in LazyForEach.
- For high-performance rendering, when updating the UI via the `onDataChange` method of the DataChangeListener object, new key values different from the original ones must be generated to trigger component refreshes.
- LazyForEach must be used with the `@Reusable` decorator to enable node reuse. Usage: Apply the [@Reusable](../paradigm/cj-macro-reusable.md) decorator to the components in the LazyForEach list. See [Usage Rules](../paradigm/cj-macro-reusable.md).

## Key Generation Rules

During LazyForEach rendering, the system generates a unique and persistent key value for each item to identify the corresponding component. When this key value changes, the ArkUI framework treats the array element as replaced or modified and creates a new component based on the new key value.

LazyForEach provides a `keyGenerator` parameter, which is a function allowing developers to customize key generation rules. If the developer does not define a `keyGenerator` function, the ArkUI framework uses the default key generation function: `{data: T, idx: Int64 => return "\${viewID} - \${idx} - \${uniqueKey_}"}`. The `viewId` is generated during compiler transformation and remains consistent within the same LazyForEach component.

## Component Creation Rules

After determining the key generation rules, the `itemGenerator` function of LazyForEach creates components for each array item in the data source according to the component creation rules. Component creation includes two scenarios: [First Render](#first-render) and [Non-First Render](#non-first-render).

### First Render

#### Generating Different Key Values

During the first render, LazyForEach generates unique key values for each array item in the data source according to the key generation rules and creates corresponding components.

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: Generic Array BasicDataSource Code **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())
    let random: Random = Random(3)
    @State var message: String = ""

    protected override func aboutToAppear() {
        for (i in 0..100) {
            let index = this.dataSource.totalCount()
            dataSource.data.add(i.toString())
            dataSource.notifyDataAdd(index)
        }
    }

    public func build(): Unit {
        Column() {
            Row() {
                Text(this.message).width(300.px)
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("item[${index}]: ${item}").fontSize(30).onAppear({=> this.message="appear:" + item})
                        }
                    }, keyGeneratorFunc: { item: String, index: Int64 => item}
                )
            }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

In the above code, the key generation rule is the return value `item` of the `keyGenerator` function. During LazyForEach rendering, it generates key values `item[0]: 0`, `item[1]: 1`, ..., `item[100]: 100` for the data source array items and creates corresponding ListItem child components to render on the interface.

The running effect is shown below.

**Figure 1** LazyForEach Normal First Render

![lazyforeach-2](figures/lazyforeach-2.gif)

#### Error Rendering with Identical Key Values

When different data items generate identical key values, the framework's behavior is unpredictable. For example, in the following code, LazyForEach renders data items with identical key values. During scrolling, LazyForEach preloads child components that enter or leave the current page. Since the newly created child components and the original ones share the same key values, the framework may incorrectly reuse cached components, leading to rendering issues.

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: Generic Array BasicDataSource Code **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())
    @State var message: String = ""

    protected override func aboutToAppear() {
        for (i in 0..100) {
            let index = this.dataSource.totalCount()
            dataSource.data.add(i.toString())
            dataSource.notifyDataAdd(index)
        }
    }

    public func build(): Unit {
        Column() {
            Row() {
                Text(this.message).width(300.px)
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("item[${index}]: ${item}").fontSize(30).onAppear({=> this.message="appear:" + item})
                        }
                    }, keyGeneratorFunc: { item: String, index: Int64 =>  return "samekey"}
                )
            }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

The running effect is shown below.

**Figure 2** LazyForEach with Identical Key Values

![lazyforeach-3](./figures/lazyforeach-3.gif)

### Non-First Render

When the LazyForEach data source changes and requires re-rendering, developers should call the corresponding listener interface based on the data source changes to notify LazyForEach of updates. Usage scenarios are as follows.

#### Adding Data

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: Generic Array BasicDataSource Code **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }

    public func pushData(str: String): Unit {
        this.data.add(str)
        this.notifyDataAdd(this.data.size - 1)
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())
    let random: Random = Random(3)

    public func build(): Unit {
        Column() {
            Row() {
                Button("load Data").onClick({ =>
                    for (i in 0..10) {
                        dataSource.pushData(i.toString())
                    }
                })

                Button("add Data").onClick({ =>
                    // Click to append child components
                    dataSource.pushData(dataSource.totalCount().toString())
                })
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("item[${index}]: ${item}").fontSize(30)
                        }
                    }
                )
            }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

When clicking the "add Data" button, the `pushData` method of the `dataSource` is called first. This method adds data to the end of the data source and calls `notifyDataAdd`. Inside `notifyDataAdd`, the `listenerItem.onDataAdd` method is called, which notifies LazyForEach of the data addition at that index. LazyForEach then creates new child components at that index.

The running effect is shown below.

**Figure 3** LazyForEach Adding Data

![lazyforeach-1](./figures/lazyforeach-1.gif)

#### Deleting Data

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: Generic Array BasicDataSource Code **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }

    public func pushData(str: String): Unit {
        this.data.add(str)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func deleteData(index: Int64): Unit {
        this.data.remove(at: index)
        this.notifyDataDelete(index)
    }

    public func getAllData(): ArrayList<String> {
        return data
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())

    func findIndex(arrayList: ArrayList<String>, value: String): Int64 {
        for (i in 0..arrayList.size) {
            if (arrayList[i]==value) {
                return i
            }
        }
        return -1
    }

    public func build(): Unit {
        Column() {
            Row() {
                Button("load Data").onClick({ =>
                    for (i in 0..100) {
                        dataSource.pushData(i.toString())
                    }
                })
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("item[${index}]: ${item}").fontSize(30)
                        }.onClick({ _ =>
                            // Click to delete child components
                            this.dataSource.deleteData(findIndex(this.dataSource.getAllData(),item))
                        })
                    }, keyGeneratorFunc: { item: String, index: Int64 => return item}
                )
            }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

When clicking a ListItem element, the `deleteData` method of `dataSource` is called first. This method removes data from the data source and calls `notifyDataDelete`. Inside `notifyDataDelete`, the `listenerItem.onDataDelete` method is called, which notifies LazyForEach of the data deletion at that index. LazyForEach then removes the child component at that index.

The running effect is shown below.

**Figure 4** LazyForEach Deleting Data

![lazyforeach-4](./figures/lazyforeach-4.gif)

#### Swapping Data

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: Generic Array BasicDataSource Code **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }

    public func pushData(str: String): Unit {
        this.data.add(str)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func deleteData(index: Int64): Unit {
        this.data.remove(at: index)
        this.notifyDataDelete(index)
    }

    public func getAllData(): ArrayList<String> {
        return data
    }

    public func moveData(from: Int64, to: Int64): Unit {
        let temp: String = this.data[from]
        this.data[from] = this.data[to]
        this.data[to] = temp
        this.notifyDataMove(from, to)
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())
    var moved: ArrayList<Int64> = ArrayList<Int64>()

    func findIndex(arrayList: ArrayList<String>, value: String): Int64 {
        for (i in 0..arrayList.size) {
            if (arrayList[i]==value) {
                return i
            }
        }
        return -1
    }

    public func build(): Unit {
        Column() {
            Row() {
                Button("load Data").onClick({ =>
                    for (i in 0..100) {
                        dataSource.pushData(i.toString())
                    }
                })
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("item[${index}]: ${item}").fontSize(30)
                        }.onClick({ _ =>
                            this.moved.add(findIndex(this.dataSource.getAllData(),item))
                            if (this.moved.size == 2) {
                                // Click to swap child components
                                this.dataSource.moveData(this.moved[0], this.moved[1])
                                this.moved.clear()
                            }
                        })
                    }, keyGeneratorFunc: { item: String, index: Int64 => return item}
                )
            }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

When first clicking a child component of LazyForEach, the index of the data to be moved is stored in the member variable `moved`. Upon clicking another child component of LazyForEach, the initially clicked child component is moved to this position. The `moveData` method of the data source `dataSource` is called, which moves the corresponding data in the data source to the desired position and invokes the `notifyDataMove` method. Within `notifyDataMove`, the `listenerItem.onDataMove` method is called, notifying LazyForEach that data needs to be moved at this location. LazyForEach then swaps the child components at the `from` and `to` indices.

The runtime effect is shown below.

**Figure 5** LazyForEach Data Swapping

![lazyforeach-5](./figures/lazyforeach-5.gif)

#### Modifying Single Data

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: Generic Array BasicDataSource Code **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }

    public func pushData(str: String): Unit {
        this.data.add(str)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func deleteData(index: Int64): Unit {
        this.data.remove(at: index)
        this.notifyDataDelete(index)
    }

    public func getAllData(): ArrayList<String> {
        return data
    }

    public func moveData(from: Int64, to: Int64): Unit {
        let temp: String = this.data[from]
        this.data[from] = this.data[to]
        this.data[to] = temp
        this.notifyDataMove(from, to)
    }

    public func changeData(index: Int64, str: String): Unit {
        this.data[index]=str
        this.notifyDataChange(index)
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())

    func findIndex(arrayList: ArrayList<String>, value: String): Int64 {
        for (i in 0..arrayList.size) {
            if (arrayList[i]==value) {
                return i
            }
        }
        return -1
    }

    public func build(): Unit {
        Column() {
            Row() {
                Button("load Data").onClick({ =>
                    for (i in 0..100) {
                        dataSource.pushData(i.toString())
                    }
                })
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("item[${index}]: ${item}").fontSize(30)
                        }.onClick({ _ =>
                            this.dataSource.changeData(findIndex(this.dataSource.getAllData(), item), item+"0")
                    })
                }, keyGeneratorFunc: { item: String, index: Int64 => return item})

        }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

When clicking a child component of LazyForEach, the current data is first modified, and then the `changeData` method of the data source `dataSource` is called. Within this method, the `notifyDataChange` method is invoked. Inside `notifyDataChange`, the `listenerItem.onDataChange` method is called, notifying LazyForEach that data has changed at this location. LazyForEach then rebuilds the child component at the corresponding index.

The runtime effect is shown below.

**Figure 6** LazyForEach Modifying Single Data

![lazyforeach-6](./figures/lazyforeach-6.gif)

#### Modifying Multiple Data

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: Generic Array BasicDataSource Code **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }

    public func pushData(str: String): Unit {
        this.data.add(str)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func reloadData(): Unit {
        this.notifyDataReload()
    }

    public func modifyAllData(): Unit {
        for (i in 0..this.data.size) {
            this.data[i] += "0"
        }
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())

    func findIndex(arrayList: ArrayList<String>, value: String): Int64 {
        for (i in 0..arrayList.size) {
            if (arrayList[i]==value) {
                return i
            }
        }
        return -1
    }

    public func build(): Unit {
        Column() {
            Row() {
                Button("load Data").onClick({ =>
                    for (i in 0..100) {
                        dataSource.pushData(i.toString())
                    }
                })
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("item[${index}]: ${item}").fontSize(30)
                        }.onClick({ _ =>
                            this.dataSource.modifyAllData()
                            this.dataSource.reloadData()
                    })
                }, keyGeneratorFunc: { item: String, index: Int64 => return item+index.toString()})
        }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

When clicking a child component of LazyForEach, the `modifyAllData` method of `dataSource` is first called to modify all data in the data source, followed by the `reloadData` method of the data source. Within this method, the `notifyDataReload` method is invoked. Inside `notifyDataReload`, the `listenerItem.onDataReloaded` method is called, notifying LazyForEach that all child nodes need to be rebuilt. LazyForEach then performs a key-value comparison between all original data items and new data items. If the keys match, the cache is used; if the keys differ, the components are rebuilt.

The runtime effect is shown below.

**Figure 7** LazyForEach Modifying Multiple Data

![lazyforeach-7](figures/lazyforeach-7.gif)

#### Precise Batch Data Modification

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: Generic Array BasicDataSource Code **/

class MyDataSource <: BasicDataSource<String> {
    var data: ArrayList<String> = ArrayList<String>(['0', '0', 'Hello a', 'Hello b', 'Hello c', 'Hello d', 'Hello e',
                                                    'Hello f', 'Hello g', 'Hello h', 'Hello i', 'Hello j', 'Hello k',
                                                    'Hello l', 'Hello m', 'Hello n', 'Hello o', 'Hello p',
                                                    'Hello q', 'Hello r'])
    public MyDataSource() {
        super(data)
    }

    public func pushData(str: String): Unit {
        this.data.add(str)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func operateData(): Unit {
        this.data[4]=this.data[1]
        this.data.remove(at: 1)

        let temp: String = this.data[4]
        this.data[4] = this.data[6]
        this.data[6] = temp

        this.data.add(all: ["Hello 1", "Hello 2"], at: 8)

        this.data.remove(at: 10)
        this.data.remove(at: 11)
        this.notifyDatasetChange(ArrayList<DataOperation>([
                DataMoveOperation(from: 1, to: 3),
                DataExchangeOperation(start: 4, end: 6),
                DataAddOperation(8, count: 2, key: "", keys: [""]),
                DataDeleteOperation(10, count: 2)
            ]))
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource()

    public func build(): Unit {
        Column() {
            Row() {
                Button("change Data").onClick({ =>
                    this.dataSource.operateData()
                })
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("${item}").fontSize(30)
                        }
                }, keyGeneratorFunc: { item: String, index: Int64 => return item+index.toString()})
        }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

When clicking a child component of LazyForEach, the `modifyAllData` method of `dataSource` is first called to modify all data in the data source, followed by the `reloadData` method of the data source. Within this method, the `notifyDataReload` method is invoked. Inside `notifyDataReload`, the `listener.onDataReloaded` method is called, notifying LazyForEach that all child nodes need to be rebuilt. LazyForEach then performs a key-value comparison between all original data items and new data items. If the keys match, the cache is used; if the keys differ, the components are rebuilt.

The runtime effect is shown below.

**Figure 8** LazyForEach Modifying Multiple Data

![lazyforeach-8](figures/lazyforeach-8.gif)

Second example: Directly assign values to the array, with operations derived from comparing the original and new arrays.

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: BasicDataSource code for generic type arrays **/

class MyDataSource <: BasicDataSource<String> {
    var data: ArrayList<String> = ArrayList<String>(['Hello a', 'Hello b', 'Hello c', 'Hello d',
                                                    'Hello e', 'Hello f', 'Hello g', 'Hello h'])
    public MyDataSource() {
        super(data)
    }

    public func operateData(): Unit {
        this.data = ArrayList<String>(['Hello a', 'Hello 1', 'Hello 2', 'Hello b', 'Hello c', 'Hello e',
                                    'Hello d', 'Hello f', 'Hello g', 'Hello h'])
        this.notifyDatasetChange(ArrayList<DataOperation>([
                DataAddOperation(1, count: 2, key: "", keys: []),
                DataExchangeOperation(start: 3, end: 4)
            ]))
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource()

    public func build(): Unit {
        Column() {
            Row() {
                Button("change Data").onClick({ =>
                    this.dataSource.operateData()
                })
            }
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("${item}").fontSize(30)
                        }
                }, keyGeneratorFunc: { item: String, index: Int64 => return item+index.toString()})
        }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

**Figure 9** LazyForEach Modifying Multiple Data Items

![lazyforeach-9](figures/lazyforeach-9.gif)

The following considerations apply when using this interface:

1. `onDatasetChange` cannot be mixed with other data manipulation interfaces.
2. For each `operation` in the `operations` passed to `onDatasetChange`, the `index` should be located in the original array before modification. Therefore, the `index` in `operations` does not always correspond one-to-one with the index in the `Datasource`, and it cannot be negative.

The first example clearly illustrates this point:

```cangjie
// Original array before modification
["Hello a","Hello b","Hello c","Hello d","Hello e","Hello f","Hello g","Hello h","Hello i","Hello j","Hello k","Hello l","Hello m","Hello n","Hello o","Hello p","Hello q","Hello r"]
// Modified array
["Hello a","Hello c","Hello d","Hello b","Hello g","Hello f","Hello e","Hello h","Hello 1","Hello 2","Hello i","Hello j","Hello m","Hello n","Hello o","Hello p","Hello q","Hello r"]
```

"Hello b" moved from position 2 to position 4, so the first operation is `DataMoveOperation(from: 1, to: 3)`.

"Hello e" and "Hello g" were swapped. In the original array before modification, "Hello e" was at `index=4`, and "Hello g" was at `index=6`. Therefore, the second operation is `DataExchangeOperation(start: 4, end: 6)`.

"Hello 1" and "Hello 2" were inserted after "Hello h", which was at `index=7` in the original array. Therefore, the third operation is `DataAddOperation(8, count: 2, key: "", keys: [])`.

"Hello k" and "Hello l" were deleted. "Hello k" was at `index=10` in the original array, so the fourth operation is `DataDeleteOperation(10, count: 2)`.

1. When calling `onDatasetChange` once, an `index` can only be operated on once. If it is operated on multiple times, LazyForEach will only apply the first operation.
2. For some operations, developers can pass key values. LazyForEach will not repeatedly call `keyGenerator` to obtain key values, so developers must ensure the correctness of the passed key values.
3. If there is a `RELOAD` operation in the current operation set, all other operations will not take effect.

#### Modifying Sub-Properties of Data

If relying solely on LazyForEach's refresh mechanism, when an `item` changes and you want to update child components, the original child components must be destroyed and rebuilt. For complex child component structures, refreshing by changing key values can lead to lower performance. Therefore, the framework provides the `@Observed` and `@ObjectLink` mechanisms for deep observation, which can refresh only the components that use the modified property, thereby improving rendering performance. Developers can choose which refresh method to use based on their specific business needs.

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: BasicDataSource code for generic type arrays **/

@Observed
public class StringData {
    @Publish var message: String
}

class MyDataSource <: BasicDataSource<StringData> {
    public var data: ArrayList<StringData> = ArrayList<StringData>()
    public MyDataSource() {
        super(this.data)
    }

    public func pushData(stringData: StringData): Unit {
        this.data.add(stringData)
        this.notifyDataAdd(this.data.size - 1)
    }
}

@Component
class ChildComponent {
    @Link var data: StringData
    func build() {
        Row() {
            Text(this.data.message).fontSize(50)
        }
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource()

    protected override func aboutToAppear() {
        for (i in 0..20) {
              this.dataSource.pushData(StringData(message: "Hello ${i}"))
        }
    }

    public func build(): Unit {
        Column() {
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: StringData, index: Int64 =>
                        ListItem() {
                            ChildComponent(data: item)
                        }.onClick({ _ => item.message += "0"})
                }, keyGeneratorFunc: { item: StringData, index: Int64 => return index.toString()})
        }.cachedCount(5)

        }.height(100.percent).height(100.percent)
    }
}
```

When clicking a LazyForEach child component to modify `item.message`, the re-rendering relies on the `@Link` member variable of `ChildComponent` listening to its sub-properties. In this case, the framework will only refresh `Text(this.data.message)` and will not rebuild the entire `ListItem` child component.

**Figure 10** LazyForEach Modifying Sub-Properties of Data

![lazyforeach-10](figures/lazyforeach-10.gif)

## Common Usage Issues

### Unexpected Rendering Results

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: BasicDataSource code for generic type arrays **/

class MyDataSource <: BasicDataSource<String> {
    public var data: ArrayList<String> = ArrayList<String>()
    public MyDataSource() {
        super(this.data)
    }

    public func pushData(stringData: String): Unit {
        this.data.add(stringData)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func deleteData(index: Int64): Unit {
        this.data.remove(at: index)
        this.notifyDataDelete(index)
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource()

    protected override func aboutToAppear() {
        for (i in 0..20) {
              this.dataSource.pushData("Hello ${i}")
        }
    }

    public func build(): Unit {
        Column() {
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text(item)
                                .fontSize(50)
                        }.onClick({ _ =>
                            // Click to delete the child component
                            this.dataSource.deleteData(index)
                        })
                        .margin(left: 10, right: 10)
                }, keyGeneratorFunc: { item: String, index: Int64 => return item})
            }.cachedCount(5)
        }.height(100.percent)
        .width(100.percent)
    }
}
```

**Figure 11** LazyForEach Unexpected Deletion Behavior

![lazyforeach-11](figures/lazyforeach-11.gif)

When we click child components multiple times, we may find that the deleted component is not always the one we clicked. The reason is that after deleting a child component, the `index` of subsequent data items should be decremented by 1. However, the child components corresponding to these data items still use the initially assigned `index`, which does not change in the `itemGenerator`. As a result, the deletion outcome does not match expectations.

The fixed code is shown below.

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: BasicDataSource code for generic type arrays **/

class MyDataSource <: BasicDataSource<String> {
    public var data: ArrayList<String> = ArrayList<String>()
    public MyDataSource() {
        super(this.data)
    }

    public func pushData(stringData: String): Unit {
        this.data.add(stringData)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func deleteData(index: Int64): Unit {
        this.data.remove(at: index)
        this.notifyDataDelete(index)
    }

    public func reloadData(): Unit {
        this.notifyDataReload()
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource()

    protected override func aboutToAppear() {
        for (i in 0..20) {
              this.dataSource.pushData("Hello ${i}")
        }
    }

    public func build(): Unit {
        Column() {
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text(item)
                                .fontSize(50)
                        }.onClick({ _ =>
                            // Click to delete the child component
                            this.dataSource.deleteData(index)
                            // Reset the index of all child components
                            this.dataSource.reloadData()
                        })
                        .margin(left: 10, right: 10)
                }, keyGeneratorFunc: { item: String, index: Int64 => return item + index.toString()})
            }.cachedCount(5)
        }.height(100.percent)
        .width(100.percent)
    }
}
```

After deleting a data item, call the `reloadData` method to rebuild subsequent data items to update their `index` values. To ensure that `reloadData` rebuilds the data items, new keys must be generated for them. Here, `item + index.toString()` is used to ensure that data items following the deleted one are rebuilt. Alternatively, using `item + DateTime.now().toString()` would generate new keys for all data items, causing all of them to be rebuilt. This approach achieves the same effect but with slightly worse performance.

**Figure 12** Fixed LazyForEach Deletion Behavior

![lazyforeach-12](figures/lazyforeach-12.gif)

### Screen Flickering When Used Inside List

Calling `onDataReloaded` in the `onScrollIndex` method of `List` may cause screen flickering.

```cangjie
/** BasicDataSource code can be found in the appendix at the end of the document: BasicDataSource code for generic type arrays **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }

    public func pushData(stringData: String): Unit {
        this.data.add(stringData)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func operateData(): Unit {
        let totalCount = this.data.size
        let batch = 5
        for (i in totalCount..totalCount+batch) {
            this.data.add("Hello ${i}")
        }
        this.notifyDataReload()
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())

    protected override func aboutToAppear() {
        for (i in 0..10) {
            this.dataSource.pushData("Hello ${i}")
        }
    }

    public func build(): Unit {
        Column() {
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text(item)
                                .width(100.percent)
                                .height(80)
                                .backgroundColor(Color.GREY)
                                .fontSize(30)
                        }.margin(left: 10, right: 10)
                    }
                )
            }.cachedCount(10)
            .onScrollIndex({start: Int32, end: Int32, center: Int32 =>
                if (Int64(end) == this.dataSource.totalCount() - 1) {
                        this.dataSource.operateData()
                }
            })

        }.height(100.percent).height(100.percent)
    }
}
```

When the List is scrolled to the bottom, the screen flickering effect is shown in the figure below.

![lazyforeach](figures/lazyforeach-13.gif)

Using `onDatasetChange` instead of `onDataReloaded` not only fixes the screen flickering issue but also improves loading performance.

```cangjie
/** Refer to the appendix at the end of the document for BasicDataSource code: Generic array type BasicDataSource code **/

class MyDataSource <: BasicDataSource<String> {
    public MyDataSource(let data: ArrayList<String>) {
        super(data)
    }

    public func pushData(stringData: String): Unit {
        this.data.add(stringData)
        this.notifyDataAdd(this.data.size - 1)
    }

    public func operateData(): Unit {
        let totalCount = this.data.size
        let batch = 5
        for (i in totalCount..totalCount+batch) {
            this.data.add("Hello ${i}")
        }
        this.notifyDatasetChange(ArrayList<DataOperation>([
                DataAddOperation(Int32(totalCount - 1), count: Int32(batch), key: "", keys: [""])
            ]))
    }
}

@Entry
@Component
public class EntryView {
    let dataSource: MyDataSource = MyDataSource(ArrayList<String>())

    protected override func aboutToAppear() {
        for (i in 0..10) {
            this.dataSource.pushData("Hello ${i}")
        }
    }

    public func build(): Unit {
        Column() {
            List(space: 3) {
                LazyForEach(dataSource, itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text(item)
                                .width(100.percent)
                                .height(80)
                                .backgroundColor(Color.GREY)
                                .fontSize(30)
                        }.margin(left: 10, right: 10)
                    }
                )
            }.cachedCount(10)
            .onScrollIndex({start: Int32, end: Int32, center: Int32 =>
                if (Int64(end) == this.dataSource.totalCount() - 1) {
                        this.dataSource.operateData()
                }
            })

        }.height(100.percent).height(100.percent)
    }
}
```

![lazyforeach](figures/lazyforeach-14.gif)

## Appendix

### Generic Array Type BasicDataSource Code

```cangjie
// BasicDataSource implements the IDataSource interface for managing listener registration and notifying LazyForEach of data updates
public open class BasicDataSource<T> <: IDataSource<T> {
    public BasicDataSource(let data_: ArrayList<T>) {}
    public var listenerOp: ArrayList<DataChangeListener> = ArrayList<DataChangeListener>()
    public func totalCount(): Int {
        return data_.size
    }
    public func getData(index: Int): T {
        return data_[index]
    }

    // This method is called by the framework to register listener callbacks for LazyForEach components
    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        for (listeneritem in listenerOp) {
            if (refEq(listeneritem, listener)) {
                return
            }
        }
        listenerOp.add(listener)
    }

    // This method is called by the framework to unregister listener callbacks for corresponding LazyForEach components
    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        var index = 0
        while (index < listenerOp.size) {
            let listeneritem = listenerOp[index]
            if (refEq(listeneritem, listener)) {
                listenerOp.remove(at: index)
            } else {
                index++
            }
        }
    }

    // Notifies LazyForEach components to reload all child components
    public func notifyDataReload(): Unit {
        for (listeneritem in listenerOp) {
            listeneritem.onDataReloaded()
        }
    }

    // Notifies LazyForEach components that data at the specified index has changed and requires rebuilding the child component
    public func notifyDataChange(index: Int64): Unit {
        for (listeneritem in listenerOp) {
            listeneritem.onDataChange(index)
        }
    }

    // Notifies LazyForEach components to add a child component at the specified index
    public func notifyDataAdd(index: Int64): Unit {
        for (listeneritem in listenerOp) {
            listeneritem.onDataAdd(index)
        }
    }

    // Notifies LazyForEach components to delete the child component at the specified index
    public func notifyDataDelete(index: Int64): Unit {
        for (listeneritem in listenerOp) {
            listeneritem.onDataDelete(index)
        }
    }

    // Notifies LazyForEach components to swap child components between from and to indices
    public func notifyDataMove(from: Int64, to: Int64): Unit {
        for (listeneritem in listenerOp) {
            listeneritem.onDataMove(from, to)
        }
    }

    public func notifyDatasetChange(operations: ArrayList<DataOperation>): Unit {
        for (listeneritem in listenerOp) {
            listeneritem.onDatasetChange(operations)
        }
    }
}
```