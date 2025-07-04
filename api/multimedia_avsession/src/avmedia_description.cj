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
import ohos.multimedia_media.*
import ohos.labels.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class AVMediaDescription {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public AVMediaDescription(
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
        public var mediaImage: ?ValueType,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var extras: ?HashMap<String, ValueType>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var mediaUri: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var mediaType: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var mediaSize: ?Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var albumTitle: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var albumCoverUri: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var lyricContent: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var lyricUri: ?String,
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
        public var fdSrc: ?AVFileDescriptor,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var dataSrc: ?AVDataSrcDescriptor,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var drmScheme: ?String,
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
        public var startPosition: ?Int64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var creditsPosition: ?Int64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var appName: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var displayTags: ?DisplayTag
    ) {
        match (mediaImage) {
            case Some(v) => match (v) {
                case STRING(val) => ()
                case PIXEL_MAP(val) => ()
                case _ =>
                    LOGGER.error("AVMediaDescription Init failed: mediaImage of wrong type!")
                    this.mediaImage = None
            }
            case None => ()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public init(assetId: String) {
        this.assetId = assetId
        this.title = None
        this.subtitle = None
        this.description = None
        this.mediaImage = None
        this.extras = None
        this.mediaUri = None
        this.mediaType = None
        this.mediaSize = None
        this.albumTitle = None
        this.albumCoverUri = None
        this.lyricContent = None
        this.lyricUri = None
        this.artist = None
        this.fdSrc = None
        this.dataSrc = None
        this.drmScheme = None
        this.duration = None
        this.startPosition = None
        this.creditsPosition = None
        this.appName = None
        this.displayTags = None
    }

    func isValid(): Bool {
        !assetId.isEmpty()
    }
}

@C
protected struct CAVMediaDescription {
    private var mediaId_: CString
    private var title_: CString
    private var subtitle_: CString
    private var description_: CString
    private var mediaUri_: CString
    private var mediaImage_: StringPixelMapParameter
    private var extras_: CArrParameters
    private var mediaType_: CString
    private var mediaSize_: Int32
    private var albumTitle_: CString
    private var albumCoverUri_: CString
    private var lyricContent_: CString
    private var lyricUri_: CString
    private var artist_: CString
    private var fdSrc: CAVFileDescriptor
    private var dataSrc: CAVDataSrcDescriptor
    private var drmScheme_: CString
    private var duration_: Int64
    private var startPosition_: Int64
    private var creditsPosition_: Int64
    private var appName_: CString
    private var displayTags_: Int32

    init() {
        mediaId_ = CString(CPointer())
        title_ = CString(CPointer())
        subtitle_ = CString(CPointer())
        description_ = CString(CPointer())
        mediaUri_ = CString(CPointer())
        mediaType_ = CString(CPointer())
        albumTitle_ = CString(CPointer())
        albumCoverUri_ = CString(CPointer())
        lyricContent_ = CString(CPointer())
        lyricUri_ = CString(CPointer())
        artist_ = CString(CPointer())
        drmScheme_ = CString(CPointer())
        appName_ = CString(CPointer())
        mediaSize_ = 0
        duration_ = 0
        startPosition_ = 0
        creditsPosition_ = 0
        displayTags_ = 0
        mediaImage_ = StringPixelMapParameter.getCParaFromValueType(ValueType.STRING(""))
        extras_ = CArrParameters(HashMap())
        fdSrc = CAVFileDescriptor(AVFileDescriptor(0, None, None))
        dataSrc = CAVDataSrcDescriptor(AVDataSrcDescriptor(0, InnerUnusedCallback()))
    }

    protected init(avMediaDescription: AVMediaDescription) {
        this(
            avMediaDescription.assetId,
            avMediaDescription.title,
            avMediaDescription.subtitle,
            avMediaDescription.description,
            avMediaDescription.mediaImage,
            avMediaDescription.extras,
            avMediaDescription.mediaUri,
            avMediaDescription.mediaType,
            avMediaDescription.mediaSize,
            avMediaDescription.albumTitle,
            avMediaDescription.albumCoverUri,
            avMediaDescription.lyricContent,
            avMediaDescription.lyricUri,
            avMediaDescription.artist,
            avMediaDescription.fdSrc,
            avMediaDescription.dataSrc,
            avMediaDescription.drmScheme,
            avMediaDescription.duration,
            avMediaDescription.startPosition,
            avMediaDescription.creditsPosition,
            avMediaDescription.appName,
            avMediaDescription.displayTags
        )
    }

    init(assetId: String, title: ?String, subtitle: ?String, description: ?String, mediaImage: ?ValueType,
        extras: ?HashMap<String, ValueType>, mediaUri: ?String, mediaType: ?String, mediaSize: ?Int32,
        albumTitle: ?String, albumCoverUri: ?String, lyricContent: ?String, lyricUri: ?String, artist: ?String,
        fdSrc: ?AVFileDescriptor, dataSrc: ?AVDataSrcDescriptor, drmScheme: ?String, duration: ?Int64,
        startPosition: ?Int64, creditsPosition: ?Int64, appName: ?String, displayTags: ?DisplayTag) {
        mediaId_ = CString(CPointer())
        title_ = CString(CPointer())
        subtitle_ = CString(CPointer())
        description_ = CString(CPointer())
        mediaUri_ = CString(CPointer())
        mediaType_ = CString(CPointer())
        albumTitle_ = CString(CPointer())
        albumCoverUri_ = CString(CPointer())
        lyricContent_ = CString(CPointer())
        lyricUri_ = CString(CPointer())
        artist_ = CString(CPointer())
        drmScheme_ = CString(CPointer())
        appName_ = CString(CPointer())
        mediaSize_ = mediaSize ?? 0
        duration_ = duration ?? 0
        startPosition_ = startPosition ?? 0
        creditsPosition_ = creditsPosition ?? 0
        displayTags_ = displayTags?.value ?? 0
        mediaImage_ = StringPixelMapParameter.getCParaFromValueType(mediaImage ?? ValueType.STRING(""))
        extras_ = CArrParameters(extras ?? HashMap())
        this.fdSrc = CAVFileDescriptor(fdSrc ?? AVFileDescriptor(0, None, None))
        this.dataSrc = CAVDataSrcDescriptor(dataSrc ?? AVDataSrcDescriptor(0, InnerUnusedCallback()))
        unsafe {
            try {
                mediaId_ = LibC.mallocCString(assetId)
                title_ = LibC.mallocCString(title ?? "")
                subtitle_ = LibC.mallocCString(subtitle ?? "")
                description_ = LibC.mallocCString(description ?? "")
                mediaUri_ = LibC.mallocCString(mediaUri ?? "")
                mediaType_ = LibC.mallocCString(mediaType ?? "")
                albumTitle_ = LibC.mallocCString(albumTitle ?? "")
                albumCoverUri_ = LibC.mallocCString(albumCoverUri ?? "")
                lyricContent_ = LibC.mallocCString(lyricContent ?? "")
                lyricUri_ = LibC.mallocCString(lyricUri ?? "")
                artist_ = LibC.mallocCString(artist ?? "")
                drmScheme_ = LibC.mallocCString(drmScheme ?? "")
                appName_ = LibC.mallocCString(appName ?? "")
            } catch (e: Exception) {
                free()
                throw e
            }
        }
    }

    private unsafe static func freeAndReturnCString(ptr: CString, value: String): CString {
        LibC.free(ptr)
        return LibC.mallocCString(value)
    }

    protected prop assetId: String {
        get() {
            mediaId_.toString()
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

    protected mut prop subtitle: String {
        get() {
            subtitle_.toString()
        }
        set(value) {
            unsafe { subtitle_ = freeAndReturnCString(subtitle_, value) }
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

    protected mut prop extras: HashMap<String, ValueType> {
        get() {
            extras_.toHashMap()
        }
        set(value) {
            extras_.free()
            extras_ = CArrParameters(value)
        }
    }

    protected mut prop mediaUri: String {
        get() {
            mediaUri_.toString()
        }
        set(value) {
            unsafe { mediaUri_ = freeAndReturnCString(mediaUri_, value) }
        }
    }

    protected mut prop mediaType: String {
        get() {
            mediaType_.toString()
        }
        set(value) {
            unsafe { mediaType_ = freeAndReturnCString(mediaType_, value) }
        }
    }

    protected mut prop mediaSize: Int32 {
        get() {
            mediaSize_
        }
        set(value) {
            mediaSize_ = value
        }
    }

    protected mut prop albumTitle: String {
        get() {
            albumTitle_.toString()
        }
        set(value) {
            unsafe { albumTitle_ = freeAndReturnCString(albumTitle_, value) }
        }
    }

    protected mut prop albumCoverUri: String {
        get() {
            albumCoverUri_.toString()
        }
        set(value) {
            unsafe { albumCoverUri_ = freeAndReturnCString(albumCoverUri_, value) }
        }
    }

    protected mut prop lyricContent: String {
        get() {
            lyricContent_.toString()
        }
        set(value) {
            unsafe { lyricContent_ = freeAndReturnCString(lyricContent_, value) }
        }
    }

    protected mut prop lyricUri: String {
        get() {
            lyricUri_.toString()
        }
        set(value) {
            unsafe { lyricContent_ = freeAndReturnCString(lyricUri_, value) }
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

    protected mut prop drmScheme: String {
        get() {
            drmScheme_.toString()
        }
        set(value) {
            unsafe { drmScheme_ = freeAndReturnCString(drmScheme_, value) }
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

    protected mut prop startPosition: Int64 {
        get() {
            startPosition_
        }
        set(value) {
            startPosition_ = value
        }
    }

    protected mut prop creditsPosition: Int64 {
        get() {
            creditsPosition_
        }
        set(value) {
            creditsPosition_ = value
        }
    }

    protected mut prop appName: String {
        get() {
            appName_.toString()
        }
        set(value) {
            unsafe { appName_ = freeAndReturnCString(appName_, value) }
        }
    }

    protected mut prop displayTags: DisplayTag {
        get() {
            DisplayTag.parse(displayTags_)
        }
        set(value) {
            displayTags_ = value.value
        }
    }

    protected func toCJObjectAndFree(): AVMediaDescription {
        try {
            AVMediaDescription(
                this.assetId,
                this.title,
                this.subtitle,
                this.description,
                this.mediaImage,
                this.extras,
                this.mediaUri,
                this.mediaType,
                this.mediaSize,
                this.albumTitle,
                this.albumCoverUri,
                this.lyricContent,
                this.lyricUri,
                this.artist,
                Some<AVFileDescriptor>(this.fdSrc.toCJObject()),
                Some(this.dataSrc.toCJObject()),
                this.drmScheme,
                this.duration,
                this.startPosition,
                this.creditsPosition,
                this.appName,
                this.displayTags
            )
        } finally {
            free()
        }
    }

    protected func toCJObject(): AVMediaDescription {
        try {
            AVMediaDescription(
                this.assetId,
                this.title,
                this.subtitle,
                this.description,
                this.mediaImage,
                this.extras,
                this.mediaUri,
                this.mediaType,
                this.mediaSize,
                this.albumTitle,
                this.albumCoverUri,
                this.lyricContent,
                this.lyricUri,
                this.artist,
                Some<AVFileDescriptor>(this.fdSrc.toCJObject()),
                Some(this.dataSrc.toCJObject()),
                this.drmScheme,
                this.duration,
                this.startPosition,
                this.creditsPosition,
                this.appName,
                this.displayTags
            )
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    protected func free() {
        unsafe {
            LibC.free(mediaId_)
            LibC.free(title_)
            LibC.free(subtitle_)
            LibC.free(description_)
            LibC.free(mediaUri_)
            LibC.free(mediaType_)
            LibC.free(albumTitle_)
            LibC.free(albumCoverUri_)
            LibC.free(lyricContent_)
            LibC.free(lyricUri_)
            LibC.free(artist_)
            LibC.free(drmScheme_)
            LibC.free(appName_)
            mediaImage_.free()
        }
        extras_.free()
    }
}
