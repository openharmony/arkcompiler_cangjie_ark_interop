# Click Bounce Effect

Set the bounce effect when a component is clicked.

## func clickEffect(ClickEffectLevel, Option\<Float32>)

```cangjie
public func clickEffect(level!: ClickEffectLevel = ClickEffectLevel.LIGHT, scale!: Option<Float32> = Option.None): This
```

**Function:** Sets the click bounce effect for the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| level | [ClickEffectLevel](./cj-common-types.md#enum-clickeffectlevel) | No | ClickEffectLevel.LIGHT | **Named parameter.** The click bounce effect level for the current component. |
| scale | Option\<Float32> | No | Option.None | **Named parameter.** The bounce scaling ratio, allowing fine-tuning of the bounce effect based on the ClickEffectLevel setting.<br>**Note:**<br>When level equals ClickEffectLevel.LIGHT, the initial value is 0.90.<br>When level equals ClickEffectLevel.MIDDLE or ClickEffectLevel.HEAVY, the initial value is 0.95. |

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
    @State
    var toggle: Bool = true
    func build() {
        Column {
            Radio(value: '20', group: '数字', indicatorType: RadioIndicatorType.TICK)
                .clickEffect(level: ClickEffectLevel.LIGHT)
                .height(50)
                .width(50)

            Radio(value: '10', group: '数字', indicatorType: RadioIndicatorType.TICK)
                .clickEffect(level: ClickEffectLevel.LIGHT, scale: 0.5)
                .height(50)
                .width(50)
        }
        .width(100.percent)
        .padding(24.vp)
    }
}
```

![uni_click](figures/uni-click.jpg)