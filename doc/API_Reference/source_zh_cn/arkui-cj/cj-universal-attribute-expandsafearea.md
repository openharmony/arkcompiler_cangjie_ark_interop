# 安全区域

安全区域是指页面的显示区域，默认不与系统设置的非安全区域比如状态栏、导航栏区域重叠，默认情况下开发者开发的界面都被布局在安全区域内。提供属性方法允许开发者设置组件绘制内容突破安全区域的限制，通过[expandSafeArea](./cj-universal-attribute-expandsafearea.md#func-expandsafeareaarraysafeareatype-arraysafeareaedge)属性支持组件不改变布局情况下扩展其绘制区域至安全区外，通过设置[setKeyboardAvoidMode](./cj-universal-attribute-expandsafearea.md#func-setkeyboardavoidmodevalue-keyboardavoidmode)来配置虚拟键盘弹出时页面的避让模式。页面中有标题栏等文字不希望和非安全区重叠时，建议对组件设置expandSafeArea属性达到沉浸式效果，也可以直接通过窗口接口[setWindowLayoutFullScreen](./cj-apis-window.md#)设置沉浸式。

> **说明：**
>
> 默认摄像头挖孔区域不为非安全区域，页面不避让挖孔。

```json5
"metadata": [

{
"name": "avoid_cutout",
"value": "true",
}
],
```

## func expandSafeArea(Array\<SafeAreaType>, Array\<SafeAreaEdge>)

```cangjie
public func expandSafeArea(types!: [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD], edges!: Array<SafeAreaEdge> =[SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END]): This
```

**功能：** 设置控制组件扩展其安全区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| types | Array\<[SafeAreaType](./cj-universal-attribute-expandsafearea.md#enum-safeareatype)>| 否 | [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD] | **命名参数。**  配置扩展安全区域的类型。<br> 未添加metadata配置项时，页面不避让挖孔, CUTOUT类型不生效。 |
| edges | Array\<[SafeAreaType](./cj-universal-attribute-expandsafearea.md#enum-safeareatype)> | 否 | [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END] | **命名参数。**  配置扩展安全区域的方向。<br>扩展至所有非安全区域。|

> **说明：**
>
> - 设置expandSafeArea属性进行组件绘制扩展时，建议组件尺寸不要设置固定宽高（百分比除外），当设置固定宽高时，扩展安全区域的方向只支持[SafeAreaEdge.TOP, SafeAreaEdge.START]，扩展后的组件尺寸保持不变。
> - 安全区域不会限制内部组件的布局和大小，不会裁剪内部组件。
> - 当父容器是滚动容器时，设置expandSafeArea属性不生效。
> - 设置expandSafeArea()时，不传参，走默认值处理；设置expandSafeArea([],[])时，相当于入参是空数组，此时设置expandSafeArea属性不生效。
> - 组件设置expandSafeArea之后生效的条件为：
> - 1.type为SafeAreaType.KEYBOARD时默认生效，组件不避让键盘。
> - 2.设置其他type，组件的边界与安全区域重合时组件能够延伸到安全区域下。例如：设备顶部状态栏高度100，那么组件在屏幕中的绝对位置需要为0 <= y <= 100。
> - 组件延伸到安全区域下，在安全区域处的事件，如点击事件等可能会被系统拦截，优先给状态栏等系统组件响应。
> - 滚动类容器内的组件不建议设置expandSafeArea属性，如果设置，需要按照组件嵌套关系，将当前节点到滚动类祖先容器间所有直接节点设置expandSafeArea属性，否则expandSafeArea属性在滚动后可能会失效，写法参考示例。
> - expandSafeArea属性仅作用于当前组件，不会向父组件或子组件传递，因此使用过程中，所有相关组件均需配置。
> - 在同时设置了expandSafeArea和position属性时，position属性会先生效，expandSafeArea属性会后生效。对于未设置position、offset等绘制属性的组件，如果组件边界没有和避让区重叠，设置expandSafeArea属性不生效，如弹窗和半模态组件。
> - 对于expandSafeArea属性无法生效的场景，若要将组件部署在避让区，需要手动调整组件的坐标。

## func setKeyboardAvoidMode(value: KeyboardAvoidMode)

```cangjie
public func setKeyboardAvoidMode(value: KeyboardAvoidMode): void
```

**功能：** 控制虚拟键盘抬起时页面的避让模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| value | [KeyboardAvoidMode](./cj-universal-attribute-expandsafearea.md#enum-keyboardavoidmode) | 是 | - | 配置虚拟键盘抬起时页面的避让模式。<br>初始值：KeyboardAvoidMode.OFFSET，键盘抬起时默认页面避让模式为上抬模式。 |

> **说明：**
>
> - KeyboardAvoidMode的RESIZE模式是压缩Page的大小，Page下设置百分比宽高的组件会跟随Page压缩，直接设置宽高的组件会按设置的固定大小布局。设置KeyboardAvoidMode的RESIZE模式时，expandSafeArea([SafeAreaType.KEYBOARD],[SafeAreaEdge.BOTTOM])不生效。
> - KeyboardAvoidMode.NONE配置Page不避让键盘，Page会被抬起的键盘遮盖。

## 基础类型定义

### enum KeyboardAvoidMode

```cangjie
public enum KeyboardAvoidMode {
    | OFFSET
    | RESIZE
    | OFFSET_WITH_CARET
    | RESIZE_WITH_CARET
    | NONE
}
```

**功能：** 弹窗是否在拉起软键盘时进行自动避让。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### OFFSET

```cangjie
OFFSET
```

**功能：** 上抬模式。

**起始版本：** 19

#### RESIZE

```cangjie
RESIZE
```

**功能：** 压缩模式。

**起始版本：** 19

#### OFFSET_WITH_CARET

```cangjie
OFFSET_WITH_CARET
```

**功能：** 上抬模式，输入框光标位置发生变化时候也会触发避让。

**起始版本：** 19

#### RESIZE_WITH_CARET

```cangjie
RESIZE_WITH_CARET
```

**功能：** 压缩模式，输入框光标位置发生变化时候也会触发避让。

**起始版本：** 19

#### NONE

```cangjie
NONE
```

**功能：** 不避让软键盘。

**起始版本：** 19

### enum SafeAreaType

```cangjie
public enum SafeAreaType {
    | SYSTEM
    | CUTOUT
    | KEYBOARD
}
```

**功能：** 扩展安全区域的枚举类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### SYSTEM

```cangjie
SYSTEM
```

**功能：** 系统默认非安全区域，包括状态栏、导航栏。

**起始版本：** 12

#### CUTOUT

```cangjie
CUTOUT
```

**功能：** 设备的非安全区域，例如刘海屏或挖孔屏区域。

**起始版本：** 12

#### KEYBOARD

```cangjie
KEYBOARD
```

**功能：** 软键盘区域。

**起始版本：** 12

### enum SafeAreaEdge

```cangjie
public enum SafeAreaEdge {
    | TOP
    | BOTTOM
    | START
    | END
}
```

**功能：** 扩展安全区域的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### TOP

```cangjie
TOP
```

**功能：** 上方区域。

**起始版本：** 12

#### BOTTOM

```cangjie
BOTTOM
```

**功能：** 下方区域。

**起始版本：** 12

#### START

```cangjie
START
```

**功能：** 前部区域。

**起始版本：** 12

#### END

```cangjie
END
```

**功能：** 尾部区域。

**起始版本：** 12

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    let controller: TextInputController = TextInputController()
    func build() {
        Stack() {
            Column()
                .height(100.percent).width(100.percent)
                .backgroundImage(src: @r(app.media.background)).backgroundImageSize(ImageSize.Cover)
                .expandSafeArea(types: [SafeAreaType.SYSTEM, SafeAreaType.KEYBOARD], edges: [SafeAreaEdge.BOTTOM])
            Column() {
                Button("Set caretPosition 1")
                    .onClick{
                        this.controller.caretPosition(1)
                    }
                TextInput(controller: this.controller)
                    .placeholderFont(size: 14.px)
                    .width(320).height(40).offset(x:0, y: 120)
                    .fontSize(14)
            }.width(100.percent).alignItems(HorizontalAlign.Center)
        }
    }
}
```

![uni_expand_safe_area](figures/uni-safe.jpg)
