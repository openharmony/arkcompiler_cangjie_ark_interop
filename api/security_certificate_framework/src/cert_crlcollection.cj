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
 * The certificate and CRL collection object.
 *
 * @typedef CertCRLCollection
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
public class CertCRLCollection {
    CertCRLCollection(let collection: CjCertCrlCollection) {}
    ~init() {
        unsafe { FfiCertCjCertCrlCollectionDeleteInstance(this.collection) }
    }
    /**
     * return all Array<X509Cert> which match X509CertMatchParameters
     *
     * @param { X509CertMatchParameters } param - indicate the X509CertMatchParameters object.
     * @returns { Array<X509Cert> } the x509 cert array.
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
    public func selectCerts(param: X509CertMatchParameters): Array<X509Cert> {
        var retCertArray = HcfX509CertificateArray()
        var matchParams: CjX509CertMatchParams = param.toNative()
        var retCode = unsafe {
            // retCertArray contains list of new instance of HcfX509Certificate
            FfiCertCjCertCrlCollectionSelectCerts(this.collection, inout matchParams, inout retCertArray)
        }
        matchParams.free()
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
     * return all X509 CRL which match X509CRLMatchParameters
     *
     * @param { X509CRLMatchParameters } param - indicate the X509CRLMatchParameters object.
     * @returns { Array<X509CRL> } the x509 crl array.
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
    public func selectCRLs(param: X509CRLMatchParameters): Array<X509CRL> {
        var retCertArray = HcfX509CrlArray()
        var arg1 = param.toNative()
        // retCertArray contains list of new instance of HcfX509Crl
        var retCode = unsafe { FfiCertCjCertCrlCollectionSelectCRLs(this.collection, inout arg1, inout retCertArray) }
        arg1.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("selectCRLs fail")
        }

        let hcfCrlArray = retCertArray.data
        let cjCrlArray = Array<X509CRL>(
            Int64(retCertArray.count),
            {
                i => X509CRL(CjX509Crl(unsafe { hcfCrlArray.read(i) }))
            }
        )
        unsafe { LibC.free(retCertArray.data) }
        return cjCrlArray
    }
}
