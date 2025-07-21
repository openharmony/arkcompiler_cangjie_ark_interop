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

package ohos.file.photo_access_helper

import ohos.labels.*
import ohos.ffi.*
import ohos.app.ability.ui_ability.*

/**
 * Defines the interface of media change request.
 *
 * @relation interface MediaChangeRequest {}
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public interface MediaChangeRequest {}

/**
 * Defines the class of media asset change request.
 *
 * @relation class MediaAssetChangeRequest implements MediaChangeRequest
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

    /**
     * Constructor used to initialize an asset change request.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation constructor(asset: PhotoAsset);
     */
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
     * Creates an image asset change request.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900002 - The file corresponding to the URI is not in the app sandbox.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation static createImageAssetRequest(context: Context, fileUri: string): MediaAssetChangeRequest;
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

    /**
     * Creates a video asset change request.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900002 - The file corresponding to the URI is not in the app sandbox.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation static createVideoAssetRequest(context: Context, fileUri: string): MediaAssetChangeRequest;
     */
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
     * Create an asset change request based on the file type and filename extension.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation static createAssetRequest(context: Context, photoType: PhotoType, extension: string, options?: CreateOptions): MediaAssetChangeRequest;
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
     * Deletes media assets. This API uses a promise to return the result. The deleted assets are moved to the trash.
     *
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation static deleteAssets(context: Context, assets: Array<PhotoAsset>): Promise<void>;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.WRITE_IMAGEVIDEO",
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
     * Deletes media assets. This API uses a promise to return the result. The deleted assets are moved to the trash.
     *
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000002 - The uri format is incorrect or does not exist.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation static deleteAssets(context: Context, uriList: Array<string>): Promise<void>;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.WRITE_IMAGEVIDEO",
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
     * Obtains the asset in this asset change request.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getAsset(): PhotoAsset;
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
     * Sets the media asset title.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation setTitle(title: string): void;
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
     * Obtains the handler used for writing a file to cache.
     *
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @relation getWriteCacheHandler(): Promise<number>;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.WRITE_IMAGEVIDEO",
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
     * Adds a resource using fileUri.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900002 - The file corresponding to the URI is not in the app sandbox.
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @relation addResource(type: ResourceType, fileUri: string): void;
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
     * Adds a resource using ArrayBuffer data.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @relation addResource(type: ResourceType, data: ArrayBuffer): void;
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
     * Saves the photo taken by the camera.
     *
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @relation saveCameraPhoto(): void;
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
     * Discards the photo taken by the camera.
     *
     * @throws { BusinessException } 14000011 - Internal system error
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @relation discardCameraPhoto(): void;
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