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

/**
 * Provides the Key type, which is the common parent class of keys.
 * Before performing cryptographic operations, you need to construct a child class object of Key and pass it to init of the Cipher instance.
 *
 * @relation interface Key
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key"
]
public interface Key {
    /**
     * Indicates the format of the key object.
     *
     * @relation readonly format: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    prop format: String

    /**
     * Indicates the algorithm name of the key object. This parameter contains the key length if the key is a symmetric key.
     *
     * @relation readonly algName: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    prop algName: String

    /**
     * Encode the key object to binary data.
     * The key can be a symmetric key, public key, or private key.
     * The public key must be in DER encoding format and comply with the ASN.1 syntax and X.509 specifications.
     * The private key must be in DER encoding format and comply with the ASN.1 syntax and PKCS#8 specifications.
     *
     * @throws { BusinessException } 801 - this operation is not supported.
     * @throws { BusinessException } 17620001 - memory operation failed.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation getEncoded(): DataBlob
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    func getEncoded(): DataBlob
}

/**
 * Encapsulates the parameters used for encryption or decryption.You need to construct its child class object and
 * pass it to init for symmetric encryption or decryption.
 *
 * @relation interface ParamsSpec
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public interface ParamsSpec {
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
    mut prop algName: String
}
