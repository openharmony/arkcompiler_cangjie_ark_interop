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

package ohos.uniformTypeDescriptor

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public enum UniformDataType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ENTITY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OBJECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    COMPOSITE_OBJECT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TEXT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PLAIN_TEXT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    HTML
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    HYPERLINK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    XML
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    XHTML
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    RSS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SMIL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SOURCE_CODE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SHELL_SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    CSH_SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PERL_SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PHP_SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PYTHON_SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    RUBY_SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TYPE_SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    JAVA_SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    CSS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    C_HEADER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    C_SOURCE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    C_PLUS_PLUS_HEADER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    C_PLUS_PLUS_SOURCE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    JAVA_SOURCE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TEX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MARKDOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ASC_TEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    RICH_TEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DELIMITED_VALUES_TEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    COMMA_SEPARATED_VALUES_TEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TAB_SEPARATED_VALUES_TEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    EBOOK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    EPUB
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AZW
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AZW3
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    KFX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MOBI
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MEDIA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    JPEG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PNG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    RAW_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TIFF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    BMP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ICO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PHOTOSHOP_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AI_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    FAX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    JFX_FAX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    EFX_FAX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    XBITMAP_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    GIF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TGA_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SGI_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENEXR_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    FLASHPIX_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WORD_DOC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    EXCEL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WORD_DOT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    POWERPOINT_PPS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    POWERPOINT_POT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    EXCEL_XLT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    VISIO_VSD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PDF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    POSTSCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ENCAPSULATED_POSTSCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    VIDEO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AVI
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MPEG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MPEG4
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    VIDEO_3GPP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    VIDEO_3GPP2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MPEGURL_VIDEO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WINDOWS_MEDIA_WM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WINDOWS_MEDIA_WMV
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WINDOWS_MEDIA_WMP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WINDOWS_MEDIA_WVX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WINDOWS_MEDIA_WMX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    REALMEDIA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MATROSKA_VIDEO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    FLASH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AAC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AIFF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ALAC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    FLAC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MP3
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OGG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PCM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WINDOWS_MEDIA_WMA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WAVEFORM_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WINDOWS_MEDIA_WAX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AU_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    AIFC_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MPEGURL_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MPEG_4_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MP2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MPEG_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ULAW_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SD2_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    REALAUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MATROSKA_AUDIO
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    FILE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DIRECTORY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    FOLDER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SYMLINK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    BZ2_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TAZ_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WEB_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DISK_IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ISO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TAR_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ZIP_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    JAVA_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    GNU_TAR_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    GNU_ZIP_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    GNU_ZIP_TAR_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENXML
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WORDPROCESSINGML_DOCUMENT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SPREADSHEETML_SHEET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PRESENTATIONML_PRESENTATION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DRAWINGML_VISIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DRAWINGML_TEMPLATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    WORDPROCESSINGML_TEMPLATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PRESENTATIONML_TEMPLATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PRESENTATIONML_SLIDESHOW
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SPREADSHEETML_TEMPLATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENDOCUMENT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENDOCUMENT_TEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENDOCUMENT_SPREADSHEET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENDOCUMENT_PRESENTATION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENDOCUMENT_GRAPHICS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENDOCUMENT_FORMULA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    STUFFIT_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    RAR_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SEVEN_ZIP_ARCHIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    CALENDAR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    VCS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ICS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    CONTACT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DATABASE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    MESSAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    EXECUTABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PORTABLE_EXECUTABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    SUN_JAVA_CLASS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    VCARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    NAVIGATION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    LOCATION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    FONT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TRUETYPE_FONT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    TRUETYPE_COLLECTION_FONT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENTYPE_FONT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    POSTSCRIPT_FONT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    POSTSCRIPT_PFB_FONT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    POSTSCRIPT_PFA_FONT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_FORM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_APP_ITEM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_PIXEL_MAP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_ATOMIC_SERVICE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_PACKAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_HAP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_HDOC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_HINOTE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_STYLED_STRING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OPENHARMONY_WANT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OFD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    CAD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    OCTET_STREAM
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func get(): String {
        match (this) {
            case ENTITY => "general.entity"
            case OBJECT => "general.object"
            case COMPOSITE_OBJECT => "general.composite-object"
            case TEXT => "general.text"
            case PLAIN_TEXT => "general.plain-text"
            case HTML => "general.html"
            case HYPERLINK => "general.hyperlink"
            case XML => "general.xml"
            case XHTML => "general.xhtml"
            case RSS => "general.rss"
            case SMIL => "com.real.smil"
            case SOURCE_CODE => "general.source-code"
            case SCRIPT => "general.script"
            case SHELL_SCRIPT => "general.shell-script"
            case CSH_SCRIPT => "general.csh-script"
            case PERL_SCRIPT => "general.perl-script"
            case PHP_SCRIPT => "general.php-script"
            case PYTHON_SCRIPT => "general.python-script"
            case RUBY_SCRIPT => "general.ruby-script"
            case TYPE_SCRIPT => "general.type-script"
            case JAVA_SCRIPT => "general.java-script"
            case CSS => "general.css"
            case C_HEADER => "general.c-header"
            case C_SOURCE => "general.c-source"
            case C_PLUS_PLUS_HEADER => "general.c-plus-plus-header"
            case C_PLUS_PLUS_SOURCE => "general.c-plus-plus-source"
            case JAVA_SOURCE => "general.java-source"
            case TEX => "general.tex"
            case MARKDOWN => "general.markdown"
            case ASC_TEXT => "general.asc-text"
            case RICH_TEXT => "general.rich-text"
            case DELIMITED_VALUES_TEXT => "general.delimited-values-text"
            case COMMA_SEPARATED_VALUES_TEXT => "general.comma-separated-values-text"
            case TAB_SEPARATED_VALUES_TEXT => "general.tab-separated-values-text"
            case EBOOK => "general.ebook"
            case EPUB => "general.epub"
            case AZW => "com.amazon.azw"
            case AZW3 => "com.amazon.azw3"
            case KFX => "com.amazon.kfx"
            case MOBI => "com.amazon.mobi"
            case MEDIA => "general.media"
            case IMAGE => "general.image"
            case JPEG => "general.jpeg"
            case PNG => "general.png"
            case RAW_IMAGE => "general.raw-image"
            case TIFF => "general.tiff"
            case BMP => "com.microsoft.bmp"
            case ICO => "com.microsoft.ico"
            case PHOTOSHOP_IMAGE => "com.adobe.photoshop-image"
            case AI_IMAGE => "com.adobe.illustrator.ai-image"
            case FAX => "general.fax"
            case JFX_FAX => "com.j2.jfx-fax"
            case EFX_FAX => "com.js.efx-fax"
            case XBITMAP_IMAGE => "general.xbitmap-image"
            case GIF => "general.gif"
            case TGA_IMAGE => "com.truevision.tga-image"
            case SGI_IMAGE => "com.sgi.sgi-image"
            case OPENEXR_IMAGE => "com.ilm.openexr-image"
            case FLASHPIX_IMAGE => "com.kodak.flashpix.image"
            case WORD_DOC => "com.microsoft.word.doc"
            case EXCEL => "com.microsoft.excel.xls"
            case PPT => "com.microsoft.powerpoint.ppt"
            case WORD_DOT => "com.microsoft.word.dot"
            case POWERPOINT_PPS => "com.microsoft.powerpoint.pps"
            case POWERPOINT_POT => "com.microsoft.powerpoint.pot"
            case EXCEL_XLT => "com.microsoft.excel.xlt"
            case VISIO_VSD => "com.microsoft.visio.vsd"
            case PDF => "com.adobe.pdf"
            case POSTSCRIPT => "com.adobe.postscript"
            case ENCAPSULATED_POSTSCRIPT => "com.adobe.encapsulated-postscript"
            case VIDEO => "general.video"
            case AVI => "general.avi"
            case MPEG => "general.mpeg"
            case MPEG4 => "general.mpeg-4"
            case VIDEO_3GPP => "general.3gpp"
            case VIDEO_3GPP2 => "general.3gpp2"
            case TS => "general.ts"
            case MPEGURL_VIDEO => "general.mpegurl-video"
            case WINDOWS_MEDIA_WM => "com.microsoft.windows-media-wm"
            case WINDOWS_MEDIA_WMV => "com.microsoft.windows-media-wmv"
            case WINDOWS_MEDIA_WMP => "com.microsoft.windows-media-wmp"
            case WINDOWS_MEDIA_WVX => "com.microsoft.windows-media-wvx"
            case WINDOWS_MEDIA_WMX => "com.microsoft.windows-media-wmx"
            case REALMEDIA => "com.real.realmedia"
            case MATROSKA_VIDEO => "org.matroska.mkv"
            case FLASH => "com.adobe.flash"
            case AUDIO => "general.audio"
            case AAC => "general.aac"
            case AIFF => "general.aiff"
            case ALAC => "general.alac"
            case FLAC => "general.flac"
            case MP3 => "general.mp3"
            case OGG => "general.ogg"
            case PCM => "general.pcm"
            case WINDOWS_MEDIA_WMA => "com.microsoft.windows-media-wma"
            case WAVEFORM_AUDIO => "com.microsoft.waveform-audio"
            case WINDOWS_MEDIA_WAX => "com.microsoft.windows-media-wax"
            case AU_AUDIO => "general.au-audio"
            case AIFC_AUDIO => "general.aifc-audio"
            case MPEGURL_AUDIO => "general.mpegurl-audio"
            case MPEG_4_AUDIO => "general.mpeg-4-audio"
            case MP2 => "general.mp2"
            case MPEG_AUDIO => "general.mpeg-audio"
            case ULAW_AUDIO => "general.ulaw-audio"
            case SD2_AUDIO => "com.digidesign.sd2-audio"
            case REALAUDIO => "com.real.realaudio"
            case MATROSKA_AUDIO => "org.matroska.mka"
            case FILE => "general.file"
            case DIRECTORY => "general.directory"
            case FOLDER => "general.folder"
            case SYMLINK => "general.symlink"
            case ARCHIVE => "general.archive"
            case BZ2_ARCHIVE => "general.bz2-archive"
            case OPG => "general.opg"
            case TAZ_ARCHIVE => "general.taz-archive"
            case WEB_ARCHIVE => "general.web-archive"
            case DISK_IMAGE => "general.disk-image"
            case ISO => "general.iso"
            case TAR_ARCHIVE => "general.tar-archive"
            case ZIP_ARCHIVE => "general.zip-archive"
            case JAVA_ARCHIVE => "com.sun.java-archive"
            case GNU_TAR_ARCHIVE => "org.gnu.gnu-tar-archive"
            case GNU_ZIP_ARCHIVE => "org.gnu.gnu-zip-archive"
            case GNU_ZIP_TAR_ARCHIVE => "org.gnu.gnu-zip-tar-archive"
            case OPENXML => "org.openxmlformats.openxml"
            case WORDPROCESSINGML_DOCUMENT => "org.openxmlformats.wordprocessingml.document"
            case SPREADSHEETML_SHEET => "org.openxmlformats.spreadsheetml.sheet"
            case PRESENTATIONML_PRESENTATION => "org.openxmlformats.presentationml.presentation"
            case DRAWINGML_VISIO => "org.openxmlformats.drawingml.visio"
            case DRAWINGML_TEMPLATE => "org.openxmlformats.drawingml.template"
            case WORDPROCESSINGML_TEMPLATE => "org.openxmlformats.wordprocessingml.template"
            case PRESENTATIONML_TEMPLATE => "org.openxmlformats.presentationml.template"
            case PRESENTATIONML_SLIDESHOW => "org.openxmlformats.presentationml.slideshow"
            case SPREADSHEETML_TEMPLATE => "org.openxmlformats.spreadsheetml.template"
            case OPENDOCUMENT => "org.oasis.opendocument"
            case OPENDOCUMENT_TEXT => "org.oasis.opendocument.text"
            case OPENDOCUMENT_SPREADSHEET => "org.oasis.opendocument.spreadsheet"
            case OPENDOCUMENT_PRESENTATION => "org.oasis.opendocument.presentation"
            case OPENDOCUMENT_GRAPHICS => "org.oasis.opendocument.graphics"
            case OPENDOCUMENT_FORMULA => "org.oasis.opendocument.formula"
            case STUFFIT_ARCHIVE => "com.allume.stuffit-archive"
            case RAR_ARCHIVE => "com.rarlab.rar-archive"
            case SEVEN_ZIP_ARCHIVE => "org.7-zip.7-zip-archive"
            case CALENDAR => "general.calendar"
            case VCS => "general.vcs"
            case ICS => "general.ics"
            case CONTACT => "general.contact"
            case DATABASE => "general.database"
            case MESSAGE => "general.message"
            case EXECUTABLE => "general.executable"
            case PORTABLE_EXECUTABLE => "com.microsoft.portable-executable"
            case SUN_JAVA_CLASS => "com.sun.java-class"
            case VCARD => "general.vcard"
            case NAVIGATION => "general.navigation"
            case LOCATION => "general.location"
            case FONT => "general.font"
            case TRUETYPE_FONT => "general.truetype-font"
            case TRUETYPE_COLLECTION_FONT => "general.truetype-collection-font"
            case OPENTYPE_FONT => "general.opentype-font"
            case POSTSCRIPT_FONT => "com.adobe.postscript-font"
            case POSTSCRIPT_PFB_FONT => "com.adobe.postscript-pfb-font"
            case POSTSCRIPT_PFA_FONT => "com.adobe.postscript-pfa-font"
            case OPENHARMONY_FORM => "openharmony.form"
            case OPENHARMONY_APP_ITEM => "openharmony.app-item"
            case OPENHARMONY_PIXEL_MAP => "openharmony.pixel-map"
            case OPENHARMONY_ATOMIC_SERVICE => "openharmony.atomic-service"
            case OPENHARMONY_PACKAGE => "openharmony.package"
            case OPENHARMONY_HAP => "openharmony.hap"
            case OPENHARMONY_HDOC => "openharmony.hdoc"
            case OPENHARMONY_HINOTE => "openharmony.hinote"
            case OPENHARMONY_STYLED_STRING => "openharmony.styled-string"
            case OPENHARMONY_WANT => "openharmony.want"
            case OFD => "general.ofd"
            case CAD => "general.cad"
            case OCTET_STREAM => "general.octet-stream"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
