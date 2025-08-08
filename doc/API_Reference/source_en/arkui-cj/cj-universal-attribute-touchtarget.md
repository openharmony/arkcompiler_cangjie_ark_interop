# Touch Hotspot Settings

Applicable to components that support generic click events, generic touch events, and generic gesture handling.

## func responseRegion(Rectangle)

```cangjie
public func responseRegion(rect: Rectangle): This
```

**Function:** Sets a touch hotspot.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| rect | [Rectangle](./cj-common-types.md#class-rectangle) | Yes | - | A touch hotspot including position and size. |

## func responseRegionArray(Array\<Rectangle>)

```cangjie
public func responseRegionArray(array: Array<Rectangle>): This
```

**Function:** Sets multiple touch hotspots.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| array | Array\<[Rectangle](./cj-common-types.md#class-rectangle)> | Yes | - | Multiple touch hotspots including position and size. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var text: String = ""
    func build() {
        Column() {
            Text("x:0,y:0,width:50.percent,height:100.percent")
            // Hotspot width is half of button width, no response when clicking right side
            Button("button1")
            .responseRegion(Rectangle(x: 0.vp, y: 0.vp, width: 50.percent, height: 100.percent))
            .onClick({ =>
                text = "button1 clicked"
            })
            // Hotspot width is half of button width and shifted right by one button width, click event takes effect when clicking left side of button2's right
            Text("x:100.percent,y:0,width:50.percent,height:100.percent")
            Button("button2")
            .responseRegion(Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent))
            .onClick({ =>
                text = "button2 clicked"
            })
            // Hotspot size equals entire button and shifted down by one button height, click event takes effect when clicking area below button3
            Text("x:0,y:100.percent,width:100.percent,height:100.percent")
            Button("button3")
            .responseRegion(Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent))
            .onClick({ =>
                text = "button3 clicked"
            })
            .margin(bottom: 50)
            // Set multiple touch hotspots
            Text("[Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent)," + "\nRectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent)]")
            Button("button4")
            .responseRegionArray([Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent),Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent)])
            .onClick({ =>
                text = "button4 clicked"
            })
            Text(text).margin(top: 50)
        }.width(100.percent).margin(top: 5)
    }
}
```

![uni_response_region](figures/uni_response_region.gif)