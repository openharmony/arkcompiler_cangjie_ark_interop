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
    func FFiOHOSKeyAgreementConstructor(algName: CString, errCode: CPointer<Int32>): Int64

    func FFiOHOSKeyAgreementGenerateSecret(id: Int64, priId: Int64, pubId: Int64, errCode: CPointer<Int32>): HcfBlob
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.KeyAgreement"
]
public func createKeyAgreement(algName: String): KeyAgreement {
    unsafe {
        let cstr: CString = LibC.mallocCString(algName)
        var errCode: Int32 = 0
        let id = FFiOHOSKeyAgreementConstructor(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[KeyAgreement] createKeyAgreement: ")
        return KeyAgreement(id, algName)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.KeyAgreement"
]
public class KeyAgreement <: RemoteDataLite {
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
        syscap: "SystemCapability.Security.CryptoFramework.KeyAgreement"
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
        syscap: "SystemCapability.Security.CryptoFramework.KeyAgreement"
    ]
    public func generateSecret(priKey: PriKey, pubKey: PubKey): DataBlob {
        var errCode = 0i32
        let returnBlob: HcfBlob = unsafe {
            FFiOHOSKeyAgreementGenerateSecret(getID(), priKey.getID(), pubKey.getID(), inout errCode)
        }
        checkRet(errCode, "[KeyAgreement] generateSecret: ")
        let blob = returnBlob.toDataBlob()
        returnBlob.free()
        return blob
    }
}
