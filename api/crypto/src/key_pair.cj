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
    func FFiOHOSKeyPairPubKey(id: Int64, errCode: CPointer<Int32>): Int64

    func FFiOHOSKeyPairPriKey(id: Int64, errCode: CPointer<Int32>): Int64
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class KeyPair <: RemoteDataLite {
    private let _algName: String
    private let _pubKey: ?PubKey
    private let _priKey: ?PriKey

    init(id: Int64, algName: String) {
        super(id)
        _algName = algName

        var errCode = 0i32
        let pubId = unsafe { FFiOHOSKeyPairPubKey(getID(), inout errCode) }
        this._pubKey = if (errCode == 0) {
            PubKey(pubId, algName)
        } else {
            None
        }
        errCode = 0i32
        let priId = unsafe { FFiOHOSKeyPairPriKey(getID(), inout errCode) }
        this._priKey = if (errCode == 0) {
            PriKey(priId, algName)
        } else {
            None
        }
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public prop pubKey: PubKey {
        get() {
            _pubKey ?? throw BusinessException(ERR_PARAMETER_ERROR, " [KeyPair] pubKey: Parameter error.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public prop priKey: PriKey {
        get() {
            _priKey ?? throw BusinessException(ERR_PARAMETER_ERROR, " [KeyPair] priKey: Parameter error.")
        }
    }
}
