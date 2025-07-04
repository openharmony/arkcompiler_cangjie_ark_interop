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
import std.collection.HashMap

foreign {
    func FfiI18nNormalizerConstructor(mode: Int32, errCode: CPointer<Int32>): Int64

    func FfiI18nNormalizerNormalize(remoteDataId: Int64, text: CString, errCode: CPointer<Int32>): CString
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class Normalizer <: RemoteDataLite {
    private static let NOMALIZER_INSTANCE_MAP = HashMap<Int32, Normalizer>()

    private init(mode: Int32) {
        super(
            unsafe {
                var errCode: Int32 = 0
                let remoteDataId = FfiI18nNormalizerConstructor(mode, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
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
    public static func getInstance(mode: NormalizerMode): Normalizer {
        if (NOMALIZER_INSTANCE_MAP.contains(mode.getValue())) {
            return NOMALIZER_INSTANCE_MAP[mode.getValue()]
        }
        let normalizerInstance = Normalizer(mode.getValue())
        NOMALIZER_INSTANCE_MAP[mode.getValue()] = normalizerInstance
        return normalizerInstance
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func normalize(text: String): String {
        unsafe {
            let cText = LibC.mallocCString(text)
            var errCode: Int32 = 0
            let cStr = FfiI18nNormalizerNormalize(getID(), cText, inout errCode)
            LibC.free(cText)
            let str = cStr.toString()
            LibC.free(cStr)
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
            return str
        }
    }
}
