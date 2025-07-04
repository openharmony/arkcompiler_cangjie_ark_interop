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

package ohos.pasteboard

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import ohos.image.*

foreign {
    func FfiOHOSCreateStringPasteData(mimeType: CString, value: CString): RetDataI64

    func FfiOHOSCreatePixelMapPasteData(mimeType: CString, pixelMapId: Int64): RetDataI64

    func FfiOHOSCreateArrayBufPasteData(mimeType: CString, buffPtr: CPointer<UInt8>, bufferSize: Int64): RetDataI64

    func FfiOHOSPasteDataGetPrimaryText(id: Int64): RetDataCString

    func FfiOHOSPasteDataGetPrimaryHtml(id: Int64): RetDataCString

    func FfiOHOSPasteDataGetPrimaryUri(id: Int64): RetDataCString

    func FfiOHOSPasteDataGetPrimaryPixelMap(id: Int64): RetDataI64

    func FfiOHOSPasteDataGetPrimaryMimeType(id: Int64): RetDataCString

    func FfiOHOSPasteDataGetProperty(id: Int64, retPtr: CPointer<CPasteDataProperty>): Int32

    func FfiOHOSPasteDataSetProperty(id: Int64, mimeTypes: CArrString, tag: CString, timestamp: Int64, localOnly: Bool,
        shareOption: Int32): Int32

    func FfiOHOSPasteDataGetTag(id: Int64): RetDataCString

    func FfiOHOSPasteDataHasType(id: Int64, mimeType: CString): RetDataBool

    func FfiOHOSPasteDataAddRecord(id: Int64, recordId: Int64): Int32

    func FfiOHOSPasteDataAddMimeTypeRecord(id: Int64, mimeType: CString, value: CString): Int32

    func FfiOHOSPasteDataAddPixelMapRecord(id: Int64, mimeType: CString, pixelMapId: Int64): Int32

    func FfiOHOSPasteDataAddArrayRecord(id: Int64, mimeType: CString, buffPtr: CPointer<UInt8>, bufferSize: Int64): Int32

    func FfiOHOSPasteDataGetMimeTypes(id: Int64): RetDataCArrString

    func FfiOHOSPasteDataGetRecord(id: Int64, index: Int32, retPtr: CPointer<CPasteDataRecord>): RetDataI64

    func FfiOHOSPasteDataGetRecordCount(id: Int64): RetDataUI

    func FfiOHOSPasteDataRemoveRecord(id: Int64, index: Int32): Int32

    func FfiOHOSPasteDataReplaceRecord(id: Int64, recordId: Int64, index: Int32): Int32
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public func createData(mimeType: String, value: String): PasteData {
    if ((mimeType != MIMETYPE_TEXT_HTML) && (mimeType != MIMETYPE_TEXT_PLAIN) && (mimeType != MIMETYPE_TEXT_URI)) {
        throw BusinessException(ERR_PARAMETER_ERROR, "[Pasteboard] createData: mimeType value error!")
    }
    unsafe {
        var id = 0
        try (
            cMimeType = LibC.mallocCString(mimeType).asResource(),
            valueCstr = LibC.mallocCString(value).asResource()
        ) {
            let ret = FfiOHOSCreateStringPasteData(cMimeType.value, valueCstr.value)
            checkRet(ret.code, "[Pasteboard] createData: ")
            id = ret.data
        }
        return PasteData(id)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public func createData(mimeType: String, value: PixelMap): PasteData {
    if (mimeType != MIMETYPE_PIXELMAP) {
        throw BusinessException(ERR_PARAMETER_ERROR, "[Pasteboard] createData: mimeType value error!")
    }
    unsafe {
        let cMimeType = LibC.mallocCString(mimeType)
        let ret = FfiOHOSCreatePixelMapPasteData(cMimeType, value.getID())
        LibC.free(cMimeType)
        checkRet(ret.code, "[Pasteboard] createData: ")
        return PasteData(ret.data)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public func createData(mimeType: String, value: Array<UInt8>): PasteData {
    if ((mimeType == MIMETYPE_TEXT_HTML) || (mimeType == MIMETYPE_TEXT_PLAIN) || (mimeType == MIMETYPE_TEXT_URI) || (mimeType ==
        MIMETYPE_PIXELMAP) || (mimeType == MIMETYPE_TEXT_WANT)) {
        throw BusinessException(ERR_PARAMETER_ERROR, "[Pasteboard] createData: mimeType value error!")
    }
    unsafe {
        let cMimeType = LibC.mallocCString(mimeType)
        let arrPtr = acquireArrayRawData(value)
        let ret = FfiOHOSCreateArrayBufPasteData(cMimeType, arrPtr.pointer, Int64(value.size))
        releaseArrayRawData(arrPtr)
        LibC.free(cMimeType)
        checkRet(ret.code, "[Pasteboard] createData: ")
        return PasteData(ret.data)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public class PasteData <: RemoteDataLite {
    init(id: Int64) {
        super(id)
        PASTEBOARD_LOG.info("[PasteData] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getPrimaryText(): String {
        unsafe {
            let ret = FfiOHOSPasteDataGetPrimaryText(getID())
            try {
                checkRet(ret.code, "[PasteData] getPrimaryText: ")
                let res = ret.data.toString()
                return res
            } finally {
                LibC.free(ret.data)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getPrimaryHtml(): String {
        unsafe {
            let ret = FfiOHOSPasteDataGetPrimaryHtml(getID())
            try {
                checkRet(ret.code, "[PasteData] getPrimaryHtml: ")
                let res = ret.data.toString()
                return res
            } finally {
                LibC.free(ret.data)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getPrimaryUri(): String {
        unsafe {
            let ret = FfiOHOSPasteDataGetPrimaryUri(getID())
            try {
                checkRet(ret.code, "[PasteData] getPrimaryUri: ")
                let res = ret.data.toString()
                return res
            } finally {
                LibC.free(ret.data)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getPrimaryPixelMap(): PixelMap {
        unsafe {
            let ret = FfiOHOSPasteDataGetPrimaryPixelMap(getID())
            checkRet(ret.code, "[PasteData] getPrimaryPixelMap: ")
            return PixelMap(ret.data)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getPrimaryMimeType(): String {
        unsafe {
            let ret = FfiOHOSPasteDataGetPrimaryMimeType(getID())
            try {
                checkRet(ret.code, "[PasteData] getPrimaryMimeType: ")
                let res = ret.data.toString()
                return res
            } finally {
                LibC.free(ret.data)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getProperty(): PasteDataProperty {
        unsafe {
            let retPtr = safeMalloc<CPasteDataProperty>()
            try {
                let ret = FfiOHOSPasteDataGetProperty(getID(), retPtr)
                checkRet(ret, "[PasteData] getProperty: ")
                let cPasteDataProperty = retPtr.read()
                let pasteDataProperty = PasteDataProperty(cPasteDataProperty)
                return pasteDataProperty
            } finally {
                LibC.free(retPtr)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func setProperty(pasteDataProperty: PasteDataProperty): Unit {
        unsafe {
            let mimeTypes = toArrayCString(pasteDataProperty.mimeTypes)
            let tag: CString
            try {
                tag = LibC.mallocCString(pasteDataProperty.tag)
            } catch (e: Exception) {
                freeArrCString(mimeTypes)
                throw e
            }
            let ret = FfiOHOSPasteDataSetProperty(getID(), mimeTypes, tag, pasteDataProperty.timestamp,
                pasteDataProperty.localOnly, pasteDataProperty.shareOption.getValue())
            freeArrCString(mimeTypes)
            LibC.free(tag)
            checkRet(ret, "[PasteData] setProperty: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getTag(): String {
        unsafe {
            let ret = FfiOHOSPasteDataGetTag(getID())
            try {
                checkRet(ret.code, "[PasteData] getTag: ")
                let res = ret.data.toString()
                return res
            } finally {
                LibC.free(ret.data)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func hasType(mimeType: String): Bool {
        unsafe {
            let cMimeType = LibC.mallocCString(mimeType)
            let ret = FfiOHOSPasteDataHasType(getID(), cMimeType)
            LibC.free(cMimeType)
            checkRet(ret.code, "[PasteData] hasType: ")
            return ret.data
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func addRecord(record: PasteDataRecord): Unit {
        unsafe {
            let ret = FfiOHOSPasteDataAddRecord(getID(), record.getID())
            checkRet(ret, "[PasteData] addRecord: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func addRecord(mimeType: String, value: String): Unit {
        if ((mimeType != MIMETYPE_TEXT_HTML) && (mimeType != MIMETYPE_TEXT_PLAIN) && (mimeType != MIMETYPE_TEXT_URI)) {
            PASTEBOARD_LOG.error("[PasteData] addRecord: mimeType error!")
            throw BusinessException(ERR_PARAMETER_ERROR, "[Pasteboard] createData: mimeType value error!")
        }
        unsafe {
            try (
                cMimeType = LibC.mallocCString(mimeType).asResource(),
                cValue = LibC.mallocCString(value).asResource()
            ) {
                let ret = FfiOHOSPasteDataAddMimeTypeRecord(getID(), cMimeType.value, cValue.value)
                checkRet(ret, "[PasteData] addRecord: ")
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func addRecord(mimeType: String, value: PixelMap): Unit {
        if (mimeType != MIMETYPE_PIXELMAP) {
            PASTEBOARD_LOG.info("[PasteData] addRecord: mimeType error!")
            throw BusinessException(ERR_PARAMETER_ERROR, "[Pasteboard] createData: mimeType value error!")
        }
        unsafe {
            let cMimeType = LibC.mallocCString(mimeType)
            let ret = FfiOHOSPasteDataAddPixelMapRecord(getID(), cMimeType, value.getID())
            LibC.free(cMimeType)
            checkRet(ret, "[PasteData] addRecord: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func addRecord(mimeType: String, value: Array<UInt8>): Unit {
        unsafe {
            let cMimeType = LibC.mallocCString(mimeType)
            let arrPtr = acquireArrayRawData(value)
            let ret = FfiOHOSPasteDataAddArrayRecord(getID(), cMimeType, arrPtr.pointer, value.size)
            releaseArrayRawData(arrPtr)
            LibC.free(cMimeType)
            checkRet(ret, "[PasteData] addRecord: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getMimeTypes(): Array<String> {
        unsafe {
            let ret = FfiOHOSPasteDataGetMimeTypes(getID())
            checkRet(ret.code, "[PasteData] getMimeTypes: ")
            return ret.getDataAndFree()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getRecord(index: Int32): PasteDataRecord {
        unsafe {
            let retPtr = safeMalloc<CPasteDataRecord>()
            let ret = FfiOHOSPasteDataGetRecord(getID(), index, retPtr)
            try {
                checkRet(ret.code, "[PasteData] getRecord: ")
                let cPasteDataRecord = retPtr.read()
                try {
                    return PasteDataRecord(ret.data, cPasteDataRecord)
                } finally {
                    cPasteDataRecord.free()
                }
            } finally {
                LibC.free(retPtr)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getRecordCount(): UIntNative {
        unsafe {
            let ret = FfiOHOSPasteDataGetRecordCount(getID())
            checkRet(ret.code, "[PasteData] getRecordCount: ")
            return ret.data
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func removeRecord(index: Int32): Unit {
        unsafe {
            let ret = FfiOHOSPasteDataRemoveRecord(getID(), index)
            checkRet(ret, "[PasteData] removeRecord: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func replaceRecord(index: Int32, record: PasteDataRecord): Unit {
        unsafe {
            let ret = FfiOHOSPasteDataReplaceRecord(getID(), record.getID(), index)
            checkRet(ret, "[PasteData] replaceRecord: ")
        }
    }
}
