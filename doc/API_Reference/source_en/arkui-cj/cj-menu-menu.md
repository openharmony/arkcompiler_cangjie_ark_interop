# Menu

A menu displayed in a vertical list format.

> **Note:**
>
> The Menu component must be used in conjunction with the [bindMenu](cj-universal-attribute-menu.md#func-bindmenu---unit) or [bindContextMenu](cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype) methods and cannot be used as a standalone regular component.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

Includes [MenuItem](cj-menu-menuitem.md) and [MenuItemGroup](cj-menu-menuitemgroup.md) child components.

## Creating the Component

### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**Function:** Creates a menu with child components.

> **Note:**
>
> Menu and menu item width calculation rules:<br/>During layout, it is expected that each menu item has consistent width. If a child component sets a width, it follows the [size calculation rules](./cj-universal-attribute-size.md#func-constraintsizelength-length-length-length).<br/>When width is not set: The menu component will apply a default width of 2 grid units to child components MenuItem and MenuItemGroup. If the content area of a menu item is wider than 2 grid units, it will adaptively expand.<br/>When width is set: The menu component will apply a fixed width (minus padding) to child components MenuItem and MenuItemGroup.<br/>When setting the Menu border [width](./cj-universal-attribute-size.md#func-widthlength), the minimum supported width is 64vp.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type      | Required | Default | Description                     |
|:---------|:---------|:--------|:-------|:-------------------------------|
| child    | ()->Unit | Yes      | -      | Declares the child components within the container. |

## Universal Attributes/Events

Universal Attributes: All supported.

Universal Events: All supported.

## Component Attributes

### func font(Length, FontWeight, String, FontStyle)

```cangjie
public func font(
    size!: Length = 16.vp,
    weight!: FontWeight = FontWeight.Normal,
    family!: String = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal
): This
```

**Function:** Sets the size of all text in the Menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type                                      | Required | Default            | Description                                                                 |
|:---------|:-----------------------------------------|:--------|:------------------|:---------------------------------------------------------------------------|
| size     | [Length](<font color="red" face="bold">please add link</font>) | No       | 16.vp             | **Named parameter.** Sets the text size. When Length is Int64 or Float64, the unit is fp. Percentage values are not supported. |
| weight   | [FontWeight](<font color="red" face="bold">please add link</font>) | No       | FontWeight.Normal | **Named parameter.** Sets the font weight of the text.                     |
| family   | String                                   | No       | "HarmonyOS Sans"  | **Named parameter.** Sets the font family list for the text. Multiple fonts can be specified, separated by commas, with priority in order. Example: 'Arial, HarmonyOS Sans'. Currently supports 'HarmonyOS Sans' and [custom font registration](https://gitcode.com/Cangjie/cangjie-ohos-docs/blob/main/docs/API_Reference/source_zh_cn/arkui-cj/cj-apis-font.md). |
| style    | [FontStyle](<font color="red" face="bold">please add link</font>) | No       | FontStyle.Normal  | **Named parameter.** Sets the font style of the text.                      |

### func font(Length, FontWeight, AppResource, FontStyle)

```cangjie
public func font(
    size!: Length = 16.vp,
    weight!: FontWeight = FontWeight.Normal,
    family!: AppResource,
    style!: FontStyle = FontStyle.Normal
): This
```

**Function:** Sets the size of all text in the Menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type                                      | Required | Default            | Description                                                                 |
|:---------|:-----------------------------------------|:--------|:------------------|:---------------------------------------------------------------------------|
| size     | [Length](<font color="red" face="bold">please add link</font>) | No       | 16.vp             | **Named parameter.** Sets the text size. When Length is Int64 or Float64, the unit is fp. Percentage values are not supported. |
| weight   | [FontWeight](<font color="red" face="bold">please add link</font>) | No       | FontWeight.Normal | **Named parameter.** Sets the font weight of the text.                     |
| family   | [AppResource](<font color="red" face="bold">please add link</font>) | Yes      | -                 | **Named parameter.** Sets the font family list for the text. Multiple fonts can be specified, separated by commas, with priority in order. Example: 'Arial, HarmonyOS Sans'.<br/>Initial value: 'HarmonyOS Sans'.<br/>Currently supports 'HarmonyOS Sans' and [custom font registration](<font color="red" face="bold">please add link</font>). |
| style    | [FontStyle](<font color="red" face="bold">please add link</font>) | No       | FontStyle.Normal  | **Named parameter.** Sets the font style of the text.                      |

### func fontColor(ResourceColor)

```cangjie
public func fontColor(color: ResourceColor): This
```

**Function:** Uniformly sets the color of all text in the Menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type                                                                 | Required | Default     | Description                                      |
|:---------|:--------------------------------------------------------------------|:--------|:-----------|:------------------------------------------------|
| color    | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes      | -          | The color of all text in the Menu.<br/>Initial value: 0xE5000000 |

### func radius(Length)

```cangjie
public func radius(value: Length): This
```

**Function:** Sets the border radius of the Menu.

> **Note:**
>
> If the sum of the horizontal radii exceeds the menu width or the sum of the vertical radii exceeds the menu height, the default border radius value for the menu will be applied to all four corners.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type                                      | Required | Default | Description                                      |
|:---------|:-----------------------------------------|:--------|:-------|:------------------------------------------------|
| value    | [Length](<font color="red" face="bold">please add link</font>) | Yes      |        | The border radius of the Menu.<br/>Initial value: 20.vp. |

### func radius(BorderRadiuses)

```cangjie
public func radius(value: BorderRadiuses): This
```

**Function:** Sets the border radius of the Menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type                                      | Required | Default | Description                     |
|:---------|:-----------------------------------------|:--------|:-------|:-------------------------------|
| value    | [BorderRadiuses](<font color="red" face="bold">please add link</font>) | Yes      | -      | The border radius of the Menu. |

## Example Code

This example demonstrates a multi-level menu by configuring the `builder` parameter in MenuItem.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    @State
    var select: Bool = true
    let iconStr: AppResource = @r(app.media.startIcon)
    var iconStr2: AppResource = @r(app.media.right)

    @Builder
    func SubMenu() {
        Menu() {
            MenuItem(startIcon: "", content: "Copy", endIcon: "", labelInfo: "Ctrl+C")
            MenuItem(startIcon: "", content: "Paste", endIcon: "", labelInfo: "Ctrl+V")
        }
    }

    @Builder
    func MyMenu() {
        Menu() {
            MenuItem(startIcon: @r(app.media.startIcon), content: @r(app.string.contentName),
                endIcon: @r(app.media.blank), labelInfo: @r(app.string.emptyName))
            MenuItem(startIcon: @r(app.media.startIcon), content: @r(app.string.contentName),
                endIcon: @r(app.media.blank), labelInfo: @r(app.string.emptyName)).enabled(false)
            MenuItem(
                startIcon: this.iconStr,
                content: @r(app.string.contentName),
                endIcon: this.iconStr,
                labelInfo: @r(app.string.emptyName),
                builder: {=> bind(this.SubMenu, this)()}
            )
            MenuItemGroup(header: "Subtitle", footer: "") {
                =>
                MenuItem(
                    startIcon: this.iconStr,
                    content: @r(app.string.contentName),
                    endIcon: @r(app.string.emptyName),
                    labelInfo: @r(app.string.emptyName),
                    builder: {=> bind(this.SubMenu, this)()}
                    )
                MenuItem(
                    startIcon: @r(app.media.startIcon),
                    content: @r(app.string.contentName),
                    endIcon: @r(app.media.right),
                    labelInfo: @r(app.string.emptyName),
                    builder: {=> bind(this.SubMenu, this)()}
                )
                MenuItem(
                startIcon: "",
                content: "Menu Option",
                endIcon: "",
                labelInfo: "",
                ).selectIcon(true).selected(
                    select).onChange({
                    selected => iconStr2 = @r(app.media.foreground)
                })
            }

        }
    }

    func build() {
        Row() {
            Column() {
                Text("click to show menu")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
            }.bindMenu(builder: this.MyMenu).width(50.percent)
        }.height(100.percent)
    }
}
```

![menu](<font color="red" face="bold">please add link</font>)