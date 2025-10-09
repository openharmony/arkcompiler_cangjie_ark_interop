# List

一个包含一系列相同宽度的列表项的容器组件。适合连续、多行呈现同类数据，例如图片和文本。

## 子组件

仅支持[ListItem](./cj-scroll-swipe-listitem.md)、[ListItemGroup](./cj-scroll-swipe-listgroup.md)子组件。支持渲染控制类型（[if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md)、[ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md)、[LazyForEach](./cj-state-rendering-lazyforeach.md)）。

> **说明：**
>
> List的子组件的索引值计算规则：
>
> * 按子组件的顺序依次递增。
> * if/else语句中，只有条件成立的分支内的子组件会参与索引值计算，条件不成立的分支内子组件不计算索引值。
> * ForEach/LazyForEach语句中，会计算展开所有子节点索引值。
> * [if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md)、[ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md)、[LazyForEach](./cj-state-rendering-lazyforeach.md)发生变化以后，会更新子节点索引值。
> * ListItemGroup作为一个整体计算一个索引值，ListItemGroup内部的ListItem不计算索引值。
> * List子组件visibility属性设置为Hidden或None依然会计算索引值。

## 创建组件

### init(Int64, Int32, ?Scroller, () -> Unit)

```cangjie
public init(
    space!: Int64 = 0,
    initialIndex!: Int32 = 0,
    scroller!: ?Scroller = Option<Scroller>.None,
    child!: () -> Unit
)
```

**功能：** 创建一个可包含子组件的List容器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|space|Int64|否|0| **命名参数。** 子组件主轴方向的间隔。<br/>初始值：0。<br/>单位为vp。<br/>**说明：**<br/>设置为负数或者大于等于List内容区长度时，按初始值显示。<br/>space参数值小于List分割线宽度时，子组件主轴方向的间隔取分割线宽度。<br/>List子组件的visibility属性设置为None时不显示，但该子组件上下的space还会生效。|
|initialIndex|Int32|否|0|**命名参数。** 设置当前List初次加载时视口起始位置显示的item，即显示第一个item，如果设置的值超过了当前List最后一个item的索引值，则设置为不生效。<br/>初始值：0。<br/>**说明：**<br/>设置为负数或超过了当前List最后一个item的索引值时视为无效取值，无效取值按初始值显示。|
|scroller|?[Scroller](cj-scroll-swipe-scroll.md#class-scroller)|否|Option\<Scroller>.None| **命名参数。** 可滚动组件的控制器。用于与可滚动组件进行绑定。<br/>**说明：**<br/>不允许和其他滚动类组件，如：[List](./cj-scroll-swipe-list.md)、[Grid](./cj-scroll-swipe-grid.md)和[Scroll](./cj-scroll-swipe-scroll.md)绑定同一个滚动控制对象。|
|child|()->Unit|是|-| **命名参数。** 声明容器内的List子组件。|

## 通用属性/通用事件

通用属性：全部支持。还支持滚动组件通用组件。

通用事件：全部支持。

## 组件属性

### func alignListItem(ListItemAlign)

```cangjie

public func alignListItem(value: ListItemAlign): This
```

**功能：** 设置List交叉轴方向宽度大于ListItem交叉轴宽度 * lanes时，ListItem在List交叉轴方向的布局方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ListItemAlign](cj-common-types.md#enum-listitemalign)|是|-|交叉轴方向的布局方式。<br>初始值：ListItemAlign.Start。|

### func cachedCount(Int32)

```cangjie

public func cachedCount(value: Int32): This
```

**功能：** 设置列表中ListItem/ListItemGroup的预加载数量，懒加载场景只会预加载List显示区域外cachedCount的内容，非懒加载场景会全部加载。懒加载、非懒加载都只布局List显示区域+List显示区域外cachedCount的内容。

List设置cachedCount后，显示区域外上下各会预加载并布局cachedCount行ListItem。计算ListItem行数时，会计算ListItemGroup内部的ListItem行数。如果ListItemGroup内没有ListItem，则整个ListItemGroup算一行。

List下嵌套使用LazyForEach，并且LazyForEach下嵌套使用ListItemGroup时，LazyForEach会在List显示区域外上下各会创建cachedCount个ListItemGroup。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|列表中ListItem/ListItemGroup的预加载数量。<br/>初始值：根据屏幕内显示的节点个数设置，最大值为16。<br/>取值范围：[0, +∞)。|

### func chainAnimation(Bool)

```cangjie

public func chainAnimation(value: Bool): This
```

**功能：** 设置当前List是否启用链式联动动效。

> **说明：**
>
> * 链式联动效果是指在手指划动过程中，手指拖动的ListItem是主动对象，相邻的ListItem为从动对象，主动对象驱动从动对象联动，驱动效果遵循弹簧物理动效。
> * 链式动效的驱动效果体现在ListItem之间的间距上。静止状态下的间距可以通过List组件space参数设置，如果不设置space参数并且启用了链式动效，该间距初始值：20.vp。
> * 链式动效启用后，List的分割线不显示。
> * 链式动效生效的前提是List处于单列模式并且边缘效果为EdgeEffect.Spring类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否启用链式联动动效。<br>初始值：false，不启用链式联动。true，启用链式联动。|

### func divider(Length, ResourceColor, Length, Length)

```cangjie

public func divider(strokeWidth!: Length, color!: ResourceColor = Color.Black, startMargin!: Length = 0.vp,
    endMargin!: Length = 0.vp): This
```

**功能：** 用于设置ListItem分割线样式，默认无分割线。

List的分割线画在主轴方向两个子组件之间，第一个子组件上方和最后一个子组件下方不会绘制分割线。

多列模式下，ListItem与ListItem之间的分割线起始边距从每一列的交叉轴方向起始边开始计算，单列模式从List交叉轴方向起始边开始计算。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|strokeWidth|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 分割线的线宽。<br/>**说明：**<br/>设置为负数或者大于等于List内容区长度时，按0处理。|
|color|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|否|Color.Black| **命名参数。** 分割线的颜色。|
|startMargin|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp| **命名参数。** 分割线距离列表侧边起始端的距离。<br/>**说明：**<br/>设置为负数时，按初始值处理。|
|endMargin|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp| **命名参数。** 分割线距离列表侧边结束端的距离。<br/>**说明：**<br/>设置为负数时，按初始值处理。|

### func edgeEffect(EdgeEffect)

```cangjie

public func edgeEffect(value: EdgeEffect): This
```

**功能：** 设置边缘滑动效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[EdgeEffect](cj-common-types.md#enum-EdgeEffect)|是|-|List组件的边缘滑动效果，支持弹簧效果和阴影效果。<br/>初始值：EdgeEffect.Spring。|

### func lanes(Int32)

```cangjie

public func lanes(value: Int32): This
```

**功能：** 设置List组件的布局列数或行数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|List组件的布局列数或行数。<br/>初始值：1。<br/>取值范围：[1, +∞)。|

### func lanes(Length, Length)

```cangjie

public func lanes(minLength!: Length, maxLength!: Length): This
```

**功能：** 设置List组件的布局列数或行数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|minLength|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 组件最小长度。|
|maxLength|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** 组件最大长度。|

### func listDirection(Axis)

```cangjie

public func listDirection(value: Axis): This
```

**功能：** 设置List组件排列方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Axis](cj-common-types.md#enum-axis)|是|-|组件的排列方向。<br/>初始值：Axis.Vertical。|

### func multiSelectable(Bool)

```cangjie

public func multiSelectable(value: Bool): This
```

**功能：** 是否开启鼠标框选。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否开启鼠标框选。<br/>初始值：false，关闭框选。true，开启框选。|

### func sticky(StickyStyle)

```cangjie

public func sticky(value: StickyStyle): This
```

**功能：** 配合[ListItemGroup](./cj-scroll-swipe-listgroup.md)组件使用，设置ListItemGroup中header和footer是否要吸顶或吸底。sticky属性可以设置为 StickyStyle.Header | StickyStyle.Footer 以同时支持header吸顶和footer吸底。

> **说明：**
>
> 由于浮点数计算精度，设置sticky后，在List滑动过程中小概率产生缝隙，可以通过[pixelRound](./cj-common-types.md#enum-pixelroundcalcpolicy)指定当前组件向下像素取整解决该问题。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[StickyStyle](./cj-common-types.md#enum-stickystyle)|是|-|ListItemGroup吸顶或吸底效果。<br/>初始值：StickyStyle.None。|

## 组件事件

### func onScrollFrameBegin((Float64,ScrollState) -> onScrollFrameBeginHandleResult)

```cangjie

public func onScrollFrameBegin(event: (Float64, ScrollState) -> onScrollFrameBeginHandleResult): This
```

**功能：** 列表开始滑动时触发，事件参数传入即将发生的滑动量，事件处理函数中可根据应用场景计算实际需要的滑动量并作为事件处理函数的返回值返回，列表将按照返回值的实际滑动量进行滑动。

当listDirection的值为Axis.Vertical时，返回垂直方向滑动量，当listDirection的值为Axis.Horizontal时，返回水平方向滑动量。

触发该事件的条件：手指拖动List、List惯性划动时每帧开始时触发；List超出边缘回弹、使用滚动控制器和拖动滚动条的滚动不会触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|(Float64,[ScrollState](cj-common-types.md#enum-scrollstate))->[onScrollFrameBeginHandleResult](#class-onscrollframebeginhandleresult)|是|-|列表开始滑动时触发。 <br/>参数一：即将发生的滑动量，单位vp。 <br/>参数二：List组件当前的滑动状态。 <br/>返回值：实际滑动量，单位vp。|

### func onScrollIndex((Int32,Int32,Int32) -> Unit)

```cangjie

public func onScrollIndex(event: (Int32, Int32, Int32) -> Unit): This
```

**功能：** 列表滑动开始时触发。手指拖动列表或列表的滚动条触发的滑动开始时，会触发该事件。使用Scroller滑动控制器触发的带动画的滑动，动画开始时会触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|(Int32,Int32,Int32)->Unit|是|-|列表滑动事件回调。<br/>参数一：List显示区域内第一个子组件的索引值。<br/>参数二：List显示区域内最后一个子组件的索引值。<br/>参数三：List显示区域内中间位置子组件的索引值。|

## 基础类型定义

### class onScrollFrameBeginHandleResult

```cangjie
public class onScrollFrameBeginHandleResult {
    public var offsetRemain: Float64

    public init(offsetRemain!: Float64)
}
```

**功能：** 返回实际滑动量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var offsetRemain

```cangjie
public var offsetRemain: Float64
```

**功能：** 实际滚动偏移量。

**类型：** Float64

**读写能力：** 可读写

#### init(Float64)

```cangjie

public init(offsetRemain!: Float64)
```

**功能：** 创建实际滑动量对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offsetRemain|Float64|是|-|实际滚动偏移量，单位vp。|

## 示例代码

### 示例1 （添加滚动事件）

该示例实现了设置纵向列表，并在当前显示界面发生改变时回调索引。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.*

func loggerInfo(str: String) {
    Hilog.info(0, "CangjieTest", str)
}

@Entry
@Component
class EntryView {
    let arr =[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    func build() {
        Stack(alignContent: Alignment.TopStart){
            Column() {
                List( space: 20, initialIndex: 0 ) {
                    ForEach(this.arr, itemGeneratorFunc: {item:Int64,_:Int64 =>
                            ListItem() {
                                Text("${item}")
                                .width(100.percent).height(100).fontSize(16)
                                .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
                            }
                            })
                }.id("list")
                .listDirection(Axis.Vertical) // 排列方向
                .scrollBar(BarState.Off)
                //.friction(0.6)
                .divider(strokeWidth: 2.px, color: Color(0xFFFFFF), startMargin: 20.px, endMargin: 20.px) // 每行之间的分界线
                .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
                .onScrollIndex({firstIndex: Int32, lastIndex: Int32, middleIndex: Int32 =>
                        loggerInfo("first" + firstIndex.toString())
                        loggerInfo("last" + lastIndex.toString())
                        loggerInfo("middle" + middleIndex.toString())
                      })
                .width(90.percent)
                }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
            .padding(top: 5.px )
        }
    }
}

```

![list1](figures/list1.gif)

### 示例2 （设置子元素对齐）

该示例展示了不同ListItemAlign枚举值下，List组件交叉轴方向子元素对齐效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    let arr: Array<String> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15",
        "16", "17", "18", "19"]
    @State var alignListItem: ListItemAlign = ListItemAlign.Start

    func build() {
        Column() {
            List(space: 20, initialIndex: 0) {
                ForEach(
                    this.arr,
                    itemGeneratorFunc: {
                        item: String, _: Int64 => ListItem() {
                            Text("${item}")
                            .width(100.percent)
                            .height(100)
                            .fontSize(16)
                            .textAlign(TextAlign.Center)
                            .borderRadius(10).backgroundColor(0xFFFFFF)
                        }.border(width: 2.px, color: Color.Green).width(55)
                    }
                )
            }
            .height(300)
            .width(90.percent)
            .border(width: 3.px, color: Color.Red)
            .lanes(6)
            .alignListItem(
                this.alignListItem)
            .scrollBar(BarState.Off)
            Button("点击更改alignListItem}").onClick(
                {
                 evt => match (this.alignListItem) {
                    case ListItemAlign.Start =>
                        this.alignListItem = ListItemAlign.Center
                    case ListItemAlign.Center =>
                        this.alignListItem = ListItemAlign.End
                    case ListItemAlign.End =>
                        this.alignListItem = ListItemAlign.Start
                    case _ => return
                }
            })
        }.width(100.percent).height(100.percent).backgroundColor(0xDCDCDC).padding(top: 5.px)
    }
}
```

![list2](figures/list2.gif)

### 示例3 （设置编辑模式）

该示例展示了如何设置当前List组件是否处于可编辑模式。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
  @State var arr:ObservedArrayList<Int64> = ObservedArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  @State var editFlag: Bool = false

  func build() {
    Stack(alignContent: Alignment.TopStart ) {
      Column() {
        List(space: 20, initialIndex: 0 ) {
          ForEach(this.arr, itemGeneratorFunc:{item: Int64,index: Int64  =>
            ListItem() {
              Flex(direction:FlexDirection.Row, alignItems:ItemAlign.Center) {
                Text("${item}" )
                  .width(100.percent)
                  .height(80)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
                  .flexShrink(1)
                if (this.editFlag) {
                  Button() {
                    Text("delete").fontSize(16)
                  }.width(30.percent).height(40)
                  .onClick({event =>
                    if (index >=0 && index<this.arr.size) {
                      //BaseLog.info( "${this.arr[index]}Delete")
                      this.arr.remove(index)
                      //Hilog.info(0, "AppLogCj", this.arr.size.toString())
                      this.editFlag = false
                   }
                  }).stateEffect(true)
                }
              }
            }
          })
        }.width(90.percent)
        .scrollBar(BarState.Off)
      }.width(100.percent)

      Button("edit list")
        .onClick({event=>
          this.editFlag = !this.editFlag
        }).margin(top: 5, left: 20 )
    }.width(100.percent).height(100.percent).backgroundColor(0xDCDCDC).padding(top: 5)
  }
}
```

![list3](figures/list3.gif)

### 示例4 （设置限位对齐）

该示例展示了List组件设置居中限位的实现效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Entry
@Component
class EntryView {
   let arr: ArrayList<Int64> =  ArrayList<Int64>([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19])
   let scrollerForList = Scroller()

  func build() {
    Column() {
      Row() {
        List(space: 20, initialIndex: 3, scroller: this.scrollerForList ) {
          ForEach(this.arr, itemGeneratorFunc:{item:Int64,_:Int64=>
            ListItem() {
              Text("${item}")
                .width(100.percent).height(100).fontSize(16)
                .textAlign(TextAlign.Center)
            }
            .borderRadius(10).backgroundColor(0xFFFFFF)
            .width(60.percent)
            .height(80.percent)
          } )
        }
        .chainAnimation(true)
        .edgeEffect(EdgeEffect.Spring)
        .listDirection(Axis.Horizontal)
        .height(100.percent)
        .width(100.percent)
        .borderRadius(10.px)
        .backgroundColor(0xDCDCDC)
      }
      .width(100.percent)
      .height(100.percent)
      .backgroundColor(0xDCDCDC)
      .padding(top: 10.px )
    }
  }
}
```

![list4](figures/list4.gif)
