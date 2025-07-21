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

/**
 * Defines the class of media album change request.
 *
 * @relation class MediaAlbumChangeRequest implements MediaChangeRequest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class MediaAlbumChangeRequest <: RemoteDataLite & MediaChangeRequest {
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
    /**
     * The constructor to create a MediaAlbumChangeRequest instance.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation constructor(album: Album);
     */
    public init(album: Album) {
        super(
            unsafe {
                var errCode = 0i32
                let id = FfiMediaAlbumChangeRequestImplConstructor(album.getID(), inout errCode)
                checkRet(errCode, "init")
                id
            })
    }

    /**
     * Obtains the album in the current album change request.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getAlbum(): Album;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getAlbum(): ?Album {
        var errCode = 0i32
        let id = unsafe { FfiMediaAlbumChangeRequestImplGetAlbum(getID(), inout errCode) }
        checkRet(errCode, "getAlbum")
        return if (id == 0) {
            None
        } else {
            Album(id)
        }
    }

    /**
     * Sets the album name.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation setAlbumName(name: string): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func setAlbumName(name: String): Unit {
        try (albumName = unsafe { LibC.mallocCString(name).asResource() }) {
            let errCode = unsafe { FfiMediaAlbumChangeRequestImplSetAlbumName(getID(), albumName.value) }
            checkRet(errCode, "setAlbumName")
        }
    }

    /**
     * Add assets to the album.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @relation addAssets(assets: Array<PhotoAsset>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func addAssets(assets: Array<PhotoAsset>): Unit {
        let idArr = Array<Int64>(assets.size, {i => assets[i].getID()})
        let idCArr = CArrI64(unsafe { cjArr2CArr(idArr) }, idArr.size)
        let errCode = unsafe { FfiMediaAlbumChangeRequestImplAddAssets(getID(), idCArr) }
        unsafe { LibC.free(idCArr.head) }
        checkRet(errCode, "addAssets")
    }

    /**
     * Removes assets from the album.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @throws { BusinessException } 14000016 - Operation Not Support
     * @relation removeAssets(assets: Array<PhotoAsset>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func removeAssets(assets: Array<PhotoAsset>): Unit {
        let idArr = Array<Int64>(assets.size, {i => assets[i].getID()})
        let idCArr = CArrI64(unsafe { cjArr2CArr(idArr) }, idArr.size)
        let errCode = unsafe { FfiMediaAlbumChangeRequestImplRemoveAssets(getID(), idCArr) }
        unsafe { LibC.free(idCArr.head) }
        checkRet(errCode, "removeAssets")
    }

    protected func applyChanges(): Unit {
        let errCode = unsafe { FfiMediaAlbumChangeRequestImplApplyChanges(getID()) }
        checkRet(errCode, "applyChanges")
    }
}