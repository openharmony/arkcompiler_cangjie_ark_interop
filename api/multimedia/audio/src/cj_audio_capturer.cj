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

import ohos.base.*
import ohos.labels.*
import std.collection.ArrayList
import std.sync.Mutex
import std.collection.HashMap
import std.sync.AtomicBool
import ohos.ffi.*
/**
 * Obtains an {@link AudioCapturer} instance.
 * @param { AudioCapturerOptions } options - Capturer configurations.
 * @returns { AudioCapturer } return the audio capturer instance.
 * @syscap SystemCapability.Multimedia.Audio.Capturer
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Capturer"
]
public func createAudioCapturer(options: AudioCapturerOptions): AudioCapturer {
    let cOptions = options.toCAudioCapturerOptions()
    var errorCode = SUCCESS_CODE
    let id: Int64
    unsafe { id = FfiMMACreateAudioCapturer(cOptions, inout errorCode) }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, "Create AudioCapturer failed")
    }
    AudioCapturer(id)
}

@C
protected struct CAudioCapturerInfo {
    protected CAudioCapturerInfo(let capturerFlags: Int32, let source: Int32) {}
}

/**
 * Describes audio capturer information.
 * @typedef AudioCapturerInfo
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public class AudioCapturerInfo {
    var _capturerFlags: Int32
    var _source: SourceType

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public AudioCapturerInfo(source: SourceType, capturerFlags: Int32) {
        _source = source
        _capturerFlags = capturerFlags
    }

    init(cInfo: CAudioCapturerInfo) {
        _capturerFlags = cInfo.capturerFlags
        _source = SourceType.parse(cInfo.source)
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop capturerFlags: Int32 {
        get() {
            _capturerFlags
        }
        set(v) {
            _capturerFlags = v
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop source: SourceType {
        get() {
            _source
        }
        set(v) {
            _source = v
        }
    }

    func toCAudioCapturerInfo(): CAudioCapturerInfo {
        CAudioCapturerInfo(_capturerFlags, _source.value)
    }
}

@C
struct CAudioCapturerOptions {
    CAudioCapturerOptions(
        let capturerInfo: CAudioCapturerInfo,
        let streamInfo: CAudioStreamInfo
    ) {}
}

/**
 * Describes audio capturer configuration options.
 * @typedef AudioCapturerOptions
 * @syscap SystemCapability.Multimedia.Audio.Capturer
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Capturer"
]
public class AudioCapturerOptions {
    var _capturerInfo: AudioCapturerInfo
    var _streamInfo: AudioStreamInfo

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public AudioCapturerOptions(captureInfo: AudioCapturerInfo, streamInfo: AudioStreamInfo) {
        _capturerInfo = captureInfo
        _streamInfo = streamInfo
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public mut prop capturerInfo: AudioCapturerInfo {
        get() {
            _capturerInfo
        }
        set(v) {
            _capturerInfo = v
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public mut prop streamInfo: AudioStreamInfo {
        get() {
            _streamInfo
        }
        set(v) {
            _streamInfo = v
        }
    }

    func toCAudioCapturerOptions(): CAudioCapturerOptions {
        CAudioCapturerOptions(_capturerInfo.toCAudioCapturerInfo(), _streamInfo.toCAudioStreamInfo())
    }
}

@C
protected struct CAudioCapturerChangeInfo {
    protected CAudioCapturerChangeInfo(
        protected let capturerInfo: CAudioCapturerInfo,
        protected let deviceDescriptors: CArrDeviceDescriptor,
        protected let muted: NativeOptionBool,
        protected let streamId: Int32
    ) {}

    protected func free() {
        freeCArrDeviceDescriptor(this.deviceDescriptors)
    }
}

/**
 * Describes audio capturer change information.
 * @typedef AudioCapturerChangeInfo
 * @syscap SystemCapability.Multimedia.Audio.Capturer
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Capturer"
]
public class AudioCapturerChangeInfo {
    protected let _capturerInfo: AudioCapturerInfo
    protected let _deviceDescriptors: AudioDeviceDescriptors
    protected let _muted: ?Bool
    protected let _streamId: Int32

    protected init(cInfo: CAudioCapturerChangeInfo) {
        _capturerInfo = AudioCapturerInfo(cInfo.capturerInfo)
        unsafe {
            _deviceDescriptors = cArr2cjArr<CAudioDeviceDescriptor, AudioDeviceDescriptor>(cInfo.deviceDescriptors.size,
                cInfo.deviceDescriptors.head, {i => AudioDeviceDescriptor(i)})
        }
        _streamId = cInfo.streamId
        if (cInfo.muted.hasValue) {
            _muted = cInfo.muted.value
        } else {
            _muted = None
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public prop streamId: Int32 {
        get() {
            _streamId
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public prop muted: ?Bool {
        get() {
            _muted
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public prop capturerInfo: AudioCapturerInfo {
        get() {
            _capturerInfo
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public prop deviceDescriptors: AudioDeviceDescriptors {
        get() {
            _deviceDescriptors
        }
    }
}

/**
 * Provides APIs for audio recording.
 * @typedef AudioCapturer
 * @syscap SystemCapability.Multimedia.Audio.Capturer
 * @crossplatform
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Capturer"
]
public class AudioCapturer <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Defines the current capture state.
     * @type { AudioState }
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public prop state: AudioState {
        get() {
            let val: Int32
            unsafe {
                var errorCode = SUCCESS_CODE
                val = FfiMMAAudioCapturerGetState(getID(), inout errorCode)
                checkRet(errorCode, "[AudioCapturer] state:")
            }
            AudioState.parse(val)
        }
    }

    /**
     * Obtains the capturer information provided while creating a capturer instance.
     * @returns { AudioCapturerInfo } The capturer information.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func getCapturerInfo(): AudioCapturerInfo {
        let cInfo: CAudioCapturerInfo
        unsafe {
            var errorCode = SUCCESS_CODE
            cInfo = FfiMMAAudioCapturerGetCapturerInfo(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] getCapturerInfo:")
        }
        AudioCapturerInfo(cInfo)
    }

    /**
     * Obtains the capturer stream information.
     * @returns { AudioStreamInfo } The stream information.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func getStreamInfo(): AudioStreamInfo {
        let cInfo: CAudioStreamInfo
        unsafe {
            var errorCode = SUCCESS_CODE
            cInfo = FfiMMAAudioCapturerGetStreamInfo(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] getStreamInfo:")
        }
        AudioStreamInfo(cInfo)
    }

    /**
     * Obtains the capturer stream id.
     * @returns { UInt32 } The stream id.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func getAudioStreamId(): UInt32 {
        let id: UInt32
        unsafe {
            var errorCode = SUCCESS_CODE
            id = FfiMMAAudioCapturerGetStreamId(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] getAudioStreamId:")
        }
        id
    }

    /**
     * Obtains the timestamp in Unix epoch time (starts from January 1, 1970), in nanoseconds.
     * @returns { Int64 } The audio timestamp.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func getAudioTime(): Int64 {
        let time: Int64
        unsafe {
            var errorCode = SUCCESS_CODE
            time = FfiMMAAudioCapturerGetAudioTime(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] getAudioTime:")
        }
        time
    }
    /**
     * Obtains a reasonable minimum buffer size in bytes for capturing.
     * @returns { UInt32 } return the buffer size.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func getBufferSize(): UInt32 {
        let size: UInt32
        unsafe {
            var errorCode = SUCCESS_CODE
            size = FfiMMAAudioCapturerGetBufferSize(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] getBufferSize:")
        }
        size
    }

    /**
     * Gets overflow count.
     * @returns { UInt32 } Overflow count number.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func getOverflowCount(): UInt32 {
        let count: UInt32
        unsafe {
            var errorCode = SUCCESS_CODE
            count = FfiMMAAudioCapturerGetOverflowCount(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] getOverflowCount:")
        }
        count
    }

    /**
     * Starts capturing.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func start(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAAudioCapturerStart(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] start:")
        }
    }

    /**
     * Stops capturing.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func stop(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAAudioCapturerStop(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] stop:")
        }
    }

    /**
     * Releases the capturer.
     * @syscap SystemCapability.Multimedia.Audio.Capturer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func release(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAAudioCapturerRelease(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] release:")
            releaseFFIData(getID())
        }
    }

    /**
     * Gets full capturer info for this stream.
     * @returns { AudioCapturerChangeInfo } Full capture info.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func getCurrentAudioCapturerChangeInfo(): AudioCapturerChangeInfo {
        let cInfo: CAudioCapturerChangeInfo
        unsafe {
            var errorCode = SUCCESS_CODE
            cInfo = FfiMMAAudioCapturerGetAudioCapturerChangeInfo(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] getCurrentAudioCapturerChangeInfo:")
        }
        let info = AudioCapturerChangeInfo(cInfo)
        cInfo.free()
        info
    }

    /**
     * Gets the input device or devices for this stream.
     * @returns { AudioDeviceDescriptors } Descriptors of input devices.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func getCurrentInputDevices(): AudioDeviceDescriptors {
        let cInputDevices: CArrDeviceDescriptor
        unsafe {
            var errorCode = SUCCESS_CODE
            cInputDevices = FfiMMAAudioCapturerGetInputDevices(getID(), inout errorCode)
            checkRet(errorCode, "[AudioCapturer] getCurrentInputDevices:")
        }
        let inputDevices = cInputDevices.toAudioDeviceDescriptors()
        freeCArrDeviceDescriptor(cInputDevices)
        inputDevices
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func on(`type`: AudioCapturerCallbackType, frame: Int64, callback: Callback1Argument<Int64>): Unit {
        if (`type` != PERIOD_REACH && `type` != MARK_REACH) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is markReach or periodReach")
            checkRet(ERR_INVALID_PARAM, "[AudioCapturer] on:")
        }
        match (`type`) {
            case PERIOD_REACH => commonSubscribe1Arg(`type`, callback, true, frame) {param: Int64 => param}
            case MARK_REACH => commonSubscribe1Arg(`type`, callback, true, frame) {param: Int64 => param}
            case _ => checkRet(ERR_INVALID_PARAM, "[AudioCapturer] on:")
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func on(`type`: AudioCapturerCallbackType, callback: Callback1Argument<AudioCapturerChangeInfo>): Unit {
        if (`type` != AUDIO_CAPTURER_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is audioCapturerChange")
            checkRet(ERR_INVALID_PARAM, "[AudioCapturer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            info: CAudioCapturerChangeInfo => AudioCapturerChangeInfo(info)
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func on(`type`: AudioCapturerCallbackType, callback: Callback1Argument<AudioDeviceDescriptors>): Unit {
        if (`type` != INPUT_DEVICE_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is inputDeviceChange")
            checkRet(ERR_INVALID_PARAM, "[AudioCapturer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            devices: CArrDeviceDescriptor => unsafe {
                cArr2cjArr<CAudioDeviceDescriptor, AudioDeviceDescriptor>(devices.size, devices.head,
                    {i => AudioDeviceDescriptor(i)})
            }
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    public func on(`type`: AudioCapturerCallbackType, callback: Callback1Argument<Array<Byte>>): Unit {
        if (`type` != READ_DATA) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is readData")
            checkRet(ERR_INVALID_PARAM, "[AudioCapturer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            event: CArrUI8 => unsafe { cArr2cjArr<UInt8, Byte>(event.size, event.head, {i => i}) }
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Interrupt"
    ]
    public func on(`type`: AudioCapturerCallbackType, callback: Callback1Argument<InterruptEvent>): Unit {
        if (`type` != AUDIO_INTERRUPT) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is audioInterrupt")
            checkRet(ERR_INVALID_PARAM, "[AudioCapturer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            event: CInterruptEvent => event.toInterruptEvent()
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func on(`type`: AudioCapturerCallbackType, callback: Callback1Argument<AudioState>): Unit {
        if (`type` != STATE_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is stateChange")
            checkRet(ERR_INVALID_PARAM, "[AudioCapturer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            state: Int32 => AudioState.parse(state)
        }
        return
    }

    private func commonSubscribe1Arg<CT, T>(callbackType: AudioCapturerCallbackType, callback: CallbackObject,
        hasFrame: Bool, frame: Int64, ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioCapturerCallback ${callbackType}")
        if (registerMap[callbackType].compareAndSwap(false, true)) {
            if (hasFrame) {
                registerWithFrame(callbackType, frame, argWrapper1<CT, T>(callbackType, ctor))
            } else {
                register(callbackType, argWrapper1<CT, T>(callbackType, ctor))
            }
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                AUDIO_LOG.info("The ${callbackType} AudioCapturerCallback is registered, no need to re-registered")
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

    private func register(callbackType: AudioCapturerCallbackType, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAAudioCapturerOn(getID(), callbackType.getValue(), id, inout errorCode)
            }
            checkRet(errorCode, "[AudioCapturer] register:")
        }
    }

    private func registerWithFrame(callbackType: AudioCapturerCallbackType, frame: Int64, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAAudioCapturerOnWithFrame(getID(), callbackType.getValue(), id, frame, inout errorCode)
            }
            checkRet(errorCode, "[AudioCapturer] register:")
        }
    }

    private func argWrapper1<CT, T>(callbackType: AudioCapturerCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
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

    /**
     * Unsubscribes input device change event callback.
     * @param { AudioCapturerCallbackType } type - Type of the event to listen for.
     * @param { ?CallbackObject } callback - Callback used to listen for the pairing request event.
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
        syscap: "SystemCapability.Multimedia.Audio.DEVICE"
    ]
    public func off(`type`: AudioCapturerCallbackType, callback!: ?CallbackObject = None): Unit {
        AUDIO_LOG.debug("unsubscribe AudioCapturerCallback ${`type`}")
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

    private func findCallbackObject(callbackType: AudioCapturerCallbackType, callback: CallbackObject,
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
    private let callbackMap = HashMap<AudioCapturerCallbackType, ArrayList<CallbackObject>>()
    private let registerMap = HashMap<AudioCapturerCallbackType, AtomicBool>(
        [
            (AUDIO_CAPTURER_CHANGE, AtomicBool(false)),
            (AUDIO_INTERRUPT, AtomicBool(false)),
            (INPUT_DEVICE_CHANGE, AtomicBool(false)),
            (MARK_REACH, AtomicBool(false)),
            (PERIOD_REACH, AtomicBool(false)),
            (READ_DATA, AtomicBool(false)),
            (STATE_CHANGE, AtomicBool(false))
        ]
    )
}
