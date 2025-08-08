# Accessibility Attributes

Components can set corresponding accessibility attributes and events to better utilize accessibility capabilities.

## func accessibilityGroup(Bool)

```cangjie
public func accessibilityGroup(value: Bool): This
```

**Function:** Sets whether to enable accessibility grouping.

> **Note:**
>
> - When accessibility grouping is enabled, this component and all its child components will be treated as a single selectable component, and accessibility services will no longer focus on the content of its child components.
> - If a component enables accessibility grouping and does not contain generic text attributes while also not setting [accessibility text](#func-accessibilitytextstring), it will by default concatenate the generic text attributes of its child components as the merged text for the component. If a child component lacks generic text attributes, that child component will be ignored during concatenation. In this case, the merged text does not use the child components' accessibility text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Accessibility group. When set to true, this component and all its child components will be treated as a single selectable component, and accessibility services will no longer focus on the content of its child components. Initial value: false. |

## func accessibilityText(String)

```cangjie
public func accessibilityText(value: String): This
```

**Function:** Sets accessibility text.

> **Note:**
>
> When a component does not contain text attributes, developers can set the accessibility text property to enable components without text information to announce the accessibility text content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | Accessibility text. When a component does not contain text attributes, screen readers will not announce anything when selecting this component, making it unclear to users what they have selected. To address this scenario, developers can set accessibility text for components without text information. When a screen reader selects this component, it will announce the accessibility text content, helping users clearly understand what they have selected.<br>Initial value: "".<br>If a component has both text attributes and accessibility text attributes, only the accessibility text content will be announced when the component is selected.<br>If a component has accessibility grouping enabled but lacks both accessibility text attributes and text attributes, it will concatenate the text of its child components (depth-first).<br>Accessibility text attributes are not concatenated. To prioritize concatenating accessibility text, set accessibilityGroup's accessibilityPreferred. |

## func accessibilityText(AppResource)

```cangjie
public func accessibilityText(value: AppResource): This
```

**Function:** Sets accessibility text, supporting resource file references via Resource.

> **Note:**
>
> When a component does not contain text attributes, developers can set the accessibility text property to enable components without text information to announce the accessibility text content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource) | Yes | - | Accessibility text resource reference. When a component does not contain text attributes, screen readers will not announce anything when selecting this component, making it unclear to users what they have selected. To address this scenario, developers can set accessibility text for components without text information. When a screen reader selects this component, it will announce the accessibility text content, helping users clearly understand what they have selected.<br>If a component has both text attributes and accessibility text attributes, only the accessibility text content will be announced when the component is selected.<br>If a component has accessibility grouping enabled but lacks both accessibility text attributes and text attributes, it will concatenate the text of its child components (depth-first).<br>Accessibility text attributes are not concatenated. To prioritize concatenating accessibility text, set accessibilityGroup's accessibilityPreferred. |

## func accessibilityDescription(String)

```cangjie
public func accessibilityDescription(value: String): This
```

**Function:** Sets accessibility description.

> **Note:**
>
> This attribute provides further explanation of the current component for users. Developers can set relatively detailed explanatory text for the component to help users understand the operation they are about to perform.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | Accessibility description, used to provide further explanation of the current component for users. Developers can set relatively detailed explanatory text for this attribute to help users understand the operation they are about to perform. For example, it can help users understand the potential consequences of an operation, especially when these consequences cannot be inferred from the component's own attributes and accessibility text. If a component has both text attributes and accessibility description attributes, the component's text attributes will be announced first, followed by the accessibility description content when the component is selected.<br>Initial value: "". |

## func accessibilityDescription(AppResource)

```cangjie
public func accessibilityDescription(value: AppResource): This
```

**Function:** Sets accessibility description, supporting resource file references via Resource.

> **Note:**
>
> This attribute provides further explanation of the current component for users. Developers can set relatively detailed explanatory text for the component to help users understand the operation they are about to perform.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource) | Yes | - | Accessibility description resource reference, used to provide further explanation of the current component for users. Developers can set relatively detailed explanatory text for this attribute to help users understand the operation they are about to perform. For example, it can help users understand the potential consequences of an operation, especially when these consequences cannot be inferred from the component's own attributes and accessibility text. If a component has both text attributes and accessibility description attributes, the component's text attributes will be announced first, followed by the accessibility description content when the component is selected. |

## func accessibilityLevel(String)

```cangjie
public func accessibilityLevel(value: String): This
```

**Function:** Sets accessibility importance.

> **Note:**
>
> This attribute controls whether a component can be recognized by accessibility assistive services.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | Accessibility importance, used to control whether a component can be recognized by accessibility assistive services.<br>Supported values:<br>"auto": Converts to "yes" or "no" based on the component type.<br>"yes": The current component can be recognized by accessibility assistive services.<br>"no": The current component cannot be recognized by accessibility assistive services.<br>"no-hide-descendants": The current component and all its child components cannot be recognized by accessibility assistive services.<br>Initial value: "auto".<br>The following components can be recognized by accessibility assistive services when accessibilityLevel is set to "auto": Checkbox, CheckboxGroup, Gauge, Marquee, MenuItem, MenuItemGroup, Menu, Navigation, DatePicker, Progress, Radio, Rating, ScrollBar, Select, Slider, Stepper, Text, TextClock, TextPicker, TextTimer, TimePicker, Toggle, Web. |

## func accessibilityTextHint(String)

```cangjie
public func accessibilityTextHint(value: String): This
```

**Function:** Sets the component's text hint information for accessibility assistive applications to query.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | Accessibility hint description, used to provide further explanation of the current component for users. Developers can set explanatory text for this attribute to help users understand the operation they are about to perform. |

## func accessibilityVirtualNode(() -> Unit)

```cangjie
public func accessibilityVirtualNode(builder: () -> Unit): This
```

**Function:** Sets accessibility virtual child nodes. For self-drawn components, a custom UI description is passed in. The components in this UI description are only laid out but not displayed in the backend. When assistive applications obtain accessibility node information, the node information from the UI description will be returned.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| builder | ()->Unit | Yes | - | Accessibility virtual child nodes, allowing developers to pass a custom UI description for self-drawn components. The components in this UI description are only laid out but not displayed in the backend. When assistive applications obtain accessibility node information, the node information from the UI description will be returned. Use in combination with @Builder and bind methods. |

## Example Code

<!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {

    func build() {
        Row {
            Column {
                Text("Text 1")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                Text("Text 2")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
            }
                .width(100.percent)
                .accessibilityGroup(true)
                .accessibilityLevel("yes")
                .accessibilityText("Group")
                .accessibilityDescription("The Column component can be selected, and the announced content is 'Group'")
        }.height(100.percent)
    }
}
```