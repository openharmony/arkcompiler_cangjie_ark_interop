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

import ohos.hilog.*
import std.collection.*
import ohos.ability.*
import ohos.encoding.json.*
import ohos.base.*
import ohos.labels.*
import ohos.ffi.*

/**
 * PhotoViewPicker Object
 *
 * @syscap SystemCapability.FileManagement.UserFileService
 */
@!APILevel[
    12,
    atomicservice: true,
    deprecated: 19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public class PhotoViewPicker {
    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public PhotoViewPicker(let abilityContext: UIAbilityContext) {}

    /**
     * Pull up the photo picker based on the selection mode.
     *
     * @param { AsyncCallback<PhotoSelectResult> } callback - callback
     * @param { PhotoSelectOptions } option - represents the options provided in select mode.
     * @syscap SystemCapability.FileManagement.UserFileService
     * @bref select(option: PhotoSelectOptions, callback: AsyncCallback<PhotoSelectResult>): void;
     */
    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public func select(
        callback: AsyncCallback<PhotoSelectResult>,
        option!: PhotoSelectOptions = PhotoSelectOptions()
    ): Unit {
        var wantType = "multipleselect"
        let paramMap = HashMap<String, JsonValue>()
        paramMap.add("filterMediaType", JsonString(PHOTO_VIEW_MIME_TYPE_MAP[option.MIMEType.types]))
        paramMap.add("extType", JsonString(ExtTypes.PHOTO_PICKER_TYPE))
        paramMap.add("uri", JsonString("multipleselect"))
        if (option.maxSelectNumber > 0) {
            if (option.maxSelectNumber == 1) {
                wantType = "singleselect"
                paramMap["uri"] = JsonString("singleselect")
            }
            paramMap.add("maxSelectCount", JsonString(option.maxSelectNumber.toString()))
        }
        paramMap.add("mime-type", JsonString(wantType))
        paramMap.add("moduleName", JsonString(""))
        let want = Want(
            action: SELECT_PHOTO_ACTION,
            `type`: wantType,
            parameters: JsonObject(paramMap).toString()
        )

        modalPicker(abilityContext, want, None) {
            ret => if (ret.resultCode != SUCCESS_CODE) {
                callback(AsyncError(ret.resultCode), Option<PhotoSelectResult>.None)
            } else {
                let selectResult = PhotoSelectResult(ret.photoUris, ret.isOriginal)
                callback(None, selectResult)
            }
        }
    }

    /**
     * Pull up the photo picker based on the save mode.
     *
     * @param { AsyncCallback<Array<String>> } callback - callback
     * @param { PhotoSaveOptions } option - represents the options provided in save mode.
     * @syscap SystemCapability.FileManagement.UserFileService
     * @bref save(option: PhotoSaveOptions, callback: AsyncCallback<Array<string>>): void;
     */
    @!APILevel[
        19,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public func save(callback: AsyncCallback<Array<String>>, option!: PhotoSaveOptions = PhotoSaveOptions()): Unit {
        let documentOption = DocumentSaveOptions(newFileNames: option.newFileNames)
        let documentPicker = DocumentViewPicker(abilityContext)
        documentPicker.save(callback, option: documentOption)
    }
}

/**
 * DocumentViewPicker Object
 *
 * @syscap SystemCapability.FileManagement.UserFileService
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public class DocumentViewPicker {
    var suffixIndex = -1i32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public DocumentViewPicker(let abilityContext: UIAbilityContext) {}

    /**
     * Pull up the document picker based on the selection mode.
     *
     * @param { AsyncCallback<Array<String>> } callback - callback
     * @param { DocumentSelectOptions } option - represents the options provided in select mode.
     * @syscap SystemCapability.FileManagement.UserFileService
     * @bref select(option: DocumentSelectOptions, callback: AsyncCallback<Array<string>>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public func select(
        callback: AsyncCallback<Array<String>>,
        option!: DocumentSelectOptions = DocumentSelectOptions()
    ): Unit {
        let paramMap = HashMap<String, JsonValue>()
        paramMap.add("startMode", JsonString("choose"))
        paramMap.add("extType", JsonString(ExtTypes.DOWNLOAD_TYPE))
        paramMap.add("pickerType", JsonString(PickerDetailType.FILE_MGR_SELECT))

        paramMap.add("key_select_mode", JsonInt(option.selectMode.mode))
        paramMap.add("key_pick_num", JsonInt(option.maxSelectNumber))
        if (let Some(uri) <- option.defaultFilePathUri) {
            paramMap.add("key_pick_dir_path", JsonString(uri))
        }
        if (option.fileSuffixFilters.size > 0) {
            paramMap.add("key_file_suffix_filter", arrayToJsonArray(option.fileSuffixFilters))
        }
        paramMap.add("key_auth_mode", JsonBool(option.authMode))

        let want = Want(
            action: SELECT_ACTION,
            parameters: JsonObject(paramMap).toString()
        )

        modalPicker(abilityContext, want, None) {
            ret => if (ret.resultCode != SUCCESS_CODE) {
                callback(AsyncError(ret.resultCode), Option<Array<String>>.None)
            } else {
                callback(None, ret.ability_params_stream)
            }
        }
    }

    /**
     * Pull up the document picker based on the save mode.
     *
     * @param { AsyncCallback<Array<String>> } callback - callback
     * @param { DocumentSaveOptions } option - represents the options provided in save mode.
     * @syscap SystemCapability.FileManagement.UserFileService
     * @bref save(option: DocumentSaveOptions, callback: AsyncCallback<Array<string>>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public func save(
        callback: AsyncCallback<Array<String>>,
        option!: DocumentSaveOptions = DocumentSaveOptions()
    ): Unit {
        for (i in 0..option.newFileNames.size) {
            if (option.newFileNames[i].size >= CREATE_FILE_NAME_LENGTH_LIMIT) {
                callback(AsyncError(ErrCode.NAME_TOO_LONG), Option<Array<String>>.None)
                return
            }
        }
        let paramMap = HashMap<String, JsonValue>()
        paramMap.add("startMode", JsonString("save"))
        paramMap.add("pickerMode", JsonInt(DocumentPickerMode.DEFAULT.get()))
        paramMap.add("extType", JsonString(ExtTypes.DOWNLOAD_TYPE))
        paramMap.add("pickerType", JsonString(PickerDetailType.FILE_MGR_SAVE))
        if (option.newFileNames.size > 0) {
            paramMap.add("key_pick_file_name", arrayToJsonArray(option.newFileNames))
            paramMap.add("saveFile", JsonString(option.newFileNames[0]))
        }
        if (let Some(uri) <- option.defaultFilePathUri) {
            paramMap.add("key_pick_dir_path", JsonString(uri))
        }
        if (option.fileSuffixChoices.size > 0) {
            paramMap.add("key_file_suffix_choices", arrayToJsonArray(option.fileSuffixChoices))
        }
        if (option.pickerMode == DOWNLOAD) {
            paramMap.add("pickerMode", JsonInt(option.pickerMode.get()))
            paramMap.add("pickerType", JsonString(PickerDetailType.FILE_MGR_AUTH))
        }

        let abilityWant = Want(
            action: SAVE_ACTION,
            parameters: JsonObject(paramMap).toString()
        )
        // currently not support window
        modalPicker(abilityContext, abilityWant, None) {
            ret => if (ret.resultCode != SUCCESS_CODE) {
                callback(AsyncError(ret.resultCode), Option<Array<String>>.None)
            } else {
                if (ret.userSuffixIndex >= 0) {
                    this.suffixIndex = ret.userSuffixIndex
                }
                callback(None, ret.ability_params_stream)
            }
        }
    }

    @!APILevel[
        16,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService.FolderSelection"
    ]
    public func getSelectedIndex(): Int32 {
        let idx = suffixIndex
        suffixIndex = -1i32
        idx
    }
}

/**
 * AudioViewPicker Object
 *
 * @syscap SystemCapability.FileManagement.UserFileService
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.UserFileService"
]
public class AudioViewPicker {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public AudioViewPicker(let abilityContext: UIAbilityContext) {}

    /**
     * Pull up the audio picker based on the selection mode.
     *
     * @param { AsyncCallback<Array<String>> } callback - callback
     * @param { AudioSelectOptions } option - represents the options provided in select mode.
     * @syscap SystemCapability.FileManagement.UserFileService
     * @bref select(option: AudioSelectOptions, callback: AsyncCallback<Array<string>>): void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public func select(
        callback: AsyncCallback<Array<String>>,
        option!: AudioSelectOptions = AudioSelectOptions()
    ): Unit {
        let paramMap = HashMap<String, JsonValue>()
        paramMap.add("extType", JsonString(ExtTypes.AUDIO_PICKER_TYPE))
        paramMap.add("key_pick_num", JsonInt(option.maxSelectNumber))

        let want = Want(
            action: SELECT_ACTION,
            parameters: JsonObject(paramMap).toString()
        )

        modalPicker(abilityContext, want, None) {
            ret => if (ret.resultCode != SUCCESS_CODE) {
                callback(AsyncError(ret.resultCode), Option<Array<String>>.None)
            } else {
                callback(None, ret.uriArr)
            }
        }
    }

    /**
     * Pull up the audio picker based on the save mode.
     *
     * @param { AsyncCallback<Array<String>> } callback - callback
     * @param { PhotoSaveOptions } option - represents the options provided in save mode.
     * @syscap SystemCapability.FileManagement.UserFileService
     * @bref save(option: AudioSaveOptions, callback: AsyncCallback<Array<string>>): void;
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.UserFileService"
    ]
    public func save(callback: AsyncCallback<Array<String>>, option!: AudioSaveOptions = AudioSaveOptions()): Unit {
        let documentOption = DocumentSaveOptions(newFileNames: option.newFileNames)
        let documentPicker = DocumentViewPicker(abilityContext)
        documentPicker.save(callback, option: documentOption)
    }
}

func arrayToJsonArray(arr: Array<String>): JsonArray {
    let valueArr = Array<JsonValue>(
        arr.size,
        {
            i => JsonString(arr[i])
        }
    )
    return JsonArray(valueArr)
}
