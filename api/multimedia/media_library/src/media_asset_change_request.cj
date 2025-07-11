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

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import ohos.ability.*
import ohos.ability.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public interface MediaChangeRequest {}

/**
 * Defines the class of media asset change request.
 *
 * @implements MediaChangeRequest
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class MediaAssetChangeRequest <: RemoteDataLite & MediaChangeRequest {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(asset: PhotoAsset) {
        super(
            unsafe {
                var errCode = 0i32
                let id = FfiMediaAssetChangeRequestImplConstructor(asset.getID(), inout errCode)
                checkRet(errCode, "init")
                id
            })
    }

    /**
     * Create image asset change request.
     *
     * @param { Context } context - Hap context information
     * @param { string } fileUri - File uri
     * @returns { MediaAssetChangeRequest } - Returns a MediaAssetChangeRequest instance
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900002 - No such file
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @atomicservice
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func createImageAssetRequest(context: UIAbilityContext, fileUri: String): MediaAssetChangeRequest {
        var id = -1
        unsafe {
            try (uri = LibC.mallocCString(fileUri).asResource()) {
                var errCode = 0i32
                id = FfiMediaAssetChangeRequestImplCreateImageAssetRequest(context.getID(), uri.value, inout errCode)
                checkRet(errCode, "createImageAssetRequest")
            }
        }
        return MediaAssetChangeRequest(id)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func createVideoAssetRequest(context: UIAbilityContext, fileUri: String): MediaAssetChangeRequest {
        var id = -1
        unsafe {
            try (uri = LibC.mallocCString(fileUri).asResource()) {
                var errCode = 0i32
                id = FfiMediaAssetChangeRequestImplCreateVideoAssetRequest(context.getID(), uri.value, inout errCode)
                checkRet(errCode, "createVideoAssetRequest")
            }
        }
        return MediaAssetChangeRequest(id)
    }

    /**
     * Create asset change request.
     *
     * @param { Context } context - Hap context information
     * @param { string } displayName - Asset name
     * @param { PhotoCreateOptions } [options] - Optional photo create option
     * @returns { MediaAssetChangeRequest } - Returns a MediaAssetChangeRequest instance
     * @throws { BusinessException } 202 - Called by non-system application
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000001 - Invalid display name
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @systemapi
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func createAssetRequest(context: UIAbilityContext, photoType: PhotoType, extension: String,
        options!: CreateOptions = CreateOptions()): MediaAssetChangeRequest {
        var id = -1
        unsafe {
            try (
                cextension = LibC.mallocCString(extension).asResource(),
                ctitle = LibC.mallocCString(options.title ?? "").asResource()
            ) {
                let subType: Int32 = if (let Some(v) <- options.subtype) {
                    v.value
                } else {
                    -1
                }
                let ret = FfiMediaAssetChangeRequestImplCreateAssetRequest(context.getID(), photoType.value,
                    cextension.value, ctitle.value, subType)
                checkRet(ret.code, "createAssetRequest")
                id = ret.data
            }
        }
        return MediaAssetChangeRequest(id)
    }

    /**
     * Delete assets.
     *
     * @permission ohos.permission.WRITE_IMAGEVIDEO
     * @param { Context } context - Hap context information
     * @param { Array<PhotoAsset> } assets - Assets to delete
     * @returns { Promise<void> } - Returns void
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        21,
        permission: "ohos.WRITE_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func deleteAssets(context: UIAbilityContext, assets: Array<PhotoAsset>): Unit {
        let idArr = Array<Int64>(assets.size, {i => assets[i].getID()})
        let idCArr = CArrI64(unsafe { cjArr2CArr(idArr) }, idArr.size)
        let errCode = unsafe { FfiMediaAssetChangeRequestImplDeleteAssetsByObject(context.getID(), idCArr) }
        unsafe { LibC.free(idCArr.head) }
        checkRet(errCode, "deleteAssets")
    }

    /**
     * Delete assets.
     *
     * @permission ohos.permission.WRITE_IMAGEVIDEO
     * @param { Context } context - Hap context information
     * @param { Array<string> } uriList - Uris of assets to delete
     * @returns { Promise<void> } - Returns void
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000002 - Invalid asset uri
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        21,
        permission: "ohos.WRITE_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func deleteAssets(context: UIAbilityContext, assets: Array<String>): Unit {
        let cArr = unsafe { toArrayCString(assets) }
        let errCode = unsafe { FfiMediaAssetChangeRequestImplDeleteAssetsByString(context.getID(), cArr) }
        unsafe { cArr.free() }
        checkRet(errCode, "deleteAssets")
    }

    /**
     * Get the asset.
     *
     * @returns { PhotoAsset } - Returns the asset
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @atomicservice
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getAsset(): ?PhotoAsset {
        var errCode = 0i32
        let id = unsafe { FfiMediaAssetChangeRequestImplGetAsset(getID(), inout errCode) }
        checkRet(errCode, "getAsset")
        return if (id == 0) {
            None
        } else {
            PhotoAsset(id)
        }
    }

    /**
     * Set title of the asset.
     *
     * @param { string } title - the new title of the asset
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @atomicservice
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func setTitle(title: String): Unit {
        try (ctitle = unsafe { LibC.mallocCString(title).asResource() }) {
            let errCode = unsafe { FfiMediaAssetChangeRequestImplSetTitle(getID(), ctitle.value) }
            checkRet(errCode, "setTitle")
        }
    }

    /**
     * Get write cache handler.
     *
     * @permission ohos.permission.WRITE_IMAGEVIDEO
     * @returns { Promise<number> } Returns the write cache handler
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        21,
        permission: "ohos.WRITE_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getWriteCacheHandler(): Int32 {
        var errCode = 0i32
        let fd = unsafe { FfiMediaAssetChangeRequestImplGetWriteCacheHandler(getID(), inout errCode) }
        checkRet(errCode, "getWriteCacheHandler")
        return fd
    }

    /**
     * Add resource of the asset using file uri.
     *
     * @param { ResourceType } type - Resource type
     * @param { string } fileUri - File uri
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900002 - No such file
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @atomicservice
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func addResource(resourceType: ResourceType, fileUri: String): Unit {
        try (uri = unsafe { LibC.mallocCString(fileUri).asResource() }) {
            let errCode = unsafe {
                FfiMediaAssetChangeRequestImplAddResourceByString(getID(), resourceType.value, uri.value)
            }
            checkRet(errCode, "addResource")
        }
    }

    /**
     * Add resource of the asset using ArrayBuffer.
     *
     * @param { ResourceType } type - Resource type
     * @param { ArrayBuffer } data - Data buffer to add
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @atomicservice
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func addResource(resourceType: ResourceType, data: Array<Byte>): Unit {
        let arr = CArrUI8(unsafe { cjArr2CArr(data) }, data.size)
        let errCode = unsafe { FfiMediaAssetChangeRequestImplAddResourceByBuffer(getID(), resourceType.value, arr) }
        arr.free()
        checkRet(errCode, "addResource")
    }

    /**
     * Save the photo asset captured by camera.
     *
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func saveCameraPhoto(): Unit {
        let errCode = unsafe { FfiMediaAssetChangeRequestImplSaveCameraPhoto(getID()) }
        checkRet(errCode, "saveCameraPhoto")
    }

    /**
     * Discard the photo asset captured by camera.
     *
     * @throws { BusinessException } 14000011 - Internal system error
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func discardCameraPhoto(): Unit {
        let errCode = unsafe { FfiMediaAssetChangeRequestImplDiscardCameraPhoto(getID()) }
        checkRet(errCode, "discardCameraPhoto")
    }

    protected func applyChanges(): Unit {
        let errCode = unsafe { FfiMediaAssetChangeRequestImplApplyChanges(getID()) }
        checkRet(errCode, "applyChanges")
    }
}