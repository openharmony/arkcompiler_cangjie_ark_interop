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

/**
 * Defines the moving photo.
 *
 * @interface MovingPhoto
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class MovingPhoto <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Get uri of the moving photo.
     *
     * @returns { string } Returns uri of the moving photo
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
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
    public func getUri(): String {
        var errCode = 0i32
        let ret = unsafe { FfiMovingPhotoGetUri(getID(), inout errCode) }
        checkRet(errCode, "getUri")
        let returnString = ret.toString()
        unsafe { LibC.free(ret) }
        return returnString
    }

    /**
     * Request the image and video content of the moving photo and write to destination uri.
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { string } imageFileUri - Destination uri of the image content to be written
     * @param { string } videoFileUri - Destination uri of the video content to be written
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
        permission: "ohos.READ_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func requestContent(imageFileUri: String, videoFileUri: String): Unit {
        try (
            imageUri = unsafe { LibC.mallocCString(imageFileUri).asResource() },
            videoUri = unsafe {LibC.mallocCString(videoFileUri).asResource()}
        ) {
            var errCode = 0i32
            unsafe { FfiMovingPhotoRequestContentUri(getID(), imageUri.value, videoUri.value, inout errCode) }
            checkRet(errCode, "requestContent")
        }
    }

    /**
     * Request content of the moving photo for the given resource type and write to destination uri.
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { ResourceType } resourceType - The resource type of the content to request
     * @param { string } fileUri - Destination uri of the content to be written
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
        permission: "ohos.READ_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func requestContent(resourceType: ResourceType, fileUri: String): Unit {
        try (uri = unsafe { LibC.mallocCString(fileUri).asResource() }) {
            var errCode = 0i32
            unsafe { FfiMovingPhotoRequestContentResourceType(getID(), resourceType.value, uri.value, inout errCode) }
            checkRet(errCode, "requestContent")
        }
    }

    /**
     * Request content of the moving photo for the given resource type and return the array buffer.
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { ResourceType } resourceType - The resource type of the content to request
     * @returns { Promise<ArrayBuffer> } Returns array buffer of the content
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
        permission: "ohos.READ_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func requestContent(resourceType: ResourceType): Array<Byte> {
        var errCode = 0i32
        let arr = unsafe { FfiMovingPhotoRequestContentArrayBuffer(getID(), resourceType.value, inout errCode) }
        checkRet(errCode, "requestContent")
        let returnArr = unsafe { cArr2cjArr<Byte, Byte>(arr.size, arr.head, {i => UInt8(i)}) }
        unsafe { LibC.free(arr.head) }
        return returnArr
    }
}
