# Text Style Settings

Configure text styles for components containing text elements.

## func fontColor(ResourceColor)

```cangjie
public func fontColor(value: ResourceColor): This
```

**Function:** Sets the font color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| value  | [ResourceColor](./cj-common-types.md#interface-resourcecolor)| Yes | \-  | Font color. |

## func fontSize(Length)

```cangjie
public func fontSize(value: Length): This
```

**Function:** Sets the font size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| value  | [Length](./cj-common-types.md#interface-length) | Yes  | \-  | Font size.<br>Unit: fp.<br>Initial value: 16.fp.<br>**Note:** Percentage values are not supported.|

## func fontStyle(FontStyle)

```cangjie
public func fontStyle(value: FontStyle): This
```

**Function:** Sets the font style of the text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| value  | [FontStyle](./cj-common-types.md#enum-fontstyle) | Yes  |-| Font style.</br>Initial value: FontStyle.Normal.|

## func fontWeight(FontWeight)

```cangjie
public func fontWeight(value: FontWeight): This
```

**Function:** Sets the font weight of the text. Setting excessively large values may cause truncation in different fonts.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| value  | [FontWeight](./cj-common-types.md#enum-fontweight) | Yes  |-| Font weight of the text.</br>Initial value: FontStyle.Normal. |

## func fontFamily(String)

```cangjie
public func fontFamily(value: String): This
```

**Function:** Sets the font family list.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| value  | String | Yes  | \-  | Font family list for the text. Default font is 'HarmonyOS Sans'. Currently supports 'HarmonyOS Sans' and registered custom fonts.<br>**Note:** Multiple fonts can be specified using commas, with priority given in order. Example: "Arial, sans-serif". |

## func fontFamily(AppResource)

```cangjie
public func fontFamily(value: AppResource): This
```

**Function:** Sets the font family list for the text based on specified resources.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| value  | [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource) | Yes  | \- | Font family list for the text.<br>**Note:** Multiple fonts can be specified using commas, with priority given in order. Example: "Arial, sans-serif". |

## func lineHeight(value: Length)

```cangjie
public func lineHeight(value: Length): This
```

**Function:** Sets the line height of the text. When set to 0 or less, the line height is not constrained and adapts to the font size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| value  | [Length](./cj-common-types.md#interface-length) | Yes  | \-  | Text line height.<br>Unit: fp.|

## func decoration(TextDecorationType,Color)

```cangjie
public func decoration(decorationType!: TextDecorationType, color!: Color): This
```

**Function:** Sets the text decoration line style and its color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:--- |:---|:---|
| decorationType  | [TextDecorationType](./cj-common-types.md#enum-textdecorationtype) | No  | TextDecorationType.None | **Named parameter.** Text decoration line type.|
| color  | [Color](./cj-common-types.md#Color) | No  | Color.BLACK | **Named parameter.** Text line color.|

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build(): Unit {
        Column() {
            Text("default text")
            Divider()

            Text("text font color red").fontColor(Color.RED)
            Divider()

            Text("text font default")
            Text("text font size 10").fontSize(10)
            Text("text font size 10fp").fontSize(10.fp)
            Text("text font size 20").fontSize(20)
            Divider()

            Text("text font style Italic").fontStyle(FontStyle.Italic)
            Divider()

            Text("text fontWeight bold").fontWeight(FontWeight.Bold)
            Text("text fontWeight lighter").fontWeight(FontWeight.Lighter)
            Divider()

            Text("red 20 Italic bold text")
            .fontColor(Color.RED)
            .fontSize(20)
            .fontStyle(FontStyle.Italic)
            .fontWeight(FontWeight.Bold)
            Divider()

            Text("BLUE 18 Normal text")
            .fontColor(Color.BLUE)
            .fontSize(18)
            .fontStyle(FontStyle.Normal)
        }
    }
}
```

![uni_font_style](figures/uni_font_style.png)