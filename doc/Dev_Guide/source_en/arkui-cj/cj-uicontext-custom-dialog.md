# Global Custom Dialog Independent of UI Components (openCustomDialog)

Due to the numerous limitations of [CustomDialogController](../../../API_Reference/source_zh_cn/arkui-cj/cj-dialog-customdialog.md/#class-customdialogcontroller), which does not support dynamic creation or dynamic updates.

> **Note:**
>
> The dialog (openCustomDialog) provides two parameter-passing methods for creating custom dialogs:
>
> - openCustomDialog (with CustomDialogOptions parameter): Encapsulating content through CustomDialogOptions can decouple it from the UI interface, making calls more flexible and meeting developers' encapsulation needs. It offers greater flexibility, with completely customizable dialog styles, and allows dynamic updates of some dialog parameters using the updateCustomDialog method after the dialog is opened.
>
> - openCustomDialog (lambda expression form): Passing a lambda expression enables users to add callbacks or other component methods within openCustomDialog.

## Lifecycle

The dialog provides lifecycle functions to notify users of its lifecycle. The lifecycle triggers occur in the following sequence: onWillAppear -> onDidAppear -> onWillDisappear -> onDidDisappear.

| Name            | Type       | Description                       |
| :----------------- | :---------- | :-------------------------------- |
| onDidAppear    | () -> Unit  | Callback event when the dialog appears.    |
| onDidDisappear | () -> Unit  | Callback event when the dialog disappears.    |
| onWillAppear    | () -> Unit | Callback event before the dialog's display animation. |
| onWillDisappear | () -> Unit | Callback event before the dialog's exit animation. |

## Opening and Closing Custom Dialogs

> **Note:**
>
> For detailed variable definitions, refer to the [Complete Example](#complete-example).

- Create customdialog.

   Customdialog is used to define the content of the custom dialog.

    ```cangjie
    @Builder
    func CustomDialog() {
        Column() {
            Text("Hello").height(50.vp)
            Button("Close").onClick({
                => PromptAction.closeCustomDialog(customdialogId)
            })
        }.margin(10.vp)
    }
    ```

- Open a custom dialog.

   Dialogs opened by calling the openCustomDialog interface have content of type CustomDialogOptions, where this.CustomDialog represents the content of the custom dialog.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    var customdialogId: Int32 = 0

    @Entry
    @Component
    class EntryView {

        @Builder
        func CustomDialog() {
            Column() {
                Text("Hello Content").height(60.vp)
                Button("Close").onClick({
                    => PromptAction.closeCustomDialog(customdialogId)
                })
            }.margin(10.vp)
        }

        func build(){
            Button("open dialog and options")
                .margin(top: 50)
                .onClick(
                {
                    => PromptAction.openCustomDialog(
                        CustomDialogOptions(builder: bind(this.CustomDialog, this)),
                        {
                            id => customdialogId = id
                        }
                    )
                })
        }
    }
    ```

- Close the custom dialog.

   The closeCustomDialog interface requires passing the CustomDialogId corresponding to the dialog to be closed.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    var customdialogId: Int32 = 0

    @Entry
    @Component
    public class EntryView {
        @Builder
        func CustomDialog() {
            Column() {
                Text("Hello Content").height(60.vp)
                Button("Close").onClick({
                    => PromptAction.closeCustomDialog(customdialogId)
                })
            }.margin(10.vp)
        }
        func build() {
            Column() {
                Button("open dialog and update content")
                    .margin(top: 50)
                    .onClick(
                        {
                            => PromptAction.openCustomDialog(
                                CustomDialogOptions(builder: bind(this.CustomDialog, this)),
                                {
                                    id => customdialogId = id
                                }
                            )
                        })
            }
        }
    }
    ```

## Complete Example

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

var customdialogId: Int32 = 0

@Entry
@Component
public class EntryView {
    @Builder
    func CustomDialog() {
        Column() {
            Text("Hello ").height(70.vp)
            Button("Close").onClick({
                => PromptAction.closeCustomDialog(customdialogId)
            })
        }.margin(15.vp)
    }
    @Builder
    func CustomDialog1() {
        Column() {
            Text("Hello Content").height(60.vp)
            Button("Close").onClick({
                => PromptAction.closeCustomDialog(customdialogId)
            })
        }.margin(10.vp)
    }
    func build() {
        Flex(FlexParams(justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center)) {
            Column(){
            Button("open dialog and options")
                .margin(top: 50)
                .onClick(
                    {
                        => PromptAction.openCustomDialog(
                            CustomDialogOptions(builder: bind(this.CustomDialog, this)),
                            {
                                id => customdialogId = id
                            }
                        )
                    })
            Button("open dialog and content")
                .margin(top: 50)
                .onClick(
                    {
                        => PromptAction.openCustomDialog(
                            CustomDialogOptions(builder: bind(this.CustomDialog1, this)),
                            {
                                id => customdialogId = id
                            }
                        )
                    })
        }.width(100.percent).padding(top:5)}
    }
}

```

![UIContextPromptAction](figures/UIContextPromptAction.gif)