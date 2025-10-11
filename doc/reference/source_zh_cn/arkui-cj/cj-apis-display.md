# ohos.display（屏幕属性）

屏幕属性提供管理显示设备的一些基础能力，包括获取默认显示设备的信息，获取所有显示设备的信息以及监听显示设备的插拔行为。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func getAllDisplays()

```cangjie
public func getAllDisplays(): Array<Display>
```

**功能：** 获取当前所有的Display对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[Display](#class-display)>|返回当前所有的display对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[屏幕错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-display.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1400001 | Invalid display or screen. |
  | 1400003 | This display manager service works abnormally. |

**示例:**

```cangjie
import ohos.display.*
func getAllDisplaysExample() {
    try {
        let displayClass: Array<Display> = getAllDisplays()
        if (displayClass.size > 0) {
            println(displayClass[0].name)
        }
    } catch (exception: Exception) {
        Hilog.error(0, "AppLogCj", exception.toString())
    }
}
```

## func getCurrentFoldCreaseRegion()

```cangjie
public func getCurrentFoldCreaseRegion(): FoldCreaseRegion
```

**功能：** 在当前显示模式下获取折叠折痕区域。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[FoldCreaseRegion](#class-foldcreaseregion)|FoldCreaseRegion对象，返回设备在当前显示模式下的折叠折痕区域。|

**异常：**

- BusinessException：对应错误码如下表，详见[屏幕错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-display.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1400003 | This display manager service works abnormally. |

**示例:**

```cangjie
import ohos.display.*
func getCurrentFoldCreaseRegionExample() {
    try {
        let region = getCurrentFoldCreaseRegion()
        println(region.displayId)
    } catch (exception: Exception) {
        Hilog.error(0, "AppLogCj", exception.toString())
    }
}
```

## func getDefaultDisplaySync()

```cangjie
public func getDefaultDisplaySync(): Display
```

**功能：** 获取当前默认的Display对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Display](#class-display)|返回默认的Display对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[屏幕错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-display.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1400001 | Invalid display or screen. |
  | 1400003 | This display manager service works abnormally. |

**示例:**

```cangjie
import ohos.display.*
func getDefaultDisplaySyncExample() {
    try {
        let displayClass: Display = getDefaultDisplaySync()
        println(displayClass.name)
    } catch (exception: Exception) {
        Hilog.error(0, "AppLogCj", exception.toString())
    }
}
```

## func getFoldDisplayMode()

```cangjie
public func getFoldDisplayMode(): FoldDisplayMode
```

**功能：** 获取可折叠设备的显示模式。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[FoldDisplayMode](#enum-folddisplaymode)|FoldDisplayMode对象，返回当前可折叠设备的显示模式。|

**示例:**

```cangjie
import ohos.display.*
func getFoldDisplayModeExample() {
    try {
        let mode = getFoldDisplayMode()
        match (mode) {
            case FoldDisplayMode.FOLD_DISPLAY_MODE_UNKNOWN => Hilog.info(0, "AppLogCj", "Unkown mode.")
            case FoldDisplayMode.FOLD_DISPLAY_MODE_FULL => Hilog.info(0, "AppLogCj", "Full mode.")
            case FoldDisplayMode.FOLD_DISPLAY_MODE_MAIN => Hilog.info(0, "AppLogCj", "Main mode.")
            case FoldDisplayMode.FOLD_DISPLAY_MODE_SUB => Hilog.info(0, "AppLogCj", "Sub mode.")
            case FoldDisplayMode.FOLD_DISPLAY_MODE_COORDINATION => Hilog.info(0, "AppLogCj", "Coordination mode.")
            case _ => throw Exception("can not get display mode.")
        }
    } catch (exception: Exception) {
        Hilog.error(0, "AppLogCj", exception.toString())
    }
}
```

## func getFoldStatus()

```cangjie
public func getFoldStatus(): FoldStatus
```

**功能：** 获取可折叠设备的当前折叠状态。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[FoldStatus](#enum-foldstatus)|FoldStatus对象，返回当前可折叠设备的折叠状态。|

**示例:**

```cangjie
import ohos.display.*
func getFoldStatusExample() {
    try {
        let status = getFoldStatus()
        match (status) {
            case FoldStatus.FOLD_STATUS_UNKNOWN => Hilog.info(0, "AppLogCj", "Unkown status.")
            case FoldStatus.FOLD_STATUS_EXPANDED => Hilog.info(0, "AppLogCj", "Expanded.")
            case FoldStatus.FOLD_STATUS_FOLDED => Hilog.info(0, "AppLogCj", "Folded.")
            case FoldStatus.FOLD_STATUS_HALF_FOLDED => Hilog.info(0, "AppLogCj", "Half folded.")
            case _ => throw Exception("can not get fold status.")
        }
    } catch (exception: Exception) {
        Hilog.error(0, "AppLogCj", exception.toString())
    }
}
```

## func isFoldable()

```cangjie
public func isFoldable(): Bool
```

**功能：** 检查设备是否可折叠。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|Bool对象，返回当前设备是否可折叠的结果。true表示可折叠，false表示不可折叠。|

**示例:**

```cangjie
import ohos.display.*
func isFoldableExample() {
    try {
        let displayClass = getDefaultDisplaySync()
        var ret: Bool = false
        try {
            ret = isFoldable()
        } catch (exception: Exception) {
            Hilog.error(0, "AppLogCj", exception.toString())
        }
        if (ret) {
            Hilog.info(0, "AppLogCj", "The device is foldable.")
        } else {
            Hilog.info(0, "AppLogCj", "The device is not foldable.")
        }
    } catch (exception: Exception) {
        Hilog.error(0, "AppLogCj", exception.toString())
    }
}
```

## func off(ListenerType)

```cangjie
public func off(listenerType: ListenerType): Unit
```

**功能：** 关闭显示设备变化的监听。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|listenerType|[ListenerType](#enum-listenertype)|是|-|监听事件类型。|

**示例:**

```cangjie
import ohos.display.*
var temp: Unit = off(LISTNER_TYPE_CHANGE)
```

## func off(ListenerType, Callback1Argument\<FoldStatus>)

```cangjie
public func off(listenerType: ListenerType, callback: Callback1Argument<FoldStatus>): Unit
```

**功能：** 关闭折叠设备折叠状态变化的监听。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|listenerType|[ListenerType](#enum-listenertype)|是|-|监听事件。固定为'LISTNER_TYPE_FOLD_STATUS_CHANGE'，表示折叠设备折叠状态发生变化。|
|callback|[Callback1Argument](../arkinterop/cj-api-callback_invoke.md#class-callback1argument)\<[FoldStatus](#enum-foldstatus)>|是|-|回调函数。表示折叠设备折叠状态。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
  | 1400003 | This display manager service works abnormally. |

**示例:**

```cangjie
import ohos.display.*
class TestCallback <: Callback1Argument<FoldStatus> {
    public init() {}
    public open func invoke(value: FoldStatus): Unit {
        Hilog.info(0, "AppLogCj", 
            "Display fold status changed, current fold status: " + match (value) {
                case FOLD_STATUS_UNKNOWN => "FOLD_STATUS_UNKNOWN"
                case FOLD_STATUS_EXPANDED => "FOLD_STATUS_EXPANDED"
                case FOLD_STATUS_FOLDED => "FOLD_STATUS_FOLDED"
                case FOLD_STATUS_HALF_FOLDED => "FOLD_STATUS_HALF_FOLDED"
                case _ => "Failed to get fold status."
            })
    }
}
let testCallback = TestCallback()
var temp: Unit = on(LISTNER_TYPE_FOLD_STATUS_CHANGE, testCallback)
```

## func off(ListenerType, Callback1Argument\<FoldDisplayMode>)

```cangjie
public func off(listenerType: ListenerType, callback: Callback1Argument<FoldDisplayMode>): Unit
```

**功能：** 关闭折叠设备屏幕显示模式变化的监听。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|listenerType|[ListenerType](#enum-listenertype)|是|-|监听事件。固定为'LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE'，表示折叠设备折叠状态发生变化。|
|callback|[Callback1Argument](../arkinterop/cj-api-callback_invoke.md#class-callback1argument)\<[FoldDisplayMode](#enum-folddisplaymode)>|是|-|需要取消注册的回调函数。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-universal.md)和[屏幕错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-display.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
  | 1400003 | This display manager service works abnormally. |

**示例:**

```cangjie
import ohos.display.*
class TestCallback <: Callback1Argument<FoldDisplayMode> {
    public init() {}
    public open func invoke(value: FoldDisplayMode): Unit {
        Hilog.info(0, "AppLogCj", 
            "Display fold status changed, current fold status: " + match (value) {
                case FOLD_DISPLAY_MODE_UNKNOWN => "FOLD_DISPLAY_MODE_UNKNOWN"
                case FOLD_DISPLAY_MODE_FULL => "FOLD_DISPLAY_MODE_FULL"
                case FOLD_DISPLAY_MODE_MAIN => "FOLD_DISPLAY_MODE_MAIN"
                case FOLD_DISPLAY_MODE_SUB => "FOLD_DISPLAY_MODE_SUB"
                case FOLD_DISPLAY_MODE_COORDINATION => "FOLD_DISPLAY_MODE_COORDINATION"
                case _ => "Failed to get fold display mode."
            })
    }
}
let testCallback = TestCallback()
var temp: Unit = off(LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE, testCallback)
```

## func on(ListenerType, Callback1Argument\<FoldStatus>)

```cangjie
public func on(listenerType: ListenerType, callback: Callback1Argument<FoldStatus>): Unit
```

**功能：** 开启折叠设备折叠状态变化的监听。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|listenerType|[ListenerType](#enum-listenertype)|是|-|监听事件。固定为'LISTNER_TYPE_FOLD_STATUS_CHANGE'，表示折叠设备折叠状态发生变化。|
|callback|[Callback1Argument](../arkinterop/cj-api-callback_invoke.md#class-callback1argument)\<[FoldStatus](#enum-foldstatus)>|是|-|回调函数。表示折叠设备折叠状态。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
  | 1400003 | This display manager service works abnormally. |

**示例:**

```cangjie
import ohos.display.*
class TestCallback <: Callback1Argument<FoldStatus> {
    public init(){}
    public open func invoke(value: FoldStatus): Unit {
        Hilog.info(0, "AppLogCj", "Display fold status changed, current fold status: " + match(value) {
            case FOLD_STATUS_UNKNOWN => "FOLD_STATUS_UNKNOWN"
            case FOLD_STATUS_EXPANDED => "FOLD_STATUS_EXPANDED"
            case FOLD_STATUS_FOLDED => "FOLD_STATUS_FOLDED"
            case FOLD_STATUS_HALF_FOLDED => "FOLD_STATUS_HALF_FOLDED"
            case _ => "Failed to get fold status."
        })
    }
}
let testCallback = TestCallback()
var temp: Unit = on(LISTNER_TYPE_FOLD_STATUS_CHANGE, testCallback)
```

## func on(ListenerType, Callback1Argument\<FoldDisplayMode>)

```cangjie
public func on(listenerType: ListenerType, callback: Callback1Argument<FoldDisplayMode>): Unit
```

**功能：** 开启折叠设备屏幕显示模式变化的监听。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|listenerType|[ListenerType](#enum-listenertype)|是|-|监听事件。固定为'LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE'，表示折叠设备屏幕显示模式。|
|callback|[Callback1Argument](../arkinterop/cj-api-callback_invoke.md#class-callback1argument)\<[FoldDisplayMode](#enum-folddisplaymode)>|是|-|回调函数。表示折叠设备屏幕显示模式。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
  | 1400003 | This display manager service works abnormally. |

**示例:**

```cangjie
import ohos.display.*
class TestCallback <: Callback1Argument<FoldDisplayMode> {
    public init() {}
    public open func invoke(value: FoldDisplayMode): Unit {
        Hilog.info(0, "AppLogCj", 
            "Display fold status changed, current fold status: " + match (value) {
                case FOLD_DISPLAY_MODE_UNKNOWN => "FOLD_DISPLAY_MODE_UNKNOWN"
                case FOLD_DISPLAY_MODE_FULL => "FOLD_DISPLAY_MODE_FULL"
                case FOLD_DISPLAY_MODE_MAIN => "FOLD_DISPLAY_MODE_MAIN"
                case FOLD_DISPLAY_MODE_SUB => "FOLD_DISPLAY_MODE_SUB"
                case FOLD_DISPLAY_MODE_COORDINATION => "FOLD_DISPLAY_MODE_COORDINATION"
                case _ => "Failed to get fold display mode."
            })
    }
}
let testCallback = TestCallback()
var temp: Unit = on(LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE, testCallback)
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

**功能：** 挖孔屏、刘海屏、瀑布屏等不可用屏幕区域信息。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### let boundingRects

```cangjie
public let boundingRects: Array<Rect>
```

**功能：** 设置挖孔、刘海等区域的边界矩形。

**类型：** Array\<[Rect](#class-rect)>

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### let waterfallDisplayAreaRects

```cangjie
public let waterfallDisplayAreaRects: WaterfallDisplayAreaRects
```

**功能：** 设置瀑布屏曲面部分显示区域。

**类型：** [WaterfallDisplayAreaRects](#class-waterfalldisplayarearects)

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### init(Array\<Rect>, WaterfallDisplayAreaRects)

```cangjie
public init(
    boundingRects!: Array<Rect>,
    waterfallDisplayAreaRects!: WaterfallDisplayAreaRects
)
```

**功能：** 创建一个CutoutInfo类型对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|boundingRects|Array\<[Rect](#class-rect)>|是|-|挖孔、刘海等区域的边界矩形。如果没有挖孔、刘海等区域，数组返回为空。|
|waterfallDisplayAreaRects|[WaterfallDisplayAreaRects](#class-waterfalldisplayarearects)|是|-|瀑布屏曲面部分显示区域。|

## class Display

```cangjie
public class Display {}
```

**功能：** 设置屏幕实例。描述Display对象的属性和方法。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop alive

```cangjie
public prop alive: Bool
```

**功能：** 设置显示设备是否启用。true表示设备启用，false表示设备未启用。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop densityDPI

```cangjie
public prop densityDPI: Float32
```

**功能：** 设置显示设备屏幕的物理像素密度，表示每英寸上的像素点数。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop densityPixels

```cangjie
public prop densityPixels: Float32
```

**功能：** 设置显示设备的逻辑密度，是像素单位无关的缩放系数。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop height

```cangjie
public prop height: Int32
```

**功能：** 显示设备的屏幕高度。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop id

```cangjie
public prop id: UInt32
```

**功能：** 设置显示设备的id号，该参数应为大于等于0的整数。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop name

```cangjie
public prop name: String
```

**功能：** 设置显示设备的名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop orientation

```cangjie
public prop orientation: Orientation
```

**功能：** 设置屏幕当前显示的方向。

**类型：** [Orientation](#enum-orientation)

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop refreshRate

```cangjie
public prop refreshRate: UInt32
```

**功能：** 设置显示设备的刷新率。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop rotation

```cangjie
public prop rotation: UInt32
```

**功能：** 设置显示设备的屏幕顺时针旋转角度。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop scaledDensity

```cangjie
public prop scaledDensity: Float32
```

**功能：** 显示设备的显示字体的缩放因子。该参数为浮点数，通常与densityPixels相同。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop state

```cangjie
public prop state: DisplayState
```

**功能：** 设置显示设备的状态。

**类型：** [DisplayState](#enum-displaystate)

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop width

```cangjie
public prop width: Int32
```

**功能：** 设置显示设备的屏幕宽度。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop xDPI

```cangjie
public prop xDPI: Float32
```

**功能：** 设置x方向中每英寸屏幕的确切物理像素值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### prop yDPI

```cangjie
public prop yDPI: Float32
```

**功能：** 设置y方向中每英寸屏幕的确切物理像素值。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func getCutoutInfo()

```cangjie
public func getCutoutInfo(): CutoutInfo
```

**功能：** 获取挖孔屏、刘海屏、瀑布屏等不可用屏幕区域信息。建议应用布局规避该区域。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[CutoutInfo](#class-cutoutinfo)|返回描述不可用屏幕区域的CutoutInfo对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[屏幕错误码](../../../reference/source_zh_cn/errorcodes/cj-errorcode-display.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1400001 | Invalid display or screen. |
  | 1400003 | This display manager service works abnormally. |

**示例:**

```cangjie
import ohos.display.*
func getCutoutInfoExample() {
    try {
        let displayClass = getDefaultDisplaySync()
        let cutout = displayClass.getCutoutInfo()
        println(cutout.boundingRects.size)
    } catch (exception: Exception) {
        Hilog.error(0, "AppLogCj", exception.toString())
    }
}
```

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

**功能：** 折叠折痕区域。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### let creaseRects

```cangjie
public let creaseRects: Array<Rect>
```

**功能：** 设置折痕区域。

**类型：** Array\<[Rect](#class-rect)>

**读写能力：** 只读

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### let displayId

```cangjie
public let displayId: UInt32
```

**功能：** 设置显示器ID，用于识别折痕所在的屏幕。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### init(UInt32, Array\<Rect>)

```cangjie
public init(
    displayId!: UInt32,
    creaseRects!: Array<Rect>
)
```

**功能：** 创建一个FoldCreaseRegion类型的对象。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|displayId|UInt32|是|-|显示器ID，用于识别折痕所在的屏幕。|
|creaseRects|Array\<[Rect](#class-rect)>|是|-|折痕区域。|

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

**功能：** 矩形区域信息。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var height

```cangjie
public var height: UInt32
```

**功能：** 设置矩形区域的高度。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var left

```cangjie
public var left: Int32
```

**功能：** 设置矩形区域的左边界。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var top

```cangjie
public var top: Int32
```

**功能：** 设置矩形区域的上边界。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var width

```cangjie
public var width: UInt32
```

**功能：** 设置矩形区域的宽度。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### init(Int32, Int32, UInt32, UInt32)

```cangjie
public init(
    left!: Int32,
    top!: Int32,
    width!: UInt32,
    height!: UInt32
)
```

**功能：** 创建一个Rect类型的对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|left|Int32|是|-|矩形区域的左边界，单位为px，该参数应为整数。|
|top|Int32|是|-|矩形区域的上边界，单位为px，该参数应为整数。|
|width|UInt32|是|-|矩形区域的宽度，单位为px，该参数应为整数。|
|height|UInt32|是|-|矩形区域的高度，单位为px，该参数应为整数。|

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

**功能：** 瀑布屏曲面部分显示区域信息。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### let bottom

```cangjie
public let bottom: Rect
```

**功能：** 设置瀑布曲面区域底部矩形区域。

**类型：** [Rect](#class-rect)

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### let left

```cangjie
public let left: Rect
```

**功能：** 设置瀑布曲面区域的左侧矩形区域。

**类型：** [Rect](#class-rect)

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### let right

```cangjie
public let right: Rect
```

**功能：** 设置瀑布曲面区域右侧矩形区域。

**类型：** [Rect](#class-rect)

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### let top

```cangjie
public let top: Rect
```

**功能：** 设置瀑布曲面区域的顶部矩形区域。

**类型：** [Rect](#class-rect)

**读写能力：** 只读

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### init(Rect, Rect, Rect, Rect)

```cangjie
public init(
    left!: Rect,
    top!: Rect,
    right!: Rect,
    bottom!: Rect
)
```

**功能：** 创建一个WaterfallDisplayAreaRects类型的对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|left|[Rect](#class-rect)|是|-|瀑布曲面区域的左侧矩形区域。|
|top|[Rect](#class-rect)|是|-|瀑布曲面区域的顶部矩形区域。|
|right|[Rect](#class-rect)|是|-|瀑布曲面区域的右侧矩形区域。|
|bottom|[Rect](#class-rect)|是|-|瀑布曲面区域的底部矩形区域。|

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

**功能：** 显示设备的状态类型。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<DisplayState>

### StateDoze

```cangjie
StateDoze
```

**功能：** 表示显示设备为低电耗模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### StateDozeSuspend

```cangjie
StateDozeSuspend
```

**功能：** 表示显示设备为睡眠模式，CPU为挂起状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### StateOff

```cangjie
StateOff
```

**功能：** 表示显示设备状态为关闭。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### StateOn

```cangjie
StateOn
```

**功能：** 表示显示设备状态为开启。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### StateOnSuspend

```cangjie
StateOnSuspend
```

**功能：** 表示显示设备为开启状态，CPU为挂起状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### StateUnknown

```cangjie
StateUnknown
```

**功能：** 表示显示设备状态未知。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### StateVr

```cangjie
StateVr
```

**功能：** 表示显示设备为VR模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(DisplayState)

```cangjie
public operator func !=(other: DisplayState): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DisplayState](#enum-displaystate)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否不相等。|

### func ==(DisplayState)

```cangjie
public operator func ==(other: DisplayState): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DisplayState](#enum-displaystate)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否相等。|

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

**功能：** 可折叠设备的显示模式类型。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**父类型：**

- Equatable\<FoldDisplayMode>

### FoldDisplayModeCoordination

```cangjie
FoldDisplayModeCoordination
```

**功能：** 表示设备当前双屏协同显示。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### FoldDisplayModeFull

```cangjie
FoldDisplayModeFull
```

**功能：** 表示设备当前全屏显示。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### FoldDisplayModeMain

```cangjie
FoldDisplayModeMain
```

**功能：** 表示设备当前主屏幕显示。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### FoldDisplayModeSub

```cangjie
FoldDisplayModeSub
```

**功能：** 表示设备当前子屏幕显示。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### FoldDisplayModeUnknown

```cangjie
FoldDisplayModeUnknown
```

**功能：** 表示设备当前折叠显示模式未知。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### func !=(FoldDisplayMode)

```cangjie
public operator func !=(other: FoldDisplayMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FoldDisplayMode](#enum-folddisplaymode)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否不相等。|

### func ==(FoldDisplayMode)

```cangjie
public operator func ==(other: FoldDisplayMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FoldDisplayMode](#enum-folddisplaymode)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否相等。|

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

**功能：** 当前可折叠设备的折叠状态类型。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**父类型：**

- Equatable\<FoldStatus>

### FoldStatusExpanded

```cangjie
FoldStatusExpanded
```

**功能：** 表示设备当前折叠状态为完全展开。如果是双折轴设备，则表示折轴一折叠状态为完全展开，折轴二折叠状态为折叠。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### FoldStatusFolded

```cangjie
FoldStatusFolded
```

**功能：** 表示设备当前折叠状态为折叠。如果是双折轴设备，则表示折轴一折叠状态为折叠，折轴二折叠状态为折叠。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### FoldStatusHalfFolded

```cangjie
FoldStatusHalfFolded
```

**功能：** 表示设备当前折叠状态为半折叠。半折叠指完全展开和折叠之间的状态。如果是双折轴设备，则表示折轴一折叠状态为半折叠，折轴二折叠状态为折叠。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### FoldStatusUnknown

```cangjie
FoldStatusUnknown
```

**功能：** 表示设备当前折叠状态未知。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### func !=(FoldStatus)

```cangjie
public operator func !=(other: FoldStatus): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FoldStatus](#enum-foldstatus)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否不相等。|

### func ==(FoldStatus)

```cangjie
public operator func ==(other: FoldStatus): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FoldStatus](#enum-foldstatus)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否相等。|

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

**功能：** 设置监听事件类型。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**父类型：**

- Equatable\<ListenerType>

### ListnerTypeAdd

```cangjie
ListnerTypeAdd
```

**功能：** 表示增加显示设备事件。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### ListnerTypeAvailableAreaChange

```cangjie
ListnerTypeAvailableAreaChange
```

**功能：** 表示折叠设备屏幕显示模式发生变化。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### ListnerTypeCaptureStatusChange

```cangjie
ListnerTypeCaptureStatusChange
```

**功能：** 表示设备截屏、投屏或者录屏状态发生变化。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### ListnerTypeChange

```cangjie
ListnerTypeChange
```

**功能：** 表示改变显示设备事件。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### ListnerTypeFoldAngleChange

```cangjie
ListnerTypeFoldAngleChange
```

**功能：** 表示折叠设备折叠角度发生变化。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### ListnerTypeFoldDisplayModeChange

```cangjie
ListnerTypeFoldDisplayModeChange
```

**功能：** 表示折叠设备屏幕显示模式发生变化。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### ListnerTypeFoldStatusChange

```cangjie
ListnerTypeFoldStatusChange
```

**功能：** 表示折叠设备折叠状态发生变化。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### ListnerTypeRemove

```cangjie
ListnerTypeRemove
```

**功能：** 表示移除显示设备事件。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### func !=(ListenerType)

```cangjie
public operator func !=(other: ListenerType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ListenerType](#enum-listenertype)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否不相等。|

### func ==(ListenerType)

```cangjie
public operator func ==(other: ListenerType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ListenerType](#enum-listenertype)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否相等。|

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

**功能：** 显示设备当前的显示方向类型。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<Orientation>

### Landscape

```cangjie
Landscape
```

**功能：** 表示设备当前以横屏方式显示。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### LandscapeInverted

```cangjie
LandscapeInverted
```

**功能：** 表示设备当前以反向横屏方式显示。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Portrait

```cangjie
Portrait
```

**功能：** 表示设备当前以竖屏方式显示。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### PortraitInverted

```cangjie
PortraitInverted
```

**功能：** 表示设备当前以反向竖屏方式显示。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(Orientation)

```cangjie
public operator func !=(other: Orientation): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Orientation](#enum-orientation)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否不相等。|

### func ==(Orientation)

```cangjie
public operator func ==(other: Orientation): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Orientation](#enum-orientation)|是|-|传入的另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否相等。|
