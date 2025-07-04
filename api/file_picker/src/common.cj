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

package ohos.file_picker

import std.collection.*
import ohos.base.*
import ohos.labels.*

const CREATE_FILE_NAME_LENGTH_LIMIT = 256
const INVALID_ARGS_CODE: Int32 = 13900020
const SELECT_ACTION = "ohos.want.action.OPEN_FILE"
const SAVE_ACTION = "ohos.want.action.CREATE_FILE"
const SELECT_PHOTO_ACTION = "ohos.want.action.photoPicker"
let PHOTO_VIEW_MIME_TYPE_MAP = HashMap<String, String>(
    [
        (PhotoViewMIMETypes.IMAGE_TYPE.types, "FILTER_MEDIA_TYPE_IMAGE"),
        (PhotoViewMIMETypes.VIDEO_TYPE.types, "FILTER_MEDIA_TYPE_VIDEO"),
        (PhotoViewMIMETypes.IMAGE_VIDEO_TYPE.types, "FILTER_MEDIA_TYPE_ALL")
    ]
)

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService.FolderSelection"
]
public enum DocumentSelectMode {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService.FolderSelection"
    ]
    FILE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService.FolderSelection"
    ]
    FOLDER
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService.FolderSelection"
    ]
    MIXED
    | ...

    prop mode: Int64 {
        get() {
            match (this) {
                case FILE => 0
                case FOLDER => 1
                case MIXED => 2
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public enum DocumentPickerMode <: Equatable<DocumentPickerMode> {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    DEFAULT
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    DOWNLOAD
    | ...

    func get(): Int64 {
        match (this) {
            case DEFAULT => 0
            case DOWNLOAD => 1
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public operator override func ==(mode: DocumentPickerMode): Bool {
        match ((this, mode)) {
            case (DEFAULT, DEFAULT) => true
            case (DOWNLOAD, DOWNLOAD) => true
            case _ => false
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public operator override func !=(other: DocumentPickerMode): Bool {
        !(this == other)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public class DocumentSelectOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public DocumentSelectOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var maxSelectNumber!: Int64 = 1,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var defaultFilePathUri!: ?String = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var fileSuffixFilters!: Array<String> = Array<String>(),
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var selectMode!: DocumentSelectMode = FILE,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var authMode!: Bool = false
    ) {
        if (maxSelectNumber < 1 || maxSelectNumber > 500) {
            throw BusinessException(INVALID_ARGS_CODE, "The maxSelectNumber must range from 1 to 500.")
        }
        if (fileSuffixFilters.size > 100) {
            throw BusinessException(INVALID_ARGS_CODE, "The fileSuffixFilters size can not exceed 100.")
        }
        if (authMode && defaultFilePathUri.isNone()) {
            throw BusinessException(INVALID_ARGS_CODE, "When authMode is true, must pass defaultFilePathUri.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public struct DocumentSaveOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public DocumentSaveOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var newFileNames!: Array<String> = Array<String>(),
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var defaultFilePathUri!: ?String = None,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var fileSuffixChoices!: Array<String> = Array<String>(),
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var pickerMode!: DocumentPickerMode = DocumentPickerMode.DEFAULT
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public struct AudioSelectOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public AudioSelectOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var maxSelectNumber!: Int64 = 1
    ) {
        if (maxSelectNumber < 1 || maxSelectNumber > 500) {
            throw BusinessException(INVALID_ARGS_CODE, "The maxSelectNumber must range from 1 to 500.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public struct AudioSaveOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public AudioSaveOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var newFileNames!: Array<String> = Array<String>()
    ) {}
}

struct ExtTypes {
    static const DOWNLOAD_TYPE: String = 'filePicker'
    static const AUDIO_PICKER_TYPE: String = 'audioPicker'
    static const PHOTO_PICKER_TYPE: String = 'photoPicker'
}

struct PickerDetailType {
    static const FILE_MGR_AUTH = 'downloadAuth'
    static const FILE_MGR_SELECT = 'select'
    static const FILE_MGR_SAVE = 'save'
}

@!APILevel[
    12,
    atomicservice: true,
    deprecated: 19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public enum PhotoViewMIMETypes {
    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    IMAGE_TYPE
    | @!APILevel[
        12,
        atomicservice: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    VIDEO_TYPE
    | @!APILevel[
        12,
        atomicservice: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    IMAGE_VIDEO_TYPE
    | ...

    prop types: String {
        get() {
            match (this) {
                case IMAGE_TYPE => "image/*"
                case VIDEO_TYPE => "video/*"
                case IMAGE_VIDEO_TYPE => "*/*"
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    deprecated: 19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public struct PhotoSelectResult {
    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public PhotoSelectResult(
        @!APILevel[
            12,
            atomicservice: true,
            deprecated: 19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var photoUris: Array<String>,
        @!APILevel[
            12,
            atomicservice: true,
            deprecated: 19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var isOriginalPhoto: Bool
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    deprecated: 19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public struct PhotoSelectOptions {
    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public PhotoSelectOptions(
        @!APILevel[
            12,
            atomicservice: true,
            deprecated: 19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var MIMEType!: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE,
        @!APILevel[
            12,
            atomicservice: true,
            deprecated: 19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var maxSelectNumber!: Int64 = 50
    ) {}
}

@!APILevel[
    12,
    deprecated: 19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public struct PhotoSaveOptions {
    @!APILevel[
        12,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public PhotoSaveOptions(
        @!APILevel[
            12,
            deprecated: 19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.UserFileService"
        ]
        public var newFileNames!: Array<String> = Array<String>()
    ) {}
}

class PickerResult {
    PickerResult(
        let resultCode: Int32,
        let userSuffixIndex: Int32,
        let isOriginal: Bool,
        let ability_params_stream: Array<String>,
        let uriArr: Array<String>,
        let photoUris: Array<String>
    ) {}
}
