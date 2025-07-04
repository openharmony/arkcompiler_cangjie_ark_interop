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

package ohos.i18n

import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

foreign {
    func FfiOHOSBreakIteratorIsBoundary(id: Int64, offset: Int32): Bool

    func FfiOHOSBreakIteratorGetLineBreakText(id: Int64): CString

    func FfiOHOSBreakIteratorFollowing(id: Int64, offset: Int32): Int32

    func FfiOHOSBreakIteratorSetLineBreakText(id: Int64, text: CString): Unit

    func FfiOHOSBreakIteratorPrevious(id: Int64): Int32

    func FfiOHOSBreakIteratorNext(id: Int64, index: Int32): Int32

    func FfiOHOSBreakIteratorLast(id: Int64): Int32

    func FfiOHOSBreakIteratorFirst(id: Int64): Int32

    func FfiOHOSBreakIteratorCurrent(id: Int64): Int32
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class BreakIterator <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func setLineBreakText(text: String): Unit {
        unsafe {
            let cText = LibC.mallocCString(text)
            FfiOHOSBreakIteratorSetLineBreakText(getID(), cText)
            LibC.free(cText)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getLineBreakText(): String {
        unsafe {
            let result = FfiOHOSBreakIteratorGetLineBreakText(getID())
            let res = result.toString()
            LibC.free(result)
            return res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func current(): Int32 {
        unsafe {
            return FfiOHOSBreakIteratorCurrent(getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func first(): Int32 {
        unsafe {
            return FfiOHOSBreakIteratorFirst(getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func last(): Int32 {
        unsafe {
            return FfiOHOSBreakIteratorLast(getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func next(index!: Int32 = 1): Int32 {
        unsafe {
            return FfiOHOSBreakIteratorNext(getID(), index)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func previous(): Int32 {
        unsafe {
            return FfiOHOSBreakIteratorPrevious(getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func following(offset: Int32): Int32 {
        unsafe {
            return FfiOHOSBreakIteratorFollowing(getID(), offset)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func isBoundary(offset: Int32): Bool {
        unsafe {
            return FfiOHOSBreakIteratorIsBoundary(getID(), offset)
        }
    }
}
