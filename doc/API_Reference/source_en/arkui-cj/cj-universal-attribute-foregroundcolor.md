# Foreground Color Setting

Sets the foreground color of a component.

## func foregroundColor(ColoringStrategy)

```cangjie
public open func foregroundColor(value: ColoringStrategy): This
```

**Function:** Sets the foreground color of a component. When no foreground color is set, it inherits from the parent component by default.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ColoringStrategy](./cj-common-types.md#enum-coloringstrategy) | Yes | - | The foreground color of the component or setting the foreground color based on intelligent color picking strategy. Property animation is not supported. |

## func foregroundColor(ResourceColor)

```cangjie
public open func foregroundColor(color: ResourceColor): This
```

**Function:** Sets the foreground color of a component. When no foreground color is set, it inherits from the parent component by default.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | The foreground color of the component or setting the foreground color based on intelligent color picking strategy. Property animation is not supported. |

## Example Code

### Example 1 (Setting Foreground Color)

This example demonstrates how to set the foreground color using foregroundColor.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(100) {
            Button("GREEN")
                .width(50.percent)
                .height(80)
                .fontSize(20)
                .foregroundColor(Color.GREEN)
            Button("RED")
                .width(50.percent)
                .height(80)
                .fontSize(20)
                .foregroundColor(Color.RED)
            }
            .width(100.percent)
        }
}
```

![foregroundColor1](figures/foregroundColor1.png)

### Example 2 (Setting Foreground Color as Inverted Background Color)

This example sets the foreground color as the inverted background color using INVERT.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(100) {
            Button("NO INVERT")
                .width(100.percent)
                .height(80)
                .fontSize(20)
                .backgroundColor(Color.BLUE)
            Button("INVERT")
                .width(100.percent)
                .height(80)
                .fontSize(20)
                .backgroundColor(Color.BLUE)
                .foregroundColor(INVERT)
            }
            .width(100.percent)
        }
}
```

![foregroundColor2](figures/foregroundColor2.png)

### Example 3 (Foreground Color Not Inherited from Parent Component)

This example demonstrates the effect comparison between setting both foreground and background colors versus setting only the background color.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(100) {
            Button("Set foreground color to blue")
                .width(100.percent)
                .height(80)
                .fontSize(20)
                .backgroundColor(Color.GRAY)
                .foregroundColor(Color.BLUE)

            Button("Foreground color not set, inherited from parent")
                .width(100.percent)
                .height(80).fontSize(20)
                .backgroundColor(Color.GRAY)
            }
            .width(100.percent)
        }
}
```

![foregroundColor3](figures/foregroundColor3.png)