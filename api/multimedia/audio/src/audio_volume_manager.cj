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

package ohos.multimedia.audio

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*
import std.collection.ArrayList
import std.sync.Mutex
import std.collection.HashMap
import std.sync.AtomicBool

/**
 * Implements audio volume management.
 * @typedef AudioVolumeManager
 * @syscap SystemCapability.Multimedia.Audio.Volume
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Volume"
]
public class AudioVolumeManager <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Listens for system volume change events. This method uses a callback to get volume change events.
     * @param { 'volumeChange' } type - Type of the event to listen for. Only the volumeChange event is supported.
     * @param { Callback<VolumeEvent> } callback - Callback used to get the system volume change event.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func on(`type`: AudioVolumeManagerCallbackType, callback: Callback1Argument<VolumeEvent>): Unit {
        if (`type` != VOLUME_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is VOLUME_CHANGE")
            checkRet(ERR_INVALID_PARAM, "[AudioVolumeManager] on:")
        }
        commonSubscribe1Arg(`type`, callback) {
            infos: CVolumeEvent => infos.toVolumeEvent()
        }
        return
    }

    /**
     * Unsubscribes to the volume change events..
     * @param { 'volumeChange' } type - Type of the event to be unsubscribed. Only the volumeChange event is supported.
     * @param { Callback<VolumeEvent> } callback - Callback used to obtain the invoking volume change event.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters missing;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func off(`type`: AudioVolumeManagerCallbackType, callback!: ?CallbackObject = None): Unit {
        AUDIO_LOG.debug("unsubscribe AudioVolumeManagerCallbackType ${`type`}")
        if (!callbackMap.contains(`type`)) {
            return
        }
        if (let Some(v) <- callback) {
            findCallbackObject(`type`, v, remove: true)
            return
        }
        callbackMap[`type`].clear()
        return
    }

    /**
     * Obtains an AudioVolumeGroupManager instance.
     * @param { Int32 } groupId - volume group id, use LOCAL_VOLUME_GROUP_ID in default
     * @returns { AudioVolumeGroupManager } The audio volume group manager instance.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func getVolumeGroupManager(groupId: Int32): AudioVolumeGroupManager {
        var errorCode: Int32 = SUCCESS_CODE
        let id: Int64 = unsafe { FfiMMAAVMGetVolumeGroupManager(getID(), groupId, inout errorCode) }
        checkRet(errorCode, "[AudioVolumeManager] getVolumeGroupManager:")
        return AudioVolumeGroupManager(id)
    }

    // private
    private func register(callbackType: AudioVolumeManagerCallbackType, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAAVMOn(getID(), callbackType.getValue(), id, inout errorCode)
            }
            checkRet(errorCode, "[AudioRoutingManagerCallbackType] register:")
        }
    }

    private func findCallbackObject(callbackType: AudioVolumeManagerCallbackType, callback: CallbackObject,
        remove!: Bool = false): Int64 {
        let callbackList = callbackMap.get(callbackType) ?? return -1
        for (idx in 0..callbackList.size) {
            if (refEq(callback, callbackList[idx])) {
                if (remove) {
                    callbackList.remove(at: idx)
                }
                return idx
            }
        }
        return -1
    }

    private func argWrapper1<CT, T>(callbackType: AudioVolumeManagerCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper = {
            ctype: CT =>
            let cjType = ctor(ctype)
            let callbackList = synchronized(mapMutex) {
                callbackMap.get(callbackType) ?? ArrayList<CallbackObject>()
            }
            for (caller in callbackList) {
                (caller as Callback1Argument<T>)?.invoke(cjType)
            }
        }
        let registerCall = Callback1Param<CT, Unit>(wrapper)
        registerCall.getID()
    }

    private func commonSubscribe1Arg<CT, T>(callbackType: AudioVolumeManagerCallbackType, callback: CallbackObject,
        ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioVolumeManagerCallbackType ${callbackType}")
        if (registerMap[callbackType].compareAndSwap(false, true)) {
            register(callbackType, argWrapper1<CT, T>(callbackType, ctor))
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                AUDIO_LOG.info(
                    "The ${callbackType} AudioVolumeManagerCallbackType is registered, no need to re-registered")
                return
            }
        }
        synchronized(mapMutex) {
            callbackMap.addIfAbsent(callbackType, ArrayList<CallbackObject>())
            synchronized(listMutex) {
                callbackMap[callbackType].add(callback)
            }
        }
    }

    private let mapMutex = Mutex()
    private let listMutex = Mutex()
    private let callbackMap = HashMap<AudioVolumeManagerCallbackType, ArrayList<CallbackObject>>()
    private let registerMap = HashMap<AudioVolumeManagerCallbackType, AtomicBool>([(VOLUME_CHANGE, AtomicBool(false))])
}
