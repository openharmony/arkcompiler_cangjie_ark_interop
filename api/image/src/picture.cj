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

package ohos.image

import ohos.labels.*
import ohos.ffi.*

foreign {
    func FfiImagePictureImplCreatePicture(id: Int64, errCode: CPointer<UInt32>): Int64

    func FfiImagePictureImplSetMetadata(id: Int64, metadataType: Int32, metadataId: Int64): UInt32

    func FfiImagePictureImplGetMetadata(id: Int64, metadataType: Int32, errCode: CPointer<UInt32>): Int64
}

/**
 * Create a Picture object by the pixel map of the main image.
 *
 * @relation createPicture(mainPixelmap: PixelMap): Picture;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createPicture(mainPixelmap: PixelMap): Picture {
    var errCode: UInt32 = 0
    let id = unsafe { FfiImagePictureImplCreatePicture(mainPixelmap.getID(), inout errCode) }
    checkRetFor20(errCode)
    return Picture(id)
}

/**
 * Picture instance.
 *
 * @relation interface Metadata
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Picture <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Set the metadata of main picture.
     *
     * @param { MetadataType } metadataType The type of metadata.
     * @param { Metadata } metadata The metadata of main picture.
     * @throws { BusinessException } 62980115 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified.
     * 2.Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 7600202 - Unsupported metadata. Possible causes: Unsupported metadata type.
     * @relation setMetadata(metadataType: MetadataType, metadata: Metadata): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func setMetadata(metadataType: MetadataType, metadata: Metadata): Unit {
        let errCode = unsafe { FfiImagePictureImplSetMetadata(getID(), metadataType.value, metadata.getID()) }
        checkRetFor20(errCode)
    }

    /**
     * Obtains the metadata of main picture.
     *
     * @param { MetadataType } metadataType The type of metadata.
     * @returns { Metadata } Return the metadata of main picture.
     * @throws { BusinessException } 62980115 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified.
     * 2.Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 7600202 - Unsupported metadata. Possible causes: Unsupported metadata type.
     * @relation getMetadata(metadataType: MetadataType): Promise<Metadata>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getMetadata(metadataType: MetadataType): Metadata {
        var errCode: UInt32 = 0
        let id = unsafe { FfiImagePictureImplGetMetadata(getID(), metadataType.value, inout errCode) }
        checkRetFor20(errCode)
        return Metadata(id)
    }
}
