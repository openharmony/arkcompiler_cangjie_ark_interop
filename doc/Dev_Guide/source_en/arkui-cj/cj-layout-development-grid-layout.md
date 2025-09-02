# Grid Layout (GridRow/GridCol)

## Overview

Grid layout is a universal auxiliary positioning tool that serves as a good reference for mobile device interface design. Its main advantages include:

1. **Provides structured regularity**: Grid layout offers a regular structural framework for layouts, solving dynamic layout challenges across multiple sizes and devices. By dividing the page into equal-width columns and rows, it facilitates precise positioning and typesetting of page elements.

2. **Unified positioning reference**: Grid layout provides a standardized positioning reference for systems, ensuring layout consistency across modules on different devices. This reduces design and development complexity while improving efficiency.

3. **Flexible spacing adjustment**: Grid layout enables flexible spacing adjustments to meet special layout requirements. By modifying column and row gaps, the overall typesetting effect can be controlled.

4. **Auto-wrapping and responsiveness**: Grid layout supports auto-wrapping and adaptive behavior for one-to-many layouts. When elements exceed the capacity of a row or column, they automatically wrap to the next line while maintaining responsive adaptation across devices, resulting in more flexible and adaptable page layouts.

[GridRow](../../../API_Reference/source_zh_cn/arkui-cj/cj-grid-layout-gridrow.md) serves as the grid container component and must be used in conjunction with the grid child component [GridCol](../../../API_Reference/source_zh_cn/arkui-cj/cj-grid-layout-gridcol.md) in grid layout scenarios.

## Grid Container GridRow

### Grid System Breakpoints

The grid system uses the device's horizontal width ([screen density pixel value](../../../API_Reference/source_zh_cn/arkui-cj/cj-common-pixelunits.md), in vp units) as the basis for breakpoints, defining device width types and establishing a set of breakpoint rules. Developers can implement different page layouts for different breakpoint ranges as needed.

The default grid system breakpoints categorize device widths into four types: xs, sm, md, and lg, with the following size ranges:

| Breakpoint | Range (vp)        | Device Description      |
|:---- |:--------------- |:--------- |
| xs   | [0, 320)   | Extra-small width devices. |
| sm   | [320, 520) | Small width devices.  |
| md   | [520, 840) | Medium width devices. |
| lg   | [840, +∞)  | Large width devices.  |

In the GridRow component, developers can customize breakpoint ranges using `breakpoints`, supporting up to six breakpoints. In addition to the default four, xl and xxl can be enabled, allowing layout configurations for six device sizes (xs, sm, md, lg, xl, xxl).

| Breakpoint | Device Description      |
|:---- |:--------- |
| xs   | Extra-small width devices. |
| sm   | Small width devices.  |
| md   | Medium width devices. |
| lg   | Large width devices.  |
| xl   | Extra-large width devices. |
| xxl  | Super-large width devices. |

- For breakpoint positions, developers can specify a monotonically increasing array based on actual usage scenarios. Since `breakpoints` supports up to six breakpoints, the array length is capped at 5.

    ```cangjie
    breakpoints: BreakPoints(value: [100.vp, 200.vp])
    ```

    Enables xs, sm, and md breakpoints: xs for <100.vp, sm for 100.vp-200.vp, and md for >200.vp.

    ```cangjie
    breakpoints: BreakPoints(value: [320.vp, 520.vp, 840.vp, 1080.vp])
    ```

    Enables xs, sm, md, lg, and xl breakpoints: xs for <320.vp, sm for 320.vp-520.vp, md for 520.vp-840.vp, lg for 840.vp-1080.vp, and xl for >1080.vp.

- The grid system monitors window or container size changes for breakpoints, with `reference` specifying the breakpoint reference. Since apps may display in non-fullscreen windows, using the app window width as the reference is more versatile.

    Example: Using the default 12-column grid, breakpoints divide the app width into six intervals, with each grid child occupying different columns per interval.

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        @State
        var bgColors: Array<Color> = [Color(213,213,213), Color(150,150,150), Color(0,74,175), Color(39,135,217), Color(61,157,180), Color(23,169,141), Color(255,192,0), Color(170,10,33)];
        func build() {
            GridRow(
                columns: 12,
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp, 500.vp, 600.vp],
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.GridRowRow
            ) {
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol() {
                            Row() {
                                Text(index.toString())
                            }
                        }
                            .width(100.percent)
                            .height(50.vp)
                            .backgroundColor(color)
                            .span(GridColColumnOption(xs: 2, sm: 3, md: 4, lg: 6, xl:   8, xxl: 12))
                    }
                )
            }
        }
    }
    ```

    ![Grid](figures/Grid.PNG)

### Total Number of Columns

The `columns` property in GridRow sets the total number of columns in the grid layout.

- Default `columns` value is 12, meaning the layout is divided into 12 columns at all breakpoints if unspecified.

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        @State
        var bgColors: Array<Color> = [Color(213,213,213), Color(150,150,150), Color(0,74,175), Color(39,135,217), Color(61,157,180), Color(23,169,141), Color(255,192,0),Color(170,10,33),Color(213,213,213),Color(150,150,150), Color(0,74,175), Color(39,135,217)];
        func build() {
            GridRow(columns: GridRowColumnOption(xs: 12, sm: 12, md: 12, lg: 12, xl:    12, xxl: 12)) {
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol() {
                            Row() {
                                Text(index.toString())
                            }
                            .width(100.percent)
                            .height(50)
                        }.backgroundColor(color)
                    }
                )
            }
        }
    }
    ```

    ![Grid1](figures/Grid1.png)

- Custom `columns` value divides the layout into the specified number of columns across all devices. Below examples show layouts with 4 and 8 columns, where child elements occupy one column by default:

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        var bgColors: Array<Color> = [Color(213,213,213), Color(150,150,150), Color(0,74,175), Color(39,135,217), Color(61,157,180), Color(23,169,141), Color(255,192,0), Color(170,10,33)];
        @State
        var currentBp: String = "";
        func build() {
            Column {
                Text("columns: 4")
                    .fontSize(20)
                    .fontColor(Color.BLACK)
                    .width(90.percent)
                Row() {
                    GridRow(columns: 4) {
                        ForEach(
                            bgColors,
                            itemGeneratorFunc: {
                                color: Color, index: Int64 => GridCol() {
                                    Row() {
                                        Text(index.toString())
                                    }
                                        .width(100.percent)
                                        .height(50)
                                }.backgroundColor(color)
                            }
                        )
                    }
                    .width(100.percent)
                    .height(100.percent)
                    .onBreakpointChange({bp => currentBp = bp})
                }
                .height(160)
                .border(color: Color.BLUE, width: 2)
                .width(90.percent)
                Text("columns: 8")
                    .fontSize(20)
                    .fontColor(Color.BLACK)
                    .width(90.percent)
                Row() {
                    GridRow(columns: 8) {
                        ForEach(
                            bgColors,
                            itemGeneratorFunc: {
                                color: Color, index: Int64 => GridCol() {
                                    Row() {
                                        Text(index.toString())
                                    }
                                        .width(100.percent)
                                        .height(50)
                                }.backgroundColor(color)
                            }
                        )
                    }
                    .width(100.percent)
                    .height(100.percent)
                    .onBreakpointChange({bp => currentBp = bp})
                }
                .height(160)
                .border(color: Color.BLUE, width: 2)
                .width(90.percent)
            }
        }
    }
    ```

    ![Grid2](figures/Grid2.png)

- When `columns` is of type `GridRowColumnOption`, it supports column count configuration for six device sizes (xs, sm, md, lg, xl, xxl), with different values per size.

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        @State
        var bgColors: Array<Color> = [Color(213,213,213), Color(150,150,150), Color(0,74,175), Color(39,135,217), Color(61,157,180), Color(23,169,141), Color(255,192,0), Color(170,10,33)];
        func build() {
            GridRow(
                columns: GridRowColumnOption(xs: 12, sm: 4, md: 8, lg: 12, xl: 12,  xxl: 12),
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp, 500.vp, 600.vp], // Monotonically increasing array for breakpoints.
                    reference: BreakpointsReference.WindowSize
                )
            ) {
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol() {
                            Row() {
                                Text(index.toString())
                            }
                            .width(100.percent)
                            .height(50.vp)
                        }.backgroundColor(color)
                    }
                )
            }
        }
    }
    ```

    ![Grid3](figures/Grid3.PNG)

    If only sm and md column counts are set, smaller sizes default to 12 columns, while larger sizes inherit the previous size's setting (e.g., xs:12, lg/xl/xxl:8 if only sm:4 and md:8 are specified).

### Arrangement Direction

The `direction` property in GridRow specifies the arrangement direction of child components within the container. Options are `GridRowDirection.Row` (left-to-right) or `GridRowDirection.RowReverse` (right-to-left), enabling flexible layout designs.

- Default left-to-right arrangement:

    ```cangjie
    GridRow(direction: GridRowDirection.GridRowRow ){}
    ```

    ![Grid4](figures/Grid4.png)

- Right-to-left arrangement:

    ```cangjie
    GridRow(direction: GridRowDirection.RowReverse ){}
    ```

    ![Grid5](figures/Grid5.png)

### Child Component Spacing

The `gutter` property in GridRow sets horizontal and vertical spacing between child components.

- When `gutter` is of type `Length`, it sets equal horizontal and vertical spacing. Below example sets 10vp spacing in both directions:

    ```cangjie
    GridRow( gutter: 10.vp ){}
    ```

    ![Grid6](figures/Grid6.png)

- When `gutter` is of type `GutterOption`, `x` sets horizontal spacing and `y` sets vertical spacing separately.
    ```cangjie
    GridRow( gutter: GutterOption(x: 20.vp, y: 50.vp) ){}
    ```

    ![Grid7](figures/Grid7.png)

## Subcomponent GridCol

The GridCol component serves as a child component of the GridRow component. It allows setting the values of `span` (number of columns occupied), `offset` (number of columns offset), and `order` (element sequence) either through parameter passing or property assignment.

- Setting `span`:


    ```cangjie
    GridCol( span: 2 ){}
    GridCol( span:GridColColumnOption(xs: 1, sm:2, md:3, lg:4, xl:12, xxl: 12) ){}
    GridCol(){}.span(2)
    GridCol(){}.span(GridColColumnOption(xs:1, sm:2, md:3, lg:4, xl:12, xxl: 12))
    ```

- Setting `offset`:


    ```cangjie
    GridCol( gridColOffset: 2 ){}
    GridCol( gridColOffset:GridColColumnOption(xs: 1, sm:2, md:3, lg:4, xl:12, xxl: 12) ){}
    GridCol(){}.gridColOffset((GridColColumnOption(xs:1, sm:2, md:3, lg:4, xl:12,     xxl: 12)))
    ```

- Setting `order`:


    ```cangjie
    GridCol( order: 2 ){}
    GridCol( order:GridColColumnOption(xs: 1, sm:2, md:3, lg:4, xl:12, xxl: 12) ){}
    GridCol(){}.order(2)
    GridCol(){}.order(GridColColumnOption(xs:1, sm:2, md:3, lg:4, xl:12, xxl: 12))
    ```

### span

The number of columns a child component occupies in the grid layout, determining its width. Defaults to 1.

- When the type is `Int32`, the child component occupies the same number of columns across all device sizes.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        @State
        var bgColors: Array<Color> = [Color(213,213,213), Color(150,150,150), Color(0,74,175), Color(39,135,217), Color(61,157,180), Color(23,169,141), Color(255,192,0),Color(170,10,33)];
        func build() {
            GridRow(columns: 8) {
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol(span: 2) {
                            Row() {
                                Text(index.toString())
                            }
                            .width(100.percent)
                            .height(50.vp)
                        }.backgroundColor(color)
                    }
                )
            }
        }
    }
    ```

    ![Grid8](figures/Grid8.png)

- When the type is `GridColColumnOption`, it supports setting different column counts for six device sizes (xs, sm, md, lg, xl, xxl), with values that can vary per size.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        @State
        var bgColors: Array<Color> = [Color(213,213,213), Color(150,150,150), Color(0,74,175), Color(39,135,217), Color(61,157,180), Color(23,169,141), Color(255,192,0), Color(170,10,33)];
        func build() {
            GridRow(columns: 8) {
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol() {
                            Row() {
                                Text(index.toString())
                            }
                            .width(100.percent)
                            .height(50.vp)
                        }
                        .backgroundColor(color)
                        .span(GridColColumnOption(xs: 1, sm: 2, md: 3, lg: 4, xl: 12,   xxl: 12))
                    }
                )
            }
        }
    }
    ```

    ![Grid9](figures/Grid9.PNG)

### offset

The number of columns a grid child component is offset relative to the previous child component. Defaults to 0.

- When the type is `Int32`, the child component is offset by the same number of columns.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        @State
        var bgColors: Array<Color> = [Color(213,213,213), Color(150,150,150), Color(0,74,175), Color(39,135,217), Color(61,157,180), Color(23,169,141), Color(255,192,0), Color(170,10,33)];
        func build() {
            GridRow() {
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol(offset: 2) {
                            Row() {
                                Text(index.toString())
                            }
                            .width(100.percent)
                            .height(50.vp)
                        }.backgroundColor(color)
                    }
                )
            }
        }
    }
    ```

    ![Grid10](figures/Grid10.png)

    The grid defaults to 12 columns. Each child component occupies 1 column by default, with a 2-column offset, resulting in each child component and its spacing occupying 3 columns total. Four child components fit in one row.

- When the type is `GridColColumnOption`, it supports setting different offset values for six device sizes (xs, sm, md, lg, xl, xxl), with values that can vary per size.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        @State
        var bgColors: Array<Color> = [Color(213,213,213), Color(150,150,150), Color(0,74,175), Color(39,135,217), Color(61,157,180), Color(23,169,141), Color(255,192,0), Color(170,10,33)];
        func build() {
            GridRow() {
                ForEach(
                    bgColors,
                    itemGeneratorFunc: {
                        color: Color, index: Int64 => GridCol() {
                            Row() {
                                Text(index.toString())
                            }
                            .width(100.percent)
                            .height(50.vp)
                        }
                        .backgroundColor(color)
                        .offset(GridColColumnOption(xs: 1, sm: 2, md: 3, lg: 4, xl: 12, xxl: 12))
                    }
                )
            }
        }
    }
    ```

    ![Grid11](figures/Grid11.PNG)

### order

The sequence number of a grid child component, determining its display order. If child components do not set `order` or set the same `order`, they display in code order. If different `order` values are set, components with smaller `order` values appear first.

If some child components set `order` while others do not, those without `order` are sorted first, followed by those with `order` in ascending numerical order.

- When the type is `Int32`, the sorting order is consistent across all device sizes.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            GridRow() {
                GridCol(order: 4) {
                    Row() {
                        Text('1')
                    }
                    .width(100.percent)
                    .height(50.vp)
                }.backgroundColor(Color(213,213,213))
                GridCol(order: 3) {
                    Row() {
                        Text('2')
                    }
                    .width(100.percent)
                    .height(50.vp)
                }.backgroundColor(Color(150,150,150))
                GridCol(order: 2) {
                    Row() {
                        Text('3')
                    }
                    .width(100.percent)
                    .height(50.vp)
                }.backgroundColor(Color(0,74,175))
                GridCol(order: 1) {
                    Row() {
                        Text('4')
                    }
                    .width(100.percent)
                    .height(50.vp)
                }.backgroundColor(Color(39,135,217))
            }
        }
    }
    ```

    ![Grid12](figures/Grid12.png)

- When the type is `GridColColumnOption`, it supports setting different sorting orders for six device sizes (xs, sm, md, lg, xl, xxl). For example:
  - In `xs` devices: order is 1-2-3-4
  - In `sm` devices: order is 2-3-4-1
  - In `md` devices: order is 3-4-1-2
  - In `lg` devices: order is 2-4-3-1

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            GridRow() {
                GridCol() {
                    Row() {
                        Text('1')
                    }
                    .width(100.percent)
                    .height(50.vp)
                }
                .backgroundColor(Color.RED)
                .order(GridColColumnOption(xs: 1, sm: 5, md: 3, lg: 7, xl: 12, xxl:     12))
                GridCol() {
                    Row() {
                        Text('2')
                    }
                    .width(100.percent)
                    .height(50.vp)
                }
                .backgroundColor(Color.ORANGE)
                .order(GridColColumnOption(xs: 2, sm: 2, md: 6, lg: 1, xl: 12, xxl:     12))
                GridCol() {
                    Row() {
                        Text('3')
                    }
                    .width(100.percent)
                    .height(50.vp)
                }
                .backgroundColor(Color.YELLOW)
                .order(GridColColumnOption(xs: 3, sm: 3, md: 1, lg: 6, xl: 12, xxl:     12))
                GridCol() {
                    Row() {
                        Text('4')
                    }
                    .width(100.percent)
                    .height(50.vp)
                }
                .backgroundColor(Color.GREEN)
                .order(GridColColumnOption(xs: 4, sm: 4, md: 2, lg: 5, xl: 12, xxl:     12))
            }
        }
    }
    ```


    ![Grid13](figures/Grid13.PNG)

## Nested Usage of Grid Components

Grid components can also be used in nested configurations to achieve complex layouts.

In the following example, the grid divides the entire space into 12 columns. The first-level GridRow nests GridCol to create a large central area and a "footer" area. The second-level GridRow nests GridCol to create "left" and "right" areas. The space of child components is divided according to the parent component's space allocation. The pink area represents the 12 columns of screen space, while the green and blue areas represent the 12 columns of the parent GridCol component, sequentially dividing the space. <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        GridRow() {
            GridCol() {
                GridRow() {
                    GridCol() {
                        Row() {
                            Text('left').fontSize(24)
                        }
                        .justifyContent(FlexAlign.Center)
                        .height(90.percent)
                    }
                    .backgroundColor(0xff41dbaa)
                    .span(GridColColumnOption(xs: 12, sm: 2, md: 12, lg: 12, xl: 12, xxl: 12))
                    GridCol() {
                        Row() {
                            Text('right').fontSize(24)
                        }
                        .justifyContent(FlexAlign.Center)
                        .height(90.percent)
                    }
                    .backgroundColor(0xff4168db)
                    .span(GridColColumnOption(xs: 12, sm: 10, md: 12, lg: 12, xl: 12, xxl: 12))
                }.backgroundColor(0x19000000)
            }.span(GridColColumnOption(xs: 12, sm: 12, md: 12, lg: 12, xl: 12, xxl: 12))

            GridCol() {
                Row() {
                    Text('footer')
                        .width(100.percent)
                        .textAlign(TextAlign.Center)
                }
                .width(100.percent)
                .height(10.percent)
                .backgroundColor(Color.PINK)
            }.span(GridColColumnOption(xs: 12, sm: 12, md: 12, lg: 12, xl: 12, xxl: 12))
        }
        .width(100.percent)
        .height(300)
    }
}
```

![Grid14](figures/Grid14.png)

In summary, the grid component provides rich customization capabilities, offering exceptional flexibility and power. By simply defining parameters such as Columns, Margin, Gutter, and span at different breakpoints, the final layout can be determined without needing to consider specific device types or states (such as portrait or landscape orientation).