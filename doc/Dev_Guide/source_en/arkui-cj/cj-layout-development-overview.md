# Layout Overview

Components are arranged sequentially according to layout requirements to form application pages. In declarative UI, all pages are composed of custom components. Developers can choose appropriate layouts for page development based on their needs.

Layout refers to managing the size and position of UI components on user pages using specific components or attributes. In actual development, the following process should be followed to ensure overall layout effectiveness:

- Determine the layout structure of the page.
- Analyze the composition of elements on the page.
- Select suitable layout container components or attributes to control the position and size of each element on the page.

## Layout Structure

Layouts are typically hierarchical. A common page structure is shown below:

**Figure 1** Common Page Structure Diagram

![layout-overview-1](figures/layout-overview-1.png)

To achieve the above effect, developers need to declare corresponding elements on the page. Here, `Page` represents the root node of the page, and elements like `Column`/`Row` are system components. For different page structures, ArkUI provides various layout components to help developers achieve corresponding layout effects, such as `Row` for implementing linear layouts.

## Composition of Layout Elements

Layout-related container components can form corresponding layout effects. For example, the `List` component can constitute a linear layout.

**Figure 2** Layout Element Composition Diagram

![layout-overview-2](figures/layout-overview-2.png)

- **Component Area (Blue Square)**: Represents the size of the component. The [width](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-size.md#func-widthlength) and [height](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-size.md#func-heightlength) attributes are used to set the size of the component area.
- **Component Content Area (Yellow Square)**: The size of the component content area is the component area size minus the component's [border](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-border.md) value. The component content area size serves as the layout measurement constraint for the component content (or child components).
- **Component Content (Green Square)**: The size occupied by the component content itself, such as the size of text content. The component content and component content area may not match. For example, when fixed `width` and `height` are set, the component content size is the set `width` and `height` minus `padding` and `border` values. However, the text content size is determined by the text layout engine, which may result in the actual text size being smaller than the set component content area size. When the component content and component content area sizes do not match, the [align](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-location.md#func-alignalignment) attribute takes effect, defining the alignment of the component content within the component content area, such as center alignment.
- **Component Layout Boundary (Dashed Line)**: When the component sets an outer margin via the [margin](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-size.md#func-marginlength) attribute, the component layout boundary is the component area plus the margin size.

## How to Choose a Layout

Declarative UI provides the following 10 common layouts. Developers can select the appropriate layout for page development based on actual application scenarios.

| Layout | Application Scenario |
|:---|:---|
| [Linear Layout](./cj-layout-development-linear.md) (`Row`, `Column`) | Preferred when there are more than one child element in the layout and they can be arranged linearly. |

## Layout Positioning

Properties such as `position` and `offset` affect the position of layout containers relative to themselves or other components.

| Positioning Capability | Application Scenario | Implementation Method |
|:---|:---|:---|
| Absolute Positioning | For devices of different sizes, absolute positioning has poor adaptability and limitations in screen compatibility. | Use [`position`](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-location.md#func-positionlength-length) to achieve absolute positioning, setting the offset of the element's top-left corner relative to the parent container's top-left corner. In layout containers, setting this property does not affect the parent container's layout; it only adjusts the position during rendering. |
| Relative Positioning | Relative positioning does not break the document flow, meaning the original position is retained, and the element's inherent characteristics remain unaffected. It only offsets relative to the original position. | Use [`offset`](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-location.md#func-offsetlength-length) to achieve relative positioning, setting the element's offset relative to itself. Setting this property does not affect the parent container's layout; it only adjusts the position during rendering. |

## Constraints on Child Elements

- **Stretching**: When the size of a container component changes, the increased or decreased space is entirely allocated to the specified area within the container component.

  Properties [`flexGrow`](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-flexlayout.md#func-flexgrowfloat64) and [`flexShrink`](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-flexlayout.md#func-flexshrinkfloat64):

    - `flexGrow` controls component stretching based on the remaining space of the parent container.
    - `flexShrink` sets the parent container's compression size to control component compression.

- **Scaling**: The width and height of child components change proportionally with the container component while maintaining their aspect ratio.

  The [`aspectRatio`](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-layoutconstraints.md#func-aspectratiofloat64) property specifies the current component's width-to-height ratio to control scaling, calculated as: `aspectRatio = width / height`.

- **Proportion**: The width and height of child components change proportionally with the ancestor container component.

  Two implementation methods based on universal properties:

    - Set the child component's width or height as a percentage.

      | Parent and Ancestor Component Width/Height Settings | Child Component Percentage |
      |:---|:---|
      | Parent component sets width/height & ancestor component does not specify parent width/height | References the parent component's width/height |
      | Parent component sets width/height & ancestor component specifies parent width/height | References the ancestor-specified parent width/height |
      | Parent component does not set width/height & ancestor component specifies parent width/height | References the ancestor-specified parent width/height |
      | Parent component does not set width/height & ancestor component does not specify parent width/height | References the parent component's percentage reference. Since the parent component does not specify width/height, this percentage reference is inherited from the ancestor component. |

    - The [`layoutWeight`](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-size.md#func-layoutweightint32) property allows child elements to adaptively fill the remaining space.

- **Hiding**: The hiding capability refers to child components within a container component being displayed or hidden based on their preset display priority as the container component's size changes. Child components with the same display priority are shown or hidden simultaneously.

  The [`displayPriority`](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-layoutconstraints.md#func-displaypriorityint32) property controls the display and hiding of components.