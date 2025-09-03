# SideBarContainer

Provides a sidebar container that can be shown or hidden, with child components defining the sidebar and content area. The first child component represents the sidebar, and the second represents the content area.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

Can contain child components.

> **Note:**
>
> - Child component types: System components and custom components. Rendering control types are not supported ([if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md), [ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md), [LazyForEach](cj-state-rendering-lazyforeach.md)).
> - Number of child components: Must contain exactly 2 child components.
> - Exception handling for child components: If there are 3 or more child components, the first and second will be displayed. If there is only 1 child component, the sidebar will be displayed, and the content area will be blank.

## Creating the Component

### init(SideBarContainerType, () -> Unit)

```cangjie
public init(sideBarType!: SideBarContainerType = SideBarContainerType.Embed, child!: () -> Unit = {=>})
```

**Function:** Creates a sidebar container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| sideBarType | [SideBarContainerType](./cj-grid-layout-sidebar.md#enum-sidebarcontainertype) | Yes | - | Sets the display type of the sidebar.<br/>Default: SideBarContainerType.Embed. |
| child | ()->Unit | No | - | Defines the sidebar and content area. |

## Universal Attributes/Events

Universal attributes: All supported.

Universal events: All supported.

## Component Attributes

### func autoHide(Bool)

```cangjie
public func autoHide(value: Bool): This
```

**Function:** Sets whether the sidebar automatically hides when dragged to a width smaller than the minimum width.

> **Note:**
>
> - Affected by the `minSideBarWidth` property method. If `minSideBarWidth` is not set, the default value is used.
> - Determines whether to auto-hide during dragging. Damping effect triggers hiding when the width is less than the minimum width (exceeding a certain distance).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether the sidebar auto-hides when dragged to a width smaller than the minimum width.<br>true: Auto-hides.<br>false: Does not auto-hide.<br>Default: true. |

### func controlButton(ButtonStyle)

```cangjie
public func controlButton(value: ButtonStyle): This
```

**Function:** Sets the properties of the sidebar control button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ButtonStyle](#class-buttonstyle) | Yes | - | Properties of the sidebar control button. |

### func divider(?DividerStyle)

```cangjie
public func divider(value: ?DividerStyle): This
```

**Function:** Sets the style of the divider.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | ?[DividerStyle](#class-dividerstyle) | Yes | - | **Named parameter.** The style of the divider. The divider is displayed by default. If `None` is input, no action is taken, and the divider style remains consistent with the default. |

### func maxSideBarWidth(Length)

```cangjie
public func maxSideBarWidth(value: Length): This
```

**Function:** Sets the maximum width of the sidebar.

> **Note:**
>
> - If set to a value less than 0, the default value is used. The value cannot exceed the width of the sidebar container itself; if it does, the container's width is used.
> - `maxSideBarWidth` takes precedence over the child component's `maxWidth`. If `maxSideBarWidth` is not set, the default value takes precedence over the child component's `maxWidth`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The maximum width of the sidebar.<br>Default: 280.vp.<br>Unit: vp. |

### func minContentWidth(Length)

```cangjie
public func minContentWidth(value: Length): This
```

**Function:** Sets the minimum displayable width of the content area in the SideBarContainer component.

> **Note:**
>
> - If the minimum width is set to less than 0, the minimum displayable width of the content area is 360.vp. If this property is not set, the content area can shrink to 0.
> - In Embed mode, increasing the component size only increases the content area's size.
> - When reducing the component size, the content area's width is first reduced to `minContentWidth`. Further reduction keeps the content area width at `minContentWidth` and prioritizes reducing the sidebar's width. When the sidebar's width reaches `minSideBarWidth`:
>
>     - If `autoHide` is false, the sidebar width remains at `minSideBarWidth`, and the content area width remains at `minContentWidth`, but the content area may be truncated.
>     - If `autoHide` is true, the sidebar is hidden first, and the content area width continues to shrink until it reaches `minContentWidth`, after which it remains unchanged but may be truncated.
>
> - `minContentWidth` takes precedence over the sidebar's `maxSideBarWidth` and `sideBarWidth` properties. If `minContentWidth` is not set, the default value has lower priority than the set `minSideBarWidth` and `maxSideBarWidth` properties.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The minimum displayable width of the content area.<br>Default: 360.vp.<br>Unit: vp. |

### func minSideBarWidth(Length)

```cangjie
public func minSideBarWidth(value: Length): This
```

**Function:** Sets the minimum width of the sidebar.

> **Note:**
>
> - If set to a value less than 0, the default value is used. The value cannot exceed the width of the sidebar container itself; if it does, the container's width is used.
> - `minSideBarWidth` takes precedence over the child component's `minWidth`. If `minSideBarWidth` is not set, the default value takes precedence over the child component's `minWidth`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The minimum width of the sidebar.<br>Default: 240.vp. |

### func showControlButton(Bool)

```cangjie
public func showControlButton(value: Bool): This
```

**Function:** Sets whether to display the control button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether to display the control button.<br/>true: Displays the control button.<br/>false: Does not display the control button.<br/>Default: true. |

### func showSideBar(Bool)

```cangjie
public func showSideBar(value: Bool): This
```

**Function:** Sets whether to display the sidebar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether to display the sidebar.<br/>true: Displays the sidebar.<br/>false: Does not display the sidebar.<br/>Default: true. |

### func sideBarPosition(SideBarPosition)

```cangjie
public func sideBarPosition(value: SideBarPosition): This
```

**Function:** Sets the display position of the sidebar.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [SideBarPosition](./cj-grid-layout-sidebar.md#enum-sidebarposition) | Yes | - | The display position of the sidebar.<br>Default: SideBarPosition.Start. |

### func sideBarWidth(Length)

```cangjie
public func sideBarWidth(value: Length): This
```

**Function:** Sets the width of the sidebar.

> **Note:**
>
> If set to a value less than 0, the default value is used. Restricted by the minimum and maximum widths; if outside the valid range, the closest valid value is used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The width of the sidebar.<br>Default: 240.vp.<br>Unit: vp. |

## Component Events

### func onChange((Bool) -> Unit)

```cangjie
public func onChange(callback: (Bool) -> Unit): This
```

**Function:** Triggered when the sidebar's state changes between shown and hidden.

> **Note:**
>
> This event is triggered under any of the following conditions:
>
> - When the `showSideBar` property value changes.
> - When the `showSideBar` property's adaptive behavior changes.
> - When dragging the divider triggers `autoHide`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | (Bool)->Unit | Yes | - | Callback function. The parameter is `true` when the sidebar changes from hidden to shown, and `false` when it changes from shown to hidden. |

## Basic Type Definitions

### class ButtonIconOptions

```cangjie
public class ButtonIconOptions {
    public var shown: ResourceStr
    public var hidden: ResourceStr
    public var switching: ResourceStr
    public init(shown!: ResourceStr, hidden!: ResourceStr, switching!: ResourceStr = "")
}
```

**Function:** Sets the icons for the sidebar control button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var hidden

```cangjie
public var hidden: ResourceStr
```

**Function:** Sets the icon for the control button when the sidebar is hidden.

**Type:** [ResourceStr](./cj-common-types.md#interface-resourcestr)

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var shown

```cangjie
public var shown: ResourceStr
```

**Function:** Sets the icon for the control button when the sidebar is shown.

**Type:** [ResourceStr](./cj-common-types.md#interface-resourcestr)

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var switching

```cangjie
public var switching: ResourceStr
```

**Function:** Sets the icon for the control button during the transition between shown and hidden states.

**Type:** [ResourceStr](./cj-common-types.md#interface-resourcestr)

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### init(ResourceStr, ResourceStr, ResourceStr)

```cangjie
public init(shown!: ResourceStr, hidden!: ResourceStr, switching!: ResourceStr = "")
```

**Function:** Constructs a `ButtonIconOptions` object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| shown | [ResourceStr](./cj-common-types.md#interface-resourcestr) | Yes | - | Sets the icon for the control button when the sidebar is shown. |
| hidden | [ResourceStr](./cj-common-types.md#interface-resourcestr) | Yes | - | Sets the icon for the control button when the sidebar is hidden. |
| switching | [ResourceStr](./cj-common-types.md#interface-resourcestr) | No | "" | Sets the icon for the control button during the transition between shown and hidden states. |

### class ButtonStyle

```cangjie
public class ButtonStyle {
    public var left: Float64
    public var top: Float64
    public var width: Float64
    public var height: Float64
    public var icons: ButtonIconOptions
    public init(
        left!: Float64 = 16.0,
        top!: Float64 = 48.0,
        width!: Float64 = 24.0,
        height!: Float64 = 24.0,
        icons!: ButtonIconOptions = ButtonIconOptions(shown: "", hidden: "")
    )
}
```

**Function:** Defines the property type for the sidebar control button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var height

```cangjie
public var height: Float64
```

**Function:** **Named parameter.** Sets the height of the sidebar control button.<br>Unit: vp.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var icons

```cangjie
public var icons: ButtonIconOptions
```

**Function:** **Named parameter.** Sets the icons for the sidebar control button.

**Type:** [ButtonIconOptions](#class-buttoniconoptions)

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var left

```cangjie
public var left: Float64
```

**Function:** **Named parameter.** Sets the left margin of the sidebar control button from the container's left boundary.<br>Unit: vp.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var top

```cangjie
public var top: Float64
```

**Function:** **Named parameter.** Sets the top margin of the sidebar control button from the container's top boundary.<br>Unit: vp.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var width

```cangjie
public var width: Float64
```

**Function:** **Named parameter.** Sets the width of the sidebar control button.<br>Unit: vp.

**Type:** Float64

**Read/Write:** Readable and writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### init(Float64, Float64, Float64, Float64, ButtonIconOptions)

```cangjie
public init(
    left!: Float64 = 16.0,
    top!: Float64 = 48.0,
    width!: Float64 = 24.0,
    height!: Float64 = 24.0,
    icons!: ButtonIconOptions = ButtonIconOptions(shown: "", hidden: "")
)
```

**Function:** Constructs a `ButtonStyle` object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| left | Float64 | No | 16.0 | **Named parameter.** Sets the left margin of the sidebar control button from the container's left boundary.<br>Unit: vp. |
| top | Float64 | No | 48.0 | **Named parameter.** Sets the top margin of the sidebar control button from the container's top boundary.<br>Unit: vp. |
| width | Float64 | No | 24.0 | **Named parameter.** Sets the width of the sidebar control button.<br>Unit: vp. |
| height | Float64 | No | 24.0 | **Named parameter.** Sets the height of the sidebar control button.<br>Unit: vp. |
## Sample Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.LocalizationKit.__GenerateResource__

@Entry
@Component
class EntryView {
    @State var arr: Array<Int64> = [1, 2, 3]
    @State var current: Int64 = 1
    var normalIcon: AppResource = @r(app.media.startIcon)
    let dividerProp = SideBarDividerStyle(strokeWidth: 1.vp, color: Color.Blue, startMargin: 4.vp, endMargin: 4.vp)
    let ctrlButton: ButtonStyle = ButtonStyle(left: 17, top: 49, width: 20, height: 31,
        icons: Icons(shown: "", hidden: "", switching: ""))
    func build() {
        SideBarContainer() {
            Column() {
                ForEach(
                    this.arr,
                    itemGeneratorFunc: {
                        item: Int64, idx: Int64 => Column() {
                            Image(this.normalIcon)
                                .width(50)
                                .height(50)
                            Text("Index${item}")
                                .fontSize(25)
                                .fontColor(0x0A59F7)
                                .fontFamily("source-sans-pro,cursive,sans-serif")
                        }.onClick({
                            event => this.current = idx
                        })
                    }
                )
            }
                .width(100.percent)
                .justifyContent(FlexAlign.SpaceEvenly)
                .backgroundColor(0x19000000)
            Column() {
                Text('SideBarContainer content text1')
                    .fontSize(20)
                Text('SideBarContainer content text2')
                    .fontSize(20)
            }
        }
            .id("SideBarDefault")
            .showSideBar(true)
            .showControlButton(true)
            .divider(value: dividerProp)
            .showControlButton(true)
            .autoHide(false)
            .sideBarWidth(150.vp)
            .minSideBarWidth(50.vp)
            .maxSideBarWidth(300.vp)
            .minContentWidth(1.vp)
            .sideBarPosition(SideBarPosition.Start)
            .controlButton(ctrlButton)
            .width(90.percent)
            .height(85.percent)
    }
}
```

![SideBarContainer](./figures/sidebarcontainer.gif)