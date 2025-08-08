# Component-Level Pixel Rounding

The goal of component-level pixel rounding is to implement pixel rounding functionality as a component attribute, thereby enabling or disabling system-level pixel rounding at the component level.

## func pixelRound(PixelRoundPolicy)

```cangjie
public func pixelRound(value: PixelRoundPolicy): This
```

**Function:** Specifies the pixel rounding alignment method for the current component in specified directions. When a direction is not set, the default behavior is to perform rounding in that direction. During normal calculations, the top and bottom directions correspond to the component height, while the left and right directions (the mirrored starting direction is referred to as left) correspond to the width. For convenience, these two sets of directions are referred to as top-left and bottom-right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [PixelRoundPolicy](#class-pixelroundpolicy) | Yes | \- | Specifies the boundary rounding strategy for the current component.</br>**Note:** </br>This attribute is used for scenarios where floating-point drawing causes visual anomalies. The rounding result depends not only on the component's width and height but also on its position. Even if components have the same width and height, their final dimensions after rounding may differ due to floating-point descriptions of their positions. |

> **Note:**
>
> - Calculate the top-left corner coordinates of the current component: the offset relative to the parent container.
> - Calculate the bottom-right corner coordinates of the current component: the offset relative to the parent container + the component's own dimensions.
> - Recalculate the current component's dimensions: rounded bottom-right corner coordinates - rounded top-left corner coordinates.

## Basic Type Definitions

### class PixelRoundPolicy

```cangjie
public class PixelRoundPolicy {
    public PixelRoundPolicy (
        public let start!: ?PixelRoundCalcPolicy = None,
        public let top!: ?PixelRoundCalcPolicy = None,
        public let end!: ?PixelRoundCalcPolicy = None,
        public let bottom!: ?PixelRoundCalcPolicy = None
    )
}
```

**Function:** Specifies the directions for component-level pixel rounding.

**Initial Version:** 19

#### let start

```cangjie
public let start: ?PixelRoundCalcPolicy = None
```

**Function:** The rounding alignment method for the front boundary of the component.

**Type:** ?[PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy)

**Read/Write Capability:** Readable

**Initial Version:** 19

#### let top

```cangjie
public let top: ?PixelRoundCalcPolicy = None
```

**Function:** The rounding alignment method for the top boundary of the component.

**Type:** ?[PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy)

**Read/Write Capability:** Readable

**Initial Version:** 19

#### let end

```cangjie
public let top: ?PixelRoundCalcPolicy = None
```

**Function:** The rounding alignment method for the end boundary of the component.

**Type:** ?[PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy)

**Read/Write Capability:** Readable

**Initial Version:** 19

#### let bottom

```cangjie
public let top: ?PixelRoundCalcPolicy = None
```

**Function:** The rounding alignment method for the bottom boundary of the component.

**Type:** ?[PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy)

**Read/Write Capability:** Readable

**Initial Version:** 19

### PixelRoundPolicy(PixelRoundCalcPolicy, PixelRoundCalcPolicy, PixelRoundCalcPolicy, PixelRoundCalcPolicy)

**Function:** Constructs a PixelRoundPolicy object.

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| start | [PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy) | No | None | The rounding alignment method for the front boundary of the component. |
| top | [PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy) | No | None | The rounding alignment method for the top boundary of the component. |
| end | [PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy) | No | None | The rounding alignment method for the end boundary of the component. |
| bottom | [PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy) | No | None | The rounding alignment method for the bottom boundary of the component. |

## Example Code

When a 1-px gap appears in the parent component, `pixelRound` should be used to guide layout adjustments.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var curWidth: Float64 = 301.2

    func build() {
        Column() {
            Button(){
                Text("${this.curWidth}")
            }
            .onClick({ =>
                this.curWidth += 0.1
            })
            .height(200)
            .width(200)
            .backgroundColor(0xFFD5D5D5)

            Blank().height(20)

            Row() {
                Row() {
                }
                .width(100.percent)
                .height(100.percent)
                .backgroundColor(0xFFBF00)
                .pixelRound(PixelRoundPolicy(
                    start : PixelRoundCalcPolicy.NO_FORCE_ROUND,
                    end : PixelRoundCalcPolicy.NO_FORCE_ROUND
                ))
            }
            .width(this.curWidth.px)
            .height(300.6.px)
            .backgroundColor(0xff0000)
            .pixelRound(PixelRoundPolicy(
                start: PixelRoundCalcPolicy.NO_FORCE_ROUND,
                end: PixelRoundCalcPolicy.NO_FORCE_ROUND
            ))
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xffe5e5e5)
    }
}
```

> **Note:**
>
> In this example, when pixel rounding is disabled (i.e., the `pixelRound` attribute is not set on parent or child components), the initial state appears normal. Users can click the button to increase the parent component's width. In the current example, the parent component's width is 301.2px, allowing testing of performance differences at varying widths. During testing, it will be observed that when the parent component reaches a specific width, a 1-px gap appears on the right. Similarly, after adjusting the example code, tests can be conducted for the top and bottom directions to observe similar phenomena.

**Figure 1** Layout Effect Using `pixelRound`

![uni_pixelRound](figures/pixelround1.png)

**Figure 2** Layout Effect Without `pixelRound`

![uni_pixelRound](figures/pixelround2.png)