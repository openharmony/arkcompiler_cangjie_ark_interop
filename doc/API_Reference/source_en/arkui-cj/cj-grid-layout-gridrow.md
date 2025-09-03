# GridRow

Grid layout provides a structured approach to achieve regularity in layouts, addressing dynamic layout challenges across multiple screen sizes and devices, while ensuring layout consistency for various modules across different devices.

The GridRow container component can only be used in grid layout scenarios alongside its child component ([GridCol](./cj-grid-layout-gridcol.md)).

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

([GridCol](./cj-grid-layout-gridcol.md)) is used in grid layout scenarios.

## Creating Components

### init(Int32, Length, BreakPoints, GridRowDirection, () -> Unit)

```cangjie
public init(
    columns!: Int32 = 12,
    gutter!: Length = 0.vp,
    breakpoints!: BreakPoints = BreakPoints(),
    direction!: GridRowDirection = GridRowDirection.Row,
    child!: () -> Unit = {=>}
)
```

**Function:** Creates a GridRow container that can contain child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| columns | Int32 | No | 12 | **Named parameter.** Sets the number of layout columns.<br>Must be a positive integer. Default: 12. |
| gutter | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** Grid layout spacing, where x represents the horizontal direction.<br>Default: 0. |
| breakpoints | [BreakPoints](#class-breakpoints) | No | BreakPoints() | **Named parameter.** Breakpoint sequence values and their corresponding references based on window or container size.<br>Default:<br>{<br>value: ["320vp", "600vp", "840vp"],reference: BreakpointsReference.WindowSize<br>} |
| direction | [GridRowDirection](#enum-gridrowdirection) | No | GridRowDirection.Row | **Named parameter.** Grid layout arrangement direction. |
| child | ()->Unit | No | { => } | **Named parameter.** Child components of the GridRow container. |

### init(GridRowColumnOption, Length, BreakPoints, GridRowDirection, () -> Unit)

```cangjie
public init(
    columns!: GridRowColumnOption,
    gutter!: Length = 0.vp,
    breakpoints!: BreakPoints = BreakPoints(),
    direction!: GridRowDirection = GridRowDirection.Row,
    child!: () -> Unit = {=>}
)
```

**Function:** Creates a GridRow container that can contain child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| columns | [GridRowColumnOption](#class-gridrowcolumnoption) | Yes | - | **Named parameter.** Sets the number of layout columns. |
| gutter | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** Grid layout spacing, where x represents the horizontal direction.<br>Default: 0. |
| breakpoints | [BreakPoints](#class-breakpoints) | No | BreakPoints() | **Named parameter.** Breakpoint sequence values and their corresponding references based on window or container size.<br>Default:<br>{<br>value: ["320vp", "600vp", "840vp"],reference: BreakpointsReference.WindowSize<br>} |
| direction | [GridRowDirection](#enum-gridrowdirection) | No | GridRowDirection.Row | **Named parameter.** Grid layout arrangement direction. |
| child | ()->Unit | No | { => } | **Named parameter.** Child components of the GridRow container. |

### init(Int32, GutterOption, BreakPoints, GridRowDirection, () -> Unit)

```cangjie
public init(
    columns!: Int32 = 12,
    gutter!: GutterOption,
    breakpoints!: BreakPoints = BreakPoints(),
    direction!: GridRowDirection = GridRowDirection.Row,
    child!: () -> Unit = {=>}
)
```

**Function:** Creates a GridRow container that can contain child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| columns | Int32 | No | 12 | **Named parameter.** Sets the number of layout columns.<br>Must be a positive integer. Default: 12. |
| gutter | [GutterOption](#class-gutteroption) | Yes | - | **Named parameter.** Grid layout spacing, where x represents the horizontal direction. |
| breakpoints | [BreakPoints](#class-breakpoints) | No | BreakPoints() | **Named parameter.** Breakpoint sequence values and their corresponding references based on window or container size.<br>Default:<br>{<br>value: ["320vp", "600vp", "840vp"],reference: BreakpointsReference.WindowSize<br>} |
| direction | [GridRowDirection](#enum-gridrowdirection) | No | GridRowDirection.Row | **Named parameter.** Grid layout arrangement direction. |
| child | ()->Unit | No | { => } | **Named parameter.** Child components of the GridRow container. |

### init(GridRowColumnOption, GutterOption, BreakPoints, GridRowDirection, () -> Unit)

```cangjie
public init(
    columns!: GridRowColumnOption,
    gutter!: GutterOption,
    breakpoints!: BreakPoints = BreakPoints(),
    direction!: GridRowDirection = GridRowDirection.Row,
    child!: () -> Unit = {=>})
```

**Function:** Creates a GridRow container that can contain child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| columns | [GridRowColumnOption](#class-gridrowcolumnoption) | Yes | - | **Named parameter.** Sets the number of layout columns. |
| gutter | [GutterOption](#class-gutteroption) | Yes | - | **Named parameter.** Grid layout spacing, where x represents the horizontal direction. |
| breakpoints | [BreakPoints](#class-breakpoints) | No | BreakPoints() | **Named parameter.** Breakpoint sequence values and their corresponding references based on window or container size.<br>Default:<br>{<br>value: ["320vp", "600vp", "840vp"],reference: BreakpointsReference.WindowSize<br>} |
| direction | [GridRowDirection](#enum-gridrowdirection) | No | GridRowDirection.Row | **Named parameter.** Grid layout arrangement direction. |
| child | ()->Unit | No | { => } | **Named parameter.** Child components of the GridRow container. |

## Common Attributes/Events

Common Attributes: All supported except text styles.

Common Events: All supported.

## Component Attributes

### func alignItems(ItemAlign)

```cangjie
public func alignItems(value: ItemAlign): This
```

**Function:** Sets the vertical main axis alignment of GridCol within GridRow. GridCol can also set its own alignment via alignSelf([ItemAlign](./cj-common-types.md#enum-itemalign)). If both alignment methods are set, the GridCol's own setting takes precedence.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ItemAlign](./cj-common-types.md#enum-itemalign) | Yes | - | Vertical main axis alignment of GridCol within GridRow.<br>Default: ItemAlign.Start<br>**Note:**<br>Supported enums for ItemAlign: ItemAlign.Start, ItemAlign.Center, ItemAlign.End, ItemAlign.Stretch. |

## Component Events

### func onBreakpointChange((String) -> Unit)

```cangjie
public func onBreakpointChange(callback: (String) -> Unit): This
```

**Function:** Triggers a callback when the breakpoint changes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (String)->Unit | Yes | - | Callback triggered when the breakpoint changes. Possible values: "xs", "sm", "md", "lg", "xl", "xxl". |

## Basic Type Definitions

### class BreakPoints

```cangjie
public class BreakPoints {
    public var value: Array<Length>=[320.vp, 600.vp, 840.vp]
    public var reference: BreakpointsReference = BreakpointsReference.WindowSize
    public init(value!: Array<Length> = [320.vp, 600.vp, 840.vp],
        reference!: BreakpointsReference = BreakpointsReference.WindowSize
    )
}
```

**Function:** Constructs breakpoints for the grid container component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var reference

```cangjie
public var reference: BreakpointsReference = BreakpointsReference.WindowSize
```

**Function:** Reference for breakpoint switching.

**Type:** [BreakpointsReference](#enum-breakpointsreference)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var value

```cangjie
public var value: Array<Length>=[320.vp, 600.vp, 840.vp]
```

**Function:** Sets a monotonically increasing array of breakpoint positions.

**Type:** Array\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)>

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Array\<Length>, BreakpointsReference)

```cangjie
public init(value!: Array<Length> = [320.vp, 600.vp, 840.vp],
    reference!: BreakpointsReference = BreakpointsReference.WindowSize
)
```

**Function:** Constructs a BreakPoints object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Array\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)> | No | [320.vp, 600.vp, 840.vp] | **Named parameter.** Sets a monotonically increasing array of breakpoint positions. |
| reference | [BreakpointsReference](#enum-breakpointsreference) | No | BreakpointsReference.WindowSize | **Named parameter.** Reference for breakpoint switching. |

### class GridRowSizeOption

```cangjie
public class GridRowSizeOption {
    public var xs: Length
    public var sm: Length
    public var md: Length
    public var lg: Length
    public var xl: Length
    public var xxl: Length
    public init(
        xs!: Length = 0.vp,
        sm!: Length = 0.vp,
        md!: Length = 0.vp,
        lg!: Length = 0.vp,
        xl!: Length = 0.vp,
        xxl!: Length = 0.vp
    )
    public init(value!: Length = 0.vp)
}
```

**Function:** Defines the gutter size for grids on devices of different widths.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var lg

```cangjie
public var lg: Length
```

**Function:** Large-width type devices.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var md

```cangjie
public var md: Length
```

**Function:** Medium-width type devices.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var sm

```cangjie
public var sm: Length
```

**Function:** Small-width type devices.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var xl

```cangjie
public var xl: Length
```

**Function:** Extra-large-width type devices.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var xs

```cangjie
public var xs: Length
```

**Function:** Minimum-width type devices.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var xxl

```cangjie
public var xxl: Length
```

**Function:** Super-large-width type devices.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Length, Length, Length, Length, Length, Length)

```cangjie
public init(
    xs!: Length = 0.vp,
    sm!: Length = 0.vp,
    md!: Length = 0.vp,
    lg!: Length = 0.vp,
    xl!: Length = 0.vp,
    xxl!: Length = 0.vp
)
```

**Function:** Constructs a GridRowColumnOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| xs | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** Number of columns occupied or offset by the grid child component on xs-sized grid devices. |
| sm | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** Number of columns occupied or offset by the grid child component on sm-sized grid devices. |
| md | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** Number of columns occupied or offset by the grid child component on md-sized grid devices. |
| lg | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** Number of columns occupied or offset by the grid child component on lg-sized grid devices. |
| xl | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** Number of columns occupied or offset by the grid child component on xl-sized grid devices. |
| xxl | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** Number of columns occupied or offset by the grid child component on xxl-sized grid devices. |

#### init(Length)

```cangjie
public init(value!: Length = 0.vp)
```

**Function:** Constructs a GridRowColumnOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | Number of columns occupied or offset by the grid child component on devices of any grid size. |### class GutterOption

```cangjie
public class GutterOption {
    public init(x!: Length, y!: Length)
    public init(x!: GridRowSizeOption, y!: GridRowSizeOption)
}
```

**Description:** Grid layout spacing type, used to describe the spacing between grid subcomponents in different directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Length, Length)

```cangjie
public init(x!: Length, y!: Length)
```

**Description:** Constructs a GutterOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | **Named parameter.** Spacing of grid subcomponents in the x-direction |
| y | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | **Named parameter.** Spacing of grid subcomponents in the y-direction |

#### init(GridRowSizeOption, GridRowSizeOption)

```cangjie
public init(x!: GridRowSizeOption, y!: GridRowSizeOption)
```

**Description:** Constructs a GutterOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [GridRowSizeOption](#class-gridrowsizeoption) | Yes | - | **Named parameter.** Spacing of grid subcomponents in the x-direction |
| y | [GridRowSizeOption](#class-gridrowsizeoption) | Yes | - | **Named parameter.** Spacing of grid subcomponents in the y-direction |

### class GridRowColumnOption

```cangjie
public class GridRowColumnOption {
    public var xs: Int32 = 2
    public var sm: Int32 = 4
    public var md: Int32 = 8
    public var lg: Int32 = 12
    public var xl: Int32 = 12
    public var xxl: Int32 = 12
    public init(
        xs!: Int32 = 2,
        sm!: Int32 = 4,
        md!: Int32 = 8,
        lg!: Int32 = 12,
        xl!: Int32 = 12,
        xxl!: Int32 = 12
    )
    public init(value: Int32)
}
```

**Description:** Number of grid columns under different device width types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var lg

```cangjie
public var lg: Int32 = 12
```

**Description:** **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with lg grid size.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var md

```cangjie
public var md: Int32 = 8
```

**Description:** **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with md grid size.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var sm

```cangjie
public var sm: Int32 = 4
```

**Description:** **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with sm grid size.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var xl

```cangjie
public var xl: Int32 = 12
```

**Description:** **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with xl grid size.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var xs

```cangjie
public var xs: Int32 = 2
```

**Description:** **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with xs grid size.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var xxl

```cangjie
public var xxl: Int32 = 12
```

**Description:** **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with xxl grid size.

**Type:** Int32

**Readable/Writable:** Yes

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Int32, Int32, Int32, Int32, Int32, Int32)

```cangjie
public init(
    xs!: Int32 = 2,
    sm!: Int32 = 4,
    md!: Int32 = 8,
    lg!: Int32 = 12,
    xl!: Int32 = 12,
    xxl!: Int32 = 12
)
```

**Description:** Constructs a GridRowColumnOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| xs | Int32 | No | 2 | **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with xs grid size. |
| sm | Int32 | No | 4 | **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with sm grid size. |
| md | Int32 | No | 8 | **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with md grid size. |
| lg | Int32 | No | 12 | **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with lg grid size. |
| xl | Int32 | No | 12 | **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with xl grid size. |
| xxl | Int32 | No | 12 | **Named parameter.** Number of columns occupied or offset by grid subcomponents on devices with xxl grid size. |

#### init(Int32)

```cangjie
public init(value: Int32)
```

**Description:** Constructs a GridRowColumnOption object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | Number of columns occupied or offset by grid subcomponents on devices of any grid size. |

### enum BreakpointsReference

```cangjie
public enum BreakpointsReference {
    | WindowSize
    | ComponentSize
}
```

**Description:** Sets the reference to either the window or the container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### ComponentSize

```cangjie
ComponentSize
```

**Description:** Reference to the container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### WindowSize

```cangjie
WindowSize
```

**Description:** Reference to the window.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(BreakpointsReference)

```cangjie
public operator func !=(other: BreakpointsReference): Bool
```

**Description:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BreakpointsReference](#enum-breakpointsreference) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(BreakpointsReference)

```cangjie
public operator func ==(other: BreakpointsReference): Bool
```

**Description:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BreakpointsReference](#enum-breakpointsreference) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### enum GridRowDirection

```cangjie
public enum GridRowDirection {
    | Row
    | RowReverse
}
```

**Description:** Arrangement of grid elements in row or column direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Row

```cangjie
Row
```

**Description:** Layout mode where the main axis aligns with the row direction.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RowReverse

```cangjie
RowReverse
```

**Description:** Layout in the opposite direction of Row.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(GridRowDirection)

```cangjie
public operator func !=(other: GridRowDirection): Bool
```

**Description:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [GridRowDirection](#enum-gridrowdirection) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(GridRowDirection)

```cangjie
public operator func ==(other: GridRowDirection): Bool
```

**Description:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [GridRowDirection](#enum-gridrowdirection) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |## Sample Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var bgColors: Array<Color> = [Color.Red, Color.Green, Color.Blue, Color.Gray, Color.Red, Color.Green, Color.Blue, Color.Gray]
    var currentBp: String = ""
    func build() {
        Column {
            GridRow(
                // Set the number of grid columns for different device width types
                // xs: minimum width devices   sm: small width devices    md: medium width devices
                // lg: large width devices     xl: extra large width devices  xxl: super large width devices
                columns: GridRowColumnOption(xs: 6, sm: 7, md: 8, lg: 9, xl: 10, xxl: 11),
                // Set grid layout spacing, x for horizontal, y for vertical
                gutter: GutterOption(x: 5.vp, y: 10.vp),
                // Set breakpoint values and corresponding references based on window or container size
                breakpoints: BreakPoints(
                    // Enable four breakpoints: xs, sm, md, lg
                    value: [200.vp, 300.vp, 400.vp], // Monotonically increasing array for breakpoint positions
                    reference: BreakpointsReference.WindowSize
                ), // Set to use window as reference
                // Set grid layout direction, arranged in row direction
                direction: GridRowDirection.GridRowRow
            ) {
                // Render grids with colors from bgColors
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol() {
                            Row()
                                .width(100.percent)
                                .height(20.vp)
                        }
                        .borderWidth(2.vp)
                        .borderColor(color)
                        .span(1)
                    }
                )
            }
                .width(100.percent)
                .height(200)
                .onBreakpointChange({bp => currentBp = bp})
                .alignItems(ItemAlign.Center) // Set vertical alignment of GridCol within GridRow. Here set to center alignment.

            GridRow(
                // Set layout column count to 5
                columns: 5,
                // Set grid layout spacing, 5vp horizontal, 10vp vertical
                gutter: GutterOption(x: 5.vp, y: 10.vp),
                // Set breakpoint values and corresponding references based on window or container size
                breakpoints: BreakPoints(
                    // Enable four breakpoints: xs, sm, md, lg
                    value: [400.vp, 600.vp, 800.vp], // Monotonically increasing array for breakpoint positions
                    reference: BreakpointsReference.WindowSize // Set to use window as reference
                ),
                direction: GridRowDirection.GridRowRow
            ) {
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol() {
                            Row()
                                .width(100.percent)
                                .height(20.vp)
                        }
                        .borderWidth(2.vp)
                        .borderColor(color)
                        .span(GridColColumnOption(xs: 2, sm: 3, md: 4, lg: 5, xl: 6, xxl: 7))
                    }
                )
            }
            .width(100.percent)
            .height(100.percent)
            .onBreakpointChange({bp => currentBp = bp})
            .alignItems(ItemAlign.Center)
        }
        .margin(left: 10, right: 10, top: 5, bottom: 5)
        .height(400)
    }
}
```

![grid_row](./figures/grid_row.png)