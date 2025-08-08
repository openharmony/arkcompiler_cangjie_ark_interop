# Mounting and Unmounting Events

Mounting and unmounting events refer to events triggered when a component is mounted to or unmounted from the component tree.

## func onAppear(() -> Unit)

```cangjie
public func onAppear(callback: ()->Unit): This
```

**Function:** Triggered when the component is mounted and displayed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ()->Unit | Yes | - | Callback function when the component is mounted and displayed. The callback may be invoked after the component's layout rendering. |

## func onDisAppear(() -> Unit)

```cangjie
public func onDisAppear(callback: ()->Unit): This
```

**Function:** Triggered when the component is unmounted and disappears.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ()->Unit | Yes | - | Callback function when the component is unmounted and disappears. The callback may be invoked after the component's layout rendering. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var isShow: Bool = true
    @State var changeAppear: String = "Click to mount/unmount component"
    var myText: String = "Text for onAppear"
    func build() {
        Column {
            Button(this.changeAppear)
            .onClick({evt =>
                this.isShow = !this.isShow
            }).margin(15.vp)
            if (this.isShow) {
                Text(this.myText).fontSize(26).fontWeight(FontWeight.Bold)
                .onAppear({ =>
                    PromptAction.showToast(message: "The text is shown", bottom: "500vp")
                })
                .onDisAppear({ =>
                    PromptAction.showToast(message: "The text is hidden", bottom: "500vp")
                })
            }
        }
        .width(100.percent)
        .height(100.percent)
    }
}
```

![appear](figures/appear.gif)