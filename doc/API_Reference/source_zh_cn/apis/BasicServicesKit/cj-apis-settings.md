# ohos.settings（设置数据项名称）

本模块提供访问设置数据项的能力。

## 导入模块

```cangjie
import kit.BasicServicesKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func getValue\<T>(StageContext, T, String) where T <: ToString

```cangjie
public func getValue<T>(context: StageContext, name: T, defValue: String): String where T <: ToString
```

**功能：** 获取数据项的值。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用上下文。context的获取方式请参见[getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext)。|
|name|T|是|-|类型T需实现ToString接口。数据项的名称。数据项名称分为以下两种：<br>- 上述任意一个数据库中已存在的数据项。<br>- 开发者自行添加的数据项。|
|defValue|String|是|-|默认值。由开发者设置，当未从数据库中查询到该数据时，表示返回该默认值。|

**返回值：**

|类型|说明|
|:----|:----|
|String|返回数据项的值。 |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.ability.getStageContext

let ret = getValue(getStageContext(Global.getAbilityContext()), Display.SCREEN_BRIGHTNESS_STATUS, "50") // 需获取Context应用上下文，详见本文使用说明
```

## func getValue\<T, P>(StageContext, T, String, P) where T <: ToString, P <: ToString

```cangjie
public func getValue<T, P>(context: StageContext, name: T, defValue: String, domainName: P): String where T <: ToString, P <: ToString
```

**功能：** 获取数据项的值。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用上下文。context的获取方式请参见[getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext)。|
|name|T|是|-|类型T需实现ToString 接口。数据项的名称。数据项名称分为以下两种：<br>- 上述任意一个数据库中已存在的数据项。<br>- 开发者自行添加的数据项。|
|defValue|String|是|-|默认值。由开发者设置，当未从数据库中查询到该数据时，表示返回该默认值。|
|domainName|P|是|-|类型P需实现ToString 接口。指定要设置的域名<br> - domainName为DomainName.DEVICE_SHARED，<br>&nbsp;&nbsp;&nbsp;表示设备属性共享域。<br>- domainName为DomainName.USER_PROPRERTY，<br>&nbsp;&nbsp;&nbsp;表示为用户属性域。|

**返回值：**

|类型|说明|
|:----|:----|
|String|返回数据项的值。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.ability.*

let ret = getValue(getStageContext(Global.getAbilityContext()), Display.SCREEN_BRIGHTNESS_STATUS, "50", DomainName.USER_PROPERTY) // 需获取Context应用上下文，详见本文使用说明
```

## enum Date

```cangjie
public enum Date <: ToString {
    | DATE_FORMAT
    | TIME_FORMAT
    | AUTO_GAIN_TIME
    | AUTO_GAIN_TIME_ZONE
    | ...
}
```

**功能：** 提供设置时间和日期格式的数据项。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**父类型：**

- ToString

### AUTO_GAIN_TIME

```cangjie
AUTO_GAIN_TIME
```

**功能：** 是否自动从网络获取日期、时间和时区。 值为true表示自动从网络获取信息；值为false表示不自动获取。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### AUTO_GAIN_TIME_ZONE

```cangjie
AUTO_GAIN_TIME_ZONE
```

**功能：** 是否自动从NITZ获取时区。值为true表示自动获取；值为false表示不自动获取。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### DATE_FORMAT

```cangjie
DATE_FORMAT
```

**功能：** 日期格式。日期格式包括MM/dd/yyyy、dd/MM/yyyy和yyyy/MM/dd ，其中MM、dd和yyyy分别代表月份、日期和年份。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### TIME_FORMAT

```cangjie
TIME_FORMAT
```

**功能：** 时间是以12小时格式还是24小时格式显示。值为 “12” 表示12小时格式；值为 ”24“ 表示24小时格式。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### func toString()

```cangjie
public override func toString(): String
```

**功能：** 返回设置时间和日期格式的数据项。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**返回值：**

| 类型  | 说明  |
| :------ | :------ |
| String | 设置时间和日期格式的数据项。 |

## enum Display

```cangjie
public enum Display <: ToString {
    | FONT_SCALE
    | SCREEN_BRIGHTNESS_STATUS
    | AUTO_SCREEN_BRIGHTNESS
    | SCREEN_OFF_TIMEOUT
    | DEFAULT_SCREEN_ROTATION
    | ANIMATOR_DURATION_SCALE
    | TRANSITION_ANIMATION_SCALE
    | WINDOW_ANIMATION_SCALE
    | DISPLAY_INVERSION_STATUS
    | ...
}
```

**功能：** 提供设置显示效果的数据项。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**父类型：**

- ToString

### ANIMATOR_DURATION_SCALE

```cangjie
ANIMATOR_DURATION_SCALE
```

**功能：** 动画持续时间的比例因子。这会影响所有此类动画的开始延迟和持续时间。值为0，表示动画将立即结束，默认值为1。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### AUTO_SCREEN_BRIGHTNESS

```cangjie
AUTO_SCREEN_BRIGHTNESS
```

**功能：** 启用屏幕的自动旋转时，此属性无效；不启用自动旋转时，以下值可用：值为0，表示屏幕旋转0度；值为1，表示屏幕旋转90度；值为2，表示屏幕旋转180度；值为3，表示屏幕旋转270度。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### DEFAULT_SCREEN_ROTATION

```cangjie
DEFAULT_SCREEN_ROTATION
```

**功能：** 启用屏幕的自动旋转时，此属性无效；不启用自动旋转时，以下值可用：值为0，表示屏幕旋转0度；值为1，表示屏幕旋转90度；值为2，表示屏幕旋转180度；值为3，表示屏幕旋转270度。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### DISPLAY_INVERSION_STATUS

```cangjie
DISPLAY_INVERSION_STATUS
```

**功能：** 是否启用显示颜色反转。值为1，表示启用显示颜色反转；值为0，表示不启用显示颜色反转。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### FONT_SCALE

```cangjie
FONT_SCALE
```

**功能：** 字体的比例因子，值为浮点数。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### SCREEN_BRIGHTNESS_STATUS

```cangjie
SCREEN_BRIGHTNESS_STATUS
```

**功能：** 屏幕亮度。该值的范围从0到255。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### SCREEN_OFF_TIMEOUT

```cangjie
SCREEN_OFF_TIMEOUT
```

**功能：** 设备在一段时间不活动后进入睡眠状态的等待时间（单位：ms）。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### TRANSITION_ANIMATION_SCALE

```cangjie
TRANSITION_ANIMATION_SCALE
```

**功能：** 过渡动画的比例因子。值为0，表示禁用过渡动画。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### WINDOW_ANIMATION_SCALE

```cangjie
WINDOW_ANIMATION_SCALE
```

**功能：** 通窗口动画的比例因子。值为0，表示禁用窗口动画。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### func toString()

```cangjie
public override func toString(): String
```

**功能：** 返回设置显示效果的数据项。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**返回值：**

| 类型  | 说明  |
| :------ | :------ |
| String | 设置显示效果的数据项。 |

## enum DomainName

```cangjie
public enum DomainName <: ToString {
    | DEVICE_SHARED
    | USER_PROPERTY
    | ...
}
```

**功能：** 提供查询的域名。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**父类型：**

- ToString

### DEVICE_SHARED

```cangjie
DEVICE_SHARED
```

**功能：** 设备属性共享域。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### USER_PROPERTY

```cangjie
USER_PROPERTY
```

**功能：** 为用户属性域。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### func toString()

```cangjie
public override func toString(): String
```

**功能：** 返回查询的域名对应字符串。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|查询的域名对应字符串。|
