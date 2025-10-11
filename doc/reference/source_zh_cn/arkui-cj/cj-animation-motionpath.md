# 路径动画 (motionPath)

设置组件进行位移动画时的运动路径。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class MotionPathOptions

```cangjie
public class MotionPathOptions {
    public var path: String
    public var from: Float64 = 0.0
    public var to: Float64 = 1.0
    public var rotatable: Bool = false
    public init(
        path!: String,
        from!: Float64 = 0.0,
        to!: Float64 = 1.0,
        rotatable!: Bool = false
    )
}
```

**功能：** 设置动画路径选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var from

```cangjie
public var from: Float64 = 0.0
```

**功能：** 设置动画路径的起始位置。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var path

```cangjie
public var path: String
```

**功能：** 设置动画路径。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var rotatable

```cangjie
public var rotatable: Bool = false
```

**功能：** 设置动画路径是否可旋转。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var to

```cangjie
public var to: Float64 = 1.0
```

**功能：** 设置动画路径的结束位置。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(String, Float64, Float64, Bool)

```cangjie
public init(
    path!: String,
    from!: Float64 = 0.0,
    to!: Float64 = 1.0,
    rotatable!: Bool = false
)
```

**功能：** 构造一个MotionPathOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|设置动画路径。|
|from|Float64|否|0.0|设置动画路径的起始位置。|
|to|Float64|否|1.0|设置动画路径的结束位置。|
|rotatable|Bool|否|false|设置动画路径是否可旋转。|
