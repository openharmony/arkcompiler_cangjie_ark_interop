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
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case OAEP_MD_NAME_STR => 100
                case OAEP_MGF_NAME_STR => 101
                case OAEP_MGF1_MD_STR => 102
                case OAEP_MGF1_PSRC_UINT8ARR => 103
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}
