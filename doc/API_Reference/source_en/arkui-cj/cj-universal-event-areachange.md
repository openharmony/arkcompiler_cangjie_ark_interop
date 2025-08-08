# Component Area Change Event

The component area change event refers to the event triggered when the displayed size, position, etc., of a component changes.

> **Note:**
>
> The execution of the onAreaChange callback is only related to the component itself. There is no strict execution order or guarantee for onAreaChange callbacks on ancestor or descendant components.

## func onAreaChange((Area, Area) -> Unit)

```cangjie
public func onAreaChange(callback: (Area, Area)->Unit): This
```

**Functionality:** This callback is triggered when the component's area changes. It only responds to callbacks caused by layout changes that affect the component's size or position.

Rendering attribute changes caused by drawing changes (such as translate or offset) will not trigger this callback. If the component's position is determined by drawing changes (e.g., bindSheet), it will also not trigger the callback.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([Area](./cj-common-types.md#class-area), [Area](./cj-common-types.md#class-area))->Unit | Yes | - | Callback triggered when the component's area changes.<br/>Parameter 1: Component area information before the change.<br/>Parameter 2: Component area information after the change. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var value: String = "Text"
    @State var sizeValue: String = ""
    func build() {
        Column {
            Text(this.value)
            .backgroundColor(Color.GREEN)
            .margin(30)
            .fontSize(30)
            .onClick({ evt =>this.value = this.value + "Text"})
            .onAreaChange({old, new => this.sizeValue = "from " + old.width.toString() + " to " + new.width.toString()})
            Text("Area:\n" + this.sizeValue).margin(30)
        }
    }
}
```

![uni_area_change](figures/uni-area-change.gif)