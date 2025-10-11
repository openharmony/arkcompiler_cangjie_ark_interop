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
import kit.AbilityKit.*
import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.BusinessException

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
                        evt => this.message = "Hello Cangjie"
                        Hilog.info(0, "CangjieSample","MainAbility onWindowStageCreate.")
                        let ctx = globalAbilityContext.getOrThrow()
                        // 获取文件沙箱路径
                        let filePath = ctx.filesDir + '/test1.txt'
                        // 将沙箱路径转换为uri
                        let uri = getUriFromPath(filePath)
                        // 获取的uri为"file://com.example.demo/data/storage/el2/base/files/test1.txt"
                        // 构造请求数据
                        let want = Want(
                            action: "ohos.want.action.viewData", // 表示查看数据的操作，文件打开场景固定为此值
                            uri: uri,
                            wantType: 'general.plain-text', // 表示待打开文件的类型
                            // 配置被分享文件的读写权限，例如对文件打开应用进行读写授权
                            flags: Flags
                                .FlagAuthWriteUriPermission
                                .getValue() | Flags
                                .FlagAuthReadUriPermission
                                .getValue()
                        )
                        try {
                           ctx.startAbility(want)
                        } catch (e: BusinessException) {
                            Hilog.error(0, "CangjieSample","Failed to invoke startAbility, code: ${e.code}, message: ${e.message}")
                        }
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}
