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
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import kit.ArkUI.*

let animateOpt1 = AnimateParam(
    duration: 1200,
    iterations: 10,
    expectedFrameRateRange: ExpectedFrameRateRange( // 设置属性动画的帧率范围
        min: 0, // 设置帧率范围
        max: 120, // 设置帧率范围
        expected: 60 // 设置动画的期望帧率为60hz
    )
)

@Entry
@Component
class EntryView {
    @State
    var isAnimation: Bool = false
    @State
    var translateX1: Int64 = -100
    @State
    var translateX2: Int64 = -100
    @State
    var translateX3: Int64 = -100
    func build() {
        Column {
            Row {
                Text('30')
                    .fontWeight(FontWeight.Bold)
                    .fontSize(16)
                    .fontColor(Color.White)
                    .textAlign(TextAlign.Center)
                    .borderRadius(10)
                    .backgroundColor(0xF56C6C)
                    .width(80)
                    .height(80)
                    .translate(x: translateX1)
            }.height(20.percent)
            Row() {
                Text('40')
                    .fontWeight(FontWeight.Bold)
                    .fontSize(16)
                    .fontColor(Color.White)
                    .textAlign(TextAlign.Center)
                    .borderRadius(10)
                    .backgroundColor(0x2E8B57)
                    .width(80)
                    .height(80)
                    .translate(x: translateX2)
            }.height(20.percent)
            Row() {
                Text('60')
                    .fontWeight(FontWeight.Bold)
                    .fontSize(16)
                    .fontColor(Color.White)
                    .textAlign(TextAlign.Center)
                    .borderRadius(10)
                    .backgroundColor(0x008B8B)
                    .width(80)
                    .height(80)
                    .translate(x: translateX3)
                    .animationStart(animateOpt1)
            }.height(20.percent)
            Row() {
                Button('Start')
                    .id('PropertyAnimationStart')
                    .fontSize(14)
                    .fontWeight(FontWeight.W500)
                    .margin(bottom: 10, left: 5)
                    .fontColor(Color.White)
                    .onClick(
                        {
                            evt =>
                            this.isAnimation = !this.isAnimation
                            if (this.isAnimation) {
                                let translateX3 = 100
                            } else {
                                let translateX3 = -100
                            }
                            animateTo(
                                AnimateParam(
                                    duration: 1200,
                                    iterations: 10,
                                    playMode: PlayMode.AlternateReverse,
                                    expectedFrameRateRange: ExpectedFrameRateRange( // 设置属性动画的帧率范围
                                        min: 0, // 设置帧率范围
                                        max: 120, // 设置帧率范围
                                        expected: 40 // 设置动画的期望帧率为30hz
                                    )
                                ),
                                {
                                    => if (this.isAnimation) {
                                        let translateX3 = 100
                                    } else {
                                        let translateX3 = -100
                                    }
                                }
                            )
                        }
                    )
                    .width(40.percent)
                    .height(40)
                    .shadow(radius: 10.0, color: Color(0x909399), offsetX: 1.0, offsetY: 1.0)
            }
                .width(100.percent)
                .justifyContent(FlexAlign.Center)
                .shadow(radius: 10.0, color: Color(0x909399), offsetX: 1.0, offsetY: 1.0)
                .alignItems(VerticalAlign.Bottom)
                .layoutWeight(1)
        }
            .width(100.percent)
            .justifyContent(FlexAlign.Center)
            .shadow(radius: 10.0, color: Color(0x909399), offsetX: 1.0, offsetY: 1.0)
            .layoutWeight(1)
    }
}