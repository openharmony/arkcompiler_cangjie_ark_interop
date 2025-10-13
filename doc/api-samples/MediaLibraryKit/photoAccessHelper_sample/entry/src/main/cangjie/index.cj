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
import kit.MediaLibraryKit.*
import kit.ArkData.{DataSharePredicates}
import ohos.business_exception.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

var ctx = None<UIAbilityContext>

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
                            let context = ctx.getOrThrow()
                            let phAccessHelper = getPhotoAccessHelper(context)
                            let predicates: DataSharePredicates = DataSharePredicates()
                            let fetchOptions: FetchOptions = FetchOptions([], predicates)

                            try {
                                let albumFetchResult: AlbumResult = phAccessHelper.getAlbums(AlbumType.System,
                                    AlbumSubtype.Video)
                                let album: Album = albumFetchResult.getFirstObject()
                                AppLog.info('get video album successfully, albumUri: ' + album.albumUri)

                                let videoFetchResult: PhotoAssetResult = album.getAssets(fetchOptions)
                                let photoAsset: PhotoAsset = videoFetchResult.getFirstObject()
                                AppLog.info(
                                    'video album getAssets successfully, photoAsset displayName: ' + photoAsset
                                        .displayName)
                                videoFetchResult.close()
                                albumFetchResult.close()
                            } catch (e: BusinessException) {
                                AppLog.error('video failed with err: ' + e.toString())
                            }
                            this.message = "Hello Cangjie"
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

func loggerInfo(str: String) {
    Hilog.info(0, "CangjieTest", str)
}
