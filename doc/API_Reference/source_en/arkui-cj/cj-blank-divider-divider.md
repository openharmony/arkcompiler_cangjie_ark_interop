# Divider

Provides a divider component to separate different content blocks/elements.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

None

## Creating the Component

### init()

```cangjie
public init()
```

**Function:** Creates a divider component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func color(ResourceColor)

```cangjie
public func color(value: ResourceColor): This
```

**Function:** Sets the color of the divider line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name   | Type                                       | Required | Default | Description     |
|:----- |:---------------------------------------- |:--- |:--- |:------ |
| value | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes   | -   | Color of the divider line. |

### func lineCap(LineCapStyle)

```cangjie
public func lineCap(value: LineCapStyle): This
```

**Function:** Sets the endpoint style of the divider line in the current container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name   | Type                                                                   | Required | Default | Description         |
|:----- |:-------------------------------------------------------------------- |:--- |:--- |:---------- |
| value | [LineCapStyle](./cj-common-types.md#enum-linecapstyle) | Yes   | -   | Endpoint style of the divider line. |

### func strokeWidth(Length)

```cangjie
public func strokeWidth(value: Length): This
```

**Function:** Sets the width of the divider line in the current container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name   | Type       | Required | Default | Description                                                                                                                                       |
|:----- |:-------- |:--- |:--- |:---------------------------------------------------------------------------------------------------------------------------------------- |
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes   | -   | Width of the divider line. When pixel units are not specified, the default unit is vp. Percentage settings are not supported. The width of the divider line does not support percentage settings. Priority is lower than the common attribute [height](./cj-universal-attribute-size.md#func-heightlength). When exceeding the size set by the common attribute, it will be clipped according to the common attribute. Some device hardware may have issues with 1-pixel rounding causing the divider line to not display. It is recommended to use 2 pixels. |

### func vertical(Bool)

```cangjie
public func vertical(value: Bool): This
```

**Function:** Sets the direction of the divider line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name   | Type   | Required | Default | Description        |
|:----- |:---- |:--- |:--- |:--------- |
| value | Bool | Yes   | -   | Direction of the divider line. |

## Example Code

### Example 1 (Horizontal and Vertical Divider Scenarios)

Defines the style of the Divider, such as direction, color, and width.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            // Horizontal divider scenario
            Text("Horizontal divider")
                .fontSize(9)
                .fontColor(0xCCCCCC)
            List() {
                ForEach(
                    [1, 2, 3],
                    {
                        item: Int64, idx: Int64 => ListItem() {
                            Text("list" + item.toString())
                                .width(100.percent)
                                .fontSize(14)
                                .fontColor(0x182431)
                                .textAlign(TextAlign.Start)
                        }
                        .width(244)
                        .height(48)
                    }
                )
            }.padding(left: 24, bottom: 8)

            Divider()
                .strokeWidth(8)
                .color(0xF1F3F5)
            List() {
                ForEach(
                    [4, 5],
                    {
                        item: Int64, idx: Int64 => ListItem() {
                            Text("list" + item.toString())
                                .width(100.percent)
                                .fontSize(14)
                                .fontColor(0x182431)
                                .textAlign(TextAlign.Start)
                        }
                        .width(244)
                        .height(48)
                    }
                )
            }.padding(left: 24, top: 8)

            // Vertical divider scenario
            Text("Vertical divider")
                .fontSize(9)
                .fontColor(0xCCCCCC)
            Column() {
                Column() {
                    Row()
                        .width(288)
                        .height(64)
                        .backgroundColor(0x30C9F0)
                        .opacity(0.3)
                    Row() {
                        Button("Button")
                            .width(136)
                            .height(22)
                            .fontSize(16)
                            .fontColor(0x007DFF)
                            .fontWeight(FontWeight.W500)
                            .backgroundColor(Color.Transparent)
                        Divider()
                            .vertical(true)
                            .height(22)
                            .color(0x182431)
                            .opacity(0.6)
                            .margin(left: 8, right: 8)
                        Button("Button")
                            .width(136)
                            .height(22)
                            .fontSize(16)
                            .fontColor(0x007DFF)
                            .fontWeight(FontWeight.W500)
                            .backgroundColor(Color.Transparent)
                    }.margin(top: 17)
                }
                .width(336)
                .height(152)
                .backgroundColor(0xFFFFFF)
                .borderRadius(24)
                .padding(24)
            }
            .width(100.percent)
            .height(168)
            .backgroundColor(0xF1F3F5)
            .justifyContent(FlexAlign.Center)
            .margin(top: 8)
        }
        .width(100.percent)
        .padding(top: 24)
    }
}
```

![divider1](figures/divider.png)