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
import ohos.business_exception.BusinessException
import kit.PerformanceAnalysisKit.Hilog
import kit.ArkData.{DistributedKVStore, KVManagerConfig, StoreConfig, getRdbStore}
import ohos.data.distributed_kv_store.Options as KVOptions
import ohos.data.distributed_kv_store.SecurityLevel as KVSecurityLevel
import ohos.data.relational_store.SecurityLevel as RelationalStoreSecurityLevel

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
                        this.message = "Hello Cangjie"
                        // 创建安全等级为S1的键值型数据库。
                        try {
                            let context = globalAbilityContext.getOrThrow()
                            let kvManagerConfig = KVManagerConfig(context, "com.example.datamanagertest")
                            // 创建KVManager实例
                            let kvManager = DistributedKVStore.createKVManager(kvManagerConfig)
                            Hilog.info(0, "CangjieSample","Succeeded in creating KVManager.")

                            let options = KVOptions(
                                KVSecurityLevel.S1, // 设置安全等级为S1
                                createIfMissing: true,
                                encrypt: true,
                                backup: false,
                                autoSync: false,
                            )
                            let kvStore = kvManager.getKVStore("storeId", options)
                            Hilog.info(0, "CangjieSample","getSingleKVStore success")
                        } catch (e: BusinessException) {
                            Hilog.error(0, "CangjieSample","ErrorCode: ${e.code}, Message: ${e.message}")
                        }

                        // 创建安全等级为S1的关系型数据库。
                        try {
                            let context = globalAbilityContext.getOrThrow()
                            let storeConfig = StoreConfig(
                                RelationalStoreSecurityLevel.S1, // 设置安全等级为S1
                                name: "RdbTest.db"
                            )
                            let rdbStore = getRdbStore(context, storeConfig)
                            Hilog.info(0, "CangjieSample","getRdbStore success")
                        } catch (e: BusinessException) {
                            Hilog.error(0, "CangjieSample","ErrorCode: ${e.code}, Message: ${e.message}")
                        }
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}
