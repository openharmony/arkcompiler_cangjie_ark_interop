# Tabs

A container component for switching content views through tabs, where each tab corresponds to a content view.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

Custom components are not supported as child components. Only [TabContent](#class-tabcontent) child components are allowed, along with rendering control types [if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md) and [ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md). Additionally, if/else and ForEach can only contain TabContent and not custom components.

> **Note:**
>
> - When the visibility property of a Tabs child component is set to None or Hidden, the corresponding child component will not be displayed but will still occupy space within the viewport.
> - TabContent child components of Tabs are not destroyed after being displayed. For lazy loading and release of pages, refer to [Example 12](#Example12（Lazy Loading and Release of Pages）).

## Creating the Component

### init(BarPosition, TabsController, Int32, () -> Unit)

```cangjie
public init(
    barPosition!: BarPosition = BarPosition.Start,
    controller!: TabsController = TabsController(),
    index!: Int32 = -1,
    child!: () -> Unit = {=>}
)
```

**Function:** Creates a Tabs container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| barPosition | [BarPosition](#enum-barposition) | No | BarPosition.Start | Sets the position of the Tabs' tab bar.<br/>Initial value: BarPosition.Start |
| controller | [TabsController](#class-tabscontroller) | No | TabsController() | Sets the Tabs controller.<br/>Initial value: TabsController() |
| index | Int32 | No | -1 | Sets the index of the currently displayed tab.<br/>Initial value: 0<br/>**Note:**<br/>Values less than 0 will default to the initial value. Valid values are [0, number of TabContent child nodes - 1]. Directly modifying the index to switch pages will not trigger the transition animation. Using TabController's changeIndex will trigger the transition animation by default, which can be disabled by setting animationDuration to 0. |
| child | () -> Unit | No | { => } | Declares the child components within the container.<br/>Initial value: { => }. |

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func animationDuration(Float32)

```cangjie
public func animationDuration(value: Float32): This
```

**Function:** Sets the animation duration for switching TabContent when clicking the TabBar tab or calling the TabsController's changeIndex interface.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float32 | Yes | - | The animation duration for switching TabContent when clicking the TabBar tab or calling the TabsController's changeIndex interface.<br/>Initial value: If this property is not set or is set to an invalid value, and the TabBar is set to BottomTabBarStyle, the initial value is 0. For other TabBar styles, the initial value is 300.<br/>Unit: ms<br/>Range: [0, +∞). |

### func barHeight(Length)

```cangjie
public func barHeight(value: Length): This
```

**Function:** Sets the height of the TabBar. Values less than 0 or greater than the Tabs height will default to the initial value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The height of the TabBar.<br/>Initial value:<br/>If no styled TabBar is set and the vertical property is false, the initial value is 56.vp.<br/>If no styled TabBar is set and the vertical property is true, the initial value is the height of the Tabs.<br/>If [SubTabBarStyle](./cj-common-types.md#enum-subtabbarstyle) is set and the vertical property is false, the initial value is 56.vp.<br/>If SubTabBarStyle is set and the vertical property is true, the initial value is the height of the Tabs.<br/>If [BottomTabBarStyle](./cj-common-types.md#enum-bottomtabbarstyle) is set and the vertical property is true, the initial value is the height of the Tabs.<br/>If BottomTabBarStyle is set and the vertical property is false, the initial value is 48.vp. |

### func barMode(BarMode)

```cangjie
public func barMode(value: BarMode): This
```

**Function:** Sets the layout mode of the TabBar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [BarMode](./cj-common-types.md#enum-barmode) | Yes | - | The layout mode. |

### func barWidth(Length)

```cangjie
public func barWidth(value: Length): This
```

**Function:** Sets the width of the TabBar. Values less than 0 or greater than the Tabs width will default to the initial value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The width of the TabBar.<br/>Initial value:<br/>If no [SubTabBarStyle](./cj-navigation-switching-tabs.md#class-subtabbarstyle) or [BottomTabBarStyle](./cj-navigation-switching-tabs.md#class-bottomtabbarstyle) is set for the TabBar and the vertical property is false, the initial value is the width of the Tabs.<br/>If no SubTabBarStyle or BottomTabBarStyle is set for the TabBar and the vertical property is true, the initial value is 56.vp.<br/>If SubTabBarStyle is set and the vertical property is false, the initial value is the width of the Tabs.<br/>If SubTabBarStyle is set and the vertical property is true, the initial value is 56.vp.<br/>If BottomTabBarStyle is set and the vertical property is true, the initial value is 96.vp.<br/>If BottomTabBarStyle is set and the vertical property is false, the initial value is the width of the Tabs. |

### func scrollable(Bool)

```cangjie
public func scrollable(value: Bool): This
```

**Function:** Sets whether page switching can be performed by swiping.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether page switching can be performed by swiping.<br/>Initial value: true, allowing page switching by swiping. If false, page switching by swiping is disabled. |

### func vertical(Bool)

```cangjie
public func vertical(value: Bool): This
```

**Function:** Sets whether the Tabs are vertical.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether the Tabs are vertical.<br/>Initial value: false, indicating horizontal Tabs. If true, the Tabs are vertical.<br/>It is recommended to keep the size of child components consistent across pages to avoid animation jumps during page switching. |

## Component Events

### func onChange(Callback\<Int32,Unit>)

```cangjie
public func onChange(event: Callback<Int32, Unit>): This
```

**Function:** Event triggered after a tab switch.

This event is triggered under any of the following conditions:

1. When switching pages by swiping, the event is triggered after the swipe animation completes.<br>

2. When the [controller](#class-tabscontroller) calls the [changeIndex](#func-changeindexint) interface, the event is triggered after the tab switch.<br>

3. When dynamically modifying the index property value constructed by a [state variable](./cj-state-rendering-appstatemanagement.md), the event is triggered after the tab switch.<br>

4. When clicking a TabBar tab, the event is triggered after the tab switch.

> **Note:**
>
> When using custom tabs, the onChange event may cause tab linkage to execute only after the page is switched by swiping, resulting in delayed custom tab switching effects. It is recommended to monitor and refresh the current index in [onAnimationStart](#func-onanimationstartcallback) to ensure timely triggering of animations. For implementation details, refer to [Example 1](#Example1（Custom Tab Switching Linkage）).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [Callback](../apis/BasicServicesKit/cj-apis-base.md#type-callback)\<Int32,Unit> | Yes | - | Callback for the tab switch event.<br/>Parameter:<br/>The index of the currently displayed tab, starting from 0. |

## Basic Type Definitions

### class TabContent

```cangjie
public class TabContent <: ContainerBase {
    public init(child: () -> Unit)
    public init()
}
```

**Function:** Used only within Tabs, corresponding to the content view of a switchable tab.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parent Type:**

- [ContainerBase](./cj-ui-framework.md#containerbase)

#### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**Function:** Creates a TabContent container with child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| child | () -> Unit | Yes | - | Declares the child components within the container. |

#### init()

```cangjie
public init()
```

**Function:** Creates a TabContent container without child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### func tabBar(ResourceStr)

```cangjie
public func tabBar(content: ResourceStr): This
```

**Function:** Sets the content displayed on the TabBar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| content | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | The content displayed on the TabBar. |

#### func tabBar(ResourceStr, ResourceStr)

```cangjie
public func tabBar(icon!: ResourceStr = "", text!: ResourceStr = ""): This
```

**Function:** Sets the content displayed on the TabBar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| icon | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | "" | **Named parameter.** The icon displayed on the TabBar.<br/>**Note:** If the icon uses an SVG image source, the SVG image source should remove its own width and height attributes. If an SVG image source with built-in width and height attributes is used, the icon size will be determined by the built-in width and height attributes of the SVG. |
| text | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | "" | **Named parameter.** The text content displayed on the TabBar. |

#### func tabBar(CustomBuilder)

```cangjie
public func tabBar(content: CustomBuilder): This
```

**Function:** Sets the content displayed on the TabBar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| content | [CustomBuilder](./cj-common-types.md#type-custombuilder) | Yes | - | The content displayed on the TabBar.<br/>CustomBuilder: A builder that can contain components. |

### class TabsController

```cangjie
public class TabsController {
    public init()
}
```

**Function:** The controller for the Tabs component, used to control the Tabs component for tab switching. A single TabsController cannot control multiple Tabs components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### init()

```cangjie
public init()
```

**Function:** Creates a Tabs controller.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### func changeIndex(Int32)

```cangjie
public func changeIndex(value: Int32): Unit
```

**Function:** Controls the Tabs to switch to the specified tab.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | The index of the tab within the Tabs, starting from 0.<br/>**Note:**<br/>Values less than 0 or greater than the maximum number of tabs will default to the initial value of 0. |

### enum BarMode

```cangjie
public enum BarMode <: Equatable<BarMode> {
    | Fixed
    | Scrollable
    | ...
}
```

**Function:** Enumeration for TabBar layout modes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parent Type:**

- Equatable\<BarMode>

#### Fixed

```cangjie
Fixed
```

**Function:** All TabBars evenly divide the screen width, and the TabBar cannot scroll.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### Scrollable

```cangjie
Scrollable
```

**Function:** All TabBars are laid out according to their own dimensions, and the TabBar can scroll.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### func !=(BarMode)

```cangjie
public operator func !=(other: BarMode): Bool
```

**Function:** Compares whether two BarMode values are not equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [BarMode](#enum-barmode) | Yes | - | The other BarMode value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two BarMode values are not equal, otherwise returns false. |

#### func ==(BarMode)

```cangjie
public operator func ==(other: BarMode): Bool
```

**Function:** Compares whether two BarMode values are equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [BarMode](#enum-barmode) | Yes | - | The other BarMode value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two BarMode values are equal, otherwise returns false. |

### enum BarPosition

```cangjie
public enum BarPosition <: Equatable<BarPosition> {
    | Start
    | End
    | ...
}
```

**Function:** Sets the layout position of the TabBar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parent Type:**

- Equatable\<BarPosition>

#### End

```cangjie
End
```

**Function:** Positioned at the end.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### Start

```cangjie
Start
```

**Function:** Positioned at the start.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### func !=(BarPosition)

```cangjie
public operator func !=(other: BarPosition): Bool
```

**Function:** Compares whether two BarPosition values are not equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [BarPosition](#enum-barposition) | Yes | - | The other BarPosition value to compare. |

**Return Value:**

## Sample Code

### Example 1 (Custom Tab Switching Synchronization)

This example demonstrates custom synchronization between tabBar and TabContent during switching through onAnimationStart and onChange.

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
                // currentIndex controls the displayed tab in TabContent
                this.currentIndex = index
            })
            .onAnimationStart({index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
                if (index == targetIndex) {
                    return
                }
                // selectedIndex controls color switching of Image and Text in custom TabBar
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

### Example 2 (Basic Divider Properties)

This example demonstrates various divider property displays through the divider component.

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

            Button('Standard Divider').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.nullFlag = false;
              this.strokeWidth = 2.vp;
              this.dividerColor = Color(0xff0000);
              this.startMargin = 0.vp;
              this.endMargin = 0.vp;
            })
            Button('Empty Divider').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.nullFlag = true
            })
            Button('Change Color to Blue').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.dividerColor = Color(0x007DFF)
            })
            Button('Increase Width').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.strokeWidth = this.strokeWidth.value + 2.0
            })
            Button('Decrease Width').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              if (this.strokeWidth.value > 2.0) {
                this.strokeWidth = this.strokeWidth.value - 2.0
              }
            })
            Button('Increase Top Margin').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.startMargin = this.startMargin.value + 2.0
            })
            Button('Decrease Top Margin').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              if (this.startMargin.value > 2.0) {
                this.startMargin = this.startMargin.value - 2.0
              }
            })
            Button('Increase Bottom Margin').width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
              this.endMargin = this.endMargin.value + 2.0
            })
            Button('Decrease Bottom Margin').width(100.percent).margin(bottom: 12.vp)
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

### Example 3 (Setting TabBar Fade Effect)

This example demonstrates enabling/disabling sub-tab fading effects through fadingEdge.

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
            Button('Enable Sub-Tab Fading').id("fadingEdgeTrue").width(100.percent).margin(bottom: 12.vp)
            .onClick({ =>
                this.selfFadingFade = true
            })

            Button('Disable Sub-Tab Fading').id("fadingEdgeFalse").width(100.percent).margin(bottom: 12.vp)
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

### Example 4 (Setting TabBar Overlay on TabContent)

This example demonstrates enabling/disabling TabBar blur effect and overlay on TabContent through barOverlap.

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
            Button("Toggle barOverlap").width(100.percent).margin(bottom: 12.vp)
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

![tab](figures/tabsExample4.gif)### Example 5 (Setting TabBar Grid Visibility Area)

This example demonstrates how to use `barGridAlign` to set the visible area of the TabBar in a grid layout.

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

            Text("Clicked Content:${this.clickedContent}").width(100.percent).height(200).margin(top: 5)

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

### Example 6 (Setting TabBar Layout Style in Scrollable Mode)

This example implements the `ScrollableBarModeOptions` parameter of `barMode`, which is only effective in Scrollable mode.

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
    @State var text: String = "Text"

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
                Button("Add Text")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.text += 'Add Text'
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("Reset Text")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({ =>
                    this.text = "Text"
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

### Example 7 (Custom Tabs Page Transition Animation)

This example demonstrates how to use `customContentTransition` to implement custom transition animations for Tabs pages.

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
                    // Custom animation for opacity and scale changes
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

### Example 8 (Page Transition Interception)

This example demonstrates how to use `onContentWillChange` to intercept custom page swipe transitions.

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
            return 0x1698CE // Blue
        }
        return 0x6B6B6B // Gray
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
                        Text('Home Content')
                    }.width(100.percent).height(100.percent).backgroundColor(0x00CB87).justifyContent(FlexAlign.Center)
                }.tabBar({=>bind(this.tabBuilder, this)('Home',0)})

                TabContent() {
                    Column(){
                        Text('Discover Content')
                    }.width(100.percent).height(100.percent).backgroundColor(0x007DFF).justifyContent(FlexAlign.Center)
                }.tabBar({=>bind(this.tabBuilder, this)('Discover',1)})

                TabContent() {
                    Column(){
                        Text('Recommend Content')
                    }.width(100.percent).height(100.percent).backgroundColor(0xFFBF00).justifyContent(FlexAlign.Center)
                }.tabBar({=>bind(this.tabBuilder, this)('Recommend',2)})

                TabContent() {
                    Column(){
                        Text('My Content')
                    }.width(100.percent).height(100.percent).backgroundColor(0xE67C92).justifyContent(FlexAlign.Center)
                }.tabBar({=>bind(this.tabBuilder, this)('My',3)})
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

            Button('Dynamically Modify Index').width(50.percent).margin(top: 20)
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

![tab](figures/tabsExample8.gif)### Example 9 (Custom TabBar Switching Animation)

This example implements a custom TabBar switching animation using interfaces such as `onChange`, `onAnimationStart`, `onAnimationEnd`, and `onGestureSwipe`.

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
                this.currentIndex = index // Monitors index changes to switch tab content.
            })
            .onAnimationStart({index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
                // Triggered when the switching animation starts. The underline slides with the page while its width gradually changes.
                this.currentIndex = targetIndex
                this.startAnimateTo(this.animationDuration, this.textInfos[Int64(targetIndex)][0], this.textInfos[Int64(targetIndex)][1])
            })
            .onAnimationEnd({index: Int32, event: TabsAnimationEvent =>
                // Triggered when the switching animation ends. The underline animation stops.
                let currentIndicatorInfo = this.getCurrentIndicatorInfo(index, event)
                this.startAnimateTo(0, currentIndicatorInfo["left"], currentIndicatorInfo["width"])
            })
            .onGestureSwipe({index: Int32, event: TabsAnimationEvent =>
                // Triggered frame-by-frame during page swipe tracking.
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
        // If the page slides more than halfway, switch the tabBar to the next page.
        let currentIndexTmp = if(swipeRatio > 0.5) {index} else {nextIndex}

        let currentLeft = indexInfo[0] + (nextIndexInfo[0] - indexInfo[0]) * swipeRatio
        let currentWidth = indexInfo[1] + (nextIndexInfo[1] - indexInfo[1]) * swipeRatio
        return HashMap<String, Float64>([("index", Float64(currentIndexTmp)), ("left", currentLeft), ("width", currentWidth)])
    }

    func startAnimateTo(duration: Int32, leftMargin: Float64, width: Float64) {
        this.isStartAnimateTo = true
        animateTo(
            AnimateParam(
                duration: duration, // Animation duration
                curve: Curve.Linear, // Animation curve
                iterations: 1, // Play count
                playMode: PlayMode.Normal, // Animation mode
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

### Example 10 (Preloading Child Nodes)

This example implements preloading of specified child nodes using the `preloadItems` interface.

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
                // Preload child nodes 0, 2, and 3 to improve performance when switching to these nodes via swipe or click
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

### Example 11 (Setting TabBar Translation Distance and Opacity)

This example sets the TabBar's translation distance and opacity using interfaces such as `setTabBarTranslate` and `setTabBarOpacity`.

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
            Button('Set TabBar Translation Distance').margin(top: 20)
            .onClick({ =>
                this.controller.setTabBarTranslate(TranslateOptions(x: (-20).vp, y: (-20).vp))
            })

            Button('Set TabBar Opacity').margin(top: 20)
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

### Example 12 (Lazy Loading and Release of Pages)

This example implements lazy loading and release of pages using a custom TabBar combined with Swiper and LazyForEach.

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
                    TabContent(){}.tabBar({=>bind(this.tabBuilder, this)(Int32(index), 'Tab ${this.list[index]}')})
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

### Example 13 (Setting TabBar Layout Mode)

This example demonstrates both evenly distributed tab layout and actual-length layout using `barMode`, and shows the scrollable effect when the total length of tabs exceeds the TabBar's width.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import std.collection.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView{
    @State var text: String = "Text"
    @State var barMode: BarMode = BarMode.Fixed

    func build(){
        Column(){
            Row(){
                Button("Add Text ")
                .width(47.percent)
                .height(50)
                .onClick({event => this.text += "Text"})
                .margin(right: 6.percent, bottom: 12)

                Button("Reset Text")
                .width(47.percent)
                .height(50)
                .onClick({event => this.text = "Text"})
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

![tab](figures/tabsExample13.gif)### Example 14 (Setting Edge Swipe Effects)

This example demonstrates different edge swipe effects through `edgeEffect`.

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