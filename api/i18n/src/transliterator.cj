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
    func FfiI18nTransliteratorConstructor(id: CString): Int64

    func FfiI18nTransliteratorGetAvailableIDs(): CArrString

    func FfiI18nTransliteratorTransform(remoteDataId: Int64, text: CString): CString
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class Transliterator <: RemoteDataLite {
    private init(id: String) {
        super(
            unsafe {
                let cId = LibC.mallocCString(id)
                let instanceId = FfiI18nTransliteratorConstructor(cId)
                LibC.free(cId)
                instanceId
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
    public static func getInstance(id: String): Transliterator {
        return Transliterator(id)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getAvailableIDs(): Array<String> {
        unsafe {
            var result: Array<String> = []
            let cArrString = FfiI18nTransliteratorGetAvailableIDs()
            result = cArrString.toStringArray()
            cArrString.free()
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func transform(text: String): String {
        unsafe {
            var result = ""
            try (cText = LibC.mallocCString(text).asResource()) {
                let cStr = FfiI18nTransliteratorTransform(getID(), cText.value)
                result = cStr.toString()
                LibC.free(cStr)
            }
            return result
        }
    }
}
