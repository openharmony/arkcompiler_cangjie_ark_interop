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

/**
 * Defines the album.
 *
 * @interface Album
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class Album <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Album type
     *
     * @type { AlbumType }
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public prop albumType: AlbumType {
        get() {
            unsafe {
                let ret = FfiPhotoAlbumGetPhotoAlbumType(getID())
                AlbumType.parse(ret)
            }
        }
    }

    /**
     * Album subtype
     *
     * @type { AlbumSubtype }
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public prop albumSubtype: AlbumSubtype {
        get() {
            unsafe {
                let ret = FfiPhotoAlbumGetPhotoAlbumSubType(getID())
                AlbumSubtype.parse(ret)
            }
        }
    }

    /**
     * Album name.
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
    public mut prop albumName: String {
        get() {
            unsafe {
                let ret = FfiPhotoAlbumGetAlbumName(getID())
                let result = ret.toString()
                LibC.free(ret)
                result
            }
        }
        set(value) {
            unsafe {
                try (cValue = LibC.mallocCString(value).asResource()) {
                    FfiPhotoAlbumSetAlbumName(getID(), cValue.value)
                }
            }
        }
    }

    /**
     * Album uri.
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
    public prop albumUri: String {
        get() {
            unsafe {
                let ret = FfiPhotoAlbumGetAlbumUri(getID())
                let result = ret.toString()
                LibC.free(ret)
                result
            }
        }
    }

    /**
     * Cover uri for the album
     *
     * @type { string }
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public prop coverUri: String {
        get() {
            unsafe {
                let ret = FfiPhotoAlbumGetCoverUri(getID())
                let result = ret.toString()
                LibC.free(ret)
                result
            }
        }
    }

    /**
     * Number of assets in the album
     *
     * @type { number }
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public prop count: Int32 {
        get() {
            unsafe { FfiPhotoAlbumGetCount(getID()) }
        }
    }

    /**
     * Number of image assets in the album
     *
     * @type { ?number }
     * @readonly
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     * @since 12
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public prop imageCount: Int32 {
        get() {
            unsafe { FfiPhotoAlbumGetImageCount(getID()) }
        }
    }

    /**
     * Number of video assets in the album
     *
     * @type { ?number }
     * @readonly
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public prop videoCount: Int32 {
        get() {
            unsafe { FfiPhotoAlbumGetVideoCount(getID()) }
        }
    }

    /**
     * Fetch assets in an album.
     *
     * @permission ohos.permission.READ_IMAGEVIDEO
     * @param { FetchOptions } options - Fetch options.
     * @returns { Promise<FetchResult<PhotoAsset>> } Returns the fetch result
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
            let id = FfiPhotoAlbumGetAssets(getID(), cOptions, inout errCode)
            cOptions.free()
            checkRet(errCode, "getAssets")
            FetchResult<PhotoAsset>(id)
        }
    }

    /**
     * Modify metadata for the album
     *
     * @permission ohos.permission.WRITE_IMAGEVIDEO
     * @returns { Promise<void> } Returns void
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 13900012 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func commitModify(): Unit {
        var errCode = 0i32
        unsafe {
            FfiPhotoAlbumCommitModify(getID(), inout errCode)
            checkRet(errCode, "commitModify")
        }
    }
}

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
extend Album <: FetchData<Album> {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func create(id: Int64): Album {
        Album(id)
    }
}
