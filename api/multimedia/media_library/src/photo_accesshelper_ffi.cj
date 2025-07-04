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

package ohos.multimedia.photo_accesshelper

import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.image.*

foreign {
    // PhotoAccessHelper
    func FfiPhotoAccessHelperGetPhotoAccessHelper(id: Int64): Int64

    func FfiPhotoAccessHelperGetAssets(id: Int64, options: CFetchOptions, errCode: CPointer<Int32>): Int64

    func FfiPhotoAccessHelperGetBurstAssets(id: Int64, burstKey: CString, options: CFetchOptions,
        errCode: CPointer<Int32>): Int64

    func FfiPhotoAccessHelperGetAlbums(id: Int64, `type`: Int32, subtype: Int32, options: CFetchOptions,
        errCode: CPointer<Int32>): Int64

    func FfiPhotoAccessHelperRegisterChange(id: Int64, uri: CString, forChildUris: Bool, funcId: Int64,
        errCode: CPointer<Int32>): Unit

    func FfiPhotoAccessHelperUnRegisterChange(id: Int64, uri: CString, funcId: Int64, errCode: CPointer<Int32>): Unit

    func FfiPhotoAccessHelperRelease(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiPhotoAccessHelperShowAssetsCreationDialog(id: Int64, srcFileUris: CArrString,
        photoCreationConfigs: CPhotoCreationConfigs, funcId: Int64, cBundleInfo: FfiBundleInfo, errCode: CPointer<Int32>): Unit

    // PhotoAsset
    func FfiPhotoAssetGetFileDisplayName(id: Int64): CString

    func FfiPhotoAssetGetFileUri(id: Int64): CString

    func FfiPhotoAssetGetMediaType(id: Int64): Int32

    func FfiPhotoAssetUserFileMgrGet(id: Int64, member: CString, errCode: CPointer<Int32>): PhotoAssetMember

    func FfiPhotoAssetUserFileMgrSet(id: Int64, member: CString, data: CString, errCode: CPointer<Int32>): Unit

    func FfiPhotoAssetCommitModify(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiPhotoAssetGetThumbnail(id: Int64, cSize: CSize, errCode: CPointer<Int32>): Int64

    func FfiPhotoAccessHelperStartPhotoPicker(id: Int64, option: CPhotoSelectOptions, errCode: CPointer<Int32>): CPhotoSelectResult

    // FetchResult
    func FfiFetchResultGetCount(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiFetchResultIsAfterLast(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiFetchResultClose(id: Int64): Unit

    func FfiFetchResultGetFirstObject(id: Int64, errCode: CPointer<Int32>): FetchResultObject

    func FfiFetchResultGetNextObject(id: Int64, errCode: CPointer<Int32>): FetchResultObject

    func FfiFetchResultGetLastObject(id: Int64, errCode: CPointer<Int32>): FetchResultObject

    func FfiFetchResultGetObjectAtPosition(id: Int64, position: Int32, errCode: CPointer<Int32>): FetchResultObject

    func FfiFetchResultGetAllObjects(id: Int64, errCode: CPointer<Int32>): CArrayFetchResultObject

    // Album
    func FfiPhotoAlbumGetPhotoAlbumType(id: Int64): Int32

    func FfiPhotoAlbumGetPhotoAlbumSubType(id: Int64): Int32

    func FfiPhotoAlbumGetAlbumName(id: Int64): CString

    func FfiPhotoAlbumSetAlbumName(id: Int64, cAlbumName: CString): Unit

    func FfiPhotoAlbumGetAlbumUri(id: Int64): CString

    func FfiPhotoAlbumGetCount(id: Int64): Int32

    func FfiPhotoAlbumGetCoverUri(id: Int64): CString

    func FfiPhotoAlbumGetImageCount(id: Int64): Int32

    func FfiPhotoAlbumGetVideoCount(id: Int64): Int32

    func FfiPhotoAlbumGetAssets(id: Int64, options: CFetchOptions, errCode: CPointer<Int32>): Int64

    func FfiPhotoAlbumCommitModify(id: Int64, errCode: CPointer<Int32>): Unit

    // MediaAssetChangeRequest
    func FfiMediaAssetChangeRequestImplConstructor(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiMediaAssetChangeRequestImplCreateImageAssetRequest(id: Int64, fileUri: CString, errCode: CPointer<Int32>): Int64

    func FfiMediaAssetChangeRequestImplCreateVideoAssetRequest(id: Int64, fileUri: CString, errCode: CPointer<Int32>): Int64

    func FfiMediaAssetChangeRequestImplCreateAssetRequest(id: Int64, photoType: Int32, extension: CString,
        title: CString, subType: Int32): RetDataI64

    func FfiMediaAssetChangeRequestImplDeleteAssetsByObject(id: Int64, assets: CArrI64): Int32

    func FfiMediaAssetChangeRequestImplDeleteAssetsByString(id: Int64, assets: CArrString): Int32

    func FfiMediaAssetChangeRequestImplGetAsset(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiMediaAssetChangeRequestImplSetTitle(id: Int64, title: CString): Int32

    func FfiMediaAssetChangeRequestImplGetWriteCacheHandler(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiMediaAssetChangeRequestImplAddResourceByString(id: Int64, resourceType: Int32, fileUri: CString): Int32

    func FfiMediaAssetChangeRequestImplAddResourceByBuffer(id: Int64, resourceType: Int32, data: CArrUI8): Int32

    func FfiMediaAssetChangeRequestImplSaveCameraPhoto(id: Int64): Int32

    func FfiMediaAssetChangeRequestImplDiscardCameraPhoto(id: Int64): Int32

    func FfiMediaAssetChangeRequestImplSetOrientation(id: Int64, orientation: Int32): Int32

    func FfiMediaAssetChangeRequestImplApplyChanges(id: Int64): Int32

    // MediaAlbumChangeRequest
    func FfiMediaAlbumChangeRequestImplConstructor(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiMediaAlbumChangeRequestImplGetAlbum(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiMediaAlbumChangeRequestImplSetAlbumName(id: Int64, albumName: CString): Int32

    func FfiMediaAlbumChangeRequestImplAddAssets(id: Int64, assets: CArrI64): Int32

    func FfiMediaAlbumChangeRequestImplRemoveAssets(id: Int64, assets: CArrI64): Int32

    func FfiMediaAlbumChangeRequestImplApplyChanges(id: Int64): Int32

    // MediaAssetManager
    func FfiMediaAssetManagerRequestImage(contextId: Int64, photoAssetId: Int64, requestOptions: CRequestOptions,
        funcId: Int64, errCode: CPointer<Int32>): CString

    func FfiMediaAssetManagerRequestImageData(contextId: Int64, photoAssetId: Int64, requestOptions: CRequestOptions,
        funcId: Int64, errCode: CPointer<Int32>): CString

    func FfiMediaAssetManagerRequestMovingPhoto(contextId: Int64, photoAssetId: Int64, requestOptions: CRequestOptions,
        funcId: Int64, errCode: CPointer<Int32>): CString

    func FfiMediaAssetManagerRequestVideoFile(contextId: Int64, photoAssetId: Int64, requestOptions: CRequestOptions,
        fileUri: CString, funcId: Int64, errCode: CPointer<Int32>): CString

    func FfiMediaAssetManagerCancelRequest(contextId: Int64, cRequestId: CString, errCode: CPointer<Int32>): Unit

    func FfiMediaAssetManagerLoadMovingPhoto(contextId: Int64, cImageFileUri: CString, cVideoFileUri: CString,
        errCode: CPointer<Int32>): Int64

    // MovingPhoto
    func FfiMovingPhotoGetUri(id: Int64, errCode: CPointer<Int32>): CString

    func FfiMovingPhotoRequestContentUri(id: Int64, imageFileUri: CString, videoFileUri: CString,
        errCode: CPointer<Int32>): Unit

    func FfiMovingPhotoRequestContentResourceType(id: Int64, resourceType: Int32, fileUri: CString,
        errCode: CPointer<Int32>): Unit

    func FfiMovingPhotoRequestContentArrayBuffer(id: Int64, resourceType: Int32, errCode: CPointer<Int32>): CArrUI8
}

@C
struct PhotoAssetMember {
    PhotoAssetMember(
        let memberType: Int32,
        let intValue: Int64,
        let stringValue: CString,
        let boolValue: Bool
    ) {}

    func toMemberType(): MemberType {
        match (memberType) {
            case 0 => INT64(intValue)
            case 1 =>
                let str = stringValue.toString()
                STRING(str)
            case 2 => BOOL(boolValue)
            case _ => throw IllegalArgumentException("Invalid member type")
        }
    }

    func free() {
        unsafe { LibC.free(stringValue) }
    }
}

@C
struct FetchResultObject {
    FetchResultObject(
        let id: Int64,
        let fetchResType: Int32
    ) {}
}

@C
struct CArrayFetchResultObject {
    CArrayFetchResultObject(
        let head: CPointer<FetchResultObject>,
        let size: Int64
    ) {}

    func free() {
        unsafe { LibC.free(head) }
    }
}

@C
struct CFetchOptions {
    CFetchOptions(
        let fetchColumns: CArrString,
        let predicates: Int64
    ) {}

    func free() {
        fetchColumns.free()
    }
}

@C
struct CPhotoCreationConfig {
    CPhotoCreationConfig(
        let title: CString,
        let fileNameExtension: CString,
        let photoType: Int32,
        let photoSubType: Int32
    ) {}

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(fileNameExtension)
        }
    }
}

@C
struct CPhotoCreationConfigs {
    CPhotoCreationConfigs(
        var head: CPointer<CPhotoCreationConfig>,
        var size: Int64
    ) {}

    init(param: Array<PhotoCreationConfig>) {
        unsafe {
            var res: CPointer<CPhotoCreationConfig> = safeMalloc<CPhotoCreationConfig>(count: param.size)
            for (i in 0..param.size) {
                try {
                    let cPhotoCreationConfig = param[i].toCPhotoCreationConfig()
                    res.write(i, cPhotoCreationConfig)
                } catch (e: Exception) {
                    for (j in 0..i) {
                        res.read(j).free()
                    }
                    LibC.free(res)
                    throw e
                }
            }
            head = res
            size = param.size
        }
    }

    func free() {
        if (head.isNotNull()) {
            unsafe {
                for (i in 0..size) {
                    head.read(i).free()
                }
                LibC.free(head)
            }
        }
    }
}

@C
struct FfiBundleInfo {
    FfiBundleInfo(
        var bundleName: CString,
        var appName: CString,
        var appId: CString
    ) {}

    init(cjBundleName: String, cjAppName: String, cjAppId: String) {
        unsafe {
            bundleName = CString(CPointer())
            appName = CString(CPointer())
            appId = CString(CPointer())
            try {
                bundleName = LibC.mallocCString(cjBundleName)
                appName = LibC.mallocCString(cjAppName)
                appId = LibC.mallocCString(cjAppId)
            } catch (e: Exception) {
                LibC.free(bundleName)
                LibC.free(appName)
                LibC.free(appId)
                throw e
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(bundleName)
            LibC.free(appName)
            LibC.free(appId)
        }
    }
}

@C
struct CChangeData {
    // free at C
    CChangeData(
        let `type`: Int32,
        let uris: CArrString,
        let extraUris: CArrString
    ) {}

    func toChangeData(): ChangeData {
        unsafe {
            ChangeData(
                NotifyType.parse(`type`),
                uris.toStringArray(),
                extraUris.toStringArray()
            )
        }
    }
}

@C
struct CRequestOptions {
    CRequestOptions(let deliveryMode: Int32) {}
}

@C
struct KeyValue {
    KeyValue(let key: CString, var value: CString) {}
}

@C
struct HashMapArray {
    let keyValue: CPointer<KeyValue>
    let size: Int64
    HashMapArray(keyValue: CPointer<KeyValue>, size: Int64) {
        this.keyValue = keyValue
        this.size = size
    }

    func toHashMap(): HashMap<String, String> {
        if (size == 0) {
            return HashMap<String, String>()
        }
        let map = HashMap<String, String>(size)
        for (i in 0..size) {
            unsafe { map.add(keyValue.read(i).key.toString(), keyValue.read(i).value.toString()) }
        }
        return map
    }
}

@C
struct CPhotoSelectResult {
    CPhotoSelectResult(
        let photoUris: CArrString,
        let isOriginalPhoto: Bool
    ) {}

    func toPhotoSelectResult(): PhotoSelectResult {
        PhotoSelectResult(photoUris.toStringArray(), isOriginalPhoto)
    }

    func free(): Unit {
        photoUris.free()
    }
}

@C
struct CTextContextInfo {
    CTextContextInfo(var text: CString) {}

    func free(): Unit {
        unsafe { LibC.free(text) }
    }
}

@C
struct CRecommendationOptions {
    CRecommendationOptions(
        var recommendationType: Int32,
        var textContextInfo: CTextContextInfo
    ) {}

    func free(): Unit {
        unsafe { textContextInfo.free() }
    }
}

@C
struct CPhotoSelectOptions {
    var MIMEType: Int32
    var maxSelectNumber: Int32
    var isPhotoTakingSupported: Bool
    var isSearchSupported: Bool
    var recommendationOptions: CRecommendationOptions = CRecommendationOptions(-1,
        CTextContextInfo(CString(CPointer<UInt8>())))
    var preselectedUris: CArrString = CArrString(CPointer<CString>(), 0)
    var isPreviewForSingleSelectionSupported: Bool
    var isEditSupported: Bool
    var isOriginalSupported: Bool
    var subWindowName: CString = CString(CPointer<UInt8>())

    init(option: PhotoSelectOptions) {
        this.MIMEType = option.MIMEType.value
        this.maxSelectNumber = option.maxSelectNumber
        this.isPhotoTakingSupported = option.isPhotoTakingSupported
        this.isSearchSupported = option.isSearchSupported
        this.isPreviewForSingleSelectionSupported = option.isPreviewForSingleSelectionSupported
        this.isEditSupported = option.isEditSupported
        this.isOriginalSupported = option.isOriginalSupported
        if (let Some(v) <- option.recommendationOptions.recommendationType) {
            this.recommendationOptions.recommendationType = v.value
        }
        try {
            if (let Some(v) <- option.recommendationOptions.textContextInfo) {
                this.recommendationOptions.textContextInfo.text = unsafe { LibC.mallocCString(v.text) }
            }
            this.preselectedUris = unsafe { toArrayCString(option.preselectedUris) }
            if (let Some(v) <- option.subWindowName) {
                this.subWindowName = unsafe { LibC.mallocCString(v) }
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(recommendationOptions.textContextInfo.text)
                preselectedUris.free()
                LibC.free(subWindowName)
            }
        }
    }

    func free() {
        unsafe {
            preselectedUris.free()
            LibC.free(subWindowName)
            recommendationOptions.free()
        }
    }
}
