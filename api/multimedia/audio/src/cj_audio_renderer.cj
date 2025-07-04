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

import ohos.labels.*
import std.collection.ArrayList
import std.sync.Mutex
import std.collection.HashMap
import std.sync.AtomicBool
import ohos.base.*
import ohos.ffi.*
/**
 * Obtains an {@link AudioRenderer} instance.
 * @param { AudioRendererOptions } options - Renderer configurations.
 * @returns { AudioRenderer } return the audio renderer instance.
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public func createAudioRenderer(options: AudioRendererOptions): AudioRenderer {
    let cOptions = options.toCAudioRendererOptions()
    var errorCode = SUCCESS_CODE
    let id: Int64
    unsafe { id = FfiMMACreateAudioRenderer(cOptions, inout errorCode) }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, "Create AudioRenderer failed")
    }
    AudioRenderer(id)
}

@C
protected struct CAudioRendererInfo {
    protected CAudioRendererInfo(let usage: Int32, let rendererFlags: Int32) {}
}

/**
 * Describes audio renderer information.
 * @typedef AudioRendererInfo
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public class AudioRendererInfo {
    var _usage: StreamUsage
    var _rendererFlags: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public AudioRendererInfo(usage: StreamUsage, rendererFlags: Int32) {
        _usage = usage
        _rendererFlags = rendererFlags
    }

    protected init(cInfo: CAudioRendererInfo) {
        _usage = StreamUsage.parse(cInfo.usage)
        _rendererFlags = cInfo.rendererFlags
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop usage: StreamUsage {
        get() {
            _usage
        }
        set(v) {
            _usage = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop rendererFlags: Int32 {
        get() {
            _rendererFlags
        }
        set(v) {
            _rendererFlags = v
        }
    }

    protected func toCAudioRendererInfo(): CAudioRendererInfo {
        CAudioRendererInfo(_usage.value, _rendererFlags)
    }
}

@C
struct CAudioRendererOptions {
    CAudioRendererOptions(let rendererInfo: CAudioRendererInfo, let streamInfo: CAudioStreamInfo, let privacyType: Int32) {}
}

/**
 * Describes audio renderer configuration options.
 * @typedef AudioRendererOptions
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public class AudioRendererOptions {
    var _rendererInfo: AudioRendererInfo
    var _streamInfo: AudioStreamInfo
    var _privacyType: AudioPrivacyType

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public AudioRendererOptions(rendererInfo: AudioRendererInfo, streamInfo: AudioStreamInfo,
        privacyType!: AudioPrivacyType = PRIVACY_TYPE_PUBLIC) {
        _rendererInfo = rendererInfo
        _streamInfo = streamInfo
        _privacyType = privacyType
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public mut prop rendererInfo: AudioRendererInfo {
        get() {
            _rendererInfo
        }
        set(v) {
            _rendererInfo = v
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public mut prop streamInfo: AudioStreamInfo {
        get() {
            _streamInfo
        }
        set(v) {
            _streamInfo = v
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.PlaybackCapture"
    ]
    public mut prop privacyType: AudioPrivacyType {
        get() {
            _privacyType
        }
        set(v) {
            _privacyType = v
        }
    }
    func toCAudioRendererOptions(): CAudioRendererOptions {
        CAudioRendererOptions(
            _rendererInfo.toCAudioRendererInfo(),
            _streamInfo.toCAudioStreamInfo(),
            _privacyType.value
        )
    }
}

@C
struct CAudioRendererChangeInfo {
    CAudioRendererChangeInfo(
        let rendererInfo: CAudioRendererInfo,
        let deviceDescriptors: CArrDeviceDescriptor,
        let streamId: Int32
    ) {}

    func free() {
        freeCArrDeviceDescriptor(this.deviceDescriptors)
    }
}

/**
 * Describes audio renderer change information.
 * @typedef AudioRendererChangeInfo
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public class AudioRendererChangeInfo {
    let _streamId: Int32
    let _deviceDescriptors: AudioDeviceDescriptors
    let _rendererInfo: AudioRendererInfo

    init(cInfo: CAudioRendererChangeInfo) {
        _streamId = cInfo.streamId
        unsafe {
            _deviceDescriptors = cArr2cjArr<CAudioDeviceDescriptor, AudioDeviceDescriptor>(cInfo.deviceDescriptors.size,
                cInfo.deviceDescriptors.head, {i => AudioDeviceDescriptor(i)})
        }
        _rendererInfo = AudioRendererInfo(cInfo.rendererInfo)
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
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
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public prop rendererInfo: AudioRendererInfo {
        get() {
            _rendererInfo
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public prop deviceDescriptors: AudioDeviceDescriptors {
        get() {
            _deviceDescriptors
        }
    }
}

/**
 * Provides audio playback APIs.
 * @typedef AudioRenderer
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public class AudioRenderer <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Audio state.
     * @type { AudioState }
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public prop state: AudioState {
        get() {
            let val: Int32
            unsafe {
                var errorCode = SUCCESS_CODE
                val = FfiMMAARGetState(getID(), inout errorCode)
                checkRet(errorCode, "[AudioRenderer] state:")
            }
            AudioState.parse(val)
        }
    }

    /**
     * Drains the playback buffer
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func drain(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARDrain(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] drain:")
        }
    }

    /**
     * Flushes the playback buffer
     * @throws { BusinessException } 6800103 - Operation not permit at current state.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func flush(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARFlush(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] flush:")
        }
    }

    /**
     * Releases the renderer.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func release(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARRelease(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] release:")
            releaseFFIData(getID())
        }
    }

    /**
     * Pauses rendering
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func pause(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARPause(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] pause:")
        }
    }

    /**
     * Starts the renderer
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func start(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARStart(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] start:")
        }
    }

    /**
     * Stops rendering
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func stop(): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARStop(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] stop:")
        }
    }

    /**
     * Obtains the current audio effect mode.
     * @returns { AudioEffectMode } return the current audio effect mode.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getAudioEffectMode(): AudioEffectMode {
        let val: Int32
        unsafe {
            var errorCode = SUCCESS_CODE
            val = FfiMMAARGetAudioEffectMode(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getAudioEffectMode:")
        }
        AudioEffectMode.parse(val)
    }

    /**
     * Obtains the renderer stream id.
     * @returns { UInt32 } The stream id.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getAudioStreamId(): UInt32 {
        let id: UInt32
        unsafe {
            var errorCode = SUCCESS_CODE
            id = FfiMMAARGetStreamId(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getAudioStreamId:")
        }
        id
    }

    /**
     * Obtains the timestamp in Unix epoch time (starts from January 1, 1970), in nanoseconds.
     * @returns { Int64 } The audio timestamp.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getAudioTime(): Int64 {
        let time: Int64
        unsafe {
            var errorCode = SUCCESS_CODE
            time = FfiMMAARGetAudioTime(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getAudioTime:")
        }
        time
    }

    /**
     * Obtains a reasonable minimum buffer size in bytes for rendering.
     * @returns { UInt32 } The audio buffer size.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getBufferSize(): UInt32 {
        let size: UInt32
        unsafe {
            var errorCode = SUCCESS_CODE
            size = FfiMMAARGetBufferSize(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getBufferSize:")
        }
        size
    }

    /**
     * Gets the output device or devices for this stream.
     * @returns { AudioDeviceDescriptors } Output device or devices.
     * @syscap SystemCapability.Multimedia.Audio.Device
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getCurrentOutputDevices(): AudioDeviceDescriptors {
        let cInputDevices: CArrDeviceDescriptor
        unsafe {
            var errorCode = SUCCESS_CODE
            cInputDevices = FfiMMAARGetCurrentOutputDevices(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getCurrentOutputDevices:")
        }
        let inputDevices = cInputDevices.toAudioDeviceDescriptors()
        freeCArrDeviceDescriptor(cInputDevices)
        inputDevices
    }

    /**
     * Gets the max volume this stream can set.
     * @returns { Float64 } Max stream volume.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getMaxStreamVolume(): Float64 {
        let val: Float64
        unsafe {
            var errorCode = SUCCESS_CODE
            val = FfiMMAARGetMaxStreamVolume(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getMaxStreamVolume:")
        }
        val
    }

    /**
     * Gets the min volume this stream can set.
     * @returns { Float64 } Min stream volume.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getMinStreamVolume(): Float64 {
        let val: Float64
        unsafe {
            var errorCode = SUCCESS_CODE
            val = FfiMMAARGetMinStreamVolume(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getMinStreamVolume:")
        }
        val
    }

    /**
     * Obtains the renderer information provided while creating a renderer instance.
     * @returns { AudioRendererInfo } The renderer information.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getRendererInfo(): AudioRendererInfo {
        let cInfo: CAudioRendererInfo
        unsafe {
            var errorCode = SUCCESS_CODE
            cInfo = FfiMMAARGetRendererInfo(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getRendererInfo:")
        }
        AudioRendererInfo(cInfo)
    }

    /**
     * Obtains the current playback speed.
     * @returns { Float64 } The playback speed.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getSpeed(): Float64 {
        let val: Float64
        unsafe {
            var errorCode = SUCCESS_CODE
            val = FfiMMAARGetSpeed(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getSpeed:")
        }
        val
    }

    /**
     * Gets silent and mix with other stream status for this stream.
     * @returns { Bool } Returns silent and mix with other stream status.
     *     true: current stream is in the silent mode and mix with other streams.
     *     false: current stream in in the normal playback mode
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getSilentModeAndMixWithOthers(): Bool {
        let val: Bool
        unsafe {
            var errorCode = SUCCESS_CODE
            val = FfiMMAARGetSilentModeAndMixWithOthers(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getSilentModeAndMixWithOthers:")
        }
        val
    }

    /**
     * Obtains the capturer stream information.
     * @returns { AudioStreamInfo } The stream information.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getStreamInfo(): AudioStreamInfo {
        let cInfo: CAudioStreamInfo
        unsafe {
            var errorCode = SUCCESS_CODE
            cInfo = FfiMMAARGetStreamInfo(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getStreamInfo:")
        }
        AudioStreamInfo(cInfo)
    }

    /**
     * Gets volume of this stream.
     * @returns { Float64 } Returns one float value.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getVolume(): Float64 {
        let val: Float64
        unsafe {
            var errorCode = SUCCESS_CODE
            val = FfiMMAARGetVolume(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getVolume:")
        }
        val
    }

    /**
     * Gets buffer underflow count.
     * @returns { UInt32 } Underflow count number.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func getUnderflowCount(): UInt32 {
        let val: UInt32
        unsafe {
            var errorCode = SUCCESS_CODE
            val = FfiMMAARGetUnderflowCount(getID(), inout errorCode)
            checkRet(errorCode, "[AudioRenderer] getUnderflowCount:")
        }
        val
    }

    /**
     * Changes the volume with ramp for a duration.
     * @param { Float32 } volume - Volume to set. The value type is float, form 0.0 to 1.0.
     * @param { Int32 } duration -  Duration for volume ramp, in millisecond.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func setVolumeWithRamp(volume: Float64, duration: Int32): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARSetVolumeWithRamp(getID(), volume, duration, inout errorCode)
            checkRet(errorCode, "[AudioRenderer] setVolumeWithRamp:")
        }
    }

    /**
     * Sets the playback speed.
     * @param { Float32 } speed -  Audio playback speed. The value type is float, form 0.25 to 4.0.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func setSpeed(speed: Float64): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARSetSpeed(getID(), speed, inout errorCode)
            checkRet(errorCode, "[AudioRenderer] setSpeed:")
        }
    }

    /**
     * Sets the volume for a stream.
     * @param { Float32 } volume - Volume to set. The value type is float, form 0.0 to 1.0.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func setVolume(volume: Float64): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARSetVolume(getID(), volume, inout errorCode)
            checkRet(errorCode, "[AudioRenderer] setVolume:")
        }
    }

    /**
     * Sets silent and mix with other stream for this stream.
     * @param { Bool } on - Whether play silent and mix with other streams.
     *     true: set the silent mode and mix with other streams.
     *     false: unset the silent mode, current stream will trigger the audio focus internally.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func setSilentModeAndMixWithOthers(on: Bool): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARSetSilentModeAndMixWithOthers(getID(), on, inout errorCode)
            checkRet(errorCode, "[AudioRenderer] setSilentModeAndMixWithOthers:")
        }
    }

    /**
     * Set interrupt mode.
     * @param { InterruptMode } mode - The interrupt mode.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Audio.Interrupt
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Interrupt"
    ]
    public func setInterruptMode(mode: InterruptMode): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARSetInterruptMode(getID(), mode.value, inout errorCode)
            checkRet(errorCode, "[AudioRenderer] setInterruptMode:")
        }
    }

    /**
     * Sets the current audio effect mode.
     * @param { AudioEffectMode } mode - Audio effect mode.
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
    public func setAudioEffectMode(mode: AudioEffectMode): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARSetAudioEffectMode(getID(), mode.value, inout errorCode)
            checkRet(errorCode, "[AudioRenderer] setAudioEffectMode:")
        }
    }

    /**
     * Sets channel blend mode for this stream.
     * @param { ChannelBlendMode } mode - Target channel blend mode.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *                                 1.Mandatory parameters are left unspecified;
     *                                 2.Incorrect parameter types.
     * @throws { BusinessException } 6800101 - Parameter verification failed.
     * @throws { BusinessException } 6800103 - Operation not permit at current state.
     * @syscap SystemCapability.Multimedia.Audio.Renderer
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func setChannelBlendMode(mode: ChannelBlendMode): Unit {
        unsafe {
            var errorCode = SUCCESS_CODE
            FfiMMAARSetChannelBlendMode(getID(), mode.value, inout errorCode)
            checkRet(errorCode, "[AudioRenderer] setAudioEffectMode:")
        }
    }

    /**
     * Obtains all the available audio devices with a specific device usage.
     *
     * @throws { BusinessException } 6800301 - [AudioRenderer] setDefaultOutputDevice:System error.
     * @throws { BusinessException } 6800103 - [AudioRenderer] setDefaultOutputDevice:Unsupported state.
     * @throws { IllegalArgumentException } - The type is not supported yet.
     * @relation getAvailableDevices(deviceUsage: DeviceUsage): AudioDeviceDescriptors
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func setDefaultOutputDevice(deviceType: DeviceType): Unit {
        var errorCode = SUCCESS_CODE
        if (deviceType != DeviceType.EARPIECE && deviceType != DeviceType.SPEAKER && deviceType != DeviceType.DEFAULT) {
            throw IllegalArgumentException("The type is not supported yet.")
        }
        unsafe { FfiMMAARSetDefaultOutputDevice(getID(), deviceType.value, inout errorCode) }
        checkRet(errorCode, "[AudioRenderer] setDefaultOutputDevice:")
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func on(
        `type`: AudioRendererCallbackType,
        callback: Callback1ArgumentWithReturn<Array<Byte>, AudioDataCallbackResult>
    ): Unit {
        if (`type` != AR_WRITE_DATA) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is writedata")
            checkRet(ERR_INVALID_PARAM, "[AudioRenderer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            result: CArrUI8 => unsafe { cArr2cjArr<UInt8, Byte>(result.size, result.head, {i => i}) }
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func on(`type`: AudioRendererCallbackType, callback: Callback1Argument<AudioStreamDeviceChangeInfo>): Unit {
        if (`type` != AR_OUTPUT_DEVICE_CHANGE_WITH_INFO) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is outputDeviceChangeWithInfo")
            checkRet(ERR_INVALID_PARAM, "[AudioRenderer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            info: CAudioStreamDeviceChangeInfo => AudioStreamDeviceChangeInfo(info)
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public func on(`type`: AudioRendererCallbackType, callback: Callback1Argument<AudioDeviceDescriptors>): Unit {
        if (`type` != AR_OUTPUT_DEVICE_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is outputDeviceChange")
            checkRet(ERR_INVALID_PARAM, "[AudioRenderer] on:")
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
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func on(`type`: AudioRendererCallbackType, callback: Callback1Argument<AudioState>): Unit {
        if (`type` != AR_STATE_CHANGE) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is stateChange")
            checkRet(ERR_INVALID_PARAM, "[AudioRenderer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            state: Int32 => AudioState.parse(state)
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Interrupt"
    ]
    public func on(`type`: AudioRendererCallbackType, callback: Callback1Argument<InterruptEvent>): Unit {
        if (`type` != AR_AUDIO_INTERRUPT) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is audioInterrupt")
            checkRet(ERR_INVALID_PARAM, "[AudioRenderer] on:")
        }
        commonSubscribe1Arg(`type`, callback, false, INVALID_FRAME) {
            info: CInterruptEvent => InterruptEvent(info)
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public func on(`type`: AudioRendererCallbackType, frame: Int64, callback: Callback1Argument<Int64>): Unit {
        if (`type` != AR_PERIOD_REACH && `type` != AR_MARK_PEACH) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is markReach or periodReach")
            checkRet(ERR_INVALID_PARAM, "[AudioRenderer] on:")
        }
        match (`type`) {
            case AR_PERIOD_REACH => commonSubscribe1Arg(`type`, callback, true, frame) {param: Int64 => param}
            case AR_MARK_PEACH => commonSubscribe1Arg(`type`, callback, true, frame) {param: Int64 => param}
            case _ => checkRet(ERR_INVALID_PARAM, "[AudioRenderer] on:")
        }
        return
    }

    private func commonSubscribe1Arg<CT, T>(callbackType: AudioRendererCallbackType, callback: CallbackObject,
        hasFrame: Bool, frame: Int64, ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioRendererCallbackType ${callbackType}")
        if (registerMap[callbackType].compareAndSwap(false, true)) {
            if (hasFrame) {
                registerWithFrame(callbackType, frame, argWrapper1<CT, T>(callbackType, ctor))
            } else if (callbackType == AudioRendererCallbackType.AR_WRITE_DATA) {
                register(callbackType, argWrapper1WithReturn<CT, T>(callbackType, ctor))
            } else {
                register(callbackType, argWrapper1<CT, T>(callbackType, ctor))
            }
        } else {
            if (findCallbackObject(callbackType, callback) >= 0) {
                AUDIO_LOG.info("The ${callbackType} AudioRendererCallbackType is registered, no need to re-registered")
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

    private func register(callbackType: AudioRendererCallbackType, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAAROn(getID(), callbackType.getValue(), id, inout errorCode)
            }
            checkRet(errorCode, "[AudioRenderer] register:")
        }
    }

    private func registerWithFrame(callbackType: AudioRendererCallbackType, frame: Int64, id: Int64) {
        synchronized(mapMutex) {
            var errorCode = SUCCESS_CODE
            unsafe {
                FfiMMAAROnWithFrame(getID(), callbackType.getValue(), id, frame, inout errorCode)
            }
            checkRet(errorCode, "[AudioRenderer] register:")
        }
    }

    private func argWrapper1<CT, T>(callbackType: AudioRendererCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper = {
            ctype: CT =>
            let cjType = ctor(ctype)
            let callbackList = synchronized(mapMutex) {
                callbackMap.get(callbackType) ?? ArrayList<CallbackObject>()
            }
            for (caller in callbackList) {
                if (callbackType != AudioRendererCallbackType.AR_WRITE_DATA) {
                    (caller as Callback1Argument<T>)?.invoke(cjType)
                }
            }
        }
        let registerCall = Callback1Param<CT, Unit>(wrapper)
        registerCall.getID()
    }

    private func argWrapper1WithReturn<CT, T>(callbackType: AudioRendererCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper: (CT) -> Int32 = {
            ctype: CT =>
            let cjType = ctor(ctype)
            let callbackList = synchronized(mapMutex) {
                callbackMap.get(callbackType) ?? ArrayList<CallbackObject>()
            }
            for (caller in callbackList) {
                if (callbackType == AudioRendererCallbackType.AR_WRITE_DATA) {
                    let cjRes = (caller as Callback1ArgumentWithReturn<T, AudioDataCallbackResult>)?.invoke(cjType)
                    return match (cjRes) {
                        case None => 0
                        case Some(v) => v.value
                    }
                }
            }
            return 0
        }
        let registerCall = Callback1Param<CT, Int32>(wrapper)
        registerCall.getID()
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public func off(`type`: AudioRendererCallbackType, callback!: ?CallbackObject = None): Unit {
        AUDIO_LOG.debug("unsubscribe AudioRendererCallback ${`type`}")
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

    private func findCallbackObject(callbackType: AudioRendererCallbackType, callback: CallbackObject,
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
    private let callbackMap = HashMap<AudioRendererCallbackType, ArrayList<CallbackObject>>()
    private let registerMap = HashMap<AudioRendererCallbackType, AtomicBool>(
        [
            (AR_AUDIO_INTERRUPT, AtomicBool(false)),
            (AR_MARK_PEACH, AtomicBool(false)),
            (AR_PERIOD_REACH, AtomicBool(false)),
            (AR_STATE_CHANGE, AtomicBool(false)),
            (AR_OUTPUT_DEVICE_CHANGE, AtomicBool(false)),
            (AR_OUTPUT_DEVICE_CHANGE_WITH_INFO, AtomicBool(false)),
            (AR_WRITE_DATA, AtomicBool(false))
        ]
    )
}
