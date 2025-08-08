# Overlay

Sets the overlay text for a component.

## func overlay(String, Alignment, ContentOffset)

```cangjie
public func overlay(
    title!: String,
    align!: Alignment = Alignment.Center,
    offset!: ContentOffset = ContentOffset(x: 0.0, y: 0.0)
): This
```

**Function:** Adds overlay text as a floating layer on top of the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| title | String | Yes | - | **Named parameter.** The content of the overlay text. |
| align | [Alignment](./cj-common-types.md#enum-alignment) | No | Alignment.Center | **Named parameter.** The alignment of the overlay relative to the component. |
| offset | [ContentOffset](#class-contentoffset) | No | ContentOffset(x: 0.0, y: 0.0) | **Named parameter.** The offset of the overlay based on its own top-left corner. The overlay is positioned at the top-left corner of the component by default. |

> **Note:**
>
> When both align and offset are set, their effects will overlap. The overlay will first be positioned relative to the component based on alignment, then offset from the current position's top-left corner.

## Basic Type Definitions

### class ContentOffset

```cangjie
public class ContentOffset {
    public var xOffset: Float64
    public var yOffset: Float64
    public init(x!: Float64, y!: Float64)
    public init(x!: Int64, y!: Int64)
}
```

**Function:** Represents the offset of the overlay based on its own top-left corner.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### var xOffset

```cangjie
public var xOffset: Float64
```

**Function:** The offset of the text along the X-axis based on its own top-left corner, in vp units.

**Type:** Float64

**Read-Write Capability:** Read-Write

**Since:** 12

#### var yOffset

```cangjie
public var yOffset: Float64
```

**Function:** The offset of the text along the Y-axis based on its own top-left corner, in vp units.

**Type:** Float64

**Read-Write Capability:** Read-Write

**Since:** 12

#### init(Float64, Float64)

```cangjie
public init(x!: Float64, y!: Float64)
```

**Function:** Constructs the data structure for overlay offset.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float64 | Yes | - | **Named parameter.** The offset of the text along the X-axis based on its own top-left corner.</br>Unit: vp. |
| y | Float64 | Yes | - | **Named parameter.** The offset of the text along the Y-axis based on its own top-left corner.</br>Unit: vp. |

#### init(Int64, Int64)

```cangjie
public init(x!: Int64, y!: Int64)
```

**Function:** Constructs the data structure for overlay offset.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Int64 | Yes | - | **Named parameter.** The offset of the text along the X-axis based on its own top-left corner.</br>Unit: vp. |
| y | Int64 | Yes | - | **Named parameter.** The offset of the text along the Y-axis based on its own top-left corner.</br>Unit: vp. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    func build() {
        Column(10) {
            Column() {
                Text("floating layer")
                .fontSize(12).fontColor(0xCCCCCC).maxLines(1)
                Column() {
                    // Import image
                    Image(@r(app.media.icon))
                    .width(240).height(240)
                    // Set overlay
                    .overlay(
                        title: "Winter is a beautiful season, especially when it snows.",
                        align: Alignment.Bottom,
                        offset: ContentOffset(x: 0.0, y: -15.0)
                    )
                }.border(color: Color.BLACK, width: 2.px)
            }.width(100.percent)
        }
    }
}
```

![uni_overlay](figures/uni_overlay.png)