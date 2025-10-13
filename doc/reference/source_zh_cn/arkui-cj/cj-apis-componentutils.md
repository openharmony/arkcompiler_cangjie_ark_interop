# ohos.arkui.component_utils

提供获取组件绘制区域坐标和大小的能力。

## 导入模块

```cangjie
import ohos.component_utils.*
import kit.ArkUI.*
```

## class ComponentInfo

```cangjie
public class ComponentInfo {
    public var size: Size
    public var localOffset: Offset
    public var windowOffset: Offset
    public var screenOffset: Offset
    public var translate: TranslateResult
    public var scale: ScaleResult
    public var rotate: RotateResult
    public var transform: VArray<Float32, $16>
    public init(size: Size, localOffset: Offset, windowOffset: Offset, screenOffset: Offset, translate: TranslateResult,
        scale: ScaleResult, rotate: RotateResult, transform: VArray<Float32, $16>)
}
```

**功能：** 组件实例对象的坐标位置和大小等信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var localOffset

```cangjie
public var localOffset: Offset
```

**功能：** 设置组件相对于父组件信息。

**类型：** [Offset](#class-offset)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var rotate

```cangjie
public var rotate: RotateResult
```

**功能：**  设置组件旋转信息。

**类型：** [RotateResult](#class-rotateresult)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var scale

```cangjie
public var scale: ScaleResult
```

**功能：** 设置组件缩放信息。

**类型：** [ScaleResult](#class-scaleresult)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var screenOffset

```cangjie
public var screenOffset: Offset
```

**功能：** 设置组件相对于屏幕信息。

**类型：** [Offset](#class-offset)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var size

```cangjie
public var size: Size
```

**功能：** 设置组件大小。

**类型：** [Size](#class-size)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var transform

```cangjie
public var transform: VArray<Float32, $16>
```

**功能：** 设置仿射矩阵信息，根据入参创建的四阶矩阵对象。

**类型：** VArray\<Float32,$16>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var translate

```cangjie
public var translate: TranslateResult
```

**功能：** 设置组件平移信息。

**类型：** [TranslateResult](#class-translateresult)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var windowOffset

```cangjie
public var windowOffset: Offset
```

**功能：** 设置组件相对于窗口信息。

**类型：** [Offset](#class-offset)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Size, Offset, Offset, Offset, TranslateResult, ScaleResult, RotateResult, VArray\<Float32,$16>)

```cangjie
public init(size: Size, localOffset: Offset, windowOffset: Offset, screenOffset: Offset, translate: TranslateResult,
    scale: ScaleResult, rotate: RotateResult, transform: VArray<Float32, $16>)
```

**功能：** 构建一个ComponentInfo类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Size]|是|-|组件大小。|
|localOffset|[Offset](#class-offset)|是|-|组件相对于父组件信息。|
|windowOffset|[Offset](#class-offset)|是|-|组件相对于窗口信息。|
|screenOffset|[Offset](#class-offset)|是|-|组件相对于屏幕信息。|
|translate|[TranslateResult](#class-translateresult)|是|-|组件平移信息。|
|scale|[ScaleResult](#class-scaleresult)|是|-|组件缩放信息。|
|rotate|[RotateResult](#class-rotateresult)|是|-|组件旋转信息。|
|transform|VArray<Float32, $16>|是|-|仿射矩阵信息，根据入参创建的四阶矩阵对象。|

## class ComponentUtils

```cangjie
public class ComponentUtils {}
```

**功能：** 提供获取指定组件绘制区域坐标和大小。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func getRectangleById(String)

```cangjie
public static func getRectangleById(id: String): ComponentInfo
```

**功能：** 根据组件ID获取组件实例对象, 通过组件实例对象将获取的坐标位置和大小同步返回给开发者。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|String|是|-|指定组件id。|

**返回值：**

|类型|说明|
|:----|:----|
|[ComponentInfo](#class-componentinfo)|组件大小、位置、平移缩放旋转及仿射矩阵属性信息。|

## class Offset

```cangjie
public class Offset {
    public var x: Float32
    public var y: Float32
    public init(x: Float32, y: Float32)
}
```

**功能：** 坐标信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float32
```

**功能：** 设置x点坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float32
```

**功能：** 设置y点坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Float32, Float32)

```cangjie
public init(x: Float32, y: Float32)
```

**功能：** 构建一个Offset类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|是|-|x点坐标。<br>单位: px。|
|y|Float32|是|-|y点坐标。<br>单位: px。|

## class RotateResult

```cangjie
public class RotateResult {
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public var centerX: Float32
    public var centerY: Float32
    public var angle: Float32
    /**
     * Defines RotateResult Type.
     */
    public init(x: Float32, y: Float32, z: Float32, centerX: Float32, centerY: Float32, angle: Float32)
}
```

**功能：** 组件旋转信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var angle

```cangjie
public var angle: Float32
```

**功能：** 设置旋转角度。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerX

```cangjie
public var centerX: Float32
```

**功能：** 设置变换中心点x轴坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerY

```cangjie
public var centerY: Float32
```

**功能：** 设置变换中心点y轴坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float32
```

**功能：** 设置旋转轴向量x坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float32
```

**功能：** 设置旋转轴向量y坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var z

```cangjie
public var z: Float32
```

**功能：** 设置旋转轴向量z坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Float32, Float32, Float32, Float32, Float32, Float32)

```cangjie
/**
 * Defines RotateResult Type.
 */
public init(x: Float32, y: Float32, z: Float32, centerX: Float32, centerY: Float32, angle: Float32)
```

**功能：** 构建一个RotateResult类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|是|-|旋转轴向量x坐标。<br>单位: px。|
|y|Float32|是|-|旋转轴向量y坐标。<br>单位: px。|
|z|Float32|是|-|旋转轴向量z坐标。<br>单位: px。|
|centerX|Float32|是|-|变换中心点x轴坐标。<br>单位: px。|
|centerY|Float32|是|-|变换中心点y轴坐标。<br>单位: px。|
|angle|Float32|是|-|旋转角度。<br>单位: px。|

## class ScaleResult

```cangjie
public class ScaleResult {
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public var centerX: Float32
    public var centerY: Float32
    public init(x: Float32, y: Float32, z: Float32, centerX: Float32, centerY: Float32)
}
```

**功能：** 组件缩放信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerX

```cangjie
public var centerX: Float32
```

**功能：** 设置变换中心点x轴坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var centerY

```cangjie
public var centerY: Float32
```

**功能：** 设置变换中心点y轴坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float32
```

**功能：** 设置x轴缩放倍数。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float32
```

**功能：** 设置y轴缩放倍数。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var z

```cangjie
public var z: Float32
```

**功能：** 设置z轴缩放倍数。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Float32, Float32, Float32, Float32, Float32)

```cangjie
public init(x: Float32, y: Float32, z: Float32, centerX: Float32, centerY: Float32)
```

**功能：** 构建一个ScaleResult类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|是|-|x轴缩放倍数。<br>单位: px。|
|y|Float32|是|-|y轴缩放倍数。<br>单位: px。|
|z|Float32|是|-|z轴缩放倍数。<br>单位: px。|
|centerX|Float32|是|-|变换中心点x轴坐标。<br>单位: px|
|centerY|Float32|是|-|变换中心点y轴坐标。<br>单位: px|

## class Size

```cangjie
public class Size {
    public var width: Float32
    public var height: Float32
    public init(width: Float32, height: Float32)
}
```

**功能：** 设置组件大小。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var height

```cangjie
public var height: Float32
```

**功能：** 设置组件高度。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var width

```cangjie
public var width: Float32
```

**功能：** 设置组件宽度。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Float32, Float32)

```cangjie
public init(width: Float32, height: Float32)
```

**功能：** 构建一个Offset类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|Float32|是|-|组件宽度。<br>单位: px。|
|height|Float32|是|-|组件高度。<br>单位: px。|

## class TranslateResult

```cangjie
public class TranslateResult {
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public init(x: Float32, y: Float32, z: Float32)
}
```

**功能：** 组件平移信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float32
```

**功能：** 设置x轴平移距离。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float32
```

**功能：** 设置y轴平移距离。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var z

```cangjie
public var z: Float32
```

**功能：** 设置z轴平移距离。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Float32, Float32, Float32)

```cangjie
public init(x: Float32, y: Float32, z: Float32)
```

**功能：** 构建一个TranslateResult类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|是|-|x轴平移距离。<br>单位: px。|
|y|Float32|是|-|y轴平移距离。<br>单位: px。|
|z|Float32|是|-|z轴平移距离。<br>单位: px。|

**示例：**

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component_utils.ComponentUtils
import ohos.resource_manager.AppResource

@Entry
@Component
class EntryView {
    @State var message1: String = ""
    @State var message2: String = ""
    @State var message3: String = ""
    @State var x = 120
    @State var y = 10
    @State var z = 100
    func build() {
        Column {
            Image(@r(app.media.startIcon))
                .width(300)
                .height(100)
                .scale(x: 0.5, y: 0.5, z: 1.0)
                .translate(x: 20, y: 20, z: 20)
                .rotate(
                    x: 1.0,
                    y: 1.0,
                    z: 1.0,
                    centerX: 50,
                    centerY: 50,
                    angle: 300.0
                )
                .id("image")
            Button("getRectangleById").onClick ({
                evt =>
                let info = ComponentUtils.getRectangleById("image")
                message1 = info
                    .size
                    .width
                    .toString()
                message2 = info
                    .scale
                    .x
                    .toString()
                message3 = info
                    .rotate
                    .angle
                    .toString()
            })
            Text(this.message1 + this.message2 + this.message3)
                .margin(20)
                .width(300)
                .height(300)
                .borderWidth(2)
        }
    }
}
```

![componentutils](figures/componentutils.gif)
