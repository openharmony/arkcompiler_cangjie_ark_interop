# Grid

A grid container composed of cells divided by "rows" and "columns", capable of creating various layouts by specifying the cells where "items" are located.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

Only supports [GridItem](cj-scroll-swipe-griditem.md) child components, and supports rendering control types ([if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md), [ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md), [LazyForEach](cj-state-rendering-lazyforeach.md)).

> **Note:**
>
> - Index calculation rules for Grid child components:
>   - Incremented sequentially according to the order of child components.
>   - In if/else statements, only child components within the branch where the condition is met will participate in index calculation; those in the unmet branch will not.
>   - In ForEach/LazyForEach statements, all expanded child nodes will be calculated for their index values.
>   - After changes occur in [if/else](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-ifelse.md), [ForEach](../../../Dev_Guide/source_zh_cn/arkui-cj/rendering_control/cj-rendering-control-foreach.md), or [LazyForEach](cj-state-rendering-lazyforeach.md), child node index values will be updated.
>   - When the visibility property of a Grid child component is set to Hidden or None, the index value will still be calculated.
>   - When the visibility property of a Grid child component is set to None, it will not be displayed but will still occupy the corresponding grid cell.
>   - Setting the position property for a Grid child component will occupy the corresponding grid cell, and the child component will be displayed at the position offset relative to the top-left corner of the Grid. This child component will not scroll with its corresponding grid cell and will not be displayed once the grid cell scrolls out of the Grid's visible range.
>   - When there are gaps between Grid child components, the current display area will attempt to fill the gaps as much as possible, so GridItem positions may change relative to each other as the grid scrolls.

## Creating Components

### init()

```cangjie
public init()
```

**Function:** Creates a grid container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

### init(Option\<Scroller>, Option\<() -> Unit>)

```cangjie
public init(scroller!: Option<Scroller> = Option.None, child!: Option<() -> Unit> = Option.None)
```

**Function:** Creates a grid container with a scroll controller and child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scroller | [Option](#initoptionscroller-option---unit)\<[Scroller](./cj-common-types.md#class-scroller)> | No | Option.None | The controller for scrollable components, bound to the scrollable component.<br> **Note:** <br>Cannot be bound to the same scroll control object as other scrollable components such as [List](cj-scroll-swipe-list.md), [Grid](cj-scroll-swipe-grid.md), [Scroll](cj-scroll-swipe-scroll.md), etc. |
| child | [Option](#initoptionscroller-option---unit)\<()->Unit> | No | Option.None | The child components of the grid container. |

## Common Attributes/Common Events

Common Attributes: Supports common attributes.

Common Events: Fully supported.

## Component Attributes

### func cachedCount(Int32)

```cangjie
public func cachedCount(count: Int32): This
```

**Function:** Sets the number of preloaded GridItems, effective only in [LazyForEach](cj-state-rendering-lazyforeach.md).

After setting the cache, `cachedCount * number of columns` GridItems will be cached above and below the Grid's display area.

[LazyForEach](cj-state-rendering-lazyforeach.md) GridItems outside the display and cache range will be released.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| count | Int32 | Yes | - | The number of preloaded GridItems.<br>Initial value: When scrolling vertically, it is the number of rows that can be displayed on one screen; when scrolling horizontally, it is the number of columns that can be displayed on one screen. The maximum value is 16. <br> Range: [0, +∞). If set to a value less than 0, it will be treated as 1. |

### func cachedCount(Int32, Bool)

```cangjie
public func cachedCount(count: Int32, show: Bool): This
```

**Function:** Sets the number of preloaded GridItems and configures whether to display preloaded nodes.

After setting the cache, `cachedCount * number of columns` GridItems will be cached above and below the Grid's display area. Combined with the [Clip](./cj-universal-attribute-shapclip.md#func-clip) or [Content Clip](./cj-universal-attribute-shapclip.md#func-clip) attribute, preloaded nodes can be displayed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| count | Int32 | Yes | - | The number of preloaded GridItems.<br>Initial value: When scrolling vertically, it is the number of rows that can be displayed on one screen; when scrolling horizontally, it is the number of columns that can be displayed on one screen. The maximum value is 16.<br> Range: [0, +∞). If set to a value less than 0, it will be treated as 1. |
| show | Bool | Yes | - | Whether preloaded GridItems should be displayed.<br>Initial value: false, preloaded GridItems are not displayed. |

### func columnsGap(Length)

```cangjie
public func columnsGap(value: Length): This
```

**Function:** Sets the gap between columns. If set to a value less than 0, the initial value will be used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The gap between columns.<br> Initial value: 0 <br> Range: [0, +∞) |

### func columnsTemplate(String)

```cangjie
public func columnsTemplate(value: String): This
```

**Function:** Sets the number of columns, fixed column width, or minimum column width for the current grid layout. If not set, the default is 1 column.

For example, `'1fr 1fr 2fr'` divides the parent component into 3 columns, splitting the parent component's allowed width into 4 equal parts, with the first column taking 1 part, the second column taking 1 part, and the third column taking 2 parts.

- `columnsTemplate('repeat(auto-fit, track-size)')` sets the minimum column width to `track-size` and automatically calculates the number of columns and actual column width.
- `columnsTemplate('repeat(auto-fill, track-size)')` sets the fixed column width to `track-size` and automatically calculates the number of columns.
- `columnsTemplate('repeat(auto-stretch, track-size)')` sets the fixed column width to `track-size`, uses `columnsGap` as the minimum column gap, and automatically calculates the number of columns and actual column gaps.

Here, `repeat`, `auto-fit`, `auto-fill`, and `auto-stretch` are keywords. `track-size` is the column width, supporting units including px, vp, %, or valid numbers. The default unit is vp, and `track-size` must include at least one valid column width.<br/>
`auto-stretch` mode only supports `track-size` as a single valid column width value, and `track-size` only supports px, vp, and valid numbers, not %.

For usage effects, refer to [Example 3](#example-3-grid-drag-scenario).

If set to `'0fr'`, the column width for that column will be 0, and the GridItem will not be displayed. If set to other invalid values, the GridItem will be displayed as a fixed 1 column.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | The number of columns or minimum column width for the current grid layout. |

### func rowsGap(Length)

```cangjie
public func rowsGap(value: Length): This
```

**Function:** Sets the gap between rows. If set to a value less than 0, the initial value will be used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The gap between rows.<br> Initial value: 0 <br> Range: [0, +∞) |

### func rowsTemplate(String)

```cangjie
public func rowsTemplate(value: String): This
```

**Function:** Sets the number of rows, fixed row height, or minimum row height for the current grid layout. If not set, the default is 1 row.

For example, `'1fr 1fr 2fr'` divides the parent component into 3 rows, splitting the parent component's allowed height into 4 equal parts, with the first row taking 1 part, the second row taking 1 part, and the third row taking 2 parts.

- `rowsTemplate('repeat(auto-fit, track-size)')` sets the minimum row height to `track-size` and automatically calculates the number of rows and actual row height.
- `rowsTemplate('repeat(auto-fill, track-size)')` sets the fixed row height to `track-size` and automatically calculates the number of rows.
- `rowsTemplate('repeat(auto-stretch, track-size)')` sets the fixed row height to `track-size`, uses `rowsGap` as the minimum row gap, and automatically calculates the number of rows and actual row gaps.

Here, `repeat`, `auto-fit`, `auto-fill`, and `auto-stretch` are keywords. `track-size` is the row height, supporting units including px, vp, %, or valid numbers. The default unit is vp, and `track-size` must include at least one valid row height.

> **Note:**
>
> - `auto-stretch` mode only supports `track-size` as a single valid row height value, and `track-size` only supports px, vp, and valid numbers, not %.
> - If `value` is set to `'0fr'`, the row width for that row will be 0, and the GridItem in that row will not be displayed. If set to other invalid values, it will be treated as a fixed 1 row.

The Grid component can be divided into the following three layout modes based on the settings of the `rowsTemplate` and `columnsTemplate` attributes:

1. Both `rowsTemplate` and `columnsTemplate` are set:
   - The Grid only displays elements within the fixed number of rows and columns; other elements are not displayed, and the Grid cannot scroll.
   - If the Grid's width and height are not set, they will default to the parent component's dimensions.
   - The size of Grid columns is allocated according to the proportion of each column after subtracting all row and column gaps from the Grid's own content area size.
   - GridItems will fill the grid size by default.

2. Only one of `rowsTemplate` or `columnsTemplate` is set:
   - Elements are arranged according to the set direction, and if they exceed the Grid's display area, the Grid can scroll to display them.
   - If `columnsTemplate` is set, the Grid's scrolling direction is vertical, the main axis direction is vertical, and the cross axis direction is horizontal.
   - If `rowsTemplate` is set, the Grid's scrolling direction is horizontal, the main axis direction is horizontal, and the cross axis direction is vertical.
   - The cross-axis size of the grid is allocated according to the proportion after subtracting all cross-axis gaps from the Grid's own content area size.
   - The main-axis size of the grid takes the maximum height of all GridItems in the current grid's cross-axis direction.

3. Neither `rowsTemplate` nor `columnsTemplate` is set:
   - The number of rows is determined by the Grid's height, the height of the first element, and `rowsGap`. Elements beyond the row and column capacity will not be displayed and cannot be displayed by scrolling.
   - In this mode, only the following attributes are effective: `columnsGap`, `rowsGap`.
   - If there are no GridItems under the current Grid, the Grid's width and height will be 0.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | The number of rows or minimum row height for the current grid layout. |

## Example Code

### Example 1 (Setting Adaptive Column Count)

Example usage of `auto-fill`, `auto-fit`, and `auto-stretch` in the [columnsTemplate](#func-columnstemplatestring) attribute

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class EntryView {
    var data: Array<Int64> = [0, 1, 2, 3, 4, 5]
    var data1: Array<Int64> = [0, 1, 2, 3, 4, 5]
    var data2: Array<Int64> = [0, 1, 2, 3, 4, 5]

    func build() {
        Column(10) {
            Text("auto-fill Automatically calculates the number of columns based on the set column width").width(90.percent)
            Grid() {
                ForEach(
                    this.data,
                    itemGeneratorFunc: {
                        item: Int64, idx: Int64 => GridItem() {
                            Text("N ${item}").height(80)
                        }.backgroundColor(Color.ORANGE)
                    }
                )
            }
                .width(90.percent)
                .border(width: 1.vp, color: Color.Black)
                .columnsTemplate("repeat(auto-fill, 70)")
                .columnsGap(10)
                .rowsGap(10)
                .height(150)

            Text("auto-fit First calculates the number of columns based on the set column width, then evenly distributes the remaining space to each column").width(90.percent)
            Grid() {
                ForEach(
                    this.data1,
                    itemGeneratorFunc: {
                        item: Int64, idx: Int64 => GridItem() {
                            Text("N ${item}").height(80)
                        }.backgroundColor(Color.ORANGE)
                    }
                )
            }
                .width(90.percent)
                .border(width: 1.vp, color: Color.Black)
                .columnsTemplate("repeat(auto-fit, 70)")
                .columnsGap(10)
                .rowsGap(10)
                .height(150)

            Text("auto-stretch First calculates the number of columns based on the set column width, then evenly distributes the remaining space to each column gap").width(90.percent)
            Grid() {
                ForEach(
                    this.data2,
                    itemGeneratorFunc: {
                        item: Int64, idx: Int64 => GridItem() {
                            Text("N ${item}").height(80)
                        }.backgroundColor(Color.ORANGE)
                    }
                )
            }
                .width(90.percent)
                .border(width: 1.vp, color: Color.Black)
                .columnsTemplate('repeat(auto-stretch, 70)')
                .columnsGap(10)
                .rowsGap(10)
                .height(150)
        }.width(100.percent).height(100.percent)
    }
}
```

![griditem](figures/grid5_api.png)

### Example 2 (Using the Height of the Tallest GridItem in the Current Row as the Height for Other GridItems)

The following Grid contains two columns, with each GridItem in the columns including two Columns with fixed heights and one Text with an indeterminate height, totaling three child components.

By default, the heights of the left and right GridItems may differ; after setting the Grid's [alignItems](cj-row-column-stack-column.md#func-alignitemshorizontalalign) attribute to `GridItemAlignment.STRETCH`, the shorter GridItem in a row will adopt the height of the taller GridItem in the same row.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import ohos.base.*
```  
        }.height(100.percent).width(100.percent)  
    }  
}  

```  

![griditem](figures/grid6_api.png)