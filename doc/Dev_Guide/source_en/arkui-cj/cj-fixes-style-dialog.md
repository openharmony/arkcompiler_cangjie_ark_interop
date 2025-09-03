# Fixed-Style Popup Dialogs  

Fixed-style popup dialogs adopt a standardized layout format, allowing developers to focus solely on inputting the desired text content without concerning themselves with display layout details. This simplifies the usage process and enhances convenience.  

## Usage Constraints  

- **Action Menu (showActionMenu)** and **Dialog (showDialog)** require obtaining a `PromptAction` object via the `PromptAction` method before invoking the corresponding methods.  

- **Action Menu (showActionMenu)**, **Dialog (showDialog)**, **List Selection Popup (ActionSheet)**, and **Alert Dialog (AlertDialog)** can be configured with `isModal: false` to become non-modal popups.  

## Action Menu (showActionMenu)  

The action menu is obtained via the `PromptAction` method to acquire a `PromptAction` object, supporting usage in callbacks or developer-defined classes.  

After creating and displaying the action menu, the response result asynchronously returns the index of the selected button in the `buttons` array.  

<!-- run -->  

```cangjie  
// xxx.cj  
package ohos_app_cangjie_entry  

import ohos.base.*  
import ohos.component.*  
import ohos.state_manage.*  
import ohos.arkui.state_macro_manage.*  
import std.collection.*  
import ohos.prompt_action.ButtonInfo  
import ohos.prompt_action.PromptAction  

@Entry  
@Component  
class EntryView {  
    @State var index1: Int32 = 0  
    func build() {  
         Column {  
            Button("showActionMenu").onClick(  
                {  
                    evt =>  
                    let buttons: Array<ButtonInfo> = [ButtonInfo("item1", Color.GRAY), ButtonInfo("item2", Color.BLACK)]  
                    PromptAction.showActionMenu(title: "showActionMenu Title Info", buttons: buttons,  
                        callback: {  
                            err: Option<AsyncError>, i: Option<Int32> => try {  
                                match (err) {  
                                    case Some(e) => AppLog.error("error: errcode is ${e.code}")  
                                    case _ => index1 = i.getOrThrow()  
                                }  
                            } catch (e: Exception) {  
                                AppLog.error(e.toString())  
                            }  
                        })  
                }  
            )  
        }.width(100.percent).padding(top: 5)  
    }  
}  
```  

![image](figures/UIContextShowMenu.gif)  

## Dialog (showDialog)  

The dialog is obtained via the `PromptAction` method to acquire a `PromptAction` object, supporting usage in callbacks or developer-defined classes.  

After creating and displaying the dialog, the response asynchronously returns the index of the selected button in the `buttons` array.  

<!-- run -->  

```cangjie  
// xxx.cj  
package ohos_app_cangjie_entry  

import ohos.base.*  
import ohos.component.*  
import ohos.state_manage.*  
import ohos.arkui.state_macro_manage.*  
import std.collection.*  
import ohos.prompt_action.ButtonInfo  
import ohos.prompt_action.PromptAction  

@Entry  
@Component  
class EntryView {  
    @State var index0: Int32 = 0  
    func build() {  
        Column {  
            Button("showDialog").onClick(  
                {  
                    evt =>  
                    let buttons: Array<ButtonInfo> = [  
                        ButtonInfo("button1", Color.BLACK),  
                        ButtonInfo("button2", Color.BLACK)]  
                    PromptAction.showDialog(title: "showDialog Title Info", message: "Message Info", buttons: buttons,  
                        callback: {  
                            err: Option<AsyncError>, i: Option<Int32> => try {  
                                match (err) {  
                                    case Some(e) => AppLog.error("error: errcode is ${e.code}")  
                                    case _ => index0 = i.getOrThrow()  
                                }  
                            } catch (e: Exception) {  
                                AppLog.error(e.toString())  
                            }  
                        })  
                }  
            )  
        }.width(100.percent).padding(top: 5)  
    }  
}  
```  

![image](figures/UIShowDialog.gif)  

## Picker Dialog (PickerDialog)  

The picker dialog is typically used to display specific information or options when users perform certain actions (e.g., clicking a button).  

### Lifecycle  

The dialog provides lifecycle functions to notify users of its lifecycle.  
The triggering sequence of lifecycle events can be found in the API reference for each component.  

| Name               | Type          | Description                          |  
| :----------------- | :------------ | :----------------------------------- |  
| onDidAppear       | () -> Unit    | Callback triggered when the dialog appears. |  
| onDidDisappear    | () -> Unit    | Callback triggered when the dialog disappears. |  
| onWillAppear      | () -> Unit    | Callback triggered before the dialog's display animation. |  
| onWillDisappear   | () -> Unit    | Callback triggered before the dialog's exit animation. |  

### Calendar Picker Dialog (CalendarPickerDialog)  

The calendar picker dialog provides a calendar view, including year, month, and weekday information. Developers can invoke the `show` function to define and display the calendar picker dialog.  

Custom button styles can be achieved by configuring `acceptButtonStyle` and `cancelButtonStyle`.  

<!-- run -->  

```cangjie  
// xxx.cj  
package ohos_app_cangjie_entry  

import ohos.base.*  
import ohos.component.*  
import ohos.state_manage.*  
import ohos.arkui.state_macro_manage.*  
import std.collection.*  
import std.time.DateTime  
import kit.PerformanceAnalysisKit.Hilog  

@Entry  
@Component  
class EntryView {  
    @State  
    var selectedDate: DateTime = DateTime.now()  
    func build() {  
        Row {  
            Column {  
                Button("Show CalendarPicker Dialog").onClick {  
                    Hilog.info(0, "AppLogCj", "CalendarDialog.show")  
                    let acceptButtonStyle = PickerDialogButtonStyle(  
                        fontColor: Color.BLUE,  
                        fontSize: 16.fp,  
                        fontStyle: FontStyle.Normal,  
                        fontFamily: "sans-serif",  
                        backgroundColor: Color.WHITE,  
                        borderRadius: BorderRadiuses(topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10)  
                    )  

                    let cancelButtonStyle = PickerDialogButtonStyle(  
                        fontColor: Color.RED,  
                        fontSize: 16.fp,  
                        fontStyle: FontStyle.Normal,  
                        fontFamily: "sans-serif",  
                        backgroundColor: Color.WHITE,  
                        borderRadius: BorderRadiuses(topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10)  
                    )  
                    CalendarPickerDialog.show(  
                        options: CalendarDialogOptions(  
                            selected: selectedDate,  
                            acceptButtonStyle: acceptButtonStyle,  
                            cancelButtonStyle: cancelButtonStyle,  
                            onAccept: {  
                                value => Hilog.info(0, "AppLogCj",  
                                    "calendar onAccept: ${value.year}-${value.monthValue}-${value.dayOfMonth}")  
                            },  
                            onCancel: {=> Hilog.info(0, "AppLogCj", "calendar onCancel")},  
                            onChange: {  
                                value => Hilog.info(0, "AppLogCj",  
                                    "calendar onChange: ${value.year}-${value.monthValue}-${value.dayOfMonth}")  
                            },  
                            onDidAppear: {=> Hilog.info(0, "AppLogCj", "calendar onDidAppear")},  
                            onDidDisappear: {=> Hilog.info(0, "AppLogCj", "calendar onDidDisappear")},  
                            onWillAppear: {=> Hilog.info(0, "AppLogCj", "calendar onWillAppear")},  
                            onWillDisappear: {=> Hilog.info(0, "AppLogCj", "calendar onWillDisappear")},  
                            shadow: ShadowOptions(radius: 20.0, color: Color.GRAY, offsetX: 50.0, offsetY: 10.0)  
                        )  
                    )  
                }  
            }.width(100.percent).padding(top: 5)  
        }  
    }  
}  
```  

![image](figures/UIContextShowCalendarpickerDialog.gif)  

### Date Slider Picker Dialog (DatePickerDialog)  

Developers can create a date slider picker dialog based on a specified date range, clearly displaying date information in a popup window.  

When `lunarSwitch` and `showTime` are set to `true`, the dialog displays a lunar calendar toggle switch and time. When the checkbox is selected, the lunar calendar is shown. Upon pressing the confirm button, the dialog returns the currently selected date via `onDateAccept`. To ensure the dialog displays the last confirmed date upon reappearing, reassign `selectTime` in the callback.  

<!-- run -->  

```cangjie  
package ohos_app_cangjie_entry  
import kit.ArkUI.*  
import ohos.arkui.state_macro_manage.*  
import std.time.*  
import ohos.hilog.*  

@Entry  
@Component  
class EntryView {  
    @State  
    var selectedDate: DateTime = DateTime.of(year: 2023, month: Month.of(1), dayOfMonth: 1)  
    func build() {  
        Column {  
            Button("DatePickerDialog")  
                .margin(20)  
                .onClick {  
                    Hilog.info(0, "AppLogCj", "DatePickerDialog.show")  
                    DatePickerDialog.show(  
                        options: DatePickerDialogOptions(  
                            start: DateTime.of(year: 2000, month: Month.of(1), dayOfMonth: 1),  
                            end: DateTime.of(year: 2100, month: Month.of(12), dayOfMonth: 31),  
                            selected: this.selectedDate,  
                            showTime: true,  
                            lunarSwitch: true,  
                            useMilitaryTime: false,  
                            disappearTextStyle: PickerTextStyle(Color.PINK, MyFont(size: 22.fp, weight: FontWeight.Bold)),  
                            textStyle: PickerTextStyle(0xff00ff00, MyFont(size: 18.fp, weight: FontWeight.Normal)),  
                            selectedTextStyle: PickerTextStyle(0xff182431, MyFont(size: 14.fp, weight: FontWeight.Regular)),  
                            onDateAccept: {  
                                value => Hilog.info(0, "AppLogCj",  
                                    "DatePickerDialog:onDateAccept(): ${value.year}-${value.monthValue}-${value.dayOfMonth}")  
                            },  
                            onCancel: {=> Hilog.info(0, "AppLogCj", "DatePickerDialog:onCancel()")},  
                            onDateChange: {  
                                value => Hilog.info(0, "AppLogCj",  
                                    "DatePickerDialog:onDateChange(): ${value.year}-${value.monthValue}-${value.dayOfMonth}")  
                            },  
                            onDidAppear: {=> Hilog.info(0, "AppLogCj", "DatePickerDialog:onDidAppear()")},  
                            onDidDisappear: {=> Hilog.info(0, "AppLogCj", "DatePickerDialog:onDidDisappear()")},  
                            onWillAppear: {=> Hilog.info(0, "AppLogCj", "DatePickerDialog:onWillAppear()")},  
                            onWillDisappear: {=> Hilog.info(0, "AppLogCj", "DatePickerDialog:onWillDisappear()")}  
                        )  
                    )  
                }  
        }.width(100.percent)  
    }  
}  
```  

![datapickerdialog](./figures/datapickerdialog.gif)  

## List Selection Popup (ActionSheet)  

The list selection popup is suitable for presenting multiple action options, especially when only an action list needs to be displayed without additional content.  

The list selection popup is implemented via the [show](../../../API_Reference/source_zh_cn/arkui-cj/cj-dialog-actionsheet.md#static-func-showactionsheetoptions) interface in `ActionSheet`.  

This example defines the popup's style and animation effects by configuring `width`, `height`, and `transition` interfaces.  

<!-- run -->  

```cangjie  
// xxx.cj  
package ohos_app_cangjie_entry  

import ohos.base.*  
import ohos.component.*  
import ohos.state_manage.*  
import ohos.arkui.state_macro_manage.*  
import std.collection.*  

@Entry  
@Component  
class EntryView {  
    func build() {  
        Column() {  
            Button('showActionSheet').onClick {  
                let confirm: Confirm = Confirm("Confirm button", {=> AppLog.info("Get Alert Dialog handled")},  
                    defaultFocus: true, style: DialogButtonStyle.DEFAULT)  
                let sheets: Array<SheetInfo> = [  
                    SheetInfo("apple", {=> AppLog.info("apple")}),  
                    SheetInfo("banana", {=> AppLog.info("banana")}),  
                    SheetInfo("pears", {=> AppLog.info("pears")})]
                ActionSheet.show(
                    ActionSheetOptions(
                        'ActionSheet title',
                        'message',
                        sheets,
                        autoCancel: false,
                        confirm: confirm,
                        width: 300,
                        height: 300,
                        cornerRadius: BorderRadiuses(topLeft: 20.vp, topRight: 20.vp, bottomLeft: 20.vp,
                            bottomRight: 20.vp),
                        borderWidth: 1.vp,
                        borderStyle: EdgeStyle.SOLID,
                        borderColor: Color.BLUE,
                        backgroundColor: Color.WHITE,
                        transition: TransitionEffect.asymmetric(
                            TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 3000, curve: Curve.Sharp))
                                .combine(
                                    TransitionEffect
                                        .scale(ScaleOptions(x: 1.5, y: 1.5))
                                        .animation(AnimateParam(duration: 3000, curve: Curve.Sharp))),
                            TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 100, curve: Curve.Smooth))
                                .combine(
                                    TransitionEffect
                                        .scale(ScaleOptions(x: 0.5, y: 0.5))
                                        .animation(AnimateParam(duration: 100, curve: Curve.Smooth)))
                        ),
                        alignment: DialogAlignment.Center,
                    )
                )
            }
        }.width(100.percent).margin(top: 5)
    }
}
```

![image](figures/UIContextShowactionSheet.gif)

## Alert Dialog

Use alert dialogs when you need to prompt users or obtain their consent.

- Alert dialogs display critical information but interrupt current tasks. Provide only essential information and actionable options.
- Avoid using alert dialogs solely for information display. Users dislike being interrupted by non-actionable alerts with excessive information.

This example demonstrates a multi-button dialog style with custom width, height, and transition effects through configuration interfaces.

 <!-- run -->

```cangjie
// xxx.cj
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Button('showAlertDialog')
                .onClick {
                    let primaryButton = AlertDialogButtonOptions(
                        value: 'cancel',
                        action: {
                            => AppLog.info('Callback when the first button is clicked')
                        }
                    )
                    let secondaryButton = AlertDialogButtonOptions(
                        enabled: true,
                        defaultFocus: true,
                        style: DialogButtonStyle.HIGHLIGHT,
                        value: 'ok',
                        action: {
                            => AppLog.info('Callback when the second button is clicked')
                        }
                    )
                    AlertDialog.show(
                        AlertDialogParamWithButtons(
                            'text',
                            title: 'title',
                            autoCancel: true,
                            alignment: DialogAlignment.Center,
                            offset: Offset(0.0, -20.0),
                            gridCount: 3,
                            transition: TransitionEffect.asymmetric(
                                TransitionEffect
                                    .OPACITY
                                    .animation(AnimateParam(duration: 3000, curve: Curve.Sharp))
                                    .combine(TransitionEffect.scale(ScaleOptions(x: 1.5, y: 1.5)))
                                    .animation(AnimateParam(duration: 3000, curve: Curve.Sharp)),
                                TransitionEffect
                                    .OPACITY
                                    .animation(AnimateParam(duration: 100, curve: Curve.Smooth))
                                    .combine(
                                        TransitionEffect
                                            .scale(ScaleOptions(x: 0.5, y: 0.5))
                                            .animation(AnimateParam(duration: 100, curve: Curve.Smooth)))
                            ),
                            primaryButton: primaryButton,
                            secondaryButton: secondaryButton
                        )
                    )
                }.width(100.percent).margin(top: 5)
        }
    }
}
```

![image](figures/UIContextShowAlertDialog.gif)
