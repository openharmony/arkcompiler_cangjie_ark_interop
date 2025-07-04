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

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

foreign {
    func FfiUDMFUniformTypeDescriptorGetTypeId(typeDescriptorID: Int64): CString

    func FfiUDMFUniformTypeDescriptorGetBelongingToTypes(typeDescriptorID: Int64): CArrString

    func FfiUDMFUniformTypeDescriptorGetDescription(typeDescriptorID: Int64): CString

    func FfiUDMFUniformTypeDescriptorGetReferenceURL(typeDescriptorID: Int64): CString

    func FfiUDMFUniformTypeDescriptorGetIconFile(typeDescriptorID: Int64): CString

    func FfiUDMFUniformTypeDescriptorGetFilenameExtensions(typeDescriptorID: Int64): CArrString

    func FfiUDMFUniformTypeDescriptorGetMimeTypes(typeDescriptorID: Int64): CArrString

    func FfiUDMFUniformTypeDescriptorBelongsTo(typeDescriptorID: Int64, ctype: CString): Bool

    func FfiUDMFUniformTypeDescriptorIsLowerLevelType(typeDescriptorID: Int64, ctype: CString): Bool

    func FfiUDMFUniformTypeDescriptorIsHigherLevelType(typeDescriptorID: Int64, ctype: CString): Bool

    func FfiUDMFUniformTypeDescriptorEquals(thisTypeDescriptorID: Int64, thatTypeDescriptorID: Int64): Bool
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public class TypeDescriptor <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public prop typeId: String {
        get() {
            unsafe {
                let retData = FfiUDMFUniformTypeDescriptorGetTypeId(getID())
                let retType = retData.toString()
                LibC.free(retData)
                return retType
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public prop belongingToTypes: Array<String> {
        get() {
            var cArr: CArrString
            unsafe {
                cArr = FfiUDMFUniformTypeDescriptorGetBelongingToTypes(getID())
            }
            var result = Array<String>()
            if (cArr.size == 0) {
                return result
            }
            if (cArr.head.isNotNull()) {
                let ptr = cArr.head
                let size = cArr.size
                result = unsafe { Array<String>(size, {i => ptr.read(i).toString()}) }
                cArr.free()
            }
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public prop description: String {
        get() {
            unsafe {
                let retData = FfiUDMFUniformTypeDescriptorGetDescription(getID())
                let retDescription = retData.toString()
                LibC.free(retData)
                return retDescription
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public prop referenceURL: String {
        get() {
            unsafe {
                let retData = FfiUDMFUniformTypeDescriptorGetReferenceURL(getID())
                let retReferenceURL = retData.toString()
                LibC.free(retData)
                return retReferenceURL
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public prop iconFile: String {
        get() {
            unsafe {
                let retData = FfiUDMFUniformTypeDescriptorGetIconFile(getID())
                let retIconFile = retData.toString()
                LibC.free(retData)
                return retIconFile
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public prop filenameExtensions: Array<String> {
        get() {
            var cArr: CArrString
            unsafe {
                cArr = FfiUDMFUniformTypeDescriptorGetFilenameExtensions(getID())
            }
            var result = Array<String>()
            if (cArr.size == 0) {
                return result
            }
            if (cArr.head.isNotNull()) {
                let ptr = cArr.head
                let size = cArr.size
                result = unsafe { Array<String>(size, {i => ptr.read(i).toString()}) }
                cArr.free()
            }
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public prop mimeTypes: Array<String> {
        get() {
            var cArr: CArrString
            unsafe {
                cArr = FfiUDMFUniformTypeDescriptorGetMimeTypes(getID())
            }
            var result = Array<String>()
            if (cArr.size == 0) {
                return result
            }
            if (cArr.head.isNotNull()) {
                let ptr = cArr.head
                let size = cArr.size
                result = unsafe { Array<String>(size, {i => ptr.read(i).toString()}) }
                cArr.free()
            }
            return result
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func belongsTo(utype: String): Bool {
        unsafe {
            let ctype = LibC.mallocCString(utype)
            let res = FfiUDMFUniformTypeDescriptorBelongsTo(getID(), ctype)
            LibC.free(ctype)
            return res
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func isLowerLevelType(utype: String): Bool {
        unsafe {
            let ctype = LibC.mallocCString(utype)
            let res = FfiUDMFUniformTypeDescriptorIsLowerLevelType(getID(), ctype)
            LibC.free(ctype)
            return res
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func isHigherLevelType(utype: String): Bool {
        unsafe {
            let ctype = LibC.mallocCString(utype)
            let res = FfiUDMFUniformTypeDescriptorIsHigherLevelType(getID(), ctype)
            LibC.free(ctype)
            return res
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func equals(typeDescriptor: TypeDescriptor): Bool {
        unsafe {
            return FfiUDMFUniformTypeDescriptorEquals(getID(), typeDescriptor.getID())
        }
    }
}
