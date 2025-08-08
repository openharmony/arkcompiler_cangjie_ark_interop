# Visibility Control

Controls whether a component is visible.

## func visibility(Visibility)

```cangjie
public func visibility(value: Visibility): This
```

**Function:** Sets the visibility of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Visibility](./cj-common-types.md#enum-visibility) | Yes | - | Controls whether the current component is displayed or hidden. Conditional rendering can be used as an alternative depending on specific scenarios. Initial value: Visibility.Visible. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build(): Unit {
        Column() {
            Column() {
                // Hidden without occupying space
                Text("None").fontSize(9).width(90.percent).fontColor(0xCCCCCC)
                Row().visibility(Visibility.None).width(90.percent).height(80).backgroundColor(0xAFEEEE)

                // Hidden while occupying space
                Text("Hidden").fontSize(9).width(90.percent).fontColor(0xCCCCCC)
                Row().visibility(Visibility.Hidden).width(90.percent).height(80).backgroundColor(0xAFEEEE)

                // Normally visible (default display mode for components)
                Text("Visible").fontSize(9).width(90.percent).fontColor(0xCCCCCC)
                Row().visibility(Visibility.Visible).width(90.percent).height(80).backgroundColor(0xAFEEEE)
            }.width(90.percent).borderWidth(1)
        }.width(100.percent).margin(top: 5)
    }
}
```

![uni_visible](figures/uni_visible.png)