# Slider

The slider component is typically used for quick adjustment of settings, such as volume control, brightness adjustment, and similar application scenarios.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Subcomponents

None

## Creating the Component

### init(Float64, Float64, Float64, Float64, SliderStyle, Axis, Bool)

```cangjie
public init(
    min!: Float64 = 0.0,
    max!: Float64 = 100.0,
    step!: Float64 = 1.0,
    value!: Float64 = min,
    style!: SliderStyle = SliderStyle.OutSet,
    direction!: Axis = Axis.Horizontal,
    reverse!: Bool = false
)
```

**Function:** Creates a slider component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type      | Required | Default Value | Description |
|:--------------|:----------|:---------|:--------------|:------------|
| min           | Float64   | No       | 0.0           | **Named parameter.** Sets the minimum value. |
| max           | Float64   | No       | 100.0         | **Named parameter.** Sets the maximum value.<br>Initial value: 100.<br>**Note:**<br>If min >= max, the initial values are used (min = 0, max = 100).<br>If value is outside [min, max], it is clamped to min or max (whichever is closer). |
| step          | Float64   | No       | 1.0           | **Named parameter.** Sets the step size for slider movement.<br>**Note:**<br>If step <= 0 or step >= (max - min), the initial value is used. |
| value         | Float64   | No       | min           | **Named parameter.** The current progress value. |
| style         | [SliderStyle](#enum-sliderstyle) | No | SliderStyle.OutSet | **Named parameter.** Sets the slider's thumb style. |
| direction     | [Axis](./cj-common-types.md#enum-axis) | No | Axis.Horizontal | **Named parameter.** Sets the slider's direction (horizontal or vertical). |
| reverse       | Bool      | No       | false         | **Named parameter.** Sets whether the slider's value range is reversed.<br>**Note:**<br>When false, horizontal sliders move left to right, and vertical sliders move top to bottom.<br>When true, horizontal sliders move right to left, and vertical sliders move bottom to top. |

## Common Attributes/Events

Common Attributes: Supports all common attributes except touch hot zones.

Common Events: Fully supported.

## Component Attributes

### func blockBorderColor(ResourceColor)

```cangjie
public func blockBorderColor(value: ResourceColor): This
```

**Function:** Sets the border color of the slider thumb.

When the slider thumb shape is set to SliderBlockType.DEFAULT, `blockBorderColor` sets the border color of the default circular thumb.

When the slider thumb shape is set to SliderBlockType.IMAGE, the thumb has no border, and `blockBorderColor` has no effect.

When the slider thumb shape is set to SliderBlockType.SHAPE, `blockBorderColor` sets the color of the lines in the custom shape.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| value | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | The border color of the slider thumb.<br>Initial value: 0x00000000. |

### func blockColor(ResourceColor)

```cangjie
public func blockColor(value: ResourceColor): This
```

**Function:** Sets the fill color of the slider thumb.

When the slider thumb shape is set to SliderBlockType.DEFAULT, `blockColor` sets the fill color of the default circular thumb.

When the slider thumb shape is set to SliderBlockType.IMAGE, the thumb has no fill, and `blockColor` has no effect.

When the slider thumb shape is set to SliderBlockType.SHAPE, `blockColor` sets the fill color of the custom shape.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| value | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | The fill color of the slider thumb.<br>Initial value: @r(sys.color.ohos_id_color_foreground_contrary). |

### func selectedColor(ResourceColor)

```cangjie
public func selectedColor(value: ResourceColor): This
```

**Function:** Sets the color of the filled portion of the slider track.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| value | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | The color of the filled portion of the track.<br>Initial value: @r(sys.color.ohos_id_color_emphasize). |

### func showSteps(Bool)

```cangjie
public func showSteps(value: Bool): This
```

**Function:** Sets whether to display step markers.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| value | Bool | Yes | - | Whether to display step markers.<br>Initial value: false. |

### func showTips(Bool, ?ResourceStr)

```cangjie
public func showTips(value: Bool, content!: ?ResourceStr = None): This
```

**Function:** Sets whether to display a tooltip bubble during sliding.

When `direction` is Axis.Horizontal, the tooltip appears above the thumb (or below if space is insufficient). When `direction` is Axis.Vertical, the tooltip appears to the left of the thumb (or to the right if space is insufficient). If margins are small or unset, the tooltip may be clipped.

The tooltip is drawn in the overlay area of the Slider node.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| value | Bool | Yes | - | Whether to display a tooltip bubble during sliding.<br>Initial value: false. |
| content | ?[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | None | **Named parameter.** The text content of the tooltip. Defaults to the current percentage. |

### func trackColor(ResourceColor)

```cangjie
public func trackColor(value: ResourceColor): This
```

**Function:** Sets the background color of the slider track.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| value | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | The background color of the track.<br>**Note:**<br>For gradient colors, invalid color stops or empty gradient stops will disable the gradient effect.<br>Initial value: @r(sys.color.ohos_id_color_component_normal). |

### func trackThickness(Length)

```cangjie
public func trackThickness(value: Length): This
```

**Function:** Sets the thickness of the slider track. Values ≤ 0 will revert to the initial value.

To maintain the SliderStyle appearance, the thumb size (`blockSize`) scales proportionally with `trackThickness`.

For SliderStyle.OutSet, the ratio is trackThickness : blockSize = 1 : 4. For SliderStyle.InSet, the ratio is 5 : 3.

If `trackThickness` or `blockSize` exceeds the slider's width or height (especially for SliderStyle.OutSet), the initial values are used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The thickness of the track.<br>Initial value: 4.0.vp for SliderStyle.OutSet, 20.0.vp for SliderStyle.InSet. |

## Component Events

### func onChange((Float64,SliderChangeMode) -> Unit)

```cangjie
public func onChange(callback: (Float64, SliderChangeMode) -> Unit): This
```

**Function:** Triggers an event callback when the slider is dragged or clicked.

The Begin and End states trigger on gesture/mouse down and up. Moving and Click states trigger when the value changes.

A continuous drag action does not trigger the Click state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| callback | (Float64, [SliderChangeMode](#enum-sliderchangemode)) -> Unit | Yes | - | Callback triggered when the slider is dragged or clicked.<br>Parameter 1: Current progress value, constrained by the step size.<br>Parameter 2: The event's trigger state. |

## Basic Type Definitions

### enum SliderChangeMode

```cangjie
public enum SliderChangeMode <: Equatable<SliderChangeMode> {
    | Begin
    | Moving
    | End
    | Click
    | ...
}
```

**Function:** The trigger states for slider drag or click events.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parent Type:**

- Equatable\<SliderChangeMode>

#### Begin

```cangjie
Begin
```

**Function:** Gesture/mouse contact or press on the slider thumb.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### Click

```cangjie
Click
```

**Function:** Clicking the slider track to move the thumb.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### End

```cangjie
End
```

**Function:** Gesture/mouse release from the slider thumb.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### Moving

```cangjie
Moving
```

**Function:** The thumb is being dragged.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### func !=(SliderChangeMode)

```cangjie
public operator func !=(other: SliderChangeMode): Bool
```

**Function:** Checks if two enum values are unequal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| other | [SliderChangeMode](#enum-sliderchangemode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:-----|:------------|
| Bool | Returns true if unequal, false otherwise. |

#### func ==(SliderChangeMode)

```cangjie
public operator func ==(other: SliderChangeMode): Bool
```

**Function:** Checks if two enum values are equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| other | [SliderChangeMode](#enum-sliderchangemode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:-----|:------------|
| Bool | Returns true if equal, false otherwise. |

### enum SliderStyle

```cangjie
public enum SliderStyle <: Equatable<SliderStyle> {
    | OutSet
    | InSet
    | ...
}
```

**Function:** The display style of the slider thumb and track.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parent Type:**

- Equatable\<SliderStyle>

#### InSet

```cangjie
InSet
```

**Function:** The thumb is inset within the track.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### OutSet

```cangjie
OutSet
```

**Function:** The thumb is overlaid on the track.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### func !=(SliderStyle)

```cangjie
public operator func !=(other: SliderStyle): Bool
```

**Function:** Checks if two enum values are unequal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| other | [SliderStyle](#enum-sliderstyle) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:-----|:------------|
| Bool | Returns true if unequal, false otherwise. |

#### func ==(SliderStyle)

```cangjie
public operator func ==(other: SliderStyle): Bool
```

**Function:** Checks if two enum values are equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:---------|:--------------|:------------|
| other | [SliderStyle](#enum-sliderstyle) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:-----|:------------|
| Bool | Returns true if equal, false otherwise. |## Sample Code

### Example 1 (Basic Slider Styles)

This example controls the display of tooltips, scale values, sliders, and tracks by configuring `style`, `showTips`, and `showSteps`.

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
internal import ohos.base.*
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage
internal import ohos.arkui.ui_context.*

@Entry
@Component
class EntryView {
    @State var outSetValueOne: Float64 = 40.00
    @State var inSetValueOne: Float64 = 40.00
    @State var noneValueOne: Float64 = 40.00
    @State var outSetValueTwo: Float64 = 40.00
    @State var inSetValueTwo: Float64 = 40.00
    @State var vOutSetValueOne: Float64 = 40.00
    @State var vInSetValueOne: Float64 = 40.00
    @State var vOutSetValueTwo: Float64 = 40.00
    @State var vInSetValueTwo: Float64 = 40.00

    func build() {
        Column {
            Text('outset slider').fontSize(9).fontColor(0xCCCCCC).width(90.percent).margin(15)
            Row {
                Slider(
                    value: this.outSetValueOne,
                    min: 0.0,
                    max: 100.0,
                    style: SliderStyle.OutSet
                ).showTips(true).onChange({
                    value: Float64, mode: SliderChangeMode => this.outSetValueOne = value
                })
                Text("${Int64(this.outSetValueOne)}").fontSize(12)
            }.width(80.percent)
            Row() {
                Slider(
                    value: this.outSetValueTwo,
                    step: 10.0,
                    style: SliderStyle.OutSet
                ).showSteps(true).onChange({
                    value: Float64, mode: SliderChangeMode => this.outSetValueTwo = value
                })
                Text("${Int64(this.outSetValueTwo)}").fontSize(12)
            }.width(80.percent)

            Text('inset slider').fontSize(9).fontColor(0xCCCCCC).width(90.percent).margin(15)
            Row() {
                Slider(
                    value: this.inSetValueOne,
                    min: 0.0,
                    max: 100.0,
                    style: SliderStyle.InSet
                )
                    .blockColor(0x191970)
                    .trackColor(0xADD8E6)
                    .selectedColor(0x4169E1)
                    .showTips(true)
                    .onChange({
                        value: Float64, mode: SliderChangeMode => this.inSetValueOne = value
                    })
                Text("${Int64(this.inSetValueOne)}").fontSize(12)
            }.width(80.percent)
            Row() {
                Slider(
                    value: this.inSetValueTwo,
                    step: 10.0,
                    style: SliderStyle.InSet
                )
                    .blockColor(0x191970)
                    .trackColor(0xADD8E6)
                    .selectedColor(0x4169E1)
                    .showSteps(true)
                    .onChange({
                        value: Float64, mode: SliderChangeMode => this.inSetValueTwo = value
                    })
                Text("${Int64(this.inSetValueTwo)}").fontSize(12)
            }.width(80.percent)

            Text('none slider').fontSize(9).fontColor(0xCCCCCC).width(90.percent).margin(15)
            Row() {
                Slider(
                    value: this.noneValueOne,
                    min: 0.0,
                    max: 100.0,
                    style: SliderStyle.NONE
                )
                    .blockColor(0x191970)
                    .trackColor(0xADD8E6)
                    .selectedColor(0x4169E1)
                    .showTips(true)
                    .onChange({
                        value: Float64, mode: SliderChangeMode => this.noneValueOne = value
                    })
                Text("${Int64(this.noneValueOne)}").fontSize(12)
            }.width(80.percent)

            Row() {
                Column() {
                    Text('vertical outset slider').fontSize(9).fontColor(0xCCCCCC).width(50.percent).margin(15)
                    Row() {
                        Text("").width(10.percent)
                        Slider(
                            value: this.vOutSetValueOne,
                            style: SliderStyle.OutSet,
                            direction: Axis.Vertical
                        )
                            .blockColor(0x191970)
                            .trackColor(0xADD8E6)
                            .selectedColor(0x4169E1)
                            .showTips(true)
                            .onChange({
                                value: Float64, mode: SliderChangeMode => this.vOutSetValueOne = value
                            })
                        Slider(
                            value: this.vOutSetValueTwo,
                            step: 10.0,
                            style: SliderStyle.OutSet,
                            direction: Axis.Vertical
                        )
                            .blockColor(0x191970)
                            .trackColor(0xADD8E6)
                            .selectedColor(0x4169E1)
                            .showSteps(true)
                            .onChange({
                                value: Float64, mode: SliderChangeMode => this.vOutSetValueTwo = value
                            })
                    }
                }.width(50.percent).height(300)

                Column() {
                    Text('vertical inset slider').fontSize(9).fontColor(0xCCCCCC).width(50.percent).margin(15)
                    Row() {
                        Slider(
                            value: this.vInSetValueOne,
                            style: SliderStyle.InSet,
                            direction: Axis.Vertical,
                            reverse: true // Vertical sliders default to min value at the top and max value at the bottom. To slide from bottom to top, set reverse to true
                        )
                            .showTips(true)
                            .onChange({
                                value: Float64, mode: SliderChangeMode => this.vInSetValueOne = value
                            })
                        Slider(
                            value: this.vInSetValueTwo,
                            step: 10.0,
                            style: SliderStyle.InSet,
                            direction: Axis.Vertical,
                            reverse: true
                        )
                            .showSteps(true)
                            .onChange({
                                value: Float64, mode: SliderChangeMode => this.vInSetValueTwo = value
                            })
                    }
                }.width(50.percent).height(300)
            }
        }.width(100.percent)
    }
}
```

![slider](figures/slider1.gif)

### Example 2 (Customizing Slider Styles)

This example sets the slider style via `blockBorderColor`, `blockSize`, `blockBorderWidth`, and `blockStyle`, configures scale value styles using `stepSize` and `stepColor`, adjusts track corner radius with `trackBorderRadius`, and modifies the selected section's corner radius with `selectedBorderRadius`.

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
internal import kit.LocalizationKit.{AppResource, __GenerateResource__}

@Entry
@Component
class EntryView {
    @State var tipsValue: Float64 = 40.0

    func build() {
        Column {
            Text('block').fontSize(9).fontColor(0xCCCCCC).margin(15).width(90.percent)
            Slider(style: SliderStyle.OutSet, value: 40.0)
                .blockSize(width: 40.0, height: 40.0)
                .blockBorderColor(Color.Red)
                .blockBorderWidth(5)
            Divider()
            Text('step').fontSize(9).fontColor(0xCCCCCC).margin(15).width(90.percent)
            Slider(style: SliderStyle.InSet, value: 40.0, step: 10.0).showSteps(true).stepSize(8).stepColor(0xFFFF00)
            Divider()
            Text('track').fontSize(9).fontColor(0xCCCCCC).margin(15).width(90.percent)
            Slider(style: SliderStyle.InSet, value: 40.0).trackBorderRadius(2)
            Divider()
            Text('selected').fontSize(9).fontColor(0xCCCCCC).margin(15).width(90.percent)
            Slider(style: SliderStyle.InSet, value: 40.0).selectedBorderRadius(2)
            Divider()
            Text('blockStyle').fontSize(9).fontColor(0xCCCCCC).margin(15).width(90.percent)
            Slider(style: SliderStyle.OutSet, value: 40.0).blockStyle(SliderBlockType.DEFAULT)
            Slider(style: SliderStyle.OutSet, value: 40.0).blockStyle(SliderBlockType.IMAGE,
                image: @r(app.media.startIcon))
            //            .blockStyle( SliderBlockType.IMAGE, image: "app.media.startIcon" )
            Slider(style: SliderStyle.OutSet, value: 40.0)
                .blockSize(width: 60.px, height: 60.px)
                .blockColor(Color.Red)
                .blockStyle(SliderBlockType.SHAPE, shape: PathShape(commands: 'M60 60 M30 30 L15 56 L45 56 Z'))
            Divider()
            Text('tips').fontSize(9).fontColor(0xCCCCCC).margin(15).width(90.percent)
            Slider(style: SliderStyle.InSet, value: this.tipsValue)
                .showTips(true, content: "${Int64(this.tipsValue)}")
                .onChange({
                    value: Float64, mode: SliderChangeMode => this.tipsValue = value
                })
        }
    }
}
```

![slider](figures/slider2.png)