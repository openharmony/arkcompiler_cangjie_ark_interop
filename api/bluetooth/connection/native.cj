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

package ohos.bluetooth.connection

import ohos.base.*
import ohos.ffi.*

foreign {
    // global ffi function
    func FfiBluetoothConPairDevice(deviceId: CString, errCode: CPointer<Int32>): Unit

    func FfiBluetoothConGetRemoteDeviceName(deviceId: CString, errCode: CPointer<Int32>): CString

    func FfiBluetoothConGetRemoteDeviceClass(deviceId: CString, errCode: CPointer<Int32>): CDeviceClass

    func FfiBluetoothConGetRemoteProfileUuids(deviceId: CString, errCode: CPointer<Int32>): CArrString

    func FfiBluetoothConGetLocalName(errCode: CPointer<Int32>): CString

    func FfiBluetoothConGetPairedDevices(errCode: CPointer<Int32>): CArrString

    func FfiBluetoothConGetPairState(deviceId: CString, errCode: CPointer<Int32>): Int32

    func FfiBluetoothConGetProfileConnectionState(profileId: Int32, errCode: CPointer<Int32>): Int32

    func FfiBluetoothConSetDevicePairingConfirmation(deviceId: CString, accept: Bool, errCode: CPointer<Int32>): Unit

    func FfiBluetoothConSetDevicePinCode(deviceId: CString, code: CString, errCode: CPointer<Int32>): Unit

    func FfiBluetoothConSetLocalName(name: CString, errCode: CPointer<Int32>): Unit

    func FfiBluetoothConSetBluetoothScanMode(mode: Int32, duration: Int32, errCode: CPointer<Int32>): Unit

    func FfiBluetoothConGetBluetoothScanMode(errCode: CPointer<Int32>): Int32

    func FfiBluetoothConStartBluetoothDiscovery(errCode: CPointer<Int32>): Unit

    func FfiBluetoothConStopBluetoothDiscovery(errCode: CPointer<Int32>): Unit

    func FfiBluetoothConIsBluetoothDiscovering(errCode: CPointer<Int32>): Bool

    func FfiBluetoothConSetRemoteDeviceName(deviceId: CString, name: CString, errCode: CPointer<Int32>): Unit

    func FfiBluetoothConGetRemoteDeviceBatteryInfo(deviceId: CString, errCode: CPointer<Int32>): CBatteryInfo

    // new on/off
    func FfiBluetoothConOn(callbackType: Int32, id: Int64, errCode: CPointer<Int32>): Unit
}
