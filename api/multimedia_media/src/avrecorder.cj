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

package ohos.multimedia_media

import ohos.ffi.*
import ohos.base.*
import std.deriving.*
import std.core.*
import std.collection.HashMap
import ohos.multimedia.audio
import ohos.multimedia.photo_accesshelper
import std.sync.*
import ohos.hilog.*
import ohos.labels.*

const LOG_DOMAIN_AVRECODER: UInt32 = 0xD002B2C
const COMMON_ERROR: Int32 = -1
const OPERATION_NOT_ALLOW: Int32 = 5400102
const INVALID_RECORDER_VALUE: Int32 = -1
let AV_RECODER_LOG = HilogChannel(LOG_CORE, LOG_DOMAIN_AVRECODER, "AVRecorderLog")

foreign {
    func FfiOHOSMediaAVRecorderCreateAVRecorder(code: CPointer<Int32>): Int64

    func FfiOHOSMediaAVRecorderPrepare(id: Int64, config: CAVRecorderConfig): Int32

    func FfiOHOSMediaAVRecorderGetInputSurface(id: Int64, code: CPointer<Int32>): CString

    func FfiOHOSMediaAVRecorderStart(id: Int64): Int32

    func FfiOHOSMediaAVRecorderPause(id: Int64): Int32

    func FfiOHOSMediaAVRecorderResume(id: Int64): Int32

    func FfiOHOSMediaAVRecorderStop(id: Int64): Int32

    func FfiOHOSMediaAVRecorderReset(id: Int64): Int32

    func FfiOHOSMediaAVRecorderRelease(id: Int64): Int32

    func FfiOHOSMediaAVRecorderGetAVRecorderConfig(id: Int64, code: CPointer<Int32>): CAVRecorderConfig

    func FfiOHOSMediaAVRecorderGetAudioCapturerMaxAmplitude(id: Int64, code: CPointer<Int32>): Int32

    func FfiOHOSMediaAVRecorderUpdateRotation(id: Int64, rotation: Int32, code: CPointer<Int32>): Unit

    func FfiOHOSMediaAVRecorderOn(id: Int64, `type`: Int32, callback: Int64): Int32

    func FfiOHOSMediaAVRecorderOff(id: Int64, `type`: Int32): Int32

    func FfiOHOSMediaAVRecorderGetCurrentAudioCapturerInfo(id: Int64, errorCode: CPointer<Int32>): audio.CAudioCapturerChangeInfo

    func FfiOHOSMediaAVRecorderGetEncoderInfo(id: Int64, errorCode: CPointer<Int32>): CArrEncoderInfo

    func FfiOHOSMediaAVRecorderGetState(id: Int64, errorCode: CPointer<Int32>): CString
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public enum AVRecorderState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    IDLE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    PREPARED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    STARTED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    PAUSED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    STOPPED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    RELEASED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    ERROR
    | ...

    protected static func parse(value: String): AVRecorderState {
        match (value) {
            case "idle" => IDLE
            case "prepared" => PREPARED
            case "started" => STARTED
            case "paused" => PAUSED
            case "stopped" => STOPPED
            case "released" => RELEASED
            case "error" => ERROR
            case _ => throw IllegalArgumentException("Unsupported ValueType")
        }
    }
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public enum AVRecorderCallbackType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AVRECORDER_ERROR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AVRECORDER_STATE_CHANGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AVRECORDER_AUDIO_CAPTURER_CHANGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AVRECORDER_PHOTO_ASSET_AVAILABLE
    | ...

    func getValue(): Int32 {
        match (this) {
            case AVRECORDER_STATE_CHANGE => 1i32
            case AVRECORDER_ERROR => 2i32
            case AVRECORDER_AUDIO_CAPTURER_CHANGE => 3i32
            case AVRECORDER_PHOTO_ASSET_AVAILABLE => 4i32
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct CStateChangeHandler {
    CStateChangeHandler(
        let state: CString,
        let reason: Int32
    ) {}

    func toObject(): OnAVRecorderStateChangeHandler {
        return OnAVRecorderStateChangeHandler(AVRecorderState.parse(state.toString()), StateChangeReason.parse(reason))
    }
}

@C
struct CErrorInfo {
    CErrorInfo(
        let errorCode: Int32,
        let errorMsg: CString
    ) {}

    func toObject(): BusinessException {
        return BusinessException(errorCode, errorMsg.toString())
    }
}

@C
struct CRange {
    CRange(let min: Int32, let max: Int32) {}

    func toObject(): Range {
        return Range(min, max)
    }
}

@C
struct CEncoderInfo {
    CEncoderInfo(
        let mimeType: CString,
        let `type`: CString,
        let bitRate: CRange,
        let frameRate: CRange,
        let width: CRange,
        let height: CRange,
        let channels: CRange,
        let sampleRate: CArrI32
    ) {}

    unsafe func free(): Unit {
        LibC.free(mimeType)
        LibC.free(`type`)
        LibC.free<Int32>(sampleRate.head)
    }
}

@C
struct CArrEncoderInfo {
    CArrEncoderInfo(
        let head: CPointer<CEncoderInfo>,
        let size: Int64
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public class Range {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public Range(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public let min: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public let max: Int32
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public class EncoderInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public let mimeType: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public let `type`: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public let bitRate: Range
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public let frameRate: ?Range
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public let width: ?Range
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public let height: ?Range
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public let channels: ?Range
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public let sampleRate: ?Array<Int32>

    init(info: CEncoderInfo) {
        mimeType = info.mimeType.toString()
        `type` = info.`type`.toString()
        bitRate = info.bitRate.toObject()
        match (`type`) {
            case "audio" =>
                frameRate = Option<Range>.None
                width = Option<Range>.None
                height = Option<Range>.None
                channels = info.channels.toObject()
                sampleRate = unsafe { cArr2cjArr<Int32, Int32>(info.sampleRate.size, info.sampleRate.head, {v => v}) }
            case "video" =>
                frameRate = info.frameRate.toObject()
                width = info.width.toObject()
                height = info.height.toObject()
                channels = Option<Range>.None
                sampleRate = Option<Array<Int32>>.None
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }
}

unsafe func getArrEncoderInfoAndFree(arr: CArrEncoderInfo): Array<EncoderInfo> {
    let ptr = arr.head
    if (ptr.isNull()) {
        return Array<EncoderInfo>()
    }
    let size = arr.size
    let ret = Array<EncoderInfo>(
        size,
        {
            i =>
            let encoder = ptr.read(i)
            let data = EncoderInfo(encoder)
            encoder.free()
            data
        }
    )
    LibC.free<CEncoderInfo>(ptr)
    return ret
}

@C
struct CHashStrPair {
    var key: CString = CString(CPointer())
    var value: CString = CString(CPointer())

    init(key: ?String, value: ?String) {
        unsafe {
            try {
                this.key = LibC.mallocCString(key ?? "")
                this.value = LibC.mallocCString(value ?? "")
            } catch (e: Exception) {
                LibC.free(this.key)
                LibC.free(this.value)
                throw e
            }
        }
    }

    func free(): Unit {
        if (key.isNull()) {
            return
        }
        unsafe {
            LibC.free(key)
            LibC.free(value)
        }
    }
}

@C
struct CHashStrArr {
    var headers: CPointer<CHashStrPair> = CPointer<CHashStrPair>()
    var size: Int64 = 0

    init() {}

    init(headers: HashMap<String, String>) {
        if (headers.size == 0) {
            return
        }

        let res: CPointer<CHashStrPair> = safeMalloc<CHashStrPair>(count: headers.size)
        var index = 0
        try {
            for ((k, v) in headers) {
                unsafe { res.write(index, CHashStrPair(k, v)) }
                index++
            }
        } catch (e: Exception) {
            for (i in 0..index) {
                unsafe { res.read(i).free() }
            }
            unsafe { LibC.free(res) }
            throw e
        }
        this.headers = res
        this.size = headers.size
    }

    func free(): Unit {
        if (headers.isNull()) {
            return
        }
        for (i in 0..size) {
            unsafe { headers.read(i).free() }
        }
        unsafe { LibC.free(headers) }
    }

    func toHashMap(): HashMap<String, String> {
        if (headers.isNull()) {
            return HashMap<String, String>()
        }

        HashMap<String, String>(size) {
            i: Int64 =>
            let elem: CHashStrPair = unsafe { headers.read(i) }
            (elem.key.toString(), elem.value.toString())
        }
    }

    func toHashMapOption(): ?HashMap<String, String> {
        if (headers.isNull()) {
            return None
        }
        toHashMap()
    }
}

@C
struct CAVRecorderProfile {
    var fileFormat: CString = CString(CPointer()) // ContainerFormatType
    var audioBitrate: Int32 = INVALID_RECORDER_VALUE
    var audioChannels: Int32 = INVALID_RECORDER_VALUE
    var audioCodec: CString = CString(CPointer()) // CodecMimeType
    var audioSampleRate: Int32 = INVALID_RECORDER_VALUE
    var videoBitrate: Int32 = INVALID_RECORDER_VALUE
    var videoCodec: CString = CString(CPointer()) // CodecMimeType
    var videoFrameWidth: Int32 = INVALID_RECORDER_VALUE
    var videoFrameHeight: Int32 = INVALID_RECORDER_VALUE
    var videoFrameRate: Int32 = INVALID_RECORDER_VALUE
    var isHdr: Bool = false
    var enableTemporalScale: Bool = false

    init() {}

    init(recorderProfile: AVRecorderProfile) {
        unsafe {
            try {
                this.fileFormat = LibC.mallocCString(recorderProfile.fileFormat.get())
                this.audioBitrate = matchIntParam(recorderProfile.audioBitrate)
                this.audioChannels = matchIntParam(recorderProfile.audioChannels)
                this.audioCodec = match (recorderProfile.audioCodec) {
                    case Some(v) => LibC.mallocCString(v.get())
                    case None => CString(CPointer())
                }
                this.audioSampleRate = matchIntParam(recorderProfile.audioSampleRate)
                this.videoBitrate = matchIntParam(recorderProfile.videoBitrate)
                this.videoCodec = match (recorderProfile.videoCodec) {
                    case Some(v) => LibC.mallocCString(v.get())
                    case None => CString(CPointer())
                }
                this.videoFrameWidth = matchIntParam(recorderProfile.videoFrameWidth)
                this.videoFrameHeight = matchIntParam(recorderProfile.videoFrameHeight)
                this.videoFrameRate = matchIntParam(recorderProfile.videoFrameRate)
                this.isHdr = match (recorderProfile.isHdr) {
                    case Some(v) => v
                    case None => false
                }
                this.enableTemporalScale = match (recorderProfile.enableTemporalScale) {
                    case Some(v) => v
                    case None => false
                }
            } catch (e: Exception) {
                LibC.free(fileFormat)
                LibC.free(audioCodec)
                LibC.free(videoCodec)
                throw e
            }
        }
    }

    func matchIntParam(ele: Option<Int32>): Int32 {
        match (ele) {
            case Some(v) => v
            case None => INVALID_RECORDER_VALUE
        }
    }

    func toAVRecorderProfile(): AVRecorderProfile {
        let cjFileFormat = if (!fileFormat.isNull()) {
            ContainerFormatType.parse(fileFormat.toString())
        } else {
            throw IllegalArgumentException("null value")
        }

        let cjAudioCodec = if (!audioCodec.isNull()) {
            CodecMimeType.parse(audioCodec.toString())
        } else {
            None<CodecMimeType>
        }

        let cjVideoCodec = if (!videoCodec.isNull()) {
            CodecMimeType.parse(videoCodec.toString())
        } else {
            None<CodecMimeType>
        }

        return AVRecorderProfile(cjFileFormat, audioBitrate: audioBitrate, audioChannels: audioChannels,
            audioCodec: cjAudioCodec, audioSampleRate: audioSampleRate, videoBitrate: videoBitrate,
            videoCodec: cjVideoCodec, videoFrameWidth: videoFrameWidth, videoFrameHeight: videoFrameHeight,
            videoFrameRate: videoFrameRate, isHdr: isHdr, enableTemporalScale: enableTemporalScale)
    }

    func free() {
        unsafe {
            LibC.free(fileFormat)
            LibC.free(audioCodec)
            LibC.free(videoCodec)
        }
    }
}

@C
struct CLocation {
    CLocation(
        var latitude: Float64,
        var longitude: Float64,
        var isValid: Bool
    ) {}

    func toLocation(): Location {
        return Location(latitude, longitude);
    }
}

@C
struct CAVMetadata {
    var album: CString = CString(CPointer())
    var albumArtist: CString = CString(CPointer())
    var artist: CString = CString(CPointer())
    var author: CString = CString(CPointer())
    var dateTime: CString = CString(CPointer())
    var dateTimeFormat: CString = CString(CPointer())
    var composer: CString = CString(CPointer())
    var duration: CString = CString(CPointer())
    var genre: CString = CString(CPointer())
    var hasAudio: CString = CString(CPointer())
    var hasVideo: CString = CString(CPointer())
    var mimeType: CString = CString(CPointer())
    var trackCount: CString = CString(CPointer())
    var sampleRate: CString = CString(CPointer())
    var title: CString = CString(CPointer())
    var videoHeight: CString = CString(CPointer())
    var videoWidth: CString = CString(CPointer())
    var videoOrientation: CString = CString(CPointer())
    var hdrType: Int32 = -1
    var location: CLocation = CLocation(0.0, 0.0, false)
    var customInfo: CHashStrArr = CHashStrArr()
    var isValid: Bool = false

    init() {}
    init(metadata: AVMetadata) {
        unsafe {
            try {
                this.album = LibC.mallocCString(metadata.album ?? "")
                this.albumArtist = LibC.mallocCString(metadata.albumArtist ?? "")
                this.artist = LibC.mallocCString(metadata.artist ?? "")
                this.author = LibC.mallocCString(metadata.author ?? "")
                this.dateTime = LibC.mallocCString(metadata.dateTime ?? "")
                this.dateTimeFormat = LibC.mallocCString(metadata.dateTimeFormat ?? "")
                this.composer = LibC.mallocCString(metadata.composer ?? "")
                this.duration = LibC.mallocCString(metadata.duration ?? "")
                this.genre = LibC.mallocCString(metadata.genre ?? "")
                this.hasAudio = LibC.mallocCString(metadata.hasAudio ?? "")
                this.hasVideo = LibC.mallocCString(metadata.hasVideo ?? "")
                this.mimeType = LibC.mallocCString(metadata.mimeType ?? "")
                this.trackCount = LibC.mallocCString(metadata.trackCount ?? "")
                this.sampleRate = LibC.mallocCString(metadata.sampleRate ?? "")
                this.title = LibC.mallocCString(metadata.title ?? "")
                this.videoHeight = LibC.mallocCString(metadata.videoHeight ?? "")
                this.videoWidth = LibC.mallocCString(metadata.videoWidth ?? "")
                this.videoOrientation = LibC.mallocCString(metadata.videoOrientation ?? "")
                this.hdrType = match (metadata.hdrType) {
                    case Some(v) => v.get()
                    case None => INVALID_RECORDER_VALUE
                }
                this.location = match (metadata.location) {
                    case Some(v) => CLocation(v.latitude, v.longitude, true)
                    case None => CLocation(0.0, 0.0, false)
                }
                this.customInfo = match (metadata.customInfo) {
                    case Some(v) => CHashStrArr(v)
                    case None => CHashStrArr()
                }
                this.isValid = true
            } catch (e: Exception) {
                freeAll()
                throw e
            }
        }
    }

    func freeAll(): Unit {
        unsafe {
            LibC.free(this.album)
            LibC.free(this.albumArtist)
            LibC.free(this.artist)
            LibC.free(this.author)
            LibC.free(this.dateTime)
            LibC.free(this.dateTimeFormat)
            LibC.free(this.composer)
            LibC.free(this.duration)
            LibC.free(this.genre)
            LibC.free(this.hasAudio)
            LibC.free(this.hasVideo)
            LibC.free(this.mimeType)
            LibC.free(this.trackCount)
            LibC.free(this.sampleRate)
            LibC.free(this.title)
            LibC.free(this.videoHeight)
            LibC.free(this.videoWidth)
            LibC.free(this.videoOrientation)
            this.customInfo.free()
        }
    }

    func toAVMetadata(): AVMetadata {
        let cjHdrType = if (hdrType != -1) {
            Some(HdrType.parse(hdrType))
        } else {
            None<HdrType>
        }
        let cjLocation = location.toLocation()
        let cjCustomInfo = customInfo.toHashMapOption()
        return AVMetadata(album: album.toString(), albumArtist: albumArtist.toString(), author: author.toString(),
            dateTime: dateTime.toString(), dateTimeFormat: dateTimeFormat.toString(), composer: composer.toString(),
            duration: duration.toString(), genre: genre.toString(), hasAudio: hasAudio.toString(),
            hasVideo: hasVideo.toString(), mimeType: mimeType.toString(), trackCount: trackCount.toString(),
            sampleRate: sampleRate.toString(), title: title.toString(), videoHeight: videoHeight.toString(),
            videoWidth: videoWidth.toString(), videoOrientation: videoOrientation.toString(), hdrType: cjHdrType,
            location: cjLocation, customInfo: cjCustomInfo)
    }

    func free() {
        unsafe {
            LibC.free(album)
            LibC.free(albumArtist)
            LibC.free(artist)
            LibC.free(author)
            LibC.free(dateTime)
            LibC.free(dateTimeFormat)
            LibC.free(composer)
            LibC.free(duration)
            LibC.free(genre)
            LibC.free(hasAudio)
            LibC.free(hasVideo)
            LibC.free(mimeType)
            LibC.free(trackCount)
            LibC.free(sampleRate)
            LibC.free(title)
            LibC.free(videoHeight)
            LibC.free(videoWidth)
            LibC.free(videoOrientation)
        }
        this.customInfo.free()
    }
}

@C
struct CAVRecorderConfig {
    var profile: CAVRecorderProfile = CAVRecorderProfile()
    var url: CString = CString(CPointer())
    var audioSourceType: Int32 = INVALID_RECORDER_VALUE
    var videoSourceType: Int32 = INVALID_RECORDER_VALUE
    var fileGenerationMode: Int32 = INVALID_RECORDER_VALUE
    var metadata: CAVMetadata = CAVMetadata()
    var maxDuration: Int32 = INVALID_RECORDER_VALUE

    init(recorderConfig: AVRecorderConfig) {
        try {
            this.profile = CAVRecorderProfile(recorderConfig.profile)
            this.url = unsafe { LibC.mallocCString(recorderConfig.url) }
            if (let Some(v) <- recorderConfig.audioSourceType) {
                this.audioSourceType = v.get()
            }
            if (let Some(v) <- recorderConfig.videoSourceType) {
                this.videoSourceType = v.get()
            }
            if (let Some(v) <- recorderConfig.fileGenerationMode) {
                this.fileGenerationMode = v.get()
            }
            if (let Some(v) <- recorderConfig.metadata) {
                this.metadata = CAVMetadata(v)
            }
            if (let Some(v) <- recorderConfig.maxDuration) {
                this.maxDuration = v
            }
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func toAVRecorderConfig(): AVRecorderConfig {
        let configProfile = this.profile.toAVRecorderProfile()
        let configUrl = unsafe { this.url.toString() }
        let configAudioSourceType = if (this.audioSourceType != -1) {
            Some(AudioSourceType.parse(this.audioSourceType))
        } else {
            None<AudioSourceType>
        }
        let configVideoSourceType = if (this.videoSourceType != -1) {
            Some(VideoSourceType.parse(this.videoSourceType))
        } else {
            None<VideoSourceType>
        }
        let configFileGenerationMode = if (this.fileGenerationMode != -1) {
            Some(FileGenerationMode.parse(this.fileGenerationMode))
        } else {
            None<FileGenerationMode>
        }
        let configMetadata = if (this.metadata.isValid) {
            Some(this.metadata.toAVMetadata())
        } else {
            None<AVMetadata>
        }
        let configMaxDuration = if (this.maxDuration != -1) {
            Some(this.maxDuration)
        } else {
            None<Int32>
        }
        return AVRecorderConfig(configProfile, configUrl, audioSourceType: configAudioSourceType,
            videoSourceType: configVideoSourceType, fileGenerationMode: configFileGenerationMode,
            metadata: configMetadata, maxDuration: configMaxDuration)
    }

    func free(): Unit {
        unsafe {
            LibC.free(url)
            this.profile.free()
            this.metadata.free()
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public class OnAVRecorderStateChangeHandler {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public var state: AVRecorderState
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public var stateChangeReason: StateChangeReason

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public init(state: AVRecorderState, reason: StateChangeReason) {
        this.state = state
        this.stateChangeReason = reason
    }
}

/**
 * Creates an AVRecorder instance.
 * @param { AVRecorder } AVRecorder instance if the operation is successful
 * @throws { BusinessException } 5400101 - No memory.
 * @syscap SystemCapability.Multimedia.Media.AVRecorder
 * @crossplatform
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public func createAVRecorder(): AVRecorder {
    var errCode = 0i32
    var id = unsafe { FfiOHOSMediaAVRecorderCreateAVRecorder(inout errCode) }

    if (errCode != SUCCESS_CODE) {
        throw BusinessException(errCode, getErrorMsg(errCode))
    }
    return AVRecorder(id)
}

/**
 * Manages and record audio/video. Before calling an AVRecorder method, you must use createAVRecorder()
 * to create an AVRecorder instance.
 *
 * @typedef AVRecorder
 * @syscap SystemCapability.Multimedia.Media.AVRecorder
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public class AVRecorder <: RemoteDataLite {
    let callbackMap = HashMap<AVRecorderCallbackType, CallbackObject>()

    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Recorder state.
     * @type { AVRecorderState }
     * @readonly
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public prop state: AVRecorderState {
        get() {
            var errCode = 0i32
            let ret = unsafe { FfiOHOSMediaAVRecorderGetState(getID(), inout errCode) }
            let state = ret.toString()
            unsafe { LibC.free(ret) }
            return AVRecorderState.parse(state)
        }
    }

    /**
     * Prepares for recording.
     * @permission ohos.permission.MICROPHONE
     * @param { AVRecorderConfig } config - Recording parameters.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     * @crossplatform
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func prepare(config: AVRecorderConfig): Unit {
        let cRecorderConfig = CAVRecorderConfig(config)
        let ret = unsafe { FfiOHOSMediaAVRecorderPrepare(getID(), cRecorderConfig) }
        if (ret != SUCCESS_CODE) {
            cRecorderConfig.free()
            throw BusinessException(ret, getErrorMsg(ret))
        }
        cRecorderConfig.free()
    }

    /**
     * Get input surface.it must be called between prepare completed and start.
     * @param { String } String - return the input surface id in string.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func getInputSurface(): String {
        var errCode = 0i32
        let ret: CString = unsafe { FfiOHOSMediaAVRecorderGetInputSurface(getID(), inout errCode) }
        if (errCode != SUCCESS_CODE) {
            unsafe { LibC.free(ret) }
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
        let surfaceId = ret.toString();
        unsafe { LibC.free(ret) }
        return surfaceId
    }

    /**
     * Start AVRecorder, it will to started state.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     * @crossplatform
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func start(): Unit {
        let ret = unsafe { FfiOHOSMediaAVRecorderStart(getID()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return
    }

    /**
     * Start AVRecorder, it will to paused state.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     * @crossplatform
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func pause(): Unit {
        let ret = unsafe { FfiOHOSMediaAVRecorderPause(getID()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return
    }

    /**
     * Resume AVRecorder, it will to started state.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     * @crossplatform
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func resume(): Unit {
        let ret = unsafe { FfiOHOSMediaAVRecorderResume(getID()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return
    }

    /**
     * Stop AVRecorder, it will to stopped state.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     * @crossplatform
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func stop(): Unit {
        let ret = unsafe { FfiOHOSMediaAVRecorderStop(getID()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return
    }

    /**
     * Reset AVRecorder, it will to idle state.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func reset(): Unit {
        let ret = unsafe { FfiOHOSMediaAVRecorderReset(getID()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return
    }

    /**
     * Releases resources used for AVRecorder, it will to released state.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     * @crossplatform
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func release(): Unit {
        let ret = unsafe { FfiOHOSMediaAVRecorderRelease(getID()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
    }

    /**
     * Get AVRecorderConfig.it must be called after prepare.
     * @param { AVRecorderConfig } AVRecorderConfig - the input config in AVRecorderConfig.
     * @throws { BusinessException } 5400102 - Operate not permit.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func getAVRecorderConfig(): AVRecorderConfig {
        var errCode = 0i32
        let ret: CAVRecorderConfig = unsafe { FfiOHOSMediaAVRecorderGetAVRecorderConfig(getID(), inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
        let config = ret.toAVRecorderConfig()
        ret.free()
        return config
    }

    /**
     * Get max audio capturer amplitude from current AVRecorder.
     * @returns { Int32 } the max Amplitude.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func getAudioCapturerMaxAmplitude(): Int32 {
        var errCode = 0i32
        let ret = unsafe { FfiOHOSMediaAVRecorderGetAudioCapturerMaxAmplitude(getID(), inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
        return ret
    }

    /**
     * Update the video orientation before recorder start.
     * @param { Int32 } rotation - Rotation angle, should be [0, 90, 180, 270].
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func updateRotation(rotation: Int32): Unit {
        var errCode = 0i32
        unsafe { FfiOHOSMediaAVRecorderUpdateRotation(getID(), rotation, inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
    }

    /**
     * Get AudioCapturer info from current AVRecorder.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400103 - I/O error.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func getCurrentAudioCapturerInfo(): audio.AudioCapturerChangeInfo {
        var errorCode: Int32 = 0
        let changeInfo = unsafe { FfiOHOSMediaAVRecorderGetCurrentAudioCapturerInfo(getID(), inout errorCode) }
        if (errorCode != SUCCESS_CODE) {
            if (errorCode == COMMON_ERROR) {
                AV_RECODER_LOG.info("FFI::GetData failed")
                throw BusinessException(OPERATION_NOT_ALLOW, getErrorMsg(OPERATION_NOT_ALLOW))
            }
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        let ret = audio.AudioCapturerChangeInfo(changeInfo)
        unsafe { changeInfo.free() }
        return ret
    }

    /**
     * Get available encoder and encoder info for AVRecorder.
     * @param { EncoderInfo } available encoder info.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400105 - Service died.
     * @syscap SystemCapability.Multimedia.Media.AVRecorder
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func getAvailableEncoder(): Array<EncoderInfo> {
        var errorCode: Int32 = 0
        let arrEncoderInfo = unsafe { FfiOHOSMediaAVRecorderGetEncoderInfo(getID(), inout errorCode) }
        if (errorCode != SUCCESS_CODE) {
            if (errorCode == COMMON_ERROR) {
                AV_RECODER_LOG.info("FFI::GetData failed")
                throw BusinessException(OPERATION_NOT_ALLOW, getErrorMsg(OPERATION_NOT_ALLOW))
            }
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        let ret = unsafe { getArrEncoderInfoAndFree(arrEncoderInfo) }
        return ret
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func on(`type`: AVRecorderCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        if (`type` != AVRECORDER_ERROR) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        commonSubscribe1Arg(`type`, callback) {
            errorInfo: CErrorInfo => errorInfo.toObject()
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func on(`type`: AVRecorderCallbackType, callback: Callback1Argument<OnAVRecorderStateChangeHandler>): Unit {
        if (`type` != AVRECORDER_STATE_CHANGE) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        commonSubscribe1Arg(`type`, callback) {
            stateChangeHandler: CStateChangeHandler => stateChangeHandler.toObject()
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func on(`type`: AVRecorderCallbackType, callback: Callback1Argument<audio.AudioCapturerChangeInfo>): Unit {
        if (`type` != AVRECORDER_AUDIO_CAPTURER_CHANGE) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        commonSubscribe1Arg(`type`, callback) {
            audioCapturerChangeInfo: audio.CAudioCapturerChangeInfo => audio.AudioCapturerChangeInfo(
                audioCapturerChangeInfo)
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func on(`type`: AVRecorderCallbackType, callback: Callback1Argument<photo_accesshelper.PhotoAsset>): Unit {
        if (`type` != AVRECORDER_PHOTO_ASSET_AVAILABLE) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        commonSubscribe1Arg(`type`, callback) {
            id: Int64 => photo_accesshelper.PhotoAsset(id)
        }
        return
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func off(`type`: AVRecorderCallbackType, callback!: ?CallbackObject = None): Unit {
        if (!callbackMap.contains(`type`)) {
            return
        }
        unsafe { FfiOHOSMediaAVRecorderOff(getID(), `type`.getValue()) };
        if (let Some(v) <- callback) {
            findCallbackObject(`type`, v, remove: true)
            return
        }
        callbackMap.remove(`type`)
    }

    private func findCallbackObject(callbackType: AVRecorderCallbackType, callback: CallbackObject,
        remove!: Bool = false): Bool {
        let callback_ = callbackMap.get(callbackType) ?? return false
        let ret = refEq(callback_, callback)
        if (remove && ret) {
            callbackMap.remove(callbackType)
        }
        return ret
    }

    private func argWrapper1<CT, T>(callbackType: AVRecorderCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper = {
            ctype: CT =>
            let cjType = ctor(ctype)
            let callback = callbackMap.get(callbackType)
            if (let Some(cb) <- callback) {
                (cb as Callback1Argument<T>)?.invoke(cjType)
            }
        }
        let registerCall = Callback1Param<CT, Unit>(wrapper)
        registerCall.getID()
    }

    private func register(callbackType: AVRecorderCallbackType, id: Int64) {
        var errorCode: Int32 = 0
        unsafe {
            errorCode = FfiOHOSMediaAVRecorderOn(getID(), callbackType.getValue(), id)
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }

    private func commonSubscribe1Arg<CT, T>(callbackType: AVRecorderCallbackType, callback: CallbackObject,
        ctor: (CT) -> T) where CT <: CType {
        if (findCallbackObject(callbackType, callback)) {
            return
        }
        register(callbackType, argWrapper1<CT, T>(callbackType, ctor))
        callbackMap[callbackType] = callback
    }
}
