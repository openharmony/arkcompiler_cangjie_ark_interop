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

import ohos.base.BusinessException

@C
struct CjRevocationCheckParam {
    var ocspRequestExtension: CPointer<CfBlobArray> = CPointer()
    var ocspResponderURI: CPointer<CfBlob> = CPointer()
    var ocspResponderCert: CPointer<HcfX509Certificate> = CPointer()
    var ocspResponses: CPointer<CfBlob> = CPointer()
    var crlDownloadURI: CPointer<CfBlob> = CPointer()
    var options: CPointer<Int32> = CPointer()
    var optionCnt: UInt32 = 0
    var ocspDigest: CPointer<CfBlob> = CPointer()

    func free() {
        /* dont free this.ocspResponderCert, it's an inner member of X509Cert */
        unsafe {
            if (this.ocspRequestExtension.isNotNull()) {
                this.ocspRequestExtension.read().free()
                LibC.free(this.ocspRequestExtension)
            }
            if (this.ocspResponderURI.isNotNull()) {
                this.ocspResponderURI.read().free()
                LibC.free(this.ocspResponderURI)
            }
            if (this.ocspResponses.isNotNull()) {
                this.ocspResponses.read().free()
                LibC.free(this.ocspResponses)
            }
            if (this.crlDownloadURI.isNotNull()) {
                this.crlDownloadURI.read().free()
                LibC.free(this.crlDownloadURI)
            }
            LibC.free(this.options)
            if (this.ocspDigest.isNotNull()) {
                this.ocspDigest.read().free()
                LibC.free(this.ocspDigest)
            }
        }
    }
}

@C
struct CjX509CertChainValidateResult {
    CjX509CertChainValidateResult(
        let trustAnchor: CjX509TrustAnchor,
        let entityCert: CPointer<HcfX509Certificate>
    ) {}
    init() {
        this.trustAnchor = CjX509TrustAnchor()
        this.entityCert = CPointer()
    }
}

@C
struct CjX509CertChainValidateParams {
    let trustAnchors: CPointer<CjX509TrustAnchor>
    let trustAnchorCnt: UInt32
    var date: CPointer<CfBlob> = CPointer()
    var certCRLCollections: CPointer<CPointer<HcfCertCrlCollection>> = CPointer()
    var certCRLCollectionCnt: UInt32 = 0
    var revocationCheckParam = CPointer<CjRevocationCheckParam>()
    var policy: Int32 = 0
    var sslHostname: CPointer<CfBlob> = CPointer()
    var keyUsage: CPointer<Int32> = CPointer()
    var keyUsageCnt: UInt32 = 0

    init(inputTrustAnchors: Array<X509TrustAnchor>) {
        if (inputTrustAnchors.isEmpty()) {
            throw BusinessException(CertResult.INVALID_PARAMS, "trust anchors should not be empty")
        }
        trustAnchors = LibC.malloc<CjX509TrustAnchor>(count: inputTrustAnchors.size)
        if (trustAnchors.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        trustAnchorCnt = UInt32(inputTrustAnchors.size)
        for (i in 0..inputTrustAnchors.size) {
            try {
                unsafe { trustAnchors.write(i, inputTrustAnchors[i].toNative()) }
            } catch (e: Exception) {
                unsafe {
                    for (j in 0..i) {
                        trustAnchors.read(j).free()
                    }
                    LibC.free(trustAnchors)
                }
                throw e
            }
        }
    }

    func free() {
        unsafe {
            if (this.trustAnchors.isNotNull()) {
                for (i in 0..Int64(this.trustAnchorCnt)) {
                    this.trustAnchors.read(i).free()
                }
                LibC.free(this.trustAnchors)
            }
            if (this.date.isNotNull()) {
                this.date.read().free()
                LibC.free(this.date)
            }
            /* dont free this.certCRLCollections inner, it's an inner member of CertCRLCollection */
            LibC.free(this.certCRLCollections)
            if (this.revocationCheckParam.isNotNull()) {
                this.revocationCheckParam.read().free()
                LibC.free(this.date)
            }
            if (this.sslHostname.isNotNull()) {
                this.sslHostname.read().free()
                LibC.free(this.sslHostname)
            }
            LibC.free(this.keyUsage)
        }
    }
}

@C
struct CjX509TrustAnchor {
    CjX509TrustAnchor(
        let CAPubKey: CPointer<CfBlob>,
        let CACert: CPointer<HcfX509Certificate>,
        let CASubject: CPointer<CfBlob>,
        let nameConstraints: CPointer<CfBlob>
    ) {
    }

    init() {
        this.CAPubKey = CPointer()
        this.CACert = CPointer()
        this.CASubject = CPointer()
        this.nameConstraints = CPointer()
    }

    func free() {
        unsafe {
            /* dont free this.CACert, it's an inner member of X509Cert */
            if (this.CAPubKey.isNotNull()) {
                this.CAPubKey.read().free()
                LibC.free(this.CAPubKey)
            }

            if (this.CASubject.isNotNull()) {
                this.CASubject.read().free()
                LibC.free(this.CASubject)
            }

            if (this.nameConstraints.isNotNull()) {
                this.nameConstraints.read().free()
                LibC.free(this.nameConstraints)
            }
        }
    }
}

@C
struct HcfCertChain {
    let PLACE_HOLDER = 0
}

@C
struct CjX509CertChain {
    let chain: CPointer<HcfCertChain> = CPointer()
}

@C
struct SubjectAlternaiveNameData {
    SubjectAlternaiveNameData(
        let `type`: Int32,
        let name: CfBlob
    ) {
    }
    func free() {
        this.name.free()
    }
}

@C
struct CjX509CertMatchParams {
    var x509Cert: CPointer<HcfX509Certificate> = CPointer()
    var validDate: CPointer<CfBlob> = CPointer()
    var issuer: CPointer<CfBlob> = CPointer()
    var keyUsage: CPointer<CfBlob> = CPointer()
    var serialNumber: CPointer<CfBlob> = CPointer()
    var subject: CPointer<CfBlob> = CPointer()
    var publicKey: CPointer<CfBlob> = CPointer()
    var publicKeyAlgID: CPointer<CfBlob> = CPointer()
    var subjectAlternativeNames: CPointer<SubjectAlternaiveNameData> = CPointer()
    var subjectAlternativeNameCnt: UInt32 = 0
    var matchAllSubjectAltNames: Bool = false
    var authorityKeyIdentifier: CPointer<CfBlob> = CPointer()
    var minPathLenConstraint: Int32 = -1 // default -1
    var extendedKeyUsage: CPointer<CfArray> = CPointer()
    var nameConstraints: CPointer<CfBlob> = CPointer()
    var certPolicy: CPointer<CfArray> = CPointer()
    var privateKeyValid: CPointer<CfBlob> = CPointer()
    var subjectKeyIdentifier: CPointer<CfBlob> = CPointer()
    init() {}
    func free() {
        /* dont free this.x509Cert, it's an inner member of X509Cert */
        unsafe {
            if (this.validDate.isNotNull()) {
                this.validDate.read().free()
                LibC.free(this.validDate)
            }
            if (this.issuer.isNotNull()) {
                this.issuer.read().free()
                LibC.free(this.issuer)
            }
            if (this.keyUsage.isNotNull()) {
                this.keyUsage.read().free()
                LibC.free(this.keyUsage)
            }
            if (this.serialNumber.isNotNull()) {
                this.serialNumber.read().free()
                LibC.free(this.serialNumber)
            }
            if (this.subject.isNotNull()) {
                this.subject.read().free()
                LibC.free(this.subject)
            }
            if (this.publicKey.isNotNull()) {
                this.publicKey.read().free()
                LibC.free(this.publicKey)
            }
            if (this.publicKeyAlgID.isNotNull()) {
                this.publicKeyAlgID.read().free()
                LibC.free(this.publicKeyAlgID)
            }
            if (this.subjectAlternativeNames.isNotNull()) {
                for (i in 0..Int64(this.subjectAlternativeNameCnt)) {
                    this.subjectAlternativeNames.read(i).free()
                }
                LibC.free(this.subjectAlternativeNames)
            }
            if (this.authorityKeyIdentifier.isNotNull()) {
                this.authorityKeyIdentifier.read().free()
                LibC.free(this.authorityKeyIdentifier)
            }
            if (this.extendedKeyUsage.isNotNull()) {
                this.extendedKeyUsage.read().free()
                LibC.free(this.extendedKeyUsage)
            }
            if (this.nameConstraints.isNotNull()) {
                this.nameConstraints.read().free()
                LibC.free(this.nameConstraints)
            }
            if (this.certPolicy.isNotNull()) {
                this.certPolicy.read().free()
                LibC.free(this.certPolicy)
            }
            if (this.privateKeyValid.isNotNull()) {
                this.privateKeyValid.read().free()
                LibC.free(this.privateKeyValid)
            }
            if (this.subjectKeyIdentifier.isNotNull()) {
                this.subjectKeyIdentifier.read().free()
                LibC.free(this.subjectKeyIdentifier)
            }
        }
    }
}

@C
struct CjX509CrlMatchParams {
    var issuer: CPointer<CfBlobArray> = CPointer()
    var x509Cert: CPointer<HcfX509Certificate> = CPointer()
    var updateDateTime: CPointer<CfBlob> = CPointer()
    var maxCRL: CPointer<CfBlob> = CPointer()
    var minCRL: CPointer<CfBlob> = CPointer()
    init() {}
    func free() {
        /* dont free this.x509Cert, it's an inner member of X509Cert */
        unsafe {
            if (this.issuer.isNotNull()) {
                this.issuer.read().free()
                LibC.free(this.issuer)
            }
            if (this.updateDateTime.isNotNull()) {
                this.updateDateTime.read().free()
                LibC.free(this.updateDateTime)
            }
            if (this.maxCRL.isNotNull()) {
                this.maxCRL.read().free()
                LibC.free(this.maxCRL)
            }
            if (this.minCRL.isNotNull()) {
                this.minCRL.read().free()
                LibC.free(this.minCRL)
            }
        }
    }
}

@C
struct CjX509TrustAnchorArray {
    let data: CPointer<CPointer<CjX509TrustAnchor>> = CPointer()
    let count: Int32 = 0
}

foreign {
    func FfiCertCjX509CertChainNewInstanceBlob(blob: CPointer<CfEncodingBlob>, returnObj: CPointer<CjX509CertChain>): Int32

    func FfiCertCjX509CertChainNewInstanceArray(
        inCerts: CPointer<HcfX509CertificateArray>,
        returnObj: CPointer<CjX509CertChain>
    ): Int32

    func FfiCertCjX509CertChainDeleteInstance(self: CjX509CertChain): Unit

    func FfiCertBuildX509CertChain(
        matchParams: CPointer<CjX509CertMatchParams>,
        validParams: CPointer<CjX509CertChainValidateParams>,
        maxLength: Int32,
        returnObj: CPointer<CjX509CertChain>
    ): Int32

    func FfiCertCreateTrustAnchorWithKeyStore(keyStore: CPointer<CfBlob>, pwd: CPointer<CfBlob>,
        returnObj: CPointer<CjX509TrustAnchorArray>): Int32

    func FfiCertCjX509CertChainGetCertList(self: CjX509CertChain, out: CPointer<HcfX509CertificateArray>): Int32

    func FfiCertCjX509CertChainValidate(self: CjX509CertChain, params: CPointer<CjX509CertChainValidateParams>,
        result: CPointer<CjX509CertChainValidateResult>): Int32

    func FfiCertCjX509CertChainToString(self: CjX509CertChain, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertChainHashCode(self: CjX509CertChain, out: CPointer<CfBlob>): Int32
}
