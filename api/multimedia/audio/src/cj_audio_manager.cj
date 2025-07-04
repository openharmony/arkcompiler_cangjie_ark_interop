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
import ohos.labels.*
import std.collection.ArrayList
import std.sync.Mutex
import std.collection.HashMap
import std.sync.AtomicBool
import ohos.base.*
/**
 * Obtains an {@link AudioManager} instance.
 * @returns { AudioManager } this {@link AudioManager} object.
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public func getAudioManager(): AudioManager {
    var errorCode = SUCCESS_CODE
    let id: Int64
    unsafe { id = FfiMMACreateAudioManager(inout errorCode) }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, "Create AudioManager failed")
    }
    AudioManager(id)
}

/**
 * Implements audio stream management.
 * @typedef AudioStreamManager
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public class AudioStreamManager <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Gets information of audio effects.
     * @param { StreamUsage } usage - Stream usage.
     * @returns { AudioEffectInfoArray } return the information of audio effects.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getAudioEffectInfoArray(usage: StreamUsage): AudioEffectInfoArray {
        let cInfoArray: CArrI32
        var errorCode = SUCCESS_CODE
        unsafe { cInfoArray = FfiMMAASMGetAudioEffectInfoArray(getID(), usage.value, inout errorCode) }
        checkRet(errorCode, "[AudioStreamManager] getAudioEffectInfoArray:")
        let ret = toAudioEffectInfoArray(cInfoArray)
        unsafe { LibC.free<Int32>(cInfoArray.head) }
        ret
    }

    /**
     * Get information of current existing audio capturers.
     * @returns { AudioCapturerChangeInfoArray } The information of current existing audio capturers.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getCurrentAudioCapturerInfoArray(): AudioCapturerChangeInfoArray {
        let cInfoArray: CArrAudioCapturerChangeInfo
        var errorCode = SUCCESS_CODE
        unsafe { cInfoArray = FfiMMAASMGetCurrentAudioCapturerInfoArray(getID(), inout errorCode) }
        checkRet(errorCode, "[AudioStreamManager] getCurrentAudioCapturerInfoArray:")
        let infoArray = cInfoArray.toAudioCapturerChangeInfoArray()
        freeCArrAudioCapturerChangeInfo(cInfoArray)
        infoArray
    }

    /**
     * Get information of current existing audio renderers.
     * @returns { AudioRendererChangeInfoArray } The information of current existing audio renderers.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getCurrentAudioRendererInfoArray(): AudioRendererChangeInfoArray {
        let cInfoArray: CArrAudioRendererChangeInfo
        var errorCode = SUCCESS_CODE
        unsafe { cInfoArray = FfiMMAASMGetCurrentAudioRendererInfoArray(getID(), inout errorCode) }
        checkRet(errorCode, "[AudioStreamManager] getCurrentAudioRendererInfoArray:")
        let infoArray = cInfoArray.toAudioRendererChangeInfoArray()
        freeCArrAudioRendererChangeInfo(cInfoArray)
        infoArray
    }

    /**
     * Checks whether a stream is active.
     * @param { AudioVolumeType } volumeType - Audio stream type.
     * @returns { Bool } The active status of the stream.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func isActive(volumeType: AudioVolumeType): Bool {
        var errorCode = SUCCESS_CODE
        let isActive: Bool
        unsafe { isActive = FfiMMAASMIsActive(getID(), volumeType.value, inout errorCode) }
        checkRet(errorCode, "[AudioStreamManager] isActive:")
        isActive
    }

    /**
     * Listens for audio capturer change events. When there is any audio capturer change,
     * registered clients will receive the callback.
     * @param { 'audioCapturerChange' } type - Type of the event to listen for.
     * Only the audioCapturerChange event is supported.
     * @param { Callback<AudioCapturerChangeInfoArray> } callback - Callback invoked for the audio capturer change event.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func on(`type`: AudioStreamManagerCallbackType, callback: Callback1Argument<AudioCapturerChangeInfoArray>): Unit {
        if (`type` != CAPTURER_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is audioCapturerChange")
            checkRet(ERR_INVALID_PARAM, "[AudioStreamManager] on:")
        }
        commonSubscribe1Arg(`type`, callback) {
            infos: CArrAudioCapturerChangeInfo => infos.toAudioCapturerChangeInfoArray()
        }
        return
    }

    /**
     * Listens for audio renderer change events. When there is any audio renderer change,
     * registered clients will receive the callback.
     * @param { 'audioRendererChange' } type - Type of the event to listen for. Only the audioRendererChange event is supported.
     * @param { Callback<AudioRendererChangeInfoArray> } callback - Callback invoked for the audio renderer change event.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func on(`type`: AudioStreamManagerCallbackType, callback: Callback1Argument<AudioRendererChangeInfoArray>): Unit {
        if (`type` != RENDERER_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is audioRendererChange")
            checkRet(ERR_INVALID_PARAM, "[AudioStreamManager] on:")
        }
        commonSubscribe1Arg(`type`, callback) {
            infos: CArrAudioRendererChangeInfo => infos.toAudioRendererChangeInfoArray()
        }
        return
    }

    /**
     * UnSubscribes to audio stream sanager change events.
     * @param { AudioStreamManagerCallbackType } type - Type of the event to listen for.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio"
    ]
    public func off(`type`: AudioStreamManagerCallbackType, callback!: ?CallbackObject = None): Unit {
        AUDIO_LOG.debug("unsubscribe AudioStreamManagerCallbackType ${`type`}")
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

    private func register(callbackType: AudioStreamManagerCallbackType, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAASMOn(getID(), callbackType.getValue(), id, inout errorCode)
            }
            checkRet(errorCode, "[AudioStreamManager] register:")
        }
    }

    private func argWrapper1<CT, T>(callbackType: AudioStreamManagerCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
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

    private func commonSubscribe1Arg<CT, T>(callbackType: AudioStreamManagerCallbackType, callback: CallbackObject,
        ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioStreamManagerCallbackType ${callbackType}")
        if (registerMap[callbackType].compareAndSwap(false, true)) {
            register(callbackType, argWrapper1<CT, T>(callbackType, ctor))
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                AUDIO_LOG.info(
                    "The ${callbackType} AudioStreamManagerCallbackType is registered, no need to re-registered")
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

    private func findCallbackObject(callbackType: AudioStreamManagerCallbackType, callback: CallbackObject,
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

    private let mapMutex = Mutex()
    private let listMutex = Mutex()
    private let callbackMap = HashMap<AudioStreamManagerCallbackType, ArrayList<CallbackObject>>()
    private let registerMap = HashMap<AudioStreamManagerCallbackType, AtomicBool>(
        [(CAPTURER_CHANGE, AtomicBool(false)), (RENDERER_CHANGE, AtomicBool(false))])
}

/**
 * Implements audio router management.
 * @typedef AudioRoutingManager
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public class AudioRoutingManager <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Obtains the audio devices with a specific flag.
     * @param { DeviceFlag } deviceFlag - Audio device flag.
     * @returns { AudioDeviceDescriptors } return the device list.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func getDevices(deviceFlag: DeviceFlag): AudioDeviceDescriptors {
        let cDevices: CArrDeviceDescriptor
        var errorCode = SUCCESS_CODE
        unsafe { cDevices = FfiMMAARMGetDevices(getID(), deviceFlag.value, inout errorCode) }
        checkRet(errorCode, "[AudioRoutingManager] getDevices:")
        let inputDevices = cDevices.toAudioDeviceDescriptors()
        freeCArrDeviceDescriptor(cDevices)
        inputDevices
    }

    /**
     * Obtains all the available audio devices with a specific device usage.
     *
     * @throws { BusinessException } 6800301 - [AudioRoutingManager] getAvailableDevices:System error.
     * @throws { BusinessException } 6800102 - [AudioRoutingManager] getAvailableDevices:Memory allocation failure.
     * @relation getAvailableDevices(deviceUsage: DeviceUsage): AudioDeviceDescriptors
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func getAvailableDevices(deviceUsage: DeviceUsage): AudioDeviceDescriptors {
        var errorCode = SUCCESS_CODE
        let cDevices = unsafe { FfiMMAARMGetAvailableDevices(getID(), deviceUsage.value, inout errorCode) }
        checkRet(errorCode, "[AudioRoutingManager] getAvailableDevices:")
        let inputDevices = cDevices.toAudioDeviceDescriptors()
        unsafe { FfiMMAARMFreeCArrDeviceDescriptor(cDevices) }
        inputDevices
    }

    /**
     * Gets preferred input device for target audio capturer info.
     * @param { AudioCapturerInfo } capturerInfo - Audio capturer information.
     * @returns { AudioDeviceDescriptors } The preferred devices.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func getPreferredInputDeviceForCapturerInfo(capturerInfo: AudioCapturerInfo): AudioDeviceDescriptors {
        var errorCode = SUCCESS_CODE
        let cDevices: CArrDeviceDescriptor
        unsafe {
            cDevices = FfiMMAARMGetPreferredInputDeviceForCapturerInfo(getID(), capturerInfo.toCAudioCapturerInfo(),
                inout errorCode)
        }
        checkRet(errorCode, "[AudioRoutingManager] getPreferredInputDeviceForCapturerInfo:")
        let inputDevices = cDevices.toAudioDeviceDescriptors()
        freeCArrDeviceDescriptor(cDevices)
        inputDevices
    }

    /**
     * Gets preferred output device for target audio renderer info.
     * @param { AudioRendererInfo } rendererInfo - Audio renderer information.
     * @returns { AudioDeviceDescriptors } The preferred devices.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func getPreferredOutputDeviceForRendererInfo(rendererInfo: AudioRendererInfo): AudioDeviceDescriptors {
        var errorCode = SUCCESS_CODE
        let cDevices: CArrDeviceDescriptor
        unsafe {
            cDevices = FfiMMAARMGetPreferredOutputDeviceForRendererInfo(getID(), rendererInfo.toCAudioRendererInfo(),
                inout errorCode)
        }
        checkRet(errorCode, "[AudioRoutingManager] getPreferredOutputDeviceForRendererInfo:")
        let outputDevice = cDevices.toAudioDeviceDescriptors()
        freeCArrDeviceDescriptor(cDevices)
        outputDevice
    }

    /**
     * Checks whether a device is active.
     * @param { CommunicationDeviceType } deviceType - Audio device type.
     * @returns { Bool } return the active status of the device.
     * @syscap SystemCapability.Multimedia.Audio.Communication
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    public func isCommunicationDeviceActive(deviceType: CommunicationDeviceType): Bool {
        let res: Bool
        var errorCode = SUCCESS_CODE
        unsafe { res = FfiMMAARMIsCommunicationDeviceActive(getID(), deviceType.value, inout errorCode) }
        checkRet(errorCode, "[AudioRoutingManager] isCommunicationDeviceActive:")
        res
    }

    /**
     * Sets a device to the active state
     * @param { CommunicationDeviceType } deviceType - Audio device type.
     * @param { Bool } active - Active status to set. The value true means to set the device to the active status,
     * and false means the opposite.
     * @returns { void } return the result.
     * @syscap SystemCapability.Multimedia.Audio.Communication
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    public func setCommunicationDevice(deviceType: CommunicationDeviceType, active: Bool): Unit {
        var errorCode = SUCCESS_CODE
        unsafe {
            FfiMMAARMSetCommunicationDevice(getID(), deviceType.value, active, inout errorCode)
            checkRet(errorCode, "[AudioRoutingManager] setCommunicationDevice:")
        }
    }

    /**
     * Subscribes to device change events. When a device is connected/disconnected, registered clients will receive
     * the callback.
     * @param { 'deviceChange' } type - Type of the event to listen for. Only the deviceChange event is supported.
     * @param { DeviceFlag } deviceFlag - Audio device flag.
     * @param { Callback<DeviceChangeAction> } callback - Callback used to obtain the device update details.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func on(`type`: AudioRoutingManagerCallbackType, deviceFlag: DeviceFlag,
        callback: Callback1Argument<DeviceChangeAction>): Unit {
        if (`type` != DEVICE_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is deviceChange")
            checkRet(ERR_INVALID_PARAM, "[AudioRoutingManager] on:")
        }
        subscribe1ArgWithFlag(`type`, deviceFlag, callback) {
            infos: CDeviceChangeAction => DeviceChangeAction(infos)
        }
        return
    }

    private func registerWithFlag(callbackType: AudioRoutingManagerCallbackType, deviceFlag: DeviceFlag, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAARMOnWithFlags(getID(), callbackType.getValue(), id, deviceFlag.value, inout errorCode)
            }
            checkRet(errorCode, "[AudioRoutingManagerCallbackType] register:")
        }
    }

    private func subscribe1ArgWithFlag<CT, T>(callbackType: AudioRoutingManagerCallbackType, deviceFlag: DeviceFlag,
        callback: CallbackObject, ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioRoutingManagerCallbackType ${callbackType}")
        if (registerMap[callbackType].compareAndSwap(false, true)) {
            registerWithFlag(callbackType, deviceFlag, argWrapper1<CT, T>(callbackType, ctor))
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                AUDIO_LOG.info(
                    "The ${callbackType} AudioRoutingManagerCallbackType is registered, no need to re-registered")
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

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func on(`type`: AudioRoutingManagerCallbackType, capturerInfo: AudioCapturerInfo,
        callback: Callback1Argument<AudioDeviceDescriptors>): Unit {
        if (`type` != PREFERRED_INPUT_DEVICE_CHANGE_FOR_CAPTURER_INFO) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is preferredInputDeviceChangeForCapturerInfo")
            checkRet(ERR_INVALID_PARAM, "[AudioRoutingManager] on:")
        }
        subscribe1ArgWithCapturerInfo(`type`, capturerInfo, callback) {
            infos: CArrDeviceDescriptor => unsafe {
                cArr2cjArr<CAudioDeviceDescriptor, AudioDeviceDescriptor>(infos.size, infos.head,
                    {i => AudioDeviceDescriptor(i)})
            }
        }
        return
    }

    private func registerWithCapturerInfo(callbackType: AudioRoutingManagerCallbackType,
        capturerInfo: AudioCapturerInfo, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAARMOnWithCapturerInfo(getID(), callbackType.getValue(), id, capturerInfo.toCAudioCapturerInfo(),
                    inout errorCode)
            }
            checkRet(errorCode, "[AudioRoutingManagerCallbackType] register:")
        }
    }

    private func subscribe1ArgWithCapturerInfo<CT, T>(callbackType: AudioRoutingManagerCallbackType,
        capturerInfo: AudioCapturerInfo, callback: CallbackObject, ctor: (CT) -> T): Unit where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioRoutingManagerCallbackType ${callbackType}")
        if (registerMap[callbackType].compareAndSwap(false, true)) {
            registerWithCapturerInfo(callbackType, capturerInfo, argWrapper1<CT, T>(callbackType, ctor))
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                AUDIO_LOG.info(
                    "The ${callbackType} AudioRoutingManagerCallbackType is registered, no need to re-registered")
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

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func on(`type`: AudioRoutingManagerCallbackType, deviceUsage: DeviceUsage,
        callback: Callback1Argument<DeviceChangeAction>): Unit {
        if (`type` != AVAILABLE_DEVICE_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is availableDeviceChange")
            checkRet(ERR_INVALID_PARAM, "[AudioRoutingManager] on:")
        }
        subscribe1Arg(`type`, deviceUsage, callback) {
            infos: CDeviceChangeAction => DeviceChangeAction(infos)
        }
        return
    }

    /**
     * Subscribes to prefer output device change events. When prefer device for target audio renderer info changes,
     * registered clients will receive the callback.
     * @param { 'preferOutputDeviceChangeForRendererInfo' } type - Type of the event to listen for. Only the
     * preferOutputDeviceChangeForRendererInfo event is supported.
     * @param { AudioRendererInfo } rendererInfo - Audio renderer information.
     * @param { Callback<AudioDeviceDescriptors> } callback - Callback used to obtain the changed prefer devices information.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func on(`type`: AudioRoutingManagerCallbackType, rendererInfo: AudioRendererInfo,
        callback: Callback1Argument<AudioDeviceDescriptors>): Unit {
        if (`type` != PREFERR_OUTPUT_DEVICE_CHANGE_FOR_RENDERER_INFO) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is preferredOutputDeviceChangeForCapturerInfo")
            checkRet(ERR_INVALID_PARAM, "[AudioRoutingManager] on:")
        }
        subscribe1ArgWithRendererInfo(`type`, rendererInfo, callback) {
            infos: CArrDeviceDescriptor => unsafe {
                cArr2cjArr<CAudioDeviceDescriptor, AudioDeviceDescriptor>(infos.size, infos.head,
                    {i => AudioDeviceDescriptor(i)})
            }
        }
        return
    }

    private func registerWithRendererInfo(callbackType: AudioRoutingManagerCallbackType,
        rendererInfo: AudioRendererInfo, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAARMOnWithRendererInfo(getID(), callbackType.getValue(), id, rendererInfo.toCAudioRendererInfo(),
                    inout errorCode)
            }
            checkRet(errorCode, "[AudioRoutingManagerCallbackType] register:")
        }
    }

    private func subscribe1ArgWithRendererInfo<CT, T>(callbackType: AudioRoutingManagerCallbackType,
        rendererInfo: AudioRendererInfo, callback: CallbackObject, ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioRoutingManagerCallbackType ${callbackType}")
        if (registerMap[callbackType].compareAndSwap(false, true)) {
            registerWithRendererInfo(callbackType, rendererInfo, argWrapper1<CT, T>(callbackType, ctor))
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                AUDIO_LOG.info(
                    "The ${callbackType} AudioRoutingManagerCallbackType is registered, no need to re-registered")
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

    /**
     * UnSubscribes to  events.
     * @param { AudioRoutingManagerCallbackType } type - Type of the event to listen for.
     * @param { CallbackObject } callback
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func off(`type`: AudioRoutingManagerCallbackType, callback!: ?CallbackObject = None): Unit {
        AUDIO_LOG.debug("unsubscribe AudioRoutingManagerCallbackType ${`type`}")
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

    private func register(callbackType: AudioRoutingManagerCallbackType, deviceUsage: DeviceUsage, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAARMOn(getID(), callbackType.getValue(), deviceUsage.value, id, inout errorCode)
            }
            checkRet(errorCode, "[AudioRoutingManagerCallbackType] register:")
        }
    }

    private func argWrapper1<CT, T>(callbackType: AudioRoutingManagerCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
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

    private func subscribe1Arg<CT, T>(callbackType: AudioRoutingManagerCallbackType, deviceUsage: DeviceUsage,
        callback: CallbackObject, ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioRoutingManagerCallbackType ${callbackType}")
        if (registerMap[callbackType].compareAndSwap(false, true)) {
            register(callbackType, deviceUsage, argWrapper1<CT, T>(callbackType, ctor))
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                AUDIO_LOG.info(
                    "The ${callbackType} AudioRoutingManagerCallbackType is registered, no need to re-registered")
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

    private func findCallbackObject(callbackType: AudioRoutingManagerCallbackType, callback: CallbackObject,
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

    private let mapMutex = Mutex()
    private let listMutex = Mutex()
    private let callbackMap = HashMap<AudioRoutingManagerCallbackType, ArrayList<CallbackObject>>()
    private let registerMap = HashMap<AudioRoutingManagerCallbackType, AtomicBool>(
        [(DEVICE_CHANGE, AtomicBool(false)), (AVAILABLE_DEVICE_CHANGE, AtomicBool(false)),
            (PREFERRED_INPUT_DEVICE_CHANGE_FOR_CAPTURER_INFO, AtomicBool(false)),
            (PREFERR_OUTPUT_DEVICE_CHANGE_FOR_RENDERER_INFO, AtomicBool(false))])
}

/**
 * Implements audio volume and audio device management.
 * @typedef AudioManager
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public class AudioManager <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Obtains an {@link AudioRoutingManager} instance.
     * @returns { AudioRoutingManager } AudioRoutingManager instance.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func getRoutingManager(): AudioRoutingManager {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe { id = FfiMMAAudioManagerGetRoutingManager(getID(), inout errorCode) }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, "Create AudioRoutingManager failed")
        }
        AudioRoutingManager(id)
    }

    /**
     * Obtains an {@link AudioStreamManager} instance.
     * @returns { AudioStreamManager } AudioStreamManager instance.
     * @syscap SystemCapability.Multimedia.Audio.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public func getStreamManager(): AudioStreamManager {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe { id = FfiMMAAudioManagerGetStreamManager(getID(), inout errorCode) }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, "Create AudioStreamManager failed")
        }
        AudioStreamManager(id)
    }

    /**
     * Obtains an {@link AudioVolumeManager} instance.
     * @returns { AudioVolumeManager } AudioVolumeManager instance.
     * @syscap SystemCapability.Multimedia.Audio.Volume
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func getVolumeManager(): AudioVolumeManager {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe { id = FfiMMAAudioManagerGetVolumeManager(getID(), inout errorCode) }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, "Create AudioVolumeManager failed")
        }
        return AudioVolumeManager(id)
    }

    /**
     * Obtains all the available audio devices with a specific device usage.
     *
     * @throws { BusinessException } 6800301 - [AudioManager] getSessionManger: System error.
     * @relation getSessionManager(): AudioSessionManager
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public func getSessionManager(): AudioSessionManager {
        var errorCode = SUCCESS_CODE
        let id: Int64 = unsafe { FfiMMAAudioManagerGetSessionManager(getID(), inout errorCode) }
        checkRet(errorCode, "[AudioManager] getSessionManager:")
        return AudioSessionManager(id)
    }

    /**
     * Obtains the audio scene mode.
     * @returns { AudioScene } Current audio scene mode.
     * @syscap SystemCapability.Multimedia.Audio.Communication
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    public func getAudioScene(): AudioScene {
        unsafe {
            var errorCode = SUCCESS_CODE
            let val = FfiMMAAudioManagerGetAudioScene(getID(), inout errorCode)
            checkRet(errorCode, "[AudioManager] getAudioScene:")
            AudioScene.parse(val)
        }
    }
}
