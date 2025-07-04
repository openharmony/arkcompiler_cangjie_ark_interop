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

import std.collection.ArrayList
import std.collection.HashMap
import ohos.base.*
import ohos.ffi.*
import ohos.hilog.*
import ohos.labels.*

const LOG_CORE: UInt32 = 3
const LOG_TAG_DOMAIN_ID_AUDIO: UInt32 = 0xD002B12
let AUDIO_LOG = HilogChannel(LOG_CORE, LOG_TAG_DOMAIN_ID_AUDIO, "multimedia audio")

/**
 * Define default interrupt group id for audio
 * @syscap SystemCapability.Multimedia.Audio.Interrupt
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Interrupt"
]
public const DEFAULT_INTERRUPT_GROUP_ID: Int32 = 1

/**
 * Define default volume group id for audio
 * @syscap SystemCapability.Multimedia.Audio.Volume
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Volume"
]
public const DEFAULT_VOLUME_GROUP_ID: Int32 = 1

/**
 * Array of AudioCapturerChangeInfo
 * @typedef { Array<AudioCapturerChangeInfo> } AudioCapturerChangeInfoArray
 * @syscap SystemCapability.Multimedia.Audio.Capturer
 * @crossplatform
 */
public type AudioCapturerChangeInfoArray = Array<AudioCapturerChangeInfo>

/**
 * Array of AudioDeviceDescriptors
 * @typedef { Array<AudioDeviceDescriptor> } AudioDeviceDescriptors
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 * @atomicservice
 */
public type AudioDeviceDescriptors = Array<AudioDeviceDescriptor>

/**
 * Array of AudioRendererChangeInfo
 * @typedef { Array<AudioRendererChangeInfo> } AudioRendererChangeInfoArray
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 */
public type AudioRendererChangeInfoArray = Array<AudioRendererChangeInfo>

/**
 * Array of AudioEffectMode
 * @typedef { Array<AudioEffectMode> } AudioEffectInfoArray
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 */
public type AudioEffectInfoArray = Array<AudioEffectMode>

/**
 * Type definition of callback function for audio renderer write data.
 *
 * @typedef { function } AudioRendererWriteDataCallback
 * @param { Array<Byte> } data - audio data array buffer.
 * @returns { AudioDataCallbackResult | void } result of callback or void. If void or AudioDataCallbackResult.VALID is
 * returned, it indicates the data is valid and will be played. If AudioDataCallbackResult.INVALID is returned, it
 * indicates the data is will not be played.
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 */
public type AudioRendererWriteDataCallback = (Array<Byte>) -> Option<AudioDataCallbackResult>

protected const ERR_INVALID_PARAM: Int32 = 6800101i32
protected const ERR_NO_MEMORY: Int32 = 6800102i32
protected const ERR_ILLEGAL_STATE: Int32 = 6800103i32
protected const ERR_UNSUPPORTED: Int32 = 6800104i32
protected const ERR_TIMEOUT: Int32 = 6800105i32
protected const ERR_STREAM_LIMIT: Int32 = 6800201i32
protected const ERR_SYSTEM: Int32 = 6800301i32
protected const INVALID_FRAME: Int64 = 0i64
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [(ERR_INVALID_PARAM, "Invalid parameter."), (ERR_NO_MEMORY, "Memory allocation failure."),
        (ERR_ILLEGAL_STATE, "Unsupported state."), (ERR_UNSUPPORTED, "Unsupported parameter value."),
        (ERR_TIMEOUT, "Processing timeout."), (ERR_STREAM_LIMIT, "Too many audio streams."),
        (ERR_SYSTEM, "System error.")])

protected func checkRet(errCode: Int32, message: String): Unit {
    if (errCode != SUCCESS_CODE) {
        var msg: String
        if (let Some(v) <- getUniversalErrorMsg(errCode)) {
            msg = message + " " + v
            throw BusinessException(errCode, msg)
        } else if (ERROR_CODE_MAP.contains(errCode)) {
            msg = message + ERROR_CODE_MAP[errCode]
            throw BusinessException(errCode, msg)
        } else {
            msg = message + " Unknown error code: ${errCode}"
            throw BusinessException(errCode, msg)
        }
    }
}

@C
struct CAudioStreamInfo {
    CAudioStreamInfo(
        let channels: Int32,
        let encodingType: Int32,
        let sampleFormat: Int32,
        let samplingRate: Int32,
        let channelLayout: Int64
    ) {}
}

/**
 * Describes audio stream information.
 * @typedef AudioStreamInfo
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public class AudioStreamInfo {
    var _channels: AudioChannel
    var _encodingType: AudioEncodingType
    var _sampleFormat: AudioSampleFormat
    var _samplingRate: AudioSamplingRate
    var _channelLayout: AudioChannelLayout

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public AudioStreamInfo(channels: AudioChannel, encodingType: AudioEncodingType, sampleFormat: AudioSampleFormat,
        samplingRate: AudioSamplingRate, channelLayout!: AudioChannelLayout = AudioChannelLayout.CH_LAYOUT_UNKNOWN) {
        _channels = channels
        _encodingType = encodingType
        _sampleFormat = sampleFormat
        _samplingRate = samplingRate
        _channelLayout = channelLayout
    }

    init(cInfo: CAudioStreamInfo) {
        _channels = AudioChannel.parse(cInfo.channels)
        _encodingType = AudioEncodingType.parse(cInfo.encodingType)
        _sampleFormat = AudioSampleFormat.parse(cInfo.sampleFormat)
        _samplingRate = AudioSamplingRate.parse(cInfo.samplingRate)
        if (cInfo.channelLayout != 0) {
            _channelLayout = AudioChannelLayout.parse(cInfo.channelLayout)
        } else {
            _channelLayout = AudioChannelLayout.CH_LAYOUT_UNKNOWN
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop channelLayout: AudioChannelLayout {
        get() {
            _channelLayout
        }
        set(v) {
            _channelLayout = v
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop channels: AudioChannel {
        get() {
            _channels
        }
        set(v) {
            _channels = v
        }
    }
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop encodingType: AudioEncodingType {
        get() {
            _encodingType
        }
        set(v) {
            _encodingType = v
        }
    }
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop sampleFormat: AudioSampleFormat {
        get() {
            _sampleFormat
        }
        set(v) {
            _sampleFormat = v
        }
    }
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public mut prop samplingRate: AudioSamplingRate {
        get() {
            _samplingRate
        }
        set(v) {
            _samplingRate = v
        }
    }

    func toCAudioStreamInfo(): CAudioStreamInfo {
        CAudioStreamInfo(_channels.value, _encodingType.value, _sampleFormat.value, _samplingRate.value,
            _channelLayout.value)
    }
}

@C
protected struct CAudioStreamDeviceChangeInfo {
    CAudioStreamDeviceChangeInfo(let changeReason: Int32, let devices: CArrDeviceDescriptor) {}

    func free() {
        freeCArrDeviceDescriptor(this.devices)
    }
}

/**
 * Audio stream device change info.
 * @typedef AudioStreamDeviceChangeInfo
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public class AudioStreamDeviceChangeInfo {
    var _changeReason: AudioStreamDeviceChangeReason
    var _devices: AudioDeviceDescriptors

    protected init(cInfo: CAudioStreamDeviceChangeInfo) {
        _changeReason = AudioStreamDeviceChangeReason.parse(cInfo.changeReason)
        unsafe {
            _devices = cArr2cjArr<CAudioDeviceDescriptor, AudioDeviceDescriptor>(cInfo.devices.size, cInfo.devices.head,
                {i => AudioDeviceDescriptor(i)})
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public mut prop changeReason: AudioStreamDeviceChangeReason {
        get() {
            _changeReason
        }
        set(v) {
            _changeReason = v
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public mut prop devices: AudioDeviceDescriptors {
        get() {
            _devices
        }
        set(v) {
            _devices = v
        }
    }
}

@C
struct CVolumeEvent {
    CVolumeEvent(let volume: Int32, let volumeType: Int32, let updateUi: Bool) {}
    func toVolumeEvent(): VolumeEvent {
        return VolumeEvent(this)
    }
}

/**
 * Describes the volume event received by the app when the volume is changed.
 * @typedef VolumeEvent
 * @syscap SystemCapability.Multimedia.Audio.Volume
 * @crossplatform
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Volume"
]
public class VolumeEvent {
    var _volume: Int32
    var _volumeType: AudioVolumeType
    var _updateUi: Bool

    init(cInfo: CVolumeEvent) {
        _volume = cInfo.volume
        _volumeType = AudioVolumeType.parse(cInfo.volumeType)
        _updateUi = cInfo.updateUi
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public mut prop volume: Int32 {
        get() {
            _volume
        }
        set(v) {
            _volume = v
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public mut prop volumeType: AudioVolumeType {
        get() {
            _volumeType
        }
        set(v) {
            _volumeType = v
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    public mut prop updateUi: Bool {
        get() {
            _updateUi
        }
        set(v) {
            _updateUi = v
        }
    }
}

@C
struct CArrAudioCapturerChangeInfo {
    CArrAudioCapturerChangeInfo(let head: CPointer<CAudioCapturerChangeInfo>, let size: Int64) {}

    func toAudioCapturerChangeInfoArray(): AudioCapturerChangeInfoArray {
        var res = ArrayList<AudioCapturerChangeInfo>()
        if (head.isNotNull()) {
            for (i in 0..size) {
                unsafe { res.add(AudioCapturerChangeInfo(head.read(i))) }
            }
        }
        res.toArray()
    }
}

@C
struct CArrAudioRendererChangeInfo {
    CArrAudioRendererChangeInfo(let head: CPointer<CAudioRendererChangeInfo>, let size: Int64) {}

    func toAudioRendererChangeInfoArray(): AudioRendererChangeInfoArray {
        var res = ArrayList<AudioRendererChangeInfo>()
        if (head.isNotNull()) {
            for (i in 0..size) {
                unsafe { res.add(AudioRendererChangeInfo(head.read(i))) }
            }
        }
        res.toArray()
    }
}

@C
protected struct CArrDeviceDescriptor {
    protected CArrDeviceDescriptor(protected let head: CPointer<CAudioDeviceDescriptor>, protected let size: Int64) {}

    protected func toAudioDeviceDescriptors(): AudioDeviceDescriptors {
        var res = ArrayList<AudioDeviceDescriptor>()
        if (head.isNotNull()) {
            for (i in 0..size) {
                unsafe { res.add(AudioDeviceDescriptor(head.read(i))) }
            }
        }
        res.toArray()
    }
}

func freeCArrDeviceDescriptor(arr: CArrDeviceDescriptor) {
    unsafe {
        if (arr.head.isNotNull()) {
            for (i in 0..arr.size) {
                arr.head.read(i).free()
            }
            LibC.free<CAudioDeviceDescriptor>(arr.head)
        }
    }
}

func freeCArrAudioRendererChangeInfo(arr: CArrAudioRendererChangeInfo) {
    unsafe {
        if (arr.head.isNotNull()) {
            for (i in 0..arr.size) {
                arr.head.read(i).free()
            }
            LibC.free<CAudioRendererChangeInfo>(arr.head)
        }
    }
}

func freeCArrAudioCapturerChangeInfo(arr: CArrAudioCapturerChangeInfo) {
    unsafe {
        if (arr.head.isNotNull()) {
            for (i in 0..arr.size) {
                arr.head.read(i).free()
            }
            LibC.free<CAudioCapturerChangeInfo>(arr.head)
        }
    }
}

func toAudioEffectInfoArray(arr: CArrI32): AudioEffectInfoArray {
    var res = ArrayList<AudioEffectMode>()
    if (arr.head.isNotNull()) {
        for (i in 0..arr.size) {
            unsafe { res.add(AudioEffectMode.parse(arr.head.read(i))) }
        }
    }
    res.toArray()
}

@C
protected struct COptionArr {
    COptionArr(protected let arr: CArrI32, protected let hasValue: Bool) {}
}

@C
protected struct CAudioDeviceDescriptor {
    protected CAudioDeviceDescriptor(
        protected let address: CString,
        protected let channelCounts: CArrI32,
        protected let channelMasks: CArrI32,
        protected let deviceRole: Int32,
        protected let deviceType: Int32,
        protected let displayName: CString,
        protected let encodingTypes: COptionArr,
        protected let id: Int32,
        protected let name: CString,
        protected let sampleRates: CArrI32
    ) {}

    protected func free() {
        unsafe {
            LibC.free(address)
            LibC.free(displayName)
            LibC.free(name)
            LibC.free<Int32>(channelCounts.head)
            LibC.free<Int32>(channelMasks.head)
            LibC.free<Int32>(encodingTypes.arr.head)
            LibC.free<Int32>(sampleRates.head)
        }
    }
}

/**
 * Describes an audio device.
 * @typedef AudioDeviceDescriptor
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public class AudioDeviceDescriptor {
    let _address: String
    let _channelCounts: Array<Int32>
    let _channelMasks: Array<Int32>
    let _deviceRole: DeviceRole
    let _deviceType: DeviceType
    let _displayName: String
    let _encodingTypes: ?Array<AudioEncodingType>
    let _id: Int32
    let _name: String
    let _sampleRates: Array<Int32>

    init(cDescriptor: CAudioDeviceDescriptor) {
        _address = cDescriptor.address.toString()
        _deviceRole = DeviceRole.parse(cDescriptor.deviceRole)
        _deviceType = DeviceType.parse(cDescriptor.deviceType)
        _displayName = cDescriptor.displayName.toString()
        _id = cDescriptor.id
        _name = cDescriptor.name.toString()
        unsafe {
            _channelCounts = cArr2cjArr<Int32, Int32>(cDescriptor.channelCounts.size, cDescriptor.channelCounts.head,
                {i => i})
            _channelMasks = cArr2cjArr<Int32, Int32>(cDescriptor.channelMasks.size, cDescriptor.channelMasks.head,
                {i => i})
            _sampleRates = cArr2cjArr<Int32, Int32>(
                cDescriptor.sampleRates.size,
                cDescriptor.sampleRates.head,
                {i => i}
            )
            if (cDescriptor.encodingTypes.hasValue && cDescriptor.encodingTypes.arr.head.isNotNull()) {
                _encodingTypes = cArr2cjArr<Int32, AudioEncodingType>(cDescriptor.encodingTypes.arr.size,
                    cDescriptor.encodingTypes.arr.head, {i => AudioEncodingType.parse(i)})
            } else {
                _encodingTypes = None
            }
        }
    }

    private func cjOptArr2cOptArr(): COptionArr {
        var hasVal: Bool = false
        var head: CPointer<Int32> = CPointer<Int32>()
        var size: Int64 = 0

        if (let Some(encodingType) <- _encodingTypes && encodingType.size > 0) {
            hasVal = true
            head = unsafe { cjArr2CArr<AudioEncodingType, Int32>(encodingType, {i => i.value}) }
            size = encodingType.size
        }
        return COptionArr(CArrI32(head, size), hasVal)
    }

    func toCAudioDeviceDescriptor(): CAudioDeviceDescriptor {
        var address = CString(CPointer())
        var channelCounts = CArrI32(CPointer<Int32>(), 0)
        var channelMasks = CArrI32(CPointer<Int32>(), 0)
        var displayName = CString(CPointer())
        var name = CString(CPointer())
        var sampleRates = CArrI32(CPointer<Int32>(), 0)
        var encodingTypes = COptionArr(CArrI32(CPointer<Int32>(), 0), false)

        try {
            address = unsafe { LibC.mallocCString(_address) }
            channelCounts = CArrI32(unsafe { cjArr2CArr<Int32, Int32>(_channelCounts, {i => i}) }, _channelCounts.size)
            channelMasks = CArrI32(unsafe { cjArr2CArr<Int32, Int32>(_channelMasks, {i => i}) }, _channelMasks.size)
            displayName = unsafe { LibC.mallocCString(_displayName) }
            encodingTypes = cjOptArr2cOptArr()
            name = unsafe { LibC.mallocCString(_name) }
            sampleRates = CArrI32(unsafe { cjArr2CArr<Int32, Int32>(_sampleRates, {i => i}) }, _sampleRates.size)
        } catch (e: Exception) {
            unsafe {
                LibC.free(address)
                LibC.free(displayName)
                LibC.free(name)
                LibC.free<Int32>(channelCounts.head)
                LibC.free<Int32>(channelMasks.head)
                LibC.free<Int32>(sampleRates.head)
                LibC.free<Int32>(encodingTypes.arr.head)
            }
            throw e
        }
        return CAudioDeviceDescriptor(
            address,
            channelCounts,
            channelMasks,
            _deviceRole.value,
            _deviceType.value,
            displayName,
            encodingTypes,
            _id,
            name,
            sampleRates
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop address: String {
        get() {
            _address
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop channelCounts: Array<Int32> {
        get() {
            _channelCounts
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop channelMasks: Array<Int32> {
        get() {
            _channelMasks
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop deviceRole: DeviceRole {
        get() {
            _deviceRole
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop deviceType: DeviceType {
        get() {
            _deviceType
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop displayName: String {
        get() {
            _displayName
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public prop encodingTypes: ?Array<AudioEncodingType> {
        get() {
            _encodingTypes
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop id: Int32 {
        get() {
            _id
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop name: String {
        get() {
            _name
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public prop sampleRates: Array<Int32> {
        get() {
            _sampleRates
        }
    }
}

@C
struct CMicStateChangeEvent {
    CMicStateChangeEvent(let mute: Bool) {}
    func toMicStateChangeEvent(): MicStateChangeEvent {
        return MicStateChangeEvent(this)
    }
}

/**
 * Describes the microphone state change event received by the app when the microphone state is changed.
 * @typedef MicStateChangeEvent
 * @syscap SystemCapability.Multimedia.Audio.Device
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public class MicStateChangeEvent {
    var _mute: Bool

    init(cInfo: CMicStateChangeEvent) {
        _mute = cInfo.mute
    }
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public mut prop mute: Bool {
        get() {
            _mute
        }
        set(v) {
            _mute = v
        }
    }
}

@C
protected struct CInterruptEvent {
    protected CInterruptEvent(let eventType: Int32, let forceType: Int32, let hintType: Int32) {}

    protected func toInterruptEvent(): InterruptEvent {
        InterruptEvent(this)
    }
}

/**
 * Describes the interrupt event received by the app when playback is interrupted.
 * @typedef InterruptEvent
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public class InterruptEvent {
    var _eventType: InterruptType
    var _forceType: InterruptForceType
    var _hintType: InterruptHint

    init(cInfo: CInterruptEvent) {
        _eventType = InterruptType.parse(cInfo.eventType)
        _forceType = InterruptForceType.parse(cInfo.forceType)
        _hintType = InterruptHint.parse(cInfo.hintType)
    }

    protected init(eventType: Int32, forceType: Int32, hintType: Int32) {
        _eventType = InterruptType.parse(eventType)
        _forceType = InterruptForceType.parse(forceType)
        _hintType = InterruptHint.parse(hintType)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public mut prop eventType: InterruptType {
        get() {
            _eventType
        }
        set(v) {
            _eventType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public mut prop forceType: InterruptForceType {
        get() {
            _forceType
        }
        set(v) {
            _forceType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    public mut prop hintType: InterruptHint {
        get() {
            _hintType
        }
        set(v) {
            _hintType = v
        }
    }
}

@C
struct CDeviceChangeAction {
    CDeviceChangeAction(let deviceDescriptors: CArrDeviceDescriptor, let changeType: Int32) {}

    func free() {
        freeCArrDeviceDescriptor(this.deviceDescriptors)
    }
}

/**
 * Describes the device change type and device information.
 * @typedef DeviceChangeAction
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public class DeviceChangeAction {
    var _deviceDescriptors: AudioDeviceDescriptors
    var _type: DeviceChangeType

    init(cInfo: CDeviceChangeAction) {
        unsafe {
            _deviceDescriptors = cArr2cjArr<CAudioDeviceDescriptor, AudioDeviceDescriptor>(cInfo.deviceDescriptors.size,
                cInfo.deviceDescriptors.head, {i => AudioDeviceDescriptor(i)})
        }
        _type = DeviceChangeType.parse(cInfo.changeType)
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public mut prop deviceDescriptors: AudioDeviceDescriptors {
        get() {
            _deviceDescriptors
        }
        set(v) {
            _deviceDescriptors = v
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    public mut prop `type`: DeviceChangeType {
        get() {
            _type
        }
        set(v) {
            _type = v
        }
    }
}
