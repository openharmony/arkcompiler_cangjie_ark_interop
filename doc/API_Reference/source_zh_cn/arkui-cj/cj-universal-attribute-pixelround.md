# 组件级像素取整

组件级像素取整的目标是将像素取整功能作为组件的属性，从而在组件层面实现系统像素取整的开启或关闭功能。

## func pixelRound(PixelRoundPolicy)

```cangjie
public func pixelRound(value: PixelRoundPolicy): This
```

**功能：** 指定当前组件在指定方向上的像素取整对齐方式，某方向不设置时默认在该方向进行四舍五入取整。正常计算时，上下方向以及组件高度相对应，左右方向（镜像的起始方向称为左）以及宽度相对应。为方便描述将两组方向称为左上和右下。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value | [PixelRoundPolicy](#class-pixelroundpolicy) | 是 | \- | 指定当前组件边界取整策略。</br>**说明：** </br>该属性用于因浮点数绘制产生视觉异常的场景。取整结果不仅和组件的宽高有关，也与组件的位置有关。即使设置组件的宽高相同，由于以浮点数描述的组件位置不同，舍入后组件的最终宽高也可能不同。 |

> **说明：**
>
> - 计算当前组件左上角坐标：左上角相对父容器偏移量。
> - 计算当前组件右下角坐标：左上角相对于父容器偏移量 + 组件自身尺寸。
> - 重新计算当前组件尺寸：右下角坐标四舍五入取整 - 左上角坐标四舍五入取整。

## 基础类型定义

### class PixelRoundPolicy

```cangjie
public class PixelRoundPolicy {
    public PixelRoundPolicy (
        public let start!: ?PixelRoundCalcPolicy = None,
        public let top!: ?PixelRoundCalcPolicy = None,
        public let end!: ?PixelRoundCalcPolicy = None,
        public let bottom!: ?PixelRoundCalcPolicy = None
    )
}
```

**功能：** 指定组件级像素取整的方向。

**起始版本：** 19

#### let start

```cangjie
public let start: ?PixelRoundCalcPolicy = None
```

**功能：** 组件前部边界取整对齐方式。

**类型：** ?[PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy)

**读写能力：** 可读

**起始版本：** 19

#### let top

```cangjie
public let top: ?PixelRoundCalcPolicy = None
```

**功能：** 组件上部边界取整对齐方式。

**类型：** ?[PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy)

**读写能力：** 可读

**起始版本：** 19

#### let end

```cangjie
public let top: ?PixelRoundCalcPolicy = None
```

**功能：** 组件尾部边界取整对齐方式。

**类型：** ?[PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy)

**读写能力：** 可读

**起始版本：** 19

#### let bottom

```cangjie
public let top: ?PixelRoundCalcPolicy = None
```

**功能：** 组件底部边界取整对齐方式。

**类型：** ?[PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy)

**读写能力：** 可读

**起始版本：** 19

### PixelRoundPolicy(PixelRoundCalcPolicy, PixelRoundCalcPolicy, PixelRoundCalcPolicy, PixelRoundCalcPolicy)

**功能：** 构造一个PixelRoundPolicy对象。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| start | [PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy) | 否 | None | 组件前部边界取整对齐方式。 |
| top | [PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy) | 否 | None | 组件上部边界取整对齐方式。 |
| end | [PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy) | 否 | None | 组件尾部边界取整对齐方式。 |
| bottom | [PixelRoundCalcPolicy](./cj-common-types.md#enum-pixelroundcalcpolicy) | 否 |None | 组件底部边界取整对齐方式。 |

## 示例代码

当父组件出现1.px的缝隙时，应利用pixelRound来指导布局调整。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var curWidth: Float64 = 301.2

    func build() {
        Column() {
            Button(){
                Text("${this.curWidth}")
            }
            .onClick({ =>
                this.curWidth += 0.1
            })
            .height(200)
            .width(200)
            .backgroundColor(0xFFD5D5D5)

            Blank().height(20)

            Row() {
                Row() {
                }
                .width(100.percent)
                .height(100.percent)
                .backgroundColor(0xFFBF00)
                .pixelRound(PixelRoundPolicy(
                    start : PixelRoundCalcPolicy.NO_FORCE_ROUND,
                    end : PixelRoundCalcPolicy.NO_FORCE_ROUND
                ))
            }
            .width(this.curWidth.px)
            .height(300.6.px)
            .backgroundColor(0xff0000)
            .pixelRound(PixelRoundPolicy(
                start: PixelRoundCalcPolicy.NO_FORCE_ROUND,
                end: PixelRoundCalcPolicy.NO_FORCE_ROUND
            ))
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xffe5e5e5)
    }
}
```

> **说明：**
>
> 在本示例中，当取消像素取整功能（即不设置父子组件上的pixelRound属性）后，初始状态表现为正常。用户可通过点击按钮来增加父组件的宽度，当前示例父组件宽度为301.2px，以此测试在不同宽度下的表现差异。测试中会发现，当父组件达到特定宽度时，右侧会出现1px的显示。同样地，适当调整示例代码后，也可进行上下方向的测试，以观察类似现象。

**图1** 采用pixelRound指导布局效果图

![uni_pixelRound](figures/pixelround1.png)

**图2** 不用pixelRound指导布局效果图

![uni_pixelRound](figures/pixelround2.png)
