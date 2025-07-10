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

import std.math.numeric.*
import ohos.labels.*
import ohos.ffi.*

foreign func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework"
]
public struct DataBlob {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    public DataBlob(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CryptoFramework"
        ]
        public let data: Array<UInt8>
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public struct IvParamsSpec <: ParamsSpec {
    var _algName: String
    var _iv: DataBlob

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop algName: String {
        get() {
            return _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop iv: DataBlob {
        get() {
            return _iv
        }
        set(v) {
            this._iv = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public init(algName: String, iv: DataBlob) {
        this._algName = algName
        this._iv = iv
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public struct GcmParamsSpec <: ParamsSpec {
    var _algName: String
    var _aad: DataBlob
    var _authTag: DataBlob
    var _iv: DataBlob

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop algName: String {
        get() {
            return _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop aad: DataBlob {
        get() {
            return _aad
        }
        set(v) {
            this._aad = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop iv: DataBlob {
        get() {
            return _iv
        }
        set(v) {
            this._iv = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop authTag: DataBlob {
        get() {
            return _authTag
        }
        set(v) {
            this._authTag = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public init(algName: String, iv: DataBlob, add: DataBlob, authTag: DataBlob) {
        this._algName = algName
        this._iv = iv
        this._aad = add
        this._authTag = authTag
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public struct CcmParamsSpec <: ParamsSpec {
    var _algName: String
    var _aad: DataBlob
    var _iv: DataBlob
    var _authTag: DataBlob

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop algName: String {
        get() {
            return _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop authTag: DataBlob {
        get() {
            return _authTag
        }
        set(v) {
            this._authTag = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop aad: DataBlob {
        get() {
            return _aad
        }
        set(v) {
            this._aad = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop iv: DataBlob {
        get() {
            return _iv
        }
        set(v) {
            this._iv = v
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public init(algName: String, iv: DataBlob, add: DataBlob, authTag: DataBlob) {
        this._algName = algName
        this._iv = iv
        this._aad = add
        this._authTag = authTag
    }
}
