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

import ohos.ffi.*
import ohos.base.*
import ohos.image.*
import ohos.labels.*

foreign {
    func FfiOHOSCreateStringPasteDataRecord(mimeType: CString, value: CString, retPtr: CPointer<CPasteDataRecord>): RetDataI64

    func FfiOHOSCreatePixelMapPasteDataRecord(mimeType: CString, pixelMapId: Int64, retPtr: CPointer<CPasteDataRecord>): RetDataI64

    func FfiOHOSCreateArrayBufPasteDataRecord(mimeType: CString, buffPtr: CPointer<UInt8>, bufferSize: Int64,
        retPtr: CPointer<CPasteDataRecord>): RetDataI64

    func FfiOHOSPasteDataRecordToPlainText(id: Int64): RetDataCString
}

@C
struct CPasteDataRecord {
    CPasteDataRecord(
        let htmlText: CString,
        let mimeType: CString,
        let plainText: CString,
        let uri: CString,
        let pixelMap: Int64
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(htmlText)
            LibC.free(mimeType)
            LibC.free(plainText)
            LibC.free(uri)
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public func createRecord(mimeType: String, value: String): PasteDataRecord {
    if ((mimeType != MIMETYPE_TEXT_HTML) && (mimeType != MIMETYPE_TEXT_PLAIN) && (mimeType != MIMETYPE_TEXT_URI)) {
        throw BusinessException(ERR_PARAMETER_ERROR, "[Pasteboard] createRecord: mimeType value error!")
    }
    unsafe {
        try (
            cMimeType = LibC.mallocCString(mimeType).asResource(),
            valueCstr = LibC.mallocCString(value).asResource(),
            retPtr = safeMalloc<CPasteDataRecord>().asResource()
        ) {
            let ret = FfiOHOSCreateStringPasteDataRecord(cMimeType.value, valueCstr.value, retPtr.value)
            checkRet(ret.code, "[Pasteboard] createRecord: ")
            let cPasteDataRecord = retPtr.value.read()
            try {
                return PasteDataRecord(ret.data, cPasteDataRecord)
            } finally {
                cPasteDataRecord.free()
            }
        }
    }
    throw Exception()
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public func createRecord(mimeType: String, value: PixelMap): PasteDataRecord {
    if (mimeType != MIMETYPE_PIXELMAP) {
        throw BusinessException(ERR_PARAMETER_ERROR, "[Pasteboard] createRecord: mimeType value error!")
    }
    unsafe {
        try (
            cMimeType = LibC.mallocCString(mimeType).asResource(),
            retPtr = safeMalloc<CPasteDataRecord>().asResource()
        ) {
            let ret = FfiOHOSCreatePixelMapPasteDataRecord(cMimeType.value, value.getID(), retPtr.value)
            checkRet(ret.code, "[Pasteboard] createRecord: ")
            let cPasteDataRecord = retPtr.value.read()
            try {
                return PasteDataRecord(ret.data, cPasteDataRecord)
            } finally {
                cPasteDataRecord.free()
            }
        }
    }
    throw Exception()
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public func createRecord(mimeType: String, value: Array<UInt8>): PasteDataRecord {
    if ((mimeType == MIMETYPE_TEXT_HTML) || (mimeType == MIMETYPE_TEXT_PLAIN) || (mimeType == MIMETYPE_TEXT_URI) || (mimeType ==
        MIMETYPE_PIXELMAP) || (mimeType == MIMETYPE_TEXT_WANT)) {
        throw BusinessException(ERR_PARAMETER_ERROR, "[Pasteboard] createRecord: mimeType value error!")
    }
    unsafe {
        try (
            cMimeType = LibC.mallocCString(mimeType).asResource(),
            retPtr = safeMalloc<CPasteDataRecord>().asResource()
        ) {
            let arrPtr = acquireArrayRawData(value)
            let ret = FfiOHOSCreateArrayBufPasteDataRecord(cMimeType.value, arrPtr.pointer, value.size, retPtr.value)
            releaseArrayRawData(arrPtr)
            checkRet(ret.code, "[Pasteboard] createRecord: ")
            let cPasteDataRecord = retPtr.value.read()
            try {
                return PasteDataRecord(ret.data, cPasteDataRecord)
            } finally {
                cPasteDataRecord.free()
            }
        }
    }
    throw Exception()
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public class PasteDataRecord <: RemoteDataLite {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public let htmlText: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public let mimeType: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public let plainText: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public let uri: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public let pixelMap: PixelMap

    init(id: Int64, cRecord: CPasteDataRecord) {
        super(id)
        unsafe {
            this.htmlText = cRecord.htmlText.toString()
            this.mimeType = cRecord.mimeType.toString()
            this.plainText = cRecord.plainText.toString()
            this.uri = cRecord.uri.toString()
            this.pixelMap = PixelMap(cRecord.pixelMap)
        }
        PASTEBOARD_LOG.info("[PasteDataRecord] construct success")
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
    public func toPlainText(): String {
        unsafe {
            let ret = FfiOHOSPasteDataRecordToPlainText(getID())
            try {
                checkRet(ret.code, "[PasteDataRecord] toPlainText: ")
                let res = ret.data.toString()
                return res
            } finally {
                LibC.free(ret.data)
            }
        }
    }
}
