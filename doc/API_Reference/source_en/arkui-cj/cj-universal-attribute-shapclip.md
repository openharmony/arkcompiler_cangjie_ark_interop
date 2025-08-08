# Shape Clipping

Used for clipping and masking components.

## func clip(Bool)

```cangjie
public func clip(isClip: Bool): This
```

**Function:** Whether to clip the areas where child components exceed the bounds of the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| isClip  | Bool | Yes   | - | Whether to clip according to the parent container's edge contour.<br/>Initial value: false<br/>**Note:** true means clipping is performed, false means no clipping.<br/>When set to true, areas of child components exceeding the current component's bounds will not respond to bound gesture events.|

## func clip(CircleShape)

```cangjie
public func clip(shape: CircleShape): This
```

**Function:** Clips the current component according to the shape of [CircleShape](#class-circleshape).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| shape  | [CircleShape](#class-circleshape) | Yes   | - | The specified shape for clipping the current component.|

## func clip(EllipseShape)

```cangjie
public func clip(shape: EllipseShape): This
```

**Function:** Clips the current component according to the shape of [EllipseShape](#class-ellipseshape).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| shape  | [EllipseShape](#class-ellipseshape) | Yes   | - | The specified shape for clipping the current component.|

## func clip(RectShape)

```cangjie
public func clip(shape: RectShape): This
```

**Function:** Clips the current component according to the shape of [RectShape](#class-rectshape).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| shape  | [RectShape](#class-rectshape) | Yes   | - | The specified shape for clipping the current component.|

## func clip(PathShape)

```cangjie
public func clip(shape: PathShape): This
```

**Function:** Clips the current component according to the shape of [PathShape](#class-pathshape).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| shape  | [PathShape](#class-pathshape) | Yes   | - | The specified shape for clipping the current component.|

## func mask(CircleShape)

```cangjie
public func mask(shape: CircleShape): This
```

**Function:** Adds a [CircleShape](#class-circleshape) shaped mask to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| shape  | [CircleShape](#class-circleshape) | Yes   | - | The specified shape for masking the current component.|

## func mask(EllipseShape)

```cangjie
public func mask(shape: EllipseShape): This
```

**Function:** Adds an [EllipseShape](#class-ellipseshape) shaped mask to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| shape  | [EllipseShape](#class-ellipseshape) | Yes   | - | The specified shape for masking the current component.|

## func mask(RectShape)

```cangjie
public func mask(shape: RectShape): This
```

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Function:** Adds a [RectShape](#class-rectshape) shaped mask to the component.

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| shape  | [RectShape](#class-rectshape) | Yes   | - | The specified shape for masking the current component.|

## func mask(PathShape)

```cangjie
public func mask(shape: PathShape): This
```

**Function:** Adds a [PathShape](#class-pathshape) shaped mask to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
| shape  | [PathShape](#class-pathshape) | Yes   | - | The specified shape for masking the current component.|

## func mask(ProgressMask)

```cangjie
public func mask(value: ProgressMask): This
```

**Function:** Adds a [ProgressMask](#class-progressmask) shaped mask to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|value|[ProgressMask](#class-progressmask)|Yes|-|Adds a mask to the current component that can dynamically set progress, maximum value, and color.|

## Basic Type Definitions

### class ShapeAbstract

```cangjie
sealed abstract class ShapeAbstract {}
```

**Function:** Base class for CircleShape, RectShape, PathShape, and EllipseShape, redefining common member methods such as fill, height, offset, size, and width.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### func fill(ResourceColor)

```cangjie
public func fill(color: ResourceColor): This
```

**Function:** Sets the fill area color. Invalid values are handled as initial values.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|Yes|-|Fill area color.</br>Initial value: 0xff0000.|

#### func height(Length)

```cangjie
public func height(value: Length): This
```

**Function:** Sets the component's own height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|value|[Length](./cj-common-types.md#interface-length)|Yes|-|Component height.</br>Unit: vp.|

#### func offset(Length, Length)

```cangjie
public func offset(x!: Length, y!: Length): This
```

**Function:** Sets relative offset, shifting the component relative to its original layout position.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|x|[Length](./cj-common-types.md#interface-length)|Yes|-| **Named parameter.** X-axis coordinate.|
|y|[Length](./cj-common-types.md#interface-length)|Yes|-| **Named parameter.** Y-axis coordinate.|

#### func size(Length, Length)

```cangjie
 public func size(width!: Length, height!: Length): This
```

**Function:** Sets the component's width and height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|width|[Length](./cj-common-types.md#interface-length)|Yes|-| **Named parameter.** Component width.</br>Unit: vp.|
|height|[Length](./cj-common-types.md#interface-length)|Yes|-| **Named parameter.** Component height.</br>Unit: vp.|

#### func width(Length)

```cangjie
public func width(value: Length): This
```

**Function:** Sets the component's own width.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|value|[Length](./cj-common-types.md#interface-length)|Yes|-|Component width.</br>Unit: vp.|

### class CircleShape

```cangjie
public class CircleShape <: ShapeAbstract {
    public init()
    public init(width!: Length, height!: Length)
}
```

**Function:** Circular shape used for clip and mask interfaces.**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parent Type:**  

[ShapeAbstract](#class-shapeabstract)  

#### init()  

```cangjie  
public init()  
```  

**Description:** Constructs a circle with width 0 and height 0.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

#### init(length, length)  

```cangjie  
public init(width!: Length, height!: Length)  
```  

**Description:** Constructs a circle with specified width and height.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| width | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Width.<br>Initial value: 0.vp. |  
| height | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Height.<br>Initial value: 0.vp. |  

### class EllipseShape  

```cangjie  
public class EllipseShape <: ShapeAbstract {  
    public init()  
    public init(width!: Length, height!: Length)  
}  
```  

**Description:** Elliptical shape for clip and mask interfaces.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parent Type:**  

[ShapeAbstract](#class-shapeabstract)  

#### init()  

```cangjie  
public init()  
```  

**Description:** Constructs an ellipse with width 0 and height 0.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

#### init(length, length)  

```cangjie  
public init(width!: Length, height!: Length)  
```  

**Description:** Constructs an ellipse with specified width and height.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| width | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Width.<br>Initial value: 0.vp. |  
| height | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Height.<br>Initial value: 0.vp. |  

### class RectShape  

```cangjie  
public class RectShape <: ShapeAbstract {  
    public init()  
    public init(width!: Length, height!: Length)  
}  
```  

**Description:** Rectangular shape for clip and mask interfaces.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parent Type:**  

[ShapeAbstract](#class-shapeabstract)  

#### init()  

```cangjie  
public init()  
```  

**Description:** Constructs a rectangle with width 0 and height 0.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

#### init(Length, Length)  

```cangjie  
public init(width!: Length, height!: Length)  
```  

**Description:** Constructs a rectangle with specified width and height.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| width | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Width.<br>Initial value: 0.vp. |  
| height | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Height.<br>Initial value: 0.vp. |  

#### func radiusWidth(Length)  

```cangjie  
public func radiusWidth(value: Length): This  
```  

**Description:** Sets the width of rounded corners. If only width is set, height will match width. Invalid values are treated as initial values.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| value | [Length](./cj-common-types.md#interface-length) | Yes | - | Width of rounded corners.<br>Initial value: 0.vp. |  

#### func radiusHeight(Length)  

```cangjie  
public func radiusHeight(value: Length): This  
```  

**Description:** Sets the height of rounded corners. If only height is set, width will match height. Invalid values are treated as initial values.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| value | [Length](./cj-common-types.md#interface-length) | Yes | - | Height of rounded corners.<br>Initial value: 0.vp. |  

#### func radius(Length)  

```cangjie  
public func radius(value: Length): This  
```  

**Description:** Sets the radius of rounded corners. Invalid values are treated as initial values.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| value | [Length](./cj-common-types.md#interface-length) | Yes | - | Radius of rounded corners.<br>Initial value: 0.vp. |  

### class PathShape  

```cangjie  
public class PathShape <: ShapeAbstract {  
    public init()  
    public init(commands!: String)  
    public init(width!: Length, height!: Length, commands!: String = "")  
}  
```  

**Description:** Custom path shape for clip and mask interfaces.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parent Type:**  

[ShapeAbstract](#class-shapeabstract)  

#### init()  

```cangjie  
public init()  
```  

**Description:** Constructs a custom shape with default parameters.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

#### init(String)  

```cangjie  
public init(commands!: String)  
```  

**Description:** Constructs a custom shape based on path drawing command strings.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| commands | String | Yes | - | **Named parameter.** Path drawing command strings. |  

#### init(Length, Length, String)  

```cangjie  
public init(width!: Length, height!: Length, commands!: String = "")  
```  

**Description:** Constructs a custom shape based on specified dimensions and path drawing command strings.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| width | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Width of the path's bounding rectangle. |  
| height | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Height of the path's bounding rectangle. |  
| commands | String | No | "" | **Named parameter.** Path drawing command strings. |  

### class ProgressMask  

```cangjie  
public class ProgressMask {  
    public init(value!:Float32,total!:Float32,color!:Color)  
}  
```  

**Description:** Shape for setting mask progress, maximum value, and mask color.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 19  

#### init(Float32, Float32, Color)  

```cangjie  
public init(value!:Float32,total!:Float32,color!:Color)  
```  

**Description:** Constructs a ProgressMask object.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 19  

**Parameters:**  

| Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| value | Float32 | Yes | - | Current value of the progress mask. |  
| total | Float32 | Yes | - | Maximum value of the progress mask. |  
| color | [Color](./cj-common-types.md#class-color) | Yes | - | Color of the progress mask. |  

#### func updateProgress(Float32)
```cangjie
public func updateProgress(number: Float32): Unit
```

**Function:** Updates the progress value of the progress mask.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|number|Float32|Yes| - | Current value of the progress mask.|

#### func updateColor(Color)

```cangjie
public func updateProgress(color: Color): Unit
```

**Function:** Updates the color of the progress mask.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|color|[Color](./cj-common-types.md#class-color)|Yes| - | Color of the progress mask.|

#### func enableBreathingAnimation(Bool)

```cangjie
public func enableBreathingAnimation(value:Bool):Unit
```

**Function:** Toggles the breathing halo animation when progress is full. The breathing halo animation is disabled by default.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|value|Bool|Yes| - | Whether to enable the breathing halo animation.</br> Set to `true` to enable the breathing halo animation. Initial value: `false`. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    func build() {
        Column {
            Text("clip").fontSize(12)
            Row() {
              Image(@r(app.media.startIcon)).width(300).height(180)
            }.clip(true).borderRadius(20)
            Text("first end").fontSize(12)
            Image(@r(app.media.startIcon)).width(300).height(180).clip(CircleShape(width: 280, height:160))
            Text("second end").fontSize(12)
            Text("mask").fontSize(12)
            Image(@r(app.media.startIcon)).mask(RectShape(width: 500, height: 140).fill(Color.GRAY))
            .width(500).height(140)
            Text("first end").fontSize(12)
            Image(@r(app.media.startIcon)).mask(CircleShape(width: 140, height: 140).fill(Color.GRAY))
            .width(500).height(140)
            Text("second end").fontSize(12)
        }
    }
}
```

![uni_shape_clip](figures/uni_shape_clip.png)