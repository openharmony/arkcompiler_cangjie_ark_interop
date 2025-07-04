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
    func FfiImageMetadataImplGetAllProperties(id: Int64, errCode: CPointer<UInt32>): CjProperties

    func FfiImageMetadataImplReleaseProperties(properties: CPointer<CjProperties>): Unit
}

/**
 * Metadata instance.
 *
 * @relation interface Metadata
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Metadata <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Obtains the value of all properties in an image. This method uses a promise to return the property values
     * in array of records.
     *
     * @returns { Array<String, String> } Array of Records instance used to return the property values.
     * @relation getAllProperties(): Promise<Record<string, string | null>>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getAllProperties(): Array<(String, String)> {
        var errCode: UInt32 = 0
        var properties = unsafe { FfiImageMetadataImplGetAllProperties(getID(), inout errCode) }
        checkRetFor20(errCode)
        let res = properties.toArray()
        unsafe { FfiImageMetadataImplReleaseProperties(inout properties) }
        return res
    }
}
