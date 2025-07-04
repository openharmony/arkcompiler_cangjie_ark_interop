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

import ohos.image.PixelMap
import ohos.ffi.*
import ohos.base.*
import std.collection.*

@C
struct CSubtitleInfo {
    CSubtitleInfo(
        let text: CString,
        let startTime: Int32,
        let duration: Int32
    ) {}

    func toSubtitleInfo() {
        SubtitleInfo(duration: duration, startTime: startTime, text: text.toString())
    }
}

@C
struct CValueType {
    CValueType(
        let number: Int32,
        let dou: Float64,
        let str: CString
    ) {}
}

@C
struct CMediaDescription {
    CMediaDescription(
        let key: CPointer<CString>,
        let value: CPointer<CValueType>,
        let size: Int64
    ) {}

    func toHashMap(): HashMap<String, ValueType> {
        let map = HashMap<String, ValueType>()
        unsafe {
            for (i in 0..size) {
                match (key.read(i).toString()) {
                    case "track_index" => map.add("track_index", ValueType.INT(value.read(i).number))
                    case "track_type" => map.add("track_type", ValueType.INT(value.read(i).number))
                    case "codec_mime" => map.add("codec_mime", ValueType.STRING(value.read(i).str.toString()))
                    case "duration" => map.add("duration", ValueType.INT(value.read(i).number))
                    case "bitrate" => map.add("bitrate", ValueType.INT(value.read(i).number))
                    case "width" => map.add("width", ValueType.INT(value.read(i).number))
                    case "height" => map.add("height", ValueType.INT(value.read(i).number))
                    case "frame_rate" => map.add("frame_rate", ValueType.DOUBLE(value.read(i).dou))
                    case "channel_count" => map.add("channel_count", ValueType.INT(value.read(i).number))
                    case "sample_rate" => map.add("sample_rate", ValueType.INT(value.read(i).number))
                    case "sample_depth" => map.add("sample_depth", ValueType.INT(value.read(i).number))
                    case "language" => map.add("language", ValueType.STRING(value.read(i).str.toString()))
                    case "track_name" => map.add("track_name", ValueType.STRING(value.read(i).str.toString()))
                    case "hdr_type" => map.add("hdr_type", ValueType.STRING(value.read(i).str.toString()))
                    case value => throw IllegalArgumentException("CMediaDescription: unknown value ${value}.")
                }
            }
        }
        return map
    }

    func free(): Unit {
        unsafe {
            for (i in 0..size) {
                LibC.free(key.read(i))
                LibC.free(value.read(i).str)
            }
            LibC.free(key)
            LibC.free(value)
        }
    }
}

@C
struct CArrCMediaDescription {
    CArrCMediaDescription(
        let head: CPointer<CMediaDescription>,
        let size: Int64
    ) {}

    func toArrayMediaDescription(): Array<MediaDescription> {
        unsafe {
            cArr2cjArr<CMediaDescription, MediaDescription>(size, head) {
                cCMediaDescription: CMediaDescription => cCMediaDescription.toHashMap()
            }
        }
    }

    func free(): Unit {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

@C
struct CHeader {
    CHeader(
        var key: CString,
        var value: CString
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(key)
            LibC.free(value)
        }
    }
}

@C
struct ArrHeaders {
    ArrHeaders(
        let headers: CPointer<CHeader>,
        let size: Int64
    ) {}

    func free(): Unit {
        unsafe {
            for (i in 0..size) {
                headers.read(i).free()
            }
            LibC.free(headers)
        }
    }
}

@C
struct CPlaybackStrategy {
    static let DEFAULT = CPlaybackStrategy(0, 0, 0, false, 3, CString(CPointer<UInt8>()), CString(CPointer<UInt8>()))
    CPlaybackStrategy(
        var preferredWidth: UInt32,
        var preferredHeight: UInt32,
        var preferredBufferDuration: UInt32,
        var preferredHdr: Bool,
        var mutedMediaType: Int32, // will pass 3 to C
        var preferredAudioLanguage: CString,
        var preferredSubtitleLanguage: CString
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(preferredAudioLanguage)
            LibC.free(preferredSubtitleLanguage)
        }
    }
}

@C
struct CPlaybackInfo {
    CPlaybackInfo(
        let key: Int32,
        let value: CPointer<Unit>
    ) {}

    func toValueType(): ValueType {
        unsafe {
            match (key) {
                case 0 => ValueType.STRING(CString(CPointer<UInt8>(value)).toString())
                case 3 => ValueType.INT(CPointer<Int32>(value).read())
                case _ => ValueType.INT64(CPointer<Int64>(value).read())
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(value)
        }
    }
}

@C
struct CArrCPlaybackInfo {
    CArrCPlaybackInfo(
        let infos: CPointer<CPlaybackInfo>,
        let size: Int64
    ) {}

    func toPlaybackInfo(): PlaybackInfo {
        let map = PlaybackInfo()
        unsafe {
            for (i in 0..size) {
                let playbackInfo = infos.read(i)
                map.add(PlaybackInfoKey.parse(playbackInfo.key), playbackInfo.toValueType())
            }
        }
        return map
    }

    func free(): Unit {
        unsafe {
            for (i in 0..size) {
                infos.read(i).free()
            }
            LibC.free(infos)
        }
    }
}

@C
protected struct CAVDataSrcDescriptor {
    protected var fileSize: Int64
    protected var callback: Int64

    protected init(descriptor: AVDataSrcDescriptor) {
        this.fileSize = descriptor.fileSize
        let wrapper: (CPointer<UInt8>, UInt32, Int64) -> Int32 = {
            buffer: CPointer<UInt8>, length: UInt32, pos: Int64 => descriptor.callback.invoke(
                unsafe { cArr2cjArr<UInt8, UInt8>(Int64(length), buffer, {i => i}) }, length, pos)
        }
        this.callback = Callback3Param<CPointer<UInt8>, UInt32, Int64, Int32>(wrapper).getID()
    }

    protected init(fileSize: Int64, callback: Int64) {
        this.fileSize = fileSize
        this.callback = callback
    }

    protected func toCJObject(): AVDataSrcDescriptor {
        AVDataSrcDescriptor(fileSize, InnerUnusedCallback())
    }
}

@C
protected struct CAVFileDescriptor {
    private var fd_: Int32
    private var offset_: Int64
    private var length_: Int64

    protected init(fileDescriptor: AVFileDescriptor) {
        this(fileDescriptor.fd, fileDescriptor.offset, fileDescriptor.length)
    }

    init(fd: Int32, offset: ?Int64, length: ?Int64) {
        fd_ = fd
        offset_ = offset ?? 0
        length_ = length ?? 0
    }

    protected func toCJObject(): AVFileDescriptor {
        return AVFileDescriptor(fd_, offset_, length_)
    }
}

@C
protected struct CPixelMapParams {
    protected var width_: Int32
    protected var height_: Int32

    protected init(param: PixelMapParams) {
        this(param.width, param.height)
    }

    protected init(width: Int32, height: Int32) {
        width_ = width
        height_ = height
    }
}

@C
protected struct CMetaLocation {
    protected var latitude: Float32
    protected var longitude: Float32

    protected init() {
        latitude = 0.0
        longitude = 0.0
    }

    protected func toCJObject(): Location {
        return Location(Float64(latitude), Float64(longitude))
    }
}

@C
protected struct CCustomInfo {
    protected var key: CPointer<CString>
    protected var value: CPointer<CString>
    protected var size: Int64

    protected init() {
        key = CPointer<CString>()
        value = CPointer<CString>()
        size = 0
    }

    protected func toCJObject(): HashMap<String, String> {
        return HashMap<String, String>(size) {
            index: Int64 => unsafe {
                let keyPtr = (key + index).read()
                let valuePtr = (value + index).read()
                (keyPtr.toString(), valuePtr.toString())
            }
        }
    }

    protected mut func free(): Unit {
        unsafe {
            for (index in 0..size) {
                LibC.free((key + index).read())
                LibC.free((value + index).read())
            }
            LibC.free(key)
            LibC.free(value)
            size = 0
        }
    }
}

@C
protected struct CMetaAVMetadata {
    protected var album: CString
    protected var albumArtist: CString
    protected var artist: CString
    protected var author: CString
    protected var dateTime: CString
    protected var dateTimeFormat: CString
    protected var composer: CString
    protected var duration: CString
    protected var genre: CString
    protected var hasAudio: CString
    protected var hasVideo: CString
    protected var mimeType: CString
    protected var trackCount: CString
    protected var sampleRate: CString
    protected var title: CString
    protected var videoHeight: CString
    protected var videoWidth: CString
    protected var videoOrientation: CString
    protected var hdrType: Int32
    protected var location: CMetaLocation
    protected var customInfo: CCustomInfo

    protected init() {
        album = CString(CPointer())
        albumArtist = CString(CPointer())
        artist = CString(CPointer())
        author = CString(CPointer())
        dateTime = CString(CPointer())
        dateTimeFormat = CString(CPointer())
        composer = CString(CPointer())
        duration = CString(CPointer())
        genre = CString(CPointer())
        hasAudio = CString(CPointer())
        hasVideo = CString(CPointer())
        mimeType = CString(CPointer())
        trackCount = CString(CPointer())
        sampleRate = CString(CPointer())
        title = CString(CPointer())
        videoHeight = CString(CPointer())
        videoWidth = CString(CPointer())
        videoOrientation = CString(CPointer())
        hdrType = 0
        location = CMetaLocation()
        customInfo = CCustomInfo()
    }

    func toOptionString(str: CString): ?String {
        if (str.isEmpty()) {
            None<String>
        } else {
            str.toString()
        }
    }

    protected func toCJObject(): AVMetadata {
        let album_ = toOptionString(album)
        let albumArtist_ = toOptionString(albumArtist)
        let artist_ = toOptionString(artist)
        let author_ = toOptionString(author)
        let dateTime_ = toOptionString(dateTime)
        let dateTimeFormat_ = toOptionString(dateTimeFormat)
        let composer_ = toOptionString(composer)
        let duration_ = toOptionString(duration)
        let genre_ = toOptionString(genre)
        let hasAudio_ = toOptionString(hasAudio)
        let hasVideo_ = toOptionString(hasVideo)
        let mimeType_ = toOptionString(mimeType)
        let trackCount_ = toOptionString(trackCount)
        let sampleRate_ = toOptionString(sampleRate)
        let title_ = toOptionString(title)
        let videoHeight_ = toOptionString(videoHeight)
        let videoWidth_ = toOptionString(videoWidth)
        let videoOrientation_ = toOptionString(videoOrientation)
        return AVMetadata(album: album_, albumArtist: albumArtist_, artist: artist_, author: author_,
            dateTime: dateTime_, dateTimeFormat: dateTimeFormat_, composer: composer_, duration: duration_,
            genre: genre_, hasAudio: hasAudio_, hasVideo: hasVideo_, mimeType: mimeType_, trackCount: trackCount_,
            sampleRate: sampleRate_, title: title_, videoHeight: videoHeight_, videoWidth: videoWidth_,
            videoOrientation: videoOrientation_, hdrType: HdrType.parse(hdrType), location: location.toCJObject(),
            customInfo: customInfo.toCJObject())
    }

    protected mut func free(): Unit {
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
        customInfo.free()
    }
}
