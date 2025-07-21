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
import ohos.multimedia.fetchdata.*
import ohos.multimedia.image.*

/**
 * Provides APIs for encapsulating file asset attributes.
 *
 * @relation interface PhotoAsset
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoAsset <: RemoteDataLite {
    /**
     * uri of the asset.
     *
     * @relation readonly uri: string;
     */
    @!APILevel[
        21,
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
     * @relation readonly photoType: PhotoType;
     */
    @!APILevel[
        21,
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
     * @relation readonly displayName: string;
     */
    @!APILevel[
        21,
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
     * Obtains a PhotoAsset member parameter.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000014 - The provided member must be a property name of PhotoKey.
     * @relation get(member: string): MemberType;
     */
    @!APILevel[
        21,
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
     * Sets a PhotoAsset member parameter.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000014 - The provided member must be a property name of PhotoKey.
     * @relation set(member: string, value: string): void;
     */
    @!APILevel[
        21,
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
     * Commits the modification on the file metadata to the database.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 201 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000001 - Invalid display name
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation commitModify(): Promise<void>;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.WRITE_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func commitModify(): Unit {
        var errCode = 0i32
        unsafe { FfiPhotoAssetCommitModify(getID(), inout errCode) }
        checkRet(errCode, "commitModify")
    }

    /**
     * Obtains the file thumbnail of the given size.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900012 - Permission denied
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getThumbnail(size?: image.Size): Promise<image.PixelMap>;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.WRITE_IMAGEVIDEO",
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getThumbnail(size!: ?Size = None): PixelMap {
        var errCode = 0i32
        let tSize = size ?? Size(0, 0)
        unsafe {
            let ret = FfiPhotoAssetGetThumbnail(getID(), tSize.toExternal(), inout errCode)
            checkRet(errCode, "getThumbnail")
            return PixelMap(ret)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
extend PhotoAsset <: FetchData<PhotoAsset> {
    /**
     * Create album instance
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public static func create(id: Int64): PhotoAsset {
        PhotoAsset(id)
    }
}
