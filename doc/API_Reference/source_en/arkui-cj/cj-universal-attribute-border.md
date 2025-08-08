# Border Settings

Configure the border style of components.

## func border(Length, ResourceColor, Length, BorderStyle)

```cangjie
public func border(width!: Length, color!: ResourceColor = Color.BLACK, radius!: Length = 0.vp, style!: BorderStyle = BorderStyle.Solid): This
```

**Function:** Sets the border style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :---------- | :---------- | :------- | :-------- | :--------------------------------------------------|
| width | [Length](./cj-common-types.md#interface-length) | Yes | - | **Named parameter.** Border width. |
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | No | Color.BLACK | **Named parameter.** Border color. |
| radius | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Border corner radius. |
| style | [BorderStyle](./cj-common-types.md#enum-borderstyle) | No | BorderStyle.Solid | **Named parameter.** Border style. |

## func borderStyle(BBorderStyle)

```cangjie
public func borderStyle(style: BorderStyle): This
```

**Function:** Sets the border line style of an element.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :-------- | :---------- | :------- | :------ | :------- |
| style | [BorderStyle](./cj-common-types.md#enum-borderstyle) | Yes | - | The border style of the element.<br>Initial value: BorderStyle.Solid. |

## func borderWidth(Length)

```cangjie
public func borderWidth(width: Length): This
```

**Function:** Sets the border width.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :-------- | :---------- | :------- | :------ | :------- |
| width | [Length](./cj-common-types.md#interface-length) | Yes | - | Sets the border width of the element. Percentage values are not supported. |

## func borderWidth(EdgeWidths)

```cangjie
public func borderWidth(edgeWidths: EdgeWidths): This
```

**Function:** Sets the border width.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :------- | :------ | :------- |
| edgeWidths | [EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths) | Yes | - | Sets the border width of the element. Percentage values are not supported. |

## func borderColor(ResourceColor)

```cangjie
public func borderColor(color: ResourceColor): This
```

**Function:** Sets the border color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :---------- | :------- | :------ |
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | The border color of the element.<br>Initial value: Color.BLACK. |

## func borderRadius(Length)

```cangjie
public open func borderRadius(radius: Length): This
```

**Function:** Sets the border corner radius. The maximum corner radius is limited by the component dimensions and cannot exceed half of the component's width or height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------ | :---------- | :------- | :-------- | :---------|
| radius | [Length](./cj-common-types.md#interface-length) | Yes | - | The border corner radius of the element, supporting percentage values (relative to component width). After setting the radius, you can use the [clip](./cj-universal-attribute-shapclip.md#func-clipbool) property to clip child components that exceed the parent component bounds. |

## func borderRadius(Length, Length, Length, Length)

```cangjie
public func borderRadius(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp, bottomRight!: Length = 0.vp): This
```

**Function:** Sets the border corner radius. The maximum corner radius is limited by the component dimensions and cannot exceed half of the component's width or height.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :---------- | :---------- | :------- | :-------- | :---------|
| topLeft | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top-left corner radius. |
| topRight | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top-right corner radius. |
| bottomLeft | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom-left corner radius. |
| bottomRight | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom-right corner radius. |

## Basic Type Definitions

### class LocalizedEdgeWidths

```cangjie
public class LocalizedEdgeWidths {
    public var bottom: Option<Length>
    public var end: Option<Length>
    public var start: Option<Length>
    public var top: Option<Length>
    public init(
        bottom!: Option<Length> = Option.None,
        end!: Option<Length> = Option.None,
        start!: Option<Length> = Option.None,
        top!: Option<Length> = Option.None
    )
}
```

**Function:** Border width type, used to describe the width of component borders in different directions. At least one parameter must be provided when initializing this object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### var bottom

```cangjie
public var bottom: Option<Length>
```

**Function:** Bottom border width.

**Type:** Option\<[Length](./cj-common-types.md#interface-length)>

**Read-Write Access:** Readable and Writable

**Since:** 19

#### var end

```cangjie
public var end: Option<Length>
```

**Function:** Right border width (left border width in right-to-left display languages).

**Type:** Option\<[Length](./cj-common-types.md#interface-length)>

**Read-Write Access:** Readable and Writable

**Since:** 19

#### var start

```cangjie
public var start: Option<Length>
```

**Function:** Left border width (right border width in right-to-left display languages).

**Type:** Option\<[Length](./cj-common-types.md#interface-length)>

**Read-Write Access:** Readable and Writable

**Since:** 19

#### var top

```cangjie
public var top: Option<Length>
```

**Function:** Top border width.

**Type:** Option\<[Length](./cj-common-types.md#interface-length)>

**Read-Write Access:** Readable and Writable

**Since:** 19

#### init(Option\<Length>, Option\<Length>, Option\<Length>, Option\<Length>)

```cangjie
public init(bottom!: Option<Length> = Option.None, end!: Option<Length> = Option.None, start!: Option<Length> = Option.None, top!: Option<Length> = Option.None)
```

**Function:** Constructs a LocalizedEdgeWidths object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :---------- | :------- | :------ |
| bottom | Option\<[Length](./cj-common-types.md#interface-length)> | No | Option.None | **Named parameter.** Bottom border width. |
| end | Option\<[Length](./cj-common-types.md#interface-length)> | No | Option.None | **Named parameter.** Right border width (left border width in right-to-left display languages). |
| start | Option\<[Length](./cj-common-types.md#interface-length)> | No | Option.None | **Named parameter.** Left border width (right border width in right-to-left display languages). |
| top | Option\<[Length](./cj-common-types.md#interface-length)> | No | Option.None | **Named parameter.** Top border width. |

### class EdgeColors

```cangjie
public class EdgeColors {
    public var bottom: Option<ResourceColor>
    public var left: Option<ResourceColor>
    public var top: Option<ResourceColor>
    public var right: Option<ResourceColor>
    public init(
        bottom!: Option<ResourceColor> = Option.None,
        left!: Option<ResourceColor> = Option.None,
        top!: Option<ResourceColor> = Option.None,
        right!: Option<ResourceColor> = Option.None
    )
}
```

**Function:** Border color type, used to describe the color of component borders in different directions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### var bottom

```cangjie
public var bottom: Option<ResourceColor>
```

**Function:** Bottom border color.

**Type:** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**Read-Write Access:** Readable and Writable

**Since:** 19

#### var left

```cangjie
public var left: Option<ResourceColor>
```

**Function:** Left border color.

**Type:** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**Read-Write Access:** Readable and Writable

**Since:** 19

#### var right

```cangjie
public var right: Option<ResourceColor>
```

**Function:** Right border color.

**Type:** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>

**Read-Write Access:** Readable and Writable**Initial Version:** 19  

#### var top  

```cangjie  
public var top: Option<ResourceColor>  
```  

**Description:** The color of the top border.  

**Type:** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### init(Option\<ResourceColor>, Option\<ResourceColor>, Option\<ResourceColor>, Option\<ResourceColor>)  

```cangjie  
public init(bottom!: Option<ResourceColor> = Option.None, left!: Option<ResourceColor> = Option.None, top!: Option<ResourceColor> = Option.None, right!: Option<ResourceColor> = Option.None)  
```  

**Description:** Constructs an object of type `EdgeColors`.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 19  

**Parameters:**  

| Name   | Type                                      | Required | Default      | Description |  
| :----- | :---------------------------------------- | :------- | :----------- | :---------- |  
| bottom | Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)> | No       | Option.None  | **Named parameter.** The width of the bottom border. |  
| left   | Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)> | No       | Option.None  | **Named parameter.** The width of the left border. |  
| top    | Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)> | No       | Option.None  | **Named parameter.** The width of the top border. |  
| right  | Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)> | No       | Option.None  | **Named parameter.** The width of the right border. |  

### class LocalizedEdgeColors  

```cangjie  
public class LocalizedEdgeColors {  
    public var bottom: Option<ResourceColor>  
    public var end: Option<ResourceColor>  
    public var start: Option<ResourceColor>  
    public var top: Option<ResourceColor>  
    public init(  
        bottom!: Option<ResourceColor> = Option.None,  
        end!: Option<ResourceColor> = Option.None,  
        start!: Option<ResourceColor> = Option.None,  
        top!: Option<ResourceColor> = Option.None  
    )  
}  
```  

**Description:** Border colors, used to describe the colors of the four edges of a component's border.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 19  

#### var bottom  

```cangjie  
public var bottom: Option<ResourceColor>  
```  

**Description:** The color of the bottom border.  

**Type:** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### var end  

```cangjie  
public var end: Option<ResourceColor>  
```  

**Description:** The color of the right border. In right-to-left display language modes, it represents the left border color.  

**Type:** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### var start  

```cangjie  
public var start: Option<ResourceColor>  
```  

**Description:** The color of the left border. In right-to-left display language modes, it represents the right border color.  

**Type:** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### var top  

```cangjie  
public var top: Option<ResourceColor>  
```  

**Description:** The color of the top border.  

**Type:** Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### init(Option\<ResourceColor>, Option\<ResourceColor>, Option\<ResourceColor>, Option\<ResourceColor>)  

```cangjie  
public init(bottom!: Option<ResourceColor> = Option.None, end!: Option<ResourceColor> = Option.None, start!: Option<ResourceColor> = Option.None, top!: Option<ResourceColor> = Option.None)  
```  

**Description:** Constructs an object of type `LocalizedEdgeColors`.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 19  

**Parameters:**  

| Name   | Type                                      | Required | Default      | Description |  
| :----- | :---------------------------------------- | :------- | :----------- | :---------- |  
| top    | Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)> | No       | Option.None  | **Named parameter.** The width of the top border. |  
| start  | Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)> | No       | Option.None  | **Named parameter.** The color of the left border. In right-to-left display language modes, it represents the right border color. |  
| bottom | Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)> | No       | Option.None  | **Named parameter.** The width of the bottom border. |  
| end    | Option\<[ResourceColor](./cj-common-types.md#interface-resourcecolor)> | No       | Option.None  | **Named parameter.** The width of the right border. In right-to-left display language modes, it represents the left border color. |  

### class LocalizedBorderRadiuses  

```cangjie  
public class LocalizedBorderRadiuses {  
    public var bottomEnd: Option<Length>  
    public var bottomStart: Option<Length>  
    public var topEnd: Option<Length>  
    public var topStart: Option<Length>  
    public init(  
        bottomEnd!: Option<Length> = Option.None,  
        bottomStart!: Option<Length> = Option.None,  
        topEnd!: Option<Length> = Option.None,  
        topStart!: Option<Length> = Option.None  
    )  
}  
```  

**Description:** Border radius type, used to describe the radius of a component's border corners.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 19  

#### var bottomEnd  

```cangjie  
public var bottomEnd: Option<Length>  
```  

**Description:** The radius of the bottom-right corner. In right-to-left display language modes, it represents the bottom-left corner radius.  

**Type:** Option\<[Length](./cj-common-types.md#interface-length)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### var bottomStart  

```cangjie  
public var bottomStart: Option<Length>  
```  

**Description:** The radius of the bottom-left corner. In right-to-left display language modes, it represents the bottom-right corner radius.  

**Type:** Option\<[Length](./cj-common-types.md#interface-length)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### var topEnd  

```cangjie  
public var topEnd: Option<Length>  
```  

**Description:** The radius of the top-right corner. In right-to-left display language modes, it represents the top-left corner radius.  

**Type:** Option\<[Length](./cj-common-types.md#interface-length)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### var topStart  

```cangjie  
public var topStart: Option<Length>  
```  

**Description:** The radius of the top-left corner. In right-to-left display language modes, it represents the top-right corner radius.  

**Type:** Option\<[Length](./cj-common-types.md#interface-length)>  

**Read-Write Capability:** Read-Write  

**Initial Version:** 19  

#### init(Option\<Length>, Option\<Length>, Option\<Length>, Option\<Length>)  

```cangjie  
public init(bottomEnd!: Option<Length> = Option.None, bottomStart!: Option<Length> = Option.None, topEnd!: Option<Length> = Option.None, topStart!: Option<Length> = Option.None)  
```  

**Description:** Constructs an object of type `LocalizedBorderRadiuses`.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 19  

**Parameters:**  

| Name        | Type                              | Required | Default      | Description |  
| :---------- | :-------------------------------- | :------- | :----------- | :---------- |  
| bottomEnd   | Option\<[Length](./cj-common-types.md#interface-length)> | No       | Option.None  | **Named parameter.** The radius of the bottom-right corner. In right-to-left display language modes, it represents the bottom-left corner radius. |  
| bottomStart | Option\<[Length](./cj-common-types.md#interface-length)> | No       | Option.None  | **Named parameter.** The radius of the bottom-left corner. In right-to-left display language modes, it represents the bottom-right corner radius. |  
| topEnd      | Option\<[Length](./cj-common-types.md#interface-length)> | No       | Option.None  | **Named parameter.** The radius of the top-right corner. In right-to-left display language modes, it represents the top-left corner radius. |  
| topStart    | Option\<[Length](./cj-common-types.md#interface-length)> | No       | Option.None  | The radius of the top-left corner. In right-to-left display language modes, it represents the top-right corner radius. |  

### class EdgeWidths  

```cangjie  
public class EdgeWidths {  
    public var top: Length  
    public var right: Length  
    public var bottom: Length  
    public var left: Length  
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)  
}  
```  

**Description:** Sets the border width of the popup backplate. When introducing this object, at least one parameter must be provided.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Initial Version:** 12  

#### var top  

```cangjie  
public var top: Length  
```  

**Description:** The width of the top border.  

**Type:** [Length](./cj-common-types.md#interface-length)  

**Read-Write Capability:** Read-Write  

**Initial Version:** 12  

#### var right  

```cangjie  
public var right: Length  
```  

**Description:** The width of the right border.  

**Type:** [Length](./cj-common-types.md#interface-length)  

**Read-Write Capability:** Read-Write  

**Initial Version:** 12  

#### var left  

```cangjie  
public var left: Length  
```  

**Description:** The width of the left border.  

**Type:** [Length](./cj-common-types.md#interface-length)  

**Read-Write Capability:** Read-Write  

**Initial Version:** 12  

#### var bottom
```cangjie
public var bottom: Length
```

**Function:** Bottom border width.

**Type:** [Length](./cj-common-types.md#interface-length)

**Access:** Read-write

**Since:** 12

#### init(left!: Length = 0.vp, right!: Length = 0.vp, top!: Length = 0.vp, bottom!: Length = 0.vp)

```cangjie
public init(left!: Length = 0.vp, right!: Length = 0.vp, top!: Length = 0.vp, bottom!: Length = 0.vp)
```

**Function:** Constructs an EdgeWidths object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
| :--- | :--- | :--- | :--- |:--- |
| left | [Length](./cj-common-types.md#interface-length)  | No | 0.vp | **Named parameter.** Left border width. |
| right | [Length](./cj-common-types.md#interface-length)  | No | 0.vp | **Named parameter.** Right border width. |
| top | [Length](./cj-common-types.md#interface-length)  | No | 0.vp | **Named parameter.** Top border width. |
| bottom | [Length](./cj-common-types.md#interface-length)  | No | 0.vp | **Named parameter.** Bottom border width. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Flex(FlexParams(justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center)) {
                Text("dashed")
                .borderStyle(BorderStyle.Dashed).borderWidth(5).borderColor(0xAFEEEE).borderRadius(10)
                .width(120).height(120).textAlign(TextAlign.Center).fontSize(16)

                Text("dotted")
                .border(width: 5.px, color: Color(0x317AF7), radius: 10.px, style: BorderStyle.Dotted)
                .width(120).height(120).textAlign(TextAlign.Center).fontSize(16)
            }.width(100.percent).height(150)
        }
    }
}
```

![uni_border](figures/uni_border.png)