# ForEach: Loop Rendering

The ForEach interface performs loop rendering based on array-type data and must be used in conjunction with container components. The components returned by the interface should be child components that are allowed to be included within the parent container component of ForEach. For example, the ListItem component requires that the parent container component of ForEach must be a [List component](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-list.md).

## Key Generation Rules

During ForEach loop rendering, the system generates a unique and persistent key value for each array element to identify the corresponding component. When this key value changes, Cangjie will consider the array element as replaced or modified and will create a new component based on the new key value.

ForEach provides a parameter called `keyGeneratorFunc`, which is a function that allows developers to customize the key generation rules. If the developer does not define a `keyGenerator` function, the ArkUI framework will use the default key generation function.

The ArkUI framework has a specific set of judgment rules for ForEach key generation, primarily related to the second parameter `index` of the `itemGenerator` function and the second parameter `index` of the `keyGeneratorFunc` function.

> **Note:**
>
> The ArkUI framework will issue a warning for duplicate key values. In scenarios involving UI updates, if duplicate key values occur, the framework may not function properly. For details, refer to [Unexpected Rendering Results](#Unexpected-Rendering-Results).

## Component Creation Rules

After determining the key generation rules, the second parameter `itemGeneratorFunc` of ForEach will create components for each array item in the data source based on the key generation rules. Component creation includes two scenarios: [First Rendering of ForEach](#First-Rendering) and [Non-First Rendering of ForEach](#Non-First-Rendering).

## First Rendering

During the first rendering of ForEach, a unique key value is generated for each array item in the data source according to the aforementioned key generation rules, and the corresponding component is created.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
class ChildItem {
    @Prop var item: String
    func build() {
        Text(this.item)
        .fontSize(50)
    }
}

@Entry
@Component
class EntryView {
    @State var simpleList: Array<String> = ['one', 'two','three']
    func build() {
        Row() {
            Column() {
                ForEach(this.simpleList,itemGeneratorFunc: {item: String,idx:Int64 =>
            ChildItem(item: item)}, keyGeneratorFunc: {item: String, idx: Int64 => return item})
            }
            .justifyContent(FlexAlign.Center)
            .width(100.percent)
            .height(100.percent)
        }
        .height(100.percent)
        .backgroundColor(Color.WHITE)
    }
}
```

The running effect is shown in the figure below.

Figure 1 First Rendering Effect of ForEach Data Source Without Duplicate Values

![onetwothree](figures/onetwothree.png)

In the above code, the key generation rule is the return value `item` of the `keyGeneratorFunc` function. During ForEach loop rendering, key values `one`, `two`, and `three` are generated sequentially for the data source array items, and the corresponding `ChildItem` components are created and rendered on the interface.

When different array items generate the same key value according to the key generation rules, the framework's behavior is undefined. For example, in the following code, when ForEach renders the same data item `two`, only one `ChildItem` component is created, and multiple components with the same key value are not created.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
class ChildItem {
    @Prop var item: String
    func build() {
        Text(this.item)
        .fontSize(50)
    }
}

@Entry
@Component
class EntryView {
    @State var simpleList: Array<String> = ['one', 'two','two','three']
    func build() {
        Row() {
            Column() {
                ForEach(this.simpleList,itemGeneratorFunc: {item: String,idx:Int64 =>
                    ChildItem(item: item)}, keyGeneratorFunc: {item: String, idx: Int64 => return item})
            }
            .justifyContent(FlexAlign.Center)
            .width(100.percent)
            .height(100.percent)
        }
        .height(100.percent)
        .backgroundColor(Color.WHITE)
    }
}
```

Figure 2 First Rendering Effect of ForEach Data Source With Duplicate Values

![onetwothree2](figures/onetwothree2.png)

In this example, the final key generation rule is `item`. When ForEach traverses the data source `simpleList` and reaches the `two` at index 1, it generates a component with the key value `two` and marks it. When it reaches the `two` at index 2, the key value generated for the current item is also `two`, and no new component is created.

## Non-First Rendering

During non-first rendering of the ForEach component, it checks whether the newly generated key values existed in the previous rendering. If a key value does not exist, a new component is created; if the key value exists, no new component is created, and the component corresponding to that key value is rendered directly. For example, in the following code snippet, clicking an event modifies the third array item to `"new three"`, triggering non-first rendering of the ForEach component.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
class ChildItem {
    @Prop var item: String
    func build() {
        Text(this.item)
        .fontSize(50)
    }
}

@Entry
@Component
class EntryView {
    @State var simpleList: ObservedArrayList<String> = ObservedArrayList<String>(['one', 'two','three'])
    func build() {
        Row() {
            Column() {
                Text("Click to Modify the Value of the Third Array Item")
                .fontSize(24)
                .fontColor(Color.RED)
                .onClick({evt=>
                this.simpleList[2] = 'new three'
                })
                ForEach(this.simpleList,itemGeneratorFunc: {item: String,idx:Int64 =>
                ChildItem(item: item)}, keyGeneratorFunc: {item: String, idx: Int64 => return item})
            }
            .justifyContent(FlexAlign.Center)
            .width(100.percent)
            .height(100.percent)
        }
        .height(100.percent)
        .backgroundColor(Color.WHITE)
    }
}
```

The running effect is shown in the figure below.

Figure 3 Non-First Rendering Effect of ForEach

![changenumthree.gif](figures/changenumthree.gif)

From this example, it can be observed that `@State` can monitor changes in the simple data type array data source `simpleList`.

1. When the `simpleList` array items change, ForEach is triggered to re-render.
2. ForEach traverses the new data source `['one', 'two', 'new three']` and generates the corresponding key values `one`, `two`, and `new three`.
3. Among these, the key values `one` and `two` existed in the previous rendering, so ForEach reuses the corresponding components and renders them. For the third array item `"new three"`, since the key value `new three` generated by the key generation rule `item` did not exist in the previous rendering, ForEach creates a new component for this array item.

## Usage Scenarios

The main application scenarios of the ForEach component during development include: [Unchanged Data Source](#Unchanged-Data-Source) and [Changes in Data Source Array Items](#Changes-in-Data-Source-Array-Items) (such as insertion and deletion operations).

## Unchanged Data Source

In scenarios where the data source remains unchanged, the data source can directly use basic data types. For example, during page loading, a skeleton screen list can be used for rendering.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Builder
func textArea(width: Int64, height:Int64) {
    Row()
    .width(width)
    .height(height)
    .backgroundColor(Color.WHITE)
}

@Component
class ArticleSkeletonView {
    func build() {
        Row() {
            Column() {
                textArea(80, 80)
            }
            .margin(right: 20 )
            Column() {
                textArea(60, 20)
                textArea(50, 20)
            }
            .alignItems(HorizontalAlign.Start)
            .justifyContent(FlexAlign.SpaceAround)
            .height(100)
        }
        .padding(20)
        .borderRadius(12)
        .backgroundColor(Color.GRAY)
        .height(120)
        .width(100.percent)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin(top: 20)
    }
}

@Entry
@Component
class EntryView {
    @State var simpleList: Array<Int64> = [1, 2, 3, 4, 5]
    func build() {
        Column() {
            ForEach(this.simpleList, itemGeneratorFunc: {item: Int64,idx:Int64 =>ArticleSkeletonView()}
            )
        }
        .padding(20)
        .width(100.percent)
        .height(100.percent)
    }
}
```

The running effect is shown in the figure below.

Figure 4 Skeleton Screen Running Effect

![skscreem.png](figures/skscreem.png)

## Changes in Data Source Array Items

In scenarios where data source array items change, such as array insertion, deletion operations, or changes in the index positions of array items, the data source should be an array of objects, and the unique ID of the object should be used as the final key value. For example, when loading the next page of data by swiping up on the page, new data items are added to the end of the data source array, thereby increasing the length of the data source array.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList
import kit.LocalizationKit.*
import kit.PerformanceAnalysisKit.Hilog

class Article {
    var id: String
    var title: String
    var brief: String
    init(id: String, title: String, brief: String) {
        this.id = id
        this.title = title
        this.brief = brief
    }
}

@Builder
func textArea(width: Int64, height:Int64) {
    Row()
    .width(width)
    .height(height)
    .backgroundColor(Color.WHITE)
}

@Component
class ArticleCard {
    @Prop var article: Article
    func build() {
        Row(){
        // Here, 'app.media.icon' is only an example. Developers should replace it themselves; otherwise, imageSource creation failure will prevent subsequent normal execution.
        Image(@r(app.media.startIcon))
        .width(80)
        .height(80)
        .margin(right:20)
        Column() {
            Text(this.article.title)
            .fontSize(20)
            .margin(bottom:8)
            Text(this.article.brief)
            .fontSize(16)
            .fontColor(Color.GRAY)
            .margin(bottom: 8)
        }
        .alignItems(HorizontalAlign.Start)
        .width(80.percent)
        .height(100.percent)
        }
        .padding(20)
        .borderRadius(12)
        .backgroundColor(Color.WHITE)
        .height(120)
        .width(100.percent)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin(top: 20)
    }
}

@Entry
@Component
class EntryView {
    @State var isListReachEnd: Bool = false
    @State var articleList: ObservedArrayList<Article> = ObservedArrayList<Article>([
        Article('001', 'Article 1', 'Article summary content'),
        Article('002', 'Article 2', 'Article summary content'),
        Article('003', 'Article 3', 'Article summary content'),
        Article('004', 'Article 4', 'Article summary content'),
        Article('005', 'Article 5', 'Article summary content'),
        Article('006', 'Article 6', 'Article summary content')
    ])
    func loadMoreArticles() {
        this.articleList.append(Article('007', 'Newly loaded article', 'Article summary content'))
            Hilog.info(0,"here","here")
    }
    func build() {
        Column(5) {
            List() {
                ForEach(this.articleList, itemGeneratorFunc: {item: Article,idx:Int64  =>
                    ListItem() {
                        ArticleCard(article: item)
                    }
                    }, keyGeneratorFunc: {item: Article, idx: Int64 => return item.id})
            }
            .onReachEnd( {=>
                this.isListReachEnd = true
            })
            .parallelGesture(
                PanGesture()
                .onActionStart({e=>
                    if (this.isListReachEnd) {
                    this.loadMoreArticles()
                    this.isListReachEnd = false
                    }
                })
        )
        .padding(20)
        .scrollBar(BarState.Off)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(Color.GRAY)
    }
}
```

Initial running effect (left image) and the effect after swipe-up gesture loading (right image) are shown below.

Figure 5 Example Operation Effect Diagram of Data Source Array Item Changes

![datachange.png](figures/datachange.png) ![datachange2.png](figures/datachange2.png)

In this example, the ArticleCard component serves as a child component of the ArticleListView component, receiving an Article object through the @Prop decorator for rendering article cards.

1. When the list scrolls to the bottom, if the gesture sliding distance exceeds the specified 80, the loadMoreArticles() function will be triggered. This function appends a new data item to the end of the articleList data source, thereby increasing its length.
2. The data source is decorated with @State, enabling the ArkUI framework to detect changes in the data source length and trigger ForEach to re-render.

## Usage Recommendations

- To ensure key uniqueness, for object data types, it is recommended to use the unique id within the object data as the key value.
- Avoid including the data item index in the final key generation rules to prevent [unexpected rendering results](#unexpected-rendering-results) and [reduced rendering performance](#reduced-rendering-performance). If the business logic indeed requires using the index, such as when the list needs conditional rendering based on the index, developers must accept the performance overhead caused by ForEach recreating components after data source changes.
- Basic data type items do not have a unique ID attribute. If using the basic data type itself as the key, ensure there are no duplicate array items. Therefore, for scenarios where the data source may change, it is recommended to convert basic data type arrays into object data type arrays with unique ID attributes, then use these unique ID attributes as keys.
- Regarding the above restrictions, the purpose of the index parameter is: index serves as the final means for developers to ensure key uniqueness; when modifying data items, since the item parameter in itemGenerator is immutable, the index must be used to modify the data source, thereby triggering UI re-rendering.
- When using ForEach within container components such as [List](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-list.md), [Grid](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-grid.md), or [Swiper](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-swiper.md), avoid mixing it with LazyForEach. For example, it is not recommended for a List to contain both ForEach and LazyForEach.
- For object data type array items, it is not recommended to replace old array items with new ones that have identical content.

## Not Recommended Cases

When using ForEach, if developers do not fully understand the key generation rules, incorrect usage may occur. Misuse can lead to functional issues, such as [unexpected rendering results](#unexpected-rendering-results), or performance issues, such as [reduced rendering performance](#reduced-rendering-performance).

### Unexpected Rendering Results

In this example, the key generation rule is customized by setting ForEach's third parameter keyGeneratorFunc to generate keys as string values of the data source's index. When clicking the "Insert new item after the first item" Text component in the parent component EntryView, the interface displays unexpected results.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList
import kit.LocalizationKit.*
import kit.PerformanceAnalysisKit.Hilog

@Component
class ChildItem {
    @Prop var item: String
    func build() {
        Text(this.item)
        .fontSize(30)
    }
}

@Entry
@Component
class EntryView {
    @State var simpleList: ObservedArrayList<String> =ObservedArrayList(['one', 'two', 'three'])
    func build() {
        Column() {
            Button() {
                Text('Insert new item after the first item').fontSize(30)
            }
            .onClick({=>
                this.simpleList.insert(1,'new item')
            })
            ForEach(this.simpleList, itemGeneratorFunc: {item: String ,idx:Int64 =>ChildItem(item: item)
            },keyGeneratorFunc: {item: String, index: Int64 => index.toString()}
            )
        }
    .justifyContent(FlexAlign.Center)
    .width(100.percent)
    .height(100.percent)
    .backgroundColor(Color.WHITE)
    }
}
```

The initial rendering effect and the effect after clicking the "Insert new item after the first item" Text component are shown below.

Figure 6 Unexpected Rendering Results Operation Effect Diagram

![renderunexpect.gif](figures/renderunexpect.gif)

During the first rendering, ForEach creates keys in the order "0", "1", "2".

After inserting a new item, the data source simpleList becomes ['one', 'new item', 'two', 'three'], and the framework detects the length change of the @State-decorated data source, triggering ForEach to re-render.

ForEach traverses the new data source sequentially. When traversing the data item "one", it generates the key "0", which exists, so no new component is created. Continuing to traverse "new item", it generates the key "1", which exists, so no new component is created. Next, traversing "two" generates the key "2", which exists, so no new component is created. Finally, traversing "three" generates the key "3", which does not exist, so a new component with content "three" is created and rendered.

As shown above, when the final key generation rule includes the index, the expected rendering result is ['one', 'new item', 'two', 'three'], but the actual result is ['one', 'two', 'three', 'three'], which does not meet developer expectations. Therefore, developers should avoid including the index in the final key generation rules when using ForEach.

### Reduced Rendering Performance

In this example, ForEach's third parameter keyGeneratorFunc is omitted. When clicking the "Insert new item after the first item" Text component, ForEach will need to recreate components for the second array item and all subsequent items.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList
import kit.LocalizationKit.*
import kit.PerformanceAnalysisKit.Hilog

@Component
class ChildItem {
    @Prop var item: String
    protected override func aboutToAppear() {
    Hilog.info(0,"0","[aboutToAppear]: item is ${this.item}")
    }
    func build() {
        Text(this.item)
        .fontSize(30)
    }
}

@Entry
@Component
class EntryView {
    @State var simpleList: ObservedArrayList<String> =ObservedArrayList(['one', 'two', 'three'])
    func build() {
        Column() {
            Button() {
            Text('Insert new item after the first item').fontSize(30)
            }
            .onClick({=>this.simpleList.insert(1,'new item')
            })
            ForEach(this.simpleList, itemGeneratorFunc: {item: String ,idx:Int64 =>
            ChildItem(item: item)}
            )
        }
    .justifyContent(FlexAlign.Center)
    .width(100.percent)
    .height(100.percent)
    .backgroundColor(Color.WHITE)
    }
}
```

The initial rendering effect and the effect after clicking the "Insert new item after the first item" Text component are shown below.

Figure 7 Reduced Rendering Performance Case Operation Effect Diagram

![renderlowq.gif](figures/renderlowq.gif)

After clicking the "Insert new item after the first item" Text component, the log output in DevEco Studio is as follows.

Figure 8 Reduced Rendering Performance Case Log Output Diagram

![log.png](figures/log.png)

After inserting the new item, ForEach creates corresponding ChildItem components for the new item, two, and three array items and executes the aboutToAppear() lifecycle function. This is because:

1. During the first rendering, ForEach creates keys in the order 0__one, 1__two, 2__three.
2. After inserting the new item, the data source simpleList becomes ['one', 'new item', 'two', 'three'], and the ArkUI framework detects the length change of the @State-decorated data source, triggering ForEach to re-render.
3. ForEach traverses the new data source sequentially. When traversing "one", it generates the key 0__one, which exists, so no new component is created. Continuing to traverse "new item", it generates the key 1__new item, which does not exist, so a new component with content "new item" is created and rendered. Next, traversing "two" generates the key 2__two, which does not exist, so a new component with content "two" is created and rendered. Finally, traversing "three" generates the key 3__three, which does not exist, so a new component with content "three" is created and rendered.

Although the rendering result in this example meets expectations, each time a new array item is inserted, ForEach recreates components for all subsequent array items. When the data source is large or the component structure is complex, the inability to reuse components leads to poor performance. Therefore, unless necessary, it is not recommended to omit the third parameter keyGeneratorFunc or include the data item index in the key generation rules.

The correct ForEach usage that ensures both proper rendering and efficiency is:

```cangjie
ForEach(this.simpleList, itemGeneratorFunc: {item: String ,idx:Int64 =>ChildItem(item: item)}, keyGeneratorFunc: {item: String, index: Int64 => item})
```

The third parameter keyGeneratorFunc is provided. In this example, different keys are generated for different data items in the data source, and the same key is generated for the same data item each time.
