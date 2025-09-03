# ohos.base (Common Callback Information)

This module defines common exception information that occurs during interface calls.

## Import Module

```cangjie
import ohos.base.*
```

## let Main

```cangjie
public let Main: MainThreadContext = MainThreadContext.instance_
```

**Functionality:** Main is actually an object of type MainThreadContext, indicating that the thread in this context will be bound to the main thread (UI thread).

**Type:** [MainThreadContext](#class-MainThreadContext)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## func launch(() -> Unit)

```cangjie
public func launch(task: () -> Unit): Unit
```

**Functionality:** Submits a task to the main thread for execution.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| task | ()->Unit | Yes | - | The task to execute. |

## interface CollectionEx

```cangjie
public interface CollectionEx<T> {
    prop size: Int64
    operator func [](idx: Int64, value!: T): Unit
    operator func [](idx: Int64): T
}
```

**Functionality:** Array type. Internal interface, used by the framework.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop size

```cangjie
prop size: Int64
```

**Functionality:** Array size.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func [](Int64, T)

```cangjie
operator func [](idx: Int64, value!: T): Unit
```

**Functionality:** Writes an array element at the specified index.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| idx | Int64 | Yes | - | Index value. |
| value | T | Yes | - | **Named parameter.** The value to write. |

### func \[](Int64)

```cangjie
operator func [](idx: Int64): T
```

**Functionality:** Retrieves an array element by index.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| idx | Int64 | Yes | - | Index value. |

**Return Value:**

| Type | Description |
|:----|:----|
| T | Array element. |

## interface Length

```cangjie
public interface Length {
    prop value: Float64
    prop unitType: LengthType
}
```

**Functionality:** Float64, Int64, and AppResource all implement the Length interface type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop unitType

```cangjie
prop unitType: LengthType
```

**Functionality:** Used by the UI framework.

**Type:** [LengthType](#enum-LengthType)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop value

```cangjie
prop value: Float64
```

**Functionality:** Used by the UI framework.

**Type:** Float64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## interface LengthProp

```cangjie
public interface LengthProp {
    prop px: Length
    prop vp: Length
    prop fp: Length
    prop percent: Length
    prop lpx: Length
}
```

**Functionality:** Pixel units. Used by the UI framework.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop fp

```cangjie
prop fp: Length
```

**Functionality:** Font pixels, similar to vp, adapt to screen density changes and adjust with system font size settings.

**Type:** [Length](#interface-Length)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop lpx

```cangjie
prop lpx: Length
```

**Functionality:** Logical pixel unit for viewports. The l.px unit is the ratio of the actual screen width to the logical width (configured via designWidth), with a default designWidth of 720. When designWidth is 720, on a screen with an actual width of 1440 physical pixels, 1l.px equals 2.px in size.

**Type:** [Length](#interface-Length)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop percent

```cangjie
prop percent: Length
```

**Functionality:** Percentage type, used to describe lengths in percent pixel units.

**Type:** [Length](#interface-Length)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop px

```cangjie
prop px: Length
```

**Functionality:** Screen physical pixel unit.

**Type:** [Length](#interface-Length)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop vp

```cangjie
prop vp: Length
```

**Functionality:** Screen density-dependent pixels, converted to screen physical pixels based on screen pixel density. When no unit is specified, the default unit is vp. On a screen with an actual width of 1440 physical pixels, 1vp is approximately equal to 3px.<br/>**Note:** <br/> The ratio of vp to px depends on the screen pixel density.

**Type:** [Length](#interface-Length)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## interface ResourceColor

```cangjie
public interface ResourceColor {
    func toUInt32(): UInt32
}
```

**Functionality:** Color, UInt32, Int64, and AppResource all implement the ResourceColor interface type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func toUInt32()

```cangjie
func toUInt32(): UInt32
```

**Functionality:** Converts to a Uint32 color value.

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Uint32 color value. |

## interface ResourceStr

```cangjie
public interface ResourceStr {}
```

**Functionality:** String type, used to describe the types that can be used for string parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## class Color

```cangjie
public class Color <: ResourceColor {
    public static let Black: Color = Color(0xff000000)
    public static let Blue: Color = Color(0xff0000ff)
    public static let Gray: Color = Color(0xff808080)
    public static let Green: Color = Color(0xff008000)
    public static let Red: Color = Color(0xffff0000)
    public static let White: Color = Color(0xffffffff)
    public static let Transparent: Color = Color(0, 0, 0, alpha: 0.0)
    public init(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = 1.0)
    public init(value: UInt32)
}
```

**Functionality:** Color type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [ResourceColor](#interface-ResourceColor)

### static let Black

```cangjie
public static let Black: Color = Color(0xff000000)
```

**Functionality:** Black.

**Type:** [Color](#class-Color)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let Blue

```cangjie
public static let Blue: Color = Color(0xff0000ff)
```

**Functionality:** Blue.

**Type:** [Color](#class-Color)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let Gray

```cangjie
public static let Gray: Color = Color(0xff808080)
```

**Functionality:** Gray.

**Type:** [Color](#class-Color)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let Green

```cangjie
public static let Green: Color = Color(0xff008000)
```

**Functionality:** Green.

**Type:** [Color](#class-Color)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let Red

```cangjie
public static let Red: Color = Color(0xffff0000)
```

**Functionality:** Red.

**Type:** [Color](#class-Color)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let Transparent

```cangjie
public static let Transparent: Color = Color(0, 0, 0, alpha: 0.0)
```

**Functionality:** Transparent.

**Type:** [Color](#class-Color)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let White

```cangjie
public static let White: Color = Color(0xffffffff)
```

**Functionality:** White.

**Type:** [Color](#class-Color)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(UInt8, UInt8, UInt8, Float32)

```cangjie
public init(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = 1.0)
```

**Functionality:** Constructs a Color type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| red | UInt8 | Yes | - | Red channel value in RGB. |
| green | UInt8 | Yes | - | Green channel value in RGB. |
| blue | UInt8 | Yes | - | Blue channel value in RGB. |
| alpha | Float32 | No | 1.0 | **Named parameter.** Transparency channel value, range [0.0, 1.0]. |

### init(UInt32)

```cangjie
public init(value: UInt32)
```

**Functionality:** Constructs a Color type object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | UInt32 | Yes | - | Uint32 color value. The alpha, R, G, and B channels each occupy 8 bits of the input in order. If only R, G, and B channels are input, the alpha channel defaults to 0xff. |

### func toUInt32()

```cangjie
public func toUInt32(): UInt32
```

**Functionality:** Converts to a Uint32 color value.

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Uint32 color value. |## class MainThreadContext

```cangjie
public class MainThreadContext <: ThreadContext {}
```

**Function:** Thread context used by the framework.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [ThreadContext](#class-threadcontext)

### func end()

```cangjie
public func end(): Unit
```

**Function:** Used by the UI framework.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func hasEnded()

```cangjie
public func hasEnded(): Bool
```

**Function:** Used by the UI framework.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|-|

## class ReuseParams

```cangjie
public class ReuseParams {
    public init(arr: Array<(String, Any)>)
}
```

**Function:** Parameters for the aboutToReuse lifecycle function, from which developers can obtain the construction parameters of reusable components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Array\<(String,Any)>)

```cangjie
public init(arr: Array<(String, Any)>)
```

**Function:** Creates a ReuseParams object, typically not invoked by developers.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|arr| Array\<(String, Any)> |Yes|-|Array containing tuples of component construction parameters.|

### func get\<T>(String)

```cangjie
public func get<T>(key: String): ?T
```

**Function:** Retrieves the corresponding construction parameter by key.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|key|String|Yes|-|Name of the construction parameter.|

**Return Value:**

|Type|Description|
|:----|:----|
|?T|Value of the construction parameter.|

## enum LengthType

```cangjie
public enum LengthType <: Length & Equatable<LengthType> {
    | px(Float64)
    | vp(Float64)
    | fp(Float64)
    | percent(Float64)
    | lpx(Float64)
    | ...
}
```

**Function:** Length type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Types:**

- [Length](#interface-length)
- Equatable\<LengthType>

### fp(Float64)

```cangjie
fp(Float64)
```

**Function:** Font pixel unit.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### lpx(Float64)

```cangjie
lpx(Float64)
```

**Function:** Logical pixel unit.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### percent(Float64)

```cangjie
percent(Float64)
```

**Function:** Percentage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### px(Float64)

```cangjie
px(Float64)
```

**Function:** Basic pixel unit.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### vp(Float64)

```cangjie
vp(Float64)
```

**Function:** Screen density unit.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop unitType

```cangjie
public prop unitType: LengthType
```

**Function:** Used by the UI framework.

**Type:** [LengthType](#enum-LengthType)

**Access:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### prop value

```cangjie
public prop value: Float64
```

**Function:** Used by the UI framework.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static func parse(Int32)

```cangjie
public static func parse(value: Int32): LengthType
```

**Function:** Constructs a LengthType instance based on the length type value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|value|Int32|Yes|-|Value of the length type.|

**Return Value:**

|Type|Description|
|:----|:----|
|[LengthType](#enum-LengthType)|LengthType instance.|

### func !=(LengthType)

```cangjie
public operator func !=(other: LengthType): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[LengthType](#enum-LengthType)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise false.|

### func ==(LengthType)

```cangjie
public operator func ==(other: LengthType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[LengthType](#enum-LengthType)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise false.|

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Retrieves the value of the enum.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int32|Value of the enum.|

## type Callback

```cangjie
public type Callback<T, V>=(T) -> V
```

**Function:** [Callback](#type-Callback) is an alias for the [(T) -> V](#type-callback) type.

## type VoidCallback

```cangjie
public type VoidCallback =() -> Unit
```

**Function:** [VoidCallback](#type-VoidCallback) is an alias for the [() -> Unit](#type-voidcallback) type.