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
internal import ohos.arkui.state_manage.SubscriberManager
internal import ohos.arkui.state_manage.ObservedProperty
internal import ohos.arkui.state_manage.LocalStorage
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import kit.MediaKit.*
import kit.AbilityKit.*
import ohos.arkui.component.*
import kit.ImageKit.{PixelMap,InitializationOptions,createPixelMap,PixelMapFormat,Size}
import kit.PerformanceAnalysisKit.Hilog

var ctx = None<UIAbilityContext>

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello World"
    @State
    var pixelMap: PixelMap = createPixelMap(Array<UInt8>(112, repeat: 0), InitializationOptions(Size(3, 4)))

    func build() {
        Row() {
            Column() {
                Text(this.message)
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                Button() {
                    Text('TestButton')
                        .fontSize(30)
                        .fontWeight(FontWeight.Bold)
                }
                    .margin(top: 20.px)
                    .backgroundColor(0x0D9FFB)
                    .width(60.percent)
                    .height(5.percent)
                    .onClick {
                        evt =>
                        // 设置fdSrc, 获取视频的缩略图
                        pixelMap = testFetchFrameByTime()
                    }
                Image(this.pixelMap)
                    .width(300)
                    .height(300)
                    .margin(top: 20.px)
            }.width(100.percent)
        }.height(100.percent)
    }
}

// 使用资源管理接口获取打包在HAP内的视频文件，通过设置fdSrc属性，
// 获取视频指定时间的缩略图，并通过Image控件显示在屏幕上。
func testFetchFrameByTime(): PixelMap {
    // 创建AVImageGenerator对象
    let avImageGenerator = createAVImageGenerator()
    // 设置fdSrc
    avImageGenerator.fdSrc = AVFileDescriptor(ctx
        .getOrThrow()
        .resourceManager
        .getRawFd('demo.mp4')
        .fd)

    // 初始化入参
    let timeUs = 0
    let queryOption = AVImageQueryOptions.AvImageQueryNextSync
    let param = PixelMapParams(
        width: 300,
        height: 300
    )

    // 获取缩略图
    let pixelMap = avImageGenerator.fetchFrameByTime(timeUs, queryOption, param)

    // 释放资源
    avImageGenerator.release()
    loggerInfo("release success.")
    return pixelMap
}

func loggerInfo(str: String) {
    Hilog.info(0, "CangjieTest", str)
}
