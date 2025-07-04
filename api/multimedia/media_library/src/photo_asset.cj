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
import ohos.multimedia.fetchdata.*
import ohos.image.*

/**
 * Defines the photo asset
 *
 * @interface PhotoAsset
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
public class PhotoAsset <: RemoteDataLite {
    /**
     * uri of the asset.
     *
     * @type { string }
     * @readonly
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
    public prop uri: String {
        get() {
            unsafe {
                let ret = FfiPhotoAssetGetFileUri(getID())
                let uri = ret.toString()
                LibC.free(ret)
                return uri
            }
        }
    }

    /**
     * Photo type, image or video
     *
     * @type { PhotoType }
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public prop photoType: PhotoType {
        get() {
            unsafe {
                let ret = FfiPhotoAssetGetMediaType(getID())
                PhotoType.parse(ret)
            }
        }
    }

    /**
     * Display name (with a file name extension) of the asset.
     *
     * @type { string }
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public prop displayName: String {
        get() {
            unsafe {
                let ret = FfiPhotoAssetGetFileDisplayName(getID())
                let displayName = ret.toString()
                LibC.free(ret)
                return displayName
            }
        }
    }

    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Returns the value of the specified member.
     *
     * @param { string } member - Photo asset member. for example : get(PhotoKeys.SIZE.toString())
     * @returns { MemberType } Returns the value of the specified photo asset member
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000014 - Member is not a valid PhotoKey
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func get(member: String): MemberType {
        var errCode = 0i32
        unsafe {
            try (cmember = LibC.mallocCString(member).asResource()) {
                let ret = FfiPhotoAssetUserFileMgrGet(getID(), cmember.value, inout errCode)
                checkRet(errCode, "get")
                let result = ret.toMemberType()
                ret.free()
                return result
            }
            throw Exception("Unreachable code.")
        }
    }

    /**
     * Set a new value to the specified member
     *
     * @param { string } member - Photo asset member
     * @param { string } data - The new value of the member.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000014 - Member is not a valid PhotoKey
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @example : set(PhotoKeys.TITLE.toString(), "newTitle"), call commitModify after set
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func set(member: String, data: String): Unit {
        var errCode = 0i32
        unsafe {
            try (
                cmember = LibC.mallocCString(member).asResource(),
                cdata = LibC.mallocCString(data).asResource()
            ) {
                FfiPhotoAssetUserFileMgrSet(getID(), cmember.value, cdata.value, inout errCode)
                checkRet(errCode, "set")
            }
        }
    }

    /**
     * Modify metadata of the asset
     *
     * @permission ohos.permission.WRITE_IMAGEVIDEO
     * @returns { void } Returns void
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 13900012 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000001 - Invalid display name
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.WRITE_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func commitModify(): Unit {
        var errCode = 0i32
        unsafe { FfiPhotoAssetCommitModify(getID(), inout errCode) }
        checkRet(errCode, "commitModify")
    }

    /**
     * Get thumbnail of the asset
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { PixelMap } Returns the thumbnail's pixelMap.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 13900012 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        permission: "ohos.WRITE_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getThumbnail(size!: ?Size = None): PixelMap {
        var errCode = 0i32
        let tSize = size ?? Size(height: -1, width: -1)
        unsafe {
            let ret = FfiPhotoAssetGetThumbnail(getID(), tSize.toExternal(), inout errCode)
            checkRet(errCode, "getThumbnail")
            return PixelMap(ret)
        }
    }
}

extend PhotoAsset <: FetchData<PhotoAsset> {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func create(id: Int64): PhotoAsset {
        PhotoAsset(id)
    }
}
