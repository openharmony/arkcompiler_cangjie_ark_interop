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
import kit.ConnectivityKit.*
import ohos.business_exception.*
import ohos.callback_invoke.*
import ohos.hilog.Hilog
import std.collection.ArrayList

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
                        let gattClientManager = GattClientManager()
                        gattClientManager.onGattClientStateChange()
                        gattClientManager.startConnect('XX:XX:XX:XX:XX:XX')
                        gattClientManager.discoverServices()
                        gattClientManager.readCharacteristicValue()
                        gattClientManager.writeCharacteristicValue()
                        gattClientManager.readDescriptorValue()
                        gattClientManager.writeDescriptorValue()
                        gattClientManager.stopConnect()

                        let gattServerManager = GattServerManager()
                        gattServerManager.onGattServerStateChange()
                        gattServerManager.registerServer('XX:XX:XX:XX:XX:XX')
                        gattServerManager.onCharacteristicRead()
                        gattServerManager.onCharacteristicWrite()
                        gattServerManager.onDescriptorRead()
                        gattServerManager.onDescriptorWrite()
                        gattServerManager.unRegisterServer()
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

class GattClientManager {
    var device: ?String = None
    var gattClient: ?GattClientDevice = None
    let connectState: ProfileConnectionState = ProfileConnectionState.StateDisconnected
    let myServiceUuid: String = '00001810-0000-1000-8000-00805F9B34FB'
    let myCharacteristicUuid: String = '00001820-0000-1000-8000-00805F9B34FB'
    let myFirstDescriptorUuid: String = '00002902-0000-1000-8000-00805F9B34FB' // 2902一般用于notification或者indication
    let mySecondDescriptorUuid: String = '00002903-0000-1000-8000-00805F9B34FB'
    var found: Bool = false

    // 构造BLEDescriptor
    private func initDescriptor(des: String, value: Array<Byte>): BLEDescriptor {
        let descriptor: BLEDescriptor = BLEDescriptor(
            this.myServiceUuid,
            this.myCharacteristicUuid,
            des,
            value
        )
        return descriptor
    }

    // 构造BLECharacteristic
    private func initCharacteristic(): BLECharacteristic {
        let descValue: Array<UInt8> = [11, 12]
        let descriptors: Array<BLEDescriptor> = [initDescriptor(this.myFirstDescriptorUuid, [0, 0]), initDescriptor(this.mySecondDescriptorUuid, descValue)]
        let charValue: Array<UInt8> = [1, 2]
        let characteristic: BLECharacteristic = BLECharacteristic(
            this.myServiceUuid,
            this.myCharacteristicUuid,
            charValue,
            descriptors,
            properties:GattProperties()
        )
        return characteristic
    }

    private func logCharacteristic(char: BLECharacteristic) {
        var message = 'logCharacteristic uuid:' + char.characteristicUuid + '\n'
        let value = char.characteristicValue
        message += 'logCharacteristic value: '
        for (i in 0..value.size) {
            message += value[i].toString() + ' '
        }
        Hilog.info(0,"",message)
    }

    private func logDescriptor(des: BLEDescriptor) {
        var message = 'logDescriptor uuid:' + des.descriptorUuid + '\n'
        let value = des.descriptorValue
        message += 'logDescriptor value: '
        for (i in 0..value.size) {
            message += value[i].toString() + ' '
        }
        Hilog.info(0,"",message)
    }

    private func checkService(services: Array<GattService>): Bool {
        for (i in 0..services.size) {
            if (services[i].serviceUuid != this.myServiceUuid) {
                continue
            }
            for (j in 0..services[i].characteristics.size) {
                if (services[i].characteristics[j].characteristicUuid != this.myCharacteristicUuid) {
                    continue
                }
                for (k in 0..services[i].characteristics[j].descriptors.size) {
                    if (services[i].characteristics[j].descriptors[k].descriptorUuid == this.myFirstDescriptorUuid) {
                        Hilog.info(0,"",'find expected service from server')
                        return true
                    }
                }
            }
        }
        Hilog.error(0,"",'no expected service from server')
        return false
    }

    // 1. 订阅连接状态变化事件
    public func onGattClientStateChange() {
        if (this.gattClient.isNone()) {
            Hilog.error(0,"",'no gattClient')
            return
        }
        try {
            this.gattClient?.on(BluetoothBleGattClientDeviceCallbackType.BleConnectionStateChange, ChangeStateCb())
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 2. client端主动连接时调用
    public func startConnect(peerDevice: String) { // 对端设备一般通过ble scan获取到
        if (this.connectState != ProfileConnectionState.StateDisconnected) {
            Hilog.error(0,"",'startConnect failed')
            return
        }
        Hilog.info(0,"",'startConnect ' + peerDevice)
        this.device = peerDevice
        // 2.1 使用device构造gattClient，后续的交互都需要使用该实例
        this.gattClient = createGattClientDevice(peerDevice)
        try {
            this.onGattClientStateChange() // 2.2 订阅连接状态
            this.gattClient?.connect() // 2.3 发起连接
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 3. client端连接成功后，需要进行服务发现
    public func discoverServices() {
        if (this.gattClient.isNone()) {
            Hilog.info(0,"",'no gattClient')
            return
        }
        Hilog.info(0,"",'discoverServices')

        let result = this.gattClient?.getServices{err: ?BusinessException, result: ?Array<GattService> =>
            try {
                this.found = this.checkService(result.getOrThrow()) // 要确保server端的服务内容有业务所需要的服务
            } catch (e: BusinessException) {
                Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
            }
        }
    }

    // 4. 在确保拿到了server端的服务结果后，读取server端特定服务的特征值时调用
    public func readCharacteristicValue() {
        if (this.gattClient.isNone() || this.connectState != ProfileConnectionState.StateConnected) {
            Hilog.error(0,"",'no gattClient or not connected')
            return
        }
        if (!this.found) { // 要确保server端有对应的characteristic
            Hilog.error(0,"",'no characteristic from server')
            return
        }

        let characteristic = this.initCharacteristic()
        Hilog.info(0,"",'readCharacteristicValue')
        try {
            this.gattClient?.readCharacteristicValue(characteristic) {
                    e, outData => this.logCharacteristic(outData.getOrThrow())
                }
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 5. 在确保拿到了server端的服务结果后，写入server端特定服务的特征值时调用
    public func writeCharacteristicValue() {
        if (this.gattClient.isNone() || this.connectState != ProfileConnectionState.StateConnected) {
            Hilog.error(0,"",'no gattClient or not connected')
            return
        }
        if (!this.found) { // 要确保server端有对应的characteristic
            Hilog.error(0,"",'no characteristic from server')
            return
        }

        let characteristic = this.initCharacteristic()
        Hilog.info(0,"",'writeCharacteristicValue')
        try {
            this.gattClient?.writeCharacteristicValue(characteristic, GattWriteType.Write) {
                    err, _ =>
                    if (let Some(e) <- err) {
                        Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
                        return
                    }
                    Hilog.info(0,"",'writeCharacteristicValue success')
                }
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 6. 在确保拿到了server端的服务结果后，读取server端特定服务的描述符时调用
    public func readDescriptorValue() {
        if (this.gattClient.isNone() || this.connectState != ProfileConnectionState.StateConnected) {
            Hilog.error(0,"",'no gattClient or not connected')
            return
        }
        if (!this.found) { // 要确保server端有对应的descriptor
            Hilog.error(0,"",'no descriptor from server')
            return
        }

        let descBuffer = Array<Byte>()
        let descriptor = this.initDescriptor(this.mySecondDescriptorUuid, descBuffer)
        Hilog.info(0,"",'readDescriptorValue')
        try {
            this.gattClient?.readDescriptorValue(descriptor) {
                e, outData => this.logDescriptor(outData.getOrThrow())
            }
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 7. 在确保拿到了server端的服务结果后，写入server端特定服务的描述符时调用
    public func writeDescriptorValue() {
        if (this.gattClient.isNone() || this.connectState != ProfileConnectionState.StateConnected) {
            Hilog.error(0,"",'no gattClient or not connected')
            return
        }
        if (!this.found) { // 要确保server端有对应的descriptor
            Hilog.error(0,"",'no descriptor from server')
            return
        }

        let descBuffer: Array<UInt8> = [11, 12]
        let descriptor = this.initDescriptor(this.mySecondDescriptorUuid, descBuffer)
        Hilog.info(0,"",'writeDescriptorValue')
        try {
            this.gattClient?.writeDescriptorValue(descriptor) {
                    err, _ =>
                    if (let Some(e) <- err) {
                        Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
                        return
                    }
                    Hilog.info(0,"",'writeDescriptorValue success')
                }
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 8.client端主动断开时调用
    public func stopConnect() {
        if (this.gattClient.isNone() || this.connectState != ProfileConnectionState.StateConnected) {
            Hilog.error(0,"",'no gattClient or not connected')
            return
        }

        Hilog.info(0,"",'stopConnect ' + this.device.getOrThrow())
        try {
            this.gattClient?.disconnect() // 8.1 断开连接
            this.gattClient?.off(BluetoothBleGattClientDeviceCallbackType.BleConnectionStateChange)
            this.gattClient?.close() // 8.2 如果不再使用此gattClient，则需要close
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }
}

class GattServerManager {
    public var gattServer: ?GattServer = None
    let connectState: ProfileConnectionState = ProfileConnectionState.StateDisconnected
    let myServiceUuid: String = '00001810-0000-1000-8000-00805F9B34FB'
    let myCharacteristicUuid: String = '00001820-0000-1000-8000-00805F9B34FB'
    let myFirstDescriptorUuid: String = '00002902-0000-1000-8000-00805F9B34FB' // 2902一般用于notification或者indication
    let mySecondDescriptorUuid: String = '00002903-0000-1000-8000-00805F9B34FB'

    // 构造BLEDescriptor
    private func initDescriptor(des: String, value: Array<Byte>): BLEDescriptor {
        let descriptor: BLEDescriptor = BLEDescriptor(
            this.myServiceUuid,
            this.myCharacteristicUuid,
            des,
            value
        )
        return descriptor
    }

    // 构造BLECharacteristic
    private func initCharacteristic(): BLECharacteristic {
        let descValue: Array<UInt8> = [31, 32]
        let descriptors: Array<BLEDescriptor> = [initDescriptor(this.myFirstDescriptorUuid, [0, 0]),
            initDescriptor(this.mySecondDescriptorUuid, descValue)]
        let charValue: Array<UInt8> = [21, 22]
        let characteristic: BLECharacteristic = BLECharacteristic(
            this.myServiceUuid,
            this.myCharacteristicUuid,
            charValue,
            descriptors,
            properties:GattProperties()
        )
        return characteristic
    }

    // 1. 订阅连接状态变化事件
    public func onGattServerStateChange() {
        if (this.gattServer.isNone()) {
            Hilog.error(0,"",'no gattServer')
            return
        }
        try {
            this.gattServer?.on(BluetoothBleGattServerCallbackType.ConnectionStateChange, ChangeStateCb())
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 2. server端注册服务时调用
    public func registerServer(peerDevice: String) { // 对端设备一般通过ble scan获取到
        let characteristics: ArrayList<BLECharacteristic> = ArrayList<BLECharacteristic>()
        let characteristic = this.initCharacteristic()
        characteristics.add(characteristic)
        let gattService: GattService = GattService(
            this.myServiceUuid,
            true,
            characteristics.toArray(),
            includeServices:Array<GattService>()
        )
        Hilog.info(0,"",'registerServer ' + this.myServiceUuid)
        try {
            this.gattServer = createGattServer() // 2.1 构造gattServer，后续的交互都需要使用该实例
            this.onGattServerStateChange() // 2.2 订阅连接状态
            this.gattServer?.addService(gattService)
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 3. 订阅来自gattClient的读取特征值请求时调用
    public func onCharacteristicRead() {
        if (this.gattServer.isNone()) {
            Hilog.info(0,"",'no gattServer')
            return
        }
        Hilog.info(0,"",'onCharacteristicRead')
        try {
            this.gattServer?.on(BluetoothBleGattServerCallbackType.CharacteristicRead, ReadRequestCb())
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 4. 订阅来自gattClient的写入特征值请求时调用
    public func onCharacteristicWrite() {
        if (this.gattServer.isNone()) {
            Hilog.error(0,"",'no gattServer')
            return
        }

        Hilog.info(0,"",'onCharacteristicWrite')
        try {
            this.gattServer?.on(BluetoothBleGattServerCallbackType.CharacteristicWrite, WriteRequestCb())
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 5. 订阅来自gattClient的读取描述符请求时调用
    public func onDescriptorRead() {
        if (this.gattServer.isNone()) {
            Hilog.error(0,"",'no gattServer')
            return
        }

        Hilog.info(0,"",'onDescriptorRead')
        try {
            this.gattServer?.on(BluetoothBleGattServerCallbackType.CharacteristicRead, DescriptorReadRequestCb())
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 6. 订阅来自gattClient的写入描述符请求时调用
    public func onDescriptorWrite() {
        if (this.gattServer.isNone()) {
            Hilog.error(0,"",'no gattServer')
            return
        }

        Hilog.info(0,"",'onDescriptorWrite')
        try {
            this.gattServer?.on(BluetoothBleGattServerCallbackType.DescriptorWrite, DescriptorWriteRequestCb())
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }

    // 7. server端删除服务，不再使用时调用
    public func unRegisterServer() {
        if (this.gattServer.isNone()) {
            Hilog.error(0,"",'no gattServer')
            return
        }

        Hilog.info(0,"",'unRegisterServer ' + this.myServiceUuid)
        try {
            this.gattServer?.removeService(this.myServiceUuid) // 7.1 删除服务
            this.gattServer?.off(BluetoothBleGattServerCallbackType.ConnectionStateChange)
            this.gattServer?.close() // 7.3 如果不再使用此gattServer，则需要close
        } catch (e: BusinessException) {
            Hilog.error(0,"",'errCode: ${e.code}, errMessage: ' + e.message)
        }
    }
}

class ChangeStateCb <: Callback1Argument<BLEConnectionChangeState> {
    public func invoke(err: ?BusinessException, stateInfo: BLEConnectionChangeState) {
        let state = match (stateInfo.state) {
            case StateDisconnected => 'DISCONNECTED'
            case STATE_CONNECTING => 'CONNECTING'
            case StateConnected => 'CONNECTED'
            case STATE_DISCONNECTING => 'DISCONNECTING'
            case _ => 'undefined'
        }
        Hilog.info(0,"",'onGattClientStateChange: device=' + stateInfo.deviceId + ', state=' + state)
    }
}

class ReadRequestCb <: Callback1Argument<CharacteristicReadRequest> {
    public func invoke(err: ?BusinessException, charReq: CharacteristicReadRequest): Unit {
        let deviceId: String = charReq.deviceId
        let transId: Int32 = charReq.transId
        let offset: Int32 = charReq.offset
        Hilog.info(0,"",'receive characteristicRead')
        let rspBuffer: Array<UInt8> = [21, 22]
        let serverResponse: ServerResponse = ServerResponse(
            deviceId,
            transId,
            0, // 0表示成功
            offset,
            rspBuffer
        )
    }
}

class WriteRequestCb <: Callback1Argument<CharacteristicWriteRequest> {
    public func invoke(err: ?BusinessException, charReq: CharacteristicWriteRequest): Unit {
        let deviceId: String = charReq.deviceId
        let transId: Int32 = charReq.transId
        let offset: Int32 = charReq.offset
        Hilog.info(0,"",'receive characteristicWrite: needRsp=${charReq.needRsp}')
        if (!charReq.needRsp) {
            return
        }
        let rspBuffer: Array<UInt8> = [0]
        let serverResponse: ServerResponse = ServerResponse(
            deviceId,
            transId,
            0, // 0表示成功
            offset,
            rspBuffer
        )
    }
}

class DescriptorReadRequestCb <: Callback1Argument<DescriptorReadRequest> {
    public func invoke(err: ?BusinessException, desReq: DescriptorReadRequest): Unit {
        let deviceId: String = desReq.deviceId
        let transId: Int32 = desReq.transId
        let offset: Int32 = desReq.offset
        Hilog.info(0,"",'receive descriptorRead')
        let rspBuffer: Array<UInt8> = [31, 32]
        let serverResponse: ServerResponse = ServerResponse(
            deviceId,
            transId,
            0, // 0表示成功
            offset,
            rspBuffer
        )
    }
}

class DescriptorWriteRequestCb <: Callback1Argument<DescriptorWriteRequest> {
    public func invoke(err: ?BusinessException, desReq: DescriptorWriteRequest): Unit {
        let deviceId: String = desReq.deviceId
        let transId: Int32 = desReq.transId
        let offset: Int32 = desReq.offset
        Hilog.info(0,"",'receive descriptorWrite: needRsp=${desReq.needRsp}')
        if (!desReq.needRsp) {
            return
        }
        let rspBuffer: Array<UInt8> = [0]
        let serverResponse: ServerResponse = ServerResponse(
            deviceId,
            transId,
            0, // 0表示成功
            offset,
            rspBuffer
        )
    }
}
