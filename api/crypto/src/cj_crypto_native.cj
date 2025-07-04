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
import std.math.numeric.*

@C
struct HcfBlob {
    HcfBlob(
        let head: CPointer<UInt8>,
        let size: UIntNative
    ) {}

    init(blob: DataBlob) {
        unsafe {
            if (blob.data.size == 0) {
                this.head = CPointer<UInt8>()
                this.size = 0
            } else {
                let arr = blob.data
                this.head = safeMalloc<UInt8>(count: arr.size)
                this.size = UIntNative(arr.size)
                let cp = acquireArrayRawData(arr)
                memcpy_s(this.head, this.size, cp.pointer, this.size)
                releaseArrayRawData(cp)
            }
        }
    }

    init(arr: Array<UInt8>) {
        unsafe {
            if (arr.size == 0) {
                this.head = CPointer<UInt8>()
                this.size = 0
            } else {
                this.head = safeMalloc<UInt8>(count: arr.size)
                this.size = UIntNative(arr.size)
                let cp = acquireArrayRawData(arr)
                memcpy_s(this.head, this.size, cp.pointer, this.size)
                releaseArrayRawData(cp)
            }
        }
    }

    func toDataBlob(): DataBlob {
        unsafe {
            if (this.size == 0) {
                return DataBlob([])
            } else {
                let arr = Array<UInt8>(Int64(this.size), repeat: 0)
                let cp = acquireArrayRawData(arr)
                memcpy_s(cp.pointer, UIntNative(this.size), this.head, UIntNative(this.size))
                releaseArrayRawData(cp)
                return DataBlob(arr)
            }
        }
    }

    func free(): Unit {
        unsafe { LibC.free<UInt8>(head) }
    }
}

@C
struct CParamsSpec {
    CParamsSpec(
        let iv: HcfBlob,
        let add: HcfBlob,
        let authTag: HcfBlob
    ) {}
}

@C
struct HcfBigInteger {
    HcfBigInteger(
        let data: CPointer<UInt8>,
        let len: UInt32
    ) {}

    init(value: BigInt) {
        let digits = value.toBytes()
        digits.reverse()
        unsafe {
            if (digits.size == 0) {
                this.data = CPointer<UInt8>()
                this.len = 0
            } else {
                this.data = safeMalloc<UInt8>(count: digits.size)
                this.len = UInt32(digits.size)
                let cp = acquireArrayRawData(digits)
                memcpy_s(this.data, UIntNative(this.len), cp.pointer, UIntNative(this.len))
                releaseArrayRawData(cp)
            }
        }
    }

    func toArray(): Array<UInt8> {
        if (data.isNull()) {
            return []
        }
        let arr = Array<UInt8>(Int64(len), repeat: 0)
        unsafe {
            let cp = acquireArrayRawData(arr)
            memcpy_s(cp.pointer, UIntNative(this.len), this.data, UIntNative(this.len))
            releaseArrayRawData(cp)
        }
        arr.reverse()
        return arr
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct HcfParamsSpec {
    HcfParamsSpec(let algName: CString) {}

    init(algName: String) {
        this.algName = unsafe { LibC.mallocCString(algName) }
    }

    func free(): Unit {
        unsafe { LibC.free(algName) }
    }
}

@C
struct HcfPBKDFParamsSpec {
    var base: HcfParamsSpec = HcfParamsSpec(CString(CPointer<UInt8>()))
    var password: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
    var salt: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
    var iterations: IntNative = 0
    var output: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)

    init(spec: PBKDF2Spec) {
        try {
            this.base = HcfParamsSpec(spec.algName)
            this.password = HcfBlob(DataBlob(spec.password))
            this.salt = HcfBlob(DataBlob(spec.salt))
            this.iterations = IntNative(spec.iterations)
            this.output = HcfBlob(DataBlob(Array<UInt8>(Int64(spec.keySize), repeat: 0)))
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        password.free()
        salt.free()
        output.free()
    }
}

@C
struct HcfHkdfParamsSpec {
    var base: HcfParamsSpec = HcfParamsSpec(CString(CPointer<UInt8>()))
    var key: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
    var salt: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
    var info: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
    var output: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)

    init(spec: HKDFSpec) {
        try {
            this.base = HcfParamsSpec(spec.algName)
            this.key = HcfBlob(DataBlob(spec.key))
            this.salt = HcfBlob(DataBlob(spec.salt))
            this.info = HcfBlob(DataBlob(spec.info))
            this.output = HcfBlob(DataBlob(Array<UInt8>(Int64(spec.keySize), repeat: 0)))
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        key.free()
        salt.free()
        info.free()
        output.free()
    }
}

@C
struct HcfAsyKeyParamsSpec {
    HcfAsyKeyParamsSpec(
        let algName: CString,
        let specType: Int32
    ) {}

    init(algName: String, specType: AsyKeySpecType) {
        this.algName = unsafe { LibC.mallocCString(algName) }
        this.specType = specType.value
    }

    func free(): Unit {
        unsafe { LibC.free(algName) }
    }
}

@C
struct HcfECField {
    HcfECField(let fieldType: CString) {}

    init(fp: ECFieldFp) {
        this.fieldType = unsafe { LibC.mallocCString(fp.fieldType) }
    }

    func free(): Unit {
        unsafe { LibC.free(fieldType) }
    }
}

@C
struct HcfECFieldFp {
    var base: HcfECField = HcfECField(CString(CPointer<UInt8>()))
    var p: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(field: ECFieldFp) {
        try {
            base = HcfECField(field)
            p = HcfBigInteger(field.p)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func toECFieldFp(): ECFieldFp {
        return ECFieldFp(fieldType: base.fieldType.toString(), p: BigInt(true, p.toArray()))
    }

    func free(): Unit {
        base.free()
        p.free()
    }
}

@C
struct HcfPoint {
    var x: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var y: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init() {}

    init(point: Point) {
        this.x = HcfBigInteger(point.x)
        this.y = try {
            HcfBigInteger(point.y)
        } catch (e: Exception) {
            this.x.free()
            throw e
        }
    }

    func toPoint(): Point {
        return Point(x: BigInt(true, x.toArray()), y: BigInt(true, y.toArray()))
    }

    func free(): Unit {
        x.free()
        y.free()
    }
}

@C
struct HcfEccCommParamsSpec {
    var base: HcfAsyKeyParamsSpec = HcfAsyKeyParamsSpec(CString(CPointer<UInt8>()), 0)
    var field: CPointer<HcfECField> = CPointer<HcfECField>()
    var a: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var b: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var g: HcfPoint = HcfPoint()
    var n = HcfBigInteger(CPointer<UInt8>(), 0)
    var h: Int32 = 0

    init() {}

    init(spec: ECCCommonParamsSpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            a = HcfBigInteger(spec._a)
            b = HcfBigInteger(spec._b)
            unsafe {
                let ptr = safeMalloc<HcfECFieldFp>()
                ptr.write(HcfECFieldFp((spec._field as ECFieldFp).getOrThrow()))
                field = CPointer<HcfECField>(ptr)
            }
            g = HcfPoint(spec._g)
            n = HcfBigInteger(spec._n)
            h = spec._h
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        if (field.isNotNull()) {
            unsafe {
                let relField = CPointer<HcfECFieldFp>(field)
                relField.read().free()
                LibC.free(relField)
            }
        }
        a.free()
        b.free()
        g.free()
        n.free()
    }
}

@C
struct HcfEccPriKeyParamsSpec {
    var base: HcfEccCommParamsSpec = HcfEccCommParamsSpec()
    var sk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: ECCPriKeySpec) {
        try {
            base = HcfEccCommParamsSpec(spec._params)
            sk = HcfBigInteger(spec._sk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        sk.free()
    }
}

@C
struct HcfEccPubKeyParamsSpec {
    var base: HcfEccCommParamsSpec = HcfEccCommParamsSpec()
    var pk: HcfPoint = HcfPoint()

    init(spec: ECCPubKeySpec) {
        try {
            base = HcfEccCommParamsSpec(spec._params)
            pk = HcfPoint(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        pk.free()
    }
}

@C
struct HcfEccKeyPairParamsSpec {
    var base: HcfEccCommParamsSpec = HcfEccCommParamsSpec()
    var sk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var pk: HcfPoint = HcfPoint()

    init(spec: ECCKeyPairSpec) {
        try {
            base = HcfEccCommParamsSpec(spec._params)
            sk = HcfBigInteger(spec._sk)
            pk = HcfPoint(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        sk.free()
        pk.free()
    }
}

@C
struct HcfDhCommParamsSpec {
    var base: HcfAsyKeyParamsSpec = HcfAsyKeyParamsSpec(CString(CPointer<UInt8>()), 0)
    var p: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var g: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var l: IntNative = 0

    init() {}

    init(spec: DHCommonParamsSpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            p = HcfBigInteger(spec._p)
            g = HcfBigInteger(spec._g)
            l = spec._l
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        p.free()
        g.free()
    }
}

@C
struct HcfDhPriKeyParamsSpec {
    var base: HcfDhCommParamsSpec = HcfDhCommParamsSpec()
    var sk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: DHPriKeySpec) {
        try {
            base = HcfDhCommParamsSpec(spec._params)
            sk = HcfBigInteger(spec._sk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        sk.free()
    }
}

@C
struct HcfDhPubKeyParamsSpec {
    var base: HcfDhCommParamsSpec = HcfDhCommParamsSpec()
    var pk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: DHPubKeySpec) {
        try {
            base = HcfDhCommParamsSpec(spec._params)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        pk.free()
    }
}

@C
struct HcfDhKeyPairParamsSpec {
    var base: HcfDhCommParamsSpec = HcfDhCommParamsSpec()
    var sk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var pk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: DHKeyPairSpec) {
        try {
            base = HcfDhCommParamsSpec(spec._params)
            sk = HcfBigInteger(spec._sk)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        sk.free()
        pk.free()
    }
}

@C
struct Sm2CipherTextSpec {
    var xCoordinate: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var yCoordinate: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var cipherTextData: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
    var hashData: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)

    init(spec: SM2CipherTextSpec) {
        try {
            this.xCoordinate = HcfBigInteger(spec.xCoordinate)
            this.yCoordinate = HcfBigInteger(spec.yCoordinate)
            this.cipherTextData = HcfBlob(spec.cipherTextData)
            this.hashData = HcfBlob(spec.hashData)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        xCoordinate.free()
        yCoordinate.free()
        cipherTextData.free()
        hashData.free()
    }
}

@C
struct HcfRsaCommParamsSpec {
    var base: HcfAsyKeyParamsSpec = HcfAsyKeyParamsSpec(CString(CPointer<UInt8>()), 0)
    var n: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init() {}

    init(spec: RSACommonParamsSpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            n = HcfBigInteger(spec._n)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        n.free()
    }
}

@C
struct HcfRsaPubKeyParamsSpec {
    var base: HcfRsaCommParamsSpec = HcfRsaCommParamsSpec()
    var pk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: RSAPubKeySpec) {
        try {
            base = HcfRsaCommParamsSpec(spec._params)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        pk.free()
    }
}

@C
struct HcfRsaKeyPairParamsSpec {
    var base: HcfRsaCommParamsSpec = HcfRsaCommParamsSpec()
    var pk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var sk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: RSAKeyPairSpec) {
        try {
            base = HcfRsaCommParamsSpec(spec._params)
            sk = HcfBigInteger(spec._sk)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        sk.free()
        pk.free()
    }
}

@C
struct HcfAlg25519PriKeyParamsSpec {
    var base: HcfAsyKeyParamsSpec = HcfAsyKeyParamsSpec(CString(CPointer<UInt8>()), 0)
    var sk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: ED25519PriKeySpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            sk = HcfBigInteger(spec._sk)
        } catch (e: Exception) {
            base.free()
            sk.free()
            throw e
        }
    }

    init(spec: X25519PriKeySpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            sk = HcfBigInteger(spec._sk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        sk.free()
    }
}

@C
struct HcfAlg25519PubKeyParamsSpec {
    var base: HcfAsyKeyParamsSpec = HcfAsyKeyParamsSpec(CString(CPointer<UInt8>()), 0)
    var pk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: ED25519PubKeySpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            base.free()
            pk.free()
            throw e
        }
    }

    init(spec: X25519PubKeySpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        pk.free()
    }
}

@C
struct HcfAlg25519KeyPairParamsSpec {
    var base: HcfAsyKeyParamsSpec = HcfAsyKeyParamsSpec(CString(CPointer<UInt8>()), 0)
    var sk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var pk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: ED25519KeyPairSpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            sk = HcfBigInteger(spec._sk)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            base.free()
            pk.free()
            throw e
        }
    }

    init(spec: X25519KeyPairSpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            sk = HcfBigInteger(spec._sk)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        sk.free()
        pk.free()
    }
}

@C
struct HcfDsaCommParamsSpec {
    var base: HcfAsyKeyParamsSpec = HcfAsyKeyParamsSpec(CString(CPointer<UInt8>()), 0)
    var p: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var q: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var g: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init() {}

    init(spec: DSACommonParamsSpec) {
        try {
            base = HcfAsyKeyParamsSpec(spec._algName, spec._specType)
            p = HcfBigInteger(spec._p)
            q = HcfBigInteger(spec._q)
            g = HcfBigInteger(spec._g)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        p.free()
        q.free()
        g.free()
    }
}

@C
struct HcfDsaPubKeyParamsSpec {
    var base: HcfDsaCommParamsSpec = HcfDsaCommParamsSpec()
    var pk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: DSAPubKeySpec) {
        try {
            base = HcfDsaCommParamsSpec(spec._params)
            pk = HcfBigInteger(spec._pk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        pk.free()
    }
}

@C
struct HcfDsaKeyPairParamsSpec {
    var base: HcfDsaCommParamsSpec = HcfDsaCommParamsSpec()
    var pk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)
    var sk: HcfBigInteger = HcfBigInteger(CPointer<UInt8>(), 0)

    init(spec: DSAKeyPairSpec) {
        try {
            base = HcfDsaCommParamsSpec(spec._params)
            pk = HcfBigInteger(spec._pk)
            sk = HcfBigInteger(spec._sk)
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        base.free()
        pk.free()
        sk.free()
    }
}
