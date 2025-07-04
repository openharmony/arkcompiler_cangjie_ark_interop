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

import ohos.base.*
import std.collection.*
import std.sync.*

class ResultCallbackForAbilityResult {
    private static var callbacks = HashMap<Int64, AsyncCallback<AbilityResult>>()
    private static var id = AtomicInt64(0)
    private static var mtx = Mutex()
    private var id_: Int64

    init(callback: AsyncCallback<AbilityResult>) {
        synchronized(mtx) {
            id.fetchAdd(1)
            id_ = id.load()
            setCallback(callback)
        }
    }

    static func getCallback(callbackId: Int64): Option<AsyncCallback<AbilityResult>> {
        callbacks.get(callbackId)
    }

    static func deleteCallback(callbackId: Int64): Unit {
        callbacks.remove(callbackId)
    }

    func getID(): Int64 {
        return id_
    }

    func setCallback(callback: AsyncCallback<AbilityResult>): Unit {
        let instanceId = id.load()
        callbacks.add(instanceId, callback)
    }
}

class ResultCallbackForPermissionRequestResult {
    private static var callbacks = HashMap<Int64, AsyncCallback<PermissionRequestResult>>()
    private static var id = AtomicInt64(0)
    private static var mtx = Mutex()
    private var id_: Int64

    init(callback: AsyncCallback<PermissionRequestResult>) {
        synchronized(mtx) {
            id.fetchAdd(1)
            id_ = id.load()
            setCallback(callback)
        }
    }

    static func getCallback(callbackId: Int64): Option<AsyncCallback<PermissionRequestResult>> {
        callbacks.get(callbackId)
    }

    static func deleteCallback(callbackId: Int64): Unit {
        callbacks.remove(callbackId)
    }

    func getID(): Int64 {
        return id_
    }

    func setCallback(callback: AsyncCallback<PermissionRequestResult>): Unit {
        let instanceId = id.load()
        callbacks.add(instanceId, callback)
    }
}

class ResultCallbackForDialogRequestResult {
    private static var callbacks = HashMap<Int64, AsyncCallback<DialogRequestResult>>()
    private static var id = AtomicInt64(0)
    private static var mtx = Mutex()
    private var id_: Int64

    init(callback: AsyncCallback<DialogRequestResult>) {
        synchronized(mtx) {
            id.fetchAdd(1)
            id_ = id.load()
            setCallback(callback)
        }
    }

    static func getCallback(callbackId: Int64): Option<AsyncCallback<DialogRequestResult>> {
        callbacks.get(callbackId)
    }

    static func deleteCallback(callbackId: Int64): Unit {
        callbacks.remove(callbackId)
    }

    func getID(): Int64 {
        return id_
    }

    func setCallback(callback: AsyncCallback<DialogRequestResult>): Unit {
        let instanceId = id.load()
        callbacks.add(instanceId, callback)
    }
}

@C
func invokeAbilityResultCallback(id: Int64, error: Int32, cjAbilityResult: CPointer<CJAbilityResult>): Unit {
    let res = ResultCallbackForAbilityResult.getCallback(id)
    match (res) {
        case None =>
            ABILITY_LOG.error("Invalid id, failed to get ResultCallbackForAbilityResult")
            throw NoneValueException("Invalid id, failed to get ResultCallbackForAbilityResult")
        case Some(callback) =>
            if (error != 0 || cjAbilityResult.isNull()) {
                callback(Option<AsyncError>.Some(AsyncError(error)), Option<AbilityResult>.None)
                ResultCallbackForAbilityResult.deleteCallback(id)
                ABILITY_LOG.info("Invoke ResultCallbackForAbilityResult end and error code is ${error}")
                return
            }

            let cjResult = unsafe { cjAbilityResult.read() }
            let abilityResult = AbilityResult(cjResult.resultCode, Want(cjResult.wantHandle))
            callback(Option<AsyncError>.None, Option<AbilityResult>.Some(abilityResult))
            ResultCallbackForAbilityResult.deleteCallback(id)
            ABILITY_LOG.info("Invoke ResultCallbackForAbilityResult end")
    }
}

@C
func invokePermissionRequestResultCallback(
    id: Int64,
    error: Int32,
    cjPermissionRequestResult: CPointer<CJPermissionRequestResult>
): Unit {
    let res = ResultCallbackForPermissionRequestResult.getCallback(id)
    match (res) {
        case None =>
            ABILITY_LOG.error("Invalid id, failed to get ResultCallbackForPermissionRequestResult")
            throw Exception("Invalid id, failed to get ResultCallbackForPermissionRequestResult")
        case Some(callback) =>
            if (error != 0 || cjPermissionRequestResult.isNull()) {
                callback(Option<AsyncError>.Some(AsyncError(error)), Option<PermissionRequestResult>.None)
                ResultCallbackForPermissionRequestResult.deleteCallback(id)
                ABILITY_LOG.info("Invoke ResultCallbackForPermissionRequestResult end, error code is ${error}")
                return
            }

            // Get permissions.
            let nativeResult = unsafe { cjPermissionRequestResult.read() }
            let nativePermission = FFIVectorString(nativeResult.permissions)
            let len = nativePermission.getSize()
            var cjPermissions = Array<String>(len, repeat: "")
            for (i in 0..len) {
                cjPermissions[i] = nativePermission.getElement(i)
            }

            // Get authResults.
            let ffiResult = FFIVectorInt32(nativeResult.authResults)
            let resultSize = ffiResult.getSize()
            var cjResult = Array<Int32>(resultSize, repeat: 0)
            for (i in 0..resultSize) {
                cjResult[i] = ffiResult.getElement(i)
            }

            let request = PermissionRequestResult(cjPermissions, cjResult)
            callback(Option<AsyncError>.None, Option<PermissionRequestResult>.Some(request))
            ResultCallbackForPermissionRequestResult.deleteCallback(id)
            ABILITY_LOG.info("Invoke ResultCallbackForPermissionRequestResult end")
    }
}

@C
func invokeDialogRequestResultCallback(
    id: Int64,
    error: Int32,
    cjDialogRequestResult: CPointer<CJDialogRequestResult>
): Unit {
    let res = ResultCallbackForDialogRequestResult.getCallback(id)
    match (res) {
        case None =>
            ABILITY_LOG.error("Invalid id, failed to get ResultCallbackForDialogRequestResult")
            throw Exception("Invalid id, failed to get ResultCallbackForDialogRequestResult")
        case Some(callback) =>
            if (error != 0 || cjDialogRequestResult.isNull()) {
                callback(Option<AsyncError>.Some(AsyncError(error)), Option<DialogRequestResult>.None)
                ResultCallbackForPermissionRequestResult.deleteCallback(id)
                ABILITY_LOG.info("Invoke ResultCallbackForPermissionRequestResult end, error code is ${error}")
                return
            }

            let nativeResult = unsafe { cjDialogRequestResult.read() }
            let result = DialogRequestResult(ResultCode.parse(nativeResult.result), Want(nativeResult.wantHandle))
            callback(Option<AsyncError>.None, Option<DialogRequestResult>.Some(result))
            ResultCallbackForDialogRequestResult.deleteCallback(id)
            ABILITY_LOG.info("Invoke ResultCallbackForDialogRequestResult end")
    }
}

@C
struct CJAbilityResultCbInfo {
    CJAbilityResultCbInfo(
        let lambdaId: Int64,
        let cjCallback: CFunc<(Int64, Int32, CPointer<CJAbilityResult>) -> Unit>
    ) {}
}

unsafe func getCJAbilityResultCbInfo(callback: ?AsyncCallback<AbilityResult>): CJAbilityResultCbInfo {
    let lambdaDataId = if (let Some(v) <- callback) {
        ResultCallbackForAbilityResult(v).getID()
    } else {
        -1 // No callback
    }
    return CJAbilityResultCbInfo(lambdaDataId, invokeAbilityResultCallback)
}

@C
struct CJAbilityCallbacks {
    CJAbilityCallbacks(
        let invokeAbilityResultCallback: CFunc<(Int64, Int32, CPointer<CJAbilityResult>) -> Unit>,
        let invokePermissionRequestResultCallback: CFunc<(Int64, Int32, CPointer<CJPermissionRequestResult>) -> Unit>,
        let invokeDialogRequestResultCallback: CFunc<(Int64, Int32, CPointer<CJDialogRequestResult>) -> Unit>
    ) {}
}

@C
func cjAbilityCallbacksRegister(result: CPointer<CJAbilityCallbacks>): Unit {
    let cjFuncs = CJAbilityCallbacks(
        invokeAbilityResultCallback,
        invokePermissionRequestResultCallback,
        invokeDialogRequestResultCallback
    )
    unsafe { result.write(cjFuncs) }
}

foreign func RegisterCJAbilityCallbacks(callbacks: CFunc<(CPointer<CJAbilityCallbacks>) -> Unit>): Unit

let REGISTER_ABILITY_CONTEXT_CALLBACK = unsafe { RegisterCJAbilityCallbacks(cjAbilityCallbacksRegister) }
