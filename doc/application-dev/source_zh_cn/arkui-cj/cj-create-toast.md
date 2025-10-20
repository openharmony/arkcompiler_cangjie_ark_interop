# 即时反馈（Toast）

即时反馈（Toast）是一种临时性的消息提示框，用于向用户显示简短的操作反馈或状态信息。​它通常在屏幕的底部或顶部短暂弹出，随后在一段时间后自动消失。即时反馈的主要目的是提供简洁、不打扰的信息反馈，避免干扰用户当前的操作流程。

## 使用建议

- 合理使用弹出场景，而不是频繁的提醒用户。

    可以针对以下常用场景使用即时反馈操作。例如，当用户执行某个操作时及时结果反馈，用来提示用户操作是否成功或失败；或是当应用程序的状态发生变化时提供状态更新等。

- 注意文本的信息密度，即时反馈展示时间有限，应当避免长文本的出现。

   Toast控件的文本应该清晰可读，字体大小和颜色应该与应用程序的主题相符。除此之外，即时反馈控件本身不应该包含任何可交互的元素，如按钮或链接。

- 杜绝强制占位和密集弹出的提示。

   即时反馈作为应用内的轻量通知，应当避免内容布局占用界面内的其他元素信息，如遮盖弹出框的展示内容，从而迷惑用户弹出的内容是否属于弹出框。再或者频繁性的弹出信息内容，且每次弹出之间无时间间隔，影响用户的正常使用。也不要在短时间内频繁弹出新的即时反馈替代上一个。即时反馈的单次显示时长不要超过 3 秒钟，避免影响用户正常的行为操作。

- 遵从系统默认弹出位置。

   即时反馈在系统中默认从界面底部弹出，距离底部有一定的安全间距，作为系统性的应用内提示反馈，请遵守系统默认效果，避免与其他弹出类组件内容重叠。特殊场景下可对内容布局进行规避。

## 即时反馈模式对比

即时反馈提供了两种显示模式，分别为DEFAULT（显示在应用内）、TOP\_MOST（显示在应用之上）。

在TOP_MOST类型的Toast显示前，会创建一个全屏大小的子窗（终端上子窗大小和主窗大小一致），然后在该子窗上计算Toast的布局位置，最后显示在该子窗上。具体和DEFAULT模式Toast的差异如下：

| 差异点| DEFAULT | TOP_MOST |
| :--- | :--- | :--- |
| 是否创建子窗 | 否 | 是 |
| 层级 | 显示在主窗内，层级和主窗一致，一般比较低 | 显示在子窗中，一般比主窗层级高，比其他弹窗类组件层级高，比软键盘和权限弹窗层级低。 |
| 是否避让软键盘 | 软键盘抬起时，必定上移软键盘的高度。 | 软键盘抬起时，只有toast被遮挡时，才会避让，且避让后toast底部距离软键盘高度为80.vp。 |

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.ui_context.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView{
    func build(){
        Row(){
            Blank().height(20.percent)
            Button(){
                Text("DEFAULT类型Toast")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)

            }.onClick({
                evt =>
                getUIContext().getPromptAction().showToast(
                        ShowToastOptions(message: "ok，我是DEFAULT toast", duration: 2000,
                        bottom: 80.vp, showMode: ToastShowMode.Default))
            }).align(Alignment.Center)

            Button(){
                Text("TOPMOST类型Toast")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
            }.onClick({
                evt =>
                getUIContext().getPromptAction().showToast(
                        ShowToastOptions(message: "ok，我是TOP_MOST toast", duration: 2000,
                        bottom: 85.vp, showMode: ToastShowMode.TopMost))
            })
        }
    }
}
```

![creattoast](./figures/creattoast.gif)

## 创建即时反馈

适用于短时间内提示框自动消失的场景。

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.ui_context.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView{

    func build(){
        Column(){
            Button("Show toast").fontSize(20)
            .onClick({
                    evt=>
                    getUIContext().getPromptAction().showToast(message: "Hello Word")
            })
        }.size(width: 100.percent,height: 100.percent).justifyContent(FlexAlign.Center)
    }
}
```

![image](figures/UIToast1.gif)
