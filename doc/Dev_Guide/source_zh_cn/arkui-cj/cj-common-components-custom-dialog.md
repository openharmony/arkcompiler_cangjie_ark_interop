# 基础自定义弹出框 (CustomDialog)(不推荐)

CustomDialog是自定义弹出框，可用于广告、中奖、警告、软件更新等与用户交互响应操作。开发者可以通过CustomDialogController类显示自定义弹出框。具体用法请参见[自定义弹出框](../../../API_Reference/source_zh_cn/arkui-cj/cj-dialog-customdialog.md)。

> **说明：**
>
> ArkUI弹出框默认为非页面级弹出框，在页面路由跳转时，如果开发者未调用close方法将其关闭，弹出框将不会自动关闭。若需实现在跳转页面时覆盖弹出框的场景，建议使用Navigation。具体使用方法，请参见[组件导航子页面显示类型的弹窗类型](./cj-navigation-navigation.md)。

弹出框（CustomDialog）可以通过配置[isModal](../../../API_Reference/source_zh_cn/arkui-cj/cj-dialog-customdialog.md#var-ismodal)来实现模态和非模态弹窗。isModal为true时，弹出框为模态弹窗。isModal为false时，弹出框为非模态弹窗。

## 创建自定义弹出框

1. 使用@CustomDialog宏装饰自定义弹出框，可在此宏内自定义弹出框内容。CustomDialogController需在@Component内定义。


    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @CustomDialog
    class MyDialog {
        var controller: Option<CustomDialogController> = Option.None
        func build() {
            Column() {
                Text("我是内容")
                    .fontSize(20)
            }.height(60).justifyContent(FlexAlign.Center)
        }
    }
    ```

2. 创建构造器，与宏呼应相连。点击与onClick事件绑定的组件使弹出框弹出。

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @CustomDialog
    class MyDialog {
        var controller: Option<CustomDialogController> = Option.None
        func build() {
            Column() {
                Text("我是内容")
                    .fontSize(20)
            }.height(60).justifyContent(FlexAlign.Center)
        }
    }

    @Entry
    @Component
    class EntryView {
        var dialogController: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(builder: MyDialog()))
        func build() {
            Column {
                Button("click me")
                    .onClick({evt =>
                        dialogController.`open`()
                    })
            }
        }
    }
    ```

    ![gouzao](figures/zidingyi.jpg)

## 弹出框的交互

弹出框可用于数据交互，完成用户一系列响应操作。

1. 在@CustomDialog宏内添加按钮，同时添加数据函数。


    ```cangjie
    @CustomDialog
    class MyDialog {
        var controller: Option<CustomDialogController> = Option.None
        func build() {

            Flex(FlexParams(justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center)) {
                Text("我是内容").fontSize(20)

                Button("cancel").onClick { evt =>
                    controller?.close()
                }
                Button("confirm").onClick { evt =>
                    controller?.close()
                }
            }.height(500.px)
        }
    }
    ```

2. 弹出框页面页面需要在构造器内进行接收，同时创建相应的函数操作。

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @CustomDialog
    class MyDialog {
        var controller: Option<CustomDialogController> = Option.None
        func build() {

            Flex(FlexParams(justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center)) {
                Text("我是内容").fontSize(20)

                Button("cancel").onClick { evt =>
                    controller?.close()
                }
                Button("confirm").onClick { evt =>
                    controller?.close()
                }
            }.height(500.px)
        }
    }

    @Entry
    @Component
    class EntryView {
        var dialogController: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(builder: MyDialog()))
        func build() {
            Column {
                Button("click me").onClick({evt =>
                    dialogController.`open`()
                })
            }
        }
    }
    ```

    ![dialog-interaction](figures/dialog-interaction.jpg)

## 弹出框的样式

弹出框通过定义宽度、高度、背景色、阴影等参数来控制样式。

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@CustomDialog
class MyDialog {
    var controller: Option<CustomDialogController> = Option.None
    func build() {
        Row(40) {
            Text("我是内容").fontSize(20).margin(top: 4, right: 4, bottom: 4, left: 4)
        }.height(500.px)
    }
}

@Entry
@Component
class EntryView {
    var dialogController: CustomDialogController =   CustomDialogController(CustomDialogControllerOptions(builder: MyDialog(),autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: Offset(0.vp, 0.vp),
    gridCount: 4,
    customStyle: false,
    backgroundColor: 0xd9ffffff,
    cornerRadius: 20,
    width: 120,
    height: 120,
    borderWidth: 1,
    borderStyle: EdgeStyle.SOILD, // 使用borderStyle属性，需要和borderWidth属性一起使用
    borderColor: Color.Blue, // 使用borderColor属性，需要和borderWidth属性一起使用
    shadow: Option<ShadowOptions>.None,
    ))
    func build() {
        Column {
            Button("click me").onClick({evt =>
                dialogController.`open`()
            })
        }
    }
}
```

![biankuangyangshi](figures/biankuangyangshi.jpg)

## 嵌套自定义弹出框

通过第一个弹出框打开第二个弹出框时，最好将第二个弹出框定义在第一个弹出框的父组件处，通过父组件传给第一个弹出框的回调来打开第二个弹出框。

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@CustomDialog
class CustomDialogExampleTwo {
    var controllerTwo: Option<CustomDialogController> = Option.None
    @State var message: String = "I'm the second dialog box."
    @State var showIf: Bool = false
    func build() {
        Column() {
            if (this.showIf) {
                Text("Text")
                    .fontSize(30)
                    .height(100)
            }
            Text(this.message)
                .fontSize(30)
                .height(100)
            Button("Create Text")
                .onClick({=>
                    this.showIf = true
                })
            Button("Close Second Dialog Box")
                .onClick({=>
                    if (let Some(v) <- this.controllerTwo) {
                        v.close()
                    }
                }).margin(20)
        }
    }
}

@CustomDialog
class MyDialog {
    var openSecondBox: ()->Unit
    var controller: Option<CustomDialogController> = Option.None
    func build() {
        Row(600) {
            Button ("Open Second Box")
                .onClick({=>
                    this.controller?.close()
                    this.openSecondBox()
                })
                .margin(20)
        }.borderRadius(10)
    }
}

@Entry
@Component
class EntryView {
    @State var inputValue: String = "Click Me"
    var dialogController: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: MyDialog(openSecondBox:{=>this.dialogControllerTwo.open()}),
            autoCancel: true,
            alignment: DialogAlignment.Bottom,
            offset: Offset(0, -20),
            gridCount: 4,
            customStyle: false
        )
    )
    var dialogControllerTwo: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: CustomDialogExampleTwo(),
            autoCancel: true,
            alignment: DialogAlignment.Bottom,
            offset: Offset(0, -25)
        )
    )

    func build() {
        Column() {
            Button(this.inputValue)
                .onClick({=>
                    this.dialogController.`open`()
                }).backgroundColor(0x317aff)
        }.width(100.percent).margin(top:20)
    }
}
```

![nestedcustomdailog](figures/nestedcustomdailog.gif)

由于自定义弹出框在状态管理侧有父子关系，如果将第二个弹出框定义在第一个弹出框内，那么当父组件（第一个弹出框）被销毁（关闭）时，子组件（第二个弹出框）内无法再继续创建新的组件。
