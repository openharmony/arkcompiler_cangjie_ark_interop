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
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_macro_manage.HybridComponentEntry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.{AppResource}

@Entry
@Component
class View_International {
    @State
    var msg: String = "Hello"

    public func build():Unit {
        Column {
            Text(@r(app.string.string_hello)).fontColor(@r(app.color.color_hello)).id("string_hello")
            Text(@r(app.string.string_world)).fontColor(@r(app.color.color_world)).id("string_world")
            Text(@r(app.string.string_arkui)).fontColor(@r(app.color.color_arkui)).id("string_arkui")
            Text(@r(app.string.string_common)).fontColor(@r(app.color.color_common)).id("string_commom")
            Row(space:5) {
                Image(@r(app.media.gif_common))
                    .id("gif_common")
                    .width(110)
                    .height(110)
                    .border(width: 1.vp)
                    .borderStyle(BorderStyle.Dashed)
                Image(@r(app.media.background))
                    .id("png")
                    .width(100)
                    .height(110)
                    .border(width: 1.vp)
                    .borderStyle(BorderStyle.Dashed)
                Image(@r(app.media.webp1_common))
                    .id("gif1")
                    .width(120)
                    .height(110)
                    .border(width: 1.vp)
                    .borderStyle(BorderStyle.Dashed)
            }
            Row(space:5) {
                Image(@rawfile("bmp1.bmp"))
                    .id("bmp")
                    .width(130)
                    .height(100)
                    .border(width: 1.vp)
                    .borderStyle(BorderStyle.Dashed)
                Image(@rawfile("image_path/gif2.gif"))
                    .id("gif")
                    .width(80)
                    .height(110)
                    .border(width: 1.vp)
                    .borderStyle(BorderStyle.Dashed)
                Image(@rawfile("startIcon.png"))
                    .id("startIcon_png")
                    .width(90)
                    .height(120)
                    .border(width: 1.vp)
                    .borderStyle(BorderStyle.Dashed)
            }
        }
    }
}
