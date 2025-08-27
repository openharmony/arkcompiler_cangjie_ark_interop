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
> - Tabs子组件TabContent显示之后不会销毁，若需要页面懒加载和释放，请参见[示例12](#示例12（页面懒加载和释放）)。

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

2、通过[控制器](#class-tabscontroller)调用[changeIndex](#func-changeindexint)接口，Tab页签切换后触发。<br>

3、动态修改[状态变量](./cj-state-rendering-appstatemanagement.md)构造的index属性值，Tab页签切换后触发。<br>

4、点击TabBar页签，Tab页签切换后触发。

> **说明：**
>
> 使用自定义页签时，在onChange事件中，联动可能会导致滑动页面切换后才执行页签联动，引起自定义页签切换效果延迟。建议在[onAnimationStart](#func-onanimationstartcallback)中监听并刷新当前索引，以确保动效能够及时触发。具体实现可参考[示例1](#示例1自定义页签切换联动)。

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

本示例通过onAnimationStart、onChange实现切换时自定义tabBar和TabContent的联动。

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
            .opacity(this.getOpacity(index))
        }.width(100.percent)
    }

    func build() {
        Column() {
            Tabs(BarPosition.Start, this.controller, this.currentIndex) {
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
            .animationDuration(400)
            .onChange({index: Int32 =>
                // currentIndex控制TabContent显示页签
                this.currentIndex = index
            })
            .onAnimationStart({index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
                if (index == targetIndex) {
                    return
                }
                // selectedIndex控制自定义TabBar内Image和Text颜色切换
                this.selectedIndex = targetIndex
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

### 示例2（分割线基本属性）

本示例通过divider实现了分割线各种属性的展示。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var controller1: TabsController = TabsController()
    @State var dividerColor: Color = Color(0xff0000)
    @State var strokeWidth: Length = 2.vp
    @State var startMargin: Length = 0.vp
    @State var endMargin: Length = 0.vp
    @State var nullFlag: Bool = false

    func getDivider(): Option<DividerStyle> {
        if (this.nullFlag) {
            return Option.None
        }
        return DividerStyle(
            strokeWidth: this.strokeWidth,
            color: this.dividerColor,
            startMargin: this.startMargin,
            endMargin: this.endMargin
        )
    }

    func build() {
        Column() {
            Tabs(this.controller1) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar('pink')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar('yellow')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar('blue')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xff0000)
                }.tabBar('red')
            }
            .vertical(true)
            .scrollable(true)
            .barMode(BarMode.Fixed)
            .barWidth(70)
            .barHeight(200)
            .animationDuration(400)
            .onChange({index: Int32 =>
                Hilog.info(0, "AppLogCj", "${index}")
            })
            .height(200.vp)
            .margin(bottom: 12.vp)
            .divider(this.getDivider())

            Button('常规Divider').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.nullFlag = false;
              this.strokeWidth = 2.vp;
              this.dividerColor = Color(0xff0000);
              this.startMargin = 0.vp;
              this.endMargin = 0.vp;
            })
            Button('空Divider').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.nullFlag = true
            })
            Button('颜色变为蓝色').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.dividerColor = Color(0x007DFF)
            })
            Button('宽度增加').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.strokeWidth = this.strokeWidth.value + 2.0
            })
            Button('宽度减小').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              if (this.strokeWidth.value > 2.0) {
                this.strokeWidth = this.strokeWidth.value - 2.0
              }
            })
            Button('上边距增加').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.startMargin = this.startMargin.value + 2.0
            })
            Button('上边距减少').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              if (this.startMargin.value > 2.0) {
                this.startMargin = this.startMargin.value - 2.0
              }
            })
            Button('下边距增加').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.endMargin = this.endMargin.value + 2.0
            })
            Button('下边距减少').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              if (this.endMargin.value > 2.0) {
                this.endMargin = this.endMargin.value - 2.0
              }
            })

        }.padding(top: 24.vp, left: 24.vp, right: 24.vp)
    }
}
```

![tab](figures/tabsExample2.gif)

### 示例3（设置TabBar渐隐）

本示例通过fadingEdge实现了切换子页签渐隐和不渐隐

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var message: String = 'Hello World'
    private var controller: TabsController = TabsController()
    private var controller1: TabsController = TabsController()
    @State var selfFadingFade: Bool = true

    func build() {
        Column() {
            Button('子页签设置渐隐').id("fadingEdgeTrue").width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
                this.selfFadingFade = true
            })

            Button('子页签设置不渐隐').id("fadingEdgeFalse").width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
                this.selfFadingFade = false
            })

            Tabs(this.controller) {
                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar('pink')

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar('yellow')

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar('blue')

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')
            }
            .vertical(false)
            .scrollable(true)
            .barMode(BarMode.Scrollable)
            .barPosition(BarPosition.End)
            .barHeight(80)
            .animationDuration(400)
            .onChange({index: Int32 =>
                Hilog.info(0, "AppLogCj", "${index}")
            })
            .fadingEdge(this.selfFadingFade)
            .height(30.percent)
            .width(100.percent)

            Tabs(BarPosition.Start, this.controller1) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar('pink')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar('yellow')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar('blue')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')
            }
            .vertical(true)
            .scrollable(true)
            .barMode(BarMode.Scrollable)
            .barHeight(200)
            .barWidth(80)
            .animationDuration(400)
            .onChange({index: Int32 =>
                Hilog.info(0, "AppLogCj", "${index}")
            })
            .fadingEdge(this.selfFadingFade)
            .height(30.percent)
            .width(100.percent)
        }
        .padding(top: 24.vp, left: 24.vp, right: 24.vp)
    }
}
```

![tab](figures/tabsExample3.gif)

### 示例4（设置TabBar叠加在TabContent内容上）

本示例通过barOverlap实现了TabBar是否背后变模糊并叠加在TabContent之上。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var controller: TabsController = TabsController()
    @State var barOverlap: Bool = true
    @State var barBackgroundColor: UInt32 = 0x88888888

    func getMarginTop(): Length {
        if (this.barOverlap) {
            return 56.vp
        }
        return 0.vp
    }

    func build() {
        Column() {
            Button("barOverlap变化").width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
                if (this.barOverlap) {
                    this.barOverlap = false;
                } else {
                    this.barOverlap = true;
                }
            })

            Tabs( BarPosition.Start, this.controller, 0) {
                TabContent() {
                    Column() {
                        Text("barOverlap ${this.barOverlap}").fontSize(16).margin(top: this.getMarginTop())
                        Text("barBackgroundColor ${this.barBackgroundColor}").fontSize(16)
                    }.width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }
                .tabBar(icon: @r(app.media.startIcon), text: "1")

                TabContent() {
                    Column() {
                        Text("barOverlap ${this.barOverlap}").fontSize(16).margin(top: this.getMarginTop())
                        Text("barBackgroundColor ${this.barBackgroundColor}").fontSize(16)
                    }.width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }
                .tabBar(icon: @r(app.media.startIcon), text: "2")

                TabContent() {
                    Column() {
                        Text("barOverlap ${this.barOverlap}").fontSize(16).margin(top: this.getMarginTop())
                        Text("barBackgroundColor ${this.barBackgroundColor}").fontSize(16)
                    }.width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }
                .tabBar(icon: @r(app.media.startIcon), text: "3")
            }
            .vertical(false)
            .barMode(BarMode.Fixed)
            .height(60.percent)
            .barOverlap(this.barOverlap)
            .scrollable(true)
            .animationDuration(10)
            .barBackgroundColor(this.barBackgroundColor)
        }
        .height(500)
        .padding(top: 24.vp, left: 24.vp, right: 24.vp)
    }
}
```

![tab](figures/tabsExample4.gif)

### 示例5（设置TabBar栅格化可见区域）

本示例通过barGridAlign实现了以栅格化方式设置TabBar的可见区域。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var controller: TabsController = TabsController()
    @State var gridMargin: Int64 = 10
    @State var gridGutter: Int64 = 10
    @State var sm: Int32 = -2
    @State var clickedContent: String = "";

    func build() {
        Column() {
            Row() {
                Button("gridMargin+10 ${this.gridMargin}")
                .id("gridMarginAdd")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.gridMargin += 10
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("gridMargin-10 ${this.gridMargin}")
                .id("gridMarginSub")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.gridMargin -= 10
                })
                .margin(bottom: 12.vp)
            }
            Row() {
                Button("gridGutter+10 ${this.gridGutter}")
                .id("gridGutterAdd")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.gridGutter += 10
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("gridGutter-10 ${this.gridGutter}")
                .id("gridGutterSub")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.gridGutter -= 10
                })
                .margin(bottom: 12.vp)
            }
            Row() {
                Button("sm+2 ${this.sm}")
                .id("smAdd")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.sm += 2
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("sm-2 ${this.sm}")
                .id("smSub")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.sm -= 2
                })
                .margin(bottom: 12.vp)
            }

            Text("点击内容:${this.clickedContent}").width(100.percent).height(200).margin(top: 5)

            Tabs(BarPosition.End, this.controller) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.id("TabContent0").tabBar(icon: @r(app.media.startIcon), text: "1")

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.id("TabContent1").tabBar(icon: @r(app.media.startIcon), text: "2")

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.id("TabContent2").tabBar(icon: @r(app.media.startIcon), text: "3")
            }
            .width(350.vp)
            .animationDuration(300)
            .height(60.percent)
            .barGridAlign(BarGridColumnOptions(sm: this.sm, margin: this.gridMargin, gutter: this.gridGutter))
            .backgroundColor(0xf1f3f5)
            .onTabBarClick({index: Int32 =>
                this.clickedContent += "now index ${index} is clicked\n"
            })

        }
        .width(100.percent)
        .height(500)
        .margin(top: 5)
        .padding(10.vp)
    }
}
```

![tab](figures/tabsExample5.gif)

### 示例6（设置Scrollable模式下的TabBar的布局样式）

本示例实现了barMode的ScrollableBarModeOptions参数，该参数仅在Scrollable模式下有效。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var controller: TabsController = TabsController()
    @State var scrollMargin: Int64 = 0
    @State var layoutStyle: LayoutStyle = LayoutStyle.ALWAYS_CENTER
    @State var text: String = "文本"

    func build() {
        Column() {
            Row() {
                Button("scrollMargin+10 ${this.scrollMargin}")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.scrollMargin += 10
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("scrollMargin-10 ${this.scrollMargin}")
                .width(47.percent)
                .height(50)
                .onClick({ =>
                    this.scrollMargin -= 10
                })
                .margin(bottom: 12.vp)
            }

            Row() {
                Button("文本增加")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.text += '文本增加'
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("文本重置")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.text = "文本"
                })
                .margin(bottom: 12.vp)
            }

            Row() {
                Button("layoutStyle.ALWAYS_CENTER")
                .width(100.percent)
                .height(50)
                .margin(top: 5)
                .fontSize(15)
                .onClick({ =>
                    this.layoutStyle = LayoutStyle.ALWAYS_CENTER;
                })
                .margin(bottom: 12.vp)
            }

            Row() {
                Button("layoutStyle.ALWAYS_AVERAGE_SPLIT")
                .width(100.percent)
                .height(50)
                .margin(top: 5)
                .fontSize(15)
                .onClick({ =>
                    this.layoutStyle = LayoutStyle.ALWAYS_AVERAGE_SPLIT;
                })
                .margin(bottom: 12.vp)
            }

            Row() {
                Button("layoutStyle.SPACE_BETWEEN_OR_CENTER")
                .width(100.percent)
                .height(50)
                .margin(top: 5)
                .fontSize(15)
                .onClick({ =>
                    this.layoutStyle = LayoutStyle.SPACE_BETWEEN_OR_CENTER;
                })
                .margin(bottom: 12.vp)
            }

            Tabs(BarPosition.End, this.controller) {
                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar(this.text)

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar(this.text)

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(this.text)
            }
            .animationDuration(300)
            .height(60.percent)
            .backgroundColor(0xf1f3f5)
            .barMode(BarMode.Scrollable, ScrollableBarModeOptions(margin: this.scrollMargin, nonScrollableLayoutStyle: this.layoutStyle))
        }
        .width(100.percent)
        .height(500)
        .margin(top: 5)
        .padding(24.vp)
    }
}
```

![tab](figures/tabsExample6.gif)

### 示例7（自定义Tabs页面切换动画）

本示例通过customContentTransition实现了自定义Tabs页面的切换动画。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

class ItemType {
    public ItemType(public let text: String, public let backgroundColor: Color) {}
}

@Entry
@Component
class EntryView {
    @State var data: Array<ItemType> = [
        ItemType('Red', Color(0xff0000)),
        ItemType('Yellow', Color(0xFFBF00)),
        ItemType('Blue', Color(0x007DFF))
        ]
    @State var opacityList: ObservedArrayList<Float64> = ObservedArrayList<Float64>([1.0, 1.0, 1.0])
    @State var scaleList: ObservedArrayList<Float32> = ObservedArrayList<Float32>([1.0, 1.0, 1.0])

    var durationList: Array<Int32> = Array<Int32>()
    var timeoutList: Array<Int32> = Array<Int32>()
    var customContentTransition: (from: Int32, to: Int32) -> Option<TabContentAnimatedTransition> = {from: Int32, to: Int32 => Option.None}

    protected override func aboutToAppear() {
        this.durationList = [1000, 2000, 3000]
        this.timeoutList = [1000, 2000, 3000]
        this.customContentTransition = { from: Int32, to: Int32 =>
            Hilog.info(0, "AppLogCj", "customContentTransition from:${from}, to:${to}")
            let tabContentAnimatedTransition = TabContentAnimatedTransition(
                timeout: this.timeoutList[Int64(from)],
                transition: {proxy: TabContentTransitionProxy =>
                    Hilog.info(0, "AppLogCj", "tabContentTransitionProxy proxy.from:${proxy.from}, proxy.to:${proxy.to}")
                    this.scaleList[Int64(from)] = 1.0
                    this.scaleList[Int64(to)] = 0.5
                    this.opacityList[Int64(from)] = 1.0
                    this.opacityList[Int64(to)] = 0.5
                    animateTo(AnimateParam(duration: this.durationList[Int64(from)],onFinish: { => proxy.finishTransition() }),
                        { =>
                          this.scaleList[Int64(from)] = 0.5
                          this.scaleList[Int64(to)] = 1.0
                          this.opacityList[Int64(from)] = 0.5
                          this.opacityList[Int64(to)] = 1.0
                        })
                }
            )
            return Some(tabContentAnimatedTransition)
        }
    }

    func build() {
        Column() {
            Tabs() {
                ForEach(this.data, itemGeneratorFunc: {item: ItemType, index: Int64 =>
                    TabContent() {}
                    .tabBar(item.text)
                    .backgroundColor(item.backgroundColor)
                    // 自定义动画变化透明度、缩放页面等
                    .opacity(this.opacityList[index])
                    .scale(x: this.scaleList[index], y: this.scaleList[index])
                })
            }
            .backgroundColor(0xf1f3f5)
            .width(100.percent)
            .height(500)
            .customContentTransition(this.customContentTransition)
        }
    }
}
```

![tab](figures/tabsExample7.gif)

### 示例8（页面切换拦截）

本示例通过onContentWillChange实现了自定义页面手势滑动切换拦截。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var currentIndex: Int32 = 2
    var controller: TabsController = TabsController()

    func getFontColor(targetIndex: Int32) : UInt32 {
        if (this.currentIndex == targetIndex) {
            return 0x1698CE // 蓝色
        }
        return 0x6B6B6B // 灰色
    }

    @Builder func tabBuilder(title: String, targetIndex: Int32) {
        Column(){
          Text(title).fontColor(getFontColor(targetIndex))
        }
        .width(100.percent)
        .height(50)
        .justifyContent(FlexAlign.Center)
    }

    func build() {
        Column() {
            Tabs(BarPosition.End, this.controller, this.currentIndex) {
                TabContent() {
                    Column(){
                        Text('首页的内容')
                    }.width(100.percent).height(100.percent).backgroundColor(0x00CB87).justifyContent(FlexAlign.Center)
                }.tabBar({=>bind(this.tabBuilder, this)('首页',0)})

                TabContent() {
                    Column(){
                        Text('发现的内容')
                    }.width(100.percent).height(100.percent).backgroundColor(0x007DFF).justifyContent(FlexAlign.Center)
                }.tabBar({=>bind(this.tabBuilder, this)('发现',1)})

                TabContent() {
                    Column(){
                        Text('推荐的内容')
                    }.width(100.percent).height(100.percent).backgroundColor(0xFFBF00).justifyContent(FlexAlign.Center)
                }.tabBar({=>bind(this.tabBuilder, this)('推荐',2)})

                TabContent() {
                    Column(){
                        Text('我的内容')
                    }.width(100.percent).height(100.percent).backgroundColor(0xE67C92).justifyContent(FlexAlign.Center)
                }.tabBar({=>bind(this.tabBuilder, this)('我的',3)})
            }
            .vertical(false)
            .barMode(BarMode.Fixed)
            .barWidth(360)
            .barHeight(60)
            .animationDuration(0)
            .onChange({index: Int32 =>
                this.currentIndex = index
            })
            .width(360)
            .height(600)
            .backgroundColor(0xF1F3F5)
            .scrollable(true)
            .onContentWillChange({currentIndex, comingIndex =>
                if (comingIndex == 2) {
                    return false
                }
                return true
            })

            Button('动态修改index').width(50.percent).margin(top: 20)
            .onClick({ =>
                this.currentIndex = (this.currentIndex + 1) % 4
            })

            Button('changeIndex').width(50.percent).margin(top: 20)
            .onClick({ =>
                this.currentIndex = (this.currentIndex + 1) % 4
                this.controller.changeIndex(this.currentIndex)
            })
        }.width(100.percent)
    }
}
```

![tab](figures/tabsExample8.gif)

### 示例9（自定义TabBar切换动画）

本示例通过onChange、onAnimationStart、onAnimationEnd、onGestureSwipe等接口实现了自定义TabBar的切换动画。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.{HashMap}
import std.math.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var currentIndex: Int32 = 0
    @State var animationDuration: Int32 = 300
    @State var indicatorLeftMargin: Float64 = 0.0
    @State var indicatorWidth: Float64 = 0.0
    var tabsWidth: Float64 = 0.0
    var textInfos: Array<Array<Float64>> = Array(Int64(4), repeat: Array<Float64>())
    var isStartAnimateTo: Bool = false

    @Builder
    func tabBuilder(index: Int32, name: String) {
        Column() {
            Text(name)
            .fontSize(16)
            .fontColor(if (this.currentIndex == index) {0x007DFF} else {0x182431})
            .fontWeight(if (this.currentIndex == index) {FontWeight.W500} else {FontWeight.W400})
            .id(index.toString())
            .onAreaChange({oldValue: Area, newValue: Area =>
                this.textInfos[Int64(index)] = [newValue.globalPosition.x, newValue.width]
            })
        }.width(100.percent)
    }

    func build() {
        Stack(Alignment.TopStart) {
            Tabs(BarPosition.Start) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar({=>bind(this.tabBuilder, this)(0, 'green')})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar({=>bind(this.tabBuilder, this)(1, 'blue')})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar({=>bind(this.tabBuilder, this)(2, 'yellow')})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar({=>bind(this.tabBuilder, this)(3, 'pink')})
            }
            .onAreaChange({oldValue: Area, newValue: Area=>
                this.tabsWidth = newValue.width
                if (!this.isStartAnimateTo) {
                    this.setIndicatorAttr(this.textInfos[Int64(this.currentIndex)][0], this.textInfos[Int64(this.currentIndex)][1])
                }
            })
            .barWidth(100.percent)
            .barHeight(56)
            .width(100.percent)
            .height(296)
            .backgroundColor(0xF1F3F5)
            .animationDuration(this.animationDuration)
            .onChange({index: Int32 =>
                this.currentIndex = index // 监听索引index的变化，实现页签内容的切换。
            })
            .onAnimationStart({index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
                // 切换动画开始时触发该回调。下划线跟着页面一起滑动，同时宽度渐变。
                this.currentIndex = targetIndex
                this.startAnimateTo(this.animationDuration, this.textInfos[Int64(targetIndex)][0], this.textInfos[Int64(targetIndex)][1])
            })
            .onAnimationEnd({index: Int32, event: TabsAnimationEvent =>
                // 切换动画结束时触发该回调。下划线动画停止。
                let currentIndicatorInfo = this.getCurrentIndicatorInfo(index, event)
                this.startAnimateTo(0, currentIndicatorInfo["left"], currentIndicatorInfo["width"])
            })
            .onGestureSwipe({index: Int32, event: TabsAnimationEvent =>
                // 在页面跟手滑动过程中，逐帧触发该回调。
                let currentIndicatorInfo = this.getCurrentIndicatorInfo(index, event)
                this.currentIndex = Int32(currentIndicatorInfo["index"])
                this.setIndicatorAttr(currentIndicatorInfo["left"], currentIndicatorInfo["width"])
            })

            Column()
            .height(2)
            .width(this.indicatorWidth)
            .margin(left: this.indicatorLeftMargin, top: 48.0)
            .backgroundColor(0x007DFF)
        }.width(100.percent)
    }

    func getCurrentIndex(swipeRatio: Float64, nextIndex: Int32, index: Int32) :Int32 {
        if(swipeRatio > 0.5) {
            return nextIndex
        }
        return index
    }

    func getCurrentIndicatorInfo(index: Int32, event: TabsAnimationEvent): HashMap<String, Float64> {
        var nextIndex: Int32 = index
        if (index > 0 && (event.currentOffset < 0.0 || event.currentOffset > 0.0)) {
            nextIndex--
        } else if (index < 3 && (event.currentOffset > 0.0 || event.currentOffset < 0.0)) {
            nextIndex++
        }
        let indexInfo = this.textInfos[Int64(index)]
        let nextIndexInfo = this.textInfos[Int64(nextIndex)]
        let swipeRatio: Float64 = abs(Float64(event.currentOffset) / this.tabsWidth)
        // 页面滑动超过一半，tabBar切换到下一页。
        let currentIndexTmp = if(swipeRatio > 0.5) {index} else {nextIndex}

        let currentLeft = indexInfo[0] + (nextIndexInfo[0] - indexInfo[0]) * swipeRatio
        let currentWidth = indexInfo[1] + (nextIndexInfo[1] - indexInfo[1]) * swipeRatio
        return HashMap<String, Float64>([("index", Float64(currentIndexTmp)), ("left", currentLeft), ("width", currentWidth)])
    }

    func startAnimateTo(duration: Int32, leftMargin: Float64, width: Float64) {
        this.isStartAnimateTo = true
        animateTo(
            AnimateParam(
                duration: duration, // 动画时长
                curve: Curve.Linear, // 动画曲线
                iterations: 1, // 播放次数
                playMode: PlayMode.Normal, // 动画模式
                onFinish: { => this.isStartAnimateTo = false}
            ),
            { => this.setIndicatorAttr(leftMargin, width)}
        )
    }

    func setIndicatorAttr(leftMargin: Float64, width: Float64) {
        this.indicatorWidth = width
        this.indicatorLeftMargin = leftMargin
    }
}
```

![tab](figures/tabsExample9.gif)

### 示例10（预加载子节点）

本示例通过preloadItems接口实现了预加载指定子节点。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var currentIndex: Int32 = 1
    var tabsController: TabsController = TabsController()

    func build() {
        Column() {
            Tabs(this.tabsController, this.currentIndex) {
                TabContent() {
                    MyComponent(color: 0x00CB87)
                }.tabBar('green')

                TabContent() {
                    MyComponent(color: 0x007DFF)
                }.tabBar('blue')

                TabContent() {
                    MyComponent(color: 0xFFBF00)
                }.tabBar('yellow')

                TabContent() {
                    MyComponent(color: 0xE67C92)
                }.tabBar('pink')
            }
            .height(60.percent)
            .width(100.percent)
            .backgroundColor(0xF1F3F5)
            .onChange({index: Int32 =>
                this.currentIndex = index
            })

            Button('preload items: [0, 2, 3]')
            .margin(5)
            .onClick({ =>
                // 预加载第0、2、3个子节点，提高滑动或点击切换至这些节点时的性能
                Hilog.info(0, "AppLogCj", 'preloadItems start')
                this.tabsController.preloadItems([0, 2, 3])
            })
        }
    }
}

let colorIndex = HashMap<UInt32, Int32>([(0x00CB87,0),(0x007DFF,1),(0xFFBF00,2),(0xE67C92,3)])

@Component
class MyComponent {
    var color: UInt32

    protected override func aboutToAppear() {
        Hilog.info(0, "AppLogCj", 'aboutToAppear index:${colorIndex.get(this.color)}')
    }

    protected override func aboutToDisappear(){
        Hilog.info(0, "AppLogCj", 'aboutToDisappear index:${colorIndex.get(this.color)}')
    }

    func build() {
        Column()
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(this.color)
    }
}
```

### 示例11（设置TabBar平移距离和不透明度）

本示例通过setTabBarTranslate、setTabBarOpacity等接口设置了TabBar的平移距离和不透明度。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var controller: TabsController = TabsController()

    func build() {
        Column() {
            Button('设置TabBar的平移距离').margin(top: 20)
            .onClick({ =>
                this.controller.setTabBarTranslate(TranslateOptions(x: (-20).vp, y: (-20).vp))
            })

            Button('设置TabBar的透明度').margin(top: 20)
            .onClick({ =>
                this.controller.setTabBarOpacity(0.5)
            })

            Tabs(BarPosition.End, this.controller) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar(icon: @r(app.media.startIcon), text: 'green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(icon: @r(app.media.startIcon), text: 'blue')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar(icon: @r(app.media.startIcon), text: 'yellow')

                TabContent() {
                  Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar(icon: @r(app.media.startIcon), text: 'pink')
            }
            .width(100.percent)
            .height(500)
            .margin(top: 20)
            .barBackgroundColor(0xFFF1F3F5)
        }
        .width(100.percent)
    }
}
```

![tab](figures/tabsExample11.gif)

### 示例12（页面懒加载和释放）

本示例通过使用自定义TabBar与Swiper配合LazyForEach实现页面懒加载和释放。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
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
            .opacity(if(this.currentIndex == index) {1} else {0})
        }.width(20.percent)
    }

    func build() {
        Column() {
            Tabs(BarPosition.Start, this.tabsController) {
                ForEach(this.list, itemGeneratorFunc:{item: String, index: Int64 =>
                    TabContent(){}.tabBar({=>bind(this.tabBuilder, this)(Int32(index), '页签 ${this.list[index]}')})
                })
            }
            .id("TabsExample12")
            .onTabBarClick({index: Int32 =>
                this.currentIndex = index
                this.swiperController.changeIndex(index, true)
            })
            .barMode(BarMode.Scrollable)
            .backgroundColor(0xF1F3F5)
            .height(56)
            .width(100.percent)

            Swiper(this.swiperController) {
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

### 示例13（设置TabBar的布局模式）

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
                    Column().width(100.percent).height(100.percent).backgroundColor(Color.PINK)
                }.tabBar(SubTabBarStyle.of(this.text))

                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(Color.Green)
                }.tabBar(SubTabBarStyle.of(this.text))

                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(Color.Blue)
                }.tabBar(SubTabBarStyle.of(this.text))
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

### 示例14（设置边缘滑动效果）

本示例通过edgeEffect实现了不同的边缘滑动效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView{
    @State var edgeEffect: EdgeEffect = EdgeEffect.Spring

    func build(){
        Column(){
            Tabs(){
                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar('blue')

                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar('yellow')

                TabContent(){
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar('pink')
            }
            .width(360)
            .height(296)
            .margin(top: 52)
            .backgroundColor(0xF1F3F5)
            .edgeEffect(this.edgeEffect)

            Button('EdgeEffect.Spring').width(50.percent).margin(top: 20)
            .onClick({event => this.edgeEffect = EdgeEffect.Spring})

            Button('EdgeEffect.Fade').width(50.percent).margin(top: 20)
            .onClick({event => this.edgeEffect = EdgeEffect.Fade})

            Button('EdgeEffect.None').width(50.percent).margin(top: 20)
            .onClick({event => this.edgeEffect = EdgeEffect.None})
        }.width(100.percent)
    }
}
```

![tab](figures/tabsExample14.gif)
