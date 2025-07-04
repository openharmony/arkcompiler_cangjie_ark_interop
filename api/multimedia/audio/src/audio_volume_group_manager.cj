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
 * Implements audio volume group management.
 * @typedef AudioVolumeGroupManager
 * @syscap SystemCapability.Multimedia.Audio.Volume
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Volume"
]
public class AudioVolumeGroupManager <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Obtains the maximum volume allowed for a stream.
     * @param { AudioVolumeType } volumeType - Audio stream type.
     * @returns { Int32 }  return the maximum volume.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func getMaxVolume(volumeType: AudioVolumeType): Int32 {
        var errorCode: Int32 = SUCCESS_CODE
        let result: Int32 = unsafe { FfiMMAAVGMGetMaxVolume(getID(), volumeType.value, inout errorCode) }
        checkRet(errorCode, "[AudioVolumeGroupManager] getMaxVolume:")
        return result
    }

    /**
     * Obtains the minimum volume allowed for a stream.
     * @param { AudioVolumeType } volumeType - Audio stream type.
     * @returns { Int32 } return the minimum volume.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func getMinVolume(volumeType: AudioVolumeType): Int32 {
        var errorCode: Int32 = SUCCESS_CODE
        let result: Int32 = unsafe { FfiMMAAVGMGetMinVolume(getID(), volumeType.value, inout errorCode) }
        checkRet(errorCode, "[AudioVolumeGroupManager] getMinVolume:")
        return result
    }

    /**
     * Obtains the ringer mode.
     * @returns { AudioRingMode } Current ringer mode.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func getRingerMode(): AudioRingMode {
        var errorCode: Int32 = SUCCESS_CODE
        let result: Int32 = unsafe { FfiMMAAVGMGetRingerMode(getID(), inout errorCode) }
        checkRet(errorCode, "[AudioVolumeGroupManager] getRingerMode:")
        return AudioRingMode.parse(result)
    }

    /**
     * Gets the volume db value that system calculate by volume type, volume level and device type.
     * @param { AudioVolumeType } volumeType - Audio volume type.
     * @param { Int32 } volumeLevel - Volume level to set.
     * @param { DeviceType } device - Output device type.
     * @returns { Float32 } return the result.
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
    public func getSystemVolumeInDb(volumeType: AudioVolumeType, volumeLevel: Int32, device: DeviceType): Float32 {
        var errorCode: Int32 = SUCCESS_CODE
        let result: Float32 = unsafe {
            FfiMMAAVGMGetSystemVolumeInDb(getID(), volumeType.value, volumeLevel, device.value, inout errorCode)
        }
        checkRet(errorCode, "[AudioVolumeGroupManager] getSystemVolumeInDb:")
        return result
    }

    /**
     * Obtains the volume of a stream.
     * @param { AudioVolumeType } volumeType - Audio stream type.
     * @returns { Int32 } Current system volume level.
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
    public func getVolume(volumeType: AudioVolumeType): Int32 {
        var errorCode: Int32 = SUCCESS_CODE
        let result: Int32 = unsafe { FfiMMAAVGMGetVolume(getID(), volumeType.value, inout errorCode) }
        checkRet(errorCode, "[AudioVolumeGroupManager] getVolume:")
        return result
    }

    /**
     * Checks whether the microphone is muted.
     * @returns { Bool } return the mute status of the microphone. The value true
     * means that the microphone is muted, and false means the opposite.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func isMicrophoneMute(): Bool {
        var errorCode: Int32 = SUCCESS_CODE
        let result: Bool = unsafe { FfiMMAAVGMIsMicrophoneMute(getID(), inout errorCode) }
        checkRet(errorCode, "[AudioVolumeGroupManager] isMicrophoneMute:")
        return result
    }

    /**
     * Checks whether a stream is muted.
     * @param { AudioVolumeType } volumeType - Audio stream type.
     * @returns { Bool } The mute status of the stream. The value true
     * means that the stream is muted, and false means the opposite.
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
    public func isMute(volumeType: AudioVolumeType): Bool {
        var errorCode: Int32 = SUCCESS_CODE
        let result: Bool = unsafe { FfiMMAAVGMIsMute(getID(), volumeType.value, inout errorCode) }
        checkRet(errorCode, "[AudioVolumeGroupManager] isMute:")
        return result
    }

    /**
     * Gets if this volume group is volume unadjustable.
     * @returns { Bool } Whether it is volume unadjustable.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func isVolumeUnadjustable(): Bool {
        var errorCode: Int32 = SUCCESS_CODE
        let result: Bool = unsafe { FfiMMAAVGMIsVolumeUnadjustable(getID(), inout errorCode) }
        checkRet(errorCode, "[AudioVolumeGroupManager] isVolumeUnadjustable:")
        return result
    }

    /**
     * Gets the max amplitude value for a specific output device.
     * This method uses a promise to return the result.
     * @param { AudioDeviceDescriptor } outputDevice - the target device.
     * @returns { Promise<number> } Promise used to return the max amplitude value.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed. Return by promise.
     * @throws { BusinessException } 6800301 - System error. Return by promise.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func getMaxAmplitudeForOutputDevice(device: AudioDeviceDescriptor): Float32 {
        var errorCode: Int32 = SUCCESS_CODE
        let cAudioDeviceDescriptor = device.toCAudioDeviceDescriptor()
        let result: Float32 = unsafe {
            FfiMMAAVGMGetMaxAmplitudeForOutputDevice(getID(), cAudioDeviceDescriptor, inout errorCode)
        }
        cAudioDeviceDescriptor.free()
        checkRet(errorCode, "[AudioVolumeGroupManager] getMaxAmplitudeForOutputDevice:")
        return result
    }

    /**
     * Gets the max amplitude value for a specific input device.
     * This method uses a promise to return the result.
     * @param { AudioDeviceDescriptor } inputDevice - the target device.
     * @returns { Promise<number> } Promise used to return the max amplitude value.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed. Return by promise.
     * @throws { BusinessException } 6800301 - System error. Return by promise.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func getMaxAmplitudeForInputDevice(device: AudioDeviceDescriptor): Float32 {
        var errorCode: Int32 = SUCCESS_CODE
        let cAudioDeviceDescriptor = device.toCAudioDeviceDescriptor()
        let result: Float32 = unsafe {
            FfiMMAAVGMGetMaxAmplitudeForInputDevice(getID(), cAudioDeviceDescriptor, inout errorCode)
        }
        cAudioDeviceDescriptor.free()
        checkRet(errorCode, "[AudioVolumeGroupManager] getMaxAmplitudeForInputDevice:")
        return result
    }

    /**
     * Listens for system microphone state change events. This method uses a callback to get microphone change events.
     * @param { 'micStateChange' } type - Type of the event to listen for. Only the micStateChange event is supported.
     * @param { Callback<MicStateChangeEvent> } callback - Callback used to get the system microphone state change event.
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
    public func on(`type`: AudioVolumeGroupManagerCallbackType, callback: Callback1Argument<MicStateChangeEvent>): Unit {
        if (`type` != MICSTATE_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is MICSTATE_CHANGE")
            checkRet(ERR_INVALID_PARAM, "[AudioVolumeGroupManager] on:")
        }
        commonSubscribe1Arg(`type`, callback) {
            infos: CMicStateChangeEvent => infos.toMicStateChangeEvent()
        }
        return
    }

    /**
     * Unsubscribes to the microphone state change events.
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
    public func off(`type`: AudioVolumeGroupManagerCallbackType, callback!: ?CallbackObject = None): Unit {
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
     * Listens for ringer mode change events. This method uses a callback to get ringer mode changes.
     * @param { 'ringerModeChange' } type - Type of the event to listen for. Only the ringerModeChange event is supported.
     * @param { Callback<AudioRingMode> } callback - Callback used to get the updated ringer mode.
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
    public func on(`type`: AudioVolumeGroupManagerCallbackType, callback: Callback1Argument<AudioRingMode>): Unit {
        if (`type` != RING_MODE_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is RING_MODE_CHANGE")
            checkRet(ERR_INVALID_PARAM, "[AudioVolumeGroupManager] on:")
        }
        commonSubscribe1Arg(`type`, callback) {
            infos: Int32 => AudioRingMode.parse(infos)
        }
        return
    }

    // private
    private func commonSubscribe1Arg<CT, T>(callbackType: AudioVolumeGroupManagerCallbackType, callback: CallbackObject,
        ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioVolumeGroupManagerCallbackType ${callbackType}")
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

    private func register(callbackType: AudioVolumeGroupManagerCallbackType, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAAVGMOn(getID(), callbackType.getValue(), id, inout errorCode)
            }
            checkRet(errorCode, "[AudioVolumeGroupManager] register:")
        }
    }

    private func findCallbackObject(callbackType: AudioVolumeGroupManagerCallbackType, callback: CallbackObject,
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

    private func argWrapper1<CT, T>(callbackType: AudioVolumeGroupManagerCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
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
        return registerCall.getID()
    }

    private let mapMutex = Mutex()
    private let listMutex = Mutex()
    private let callbackMap = HashMap<AudioVolumeGroupManagerCallbackType, ArrayList<CallbackObject>>()
    private let registerMap = HashMap<AudioVolumeGroupManagerCallbackType, AtomicBool>(
        [(RING_MODE_CHANGE, AtomicBool(false)), (MICSTATE_CHANGE, AtomicBool(false))])
}
