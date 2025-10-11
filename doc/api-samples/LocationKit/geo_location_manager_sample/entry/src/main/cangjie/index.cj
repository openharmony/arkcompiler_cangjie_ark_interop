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
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Text
internal import ohos.component.CustomView
internal import ohos.component.CJEntry
internal import ohos.component.loadNativeView
internal import ohos.component.FontWeight
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import kit.LocationKit.*
import ohos.base.*

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
                            try {
                                let locationEnabled = GeoLocationManager.isLocationEnabled()
                            } catch (err: BusinessException) {
                                AppLog.error("errCode: ${err.code}, message: ${err.message}")
                            }
                            try {
                                let location = GeoLocationManager.getLastLocation()
                            } catch (err: BusinessException) {
                                AppLog.error("errCode: ${err.code}, message: ${err.message}")
                            }
                            let request: ContinuousLocationRequest = ContinuousLocationRequest(1,
                                UserActivityScenario.NAVIGATION)
                            let locationCallback = LocationCallback()
                            try {
                                GeoLocationManager.on(CallbackType.LocationChange, request, locationCallback)
                            } catch (err: BusinessException) {
                                AppLog.error("errCode: ${err.code}, message: ${err.message}")
                            }

                            this.message = "Hello Cangjie"
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

class LocationCallback <: Callback1Argument<Location> {
    init() {}
    public open func invoke(info: Location): Unit {
        AppLog.info("location change.")
    }
}
