# Custom Event Distribution

When handling touch events, a touch test is performed between the press point and component area before the touch event is triggered to collect components that need to respond to the touch event. The corresponding touch event is then distributed based on the touch test results. At the parent node, developers can use `onChildTouchTest` to determine how child nodes perform touch tests, thereby influencing the touch testing of child components and ultimately affecting subsequent touch event distribution. For specific impacts, refer to the [TouchTestStrategy](#enum-touchteststrategy) enumeration description.

> **Note:**
>
> After custom event distribution, `onClick`, rotation, and pinch gestures may not respond if the touch hot zone is not hit.

## func onChildTouchTest((Array\<TouchTestInfo>) -> TouchResult)

```cangjie
public func onChildTouchTest(callback: (Array<TouchTestInfo>) -> TouchResult): This
```

**Function:** Sets a custom touch test event for child nodes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (Array\<[TouchTestInfo](#class-touchtestinfo)>)->[TouchResult](#class-touchresult) | Yes | - | Callback function triggered when custom touch testing is performed for child nodes.<br/>Parameter: An array containing child node information.<br/>Return value: Custom event distribution result. |

## Basic Type Definitions

### class TouchTestInfo

```cangjie
public class TouchTestInfo {
    public let windowX: Float32
    public let windowY: Float32
    public let parentX: Float32
    public let parentY: Float32
    public let x: Float32
    public let y: Float32
    public let rect: RectResult
    public let id: String
    public init(windowX: Float32, windowY: Float32, parentX: Float32, parentY: Float32, x: Float32, y: Float32, rect: RectResult, id: String)
}
```

**Function:** Represents the coordinate system, ID, and size-related information of the component where the current press point is located.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### let id

```cangjie
public let id: String
```

**Function:** Stores the ID of the component where the current press point is located.

**Type:** String

**Read/Write:** Read-only

**Since:** 19

#### let parentX

```cangjie
public let parentX: Float32
```

**Function:** Stores the horizontal coordinate of the press point relative to the top-left corner of the parent component.

**Type:** Float32

**Read/Write:** Read-only

**Since:** 19

#### let parentY

```cangjie
public let parentY: Float32
```

**Function:** Stores the vertical coordinate of the press point relative to the top-left corner of the parent component.

**Type:** Float32

**Read/Write:** Read-only

**Since:** 19

#### let rect

```cangjie
public let rect: RectResult
```

**Function:** Stores the size information of the child component.

**Type:** [RectResult](./cj-common-types.md#class-rectresult)

**Read/Write:** Read-only

**Since:** 19

#### let windowX

```cangjie
public let windowX: Float32
```

**Function:** Stores the horizontal coordinate of the press point relative to the top-left corner of the window.

**Type:** Float32

**Read/Write:** Read-only

**Since:** 19

#### let windowY

```cangjie
public let windowY: Float32
```

**Function:** Stores the vertical coordinate of the press point relative to the top-left corner of the window.

**Type:** Float32

**Read/Write:** Read-only

**Since:** 19

#### let x

```cangjie
public let x: Float32
```

**Function:** Stores the horizontal coordinate of the press point relative to the top-left corner of the child component.

**Type:** Float32

**Read/Write:** Read-only

**Since:** 19

#### let y

```cangjie
public let y: Float32
```

**Function:** Stores the vertical coordinate of the press point relative to the top-left corner of the child component.

**Type:** Float32

**Read/Write:** Read-only

**Since:** 19

#### init(Float32, Float32, Float32, Float32, Float32, Float32, RectResult, String)

```cangjie
public init(windowX: Float32, windowY: Float32, parentX: Float32, parentY: Float32, x: Float32, y: Float32, rect: RectResult, id: String)
```

**Function:** Constructs a `TouchTestInfo` object.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| windowX | Float32 | Yes | - | The x-coordinate of the press point relative to the top-left corner of the window. |
| windowY | Float32 | Yes | - | The y-coordinate of the press point relative to the top-left corner of the window. |
| parentX | Float32 | Yes | - | The x-coordinate of the press point relative to the top-left corner of the parent component. |
| parentY | Float32 | Yes | - | The y-coordinate of the press point relative to the top-left corner of the parent component. |
| x | Float32 | Yes | - | The x-coordinate of the press point relative to the top-left corner of the child component. |
| y | Float32 | Yes | - | The y-coordinate of the press point relative to the top-left corner of the child component. |
| rect | [RectResult](./cj-common-types.md#class-rectresult) | Yes | - | The size of the child component. |
| id | String | Yes | - | The component ID set via the `id` attribute. |

### class TouchResult

```cangjie
public class TouchResult {
    public init(strategy: TouchTestStrategy, id!: String = "")
    public init(cTouchResult: CTouchResult)
}
```

**Function:** Custom event distribution result. Developers influence event distribution by returning this result.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### init(TouchTestStrategy, String)

```cangjie
public init(strategy: TouchTestStrategy, id!: String = "")
```

**Function:** Constructs a `TouchResult` object.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| strategy | [TouchTestStrategy](#enum-touchteststrategy) | Yes | - | Event distribution strategy. |
| id | String | No | "" | **Named parameter.** The component ID set via the `id` attribute. When `strategy` is `TouchTestStrategy.DEFAULT`, `id` is optional. When `strategy` is `TouchTestStrategy.FORWARD_COMPETITION` or `TouchTestStrategy.FORWARD`, `id` is required (if no `id` is returned, it is treated as `TouchTestStrategy.DEFAULT`). |

#### init(CTouchResult)

```cangjie
public init(cTouchResult: CTouchResult)
```

**Function:** Constructs a `TouchResult` object.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| cTouchResult | CTouchResult | Yes | - | Custom event distribution result. |

### enum TouchTestStrategy

```cangjie
public enum TouchTestStrategy {
    | DEFAULT
    | FORWARD_COMPETITION
    | FORWARD
}
```

**Function:** Event distribution strategy.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### DEFAULT

```cangjie
DEFAULT
```

**Function:** Custom distribution has no effect. The system distributes events based on the current node's hit state.

**Since:** 19

#### FORWARD

```cangjie
FORWARD
```

**Function:** Applies specified event distribution to a child node. The system no longer processes event distribution to other sibling nodes.

**Since:** 19

#### FORWARD_COMPETITION

```cangjie
FORWARD_COMPETITION
```

**Function:** Applies specified event distribution to a child node. Whether events are distributed to other sibling nodes is determined by the system.

**Since:** 19

## Example Code

### Example 1 (Setting Event Distribution Strategy to FORWARD_COMPETITION)

In this example, clicking and dragging the blank area below the `List` allows the `List` to scroll. When clicking the `Button`, the `Button` responds to the `onClick` event.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class EntryView {
    @State var value: Int32 = 1
    @State var text: String = "Button"
    let numbers: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    func touchTestInfo(touchinfo: Array<TouchTestInfo>): TouchResult {
        let items = ArrayList<TouchTestInfo>()
        for (item in touchinfo) {
            if (item.id == 'MyList') {
                return TouchResult(TouchTestStrategy.FORWARD_COMPETITION, id: item.id)
            }
        }
        return TouchResult(TouchTestStrategy.DEFAULT, id: "")
    }

    func build() {
        Column {
            List(space: 10, initialIndex: 0) {
                ForEach(this.numbers, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            Text("${item}")
                                .width(100.percent)
                                .height(56)
                                .fontSize(16)
                                .textAlign(TextAlign.Start)
                        }
                        .backgroundColor(Color.WHITE)
                        .borderRadius(24)
                        .padding(left: 12, right: 12)
                    }
                )
            }
            .listDirection(Axis.Vertical)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .onScrollIndex({first: Int32, last: Int32 =>
                AppLog.info("first: " + first.toString() + " last: " + last.toString())
            })
            .onDidScroll({scrollOffset: Float64, scrollState: ScrollState =>
                AppLog.info('onScroll scrollState = ScrollState.${scrollState.toString()}, scrollOffset = ${scrollOffset}')
            })
            .width(100.percent)
            .height(65.percent)
            .id("MyList")

            Button(this.text)
                .width(312)
                .height(40)
                .id("Mybutton")
                .margin(top: 80)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .onClick({evt =>
                        this.text = "click the button"
                        PromptAction.showToast(message: "you click the button", duration: 3000)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xF1F3F5)
        .justifyContent(FlexAlign.End)
        .padding(left: 12, right: 12, bottom: 24)
        .onChildTouchTest(touchTestInfo)
    }
}
```

![childtouchtest](./figures/childrentouch-2.gif)

### Example 2 (Setting Event Dispatch Strategy to FORWARD)

After clicking and dragging the blank area below the List, the List can be scrolled. When clicking the Button, the Button will not respond to the onClick event.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class EntryView {
    @State var value: Int32 = 1
    @State var text: String = "Button"
    let numbers: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    func touchTestInfo(touchinfo: Array<TouchTestInfo>): TouchResult {
        let items = ArrayList<TouchTestInfo>()
        for (item in touchinfo) {
            if (item.id == 'MyList') {
                return TouchResult(TouchTestStrategy.FORWARD, id: item.id)
            }
        }
        return TouchResult(TouchTestStrategy.DEFAULT, id: "")
    }

    func build() {
        Column {
            List(space: 10, initialIndex: 0) {
                ForEach(this.numbers, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            Text("${item}")
                                .width(100.percent)
                                .height(56)
                                .fontSize(16)
                                .textAlign(TextAlign.Center)
                                .borderRadius(10)
                                .backgroundColor(0xFFFFFF)
                        }
                        .backgroundColor(Color.WHITE)
                        .borderRadius(24)
                        .padding(12)
                    }
                )
            }
            .scrollBar(BarState.Off)
            .width(80.percent)
            .onScrollIndex({first: Int32, last: Int32 =>
                AppLog.info("first: " + first.toString() + " last: " + last.toString())
            })
            .width(100.percent)
            .height(65.percent)
            .id("MyList")

            Button(this.text)
                .width(312)
                .height(40)
                .id("Mybutton")
                .onClick({evt =>
                        this.text = "click the button"
                        PromptAction.showToast(message: "you click the button", duration: 3000)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .onChildTouchTest(touchTestInfo)
    }
}
```

![touch_event](figures/onChildTouchTest.gif)

### Example 3 (Setting Event Dispatch Strategy to DEFAULT)

After clicking and dragging the blank area below the List, the List will not scroll. When clicking the Button, the Button will respond to the onClick event.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class EntryView {
    @State var value: Int32 = 1
    @State var text: String = "Button"
    let numbers: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    func touchTestInfo(touchinfo: Array<TouchTestInfo>): TouchResult {
        return TouchResult(TouchTestStrategy.DEFAULT, id: "")
    }

    func build() {
        Column {
            List(space: 10, initialIndex: 0) {
                ForEach(this.numbers, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            Text("${item}")
                                .width(100.percent)
                                .height(56)
                                .fontSize(16)
                                .textAlign(TextAlign.Start)
                        }
                        .backgroundColor(Color.WHITE)
                        .borderRadius(24)
                        .padding(left: 12, right: 12)
                    }
                )
            }
            .listDirection(Axis.Vertical)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .onScrollIndex({first: Int32, last: Int32 =>
                AppLog.info("first: " + first.toString() + " last: " + last.toString())
            })
           .onDidScroll({scrollOffset: Float64, scrollState: ScrollState =>
                AppLog.info('onScroll scrollState = ScrollState.${scrollState.toString()}, scrollOffset = ${scrollOffset}')
            })
            .width(100.percent)
            .height(65.percent)
            .id("MyList")

            Button(this.text)
                .width(312)
                .height(40)
                .id("Mybutton")
                .margin(top: 80)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .onClick({evt =>
                        this.text = "click the button"
                        PromptAction.showToast(message: "you click the button", duration: 3000)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xF1F3F5)
        .justifyContent(FlexAlign.End)
        .padding(left: 12, right: 12, bottom: 24)
        .onChildTouchTest(touchTestInfo)
    }
}
```

![childrentouch](./figures/childrentouch-3.gif)