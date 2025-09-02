# @Reusable Macro: Component Reusability

The @Reusable macro decorates any custom component, indicating that the custom component can be reused.

## Overview

@Reusable is applicable to custom components and is used in conjunction with @Component. When a custom component marked with @Reusable is removed from the component tree, both the component and its corresponding page object are placed into a reuse cache. When creating new custom component nodes subsequently, nodes from the cache will be reused, saving the time required for component recreation.

## Constraints

- Mixed projects are temporarily unsupported.

- @Reusable is only applicable to custom components.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.state_manage.*
    import ohos.arkui.state_macro_manage.*

    // Adding @Reusable to @Builder causes compilation errors; not applicable to builder
    // @Reusable
    @Builder
    func MyBuilder() {
        Crash()
    }

    @Component
    public class Crash {
        public func build() {
            Column() {
                Text("Crash")
                    .fontSize(12)
                    .lineHeight(8)
                    .fontColor(Color.BLUE)
            }
            .width(100.percent)
            .height(100.percent)
            .justifyContent(FlexAlign.Center)
        }
    }

    @Entry
    @Component
    public class EntryView {
        public func build(): Unit {
            Column() {
                MyBuilder()
            }
        }
    }
    ```

- The @Reusable macro does not support nested usage due to potential memory increase and maintenance difficulties.

    > **Note:**
    > Nested usage is unsupported as it merely adds markers, resulting in an additional cache pool. Each reuse cache pool contains identical tree structures, leading to low reuse efficiency and increased memory consumption;
    > When nested usage creates independent reuse cache pools, lifecycle propagation becomes problematic. Resource and variable management cannot be shared, making maintenance difficult and prone to issues;
    > In the example, the reuse cache pool formed by PlayButton cannot be used by PlayButton02's reuse cache pool, though PlayButton02's own cache pool allows internal reuse;
    > When PlayButton is hidden, it triggers PlayButton02's aboutToRecycle, but when PlayButton02 is displayed separately, aboutToReuse cannot be executed, resulting in unmatched lifecycle method calls;
    > Therefore, nested usage is not recommended.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.state_manage.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    public class EntryView {
        @State
        var isPlaying: Bool = false
        @State
        var isPlaying01: Bool = true
        @State
        var isPlaying02: Bool = false

        public func build() {
            Column() {
                if (this.isPlaying02) {
                    // Initially visible button
                    Text("Default shown childbutton").fontSize(14)
                    PlayButton02(isPlaying02: isPlaying02)
                }
                Text("==================").fontSize(14)

                if (this.isPlaying01) {
                    // Initially hidden button
                    Text("Default hidden childbutton").fontSize(14)
                    PlayButton02(isPlaying02: isPlaying01)
                }
                Text("==================").fontSize(14)

                // Parent-child nesting
                if (this.isPlaying) {
                    Text("parent child nesting").fontSize(14)
                    PlayButton(buttonPlaying: isPlaying)
                }
                Text("==================").fontSize(14)

                // Parent-child nesting control
                Text("Parent=child==is ${if(isPlaying) {""} else {"not"}} playing").fontSize(14)
                Button("Parent=child===controll=${isPlaying}").margin(14).onClick {
                    => isPlaying = !isPlaying
                }
                Text("==================").fontSize(14)

                // Default hidden button control
                Text("Hiddenchild==is ${if(isPlaying01) {""} else {"not"}} playing").fontSize(14)
                Button("Button===hiddenchild==control==${isPlaying01}").margin(14).onClick {
                    => isPlaying01 = !isPlaying01
                }
                Text("==================").fontSize(14)

                // Default visible button control
                Text("shownchid==is ${if(isPlaying02) {""} else {"not"}} playing").fontSize(14)
                Button("Button===shownchid==control==${isPlaying02}").margin(14).onClick {
                    => isPlaying02 = !isPlaying02
                }
            }
        }
    }

    // Reusable 1
    @Reusable
    @Component
    class PlayButton {
        @Link var buttonPlaying: Bool

        func build() {
            Column() {
                // Reuse
                PlayButton02(isPlaying02: buttonPlaying)
                Button(if(buttonPlaying) {"parent_pause"} else {"parent_play"}).margin(12).onClick {=>
                    buttonPlaying = !buttonPlaying
                }
            }
        }
    }

    // Reusable 2 (nested usage not recommended)
    @Reusable
    @Component
    class PlayButton02 {
        @Link var isPlaying02: Bool
        protected override func aboutToRecycle(): Unit {
            AppLog.info("=====aboutToRecycle====PlayButton02====")
        }
        protected override func aboutToReuse(param: ReuseParams) {
            AppLog.info("=====aboutToReuse====PlayButton02====")
        }
        func build() {
            Column() {
                Button("===commonbutton====").margin(12)
            }
        }
    }
    ```

## Use Cases

- List Scrolling: When an application needs to display large datasets in lists and users perform scrolling operations, frequent creation and destruction of list item views may cause lag and performance issues. In such cases, using component reuse mechanisms for list components can recycle existing list item views, improving scrolling smoothness.

- Dynamic Layout Updates: If an application's interface requires frequent layout updates (e.g., dynamically changing view structures and styles based on user actions or data changes), repeated view creation and destruction may lead to frequent layout calculations, affecting frame rates. Component reuse can avoid unnecessary view creation and layout calculations, enhancing performance.

- Scenarios with frequent view creation and destruction for data items. Component reuse can recycle existing views, only updating data content, thereby reducing view creation/destruction and significantly improving performance.

## Example Use Cases

### Dynamic Layout Updates

- The sample code marks the Child custom component as reusable. Button clicks update Child, triggering reuse;

- @Reusable: A custom component decorated with @Reusable macro gains reuse capability;

- aboutToReuse: When a reusable custom component is re-added to the node tree from the reuse cache, the aboutToReuse lifecycle callback is triggered, passing the component's construction parameters to aboutToReuse.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.state_manage.*
import ohos.arkui.state_macro_manage.*

public class Message {
    public var value: String
    public init(val: String) {
        value = val
    }
}

@Entry
@Component
public class EntryView {
    @State var switch: Bool = true
    public func build() {
        Column() {
            Button("Hello")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick{ =>
                switch = !switch
            }
            if (switch) {
                Child(message: Message("Child"))
            }
        }.height(100.percent).width(100.percent)
    }
}

@Reusable
@Component
class Child {
    @State
    var message: Message = Message("about to reuse")
    protected override func aboutToReuse(val: ReuseParams) {
        if (val.contains("message")) {
            let msg = val.get("message").getOrThrow()
            message = msg as Message ?? Message("None")
            AppLog.info("Recycle ===Child===")
        }
    }
    func build() {
        Column() {
            Text(this.message.value)
        }.borderWidth(1).height(100)
    }
}
```

### List Scrolling with LazyForEach

- The sample code marks the CardView custom component as reusable. List scrolling triggers CardView reuse;

- @Reusable: A custom component decorated with @Reusable gains reuse capability;

- The variable item must be decorated with @State for updates. Non-@State variables may fail to update.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.state_manage.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

class MyDataSource <: IDataSource<Int64> {
    public MyDataSource(let data_: ArrayList<Int64>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func totalCount(): Int64 {
        return data_.size
    }
    public func getData(index: Int64): Int64 {
        return data_[index]
    }

    public func pushData(val: Int64): Unit {
        data_.add(val)
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }
}

@Entry
@Component
public class EntryView {
    let data: MyDataSource = MyDataSource(ArrayList<Int64>([]))
    protected override func aboutToAppear() {
        for (i in 0..1000) {
            data.pushData(i)
        }
    }

    public func build(): Unit {
        Column() {
            List() {
                LazyForEach(
                    data,
                    itemGeneratorFunc: {
                        item: Int64, idx: Int64 => ListItem() {
                            CardView(item: "${item}")
                        }
                    }
                )
            }
        }
    }
}
// Reusable Component
@Reusable
@Component
class CardView {
    @State
    var item: String = ""
    protected override func aboutToReuse(val: ReuseParams) {
        if (val.contains("item")) {
            let itemTmp = val.get("item").getOrThrow()
            item = itemTmp as String ?? ""
        }
    }
    func build() {
        Column() {
            Text(item)
        }.borderWidth(1).height(100)
    }
}
```

### Usage Scenarios of if Statement

The sample code marks the OneMoment custom component as reusable. Scrolling up and down the List triggers the reuse of OneMoment;

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.state_manage.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList
import kit.LocalizationKit.*

class MyDataSource <: IDataSource<FriendMoment> {
    public MyDataSource(let data_: ArrayList<FriendMoment>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func totalCount(): Int64 {
        return data_.size
    }
    public func getData(index: Int64): FriendMoment {
        return data_[index]
    }

    public func pushData(val: FriendMoment): Unit {
        data_.add(val)
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }
}

public class FriendMoment {
    public var text: String = ""
    public var title: String = ""
    public var image: ?AppResource = None
    public init(text: String, title: String, image: ?AppResource) {
        this.text = text
        this.title = title
        this.image = image
    }

}

@Reusable
@Component
public class OneMoment {
    @State var moment: FriendMoment = FriendMoment("", "", @r(app.media.startIcon))
    protected override func aboutToReuse(params: ReuseParams) {
        if (params.contains("moment")) {
            let p = params.get("moment").getOrThrow()
            let pVal = (p as FriendMoment) ?? FriendMoment("", "", @r(app.media.startIcon))
            this.moment = pVal
            AppLog.info("====aboutToReuse====OnMoment==Reused==== ${pVal.text}")
        }
    }
    public func build() {
        Column() {
            Text(moment.text)
            if (moment.image.isSome()) {
                Flex(FlexOptions(wrap: FlexWrap.Wrap)) {
                    Image((moment.image) ?? @r(app.media.background)).height(50).width(50)
                    Image((moment.image) ?? @r(app.media.background)).height(50).width(50)
                    Image((moment.image) ?? @r(app.media.background)).height(50).width(50)
                    Image((moment.image) ?? @r(app.media.background)).height(50).width(50)
                }
            }
        }
    }
}

@Entry
@Component
public class EntryView {
    let data: MyDataSource = MyDataSource(ArrayList<FriendMoment>([]))
    protected override func aboutToAppear() {
        for (i in 0..20) {
            let title = "${i+1}test+if"
            data.pushData(FriendMoment("${i}", title, @r(app.media.startIcon)))
        }
        for (i in 0..50) {
            let title = "${i+1}test+if"
            data.pushData(FriendMoment("${i}", title, Option<AppResource>.None))
        }
    }

    public func build(): Unit {
        Column() {
            List() {
                LazyForEach(
                    data,
                    itemGeneratorFunc: {
                        item: FriendMoment, idx: Int64 => ListItem() {
                            OneMoment(moment: item)
                        }
                    }
                )
            }
        }
    }
}
```