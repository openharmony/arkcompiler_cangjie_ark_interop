# ohos.display (Screen Properties)

Screen properties provide basic capabilities for managing display devices, including obtaining information about the default display device, retrieving information about all display devices, and monitoring the plugging and unplugging behavior of display devices.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func getAllDisplays()

```cangjie
public func getAllDisplays(): Array<Display>
```

**Description:** Retrieves all current Display objects.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Array\<[Display](#class-display)> | Returns all current display objects. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Screen Error Codes](../errorcodes/cj-errorcode-display.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1400001 | Invalid display or screen. |
  | 1400003 | This display manager service works abnormally. |

**Example:**

```cangjie
import kit.ArkUI.*
import ohos.base.*
import kit.PerformanceAnalysisKit.*
func getAllDisplaysExample() {
    try {
        let displayClass: Array<Display> = getAllDisplays()
        if (displayClass.size > 0) {
            println(displayClass[0].name)
        }
    } catch (exception: Exception) {
        Hilog.error(0, "display_test", exception.toString())
    }
}
```

## func getCurrentFoldCreaseRegion()

```cangjie
public func getCurrentFoldCreaseRegion(): FoldCreaseRegion
```

**Description:** Retrieves the fold crease region in the current display mode.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [FoldCreaseRegion](#class-foldcreaseregion) | FoldCreaseRegion object, returns the fold crease region of the device in the current display mode. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Screen Error Codes](../errorcodes/cj-errorcode-display.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1400003 | This display manager service works abnormally. |

**Example:**

```cangjie
import kit.ArkUI.*
import ohos.base.*
import kit.PerformanceAnalysisKit.*
func getCurrentFoldCreaseRegionExample() {
    try {
        let region = getCurrentFoldCreaseRegion()
        println(region.displayId)
    } catch (exception: Exception) {
        Hilog.error(0, "display_test", exception.toString())
    }
}
```

## func getDefaultDisplaySync()

```cangjie
public func getDefaultDisplaySync(): Display
```

**Description:** Retrieves the current default Display object.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [Display](#class-display) | Returns the default Display object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Screen Error Codes](../errorcodes/cj-errorcode-display.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1400001 | Invalid display or screen. |
  | 1400003 | This display manager service works abnormally. |

**Example:**

```cangjie
import kit.ArkUI.*
import ohos.base.*
import kit.PerformanceAnalysisKit.*
func getDefaultDisplaySyncExample() {
    try {
        let displayClass: Display = getDefaultDisplaySync()
        println(displayClass.name)
    } catch (exception: Exception) {
        Hilog.error(0, "display_test", exception.toString())
    }
}
```

## func getFoldDisplayMode()

```cangjie
public func getFoldDisplayMode(): FoldDisplayMode
```

**Description:** Retrieves the display mode of a foldable device.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [FoldDisplayMode](#enum-folddisplaymode) | FoldDisplayMode object, returns the current display mode of the foldable device. |

**Example:**

```cangjie
import kit.ArkUI.*
import ohos.base.*
import kit.PerformanceAnalysisKit.*
func getFoldDisplayModeExample() {
    try {
        let mode = getFoldDisplayMode()
        match (mode) {
            case FoldDisplayMode.FoldDisplayModeUnknown => Hilog.info(0, "display_test", "Unkown mode.")
            case FoldDisplayMode.FoldDisplayModeFull => Hilog.info(0, "display_test", "Full mode.")
            case FoldDisplayMode.FoldDisplayModeMain => Hilog.info(0, "display_test", "Main mode.")
            case FoldDisplayMode.FoldDisplayModeSub => Hilog.info(0, "display_test", "Sub mode.")
            case FoldDisplayMode.FoldDisplayModeCoordination => Hilog.info(0, "display_test", "Coordination mode.")
            case _ => throw Exception("can not get display mode.")
        }
    } catch (exception: Exception) {
        Hilog.error(0, "display_test", exception.toString())
    }
}
```

## func getFoldStatus()

```cangjie
public func getFoldStatus(): FoldStatus
```

**Description:** Retrieves the current fold status of a foldable device.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [FoldStatus](#enum-foldstatus) | FoldStatus object, returns the current fold status of the foldable device. |

**Example:**

```cangjie
import kit.ArkUI.*
import ohos.base.*
import kit.PerformanceAnalysisKit.*
func getFoldStatusExample() {
    try {
        let status = getFoldStatus()
        match (status) {
            case FoldStatus.FoldStatusUnknown => Hilog.info(0, "display_test", "Unkown status.")
            case FoldStatus.FoldStatusExpanded => Hilog.info(0, "display_test", "Expanded.")
            case FoldStatus.FoldStatusFolded => Hilog.info(0, "display_test", "Folded.")
            case FoldStatus.FoldStatusHalfFolded => Hilog.info(0, "display_test", "Half folded.")
            case _ => throw Exception("can not get fold status.")
        }
    } catch (exception: Exception) {
        Hilog.error(0, "display_test", exception.toString())
    }
}
```

## func isFoldable()

```cangjie
public func isFoldable(): Bool
```

**Description:** Checks whether the device is foldable.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Bool object, returns whether the current device is foldable. `true` indicates foldable, `false` indicates non-foldable. |

**Example:**

```cangjie
import kit.ArkUI.*
import ohos.base.*
import kit.PerformanceAnalysisKit.*
func isFoldableExample() {
    try {
        let displayClass = getDefaultDisplaySync()
        var ret: Bool = false
        try {
            ret = isFoldable()
        } catch (exception: Exception) {
            Hilog.error(0, "display_test", exception.toString())
        }
        if (ret) {
            Hilog.info(0, "display_test", "The device is foldable.")
        } else {
            Hilog.info(0, "display_test", "The device is not foldable.")
        }
    } catch (exception: Exception) {
        Hilog.error(0, "display_test", exception.toString())
    }
}
```

## func off(ListenerType)

```cangjie
public func off(listenerType: ListenerType): Unit
```

**Description:** Unregisters a listener.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| listenerType | [ListenerType](#enum-listenertype) | Yes | - | Type of the listener event. |

**Example:**

```cangjie
import kit.ArkUI.*
var temp: Unit = off(ListnerTypeChange)
```

## func off(ListenerType, Callback1Argument\<FoldStatus>)

```cangjie
public func off(listenerType: ListenerType, callback: Callback1Argument<FoldStatus>): Unit
```

**Description:** Unregisters the listener for fold status changes of a foldable device.

**System Capability:** SystemCapability.Window.SessionManager**Starting Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| listenerType | [ListenerType](#enum-listenertype) | Yes | - | Event to listen for. Fixed as `ListnerTypeFoldStatusChange`, indicating a change in the fold status of the foldable device. |  
| callback | [Callback1Argument](../apis/BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldStatus](#enum-foldstatus)> | Yes | - | The callback function to unregister. Represents the fold status of the foldable device. |  

**Exceptions:**  

- `BusinessException`: Corresponding error codes are listed below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Display Error Codes](../errorcodes/cj-errorcode-display.md).  

  | Error Code ID | Error Message |  
  | :---- | :--- |  
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.   2. Incorrect parameter types. |  
  | 1400003 | This display manager service works abnormally. |  

**Example:**  

```cangjie  
import kit.ArkUI.*  
import ohos.base.*  
import kit.PerformanceAnalysisKit.*  
class TestCallback <: Callback1Argument<FoldStatus> {  
    public init() {}  
    public open func invoke(value: FoldStatus): Unit {  
        Hilog.info(0, "display_test",   
            "Display fold status changed, current fold status: " + match (value) {  
                case FoldStatusUnknown => "FoldStatusUnknown"  
                case FoldStatusExpanded => "FoldStatusExpanded"  
                case FoldStatusFolded => "FoldStatusFolded"  
                case FoldStatusHalfFolded => "FoldStatusHalfFolded"  
                case _ => "Failed to get fold status."  
            })  
    }  
}  
let testCallback = TestCallback()  
var temp: Unit = on(ListnerTypeFoldStatusChange, testCallback)  
```  

## func off(ListenerType, Callback1Argument\<FoldDisplayMode>)  

```cangjie  
public func off(listenerType: ListenerType, callback: Callback1Argument<FoldDisplayMode>): Unit  
```  

**Function:** Disables listening for changes in the screen display mode of a foldable device.  

**System Capability:** SystemCapability.Window.SessionManager  

**Starting Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| listenerType | [ListenerType](#enum-listenertype) | Yes | - | Event to listen for. Fixed as `ListnerTypeFoldDisplayModeChange`, indicating a change in the fold status of the foldable device. |  
| callback | [Callback1Argument](../apis/BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldDisplayMode](#enum-folddisplaymode)> | Yes | - | The callback function to unregister. Represents the screen display mode of the foldable device. |  

**Exceptions:**  

- `BusinessException`: Corresponding error codes are listed below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Display Error Codes](../errorcodes/cj-errorcode-display.md).  

  | Error Code ID | Error Message |  
  | :---- | :--- |  
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.   2. Incorrect parameter types. |  
  | 1400003 | This display manager service works abnormally. |  

**Example:**  

```cangjie  
import kit.ArkUI.*  
class TestCallback <: Callback1Argument<FoldDisplayMode> {  
    public init() {}  
    public open func invoke(value: FoldDisplayMode): Unit {  
        Hilog.info(0, "display_test",   
            "Display fold status changed, current fold status: " + match (value) {  
                case FoldDisplayModeUnknown => "FoldDisplayModeUnknown"  
                case FoldDisplayModeFull => "FoldDisplayModeFull"  
                case FoldDisplayModeMain => "FoldDisplayModeMain"  
                case FoldDisplayModeSub => "FoldDisplayModeSub"  
                case FoldDisplayModeCoordination => "FoldDisplayModeCoordination"  
                case _ => "Failed to get fold display mode."  
            })  
    }  
}  
let testCallback = TestCallback()  
var temp: Unit = off(ListnerTypeFoldDisplayModeChange, testCallback)  
```  

## func on(ListenerType, Callback1Argument\<FoldStatus>)  

```cangjie  
public func on(listenerType: ListenerType, callback: Callback1Argument<FoldStatus>): Unit  
```  

**Function:** Enables listening for changes in the fold status of a foldable device.  

**System Capability:** SystemCapability.Window.SessionManager  

**Starting Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| listenerType | [ListenerType](#enum-listenertype) | Yes | - | Event to listen for. Fixed as `ListnerTypeFoldStatusChange`, indicating a change in the fold status of the foldable device. |  
| callback | [Callback1Argument](../apis/BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldStatus](#enum-foldstatus)> | Yes | - | Callback function. Represents the fold status of the foldable device. |  

**Exceptions:**  

- `BusinessException`: Corresponding error codes are listed below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Display Error Codes](../errorcodes/cj-errorcode-display.md).  

  | Error Code ID | Error Message |  
  | :---- | :--- |  
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.   2. Incorrect parameter types. |  
  | 1400003 | This display manager service works abnormally. |  

**Example:**  

```cangjie  
import kit.ArkUI.*  
import ohos.base.*  
import kit.PerformanceAnalysisKit.*  
class TestCallback <: Callback1Argument<FoldStatus> {  
    public init(){}  
    public open func invoke(value: FoldStatus): Unit {  
        Hilog.info(0, "display_test", "Display fold status changed, current fold status: " + match(value) {  
            case FoldStatusUnknown => "FoldStatusUnknown"  
            case FoldStatusExpanded => "FoldStatusExpanded"  
            case FoldStatusFolded => "FoldStatusFolded"  
            case FoldStatusHalfFolded => "FoldStatusHalfFolded"  
            case _ => "Failed to get fold status."  
        })  
    }  
}  
let testCallback = TestCallback()  
var temp: Unit = on(ListnerTypeFoldStatusChange, testCallback)  
```  

## func on(ListenerType, Callback1Argument\<FoldDisplayMode>)  

```cangjie  
public func on(listenerType: ListenerType, callback: Callback1Argument<FoldDisplayMode>): Unit  
```  

**Function:** Enables listening for changes in the screen display mode of a foldable device.  

**System Capability:** SystemCapability.Window.SessionManager  

**Starting Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| listenerType | [ListenerType](#enum-listenertype) | Yes | - | Event to listen for. Fixed as `ListnerTypeFoldDisplayModeChange`, indicating a change in the fold status of the foldable device. |  
| callback | [Callback1Argument](../apis/BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldDisplayMode](#enum-folddisplaymode)> | Yes | - | Callback function. Represents the screen display mode of the foldable device. |  

**Exceptions:**  

- `BusinessException`: Corresponding error codes are listed below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Display Error Codes](../errorcodes/cj-errorcode-display.md).  

  | Error Code ID | Error Message |  
  | :---- | :--- |  
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.   2. Incorrect parameter types. |  
  | 1400003 | This display manager service works abnormally. |  

**Example:**  

```cangjie  
import kit.ArkUI.*  
import ohos.base.*  
import kit.PerformanceAnalysisKit.*  
class TestCallback <: Callback1Argument<FoldDisplayMode> {  
    public init() {}  
    public open func invoke(value: FoldDisplayMode): Unit {  
        Hilog.info(0, "display_test",   
            "Display fold status changed, current fold status: " + match (value) {  
                case FoldDisplayModeUnknown => "FoldDisplayModeUnknown"  
                case FoldDisplayModeFull => "FoldDisplayModeFull"  
                case FoldDisplayModeMain => "FoldDisplayModeMain"  
                case FoldDisplayModeSub => "FoldDisplayModeSub"  
                case FoldDisplayModeCoordination => "FoldDisplayModeCoordination"  
                case _ => "Failed to get fold display mode."  
            })  
    }  
}  
let testCallback = TestCallback()  
var temp: Unit = on(ListnerTypeFoldDisplayModeChange, testCallback)  
```  

## class CutoutInfo  

```cangjie  
public class CutoutInfo {  
    public let boundingRects: Array<Rect>  
    public let waterfallDisplayAreaRects: WaterfallDisplayAreaRects  
    public init(  
        boundingRects!: Array<Rect>,  
        waterfallDisplayAreaRects!: WaterfallDisplayAreaRects  
    )  
}  
```  

**Function:** Information about unusable screen areas such as punch-hole screens, notches, and waterfall screens.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Starting Version:** 21  

### let boundingRects  

```cangjie  
public let boundingRects: Array<Rect>  
```  

**Function:** Boundary rectangles for punch-hole or notch areas. If there are no such areas, the array returns empty.  

**Type:** Array\<[Rect](#class-rect)>  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Starting Version:** 21  

### let waterfallDisplayAreaRects  

```cangjie  
public let waterfallDisplayAreaRects: WaterfallDisplayAreaRects  
```  

**Function:** Sets the display area for the curved part of a waterfall screen.  

**Type:** [WaterfallDisplayAreaRects](#class-waterfalldisplayarearects)  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Starting Version:** 21  

### init(Array\<Rect>, WaterfallDisplayAreaRects)  

```cangjie  
public init(  
    boundingRects!: Array<Rect>,  
    waterfallDisplayAreaRects!: WaterfallDisplayAreaRects  
)  
```  

**Function:** Creates a `CutoutInfo` object.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Starting Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| boundingRects | Array\<[Rect](#class-rect)> | Yes | - | Boundary rectangles for punch-hole or notch areas. If there are no such areas, the array returns empty. |  
| waterfallDisplayAreaRects | [WaterfallDisplayAreaRects](#class-waterfalldisplayarearects) | Yes | - | Display area for the curved part of a waterfall screen. |  

## class Display  

```cangjie  
public class Display {}  
```  

**Function:** Represents a screen instance. Describes the properties and methods of a `Display` object.  

> **Note:**  
>  
> In the following API examples, you must first obtain a `Display` object using either the [`getAllDisplays()`](#func-getalldisplays) or [`getDefaultDisplaySync()`](#func-getdefaultdisplaysync) method, and then call the corresponding methods through this instance.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Starting Version:** 21  

### prop alive  

```cangjie  
public prop alive: Bool  
```  

**Function:** Indicates whether the display device is enabled. `true` means the device is enabled, `false` means it is not.  

**Type:** Bool  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Starting Version:** 21  

### prop densityDPI  

```cangjie  
public prop densityDPI: Int  
```  

**Function:** The screen density in dots per inch (DPI).  

**Type:** Int  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Starting Version:** 21
```cangjie
public prop densityDPI: Float32
```

**Function:** Sets the physical pixel density of the display device screen, representing the number of pixels per inch.

> **Note:**
>
> This parameter is a floating-point number with units in px. Common values include 160.0, 480.0, etc. The actual available values depend on the options provided in different device settings.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop densityPixels

```cangjie
public prop densityPixels: Float32
```

**Function:** Sets the logical density of the display device, which is a scaling factor independent of pixel units.

> **Note:**
>
> This parameter is a floating-point number constrained by the range of densityDPI, with valid values between [0.5, 4.0]. Common values include 1.0, 3.0, etc. The actual value depends on the densityDPI provided by different devices.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop height

```cangjie
public prop height: Int32
```

**Function:** The screen height of the display device.

> **Note:**
>
> Units are in px, and this parameter should be an integer.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop id

```cangjie
public prop id: UInt32
```

**Function:** Sets the ID number of the display device. This parameter should be an integer greater than or equal to 0.

**Type:** UInt32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop name

```cangjie
public prop name: String
```

**Function:** Sets the name of the display device.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop orientation

```cangjie
public prop orientation: Orientation
```

**Function:** Sets the current display orientation of the screen.

**Type:** [Orientation](#enum-orientation)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop refreshRate

```cangjie
public prop refreshRate: UInt32
```

**Function:** Sets the refresh rate of the display device.

> **Note:**
>
> This parameter should be an integer with units in hz.

**Type:** UInt32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop rotation

```cangjie
public prop rotation: UInt32
```

**Function:** Sets the clockwise rotation angle of the display device screen.

> **Note:**
>
> A value of 0 indicates a 0° clockwise rotation; 1 indicates 90°; 2 indicates 180°; and 3 indicates 270°.

**Type:** UInt32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop scaledDensity

```cangjie
public prop scaledDensity: Float32
```

**Function:** The scaling factor for fonts displayed on the device. This parameter is a floating-point number, usually the same as densityPixels.

> **Note:**
>
> This parameter is a floating-point number, typically the same as densityPixels.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop state

```cangjie
public prop state: DisplayState
```

**Function:** Sets the state of the display device.

**Type:** [DisplayState](#enum-displaystate)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop width

```cangjie
public prop width: Int32
```

**Function:** Sets the screen width of the display device.

> **Note:**
>
> Units are in px, and this parameter should be an integer.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop xDPI

```cangjie
public prop xDPI: Float32
```

**Function:** Sets the exact physical pixel value per inch in the x-direction of the screen.

> **Note:**
>
> This parameter is a floating-point number.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### prop yDPI

```cangjie
public prop yDPI: Float32
```

**Function:** Sets the exact physical pixel value per inch in the y-direction of the screen.

> **Note:**
>
> This parameter is a floating-point number.

**Type:** Float32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### func getCutoutInfo()

```cangjie
public func getCutoutInfo(): CutoutInfo
```

**Function:** Retrieves information about non-usable screen areas such as punch-hole screens, notches, and waterfall screens. Applications are advised to avoid these areas in their layouts.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [CutoutInfo](#class-cutoutinfo) | Returns a CutoutInfo object describing the non-usable screen areas. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Display Error Codes](../errorcodes/cj-errorcode-display.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1400001 | Invalid display or screen. |
  | 1400003 | This display manager service works abnormally. |

## class FoldCreaseRegion

```cangjie
public class FoldCreaseRegion {
    public let displayId: UInt32
    public let creaseRects: Array<Rect>
    public init(
        displayId!: UInt32,
        creaseRects!: Array<Rect>
    )
}
```

**Function:** Fold crease region.

**System Capability:** SystemCapability.Window.SessionManager

**Since Version:** 21

### let creaseRects

```cangjie
public let creaseRects: Array<Rect>
```

**Function:** Sets the crease region.

**Type:** Array\<[Rect](#class-rect)>

**Read-Write Capability:** Read-only**System Capability:** SystemCapability.Window.SessionManager  

**Initial Version:** 21  

### let displayId  

```cangjie  
public let displayId: UInt32  
```  

**Description:** Sets the display ID to identify the screen where the fold crease is located.  

**Type:** UInt32  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.Window.SessionManager  

**Initial Version:** 21  

### init(UInt32, Array\<Rect>)  

```cangjie  
public init(  
    displayId!: UInt32,  
    creaseRects!: Array<Rect>  
)  
```  

**Description:** Creates a FoldCreaseRegion object.  

**System Capability:** SystemCapability.Window.SessionManager  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| displayId | UInt32 | Yes | - | Display ID to identify the screen where the fold crease is located. |  
| creaseRects | Array\<[Rect](#class-rect)> | Yes | - | Fold crease region. |  

## class Rect  

```cangjie  
public class Rect {  
    public var left: Int32  
    public var top: Int32  
    public var width: UInt32  
    public var height: UInt32  
    public init(  
        left!: Int32,  
        top!: Int32,  
        width!: UInt32,  
        height!: UInt32  
    )  
}  
```  

**Description:** Rectangle region information.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### var height  

```cangjie  
public var height: UInt32  
```  

**Description:** Sets the height of the rectangle region.  

> **Note:**  
>  
> The unit is pixels, and this parameter should be an integer.  

**Type:** UInt32  

**Read/Write Permission:** Read-write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### var left  

```cangjie  
public var left: Int32  
```  

**Description:** Sets the left boundary of the rectangle region.  

> **Note:**  
>  
> The unit is pixels, and this parameter should be an integer.  

**Type:** Int32  

**Read/Write Permission:** Read-write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### var top  

```cangjie  
public var top: Int32  
```  

**Description:** Sets the top boundary of the rectangle region.  

> **Note:**  
>  
> The unit is pixels, and this parameter should be an integer.  

**Type:** Int32  

**Read/Write Permission:** Read-write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### var width  

```cangjie  
public var width: UInt32  
```  

**Description:** Sets the width of the rectangle region.  

> **Note:**  
>  
> The unit is pixels, and this parameter should be an integer.  

**Type:** UInt32  

**Read/Write Permission:** Read-write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### init(Int32, Int32, UInt32, UInt32)  

```cangjie  
public init(  
    left!: Int32,  
    top!: Int32,  
    width!: UInt32,  
    height!: UInt32  
)  
```  

**Description:** Creates a Rect object.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| left | Int32 | Yes | - | Left boundary of the rectangle region, in px. |  
| top | Int32 | Yes | - | Top boundary of the rectangle region, in px. |  
| width | UInt32 | Yes | - | Width of the rectangle region, in px. |  
| height | UInt32 | Yes | - | Height of the rectangle region, in px. |  

## class WaterfallDisplayAreaRects  

```cangjie  
public class WaterfallDisplayAreaRects {  
    public let left: Rect  
    public let top: Rect  
    public let right: Rect  
    public let bottom: Rect  
    public init(  
        left!: Rect,  
        top!: Rect,  
        right!: Rect,  
        bottom!: Rect  
    )  
}  
```  

**Description:** Waterfall screen curved display area information.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### let bottom  

```cangjie  
public let bottom: Rect  
```  

**Description:** Sets the bottom rectangular region of the waterfall curved area.  

**Type:** [Rect](#class-rect)  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### let left  

```cangjie  
public let left: Rect  
```  

**Description:** Sets the left rectangular region of the waterfall curved area.  

**Type:** [Rect](#class-rect)  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### let right  

```cangjie  
public let right: Rect  
```  

**Description:** Sets the right rectangular region of the waterfall curved area.  

**Type:** [Rect](#class-rect)  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### let top  

```cangjie  
public let top: Rect  
```  

**Description:** Sets the top rectangular region of the waterfall curved area.  

**Type:** [Rect](#class-rect)  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

### init(Rect, Rect, Rect, Rect)  

```cangjie  
public init(  
    left!: Rect,  
    top!: Rect,  
    right!: Rect,  
    bottom!: Rect  
)  
```  

**Description:** Creates a WaterfallDisplayAreaRects object.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| left | [Rect](#class-rect) | Yes | - | Left rectangular region of the waterfall curved area. |  
| top | [Rect](#class-rect) | Yes | - | Top rectangular region of the waterfall curved area. |  
| right | [Rect](#class-rect) | Yes | - | Right rectangular region of the waterfall curved area. |  
| bottom | [Rect](#class-rect) | Yes | - | Bottom rectangular region of the waterfall curved area. |  

## enum DisplayState  

```cangjie  
public enum DisplayState {  
    | StateUnknown  
    | StateOff  
    | StateOn  
    | StateDoze  
    | StateDozeSuspend  
    | StateVr  
    | StateOnSuspend  
    | ...  
}  
```  

**Description:** Display device state types.**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### StateDoze  

```cangjie  
StateDoze  
```  

**Description:** Indicates that the display device is in low-power mode.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### StateDozeSuspend  

```cangjie  
StateDozeSuspend  
```  

**Description:** Indicates that the display device is in sleep mode with the CPU suspended.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### StateOff  

```cangjie  
StateOff  
```  

**Description:** Indicates that the display device is turned off.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### StateOn  

```cangjie  
StateOn  
```  

**Description:** Indicates that the display device is turned on.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### StateOnSuspend  

```cangjie  
StateOnSuspend  
```  

**Description:** Indicates that the display device is turned on with the CPU suspended.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### StateUnknown  

```cangjie  
StateUnknown  
```  

**Description:** Indicates that the display device status is unknown.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### StateVr  

```cangjie  
StateVr  
```  

**Description:** Indicates that the display device is in VR mode.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

## enum FoldDisplayMode  

```cangjie  
public enum FoldDisplayMode {  
    | FoldDisplayModeUnknown  
    | FoldDisplayModeFull  
    | FoldDisplayModeMain  
    | FoldDisplayModeSub  
    | FoldDisplayModeCoordination  
    | ...  
}  
```  

**Description:** Display mode types for foldable devices.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldDisplayModeCoordination  

```cangjie  
FoldDisplayModeCoordination  
```  

**Description:** Indicates that the device is currently in dual-screen coordinated display mode.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldDisplayModeFull  

```cangjie  
FoldDisplayModeFull  
```  

**Description:** Indicates that the device is currently in full-screen display mode.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldDisplayModeMain  

```cangjie  
FoldDisplayModeMain  
```  

**Description:** Indicates that the device is currently displaying content on the main screen.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldDisplayModeSub  

```cangjie  
FoldDisplayModeSub  
```  

**Description:** Indicates that the device is currently displaying content on the sub-screen.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldDisplayModeUnknown  

```cangjie  
FoldDisplayModeUnknown  
```  

**Description:** Indicates that the current foldable display mode of the device is unknown.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

## enum FoldStatus  

```cangjie  
public enum FoldStatus {  
    | FoldStatusUnknown  
    | FoldStatusExpanded  
    | FoldStatusFolded  
    | FoldStatusHalfFolded  
    | ...  
}  
```  

**Description:** Fold status types for current foldable devices.  

> **Note:**  
>  
> For dual-hinge devices, with the charging port facing downward, Hinge 1 and Hinge 2 are positioned from right to left, respectively.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldStatusExpanded  

```cangjie  
FoldStatusExpanded  
```  

**Description:** Indicates that the device is currently fully unfolded. For dual-hinge devices, it means Hinge 1 is fully unfolded while Hinge 2 is folded.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldStatusFolded  

```cangjie  
FoldStatusFolded  
```  

**Description:** Indicates that the device is currently folded. For dual-hinge devices, it means both Hinge 1 and Hinge 2 are folded.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldStatusHalfFolded  

```cangjie  
FoldStatusHalfFolded  
```  

**Description:** Indicates that the device is currently in a half-folded state, which is an intermediate state between fully unfolded and fully folded. For dual-hinge devices, it means Hinge 1 is half-folded while Hinge 2 is folded.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### FoldStatusUnknown  

```cangjie  
FoldStatusUnknown  
```  

**Description:** Indicates that the current fold status of the device is unknown.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

## enum ListenerType  

```cangjie  
public enum ListenerType {  
    | ListnerTypeAdd  
    | ListnerTypeRemove  
    | ListnerTypeChange  
    | ListnerTypeFoldStatusChange  
    | ListnerTypeFoldAngleChange  
    | ListnerTypeCaptureStatusChange  
    | ListnerTypeFoldDisplayModeChange  
    | ListnerTypeAvailableAreaChange  
    | ...  
}  
```  

**Description:** Types of listener events to be set.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### ListnerTypeAdd  

```cangjie  
ListnerTypeAdd  
```  

**Description:** Indicates an event for adding a display device.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### ListnerTypeAvailableAreaChange  

```cangjie  
ListnerTypeAvailableAreaChange  
```  

**Description:** Indicates a change in the display mode of the foldable device screen.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### ListnerTypeCaptureStatusChange  

```cangjie  
ListnerTypeCaptureStatusChange  
```  

**Description:** Indicates a change in the device's screenshot, screen projection, or screen recording status.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### ListnerTypeChange  

```cangjie  
ListnerTypeChange  
```

**Function:** Indicates display device change events.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### ListnerTypeFoldAngleChange

```cangjie
ListnerTypeFoldAngleChange
```

**Function:** Indicates changes in the folding angle of foldable devices.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### ListnerTypeFoldDisplayModeChange

```cangjie
ListnerTypeFoldDisplayModeChange
```

**Function:** Indicates changes in the display mode of foldable device screens.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### ListnerTypeFoldStatusChange

```cangjie
ListnerTypeFoldStatusChange
```

**Function:** Indicates changes in the folding status of foldable devices.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### ListnerTypeRemove

```cangjie
ListnerTypeRemove
```

**Function:** Indicates display device removal events.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

## enum Orientation

```cangjie
public enum Orientation {
    | Portrait
    | Landscape
    | PortraitInverted
    | LandscapeInverted
    | ...
}
```

**Function:** Current display orientation types of the display device.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Landscape

```cangjie
Landscape
```

**Function:** Indicates the device is currently displaying in landscape mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### LandscapeInverted

```cangjie
LandscapeInverted
```

**Function:** Indicates the device is currently displaying in inverted landscape mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Portrait

```cangjie
Portrait
```

**Function:** Indicates the device is currently displaying in portrait mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### PortraitInverted

```cangjie
PortraitInverted
```

**Function:** Indicates the device is currently displaying in inverted portrait mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21