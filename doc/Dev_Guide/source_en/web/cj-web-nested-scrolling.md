# Web Component Nested Scrolling

The typical application scenario for Web component nested scrolling is when there are multiple independent areas within a page that require scrolling. When users scroll the content of a Web area, it can drive other scrollable areas to achieve a seamless page sliding experience.

For Web components embedded in scrollable containers like Scroll or List that receive swipe gesture events, they need to interface with the ArkUI framework's [NestedScrollMode](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-nestedscrollmode) enumeration type. This enables Web components to perform nested scrolling within ArkUI scrollable containers. Developers can specify the default nested scrolling mode using the `nestedScroll` property interface when creating a Web component, and can also dynamically change the nested scrolling mode during runtime.

The `nestedScroll` interface takes two parameters: `scrollForward` and `scrollBackward`, both of which are of the [NestedScrollMode](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-nestedscrollmode) enumeration type.

When a Web component is nested within multiple scrollable container components, any unconsumed offset or velocity values in the same direction as the parent component will be passed to the nearest parent component with matching direction. This allows the parent component to continue scrolling. A single gesture swipe can only trigger nested scrolling along either the X-axis or Y-axis. When swiping diagonally, the scrolling direction will be determined by the axis with the larger absolute value of offset or velocity. If the absolute values are equal on both axes, the scrolling direction will follow the nearest scrollable component's direction.

> **Note:**
>
> - Containers supporting nested scrolling: Grid, List, Scroll, Swiper, Tabs, WaterFlow, Refresh, bindSheet.
> - Input events supporting nested scrolling: gestures, mouse, touchpad.

<!-- compile -->

```cangjie
// index.cj
import ohos.state_macro_manage.*
import kit.ArkWeb.WebviewController
import kit.UIKit.*

@Entry
@Component
class EntryView {
    var scrollerForScroll: Scroller = Scroller()
    let controller = WebviewController()
    let controller2 = WebviewController()
    // When NestedScrollMode is set to SELF_ONLY, after scrolling to the edge of the Web page, it won't interact with parent components, and parent components still cannot scroll.
    @State
    var nestedScrollMode0: NestedScrollMode = NestedScrollMode.SELF_ONLY
    // When NestedScrollMode is set to SELF_FIRST, after scrolling to the edge of the Web page, the parent component continues scrolling.
    @State
    var nestedScrollMode1: NestedScrollMode = NestedScrollMode.SELF_FIRST
    // When NestedScrollMode is set to PARENT_FIRST, the parent component scrolls first, and notifies the Web component to continue scrolling after reaching the edge.
    @State
    var nestedScrollMode2: NestedScrollMode = NestedScrollMode.PARENT_FIRST
    // When NestedScrollMode is set to PARALLEL, the parent component and Web component scroll simultaneously.
    @State
    var nestedScrollMode3: NestedScrollMode = NestedScrollMode.PARALLEL
    @State
    var nestedScrollModeF: NestedScrollMode = NestedScrollMode.SELF_FIRST
    @State
    var nestedScrollModeB: NestedScrollMode = NestedScrollMode.SELF_FIRST
    // Vertical scrolling for Scroll
    @State
    var scrollDirection: ScrollDirection = ScrollDirection.Vertical

    func build() {
        Flex() {
            Scroll(this.scrollerForScroll) {
                Column(space: 5) {
                    Row() {
                        Text('Switch Forward Scroll Mode').fontSize(5)
                        Button("SELF_ONLY").onClick { evt =>
                            this.nestedScrollModeF = this.nestedScrollMode0
                        }.fontSize(5)
                        Button("SELF_FIRST").onClick { evt =>
                            this.nestedScrollModeF = this.nestedScrollMode1
                        }.fontSize(5)
                        Button("PARENT_FIRST").onClick { evt =>
                            this.nestedScrollModeF = this.nestedScrollMode2
                        }.fontSize(5)
                        Button("PARALLEL").onClick { evt =>
                            this.nestedScrollModeF = this.nestedScrollMode3
                        }.fontSize(5)
                    }
                    Row() {
                        Text('Switch Backward Scroll Mode').fontSize(5)
                        Button("SELF_ONLY").onClick { evt =>
                            this.nestedScrollModeB = this.nestedScrollMode0
                        }.fontSize(5)
                        Button("SELF_FIRST").onClick { evt =>
                            this.nestedScrollModeB = this.nestedScrollMode1
                        }.fontSize(5)
                        Button("PARENT_FIRST").onClick { evt =>
                            this.nestedScrollModeB = this.nestedScrollMode2
                        }.fontSize(5)
                        Button("PARALLEL").onClick { evt =>
                            this.nestedScrollModeB = this.nestedScrollMode3
                        }.fontSize(5)
                    }
                    Text('Current Forward Nested Scroll Mode ---nestedScrollModeF').fontSize(10)
                    Text('Current Backward Nested Scroll Mode ---nestedScrollModeB').fontSize(10)
                    Text("Scroll Area")
                        .width(100.percent)
                        .height(10.percent)
                        .backgroundColor(0X330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                    Text("Scroll Area")
                        .width(100.percent)
                        .height(10.percent)
                        .backgroundColor(0X330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                    Text("Scroll Area")
                        .width(100.percent)
                        .height(10.percent)
                        .backgroundColor(0X330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                    // Change src to a valid address or resource file
                    Web(src: "www.example.com", controller: this.controller)
                        .nestedScroll(
                            scrollForward: this.nestedScrollModeF,
                            scrollBackward: this.nestedScrollModeB
                        )
                        .height(40.percent)
                        .width(100.percent)

                    Text("Scroll Area")
                        .width(100.percent)
                        .height(20.percent)
                        .backgroundColor(0X330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                    Text("Scroll Area")
                        .width(100.percent)
                        .height(20.percent)
                        .backgroundColor(0X330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                    // Change src to a valid address or resource file
                    Web(src: "www.example.com", controller: this.controller2)
                        .nestedScroll(
                            scrollForward: this.nestedScrollModeF,
                            scrollBackward: this.nestedScrollModeB
                        )
                        .height(40.percent)
                        .width(90.percent)
                    Text("Scroll Area")
                        .width(100.percent)
                        .height(20.percent)
                        .backgroundColor(0X330000FF)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                }.width(95.percent).border( width: 5 )
            }.width(100.percent).height(120.percent).border(width: 5).scrollable(this.scrollDirection)
        }.width(100.percent).height(100.percent).backgroundColor(0xDCDCDC).padding(20)
    }
}
```

![web-nested-scrolling](figures/web-nested-scrolling.gif)