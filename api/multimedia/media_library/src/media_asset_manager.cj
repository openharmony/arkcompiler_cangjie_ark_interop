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
import std.collection.*
import ohos.ability.*
import ohos.image.*

/**
 * Media asset manager
 *
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class MediaAssetManager {
    /**
     * Request image
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { Context } context - Hap context information
     * @param { PhotoAsset } asset - the photo asset requested
     * @param { RequestOptions } requestOptions - the request options
     * @param { MediaAssetDataHandler<image.ImageSource> } dataHandler - data handler used to obtain media asset data when ImageSource is prepared
     * @returns { Promise<string> } Returns request id
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        permission: "ohos.READ_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func requestImage(context: UIAbilityContext, asset: PhotoAsset, requestOptions: RequestOptions,
        dataHandler: MediaAssetDataHandler<ImageSource>): String {
        let wrapper = {
            data: Int64, map: HashMapArray =>
            let imageSource = ImageSource(data)
            let hashMap = map.toHashMap()
            dataHandler.onDataPrepared(imageSource, hashMap)
        }
        let registerCall = Callback2Param<Int64, HashMapArray, Unit>(wrapper)
        var errCode = 0i32
        let ret = unsafe {
            FfiMediaAssetManagerRequestImage(context.getID(), asset.getID(), requestOptions.toCRequestOptions(),
                registerCall.getID(), inout errCode)
        }
        checkRet(errCode, "requestImage")
        let returnString = ret.toString()
        unsafe { LibC.free(ret) }
        return returnString
    }

    /**
     * Request image data
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { Context } context - Hap context information
     * @param { PhotoAsset } asset - the photo asset requested
     * @param { RequestOptions } requestOptions - the request options
     * @param { MediaAssetDataHandler<ArrayBuffer> } dataHandler - data handler used obtain media asset data when data is prepared
     * @returns { Promise<string> } Returns request id
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        permission: "ohos.READ_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func requestImageData(context: UIAbilityContext, asset: PhotoAsset, requestOptions: RequestOptions,
        dataHandler: MediaAssetDataHandler<Array<Byte>>): String {
        let wrapper = {
            data: CArrUI8, map: HashMapArray =>
            let buffer = unsafe { cArr2cjArr<Byte, Byte>(data.size, data.head, {i => UInt8(i)}) }
            let hashMap = map.toHashMap()
            dataHandler.onDataPrepared(buffer, hashMap)
        }
        let registerCall = Callback2Param<CArrUI8, HashMapArray, Unit>(wrapper)
        var errCode = 0i32
        let ret = unsafe {
            FfiMediaAssetManagerRequestImageData(context.getID(), asset.getID(), requestOptions.toCRequestOptions(),
                registerCall.getID(), inout errCode)
        }
        checkRet(errCode, "requestImageData")
        let returnString = ret.toString()
        unsafe { LibC.free(ret) }
        return returnString
    }

    /**
     * Request moving photo
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { Context } context - Hap context information
     * @param { PhotoAsset } asset - the photo asset requested
     * @param { RequestOptions } requestOptions - the request options
     * @param { MediaAssetDataHandler<MovingPhoto> } dataHandler - data handler used to obtain moving photo when data is prepared
     * @returns { Promise<string> } Returns request id
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        permission: "ohos.READ_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func requestMovingPhoto(context: UIAbilityContext, asset: PhotoAsset, requestOptions: RequestOptions,
        dataHandler: MediaAssetDataHandler<MovingPhoto>): String {
        let wrapper = {
            data: Int64, map: HashMapArray =>
            let movingPhoto = MovingPhoto(data)
            let hashMap = map.toHashMap()
            dataHandler.onDataPrepared(movingPhoto, hashMap)
        }
        let registerCall = Callback2Param<Int64, HashMapArray, Unit>(wrapper)
        var errCode = 0i32
        let ret = unsafe {
            FfiMediaAssetManagerRequestMovingPhoto(context.getID(), asset.getID(), requestOptions.toCRequestOptions(),
                registerCall.getID(), inout errCode)
        }
        checkRet(errCode, "requestMovingPhoto")
        let returnString = ret.toString()
        unsafe { LibC.free(ret) }
        return returnString
    }

    /**
     * Request video file
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { Context } context - Hap context information
     * @param { PhotoAsset } asset - the photo asset requested
     * @param { RequestOptions } requestOptions - the request options
     * @param { string } fileUri - the destination file uri to save the video data
     * @param { MediaAssetDataHandler<boolean> } dataHandler - data handler used to notify the client that data has been written to the application sandbox
     * @returns { Promise<string> } Returns request id
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        permission: "ohos.READ_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func requestVideoFile(context: UIAbilityContext, asset: PhotoAsset, requestOptions: RequestOptions,
        fileUri: String, dataHandler: MediaAssetDataHandler<Bool>): String {
        let wrapper = {
            data: Bool, map: HashMapArray =>
            let hashMap = map.toHashMap()
            dataHandler.onDataPrepared(data, hashMap)
        }
        let registerCall = Callback2Param<Bool, HashMapArray, Unit>(wrapper)
        var errCode = 0i32
        let cUri = unsafe { LibC.mallocCString(fileUri) }
        let ret = unsafe {
            FfiMediaAssetManagerRequestVideoFile(context.getID(), asset.getID(), requestOptions.toCRequestOptions(),
                cUri, registerCall.getID(), inout errCode)
        }
        unsafe { LibC.free(cUri) }
        checkRet(errCode, "requestVideoFile")
        let returnString = ret.toString()
        unsafe { LibC.free(ret) }
        return returnString
    }

    /**
     * Cancel request
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { Context } context - Hap context information
     * @param { string } requestId - the request id to be canceled
     * @returns { Promise<void> } Returns void
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        permission: "ohos.READ_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func cancelRequest(context: UIAbilityContext, requestId: String): Unit {
        try (cRequestId = unsafe { LibC.mallocCString(requestId).asResource() }) {
            var errCode = 0i32
            unsafe { FfiMediaAssetManagerCancelRequest(context.getID(), cRequestId.value, inout errCode) }
            checkRet(errCode, "cancelRequest")
        }
    }

    /**
     * Load moving photo
     *
     * @param { UIAbilityContext } context - Hap context information
     * @param { String } imageFileUri - image file uri of the moving photo to be loaded
     * @param { String } videoFileUri - video file uri of the moving photo to be loaded
     * @returns { MovingPhoto } Returns moving photo
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - Internal system error
     * @static
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func loadMovingPhoto(context: UIAbilityContext, imageFileUri: String, videoFileUri: String): MovingPhoto {
        var id = -1
        unsafe {
            try (
                imageUri = LibC.mallocCString(imageFileUri).asResource(),
                videoUri = LibC.mallocCString(videoFileUri).asResource()
            ) {
                var errCode = 0i32
                id = FfiMediaAssetManagerLoadMovingPhoto(context.getID(), imageUri.value, videoUri.value, inout errCode)
                checkRet(errCode, "loadMovingPhoto")
            }
        }
        return MovingPhoto(id)
    }
}
