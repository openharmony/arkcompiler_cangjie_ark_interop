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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Kdf"
]
public class PBKDF2Spec <: KdfSpec {
    var _algName: String
    var _password: Array<UInt8>
    var _salt: Array<UInt8>
    var _iterations: Int32
    var _keySize: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public init(algName!: String, password!: Array<UInt8>, salt!: Array<UInt8>, iterations!: Int32, keySize!: Int32) {
        this._algName = algName
        this._password = password
        this._salt = salt
        this._iterations = iterations
        this._keySize = keySize
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop password: Array<UInt8> {
        get() {
            _password
        }
        set(v) {
            this._password = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop salt: Array<UInt8> {
        get() {
            _salt
        }
        set(v) {
            this._salt = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop iterations: Int32 {
        get() {
            _iterations
        }
        set(v) {
            this._iterations = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop keySize: Int32 {
        get() {
            _keySize
        }
        set(v) {
            this._keySize = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Kdf"
]
public class HKDFSpec <: KdfSpec {
    var _algName: String
    var _key: Array<UInt8>
    var _salt: Array<UInt8>
    var _info: Array<UInt8>
    var _keySize: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public init(algName!: String, key!: Array<UInt8>, salt!: Array<UInt8>, info!: Array<UInt8>, keySize!: Int32) {
        this._algName = algName
        this._key = key
        this._salt = salt
        this._info = info
        this._keySize = keySize
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop key: Array<UInt8> {
        get() {
            _key
        }
        set(v) {
            this._key = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop salt: Array<UInt8> {
        get() {
            _salt
        }
        set(v) {
            this._salt = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop info: Array<UInt8> {
        get() {
            _info
        }
        set(v) {
            this._info = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Kdf"
    ]
    public mut prop keySize: Int32 {
        get() {
            _keySize
        }
        set(v) {
            this._keySize = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ECFieldFp <: ECField {
    var _fieldType: String
    var _p: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(fieldType!: String, p!: BigInt) {
        this._fieldType = fieldType
        this._p = p
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop fieldType: String {
        get() {
            _fieldType
        }
        set(v) {
            this._fieldType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop p: BigInt {
        get() {
            _p
        }
        set(v) {
            this._p = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class Point {
    var _x: BigInt
    var _y: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(x!: BigInt, y!: BigInt) {
        this._x = x
        this._y = y
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop x: BigInt {
        get() {
            _x
        }
        set(v) {
            this._x = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop y: BigInt {
        get() {
            _y
        }
        set(v) {
            this._y = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ECCCommonParamsSpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _field: ECField
    var _a: BigInt
    var _b: BigInt
    var _g: Point
    var _n: BigInt
    var _h: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, field!: ECField, a!: BigInt, b!: BigInt, g!: Point,
        n!: BigInt, h!: Int32) {
        this._algName = algName
        this._specType = specType
        this._field = field
        this._a = a
        this._b = b
        this._g = g
        this._n = n
        this._h = h
    }

    init(spec: HcfEccCommParamsSpec) {
        this._algName = spec.base.algName.toString()
        this._specType = AsyKeySpecType.parse(spec.base.specType)
        unsafe {
            let relField = CPointer<HcfECFieldFp>(spec.field)
            this._field = (relField.read().toECFieldFp() as ECField).getOrThrow()
        }
        this._a = BigInt(true, spec.a.toArray())
        this._b = BigInt(true, spec.b.toArray())
        this._g = spec.g.toPoint()
        this._n = BigInt(true, spec.n.toArray())
        this._h = spec.h
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop field: ECField {
        get() {
            _field
        }
        set(v) {
            this._field = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop a: BigInt {
        get() {
            _a
        }
        set(v) {
            this._a = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop b: BigInt {
        get() {
            _b
        }
        set(v) {
            this._b = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop g: Point {
        get() {
            _g
        }
        set(v) {
            this._g = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop n: BigInt {
        get() {
            _n
        }
        set(v) {
            this._n = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop h: Int32 {
        get() {
            _h
        }
        set(v) {
            this._h = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ECCPriKeySpec <: AsyKeySpec {
    var _params: ECCCommonParamsSpec
    var _sk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: ECCCommonParamsSpec, sk!: BigInt) {
        this._params = params
        this._sk = sk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: ECCCommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ECCPubKeySpec <: AsyKeySpec {
    var _params: ECCCommonParamsSpec
    var _pk: Point

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: ECCCommonParamsSpec, pk!: Point) {
        this._params = params
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: ECCCommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: Point {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ECCKeyPairSpec <: AsyKeySpec {
    var _params: ECCCommonParamsSpec
    var _sk: BigInt
    var _pk: Point

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: ECCCommonParamsSpec, sk!: BigInt, pk!: Point) {
        this._params = params
        this._sk = sk
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: ECCCommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: Point {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class DHCommonParamsSpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _p: BigInt
    var _g: BigInt
    var _l: IntNative

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, p!: BigInt, g!: BigInt, l!: IntNative) {
        this._algName = algName
        this._specType = specType
        this._p = p
        this._g = g
        this._l = l
    }

    init(spec: HcfDhCommParamsSpec) {
        this._algName = spec.base.algName.toString()
        this._specType = AsyKeySpecType.parse(spec.base.specType)
        this._p = BigInt(true, spec.p.toArray())
        this._g = BigInt(true, spec.g.toArray())
        this._l = spec.l
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop p: BigInt {
        get() {
            _p
        }
        set(v) {
            this._p = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop g: BigInt {
        get() {
            _g
        }
        set(v) {
            this._g = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop l: IntNative {
        get() {
            _l
        }
        set(v) {
            this._l = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class DHPriKeySpec <: AsyKeySpec {
    var _params: DHCommonParamsSpec
    var _sk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: DHCommonParamsSpec, sk!: BigInt) {
        this._params = params
        this._sk = sk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: DHCommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class DHPubKeySpec <: AsyKeySpec {
    var _params: DHCommonParamsSpec
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: DHCommonParamsSpec, pk!: BigInt) {
        this._params = params
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: DHCommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class DHKeyPairSpec <: AsyKeySpec {
    var _params: DHCommonParamsSpec
    var _sk: BigInt
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: DHCommonParamsSpec, sk!: BigInt, pk!: BigInt) {
        this._params = params
        this._sk = sk
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: DHCommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public class SM2CipherTextSpec {
    var _xCoordinate: BigInt
    var _yCoordinate: BigInt
    var _cipherTextData: Array<UInt8>
    var _hashData: Array<UInt8>

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public init(xCoordinate!: BigInt, yCoordinate!: BigInt, cipherTextData!: Array<UInt8>, hashData!: Array<UInt8>) {
        this._xCoordinate = xCoordinate
        this._yCoordinate = yCoordinate
        this._cipherTextData = cipherTextData
        this._hashData = hashData
    }

    init(spec: Sm2CipherTextSpec) {
        this._xCoordinate = BigInt(true, spec.xCoordinate.toArray())
        this._yCoordinate = BigInt(true, spec.yCoordinate.toArray())
        this._cipherTextData = spec.cipherTextData.toDataBlob().data
        this._hashData = spec.hashData.toDataBlob().data
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop xCoordinate: BigInt {
        get() {
            _xCoordinate
        }
        set(v) {
            this._xCoordinate = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop yCoordinate: BigInt {
        get() {
            _yCoordinate
        }
        set(v) {
            this._yCoordinate = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop cipherTextData: Array<UInt8> {
        get() {
            _cipherTextData
        }
        set(v) {
            this._cipherTextData = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public mut prop hashData: Array<UInt8> {
        get() {
            _hashData
        }
        set(v) {
            this._hashData = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class RSACommonParamsSpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _n: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, n!: BigInt) {
        this._algName = algName
        this._specType = specType
        this._n = n
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop n: BigInt {
        get() {
            _n
        }
        set(v) {
            this._n = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class RSAPubKeySpec <: AsyKeySpec {
    var _params: RSACommonParamsSpec
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: RSACommonParamsSpec, pk!: BigInt) {
        this._params = params
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: RSACommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class RSAKeyPairSpec <: AsyKeySpec {
    var _params: RSACommonParamsSpec
    var _sk: BigInt
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: RSACommonParamsSpec, sk!: BigInt, pk!: BigInt) {
        this._params = params
        this._sk = sk
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: RSACommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ED25519PriKeySpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _sk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, sk!: BigInt) {
        this._algName = algName
        this._specType = specType
        this._sk = sk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class X25519PriKeySpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _sk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, sk!: BigInt) {
        this._algName = algName
        this._specType = specType
        this._sk = sk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ED25519PubKeySpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, pk!: BigInt) {
        this._algName = algName
        this._specType = specType
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class X25519PubKeySpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, pk!: BigInt) {
        this._algName = algName
        this._specType = specType
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ED25519KeyPairSpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _sk: BigInt
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, sk!: BigInt, pk!: BigInt) {
        this._algName = algName
        this._specType = specType
        this._sk = sk
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class X25519KeyPairSpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _sk: BigInt
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, sk!: BigInt, pk!: BigInt) {
        this._algName = algName
        this._specType = specType
        this._sk = sk
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class DSACommonParamsSpec <: AsyKeySpec {
    var _algName: String
    var _specType: AsyKeySpecType
    var _p: BigInt
    var _q: BigInt
    var _g: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(algName!: String, specType!: AsyKeySpecType, p!: BigInt, q!: BigInt, g!: BigInt) {
        this._algName = algName
        this._specType = specType
        this._p = p
        this._q = q
        this._g = g
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _algName
        }
        set(v) {
            this._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _specType
        }
        set(v) {
            this._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop p: BigInt {
        get() {
            _p
        }
        set(v) {
            this._p = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop q: BigInt {
        get() {
            _q
        }
        set(v) {
            this._q = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop g: BigInt {
        get() {
            _g
        }
        set(v) {
            this._g = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class DSAPubKeySpec <: AsyKeySpec {
    var _params: DSACommonParamsSpec
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: DSACommonParamsSpec, pk!: BigInt) {
        this._params = params
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: DSACommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class DSAKeyPairSpec <: AsyKeySpec {
    var _params: DSACommonParamsSpec
    var _sk: BigInt
    var _pk: BigInt

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public init(params!: DSACommonParamsSpec, sk!: BigInt, pk!: BigInt) {
        this._params = params
        this._sk = sk
        this._pk = pk
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop algName: String {
        get() {
            _params._algName
        }
        set(v) {
            this._params._algName = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop specType: AsyKeySpecType {
        get() {
            _params._specType
        }
        set(v) {
            this._params._specType = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop params: DSACommonParamsSpec {
        get() {
            _params
        }
        set(v) {
            this._params = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop sk: BigInt {
        get() {
            _sk
        }
        set(v) {
            this._sk = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public mut prop pk: BigInt {
        get() {
            _pk
        }
        set(v) {
            this._pk = v
        }
    }
}
