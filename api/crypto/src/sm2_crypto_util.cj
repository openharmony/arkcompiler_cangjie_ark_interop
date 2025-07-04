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

import ohos.labels.*
import ohos.ffi.*

foreign {
    func FFiOHOSSm2CryptoUtilGenCipherTextBySpec(spec: Sm2CipherTextSpec, mode: CString, errCode: CPointer<Int32>): HcfBlob

    func FFiOHOSSm2CryptoUtilGetCipherTextSpec(input: HcfBlob, mode: CString, errCode: CPointer<Int32>): CPointer<Sm2CipherTextSpec>
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public class SM2CryptoUtil {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public static func genCipherTextBySpec(spec: SM2CipherTextSpec, mode!: String = "C1C3C2"): DataBlob {
        unsafe {
            let cMode: CString = LibC.mallocCString(mode)
            let cSpec: Sm2CipherTextSpec = try {
                Sm2CipherTextSpec(spec)
            } catch (e: Exception) {
                LibC.free(cMode)
                throw e
            }
            var errCode = 0i32
            let returnBlob: HcfBlob = FFiOHOSSm2CryptoUtilGenCipherTextBySpec(cSpec, cMode, inout errCode)
            LibC.free(cMode)
            cSpec.free()
            checkRet(errCode, "[SM2CryptoUtil] genCipherTextBySpec: ")
            let blob = returnBlob.toDataBlob()
            returnBlob.free()
            return blob
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public static func getCipherTextSpec(cipherText: DataBlob, mode!: String = "C1C3C2"): SM2CipherTextSpec {
        unsafe {
            let cMode: CString = LibC.mallocCString(mode)
            let input: HcfBlob = try {
                HcfBlob(cipherText)
            } catch (e: Exception) {
                LibC.free(cMode)
                throw e
            }
            var errCode = 0i32
            let ret: CPointer<Sm2CipherTextSpec> = FFiOHOSSm2CryptoUtilGetCipherTextSpec(input, cMode, inout errCode)
            LibC.free(cMode)
            input.free()
            checkRet(errCode, "[SM2CryptoUtil] getCipherTextSpec: ")
            let spec: SM2CipherTextSpec = SM2CipherTextSpec(ret.read())
            ret.read().free()
            return spec
        }
    }
}
