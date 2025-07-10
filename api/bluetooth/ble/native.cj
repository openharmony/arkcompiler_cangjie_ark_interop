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

package ohos.bluetooth.ble

import ohos.ffi.*

foreign {
    // global ffi function
    func FfiBluetoothBleCreateGattServer(errCode: CPointer<Int32>): Int64

    func FfiBluetoothBleCreateGattClientDevice(deviceId: CString, errCode: CPointer<Int32>): Int64

    func FfiBluetoothBleStartBleScan(filters: CArrNativeScanFilter, options: CPointer<NativeScanOptions>,
        errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleStopBleScan(errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleStartAdvertising(setting: NativeAdvertiseSetting, advData: NativeAdvertiseData,
        advResponse: CPointer<NativeAdvertiseData>, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleStopAdvertising(errCode: CPointer<Int32>): Int64

    func FfiBluetoothBleStartAdvertisingWithId(advertisingParams: NativeAdvertisingParams, errCode: CPointer<Int32>): Int32

    func FfiBluetoothBleStopAdvertisingWithId(advertisingId: UInt32, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleOn(callbackType: Int32, id: Int64, errCode: CPointer<Int32>): Unit

    // GattClientDevice ffi function
    func FfiBluetoothBleGattClientDeviceConnect(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattClientDeviceDisconnect(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattClientDeviceClose(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattClientDeviceGetDeviceName(id: Int64, errCode: CPointer<Int32>): CString

    func FfiBluetoothBleGattClientDeviceGetServices(id: Int64, errCode: CPointer<Int32>): CArrGattService

    func FfiBluetoothBleGattClientDeviceReadCharacteristicValue(id: Int64, characteristic: NativeBLECharacteristic,
        callback: Int64, errCode: CPointer<Int32>): NativeBLECharacteristic

    func FfiBluetoothBleGattClientDeviceReadDescriptorValue(id: Int64, descriptor: NativeBLEDescriptor, callback: Int64,
        errCode: CPointer<Int32>): NativeBLEDescriptor

    func FfiBluetoothBleGattClientDeviceWriteCharacteristicValue(id: Int64, characteristic: NativeBLECharacteristic,
        writeType: Int32, callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattClientDeviceWriteDescriptorValue(id: Int64, descriptor: NativeBLEDescriptor,
        callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattClientDeviceGetRssiValue(id: Int64, callback: Int64, errCode: CPointer<Int32>): Int32

    func FfiBluetoothBleGattClientDeviceSetBLEMtuSize(id: Int64, mtu: Int32, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattClientDeviceSetCharacteristicChangeNotification(id: Int64,
        characteristic: NativeBLECharacteristic, enable: Bool, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattClientDeviceSetCharacteristicChangeIndication(id: Int64,
        characteristic: NativeBLECharacteristic, enable: Bool, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattClientDeviceOn(id: Int64, callbackType: Int32, callbackId: Int64, errCode: CPointer<Int32>): Unit

    // GattServer ffi function
    func FfiBluetoothBleGattServerAddService(id: Int64, service: NativeGattService, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattServerRemoveService(id: Int64, serviceUuid: CString, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattServerClose(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattServerNotifyCharacteristicChanged(id: Int64, deviceId: CString,
        notifyCharacteristic: NativeNotifyCharacteristic, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattServerSendResponse(id: Int64, serverResponse: NativeServerResponse, errCode: CPointer<Int32>): Unit

    func FfiBluetoothBleGattServerOn(id: Int64, callbackType: Int32, callbackId: Int64, errCode: CPointer<Int32>): Unit
}
