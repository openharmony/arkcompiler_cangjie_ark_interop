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

import std.collection.HashMap
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

foreign {
    func FfiOHOSGetSystemPasteboard(): RetDataI64

    func FfiOHOSSystemPasteboardSetData(id: Int64, pasteDataId: Int64): Int32

    func FfiOHOSSystemPasteboardGetData(id: Int64): RetDataI64

    func FfiOHOSSystemPasteboardHasData(id: Int64): RetDataBool

    func FfiOHOSSystemPasteboardClearData(id: Int64): Unit

    func FfiOHOSSystemPasteboardIsRemoteData(id: Int64): RetDataBool

    func FfiOHOSSystemPasteboardHasDataType(id: Int64, mimeType: CString): RetDataBool

    func FfiOHOSSystemPasteboardGetDataSource(id: Int64): RetDataCString
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public func getSystemPasteboard(): SystemPasteboard {
    unsafe {
        let ret = FfiOHOSGetSystemPasteboard()
        checkRet(ret.code, "System Pasteboard ")
        return getOrCreate(SystemPasteboard.INSTANCE_MAP, ret.data, {id: Int64 => SystemPasteboard(id)})
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public class SystemPasteboard <: RemoteDataLite {
    static let INSTANCE_MAP = HashMap<Int64, SystemPasteboard>()

    init(id: Int64) {
        super(id)
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
    public func setData(data: PasteData): Unit {
        unsafe {
            let ret = FfiOHOSSystemPasteboardSetData(getID(), data.getID())
            checkRet(ret, "[SystemPasteboard] setData: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        permission: "ohos.permission.READ_PASTEBOARD",
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getData(): PasteData {
        unsafe {
            let ret = FfiOHOSSystemPasteboardGetData(getID())
            checkRet(ret.code, "[SystemPasteboard] getData: ")
            return PasteData(ret.data)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func hasData(): Bool {
        unsafe {
            let ret = FfiOHOSSystemPasteboardHasData(this.getID())
            checkRet(ret.code, "[SystemPasteboard] hasData: ")
            return ret.data
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func clearData(): Unit {
        unsafe {
            FfiOHOSSystemPasteboardClearData(this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func isRemoteData(): Bool {
        unsafe {
            let ret = FfiOHOSSystemPasteboardIsRemoteData(this.getID())
            checkRet(ret.code, "[SystemPasteboard] isRemoteData: ")
            return ret.data
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func hasDataType(mimeType: String): Bool {
        unsafe {
            let cMimeType = LibC.mallocCString(mimeType)
            let ret = FfiOHOSSystemPasteboardHasDataType(this.getID(), cMimeType)
            LibC.free(cMimeType)
            checkRet(ret.code, "[SystemPasteboard] hasDataType: ")
            return ret.data
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getDataSource(): String {
        unsafe {
            let ret = FfiOHOSSystemPasteboardGetDataSource(this.getID())
            try {
                checkRet(ret.code, "[PasteData] getDataSource: ")
                let res = ret.data.toString()
                return res
            } finally {
                LibC.free(ret.data)
            }
        }
    }
}
