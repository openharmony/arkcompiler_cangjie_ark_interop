# Creating Waterfall Flow (WaterFlow)

ArkUI provides the WaterFlow container component for constructing waterfall flow layouts. The WaterFlow component supports conditional rendering, loop rendering, and lazy loading to generate child components.

## Layout and Constraints

Waterfall flow supports both horizontal and vertical layouts. In horizontal layouts, the number of rows can be set via `rowsTemplate`.

In the vertical layout of a waterfall flow, the child nodes in the first row are arranged from left to right. Starting from the second row, each child node is placed in the column with the smallest current total height. If multiple columns have the same total height, they are filled from left to right. As shown below:

![waterflow1](./figures/waterflow1.png)

In the horizontal layout of a waterfall flow, each child node is placed in the row with the smallest current total width. If multiple rows have the same total width, they are filled from top to bottom.

![waterflow2](./figures/waterflow2.png)

## Infinite Scrolling

### Adding Data When Reaching the End

Waterfall flow is commonly used for infinite scrolling information feeds. The footer can be styled to indicate that new data is being loaded (using the [LoadingProgress](../../../API_Reference/source_zh_cn/arkui-cj/cj-information-display-loadingprogress.md) component).

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*
import ohos.request.agent.State
import ohos.ui_test.Driver

class MyDataSource <: IDataSource<Int64> {
    public MyDataSource(let data_: ArrayList<Int64>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func getData(index: Int64): Int64 {
        return data_[index]
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func totalCount(): Int64 {
        return data_.size
    }

    public func addLastItem(): Unit {
        data_.add(data_.size)
    }

    public func addNewItems(count: Int64): Unit{
        let len: Int64 = this.data_.size
        for(i in 1..=count){
            this.data_.add(this.data_.size)
        }
        this.notifyReloaded1()
    }

    public func notifyReloaded(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataReloaded()
    }

    public func notifyReloaded1(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDatasetChange(ArrayList<DataOperation>([DataAddOperation( 0,count: 1, key: "")]))
    }
}

@Entry
@Component
class EntryView {
    @State
    var myDataSource: MyDataSource = MyDataSource(ArrayList<Int64>(100, {i => i}))
    @State
    var myHight: Array<Int64> = [200, 212, 334, 265, 214]
    var myColor: Array<Int64> = [0xFFE700, 0xffffff, 0x409EFF, 0xf56c6c]
    var myScroller: Scroller = Scroller()

    @Builder
    func itemFoot(): Unit {
        Column() {
          Text("Loading...")
            .fontSize(20)
            .backgroundColor(0xFFE700)
            .width(100)
            .height(50)
            .align(Alignment.Center)
            .margin(20.vp)
        }.width(100).justifyContent(FlexAlign.Center)
    }

    func build() {
        Column() {
            WaterFlow(footer: bind(itemFoot, this), scroller: myScroller, layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW) {
                LazyForEach(
                    this.myDataSource,
                    itemGeneratorFunc: {
                        element: Int64, index: Int64 =>
                        FlowItem() {
                            Column() {
                                Text(element.toString()).fontSize(12).height(16.vp)
                            }
                        }
                        .width(100.percent)
                        .height(myHight[element % 5])
                        .backgroundColor(this.myColor[element % 4])
                    }
                )
            }
            .layoutDirection(FlexDirection.Column)
            .itemConstraintSize(20.vp, 300.vp, 20.vp, 300.vp)
            .columnsTemplate("1fr 1fr")
            .columnsGap(10.vp)
            .rowsGap(5.vp)
            .backgroundColor(0xFAEEE0)
            .enableScrollInteraction(true)
            .friction(0.7)
            .cachedCount(20, true)
            .width(100.percent)
            .height(100.percent)
            .onReachStart({=>
                AppLog.info('waterFlow reach start')
            })
            .onReachEnd({=>
                AppLog.info('waterFlow reach end')
                sleep(Duration.second/2)
                this.myDataSource.addNewItems(10)
            })
            .onScrollFrameBegin({offset: Float64, state: ScrollState =>
                AppLog.info("waterFlow scrollFrameBegin offset: " + offset.toString() + " state: " + state.toString())
                return offset
            })
            .onScrollIndex({first: Int32, last: Int32=>
                AppLog.info("waterFlow onScrollIndex first: " + first.toString() + " last: " + last.toString() + " totalCount: " + this.myDataSource.totalCount().toString())
            })
        }.height(100.percent)
    }
}
```

Here, new data should be added by appending elements to the end of the data array. Do not directly modify `dataArray` and then notify the waterfall flow to reload data via the `onDataReloaded()` method of `LazyForEach`.

In a waterfall flow layout, the heights of child nodes are inconsistent, and the positions of subsequent nodes depend on the preceding nodes. Reloading all data would trigger a complete recalculation of the waterfall flow layout, potentially causing lag. After appending data, use the `onDatasetChange()` method to notify the waterfall flow, allowing it to recognize the new data and continue loading while avoiding redundant processing of existing data.

![waterflow3](./figures/waterflow3.gif)

### Preloading Data

Although loading data when `onReachEnd()` is triggered achieves infinite loading, a noticeable pause occurs when scrolling to the bottom.

To achieve smoother infinite scrolling, adjust the timing of adding new data. For example, new data can be loaded in advance when `LazyForEach` has a certain number of items remaining to be traversed.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*
import ohos.request.agent.State
import ohos.ui_test.Driver

class MyDataSource <: IDataSource<Int64> {
    public MyDataSource(let data_: ArrayList<Int64>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func getData(index: Int64): Int64 {
        return data_[index]
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func totalCount(): Int64 {
        return data_.size
    }

    public func addLastItem(): Unit {
        data_.add(data_.size)
    }

    public func addNewItems(count: Int64): Unit{
        let len: Int64 = this.data_.size
        for(i in 1..=count){
            this.data_.add(this.data_.size)
        }
        this.notifyReloaded1()
    }

    public func notifyReloaded(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataReloaded()
    }

    public func notifyReloaded1(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDatasetChange(ArrayList<DataOperation>([DataAddOperation( 0,count: 1, key: "")]))
    }
}

@Entry
@Component
class EntryView {
    @State
    var myDataSource: MyDataSource = MyDataSource(ArrayList<Int64>(100, {i => i}))
    @State
    var myHight: Array<Int64> = [200, 212, 334, 265, 214]
    var myColor: Array<Int64> = [0xFFE700, 0xffffff, 0x409EFF, 0xf56c6c]
    var myScroller: Scroller = Scroller()

    @Builder
    func itemFoot(): Unit {
        Column() {
          Text("Loading...")
            .fontSize(20)
            .backgroundColor(0xFFE700)
            .width(100)
            .height(50)
            .align(Alignment.Center)
            .margin(20.vp)
        }.width(100).justifyContent(FlexAlign.Center)
    }

    func build() {
        Column() {
            WaterFlow(footer: bind(itemFoot, this), scroller: myScroller, layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW) {
                LazyForEach(
                    this.myDataSource,
                    itemGeneratorFunc: {
                        element: Int64, index: Int64 =>
                        FlowItem() {
                            Column() {
                                Text(element.toString()).fontSize(12).height(16.vp)
                            }
                        }
                        .width(100.percent)
                        .height(myHight[element % 5])
                        .backgroundColor(this.myColor[element % 4])
                    }
                )
            }
            .layoutDirection(FlexDirection.Column)
            .itemConstraintSize(20.vp, 300.vp, 20.vp, 300.vp)
            .columnsTemplate("1fr 1fr")
            .columnsGap(10.vp)
            .rowsGap(5.vp)
            .backgroundColor(0xFAEEE0)
            .enableScrollInteraction(true)
            .friction(0.7)
            .cachedCount(20, true)
            .width(100.percent)
            .height(100.percent)
            .onReachStart({=>
                AppLog.info('waterFlow reach start')
            })
            .onReachEnd({=>
                AppLog.info('waterFlow reach end')
            })
            .onScrollFrameBegin({offset: Float64, state: ScrollState =>
                AppLog.info("waterFlow scrollFrameBegin offset: " + offset.toString() + " state: " + state.toString())
                return offset
            })
            .onScrollIndex({first: Int32, last: Int32=>
                AppLog.info("waterFlow onScrollIndex first: " + first.toString() + " last: " + last.toString() + " totalCount: " + this.myDataSource.totalCount().toString())
                    if(Int64(last + 20) >= this.myDataSource.totalCount()){
                        this.myDataSource.addNewItems(10)
                    }
            })
        }.height(100.percent)
    }
}
```

![waterflow4](./figures/waterflow4.gif)

## Dynamic Column Switching

By dynamically adjusting the number of columns in a waterfall flow, applications can switch between list mode and waterfall flow mode or adapt to changes in screen width. To dynamically set the number of columns, it is recommended to use the sliding window layout mode of the waterfall flow for faster column switching.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*
import ohos.request.agent.State
import ohos.ui_test.Driver
import ohos.distributed_kv_store.Entry
import ohos.image.Component

class MyDataSource <: IDataSource<Int64> {
    public MyDataSource(let data_: ArrayList<Int64>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func getData(index: Int64): Int64 {
        return data_[index]
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func totalCount(): Int64 {
        return data_.size
    }

    public func addLastItem(): Unit {
        data_.add(data_.size)
    }

    public func addNewItems(count: Int64): Unit{
        let len: Int64 = this.data_.size
        for(i in 1..=count){
            this.data_.add(this.data_.size)
        }
        this.notifyReloaded1()
    }

    public func notifyReloaded(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataReloaded()
    }

    public func notifyReloaded1(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDatasetChange(ArrayList<DataOperation>([DataAddOperation( 0,count: 1, key: "")]))
    }
}

@Reusable
@Component
class ReusableListItem {
    @State
    var item: Int64 = 0

    protected override func aboutToReuse(params: ReuseParams) {
        let nameVal = params.get("item").getOrThrow()
        this.item = nameVal as Int64 ?? 0
      }
    func build() {
        Row() {
          Image('res/waterFlow(' + (this.item % 5).toString() + ').JPG')
            .objectFit(ImageFit.Fill)
            .height(100)
            .aspectRatio(1)
          Text("N" + this.item.toString()).fontSize(12).height(16).layoutWeight(1).textAlign(TextAlign.Center)
        }
    }
}
@Reusable
@Component
class  ReusableFlowItem {
  @State
    var item: Int64 = 0

  // Called before being added to the component tree from the reuse cache, where component state variables can be updated to display correct content
    protected override func aboutToReuse(params: ReuseParams) {
        let nameVal = params.get("item").getOrThrow()
        this.item = nameVal as Int64 ?? 0
      }

  protected  override func aboutToAppear() {
    AppLog.info('new item:' + this.item.toString())
  }

  func build() {
    Image('res/waterFlowTest(' + (this.item % 5).toString() + ').jpg')
        .overlay(title:'N' + this.item.toString(), align:Alignment.Top , offset: ContentOffset(x: 0.0, y: 0.0))
        .objectFit(ImageFit.Fill)
        .width(100.percent)
        .layoutWeight(1)
  }
}

@Entry
@Component
class EntryView {
    @State
    var columns: Int64 = 2
    @State
    var myDataSource: MyDataSource = MyDataSource(ArrayList<Int64>(100, {i => i}))
    @State
    var myHight: Array<Int64> = [200, 212, 334, 265, 214]
    var myColor: Array<Int64> = [0xFFE700, 0xffffff, 0x409EFF, 0xf56c6c]
    var myScroller: Scroller = Scroller()
    @State
    var columns_string: String = "1fr 1fr"

    @Builder
    func itemFoot(): Unit {
        Column() {
          Text("Loading")
            .fontSize(20)
            .backgroundColor(0xFFE700)
            .width(100)
            .height(50)
            .align(Alignment.Center)
            .margin(20.vp)
        }.width(100).justifyContent(FlexAlign.Center)
    }

    func build() {
        Column() {
            Button("Toggle Columns").fontSize(20).onClick(){ =>
                if(this.columns == 2){
                    this.columns = 1;
                    this.columns_string="1fr"
                } else{
                    this.columns = 2;
                    this.columns_string = "1fr 1fr"
                }
            }

            WaterFlow(footer: bind(itemFoot, this), scroller: myScroller, layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW) {
                LazyForEach(
                    this.myDataSource,
                    itemGeneratorFunc: {
                        element: Int64, index: Int64 =>
                        FlowItem() {
                        }
                        .width(100.percent)
                        .height(myHight[element % 5])
                        .backgroundColor(this.myColor[element % 4])
                    }
                )
            }
            .layoutDirection(FlexDirection.Column)
            .itemConstraintSize(20.vp, 300.vp, 20.vp, 300.vp)
            .columnsTemplate(this.columns_string)
            .columnsGap(10.vp)
            .rowsGap(5.vp)
            .backgroundColor(0xFAEEE0)
            .enableScrollInteraction(true)
            .friction(0.7)
            .cachedCount(20, true)
            .width(100.percent)
            .height(100.percent)
            .onReachStart({=>
                AppLog.info('waterFlow reach start')
            })
            .onReachEnd({=>
                AppLog.info('waterFlow reach end')
            })
            .onScrollFrameBegin({offset: Float64, state: ScrollState =>
                AppLog.info("waterFlow scrollFrameBegin offset: " + offset.toString() + " state: " + state.toString())
                return offset
            })
            .onScrollIndex({first: Int32, last: Int32=>
                AppLog.info("waterFlow onScrollIndex first: " + first.toString() + " last: " + last.toString() + " totalCount: " + this.myDataSource.totalCount().toString())
                    if(Int64(last + 20) >= this.myDataSource.totalCount()){
                        this.myDataSource.addNewItems(10)
                    }
            })
        }.height(100.percent)
    }
}
```

![waterflow6](./figures/waterflow6.gif)

## Grouped Mixed Layout

Many application interfaces contain other content above the waterfall flow. Such scenarios can be implemented by nesting WaterFlow inside Scroll or List. Similar to the following diagram:

![waterflow5](./figures/waterflow5.png)

If child nodes from different sections can be integrated into a single data source, then by setting WaterFlowSections, a mixed layout can be achieved within a single WaterFlow container. Compared to nested scrolling, this method can simplify application logic such as scroll event handling.

Each waterfall flow group can independently set its own column count, row spacing, column spacing, margin, and total child node count. The following code can achieve the above effect:

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

class MyDataSource <: IDataSource<Int64> {
    public MyDataSource(let data_: ArrayList<Int64>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func getData(index: Int64): Int64 {
        return data_[index]
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func totalCount(): Int64 {
        return data_.size
    }

    public func addLastItem(): Unit {
        data_.add(data_.size)
    }

    public func addNewItems(count: Int64): Unit{
        let len: Int64 = this.data_.size
        for(i in 1..=count){
            this.data_.add(this.data_.size)
        }
        this.notifyReloaded1()
    }

    public func notifyReloaded(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataReloaded()
    }

    public func notifyReloaded1(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDatasetChange(ArrayList<DataOperation>([DataAddOperation( 0,count: 1, key: "")]))
    }
}

@Entry
@Component
class EntryView {
    @State
    var minSize: Int64 = 80;
    var maxSize: Int64 = 180;
    var myColor: Array<Int64> = [0xFFE700, 0xffffff, 0x409EFF, 0xf56c6c]
    var myDataSource: MyDataSource = MyDataSource(ArrayList<Int64>(100, {i => i}))
    private var itemWidthArray: ArrayList<Int64> = ArrayList<Int64>();
    private var itemHeightArray: ArrayList<Int64> = ArrayList<Int64>();
    var myHight: Array<Int64> = [200, 212, 334, 265, 214]
    var sections: WaterFlowSections = WaterFlowSections();
    var sectionMargin: Margin = Margin(top:10,right:5,bottom:10,left:5)
    var oneColumnSection: SectionOptions = SectionOptions(itemsCount: 1, margin: this.sectionMargin, crossCount: 1, columnsGap: 5, rowsGap: 10)
    var twoColumnSection: SectionOptions = SectionOptions(itemsCount: 98,crossCount:2)
    // When using grouped waterfall flow, footer components cannot be set via footer. A fixed group can be reserved as footer
    var lastSection: SectionOptions = SectionOptions(itemsCount: 1,crossCount:1)
    var myScroller: Scroller = Scroller()

    public func getsize(){
        return minSize
    }

    @Builder
    func itemFoot(): Unit {
        Column() {
          Text("Loading")
            .fontSize(20)
            .backgroundColor(0xFFE700)
            .width(100)
            .height(50)
            .align(Alignment.Center)
            .margin(20.vp)
        }.width(100).justifyContent(FlexAlign.Center)
    }

    public override func aboutToAppear() {
        setItemSizeArray()
        let sectionOptions: Array<SectionOptions> = [this.oneColumnSection, this.twoColumnSection, this.lastSection];
        this.sections.splice(0, 0, sectionOptions);
        return
   }

    public func setItemSizeArray() {
        for (i in 1..15) {
            this.itemWidthArray.add(this.getsize());
            this.itemHeightArray.add(this.getsize());
        }
    }

    func build() {
        Column(){
            WaterFlow(footer: bind(itemFoot, this), scroller: myScroller, layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW,waterFlowSections:this.sections) {
                LazyForEach(
                    this.myDataSource,
                    itemGeneratorFunc: {
                        element: Int64, index: Int64 =>
                        FlowItem() {
                            if(index == 0){
                                Column(){
                                    Grid(){
                                        GridItem(){
                                            Text("GridItem").fontSize(16).height(12)
                                        }.backgroundColor(Color.PINK)
                                    }
                                    .columnsTemplate("lfr")
                                    .rowsTemplate("lfr")
                                    .width(120)
                                    .height(myHight[element % 5])
                                    .backgroundColor(Color.PINK)
                                    .rowsGap(5)
                                    .columnsGap(4)
                                }
                            }
                            else{
                                Column(){
                                    Text(element.toString()).fontSize(12).height(16.vp)
                                }
                            }
                        }
                        .width(100.percent)
                        .height(myHight[element % 5])
                        .backgroundColor(this.myColor[element % 4])
                    }
                )
            }
            .layoutDirection(FlexDirection.Column)
            .itemConstraintSize(20.vp, 300.vp, 20.vp, 300.vp)
            .columnsTemplate("1fr 1fr")
            .columnsGap(10.vp)
            .rowsGap(5.vp)
            .backgroundColor(0xFAEEE0)
            .enableScrollInteraction(true)
            .friction(0.7)
            .cachedCount(20, true)
            .width(100.percent)
            .height(100.percent)
            .onReachStart({=>
                AppLog.info('waterFlow reach start')
            })
            .onReachEnd({=>
                AppLog.info('waterFlow reach end')
            })
            .onScrollFrameBegin({offset: Float64, state: ScrollState =>
                AppLog.info("waterFlow scrollFrameBegin offset: " + offset.toString() + " state: " + state.toString())
                return offset
            })
            .onScrollIndex({first: Int32, last: Int32=>
                AppLog.info("waterFlow onScrollIndex first: " + first.toString() + " last: " + last.toString() + " totalCount: " + this.myDataSource.totalCount().toString())
                    if(Int64(last + 20) >= this.myDataSource.totalCount()){
                        this.myDataSource.addNewItems(10)
                        this.twoColumnSection.itemsCount += 10;
                        this.sections.update(1, this.twoColumnSection);
                    }
            })
        }
    }
}
```

![waterflow7](./figures/waterflow7.jpg)

> **Note:**
>
> - When using grouped hybrid layouts, setting a separate footer is not supported. The last group can be used as the footer component.
> - After adding or deleting data, the itemCount of the corresponding group must be updated accordingly.
