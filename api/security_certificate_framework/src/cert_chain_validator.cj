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
import ohos.base.BusinessException

/**
 * Certification chain validator.
 *
 * @typedef CertChainValidator
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
public class CertChainValidator {
    CertChainValidator(
        let validator: CjCertChainValidator,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Cert"
        ]
        public let algorithm: String
    ) {}
    ~init() {
        unsafe { FfiCertCjCertChainValidatorDeleteInstance(this.validator) }
    }
    /**
     * Validate the cert chain.
     *
     * @param { CertChainData } certChain - indicate the cert chain validator data.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19020002 - runtime error.
     * @throws { BusinessException } 19030001 - crypto operation error.
     * @throws { BusinessException } 19030002 - the certificate signature verification failed.
     * @throws { BusinessException } 19030003 - the certificate has not taken effect.
     * @throws { BusinessException } 19030004 - the certificate has expired.
     * @throws { BusinessException } 19030005 - failed to obtain the certificate issuer.
     * @throws { BusinessException } 19030006 - the key cannot be used for signing a certificate.
     * @throws { BusinessException } 19030007 - the key cannot be used for digital signature.
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
    public func validate(certChain: CertChainData): Unit {
        let cph = unsafe { acquireArrayRawData(certChain.data) }
        var data = HcfCertChainData(cph.pointer, UInt32(certChain.data.size), UInt8(certChain.count),
            certChain.encodingFormat)
        let retCode = unsafe { FfiCertCjCertChainValidatorValidate(this.validator, inout data) }
        unsafe { releaseArrayRawData(cph) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("validate cert chain failed")
        }
    }
}

/**
 * Provides the cert chain data type.
 *
 * @typedef CertChainData
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
public class CertChainData {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public CertChainData(
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
         * The number of certs.
         *
         * @type { UInt32 }
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
        public var count: UInt32,
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
    ) {
    }
}
