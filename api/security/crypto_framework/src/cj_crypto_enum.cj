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

import ohos.base.*
import ohos.labels.*

import std.deriving.Derive

/**
 * Enum for result code.
 *
 * @relation enum Result
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework"
]
public enum Result <: ToString {
    /**
     * Indicates that input parameters is invalid.
     *
     * @relation INVALID_PARAMS = 401
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    InvalidParams
    |
    /**
     * Indicates that function or algorithm is not supported.
     *
     * @relation NOT_SUPPORT = 801
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    NotSupport
    |
    /**
     * Indicates the memory operation failed.
     *
     * @relation ERR_OUT_OF_MEMORY = 17620001
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    ErrOutOfMemory
    |
    /**
     * Indicates that failed to convert parameters between cj and c.
     *
     * @relation ERR_RUNTIME_ERROR = 17620002
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    ErrRuntimeError
    |
    /**
     * Indicates that crypto operation error.
     *
     * @relation ERR_CRYPTO_OPERATION = 17630001
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    ErrCryptoOperation
    | ...

    /**
     * Get the corresponding mapping value.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    public func getValue(): Int32 {
        return match (this) {
            case InvalidParams => 401
            case NotSupport => 801
            case ErrOutOfMemory => 17620001
            case ErrRuntimeError => 17620002
            case ErrCryptoOperation => 17630001
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    /**
     * Return the string of the enumeration value.
     *
     * @throws IllegalArgumentException - The type is not supported.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework"
    ]
    public func toString(): String {
        return match (this) {
            case InvalidParams => "Parameter error."
            case NotSupport => "Capability not supported."
            case ErrOutOfMemory => "Memory error."
            case ErrRuntimeError => "Runtime error."
            case ErrCryptoOperation => "Crypto operation error."
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

func getError(errCode: Int32): Result {
    match {
        case errCode == -10001 => return InvalidParams
        case errCode == -10002 => return NotSupport
        case errCode == -20001 => return ErrOutOfMemory
        case errCode == -20002 => return ErrRuntimeError
        case errCode == -30001 => return ErrCryptoOperation
        case _ => throw Exception("Unrecognized error code: ${errCode}!")
    }
}

func checkRet(errCode: Int32, message: String) {
    if (errCode != 0) {
        let msg = message + getError(errCode).toString()
        throw BusinessException(getError(errCode).getValue(), msg)
    }
}

/**
 * Enum for obtain the crypto operation.
 *
 * @relation enum CryptoMode
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public enum CryptoMode {
    /**
     * The value of encryption operation for AES, 3DES and RSA.
     *
     * @relation ENCRYPT_MODE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    EncryptMode
    |
    /**
     * The value of decryption operation for AES, 3DES and RSA.
     *
     * @relation DECRYPT_MODE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    DecrtpyMode
    | ...

    func getValue(): Int32 {
        return match (this) {
            case EncryptMode => 0
            case DecrtpyMode => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for encryption specified parameters.
 *
 * @relation enum CipherSpecItem
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public enum CipherSpecItem {
    /**
     * Indicates the algorithm name of the message digest function. It is used during RSA encryption.
     *
     * @relation OAEP_MD_NAME_STR = 100
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    OaepMdNameStr
    |
    /**
     * Indicates the algorithm name for the mask generation function. It is used during RSA encryption.
     *
     * @relation OAEP_MGF_NAME_STR = 101
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    OaepMgfNameStr
    |
    /**
     * Indicates the message digest parameter for the MGF1 mask generation function. It is used during RSA encryption.
     *
     * @relation OAEP_MGF1_MD_STR = 102
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    OaepMgf1MdStr
    |
    /**
     * Indicates the source of the encoding input P. It is used during RSA encryption.
     *
     * @relation OAEP_MGF1_PSRC_UINT8ARR = 103
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    OaepMgf1PsrcUint8Arr
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case OaepMdNameStr => 100
                case OaepMgfNameStr => 101
                case OaepMgf1MdStr => 102
                case OaepMgf1PsrcUint8Arr => 103
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}
