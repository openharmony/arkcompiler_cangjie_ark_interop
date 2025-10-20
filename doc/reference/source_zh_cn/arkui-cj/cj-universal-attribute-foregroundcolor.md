# 前景色设置

设置组件的前景色。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func foregroundColor(?ColoringStrategy)

```cangjie
public func foregroundColor(value: ?ColoringStrategy): T
```

**功能：** 设置组件的前景色。当组件未设置前景色，默认继承父组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?ColoringStrategy|是|-|设置组件的前景颜色或者根据智能取色策略设置前景颜色。不支持属性动画。 <br/>初始值：Color.Transparent。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回当前组件。|



## func foregroundColor(?ResourceColor)

```cangjie
public func foregroundColor(value: ?ResourceColor): T
```

**功能：** 设置组件的前景色。当组件未设置前景色，默认继承父组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?ResourceColor|是|-|设置组件的前景颜色或者根据智能取色策略设置前景颜色。不支持属性动画。 <br/>初始值：Color.Transparent。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回当前组件。|


## 示例代码

### 示例1（使用前景色设置）

该示例主要演示通过foregroundColor设置前置景色。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(100) {
            Button("GREEN")
                .width(50.percent)
                .height(80)
                .fontSize(20)
                .foregroundColor(Color.GREEN)
            Button("RED")
                .width(50.percent)
                .height(80)
                .fontSize(20)
                .foregroundColor(Color.RED)
            }
            .width(100.percent)
        }
}
```

![foregroundColor1](figures/foregroundColor1.png)

### 示例2（设置前景色为组件背景色反色）

该示例通过INVERT将前置景色设置为背景色反色。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(100) {
            Button("NO INVERT")
                .width(100.percent)
                .height(80)
                .fontSize(20)
                .backgroundColor(Color.BLUE)
            Button("INVERT")
                .width(100.percent)
                .height(80)
                .fontSize(20)
                .backgroundColor(Color.BLUE)
                .foregroundColor(INVERT)
            }
            .width(100.percent)
        }
}
```

![foregroundColor2](figures/foregroundColor2.png)

### 示例3（前置景色未继承父组件）

该示例主要演示组件同时设置前置景色和背景色与只设置背景色的效果对比。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(100) {
            Button("设置前景色为蓝色")
                .width(100.percent)
                .height(80)
                .fontSize(20)
                .backgroundColor(Color.GRAY)
                .foregroundColor(Color.BLUE)

            Button("未设置前景色继承自父组件")
                .width(100.percent)
                .height(80).fontSize(20)
                .backgroundColor(Color.GRAY)
            }
            .width(100.percent)
        }
}
```

![foregroundColor3](figures/foregroundColor3.png)