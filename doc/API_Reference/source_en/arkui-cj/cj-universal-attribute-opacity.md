# Opacity Setting

Sets the opacity of a component.

## func opacity(Float64)

```cangjie
public func opacity(opacityValue: Float64): This
```

**Function:** Sets the opacity of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| opacityValue | Float64 | Yes | - | The opacity of the element, ranging from 0 to 1. 1 means fully opaque, 0 means completely transparent (hides the component while still occupying space in the layout). <br> Initial value: 1.0. <br> **Note:** <br> Child components inherit the parent component's opacity and combine it with their own opacity property. For example: if parent opacity is 0.1 and child sets opacity to 0.8, the actual child opacity will be 0.1*0.8=0.08. |

## func opacity(Int64)

```cangjie
public func opacity(opacityValue: Int64): This
```

**Function:** Sets the opacity of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| opacityValue | Int64 | Yes | - | The opacity of the element, valid values are 0 and 1. 1 means fully opaque, 0 means completely transparent (hides the component while still occupying space in the layout). <br> Initial value: 1. <br> **Note:** <br> Child components inherit the parent component's opacity and combine it with their own opacity property. |

## Example Code

This example demonstrates how to set component opacity using the opacity property.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(5) {
            Text("opacity(1)")
                .fontSize(9)
                .width(90.percent)
                .fontColor(0xCCCCCC)
            Text("")
                .width(90.percent)
                .height(50)
                .opacity(1)
                .backgroundColor(0xAFEEEE)
            Text("opacity(0.7)")
                .fontSize(9)
                .width(90.percent)
                .fontColor(0xCCCCCC)
            Text("")
                .width(90.percent)
                .height(50)
                .opacity(0.7)
                .backgroundColor(0xAFEEEE)
            Text("opacity(0.4)")
                .fontSize(9)
                .width(90.percent)
                .fontColor(0xCCCCCC)
            Text("")
                .width(90.percent)
                .height(50)
                .opacity(0.4)
                .backgroundColor(0xAFEEEE)
            Text("opacity(0.1)")
                .fontSize(9)
                .width(90.percent)
                .fontColor(0xCCCCCC)
            Text("")
                .width(90.percent)
                .height(50)
                .opacity(0.1)
                .backgroundColor(0xAFEEEE)
            Text("opacity(0)")
                .fontSize(9)
                .width(90.percent)
                .fontColor(0xCCCCCC)
            Text("")
                .width(90.percent)
                .height(50)
                .opacity(0)
                .backgroundColor(0xAFEEEE)
        }
        .width(100.percent)
        .padding(top: 5)
    }
}
```

![uni_opacity](figures/uni_opacity.png)