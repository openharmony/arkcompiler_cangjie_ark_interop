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
import kit.ImageKit.*
import kit.LocalizationKit.*
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello World"

    func build() {
        Row {
            Column {
                Text(this.message)
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt =>
                            let resourceManager = Global.getAbilityContext().resourceManager
                            let rawFileDescriptor = resourceManager.getRawFd("test.jpg")
                            let imageSource = createImageSource(rawFileDescriptor)
                            let decodingOptions = DecodingOptions(editable: true,
                                desiredPixelFormat: PixelMapFormat.Rgba8888)
                            let pixelMap = imageSource.createPixelMap(options: decodingOptions)
                            let info = pixelMap.getImageInfo()
                            loggerInfo('pixelmap isHdr: ${info.isHdr}')
                            pixelMap.release()
                            imageSource.release()
                            this.message = "Hello Cangjie"
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

func loggerInfo(str: String) {
    Hilog.info(0, "CangjieTest", str)
}
