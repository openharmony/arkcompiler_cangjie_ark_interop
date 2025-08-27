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

## func getValue\<T>(UIAbilityContext, T, String) where T \<: ToString

```cangjie
public func getValue<T>(context: UIAbilityContext, name: T, defValue: String): String where T <: ToString
```

**功能：** 获取数据项的值。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|是|-|应用上下文。|
|name|T|是|-|类型T需实现ToString接口。数据项的名称。数据项名称分为以下两种：<br>- 上述任意一个数据库中已存在的数据项。<br>- 开发者自行添加的数据项。|
|defValue|String|是|-|默认值。由开发者设置，当未从数据库中查询到该数据时，表示返回该默认值。|

**返回值：**

|类型|说明|
|:----|:----|
|String|返回数据项的值。|

**异常：**

- IllegalArgumentException：

| 错误信息 | 可能原因 | 处理步骤 |
  | :---- | :--- | :--- |
  | The context is invalid. | context初始化失败 | 重启应用 |

## func getValue\<T, P>(UIAbilityContext, T, String, P) where T \<: ToStringP \<: ToString

```cangjie
public func getValue<T, P>(context: UIAbilityContext, name: T, defValue: String, domainName: P): String where T <: ToString,
    P <: ToString
```

**功能：** 获取数据项的值。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|是|-|应用上下文。|
|name|T|是|-|类型T需实现ToString 接口。数据项的名称。数据项名称分为以下两种：<br>- 上述任意一个数据库中已存在的数据项。<br>- 开发者自行添加的数据项。|
|defValue|String|是|-|默认值。由开发者设置，当未从数据库中查询到该数据时，表示返回该默认值。|
|domainName|P|是|-|类型P需实现ToString 接口。指定要设置的域名<br> - domainName为DomainName.DEVICE_SHARED，<br>&nbsp;&nbsp;&nbsp;表示设备属性共享域。<br>- domainName为DomainName.USER_PROPRERTY，<br>&nbsp;&nbsp;&nbsp;表示为用户属性域。|

**返回值：**

|类型|说明|
|:----|:----|
|String|返回数据项的值。|

**异常：**

- IllegalArgumentException：

| 错误信息 | 可能原因 | 处理步骤 |
  | :---- | :--- | :--- |
  | The context is invalid. | context初始化失败 | 重启应用 |

## enum Date

```cangjie
public enum Date <: ToString {
    | DateFormat
    | TimeFormat
    | AutoGainTime
    | AutoGainTimeZone
    | ...
}
```

**功能：** 提供设置时间和日期格式的数据项。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**父类型：**

- ToString

### AutoGainTime

```cangjie
AutoGainTime
```

**功能：** 是否自动从网络获取日期、时间和时区。 值为true表示自动从网络获取信息；值为false表示不自动获取。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### AutoGainTimeZone

```cangjie
AutoGainTimeZone
```

**功能：** 是否自动从NITZ获取时区。值为true表示自动获取；值为false表示不自动获取。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### DateFormat

```cangjie
DateFormat
```

**功能：** 日期格式。日期格式包括MM/dd/yyyy、dd/MM/yyyy和yyyy/MM/dd ，其中MM、dd和yyyy分别代表月份、日期和年份。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### TimeFormat

```cangjie
TimeFormat
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

|类型|说明|
|:----|:----|
|String|设置时间和日期格式的数据项。|

## enum Display

```cangjie
public enum Display <: ToString {
    | FontScale
    | ScreenBrightnessStatus
    | AutoScreenBrightness
    | ScreenOffTimeout
    | DefaultScreenRotation
    | AnimatorDurationScale
    | TransitionAnimationScale
    | WindowAnimationScale
    | DisplayInversionStatus
    | ...
}
```

**功能：** 提供设置显示效果的数据项。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**父类型：**

- ToString

### AnimatorDurationScale

```cangjie
AnimatorDurationScale
```

**功能：** 动画持续时间的比例因子。这会影响所有此类动画的开始延迟和持续时间。值为0，表示动画将立即结束，默认值为1。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### AutoScreenBrightness

```cangjie
AutoScreenBrightness
```

**功能：** 启用屏幕的自动旋转时，此属性无效；不启用自动旋转时，以下值可用：值为0，表示屏幕旋转0度；值为1，表示屏幕旋转90度；值为2，表示屏幕旋转180度；值为3，表示屏幕旋转270度。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### DefaultScreenRotation

```cangjie
DefaultScreenRotation
```

**功能：** 启用屏幕的自动旋转时，此属性无效；不启用自动旋转时，以下值可用：值为0，表示屏幕旋转0度；值为1，表示屏幕旋转90度；值为2，表示屏幕旋转180度；值为3，表示屏幕旋转270度。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### DisplayInversionStatus

```cangjie
DisplayInversionStatus
```

**功能：** 是否启用显示颜色反转。值为1，表示启用显示颜色反转；值为0，表示不启用显示颜色反转。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### FontScale

```cangjie
FontScale
```

**功能：** 字体的比例因子，值为浮点数。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### ScreenBrightnessStatus

```cangjie
ScreenBrightnessStatus
```

**功能：** 屏幕亮度。该值的范围从0到255。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### ScreenOffTimeout

```cangjie
ScreenOffTimeout
```

**功能：** 设备在一段时间不活动后进入睡眠状态的等待时间（单位：ms）。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### TransitionAnimationScale

```cangjie
TransitionAnimationScale
```

**功能：** 过渡动画的比例因子。值为0，表示禁用过渡动画。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### WindowAnimationScale

```cangjie
WindowAnimationScale
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

|类型|说明|
|:----|:----|
|String|设置显示效果的数据项。|

## enum DomainName

```cangjie
public enum DomainName <: ToString {
    | DeviceShared
    | UserProperty
    | ...
}
```

**功能：** 提供查询的域名。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

**父类型：**

- ToString

### DeviceShared

```cangjie
DeviceShared
```

**功能：** 设备属性共享域。

**系统能力：** SystemCapability.Applications.Settings.Core

**起始版本：** 21

### UserProperty

```cangjie
UserProperty
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
