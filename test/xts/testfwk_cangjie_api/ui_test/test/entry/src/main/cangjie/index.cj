/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.component.FontWeight
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*
import std.collection.ArrayList
import ohos.arkui.component.view.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.arkui.component.alert_dialog.AlertDialogParamWithConfirm
import ohos.arkui.component.text_input.TextInput
import ohos.arkui.component.common.Offset
import ohos.arkui.component.action_sheet.DismissDialogAction
import ohos.arkui.component.common.DialogAlignment
import ohos.resource.AppResource
import ohos.base.ResourceColor
import ohos.business_exception.BusinessException
import ohos.ui_test.WindowFilter
import ohos.ui_test.Driver


@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello Cangjie"
    private var _driver: ?Driver = None
    private prop driver: Driver {
        get() {
            match (_driver) {
                case Some(driver) => driver
                case None =>
                    let newDriver = Driver.create()
                    _driver = newDriver
                    newDriver
            }
        }
    }

    let arr: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    let scroller = Scroller()
    func build() {
        Row {
            Column {
                Button(message).onClick {
                    evt => Hilog.info(0, "", "cangjie", "Hello Cangjie")
                }.fontSize(40).height(80)
                Button("alert")
                    .id("id")
                    .onClick {
                        evt =>
                            try{
                                let filter = WindowFilter(active: true)
                                let window = driver.findWindow(filter).getOrThrow()
                                let bundleName = window.getBundleName()
                                Hilog.info(0u32, "", "cangjie  BundleName: ${bundleName}", "")
                            }catch (e: BusinessException) {
                                Hilog.error(0u32, "", "cangjie", "Error: ${e.message}")
                            }
                    Hilog.info(0u32, "", "cangjie", "dialog clicked")
//                        AlertDialog.show(
//                            AlertDialogParamWithConfirm(
//                                title: "title",
//                                subtitle: "subtitle",
//                                message: "xxx",
//                                autoCancel: true,
//                                alignment: DialogAlignment.Bottom,
//                                offset: Offset(1, 1),
//                                gridCount: 3,
//                                maskRect: Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
//                                showInSubWindow: true,
//                                isModal: true,
//                                backgroundColor: Color.Black,
//                                backgroundBlurStyle: BlurStyle.ComponentUltraThick,
//                                onWillDismiss: DismissDialogAction,
//                                cornerRadius: orderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
//                                bottomRight: 32.vp),
//                                transition: Option.None,
//                                width: 4,
//                                height: 5,
//                                borderWidth: 0,
//                                borderColor: EdgeColors(top: Color.Black, right: Color.Black, bottom: Color.Black, left: Color.Black),
//                                borderStyle: EdgeStyles(),
//                                textStyle: WordBreak.BreakAll,
//                                confirm: AlertDialogButtonOptions(value: "", action: {=>}),
//                                cancel: {
//                                    => Hilog.info(0u32, "", "cangjie", "Closed callbacks")
//                                }
//                            )
//                        )
                    }
                    .backgroundColor(0x317aff)
                    .width(400.px)
                    .height(150.px)
                Button("Hello Cangjie1")
                    .id("id1")
                    .onClick {evt => Hilog.info(0u32, "", "cangjie", "Hello Cangjie clicked")}
                    .width(400.px)
                    .height(150.px)
                TextInput(text: "cangjie")
                Text("ohos")
                Text("cangjie")
                Image(@r(app.media.startIcon))
                    .id("icon")
                    .width(110)
                    .height(110)
                    .border(width: 1.vp)
                    .borderStyle(BorderStyle.Dashed)

//                Stack(Alignment.End) {
//                    Scroll(this.scroller) {
//                        Flex(FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Start)) {
//                            ForEach(
//                                this.arr,
//                                itemGeneratorFunc: {
//                                    item: Int64, idx: Int64 => Row() {
//                                        Text(item.toString())
//                                            .width(90.percent)
//                                            .height(100)
//                                            .backgroundColor(0x3366CC)
//                                            .borderRadius(15)
//                                            .fontSize(16)
//                                            .textAlign(TextAlign.Center)
//                                            .margin(top: 5)
//                                    }
//                                }
//                            )
//                        }.margin(left: 52)
//                    }.scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)
//                    ScrollBar(this.scroller, ScrollBarDirection.Vertical, BarState.Auto) {
//                        Text("").width(30).height(100).borderRadius(10).backgroundColor(0xC0C0C0)
//                    }.width(30).backgroundColor(0xededed)
//                }
            }.width(100.percent)
        }.height(100.percent)
    }
}