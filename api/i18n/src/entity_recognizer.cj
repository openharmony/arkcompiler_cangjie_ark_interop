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
    func FfiOHOSEntityImplConstructor(locale: CString, errCode: CPointer<Int32>): Int64

    func FfiOHOSEntityFindEntityInfo(id: Int64, text: CString): EntityInfoItemArr
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class EntityRecognizer <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale!: ?String = None) {
        super(
            unsafe {
                var codeId: Int64 = 0
                var cLocale = CString(CPointer<UInt8>())
                if (let Some(v) <- locale) {
                    cLocale = LibC.mallocCString(v)
                }
                var errCode: Int32 = 0
                codeId = FfiOHOSEntityImplConstructor(cLocale, inout errCode)
                LibC.free(cLocale)
                if (errCode != 0) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                codeId
            })
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
    public func findEntityInfo(text: String): Array<EntityInfoItem> {
        unsafe {
            let cText = LibC.mallocCString(text)
            let ret = FfiOHOSEntityFindEntityInfo(getID(), cText)
            LibC.free(cText)
            let arr = cArr2cjArr<CEntityInfoItem, EntityInfoItem>(ret.size, ret.head) {
                ct => try {
                    return EntityInfoItem(ct)
                } finally {
                    ct.free()
                }
            }
            LibC.free(ret.head)
            arr
        }
    }
}
