# TextPicker

A component for sliding to select text content.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

None

## Creating the Component

### init(Array\<String>, ?UInt32, ?String)

```cangjie
public init(
    range!: Array<String>,
    selected!: ?UInt32 = Option.None,
    value!: ?String = Option.None
)
```

**Function:** Creates a text picker based on the specified selection range in `range`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| range | Array\<String> | Yes | - | **Named parameter.** The data selection list for the picker. Cannot be set as an empty array. If set as an empty array, it will not display; if dynamically changed to an empty array, it will maintain the current valid value display. |
| selected | ?UInt32 | No | **Named parameter.** Sets the index value of the default selected item in the array.<br>Initial value: 0. |
| value | ?String | No | Option.None | **Named parameter.** Sets the value of the default selected item, with lower priority than `selected`.<br>Initial value: First element value.<br>**Note:**<br>This value is only valid when displaying a text list. It is invalid when displaying an image list or an image-plus-text list. |

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func canLoop(Bool)

```cangjie
public func canLoop(value: Bool): This
```

**Function:** Sets whether the picker can scroll in a loop.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether the picker can scroll in a loop.<br>true: Can loop; false: Cannot loop.<br>Initial value: true. |

### func defaultPickerItemHeight(Length)

```cangjie
public func defaultPickerItemHeight(value: Length): This
```

**Function:** Sets the height of each picker item.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The height of each picker item. |

## Component Events

### func onChange(OnTextPickerChangeCallback)

```cangjie
public func onChange(callback: OnTextPickerChangeCallback): This
```

**Function:** Triggers this callback when sliding to select text content in the TextPicker. When displaying a text or image-plus-text list, the `value` parameter is the text value of the selected item. When displaying an image list, the `value` parameter is empty.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [OnTextPickerChangeCallback](<font color="red" face="bold">please add link</font>) | Yes | - | The text and index value of the currently selected item. |

## Example Code

### Example 1 (Setting the Number of Picker Columns)

This example demonstrates how to configure `range` to implement a single-column or multi-column text picker.

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var select: UInt32 = 1
    @State var fruits: Array<String> = ["apple", "banana", "orange", "peach"]
    func build() {
        Column {
            TextPicker(this.fruits, selected: this.select)
            .onChange({result: TextPickerResData =>
                    nativeLog("Picker item changed, value: ${result.index}")
            })
        }
        .width(100.percent)
        .height(100.percent)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
    }
}
```

![textpicker](figures/textpicker.png)