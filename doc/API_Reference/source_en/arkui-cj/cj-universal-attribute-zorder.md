# Z-order Control

The Z-order of components determines their stacking order.

## func zIndex(Int32)

```cangjie
public func zIndex(value: Int32): This
```

**Function:** Sets the stacking order of components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | Determines the display hierarchy among sibling components within the same container. A higher zIndex value means higher display hierarchy - components with larger zIndex values will overlay those with smaller values. Initial value: 0. |

## Example Code

### Example 1 (Setting Component Stacking Order)

This example demonstrates setting component stacking order using zIndex.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column {
            Stack() {
                // Stack overlaps components by default, with later-defined components appearing on top (having higher zIndex values)
                Text("1, zIndex(2)")
                  .size(width: 40.percent, height: 30.percent).backgroundColor(0xbbb2cb)
                  .zIndex(2)
                Text("2, default zIndex(1)")
                  .size(width: 70.percent, height: 50.percent).backgroundColor(0xd2cab3).align(Alignment.TopStart)
                  .zIndex(1)
                Text("3, zIndex(0)")
                  .size(width: 90.percent, height: 80.percent).backgroundColor(0xc1cbac).align(Alignment.TopStart)
              }.width(100.percent).height(200)
        }
    }
}
```

![uni_zindex](figures/uni_zindex.png)

### Example 2 (Dynamically Modifying zIndex Property)

This example demonstrates dynamically modifying the zIndex property using a Button component.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var zIndex_: Int32 = 0

    func build() {
        Column() {
            Button("change Text2 zIndex").onClick({
                => this.zIndex_ = (this.zIndex_ + 1) % 3
            })
            Stack() {
                // After changing zIndex via Button click, components maintain stable sorting based on their zIndex values before the click
                Text("1, zIndex(1)")
                    .size(width: 70.percent, height: 50.percent)
                    .backgroundColor(0xbbb2cb)
                    .zIndex(1)
                Text("2, default zIndex(0), now zIndex:" + this.zIndex_.toString())
                    .size(width: 90.percent, height: 80.percent)
                    .backgroundColor(0xd2cab3)
                    .align(Alignment.TopStart)
                    .zIndex(this.zIndex_)
            }
                .width(100.percent)
                .height(200)
        }
    }
}
```

Effect without clicking the Button to modify zIndex:

![zIndex_1](figures/zIndex_1.png)

After clicking the Button to dynamically modify zIndex, making Text1 and Text2 have equal zIndex values - the hierarchy remains unchanged due to stable sorting based on previous zIndex values:

![zIndex_2](figures/zIndex_2.png)

After clicking the Button to dynamically modify zIndex, making Text1's zIndex greater than Text2's - the hierarchy changes:

![zIndex_3](figures/zIndex_3.png)