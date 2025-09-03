# Select

Provides a dropdown selection menu that allows users to choose among multiple options.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

None

## Creating the Component

### init(Array\<SelectOption>)

```cangjie
public init(values: Array<SelectOption>)
```

**Function:** Constructs a dropdown selection menu component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| values | Array\<[SelectOption](#class-selectoption)> | Yes | - | Sets the dropdown options. |

## Universal Attributes/Events

Universal attributes: All supported.

Universal events: All supported.

## Component Attributes

### func arrowPosition(ArrowPosition)

```cangjie
public func arrowPosition(value: ArrowPosition): This
```

**Function:** Sets the alignment between the text and arrow of dropdown menu items.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ArrowPosition](#enum-arrowposition) | Yes | - | The alignment between the text and arrow of dropdown menu items.<br>Initial value: ArrowPosition.END. |

### func font(FontStyle, FontWeight, Length, ResourceStr)

```cangjie
public func font(
    style!: FontStyle = FontStyle.Normal,
    weight!: FontWeight = FontWeight.Medium,
    size!: Length = 16.vp,
    family!: ResourceStr = "sans-serif"
): This
```

**Function:** Sets the text style of the dropdown button itself. When size is 0, the text is not displayed. When size is negative, the text size follows the initial value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| style | [FontStyle](./cj-common-types.md#enum-fontstyle) | No | FontStyle.Normal | **Named parameter.** Specifies the font style. |
| weight | [FontWeight](./cj-common-types.md#enum-fontweight) | No | FontWeight.Medium | **Named parameter.** Specifies the font weight. |
| size | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 16.vp | **Named parameter.** Specifies the font size and line height. Percentage settings are not supported. |
| family | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | "sans-serif" | **Named parameter.** Specifies the font family. |

### func fontColor(ResourceColor)

```cangjie
public func fontColor(value: ResourceColor): This
```

**Function:** Sets the text color of the dropdown button itself based on the specified Color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | The text color of the dropdown button itself.<br>Initial value: @r(sys.color.ohos_id_color_text_primary) mixed with the transparency of @r(sys.color.ohos_id_alpha_content_primary). |

### func menuAlign(MenuAlignType, Offset)

```cangjie
public func menuAlign(alignType!: MenuAlignType, offset!: Offset): This
```

**Function:** Sets the alignment between the dropdown button and the dropdown menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| alignType | [MenuAlignType](#enum-menualigntype) | Yes | - | **Named parameter.** The alignment type.<br/>Initial value: MenuAlignType.START. |
| offset | [Offset](#class-menuoffset) | Yes | - | **Named parameter.** The offset of the dropdown menu relative to the dropdown button after alignment.<br>Initial value: MenuOffset(0, 0). |

### func menuBackgroundBlurStyle(BlurStyle)

```cangjie
public func menuBackgroundBlurStyle(value: BlurStyle): This
```

**Function:** Sets the background blur material of the dropdown menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle) | Yes | - | The background blur material of the dropdown menu.<br/>Initial value: BlurStyle.COMPONENT_ULTRA_THICK. |

### func menuBackgroundColor(ResourceColor)

```cangjie
public func menuBackgroundColor(value: ResourceColor): This
```

**Function:** Sets the background color of the dropdown menu based on the specified Color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | The background color of the dropdown menu.<br>Initial value: Color.Transparent. |

### func optionBgColor(ResourceColor)

```cangjie
public func optionBgColor(value: ResourceColor): This
```

**Function:** Sets the background color of dropdown menu items based on the specified Color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | The background color of dropdown menu items.<br>Initial value: Color.Transparent. |

### func optionFont(FontStyle, FontWeight, Length, ResourceStr)

```cangjie
public func optionFont(
    style!: FontStyle = FontStyle.Normal,
    weight!: FontWeight = FontWeight.Medium,
    size!: Length = 16.vp,
    family!: ResourceStr = "sans-serif"
): This
```

**Function:** Sets the text style of dropdown menu items. When size is 0, the text is not displayed. When size is negative, the text size follows the initial value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| style | [FontStyle](./cj-common-types.md#enum-fontstyle) | No | FontStyle.Normal | **Named parameter.** Specifies the font style. |
| weight | [FontWeight](./cj-common-types.md#enum-fontweight) | No | FontWeight.Medium | **Named parameter.** Specifies the font weight. |
| size | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 16.vp | **Named parameter.** Specifies the font size and line height. Percentage settings are not supported. |
| family | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | "sans-serif" | **Named parameter.** Specifies the font family. |

### func optionFontColor(ResourceColor)

```cangjie
public func optionFontColor(value: ResourceColor): This
```

**Function:** Sets the text color of dropdown menu items based on the specified Color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | The text color of dropdown menu items.<br>Initial value: @r(sys.color.ohos_id_color_text_primary). |

### func optionHeight(Length)

```cangjie
public func optionHeight(value: Length): This
```

**Function:** Sets the maximum height of the dropdown menu display based on the specified Length type value. The initial maximum height of the dropdown menu is 80% of the available screen height. The set maximum height cannot exceed the initial maximum height.

When set to a negative value or zero, the attribute does not take effect, and the maximum height of the dropdown menu reverts to the initial value (80% of the available screen height).

Valid values are greater than 0. If the actual height of all dropdown menu items is less than the set height, the dropdown menu height adjusts to the actual height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The maximum height of the dropdown menu display. |

### func optionWidth(OptionWidthMode)

```cangjie
public func optionWidth(value: OptionWidthMode): This
```

**Function:** Sets the width of dropdown menu items. OptionWidthMode is an enumeration type that determines whether the dropdown menu inherits the width of the dropdown button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [OptionWidthMode](./cj-common-types.md#enum-optionwidthmode) | Yes | - | The width of dropdown menu items. |

### func optionWidth(Length)

```cangjie
public func optionWidth(value: Length): This
```

**Function:** Sets the width of dropdown menu items based on the specified Length type value. Percentage settings are not supported.

When set to an invalid value or less than the minimum width (56.vp), the attribute does not take effect, and the menu item width reverts to the initial value (2 grid units).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The width of dropdown menu items. |

### func selected(Int32)

```cangjie
public func selected(value: Int32): This
```

**Function:** Sets the index of the initial selected option in the dropdown menu, where the first item has an index of 0. If the selected attribute is not set or an invalid value is provided, the initial selection is -1, and no menu item is selected.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | The index of the initial selected option in the dropdown menu. |

### func selectedOptionBgColor(ResourceColor)

```cangjie
public func selectedOptionBgColor(value: ResourceColor): This
```

**Function:** Sets the background color of the selected dropdown menu item based on the specified Color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | The background color of the selected dropdown menu item.<br>Initial value: @r(sys.color.ohos_id_color_component_activated) mixed with the transparency of @r(sys.color.ohos_id_alpha_highlight_bg). |

### func selectedOptionFont(FontStyle, FontWeight, Length, String)

```cangjie
public func selectedOptionFont(
    style!: FontStyle = FontStyle.Normal,
    weight!: FontWeight = FontWeight.Medium,
    size!: Length = 16.vp,
    family!: String = "sans-serif"
): This
```

**Function:** Sets the text style of the selected dropdown menu item. When size is 0, the text is not displayed. When size is negative, the text size follows the initial value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| style | [FontStyle](./cj-common-types.md#enum-fontstyle) | No | FontStyle.Normal | **Named parameter.** Specifies the font style. |
| weight | [FontWeight](./cj-common-types.md#enum-fontweight) | No | FontWeight.Medium | **Named parameter.** Specifies the font weight. |
| size | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 16.vp | **Named parameter.** Specifies the text size. Percentage settings are not supported. |
| family | String | No | "sans-serif" | **Named parameter.** Specifies the font list. |

### func selectedOptionFontColor(ResourceColor)

```cangjie
public func selectedOptionFontColor(value: ResourceColor): This
```

**Function:** Sets the text color of the selected dropdown menu item based on the specified Color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | The text color of the selected dropdown menu item.<br>Initial value: @r(sys.color.ohos_id_color_text_primary_activated) |

### func space(Length)

```cangjie
public func space(value: Length): This
```

**Function:** Sets the spacing between the text and arrow of dropdown menu items based on the specified Length type value. Percentage settings are not supported. If the value is less than or equal to 8, the initial value is used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The spacing between the text and arrow of dropdown menu items.<br>Initial value: 8 |

### func value(ResourceStr)

```cangjie
public func value(value: ResourceStr): This
```

**Function:** Sets the text content of the dropdown button itself. By default, it is replaced with the menu item text when a menu item is selected.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| content | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | The text content of the dropdown button itself. If the text length exceeds the column width, it is truncated. |

## Component Events

### func onSelect(OnSelectCallback)

```cangjie
public func onSelect(callback: OnSelectCallback): This
```

**Function:** Triggers this callback when a dropdown menu item is selected.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [OnSelectCallback](<font color="red" face="bold">please add link</font>) | Yes | - | The index and value of the selected item. |## Basic Type Definitions

## class SelectOption

```cangjie
public class SelectOption {
    public var value: ResourceStr
    public var icon: ResourceStr
    public init(value!: ResourceStr, icon!: ResourceStr)
}
```

**Function:** An object for configuring dropdown menu component parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var icon

```cangjie
public var icon: ResourceStr
```

**Function:** Icon for the dropdown option.

**Type:** ResourceStr

**Read-Write Attribute:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var value

```cangjie
public var value: ResourceStr
```

**Function:** Content of the dropdown option.

**Type:** ResourceStr

**Read-Write Attribute:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(ResourceStr, ResourceStr)

```cangjie
public init(value!: ResourceStr, icon!: ResourceStr)
```

**Function:** Constructs a SelectOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | **Named parameter.** Content of the dropdown option. |
| icon | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | **Named parameter.** Icon for the dropdown option. |

#### init(String, String)

```cangjie
public init(value: String, icon!: String)
```

**Function:** Constructs a SelectOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | Content of the dropdown option. |
| icon | String | Yes | - | **Named parameter.** Icon for the dropdown option. |

#### init(String, AppResource)

```cangjie
public init(value: String, icon!: AppResource)
```

**Function:** Constructs a SelectOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | Content of the dropdown option. |
| icon | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | **Named parameter.** Icon for the dropdown option. |

#### init(AppResource, String)

```cangjie
public init(value: AppResource, icon!: String)
```

**Function:** Constructs a SelectOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Content of the dropdown option. |
| icon | String | Yes | - | **Named parameter.** Icon for the dropdown option. |

#### init(AppResource, AppResource)

```cangjie
public init(value: AppResource, icon!: AppResource)
```

**Function:** Constructs a SelectOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Content of the dropdown option. |
| icon | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | **Named parameter.** Icon for the dropdown option. |

### enum ArrowPosition

```cangjie
public enum ArrowPosition <: Equatable<ArrowPosition> {
    | END
    | START
    | ...
}
```

**Function:** Alignment between the text and arrow in a dropdown menu item.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ArrowPosition>

#### END

```cangjie
END
```

**Function:** Text first, arrow last.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### START

```cangjie
START
```

**Function:** Arrow first, text last.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(ArrowPosition)

```cangjie
public operator func !=(other: ArrowPosition): Bool
```

**Function:** Checks if two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [ArrowPosition](#enum-arrowposition) | Yes | - | Another enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the enum values are not equal, otherwise `false`. |

#### func ==(ArrowPosition)

```cangjie
public operator func ==(other: ArrowPosition): Bool
```

**Function:** Checks if two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [ArrowPosition](#enum-arrowposition) | Yes | - | Another enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the enum values are equal, otherwise `false`. |

### enum MenuAlignType

```cangjie
public enum MenuAlignType <: Equatable<MenuAlignType> {
    | START
    | CENTER
    | END
    | ...
}
```

**Function:** Menu alignment type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<MenuAlignType>

#### CENTER

```cangjie
CENTER
```

**Function:** Center alignment.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### END

```cangjie
END
```

**Function:** Aligns to the end based on language direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### START

```cangjie
START
```

**Function:** Aligns to the start based on language direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(MenuAlignType)

```cangjie
public operator func !=(other: MenuAlignType): Bool
```

**Function:** Checks if two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [MenuAlignType](#enum-menualigntype) | Yes | - | Another enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the enum values are not equal, otherwise `false`. |

#### func ==(MenuAlignType)

```cangjie
public operator func ==(other: MenuAlignType): Bool
```

**Function:** Checks if two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [MenuAlignType](#enum-menualigntype) | Yes | - | Another enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the enum values are equal, otherwise `false`. |

## Example Code

### Example 1 (Configuring a Dropdown Menu)

This example implements a dropdown menu by configuring SelectOptions.

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
@Entry
@Component
class EntryView {
    @State var text: String = "TTTTT"
    @State var index: Int32 = 2
    @State var space: Int64 = 8

    @State var values1: Array<SelectOption> = [
            SelectOption("aaa", icon: @r(app.media.startIcon)),
            SelectOption("bbb", icon: @r(app.media.startIcon)),
            SelectOption("ccc", icon: @r(app.media.startIcon)),
            SelectOption("ddd", icon: @r(app.media.startIcon))]

    @State var arrow: ArrowPosition = ArrowPosition.END

    func build() {
        Column {
            Select(this.values1)
            .selected(1)
            .value(this.text)
            .font(size: 16.vp, weight: FontWeight.W500)
            .fontColor(0x182431)
            .selectedOptionFont(size: 16.vp, weight: FontWeight.W400)
            .space(this.space)
            .arrowPosition(this.arrow)
            .menuAlign(MenuAlignType.START, offset: MenuOffset(0, 0))
            .optionWidth(200)
            .optionHeight(300)
            .onSelect({ index: Int32, text: String =>
                Hilog.info(0, "AppLogCj", " ==================  Select ====================: ${index}")
                Hilog.info(0, "AppLogCj", " ==================  text ====================: ${text}")
                this.index = index;
                this.text = text;
            })
        }.width(100.percent)
    }
}
```

![selectExample](./figures/selectExample.png)

### Example 2 (Configuring Divider Style)

This example implements custom divider styles.

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row {
            Column {
                Select(
                    [
                        SelectOption("Option 1", icon: ""),
                        SelectOption("Option 2", icon: ""),
                        SelectOption("Option 3", icon: ""),
                        SelectOption("Option 4", icon: "")
                    ]
                )
                    .value("Please select")
                    .divider(
                        options: DividerOptions(strokeWidth: 5, startMargin: 15, endMargin: 1,
                        color: Color(0XFFD700)))
            }.width(100.percent)
        }.height(100.percent)
    }
}
```

![selectSample2](./figures/selectSample2.PNG)### Example 3 (Setting No Divider Style)

This example demonstrates a dropdown menu without dividers by configuring the divider as null.

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row {
            Column {
                Select(
                    [
                        SelectOption("Option 1", icon: ""),
                        SelectOption("Option 2", icon: ""),
                        SelectOption("Option 3", icon: ""),
                        SelectOption("Option 4", icon: "")
                    ]
                ).value("Please select").divider(options: Option.None)
            }.width(100.percent)
        }.height(100.percent)
    }
}
```