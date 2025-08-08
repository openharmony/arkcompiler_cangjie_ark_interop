# Shadow

The shadow interface [shadow](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-imageeffect.md#func-shadowfloat64-resourcecolor-float64-float64) can add shadow effects to the current component.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            Column() {
                Column() {
                    Button('shadowOption').fontSize(12)
                }
                .width(100)
                .aspectRatio(1)
                .margin(10)
                .justifyContent(FlexAlign.Center)
                .backgroundColor(Color.WHITE)
                .borderRadius(20)
                .shadow(radius: 10, color: Color.GRAY)

                Column() {
                    Button('shadowOption').fontSize(12)
                }
                .width(100)
                .aspectRatio(1)
                .margin(10)
                .justifyContent(FlexAlign.Center)
                .backgroundColor(0xa8a888)
                .borderRadius(20)
                .shadow(radius: 10, color: Color.GRAY, offsetX: 20, offsetY: 20)
            }
            .width(100.percent)
            .height(100.percent)
            .justifyContent(FlexAlign.Center)
        }
        .height(100.percent)
    }
}
```