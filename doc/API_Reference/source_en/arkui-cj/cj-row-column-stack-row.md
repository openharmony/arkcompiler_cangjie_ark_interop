# Row  

A container that arranges its children horizontally.  

## Child Components  

Can contain child components.  

## Creating the Component  

### init(Length, () -> Unit)  

```cangjie  
public init(space!: Length = 0.vp, child!: () -> Unit = {=>})  
```  

**Function:** Creates a Row container with horizontal spacing `space` between child components.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| space | [Length](cj-common-types.md#interface-length) | No | 0.vp | Horizontal spacing between child components. <br> Does not take effect if `space` is negative or `justifyContent` is set to `FlexAlign.SpaceBetween`, `FlexAlign.SpaceAround`, or `FlexAlign.SpaceEvenly`. <br> Default: 0, Unit: vp <br> **Note:** Valid values are numbers greater than or equal to 0. |  
| child | () -> Unit | No | { => } | Child components inside the container. |  

## Universal Attributes/Events  

Universal Attributes: All supported.  

Universal Events: All supported.  

## Component Attributes  

### func alignItems(VerticalAlign)  

```cangjie  
public func alignItems(value: VerticalAlign): This  
```  

**Function:** Sets the vertical alignment of child components.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| value | [VerticalAlign](cj-common-types.md#enum-verticalalign) | Yes | - | Vertical alignment of child components. <br> Default: `VerticalAlign.Center` |  

### func justifyContent(FlexAlign)  

```cangjie  
public func justifyContent(value: FlexAlign): This  
```  

**Function:** Sets the horizontal alignment of child components.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| value | [FlexAlign](cj-common-types.md#enum-flexalign) | Yes | - | Horizontal alignment of child components. <br> Default: `FlexAlign.Start` |  

> **Note:**  
>  
> In Row layout, if child components do not set [`flexShrink`](cj-universal-attribute-flexlayout.md#func-flexshrinkfloat64), they will not be compressed by default. This means the total size of all child components along the main axis may exceed the container's main axis size.