# Counter

A counter component that provides corresponding increment or decrement operations.

## Child Components

Can contain child components.

## Creating the Component

### init(() -> Unit)

```cangjie
public init(content: () -> Unit)
```

**Function:** Creates a counter component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| content | ()->Unit | Yes | - | Defines the counter component and its content area. |

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func enableDec(Bool)

```cangjie
public func enableDec(value: Bool): This
```

**Function:** Sets the decrement button to be disabled or enabled.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Disables or enables the decrement button.<br>true means the button is enabled.<br>false means the button is disabled.<br>Initial value: true. |

### func enableInc(Bool)

```cangjie
public func enableInc(value: Bool): This
```

**Function:** Sets the increment button to be disabled or enabled.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Disables or enables the increment button.<br>true means the + button is enabled.<br>false means the + button is disabled.<br>Component initial value: true. |

## Component Events

### func onDec(VoidCallback)

```cangjie
public func onDec(event: VoidCallback): This
```

**Function:** Listens for the event triggered when the value is decremented.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [VoidCallback](<font color="red" face="bold">please add link</font>) | Yes | - | Callback function triggered when the Counter value is decremented. |

### func onInc(VoidCallback)

```cangjie
public func onInc(event: VoidCallback): This
```

**Function:** Listens for the event triggered when the value is incremented.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [VoidCallback](<font color="red" face="bold">please add link</font>) | Yes | - | Callback function triggered when the Counter value is incremented. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var value: Int64 = 0
    func build() {
        Column {
            Counter() {Text(this.value.toString())}
                .margin(100.0)
                .height(10.percent)
                .onInc {
                this.value++
            }
                .onDec {
                this.value--
            }
        }
    }
}
```

![counter](figures/counter.gif)