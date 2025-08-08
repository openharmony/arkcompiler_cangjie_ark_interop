# Key Event

Key events refer to events triggered when components interact with input devices such as keyboards and remote controllers. These events apply to all focusable components, such as Button. For components like Text and Image that are not focusable by default, key events are currently not supported. In the future, they may be enabled by setting the `focusable` property to true.

## Permission List

None

## func onKeyEvent((KeyEvent)->Unit)

```cangjie
public open func onKeyEvent(callback: (KeyEvent)->Unit): This
```

**Description:** When the component bound to this method gains focus, key actions will trigger this event.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([KeyEvent](#class-keyevent))->Unit | Yes | - | The callback triggered by key actions when the bound component gains focus. |

## Basic Type Definitions

### class KeyEvent

```cangjie
public class KeyEvent {
    public var isStopPropagation: Bool = false
    public KeyEvent(
        public var keyText: String,
        public var keyType: KeyType,
        public var keyCode: Int32,
        public var keySource: KeySource,
        public var metaKey: Int32,
        public var deviceId: Int64,
        public var timestamp: Int64
    )
}
```

**Description:** Key event.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### var isStopPropagation

```cangjie
public var isStopPropagation: Bool = false
```

**Description:** Controls event propagation.

**Type:** Bool

**Read/Write:** Readable and Writable

**Since:** 12

#### var keyText

```cangjie
public var keyText: String
```

**Description:** The key value of the pressed key.

**Type:** String

**Read/Write:** Readable and Writable

**Since:** 12

#### var keyType

```cangjie
public var keyType: KeyType
```

**Description:** The type of the pressed key.

**Type:** [KeyType](./cj-common-types.md#enum-keytype)

**Read/Write:** Readable and Writable

**Since:** 12

#### var keyCode

```cangjie
public var keyCode: Int32
```

**Description:** The key code of the pressed key.

**Type:** Int32

**Read/Write:** Readable and Writable

**Since:** 12

#### var keySource

```cangjie
public var keySource: KeySource
```

**Description:** The type of input device that triggered the current key event.

**Type:** [KeySource](./cj-common-types.md#enum-keysource)

**Read/Write:** Readable and Writable

**Since:** 12

#### var metaKey

```cangjie
public var metaKey: Int32
```

**Description:** The state of the meta key when the key event occurred. 1 indicates pressed state, 0 indicates unpressed state.

**Type:** Int32

**Read/Write:** Readable and Writable

**Since:** 12

#### var deviceId

```cangjie
public var deviceId: Int64
```

**Description:** The ID of the input device that triggered the current key event.

**Type:** Int64

**Read/Write:** Readable and Writable

**Since:** 12

#### var timestamp

```cangjie
public var timestamp: Int64
```

**Description:** The timestamp when the key event occurred.

**Type:** Int64

**Read/Write:** Readable and Writable

**Since:** 12

#### KeyEvent(String, KeyType, Int32, KeySource, Int32, Int64, Int64)

```cangjie
public KeyEvent(
    public var keyText: String,
    public var keyType: KeyType,
    public var keyCode: Int32,
    public var keySource: KeySource,
    public var metaKey: Int32,
    public var deviceId: Int64,
    public var timestamp: Int64
)
```

**Description:** Constructs a KeyEvent object.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| keyText | String | Yes | - | The key value of the pressed key. |
| keyType | [KeyType](./cj-common-types.md#enum-keytype) | Yes | - | The type of the pressed key. |
| keyCode | Int32 | Yes | - | The key code of the pressed key. |
| keySource | [KeySource](./cj-common-types.md#enum-keysource) | Yes | - | The type of input device that triggered the current key event. |
| metaKey | Int32 | Yes | - | The state of the meta key when the key event occurred. 1 indicates pressed state, 0 indicates unpressed state. |
| deviceId | Int64 | Yes | - | The ID of the input device that triggered the current key event. |
| timestamp | Int64 | Yes | - | The timestamp when the key event occurred. |

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
            Button("KeyEvent").backgroundColor(0x2788D9)
            .onKeyEvent({event =>
                text = """
                    keyType: ${event.keyType.toString()}
                    keyCode: ${event.keyCode.toString()}
                    keyText: ${event.keyText}
                    deviceId: ${event.deviceId.toString()}
                    metaKey: ${event.metaKey.toString()}
                    timestamp: ${event.timestamp.toString()}
                """
                AppLog.info(text)
            })
            Text(text).padding(15)
        }.height(300).width(100.percent).padding(35)
    }
}
```

![key_event](figures/key_event.png)