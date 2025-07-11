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
    func FfiOHOSCreateRandom(errCode: CPointer<Int32>): Int64

    func FfiOHOSRandomGetAlgName(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSGenerateRandom(id: Int64, numBytes: Int32, errCode: CPointer<Int32>): HcfBlob

    func FfiOHOSSetSeed(id: Int64, seed: CPointer<HcfBlob>, errCode: CPointer<Int32>): Unit
}

/**
 * Create a random generator instance.
 *
 * @returns { Random } returns the created rand instance.
 * @throws { BusinessException } 17620001 - memory error.
 * @relation function createRandom(): Random;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Rand"
]
public func createRandom(): Random {
    unsafe {
        var errCode: Int32 = 0
        let id = FfiOHOSCreateRandom(inout errCode)
        checkRet(errCode, "[Random] createRandom: ")
        return Random(id)
    }
}

/**
 * Provides the random interface.
 *
 * @relation interface Random
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Rand"
]
public class Random <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Indicates the random generation algorithm name.
     *
     * @type { String }
     * @relation algName : string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Rand"
    ]
    public prop algName: String {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let cstr = FfiOHOSRandomGetAlgName(getID(), inout errCode)
                checkRet(errCode, "[Random] algName: ")
                // if free cstr, maybe double free. Please modify after testing.
                return cstr.toString()
            }
        }
    }

    /**
     * Generate random DataBlob by given length.
     *
     * @param { Int32 } len - indicates the length of random DataBlob.
     * @returns { DataBlob } return the generated random blob.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 17620001 - memory error.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation generateRandomSync(len: number): DataBlob;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Rand"
    ]
    public func generateRandom(len: Int32): DataBlob {
        unsafe {
            var errCode: Int32 = 0
            let returnBlob: HcfBlob = FfiOHOSGenerateRandom(getID(), len, inout errCode)
            checkRet(errCode, "[Random] generateRandom: ")
            let blob = returnBlob.toDataBlob()
            returnBlob.free()
            return blob
        }
    }

    /**
     * Set seed by given DataBlob.
     *
     * @param { DataBlob } seed - indicates the seed DataBlob.
     * @throws { BusinessException } 17620001 - memory error.
     * @relation setSeed(seed: DataBlob): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Rand"
    ]
    public func setSeed(seed: DataBlob): Unit {
        unsafe {
            let cp = safeMalloc<HcfBlob>(count: 1)
            let chb: HcfBlob
            try {
                chb = HcfBlob(seed)
            } catch (e: Exception) {
                LibC.free(cp)
                throw e
            }
            cp.write(chb)
            var errCode: Int32 = 0
            FfiOHOSSetSeed(getID(), cp, inout errCode)
            chb.free()
            LibC.free(cp)
            checkRet(errCode, "[Random] setSeed: ")
        }
    }
}
