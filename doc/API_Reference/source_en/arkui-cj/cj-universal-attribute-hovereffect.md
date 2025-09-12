# Hover Effect

Set the hover state display effect for components.

## func hoverEffect(HoverEffect)

```cangjie
public open func hoverEffect(value: HoverEffect)
```

**Function:** Sets the hover state display effect for components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter Name | Parameter Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [HoverEffect](./cj-common-types.md#enum-hovereffect) | Yes | - | The hover effect when the current component is in hover state.<br/>Initial value: HoverEffect.Auto. |

## Example Code

This example demonstrates setting the hover state display effect for components using hoverEffect.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.hilog.Hilog

@Entry
@Component
class EntryView {
    @State var isHoverVal: Bool = false
    func build() {
        Column(space: 5) {
            Column(space: 5) {
                Text('Scale')
                    .fontSize(20)
                    .fontColor(Color.GRAY)
                    .width(90.percent)
                    .position(x: 0, y: 80)
                Column()
                    .width(80.percent)
                    .height(200)
                    .backgroundColor(Color.GRAY)
                    .position(x: 40, y: 120)
                    .hoverEffect(HoverEffect.Auto)
                    .onHover({
                        isHover: Bool =>
                        Hilog.info(0, "test", 'Scale isHover: ' + isHover.toString())
                        this.isHoverVal = isHover
                    })
                Text('Board')
                    .fontSize(20)
                    .fontColor(Color.GRAY)
                    .width(90.percent)
                    .position(x: 0, y: 350)
                Column()
                    .width(80.percent)
                    .height(200)
                    .backgroundColor(Color.YELLOW)
                    .position(x: 40, y: 420)
                    .hoverEffect(HoverEffect.Highlight)
                    .onHover({
                        isHover: Bool =>
                        Hilog.info(0, "test", 'Highlight  isHover: ' + isHover.toString())
                        this.isHoverVal = isHover
                    })
            }
            .hoverEffect(HoverEffect.None)
            .width(100.percent)
            .height(100.percent)
            .border(width: 1.vp)
            .onHover({
                isHover: Bool =>
                Hilog.info(0, "test", 'HoverEffect.None')
                this.isHoverVal = isHover
            })
        }
    }
}
```

![focus_control](figures/hovereffect.png)