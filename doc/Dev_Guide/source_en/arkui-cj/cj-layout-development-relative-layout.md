# RelativeContainer

## Overview

During application development, designing complex interfaces often involves nesting multiple components of the same or different types. Excessive nesting depth or an excessive number of nested components can introduce additional overhead. Optimizing the layout approach can effectively enhance performance and reduce time costs.

The RelativeContainer is a container that employs relative layout, supporting the setting of relative positional relationships among its child elements. It is suitable for complex interface scenarios, facilitating the alignment and arrangement of multiple child components. Child elements can specify sibling elements or the parent container as anchor points for relative positioning. Figure 1 illustrates a conceptual diagram of the RelativeContainer, where dashed lines indicate positional dependencies.

**Figure 1** Relative Layout Schematic

![relative-layout](figures/relative-layout.png)

Child elements do not strictly adhere to the dependency relationships shown in the diagram. For example, Item4 can depend on Item2 as an anchor point or on the RelativeContainer parent container as an anchor point.

## Basic Concepts

- **Reference Boundary**: Specifies which boundary of the current component aligns with the anchor point.
  
- **Anchor Point**: Determines the position of the current element relative to another element.
  
- **Alignment Method**: Specifies whether the current element aligns with the anchor point's top, center, or bottom (vertical) or left, center, or right (horizontal).

## Setting Dependency Relationships

### Setting Reference Boundaries

Specifies which boundary of the current component aligns with the anchor point. The reference boundaries of child components within the container are distinguished by horizontal and vertical directions.

- **Horizontal Direction**: The component boundary can align with the anchor point based on the start (left), middle (center), or end (right). When all three boundaries are set, only the start (left) and middle (center) boundaries take effect.

    ![relative-layout2](./figures/relative-layout2.png)

- **Vertical Direction**: The component boundary can align with the anchor point based on the top, center, or bottom. When all three boundaries are set, only the top and center boundaries take effect.

    ![relative-layout3](./figures/relative-layout3.png)

### Setting Anchor Points

Anchor points define the positional dependencies of child elements relative to their parent or sibling elements. Specifically, child elements can anchor their positions to the RelativeContainer, guidelines, barriers, or other child elements.

To precisely define anchor points, child elements of the RelativeContainer must have unique component identifiers (id) to specify anchor information. The parent RelativeContainer's identifier defaults to `__container__`, while other child elements' identifiers are set via the [id](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-componentid.md) attribute.

> **Note:**
> - Components without an `id` can still be displayed but cannot be referenced as anchor points by other components. The RelativeContainer will assign an identifier, but the pattern of these identifiers is not exposed to the application. Guidelines and barriers must ensure unique `id`s to avoid conflicts with any components. In case of duplicates, the priority order is: component > guideline > barrier.
> - Avoid creating dependency loops (except for chain dependencies) when setting anchor points between components, as loops will prevent child components from being positioned correctly and ultimately fail to render.

- **Parent RelativeContainer as Anchor Point**: `__container__` represents the container's component identifier.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            RelativeContainer() {
                Row() {
                    Text('row1')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .height(100)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start)
                    )
                )
                .id("row1")

                Row() {
                    Text('row2')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .height(100)
                .backgroundColor(0x00ae9d)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End)
                    )
                )
                .id("row2")
            }
            .width(300)
            .height(300)
            .margin(left: 20)
            .border(width: 2, color: 0x6699FF)
        }
    }
    ```

    ![RelativeContainer](figures/RelativeContainer1.png)

- **Sibling Element as Anchor Point**:

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            RelativeContainer() {
                Row() {
                    Text('row1')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .height(100)
                .backgroundColor(0x00ae9d)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start)
                    )
                )
                .id("row1")

                Row() {
                    Text('row2')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .height(100)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row1", HorizontalAlign.Start)
                    )
                )
                .id("row2")
            }
            .width(300)
            .height(300)
            .margin(left: 20)
            .border(width: 2, color: 0x6699FF)
        }
    }
    ```

    ![RelativeContainer2](figures/RelativeContainer2.png)

- **Child Component Anchor Points Can Be Arbitrarily Selected**, but ensure no mutual dependencies.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Row() {
                RelativeContainer() {
                    Row() {Text('row1')}
                    .justifyContent(FlexAlign.Center)
                    .width(100)
                    .height(100)
                    .backgroundColor(0xa3cf62)
                    .alignRules(
                        AlignRuleOption(
                            top: VerticalAnchor("__container__", VerticalAlign.Top),
                            left: HorizontalAnchor("__container__",HorizontalAlign.Start)
                        )
                    )
                    .id("row1")
                    Row() {Text('row2')}
                    .justifyContent(FlexAlign.Center)
                    .width(100)
                    .backgroundColor(0x00ae9d)
                    .alignRules(
                        AlignRuleOption(
                            top: VerticalAnchor("__container__", VerticalAlign.Top),
                            right: HorizontalAnchor("__container__",HorizontalAlign.End),
                            bottom: VerticalAnchor("row1", VerticalAlign.Center),
                        )
                    )
                    .id("row2")
                    Row() {Text('row3')}
                    .justifyContent(FlexAlign.Center)
                    .height(100)
                    .backgroundColor(0x0a59f7)
                    .alignRules(
                        AlignRuleOption(
                            top: VerticalAnchor("row1", VerticalAlign.Bottom),
                            left: HorizontalAnchor("row1", HorizontalAlign.Start),
                            right: HorizontalAnchor("row2", HorizontalAlign.Start)
                        )
                    )
                    .id("row3")
                    Row() {Text('row4')}
                    .justifyContent(FlexAlign.Center)
                    .backgroundColor(0x2ca9e0)
                    .alignRules(
                        AlignRuleOption(
                            top: VerticalAnchor("row3", VerticalAlign.Bottom),
                            left: HorizontalAnchor("row1", HorizontalAlign.Center),
                            right: HorizontalAnchor("row2", HorizontalAlign.End)
                        )
                    )
                    .id("row4")
                }
                .width(300)
                .height(300)
                .margin(left: 50)
                .border(width: 2, color: 0x6699FF)
            }.height(100.percent)
        }
    }
    ```

    ![Simplify-Component-Layout](figures/simplify-component-layout-image1.png)

### Setting Alignment Relative to Anchor Points

After setting the anchor point, use the [alignRules](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#func-alignrulesalignruleoption) attribute to specify the alignment relative to the anchor point.

- **Horizontal Alignment**: Options include `HorizontalAlign.Start`, `HorizontalAlign.Center`, and `HorizontalAlign.End`.

![alignment-relative-anchor-horizontal](figures/alignment-relative-anchor-horizontal.png)

- **Vertical Alignment**: Options include `VerticalAlign.Top`, `VerticalAlign.Center`, and `VerticalAlign.Bottom`.

![alignment-relative-anchor-vertical](figures/alignment-relative-anchor-vertical.png)

### Child Component Position Offset

After relative alignment, the position of a child component may still not meet the target requirements. Developers can apply additional offsets using the `offset` property. When a component adjusted by `offset` is used as an anchor point, the alignment position is based on its pre-offset position. It is recommended to use [bias](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#class-bias) for additional offsets.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row() {
                    Text('row1')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .height(100)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start)
                    )
                )
                .id("row1")

                Row() {
                    Text('row2')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .backgroundColor(0x00ae9d)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        right: HorizontalAnchor("__container__",HorizontalAlign.End),
                        bottom: VerticalAnchor("row1", VerticalAlign.Center)
                    )
                )
                .offset(x: -40, y: -20)
                .id("row2")

                Row() {
                    Text('row3')
                }
                .justifyContent(FlexAlign.Center)
                .height(100)
                .backgroundColor(0x0a59f7)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row1", HorizontalAlign.End),
                        right: HorizontalAnchor("row2", HorizontalAlign.Start)
                    )
                )
                .offset(x: -10, y: -20)
                .id("row3")

                Row() {
                    Text('row4')
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(0x2ca9e0)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start),
                        right: HorizontalAnchor("row1", HorizontalAlign.End)
                    )
                )
                .offset(x: -10, y: -30)
                .id("row4")
                Row() {
                    Text('row5')
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(0x30c9f7)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row2", HorizontalAlign.Start),
                        right: HorizontalAnchor("row2", HorizontalAlign.End)
                    )
                )
                .offset(x: 10, y: 20)
                .id("row5")
                Row() {
                    Text('row6')
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(0xff33ffb5)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        bottom: VerticalAnchor("row4", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row3", HorizontalAlign.Start),
                        right: HorizontalAnchor("row3", HorizontalAlign.End)
                    )
                )
                .offset(x: -15, y: 10)
                .backgroundImagePosition(Alignment.Bottom)
                .backgroundImageSize(ImageSize.Cover)
                .id("row6")
            }
            .width(300)
            .height(300)
            .margin(left: 50)
            .border(width: 2, color: 0x6699FF)
        }.height(100.percent)
    }
}
```

![Simplify-Component-Layout](figures/simplify-component-layout-image2.png)

## Alignment Layout for Multiple Components

Row, Column, Flex, Stack, and other layout components can be aligned and arranged according to the rules of the RelativeContainer component.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row()
                .width(100)
                .height(100)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start)
                    )
                )
                .id("row1")
                Column()
                .width(50.percent)
                .height(30)
                .backgroundColor(0x00ae9d)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Center)
                    )
                )
                .id("row2")

                Flex(FlexParams(direction: FlexDirection.Row)) {
                    Text('1')
                        .width(20.percent)
                        .height(50)
                        .backgroundColor(0x0a59f7)
                    Text('2')
                        .width(20.percent)
                        .height(50)
                        .backgroundColor(0x2ca9e0)
                    Text('3')
                        .width(20.percent)
                        .height(50)
                        .backgroundColor(0x0a59f7)
                    Text('4')
                        .width(20.percent)
                        .height(50)
                        .backgroundColor(0x2ca9e0)
                }
                .padding(10)
                .backgroundColor(0x30c9f7)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row2", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Center),
                        right: HorizontalAnchor("row2", HorizontalAlign.Center)
                    )
                )
                .id("row3")

                Stack(Alignment.Bottom) {
                    Text('First child, show in bottom')
                        .width(90.percent)
                        .height(100.percent)
                        .backgroundColor(0xa3cf62)
                        .align(Alignment.Top)
                    Text('Second child, show in top')
                        .width(70.percent)
                        .height(60.percent)
                        .backgroundColor(0x00ae9d)
                        .align(Alignment.Top)
                }
                .margin(top: 5)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        right: HorizontalAnchor("row3", HorizontalAlign.End)
                    )
                )
                .id("row4")
            }
            .width(300)
            .height(300)
            .margin(left: 50)
            .border(width: 2, color: 0x6699FF)
        }.height(100.percent)
    }
}
```

![Simplify-Component-Layout](figures/simplify-component-layout-image3.png)

## Component Dimensions

When both frontend-defined component dimensions and relative layout rules exist, the component's rendering dimensions are determined by constraint rules. The component's self-defined dimensions take precedence over the alignment anchor dimensions in relative layout rules. Therefore, to ensure strict alignment with anchors, use only `alignRules` and avoid using [size settings](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-size.md).

> **Note:**
>
> - If the component size cannot be determined based on constraints and its own `size` property, the component will not be rendered.
> - If two or more anchors are set in the same direction with incorrect positional order, the component will be treated as having a size of 0 and will not be rendered.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row() {
                    Text('row1')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .height(100)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start)
                    )
                )
                .id("row1")

                Row() {
                    Text('row2')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .backgroundColor(0x00ae9d)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        right: HorizontalAnchor("__container__",HorizontalAlign.End),
                        bottom: VerticalAnchor("row1", VerticalAlign.Center)
                    )
                )
                .id("row2")

                Row() {
                    Text('row3')
                }
                .justifyContent(FlexAlign.Center)
                .height(100)
                .backgroundColor(0x0a59f7)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row1", HorizontalAlign.End),
                        right: HorizontalAnchor("row2", HorizontalAlign.Start),
                    )
                )
                .id("row3")

                Row() {
                    Text('row4')
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(0x2ca9e0)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start),
                        right: HorizontalAnchor("row1", HorizontalAlign.End)
                    )
                )
                .id("row4")

                Row() {
                    Text('row5')
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(0x30c9f7)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row2", HorizontalAlign.Start),
                        right: HorizontalAnchor("row2", HorizontalAlign.End)
                    )
                )
                .id("row5")

                Row() {
                    Text('row6')
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(0xff33ffb5)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row3", VerticalAlign.Bottom),
                        bottom: VerticalAnchor("row4", VerticalAlign.Bottom),
                        left: HorizontalAnchor("row3", HorizontalAlign.Start),
                        right: HorizontalAnchor("row3", HorizontalAlign.End)
                    )
                )
                .id("row6")
                .backgroundImagePosition(Alignment.Bottom)
                .backgroundImageSize(ImageSize.Cover)
            }
            .width(300)
            .height(300)
            .margin(left: 50)
            .border(width: 2, color: 0x6699FF)
        }.height(100.percent)
    }
}
```

![Simplify-Component-Layout](figures/simplify-component-layout-image4.png)

## Forming Chains with Multiple Components

Chain formation relies on inter-component relationships. Taking the simplest horizontal chain between components A and B as an example, the dependency is: Anchor 1 <-- Component A <--> Component B --> Anchor 2. This means A has a left anchor, B has a right anchor, A's right anchor aligns with B's `HorizontalAlign.Start`, and B's left anchor aligns with A's `HorizontalAlign.End`.

- The chain's direction and style are declared in the chain head component's [chainMode](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#func-chainmodeaxis-chainstyle) interface. The `bias` property of chain elements becomes invalid, while the chain head's `bias` property applies to the entire chain. The chain head is the first component in the chain (leftmost in horizontal direction, rightmost in RTL languages; topmost in vertical direction).- If the combined size of all elements in the chain exceeds the anchor constraints of the chain, the excess portion will be evenly distributed to both sides of the chain. In a [Packed](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#packed) chain, the distribution of the excess portion can be configured via [bias](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#class-bias).

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            RelativeContainer() {
                Row() {
                    Text('row1')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start),
                        right: HorizontalAnchor("row2", HorizontalAlign.Start)
                    )
                )
                .id("row1")
                .chainMode(Axis.Horizontal, ChainStyle.SPREAD)

                Row() {
                    Text('row2')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x00ae9d)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Top),
                        right: HorizontalAnchor("row3",HorizontalAlign.Start),
                        left: HorizontalAnchor("row1",HorizontalAlign.End)
                    )
                )
                .id("row2")

                Row() {
                    Text('row3')
                }
                .justifyContent(FlexAlign.Center)
                .height(80)
                .width(80)
                .backgroundColor(0x0a59f7)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row1", VerticalAlign.Top),
                        left: HorizontalAnchor("row2", HorizontalAlign.End),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                    )
                )
                .id("row3")

                Row() {
                    Text('row4')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOption(
                        center: VerticalAnchor("__container__", VerticalAlign.Center),
                        left: HorizontalAnchor("__container__",HorizontalAlign.Start),
                        right: HorizontalAnchor("row5", HorizontalAlign.Start)
                    )
                )
                .id("row4")
                .chainMode(Axis.Horizontal, ChainStyle.SPREAD_INSIDE)

                Row() {
                    Text('row5')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x00ae9d)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row4", VerticalAlign.Top),
                        left: HorizontalAnchor("row4", HorizontalAlign.End),
                        right: HorizontalAnchor("row6", HorizontalAlign.Start)
                    )
                )
                .id("row5")

                Row() {
                    Text('row6')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x0a59f7)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row4", VerticalAlign.Top),
                        left: HorizontalAnchor("row5", HorizontalAlign.End),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End)
                    )
                )
                .id("row6")

                Row() {
                    Text('row7')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOption(
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("row8", HorizontalAlign.Start)
                    )
                )
                .id("row7")
                .chainMode(Axis.Horizontal, ChainStyle.PACKED)

                Row() {
                    Text('row8')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x00ae9d)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row7", VerticalAlign.Top),
                        left: HorizontalAnchor("row7", HorizontalAlign.End),
                        right: HorizontalAnchor("row9", HorizontalAlign.Start)
                    )
                )
                .id("row8")

                Row() {
                    Text('row9')
                }
                .justifyContent(FlexAlign.Center)
                .width(80)
                .height(80)
                .backgroundColor(0x0a59f7)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("row7", VerticalAlign.Top),
                        left: HorizontalAnchor("row8", HorizontalAlign.End),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End)
                    )
                )
                .id("row9")
            }
            .width(300)
            .height(300)
            .margin(left: 50)
            .border(width: 2, color: 0x6699FF)
        }.height(100.percent)
    }
}
```

![Simplyfy-Component-Layout](./figures/simplify-component-layout-image5.png)