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

/**
 * Provides the Key type, which is the common parent class of keys.
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
     * @relation readonly format: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    prop format: String

    /**
     * Indicates the algorithm name of the key object.
     *
     * @relation readonly algName: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    prop algName: String

    /**
     * Encode the key object to binary data.
     *
     * @throws { BusinessException } 801 - this operation is not supported.
     * @throws { BusinessException } 17620001 - memory error.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation getEncoded(): DataBlob;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    func getEncoded(): DataBlob
}

/**
 * Provides the ParamsSpec type, including the algorithm name.
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
     * @relation algName: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    mut prop algName: String
}
