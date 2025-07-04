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
 * X509 Certification chain object.
 *
 * @typedef X509CertChain
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
public class X509CertChain <: ToString {
    X509CertChain(let hcfChain: CjX509CertChain) {}

    ~init() {
        unsafe { FfiCertCjX509CertChainDeleteInstance(this.hcfChain) }
    }

    /**
     * Get the X509 certificate list.
     *
     * @returns { Array<X509Cert> } the X509 certificate list.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19030001 - crypto operation error.
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
    public func getCertList(): Array<X509Cert> {
        var retCertArray = HcfX509CertificateArray()
        // retCertArray contains list of new instance of HcfX509Certificate
        let retCode = unsafe { FfiCertCjX509CertChainGetCertList(this.hcfChain, inout retCertArray) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("selectCerts fail")
        }
        try {
            let hcfCertArray = retCertArray.data
            let cjCertArray = Array<X509Cert>(
                Int64(retCertArray.count),
                {
                    i =>
                    let hcfX509Cert: CPointer<HcfX509Certificate> = unsafe { hcfCertArray.read(i) }
                    var cjX509Cert = CjX509Certificate()
                    // cjX509Cert is new instance from bytes in hcfX509Cert
                    let convertCode = unsafe { FfiCertCjX509CertificateFromHcfCert(hcfX509Cert, inout cjX509Cert) }
                    if (convertCode != CfResult.CF_SUCCESS) {
                        throw convertCode.toEpt("create HcfCertCrlCollection instance fail")
                    }
                    X509Cert(cjX509Cert)
                }
            )
            return cjCertArray
        } finally {
            unsafe {
                for (i in 0..Int64(retCertArray.count)) {
                    FfiCertDestroy(CPointer<Unit>(retCertArray.data.read(i)))
                }
                LibC.free(retCertArray.data)
            }
        }
    }

    /**
     * Validate the cert chain with validate parameters.
     *
     * @param { CertChainValidationParameters } param - indicate the cert chain Validate parameters.
     * @returns { CertChainValidationResult } valid result
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
    public func validate(param: CertChainValidationParameters): CertChainValidationResult {
        var returnObj = CjX509CertChainValidateResult()
        var arg1 = param.toNative()
        let retCode = unsafe { FfiCertCjX509CertChainValidate(this.hcfChain, inout arg1, inout returnObj) }
        arg1.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("validate failed")
        }
        var cert = CjX509Certificate()
        let convertCode = unsafe { FfiCertCjX509CertificateFromHcfCert(returnObj.entityCert, inout cert) }
        if (convertCode != CfResult.CF_SUCCESS) {
            unsafe { FfiCertDestroy(CPointer<Unit>(returnObj.entityCert)) }
            throw convertCode.toEpt("create HcfCertCrlCollection instance fail")
        }
        CertChainValidationResult(
            X509TrustAnchor(returnObj.trustAnchor, needFree: true),
            X509Cert(cert)
        )
    }

    /**
     * Get the string type data of the object.
     *
     * @returns { String } the string type data of the object.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19020002 - runtime error.
     * @throws { BusinessException } 19030001 - crypto operation error.
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
    public func toString(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertChainToString(this.hcfChain, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("toString failed")
        }
        return retObj.toStringUtf8(needFree: true)
    }

    /**
     * Get the hash value of DER format data.
     *
     * @returns { Array<Byte> } the hash value of DER format data.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19020002 - runtime error.
     * @throws { BusinessException } 19030001 - crypto operation error.
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
    public func hashCode(): Bytes {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertChainHashCode(this.hcfChain, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("hashCode failed")
        }
        return retObj.toBytes(needFree: true)
    }
}
