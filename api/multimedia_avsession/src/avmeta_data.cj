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

package ohos.multimedia_avsession

import std.collection.*
import ohos.image.*
import std.time.*
import ohos.labels.*

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class AVMetadata {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public AVMetadata(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var assetId: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var title: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var artist: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var author: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var avQueueName: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var avQueueId: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var avQueueImage: ?ValueType,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var album: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var writer: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var composer: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var duration: ?Int64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var mediaImage: ?ValueType,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var publishDate: ?DateTime,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var subtitle: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var description: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var lyric: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var previousAssetId: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var nextAssetId: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var filter: ?Array<ProtocolType>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var drmSchemes: ?Array<String>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var skipIntervals: ?SkipIntervals,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var displayTags: ?DisplayTag
    ) {}

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public init(assetId: String) {
        this.assetId = assetId
        this.title = None
        this.artist = None
        this.author = None
        this.avQueueName = None
        this.avQueueId = None
        this.avQueueImage = None
        this.album = None
        this.writer = None
        this.composer = None
        this.duration = None
        this.mediaImage = None
        this.publishDate = None
        this.subtitle = None
        this.description = None
        this.lyric = None
        this.previousAssetId = None
        this.nextAssetId = None
        this.filter = None
        this.drmSchemes = None
        this.skipIntervals = None
        this.displayTags = None
    }
}

@C
protected struct CAVMetaData {
    private var assetId_: CString
    private var title_: CString
    private var artist_: CString
    private var author_: CString
    private var avQueueName_: CString
    private var avQueueId_: CString
    private var avQueueImage_: StringPixelMapParameter
    private var album_: CString
    private var writer_: CString
    private var composer_: CString
    private var duration_: Int64
    private var mediaImage_: StringPixelMapParameter
    private var publishDate_: Int64
    private var subTitle_: CString
    private var description_: CString
    private var lyric_: CString
    private var previousAssetId_: CString
    private var nextAssetId_: CString
    private var filter_: Int32
    private var drmSchemes_: CStringArr
    private var skipIntervals_: Int32
    private var displayTags_: Int32
    private var mediaLength_: Int32
    private var avQueueLength_: Int32

    init() {
        assetId_ = CString(CPointer())
        title_ = CString(CPointer())
        artist_ = CString(CPointer())
        author_ = CString(CPointer())
        avQueueName_ = CString(CPointer())
        avQueueId_ = CString(CPointer())
        album_ = CString(CPointer())
        writer_ = CString(CPointer())
        composer_ = CString(CPointer())
        duration_ = 0
        subTitle_ = CString(CPointer())
        description_ = CString(CPointer())
        lyric_ = CString(CPointer())
        previousAssetId_ = CString(CPointer())
        nextAssetId_ = CString(CPointer())
        skipIntervals_ = SkipIntervals.SECONDS_15.value
        filter_ = protocolArrayToNumber([ProtocolType.TYPE_CAST_PLUS_STREAM])
        displayTags_ = 0
        mediaLength_ = 0
        avQueueLength_ = 0
        publishDate_ = 0
        avQueueImage_ = StringPixelMapParameter.getCParaFromValueType(ValueType.STRING(""))
        mediaImage_ = StringPixelMapParameter.getCParaFromValueType(ValueType.STRING(""))
        drmSchemes_ = CStringArr(Array())
    }

    protected init(avMetadata: AVMetadata) {
        this(avMetadata.assetId, avMetadata.title, avMetadata.artist, avMetadata.author, avMetadata.avQueueName,
            avMetadata.avQueueId, avMetadata.avQueueImage, avMetadata.album, avMetadata.writer, avMetadata.composer,
            avMetadata.duration, avMetadata.mediaImage, avMetadata.publishDate, avMetadata.subtitle,
            avMetadata.description, avMetadata.lyric, avMetadata.previousAssetId, avMetadata.nextAssetId,
            avMetadata.filter, avMetadata.drmSchemes, avMetadata.skipIntervals, avMetadata.displayTags)
    }

    protected init(assetId: String, title: ?String, artist: ?String, author: ?String, avQueueName: ?String,
        avQueueId: ?String, avQueueImage: ?ValueType, album: ?String, writer: ?String, composer: ?String,
        duration: ?Int64, mediaImage: ?ValueType, publishDate: ?DateTime, subTitle: ?String, description: ?String,
        lyric: ?String, previousAssetId: ?String, nextAssetId: ?String, filter: ?Array<ProtocolType>,
        drmSchemes: ?Array<String>, skipIntervals: ?SkipIntervals, displayTags: ?DisplayTag) {
        assetId_ = CString(CPointer())
        title_ = CString(CPointer())
        artist_ = CString(CPointer())
        author_ = CString(CPointer())
        avQueueName_ = CString(CPointer())
        avQueueId_ = CString(CPointer())
        album_ = CString(CPointer())
        writer_ = CString(CPointer())
        composer_ = CString(CPointer())
        duration_ = duration ?? 0
        subTitle_ = CString(CPointer())
        description_ = CString(CPointer())
        lyric_ = CString(CPointer())
        previousAssetId_ = CString(CPointer())
        nextAssetId_ = CString(CPointer())
        skipIntervals_ = skipIntervals?.value ?? SkipIntervals.SECONDS_15.value
        filter_ = protocolArrayToNumber(filter ?? [ProtocolType.TYPE_CAST_PLUS_STREAM])
        displayTags_ = displayTags?.value ?? 0
        mediaLength_ = 0
        avQueueLength_ = 0
        publishDate_ = publishDate?.toUnixTimeStamp().toSeconds() ?? 0
        avQueueImage_ = StringPixelMapParameter.getCParaFromValueType(avQueueImage ?? ValueType.STRING(""))
        mediaImage_ = StringPixelMapParameter.getCParaFromValueType(mediaImage ?? ValueType.STRING(""))
        drmSchemes_ = CStringArr(drmSchemes ?? Array())
        unsafe {
            try {
                assetId_ = LibC.mallocCString(assetId)
                title_ = LibC.mallocCString(title ?? "")
                artist_ = LibC.mallocCString(artist ?? "")
                author_ = LibC.mallocCString(author ?? "")
                avQueueName_ = LibC.mallocCString(avQueueName ?? "")
                avQueueId_ = LibC.mallocCString(avQueueId ?? "")
                album_ = LibC.mallocCString(album ?? "")
                writer_ = LibC.mallocCString(writer ?? "")
                composer_ = LibC.mallocCString(composer ?? "")
                subTitle_ = LibC.mallocCString(subTitle ?? "")
                description_ = LibC.mallocCString(description ?? "")
                lyric_ = LibC.mallocCString(lyric ?? "")
                previousAssetId_ = LibC.mallocCString(previousAssetId ?? "")
                nextAssetId_ = LibC.mallocCString(nextAssetId ?? "")
            } catch (e: Exception) {
                free()
                throw e
            }
        }
    }

    protected func free() {
        unsafe {
            LibC.free(assetId_)
            LibC.free(title_)
            LibC.free(artist_)
            LibC.free(author_)
            LibC.free(avQueueName_)
            LibC.free(avQueueId_)
            LibC.free(album_)
            LibC.free(writer_)
            LibC.free(composer_)
            LibC.free(subTitle_)
            LibC.free(description_)
            LibC.free(lyric_)
            LibC.free(previousAssetId_)
            LibC.free(nextAssetId_)
            avQueueImage_.free()
            mediaImage_.free()
        }
        drmSchemes_.free()
    }

    private static func protocolArrayToNumber(arr: Array<ProtocolType>): Int32 {
        var result: Int32 = 0
        for (num in arr) {
            result += num.value
        }
        result
    }

    private static func numberToProtocolArray(number: Int32): Array<ProtocolType> {
        let arr = ArrayList<ProtocolType>()
        if ((ProtocolType.TYPE_CAST_PLUS_STREAM.value & number) != 0) {
            arr.add(ProtocolType.TYPE_CAST_PLUS_STREAM)
        }
        if ((ProtocolType.TYPE_DLNA.value & number) != 0) {
            arr.add(ProtocolType.TYPE_DLNA)
        }
        arr.toArray()
    }

    private unsafe static func freeAndReturnCString(ptr: CString, value: String): CString {
        LibC.free(ptr)
        return LibC.mallocCString(value)
    }

    protected prop assetId: String {
        get() {
            assetId_.toString()
        }
    }

    protected mut prop title: String {
        get() {
            title_.toString()
        }
        set(value) {
            unsafe { title_ = freeAndReturnCString(title_, value) }
        }
    }

    protected mut prop artist: String {
        get() {
            artist_.toString()
        }
        set(value) {
            unsafe { artist_ = freeAndReturnCString(artist_, value) }
        }
    }

    protected mut prop author: String {
        get() {
            author_.toString()
        }
        set(value) {
            unsafe { author_ = freeAndReturnCString(author_, value) }
        }
    }

    protected mut prop avQueueName: String {
        get() {
            avQueueName_.toString()
        }
        set(value) {
            unsafe { avQueueName_ = freeAndReturnCString(avQueueName_, value) }
        }
    }

    protected mut prop avQueueId: String {
        get() {
            avQueueId_.toString()
        }
        set(value) {
            unsafe { avQueueId_ = freeAndReturnCString(avQueueId_, value) }
        }
    }

    protected mut prop avQueueImage: ValueType {
        get() {
            match {
                case avQueueImage_.kind == STRING_TYPE => ValueType.STRING(avQueueImage_.string.toString())
                case avQueueImage_.kind == PIXEL_MAP_TYPE => ValueType.PIXEL_MAP(PixelMap(mediaImage_.pixelMap))
                case _ => throw IllegalArgumentException("illegal AVMetaDataParameter.kind")
            }
        }
        set(value) {
            unsafe { avQueueImage_.free() }
            avQueueImage_ = StringPixelMapParameter.getCParaFromValueType(value)
        }
    }

    protected mut prop album: String {
        get() {
            album_.toString()
        }
        set(value) {
            unsafe { album_ = freeAndReturnCString(album_, value) }
        }
    }

    protected mut prop writer: String {
        get() {
            writer_.toString()
        }
        set(value) {
            unsafe { writer_ = freeAndReturnCString(writer_, value) }
        }
    }

    protected mut prop composer: String {
        get() {
            composer_.toString()
        }
        set(value) {
            unsafe { composer_ = freeAndReturnCString(composer_, value) }
        }
    }

    protected mut prop duration: Int64 {
        get() {
            duration_
        }
        set(value) {
            duration_ = value
        }
    }

    protected mut prop mediaImage: ValueType {
        get() {
            match {
                case mediaImage_.kind == STRING_TYPE => ValueType.STRING(mediaImage_.string.toString())
                case mediaImage_.kind == PIXEL_MAP_TYPE => ValueType.PIXEL_MAP(PixelMap(mediaImage_.pixelMap))
                case _ => throw IllegalArgumentException("illegal AVMetaDataParameter.kind")
            }
        }
        set(value) {
            mediaImage_ = StringPixelMapParameter.getCParaFromValueType(value)
        }
    }

    protected mut prop publishDate: DateTime {
        get() {
            DateTime.ofEpoch(second: publishDate_, nanosecond: 0)
        }
        set(value) {
            publishDate_ = value.toUnixTimeStamp().toSeconds()
        }
    }

    protected mut prop subtitle: String {
        get() {
            subTitle_.toString()
        }
        set(value) {
            unsafe { subTitle_ = freeAndReturnCString(subTitle_, value) }
        }
    }

    protected mut prop description: String {
        get() {
            description_.toString()
        }
        set(value) {
            unsafe { description_ = freeAndReturnCString(description_, value) }
        }
    }

    protected mut prop lyric: String {
        get() {
            lyric_.toString()
        }
        set(value) {
            unsafe { lyric_ = freeAndReturnCString(lyric_, value) }
        }
    }

    protected mut prop previousAssetId: String {
        get() {
            previousAssetId_.toString()
        }
        set(value) {
            unsafe { previousAssetId_ = freeAndReturnCString(previousAssetId_, value) }
        }
    }

    protected mut prop nextAssetId: String {
        get() {
            nextAssetId_.toString()
        }
        set(value) {
            unsafe { nextAssetId_ = freeAndReturnCString(nextAssetId_, value) }
        }
    }

    protected mut prop filter: Int32 {
        get() {
            filter_
        }
        set(value) {
            filter_ = value
        }
    }

    protected mut prop skipIntervals: ?SkipIntervals {
        get() {
            try {
                SkipIntervals.parse(skipIntervals_)
            } catch (e: IllegalArgumentException) {
                return None
            }
        }
        set(value) {
            skipIntervals_ = value?.value ?? SkipIntervals.SECONDS_15.value
        }
    }

    protected mut prop displayTags: ?DisplayTag {
        get() {
            try {
                DisplayTag.parse(displayTags_)
            } catch (e: IllegalArgumentException) {
                return None
            }
        }
        set(value) {
            displayTags_ = value?.value ?? 0
        }
    }

    protected mut prop drmSchemes: Array<String> {
        get() {
            drmSchemes_.toArray()
        }
        set(value) {
            drmSchemes_.free()
            drmSchemes_ = CStringArr(value)
        }
    }

    protected func toCJObjectAndFree(): AVMetadata {
        try {
            AVMetadata(this.assetId, this.title, this.artist, this.author, this.avQueueName, this.avQueueId,
                this.avQueueImage, this.album, this.writer, this.composer, this.duration, this.mediaImage,
                this.publishDate, this.subtitle, this.description, this.lyric, this.previousAssetId, this.nextAssetId,
                numberToProtocolArray(this.filter), this.drmSchemes, this.skipIntervals, this.displayTags)
        } finally {
            free()
        }
    }

    protected func toCJObject(): AVMetadata {
        try {
            AVMetadata(this.assetId, this.title, this.artist, this.author, this.avQueueName, this.avQueueId,
                this.avQueueImage, this.album, this.writer, this.composer, this.duration, this.mediaImage,
                this.publishDate, this.subtitle, this.description, this.lyric, this.previousAssetId, this.nextAssetId,
                numberToProtocolArray(this.filter), this.drmSchemes, this.skipIntervals, this.displayTags)
        } catch (e: Exception) {
            free()
            throw e
        }
    }
}
