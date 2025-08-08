# Disabled Control

Determines whether a component is interactive. In the interactive state, it responds to [click events](./cj-universal-event-click.md#), [touch events](./cj-universal-event-touch.md), [drag events](./cj-universal-event-drag.md), [key events](./cj-universal-event-key.md), [focus events](./cj-universal-event-focus.md), [mouse events](./cj-universal-event-mouse.md), [hover events](./cj-universal-event-hover.md), and [gesture events](./cj-universal-gesture-bind.md).

> **Note:**
>
> The disabled control property only takes effect when pressed. Changing the `enabled` property during an ongoing interaction has no effect.

## func enabled(Bool)

```cangjie
public func enabled(value: Bool): This
```

**Function:** Sets whether the component is interactive.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| value | Bool | Yes | - | `true` indicates the component is interactive and responds to operations like clicks.<br>`false` indicates the component is non-interactive and does not respond to operations like clicks.<br>Initial value: `true`. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Flex(FlexParams(justifyContent: FlexAlign.SpaceAround)) {
            // No response when clicked
            Button("disable").enabled(false).backgroundColor(0x317aff).opacity(0.4)
            Button("enable").backgroundColor(0x317aff)
        }
        .width(100.percent)
        .padding(top: 5)
    }
}
```

![uni_enabled](figures/uni_enabled.gif)