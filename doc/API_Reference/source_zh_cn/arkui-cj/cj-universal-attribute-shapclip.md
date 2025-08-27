# 形状裁剪

用于对组件进行裁剪、遮罩处理。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func clip(Bool)

```cangjie
public func clip(value: Bool): This
```

**功能：** 设置组件是否裁剪超出边界的内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否裁剪。|

## func clipShape(BaseShape)

```cangjie
public func clipShape(value: BaseShape): This
```

**功能：** 设置组件的裁剪形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BaseShape](#)|是|-|裁剪形状。|

## func maskShape(BaseShape)

```cangjie
public func maskShape(value: BaseShape): This
```

**功能：** 为组件上添加指定形状的遮罩。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BaseShape](<font color="red" face="bold">please add link</font>)|是|-|在当前组件上加上指定形状的遮罩。|

