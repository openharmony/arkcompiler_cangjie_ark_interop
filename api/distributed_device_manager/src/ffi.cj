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

package ohos.distributed_device_manager

import ohos.base.*

@C
struct CDeviceBasicInfo {
    var deviceId: CString = CString(CPointer())
    var deviceName: CString = CString(CPointer())
    var deviceType: UInt16 = 0
    var networkId: CString = CString(CPointer())
}

@C
struct CDeviceBasicInfoArray {
    var head: CPointer<CDeviceBasicInfo> = CPointer()
    var size: Int64 = 0

    func toArray(): Array<DeviceBasicInfo> {
        if (head.isNull() || size <= 0) {
            return Array<DeviceBasicInfo>()
        }
        Array<DeviceBasicInfo>(size) {
            i =>
            let data = unsafe { head.read(i) }
            DeviceBasicInfo(data)
        }
    }
}

foreign {
    func FfiOHOSDistributedDeviceManagerCreateDeviceManager(name: CString, errCode: CPointer<Int32>): Int64

    func FfiOHOSDistributedDeviceManagerReleaseDeviceManager(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSDistributedDeviceManagerGetAvailableDeviceList(id: Int64,
        deviceInfoList: CPointer<CDeviceBasicInfoArray>, errCode: CPointer<Int32>): Unit

    func FfiOHOSDistributedDeviceManagerFreeDeviceInfoList(deviceInfoList: CDeviceBasicInfoArray): Unit

    func FfiOHOSDistributedDeviceManagerGetLocalDeviceNetworkId(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSDistributedDeviceManagerGetLocalDeviceName(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSDistributedDeviceManagerGetLocalDeviceType(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSDistributedDeviceManagerGetLocalDeviceId(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSDistributedDeviceManagerGetDeviceName(id: Int64, networkId: CString, errCode: CPointer<Int32>): CString

    func FfiOHOSDistributedDeviceManagerGetDeviceType(id: Int64, networkId: CString, errCode: CPointer<Int32>): Int32

    func FfiOHOSDistributedDeviceManagerStartDiscovering(id: Int64, extra: CString, errCode: CPointer<Int32>): Unit

    func FfiOHOSDistributedDeviceManagerStopDiscovering(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSDistributedDeviceManagerBindTarget(id: Int64, deviceId: CString, bindParam: CString, isMetaType: Bool,
        errCode: CPointer<Int32>): Unit

    func FfiOHOSDistributedDeviceManagerUnbindTarget(id: Int64, deviceId: CString, errCode: CPointer<Int32>): Unit

    func FfiOHOSDistributedDeviceManagerOn(id: Int64, `type`: CString, callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSDistributedDeviceManagerOff(id: Int64, `type`: CString, errCode: CPointer<Int32>): Unit
}
