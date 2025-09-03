# Pixel Units

Cangjie provides 4 types of pixel units, using vp as the base measurement unit.

| Name | Description |
|:---|:---|
| px | Physical pixel unit of the screen. |
| vp | Density-independent pixel, converted to physical screen pixels based on screen pixel density. When a value has no unit specified, vp is the default unit. On a screen with an actual width of 1440 physical pixels, 1vp ≈ 3px.<br/>**Note:** <br/> The ratio between vp and px depends on the screen pixel density. |
| fp | Font pixel, similar to vp in adapting to screen density changes, and also adjusts with system font size settings. |
| lpx | Logical viewport pixel unit. The lpx unit represents the ratio between the actual screen width and the logical width (configured via designWidth, default value 720). When designWidth is 720, on a screen with an actual width of 1440 physical pixels, 1lpx equals 2px. |

## Import Module

```cangjie
import kit.ArkUI.*
```

## func fp2px(Length)

```cangjie
public func fp2px(value: Length): Option<Length>
```

**Function:** Converts a value in fp units to px units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The fp unit value to be converted. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)> | The converted value in px units. |

## func lpx2px(Length)

```cangjie
public func lpx2px(value: Length): Option<Length>
```

**Function:** Converts a value in lpx units to px units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The lpx unit value to be converted. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)> | The converted value in px units. |

## func px2fp(Length)

```cangjie
public func px2fp(value: Length): Option<Length>
```

**Function:** Converts a value in px units to fp units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The px unit value to be converted. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)> | The converted value in fp units. |

## func px2lpx(Length)

```cangjie
public func px2lpx(value: Length): Option<Length>
```

**Function:** Converts a value in px units to lpx units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The px unit value to be converted. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)> | The converted value in lpx units. |

## func px2vp(Length)

```cangjie
public func px2vp(value: Length): Option<Length>
```

**Function:** Converts a value in px units to vp units.<br>Note: By default, the conversion uses the virtual pixel ratio of the screen where the current UI instance resides. If no UI instance exists, the default screen's virtual pixel ratio is used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The px unit value to be converted. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)> | The converted value in vp units. |

## func vp2px(Length)

```cangjie
public func vp2px(value: Length): Option<Length>
```

**Function:** Converts a value in vp units to px units.<br>Note: By default, the conversion uses the virtual pixel ratio of the screen where the current UI instance resides. If no UI instance exists, the default screen's virtual pixel ratio is used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | The vp unit value to be converted. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)> | The converted value in px units. |