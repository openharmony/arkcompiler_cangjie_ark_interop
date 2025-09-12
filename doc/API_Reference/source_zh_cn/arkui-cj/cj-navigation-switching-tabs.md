# Tabs

通过页签进行内容视图切换的容器组件，每个页签对应一个内容视图。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

不支持自定义组件作为子组件，仅可包含子组件[TabContent](#class-tabcontent)，以及渲染控制类型[if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md)和[ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md)，并且if/else和ForEach下也仅支持TabContent，不支持自定义组件。

> **说明：**
>
> - Tabs子组件的visibility属性设置为None，或者visibility属性设置为Hidden时，对应子组件不显示，但依然会在视窗内占位。
> - Tabs子组件TabContent显示之后不会销毁，若需要页面懒加载和释放，请参见[示例2](#示例2页面懒加载和释放)。

## 创建组件

### init(BarPosition, TabsController, Int32, () -> Unit)

```cangjie
public init(
    barPosition!: BarPosition = BarPosition.Start,
    controller!: TabsController = TabsController(),
    index!: Int32 = -1,
    child!: () -> Unit = {=>}
)
```

**功能：** 创建一个Tabs容器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|barPosition|[BarPosition](#enum-barposition)|否|BarPosition.Start|设置Tabs的页签位置。<br/>初始值: BarPosition.Start|
|controller|[TabsController](#class-tabscontroller)|否|TabsController()|设置Tabs控制器。<br/>初始值：TabsController()|
|index|Int32|否|- 1|设置当前显示页签的索引。<br/>初始值：0<br/>**说明：**<br/>设置为小于0的值时按初始值显示。可选值为[0, TabContent子节点数量-1]。直接修改index跳页时，切换动效不生效。 使用TabController的changeIndex时，默认生效切换动效，可以设置animationDuration为0关闭动画。|
|child|()->Unit|否|{ => }|声明容器内的子组件。<br/>初始值：{ => }。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func animationDuration(Float32)

```cangjie
public func animationDuration(value: Float32): This
```

**功能：** 设置点击TabBar页签和调用TabsController的changeIndex接口切换TabContent的动画时长。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float32|是|-|点击TabBar页签和调用TabsController的changeIndex接口切换TabContent的动画时长。<br/>初始值：不设置该属性或设置为异常值，且设置TabBar为BottomTabBarStyle样式时，初始值为0。设置TabBar为其他样式时，初始值为300。<br/>单位：ms<br/>取值范围：[0, +∞)。|

### func barHeight(Length)

```cangjie
public func barHeight(value: Length): This
```

**功能：** 设置TabBar的高度值。设置为小于0或大于Tabs高度值时，按初始值显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|TabBar 的高度值。<br/>初始值：<br/>未设置带样式的TabBar且vertical属性为false时，初始值为56.vp。<br/>未设置带样式的TabBar且vertical属性为true时，初始值为Tabs的高度。<br/>设置[SubTabBarStyle](./cj-common-types.md#enum-subtabbarstyle)样式且vertical属性为false时，初始值为56.vp。<br/>设置SubTabBarStyle样式且vertical属性为true时，初始值为Tabs的高度。<br/>设置[BottomTabBarStyle](./cj-common-types.md#enum-bottomtabbarstyle)样式且vertical属性为true时，初始值为Tabs的高度。<br/>设置BottomTabBarStyle样式且vertical属性为false时，初始值为48.vp。|

### func barMode(BarMode)

```cangjie
public func barMode(value: BarMode): This
```

**功能：** 设置TabBar布局模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BarMode](./cj-common-types.md#enum-barmode)|是|-|布局模式。|

### func barWidth(Length)

```cangjie
public func barWidth(value: Length): This
```

**功能：** 设置TabBar的宽度值。设置为小于0或大于Tabs宽度值时，按初始值显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|TabBar 的宽度值。<br/>初始值：<br/>未设置[SubTabBarStyle](./cj-navigation-switching-tabs.md#class-subtabbarstyle)和[BottomTabBarStyle](./cj-navigation-switching-tabs.md#class-bottomtabbarstyle)的TabBar且vertical属性为false时，初始值为Tabs的宽度。<br/>未设置SubTabBarStyle和BottomTabBarStyle的TabBar且vertical属性为true时，初始值为56.vp。<br/>设置SubTabBarStyle样式且vertical属性为false时，初始值为Tabs的宽度。<br/>设置SubTabBarStyle样式且vertical属性为true时，初始值为56.vp。<br/>设置BottomTabBarStyle样式且vertical属性为true时，初始值为96.vp。<br/>设置BottomTabBarStyle样式且vertical属性为false时，初始值为Tabs的宽度。|

### func scrollable(Bool)

```cangjie
public func scrollable(value: Bool): This
```

**功能：** 设置是否可以通过滑动页面进行页面切换。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否可以通过滑动页面进行页面切换。<br/>初始值：true，可以通过滑动页面进行页面切换。为false时不可滑动切换页面。|

### func vertical(Bool)

```cangjie
public func vertical(value: Bool): This
```

**功能：** 设置是否为纵向Tab。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否为纵向Tab。<br/>初始值：false，横向Tabs，为true时纵向Tabs。<br/>尽量保持每一个页面中的子组件尺寸大小一致，避免滑动页面时出现页面切换动画跳动现象。|

## 组件事件

### func onChange(Callback\<Int32,Unit>)

```cangjie
public func onChange(event: Callback<Int32, Unit>): This
```

**功能：** Tab页签切换后触发的事件。

满足以下任一条件，即可触发该事件：

1、滑动页面进行页面切换时，组件滑动动画结束后触发。<br>

2、通过[控制器](#class-tabscontroller)调用[changeIndex](#func-changeindexint32)接口，Tab页签切换后触发。<br>

3、动态修改[状态变量](./cj-state-rendering-appstatemanagement.md)构造的index属性值，Tab页签切换后触发。<br>

4、点击TabBar页签，Tab页签切换后触发。

> **说明：**
>
> 使用自定义页签时，在onChange事件中，联动可能会导致滑动页面切换后才执行页签联动，引起自定义页签切换效果延迟。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|[Callback](../apis/BasicServicesKit/cj-apis-base.md#type-callback)\<Int32,Unit>|是|-|Tab页签切换事件回调。<br/>参数：<br/>当前显示的index索引，索引从0开始计算。|

## 基础类型定义

### class TabContent

```cangjie
public class TabContent <: ContainerBase {
    public init(child: () -> Unit)
    public init()
}
```

**功能：**仅在Tabs中使用，对应一个切换页签的内容视图。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ContainerBase](./cj-ui-framework.md#containerbase)

#### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**功能：** 创建一个包含子组件的TabContent容器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|child|()->Unit|是|-|声明容器内的子组件。|

#### init()

```cangjie
public init()
```

**功能：** 创建一个不包含子组件的TabContent容器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func tabBar(ResourceStr)

```cangjie
public func tabBar(content: ResourceStr): This
```

**功能：** 设置TabBar上显示内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|content|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|TabBar上显示内容。|

#### func tabBar(ResourceStr, ResourceStr)

```cangjie
public func tabBar(icon!: ResourceStr = "", text!: ResourceStr = ""): This
```

**功能：** 设置TabBar上显示内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|icon|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""|**命名参数。** TabBar上显示的图标。<br/>**说明：** 如果icon采用svg格式图源，则要求svg图源删除其自有宽高属性值。如采用带有自有宽高属性的svg图源，icon大小则是svg本身内置的宽高属性值大小。|
|text|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""|**命名参数。** TabBar上显示的文字内容。|

#### func tabBar(CustomBuilder)

```cangjie
public func tabBar(content: CustomBuilder): This
```

**功能：** 设置TabBar上显示内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|content|[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-|TabBar上显示内容。<br/>CustomBuilder： 构造器，内部可以传入组件|

### class TabsController

```cangjie
public class TabsController {
    public init()
}
```

**功能：** Tabs组件的控制器，用于控制Tabs组件进行页签切换。不支持一个TabsController控制多个Tabs组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init()

```cangjie
public init()
```

**功能：** 创建一个tabs控制器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func changeIndex(Int32)

```cangjie
public func changeIndex(value: Int32): Unit
```

**功能：** 控制Tabs切换到指定页签。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|页签在Tabs里的索引值，索引值从0开始。<br/>**说明：**<br/>设置小于0或大于最大数量的值时，取初始值0。|

### enum BarMode

```cangjie
public enum BarMode <: Equatable<BarMode> {
    | Fixed
    | Scrollable
    | ...
}
```

**功能：** TabBar布局模式枚举

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<BarMode>

#### Fixed

```cangjie
Fixed
```

**功能：** 所有TabBar均分屏幕宽度，TabBar不可滚动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Scrollable

```cangjie
Scrollable
```

**功能：** 所有TabBar按照自身尺寸布局，TabBar可滚动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(BarMode)

```cangjie
public operator func !=(other: BarMode): Bool
```

**功能：** 比较两个BarMode是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarMode](#enum-barmode)|是|-|待比较的另一个BarMode值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个BarMode不相等则返回true，否则返回false|

#### func ==(BarMode)

```cangjie
public operator func ==(other: BarMode): Bool
```

**功能：** 比较两个BarMode是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarMode](#enum-barmode)|是|-|待比较的另一个BarMode值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个BarMode相等则返回true，否则返回false|

### enum BarPosition

```cangjie
public enum BarPosition <: Equatable<BarPosition> {
    | Start
    | End
    | ...
}
```

**功能：** 设置TabBar的布局位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<BarPosition>

#### End

```cangjie
End
```

**功能：** 位于尾部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Start

```cangjie
Start
```

**功能：** 位于首部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(BarPosition)

```cangjie
public operator func !=(other: BarPosition): Bool
```

**功能：** 比较两个BarPosition是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarPosition](#enum-barposition)|是|-|待比较的另一个BarPosition值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个BarPosition不相等则返回true，否则返回false|

#### func ==(BarPosition)

```cangjie
public operator func ==(other: BarPosition): Bool
```

**功能：** 比较两个BarPosition是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarPosition](#enum-barposition)|是|-|待比较的另一个BarPosition值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个BarPosition相等则返回true，否则返回false|

## 示例代码

### 示例1（自定义页签切换联动）

本示例通过onChange实现切换时自定义tabBar和TabContent的联动。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var fontColor: UInt32 = 0x182431
    @State var selectedFontColor: UInt32 = 0x007DFF
    @State var currentIndex: Int32 = 0
    @State var selectedIndex: Int32 = 0
    var controller: TabsController = TabsController()

    func getFontColor(index: Int32): UInt32 {
        if (this.selectedIndex == index) {
            return this.selectedFontColor
        }
        return this.fontColor
    }

    func getFontWeight(index: Int32): FontWeight {
        if (this.selectedIndex == index) {
            return FontWeight.W400
        }
        return FontWeight.W500
    }

    func getOpacity(index: Int32): Int64 {
        if (this.selectedIndex == index) {
            return 1
        }
        return 0
    }

    @Builder
    func tabBuilder(index: Int32, name: String) {
        Column() {
            Text(name)
            .fontColor(this.getFontColor(index))
            .fontSize(16)
            .fontWeight(this.getFontWeight(index))
            .lineHeight(22)
            .margin(top: 17, bottom: 7)
            Divider()
            .strokeWidth(2)
            .color(0x007DFF)
        }.width(100.percent)
    }

    func build() {
        Column() {
            Tabs(barPosition: BarPosition.Start, controller: this.controller, index: this.currentIndex) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar({=>bind(this.tabBuilder, this)(0, "green")})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar({=>bind(this.tabBuilder, this)(1,"blue")})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar({=>bind(this.tabBuilder, this)(2,"yellow")})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar({=>bind(this.tabBuilder, this)(3, "pink")})
              }
            .vertical(false)
            .barMode(BarMode.Fixed)
            .barWidth(360)
            .barHeight(56)
            .animationDuration(400.0)
            .onChange({index: Int32 =>
                // currentIndex控制TabContent显示页签
                this.currentIndex = index
            })
            .width(360)
            .height(296)
            .margin(top: 52)
            .backgroundColor(0xF1F3F5)

        }.width(100.percent)
    }
}
```

![tab](figures/tabsExample1.gif)

### 示例2（页面懒加载和释放）

本示例通过使用自定义TabBar与Swiper配合LazyForEach实现页面懒加载和释放。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import kit.PerformanceAnalysisKit.Hilog
import std.collection.*
import ohos.arkui.state_macro_manage.*

class MyDataSource <: IDataSource<String> {
  public MyDataSource(let list: ArrayList<String> ) {}

  public func totalCount(): Int64 {
    return this.list.size
  }

  public func getData(index: Int64): String {
    return this.list[index]
  }

  public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
  }

  public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
  }
}

@Entry
@Component
class EntryView {
    @State var fontColor: Color = Color(0x182431)
    @State var selectedFontColor: Color = Color(0x007DFF)
    @State var currentIndex: Int32 = 0
    var list: ArrayList<String> = ArrayList<String>()
    var tabsController: TabsController = TabsController()
    var swiperController: SwiperController = SwiperController()
    var swiperData: MyDataSource = MyDataSource(ArrayList<String>())

    protected override func aboutToAppear() {
        for (i in 0..9) {
          this.list.add("${i}");
        }
        this.swiperData = MyDataSource(this.list)
    }

    @Builder
    func tabBuilder(index: Int32, name: String) {
        Column() {
            Text(name)
            .fontColor(if(this.currentIndex == index) {this.selectedFontColor} else {this.fontColor})
            .fontSize(16)
            .fontWeight(if(this.currentIndex == index) {FontWeight.W500} else {FontWeight.W400})
            .lineHeight(22)
            .margin(top: 17, bottom: 7)

            Divider()
            .strokeWidth(2)
            .color(0x007DFF)
            .opacity(if(this.currentIndex == index) {1.0} else {0.0})
        }.width(20.percent)
    }

    func build() {
        Column() {
            Tabs(barPosition: BarPosition.Start, controller: this.tabsController) {
                ForEach(this.list, itemGeneratorFunc:{item: String, index: Int64 =>
                    TabContent(){}.tabBar({=>bind(this.tabBuilder, this)(Int32(index), '页签 ${this.list[index]}')})
                })
            }
            .id("TabsExample12")
            .barMode(BarMode.Scrollable)
            .backgroundColor(0xF1F3F5)
            .height(56)
            .width(100.percent)

            Swiper(controller: this.swiperController) {
                LazyForEach(this.swiperData, itemGeneratorFunc: {item: String, idx: Int64 =>
                    Text(item)
                    .onAppear({=>
                      Hilog.info(0, "AppLogCj", 'onAppear ' + item)
                    })
                    .onDisAppear({=>
                      Hilog.info(0, "AppLogCj", 'onDisAppear ' + item)
                    })
                    .width(100.percent)
                    .height(100.percent)
                    .backgroundColor(0xAFEEEE)
                    .textAlign(TextAlign.Center)
                    .fontSize(30)
                })
            }
            .loop(false)
            .onChange({index: Int32 =>
                this.currentIndex = index
                this.tabsController.changeIndex(index)
            })
        }
    }
}
```

![tab](figures/tabsExample12.gif)

### 示例3（设置TabBar的布局模式）

本示例通过barMode分别实现了页签均分布局和以实际长度布局，且展示了当页签布局长度之和超过了TabBar总长度后可滑动的效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView{
    @State var text: String = "文本"
    @State var barMode: BarMode = BarMode.Fixed

    func build(){
        Column(){
            Row(){
                Button("文本增加 ")
                .width(47.percent)
                .height(50)
                .onClick({event => this.text += "文本"})
                .margin(right: 6.percent, bottom: 12)

                Button("文本重置")
                .width(47.percent)
                .height(50)
                .onClick({event => this.text = "文本"})
                .margin(bottom: 12)
            }

            Row(){
                Button("BarMode.Fixed")
                .width(47.percent)
                .height(50)
                .onClick({event => this.barMode = BarMode.Fixed})
                .margin(right: 6.percent, bottom: 12)

                Button("BarMode.Scrollable")
                .width(47.percent)
                .height(50)
                .onClick({event => this.barMode = BarMode.Scrollable})
                .margin(bottom: 12)
            }
            Tabs(){
                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFEC0CD)
                }.tabBar(this.text)

                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(Color.Green)
                }.tabBar(this.text)

                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(Color.Blue)
                }.tabBar(this.text)
            }
            .height(60.percent)
            .backgroundColor(0xf1f3f5)
            .barMode(this.barMode)
        }
        .width(100.percent)
        .height(500)
        .padding(24)
    }
}
```

![tab](figures/tabsExample13.gif)
