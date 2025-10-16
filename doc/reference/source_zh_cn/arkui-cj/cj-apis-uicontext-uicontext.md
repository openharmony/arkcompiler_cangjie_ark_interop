# Class（UIContext）

提供UI上下文相关功能。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class UIContext

```cangjie
public class UIContext {}
```

**功能：** UI上下文类，提供各种UI相关功能。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

### func animateTo(AnimateParam, VoidCallback)

```cangjie
public func animateTo(value: AnimateParam, event: VoidCallback): Unit
```

**功能：** 提供animateTo接口来指定由于闭包代码导致的状态变化插入过渡动效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|AnimateParam|是|-|动画参数。|
|event|VoidCallback|是|-|动画执行的回调函数。|

### func createAnimator(AnimatorOptions)

```cangjie
public func createAnimator(options: AnimatorOptions): AnimatorResult
```

**功能：** 创建animator动画结果对象（AnimatorResult）

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|AnimatorOptions|是|-|动画选项。|

**返回值：**

|类型|说明|
|:----|:----|
|AnimatorResult|动画结果对象。|

### func fp2px(Length)

```cangjie
public func fp2px(value: Length): Option<Length>
```

**功能：** 将fp单位的值转换为px单位的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Length|是|-|要转换的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Length>|转换后的值。|

### func getContextMenuController()

```cangjie
public func getContextMenuController(): ContextMenuController
```

**功能：** 获取上下文菜单控制器对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**返回值：**

|类型|说明|
|:----|:----|
|ContextMenuController|上下文菜单控制器对象。|

### func getFont()

```cangjie
public func getFont(): Font
```

**功能：** 获取字体对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**返回值：**

|类型|说明|
|:----|:----|
|Font|字体对象。|

### func getMeasureUtils()

```cangjie
public func getMeasureUtils(): MeasureUtils
```

**功能：** 获取测量工具对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**返回值：**

|类型|说明|
|:----|:----|
|MeasureUtils|MeasureUtils对象。|

### func getPromptAction()

```cangjie
public func getPromptAction(): PromptAction
```

**功能：** 获取PromptAction对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**返回值：**

|类型|说明|
|:----|:----|
|PromptAction|PromptAction对象。|

### func getRouter()

```cangjie
public func getRouter(): Router
```

**功能：** 获取路由对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**返回值：**

|类型|说明|
|:----|:----|
|Router|路由对象。|

### func lpx2px(Length)

```cangjie
public func lpx2px(value: Length): Option<Length>
```

**功能：** 将lpx单位的值转换为px单位的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Length|是|-|要转换的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Length>|转换后的值。|

### func px2fp(Length)

```cangjie
public func px2fp(value: Length): Option<Length>
```

**功能：** 将px单位的值转换为fp单位的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Length|是|-|要转换的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Length>|转换后的值。|

### func px2lpx(Length)

```cangjie
public func px2lpx(value: Length): Option<Length>
```

**功能：** 将px单位的值转换为lpx单位的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Length|是|-|要转换的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Length>|转换后的值。|

### func px2vp(Length)

```cangjie
public func px2vp(value: Length): Option<Length>
```

**功能：** 将px单位的值转换为vp单位的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Length|是|-|要转换的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Length>|转换后的值。|

### func showActionSheet(ActionSheetOptions)

```cangjie
public func showActionSheet(value: ActionSheetOptions): Unit
```

**功能：** 定义列表弹窗并弹出。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|ActionSheetOptions|是|-|操作表参数。|

### func showAlertDialog(AlertDialogParamWithConfirm)

```cangjie
public func showAlertDialog(options: AlertDialogParamWithConfirm): Unit
```

**功能：** 显示警告对话框。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|AlertDialogParamWithConfirm|是|-|警告对话框参数。|

### func showAlertDialog(AlertDialogParamWithButtons)

```cangjie
public func showAlertDialog(options: AlertDialogParamWithButtons): Unit
```

**功能：** 显示警告对话框。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|AlertDialogParamWithButtons|是|-|警告对话框参数。|

### func showAlertDialog(AlertDialogParamWithOptions)

```cangjie
public func showAlertDialog(options: AlertDialogParamWithOptions): Unit
```

**功能：** 显示警告对话框。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|AlertDialogParamWithOptions|是|-|警告对话框参数。|

### func vp2px(Length)

```cangjie
public func vp2px(value: Length): Option<Length>
```

**功能：** 将vp单位的值转换为px单位的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Length|是|-|要转换的值。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<Length>|转换后的值。|
