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

package ohos.security.crypto_framework

import ohos.labels.*

import std.math.numeric.*

foreign func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32

/**
 * Defines a buffer array of the Binary Large Object (BLOB) type.
 *
 * @relation interface DataBlob
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework"
]
public class DataBlob {
    /**
     * Indicates the content of data blob.
     *
     * @relation data: Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    public var data: Array<UInt8>

    /**
     * DataBlob constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    public init(data: Array<UInt8>) {
        this.data = data
    }
}

/**
 * Defines the child class of ParamsSpec. It is a parameter of init for symmetric encryption or decryption.
 * IvParamsSpec applies to the cipher modes such as CBC, CTR, OFB, and CFB, which use only the IV.
 *
 * @relation interface IvParamsSpec extends ParamsSpec
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public class IvParamsSpec <: ParamsSpec {
    var _algName: String
    var _iv: DataBlob

    /**
     * Indicates the algorithm name. Should be set before initialization of a cipher object.
     *
     * @relation algName: string
     */
    @!APILevel[
        21,
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

    /**
     * IV for encryption or decryption.
     * Options:
     * - AES CBC, CTR, OFB, or CFB mode: 16-byte IV
     * - 3DES CBC, OFB, or CFB mode: 8-byte IV
     * - SM4 CBC, CTR, OFB, or CFB mode: 16-byte IV
     *
     * @relation iv: DataBlob
     */
    @!APILevel[
        21,
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

    /**
     * IvParamsSpec constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public init(algName: String, iv: DataBlob) {
        this._algName = algName
        this._iv = iv
    }
}

/**
 * Provides the GcmParamsSpec type, including the parameter iv, aad and authTag.
 *
 * @relation interface GcmParamsSpec extends ParamsSpec
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public class GcmParamsSpec <: ParamsSpec {
    var _algName: String
    var _aad: DataBlob
    var _authTag: DataBlob
    var _iv: DataBlob

    /**
     * Indicates the algorithm name. Should be set before initialization of a cipher object.
     *
     * @relation algName: string
     */
    @!APILevel[
        21,
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

    /**
     * Indicates the additional Authenticated Data in GCM mode.
     *
     * @relation aad: DataBlob
     */
    @!APILevel[
        21,
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

    /**
     * Indicates the GCM algorithm parameters such as iv.
     *
     * @relation iv: DataBlob
     */
    @!APILevel[
        21,
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

    /**
     * Indicates the output tag from the encryption operation. The tag is used for integrity check.
     *
     * @relation authTag: DataBlob
     */
    @!APILevel[
        21,
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

    /**
     * GcmParamsSpec constructor.
     *
     */
    @!APILevel[
        21,
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

/**
 * Provides the CcmParamsSpec type, including the parameter iv, aad and authTag.
 *
 * @relation interface CcmParamsSpec extends ParamsSpec
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public class CcmParamsSpec <: ParamsSpec {
    var _algName: String
    var _aad: DataBlob
    var _iv: DataBlob
    var _authTag: DataBlob

    /**
     * Indicates the algorithm name. Should be set before initialization of a cipher object.
     *
     * @relation algName: string
     */
    @!APILevel[
        21,
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

    /**
     * Indicates the output tag from the encryption operation. The tag is used for integrity check.
     *
     * @relation authTag: DataBlob
     */
    @!APILevel[
        21,
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

    /**
     * Indicates the Additional Authenticated Data in CCM mode.
     *
     * @relation aad: DataBlob
     */
    @!APILevel[
        21,
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

    /**
     * Indicates the GCM algorithm parameters such as IV.
     *
     * @relation iv: DataBlob
     */
    @!APILevel[
        21,
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

    /**
     * CcmParamsSpec constructor.
     *
     */
    @!APILevel[
        21,
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
