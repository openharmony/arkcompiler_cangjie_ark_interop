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
    func FFiOHOSAsyKeyGeneratorByDsaCommonSpec(spec: CPointer<HcfDsaCommParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByDsaPubKeySpec(spec: CPointer<HcfDsaPubKeyParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByDsaKeyPairSpec(spec: CPointer<HcfDsaKeyPairParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByEccCommonSpec(spec: CPointer<HcfEccCommParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByEccPriKeySpec(spec: CPointer<HcfEccPriKeyParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByEccPubKeySpec(spec: CPointer<HcfEccPubKeyParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByEccKeyPairSpec(spec: CPointer<HcfEccKeyPairParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByRsaPubKeySpec(spec: CPointer<HcfRsaPubKeyParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByRsaKeyPairSpec(spec: CPointer<HcfRsaKeyPairParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByAlg25519PriKeySpec(
        spec: CPointer<HcfAlg25519PriKeyParamsSpec>,
        errCode: CPointer<Int32>
    ): Int64

    func FFiOHOSAsyKeyGeneratorByAlg25519PubKeySpec(
        spec: CPointer<HcfAlg25519PubKeyParamsSpec>,
        errCode: CPointer<Int32>
    ): Int64

    func FFiOHOSAsyKeyGeneratorByAlg25519KeyPairSpec(
        spec: CPointer<HcfAlg25519KeyPairParamsSpec>,
        errCode: CPointer<Int32>
    ): Int64

    func FFiOHOSAsyKeyGeneratorByDhPriKeySpec(spec: CPointer<HcfDhPriKeyParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByDhPubKeySpec(spec: CPointer<HcfDhPubKeyParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByDhKeyPairSpec(spec: CPointer<HcfDhKeyPairParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorByDhCommonSpec(spec: CPointer<HcfDhCommParamsSpec>, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorBySpecGenerateKeyPair(id: Int64, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorBySpecGeneratePriKey(id: Int64, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorBySpecGeneratePubKey(id: Int64, errCode: CPointer<Int32>): Int64
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public func createAsyKeyGeneratorBySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    if (asyKeySpec.algName == DSA_ASY_KEY_SPEC) {
        match (asyKeySpec.specType) {
            case COMMON_PARAMS_SPEC => createAsyKeyGeneratorByDSACommonParamsSpec(asyKeySpec)
            case PRIVATE_KEY_SPEC => throw BusinessException(ERR_PARAMETER_ERROR,
                "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
            case PUBLIC_KEY_SPEC => createAsyKeyGeneratorByDSAPubKeySpec(asyKeySpec)
            case KEY_PAIR_SPEC => createAsyKeyGeneratorByDSAKeyPairSpec(asyKeySpec)
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    } else if (asyKeySpec.algName == ECC_ASY_KEY_SPEC || asyKeySpec.algName == SM2_ASY_KEY_SPEC) {
        match (asyKeySpec.specType) {
            case COMMON_PARAMS_SPEC => createAsyKeyGeneratorByECCCommonParamsSpec(asyKeySpec)
            case PRIVATE_KEY_SPEC => createAsyKeyGeneratorByECCPriKeySpec(asyKeySpec)
            case PUBLIC_KEY_SPEC => createAsyKeyGeneratorByECCPubKeySpec(asyKeySpec)
            case KEY_PAIR_SPEC => createAsyKeyGeneratorByECCKeyPairSpec(asyKeySpec)
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    } else if (asyKeySpec.algName == RSA_ASY_KEY_SPEC) {
        match (asyKeySpec.specType) {
            case COMMON_PARAMS_SPEC => throw BusinessException(ERR_PARAMETER_ERROR,
                "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
            case PRIVATE_KEY_SPEC => throw BusinessException(ERR_PARAMETER_ERROR,
                "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
            case PUBLIC_KEY_SPEC => createAsyKeyGeneratorByRSAPubKeySpec(asyKeySpec)
            case KEY_PAIR_SPEC => createAsyKeyGeneratorByRSAKeyPairSpec(asyKeySpec)
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    } else if (asyKeySpec.algName == ED25519_ASY_KEY_SPEC || asyKeySpec.algName == X25519_ASY_KEY_SPEC) {
        match (asyKeySpec.specType) {
            case COMMON_PARAMS_SPEC => throw BusinessException(ERR_PARAMETER_ERROR,
                "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
            case PRIVATE_KEY_SPEC => createAsyKeyGeneratorByAlg25519PriKeySpec(asyKeySpec)
            case PUBLIC_KEY_SPEC => createAsyKeyGeneratorByAlg25519PubKeySpec(asyKeySpec)
            case KEY_PAIR_SPEC => createAsyKeyGeneratorByAlg25519KeyPairSpec(asyKeySpec)
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    } else if (asyKeySpec.algName == DH_ASY_KEY_SPEC) {
        match (asyKeySpec.specType) {
            case COMMON_PARAMS_SPEC => createAsyKeyGeneratorByDHCommonParamsSpec(asyKeySpec)
            case PRIVATE_KEY_SPEC => createAsyKeyGeneratorByDHPriKeySpec(asyKeySpec)
            case PUBLIC_KEY_SPEC => createAsyKeyGeneratorByDHPubKeySpec(asyKeySpec)
            case KEY_PAIR_SPEC => createAsyKeyGeneratorByDHKeyPairSpec(asyKeySpec)
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    } else {
        throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class AsyKeyGeneratorBySpec <: RemoteDataLite {
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
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
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
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func generateKeyPair(): KeyPair {
        unsafe {
            var errCode: Int32 = 0
            let id = FFiOHOSAsyKeyGeneratorBySpecGenerateKeyPair(getID(), inout errCode)
            checkRet(errCode, "[AsyKeyGeneratorBySpec] generateKeyPair: ")
            return KeyPair(id, _algName)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func generatePriKey(): PriKey {
        unsafe {
            var errCode: Int32 = 0
            let id = FFiOHOSAsyKeyGeneratorBySpecGeneratePriKey(getID(), inout errCode)
            checkRet(errCode, "[AsyKeyGeneratorBySpec] generatePriKey: ")
            return PriKey(id, _algName)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func generatePubKey(): PubKey {
        unsafe {
            var errCode: Int32 = 0
            let id = FFiOHOSAsyKeyGeneratorBySpecGeneratePubKey(getID(), inout errCode)
            checkRet(errCode, "[AsyKeyGeneratorBySpec] generatePubKey: ")
            return PubKey(id, _algName)
        }
    }
}

func createAsyKeyGeneratorByDSACommonParamsSpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: DSACommonParamsSpec =>
            var spec = HcfDsaCommParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByDsaCommonSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByDSACommonParamsSpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByDSAPubKeySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: DSAPubKeySpec =>
            var spec = HcfDsaPubKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByDsaPubKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByDSAPubKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByDSAKeyPairSpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: DSAKeyPairSpec =>
            var spec = HcfDsaKeyPairParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByDsaKeyPairSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByDSAKeyPairSpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByECCCommonParamsSpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: ECCCommonParamsSpec =>
            var spec = HcfEccCommParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByEccCommonSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByECCCommonParamsSpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByECCPriKeySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: ECCPriKeySpec =>
            var spec = HcfEccPriKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByEccPriKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByECCPriKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByECCPubKeySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: ECCPubKeySpec =>
            var spec = HcfEccPubKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByEccPubKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByECCPubKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByECCKeyPairSpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: ECCKeyPairSpec =>
            var spec = HcfEccKeyPairParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByEccKeyPairSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByECCKeyPairSpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByRSAPubKeySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: RSAPubKeySpec =>
            var spec = HcfRsaPubKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByRsaPubKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByRSAPubKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByRSAKeyPairSpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: RSAKeyPairSpec =>
            var spec = HcfRsaKeyPairParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByRsaKeyPairSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByRSAKeyPairSpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByAlg25519PriKeySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: ED25519PriKeySpec =>
            var spec = HcfAlg25519PriKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByAlg25519PriKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByAlg25519PriKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case v: X25519PriKeySpec =>
            var spec = HcfAlg25519PriKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByAlg25519PriKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByAlg25519PriKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByAlg25519PubKeySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: ED25519PubKeySpec =>
            var spec = HcfAlg25519PubKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByAlg25519PubKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByAlg25519PubKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case v: X25519PubKeySpec =>
            var spec = HcfAlg25519PubKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByAlg25519PubKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByAlg25519PubKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByAlg25519KeyPairSpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: ED25519KeyPairSpec =>
            var spec = HcfAlg25519KeyPairParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByAlg25519KeyPairSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByAlg25519KeyPairSpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case v: X25519KeyPairSpec =>
            var spec = HcfAlg25519KeyPairParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByAlg25519KeyPairSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByAlg25519KeyPairSpec ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByDHCommonParamsSpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: DHCommonParamsSpec =>
            var spec = HcfDhCommParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByDhCommonSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByDHCommonParamsSpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByDHPriKeySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: DHPriKeySpec =>
            var spec = HcfDhPriKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByDhPriKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByDHPriKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByDHPubKeySpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: DHPubKeySpec =>
            var spec = HcfDhPubKeyParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByDhPubKeySpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByDHPubKeySpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}

func createAsyKeyGeneratorByDHKeyPairSpec(asyKeySpec: AsyKeySpec): AsyKeyGeneratorBySpec {
    match (asyKeySpec) {
        case v: DHKeyPairSpec =>
            var spec = HcfDhKeyPairParamsSpec(v)
            var errCode = 0i32
            let id: Int64 = unsafe { FFiOHOSAsyKeyGeneratorByDhKeyPairSpec(inout spec, inout errCode) }
            spec.free()
            checkRet(errCode, "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorByDHKeyPairSpec: ")
            return AsyKeyGeneratorBySpec(id, asyKeySpec.algName)
        case _ => throw BusinessException(ERR_PARAMETER_ERROR,
            "[AsyKeyGeneratorBySpec] createAsyKeyGeneratorBySpec failed to get valid asyKeySpec!")
    }
}
