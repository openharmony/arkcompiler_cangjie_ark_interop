# Z 序控制

组件的Z序，设置组件的堆叠顺序。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func zIndex(Int32)

```cangjie
public func zIndex(value: Int32): This
```

**功能：** 设置组件的Z轴层级。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|同一容器中兄弟组件显示层级关系。zIndex值越大，显示层级越高，即zIndex值大的组件会覆盖在zIndex值小的组件上方。初始值：0。|
