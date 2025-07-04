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

package ohos.cert

import ohos.labels.*
import std.math.numeric.BigInt
import ohos.crypto.PubKey

type Bytes = Array<Byte>

/**
 * Provides the cert encoding blob type.
 *
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public class EncodingBlob {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public EncodingBlob(
        /**
         * The data input.
         *
         * @type { Array<Byte> }
         * @syscap SystemCapability.Security.Cert
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public var data: Bytes,
        /**
         * The data encoding format.
         *
         * @type { EncodingFormat }
         * @syscap SystemCapability.Security.Cert
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public var encodingFormat: UInt32
    ) {}
}

/**
 * Provides the data blob type.
 *
 * @typedef DataBlob
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public class DataBlob {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public DataBlob(
        /**
         * Indicates the content of data blob.
         *
         * @type { Array<Byte> }
         * @syscap SystemCapability.Security.Cert
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public var data: Bytes
    ) {}
}

/**
 * Provides the certificate chain build parameters type.
 *
 * @typedef CertChainBuildParameters
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public class CertChainBuildParameters {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public CertChainBuildParameters(
        /**
         * The certificate match parameters to selects certificate from the certificate collection.
         *
         * @type { X509CertMatchParameters }
         * @syscap SystemCapability.Security.Cert
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public var certMatchParameters: X509CertMatchParameters,
        /**
         * The CertChain validation parameters.
         *
         * @type { CertChainValidationParameters }
         * @syscap SystemCapability.Security.Cert
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public var validationParameters: CertChainValidationParameters,
        /**
         * The maximum length of the certificate chain to be built.
         *
         * @type { ?Int32 }
         * @syscap SystemCapability.Security.Cert
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public var maxLength!: ?Int32 = Option.None
    ) {}
}

/**
 * Certification chain build result.
 *
 * @typedef CertChainBuildResult
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public class CertChainBuildResult {
    CertChainBuildResult(
        /**
         * The certificate chain of build result.
         *
         * @type { X509CertChain }
         * @readonly
         * @syscap SystemCapability.Security.Cert
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public let certChain: X509CertChain,
        /**
         * The certificate chain validation result.
         *
         * @type { CertChainValidationResult }
         * @readonly
         * @syscap SystemCapability.Security.Cert
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public let validationResult: CertChainValidationResult
    ) {}
}
