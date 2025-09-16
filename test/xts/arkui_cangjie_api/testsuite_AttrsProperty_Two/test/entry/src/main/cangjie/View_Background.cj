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

import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.{AppResource}

@Entry
@Component
class View_Background {
    func build() {
        Column(space:5) {
            Row().width(90.percent).height(50).backgroundColor(@r(app.color.red)).border(width: 1.vp).id("Test_Row00")

            Row().width(90.percent).height(50).backgroundColor(0xAFEEEE).border(width: 1.vp).id("Test_Row01")

            Row()
                .backgroundImage("http://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024",
                     ImageRepeat.X)
                .backgroundImageSize(ImageSize.Auto)
                .backgroundImagePosition(x: -500, y: -300)
                .width(90.percent)
                .height(50)
                .id("Test_Row02")

            Row()
                .backgroundImage( "http://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024",
                    ImageRepeat.X)
                .backgroundImageSize(width: 50.vp, height: 50.vp)
                .backgroundImagePosition(x: -500.00, y: -300.00)
                .width(90.percent)
                .height(50)
                .id("Test_Row03")

            Row()
                .backgroundImage("http://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024",
                    ImageRepeat.X)
                .backgroundImageSize(width: 50, height: 50)
                .backgroundImagePosition(x: @r(app.string.positionx), y: @r(app.string.positiony))
                .width(90.percent)
                .height(50)
                .id("Test_Row04")

            Row()
                .backgroundImage("http://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024",
                     ImageRepeat.X)
                .backgroundImageSize(width: @r(app.string.width), height: @r(app.string.height))
                .width(90.percent)
                .height(50)
                .id("Test_Row05")
        }.width(100.percent).height(100.percent).padding(top: 5)
    }
}
