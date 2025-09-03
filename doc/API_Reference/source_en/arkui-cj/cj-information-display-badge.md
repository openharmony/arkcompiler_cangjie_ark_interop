# Badge

An information marker component that can be attached to individual components as a container for notification alerts.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

Supports a single child component.

> **Note:**
>
> Child component types: System components and custom components, supporting rendering control types ([if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md), [ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md), [LazyForEach](cj-state-rendering-lazyforeach.md)).

## Creating Components

### init(Int32, BadgeStyle, BadgePosition, Int32, () -> Unit)

```cangjie
public init(count!: Int32, style!: BadgeStyle, position!: BadgePosition = BadgePosition.RightTop,
    maxCount!: Int32 = 99, child!: () -> Unit)
```

**Function:** Creates a badge component based on a numeric value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| count | Int32 | Yes | - | **Named parameter.** Sets the number of notification messages. Does not display the badge if the value is ≤ 0. |
| style | [BadgeStyle](#class-badgestyle) | Yes | - | **Named parameter.** Configurable styles for the Badge component, including text color, size, dot color, and size. |
| position | [BadgePosition](#enum-badgeposition) | No | BadgePosition.RightTop | **Named parameter.** Position of the notification dot. |
| maxCount | Int32 | No | 99 | **Named parameter.** Maximum message count. Displays as maxCount+ when exceeded. |
| child | ()->Unit | Yes | - | Child component of the container. |

### init(String, BadgeStyle, BadgePosition, () -> Unit)

```cangjie
public init(value!: String, style!: BadgeStyle, position!: BadgePosition = BadgePosition.RightTop, child!: () -> Unit)
```

**Function:** Creates a badge component based on a string value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | Parameter for the string badge component. |
| style | [BadgeStyle](#class-badgestyle) | Yes | - | **Named parameter.** Configurable styles for the Badge component, including text color, size, dot color, and size. |
| position | [BadgePosition](#enum-badgeposition) | No | BadgePosition.RightTop | **Named parameter.** Position of the notification dot. |
| child | ()->Unit | Yes | - | Child component of the container. |

## Common Attributes/Events

Common Attributes: All supported except text styles.

Common Events: All supported.

## Basic Type Definitions

### class BadgeStyle

```cangjie
public class BadgeStyle {
    public var color: ResourceColor
    public var fontSize: Length
    public var badgeSize: Length
    public var badgeColor: ResourceColor
    public var fontWeight: FontWeight
    public var borderColor: ResourceColor
    public var borderWidth: Length
    public init(color!: ResourceColor = Color.White, fontSize!: Length = 10.fp, badgeSize!: Length = 16.vp,
        badgeColor!: ResourceColor = Color.Red, fontWeight!: FontWeight = FontWeight.Normal,
        borderColor!: ResourceColor = Color.Red, borderWidth!: Length = 1.vp)
}
```

**Function:** Contains style parameters for the Badge component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var badgeColor

```cangjie
public var badgeColor: ResourceColor
```

**Function:** Color of the badge.

**Type:** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var badgeSize

```cangjie
public var badgeSize: Length
```

**Function:** Size of the badge, in vp units.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var borderColor

```cangjie
public var borderColor: ResourceColor
```

**Function:** Border color of the base plate.

**Type:** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var borderWidth

```cangjie
public var borderWidth: Length
```

**Function:** Border width of the base plate.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var color

```cangjie
public var color: ResourceColor
```

**Function:** Text color.

**Type:** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var fontSize

```cangjie
public var fontSize: Length
```

**Function:** Text size, in fp units.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var fontWeight

```cangjie
public var fontWeight: FontWeight
```

**Function:** Sets the font weight of the text.

**Type:** [FontWeight](./cj-common-types.md#enum-fontweight)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(ResourceColor, Length, Length, ResourceColor, FontWeight, ResourceColor, Length)

```cangjie
public init(color!: ResourceColor = Color.White, fontSize!: Length = 10.fp, badgeSize!: Length = 16.vp,
    badgeColor!: ResourceColor = Color.Red, fontWeight!: FontWeight = FontWeight.Normal,
    borderColor!: ResourceColor = Color.Red, borderWidth!: Length = 1.vp)
```

**Function:** Creates a BadgeStyle object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| color | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | No | Color.White | **Named parameter.** Text color. |
| fontSize | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 10.fp | **Named parameter.** Text size.<br>Unit: fp. |
| badgeSize | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 16.vp | **Named parameter.** Size of the badge.<br>Unit: fp. |
| badgeColor | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | No | Color.Red | **Named parameter.** Color of the badge. |
| fontWeight | [FontWeight](./cj-common-types.md#enum-fontweight) | No | FontWeight.Normal | **Named parameter.** Font weight of the text. |
| borderColor | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | No | Color.Red | **Named parameter.** Border color of the base plate. |
| borderWidth | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 1.vp | **Named parameter.** Border width of the base plate.<br>Unit: vp. |

### enum BadgePosition

```cangjie
public enum BadgePosition {
    | RightTop
    | Right
    | Left
}
```

**Function:** Position of the notification dot.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Left

```cangjie
Left
```

**Function:** Displays the dot on the left side, vertically centered.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Right

```cangjie
Right
```

**Function:** Displays the dot on the right side, vertically centered.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RightTop

```cangjie
RightTop
```

**Function:** Displays the dot at the top-right corner.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(BadgePosition)

```cangjie
public operator func !=(other: BadgePosition): Bool
```

**Function:** Checks if two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BadgePosition](<font color="red" face="bold">please add link</font>) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are not equal, otherwise false. |

#### func ==(BadgePosition)

```cangjie
public operator func ==(other: BadgePosition): Bool
```

**Function:** Checks if two BadgePosition values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BadgePosition](<font color="red" face="bold">please add link</font>) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise false. |

## Example Code

### Example 1 (Setting Badge Content)

This example demonstrates different badge effects when passing empty values, strings, or numbers using the `value` and `count` properties.

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
            Text("numberBadge").width(80.percent)
            Row(10) {
                // Numeric superscript, maxCount defaults to 99, displays as 99+ when exceeded
                Badge(
                    BadgeParams(
                        count: 1,
                        style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                            fontWeight: FontWeight.Bolder, borderColor: Color.Black, borderWidth: 2.vp),
                        position: BadgePosition.RightTop,
                        maxCount: 99
                    )
                ) {
                    Button("message").width(100).height(50).backgroundColor(0x317aff)
                }.width(100).height(50)
                Badge(
                    BadgeParams(
                        count: 1,
                        style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                            fontWeight: FontWeight.Bolder, borderColor: Color.Green, borderWidth: 2.vp),
                        position: BadgePosition.Left,
                        maxCount: 99
                    )
                ) {
                    Button("message").width(100).height(50).backgroundColor(0x317aff)
                }.width(100).height(50)
                // Numeric superscript
                Badge(
                    BadgeParams(
                        count: 1,
                        style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                            fontWeight: FontWeight.Regular, borderColor: Color.Gray, borderWidth: 4.vp),
                        position: BadgePosition.Right,
                        maxCount: 99
                    )
                ) {
                    Button("message").width(100).height(50).backgroundColor(0x317aff)
                }.width(100).height(50)
            }.margin(10)
            Text("stringBadge").width(80.percent)
            Row(30) {
                Badge(
                    BadgeParams(
                        value: "new",
                        style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 9, badgeSize: 20, badgeColor: Color.Blue)
                    )
                ) {
                    Text("message")
                        .width(80)
                        .height(50)
                        .fontSize(16)
                        .lineHeight(37)
                        .borderRadius(10)
                        .textAlign(TextAlign.Center)
                        .backgroundColor(0xF3F4ED)
                }.width(80).height(50)
                // Empty value, displays as a dot
                Badge(
                    BadgeParams(
                        value: "",
                        style: BadgeStyle(badgeSize: 6, badgeColor: Color.Blue),
                        position: BadgePosition.Right
                    )
                ) {
                    Text("message")
                        .width(90)
                        .height(50)
                        .fontSize(16)
                        .lineHeight(37)
                        .borderRadius(10)
                        .textAlign(TextAlign.Center)
                        .backgroundColor(0xF3F4ED)
                }.width(90).height(50)
            }.margin(10)
        }
    }
}
```

![badge](./figures/badge.png)### Example 2 (Controlling Badge Visibility with Numeric Values)

This example demonstrates how to toggle the visibility of a badge component by setting its `count` property to 0 or 1.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var badgeCount: Int32 = 1
    func build() {
        Column() {
            Badge(
                BadgeParams(
                    count: this.badgeCount,
                    style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,fontWeight: FontWeight.Bolder, borderColor: Color.Black, borderWidth: 2.vp),
                    position: BadgePosition.RightTop,
                )
            ){
                Text("message")
                    .width(100)
                    .height(50)
                    .backgroundColor(0x317aff)
            }
                .width(100)
                .height(50)
            Button("count 0")
                .onClick({=>  this.badgeCount =0;})
            Button("count 1")
                .onClick({=>  this.badgeCount =1;})
        }.margin(10)
    }
}
```

![badge1](./figures/badge1.gif)