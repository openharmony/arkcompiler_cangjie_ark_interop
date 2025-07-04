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

package ohos.multimedia.audio_haptic

import std.collection.*
import std.sync.*
import ohos.base.*
import ohos.ffi.*
import ohos.multimedia.audio
import ohos.labels.*

/**
 * Obtains an {@link AudioHapticManager} instance. This object is singleton in one process.
 * @returns { AudioHapticManager } AudioHapticManager instance.
 * @syscap SystemCapability.Multimedia.AudioHaptic.Core
 * @brief getAudioHapticManager(): AudioHapticManager
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
]
public func getAudioHapticManager(): AudioHapticManager {
    let id = unsafe { FfiOHOSAudioHapticGetManager() }
    if (id <= 0) {
        throw BusinessException(ERR_CODE_SERVICE_DIED_INFO, ERR_SERVICE_DIED_INFO)
    }
    AudioHapticManager(id)
}

/**
 * Audio haptic manager object.
 * @typedef AudioHapticManager
 * @syscap SystemCapability.Multimedia.AudioHaptic.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
]
public class AudioHapticManager <: RemoteDataLite {
    AudioHapticManager(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Register audio and haptic file into manager. Audio and haptic works are paired while playing. After registering
     * source, it will returns the source id.
     * @param { String } audioUri - Audio file uri.
     * @param { String } hapticUri - Haptic file uri.
     * @param { AsyncCallback < Int32 > } callback - Callback used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief registerSource(audioUri: string,hapticUri: string): Promise<number>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func registerSource(audioUri: String, hapticUri: String): Int32 {
        var resId = -1i32
        try (
            aUri = unsafe { LibC.mallocCString(audioUri) }.asResource(),
            hUri = unsafe { LibC.mallocCString(hapticUri) }.asResource()
        ) {
            let code = unsafe { FfiOHOSAudioHapticMgrRegRes(getID(), aUri.value, hUri.value, inout resId) }
            if (code != SUCCESS_CODE) {
                throw BusinessException(code, getErrMsg(code))
            }
        }
        return resId
    }

    /**
     * Unregister source.
     * @param { Int32 } id source id.
     * @param { AsyncCallback<Unit> } callback - Callback used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief unregisterSource(id: number): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func unregisterSource(id: Int32): Unit {
        let code = unsafe { FfiOHOSAudioHapticMgrUnregRes(getID(), id) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
    }

    /**
     * Set the audio latency mode of one source.
     * @param { Int32 } id - Source id.
     * @param { AudioLatencyMode } latencyMode - Audio latency mode.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief setAudioLatencyMode(id: number,latencyMode: AudioLatencyMode): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func setAudioLatencyMode(id: Int32, latencyMode: AudioLatencyMode): Unit {
        let code = unsafe { FfiOHOSAudioHapticMgrSetLatencyMode(getID(), id, latencyMode.get()) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
    }

    /**
     * Set the stream usage of one source.
     * @param { Int32 } id - Source id.
     * @param { audio.StreamUsage } usage - Stream usage.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types;
     *                                 3.Parameter verification failed.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief setStreamUsage(id: number,usage: audio.StreamUsage): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func setStreamUsage(id: Int32, usage: audio.StreamUsage): Unit {
        let code = unsafe { FfiOHOSAudioHapticMgrSetStreamUsage(getID(), id, usage.value) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
    }

    /**
     * Create an audio haptic player. If haptics is needed, caller
     * should have the permission of ohos.permission.VIBRATE.
     * @permission ohos.permission.VIBRATE
     * @param { Int32 } id - Source id.
     * @param { AudioHapticPlayerOptions } options - Options when creating audio haptic player.
     * @param { AsyncCallback<AudioHapticPlayer> } callback - Callback used to return the result.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400103 - I/O error.
     * @throws { BusinessException } 5400106 - Unsupport format.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief createPlayer(id: number,options?: AudioHapticPlayerOptions): Promise<AudioHapticPlayer>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func createPlayer(
        id: Int32,
        options!: AudioHapticPlayerOptions = AudioHapticPlayerOptions()
    ): AudioHapticPlayer {
        var code = 0i32
        let playerId = unsafe {
            FfiOHOSAudioHapticMgrCreatePlayer(getID(), id, options.muteAudio, options.muteHaptics, inout code)
        }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
        if (playerId <= 0) {
            throw BusinessException(ERR_CODE_SERVICE_DIED_INFO, ERR_SERVICE_DIED_INFO)
        }
        AudioHapticPlayer(playerId)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
]
public class AudioHapticPlayer <: RemoteDataLite {
    let callbackMap = HashMap<UInt8, ArrayList<CallbackObject>>()
    // we have 2 types of events now
    let registry = Array<AtomicBool>(2, {_ => AtomicBool(false)})
    let lock = Mutex()

    AudioHapticPlayer(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Is muted for one AudioHapticType
     * @param { AudioHapticType } type - Indicates the type to query.
     * @returns { Bool } - Is muted.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Parameter verification failed.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief isMuted(type: AudioHapticType): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func isMuted(hapticType: AudioHapticType): Bool {
        var ret = false
        let code = unsafe { FfiOHOSAudioHapticPlayerisMuted(getID(), hapticType.get(), inout ret) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
        ret
    }

    /**
     * Start this player.
     * @param { AsyncCallback<Unit> } callback - Callback used to return the result.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief start(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func start(): Unit {
        let code = unsafe { FfiOHOSAudioHapticPlayerStart(getID()) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
    }

    /**
     * Stop this player.
     * @param { AsyncCallback<Unit> } callback - Callback used to return the result.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief stop(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func stop(): Unit {
        let code = unsafe { FfiOHOSAudioHapticPlayerStop(getID()) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
    }

    /**
     * Release this player.
     * @param { AsyncCallback<Unit> } callback - Callback used to return the result.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief release(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func release(): Unit {
        let code = unsafe { FfiOHOSAudioHapticPlayerRelease(getID()) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
    }

    /**
     * Subscribes end of stream event.
     * @param { 'endOfStream' } AudioHapticPlayerCallBackType - Type of the playback event to listen for.
     * @param { Callback0Argument } callback - Callback used to listen for the playback end of stream.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief on(type: 'endOfStream',callback: Callback<void>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func on(cbType: AudioHapticPlayerCallBackType, callback: Callback0Argument): Unit {
        if (cbType != AHP_END_OF_STREAM) {
            throw BusinessException(ERR_PARAMETER_ERROR, "wrong CallbackObject type.")
        }
        let typeValue = cbType.get()
        if (registry[Int64(typeValue)].compareAndSwap(false, true)) {
            let wrapper = {
                => synchronized(lock) {
                    if (let Some(list) <- callbackMap.get(typeValue)) {
                        for (item in list) {
                            (item as Callback0Argument)?.invoke()
                        }
                    }
                }
            }
            let registerCall = Callback0Param<Unit>(wrapper)
            onNative(cbType, registerCall.getID())
        } else {
            if (findCallbackObject(typeValue, callback) >= 0) {
                return
            }
        }
        synchronized(lock) {
            callbackMap.addIfAbsent(typeValue, ArrayList<CallbackObject>())
            callbackMap[typeValue].add(callback)
        }
    }

    /**
     * Subscribes audio interrupt event.
     * @param { 'audioInterrupt' } type - Type of the playback event to listen for.
     * @param { Callback<audio.InterruptEvent> } callback - Callback used to listen for audio interrupt info.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief on(type: 'audioInterrupt',callback: Callback<audio.InterruptEvent>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func on(cbType: AudioHapticPlayerCallBackType, callback: Callback1Argument<audio.InterruptEvent>): Unit {
        if (cbType != AHP_AUDIO_INTERRRUPT) {
            throw BusinessException(ERR_PARAMETER_ERROR, "wrong CallbackObject type.")
        }
        let typeValue = cbType.get()
        if (registry[Int64(typeValue)].compareAndSwap(false, true)) {
            let wrapper = {
                event: Int32, force: Int32, hint: Int32 => synchronized(lock) {
                    let list = callbackMap.get(typeValue) ?? return
                    let iEvent = audio.CInterruptEvent(event, force, hint).toInterruptEvent()
                    for (item in list) {
                        (item as Callback1Argument<audio.InterruptEvent>)?.invoke(iEvent)
                    }
                }
            }
            let registerCall = Callback3Param<Int32, Int32, Int32, Unit>(wrapper)
            onNative(cbType, registerCall.getID())
        } else {
            if (findCallbackObject(typeValue, callback) >= 0) {
                return
            }
        }
        synchronized(lock) {
            callbackMap.addIfAbsent(typeValue, ArrayList<CallbackObject>())
            callbackMap[typeValue].add(callback)
        }
    }

    /**
     * Unsubscribes end of stream event.
     * @param { 'endOfStream' or 'audioInterrupt' } AudioHapticPlayerCallBackType - Type of the playback event to listen for.
     * @param { Callback<void> } callback - Callback used to listen for the playback end of stream.
     * @syscap SystemCapability.Multimedia.AudioHaptic.Core
     * @brief off(type: 'endOfStream',callback?: Callback<void>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public func off(cbType: AudioHapticPlayerCallBackType, callback!: ?CallbackObject = None): Unit {
        let typeValue = cbType.get()
        synchronized(lock) {
            if (let Some(v) <- callback) {
                if (findCallbackObject(typeValue, v, remove: true) < 0) {
                    throw BusinessException(ERR_PARAMETER_ERROR, "wrong CallbackObject.")
                }
                if (callbackMap[typeValue].isEmpty()) {
                    offNative(cbType)
                    registry[Int64(typeValue)].store(false)
                }
            } else {
                if (registry[Int64(typeValue)].compareAndSwap(true, false)) {
                    callbackMap[typeValue].clear()
                    offNative(cbType)
                }
            }
        }
    }

    private func onNative(cbType: AudioHapticPlayerCallBackType, id: Int64) {
        synchronized(lock) {
            let cName = unsafe { LibC.mallocCString(cbType.toString()) }
            let code = unsafe { FfiOHOSAudioHapticPlayerOn(getID(), cName, id) }
            unsafe { LibC.free(cName) }
            if (code != SUCCESS_CODE) {
                throw BusinessException(code, getErrMsg(code))
            }
        }
    }

    private func offNative(cbType: AudioHapticPlayerCallBackType): Unit {
        let cName = unsafe { LibC.mallocCString(cbType.toString()) }
        let code = unsafe { FfiOHOSAudioHapticPlayerOff(getID(), cName) }
        unsafe { LibC.free(cName) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrMsg(code))
        }
    }

    private func findCallbackObject(eventType: UInt8, callback: CallbackObject, remove!: Bool = false): Int64 {
        synchronized(lock) {
            let callbackList = callbackMap.get(eventType) ?? return -1
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
    }
}
