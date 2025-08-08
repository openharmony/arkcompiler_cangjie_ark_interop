# ohos.window (Window)

ohos.window provides fundamental capabilities for window management, including creation, destruction, and property configuration of current windows, as well as scheduling management among multiple windows.

This module offers the following common window-related functionalities:

- [Window](#class-window): The current window instance, which is the basic unit managed by the window manager.

- [WindowStage](#class-windowstage): The window manager that manages various basic window units.

> **Note:**
>
> ohos.window only supports pure Cangjie scenarios and cannot be used in mixed development scenarios combining ArkTS and Cangjie.

## Importing the Module

```cangjie
import kit.ArkUI.*
```

## func createWindow(Configuration)

```cangjie
public func createWindow(config: Configuration): Window
```

**Functionality:** Creates a sub-window or system window.

**Required Permission:** ohos.permission.SYSTEM_FLOAT_WINDOW (Required only when creating a window of type WindowType.TYPE_FLOAT)

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| config | [Configuration](#class-configuration) | Yes | - | Parameters for window creation. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Window](#class-window) | Returns the created window object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission verification failed. The application does not have the permission required to call the API. |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 1300003 | This window manager service works abnormally. |
  | 1300006 | This window context is abnormal. |

- IllegalArgumentException:

  | Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | The context type is not supported. Only support UIAbilityContext. | Invalid parameter. | Verify if ctx is a UIAbilityContext type object. |

## func findWindow(String)

```cangjie
public func findWindow(name: String): Window
```

**Functionality:** Finds the window corresponding to the specified name.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The window name, which is the name in [Configuration](#class-configuration). |

**Return Value:**

| Type | Description |
|:----|:----|
| [Window](#class-window) | The found window object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

## func getLastWindow(BaseContext)

```cangjie
public func getLastWindow(ctx: BaseContext): Window
```

**Functionality:** Retrieves the topmost sub-window within the current application. If no sub-window exists, returns the main window of the application.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| ctx | [BaseContext](<font color="red" face="bold">please add link</font>) | Yes | - | Context information of the current application. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Window](#class-window) | Returns the most recently displayed window object within the application. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. Top window or main window is null or destroyed. |

- IllegalArgumentException:

  | Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | The context type is not supported. Only support UIAbilityContext. | Invalid parameter. | Verify if ctx is a UIAbilityContext type object. |

## func shiftAppWindowFocus(Int32, Int32)

```cangjie
public func shiftAppWindowFocus(sourceWindowId: Int32, targetWindowId: Int32): Unit
```

**Functionality:** Transfers window focus from the source window to the target window within the same application.

> **Note:**
>
> Only supports focus transfer between the main application window and sub-windows.

**System Capability:** SystemCapability.Window.SessionManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| sourceWindowId | Int32 | Yes | - | Source window ID, which must be in focus. |
| targetWindowId | Int32 | Yes | - | Target window ID. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801 | Capability not supported. Failed to call the API due to limited device capabilities. |
  | 1300002 | This window state is abnormal. |
  | 1300003 | This window manager service works abnormally. |
  | 1300004 | Unauthorized operation. |

## class AvoidArea

```cangjie
public class AvoidArea {
    public var visible: Bool
    public var leftRect: Rect
    public var topRect: Rect
    public var rightRect: Rect
    public var bottomRect: Rect
    public init(
        visible!: Bool,
        leftRect!: Rect,
        topRect!: Rect,
        rightRect!: Rect,
        bottomRect!: Rect
    )
}
```

**Functionality:** Areas where window content should avoid overlapping.

> **Note:**
>
> These include system bar areas, notch areas, gesture areas, soft keyboard areas, etc., where window content should avoid overlapping. User click events cannot be responded to in these areas.
>
> Additionally, the following constraints apply to avoid areas:
>
> - Non-navigation bar areas in bottom gesture areas support click and long-press event passthrough but do not support drag-in.
> - Left and right side gesture areas support click, long-press, and vertical swipe event passthrough but do not support drag-in.
> - Navigation bar areas support long-press, click, and drag-in event responses but do not support event passthrough.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### var bottomRect

```cangjie
public var bottomRect: Rect
```

**Functionality:** Represents the rectangular area at the bottom of the screen.

**Type:** [Rect](#class-rect)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### var leftRect

```cangjie
public var leftRect: Rect
```

**Functionality:** Represents the rectangular area on the left side of the screen.

**Type:** [Rect](#class-rect)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### var rightRect

```cangjie
public var rightRect: Rect
```

**Functionality:** Represents the rectangular area on the right side of the screen.

**Type:** [Rect](#class-rect)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### var topRect

```cangjie
public var topRect: Rect
```

**Functionality:** Represents the rectangular area at the top of the screen.

**Type:** [Rect](#class-rect)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### var visible

```cangjie
public var visible: Bool
```

**Functionality:** Indicates whether the avoid area is visible.

**Type:** Bool

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### init(Bool, Rect, Rect, Rect, Rect)

```cangjie
public init(
    visible!: Bool,
    leftRect!: Rect,
    topRect!: Rect,
    rightRect!: Rect,
    bottomRect!: Rect
)
```

**Functionality:** Constructs an AvoidArea object.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| visible | Bool | Yes | - | Whether the avoidance area is visible. true indicates visible; false indicates invisible. |
| leftRect | [Rect](#class-rect) | Yes | - | The rectangular area on the left side of the screen. |
| topRect | [Rect](#class-rect) | Yes | - | The rectangular area at the top of the screen. |
| rightRect | [Rect](#class-rect) | Yes | - | The rectangular area on the right side of the screen. |
| bottomRect | [Rect](#class-rect) | Yes | - | The rectangular area at the bottom of the screen. |

## class Configuration

```cangjie
public class Configuration {
    public var name: String
    public var windowType: WindowType
    public var ctx: BaseContext
    public var displayId: Int64 = - 1
    public var parentId: Int64 = - 1
    public init(
        name!: String,
        windowType!: WindowType,
        ctx!: BaseContext,
        displayId!: Int64 = -1,
        parentId!: Int64 = -1
    )
}
```

**Function:** Parameters for creating sub-windows or system windows.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var ctx

```cangjie
public var ctx: BaseContext
```

**Function:** Represents the current application context information. Used for creating floating windows, modal windows, or system windows.

**Type:** [BaseContext](<font color="red" face="bold">please add link</font>)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var displayId

```cangjie
public var displayId: Int64 = - 1
```

**Function:** Sets the current physical screen ID. If not set, the default is -1.

**Type:** Int64

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var name

```cangjie
public var name: String
```

**Function:** Represents the window name.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var parentId

```cangjie
public var parentId: Int64 = - 1
```

**Function:** Sets the parent window ID. If not set, the default is -1.

**Type:** Int64

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var windowType

```cangjie
public var windowType: WindowType
```

**Function:** Represents the window type.

**Type:** [WindowType](#enum-windowtype)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### init(String, WindowType, BaseContext, Int64, Int64)

```cangjie
public init(
    name!: String,
    windowType!: WindowType,
    ctx!: BaseContext,
    displayId!: Int64 = -1,
    parentId!: Int64 = -1
)
```

**Function:** Constructs a Configuration object.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The window name. |
| windowType | [WindowType](#enum-windowtype) | Yes | - | The window type. |
| ctx | [BaseContext](<font color="red" face="bold">please add link</font>) | Yes | - | The current application context information. Used for creating floating windows, modal windows, or system windows. |
| displayId | Int64 | No | -1 | The current physical screen ID. |
| parentId | Int64 | No | -1 | The parent window ID. |

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

**Function:** Window rectangular area.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var height

```cangjie
public var height: UInt32
```

**Function:** Sets the height of the rectangular area, in pixels (px).

**Type:** UInt32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var left

```cangjie
public var left: Int32
```

**Function:** Sets the left boundary of the rectangular area, in pixels (px).

**Type:** Int32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var top

```cangjie
public var top: Int32
```

**Function:** Sets the top boundary of the rectangular area, in pixels (px).

**Type:** Int32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var width

```cangjie
public var width: UInt32
```

**Function:** Sets the width of the rectangular area, in pixels (px).

**Type:** UInt32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### init(Int32, Int32, UInt32, UInt32)

```cangjie
public init(
    left!: Int32,
    top!: Int32,
    width!: UInt32,
    height!: UInt32
)
```

**Function:** Constructs a Rect object.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| left | Int32 | Yes | - | The left boundary of the rectangular area, in pixels (px). |
| top | Int32 | Yes | - | The top boundary of the rectangular area, in pixels (px). |
| width | UInt32 | Yes | - | The width of the rectangular area, in pixels (px). |
| height | UInt32 | Yes | - | The height of the rectangular area, in pixels (px). |

## class Size

```cangjie
public class Size {
    public var width: UInt32
    public var height: UInt32
    public init(
        width!: UInt32,
        height!: UInt32
    )
}
```

**Function:** Window size.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var height

```cangjie
public var height: UInt32
```

**Function:** Sets the window height, in pixels (px).

**Type:** UInt32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var width

```cangjie
public var width: UInt32
```

**Function:** Sets the window width, in pixels (px).**Type:** UInt32  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

### init(UInt32, UInt32)  

```cangjie  
public init(  
    width!: UInt32,  
    height!: UInt32  
)  
```  

**Function:** Constructs a Size object.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

**Parameters:**  

| Parameter | Type   | Required | Default | Description |  
|:----------|:-------|:---------|:--------|:------------|  
| width     | UInt32 | Yes      | -       | Window width in px. |  
| height    | UInt32 | Yes      | -       | Window height in px. |  

## class SystemBarProperties  

```cangjie  
public class SystemBarProperties {  
    public var statusBarColor: String = "#66000000"  
    public var isStatusBarLightIcon: Bool = false  
    public var statusBarContentColor: String = "#E5FFFFFF"  
    public var navigationBarColor: String = "#66000000"  
    public var isNavigationBarLightIcon: Bool = false  
    public var navigationBarContentColor: String = "#E5FFFFFF"  
    public var enableStatusBarAnimation: Bool = false  
    public var enableNavigationBarAnimation: Bool = false  
    public init(  
        statusBarColor!: String = "#66000000",  
        isStatusBarLightIcon!: Bool = false,  
        statusBarContentColor!: String = "#E5FFFFFF",  
        navigationBarColor!: String = "#66000000",  
        isNavigationBarLightIcon!: Bool = false,  
        navigationBarContentColor!: String = "#E5FFFFFF",  
        enableStatusBarAnimation!: Bool = false,  
        enableNavigationBarAnimation!: Bool = false  
    )  
}  
```  

**Function:** Properties for the status bar and navigation bar. Used when setting window-level status bar and navigation bar properties.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

### var enableNavigationBarAnimation  

```cangjie  
public var enableNavigationBarAnimation: Bool = false  
```  

**Function:** Sets whether to enable animation effects when navigation bar properties change. `true` enables animation effects; `false` disables them.  

**Type:** Bool  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.Window.SessionManager  

**Since Version:** 21  

### var enableStatusBarAnimation  

```cangjie  
public var enableStatusBarAnimation: Bool = false  
```  

**Function:** Sets whether to enable animation effects when status bar properties change. `true` enables animation effects; `false` disables them.  

**Type:** Bool  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.Window.SessionManager  

**Since Version:** 21  

### var isNavigationBarLightIcon  

```cangjie  
public var isNavigationBarLightIcon: Bool = false  
```  

**Function:** Sets whether the navigation bar icons are highlighted. `true` for highlighted; `false` for not highlighted.  

**Type:** Bool  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

### var isStatusBarLightIcon  

```cangjie  
public var isStatusBarLightIcon: Bool = false  
```  

**Function:** Sets whether the status bar icons are highlighted. `true` for highlighted; `false` for not highlighted.  

**Type:** Bool  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

### var navigationBarColor  

```cangjie  
public var navigationBarColor: String = "#66000000"  
```  

**Function:** Sets the background color of the navigation bar in hexadecimal RGB or ARGB format (case-insensitive).  

**Type:** String  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

### var navigationBarContentColor  

```cangjie  
public var navigationBarContentColor: String = "#E5FFFFFF"  
```  

**Function:** Sets the text color of the navigation bar. After setting this property, the [isNavigationBarLightIcon](#var-isnavigationbarlighticon) setting becomes invalid.  

**Type:** String  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

### var statusBarColor  

```cangjie  
public var statusBarColor: String = "#66000000"  
```  

**Function:** Sets the background color of the status bar in hexadecimal RGB or ARGB format.  

**Type:** String  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

### var statusBarContentColor  

```cangjie  
public var statusBarContentColor: String = "#E5FFFFFF"  
```  

**Function:** Sets the text color of the status bar. After setting this property, the [isStatusBarLightIcon](#var-isstatusbarlighticon) setting becomes invalid.  

**Type:** String  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

### init(String, Bool, String, String, Bool, String, Bool, Bool)  

```cangjie  
public init(  
    statusBarColor!: String = "#66000000",  
    isStatusBarLightIcon!: Bool = false,  
    statusBarContentColor!: String = "#E5FFFFFF",  
    navigationBarColor!: String = "#66000000",  
    isNavigationBarLightIcon!: Bool = false,  
    navigationBarContentColor!: String = "#E5FFFFFF",  
    enableStatusBarAnimation!: Bool = false,  
    enableNavigationBarAnimation!: Bool = false  
)  
```  

**Function:** Constructs a SystemBarProperties object.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since Version:** 21  

**Parameters:**  

| Parameter                  | Type   | Required | Default         | Description |  
|:---------------------------|:-------|:---------|:----------------|:------------|  
| statusBarColor             | String | No       | "#66000000"     | Background color of the status bar in hexadecimal RGB or ARGB format (case-insensitive). |  
| isStatusBarLightIcon       | Bool   | No       | false           | Whether the status bar icons are highlighted. `true` for highlighted; `false` for not highlighted. |  
| statusBarContentColor      | String | No       | "#E5FFFFFF"     | Text color of the status bar. After setting this, `isStatusBarLightIcon` becomes invalid. |  
| navigationBarColor         | String | No       | "#66000000"     | Background color of the navigation bar in hexadecimal RGB or ARGB format (case-insensitive). |  
| isNavigationBarLightIcon   | Bool   | No       | false           | Whether the navigation bar icons are highlighted. `true` for highlighted; `false` for not highlighted. |  
| navigationBarContentColor  | String | No       | "#E5FFFFFF"     | Text color of the navigation bar. After setting this, `isNavigationBarLightIcon` becomes invalid. |  
| enableStatusBarAnimation   | Bool   | No       | false           | Whether to enable animation effects for status bar property changes. `true` enables; `false` disables. |  
| enableNavigationBarAnimation | Bool | No | false | Whether to enable animation effects for navigation bar property changes. `true` enables; `false` disables. |  

## class TitleButtonRect  

```cangjie  
public class TitleButtonRect {  
    public var right: Int32  
    public var top: Int32  
    public var width: UInt32  
    public var height: UInt32  
    public init(  
        right!: Int32,  
        top!: Int32,  
        width!: UInt32,  
        height!: UInt32  
    )  
}  
```  

**Function:** The rectangular area for the minimize, maximize, and close buttons on the title bar. The coordinates are relative to the top-right corner of the window.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since Version:** 21  

### var height  

```cangjie  
public var height: UInt32  
```  

**Function:** Sets the height of the rectangular area in vp.  

**Type:** UInt32  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.Window.SessionManager  

**Since Version:** 21  

### var right  

```cangjie  
public var right: Int32  
```  

**Function:** Sets the right boundary of the rectangular area in vp.  

**Type:** Int32  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.Window.SessionManager  

**Since Version:** 21  

### var top  

```cangjie  
public var top: Int32  
```  

**Function:** Sets the top boundary of the rectangular area in vp.  

**Type:** Int32  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.Window.SessionManager  

**Since Version:** 21  

### var width  

```cangjie  
public var width: UInt32  
```
**Function:** Sets the width of a rectangular area in vp units.

**Type:** UInt32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Window.SessionManager

**Since Version:** 21

### init(Int32, Int32, UInt32, UInt32)

```cangjie
public init(
    right!: Int32,
    top!: Int32,
    width!: UInt32,
    height!: UInt32
)
```

**Function:** Constructs an object of type TitleButtonRect.

**System Capability:** SystemCapability.Window.SessionManager

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| right | Int32 | Yes | - | The right boundary of the rectangular area in vp units. |
| top | Int32 | Yes | - | The top boundary of the rectangular area in vp units. |
| width | UInt32 | Yes | - | The width of the rectangular area in vp units. |
| height | UInt32 | Yes | - | The height of the rectangular area in vp units. |

## class Window

```cangjie
public class Window {}
```

**Function:** Represents the current window instance, the basic unit managed by the window manager.

> **Note:**
>
> In the following API examples, you must first obtain a [Window](#class-window) instance using one of the methods [getLastWindow()](#func-getlastwindowbasecontext), [createWindow()](#func-createwindowconfiguration), or [findWindow()](#func-findwindowstring). Then, call the corresponding method through this instance.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

### func destroyWindow()

```cangjie
public func destroyWindow(): Unit
```

**Function:** Destroys the current window.

> **Note:**
>
> Only system windows and application sub-windows are supported.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func getWindowAvoidArea(AvoidAreaType)

```cangjie
public func getWindowAvoidArea(areaType: AvoidAreaType): AvoidArea
```

**Function:** Retrieves the avoidance area for the current application window content. When overlapping with system bars, notches, gesture areas, or soft keyboard areas, the window content needs to avoid these regions.

> **Note:**
>
> This interface is generally applicable in two scenarios:
> 1. In the `onWindowStageCreate` method, it can be called to obtain the initial layout avoidance area when the application starts.
> 2. When a sub-window within the application needs to be temporarily displayed, this interface can be called to adjust the content layout for avoidance.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| areaType | [AvoidAreaType](#enum-avoidareatype) | Yes | - | Indicates the type of avoidance area. |

**Return Value:**

| Type | Description |
|:----|:----|
| [AvoidArea](#class-avoidarea) | The avoidance area for window content. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 1300002 | This window state is abnormal. |

### func getWindowColorSpace()

```cangjie
public func getWindowColorSpace(): ColorSpace
```

**Function:** Retrieves the current window's color gamut mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ColorSpace](#enum-colorspace) | The current color gamut mode. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func getWindowProperties()

```cangjie
public func getWindowProperties(): WindowProperties
```

**Function:** Retrieves the properties of the current window and returns a WindowProperties object.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [WindowProperties](#class-windowproperties) | The properties of the current window. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func isWindowShowing()

```cangjie
public func isWindowShowing(): Bool
```

**Function:** Determines whether the current window is displayed.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Indicates whether the current window is displayed. `true` means the window is displayed, `false` means it is not. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func isWindowSupportWideGamut()

```cangjie
public func isWindowSupportWideGamut(): Bool
```

**Function:** Determines whether the current window supports wide color gamut mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the current window supports wide color gamut mode, `false` otherwise. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func minimize()

```cangjie
public func minimize(): Unit
```

**Function:** Minimizes or hides the window, depending on the calling object.

> **Note:**
>
> This interface behaves differently based on the calling object:
>
> - When called by a main window, it minimizes the window, which can be restored from the Dock.
>
> - When called by a sub-window, it hides the window, which cannot be restored from the Dock but can be restored using [showWindow()](#func-showwindow).
>
> - For floating window types, calling this interface will result in error code 1300002.

**System Capability:** SystemCapability.Window.SessionManager

**Since Version:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 801 | Capability not supported. Failed to call the API due to limited device capabilities. |
  | 1300002 | This window state is abnormal. |

### func moveWindowTo(Int32, Int32)

```cangjie
public func moveWindowTo(x: Int32, y: Int32): Unit
```

**Function:** Moves the window to a specified position.

> **Note:**
>
> - On 2-in-1 devices, this function works in all window modes. On other devices, it only works in free-floating window mode (i.e., WindowStatusType.Floating) outside of Smart Multi-Window.
>
> - On 2-in-1 devices, the window moves relative to the screen. On other devices, it moves relative to the parent window.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | Int32 | Yes | - | The x-coordinate position to move the window to, in px. A positive value indicates a position to the right of the x-axis origin; a negative value indicates a position to the left; zero indicates the x-axis origin. |
| y | Int32 | Yes | - | The y-coordinate position to move the window to, in px. A positive value indicates a position below the y-axis origin; a negative value indicates a position above; zero indicates the y-axis origin. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func off(WindowCallbackType, Callback1Argument\<UInt32>)

```cangjie
public func off(callbackType: WindowCallbackType, callback: Callback1Argument<UInt32>): Unit
```

**Function:** Unregisters the listener for fixed soft keyboard height changes.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callbackType | [WindowCallbackType](#enum-windowcallbacktype) | Yes | - | The event to listen for, fixed as WindowCallbackType.KeyboardHeightChange, i.e., keyboard height change event. || callback | [Callback1Argument](../apis/BasicServicesKit/cj-apis-base.md#class-callback1argument)\<UInt32> | Yes | - | Callback function instance object. Returns the current keyboard height in pixels (px). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |

### func off(WindowCallbackType)

```cangjie
public func off(callbackType: WindowCallbackType): Unit
```

**Function:** Disables listening for the specified window event.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| callbackType | [WindowCallbackType](#enum-windowcallbacktype) | Yes | - | The event to stop listening for. Must be within the [WindowCallbackType](#enum-windowcallbacktype) enumeration range. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |

### func on(WindowCallbackType, Callback1Argument\<UInt32>)

```cangjie
public func on(callbackType: WindowCallbackType, callback: Callback1Argument<UInt32>): Unit
```

**Function:** Enables listening for fixed-state soft keyboard height changes. Notifies when the keyboard height changes if the soft keyboard is invoked by this window and there is an overlapping area.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| callbackType | [WindowCallbackType](#enum-windowcallbacktype) | Yes | - | The event to listen for, fixed as WindowCallbackType.KeyboardHeightChange, i.e., the keyboard height change event. |
| callback | [Callback1Argument](../apis/BasicServicesKit/cj-apis-base.md#class-callback1argument)\<UInt32> | Yes | - | Callback function. Returns the current keyboard height in pixels (px). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |

### func resetAspectRatio()

```cangjie
public func resetAspectRatio(): Unit
```

**Function:** Cancels the set aspect ratio for the window content layout.

> **Note:**
>
> Only applicable to the main window and only effective in free-floating window mode (i.e., when the window mode is [WindowStatusType.Floating](#enum-windowstatustype)). After calling this method, the persistently stored ratio information will be cleared.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |
  | 1300004 | Unauthorized operation. |

### func resize(UInt32, UInt32)

```cangjie
public func resize(width: UInt32, height: UInt32): Unit
```

**Function:** Changes the current window size.

> **Note:**
>
> - Application main windows and sub-windows have size restrictions. Default width range: [320, 1920], default height range: [240, 1920], in virtual pixels (vp).
>
> - The minimum width and height of application main windows and sub-windows can be configured by the product side. The configured minimum width and height will take precedence.
>
> - System windows have size restrictions. Width range: (0, 1920], height range: (0, 1920], in virtual pixels (vp). The set width and height are constrained by these rules: <br>If the set window width/height is less than the minimum width/height limit, the minimum width/height limit will take effect; <br>If the set window width/height exceeds the maximum width/height limit, the maximum width/height limit will take effect. <br>Full-screen mode windows do not support this operation.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| width | UInt32 | Yes | - | Target window width in pixels (px). |
| height | UInt32 | Yes | - | Target window height in pixels (px). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setAspectRatio(Float64)

```cangjie
public func setAspectRatio(ratio: Float64): Unit
```

**Function:** Sets the aspect ratio for the window content layout.

> **Note:**
>
> - When setting the window size through other interfaces like `resize` or `resizeAsync`, the ratio constraint does not apply.
> - Only applicable to the main window and only effective in free-floating window mode (i.e., when the window mode is [WindowStatusType.Floating](#enum-windowstatustype)). The ratio parameter will be persistently stored and remain effective after closing the application or restarting the device.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| ratio | Float64 | Yes | - | The width-to-height ratio of the window content layout excluding border decorations. <br>**Note:** <br>This parameter is constrained by the window's maximum and minimum size limits. The lower limit of the ratio is minimum width / maximum height, and the upper limit is maximum width / minimum height. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |
  | 1300004 | Unauthorized operation. |

### func setPreferredOrientation(Orientation)

```cangjie
public func setPreferredOrientation(orientation: Orientation): Unit
```

**Function:** Sets the display orientation property for the main window.

> **Note:**
>
> Only effective on devices that support rotation following the sensor. Sub-window calls will not take effect.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| orientation | [Orientation](#enum-orientation) | Yes | - | The display orientation property of the window. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 1300002 | This window state is abnormal. |

### func setWindowBackgroundColor(String)

```cangjie
public func setWindowBackgroundColor(color: String): Unit
```

**Function:** Sets the background color of the window.

> **Note:**
>
> This interface must be called after [loadContent()](#func-loadcontentstring) to take effect.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| color | String | Yes | - | The background color to set, in hexadecimal RGB or ARGB format, case-insensitive. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../errorcodes/cj-errorcode-universal.md) and [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified; 2. Incorrect parameter types. |
  | 1300002 | This window state is abnormal. |

### func setWindowBrightness(Float32)

```cangjie
public func setWindowBrightness(brightness: Float32): Unit
```

**Function:** Allows the application main window to set the screen brightness value.

> **Note:**
>
> Current screen brightness specifications: When the window sets the screen brightness, the control center cannot adjust the system screen brightness. After the window restores the default system brightness, the control center can adjust the system screen brightness.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| brightness | Float32 | Yes | - | Screen brightness value. Range: [0.0, 1.0] or -1.0. 1.0 indicates maximum brightness, -1.0 indicates default brightness. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowColorSpace(ColorSpace)

```cangjie
public func setWindowColorSpace(colorSpace: ColorSpace): Unit
```

**Function:** Sets the current window to wide color gamut mode or default color gamut mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| colorSpace | [ColorSpace](#enum-colorspace) | Yes | - | Sets the color gamut mode. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowFocusable(Bool)

```cangjie
public func setWindowFocusable(isFocusable: Bool): Unit
```

**Function:** Sets whether the window supports gaining focus when clicked or through other means, switching from the previously focused window to this window.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| isFocusable | Bool | Yes | - | Whether the window supports gaining focus when clicked. true: supports; false: does not support. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowKeepScreenOn(Bool)
```cangjie
public func setWindowKeepScreenOn(isKeepScreenOn: Bool): Unit
```

**Function:** Sets whether the screen remains constantly lit.

> **Note:**
>
> Standard usage of this interface: Set this property to true only in necessary scenarios (such as navigation, video playback, drawing, gaming, etc.); reset this property to false after exiting the aforementioned scenarios; do not use this interface in other scenarios (no screen interaction, audio playback, etc.); when the system detects non-standard usage of this interface, it may restore the automatic screen-off functionality.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| isKeepScreenOn | Bool | Yes | - | Sets whether the screen remains constantly lit. true indicates constant lit; false indicates not constantly lit. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowLayoutFullScreen(Bool)

```cangjie
public func setWindowLayoutFullScreen(isLayoutFullScreen: Bool): Unit
```

**Function:** Sets whether the layout of the main window or sub-window is immersive.

> **Note:**
>
> - When the immersive layout is active, the layout does not avoid the status bar and navigation bar, which may cause components to overlap with them.
> - When the non-immersive layout is active, the layout avoids the status bar and navigation bar, preventing components from overlapping with them.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| isLayoutFullScreen | Bool | Yes | - | Whether the window layout is immersive (the status bar and navigation bar are still displayed in this immersive layout). true indicates immersive layout; false indicates non-immersive layout. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowPrivacyMode(Bool)

```cangjie
public func setWindowPrivacyMode(isPrivacyMode: Bool): Unit
```

**Function:** Sets whether the window is in privacy mode. A window set to privacy mode cannot be captured in screenshots or screen recordings. This interface can be used in scenarios where screenshots/recordings are prohibited.

**Required Permission:** ohos.permission.PRIVACY_WINDOW

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| isPrivacyMode | Bool | Yes | - | Whether the window is in privacy mode. true indicates mode is on; false indicates mode is off. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowSystemBarEnable(Array\<SystemBarType>)

```cangjie
public func setWindowSystemBarEnable(names: Array<SystemBarType>): Unit
```

**Function:** Sets the visibility mode of the three-key navigation bar, status bar, and bottom navigation bar for the main window. The status bar and bottom navigation bar are controlled by status, and the three-key navigation bar is controlled by navigation.

> **Note:**
>
> - This interface does not take effect when called on 2-in-1 devices. On other devices, calling this interface in split-screen mode (i.e., window mode is [WindowStatusType.SplitScreen](#enum-windowstatustype)), free-floating window mode (i.e., window mode is [WindowStatusType.Floating](#enum-windowstatustype)), or free multi-window mode (can be enabled by clicking the free multi-window button in the device control center) will not take effect immediately; it only takes effect when entering full-screen main window.
>
> - The return after calling does not indicate that the display or hiding of the three-key navigation bar, status bar, and bottom navigation bar is complete. Calling this interface on sub-windows does not take effect.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| names | Array\<[SystemBarType](#enum-systembartype)> | Yes | - | Sets whether the status bar, three-key navigation bar, and bottom navigation bar are displayed when the window is in full-screen mode. For example, to display all, set this parameter to [SystemBarType.Status, SystemBarType.Navigation]; if not set, it defaults to not displaying. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowSystemBarProperties(SystemBarProperties)

```cangjie
public func setWindowSystemBarProperties(systemBarProperties: SystemBarProperties): Unit
```

**Function:** Sets the properties of the three-key navigation bar and status bar for the main window.

> **Note:**
>
> - This interface does not take effect when called on 2-in-1 devices. On other devices, calling this interface in split-screen mode (i.e., window mode is [WindowStatusType.SplitScreen](#enum-windowstatustype)), free-floating window mode (i.e., window mode is [WindowStatusType.Floating](#enum-windowstatustype)), or free multi-window mode (can be enabled by clicking the free multi-window button in the device control center) will not take effect immediately; it only takes effect when entering full-screen main window.
>
> - Calling this interface on sub-windows does not take effect.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| systemBarProperties | [SystemBarProperties](#class-systembarproperties) | Yes | - | Properties of the three-key navigation bar and status bar. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowTouchable(Bool)

```cangjie
public func setWindowTouchable(isTouchable: Bool): Unit
```

**Function:** Sets whether the window is touchable.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| isTouchable | Bool | Yes | - | Whether the window is touchable. true indicates touchable; false indicates not touchable. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func showWindow()

```cangjie
public func showWindow(): Unit
```

**Function:** Displays the current window.

> **Note:**
>
> Only supports system windows and application sub-windows, or bringing an already displayed application main window to the top.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func snapshot()

```cangjie
public func snapshot(): PixelMap
```

**Function:** Captures a screenshot of the window, using callback for asynchronous return.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap) | Returns the screenshot of the current window. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

## class WindowProperties

```cangjie
public class WindowProperties {
    public var windowRect: Rect
    public var drawableRect: Rect
    public var winType: WindowType
    public var isFullScreen: Bool
    public var isLayoutFullScreen: Bool
    public var focusable: Bool
    public var touchable: Bool
    public var brightness: Float32
    public var isKeepScreenOn: Bool
    public var isPrivacyMode: Bool
    public var isTransparent: Bool
    public var id: UInt32
    public init(
        windowRect!: Rect,
        drawableRect!: Rect,
        winType!: WindowType,
        isFullScreen!: Bool,
        isLayoutFullScreen!: Bool,
        focusable!: Bool,
        touchable!: Bool,
        brightness!: Float32,
        isKeepScreenOn!: Bool,
        isPrivacyMode!: Bool,
        isTransparent!: Bool,
        id!: UInt32
    )
}
```

**Function:** Window properties.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var brightness

```cangjie
public var brightness: Float32
```

**Function:** Represents the screen brightness. The settable brightness range is [0.0, 1.0], where 1.0 indicates the maximum brightness. If the window does not set a brightness value, it means the brightness follows the system, and the obtained brightness value is -1.

**Type:** Float32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var drawableRect

```cangjie
public var drawableRect: Rect
```

**Function:** Represents the size of the drawable area within the window, where the left and top boundaries are calculated relative to the window.

**Type:** [Rect](#class-rect)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var focusable
```cangjie
public var focusable: Bool
```

**Function:** Indicates whether the window is focusable. The default value is true. true means focusable; false means non-focusable.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var id

```cangjie
public var id: UInt32
```

**Function:** Represents the window ID. The default value is 0.

**Type:** UInt32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var isFullScreen

```cangjie
public var isFullScreen: Bool
```

**Function:** Indicates whether the window is in full-screen mode. The default value is false. true means full-screen; false means non-full-screen.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var isKeepScreenOn

```cangjie
public var isKeepScreenOn: Bool
```

**Function:** Indicates whether the screen stays always on. The default value is false. true means always on; false means not always on.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var isLayoutFullScreen

```cangjie
public var isLayoutFullScreen: Bool
```

**Function:** Indicates whether the window is immersive. The default value is false. true means immersive; false means non-immersive.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var isPrivacyMode

```cangjie
public var isPrivacyMode: Bool
```

**Function:** Indicates whether privacy mode is enabled. The default value is false. true means enabled; false means disabled.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var isTransparent

```cangjie
public var isTransparent: Bool
```

**Function:** Indicates whether the window is transparent. The default value is false. true means transparent; false means opaque.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var touchable

```cangjie
public var touchable: Bool
```

**Function:** Indicates whether the window is touchable. The default value is true. true means touchable; false means non-touchable.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var winType

```cangjie
public var winType: WindowType
```

**Function:** Represents the window type.

**Type:** [WindowType](#enum-windowtype)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### var windowRect

```cangjie
public var windowRect: Rect
```

**Function:** Represents the window dimensions, which can be obtained during the page or application lifecycle.

**Type:** [Rect](#class-rect)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### init(Rect, Rect, WindowType, Bool, Bool, Bool, Bool, Float32, Bool, Bool, Bool, UInt32)

```cangjie
public init(
    windowRect!: Rect,
    drawableRect!: Rect,
    winType!: WindowType,
    isFullScreen!: Bool,
    isLayoutFullScreen!: Bool,
    focusable!: Bool,
    touchable!: Bool,
    brightness!: Float32,
    isKeepScreenOn!: Bool,
    isPrivacyMode!: Bool,
    isTransparent!: Bool,
    id!: UInt32
)
```

**Function:** Constructs a WindowProperties object.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| windowRect | [Rect](#class-rect) | Yes | - | Window dimensions, which can be obtained during the page or application lifecycle. |
| drawableRect | [Rect](#class-rect) | Yes | - | Dimensions of the drawable area within the window, where the left and top boundaries are calculated relative to the window. |
| winType | [WindowType](#enum-windowtype) | Yes | - | Window type. |
| isFullScreen | Bool | Yes | - | Whether the window is in full-screen mode. The default value is false. true means full-screen; false means non-full-screen. |
| isLayoutFullScreen | Bool | Yes | - | Whether the window is immersive. The default value is false. true means immersive; false means non-immersive. |
| focusable | Bool | Yes | - | Whether the window is focusable. The default value is true. true means focusable; false means non-focusable. |
| touchable | Bool | Yes | - | Whether the window is touchable. The default value is true. true means touchable; false means non-touchable. |
| brightness | Float32 | Yes | - | Screen brightness. The settable brightness range is [0.0, 1.0], where 1.0 represents the maximum brightness. If the window does not set a brightness value, it follows the system brightness, and the obtained brightness value is -1. |
| isKeepScreenOn | Bool | Yes | - | Whether the screen stays always on. The default value is false. true means always on; false means not always on. |
| isPrivacyMode | Bool | Yes | - | Whether privacy mode is enabled for the window. true means enabled; false means disabled. |
| isTransparent | Bool | Yes | - | Whether the window is transparent. The default value is false. true means transparent; false means opaque. |
| id | UInt32 | Yes | - | Window ID.<br>Default value: 0 |

## class WindowStage

```cangjie
public class WindowStage {}
```

**Function:** Window manager. Manages basic window units, i.e., Window instances.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### func createSubWindow(String)

```cangjie
public func createSubWindow(name: String): Window
```

**Function:** Creates a sub-window under the current WindowStage instance.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Name of the sub-window. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Window](#class-window) | Returns the sub-window object under the current WindowStage. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func getMainWindow()

```cangjie
public func getMainWindow(): Window
```

**Function:** Gets the main window under the current WindowStage instance.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Window](#class-window) | Returns the main window object under the current WindowStage. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func getSubWindow()

```cangjie
public func getSubWindow(): Array<Window>
```

**Function:** Gets all sub-windows under the current WindowStage instance.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[Window](#class-window)> | Returns all sub-window objects under the current WindowStage. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Window Error Codes](../errorcodes/cj-errorcode-window.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func loadContent(String)

```cangjie
public func loadContent(path: String): Unit
```

**Function:** Loads specific page content for the main window of the current WindowStage.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description |
|:----------|:-------|:----------|:--------|:------------|
| path      | String | Yes       | -       | Path of the page content to be loaded into the window. This path must be added to the project's main_pages.json file. |

## enum AvoidAreaType

```cangjie
public enum AvoidAreaType {
    | TypeSystem
    | TypeCutout
    | TypeSystemGesture
    | TypeKeyboard
    | TypeNavigationIndicator
    | ...
}
```

**Function:** Enumeration of types for areas that window content needs to avoid.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### TypeCutout

```cangjie
TypeCutout
```

**Function:** Represents the notch area of a display.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### TypeKeyboard

```cangjie
TypeKeyboard
```

**Function:** Represents the soft keyboard area.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### TypeNavigationIndicator

```cangjie
TypeNavigationIndicator
```

**Function:** Represents the navigation bar area.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### TypeSystem

```cangjie
TypeSystem
```

**Function:** Represents the default system area. Typically includes the status bar and navigation bar, though definitions may vary across device systems.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### TypeSystemGesture

```cangjie
TypeSystemGesture
```

**Function:** Represents the gesture area.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

## enum ColorSpace

```cangjie
public enum ColorSpace {
    | Default
    | WideGamut
    | ...
}
```

**Function:** Color gamut mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Default

```cangjie
Default
```

**Function:** Default sRGB color gamut mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### WideGamut

```cangjie
WideGamut
```

**Function:** Wide color gamut mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

## enum Orientation

```cangjie
public enum Orientation {
    | Unspecified
    | Portrait
    | Landscape
    | PortraitInverted
    | LandscapeInverted
    | AutoRotation
    | AutoRotationPortrait
    | AutoRotationLandscape
    | AutoRotationRestricted
    | AutoRotationPortraitRestricted
    | AutoRotationLandscapeRestricted
    | Locked
    | ...
}
```

**Function:** Enumeration of window display orientation types.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### AutoRotation

```cangjie
AutoRotation
```

**Function:** Automatically rotates with the sensor, allowing rotation to portrait, landscape, inverted portrait, and inverted landscape orientations.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### AutoRotationLandscape

```cangjie
AutoRotationLandscape
```

**Function:** Automatically rotates horizontally with the sensor, allowing rotation to landscape and inverted landscape orientations, but not to portrait or inverted portrait.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### AutoRotationLandscapeRestricted

```cangjie
AutoRotationLandscapeRestricted
```

**Function:** Automatically rotates horizontally with the sensor, allowing rotation to landscape and inverted landscape orientations, but not to portrait or inverted portrait, and is controlled by the rotation switch in the control center.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### AutoRotationPortrait

```cangjie
AutoRotationPortrait
```

**Function:** Temporarily rotates to portrait when called, then automatically rotates with the sensor, controlled by the rotation switch in the control center, with rotation direction determined by the system.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### AutoRotationPortraitRestricted

```cangjie
AutoRotationPortraitRestricted
```

**Function:** Automatically rotates vertically with the sensor, allowing rotation to portrait and inverted portrait orientations, but not to landscape or inverted landscape, and is controlled by the rotation switch in the control center.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### AutoRotationRestricted

```cangjie
AutoRotationRestricted
```

**Function:** Automatically rotates with the sensor, allowing rotation to portrait, landscape, inverted portrait, and inverted landscape orientations, and is controlled by the rotation switch in the control center.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Landscape

```cangjie
Landscape
```

**Function:** Represents landscape display mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### LandscapeInverted

```cangjie
LandscapeInverted
```

**Function:** Represents inverted landscape display mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Locked

```cangjie
Locked
```

**Function:** Represents locked mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Portrait

```cangjie
Portrait
```

**Function:** Represents portrait display mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### PortraitInverted

```cangjie
PortraitInverted
```

**Function:** Represents inverted portrait display mode.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Unspecified

```cangjie
Unspecified
```

**Function:** Represents undefined orientation mode, determined by the system.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21
**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

## enum SystemBarType  

```cangjie  
public enum SystemBarType {  
    | Status  
    | Navigation  
    | ...  
}  
```  

**Description:** System bar type.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### Navigation  

```cangjie  
Navigation  
```  

**Description:** Bottom navigation bar.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### Status  

```cangjie  
Status  
```  

**Description:** Status bar.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

## enum WindowCallbackType  

```cangjie  
public enum WindowCallbackType {  
    | WindowStageEvent  
    | WindowSizeChange  
    | WindowAvoidAreaChange  
    | KeyboardHeightChange  
    | TouchOutside  
    | WindowVisibilityChange  
    | NoInteractionDetected  
    | Screenshot  
    | DialogTargetTouch  
    | WindowEvent  
    | WindowStatusChange  
    | SubWindowClose  
    | WindowTitleButtonRectChange  
    | WindowRectChange  
    | ...  
}  
```  

**Description:** Enumeration of window callback event types.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### DialogTargetTouch  

```cangjie  
DialogTargetTouch  
```  

**Description:** Click or touch event on the window covered by a modal window.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### KeyboardHeightChange  

```cangjie  
KeyboardHeightChange  
```  

**Description:** Keyboard height change event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### NoInteractionDetected  

```cangjie  
NoInteractionDetected  
```  

**Description:** Event triggered when no interaction is detected within the specified timeout period for this window.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### Screenshot  

```cangjie  
Screenshot  
```  

**Description:** Screenshot event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### SubWindowClose  

```cangjie  
SubWindowClose  
```  

**Description:** Sub-window close event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### TouchOutside  

```cangjie  
TouchOutside  
```  

**Description:** Click event outside the bounds of this window.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowAvoidAreaChange  

```cangjie  
WindowAvoidAreaChange  
```  

**Description:** System avoid area change event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowEvent  

```cangjie  
WindowEvent  
```  

**Description:** Window lifecycle change event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowRectChange  

```cangjie  
WindowRectChange  
```  

**Description:** Window rectangle change event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowSizeChange  

```cangjie  
WindowSizeChange  
```  

**Description:** Window size change event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowStageEvent  

```cangjie  
WindowStageEvent  
```  

**Description:** WindowStage lifecycle change event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowStatusChange  

```cangjie  
WindowStatusChange  
```  

**Description:** Window mode change event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowTitleButtonRectChange  

```cangjie  
WindowTitleButtonRectChange  
```  

**Description:** Minimize, maximize, and close button rectangle area change event on the title bar.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowVisibilityChange  

```cangjie  
WindowVisibilityChange  
```  

**Description:** Window visibility state change event.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

## enum WindowEventType  

```cangjie  
public enum WindowEventType {  
    | WindowShown  
    | WindowActive  
    | WindowInactive  
    | WindowHidden  
    | WindowDestroyed  
    | ...  
}  
```  

**Description:** Window lifecycle.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowActive  

```cangjie  
WindowActive  
```  

**Description:** Focused state.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowDestroyed  

```cangjie  
WindowDestroyed  
```  

**Description:** Window destruction.  

**System Capability:** SystemCapability.Window.SessionManager  

**Since:** 21  

### WindowHidden  

```cangjie  
WindowHidden  
```  

**Description:** Moved to background.  

**System Capability:** SystemCapability.WindowManager.WindowManager.Core  

**Since:** 21  

### WindowInactive  

```cangjie  
WindowInactive  
```
**Function:** Loss of focus state.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### WindowShown

```cangjie
WindowShown
```

**Function:** Switched to foreground.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

## enum WindowStageEventType

```cangjie
public enum WindowStageEventType {
    | Shown
    | Active
    | Inactive
    | Hidden
    | Resumed
    | Paused
    | ...
}
```

**Function:** WindowStage lifecycle.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Active

```cangjie
Active
```

**Function:** Focused state, e.g., the state after an application window handles a click event or after an application starts.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Hidden

```cangjie
Hidden
```

**Function:** Switched to background, e.g., when an application is exited by swiping up or when an application window is closed.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Inactive

```cangjie
Inactive
```

**Function:** Loss of focus state, e.g., the state of the originally focused window after opening a new application or clicking another window.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Paused

```cangjie
Paused
```

**Function:** Foreground non-interactive state, e.g., the state after swiping up from the bottom of the screen and the application enters the multitasking interface.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Resumed

```cangjie
Resumed
```

**Function:** Foreground interactive state, e.g., the state where the application can interact with the user after being opened.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### Shown

```cangjie
Shown
```

**Function:** Switched to foreground, e.g., triggered when clicking the application icon to launch, whether it's the first launch or launching from the background.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

## enum WindowStatusType

```cangjie
public enum WindowStatusType {
    | Undefined
    | FullScreen
    | Maximize
    | Minimize
    | Floating
    | SplitScreen
    | ...
}
```

**Function:** Window mode enumeration.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### Floating

```cangjie
Floating
```

**Function:** Indicates the free-floating window mode of an APP.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### FullScreen

```cangjie
FullScreen
```

**Function:** Indicates the full-screen mode of an APP.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### Maximize

```cangjie
Maximize
```

**Function:** Indicates the maximized window mode of an APP.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### Minimize

```cangjie
Minimize
```

**Function:** Indicates the minimized window mode of an APP.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### SplitScreen

```cangjie
SplitScreen
```

**Function:** Indicates the split-screen mode of an APP.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

### Undefined

```cangjie
Undefined
```

**Function:** Indicates the undefined window mode of an APP.

**System Capability:** SystemCapability.Window.SessionManager

**Since:** 21

## enum WindowType

```cangjie
public enum WindowType {
    | TypeApp
    | TypeFloat
    | TypeDialog
    | ...
}
```

**Function:** Window type enumeration.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### TypeApp

```cangjie
TypeApp
```

**Function:** Indicates an application window.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### TypeDialog

```cangjie
TypeDialog
```

**Function:** Indicates a modal window.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

### TypeFloat

```cangjie
TypeFloat
```

**Function:** Indicates a floating window.

**System Capability:** SystemCapability.WindowManager.WindowManager.Core

**Since:** 21

## type WindowStageNativeHandler

```cangjie
public type WindowStageNativeHandler = Int64
```

**Function:** [WindowStageNativeHandler](#type-windowstagenativehandler) is an alias of the Int64 type.