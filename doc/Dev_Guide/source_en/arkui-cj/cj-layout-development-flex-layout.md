# Flexible Layout (Flex)

## Overview

The Flexible Layout ([Flex](../../../API_Reference/source_zh_cn/arkui-cj/cj-row-column-stack-flex.md)) provides a more efficient way to arrange, align, and distribute remaining space among child elements within a container. It is commonly used for uniform distribution of navigation bars in page headers, building page frameworks, and arranging multi-line data.

By default, a container has a main axis and a cross axis. Child elements are arranged along the main axis by default. The size of a child element along the main axis is referred to as the main axis size, while the size along the cross axis is called the cross axis size.

**Figure 1** Schematic diagram of a Flex container with a horizontal main axis

![flex-layout](figures/flex-layout.png)

## Basic Concepts

- **Main Axis**: The axis along which Flex components are laid out, with child elements arranged along this axis by default. The starting position of the main axis is called the main start, and the ending position is called the main end.

- **Cross Axis**: The axis perpendicular to the main axis. The starting position of the cross axis is called the cross start, and the ending position is called the cross end.

## Layout Direction

In flexible layouts, child elements within a container can be arranged in any direction. By setting the `direction` parameter, the main axis direction can be determined, thereby controlling the arrangement direction of child elements.

The flexible layout direction is illustrated below:

![flex-layout-direction](figures/flex-layout-direction.png)

- **FlexDirection.Row** (default): The main axis is horizontal, and child elements are arranged from the start along the horizontal direction.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(direction: FlexDirection.Row)) {
                Text('1')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .height(70)
            .width(90.percent)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex](figures/Flex.png)

- **FlexDirection.RowReverse**: The main axis is horizontal, and child elements are arranged from the end in the opposite direction of `FlexDirection.Row`.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(direction: FlexDirection.RowReverse)) {
                Text('3')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('1')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .height(70)
            .width(90.percent)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex](figures/Flex.png)

- **FlexDirection.Column**: The main axis is vertical, and child elements are arranged from the start along the vertical direction.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(direction: FlexDirection.Column)) {
                Text('1')
                    .width(100.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(100.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(100.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .height(70)
            .width(90.percent)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex1](figures/Flex1.png)

- **FlexDirection.ColumnReverse**: The main axis is vertical, and child elements are arranged from the end in the opposite direction of `FlexDirection.Column`.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(direction: FlexDirection.ColumnReverse)) {
                Text('1')
                    .width(100.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(100.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(100.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .height(70)
            .width(90.percent)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex2](figures/Flex2.png)

## Layout Wrapping

Flexible layouts can be single-line or multi-line. By default, all child elements in a Flex container are placed on a single line (also called the "axis"). The `wrap` property controls whether the Flex layout is single-line or multi-line when the sum of the child elements' main axis sizes exceeds the container's main axis size. In multi-line layouts, the cross axis direction determines the arrangement direction of new lines.

- **FlexWrap.NoWrap** (default): No wrapping. If the total width of child elements exceeds the parent's width, the child elements' widths will be compressed.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(wrap: FlexWrap.NoWrap)) {
                Text('1')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .width(90.percent)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex3](figures/Flex3.png)

- **FlexWrap.Wrap**: Wrapping enabled. Each line of child elements is arranged along the main axis direction.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                Text('1')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
            }
            .width(90.percent)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex4](figures/Flex4.png)

- **FlexWrap.WrapReverse**: Wrapping enabled. Each line of child elements is arranged in the opposite direction of the main axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(wrap: FlexWrap.WrapReverse)) {
                Text('1')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            Text('2')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(50.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .width(90.percent)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex5](figures/Flex5.png)

## Main Axis Alignment

The `justifyContent` parameter sets the alignment of child elements along the main axis.

![flex-spindle-alignment](figures/flex-spindle-alignment.png)

- **FlexAlign.Start** (default): Child elements are aligned at the start of the main axis. The first child element aligns with the parent's edge, and subsequent elements align with the previous one.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*
    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.Start)) {
                Text('1')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .width(90.percent)
            .padding(top: 10, bottom: 10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex6](figures/Flex6.png)

- FlexAlign.Center: Child elements are center-aligned along the main axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.Center)) {
                Text('1')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .width(90.percent)
            .padding(top: 10, bottom: 10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex7](figures/Flex7.png)

- FlexAlign.End: Child elements are aligned to the end of the main axis, with the last child element aligned to the parent's edge and other elements aligned to the subsequent element.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.End)) {
                Text('1')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .width(90.percent)
            .padding(top: 10, bottom: 10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex8](figures/Flex8.png)

- FlexAlign.SpaceBetween: Flex items are evenly distributed along the main axis, with equal spacing between adjacent child elements. The first and last child elements are aligned to the parent's edges.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween)) {
                Text('1')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .width(90.percent)
            .padding(top: 10, bottom: 10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex9](figures/Flex9.png)

- FlexAlign.SpaceAround: Flex items are evenly distributed along the main axis with equal spacing between adjacent child elements. The distance from the first child to the main axis start and the last child to the main axis end is half the spacing between adjacent elements.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceAround)) {
                Text('1')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .width(90.percent)
            .padding(top: 10, bottom: 10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex11](figures/Flex11.png)

- FlexAlign.SpaceEvenly: Flex items are distributed with equal spacing along the main axis, where the spacing between adjacent child elements, the first child to the main axis start, and the last child to the main axis end are all equal.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceEvenly)) {
                Text('1')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(20.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .width(90.percent)
            .padding(top: 10, bottom: 10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex12](figures/Flex12.png)

## Cross-Axis Alignment Methods

Both container and child elements can set cross-axis alignment, with child element settings taking higher priority.

### Container Component Cross-Axis Alignment

The cross-axis alignment of child elements can be set via the `alignItems` parameter of the Flex component.

- ItemAlign.Auto: Uses the default configuration in the Flex container.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(alignItems: ItemAlign.Auto)) {
                Text('1')
                    .width(33.percent)
                    .height(30)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .height(40)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .size(width: 90.percent, height: 80)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex13](figures/Flex13.png)

- ItemAlign.Start: Aligns to the start of the cross-axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(alignItems: ItemAlign.Start)) {
                Text('1')
                    .width(33.percent)
                    .height(30)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .height(40)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .size(width: 90.percent, height: 80)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex14](figures/Flex14.png)

- ItemAlign.Center: Center-aligns along the cross-axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(alignItems: ItemAlign.Center)) {
                Text('1')
                    .width(33.percent)
                    .height(30)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .height(40)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .size(width: 90.percent, height: 80)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex14](figures/Flex14.png)

- ItemAlign.Center：Align centered in the cross-axis direction.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(alignItems: ItemAlign.Center)) {
                Text('1')
                    .width(33.percent)
                    .height(30)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .height(40)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .size(width: 90.percent, height: 80)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex15](figures/Flex15.png)

- ItemAlign.End: Aligns items to the end of the cross axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(alignItems: ItemAlign.End)) {
                Text('1')
                    .width(33.percent)
                    .height(30)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .height(40)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .size(width: 90.percent, height: 80)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex16](figures/Flex16.png)

- ItemAlign.Stretch: Stretches items to fill the cross axis. When dimensions are not set, items stretch to container size.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(alignItems: ItemAlign.Stretch)) {
                Text('1')
                    .width(33.percent)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(33.percent)
                    .backgroundColor(0xF5DEB3)
            }
            .size(width: 90.percent, height: 80)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex17](figures/Flex17.png)

- ItemAlign.Baseline: Aligns items to the text baseline in the cross axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(alignItems: ItemAlign.Baseline)) {
                Text('1')
                    .width(33.percent)
                    .height(30)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(33.percent)
                    .height(40)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(33.percent)
                    .height(50)
                    .backgroundColor(0xF5DEB3)
            }
            .size(width: 90.percent, height: 80)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex18](figures/Flex18.png)

### Setting Cross Axis Alignment for Child Elements

The [alignSelf](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-flexlayout.md#func-alignselfitemalign) attribute of child elements can also set their alignment format in the parent container's cross axis, which will override the alignItems configuration in the Flex container. As shown in the following example:

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Flex(FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.Center)) { // Container sets child elements to center
            Text('alignSelf Start')
                .width(25.percent)
                .height(80)
                .alignSelf(ItemAlign.Start)
                .backgroundColor(0xF5DEB3)
            Text('alignSelf Baseline')
                .alignSelf(ItemAlign.Baseline)
                .width(25.percent)
                .height(80)
                .backgroundColor(0xD2B48C)
            Text('alignSelf Baseline')
                .width(25.percent)
                .height(100)
                .backgroundColor(0xF5DEB3)
                .alignSelf(ItemAlign.Baseline)
            Text('no alignSelf')
                .width(25.percent)
                .height(100)
                .backgroundColor(0xD2B48C)
            Text('no alignSelf')
                .width(25.percent)
                .height(100)
                .backgroundColor(0xF5DEB3)
        }
        .width(90.percent)
        .height(220)
        .backgroundColor(0xAFEEEE)
    }
}
```

![Flex19](figures/Flex19.png)

In the above example, the Flex container sets alignItems to center child elements along the cross axis. When child elements have their own alignSelf attributes, they override the parent's alignItems value and display according to alignSelf definitions.

### Content Alignment

The [alignContent](../../../API_Reference/source_zh_cn/arkui-cj/cj-row-column-stack-flex.md#var-aligncontent) parameter can set the alignment of child element rows within the remaining space of the cross axis. This only takes effect in multi-line Flex layouts. Available options include:

- FlexAlign.Start: Aligns child element rows to the start of the cross axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap,    alignContent: FlexAlign.Start)) {
                Text('1')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(60.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(40.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('4')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('5')
                    .width(20.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
            }
            .width(90.percent)
            .height(100)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex20](figures/Flex20.png)

- FlexAlign.Center: Centers child element rows along the cross axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap,    alignContent: FlexAlign.Center)) {
                Text('1')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(60.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(40.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('4')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('5')
                    .width(20.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
            }
            .width(90.percent)
            .height(100)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex21](figures/Flex21.png)

- FlexAlign.End: Aligns child element rows to the end of the cross axis.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap,    alignContent: FlexAlign.End)) {
                Text('1')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(60.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(40.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('4')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('5')
                    .width(20.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
            }
            .width(90.percent)
            .height(100)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex22](figures/Flex22.png)

- FlexAlign.SpaceBetween: Align child elements to both ends of the cross axis with equal vertical spacing between rows.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap,    alignContent: FlexAlign.SpaceBetween)) {
                Text('1')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(60.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(40.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('4')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('5')
                    .width(20.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
            }
            .width(90.percent)
            .height(100)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex23](figures/Flex23.png)

- FlexAlign.SpaceAround: Equal spacing between child element rows, with twice the distance from the first/last row to the cross axis ends.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap,    alignContent: FlexAlign.SpaceAround)) {
                Text('1')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(60.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(40.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('4')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('5')
                    .width(20.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
            }
            .width(90.percent)
            .height(100)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex24](figures/Flex24.png)

- FlexAlign.SpaceEvenly: Equal spacing between child element rows, with equal distance from first/last rows to cross axis ends.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap,    alignContent: FlexAlign.SpaceEvenly)) {
                Text('1')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('2')
                    .width(60.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('3')
                    .width(40.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
                Text('4')
                    .width(30.percent)
                    .height(20)
                    .backgroundColor(0xF5DEB3)
                Text('5')
                    .width(20.percent)
                    .height(20)
                    .backgroundColor(0xD2B48C)
            }
            .width(90.percent)
            .height(100)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex25](figures/Flex25.png)

## Adaptive Stretching

When the parent container size is too small in flex layout, use the following child element properties to set their proportion in the parent container for adaptive layout.

- [flexBasis](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-flexlayout.md#func-flexbasislength): Sets the base size of child elements along the main axis of the parent container. If set, the child occupies space equal to this value; otherwise, it uses width/height values.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex() {
                Text('flexBasis("auto")')
                    .flexBasis(0) // No width set and flexBasis=0: uses content width
                    .height(100)
                    .backgroundColor(0xF5DEB3)
                Text('flexBasis("auto")' + ' width("40%")')
                    .width(40.percent)
                    .flexBasis(0) // Width set and flexBasis=0: uses width value
                    .height(100)
                    .backgroundColor(0xD2B48C)

                Text('flexBasis(100)') // No width set and flexBasis=100: width=100vp
                    .flexBasis(100)
                    .height(100)
                    .backgroundColor(0xF5DEB3)

                Text('flexBasis(100)')
                    .flexBasis(100)
                    .width(200) // flexBasis=100 overrides width setting: width=100vp
                    .height(100)
                    .backgroundColor(0xD2B48C)
            }
            .width(90.percent)
            .height(120)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex26](figures/Flex26.png)

- [flexGrow](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-flexlayout.md#func-flexgrowfloat64): Sets the proportion of remaining parent container space allocated to this component. Used for distributing remaining space.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex() {
                Text('flexGrow(2)')
                    .flexGrow(2)
                    .width(100)
                    .height(100)
                    .backgroundColor(0xF5DEB3)
                Text('flexGrow(3)')
                    .flexGrow(3)
                    .width(100)
                    .height(100)
                    .backgroundColor(0xD2B48C)

                Text('no flexGrow')
                    .width(100)
                    .height(100)
                    .backgroundColor(0xF5DEB3)
            }
            .width(380)
            .height(120)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex27](figures/Flex27.png)

    Parent container width=420vp, three child elements with original width=100vp, padding=20vp, total=320vp. Remaining 100vp space is allocated according to flexGrow ratio (2:3). First element: 100vp + (100vp × 2/5) = 140vp, second element: 100vp + (100vp × 3/5) = 160vp.

- [flexShrink](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-flexlayout.md#func-flexshrinkfloat64): Compression ratio of child elements when parent container space is insufficient.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Entry
    @Component
    class EntryView {
        func build() {
            Flex(FlexParams(direction: FlexDirection.Row)) {
                Text('flexShrink(3)')
                    .flexShrink(3)
                    .width(200)
                    .height(100)
                    .backgroundColor(0xF5DEB3)

                Text('no flexShrink')
                    .width(200)
                    .height(100)
                    .backgroundColor(0xD2B48C)

                Text('flexShrink(2)')
                    .flexShrink(2)
                    .width(200)
                    .height(100)
                    .backgroundColor(0xF5DEB3)
            }
            .width(380)
            .height(120)
            .padding(10)
            .backgroundColor(0xAFEEEE)
        }
    }
    ```

    ![Flex28](figures/Flex28.png)

## Usage Example

Using flex layout to achieve horizontal alignment with justified ends, equal spacing between child elements, and vertical centering.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Column(5) {
                Flex(
FlexParams(direction: FlexDirection.Row, wrap: FlexWrap.NoWrap,
    justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center)) {
    Text('1')
        .width(30.percent)
        .height(50)
        .backgroundColor(0xF5DEB3)
    Text('2')
        .width(30.percent)
        .height(50)
        .backgroundColor(0xD2B48C)
    Text('3')
        .width(30.percent)
        .height(50)
        .backgroundColor(0xF5DEB3)
}
.height(70)
.width(90.percent)
.backgroundColor(0xAFEEEE)
}
.width(100.percent)
.margin(top: 5)
}.width(100.percent)
}
}
```

![Flex29](figures/Flex29.png)