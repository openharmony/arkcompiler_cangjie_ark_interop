# Focus Control

Customize the focus traversal effect for components, allowing configuration of whether a component can receive focus and the specific focus traversal order. Use the Tab key or arrow keys to switch focus.

> **Note:**
>
> - Custom components inherently cannot receive focus. When attributes such as [focusable](./cj-universal-attribute-focus.md#func-focusablebool) or [enabled](./cj-universal-attribute-enable.md#func-enabledbool) are set to false, or when the [visibility](./cj-universal-attribute-visibility.md#func-visibilityvisibility) attribute is set to Hidden or None, these settings do not affect the ability of child components to receive focus.
> - A component actively requesting focus is not controlled by the window's focus state.
> - For focus development guidelines, refer to the [Focus Development Guide](./cj-universal-event-focus.md).

## func defaultFocus(Bool)

```cangjie
public func defaultFocus(isDefaultFocus: Bool): This
```

**Function:** Sets whether the current component is the default focus on the current page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| isDefaultFocus | Bool | Yes | - | Determines whether the current component is the default focus on the current page. This only takes effect when the page is first created and entered for the first time.<br>Initial value: false.<br>**Note:**<br>If set to true, the component becomes the default focus; if false, it has no effect. |

## func focusable(Bool)

```cangjie
public func focusable(isFocusable: Bool): This
```

**Function:** Sets whether the current component can receive focus.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| isFocusable | Bool | Yes | \- | Determines whether the current component can receive focus. true means the component can receive focus, false means it cannot.<br>**Note:**<br>Components with default interaction logic, such as [Button](./cj-button-picker-button.md), are focusable by default. Other components are non-focusable by default. In a non-focusable state, [focus events](./cj-universal-event-focus.md) cannot be triggered. |

## func focusOnTouch(Bool)

```cangjie
public func focusOnTouch(isFocusOnTouch: Bool): This
```

**Function:** Sets whether the current component supports receiving focus via touch.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| isFocusOnTouch | Bool | Yes | - | Determines whether the current component supports receiving focus via touch. true means it supports touch focus, false means it does not.<br>Initial value: false.<br>**Note:**<br>Focus can only be obtained via touch if the component is clickable. |

## func focusBox(FocusBoxStyle)

```cangjie
public func focusBox(style: FocusBoxStyle): This
```

**Function:** Sets the system focus box style for the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| style | [FocusBoxStyle](./cj-universal-attribute-focus.md#class-focusboxstyle) | Yes | \- | The system focus box style for the current component.<br>**Note:**<br>This style only affects components that display the system focus box during focus traversal. |

## func focusScopePriority(String, FocusPriority)

```cangjie
public func focusScopePriority(scopeId: String, priority!: FocusPriority = FocusPriority.AUTO): This
```

**Function:** Sets the focus priority of the current component within a specified container. Must be used in conjunction with focusScopeId.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| scopeId | String | Yes | \- | The ID of the container component where the focus priority of the current component takes effect.<br>**Note:**<br>1. The current component must be within the container identified by scopeId, or the container to which the current component belongs must be within the container identified by scopeId.<br>2. A component cannot have multiple priorities set.<br>3. A container component with focusScopeId set cannot have a priority set. |
| priority | FocusPriority | No | FocusPriority.AUTO | **Named parameter.** The focus priority.<br>**Note:**<br>If priority is not set, the component defaults to AUTO priority.<br>Impact of priority on focus traversal and focus acquisition:<br>1. When the container receives focus as a whole (e.g., during page-level switching, focus switching to a focus group, or when the container component requests focus via requestFocus), if there is a component with PREVIOUS priority within the container, that component receives focus. Otherwise, the last focused component within the container receives focus.<br>2. When the container does not receive focus as a whole (e.g., during focus traversal via the Tab key or arrow keys in non-focus group scenarios), if the container is receiving focus for the first time, the component with the highest priority within the container receives focus. If the container is not receiving focus for the first time, focus traversal follows the positional order without considering priority. |

## func focusScopeId(String, Bool, Bool)

```cangjie
public func focusScopeId(id: String, isGroup!: Bool = false, arrowStepOut!: Bool = true): This
```

**Function:** Sets the ID identifier for the current container component and determines whether it is a focus group.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| id | String | Yes | \- | The ID identifier for the current container component.<br>**Note:**<br>Within a single hierarchical page, the ID must be globally unique and cannot be duplicated. |
| isGroup | Bool | No | false | **Named parameter.** Determines whether the current container component is a focus group.<br>**Note:**<br>Focus groups cannot be nested or redundantly configured.<br>Focus groups cannot be used in combination with tabIndex.<br>The purpose of configuring a focus group is to enable the container and its elements to follow focus group traversal rules. Focus group traversal rules:<br>1. Within a focus group container, focus can only be traversed using arrow keys. The Tab key causes focus to exit the focus group container.<br>2. When focus switches from outside the focus group container to inside via arrow keys, if there is a component with PREVIOUS priority within the focus group container, that component receives focus. Otherwise, the last focused component within the focus group container receives focus. |
| arrowStepOut | Bool | No | true | **Named parameter.** Determines whether arrow keys can be used to exit the current focus group. true means arrow keys can exit the focus group, false means they cannot. |

## func tabIndex(Int32)

```cangjie
public func tabIndex(index: Int32): This
```

**Function:** Customizes the Tab key focus traversal capability for components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| index | Int32 | Yes | - | Customizes the Tab key focus traversal capability for components. If there are components with tabIndex > 0, Tab key traversal will only cycle through these components in ascending order of tabIndex values. If no components have tabIndex > 0, components with tabIndex = 0 follow their preset traversal rules.<br>UiExtension components do not support tabIndex. Using tabIndex on pages containing UiExtension components may cause traversal issues.<br>\- tabIndex >= 0: The element is focusable and can be accessed via Tab key traversal.<br>\- tabIndex < 0 (typically tabIndex = -1): The element is focusable but cannot be accessed via Tab key traversal.<br>Initial value: 0.<br>**Note:**<br>tabIndex cannot be used in combination with focusScopeId. |

## func groupDefaultFocus(Bool)

```cangjie
public func groupDefaultFocus(isGroupDefaultFocus: Bool): This
```

**Function:** Sets whether the current component is the default focus when its container receives focus.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| isGroupDefaultFocus | Bool | Yes | - | Determines whether the current component is the default focus when its container receives focus. This only takes effect when the container node is first created and receives focus for the first time. true means the component is the default focus, false means it is not.<br>Initial value: false.<br>**Note:**<br>Must be used in conjunction with tabIndex. When a container has [tabIndex](./cj-universal-attribute-focus.md#func-tabindexint32) set and a child component or the container itself has groupDefaultFocus(true), the focus will automatically transfer to the specified component when the container receives focus via the Tab key for the first time. If multiple components (including the container itself) have groupDefaultFocus(true), the first component found during a depth-first traversal of the component tree will be selected. |

## Basic Type Definitions

### class FocusControl

```cangjie
public class FocusControl {
}
```

**Function:** The focus control module.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

#### static func requestFocus(String)

```cangjie
public static func requestFocus(keyValue: String): Bool
```

**Function:** A global interface usable in method statements. Calling this interface actively transfers focus to the component specified by the parameter.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| keyValue | String | Yes | \- | The string bound to the target component via the key(value: string) or id(value: string) interface.<br>Returns whether focus was successfully requested for the target component. If the target component exists and can receive focus, returns true; otherwise, returns false. |

**Return Value:**

| Type | Description |
| :------- | :---------- |
| Bool | Returns whether focus was successfully requested for the target component. If the target component exists and can receive focus, returns true; otherwise, returns false. |

### class FocusBoxStyle

```cangjie
public class FocusBoxStyle {
    public FocusBoxStyle (
        public var margin!: ?Length = None,
        public var strokeColor!: ?ColorMetrics = None,
        public var strokeWidth!: ?Length = None
    )
}
```

**Function:** The system focus box style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

#### var margin

```cangjie
public var margin: ?Length = None
```

**Function:** The distance between the focus box and the component edge. Positive values indicate outward, negative values indicate inward. Percentages are not supported.

**Type:** [Length](./cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var strokeColor

```cangjie
public var strokeColor: ?ColorMetrics = None
```

**Function:** The color of the focus box.

**Type:** [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### var strokeWidth

```cangjie
public var strokeWidth: ?Length = None
```

**Function:** The width of the focus box. Negative values and percentages are not supported.

**Type:** [Length](./cj-common-types.md#interface-length)

**Read-Write Capability:** Read-Write

**Initial Version:** 19

#### FocusBoxStyle (public var margin!: ?Length = None, public var strokeColor!: ?ColorMetrics = None, public var strokeWidth!: ?Length = None)

```cangjie
public FocusBoxStyle (public var margin!: ?Length = None, public var strokeColor!: ?ColorMetrics = None, public var strokeWidth!: ?Length = None)
```

**Function:** Constructs a FocusBoxStyle object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :---- | :---- | :--- | :----- | :----------- |
| margin | [Length](./cj-common-types.md#interface-length) | No | None | **Named parameter.** The distance between the focus box and the component edge.<br>Positive values indicate outward, negative values indicate inward. Percentages are not supported. |
| strokeColor | [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | No | None | **Named parameter.** The color of the focus box. |
| strokeWidth | [Length](./cj-common-types.md#interface-length) | No | None | **Named parameter.** The width of the focus box.<br>Negative values and percentages are not supported. |

### class ColorMetrics

```cangjie
public class ColorMetrics {
    public prop color: String
    public prop red: UInt8
    public prop green: UInt8
    public prop blue: UInt8
    public prop alpha: UInt8
}
```

**Function:** Used for color blending.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

#### prop color

```cangjie
public prop color: String
```
**Function:** Gets the color of ColorMetrics and returns it in rgba string format.

**Type:** String

**Read-Write Capability:** Read-only

**Initial Version:** 19

#### prop red

```cangjie
public prop red: UInt8
```

**Function:** Gets the R component (red) of the ColorMetrics color.

**Type:** UInt8

**Read-Write Capability:** Read-only

**Initial Version:** 19

#### prop green

```cangjie
public prop green: UInt8
```

**Function:** Gets the G component (green) of the ColorMetrics color.

**Type:** UInt8

**Read-Write Capability:** Read-only

**Initial Version:** 19

#### prop blue

```cangjie
public prop blue: UInt8
```

**Function:** Gets the B component (blue) of the ColorMetrics color.

**Type:** UInt8

**Read-Write Capability:** Read-only

**Initial Version:** 19

#### prop alpha

```cangjie
public prop alpha: UInt8
```

**Function:** Gets the A component (alpha/transparency) of the ColorMetrics color.

**Type:** UInt8

**Read-Write Capability:** Read-only

**Initial Version:** 19

#### static func numeric(UInt32)

```cangjie
public static func numeric(value: UInt32): ColorMetrics
```

**Function:** Instantiates the ColorMetrics class using a HEX format color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
| :---- | :---- | :--- | :----- | :----------- |
| value | UInt32 | Yes   | \-      | HEX format color. |

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | Instance of the ColorMetrics class.|

#### static func rgba(UInt8, UInt8, UInt8, Float32)

```cangjie
public static func rgba(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = 1.0): ColorMetrics
```

**Function:** Instantiates the ColorMetrics class using an rgb or rgba format color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
| :---- | :---- | :--- | :----- | :----------- |
| red | UInt8 | Yes | \- | R component (red). |
| green | UInt8 | Yes | \- | G component (green). |
| blue | UInt8 | Yes | \- | B component (blue). |
| alpha | Float32 | No  | 1.0 | **Named parameter.** A component (alpha/transparency). |

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | Instance of the ColorMetrics class.|

#### static func resourceColor(Color)

```cangjie
public static func resourceColor(color: Color): ColorMetrics
```

**Function:** Instantiates the ColorMetrics class using a color enumeration value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
| :---- | :---- | :--- | :----- | :----------- |
| color | Color | Yes   | \- | Color type. |

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | Instance of the ColorMetrics class.|

#### static func resourceColor(UInt32)

```cangjie
public static func resourceColor(color: UInt32): ColorMetrics
```

**Function:** Instantiates the ColorMetrics class using a HEX format color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
| :---- | :---- | :--- | :----- | :----------- |
| color | UInt32 | Yes   | \-  | HEX format color. |

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | Instance of the ColorMetrics class.|

#### static func resourceColor(String)

```cangjie
public static func resourceColor(color: String): ColorMetrics
```

**Function:** Instantiates the ColorMetrics class using an rgb or argb format color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
| :---- | :---- | :--- | :----- | :----------- |
| color | String | Yes   | \- | rgb or argb format color. |

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | Instance of the ColorMetrics class.|

#### static func resourceColor(AppResource)

```cangjie
public static func resourceColor(color: AppResource): ColorMetrics
```

**Function:** Instantiates the ColorMetrics class using a color from system resources or application resources.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
| :---- | :---- | :--- | :----- | :----------- |
| color | [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource) | Yes   | \- | Color from system resources or application resources. |

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | Instance of the ColorMetrics class.|

#### func blendColor(ColorMetrics)

```cangjie
public func blendColor(overlayColor: ColorMetrics): ColorMetrics
```

**Function:** Blends colors.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
| :---- | :---- | :--- | :----- | :----------- |
| overlayColor | [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | Yes   | \- | Instance of the ColorMetrics class for the overlay color. |

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | Instance of the ColorMetrics class.|

#### func toUInt32()

```cangjie
public func toUInt32(): UInt32
```

**Function:** Gets the integer format of the ColorMetrics color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| UInt32 | Integer format of the ColorMetrics color.|

### enum FocusPriority

```cangjie
public enum FocusPriority {
    | AUTO
    | PRIOR
    | PREVIOUS
}
```

**Function:** Focus priority.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

#### AUTO

```cangjie
AUTO
```

**Function:** Default priority, the focus priority of a component when unspecified.

**Initial Version:** 19

#### PRIOR

```cangjie
PRIOR
```

**Function:** Priority for obtaining focus within a container. Higher than AUTO.

**Initial Version:** 19

#### PREVIOUS

```cangjie
PREVIOUS
```

**Function:** Priority for the node that obtained focus when the container last lost focus as a whole. Higher than PRIOR.

**Initial Version:** 19

## Example Code<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var oneButtonColor: UInt32 = 0xFFC0CB
    @State
    var twoButtonColor: UInt32 = 0x87CEFA
    @State
    var threeButtonColor: UInt32 = 0x90EE90
    @State
    var fourButtonColor: UInt32 = 0x5DD55D
    @State
    var fiveButtonColor: UInt32 = 0x1E90FF
    @State
    var rowBoxColor: UInt32 = 0xFFFFFF
    @State
    var idList: Array<String> = ["A", "B", "C", "D", "E", "F"]

    func build() {
        // Button components are focusable by default
        Column(20) {
            Row() {
                // Default focus, and clickable to gain focus
                Button("Hello Cangjie A")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie A")
                    }
                    .backgroundColor(oneButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .margin(5.px)
                    .fontColor(Color.BLACK)
                    .focusOnTouch(true)
                    .defaultFocus(true)
                    .onFocus({
                        => oneButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => oneButtonColor = 0xFFC0CB
                    })
                    .tabIndex(1)
                    .id(this.idList[0])
                    .key(this.idList[0])
                // Not focusable by click, but focusable by default
                Button("Hello Cangjie B")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie B")
                    }
                    .backgroundColor(twoButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .fontColor(Color.BLACK)
                    .margin(5.px)
                    .focusOnTouch(false)
                    .onFocus({
                        => twoButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => twoButtonColor = 0x87CEFA
                    })
                    .tabIndex(2)
                    .id(this.idList[1])
                    .key(this.idList[1])
            }
            Row() {
                // Not focusable
                Button("Hello Cangjie C")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie C")
                    }
                    .backgroundColor(threeButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .margin(5.px)
                    .fontColor(Color.BLACK)
                    .focusable(false)
                    .onFocus({
                        => threeButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => threeButtonColor = 0x90EE90
                    })
                    .tabIndex(3)
                    .id(this.idList[2])
                    .key(this.idList[2])
                // Focusable and clickable to gain focus
                Button("Hello Cangjie D")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie D")
                    }
                    .backgroundColor(fourButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .margin(5.px)
                    .fontColor(Color.BLACK)
                    .focusable(true)
                    .focusOnTouch(true)
                    .onFocus({
                        => fourButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => fourButtonColor = 0x5DD55D
                    })
                    .tabIndex(4)
                    .id(this.idList[3])
                    .key(this.idList[3])
            }
            Row() {
                // Default focus when parent component gains focus
                Button("Hello Cangjie E")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie E")
                    }
                    .backgroundColor(fiveButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .margin(20.px)
                    .fontColor(Color.BLACK)
                    .onFocus({
                        => fiveButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => fiveButtonColor = 0x1E90FF
                    })
                    .groupDefaultFocus(true)
                    .id(this.idList[4])
                    .key(this.idList[4])
            }
            .tabIndex(4)
            .focusable(true)
            .borderWidth(1.5)
            .borderColor(rowBoxColor)
            .borderStyle(BorderStyle.Solid)
            .onFocus({
                => rowBoxColor = 0x000000
            })
            .onBlur({
                => rowBoxColor = 0xFFFFFF
            })

            Row() {
                // Click to focus component D
                Button("RequestFocus-D")
                    .width(400.px)
                    .height(150.px)
                    .margin(20.px)
                    .fontColor(Color.BLACK)
                    .focusable(true)
                    .onClick {
                        let selectId = this.idList[3]
                        let result = FocusControl.requestFocus(selectId)
                        if (result) {
                            AppLog.info("Request success")
                        } else {
                            AppLog.info("Request failed")
                        }
                    }
            }

            Row(20) {
                Column(20) {
                    Column(5) {
                        Button("Group1")
                            .width(165)
                            .height(40)
                            .fontColor(Color.WHITE)
                            .id("b1")
                            .key("b1")
                            .focusOnTouch(true)
                        Row(5) {
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b2").key("b2")
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b3").key("b3")
                        }
                        Row(5) {
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b4").key("b4")
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b5").key("b5")
                        }
                    }.borderWidth(2).borderColor(Color.RED).borderStyle(BorderStyle.Dashed)
                    Column(5) {
                        Button("Group2").width(165).height(40).fontColor(Color.WHITE).id("b6").key("b6")
                        Row(5) {
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b7").key("b7")
                            Button("PRIOR")
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                                .focusScopePriority("ColumnScope1", priority: FocusPriority.PRIOR)
                                .focusBox(
                                    FocusBoxStyle(
                                        margin: 20.px,
                                        strokeColor: ColorMetrics.resourceColor(Color.RED),
                                        strokeWidth: 20.px
                                    )
                                )
                                .id("b8")
                                .key("b8")
                        }
                        Row(5) {
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b9").key("b9")
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b10").key("b10")
                        }
                    }.borderWidth(2).borderColor(Color.GREEN).borderStyle(BorderStyle.Dashed)
                }.focusScopeId("ColumnScope1")
                Column(5) {
                    Button("Group3")
                        .width(165)
                        .height(40)
                        .fontColor(Color.WHITE)
                        .id("b11")
                        .key("b11")
                        .focusOnTouch(true)
                    Row(5) {
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b12").key("b12")
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b13").key("b13")
                    }
                    Button("PREVIOUS")
                        .width(165)
                        .height(40)
                        .fontColor(Color.WHITE)
                        .focusScopePriority("ColumnScope2", priority: FocusPriority.PREVIOUS)
                        .id("b14")
                        .key("b14")
                    Row(5) {
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b15").key("b15")
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b16").key("b16")
                    }
                    Button().width(165).height(40).fontColor(Color.WHITE).id("b17").key("b17")
                    Row(5) {
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b18").key("b18")
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b19").key("b19")
                    }
                }
                    .borderWidth(2)
                    .borderColor(Color.GRAY)
                    .borderStyle(BorderStyle.Dashed)
                    .focusScopeId("ColumnScope2", isGroup: true) // Column2 is a focus group
            }
        }.width(100.percent).margin(top: 20)
    }
}
```

![focus_control](figures/focus_control.jpeg)