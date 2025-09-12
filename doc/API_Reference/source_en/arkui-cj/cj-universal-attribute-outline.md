# Outline Settings

Configure the outline style of components. The outline is drawn outside the component, does not affect layout, and does not occupy the component's own size.

![outlineTest](figures/outlineTest.PNG)

## func outline(Length, ResourceColor, Length, OutlineStyle)

```cangjie
public func outline(
    width!: Length,
    color!: ResourceColor = Color.BLACK,
    radius!: Length = 0.vp,
    style!: OutlineStyle = OutlineStyle.SOLID
): This
```

**Function:** Sets the outline style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| width | [Length](cj-common-types.md#interface-length) | Yes |\- | **Named parameter.** Outline width, percentage not supported.<br>**Note:** width is mandatory, otherwise the outline will not be displayed.|
| color | [ResourceColor](cj-common-types.md#interface-resourcecolor) | No  | Color.BLACK | **Named parameter.** Outline color.|
| radius | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Outline corner radius, percentage not supported.<br>**Note:** Maximum effective value: component width/2 + outlineWidth or component height/2 + outlineWidth.|
| style | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | No | OutlineStyle.SOLID | **Named parameter.** Outline style.|

## func outlineColor(ResourceColor)

```cangjie
public func outlineColor(value: ResourceColor): This
```

**Function:** Sets the outline color of an element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| value | [ResourceColor](cj-common-types.md#interface-resourcecolor) | Yes | \- | Outline color of the element.<br> Initial value: Color.BLACK |

## func outlineColor(ResourceColor, ResourceColor, ResourceColor, ResourceColor)

```cangjie
public func outlineColor(
    top!: ResourceColor = Color.BLACK, right!: ResourceColor = Color.BLACK, bottom!: ResourceColor = Color.BLACK, left!: ResourceColor = Color.BLACK): This
```

**Function:** Sets the outline color of an element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| top | [ResourceColor](cj-common-types.md#interface-resourcecolor) | No | Color.BLACK | **Named parameter.** Top outline color.|
| right | [ResourceColor](cj-common-types.md#interface-resourcecolor) | No | Color.BLACK | **Named parameter.** Right outline color.|
| bottom | [ResourceColor](cj-common-types.md#interface-resourcecolor) | No | Color.BLACK | **Named parameter.** Bottom outline color. |
| left | [ResourceColor](cj-common-types.md#interface-resourcecolor) | No | Color.BLACK | **Named parameter.** Left outline color.|

## func outlineRadius(Length)

```cangjie
public open func outlineRadius(value: Length): This
```

**Function:** Sets the outline corner radius of an element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| value | [Length](cj-common-types.md#interface-length) | Yes | \- |Outline corner radius of the element, percentage not supported. <br> Initial value: 0. <br> Maximum effective value: component width/2 + outlineWidth or component height/2 + outlineWidth.|

## func outlineRadius(Length, Length, Length, Length)

```cangjie
public func outlineRadius(
    topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp, bottomRight!: Length = 0.vp): This
```

**Function:** Sets the outline corner radius of an element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| topLeft | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top-left corner radius.|
| topRight | [Length](cj-common-types.md#interface-length) | No  | 0.vp | **Named parameter.** Top-right corner radius.|
| bottomLeft | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom-left corner radius.|
| bottomRight | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom-right corner radius.|

## func outlineStyle(OutlineStyle)

```cangjie
public open func outlineStyle(value: OutlineStyle): This
```

**Function:** Sets the outline style of an element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| value | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | Yes | \- | Outline style of the element.<br>Initial value: OutlineStyle.SOLID|

## func outlineStyle(OutlineStyle, OutlineStyle, OutlineStyle, OutlineStyle)

```cangjie
public func outlineStyle(
    top!: OutlineStyle = OutlineStyle.SOLID, right!: OutlineStyle = OutlineStyle.SOLID, bottom!: OutlineStyle = OutlineStyle.SOLID, left!: OutlineStyle = OutlineStyle.SOLID): This
```

**Function:** Sets the outline style of an element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| top | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | No | OutlineStyle.SOLID | **Named parameter.** Top outline style.|
| right | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | No | OutlineStyle.SOLID | **Named parameter.** Right outline style.|
| bottom | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | No | OutlineStyle.SOLID | **Named parameter.** Bottom outline style.|
| left | [OutlineStyle](cj-common-types.md#enum-outlinestyle) | No | OutlineStyle.SOLID | **Named parameter.** Left outline style.|

## func outlineWidth(Length)

```cangjie
public open func outlineWidth(value: Length): This
```

**Function:** Sets the outline width of an element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| value | [Length](cj-common-types.md#interface-length) | Yes | \- | Outline width of the element. Initial value: 0.<br> **Note:** Percentage not supported.<br> The width parameter is mandatory for outline effects.|

## func outlineWidth(Length, Length, Length, Length)

```cangjie
public func outlineWidth(
    top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**Function:** Sets the outline width.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| top | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top outline width.|
| right | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Right outline width.|
| bottom | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom outline width.|
| left | [Length](cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Left outline width.|

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    public func build() {
        Column() {
            Row(space: 30) {
                // Dashed line
                Text('DASHED')
                    .backgroundColor(0xFEC0CD)
                    .outlineStyle(OutlineStyle.DASHED)
                    .outlineWidth(5.vp)
                    .outlineColor(Color.BLUE)
                    .outlineRadius(10.vp)
                    .width(120.vp)
                    .height(120.vp)
                    .textAlign(TextAlign.CENTER)
                    .fontSize(16)
                // Dotted line
                Text('DOTTED')
                    .backgroundColor(0xFEC0CD)
                    .outline(width: 5.vp, color: Color.GREEN, radius: 10.vp, style: OutlineStyle.DOTTED)
                    .width(120.vp)
                    .height(120.vp)
                    .textAlign(TextAlign.CENTER)
                    .fontSize(16)
            }
                .width(300.vp)
                .height(150)

            Text('.outlineWidth/outlineColor/outlineRadius/outlineStyle')
                .backgroundColor(0xFEC0CD)
                .fontSize(20.vp)
                .width(300.vp)
                .height(300.vp)
                .textAlign(TextAlign.CENTER)
                .outlineWidth(left: 3, right: 6, top: 10, bottom: 15)
                .outlineColor(left: Color.ORANGE, right: Color.BLUE, top: Color.RED, bottom: Color.GREEN)
                .outlineRadius(topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80)
                .outlineStyle(
                    left: OutlineStyle.DOTTED,
                    right: OutlineStyle.DOTTED,
                    top: OutlineStyle.SOLID,
                    bottom: OutlineStyle.DASHED
                )
        }
            .height(700.vp)
            .width(380.vp)
            .borderWidth(1.vp)
    }
}
```

![uni_border](figures/uni_outline.png)