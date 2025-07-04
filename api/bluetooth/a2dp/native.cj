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

package ohos.bluetooth.a2dp

import ohos.ffi.*

foreign {
    func FfiBluetoothA2dpGetPlayingState(deviceId: CString, errCode: CPointer<Int32>): Int32

    func FfiBluetoothA2dpGetConnectedDevices(errCode: CPointer<Int32>): CArrString

    func FfiBluetoothA2dpGetConnectionState(deviceId: CString, errCode: CPointer<Int32>): Int32

    func FfiBluetoothA2dpOn(callbackType: Int32, id: Int64, errCode: CPointer<Int32>): Unit
}
