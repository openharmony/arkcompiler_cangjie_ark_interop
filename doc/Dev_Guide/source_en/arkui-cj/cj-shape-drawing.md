# Drawing Geometric Shapes (Shape)

The drawing component is used to create shapes on a page. The Shape component serves as the parent component for all drawing components, describing the common attributes supported by all drawing components. For specific usage, please refer to [Shape](../../../API_Reference/source_zh_cn/arkui-cj/cj-graphic-drawing-shape.md).

## Creating Drawing Components

Drawing components can be created in the following two forms:

- Drawing components use Shape as the parent component to achieve SVG-like effects. The interface calls are as follows:

  ```cangjie
  init()

  init(target: PixelMap)
  ```

  This interface is used to create a drawing component with a parent component. The `target` parameter sets the drawing target, allowing the shape to be drawn in a specified PixelMap object. If not set, the shape will be drawn in the current drawing target.

  ```cangjie
  Shape() {
      Rect().width(300).height(50)
  }
  ```

- Drawing components can be used independently to draw specified shapes on a page. There are seven types of drawing components: [Circle](../../../API_Reference/source_zh_cn/arkui-cj/cj-graphic-drawing-circle.md), [Ellipse](../../../API_Reference/source_zh_cn/arkui-cj/cj-graphic-drawing-ellipse.md), [Line](../../../API_Reference/source_zh_cn/arkui-cj/cj-graphic-drawing-line.md), [Path](../../../API_Reference/source_zh_cn/arkui-cj/cj-graphic-drawing-path.md), and [Rect](../../../API_Reference/source_zh_cn/arkui-cj/cj-graphic-drawing-rect.md). Using Circle as an example:

  ```cangjie
  Circle()

  Circle(width!: Length, height!: Length)
  ```

  This interface is used to draw a circle on the page. The `width` parameter sets the width of the circle, and the `height` parameter sets the height of the circle. The diameter of the circle is determined by the smaller of the width and height values.

  ```cangjie
  Circle(width: 150, height: 150)
  ```

  ![create2](figures/create2.jpg)

## Shape Viewport

```cangjie
viewPort(x!: Length, y!: Length, width!: Length, height!: Length)
```

The shape viewport specifies a rectangle in user space that maps to the viewport boundaries established for the associated SVG element. The viewport attribute includes four optional parameters: `x` and `y` represent the coordinates of the top-left corner of the viewport, and `width` and `height` represent its dimensions.

The following three examples illustrate the specific usage of the viewport:

- Scaling shapes using the viewport.

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
              Row() {
                  Column {
                      // Draw a circle with width and height of 75
                      Text('Original size Circle component')
                      Circle(width: 75, height: 75).fill(0XE87361)
                  }
              }
              Row() {
                  Column {
                      // Create a Shape component with width and height of 150, yellow background, and a viewport of 75x75. Fill the viewport with a blue rectangle and draw a circle with a diameter of 75 inside the viewport.
                      // After drawing, the viewport will scale up by a factor of 2 based on the component dimensions.
                      Text('Scaled-up Circle component inside Shape')
                      Shape() {
                          Rect().width(100.percent).height(100.percent).fill(0X0097D4)
                          Circle(width: 75, height: 75).fill(0XE87361)
                      }
                      .viewPort(x: 0, y: 0, width: 75, height: 75)
                      .width(150)
                      .height(150)
                      .backgroundColor(0XF5DC62)
                  }
                  Column {
                      // Create a Shape component with width and height of 150, yellow background, and a viewport of 300x300. Fill the viewport with a green rectangle and draw a circle with a diameter of 75 inside the viewport.
                      // After drawing, the viewport will scale down by a factor of 2 based on the component dimensions.
                      Text('Scaled-down Circle component inside Shape')
                      Shape() {
                          Rect().width(100.percent).height(100.percent).fill(0XBDDB69)
                          Circle(width: 75, height: 75).fill(0XE87361)
                      }
                      .viewPort(x: 0, y: 0, width: 300, height: 300)
                      .width(150)
                      .height(150)
                      .backgroundColor(0XF5DC62)
                  }
              }
          }.width(100.percent)
      }
  }
  ```

  ![drawing2](figures/drawing2.jpg)

- Create a Shape component with width and height of 300, yellow background, and a viewport of 300x300. Fill the viewport with a blue rectangle and draw a circle with a radius of 75 inside the viewport.

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
              Shape() {
                  Rect().width(100.percent).height(100.percent).fill(0X0097D4)
                  Circle( width: 150, height: 150 ).fill(0XE87361)
              }
              .viewPort(x: 0, y: 0, width: 300, height: 300)
              .width(300)
              .height(300)
              .backgroundColor(0XF5DC62)
          }.width(100.percent)
      }
  }
  ```

  ![viewport(2)](figures/viewport(2).jpg)

- Create a Shape component with width and height of 300, yellow background, and a viewport of 300x300. Fill the viewport with a blue rectangle and draw a circle with a radius of 75 inside the viewport. Translate the viewport 150 units to the right and 150 units down.

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
              Shape() {
                  Rect().width(100.percent).height(100.percent).fill(0X0097D4)
                  Circle( width: 150, height: 150 ).fill(0XE87361)
              }
              .viewPort(x: -150, y: -150, width: 300, height: 300)
              .width(300)
              .height(300)
              .backgroundColor(0XF5DC62)
          }.width(100.percent)
      }
  }
  ```

  ![viewport(3)](figures/viewport(3).jpg)

## Custom Styles

Drawing components support various attributes for customizing their appearance.

- Use `fill` to set the fill color of the component.

  ```cangjie
  Path()
      .width(100)
      .height(100)
      .commands('M150 0 L300 300 L0 300 Z')
      .fill(0xE87361)
      .strokeWidth(0)
  ```

  ![drawing3](figures/drawing3.jpg)

- Use `stroke` to set the border color of the component.

  ```cangjie
  Path()
      .width(100)
      .height(100)
      .fillOpacity(0)
      .commands('M150 0 L300 300 L0 300 Z')
      .stroke(Color.RED)
  ```

  ![stroke](figures/stroke.png)

- Use `strokeOpacity` to set the border transparency.

  ```cangjie
  Path()
      .width(100)
      .height(100)
      .fillOpacity(0)
      .commands('M150 0 L300 300 L0 300 Z')
      .stroke(Color.RED)
      .strokeWidth(10)
      .strokeOpacity(0.2)
  ```

  ![strokeopacity](figures/strokeopacity.jpg)

- Use `strokeLineJoin` to set the corner style for lines. The corner styles are Bevel (beveled corners), Miter (sharp corners), and Round (rounded corners).

  ```cangjie
  Polyline()
      .width(100)
      .height(100)
      .fillOpacity(0)
      .stroke(Color.RED)
      .strokeWidth(8)
      .points([(20, 0), (0, 100), (100, 90)])
      // Set the line join style to rounded
      .strokeLineJoin(LineJoinStyle.Round)
  ```

  ![strokeLineJoin](figures/strokeLineJoin.jpg)

- Use `strokeMiterLimit` to set the limit for the ratio of the miter length to the stroke width. The miter length is the distance from the outer intersection point to the inner intersection point of the border. The stroke width is the value of the `strokeWidth` attribute. The `strokeMiterLimit` value must be greater than or equal to 1 and takes effect when `strokeLineJoin` is set to `LineJoinStyle.Miter`.

 <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry

  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*
  import std.math.sin

  @Entry
  @Component
  class EntryView {
      func build() {
          Row() {
              Polyline()
                  .width(100)
                  .height(100)
                  .fillOpacity(0)
                  .stroke(Color.RED)
                  .strokeWidth(10)
                  .points([(20, 0), (20, 100), (100, 100)])
                  // Set the line join style to miter
                  .strokeLineJoin(LineJoinStyle.Miter)
                  // Set the ratio of miter length to stroke width
                  .strokeMiterLimit(1.0/sin(45.0))
              Polyline()
                  .width(100)
                  .height(100)
                  .fillOpacity(0)
                  .stroke(Color.RED)
                  .strokeWidth(10)
                  .points([(20, 0), (20, 100), (100, 100)])
                  .strokeLineJoin(LineJoinStyle.Miter)
                  .strokeMiterLimit(1.42)
          }
      }
  }
  ```

  ![drawing1](figures/drawing1.jpg)

- Use `antiAlias` to enable or disable anti-aliasing. The default value is `true` (anti-aliasing enabled).

  ```cangjie
  // Enable anti-aliasing
  Circle()
      .width(150)
      .height(200)
      .fillOpacity(0)
      .strokeWidth(5)
      .stroke(Color.BLACK)
  ```

  ![antiAliasTrue](figures/antiAliasTrue.png)

  ```cangjie
  // Disable anti-aliasing
  Circle()
      .width(150)
      .height(200)
      .fillOpacity(0)
      .strokeWidth(5)
      .stroke(Color.BLACK)
      .antiAlias(false)
  ```

  ![antiAliasFalse](figures/antiAliasFalse.jpg)

## Scenario Examples

### Drawing Closed Paths

Draw a closed path at point (-80, -5) of the Shape, with fill color 0x317AF7, stroke width 3, border color red, and corner style set to sharp corners (default value).

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(10) {
            Shape() {
                Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
            }
            .viewPort( x: -80, y: -5, width: 500, height: 300 )
            .fill(0x317AF7)
            .stroke(Color.RED)
            .strokeWidth(3)
            .strokeLineJoin(LineJoinStyle.Miter)
            .strokeMiterLimit(5)
        }.width(100.percent).margin( top: 15 )
    }
}
```

![scene1](figures/scene1.jpg)

### Drawing Circles and Rings

Draw a circle with diameter 150, and a ring with diameter 150 and red dashed stroke (when width and height settings are inconsistent, the shorter side is used as the diameter).

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(10) {
            // Draw a circle with diameter 150
            Circle( width: 150, height: 150 )
            // Draw a ring with diameter 150 and red dashed stroke
            Circle()
                .width(150)
                .height(200)
                .fillOpacity(0)
                .strokeWidth(3)
                .stroke(Color.RED)
                .strokeDashArray([1, 2])
        }.width(100.percent).margin( top: 15 )
    }
}
```

![Scenario 2](figures/scene2.png)
