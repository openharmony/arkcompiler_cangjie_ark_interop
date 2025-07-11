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

foreign {
    func FfiOHOSCreateSymKeyGenerator(algName: CString, errCode: CPointer<Int32>): Int64

    func FfiOHOSSymKeyGeneratorGetAlgName(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSGenerateSymKey(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSConvertKey(id: Int64, key: CPointer<HcfBlob>, errCode: CPointer<Int32>): Int64
}

/**
 * Create a symmetric key generator according to the given algorithm name.
 *
 * @param { String } algName - indicates the algorithm name.
 * @returns { SymKeyGenerator } the symmetric key generator instance.
 * @throws { BusinessException } 401 - invalid parameters.
 * @throws { BusinessException } 801 - this operation is not supported.
 * @relation createSymKeyGenerator(algName: string): SymKeyGenerator
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.SymKey"
]
public func createSymKeyGenerator(algName: String): SymKeyGenerator {
    unsafe {
        let cstr = LibC.mallocCString(algName)
        var errCode: Int32 = 0
        let id = FfiOHOSCreateSymKeyGenerator(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[SymKeyGenerator] createSymKeyGenerator: ")
        return SymKeyGenerator(id, algName)
    }
}

/**
 * Provides the SymKeyGenerator type, which is used for generating symmetric key.
 *
 * @relation interface SymKeyGenerator
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.SymKey"
]
public class SymKeyGenerator <: RemoteDataLite {
    private let _algName: String

    init(id: Int64, algName: String) {
        super(id)
        _algName = algName
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Indicates the algorithm name of the SymKeyGenerator object.
     *
     * @type { String }
     * @relation algName : string
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.SymKey"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }

    /**
     * Generate a symmetric key object randomly.
     *
     * @returns { SymKey } the SymKey returned by the function.
     * @throws { BusinessException } 17620001 - memory error.
     * @relation generateSymKeySync(): SymKey;
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.SymKey"
    ]
    public func generateSymKey(): SymKey {
        unsafe {
            var errCode: Int32 = 0
            let id = FfiOHOSGenerateSymKey(getID(), inout errCode)
            checkRet(errCode, "[SymKeyGenerator] generateSymKey: ")
            return SymKey(id, _algName)
        }
    }

    /**
     * Generate a symmetric key object according to the provided binary key data.
     *
     * @param { DataBlob } key - the key data blob.
     * @returns { SymKey } the SymKey  returned by the function.
     * @throws { BusinessException } 401 - invalid parameters.
     * @throws { BusinessException } 17620001 - memory error.
     * @relation convertKeySync(key: DataBlob): SymKey;
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.SymKey"
    ]
    public func convertKey(key: DataBlob): SymKey {
        unsafe {
            let cp = safeMalloc<HcfBlob>(count: 1)
            let chb: HcfBlob
            try {
                chb = HcfBlob(key)
            } catch (e: Exception) {
                LibC.free(cp)
                throw e
            }
            cp.write(chb)
            var errCode: Int32 = 0
            let id = FfiOHOSConvertKey(getID(), cp, inout errCode)
            chb.free()
            LibC.free(cp)
            checkRet(errCode, "[SymKeyGenerator] convertKey: ")
            return SymKey(id, _algName)
        }
    }
}
