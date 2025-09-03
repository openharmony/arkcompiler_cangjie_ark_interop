# RelativeContainer

A relative layout component used for aligning elements in complex scenarios.

> **Note:**
>
> The margin of child components within a relative layout container differs from the general [margin](cj-universal-attribute-size.md#func-marginlength) attribute. Here, it represents the distance to the anchor point in that direction. If no anchor point exists in that direction, the margin in that direction will not take effect.

## Child Components

Supports multiple child components.

## Creating the Component

### init(() -> Unit)

```cangjie
public init(child!: () -> Unit = {=>})
```

**Function:** Creates a RelativeContainer component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| child | () -> Unit | No | { => } | Declares the child components of the container. |

## Universal Attributes/Events

Universal Attributes: All supported.

Universal Events: All supported.

## Component Attributes

### func barrier(Array\<BarrierStyle>)

```cangjie
public func barrier(value: Array<BarrierStyle>): This
```

**Function:** Sets barriers within the RelativeContainer. Each item in the Array represents a barrier.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Array\<[BarrierStyle](#class-barrierstyle)> | Yes | - | Barriers within the RelativeContainer. |

### func guideLine(Array\<GuideLineStyle>)

```cangjie
public func guideLine(value: Array<GuideLineStyle>): This
```

**Function:** Sets guidelines within the RelativeContainer. Each item in the Array represents a guideline.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Array\<[GuideLineStyle](#class-guidelinestyle)> | Yes | - | Guidelines within the RelativeContainer. |

## Basic Type Definitions

### class BarrierStyle

```cangjie
public class BarrierStyle {
    public var id: String
    public var direction: BarrierDirection
    public var referencedId: Array<String>

    public init(id: String, direction: BarrierDirection, referencedId: Array<String>)
}
```

**Function:** Defines a barrier's ID, direction, and the components it depends on.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var direction

```cangjie
public var direction: BarrierDirection
```

**Function:** Specifies the barrier's direction. Vertical barriers (TOP, BOTTOM) can only serve as horizontal anchors for components, with a value of 0 when used as vertical anchors. Horizontal barriers (LEFT, RIGHT) can only serve as vertical anchors for components, with a value of 0 when used as horizontal anchors.

**Type:** [BarrierDirection](cj-common-types.md#enum-barrierdirection)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var id

```cangjie
public var id: String
```

**Function:** The barrier's ID, which must be unique and cannot duplicate any component names within the container.

**Type:** String

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var referencedId

```cangjie
public var referencedId: Array<String>
```

**Function:** Specifies the components the barrier depends on.

**Type:** Array\<String>

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(String, BarrierDirection, Array\<String>)

```cangjie
public init(id: String, direction: BarrierDirection, referencedId: Array<String>)
```

**Function:** Creates a BarrierStyle object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| id | String | Yes | - | The barrier's ID, which must be unique and cannot duplicate any component names within the container. |
| direction | [BarrierDirection](./cj-common-types.md#enum-barrierdirection) | Yes | - | Specifies the barrier's direction.<br>Vertical barriers (TOP, BOTTOM) can only serve as horizontal anchors for components, with a value of 0 when used as vertical anchors. Horizontal barriers (LEFT, RIGHT) can only serve as vertical anchors for components, with a value of 0 when used as horizontal anchors.<br>Default: BarrierDirection.LEFT |
| referencedId | Array\<String> | Yes | - | Specifies the components the barrier depends on. |

### class GuideLinePosition

```cangjie
public class GuideLinePosition {
    public var start:?Length = None
    public var end:?Length = None

    public init(start!: ?Length = None, end!: ?Length = None)
}
```

**Function:** Defines the position of a guideline.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var end

```cangjie
public var end:?Length = None
```

**Function:** The distance from the guideline to the right or bottom of the container.

**Type:** ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-Length)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var start

```cangjie
public var start:?Length = None
```

**Function:** The distance from the guideline to the left or top of the container.

**Type:** ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-Length)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(?Length, ?Length)

```cangjie
public init(start!: ?Length = None, end!: ?Length = None)
```

**Function:** Creates a GuideLinePosition object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| start | ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-Length) | No | None | **Named parameter.** The distance from the guideline to the left or top of the container. |
| end | ?[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-Length) | No | None | **Named parameter.** The distance from the guideline to the right or bottom of the container. |

### class GuideLineStyle

```cangjie
public class GuideLineStyle {
    public var id: String
    public var direction: Axis
    public var position: GuideLinePosition

    public init(id: String, direction: Axis, position: GuideLinePosition)
}
```

**Function:** Defines a guideline's ID, direction, and position.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var direction

```cangjie
public var direction: Axis
```

**Function:** Specifies the guideline's direction. Vertical guidelines can only serve as horizontal anchors for components, with a value of 0 when used as vertical anchors. Horizontal guidelines can only serve as vertical anchors for components, with a value of 0 when used as horizontal anchors.

**Type:** [Axis](cj-common-types.md#enum-axis)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var id

```cangjie
public var id: String
```

**Function:** The guideline's ID, which must be unique and cannot duplicate any component names within the container.

**Type:** String

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var position

```cangjie
public var position: GuideLinePosition
```

**Function:** Specifies the guideline's position. If undeclared or declared with an invalid value (e.g., undefined), the guideline's position defaults to start: 0. Either start or end can be used for declaration. If both are declared, only start takes effect. If the container's size in a direction is declared as "auto", guidelines in that direction can only be declared using start (percentages are not allowed).

**Type:** [GuideLinePosition](#class-guidelineposition)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(String, Axis, GuideLinePosition)

```cangjie
public init(id: String, direction: Axis, position: GuideLinePosition)
```

**Function:** Creates a GuideLineStyle object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| id | String | Yes | - | The guideline's ID, which must be unique and cannot duplicate any component names within the container. |
| direction | [Axis](./cj-common-types.md#enum-axis) | Yes | - | Specifies the guideline's direction.<br>Vertical guidelines can only serve as horizontal anchors for components, with a value of 0 when used as vertical anchors. Horizontal guidelines can only serve as vertical anchors for components, with a value of 0 when used as horizontal anchors.<br>Default: Axis.Vertical |
| position | [GuideLinePosition](#class-guidelineposition) | Yes | - | Specifies the guideline's position. If undeclared or declared with an invalid value, the guideline's position defaults to start: 0. Either start or end can be used for declaration. If both are declared, only start takes effect.<br>Default: {start: 0} |

## Example Code

### Example 1 (Layout Using Container and Child Components as Anchors)

This example demonstrates layout functionality using the container and its child components as anchors via the `alignRules` interface.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row().width(100).height(100)
                .backgroundColor(0xff3333)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start)
                    )
                ).id("row1")
                Row().width(100).height(100)
                .backgroundColor(0xFFCC00)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End)
                    )
                ).id("row2")
                Row().height(100)
                .backgroundColor(0xFF6633)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row1", HorizontalAlign.End),
                        right: HorizontalAnchor("row2", HorizontalAlign.Start)
                    )
                ).id("row3")
                Row()
                .backgroundColor(0xFF9966)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("row1",  HorizontalAlign.End)
                    )
                ).id("row4")
                Row()
                .backgroundColor(0xff3333)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row2", HorizontalAlign.Start),
                        right: HorizontalAnchor("__container__",  HorizontalAlign.End)
                    )
                ).id("row5")
            }
            .width(300).height(300)
            .margin(left: 50.vp)
            .border(width: 2.vp, color: Color(0x6699ff))
        }.height(100.percent)
    }
}
```

![relativecontainer1](figures/relativecontainer1.jpg)### Example 2 (Setting Margins for Child Components)

This example demonstrates the usage of setting margins for child components within a container.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row().width(100).height(100)
                .backgroundColor(0xff3333)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start)
                    )
                ).id("row1")
                .margin(10)
                Row().width(100).height(100)
                .backgroundColor(0xFFCC00)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Top),
                        left: HorizontalAnchor("row1", HorizontalAlign.End)
                    )
                ).id("row2")
                Row().height(100).width(100)
                .backgroundColor(0xFF6633)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row1", HorizontalAlign.Start)
                    )
                ).id("row3")
                Row().width(100).height(100)
                .backgroundColor(0xFF9966)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row2", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row3", HorizontalAlign.End),
                    )
                ).id("row4")
                .margin(10)
            }
            .width(300).height(300)
            .margin(left: 50.vp)
            .border(width: 2.vp, color: Color(0x6699ff))
        }.height(100.percent)
    }
}
```

![relativecontainer2](figures/relativecontainer2.jpg)

### Example 3 (Setting Offset)

This example demonstrates the effect of offsetting a child component's position between two vertical anchors using [bias](cj-universal-attribute-location.md#class-bias).

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row().width(100).height(100).backgroundColor(0xff3333).alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                        bias: Bias(vertical: 0.3)
                    )
                ).id("row1")
            }
            .width(300).height(300)
            .margin(left: 50.vp)
            .border(width: 2.vp, color: Color(0x6699ff))
        }.height(100.percent)
    }
}
```

![relativecontainer4](figures/relativecontainer3.jpg)

### Example 4 (Setting Guidelines)

This example demonstrates how the relative layout component sets guidelines using the [guideLine](#func-guidelinearrayguidelinestyle) interface, allowing child components to use the guidelines as anchors.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row().width(100).height(100).backgroundColor(0xff3333).alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("guideline2", VerticalAlign.Top),
                        left: HorizontalAnchor("guideline1", HorizontalAlign.End),
                    )
                ).id("row1")
            }.width(300).height(300).margin(left: 50.vp).border(width: 2.vp, color: Color(0x6699ff))
            .guideLine(
                [GuideLineStyle("guideline1", Axis.Vertical, GuideLinePosition(start: 50.vp)),
                GuideLineStyle("guideline2", Axis.Horizontal, GuideLinePosition(start: 50.vp))])
        }.height(100.percent)
    }
}
```

![relativecontainer5](figures/relativecontainer4.jpg)

### Example 5 (Setting Barriers)

This example demonstrates how the relative layout component sets barriers using the [barrier](#func-barrierarraybarrierstyle) interface, allowing child components to use the barriers as anchors.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row().width(100).height(100)
                .backgroundColor(0xff3333)
                .id("row1")

                Row().width(100).height(100)
                .backgroundColor(0xFFCC00)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Bottom),
                        middle: HorizontalAnchor("row1", HorizontalAlign.End)
                    )
                ).id("row2")

                Row().height(100).width(100)
                .backgroundColor(0xFF6633)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Top),
                        left: HorizontalAnchor("barrier1", HorizontalAlign.End)
                    )
                ).id("row3")

                Row().width(50).height(50)
                .backgroundColor(0xFF9966)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("barrier2", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row1", HorizontalAlign.Start),
                    )
                ).id("row4")
            }.width(300).height(300)
            .margin(left: 50.vp)
            .border(width: 2.vp, color: Color(0x6699ff))
            .barrier(
                [BarrierStyle("barrier1", BarrierDirection.RIGHT, ["row1", "row2"]),
                BarrierStyle("barrier2", BarrierDirection.BOTTOM, ["row1", "row2"])])
        }.height(100.percent)
    }
}
```

![relativecontainer6](figures/relativecontainer5.jpg)

### Example 6 (Setting Chains)

This example demonstrates the implementation of horizontal [SPREAD chain, SPREAD_INSIDE chain, and PACKED chain](cj-universal-attribute-location.md#enum-chainstyle) from top to bottom using the [chainMode](cj-universal-attribute-location.md#func-chainmodeaxis-chainstyle) interface.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView{
    func build(){
        Row(){
            RelativeContainer(){
                Row(){
                    Text('row1')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0xa3cf62)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("row2", HorizontalAlign.Start),
                        top: VerticalAnchor("__container__", VerticalAlign.Top)
                        )
                    )
                .id("row1")
                .chainMode(Axis.Horizontal, ChainStyle.SPREAD)

                Row(){
                    Text('row2')
                }
                .justifyContent(FFlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x00ae9d)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("row1", HorizontalAlign.End),
                        right: HorizontalAnchor("row3", HorizontalAlign.Start),
                        top: VerticalAnchor("row1", VerticalAlign.Top)
                        )
                    )
                .id("row2")

                Row(){
                    Text('row3')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x0a59f7)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("row2", HorizontalAlign.End),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                        top: VerticalAnchor("row1", VerticalAlign.Top)
                        )
                    )
                .id("row3")

                Row(){
                    Text('row4')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0xa3cf62)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("row5", HorizontalAlign.Start),
                        center: VerticalAnchor("__container__", VerticalAlign.Center)
                        )
                    )
                .id("row4")
                .chainMode(Axis.Horizontal, ChainStyle.SPREAD_INSIDE)

                Row(){
                    Text('row5')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x00ae9d)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("row4", HorizontalAlign.End),
                        right: HorizontalAnchor("row6", HorizontalAlign.Start),
                        top: VerticalAnchor("row4", VerticalAlign.Top)
                        )
                    )
                .id("row5")

                Row(){
                    Text('row6')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x0a59f7)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("row5", HorizontalAlign.End),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                        top: VerticalAnchor("row4", VerticalAlign.Top)
                        )
                    )
                .id("row6")

                Row(){
                    Text('row7')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0xa3cf62)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("row8", HorizontalAlign.Start),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom)
                        )
                    )
                .id("row7")
                .chainMode(Axis.Horizontal, ChainStyle.PACKED)

                Row(){
                    Text('row8')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x00ae9d)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("row7", HorizontalAlign.End),
                        right: HorizontalAnchor("row9", HorizontalAlign.Start),
                        top: VerticalAnchor("row7", VerticalAlign.Top)
                        )
                    )
                .id("row8")

                Row(){
                    Text('row9')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x0a59f7)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("row8", HorizontalAlign.End),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                        top: VerticalAnchor("row7", VerticalAlign.Top)
                        )
                    )
                .id("row9")
            }
            .width(300).height(300)
            .margin(left: 50)
            .border(width: 2, color: 0x6699FF)
        }
        .height(100.percent)
    }
}
```

![relativecontainer7](figures/relativecontainer7.png)

### Example 7 (Setting Offset in Chains)

This example demonstrates the implementation of a horizontal [PACKED chain](cj-universal-attribute-location.md#enum-chainstyle) with offset using the [chainMode](cj-universal-attribute-location.md#func-chainmodeaxis-chainstyle) and [bias](cj-universal-attribute-location.md#class-bias) interfaces.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView{

    func build() {
        Row(){
            RelativeContainer(){
                Row(){
                    Text('row1')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0xa3cf62)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("row2", HorizontalAlign.Start),
                        center: VerticalAnchor("__container__", VerticalAlign.Center),
                        bias: Bias(horizontal: 0.0)
                        )
                    )
                .id("row1")
                .chainMode(Axis.Horizontal, ChainStyle.PACKED)

                Row(){
                    Text('row2')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x00ae9d)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("row1", HorizontalAlign.End),
                        right: HorizontalAnchor("row3", HorizontalAlign.Start),
                        top: VerticalAnchor("row1", VerticalAlign.Top),
                        )
                    )
                .id("row2")

                Row(){
                    Text('row3')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x0a59f7)
                .alignRules(AlignRuleOption(left: HorizontalAnchor("row2", HorizontalAlign.End),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                        top: VerticalAnchor("row1", VerticalAlign.Top),
                        )
                    )
                .id("row3")
            }
            .width(300).height(300)
            .margin(left: 50)
            .border(width: 2, color: 0x6699FF)
        }
        .height(100.percent)
    }
}
```

![relativecontainer8](figures/relativecontainer8.png)### Example 8 (Setting Mirror Mode)

This example demonstrates the usage of [LocalizedAlignRuleOptions](cj-universal-attribute-location.md#class-localizedalignruleoptions) and [LocalizedBarrierDirection](#enmu-localizedbarrierdirection) to set alignment rules when using barriers as anchors in mirror mode (declared with `direction: Direction.Rtl`).

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row().width(100).height(100)
                .backgroundColor(0xff3333)
                .id("row1")

                Row().width(100).height(100)
                .backgroundColor(0xFFCC00)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Bottom),
                        middle: HorizontalAnchor("row1", HorizontalAlign.End)
                    )
                ).id("row2")

                Row().height(100).width(100)
                .backgroundColor(0xFF6633)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Top),
                        left: HorizontalAnchor("barrier1", HorizontalAlign.End)
                    )
                ).id("row3")

                Row().width(50).height(50)
                .backgroundColor(0xFF9966)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("barrier2", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row1", HorizontalAlign.Start),
                    )
                ).id("row4")
            }.width(300).height(300)
            .margin(left: 50.vp)
            .border(width: 2.vp, color: Color(0x6699ff))
            .direction(Direction.Rtl)
            .barrier(
                [LocalizedBarrierStyle("barrier1", LocalizedBarrierDirection.END, ["row1", "row2"]),
                LocalizedBarrierStyle("barrier2", LocalizedBarrierDirection.BOTTOM, ["row1", "row2"])])
        }.height(100.percent)
    }
}

```

![relativecontainer6](figures/relativecontainer6.jpg)