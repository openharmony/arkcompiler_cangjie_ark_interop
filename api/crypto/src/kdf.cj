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
import ohos.base.*

foreign {
    func FFiOHOSKdfConstructor(algName: CString, errCode: CPointer<Int32>): Int64

    func FFiOHOSKdfGenerateSecretByPB(id: Int64, params: CPointer<HcfPBKDFParamsSpec>): Int32

    func FFiOHOSKdfGenerateSecretByH(id: Int64, params: CPointer<HcfHkdfParamsSpec>): Int32
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Kdf"
]
public func createKdf(algName: String): Kdf {
    unsafe {
        let cstr = LibC.mallocCString(algName)
        var errCode: Int32 = 0
        let id = FFiOHOSKdfConstructor(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[Kdf] createKdf: ")
        return Kdf(id, algName)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Kdf"
]
public class Kdf <: RemoteDataLite {
    private let _algName: String

    init(id: Int64, algName: String) {
        super(id)
        _algName = algName
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public func generateSecret(params: KdfSpec): DataBlob {
        match (params) {
            case v: PBKDF2Spec => generateSecretByPB(v)
            case v: HKDFSpec => generateSecretByH(v)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "[Kdf] generateSecret Incorrect input parameter type.")
        }
    }

    func generateSecretByPB(v: PBKDF2Spec): DataBlob {
        unsafe {
            var spec = HcfPBKDFParamsSpec(v)
            let errCode = FFiOHOSKdfGenerateSecretByPB(getID(), inout spec)
            try {
                checkRet(errCode, "[Kdf] generateSecret: ")
                let blob = spec.output.toDataBlob()
                return blob
            } finally {
                spec.free()
            }
        }
    }

    func generateSecretByH(v: HKDFSpec): DataBlob {
        unsafe {
            var spec = HcfHkdfParamsSpec(v)
            let errCode = FFiOHOSKdfGenerateSecretByH(getID(), inout spec)
            try {
                checkRet(errCode, "[Kdf] generateSecret: ")
                let blob = spec.output.toDataBlob()
                return blob
            } finally {
                spec.free()
            }
        }
    }
}
