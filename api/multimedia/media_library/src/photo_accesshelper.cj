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
import ohos.bundle_manager.{BundleManager, BundleInfo, BundleFlag}
import ohos.hilog.*
import std.sync.*
import std.collection.*
import ohos.ability.*
import ohos.resource_manager.ResourceManager
import ohos.data_share_predicates.*

/**
 * Helper functions to access photos and albums.
 *
 * @interface PhotoAccessHelper
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoAccessHelper <: RemoteDataLite {
    private var callbackList = ArrayList<(CallbackObject, String, Int64)>()
    private let onOffMutex = Mutex()
    private let context: UIAbilityContext

    protected init(id: Int64, gcontext: UIAbilityContext) {
        super(id)
        context = gcontext
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Release PhotoAccessHelper instance
     *
     * @returns { Promise<void> } Returns void
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func release(): Unit {
        var errCode = 0i32
        unsafe {
            FfiPhotoAccessHelperRelease(getID(), inout errCode)
            checkRet(errCode, "release")
        }
        releaseFFIData(myDataId)
    }

    /**
     * Fetch photo assets
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { FetchOptions } options - Retrieval options.
     * @returns { Promise<FetchResult<PhotoAsset>> } Returns the fetch result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900012 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getAssets(options: FetchOptions): FetchResult<PhotoAsset> {
        var errCode = 0i32
        unsafe {
            let cOptions = options.toCFetchOptions()
            let ret = FfiPhotoAccessHelperGetAssets(getID(), cOptions, inout errCode)
            cOptions.free()
            checkRet(errCode, "getAssets")
            FetchResult<PhotoAsset>(ret)
        }
    }

    /**
     * Fetch a group of burst assets
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { string } burstKey - Burst asset uuid
     * @param { FetchOptions } options - Retrieval options.
     * @returns { Promise<FetchResult<PhotoAsset>> } Returns the fetch result.
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - Internal system error
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getBurstAssets(burstKey: String, options: FetchOptions): FetchResult<PhotoAsset> {
        unsafe {
            var errCode = 0i32
            try (cBurstKey = LibC.mallocCString(burstKey).asResource()) {
                let cOptions = options.toCFetchOptions()
                let ret = FfiPhotoAccessHelperGetBurstAssets(getID(), cBurstKey.value, cOptions, inout errCode)
                cOptions.free()
                checkRet(errCode, "getBurstAssets")
                return FetchResult<PhotoAsset>(ret)
            }
            throw Exception("Unreachable code.")
        }
    }

    /**
     * Fetch albums.
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { AlbumType } type - Album type.
     * @param { AlbumSubtype } subtype - Album subtype.
     * @param { FetchOptions } [options] - options to fetch albums
     * @returns { Promise<FetchResult<Album>> } - Returns the fetch result
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900012 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getAlbums(`type`: AlbumType, subtype: AlbumSubtype, options!: FetchOptions = FetchOptions([], DataSharePredicates())): FetchResult<Album> {
        if (options.fetchColumns.size == 0) {
            options.fetchColumns = ["uri", "album_name"]
        }
        var errCode = 0i32
        unsafe {
            let cOptions = options.toCFetchOptions()
            let ret = FfiPhotoAccessHelperGetAlbums(getID(), `type`.value, subtype.value, cOptions, inout errCode)
            cOptions.free()
            checkRet(errCode, "getAlbums")
            FetchResult<Album>(ret)
        }
    }

    /**
     * Register change notify for the specified uri.
     *
     * @param { string } uri - PhotoAsset's uri, album's uri or DefaultChangeUri
     * @param { boolean } forChildUris - Monitor the child uris.
     * @param { Callback<ChangeData> } callback - Returns the changed data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900012 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func registerChange(uri: String, forChildUris: Bool, callback: Callback1Argument<ChangeData>): Unit {
        synchronized(onOffMutex) {
            for (item in callbackList) {
                if (refEq(callback, item[0])) {
                    PHOTO_ACCESS_HELPER_LOG.info("registerChange failed: The same function has registered.")
                    return
                }
            }
            unsafe {
                try (cUri = LibC.mallocCString(uri).asResource()) {
                    let wrapper = {
                        value: CChangeData =>
                        let changeData = value.toChangeData()
                        callback.invoke(changeData)
                    }
                    let lambdaData = Callback1Param<CChangeData, Unit>(wrapper)
                    var errCode = 0i32
                    FfiPhotoAccessHelperRegisterChange(getID(), cUri.value, forChildUris, lambdaData.getID(),
                        inout errCode)
                    checkRet(errCode, "registerChange")
                    callbackList.add((callback, uri, lambdaData.getID()))
                }
            }
        }
    }

    /**
     * Unregister change notify for the specified uri.
     *
     * @param { string } uri - PhotoAsset's uri, album's uri or DefaultChangeUri
     * @param { Callback<ChangeData> } [callback] - The callback function to unregister.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900012 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func unRegisterChange(uri: String, callback!: ?Callback1Argument<ChangeData> = None): Unit {
        synchronized(onOffMutex) {
            let flag: Bool = match (callback) {
                case Some(v) => true
                case None => false
            }
            var errCode = 0i32
            unsafe {
                try (cUri = LibC.mallocCString(uri).asResource()) {
                    if (flag) {
                        for (idx in 0..callbackList.size) {
                            let item = callbackList[idx]
                            if (refEq(callback.getOrThrow(), item[0]) && item[1] == uri) {
                                FfiPhotoAccessHelperUnRegisterChange(getID(), cUri.value, item[2], inout errCode)
                                checkRet(errCode, "unRegisterChange")
                                callbackList.remove(at: idx)
                                return
                            }
                        }
                    } else {
                        FfiPhotoAccessHelperUnRegisterChange(getID(), cUri.value, -1, inout errCode)
                        checkRet(errCode, "unRegisterChange")
                        callbackList.removeIf({item => item[1] == uri})
                    }
                }
            }
        }
    }

    func getSelfBundleInfo(): FfiBundleInfo {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY.getValue() | // for appName
            BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE.getValue() | // for appName
                BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE
            .getValue() | // for appId
                BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION.getValue() // for appInfo
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let bundleName = bundleInfo.name
        let appId = bundleInfo.signatureInfo.appId
        let labelId = bundleInfo.appInfo.labelId
        let stgContext = getStageContext(context)
        let resourceMgrObject = ResourceManager.getResourceManager(stgContext)
        let appName = resourceMgrObject.getString(labelId)

        FfiBundleInfo(bundleName, appName, appId)
    }

    /**
     * Create a save dialog to save photos
     *
     * @param { Array<string> } srcFileUris - List of the file uris to be saved
     * @param { Array<PhotoCreationConfig> } photoCreationConfigs - List of the photo asset creation configs
     * @returns { Promise<Array<string>> } - Returns the media library file uri list to application which has been authorized
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - Internal system error
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func showAssetsCreationDialog(srcFileUris: Array<String>, photoCreationConfigs: Array<PhotoCreationConfig>,
        callback: Callback1Argument<Array<String>>): Unit {
        unsafe {
            let cSrcFileUris = toArrayCString(srcFileUris)
            try {
                let cPhotoCreationConfigs = CPhotoCreationConfigs(photoCreationConfigs)
                let wrapper = {
                    value: RetDataCArrString =>
                    let data = value.data.toStringArray()
                    callback.invoke(data)
                }
                let lambdaData = Callback1Param<RetDataCArrString, Unit>(wrapper)
                var errCode = 0i32
                let cBundleInfo = getSelfBundleInfo()
                FfiPhotoAccessHelperShowAssetsCreationDialog(getID(), cSrcFileUris, cPhotoCreationConfigs,
                    lambdaData.getID(), cBundleInfo, inout errCode)
                cPhotoCreationConfigs.free()
                cBundleInfo.free()
                checkRet(errCode, "showAssetsCreationDialog")
            } finally {
                cSrcFileUris.free()
            }
        }
    }

    /**
     * Apply the change request of asset or album.
     *
     * @permission ohos.permission.WRITE_IMAGEVIDEO
     * @param { MediaChangeRequest } mediaChangeRequest - The change request to be applied
     * @returns { Promise<void> } Returns void
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func applyChanges(mediaChangeRequest: MediaChangeRequest): Unit {
        match (mediaChangeRequest) {
            case v: MediaAlbumChangeRequest => v.applyChanges()
            case v: MediaAssetChangeRequest => v.applyChanges()
            case _ => throw NoneValueException("Unknown value")
        }
    }
}
