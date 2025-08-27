# ohos.window（窗口）

ohos.window提供管理窗口的一些基础能力，包括对当前窗口的创建、销毁、各属性设置，以及对各窗口间的管理调度。

该模块提供以下窗口相关的常用功能：

- [Window](#class-window)：当前窗口实例，窗口管理器管理的基本单元。

- [WindowStage](#class-windowstage)：窗口管理器。管理各个基本窗口单元。

> **说明：**
>
> ohos.window仅支持纯仓颉场景，不支持用于ArkTS与仓颉混合开发场景。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func createWindow(Configuration)

```cangjie
public func createWindow(config: Configuration): Window
```

**功能：** 创建子窗口或者系统窗口。

**需要权限：** ohos.permission.SYSTEM_FLOAT_WINDOW（仅当创建窗口类型为WindowType.TYPE_FLOAT时需要申请）

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|config|[Configuration](#class-configuration)|是|-|创建窗口时的参数。|

**返回值：**

|类型|说明|
|:----|:----|
|[Window](#class-window)|返回当前创建的窗口对象|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)和[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission verification failed. The application does not have the permission required to call the API. |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 1300003 | This window manager service works abnormally. |
  | 1300006 | This window context is abnormal. |

- IllegalArgumentException：

  | 错误信息 | 可能原因 | 处理步骤 |
  | :---- | :--- | :--- |
  | The context type is not supported. Only support UIAbilityContext. | 非法参数。 | 检查ctx是否为UIAbilityContext类型对象。 |

## func findWindow(String)

```cangjie
public func findWindow(name: String): Window
```

**功能：** 查找name所对应的窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|窗口名字，即[Configuration](#class-configuration)中的name。|

**返回值：**

|类型|说明|
|:----|:----|
|[Window](#class-window)|当前查找的窗口对象|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

## func getLastWindow(BaseContext)

```cangjie
public func getLastWindow(ctx: BaseContext): Window
```

**功能：** 获取当前应用内最上层的子窗口，若无应用子窗口，则返回应用主窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|ctx|[BaseContext](./../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|当前应用上下文信息。|

**返回值：**

|类型|说明|
|:----|:----|
|[Window](#class-window)|返回当前应用内最后显示的窗口对象|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. Top window or main window is null or destroyed. |

- IllegalArgumentException：

  | 错误信息 | 可能原因 | 处理步骤 |
  | :---- | :--- | :--- |
  | The context type is not supported. Only support UIAbilityContext. | 非法参数。 | 检查ctx是否为UIAbilityContext类型对象。 |

## func shiftAppWindowFocus(Int32, Int32)

```cangjie
public func shiftAppWindowFocus(sourceWindowId: Int32, targetWindowId: Int32): Unit
```

**功能：** 在同应用内将窗口焦点从源窗口转移到目标窗口。

> **说明：**
>
> 仅支持应用主窗和子窗的焦点转移。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sourceWindowId|Int32|是|-|源窗口id，必须是获焦状态。|
|targetWindowId|Int32|是|-|目标窗口id。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)和[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
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

**功能：** 窗口内容规避区域。

> **说明：**
>
> 如系统栏区域、刘海屏区域、手势区域、软键盘区域等与窗口内容重叠时，需要窗口内容避让的区域。在规避区无法响应用户点击事件。
>
> 除此之外还需注意规避区域的如下约束，具体为：
>
> - 底部手势区域中非导航条区域支持点击、长按事件透传，不支持拖入。
> - 左右侧边手势区域支持点击、长按以及上下滑动事件透传，不支持拖入。
> - 导航条区域支持长按、点击、拖入事件响应，不支持事件向下透传。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var bottomRect

```cangjie
public var bottomRect: Rect
```

**功能：** 表示屏幕底部的矩形区。

**类型：** [Rect](#class-rect)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var leftRect

```cangjie
public var leftRect: Rect
```

**功能：** 表示屏幕左侧的矩形区。

**类型：** [Rect](#class-rect)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var rightRect

```cangjie
public var rightRect: Rect
```

**功能：** 表示屏幕右侧的矩形区。

**类型：** [Rect](#class-rect)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var topRect

```cangjie
public var topRect: Rect
```

**功能：** 表示屏幕顶部的矩形区。

**类型：** [Rect](#class-rect)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var visible

```cangjie
public var visible: Bool
```

**功能：** 表示规避区域是否可见。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

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

**功能：** 构建一个AvoidArea类型的对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|visible|Bool|是|-|规避区域是否可见。true表示可见；false表示不可见。|
|leftRect|[Rect](#class-rect)|是|-|屏幕左侧的矩形区。|
|topRect|[Rect](#class-rect)|是|-|屏幕顶部的矩形区。|
|rightRect|[Rect](#class-rect)|是|-|屏幕右侧的矩形区。|
|bottomRect|[Rect](#class-rect)|是|-|屏幕底部的矩形区。|

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

**功能：** 创建子窗口或系统窗口时的参数。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var ctx

```cangjie
public var ctx: BaseContext
```

**功能：** 表示当前应用上下文信息。用于创建悬浮窗、模态窗或系统窗口。

**类型：** [BaseContext](./../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var displayId

```cangjie
public var displayId: Int64 = - 1
```

**功能：** 设置当前物理屏幕id。不设置，则默认为-1。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var name

```cangjie
public var name: String
```

**功能：** 表示窗口名字。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var parentId

```cangjie
public var parentId: Int64 = - 1
```

**功能：** 设置父窗口id。不设置，则默认为-1。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var windowType

```cangjie
public var windowType: WindowType
```

**功能：** 表示窗口类型。

**类型：** [WindowType](#enum-windowtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

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

**功能：** 构建一个Configuration类型的对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|窗口名字。|
|windowType|[WindowType](#enum-windowtype)|是|-|窗口类型。|
|ctx|[BaseContext](./../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|当前应用上下文信息。用于创建悬浮窗、模态窗或系统窗口。|
|displayId|Int64|否|- 1|当前物理屏幕id。|
|parentId|Int64|否|- 1|父窗口id。|

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

**功能：** 窗口矩形区域。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var height

```cangjie
public var height: UInt32
```

**功能：** 设置矩形区域的高度，单位为px。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var left

```cangjie
public var left: Int32
```

**功能：** 设置矩形区域的左边界，单位为px。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var top

```cangjie
public var top: Int32
```

**功能：** 设置矩形区域的上边界，单位为px。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var width

```cangjie
public var width: UInt32
```

**功能：** 设置矩形区域的宽度，单位为px。

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

**功能：** 构建一个Rect类型的对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|left|Int32|是|-|矩形区域的左边界，单位为px。|
|top|Int32|是|-|矩形区域的上边界，单位为px。|
|width|UInt32|是|-|矩形区域的宽度，单位为px。|
|height|UInt32|是|-|矩形区域的高度，单位为px。|

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

**功能：** 窗口大小。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var height

```cangjie
public var height: UInt32
```

**功能：** 设置窗口高度，单位为px。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var width

```cangjie
public var width: UInt32
```

**功能：** 设置窗口宽度，单位为px。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### init(UInt32, UInt32)

```cangjie
public init(
    width!: UInt32,
    height!: UInt32
)
```

**功能：** 构建一个Size类型的对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|UInt32|是|-|窗口宽度，单位为px。|
|height|UInt32|是|-|窗口高度，单位为px。|

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

**功能：** 状态栏、导航栏的属性。在设置窗口级状态栏、导航栏属性时使用。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var enableNavigationBarAnimation

```cangjie
public var enableNavigationBarAnimation: Bool = false
```

**功能：** 设置是否使能导航栏属性变化时动画效果。true表示变化时使能动画效果；false表示没有使能动画效果。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### var enableStatusBarAnimation

```cangjie
public var enableStatusBarAnimation: Bool = false
```

**功能：** 设置是否使能状态栏属性变化时动画效果。true表示变化时使能动画效果；false表示没有使能动画效果。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### var isNavigationBarLightIcon

```cangjie
public var isNavigationBarLightIcon: Bool = false
```

**功能：** 设置导航栏图标是否为高亮状态。true表示高亮；false表示不高亮。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var isStatusBarLightIcon

```cangjie
public var isStatusBarLightIcon: Bool = false
```

**功能：** 设置状态栏图标是否为高亮状态。true表示高亮；false表示不高亮。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var navigationBarColor

```cangjie
public var navigationBarColor: String = "#66000000"
```

**功能：** 设置导航栏背景颜色，为十六进制RGB或ARGB颜色，不区分大小写。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var navigationBarContentColor

```cangjie
public var navigationBarContentColor: String = "#E5FFFFFF"
```

**功能：** 设置导航栏文字颜色。当设置此属性后， [isNavigationBarLightIcon](#var-isnavigationbarlighticon)属性设置无效。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var statusBarColor

```cangjie
public var statusBarColor: String = "#66000000"
```

**功能：** 设置状态栏背景颜色，为十六进制RGB或ARGB颜色。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var statusBarContentColor

```cangjie
public var statusBarContentColor: String = "#E5FFFFFF"
```

**功能：** 设置状态栏文字颜色。当设置此属性后， [isStatusBarLightIcon](#var-isstatusbarlighticon)属性设置无效。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

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

**功能：** 构建一个SystemBarProperties类型的对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|statusBarColor|String|否|"#66000000"|状态栏背景颜色，为十六进制RGB或ARGB颜色，不区分大小写。|
|isStatusBarLightIcon|Bool|否|false|状态栏图标是否为高亮状态。true表示高亮；false表示不高亮。|
|statusBarContentColor|String|否|"#E5FFFFFF"|状态栏文字颜色。当设置此属性后，isStatusBarLightIcon属性设置无效。|
|navigationBarColor|String|否|"#66000000"|导航栏背景颜色，为十六进制RGB或ARGB颜色，不区分大小写。|
|isNavigationBarLightIcon|Bool|否|false|导航栏图标是否为高亮状态。true表示高亮；false表示不高亮。|
|navigationBarContentColor|String|否|"#E5FFFFFF"|导航栏文字颜色。当设置此属性后，isNavigationBarLightIcon属性设置无效。|
|enableStatusBarAnimation|Bool|否|false|是否使能状态栏属性变化时动画效果。true表示变化时使能动画效果；false表示没有使能动画效果。|
|enableNavigationBarAnimation|Bool|否|false|是否使能导航栏属性变化时动画效果。true表示变化时使能动画效果；false表示没有使能动画效果。|

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

**功能：** 标题栏上的最小化、最大化、关闭按钮矩形区域，该区域位置坐标相对窗口右上角。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### var height

```cangjie
public var height: UInt32
```

**功能：** 设置矩形区域的高度，单位为vp。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### var right

```cangjie
public var right: Int32
```

**功能：** 设置矩形区域的右边界，单位为vp。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### var top

```cangjie
public var top: Int32
```

**功能：** 设置矩形区域的上边界，单位为vp。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### var width

```cangjie
public var width: UInt32
```

**功能：** 设置矩形区域的宽度，单位为vp。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### init(Int32, Int32, UInt32, UInt32)

```cangjie
public init(
    right!: Int32,
    top!: Int32,
    width!: UInt32,
    height!: UInt32
)
```

**功能：** 构建一个TitleButtonRect类型的对象。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|right|Int32|是|-|矩形区域的右边界，单位为vp。|
|top|Int32|是|-|矩形区域的上边界，单位为vp。|
|width|UInt32|是|-|矩形区域的宽度，单位为vp。|
|height|UInt32|是|-|矩形区域的高度，单位为vp。|

## class Window

```cangjie
public class Window {}
```

**功能：** 当前窗口实例，窗口管理器管理的基本单元。

> **说明：**
>
> 下列API示例中都需先使用[getLastWindow()](#func-getlastwindowbasecontext)、[createWindow()](#func-createwindowconfiguration)、[findWindow()](#func-findwindowstring)中的任一方法获取到[Window](#class-window)实例，再通过此实例调用对应方法。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func destroyWindow()

```cangjie
public func destroyWindow(): Unit
```

**功能：** 销毁当前窗口。

> **说明：**
>
> 仅支持系统窗口及应用子窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func getWindowAvoidArea(AvoidAreaType)

```cangjie
public func getWindowAvoidArea(areaType: AvoidAreaType): AvoidArea
```

**功能：** 获取当前应用窗口内容规避的区域。如系统栏区域、刘海屏区域、手势区域、软键盘区域等与窗口内容重叠时，需要窗口内容避让的区域。

> **说明：**
>
> 该接口一般适用于两种场景：
> 1、在onWindowStageCreate方法中，获取应用启动时的初始布局避让区域时可调用该接口；
> 2、当应用内子窗需要临时显示，对显示内容做布局避让时可调用该接口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|areaType|[AvoidAreaType](#enum-avoidareatype)|是|-|表示规避区类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[AvoidArea](#class-avoidarea)|窗口内容规避区域。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)和[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter   verification failed. |
  | 1300002 | This window state is abnormal. |

### func getWindowColorSpace()

```cangjie
public func getWindowColorSpace(): ColorSpace
```

**功能：** 获取当前窗口色域模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ColorSpace](#enum-colorspace)|当前色域模式。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func getWindowProperties()

```cangjie
public func getWindowProperties(): WindowProperties
```

**功能：** 获取当前窗口的属性，返回WindowProperties。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[WindowProperties](#class-windowproperties)|当前窗口属性。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func isWindowShowing()

```cangjie
public func isWindowShowing(): Bool
```

**功能：** 判断当前窗口是否已显示。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前窗口是否已显示。true表示当前窗口已显示，false则表示当前窗口未显示。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func isWindowSupportWideGamut()

```cangjie
public func isWindowSupportWideGamut(): Bool
```

**功能：** 判断当前窗口是否支持广色域模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true表示当前窗口支持广色域模式，返回false表示当前窗口不支持广色域模式。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func minimize()

```cangjie
public func minimize(): Unit
```

**功能：** 最小化或隐藏窗口，根据调用对象不同，实现不同的功能。

> **说明：**
>
> 此接口根据调用对象不同，实现不同的功能：
>
> - 当调用对象为主窗口时，实现最小化功能，可在Dock栏中还原。
>
> - 当调用对象为子窗口时，实现隐藏功能，不可在Dock栏中还原，可以使用[showWindow()](#func-showwindow)进行还原。
>
> - 悬浮窗类型的窗口对象，调用此接口会报1300002错误码。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)和[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 801 | Capability not supported. Failed to call the API due to limited device capabilities. |
  | 1300002 | This window state is abnormal. |

### func moveWindowTo(Int32, Int32)

```cangjie
public func moveWindowTo(x: Int32, y: Int32): Unit
```

**功能：** 移动窗口位置。

> **说明：**
>
> - 在2in1设备上所有窗口模式都能生效，其他设备仅在除智慧多窗外的自由悬浮窗口模式（即窗口模式为WindowStatusType.Floating）下生效。
>
> - 在2in1设备上窗口相对于屏幕移动，其他设备上窗口相对于父窗口移动。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Int32|是|-|窗口在x轴方向移动到的坐标位置，单位为px，值为正表示位置在x轴右侧；值为负表示位置在x轴左侧；值为0表示位置在x轴坐标原点。|
|y|Int32|是|-|窗口在y轴方向移动到的坐标位置，单位为px，值为正表示位置在y轴下侧；值为负表示位置在y轴上侧；值为0表示位置在y轴坐标原点。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func off(WindowCallbackType, Callback1Argument\<UInt32>)

```cangjie
public func off(callbackType: WindowCallbackType, callback: Callback1Argument<UInt32>): Unit
```

**功能：** 关闭固定态软键盘高度变化的监听。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callbackType|[WindowCallbackType](#enum-windowcallbacktype)|是|-|监听事件，固定为WindowCallbackType.KeyboardHeightChange，即键盘高度变化事件。|
|callback|[Callback1Argument](../apis/BasicServicesKit/cj-apis-base.md#class-callback1argument)\<UInt32>|是|-|回调函数实例对象。返回当前的键盘高度，单位为px。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |

### func off(WindowCallbackType)

```cangjie
public func off(callbackType: WindowCallbackType): Unit
```

**功能：** 关闭窗口对应事件的监听。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callbackType|[WindowCallbackType](#enum-windowcallbacktype)|是|-|要关闭的监听事件。需要在 [WindowCallbackType](#enum-windowcallbacktype) 枚举范围内。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |

### func on(WindowCallbackType, Callback1Argument\<UInt32>)

```cangjie
public func on(callbackType: WindowCallbackType, callback: Callback1Argument<UInt32>): Unit
```

**功能：** 开启固定态软键盘高度变化的监听，当软键盘由本窗口唤出并存在重叠区域时通知键盘高度变化。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callbackType|[WindowCallbackType](#enum-windowcallbacktype)|是|-|监听事件，固定为WindowCallbackType.KeyboardHeightChange，即键盘高度变化事件。|
|callback|[Callback1Argument](../apis/BasicServicesKit/cj-apis-base.md#class-callback1argument)\<UInt32>|是|-|回调函数。返回当前的键盘高度，单位为px。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |

### func resetAspectRatio()

```cangjie
public func resetAspectRatio(): Unit
```

**功能：** 取消设置窗口内容布局的比例。

> **说明：**
>
> 仅主窗可设置，且仅在自由悬浮窗口模式（即窗口模式为[WindowStatusType.Floating](#enum-windowstatustype)）下生效，调用后将清除持久化储存的比例信息。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |
  | 1300004 | Unauthorized operation. |

### func resize(UInt32, UInt32)

```cangjie
public func resize(width: UInt32, height: UInt32): Unit
```

**功能：** 改变当前窗口大小。

> **说明：**
>
> - 应用主窗口与子窗口存在大小限制，默认宽度范围：[320, 1920]，默认高度范围：[240, 1920]，单位为vp。
>
> - 应用主窗口与子窗口的最小宽度与最小高度可由产品端进行配置，配置后的最小宽度与最小高度以产品段配置值为准。
>
> - 系统窗口存在大小限制，宽度范围：(0, 1920]，高度范围：(0, 1920]，单位为vp。设置的宽度与高度受到此约束限制，规则：<br>若所设置的窗口宽/高尺寸小于窗口最小宽/高限值，则窗口最小宽/高限值生效；<br>若所设置的窗口宽/高尺寸大于窗口最大宽/高限值，则窗口最大宽/高限值生效。<br>全屏模式窗口不支持该操作。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|UInt32|是|-|目标窗口的宽度，单位为px。|
|height|UInt32|是|-|目标窗口的高度，单位为px。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setAspectRatio(Float64)

```cangjie
public func setAspectRatio(ratio: Float64): Unit
```

**功能：** 设置窗口内容布局的比例。

> **说明：**
>
> - 通过其他接口如resize、resizeAsync设置窗口大小时，不受ratio约束。
> - 仅主窗可设置，且仅在自由悬浮窗口模式（即窗口模式为[WindowStatusType.Floating](#enum-windowstatustype)）下生效，比例参数将持久化保存，关闭应用或重启设备设置的比例仍然生效。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|ratio|Float64|是|-|除边框装饰之外的窗口内容布局的宽高比。<br>**说明：**<br>该参数受窗口最大最小尺寸限制，比例值下限为最小宽度/最大高度，上限为最大宽度/最小高度。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |
  | 1300004 | Unauthorized operation. |

### func setPreferredOrientation(Orientation)

```cangjie
public func setPreferredOrientation(orientation: Orientation): Unit
```

**功能：** 设置主窗口的显示方向属性。

> **说明：**
>
> 仅在支持跟随sensor旋转的设备上生效，子窗口调用后不生效。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|orientation|[Orientation](#enum-orientation)|是|-|窗口显示方向的属性。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)和[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter   verification failed. |
  | 1300002 | This window state is abnormal. |

### func setWindowBackgroundColor(String)

```cangjie
public func setWindowBackgroundColor(color: String): Unit
```

**功能：** 设置窗口的背景色。

> **说明：**
>
> 该接口需要在[loadContent()](#func-loadcontentstring)调用生效后使用。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|String|是|-|需要设置的背景色，为十六进制RGB或ARGB颜色，不区分大小写。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../errorcodes/cj-errorcode-universal.md)和[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible cause: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 1300002 | This window state is abnormal. |

### func setWindowBrightness(Float32)

```cangjie
public func setWindowBrightness(brightness: Float32): Unit
```

**功能：** 允许应用主窗口设置屏幕亮度值。

> **说明：**
>
> 当前屏幕亮度规格：窗口设置屏幕亮度生效时，控制中心不可以调整系统屏幕亮度，窗口恢复默认系统亮度之后，控制中心可以调整系统屏幕亮度。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|brightness|Float32|是|-|屏幕亮度值。取值范围为[0.0, 1.0]或-1.0。1.0表示最亮，-1.0表示默认亮度。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowColorSpace(ColorSpace)

```cangjie
public func setWindowColorSpace(colorSpace: ColorSpace): Unit
```

**功能：** 设置当前窗口为广色域模式或默认色域模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|colorSpace|[ColorSpace](#enum-colorspace)|是|-|设置色域模式。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowFocusable(Bool)

```cangjie
public func setWindowFocusable(isFocusable: Bool): Unit
```

**功能：** 设置使用点击或其他方式使该窗口获焦的场景时，该窗口是否支持窗口焦点从点击前的获焦窗口切换到该窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isFocusable|Bool|是|-|点击时是否支持切换焦点窗口。true表示支持；false表示不支持。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowKeepScreenOn(Bool)

```cangjie
public func setWindowKeepScreenOn(isKeepScreenOn: Bool): Unit
```

**功能：** 设置屏幕是否为常亮状态。

> **说明：**
>
> 规范使用该接口：仅在必要场景（导航、视频播放、绘画、游戏等场景）下，设置该属性为true；退出上述场景后，应当重置该属性为false；其他场景（无屏幕互动、音频播放等）下，不使用该接口；系统检测到非规范使用该接口时，可能会恢复自动灭屏功能。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isKeepScreenOn|Bool|是|-|设置屏幕是否为常亮状态。true表示常亮；false表示不常亮。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowLayoutFullScreen(Bool)

```cangjie
public func setWindowLayoutFullScreen(isLayoutFullScreen: Bool): Unit
```

**功能：** 设置主窗口或子窗口的布局是否为沉浸式布局。

> **说明：**
>
> - 沉浸式布局生效时，布局不避让状态栏与导航栏，组件可能产生与其重叠的情况。
> - 非沉浸式布局生效时，布局避让状态栏与导航栏，组件不会与其重叠。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isLayoutFullScreen|Bool|是|-|窗口的布局是否为沉浸式布局（该沉浸式布局状态栏、导航栏仍然显示）。true表示沉浸式布局；false表示非沉浸式布局。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowPrivacyMode(Bool)

```cangjie
public func setWindowPrivacyMode(isPrivacyMode: Bool): Unit
```

**功能：** 设置窗口是否为隐私模式。设置为隐私模式的窗口，窗口内容将无法被截屏或录屏。此接口可用于禁止截屏/录屏的场景。

**需要权限：** ohos.permission.PRIVACY_WINDOW

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isPrivacyMode|Bool|是|-|窗口是否为隐私模式。true表示模式开启；false表示模式关闭。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowSystemBarEnable(Array\<SystemBarType>)

```cangjie
public func setWindowSystemBarEnable(names: Array<SystemBarType>): Unit
```

**功能：** 设置主窗口三键导航栏、状态栏、底部导航条的可见模式。状态栏与底部导航条通过status控制、三键导航栏通过navigation控制。

> **说明：**
>
> - 该接口在2in1设备上调用不生效，其他设备在分屏模式（即窗口模式为[WindowStatusType.SplitScreen](#enum-windowstatustype)）、自由悬浮窗口模式（即窗口模式为[WindowStatusType.Floating](#enum-windowstatustype)）、自由多窗模式（可点击设备控制中心中的自由多窗按钮开启）下调用不会立刻生效，只有进入全屏主窗口才会生效。
>
> - 调用生效后返回并不表示三键导航栏、状态栏和底部导航条的显示或隐藏已完成。子窗口调用后不生效。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|names|Array\<[SystemBarType](#enum-systembartype)>|是|-|设置窗口全屏模式时状态栏、三键导航栏和底部导航条是否显示。例如，需全部显示，该参数设置为[SystemBarType.Status, SystemBarType.Navigation]；不设置，则默认不显示。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowSystemBarProperties(SystemBarProperties)

```cangjie
public func setWindowSystemBarProperties(systemBarProperties: SystemBarProperties): Unit
```

**功能：** 设置主窗口三键导航栏、状态栏的属性。

> **说明：**
>
> - 该接口在2in1设备上调用不生效。其他设备在分屏模式（即窗口模式为[WindowStatusType.SplitScreen](#enum-windowstatustype)）、自由悬浮窗口模式（即窗口模式为[WindowStatusType.Floating](#enum-windowstatustype)）、自由多窗模式（可点击设备控制中心中的自由多窗按钮开启）下调用不会立刻生效，只有进入全屏主窗口才会生效。
>
> - 子窗口调用后不生效。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|systemBarProperties|[SystemBarProperties](#class-systembarproperties)|是|-|三键导航栏、状态栏的属性。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func setWindowTouchable(Bool)

```cangjie
public func setWindowTouchable(isTouchable: Bool): Unit
```

**功能：** 设置窗口是否为可触状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isTouchable|Bool|是|-|窗口是否为可触状态。true表示可触；false表示不可触。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func showWindow()

```cangjie
public func showWindow(): Unit
```

**功能：** 显示当前窗口。

> **说明：**
>
> 仅支持系统窗口及应用子窗口，或将已显示的应用主窗口的层级提升至顶部。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func snapshot()

```cangjie
public func snapshot(): PixelMap
```

**功能：** 获取窗口截图，使用callback异步回调。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)|返回当前窗口截图。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
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

**功能：** 窗口属性。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var brightness

```cangjie
public var brightness: Float32
```

**功能：** 表示屏幕亮度。可设置的亮度范围为[0.0, 1.0]，其取1.0时表示最大亮度值。如果窗口没有设置亮度值，表示亮度跟随系统，此时获取到的亮度值为-1。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var drawableRect

```cangjie
public var drawableRect: Rect
```

**功能：** 表示窗口内可绘制区域尺寸，其中左边界上边界是相对窗口计算。

**类型：** [Rect](#class-rect)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var focusable

```cangjie
public var focusable: Bool
```

**功能：** 表示窗口是否可聚焦，初始为true。true表示可聚焦；false表示不可聚焦。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var id

```cangjie
public var id: UInt32
```

**功能：** 表示窗口ID，初始值为0。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var isFullScreen

```cangjie
public var isFullScreen: Bool
```

**功能：** 表示是否全屏，初始为false。true表示全屏；false表示非全屏。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var isKeepScreenOn

```cangjie
public var isKeepScreenOn: Bool
```

**功能：** 表示屏幕是否常亮，初始为false。true表示常亮；false表示不常亮。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var isLayoutFullScreen

```cangjie
public var isLayoutFullScreen: Bool
```

**功能：** 表示窗口是否为沉浸式，初始为false。true表示沉浸式；false表示非沉浸式。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var isPrivacyMode

```cangjie
public var isPrivacyMode: Bool
```

**功能：** 表示隐私模式是否开启，初始为false。true表示模式开启；false表示模式关闭。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var isTransparent

```cangjie
public var isTransparent: Bool
```

**功能：** 表示窗口是否透明。初始为false。true表示透明；false表示不透明。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var touchable

```cangjie
public var touchable: Bool
```

**功能：** 表示窗口是否可触摸，初始为true。true表示可触摸；false表示不可触摸。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var winType

```cangjie
public var winType: WindowType
```

**功能：** 表示窗口类型。

**类型：** [WindowType](#enum-windowtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### var windowRect

```cangjie
public var windowRect: Rect
```

**功能：** 表示窗口尺寸，可在页面生命周期或应用生命周期阶段获取。

**类型：** [Rect](#class-rect)

**读写能力：** 可读写

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

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

**功能：** 构建一个WindowProperties类型的对象。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|windowRect|[Rect](#class-rect)|是|-|窗口尺寸，可在页面生命周期或应用生命周期阶段获取。|
|drawableRect|[Rect](#class-rect)|是|-|窗口内可绘制区域尺寸，其中左边界上边界是相对窗口计算。|
|winType|[WindowType](#enum-windowtype)|是|-|窗口类型。|
|isFullScreen|Bool|是|-|是否全屏，初始为false。true表示全屏；false表示非全屏。|
|isLayoutFullScreen|Bool|是|-|窗口是否为沉浸式，初始为false。true表示沉浸式；false表示非沉浸式。|
|focusable|Bool|是|-|窗口是否可聚焦，初始为true。true表示可聚焦；false表示不可聚焦。|
|touchable|Bool|是|-|窗口是否可触摸，初始为true。true表示可触摸；false表示不可触摸。|
|brightness|Float32|是|-|屏幕亮度。可设置的亮度范围为[0.0, 1.0]，其取1.0时表示最大亮度值。如果窗口没有设置亮度值，表示亮度跟随系统，此时获取到的亮度值为-1。|
|isKeepScreenOn|Bool|是|-|屏幕是否常亮，初始为false。true表示常亮；false表示不常亮。|
|isPrivacyMode|Bool|是|-|窗口是否为隐私模式。true表示模式开启；false表示模式关闭。|
|isTransparent|Bool|是|-|窗口是否透明。默认为false。true表示透明；false表示不透明。|
|id|UInt32|是|-|窗口ID。<br>初始值：0|

## class WindowStage

```cangjie
public class WindowStage {}
```

**功能：** 窗口管理器。管理各个基本窗口单元，即Window实例。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func createSubWindow(String)

```cangjie
public func createSubWindow(name: String): Window
```

**功能：** 创建该WindowStage实例下的子窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|子窗口的名字。|

**返回值：**

|类型|说明|
|:----|:----|
|[Window](#class-window)|返回当前WindowStage下的子窗口对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func getMainWindow()

```cangjie
public func getMainWindow(): Window
```

**功能：** 获取该WindowStage实例下的主窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Window](#class-window)|返回当前WindowStage下的主窗口对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func getSubWindow()

```cangjie
public func getSubWindow(): Array<Window>
```

**功能：** 获取该WindowStage实例下的所有子窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[Window](#class-window)>|返回当前WindowStage下的所有子窗口对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[窗口错误码](../errorcodes/cj-errorcode-window.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 1300002 | This window state is abnormal. |

### func loadContent(String)

```cangjie
public func loadContent(path: String): Unit
```

**功能：** 为当前WindowStage的主窗口加载具体页面内容。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|要加载到窗口中的页面内容的路径，该路径需添加到工程的main_pages.json文件中。|

## enum AvoidAreaType

```cangjie
public enum AvoidAreaType <: Equatable<AvoidAreaType> {
    | TypeSystem
    | TypeCutout
    | TypeSystemGesture
    | TypeKeyboard
    | TypeNavigationIndicator
    | ...
}
```

**功能：** 窗口内容需要规避区域的类型枚举。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<AvoidAreaType>

### TypeCutout

```cangjie
TypeCutout
```

**功能：** 表示刘海屏区域。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### TypeKeyboard

```cangjie
TypeKeyboard
```

**功能：** 表示软键盘区域。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### TypeNavigationIndicator

```cangjie
TypeNavigationIndicator
```

**功能：** 表示导航条区域。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### TypeSystem

```cangjie
TypeSystem
```

**功能：** 表示系统默认区域。一般包括状态栏、导航栏，各设备系统定义可能不同。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### TypeSystemGesture

```cangjie
TypeSystemGesture
```

**功能：** 表示手势区域。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(AvoidAreaType)

```cangjie
public operator func !=(other: AvoidAreaType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AvoidAreaType](#enum-avoidareatype)|是|-另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(AvoidAreaType)

```cangjie
public operator func ==(other: AvoidAreaType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AvoidAreaType](#enum-avoidareatype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum ColorSpace

```cangjie
public enum ColorSpace <: Equatable<ColorSpace> {
    | Default
    | WideGamut
    | ...
}
```

**功能：** 色域模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<ColorSpace>

### Default

```cangjie
Default
```

**功能：** 默认Srgb色域模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WideGamut

```cangjie
WideGamut
```

**功能：** 广色域模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(ColorSpace)

```cangjie
public operator func !=(other: ColorSpace): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ColorSpace](#enum-colorspace)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ColorSpace)

```cangjie
public operator func ==(other: ColorSpace): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ColorSpace](#enum-colorspace)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum Orientation

```cangjie
public enum Orientation <: Equatable<Orientation> {
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

**功能：** 窗口显示方向类型枚举。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<Orientation>

### AutoRotation

```cangjie
AutoRotation
```

**功能：** 跟随传感器自动旋转，可以旋转到竖屏、横屏、反向竖屏、反向横屏四个方向。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### AutoRotationLandscape

```cangjie
AutoRotationLandscape
```

**功能：** 跟随传感器自动横向旋转，可以旋转到横屏、反向横屏，无法旋转到竖屏、反向竖屏。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### AutoRotationLandscapeRestricted

```cangjie
AutoRotationLandscapeRestricted
```

**功能：** 跟随传感器自动横向旋转，可以旋转到横屏、反向横屏，无法旋转到竖屏、反向竖屏，且受控制中心的旋转开关控制。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### AutoRotationPortrait

```cangjie
AutoRotationPortrait
```

**功能：** 调用时临时旋转到竖屏，之后跟随传感器自动旋转，受控制中心的旋转开关控制，且可旋转方向受系统判定。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### AutoRotationPortraitRestricted

```cangjie
AutoRotationPortraitRestricted
```

**功能：** 跟随传感器自动竖向旋转，可以旋转到竖屏、反向竖屏，无法旋转到横屏、反向横屏，且受控制中心的旋转开关控制。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### AutoRotationRestricted

```cangjie
AutoRotationRestricted
```

**功能：** 跟随传感器自动旋转，可以旋转到竖屏、横屏、反向竖屏、反向横屏四个方向，且受控制中心的旋转开关控制。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Landscape

```cangjie
Landscape
```

**功能：** 表示横屏显示模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### LandscapeInverted

```cangjie
LandscapeInverted
```

**功能：** 表示反向横屏显示模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Locked

```cangjie
Locked
```

**功能：** 表示锁定模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Portrait

```cangjie
Portrait
```

**功能：** 表示竖屏显示模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### PortraitInverted

```cangjie
PortraitInverted
```

**功能：** 表示反向竖屏显示模式。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Unspecified

```cangjie
Unspecified
```

**功能：** 表示未定义方向模式，由系统判定。

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
|other|[Orientation](#enum-orientation)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(Orientation)

```cangjie
public operator func ==(other: Orientation): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Orientation](#enum-orientation)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum SystemBarType

```cangjie
public enum SystemBarType <: Equatable<SystemBarType> {
    | Status
    | Navigation
    | ...
}
```

**功能：** 系统栏类型。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<SystemBarType>

### Navigation

```cangjie
Navigation
```

**功能：** 底部导航。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Status

```cangjie
Status
```

**功能：** 状态栏。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(SystemBarType)

```cangjie
public operator func !=(other: SystemBarType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SystemBarType](#enum-systembartype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SystemBarType)

```cangjie
public operator func ==(other: SystemBarType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SystemBarType](#enum-systembartype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum WindowCallbackType

```cangjie
public enum WindowCallbackType <: Equatable<WindowCallbackType> {
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

**功能：** 窗口监听回调事件类型枚举。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<WindowCallbackType>

### DialogTargetTouch

```cangjie
DialogTargetTouch
```

**功能：** 模态窗口所遮盖窗口的点击或触摸事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### KeyboardHeightChange

```cangjie
KeyboardHeightChange
```

**功能：** 键盘高度变化事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### NoInteractionDetected

```cangjie
NoInteractionDetected
```

**功能：** 本窗口在指定超时时间内无交互的事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Screenshot

```cangjie
Screenshot
```

**功能：** 截屏事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### SubWindowClose

```cangjie
SubWindowClose
```

**功能：** 子窗口关闭事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### TouchOutside

```cangjie
TouchOutside
```

**功能：** 本窗口范围外的点击事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowAvoidAreaChange

```cangjie
WindowAvoidAreaChange
```

**功能：** 系统规避区变化事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowEvent

```cangjie
WindowEvent
```

**功能：** 窗口生命周期变化事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowRectChange

```cangjie
WindowRectChange
```

**功能：** 窗口矩形变化事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowSizeChange

```cangjie
WindowSizeChange
```

**功能：** 窗口尺寸变化事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowStageEvent

```cangjie
WindowStageEvent
```

**功能：** WindowStage生命周期变化事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowStatusChange

```cangjie
WindowStatusChange
```

**功能：** 窗口模式变化事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowTitleButtonRectChange

```cangjie
WindowTitleButtonRectChange
```

**功能：** 标题栏上的最小化、最大化、关闭按钮矩形区域变化事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowVisibilityChange

```cangjie
WindowVisibilityChange
```

**功能：** 本窗口可见状态变化的事件。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(WindowCallbackType)

```cangjie
public operator func !=(other: WindowCallbackType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowCallbackType]#enum-windowcallbacktype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(WindowCallbackType)

```cangjie
public operator func ==(other: WindowCallbackType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowCallbackType]#enum-windowcallbacktype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum WindowEventType

```cangjie
public enum WindowEventType <: Equatable<WindowEventType> {
    | WindowShown
    | WindowActive
    | WindowInactive
    | WindowHidden
    | WindowDestroyed
    | ...
}
```

**功能：** 窗口生命周期。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<WindowEventType>

### WindowActive

```cangjie
WindowActive
```

**功能：** 获焦状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowDestroyed

```cangjie
WindowDestroyed
```

**功能：** 窗口销毁。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowHidden

```cangjie
WindowHidden
```

**功能：** 切到后台。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowInactive

```cangjie
WindowInactive
```

**功能：** 失焦状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### WindowShown

```cangjie
WindowShown
```

**功能：** 切到前台。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(WindowEventType)

```cangjie
public operator func !=(other: WindowEventType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowEventType](#enum-windoweventtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(WindowEventType)

```cangjie
public operator func ==(other: WindowEventType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowEventType](#enum-windoweventtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum WindowStageEventType

```cangjie
public enum WindowStageEventType <: Equatable<WindowStageEventType> {
    | Shown
    | Active
    | Inactive
    | Hidden
    | Resumed
    | Paused
    | ...
}
```

**功能：** WindowStage生命周期。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<WindowStageEventType>

### Active

```cangjie
Active
```

**功能：** 获焦状态，例如应用窗口处理点击事件后的状态、应用启动后的状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Hidden

```cangjie
Hidden
```

**功能：** 切到后台，例如应用上滑退出、应用窗口关闭。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Inactive

```cangjie
Inactive
```

**功能：** 失焦状态，例如打开新应用或点击其他窗口后，原获焦窗口的状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Paused

```cangjie
Paused
```

**功能：** 前台不可交互状态，例如从屏幕底部上划，应用进入到多任务界面后的状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Resumed

```cangjie
Resumed
```

**功能：** 前台可交互状态，例如应用打开后，可以与用户交互的状态。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### Shown

```cangjie
Shown
```

**功能：** 切到前台，例如点击应用图标启动，无论是首次启动还是从后台启动均会触发。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(WindowStageEventType)

```cangjie
public operator func !=(other: WindowStageEventType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowStageEventType](#enum-windowstageeventtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(WindowStageEventType)

```cangjie
public operator func ==(other: WindowStageEventType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowStageEventType](#enum-windowstageeventtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum WindowStatusType

```cangjie
public enum WindowStatusType <: Equatable<WindowStatusType> {
    | Undefined
    | FullScreen
    | Maximize
    | Minimize
    | Floating
    | SplitScreen
    | ...
}
```

**功能：** 窗口模式枚举。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

**父类型：**

- Equatable\<WindowStatusType>

### Floating

```cangjie
Floating
```

**功能：** 表示APP自由悬浮形式窗口模式。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### FullScreen

```cangjie
FullScreen
```

**功能：** 表示APP全屏模式。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### Maximize

```cangjie
Maximize
```

**功能：** 表示APP窗口最大化模式。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### Minimize

```cangjie
Minimize
```

**功能：** 表示APP窗口最小化模式。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### SplitScreen

```cangjie
SplitScreen
```

**功能：** 表示APP分屏模式。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### Undefined

```cangjie
Undefined
```

**功能：** 表示APP未定义窗口模式。

**系统能力：** SystemCapability.Window.SessionManager

**起始版本：** 21

### func !=(WindowStatusType)

```cangjie
public operator func !=(other: WindowStatusType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowStatusType](#enum-windowstatustype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(WindowStatusType)

```cangjie
public operator func ==(other: WindowStatusType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowStatusType](#enum-windowstatustype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## enum WindowType

```cangjie
public enum WindowType <: Equatable<WindowType> {
    | TypeApp
    | TypeFloat
    | TypeDialog
    | ...
}
```

**功能：** 窗口类型枚举。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

**父类型：**

- Equatable\<WindowType>

### TypeApp

```cangjie
TypeApp
```

**功能：** 表示应用程序窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### TypeDialog

```cangjie
TypeDialog
```

**功能：** 表示模态窗口。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### TypeFloat

```cangjie
TypeFloat
```

**功能：** 表示悬浮窗。

**系统能力：** SystemCapability.WindowManager.WindowManager.Core

**起始版本：** 21

### func !=(WindowType)

```cangjie
public operator func !=(other: WindowType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowType](#enum-windowtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(WindowType)

```cangjie
public operator func ==(other: WindowType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WindowType](#enum-windowtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## 示例代码

### 示例1（获取主窗口设置不可触属性）

设置主窗口属性为不可触后，点击页面中的按钮将不会有弹窗。

<!-- run -example1 -->

```cangjie
// main_ability.cj

package ohos_app_cangjie_entry

internal import kit.ArkUI.*
internal import kit.AbilityKit.*
internal import kit.ArkUI.*

class MainAbility <: Ability {
    public init() {
        super()
        registerSelf()
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        // 1.获取应用主窗口。
        var window: Window = windowStage.getMainWindow()

        // 2.设置窗口主属性。以设置 ”是否可触“ 属性为例。
        window.setWindowTouchable(false)

        // 3. 为主窗口加载对应的目标页面
        windowStage.loadContent("newPage")
    }
}
```

<!-- run -example1 -->

```cangjie
// newPage.cj

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class newPage{
    func build(){
        Flex(FlexParams(justifyContent: FlexAlign.Center ,alignItems: ItemAlign.Center)) {
            Column{
                Text("New Page")
                Button("Untouchable").onClick{
                    => AlertDialog.show(
                        AlertDialogParamWithConfirm("Unreachable")
                    )
                }.margin(10.vp)
            }.margin(10.vp)
        }
    }
}
```

![img1](./../../比对/main/arkui-cj/figures/window_touchable_is_false.png)

### 示例2（主窗口监听键盘高度变化事件）

<!-- run -example2 -->

```cangjie
// main_ability.cj

package ohos_app_cangjie_entry

internal import kit.AbilityKit.*
internal import kit.ArkUI.*

class MainAbility <: Ability {

    public init() {
        super()
        registerSelf()
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        windowStage.loadContent("newPage")
        // 将该Ability的窗口管理器传入AppStorage中
        AppStorage.setOrCreate("windowStage",windowStage)
    }
}
```

<!-- run -example2 -->

```cangjie
//newPage.cj

package ohos_app_cangjie_entry

import kit.ArkUI.*
import kit.ArkUI.*
import ohos.hilog.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class newPage{

    public override func onPageShow(){
        let windowStage: WindowStage = AppStorage.get<WindowStage>("windowStage").getOrThrow()
        let mainWindow: Window = windowStage.getMainWindow()

        // 开启监听
        var tmp: Unit = mainWindow.on("keyboardHeightChange",TestCallback(0))
    }

    func build(){
        Flex(FlexParams(justifyContent: FlexAlign.Center ,alignItems: ItemAlign.Center)) {
            Column{
                TextInput(placeholder: 'input some words here... ').margin(10.vp)
            }.margin(10.vp)
        }
    }
}

public class TestCallback <: Callback1Argument<UInt32>{

    var count: Int64

    public init(count: Int64){
        this.count = count
    }

    public func invoke(value: UInt32): Unit {
        count++
        // 拉起或隐藏键盘时，会触发日志打印总计的键盘高度变化计数
        Hilog.info(0,"","KeyboardHeightChangeCount: ${this.count}")
    }
}
```

运行后点击文本框触发回调，在日志中查看效果，打印日志如下。

```text
KeyboardHeightChangeCount: 1
KeyboardHeightChangeCount: 2
KeyboardHeightChangeCount: 3
```

### 示例3（设置子窗口回调函数）

该示例创建了一个isModal属性为true的子窗口。监听子窗口点击模态窗口事件，触发回调时销毁子窗。

<!-- run -example3 -->

```cangjie
// main_ability.cj

package ohos_app_cangjie_entry

internal import kit.AbilityKit.*
internal import kit.ArkUI.*

class MainAbility <: Ability {

    public init() {
        super()
        registerSelf()
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        windowStage.loadContent("newPage")
        // 将该Ability的窗口管理器传入AppStorage中
        AppStorage.setOrCreate("windowStage",windowStage)
    }
}
```

<!-- run -example3 -->

```cangjie
// newPage.cj

package ohos_app_cangjie_entry

import kit.ArkUI.*
import kit.ArkUI.*
import ohos.hilog.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class newPage{
    @State
    var hint: Bool = AppStorage.has("windowStage")

    public func CreateSubWindow(): Unit{
        hint = AppStorage.has("windowStage")
        // 获取该Ability的窗口管理器实例
        var windowStage: WindowStage = AppStorage.get<WindowStage>("windowStage").getOrThrow()

        var mainWindow: Window = windowStage.getMainWindow()

        mainWindow.setWindowGrayScale(1.0)

        // 1.创建应用子窗口，子窗口显示时，主窗口不能响应用户操作。
        var subWindowOptions: SubWindowOptions = SubWindowOptions(
            title: "mySubWindow",
            decorEnabled: true,
            isModal: true
        )
        var subWindow: Window = windowStage.createSubWindowWithOptions("tempSubWindow", subWindowOptions)

        // 2.设置应用子窗口的位置、大小及相关属性等。
        subWindow.moveWindowTo(300,300)
        subWindow.resize(500,500)

        // 3.注册监听点击模态窗口事件。
        subWindow.on(WindowCallbackType.DialogTargetTouch,DestroySubWindow())

        // 4.显示子窗口（空内容）
        subWindow.showWindow()
    }

    func build(){
        Flex(FlexParams(justifyContent: FlexAlign.Center ,alignItems: ItemAlign.Center)){
            Column(){
                Text("SubWindowCreated: ${hint}")
                Button("GetSubWindow").onClick{
                    =>  CreateSubWindow()
                }
            }
        }
    }
}

public class DestroySubWindow <: Callback0Argument{
    public init(){}

    // 当点击模态窗口区域时，关闭子窗。
    public override func invoke(): Unit{
        var windowStage: WindowStage = AppStorage.get<WindowStage>("windowStage").getOrThrow()
        var subWindows: Array<Window> = windowStage.getSubWindow()
        for(i in subWindows){
            i.destroyWindow()
        }
        // 子窗关闭后，恢复主窗口灰阶。
        var mainWindow: Window = windowStage.getMainWindow()
        mainWindow.setWindowGrayScale(0.0)
    }
}
```

![img3](figures/window_subwindow_created.png)
