# ohos.ui_test (UI Testing)

ui_test provides the capability to simulate UI operations for developers to use in testing scenarios, primarily supporting UI operations such as clicking, double-clicking, long-pressing, swiping, etc.

This module offers the following functionalities:

- [UITest](#class-uitest): The [UITest](#class-uitest) class contains only a static method `setup` for initializing the ui_test library.
- [On](#class-on): Provides control feature description capabilities for control filtering, matching, and searching.
- [UIComponent](#class-uicomponent): Represents a specified control on the UI interface, offering capabilities such as control property retrieval, control clicking, swiping, text injection, etc.
- [Driver](#class-driver): The entry class, providing capabilities like control matching, searching, key injection, coordinate clicking or swiping, screenshotting, etc.
- [UiWindow](#class-uiwindow): The entry class, providing capabilities such as window property retrieval, window dragging, and resizing.

## Importing the Module

```cangjie
import kit.TestKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of the example code has a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the aforementioned example projects and configuration templates, refer to [Cangjie Example Code Description](../../cj-development-intro.md#cangjie-example-code-description).

## Running Tests

### Preparations

- Connect the device supporting the uitest framework to a PC/2-in-1, and install the corresponding drivers and hdc service on the PC.
- For devices using the uitest framework for the first time after flashing, execute `hdc shell param set persist.ace.testmode.enabled 1` and restart the device to enable ACE, ensuring the device can obtain ArkUI control node information through the accessibility service.
- Execute `hdc shell param set persist.sys.suspend_manager_enabled 0` and restart the device to disable the background application freezing mechanism.

### Test Command

```text
hdc shell aa test -b com.example.myapplication -m entry -s unittest CJTestRunner
```

- Here, `-b com.example.myapplication -m entry` should be filled according to the actual bundle name and module name in the app.
- The final `CJTestRunner` is the first parameter registered with `TestRunner.registerCreator`.

## class Driver

```cangjie
public class Driver {}
```

**Functionality:** The [Driver](#class-driver) class serves as the main entry for the uitest testing framework, providing capabilities such as control matching, searching, key injection, coordinate clicking or swiping, screenshotting, etc.

**System Capability:** SystemCapability.Test.UiTest

**Since Version:** 21

### static func create()

```cangjie
public static func create(): Driver
```

**Functionality:** A static method that constructs a [Driver](#class-driver) object and returns it.

**System Capability:** SystemCapability.Test.UiTest

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Driver](#class-driver) | Returns the constructed [Driver](#class-driver) object. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000001| If the test framework failed to initialize. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
```

### func assertComponentExist(On)

```cangjie
public func assertComponentExist(on: On): Unit
```

**Functionality:** An assertion API used to verify whether a control matching the given target properties exists on the current interface.

**System Capability:** SystemCapability.Test.UiTest

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| on | [On](#class-on) | Yes | - | The property requirements of the target control. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000002| If the async function was not called with await. |
  |17000003| If the assertion failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.assertComponentExist(On().text("next page"))
```

### func click(Int32, Int32)

```cangjie
public func click(x: Int32, y: Int32): Unit
```

**Functionality:** The [Driver](#class-driver) object performs a click operation at the target coordinate point.

**System Capability:** SystemCapability.Test.UiTest

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | Int32 | Yes | - | The horizontal coordinate of the target point, passed as an Int32. |
| y | Int32 | Yes | - | The vertical coordinate of the target point, passed as an Int32. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000002| If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.click(100, 100)
```

### func createUIEventObserver()

```cangjie
public func createUIEventObserver(): UIEventObserver
```

**Functionality:** Creates a UI event listener.

**System Capability:** SystemCapability.Test.UiTest

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [UIEventObserver](#class-uieventobserver) | Returns the found target window object. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000002| If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let observer: UIEventObserver = driver.createUIEventObserver()
```

### func delayMs(Int32)

```cangjie
public func delayMs(delayMs: Int32): Unit
```

**Functionality:** The [Driver](#class-driver) object delays for the given time.

**System Capability:** SystemCapability.Test.UiTest

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| delayMs | Int32 | Yes | - | The given time, in milliseconds. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000002| If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.delayMs(1000)
```

### func doubleClick(Int32, Int32)

```cangjie
public func doubleClick(x: Int32, y: Int32): Unit
```

**Functionality:** The [Driver](#class-driver) object performs a double-click operation at the target coordinate point.

**System Capability:** SystemCapability.Test.UiTest

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | Int32 | Yes | - | The horizontal coordinate of the target point, passed as an Int32. |
| y | Int32 | Yes | - | The vertical coordinate of the target point, passed as an Int32. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000002| If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.doubleClick(100, 100)
```

### func drag(Int32, Int32, Int32, Int32, Int32)
```cangjie
public func drag(startx: Int32, starty: Int32, endx: Int32, endy: Int32, speed!: Int32 = 600): Unit
```

**Function:** The [Driver](#class-driver) object performs a drag operation from the starting coordinates to the target coordinates.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| startx | Int32 | Yes | - | The x-coordinate of the starting point, passed as Int32. |
| starty | Int32 | Yes | - | The y-coordinate of the starting point, passed as Int32. |
| endx | Int32 | Yes | - | The x-coordinate of the destination point, passed as Int32. |
| endy | Int32 | Yes | - | The y-coordinate of the destination point, passed as Int32. |
| speed | Int32 | No | 600 | **Named parameter.** The sliding speed, range: 200-15000. If out of range, the default value is 600. Unit: pixels/second. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.drag(100, 100, 200, 200, speed: 600)
```

### func findComponent(On)

```cangjie
public func findComponent(on: On): UIComponent
```

**Function:** Finds a target component in the [Driver](#class-driver) object based on the given target component property requirements.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| on | [On](#class-on) | Yes | - | The property requirements of the target component. |

**Return Value:**

| Type | Description |
|:----|:----|
| [UIComponent](#class-uicomponent) | The found component object. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().text("next page"))
```

### func findComponents(On)

```cangjie
public func findComponents(on: On): Array<UIComponent>
```

**Function:** Finds all matching components in the [Driver](#class-driver) object based on the given target component property requirements and saves them in a list.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| on | [On](#class-on) | Yes | - | The property requirements of the target component. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[UIComponent](#class-uicomponent)> | The property requirements of the target component. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let buttonList: Array<UIComponent> = driver.findComponents(On().text("next page"))
```

### func findWindow(WindowFilter)

```cangjie
public func findWindow(filter: WindowFilter): UiWindow
```

**Function:** Finds a target window by specifying its properties.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| filter | [WindowFilter](#class-windowfilter) | Yes | - | The properties of the target window. |

**Return Value:**

| Type | Description |
|:----|:----|
| [UiWindow](#class-uiwindow) | The found target window object. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
```

### func fling(Point, Point, Int32, Int32)

```cangjie
public func fling(fromP: Point, to: Point, stepLen: Int32, speed: Int32): Unit
```

**Function:** Simulates a quick swipe operation where the finger slides and then leaves the screen, specifying direction and speed.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fromP | [Point](#class-point) | Yes | - | The starting point coordinates where the finger touches the screen. |
| to | [Point](#class-point) | Yes | - | The coordinates where the finger leaves the screen. |
| stepLen | Int32 | Yes | - | The interval distance, unit: pixels. |
| speed | Int32 | Yes | - | The sliding speed, range: 200-40000. If out of range, the default value is 600. Unit: pixels/second. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.fling(Point(500, 480), Point(450, 480), 5, 600)
```

### func fling(UiDirection, Int32)

```cangjie
public func fling(direction: UiDirection, speed: Int32): Unit
```

**Function:** Simulates a quick swipe operation where the finger slides and then leaves the screen, specifying direction and speed.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| direction | [UiDirection](#enum-uidirection) | Yes | - | The direction of the swipe. |
| speed | Int32 | Yes | - | The sliding speed, range: 200-40000. If out of range, the default value is 600. Unit: pixels/second. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.fling(UiDirection.DOWN, 10000)
```

### func getDisplayDensity()

```cangjie
public func getDisplayDensity(): Point
```

**Function:** Gets the resolution of the current device screen.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Point](#class-point) | Returns the resolution of the current device screen. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
let driver: Driver = Driver.create()
let density = driver.getDisplayDensity()
```

### func getDisplayRotation()

```cangjie
public func getDisplayRotation(): DisplayRotation
```

**Function:** Gets the current screen display orientation of the device.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [DisplayRotation](#enum-displayrotation) | Returns the current display orientation of the device. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let rotation: DisplayRotation = driver.getDisplayRotation()
```

### func getDisplaySize()

```cangjie
public func getDisplaySize(): Point
```

**Function:** Gets the current screen size of the device.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Point](#class-point) | Returns the current screen size of the device. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let size = driver.getDisplaySize()
```

### func injectMultiPointerAction(PointerMatrix, Int32)

```cangjie
public func injectMultiPointerAction(pointers: PointerMatrix, speed!: Int32 = 600): Bool
```

**Function:** Injects a multi-pointer action into the device.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| pointers | [PointerMatrix](#class-pointermatrix) | Yes | - | The sliding trajectory, including the number of fingers and the sequence of sliding coordinates. |
| speed | Int32 | No | 600 | **Named parameter.** The sliding speed, range: 200-15000. If out of range, the default value is 600. Unit: pixels/second. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns whether the operation was successfully completed. Returns true if successful, otherwise false. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let pointers: PointerMatrix = PointerMatrix.create(2, 3)
pointers.setPoint(0, 0, Point(230, 480))
pointers.setPoint(0, 1, Point(250, 380))
pointers.setPoint(0, 2, Point(270, 280))
pointers.setPoint(1, 0, Point(230, 680))
pointers.setPoint(1, 1, Point(240, 580))
pointers.setPoint(1, 2, Point(250, 480))
driver.injectMultiPointerAction(pointers)
```

### func inputText(Point, String)

```cangjie
public func inputText(p: Point, text: String): Unit
```

**Function:** Inputs text at the specified coordinate point.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| p | [Point](#class-point) | Yes | - | The coordinate point for text input. |
| text | String | Yes | - | The text information to input. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let text: UIComponent = driver.findComponent(On().onType("TextInput"))
let point = text.getBoundsCenter()
driver.inputText(point, "123")
```

### func longClick(Int32, Int32)

```cangjie
public func longClick(x: Int32, y: Int32): Unit
```

**Function:** Performs a long press operation at the target coordinate point by the [Driver](#class-driver) object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | Int32 | Yes | - | The horizontal coordinate of the target point, passed as Int32. |
| y | Int32 | Yes | - | The vertical coordinate of the target point, passed as Int32. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.longClick(100, 100)
```

### func mouseClick(Point, MouseButton, Option\<Int32>, Option\<Int32>)

```cangjie
public func mouseClick(p: Point, btnId: MouseButton, key1!: Option<Int32> = None, key2!: Option<Int32> = None): Unit
```

**Function:** Injects a mouse click action at the specified coordinate point, supporting simultaneous pressing of corresponding keyboard combination keys. For example, when the Key value is 2072, press CTRL and perform the mouse click action.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| p | [Point](#class-point) | Yes | - | The coordinate for mouse click. |
| btnId | [MouseButton](#enum-mousebutton) | Yes | - | The mouse button to press. |
| key1 | Option\<Int32> | No | None | **Named parameter.** The first specified key value. |
| key2 | Option\<Int32> | No | None | **Named parameter.** The second specified key value. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.mouseClick(Point(248, 194), MouseButton.MOUSE_BUTTON_LEFT, key1: 2072)
```

### func mouseDoubleClick(Point, MouseButton, Option\<Int32>, Option\<Int32>)

```cangjie
public func mouseDoubleClick(p: Point, btnId: MouseButton, key1!: Option<Int32> = None, key2!: Option<Int32> = None): Unit
```

**Function:** Injects a mouse double-click action at the specified coordinate point, supporting simultaneous pressing of corresponding keyboard combination keys. For example, when the Key value is 2072, press CTRL and perform the mouse double-click action.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| p | [Point](#class-point) | Yes | - | The coordinate for mouse double-click. |
| btnId | [MouseButton](#enum-mousebutton) | Yes | - | The mouse button to press. |
| key1 | Option\<Int32> | No | None | **Named parameter.** The first specified key value. |
| key2 | Option\<Int32> | No | None | **Named parameter.** The second specified key value. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj
import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.mouseDoubleClick(Point(248, 194), MouseButton.MOUSE_BUTTON_LEFT, key1: 2072)
```

### func mouseDrag(Point, Point, Int32)

```cangjie
public func mouseDrag(fromP: Point, to: Point, speed!: Int32 = 600): Unit
```

**Function:** Drags the mouse while holding the left button from the starting point to the destination point.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fromP | [Point](#class-point) | Yes | - | Coordinates of the starting point. |
| to | [Point](#class-point) | Yes | - | Coordinates of the destination point. |
| speed | Int32 | No | 600 | **Named parameter.** Drag speed, range: 200-15000. If out of range, defaults to 600. Unit: pixels/second. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.mouseDrag(Point(100, 100), Point(200, 200))
```

### func mouseLongClick(Point, MouseButton, Option\<Int32>, Option\<Int32>)

```cangjie
public func mouseLongClick(p: Point, btnId: MouseButton, key1!: Option<Int32> = None, key2!: Option<Int32> = None): Unit
```

**Function:** Injects a mouse long-press action at the specified coordinates, supporting simultaneous keyboard key combinations. For example, when Key value is 2072, it presses CTRL while performing the mouse long-press action.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| p | [Point](#class-point) | Yes | - | Coordinates for the mouse long-press. |
| btnId | [MouseButton](#enum-mousebutton) | Yes | - | The mouse button to press. |
| key1 | Option\<Int32> | No | None | **Named parameter.** Specified first key value. |
| key2 | Option\<Int32> | No | None | **Named parameter.** Specified second key value. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.mouseLongClick(Point(248, 194), MouseButton.MOUSE_BUTTON_LEFT, key1: 2072)
```

### func mouseMoveTo(Point)

```cangjie
public func mouseMoveTo(p: Point): Unit
```

**Function:** Moves the mouse cursor to the target point.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| p | [Point](#class-point) | Yes | - | Coordinates of the target point. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.mouseMoveTo(Point(248, 194))
```

### func mouseMoveWithTrack(Point, Point, Int32)

```cangjie
public func mouseMoveWithTrack(fromP: Point, to: Point, speed!: Int32 = 600): Unit
```

**Function:** Moves the mouse from the starting point coordinates to the destination point coordinates.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fromP | [Point](#class-point) | Yes | - | Coordinates of the starting point. |
| to | [Point](#class-point) | Yes | - | Coordinates of the destination point. |
| speed | Int32 | No | 600 | **Named parameter.** Movement speed, range: 200-15000. If out of range, defaults to 600. Unit: pixels/second. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.mouseMoveWithTrack(Point(100, 100), Point(200, 200))
```

### func mouseScroll(Point, Bool, Int32, Option\<Int32>, Option\<Int32>, Int32)

```cangjie
public func mouseScroll(p: Point, down: Bool, d: Int32, key1!: Option<Int32> = None, key2!: Option<Int32> = None,
 speed!: Int32 = 20): Unit
```

**Function:** Injects a mouse wheel scroll action at the specified coordinates, supporting simultaneous keyboard key combinations and specified scroll speed.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| p | [Point](#class-point) | Yes | - | Coordinates for the mouse scroll. |
| down | Bool | Yes | - | Whether the scroll direction is downward. true for downward, false for upward. |
| d | Int32 | Yes | - | Number of mouse wheel scroll steps. Each step corresponds to 120 pixels of movement at the target point. |
| key1 | Option\<Int32> | No | None | **Named parameter.** Specified first key value. |
| key2 | Option\<Int32> | No | None | **Named parameter.** Specified second key value. |
| speed | Int32 | No | 20 | **Named parameter.** Mouse wheel scroll speed, range: 1-500. If out of range, defaults to 20. Unit: steps/second. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.mouseScroll(Point(360, 640), true, 30, key1: 2072)
```

### func pressBack()

```cangjie
public func pressBack(): Unit
```

**Function:** Performs a BACK key press operation for the [Driver](#class-driver) object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.pressBack()
```

### func pressHome()

```cangjie
public func pressHome(): Unit
```

**Function:** Returns the device to the home screen.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.pressHome()
```

### func screenCap(String)

```cangjie
public func screenCap(savePath: String): Bool
```

**Function:** Captures the current screen as a PNG image and saves it to the specified path.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21
**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| savePath | String | Yes | - | File save path. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the screenshot operation was successfully completed. Returns `true` if successful, otherwise `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.screenCap("/data/storage/el2/base/cache/1.png")
```

### func screenCapture(String, Option\<Rect>)

```cangjie
public func screenCapture(savePath: String, rect!: Option<Rect> = None): Bool
```

**Function:** Captures the current screen and saves it as a PNG image to the specified path.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| savePath | String | Yes | - | File save path. |
| rect | Option\<[Rect](#class-rect)> | No | None | **Named parameter.** Screenshot area, defaults to full screen. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the screenshot operation was successfully completed. Returns `true` if successful, otherwise `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.screenCapture("/data/storage/el2/base/cache/1.png", rect: Rect(0, 0, 100, 100))
```

### func setDisplayRotation(DisplayRotation)

```cangjie
public func setDisplayRotation(rotation: DisplayRotation): Unit
```

**Function:** Sets the device's screen display orientation to the specified direction.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| rotation | [DisplayRotation](#enum-displayrotation) | Yes | - | Device display orientation. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.setDisplayRotation(DisplayRotation.ROTATION_180)
```

### func setDisplayRotationEnabled(Bool)

```cangjie
public func setDisplayRotationEnabled(enabled: Bool): Unit
```

**Function:** Enables or disables the device's screen rotation capability.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enabled | Bool | Yes | - | Flag indicating whether screen rotation is allowed. `true`: enabled, `false`: disabled. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.setDisplayRotationEnabled(false)
```

### func swipe(Int32, Int32, Int32, Int32, Int32)

```cangjie
public func swipe(startx: Int32, starty: Int32, endx: Int32, endy: Int32, speed!: Int32 = 600): Unit
```

**Function:** Performs a swipe operation from the start coordinates to the target coordinates for the [Driver](#class-driver) object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| startx | Int32 | Yes | - | X-coordinate of the start point as Int32. |
| starty | Int32 | Yes | - | Y-coordinate of the start point as Int32. |
| endx | Int32 | Yes | - | X-coordinate of the end point as Int32. |
| endy | Int32 | Yes | - | Y-coordinate of the end point as Int32. |
| speed | Int32 | No | 600 | **Named parameter.** Swipe speed, range: 200-15000. If out of range, defaults to 600. Unit: pixels/second. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.swipe(100, 100, 200, 200, speed: 600)
```

### func triggerCombineKeys(Int32, Int32, Option\<Int32>)

```cangjie
public func triggerCombineKeys(key0: Int32, key1: Int32, key2!: Option<Int32> = None): Unit
```

**Function:** Finds and clicks the corresponding key combination based on the given key values for the [Driver](#class-driver) object. For example, when the key values are (2072, 2019), the [Driver](#class-driver) object finds and clicks the corresponding key combination, such as CTRL+C.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key0 | Int32 | Yes | - | First specified key value. |
| key1 | Int32 | Yes | - | Second specified key value. |
| key2 | Option\<Int32> | No | None | **Named parameter.** Third specified key value. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.triggerCombineKeys(2072, 2047, key2: 2035)
```

### func triggerKey(Int32)

```cangjie
public func triggerKey(keyCode: Int32): Unit
```

**Function:** Simulates clicking the corresponding key based on the given key value for the [Driver](#class-driver) object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| keyCode | Int32 | Yes | - | Specified key value. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.triggerKey(123)
```

### func waitForComponent(On, Int32)

```cangjie
public func waitForComponent(on: On, time: Int32): UIComponent
```

**Function:** Continuously searches for the target component that meets the specified attribute requirements within the given time for the [Driver](#class-driver) object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| on | [On](#class-on) | Yes | - | Attribute requirements for the target control. |
| time | Int32 | Yes | - | Duration for locating the target control. Unit: ms. |

**Return Value:**

| Type | Description |
|:----|:----|
| [UIComponent](#class-uicomponent) | The located control object. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.waitForComponent(On().text("next page"), 500)
```

### func waitForIdle(Int32, Int32)

```cangjie
public func waitForIdle(idleTime: Int32, timeout: Int32): Unit
```

**Function:** Determines whether all controls on the current interface are idle.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| idleTime | Int32 | Yes | - | Threshold for idle time. If controls remain unchanged during this period, they are considered idle. Unit: milliseconds. |
| timeout | Int32 | Yes | - | Maximum waiting time for idle state. Unit: milliseconds. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let idled = driver.waitForIdle(4000, 5000)
```

### func wakeUpDisplay()

```cangjie
public func wakeUpDisplay(): Unit
```

**Function:** Wakes up the current device (i.e., turns on the screen).

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
driver.wakeUpDisplay()
```

## class On

```cangjie
public class On {
    public init()
}
```

**Function:** In the UiTest framework, the On class provides rich control feature description APIs for filtering controls to match or locate target controls.

[On](#class-on) offers the following API capabilities:

1. Supports single-attribute matching and multi-attribute combination matching, such as specifying both text and id for the target control.

2. Control attributes support multiple matching modes.

3. Supports absolute positioning and relative positioning of controls. Nearby control features can be limited for auxiliary positioning using APIs like [isBefore](#func-isbeforeon) and [isAfter](#func-isafteron).

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

### init()

```cangjie
public init()
```

**Function:** Creates an [On](#class-on) instance.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

### func checkable(Bool)

```cangjie
public func checkable(b!: Bool = true): On
```

**Function:** Specifies the checkable state attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| b | Bool | No | true | **Named parameter.** Specifies whether the control can be checked. true: checkable, false: not checkable. Default is false. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object with the specified checkable state attribute for the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().checkable(b: true) // Specifies the checkable state attribute of the target control.
    }
}
```

### func checked(Bool)

```cangjie
public func checked(b!: Bool = true): On
```

**Function:** Specifies the checked state attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| b | Bool | No | true | **Named parameter.** Specifies the checked state of the control. true: checked, false: unchecked. Default is false. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object with the specified checked state attribute for the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().checked(b: true) // Specifies the checked state attribute of the target control.
    }
}
```

### func clickable(Bool)

```cangjie
public func clickable(b!: Bool = true): On
```

**Function:** Specifies the clickable state attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| b | Bool | No | true | **Named parameter.** Specifies the clickable state of the control. true: clickable, false: not clickable. Default is true. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object with the specified clickable state attribute for the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().clickable(b: true) // Specifies the clickable state attribute of the target control.
    }
}
```

### func description(String, ?MatchPattern)

```cangjie
public func description(val: String, pattern!: ?MatchPattern = None): On
```

**Function:** Specifies the description attribute of the target control, supporting multiple matching modes, and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| val | String | Yes | - | The description attribute of the control. |
| pattern | ?[MatchPattern](#enum-matchpattern) | No | None | **Named parameter.** Specifies the text matching pattern. Default is EQUALS. |**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns an [On](#class-on) object with the specified control type attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().description("123") // Specifies the control type attribute of the target control.
    }
}
```

### func enabled(Bool)

```cangjie
public func enabled(b!: Bool = true): On
```

**Function:** Specifies the enabled state attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| b | Bool | No | true | **Named parameter.** Specifies the enabled state of the control: `true` for enabled, `false` for disabled. Default is `true`. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns an [On](#class-on) object with the specified enabled state attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().enabled(b: true) // Specifies the enabled state attribute of the target control.
    }
}
```

### func focused(Bool)

```cangjie
public func focused(b!: Bool = true): On
```

**Function:** Specifies the focus state attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| b | Bool | No | true | **Named parameter.** Specifies the focus state of the control: `true` for focused, `false` for unfocused. Default is `true`. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns an [On](#class-on) object with the specified focus state attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().focused(b: true) // Specifies the focus state attribute of the target control.
    }
}
```

### func id(String)

```cangjie
public func id(id: String): On
```

**Function:** Specifies the ID attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| id | String | Yes | - | Specifies the ID value of the control. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns an [On](#class-on) object with the specified ID attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().id("123") // Specifies the ID attribute of the target control.
    }
}
```

### func inWindow(String)

```cangjie
public func inWindow(bundleName: String): On
```

**Function:** Specifies that the target control is located within the given application window and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| bundleName | String | Yes | - | The package name of the application window. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns an [On](#class-on) object specifying that the target control is located within the given application window. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().inWindow("com.uitestScene.acts") // Specifies that the target control is located within the given application window.
    }
}
```

### func isAfter(On)

```cangjie
public func isAfter(on: On): On
```

**Function:** Specifies that the target control is located after the given characteristic attribute control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| on | [On](#class-on) | Yes | - | The attribute requirements of the characteristic control. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns an [On](#class-on) object specifying that the target control is located after the given characteristic attribute control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on1: On = On().text("123") // Specifies the characteristic attribute control
        let on2: On = On().onType("Text").isAfter(on1)  // Finds the first Text component after the control with text "123"
    }
}
```

### func isBefore(On)

```cangjie
public func isBefore(on: On): On
```

**Function:** Specifies that the target control is located before the given characteristic attribute control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| on | [On](#class-on) | Yes | - | The attribute requirements of the characteristic control. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns an [On](#class-on) object specifying that the target control is located before the given characteristic attribute control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on1: On = On().text("123") // Specifies the characteristic attribute control
        let on2: On = On().onType("Button").isBefore(on1)  // Finds the first Button component before the text "123"
    }
}
```

### func longClickable(Bool)

```cangjie
public func longClickable(b!: Bool = true): On
```

**Function:** Specifies the long-clickable state attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| b | Bool | No | true | **Named parameter.** Specifies the long-clickable state of the control. `true`: long-clickable; `false`: not long-clickable. Default is `true`. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object with the specified long-clickable state attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().longClickable(b: true) // Specifies the long-clickable state attribute of the target control.
    }
}
```

### func onType(String)

```cangjie
public func onType(tp: String): On
```

**Function:** Specifies the control type attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| tp | String | Yes | - | Specifies the control type. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object with the specified control type attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().onType("Button") // Specifies the control type attribute of the target control.
    }
}
```

### func scrollable(Bool)

```cangjie
public func scrollable(b!: Bool = true): On
```

**Function:** Specifies the scrollable state attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| b | Bool | No | true | **Named parameter.** Specifies the scrollable state of the control. `true`: scrollable; `false`: not scrollable. Default is `true`. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object with the specified scrollable state attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().scrollable(b: true) // Specifies the scrollable state attribute of the target control.
    }
}
```

### func selected(Bool)

```cangjie
public func selected(b!: Bool = true): On
```

**Function:** Specifies the selected state attribute of the target control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| b | Bool | No | true | **Named parameter.** Specifies the selected state of the control. `true`: selected; `false`: not selected. Default is `true`. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object with the specified selected state attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().selected(b: true) // Specifies the selected state attribute of the target control.
    }
}
```

### func text(String, MatchPattern)

```cangjie
public func text(txt: String, pattern!: MatchPattern = MatchPattern.EQUALS): On
```

**Function:** Specifies the text attribute of the target control, supporting multiple matching patterns, and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| txt | String | Yes | - | Specifies the control text for matching the target control text. |
| pattern | [MatchPattern](#enum-matchpattern) | No | [MatchPattern](#enum-matchpattern).EQUALS | **Named parameter.** Specifies the text matching pattern. Default is `EQUALS`. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object with the specified text attribute of the target control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on: On = On().text("123") // Specifies the text attribute of the target control.
    }
}
```

### func within(On)

```cangjie
public func within(on: On): On
```

**Function:** Specifies that the target control is located within the given characteristic attribute control and returns the [On](#class-on) object itself.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| on | [On](#class-on) | Yes | - | Attribute requirements of the characteristic control. |

**Return Value:**

| Type | Description |
|:----|:----|
| [On](#class-on) | Returns the [On](#class-on) object specifying that the target control is within the given characteristic attribute control. |

**Example:**

<!-- compile -->

```cangjie
//example_test.cj

import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        unittest()
    }
    @TestCase
    func test01(): Unit {
        let on1: On = On().onType("Scroll") // Specifies the characteristic attribute control
        let on2: On = On().text("123").within(on1) // Finds the child component with text "123" within the Scroller
    }
}
```

## class Point

```cangjie
public class Point {
    public Point(
        public let x: IntNative,
        public let y: IntNative
    )
}
```

**Function:** Coordinate point information.

**System Capability:** SystemCapability.Test.UiTest**Initial Version:** 21  

### let x  

```cangjie  
public let x: IntNative  
```  

**Function:** The x-coordinate of a point.  

**Type:** IntNative  

**Read/Write Capability:** Read-only  

**Initial Version:** 21  

### let y  

```cangjie  
public let y: IntNative  
```  

**Function:** The y-coordinate of a point.  

**Type:** IntNative  

**Read/Write Capability:** Read-only  

**Initial Version:** 21  

### Point(IntNative, IntNative)  

```cangjie  
public Point(  
    public let x: IntNative,  
    public let y: IntNative  
)  
```  

**Function:** Creates a Point instance.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| x | IntNative | Yes | - | The x-coordinate of the point. |  
| y | IntNative | Yes | - | The y-coordinate of the point. |  

## class PointerMatrix  

```cangjie  
public class PointerMatrix {}  
```  

**Function:** A two-dimensional array used for multi-touch operations, storing the coordinates of each finger and the behavior of each step.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

### static func create(IntNative, IntNative)  

```cangjie  
public static func create(fingers: IntNative, steps: IntNative): PointerMatrix  
```  

**Function:** A static method that constructs a [PointerMatrix](#class-pointermatrix) object and returns it.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| fingers | IntNative | Yes | - | The number of fingers involved in the multi-touch operation. Valid range: [1, 10]. |  
| steps | IntNative | Yes | - | The number of steps for each finger operation. Valid range: [1, 1000]. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [PointerMatrix](#class-pointermatrix) | Returns the constructed [PointerMatrix](#class-pointermatrix) object. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import ohos.base.*  
import kit.TestKit.*  

let pointerMatrix: PointerMatrix = PointerMatrix.create(2, 3)  
```  

### func setPoint(IntNative, IntNative, Point)  

```cangjie  
public func setPoint(fingers: IntNative, steps: IntNative, point: Point): Unit  
```  

**Function:** Sets the coordinate point for the specified finger and step in the [PointerMatrix](#class-pointermatrix) object.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| fingers | IntNative | Yes | - | The index of the finger. |  
| steps | IntNative | Yes | - | The index of the step. |  
| point | [Point](#class-point) | Yes | - | The coordinate point for this action. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import ohos.base.*  
import kit.TestKit.*  

let pointerMatrix: PointerMatrix = PointerMatrix.create(2, 3)  
pointerMatrix.setPoint(0, 0, Point(230, 480))  
pointerMatrix.setPoint(0, 1, Point(250, 380))  
pointerMatrix.setPoint(0, 2, Point(270, 280))  
pointerMatrix.setPoint(1, 0, Point(230, 680))  
pointerMatrix.setPoint(1, 1, Point(240, 580))  
pointerMatrix.setPoint(1, 2, Point(250, 480))  
```  

## class Rect  

```cangjie  
public class Rect {  
    public Rect(  
        public let left: IntNative,  
        public let top: IntNative,  
        public let right: IntNative,  
        public let bottom: IntNative  
    )  
}  
```  

**Function:** The border information of a UI component.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

### let bottom  

```cangjie  
public let bottom: IntNative  
```  

**Function:** The Y-coordinate of the bottom-right corner of the component's border.  

**Type:** IntNative  

**Read/Write Capability:** Read-only  

**Initial Version:** 21  

### let left  

```cangjie  
public let left: IntNative  
```  

**Function:** The X-coordinate of the top-left corner of the component's border.  

**Type:** IntNative  

**Read/Write Capability:** Read-only  

**Initial Version:** 21  

### let right  

```cangjie  
public let right: IntNative  
```  

**Function:** The X-coordinate of the bottom-right corner of the component's border.  

**Type:** IntNative  

**Read/Write Capability:** Read-only  

**Initial Version:** 21  

### let top  

```cangjie  
public let top: IntNative  
```  

**Function:** The Y-coordinate of the top-left corner of the component's border.  

**Type:** IntNative  

**Read/Write Capability:** Read-only  

**Initial Version:** 21  

### Rect(IntNative, IntNative, IntNative, IntNative)  

```cangjie  
public Rect(  
    public let left: IntNative,  
    public let top: IntNative,  
    public let right: IntNative,  
    public let bottom: IntNative  
)  
```  

**Function:** Creates a [Rect](#class-rect) instance.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| left | IntNative | Yes | - | The X-coordinate of the top-left corner of the component's border. |  
| top | IntNative | Yes | - | The Y-coordinate of the top-left corner of the component's border. |  
| right | IntNative | Yes | - | The X-coordinate of the bottom-right corner of the component's border. |  
| bottom | IntNative | Yes | - | The Y-coordinate of the bottom-right corner of the component's border. |  

## class TestRunner  

**Function:** Provides framework testing capabilities.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### static func registerCreator(String, () -> TestRunner)  

```cangjie  
public static func registerCreator(name: String, creator: () -> TestRunner): Unit  
```  

**Function:** Registers a function to construct a [TestRunner](#class-testrunner) object.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| name | String | Yes | - | The identifier of the constructor function. |  
| creator | () -> [TestRunner](#class-testrunner) | Yes | - | The function to construct a [TestRunner](#class-testrunner) object. |  

### func onRun()  

```cangjie  
public open func onRun(): Unit  
```  

**Function:** Prepares the unit test environment for running test cases.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### func onPrepare()  

```cangjie  
public open func onPrepare(): Unit  
```  

**Function:** Executes test cases.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

## class UIComponent  

```cangjie  
public class UIComponent {}  
```  

**Function:** The [UIComponent](#class-uicomponent) class represents a UI component on the interface, providing APIs for retrieving component properties, clicking, swiping, text injection, etc.Note the following:

- To display the app page, you must first call [abilityDelegator](./cj-apis-ability_delegator_registry.md)'s [startAbility](./cj-apis-ability_delegator_registry.md#func-startabilitywant).
- When searching for a [UIComponent](#class-uicomponent) object, ensure the component is already displayed on the page and the device screen is awake.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

### func clearText()

```cangjie
public func clearText(): Unit
```

**Description:** Clears the text information of a control, applicable to text box controls.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000002|if the async function was not called with await.|
  |17000004|if the component is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let text: UIComponent = driver.findComponent(On().text("hello world"))
text.clearText()
```

### func click()

```cangjie
public func click(): Unit
```

**Description:** Performs a click operation on the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000002|if the async function was not called with await.|
  |17000004|if the component is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
button.click()
```

### func doubleClick()

```cangjie
public func doubleClick(): Unit
```

**Description:** Performs a double-click operation on the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000002|if the async function was not called with await.|
  |17000004|if the component is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
button.doubleClick()
```

### func dragTo(UIComponent)

```cangjie
public func dragTo(target: UIComponent): Unit
```

**Description:** Drags the control to the target control.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|target|[UIComponent](#class-uicomponent)|Yes|-|Target control.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000002|if the async function was not called with await.|
  |17000004|if the component is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
let text: UIComponent = driver.findComponent(On().text("hello world"))
button.dragTo(text)
```

### func getBounds()

```cangjie
public func getBounds(): Rect
```

**Description:** Retrieves the border information of the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[Rect](#class-rect)|Border information of the control object.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000002|if the async function was not called with await.|
  |17000004|if the component is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
let rect = button.getBounds()
```

### func getBoundsCenter()

```cangjie
public func getBoundsCenter(): Point
```

**Description:** Retrieves the center point information of the area occupied by the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[Point](#class-point)|Center point information of the area occupied by the control object.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000002|if the async function was not called with await.|
  |17000004|if the component is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
let point = button.getBoundsCenter()
```

### func getDescription()

```cangjie
public func getDescription(): String
```

**Description:** Retrieves the description information of the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description information of the control.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000002|if the async function was not called with await.|
  |17000004|if the component is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
let description = button.getDescription()
```

### func getId()

```cangjie
public func getId(): String
```

**Description:** Retrieves the ID value of the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**| Type | Description |
|:----|:----|
| String | The ID value of the control. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |
  | 17000004 | if the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
let id = button.getId()
```

### func getText()

```cangjie
public func getText(): String
```

**Function:** Gets the text information of the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The text information of the control. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |
  | 17000004 | if the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
let text = button.getText()
```

### func getType()

```cangjie
public func getType(): String
```

**Function:** Gets the control type of the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The type of the control. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |
  | 17000004 | if the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
let `type` = button.getType()
```

### func inputText(String)

```cangjie
public func inputText(text: String): Unit
```

**Function:** Inputs text into the control, applicable to text box controls.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| text | String | Yes | - | The text information to be input, currently supports English and special characters. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |
  | 17000004 | if the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let text: UIComponent = driver.findComponent(On().text("hello world"))
text.inputText("123")
```

### func isCheckable()

```cangjie
public func isCheckable(): Bool
```

**Function:** Determines whether the control object can be checked.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The checkable property of the control object, true: checkable, false: not checkable. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |
  | 17000004 | if the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let checkbox: UIComponent = driver.findComponent(On().onType("Checkbox"))
if (checkbox.isCheckable()) {
    Hilog.info(0, "", "This checkBox is checkable")
} else {
    Hilog.info(0, "", "This checkBox is not checkable")
}
```

### func isChecked()

```cangjie
public func isChecked(): Bool
```

**Function:** Gets the checked state of the control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The checked state of the control object, true: checked, false: not checked. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |
  | 17000004 | if the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let checkbox: UIComponent = driver.findComponent(On().onType("Checkbox"))
if (checkbox.isChecked()) {
    Hilog.info(0, "", "This checkBox is checked")
} else {
    Hilog.info(0, "", "This checkBox is not checked")
}
```

### func isClickable()

```cangjie
public func isClickable(): Bool
```

**Function:** Determines whether the control object is clickable.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the control object is clickable, true: clickable, false: not clickable. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | if the async function was not called with await. |
  | 17000004 | if the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
if (button.isClickable()) {
    Hilog.info(0, "", "This button can be Clicked")
} else {
    Hilog.info(0, "", "This button can not be Clicked")
}
```

### func isEnabled()

```cangjie
public func isEnabled(): Bool
```

**Function:** Get the enabled state of a control.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The enabled state of the control. `true`: enabled, `false`: disabled. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |
  | 17000004 | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
if (button.isEnabled()) {
    Hilog.info(0, "", "This button can be operated")
} else {
    Hilog.info(0, "", "This button cannot be operated")
}
```

### func isFocused()

```cangjie
public func isFocused(): Bool
```

**Function:** Determine the focus state of a control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The focus state of the control object. `true`: focused, `false`: not focused. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |
  | 17000004 | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
if (button.isFocused()) {
    Hilog.info(0, "", "This button is focused")
} else {
    Hilog.info(0, "", "This button is not focused")
}
```

### func isLongClickable()

```cangjie
public func isLongClickable(): Bool
```

**Function:** Determine if a control object is long-clickable.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the control object is long-clickable. `true`: long-clickable, `false`: not long-clickable. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |
  | 17000004 | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
if (button.isLongClickable()) {
    Hilog.info(0, "", "This button can be long-clicked")
} else {
    Hilog.info(0, "", "This button cannot be long-clicked")
}
```

### func isScrollable()

```cangjie
public func isScrollable(): Bool
```

**Function:** Determine if a control object is scrollable.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the control object is scrollable. `true`: scrollable, `false`: not scrollable. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |
  | 17000004 | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let scrollBar: UIComponent = driver.findComponent(On().scrollable())
if (scrollBar.isScrollable()) {
    Hilog.info(0, "", "This scrollBar can be operated")
} else {
    Hilog.info(0, "", "This scrollBar cannot be operated")
}
```

### func isSelected()

```cangjie
public func isSelected(): Bool
```

**Function:** Get the selected state of a control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The selected state of the control object. `true`: selected, `false`: not selected. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |
  | 17000004 | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
if (button.isSelected()) {
    Hilog.info(0, "", "This button is selected")
} else {
    Hilog.info(0, "", "This button is not selected")
}
```

### func longClick()

```cangjie
public func longClick(): Unit
```

**Function:** Perform a long-click operation on a control object.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |
  | 17000004 | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let button: UIComponent = driver.findComponent(On().onType("Button"))
button.longClick()
```

### func pinchIn(Float32)

```cangjie
public func pinchIn(scale: Float32): Unit
```

**Function:** Pinch to zoom out a control by the specified scale.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| scale | Float32 | Yes | - | The specified zoom-out scale. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17000002 | If the async function was not called with await. |
  | 17000004 | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj
import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let image: UIComponent = driver.findComponent(On().onType("Image"))
image.pinchIn(1.5)
```

### func pinchOut(Float32)

```cangjie
public func pinchOut(scale: Float32): Unit
```

**Function:** Pinch-to-zoom out the component by the specified scale factor.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type    | Mandatory | Default | Description |
|:----------|:--------|:----------|:--------|:------------|
| scale     | Float32 | Yes       | -       | Specifies the zoom-out scale factor. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 17000002     | If the async function was not called with await. |
  | 17000004     | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let image: UIComponent = driver.findComponent(On().onType("Image"))
image.pinchOut(1.5)
```

### func scrollSearch(On)

```cangjie
public func scrollSearch(on: On): UIComponent
```

**Function:** Scroll to search for a target component on a scrollable component.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:----------|:-----|:----------|:--------|:------------|
| on        | [On](#class-on) | Yes | - | Attribute requirements of the target component. |

**Return Value:**

| Type | Description |
|:------|:------------|
| [UIComponent](#class-uicomponent) | The found target component object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 17000002     | If the async function was not called with await. |
  | 17000004     | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let scrollBar: UIComponent = driver.findComponent(On().onType("Scroll"))
let button = scrollBar.scrollSearch(On().text("next page"))
```

### func scrollToBottom(Int64)

```cangjie
public func scrollToBottom(speed!: Int64 = 600): Unit
```

**Function:** Scroll to the bottom of a scrollable component.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:----------|:-----|:----------|:--------|:------------|
| speed     | Int64 | No | 600 | **Named parameter.** Scroll speed, range: 200-15000. If out of range, defaults to 600. Unit: pixels/second. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 17000002     | If the async function was not called with await. |
  | 17000004     | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let scrollBar: UIComponent = driver.findComponent(On().onType("Scroll"))
scrollBar.scrollToBottom()
```

### func scrollToTop(Int64)

```cangjie
public func scrollToTop(speed!: Int64 = 600): Unit
```

**Function:** Scroll to the top of a scrollable component.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:----------|:-----|:----------|:--------|:------------|
| speed     | Int64 | No | 600 | **Named parameter.** Scroll speed, range: 200-15000. If out of range, defaults to 600. Unit: pixels/second. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 17000002     | If the async function was not called with await. |
  | 17000004     | If the component is invisible or destroyed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let scrollBar: UIComponent = driver.findComponent(On().onType("Scroll"))
scrollBar.scrollToTop()
```

## class UIElementInfo

```cangjie
public class UIElementInfo {
    public UIElementInfo(
        public let bundleName: String,
        public let componentType: String,
        public let text: String
    )
}
```

**Function:** Information related to UI events.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

### let bundleName

```cangjie
public let bundleName: String
```

**Function:** The package name of the owning application.

**Type:** String

**Read/Write Permission:** Read-only

**Since:** 21

### let componentType

```cangjie
public let componentType: String
```

**Function:** The type of the component or window.

**Type:** String

**Read/Write Permission:** Read-only

**Since:** 21

### let text

```cangjie
public let text: String
```

**Function:** The text information of the component or window.

**Type:** String

**Read/Write Permission:** Read-only

**Since:** 21

### UIElementInfo(String, String, String)

```cangjie
public UIElementInfo(
    public let bundleName: String,
    public let componentType: String,
    public let text: String
)
```

**Function:** Creates an instance of [UIElementInfo](#class-uielementinfo).

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:----------|:-----|:----------|:--------|:------------|
| bundleName | String | Yes | - | The package name of the owning application. |
| componentType | String | Yes | - | The type of the component or window. |
| text | String | Yes | - | The text information of the component or window. |

## class UIEventObserver

```cangjie
public class UIEventObserver {}
```

**Function:** UI event listener.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

### func onceDialogShow((UIElementInfo) -> Unit)

```cangjie
public func onceDialogShow(callback: (UIElementInfo) -> Unit): Unit
```

**Function:** Listens for the appearance of a dialog component and returns the result via a callback.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:----------|:-----|:----------|:--------|:------------|
| callback | ([UIElementInfo](#class-uielementinfo)) -> Unit | Yes | - | The callback function executed when the event occurs. |

**Example:**

<!-- compile -->
```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let observer: UIEventObserver = driver.createUIEventObserver()
observer.onceDialogShow({element =>
    Hilog.info(0, "", element.bundleName)
    Hilog.info(0, "", element.componentType)
    Hilog.info(0, "", element.text)
})
```

### func onceToastShow((UIElementInfo) -> Unit)

```cangjie
public func onceToastShow(callback: (UIElementInfo) -> Unit): Unit
```

**Function:** Listens for the appearance of a toast control event.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([UIElementInfo](#class-uielementinfo)) -> Unit | Yes | - | Callback function executed when the event occurs. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*
import kit.PerformanceAnalysisKit.*

let driver: Driver = Driver.create()
let observer: UIEventObserver = driver.createUIEventObserver()
observer.onceToastShow({element =>
    Hilog.info(0, "", element.bundleName)
    Hilog.info(0, "", element.componentType)
    Hilog.info(0, "", element.text)
})
```

## class UITest

```cangjie
public class UITest {}
```

**Function:** The [UITest](#class-uitest) class contains only one static method [setup](#static-func-setup), used to initialize the ui_test library.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

### static func setup()

```cangjie
public static func setup(): Unit
```

**Function:** Initializes the ui_test library. Currently, [setup](#static-func-setup) must be written in the [onRun](#func-onrun) method of [TestRunner](#class-testrunner).

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// unittest_enginge.cj
import ohos.base.*
import kit.TestKit.*
import ohos.test_runner.*

class MyTestRunner <: TestRunner {
    public func onRun() {
        UITest.setup()
    }

    public func onPrepare() {
        AppLog.info("CJTestRunner onPrepare")
    }
}

let _ = TestRunner.registerCreator("MyTestRunner") {MyTestRunner()}
```

## class UiWindow

```cangjie
public class UiWindow {}
```

**Function:** [UiWindow](#class-uiwindow) represents a window on the UI interface, providing capabilities to obtain window properties, drag windows, resize windows, etc.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

### func close()

```cangjie
public func close(): Unit
```

**Function:** Closes the window.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|
  |17000005|if the action is not supported on this window.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
window.close()
```

### func focus()

```cangjie
public func focus(): Unit
```

**Function:** Brings the window into focus.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
window.focus()
```

### func getBounds()

```cangjie
public func getBounds(): Rect
```

**Function:** Retrieves the border information of the window.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[Rect](#class-rect)|Returns the border information of the window.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
let rect = window.getBounds()
```

### func getBundleName()

```cangjie
public func getBundleName(): String
```

**Function:** Retrieves the package name information of the application to which the window belongs.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|String|Returns the package name information of the application to which the window belongs.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
let name: String = window.getBundleName()
```

### func getTitle()

```cangjie
public func getTitle(): String
```

**Function:** Retrieves the title information of the window.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|String|Returns the title information of the window.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
let title: String = window.getTitle()
```

### func getWindowMode()

```cangjie
public func getWindowMode(): WindowMode
```

**Function:** Obtain the window mode information of the window.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[WindowMode](#enum-windowmode)|Return the window mode information of the window.|

**Exceptions:**

- BusinessException: For detailed introductions of corresponding error codes, please refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
let mode = window.getWindowMode()
```


### func isActive()

```cangjie
public func isActive(): Bool
```

**Function:** Checks whether the window is the one currently interacting with the user.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns the interaction status of the window object, true: interactive window, false: non-interactive window.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
let active = window.isActive()
```

### func isFocused()

```cangjie
public func isFocused(): Bool
```

**Function:** Checks whether the window is in a focused state.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns whether the window object is in a focused state, true: focused, false: not focused.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
let focused = window.isFocused()
```

### func maximize()

```cangjie
public func maximize(): Unit
```

**Function:** Maximizes the window. Applicable to windows that support the maximize operation.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|
  |17000005|if the action is not supported on this window.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
window.maximize()
```

### func minimize()

```cangjie
public func minimize(): Unit
```

**Function:** Minimizes the window. Applicable to windows that support the minimize operation.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|
  |17000005|if the action is not supported on this window.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
window.minimize()
```

### func moveTo(IntNative, IntNative)

```cangjie
public func moveTo(x: IntNative, y: IntNative): Unit
```

**Function:** Moves the window to the target point. Applicable to windows that support movement.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|x|IntNative|Yes|-|The x-coordinate of the target point in IntNative format.|
|y|IntNative|Yes|-|The y-coordinate of the target point in IntNative format.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|
  |17000005|if the action is not supported on this window.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
window.moveTo(100, 100)
```

### func resize(IntNative, IntNative, ResizeDirection)

```cangjie
public func resize(wide: IntNative, height: IntNative, direction: ResizeDirection): Unit
```

**Function:** Resizes the window based on the specified width, height, and resize direction. Applicable to windows that support resizing.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|wide|IntNative|Yes|-|The width of the resized window in IntNative format.|
|height|IntNative|Yes|-|The height of the resized window in IntNative format.|
|direction|[ResizeDirection](#enum-resizedirection)|Yes|-|The resize direction of the window in ResizeDirection format.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|
  |17000005|if the action is not supported on this window.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
window.resize(100, 100, ResizeDirection.LEFT)
```

### func resume()

```cangjie
public func resume(): Unit
```

**Function:** Restores the window to its previous window mode.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest Error Codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|
  |17000005|if the action is not supported on this window.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
window.resume()
```

### func split()

```cangjie
public func split(): Unit
```

**Function:** Switches the window mode to split-screen mode. Applicable to windows that support split-screen mode switching.

**System Capability:** SystemCapability.Test.UiTest

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [uitest error codes](../../errorcodes/cj-errorcode-uitest.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17000004|if the window is invisible or destroyed.|
  |17000005|if the action is not supported on this window.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let driver: Driver = Driver.create()
let window: UiWindow = driver.findWindow(WindowFilter(active: true))
window.split()
```

## class WindowFilter  

```cangjie  
public class WindowFilter {  
    public WindowFilter(  
        public let bundleName!: ?String = None,  
        public let title!: ?String = None,  
        public let focused!: ?Bool = None,  
        public let active!: ?Bool = None  
    )  
}  
```  

**Function:** Attribute information of the window.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

### let active  

```cangjie  
public let active: ?Bool = None  
```  

**Function:** Whether the window is interacting with the user.  

**Type:** ?Bool  

**Read/Write Permission:** Read-only  

**Initial Version:** 21  

### let bundleName  

```cangjie  
public let bundleName: ?String = None  
```  

**Function:** The package name of the application to which the window belongs.  

**Type:** ?String  

**Read/Write Permission:** Read-only  

**Initial Version:** 21  

### let focused  

```cangjie  
public let focused: ?Bool = None  
```  

**Function:** Whether the window is in the focused state.  

**Type:** ?Bool  

**Read/Write Permission:** Read-only  

**Initial Version:** 21  

### let title  

```cangjie  
public let title: ?String = None  
```  

**Function:** The title information of the window.  

**Type:** ?String  

**Read/Write Permission:** Read-only  

**Initial Version:** 21  

### WindowFilter(?String, ?String, ?Bool, ?Bool)  

```cangjie  
public WindowFilter(  
    public let bundleName!: ?String = None,  
    public let title!: ?String = None,  
    public let focused!: ?Bool = None,  
    public let active!: ?Bool = None  
)  
```  

**Function:** Creates a [WindowFilter](#class-windowfilter) instance.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
|bundleName|?String|No|None| **Named parameter.** The package name of the application to which the window belongs.|  
|title|?String|No|None| **Named parameter.** The title information of the window.|  
|focused|?Bool|No|None| **Named parameter.** Whether the window is in the focused state.|  
|active|?Bool|No|None| **Named parameter.** Whether the window is interacting with the user.|  

## enum DisplayRotation  

```cangjie  
public enum DisplayRotation {  
    | ROTATION_0  
    | ROTATION_90  
    | ROTATION_180  
    | ROTATION_270  
    | ...  
}  
```  

**Function:** The display orientation of the device screen.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

### ROTATION_0  

```cangjie  
ROTATION_0  
```  

**Function:** The device screen is not rotated, initially displayed vertically.  

**Initial Version:** 21  

### ROTATION_180  

```cangjie  
ROTATION_180  
```  

**Function:** The device screen is rotated 180° clockwise, displayed vertically in reverse.  

**Initial Version:** 21  

### ROTATION_270  

```cangjie  
ROTATION_270  
```  

**Function:** The device screen is rotated 270° clockwise, displayed horizontally in reverse.  

**Initial Version:** 21  

### ROTATION_90  

```cangjie  
ROTATION_90  
```  

**Function:** The device screen is rotated 90° clockwise, displayed horizontally.  

**Initial Version:** 21  

## enum MatchPattern  

```cangjie  
public enum MatchPattern {  
    | EQUALS  
    | CONTAINS  
    | STARTS_WITH  
    | ENDS_WITH  
    | ...  
}  
```  

**Function:** Supported matching patterns for control attributes.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

### CONTAINS  

```cangjie  
CONTAINS  
```  

**Function:** Contains the given value.  

**Initial Version:** 21  

### ENDS_WITH  

```cangjie  
ENDS_WITH  
```  

**Function:** Ends with the given value.  

**Initial Version:** 21  

### EQUALS  

```cangjie  
EQUALS  
```  

**Function:** Equals the given value.  

**Initial Version:** 21  

### STARTS_WITH  

```cangjie  
STARTS_WITH  
```  

**Function:** Starts with the given value.  

**Initial Version:** 21  

## enum MouseButton  

```cangjie  
public enum MouseButton {  
    | MOUSE_BUTTON_LEFT  
    | MOUSE_BUTTON_RIGHT  
    | MOUSE_BUTTON_MIDDLE  
    | ...  
}  
```  

**Function:** Simulated injected mouse buttons.  

**System Capability:** SystemCapability.Test.UiTest  

**Initial Version:** 21  

### MOUSE_BUTTON_LEFT  

```cangjie  
MOUSE_BUTTON_LEFT  
```

**Function:** Left mouse button.

**Initial Version:** 21

### MOUSE_BUTTON_MIDDLE

```cangjie
MOUSE_BUTTON_MIDDLE
```

**Function:** Middle mouse button.

**Initial Version:** 21

### MOUSE_BUTTON_RIGHT

```cangjie
MOUSE_BUTTON_RIGHT
```

**Function:** Right mouse button.

**Initial Version:** 21

## enum ResizeDirection

```cangjie
public enum ResizeDirection {
    | LEFT
    | RIGHT
    | UP
    | DOWN
    | LEFT_UP
    | LEFT_DOWN
    | RIGHT_UP
    | RIGHT_DOWN
    | ...
}
```

**Function:** Window resizing direction.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

### DOWN

```cangjie
DOWN
```

**Function:** Downward direction.

**Initial Version:** 21

### LEFT

```cangjie
LEFT
```

**Function:** Leftward direction.

**Initial Version:** 21

### LEFT_DOWN

```cangjie
LEFT_DOWN
```

**Function:** Lower-left direction.

**Initial Version:** 21

### LEFT_UP

```cangjie
LEFT_UP
```

**Function:** Upper-left direction.

**Initial Version:** 21

### RIGHT

```cangjie
RIGHT
```

**Function:** Rightward direction.

**Initial Version:** 21

### RIGHT_DOWN

```cangjie
RIGHT_DOWN
```

**Function:** Lower-right direction.

**Initial Version:** 21

### RIGHT_UP

```cangjie
RIGHT_UP
```

**Function:** Upper-right direction.

**Initial Version:** 21

### UP

```cangjie
UP
```

**Function:** Upward direction.

**Initial Version:** 21

## enum UiDirection

```cangjie
public enum UiDirection {
    | LEFT
    | RIGHT
    | UP
    | DOWN
    | ...
}
```

**Function:** Direction for UI operations such as flicking.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

### DOWN

```cangjie
DOWN
```

**Function:** Downward.

**Initial Version:** 21

### LEFT

```cangjie
LEFT
```

**Function:** Leftward.

**Initial Version:** 21

### RIGHT

```cangjie
RIGHT
```

**Function:** Rightward.

**Initial Version:** 21

### UP

```cangjie
UP
```

**Function:** Upward.

**Initial Version:** 21

## enum WindowMode

```cangjie
public enum WindowMode {
    | FULLSCREEN
    | PRIMARY
    | SECONDARY
    | FLOATING
    | ...
}
```

**Function:** Window mode.

**System Capability:** SystemCapability.Test.UiTest

**Initial Version:** 21

### FLOATING

```cangjie
FLOATING
```

**Function:** Floating window.

**Initial Version:** 21

### FULLSCREEN

```cangjie
FULLSCREEN
```

**Function:** Full-screen mode.

**Initial Version:** 21

### PRIMARY

```cangjie
PRIMARY
```

**Function:** Primary window.

**Initial Version:** 21

### SECONDARY

```cangjie
SECONDARY
```

**Function:** Secondary window.

**Initial Version:** 21