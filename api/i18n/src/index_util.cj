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
    func FfiI18nIndexUtilConstructor(locale: CString): Int64

    func FfiI18nIndexUtilAddLocale(remoteDataId: Int64, locale: CString): Unit

    func FfiI18nIndexUtilGetIndex(remoteDataId: Int64, text: CString): CString

    func FfiI18nIndexUtilGetIndexList(remoteDataId: Int64): CArrString
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class IndexUtil <: RemoteDataLite {
    static func getIndexUtil(locale: String): IndexUtil {
        return IndexUtil(locale)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: String) {
        super(
            unsafe {
                let cLocale = LibC.mallocCString(locale)
                let remoteDataId = FfiI18nIndexUtilConstructor(cLocale)
                LibC.free(cLocale)
                remoteDataId
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
    public func addLocale(locale: String): Unit {
        unsafe {
            let cLocale = LibC.mallocCString(locale)
            FfiI18nIndexUtilAddLocale(getID(), cLocale)
            LibC.free(cLocale)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getIndex(text: String): String {
        unsafe {
            let cText = LibC.mallocCString(text)
            let cStr = FfiI18nIndexUtilGetIndex(getID(), cText)
            let str = cStr.toString()
            LibC.free(cText)
            LibC.free(cStr)
            return str
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getIndexList(): Array<String> {
        unsafe {
            let cArrString = FfiI18nIndexUtilGetIndexList(getID())
            let result = cArrString.toStringArray()
            cArrString.free()
            return result
        }
    }
}
