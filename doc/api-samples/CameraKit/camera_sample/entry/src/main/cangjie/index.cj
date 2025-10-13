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
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import kit.CameraKit.*
import ohos.base.*
import kit.AbilityKit.*
import ohos.hilog.Hilog
import ohos.callback_invoke.*
import ohos.business_exception.*

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
                        let cameraManager = createCameraManager(globalContext.getOrThrow())
                        let CameraDevices = getCameraDevices(cameraManager)
                        onCameraStatusChange(cameraManager)
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

func createCameraManager(context: UIAbilityContext): CameraManager {
    let cameraManager: CameraManager = getCameraManager(context)
    return cameraManager
}

func getCameraDevices(cameraManager: CameraManager): Array<CameraDevice> {
    let cameraArray: Array<CameraDevice> = cameraManager.getSupportedCameras()
    if (cameraArray.size > 0) {
        for (index in 0..cameraArray.size) {
            Hilog.info(0,"","cameraId : ${cameraArray[index].cameraId}")  // 获取相机ID。
            Hilog.info(0,"","cameraPosition : ${cameraArray[index].cameraPosition}")  // 获取相机位置。
            Hilog.info(0,"","cameraType : ${cameraArray[index].cameraType}")  // 获取相机类型。
            Hilog.info(0,"","connectionType : ${cameraArray[index].connectionType}")  // 获取相机连接类型。
        }
        return cameraArray
    } else {
        Hilog.error(0,"","cameraManager.getSupportedCameras error")
        return []
    }
}

class CameraStatusCallBack <: Callback1Argument<CameraStatusInfo> {
    public open func invoke(err: ?BusinessException, cameraStatusInfo: CameraStatusInfo): Unit {
        // 如果当通过USB连接相机设备时，回调函数会返回新的相机出现状态。
        if (cameraStatusInfo.status == CameraStatus.CameraStatusAppear) {
            Hilog.info(0,"","New Camera device appear.")
        }
        // 如果当断开相机设备USB连接时，回调函数会返回相机被移除状态。
        if (cameraStatusInfo.status == CameraStatus.CameraStatusDisappear) {
            Hilog.info(0,"","Camera device has been removed.")
        }
        // 相机被关闭时，回调函数会返回相机可用状态。
        if (cameraStatusInfo.status == CameraStatus.CameraStatusAvailable) {
            Hilog.info(0,"","Current Camera is available.")
        }
        // 相机被打开/占用时，回调函数会返回相机不可用状态。
        if (cameraStatusInfo.status == CameraStatus.CameraStatusUnavailable) {
            Hilog.info(0,"","Current Camera has been occupied.")
        }
        Hilog.info(0,"","camera: ${cameraStatusInfo.camera.cameraId}")
        Hilog.info(0,"","status: ${cameraStatusInfo.status}")
    }
}

func onCameraStatusChange(cameraManager: CameraManager): Unit {
    cameraManager.on(CameraEvents.CameraStatus, CameraStatusCallBack())
}