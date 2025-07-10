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

package ohos.ability

import ohos.ffi.*
import ohos.rpc.*
import ohos.labels.*

@C
struct CJAbilityConnectCallbackFuncs {
    CJAbilityConnectCallbackFuncs(
        let onConnect: CFunc<(Int64, ElementNameHandle, Int64, Int32) -> Unit>,
        let onDisconnect: CFunc<(Int64, ElementNameHandle, Int32) -> Unit>,
        let release: CFunc<(Int64) -> Unit>
    ) {}
}

@C
func connectOptionsOnConnect(id: Int64, elementHandle: ElementNameHandle, objectId: Int64, resultCode: Int32): Unit {
    ABILITY_LOG.info("connectOptionsOnConnect begin, resultCode is ${resultCode}")
    let optConnection = FFIDataManager.getInstance().getData<ConnectOptions>(id)
    match (optConnection) {
        case None => ABILITY_LOG.error("No such connectOptions: " + id.toString())
        case Some(connections) =>
            let element = ElementName(elementHandle)
            let remoteObject: IRemoteObject = createIRemoteObject(objectId)
            connections.onConnect(element, remoteObject)
    }
}

@C
func connectOptionsOnDisconnect(id: Int64, elementHandle: ElementNameHandle, resultCode: Int32): Unit {
    ABILITY_LOG.info("connectOptionsOnDisconnect begin, resultCode is ${resultCode}")
    let optConnection = FFIDataManager.getInstance().getData<ConnectOptions>(id)
    match (optConnection) {
        case None =>
            ABILITY_LOG.error("No such connectOptions: " + id.toString())
            throw Exception("No such connectOptions: " + id.toString())
        case Some(connections) =>
            let element = ElementName(elementHandle)
            connections.onDisconnect(element)
    }
}

@C
func connectOptionsRelease(id: Int64): Unit {
    let optConnection = FFIDataManager.getInstance().getData<ConnectOptions>(id)
    match (optConnection) {
        case None => ABILITY_LOG.error("No such connectOptions: " + id.toString())
        case Some(connections) =>
            FFIDataManager.getInstance().releaseData(id)
            ABILITY_LOG.info("Release connectOptions end")
    }
}

class ConnectOptions <: FFIData {
    var onConnect: (ElementName, IRemoteObject) -> Unit
    var onDisconnect: (ElementName) -> Unit
    var onFailed: (Int32) -> Unit

    init(
        onDisconnect: (ElementName) -> Unit,
        onFailed: (Int32) -> Unit
    ) {
        super()
        this.onConnect = {_, _ =>}
        this.onDisconnect = onDisconnect
        this.onFailed = onFailed
        registerSelf()
    }

    init(
        onConnect: (ElementName, IRemoteObject) -> Unit,
        onDisconnect: (ElementName) -> Unit,
        onFailed: (Int32) -> Unit
    ) {
        super()
        this.onConnect = onConnect
        this.onDisconnect = onDisconnect
        this.onFailed = onFailed
        registerSelf()
    }
}

@C
func connectOptionsCJFuncsRegister(result: CPointer<CJAbilityConnectCallbackFuncs>): Unit {
    let funcs = CJAbilityConnectCallbackFuncs(
        connectOptionsOnConnect,
        connectOptionsOnDisconnect,
        connectOptionsRelease
    )
    unsafe { result.write(funcs) }
}

foreign func RegisterCJAbilityConnectCallbackFuncs(funcs: CFunc<(CPointer<CJAbilityConnectCallbackFuncs>) -> Unit>): Unit

let REGISTER_CONNECT_OPTIONS = unsafe { RegisterCJAbilityConnectCallbackFuncs(connectOptionsCJFuncsRegister) }
