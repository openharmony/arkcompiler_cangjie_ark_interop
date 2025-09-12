# ohos.arkui.component.recycle

组件回收接口，仅供UI框架使用。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class __Recycle__

```cangjie
public class __Recycle__ <: ContainerBase {
    public init()
    public init(child: () -> Unit)
}
```

**功能：** 待回收组件，UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ContainerBase](./cj-ui-framework.md#class-containerbase)

### init()

```cangjie
public init()
```

**功能：** 初始化待回收组件，UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**功能：** 从子组件初始化待回收组件，UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|child|()->Unit|是|-|待回收子组件。|

### func pop()

```cangjie
public override func pop()
```

**功能：** 回收该组件，UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21
