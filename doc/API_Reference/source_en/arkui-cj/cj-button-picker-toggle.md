# Toggle

The component provides checkbox style, state button style, and switch style.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Subcomponents

Subcomponents can only be included when ToggleType is ButtonType.

## Creating the Component

### init(ToggleType, Bool)

```cangjie
public init(toggleType: ToggleType, isOn!: Bool = false)
```

**Function:** Creates a Toggle-type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| toggleType | [ToggleType](#enum-toggletype) | Yes | ToggleType.Switch | The type of the toggle. |
| isOn | Bool | No | false | **Named parameter.** Whether the toggle is on. true: on, false: off. |

### init(ToggleType, Bool, () -> Unit)

```cangjie
public init(toggleType: ToggleType, isOn: Bool, subcomponent: () -> Unit)
```

**Function:** Creates a Toggle-type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| toggleType | [ToggleType](#enum-toggletype) | Yes | ToggleType.Switch | The type of the toggle. |
| isOn | Bool | Yes | false | Whether the toggle is on. true: on, false: off. |
| subcomponent | ()->Unit | Yes | - | Declares the subcomponents. |

## Common Attributes/Common Events

Common Attributes: All supported

Common Events: All supported.

## Component Attributes

### func selectedColor(ResourceColor)

```cangjie
public func selectedColor(value: ResourceColor): This
```

**Function:** Sets the background color of the component in the on state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | Sets the background color of the component in the on state.<br/>Initial value: When ToggleType is Switch, the initial value is @r(sys.color.ohos_id_color_component_activated).<br/>When ToggleType is Checkbox, the initial value is @r(sys.color.ohos_id_color_component_activated).<br/>When ToggleType is Button, the initial value is @r(sys.color.ohos_id_color_component_activated) mixed with the transparency of @r(sys.color.ohos_id_color_text_highlight_bg). |

### func switchPointColor(ResourceColor)

```cangjie
public func switchPointColor(color: ResourceColor): This
```

**Function:** Sets the color of the circular slider for the Switch type. Only effective when type is ToggleType.Switch.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| color | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | The color of the circular slider for the Switch type. Initial value: @r(sys.color.ohos_id_color_foreground_contrary) |

## Component Events

### func onChange((Bool) -> Unit)

```cangjie
public func onChange(callback: (Bool) -> Unit): This
```

**Function:** Triggered when the toggle state changes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | (Bool)->Unit | Yes | - | When true, it indicates the state changes from off to on. When false, it indicates the state changes from on to off. |

## Basic Type Definitions

### enum ToggleType

```cangjie
public enum ToggleType <: Equatable<ToggleType> {
    | CheckboxType
    | SwitchType
    | ButtonType
    | ...
}
```

**Function:** The type of the toggle component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parent Type:**

- Equatable\<ToggleType>

#### ButtonType

```cangjie
ButtonType
```

**Function:** Provides a state button style. If the subcomponent has text settings, the corresponding text content will be displayed inside the button.
Initial dimensions: height is 28.vp, width has no initial value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### CheckboxType

```cangjie
CheckboxType
```

**Function:** Provides a checkbox style.
The default style of Checkbox is circular.
The default value for the common attribute margin is: top 14.px, right 14.px, bottom 14.px, left 14.px.
Default dimensions: width is 20.vp, height is 20.vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### SwitchType

```cangjie
SwitchType
```

**Function:** Provides a switch style.
The default value for the common attribute margin is: top 6.px, right 14.px, bottom 6.px, left 14.px.
Default dimensions: width is 36.vp, height is 20.vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### func !=(ToggleType)

```cangjie
public operator func !=(other: ToggleType): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [ToggleType](#enum-toggletype) | Yes | - | Another enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

#### func ==(ToggleType)

```cangjie
public operator func ==(other: ToggleType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [ToggleType](#enum-toggletype) | Yes | - | Another enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## Example Code

### Example 1 (Setting the Toggle Style)

This example configures ToggleType to set the checkbox style, state button style, and switch style for Toggle.

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(15) {
            Text("type: Switch")
            .fontSize(12)
            .fontColor(0xcccccc)
            .width(90.percent)
            Flex(FlexParams(justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center)) {
                Toggle(ToggleType.SwitchType, isOn: false)
                .selectedColor(0xed6f21)
                .switchPointColor(0xe5ffffff)
                .onChange({isOn: Bool =>
                    nativeLog("Component status: ${isOn}")
                })

                Toggle(ToggleType.SwitchType, isOn: true)
                .selectedColor(0x39a2db)
                .switchPointColor(0xe5ffffff)
                .onChange({isOn: Bool =>
                    nativeLog("Component status: ${isOn}")
                })
            }

            Text("type: Checkbox")
            .fontSize(12)
            .fontColor(0xcccccc)
            .width(90.percent)
            Flex(FlexParams(justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center)) {
                Toggle(ToggleType.CheckboxType, isOn: false)
                .size(width: 28, height: 28)
                .selectedColor(0xed6f21)
                .onChange({isOn: Bool =>
                    nativeLog("Component status: ${isOn}")
                })

                Toggle(ToggleType.CheckboxType, isOn: true)
                .size(width: 28, height: 28)
                .selectedColor(0x39a2db)
                .onChange({isOn: Bool =>
                    nativeLog("Component status: ${isOn}")
                })
            }

            Text("type: Button")
            .fontSize(12)
            .fontColor(0xcccccc)
            .width(90.percent)
            Flex(FlexParams(justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center)) {
                Toggle(ToggleType.ButtonType, false) {
                    Text("status")
                    .padding(left:12, right: 12)
                }
                .selectedColor(0xed6f21)
                .onChange({isOn: Bool =>
                    nativeLog("Component status: ${isOn}")
                })

                Toggle(ToggleType.ButtonType, true) {
                    Text("status")
                    .padding(left:12, right: 12)
                }
                .selectedColor(0x39a2db)
                .onChange({isOn: Bool =>
                    nativeLog("Component status: ${isOn}")
                })
            }
        }
    }
}
```