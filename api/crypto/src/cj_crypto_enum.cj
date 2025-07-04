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

import ohos.base.*
import std.deriving.*
import ohos.ffi.*
import std.math.numeric.*
import ohos.labels.*

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework"
]
public enum Result <: ToString {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    INVALID_PARAMS
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    NOT_SUPPORT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    ERR_OUT_OF_MEMORY
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    ERR_RUNTIME_ERROR
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    ERR_CRYPTO_OPERATION
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    public func getValue(): Int32 {
        return match (this) {
            case INVALID_PARAMS => 401
            case NOT_SUPPORT => 801
            case ERR_OUT_OF_MEMORY => 17620001
            case ERR_RUNTIME_ERROR => 17620002
            case ERR_CRYPTO_OPERATION => 17630001
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    public func toString(): String {
        return match (this) {
            case INVALID_PARAMS => "Parameter error."
            case NOT_SUPPORT => "Capability not supported."
            case ERR_OUT_OF_MEMORY => "Memory error."
            case ERR_RUNTIME_ERROR => "Runtime error."
            case ERR_CRYPTO_OPERATION => "Crypto operation error."
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

func getError(errCode: Int32): Result {
    match {
        case errCode == -10001 => return INVALID_PARAMS
        case errCode == -10002 => return NOT_SUPPORT
        case errCode == -20001 => return ERR_OUT_OF_MEMORY
        case errCode == -20002 => return ERR_RUNTIME_ERROR
        case errCode == -30001 => return ERR_CRYPTO_OPERATION
        case _ => throw Exception("Unrecognized error code: ${errCode}!")
    }
}

func checkRet(errCode: Int32, message: String) {
    if (errCode != 0) {
        let msg = message + getError(errCode).toString()
        throw BusinessException(getError(errCode).getValue(), msg)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework"
]
public enum ResultSpec <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    BIGINT(BigInt)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    NUMBER(Int32)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    STRING(String)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    UINT8ARR(Array<UInt8>)
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    public func toString(): String {
        match (this) {
            case BIGINT(v) => v.toString()
            case NUMBER(v) => v.toString()
            case STRING(v) => v
            case UINT8ARR(v) => v.toString()
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public enum CryptoMode {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    ENCRYPT_MODE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    DECRYPT_MODE
    | ...

    func getValue(): Int32 {
        return match (this) {
            case ENCRYPT_MODE => 0
            case DECRYPT_MODE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public enum AsyKeySpecItem {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DSA_P_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DSA_Q_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DSA_G_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DSA_SK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DSA_PK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_FP_P_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_A_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_B_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_G_X_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_G_Y_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_N_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_H_NUM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_SK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_PK_X_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_PK_Y_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_FIELD_TYPE_STR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_FIELD_SIZE_NUM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ECC_CURVE_NAME_STR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    RSA_N_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    RSA_SK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    RSA_PK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DH_P_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DH_G_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DH_L_NUM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DH_SK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    DH_PK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ED25519_SK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    ED25519_PK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    X25519_SK_BN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    X25519_PK_BN
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case DSA_P_BN => 101
                case DSA_Q_BN => 102
                case DSA_G_BN => 103
                case DSA_SK_BN => 104
                case DSA_PK_BN => 105
                case ECC_FP_P_BN => 201
                case ECC_A_BN => 202
                case ECC_B_BN => 203
                case ECC_G_X_BN => 204
                case ECC_G_Y_BN => 205
                case ECC_N_BN => 206
                case ECC_H_NUM => 207
                case ECC_SK_BN => 208
                case ECC_PK_X_BN => 209
                case ECC_PK_Y_BN => 210
                case ECC_FIELD_TYPE_STR => 211
                case ECC_FIELD_SIZE_NUM => 212
                case ECC_CURVE_NAME_STR => 213
                case RSA_N_BN => 301
                case RSA_SK_BN => 302
                case RSA_PK_BN => 303
                case DH_P_BN => 401
                case DH_G_BN => 402
                case DH_L_NUM => 403
                case DH_SK_BN => 404
                case DH_PK_BN => 405
                case ED25519_SK_BN => 501
                case ED25519_PK_BN => 502
                case X25519_SK_BN => 601
                case X25519_PK_BN => 602
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public enum AsyKeySpecType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    COMMON_PARAMS_SPEC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    PRIVATE_KEY_SPEC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    PUBLIC_KEY_SPEC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    KEY_PAIR_SPEC
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case COMMON_PARAMS_SPEC => 0
                case PRIVATE_KEY_SPEC => 1
                case PUBLIC_KEY_SPEC => 2
                case KEY_PAIR_SPEC => 3
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: Int32): AsyKeySpecType {
        return match (v) {
            case 0 => COMMON_PARAMS_SPEC
            case 1 => PRIVATE_KEY_SPEC
            case 2 => PUBLIC_KEY_SPEC
            case 3 => KEY_PAIR_SPEC
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public enum CipherSpecItem {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    OAEP_MD_NAME_STR
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    OAEP_MGF_NAME_STR
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    OAEP_MGF1_MD_STR
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    OAEP_MGF1_PSRC_UINT8ARR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    SM2_MD_NAME_STR
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case OAEP_MD_NAME_STR => 100
                case OAEP_MGF_NAME_STR => 101
                case OAEP_MGF1_MD_STR => 102
                case OAEP_MGF1_PSRC_UINT8ARR => 103
                case SM2_MD_NAME_STR => 104
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Signature"
]
public enum SignSpecItem {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    PSS_MD_NAME_STR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    PSS_MGF_NAME_STR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    PSS_MGF1_MD_STR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    PSS_SALT_LEN_NUM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    PSS_TRAILER_FIELD_NUM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    SM2_USER_ID_UINT8ARR
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case PSS_MD_NAME_STR => 100
                case PSS_MGF_NAME_STR => 101
                case PSS_MGF1_MD_STR => 102
                case PSS_SALT_LEN_NUM => 103
                case PSS_TRAILER_FIELD_NUM => 104
                case SM2_USER_ID_UINT8ARR => 105
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}
