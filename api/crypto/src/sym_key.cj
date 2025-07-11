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

package ohos.crypto

import ohos.ffi.*
import ohos.labels.*
import ohos.base.*

foreign {
    func FfiOHOSSymKeyGetAlgName(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSSymKeyGetFormat(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSSymKeyGetEncoded(id: Int64, res: CPointer<HcfBlob>): Int32

    func FfiOHOSClearMem(id: Int64): Unit

    func FfiOHOSSymKeyGetHcfKey(id: Int64): CPointer<Unit>
}

/**
 * Provides the SymKey type, which is used for symmetric cryptography.
 *
 * @relation interface SymKey extends Key
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.SymKey"
]
public class SymKey <: RemoteDataLite & Key {
    private let _algName: String

    init(id: Int64, algName: String) {
        super(id)
        _algName = algName
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Indicates the algorithm name.
     *
     * @type { String }
     * @relation algName : string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }

    /**
     * Indicates the format of the key object.
     *
     * @type { String }
     * @relation format: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    public prop format: String {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let cstr = FfiOHOSSymKeyGetFormat(getID(), inout errCode)
                // if free cstr, maybe double free. Please modify after testing.
                checkRet(errCode, "[SymKey] format: ")
                return cstr.toString()
            }
        }
    }

    /**
     * Encode the key object to binary data.
     *
     * @returns { DataBlob } the binary data of the key object.
     * @throws { BusinessException } 801 - this operation is not supported.
     * @throws { BusinessException } 17620001 - memory error.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation algName : getEncoded(): DataBlob
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    public func getEncoded(): DataBlob {
        unsafe {
            let cp: CPointer<HcfBlob> = safeMalloc<HcfBlob>(count: 1)
            try {
                let errCode = FfiOHOSSymKeyGetEncoded(getID(), cp)
                checkRet(errCode, "[SymKey] getEncoded: ")
                let blob = cp.read().toDataBlob()
                cp.read().free()
                return blob
            } finally {
                LibC.free(cp)
            }
        }
    }

    /**
     * Reset the key data to zero in the memory.
     *
     * @relation clearMem(): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.SymKey"
    ]
    public func clearMem(): Unit {
        unsafe {
            FfiOHOSClearMem(getID())
        }
    }

    func getKey(): CPointer<Unit> {
        unsafe {
            return FfiOHOSSymKeyGetHcfKey(getID())
        }
    }
}
