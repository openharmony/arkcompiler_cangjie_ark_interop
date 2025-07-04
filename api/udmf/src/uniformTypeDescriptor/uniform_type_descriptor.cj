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

package ohos.uniformTypeDescriptor

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

foreign {
    func FfiUDMFUniformTypeDescriptorGetTypeDescriptor(ctypeId: CString): Int64

    func FfiUDMFUniformTypeDescriptorGetUniformDataTypeByFilenameExtension(
        cFilenameExtension: CString,
        cBelongsTo: CString
    ): CString

    func FfiUDMFUniformTypeDescriptorGetUniformDataTypeByMIMEType(cMimeType: CString, cBelongsTo: CString): CString
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public func getTypeDescriptor(typeId: String): TypeDescriptor {
    unsafe {
        let cTypeId = LibC.mallocCString(typeId)
        let typeDescriptorID = FfiUDMFUniformTypeDescriptorGetTypeDescriptor(cTypeId)
        LibC.free(cTypeId)
        if (typeDescriptorID < 0) {
            throw BusinessException(ERR_PARAMETER_ERROR, "Parameter error.")
        }
        return TypeDescriptor(typeDescriptorID)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public func getUniformDataTypeByFilenameExtension(filenameExtension: String, belongsTo!: String = ""): String {
    unsafe {
        let cfilenameExtension = LibC.mallocCString(filenameExtension)
        let cbelongsTo = LibC.mallocCString(belongsTo)
        let cUniformDataTypeId = FfiUDMFUniformTypeDescriptorGetUniformDataTypeByFilenameExtension(cfilenameExtension,
            cbelongsTo)

        LibC.free(cfilenameExtension)
        LibC.free(cbelongsTo)

        let uniformDataTypeId = cUniformDataTypeId.toString()
        LibC.free(cUniformDataTypeId)

        return uniformDataTypeId
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public func getUniformDataTypeByMIMEType(mimeType: String, belongsTo!: String = ""): String {
    unsafe {
        let cmimeType = LibC.mallocCString(mimeType)
        let cbelongsTo = LibC.mallocCString(belongsTo)
        let cUniformDataTypeId = FfiUDMFUniformTypeDescriptorGetUniformDataTypeByMIMEType(cmimeType, cbelongsTo)
        let uniformDataTypeId = cUniformDataTypeId.toString()

        LibC.free(cmimeType)
        LibC.free(cbelongsTo)
        LibC.free(cUniformDataTypeId)

        return uniformDataTypeId
    }
}
